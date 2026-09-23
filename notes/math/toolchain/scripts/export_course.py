#!/usr/bin/env python3
"""Export each included Typst chapter as a standalone LaTeX and Markdown file."""

from __future__ import annotations

import argparse
import json
import re
import shutil
import sys
import unicodedata
from dataclasses import dataclass
from pathlib import Path

from export import ExportError, export as export_authority


INCLUDE_RE = re.compile(r'^\s*#include\s+"([^"]+)"', re.MULTILINE)
MARKDOWN_HEADING_RE = re.compile(r"^#\s+(.+?)(?:\s+\{#[^}]+\})?\s*$", re.MULTILINE)
LATEX_CHAPTER_RE = re.compile(r"^\\chapter(?:\[[^\]]*\])?\{", re.MULTILINE)
KN_SOURCE_RE = re.compile(r"#kn\s*\[")
SEMANTIC_COUNT_RE = re.compile(r"^semantic-node-count:\s*\d+\s*$", re.MULTILINE)
SOURCE_RE = re.compile(r"^source:\s*.*$", re.MULTILINE)
TYPST_CHAPTER_RE = re.compile(
    r"^(?:=\s+(.+?)\s*|#heading\(level:\s*1[^)]*\)\[(.+?)\])$",
    re.MULTILINE,
)


@dataclass(frozen=True)
class Document:
    name: str
    source: Path


@dataclass(frozen=True)
class Page:
    document: str
    authority: str
    stem: str
    label: str


@dataclass(frozen=True)
class Chapter:
    authority: str
    stem: str
    knowledge_count: int


def slug(value: str) -> str:
    value = unicodedata.normalize("NFKC", value)
    value = re.sub(r"[^\w.-]+", "-", value, flags=re.UNICODE)
    value = value.replace("_", "-").strip("-.").lower()
    return value or "chapter"


def parse_document(value: str) -> Document:
    if "=" not in value:
        raise ExportError(f"document must use name=source.typ syntax: {value!r}")
    name, raw_source = value.split("=", 1)
    if not name or not raw_source:
        raise ExportError(f"document must use name=source.typ syntax: {value!r}")
    return Document(slug(name), Path(raw_source))


def included_parts(source: Path) -> list[str]:
    parts = INCLUDE_RE.findall(source.read_text(encoding="utf-8"))
    if not parts:
        raise ExportError(f"no static #include entries found in {source}")
    duplicates = [part for part in parts if parts.count(part) > 1]
    if duplicates:
        raise ExportError(f"duplicate #include in {source}: {duplicates[0]}")
    for part in parts:
        candidate = (source.parent / part).resolve()
        if not candidate.is_file():
            raise ExportError(f"included Typst chapter does not exist: {candidate}")
    return parts


def source_chapters(source: Path) -> list[Chapter]:
    chapters: list[Chapter] = []
    for part in included_parts(source):
        content = (source.parent / part).read_text(encoding="utf-8")
        heading_matches = list(TYPST_CHAPTER_RE.finditer(content))
        if not heading_matches:
            raise ExportError(f"included Typst source has no level-one heading: {part}")
        base = slug(Path(part).stem)
        for index, match in enumerate(heading_matches, start=1):
            heading = next(value for value in match.groups() if value is not None)
            end = (
                heading_matches[index].start()
                if index < len(heading_matches)
                else len(content)
            )
            count = len(KN_SOURCE_RE.findall(content[match.start() : end]))
            stem = (
                base
                if len(heading_matches) == 1
                else f"{base}--{index:02d}-{slug(heading)}"
            )
            chapters.append(Chapter(part, stem, count))
    return chapters


def reset_output(output: Path, *, markdown_only: bool) -> tuple[Path, Path | None]:
    resolved = output.resolve()
    if resolved == resolved.parent or resolved == Path.cwd().resolve():
        raise ExportError(f"refusing unsafe export directory: {resolved}")
    if output.exists():
        shutil.rmtree(output)
    markdown = output / "markdown"
    (markdown / ".assets").mkdir(parents=True)
    latex = None
    if not markdown_only:
        latex = output / "latex"
        (latex / "assets").mkdir(parents=True)
    return markdown, latex


def copy_shared(source: Path, destination: Path) -> None:
    if not source.is_file():
        return
    target = destination / source.name
    if target.is_file() and target.read_bytes() != source.read_bytes():
        raise ExportError(f"conflicting shared export file: {target}")
    shutil.copy2(source, target)


def copy_assets(
    source: Path,
    destination: Path,
    prefix: str,
    reference_prefix: str,
) -> dict[str, str]:
    replacements: dict[str, str] = {}
    if not source.is_dir():
        return replacements
    for asset in sorted(path for path in source.iterdir() if path.is_file()):
        target_name = f"{prefix}--{asset.name}"
        shutil.copy2(asset, destination / target_name)
        replacements[f"{reference_prefix}/{asset.name}"] = target_name
    return replacements


def replace_paths(text: str, replacements: dict[str, str], prefix: str) -> str:
    for source, target in replacements.items():
        text = text.replace(source, f"{prefix}/{target}")
    return text


def authority_path(source: Path, root: Path) -> str:
    resolved = source.resolve()
    try:
        return resolved.relative_to(root.resolve()).as_posix()
    except ValueError:
        return str(resolved)


def replace_markdown_source(text: str, source: str) -> str:
    rendered = json.dumps(source, ensure_ascii=False)
    if not SOURCE_RE.search(text):
        raise ExportError("Markdown export has no source field in YAML front matter")
    return SOURCE_RE.sub(f"source: {rendered}", text, count=1)


def markdown_chapter_positions(text: str) -> list[int]:
    positions: list[int] = []
    offset = 0
    fence: tuple[str, int] | None = None
    for line in text.splitlines(keepends=True):
        stripped = line.lstrip()
        marker = re.match(r"(`{3,}|~{3,})", stripped)
        if marker:
            token = marker.group(1)
            if fence is None:
                fence = (token[0], len(token))
            elif token[0] == fence[0] and len(token) >= fence[1]:
                fence = None
        elif fence is None and line.startswith("# "):
            positions.append(offset)
        offset += len(line)
    return positions


def markdown_chunks(text: str, expected: int, source: Path) -> tuple[str, list[str]]:
    if not text.startswith("---\n"):
        raise ExportError(f"Markdown export has no YAML front matter: {source}")
    frontmatter_end = text.find("\n---\n", 4)
    if frontmatter_end < 0:
        raise ExportError(f"Markdown export has an unterminated YAML block: {source}")
    frontmatter = text[: frontmatter_end + 5]
    body = text[frontmatter_end + 5 :]
    starts = markdown_chapter_positions(body)
    if len(starts) != expected:
        raise ExportError(
            f"{source} includes {expected} parts but exported {len(starts)} Markdown chapters"
        )
    starts.append(len(body))
    return frontmatter, [body[starts[index] : starts[index + 1]] for index in range(expected)]


def latex_chunks(text: str, expected: int, source: Path) -> tuple[str, list[str]]:
    begin = text.find("\\begin{document}")
    end = text.rfind("\\end{document}")
    if begin < 0 or end < begin:
        raise ExportError(f"LaTeX export has no document boundary: {source}")
    begin += len("\\begin{document}")
    preamble = text[:begin]
    body = text[begin:end]
    starts = [match.start() for match in LATEX_CHAPTER_RE.finditer(body)]
    if len(starts) != expected:
        raise ExportError(
            f"{source} includes {expected} parts but exported {len(starts)} LaTeX chapters"
        )
    starts.append(len(body))
    return preamble, [body[starts[index] : starts[index + 1]] for index in range(expected)]


def write_index(markdown: Path, pages: list[Page]) -> None:
    lines = [
        "# Export index",
        "",
        "Generated from the Typst authority. Each linked file is one standalone chapter snapshot.",
        "",
    ]
    current = ""
    for page in pages:
        if page.document != current:
            current = page.document
            lines.extend((f"## {current}", ""))
        lines.append(f"- [{page.label}]({page.stem}.md) — `{page.authority}`")
    lines.append("")
    (markdown / "index.md").write_text("\n".join(lines), encoding="utf-8")


def export_course(
    documents: list[Document],
    root: Path,
    output: Path,
    build: Path,
    *,
    markdown_only: bool = False,
    whole_document: bool = False,
) -> None:
    if whole_document and not markdown_only:
        raise ExportError("--whole-document requires --markdown-only")
    markdown, latex = reset_output(output, markdown_only=markdown_only)
    pages: list[Page] = []
    seen_stems: set[str] = set()

    for document in documents:
        source = document.source.resolve()
        if not source.is_file():
            raise ExportError(f"Typst entry does not exist: {source}")
        snapshot = build / "snapshots" / document.name
        intermediate = build / "intermediate" / document.name
        export_authority(source, root, snapshot, intermediate, verbose=False)

        markdown_text = (snapshot / "markdown" / "main.md").read_text(encoding="utf-8")
        if whole_document:
            page_stem = f"{document.name}--main"
            authority = authority_path(source, root)
            markdown_text = replace_markdown_source(markdown_text, authority)
            markdown_assets = copy_assets(
                snapshot / "markdown" / "main.assets",
                markdown / ".assets",
                document.name,
                "main.assets",
            )
            markdown_text = replace_paths(markdown_text, markdown_assets, ".assets")
            (markdown / f"{page_stem}.md").write_text(
                markdown_text, encoding="utf-8"
            )
            label_match = MARKDOWN_HEADING_RE.search(markdown_text)
            label = label_match.group(1).strip() if label_match else document.name
            pages.append(Page(document.name, authority, page_stem, label))
            copy_shared(snapshot / "markdown" / "reference.bib", markdown)
            continue

        chapters = source_chapters(source)
        markdown_frontmatter, markdown_pages = markdown_chunks(
            markdown_text, len(chapters), source
        )
        latex_preamble = ""
        latex_pages: list[str] = []
        if latex is not None:
            latex_text = (snapshot / "latex" / "main.tex").read_text(encoding="utf-8")
            latex_preamble, latex_pages = latex_chunks(
                latex_text, len(chapters), source
            )
        markdown_assets = copy_assets(
            snapshot / "markdown" / "main.assets",
            markdown / ".assets",
            document.name,
            "main.assets",
        )
        latex_assets: dict[str, str] = {}
        if latex is not None:
            latex_assets = copy_assets(
                snapshot / "latex" / "assets",
                latex / "assets",
                document.name,
                "assets",
            )

        for index, (chapter, markdown_page) in enumerate(
            zip(chapters, markdown_pages, strict=True)
        ):
            page_stem = f"{document.name}--{chapter.stem}"
            if page_stem in seen_stems:
                raise ExportError(f"duplicate chapter export name: {page_stem}")
            seen_stems.add(page_stem)
            page_frontmatter = SEMANTIC_COUNT_RE.sub(
                f"semantic-node-count: {chapter.knowledge_count}",
                markdown_frontmatter,
            )
            authority = authority_path(source.parent / chapter.authority, root)
            page_frontmatter = replace_markdown_source(page_frontmatter, authority)
            markdown_page = replace_paths(markdown_page, markdown_assets, ".assets")
            markdown_output = page_frontmatter + markdown_page.lstrip("\n")
            (markdown / f"{page_stem}.md").write_text(
                markdown_output, encoding="utf-8"
            )
            label_match = MARKDOWN_HEADING_RE.search(markdown_page)
            label = label_match.group(1).strip() if label_match else page_stem

            if latex is not None:
                latex_page = replace_paths(latex_pages[index], latex_assets, "assets")
                latex_output = (
                    latex_preamble.rstrip()
                    + "\n\\mainmatter\n"
                    + latex_page.strip()
                    + "\n\\end{document}\n"
                )
                (latex / f"{page_stem}.tex").write_text(
                    latex_output, encoding="utf-8"
                )
            pages.append(Page(document.name, authority, page_stem, label))

        copy_shared(snapshot / "markdown" / "reference.bib", markdown)
        if latex is not None:
            for name in ("reference.bib", "qlnotes-export.cls", "elegantbook.cls"):
                copy_shared(snapshot / "latex" / name, latex)

    write_index(markdown, pages)
    print(f"Chapter exports: {len(pages)}")
    if latex is not None:
        print(f"LaTeX directory: {latex.resolve()}")
    print(f"Markdown directory: {markdown.resolve()}")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--document",
        action="append",
        required=True,
        metavar="NAME=SOURCE.TYP",
        help="entry point and filename prefix; may be repeated",
    )
    parser.add_argument("--root", type=Path, required=True, help="Typst project root")
    parser.add_argument("--output", type=Path, required=True, help="versioned exports directory")
    parser.add_argument("--build", type=Path, required=True, help="ignored work directory")
    parser.add_argument(
        "--markdown-only",
        action="store_true",
        help="write Markdown chapter snapshots without requiring LaTeX chapter parity",
    )
    parser.add_argument(
        "--whole-document",
        action="store_true",
        help="write one Markdown snapshot per entry point instead of splitting chapters",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    try:
        export_course(
            [parse_document(value) for value in args.document],
            args.root,
            args.output,
            args.build,
            markdown_only=args.markdown_only,
            whole_document=args.whole_document,
        )
    except (ExportError, OSError) as error:
        print(f"course export failed: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
