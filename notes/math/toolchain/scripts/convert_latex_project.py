#!/usr/bin/env python3
"""Convert a supported ElegantBook LaTeX project into a previewable Typst project."""

from __future__ import annotations

import argparse
import os
import re
import shutil
import sys
from dataclasses import dataclass
from pathlib import Path

from migrate_latex import MigrationError, migrate


TOOLCHAIN = Path(__file__).resolve().parents[1]
PUBLIC_KNOWLEDGE_REGISTRY = (
    TOOLCHAIN.parents[2] / "knowledge/export/site/knowledge-registry.typ"
)
INCLUDE_RE = re.compile(r"\\(?:input|include)\s*\{(?P<path>[^}]+)\}")
GRAPHIC_RE = re.compile(
    r"\\(?:pic(?:\[[^\]]*\])?|includegraphics(?:\[[^\]]*\])?)"
    r"\s*\{(?P<path>[^}]+)\}"
)
DOCUMENT_CLASS_RE = re.compile(r"\\documentclass(?:\[[^\]]*\])?\{elegantbook\}")
UNSUPPORTED_RE = re.compile(r"\\begin\{(?P<name>tikzpicture|problemset|custom)\}")


class LatexProjectError(RuntimeError):
    pass


@dataclass(frozen=True)
class LatexProject:
    requested: tuple[Path, ...]
    content_sources: tuple[Path, ...]
    project_root: Path
    entrypoint: Path | None
    title: str
    subtitle: str | None
    author: str | None
    date: str | None


def uncommented(source: str) -> str:
    lines: list[str] = []
    for line in source.splitlines():
        end = len(line)
        for index, character in enumerate(line):
            if character != "%":
                continue
            slashes = 0
            cursor = index - 1
            while cursor >= 0 and line[cursor] == "\\":
                slashes += 1
                cursor -= 1
            if slashes % 2 == 0:
                end = index
                break
        lines.append(line[:end])
    return "\n".join(lines)


def balanced_macro(source: str, name: str) -> str | None:
    match = re.search(rf"\\{re.escape(name)}\s*\{{", source)
    if match is None:
        return None
    start = match.end() - 1
    depth = 0
    for index in range(start, len(source)):
        if source[index] == "{" and (index == 0 or source[index - 1] != "\\"):
            depth += 1
        elif source[index] == "}" and (index == 0 or source[index - 1] != "\\"):
            depth -= 1
            if depth == 0:
                return source[start + 1 : index].strip()
    raise LatexProjectError(f"unbalanced \\{name} metadata")


def plain_metadata(value: str | None) -> str | None:
    if value is None:
        return None
    value = re.sub(r"\\(?:textbf|textit|emph)\s*\{([^{}]*)\}", r"\1", value)
    value = value.replace(r"\&", "&").replace(r"\_", "_").replace(r"\%", "%")
    value = re.sub(r"\\[A-Za-z]+\*?", "", value)
    value = re.sub(r"[{}]", "", value)
    return re.sub(r"\s+", " ", value).strip() or None


def included_files(entrypoint: Path, project_root: Path) -> list[Path]:
    source = uncommented(entrypoint.read_text(encoding="utf-8"))
    result: list[Path] = []
    for match in INCLUDE_RE.finditer(source):
        relative = Path(match.group("path").strip())
        candidate = (entrypoint.parent / relative).resolve()
        if not candidate.suffix:
            candidate = candidate.with_suffix(".tex")
        try:
            candidate.relative_to(project_root)
        except ValueError as error:
            raise LatexProjectError(f"included LaTeX file leaves project root: {relative}") from error
        if not candidate.is_file():
            raise LatexProjectError(f"missing included LaTeX file: {candidate}")
        nested = INCLUDE_RE.search(uncommented(candidate.read_text(encoding="utf-8")))
        if nested:
            raise LatexProjectError(
                f"nested \\input requires a synchronized template adapter: {candidate}"
            )
        if candidate not in result:
            result.append(candidate)
    return result


def inspect_project(sources: list[Path]) -> LatexProject:
    requested = tuple(path.resolve() for path in sources)
    if not requested:
        raise LatexProjectError("at least one LaTeX source is required")
    for source in requested:
        if not source.is_file():
            raise LatexProjectError(f"LaTeX source does not exist: {source}")
    entrypoint = requested[0] if len(requested) == 1 else None
    entry_text = uncommented(entrypoint.read_text(encoding="utf-8")) if entrypoint else ""
    if entrypoint and "\\documentclass" in entry_text:
        if DOCUMENT_CLASS_RE.search(entry_text) is None:
            raise LatexProjectError("only the synchronized ElegantBook template is supported")
        project_root = entrypoint.parent
        discovered = included_files(entrypoint, project_root)
        content_sources = tuple(discovered or [entrypoint])
        title = plain_metadata(balanced_macro(entry_text, "title")) or entrypoint.stem
        subtitle = plain_metadata(balanced_macro(entry_text, "subtitle"))
        author = plain_metadata(balanced_macro(entry_text, "author"))
        date = plain_metadata(balanced_macro(entry_text, "date"))
    else:
        content_sources = requested
        project_root = Path(os.path.commonpath([str(path.parent) for path in requested]))
        title = requested[0].stem.replace("-", " ").title()
        subtitle = author = date = None
    for source in content_sources:
        unsupported = UNSUPPORTED_RE.search(uncommented(source.read_text(encoding="utf-8")))
        if unsupported:
            raise LatexProjectError(
                f"unsupported ElegantBook construct {unsupported.group('name')!r}; "
                "update the LaTeX and Typst templates together before using it"
            )
    return LatexProject(requested, content_sources, project_root, entrypoint, title, subtitle, author, date)


def typst_string(value: str) -> str:
    return value.replace("\\", "\\\\").replace('"', '\\"').replace("\n", " ")


def copy_support(project: LatexProject, build: Path) -> None:
    target = build / "toolchain"
    target.mkdir(parents=True, exist_ok=True)
    for name in ("qlnotes.typ", "math-aliases.typ", "web.css"):
        shutil.copy2(TOOLCHAIN / name, target / name)
    (target / "generated").mkdir(exist_ok=True)
    shutil.copy2(
        PUBLIC_KNOWLEDGE_REGISTRY,
        target / "generated/knowledge-registry.typ",
    )
    assets = project.project_root / "assets"
    if assets.is_dir():
        shutil.copytree(assets, build / "assets", dirs_exist_ok=True)
    bibliography = project.project_root / "reference.bib"
    if bibliography.is_file():
        shutil.copy2(bibliography, build / "reference.bib")


def detected_image_suffix(path: Path) -> str:
    header = path.read_bytes()[:32]
    if header.startswith(b"\x89PNG\r\n\x1a\n"):
        return ".png"
    if header.startswith(b"\xff\xd8\xff"):
        return ".jpg"
    if header.startswith((b"GIF87a", b"GIF89a")):
        return ".gif"
    if header.startswith(b"RIFF") and header[8:12] == b"WEBP":
        return ".webp"
    if header.lstrip().startswith(b"<svg"):
        return ".svg"
    return path.suffix.lower()


def copy_graphic_assets(
    project: LatexProject,
    build: Path,
) -> dict[Path, list[tuple[str, str]]]:
    """Copy source-referenced graphics and return chapter-relative rewrites."""

    rewrites: dict[Path, list[tuple[str, str]]] = {}
    for source in project.content_sources:
        source_rewrites: list[tuple[str, str]] = []
        text = uncommented(source.read_text(encoding="utf-8"))
        for match in GRAPHIC_RE.finditer(text):
            raw = match.group("path").strip()
            relative = Path(raw)
            if relative.is_absolute():
                raise LatexProjectError(f"absolute graphic path is unsupported: {raw}")
            if relative.suffix.casefold() == ".pdf":
                raise LatexProjectError(
                    f"PDF graphics are forbidden below notes/; replace {raw} with a web asset"
                )
            candidates = (
                (project.project_root / relative).resolve(),
                (source.parent / relative).resolve(),
            )
            graphic = next((candidate for candidate in candidates if candidate.is_file()), None)
            if graphic is None:
                raise LatexProjectError(f"missing graphic referenced by {source}: {raw}")
            try:
                target_relative = graphic.relative_to(project.project_root)
            except ValueError as error:
                raise LatexProjectError(f"graphic leaves project root: {raw}") from error
            actual_suffix = detected_image_suffix(graphic)
            if actual_suffix and actual_suffix != target_relative.suffix.casefold():
                target_relative = target_relative.with_suffix(actual_suffix)
            target = build / target_relative
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(graphic, target)
            source_rewrites.append((raw, f"../{target_relative.as_posix()}"))
        rewrites[source] = source_rewrites
    return rewrites


def convert_latex_project(
    project: LatexProject,
    build: Path,
    *,
    title: str | None = None,
    course: str | None = None,
    author: str | None = None,
) -> Path:
    build = build.resolve()
    chapters = build / "chapters"
    if chapters.exists():
        shutil.rmtree(chapters)
    chapters.mkdir(parents=True, exist_ok=True)
    migrate(list(project.content_sources), chapters, build / "diagrams", None)
    copy_support(project, build)
    graphic_rewrites = copy_graphic_assets(project, build)
    module_imports = (
        '#import "../toolchain/qlnotes.typ": *\n'
        '#import "../toolchain/math-aliases.typ": *\n\n'
    )
    for source in project.content_sources:
        chapter = chapters / f"{source.stem}.typ"
        chapter_text = chapter.read_text(encoding="utf-8")
        for original, replacement in graphic_rewrites[source]:
            chapter_text = chapter_text.replace(
                f'image("{original}"',
                f'image("{replacement}"',
            )
        chapter.write_text(module_imports + chapter_text, encoding="utf-8")
    arguments = [f'  title: "{typst_string(title or project.title)}"']
    if project.subtitle:
        arguments.append(f'  subtitle: "{typst_string(project.subtitle)}"')
    if course:
        arguments.append(f'  course: "{typst_string(course)}"')
    resolved_author = author or project.author
    if resolved_author:
        arguments.append(f'  author: "{typst_string(resolved_author)}"')
    if project.date:
        arguments.append(f'  date: "{typst_string(project.date)}"')
    bibliography = project.project_root / "reference.bib"
    if bibliography.is_file():
        arguments.append('  bibliography: "reference.bib"')
    else:
        arguments.append("  bibliography: none")
    includes = "\n".join(f'#include "chapters/{path.stem}.typ"' for path in project.content_sources)
    bibliography_block = '\n#bibliography("reference.bib")' if bibliography.is_file() else ""
    main = build / "main.typ"
    main.write_text(
        '#import "toolchain/qlnotes.typ": *\n'
        '#import "toolchain/math-aliases.typ": *\n\n'
        "#show: qlnotes.with(\n"
        + ",\n".join(arguments)
        + ",\n)\n\n"
        + '#set math.equation(numbering: "(1)")\n\n'
        + includes
        + bibliography_block
        + "\n",
        encoding="utf-8",
    )
    (build / "Makefile").write_text(
        ".PHONY: preview watch web\n\n"
        "preview:\n\ttypst compile --features html --format html main.typ index.html\n\n"
        "watch:\n\ttypst watch --features html --format html main.typ index.html\n\n"
        "web:\n\ttypst compile --features html --format html main.typ index.html\n",
        encoding="utf-8",
    )
    return main


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("sources", nargs="+", type=Path)
    parser.add_argument("--build", required=True, type=Path)
    parser.add_argument("--title")
    parser.add_argument("--course")
    parser.add_argument("--author")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    try:
        project = inspect_project(args.sources)
        output = convert_latex_project(
            project,
            args.build,
            title=args.title,
            course=args.course,
            author=args.author,
        )
    except (LatexProjectError, MigrationError, OSError) as error:
        print(f"LaTeX -> Typst conversion failed: {error}", file=sys.stderr)
        return 1
    print(f"Previewable Typst project: {output}")
    print(f"Preview: make -C {output.parent} preview")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
