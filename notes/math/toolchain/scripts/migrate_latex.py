#!/usr/bin/env python3
"""Migrate legacy QLNotes LaTeX chapters into semantic Typst source files."""

from __future__ import annotations

import argparse
import json
import os
import re
import subprocess
import sys
import tempfile
from pathlib import Path
from typing import Any


TOOLCHAIN = Path(__file__).resolve().parents[1]
FILTER = TOOLCHAIN / "filters" / "latex-to-qlnotes.lua"
TIKZ_RE = re.compile(
    r"(?ms)^[ \t]*\\begin\{tikzpicture\}(?:\[[^\n]*\])?.*?"
    r"^[ \t]*\\end\{tikzpicture\}[ \t]*$"
)
CODE_RE = re.compile(
    r"(?ms)^[ \t]*\\begin\{(?P<kind>python|terminal)\}"
    r"(?:\[[^\n]*\])?[ \t]*\n(?P<body>.*?)"
    r"^[ \t]*\\end\{(?P=kind)\}[ \t]*$"
)
PIC_RE = re.compile(
    r"\\pic(?:\[(?P<scale>[^\]]+)\])?\{(?P<path>[^}]+)\}"
)
KNOWLEDGE_MACRO_RE = re.compile(r"\\(?P<kind>knref|kn)\s*\{")


class MigrationError(RuntimeError):
    pass


def slug(value: str) -> str:
    candidate = re.sub(r"[^A-Za-z0-9]+", "-", value.lower()).strip("-")
    return candidate or "chapter"


def expand_math_aliases(source: str) -> str:
    simple_commands = {
        r"\fL": r"\mathcal{L}",
        r"\sub": r"\subseteq",
        r"\rar": r"\rightarrow",
        r"\lar": r"\leftarrow",
        r"\intsec": r"\bigcap",
        r"\bigintsec": r"\displaystyle\bigcap",
        r"\bigunion": r"\displaystyle\bigcup",
        r"\union": r"\bigcup",
        r"\borel": r"\mathcal{B}",
        r"\extR": r"\overline{\mathbb{R}}",
        r"\re": r"\operatorname{Re}",
        r"\im": r"\operatorname{Im}",
        r"\card": r"\operatorname{card}",
        r"\supp": r"\operatorname{supp}",
        r"\avint": r"\operatorname{avg}",
        r"\ds": r"\displaystyle",
    }
    # Replace longer names first so `\bigintsec` is not partially rewritten
    # through the shorter `\intsec` alias.
    for command in sorted(simple_commands, key=len, reverse=True):
        source = re.sub(
            re.escape(command) + r"(?![A-Za-z])",
            lambda _: simple_commands[command],
            source,
        )
    source = re.sub(r"\\ol(?![A-Za-z])", r"\\overline", source)
    source = re.sub(r"\\not\s+\\bot\b", r"\\not\\perp", source)
    source = re.sub(r"\\Bigm\b", r"\\Big", source)
    source = re.sub(r"\\newline\b", r"\\,", source)
    source = re.sub(
        r"\{([^{}]+)\\over\s+([^{}]+)\}",
        r"\\frac{\1}{\2}",
        source,
    )
    source = re.sub(r"\\bf\{([A-Za-z])\}", r"\\mathbf{\1}", source)
    source = re.sub(r"\\b([A-Z])(?![A-Za-z])", r"\\mathbb{\1}", source)
    source = re.sub(r"\\c([A-Z])(?![A-Za-z])", r"\\mathcal{\1}", source)
    source = re.sub(r"\\bf([A-Z])(?![A-Za-z])", r"\\mathbf{\1}", source)
    return source


def expand_picture_aliases(source: str) -> str:
    r"""Turn the legacy `\pic[scale]{path}` helper into native LaTeX images."""

    def replace(match: re.Match[str]) -> str:
        scale = (match.group("scale") or "1").strip()
        path = match.group("path").strip()
        return (
            "\\begin{figure}\n"
            "\\centering\n"
            f"\\includegraphics[width={scale}\\textwidth]{{{path}}}\n"
            "\\end{figure}"
        )

    return PIC_RE.sub(replace, source)


def normalize_nested_math_text(source: str) -> str:
    """Flatten legacy nested math/text constructs that Pandoc cannot parse."""

    source = re.sub(
        r"\\text\{\$(.*?)\$\s*for every\s*\$(.*?)\$\s*and\s*\$(.*?)\$\}",
        r"\1 \\text{ for every } \2 \\text{ and } \3",
        source,
        flags=re.DOTALL,
    )
    source = re.sub(
        r"\\text\{([^{}]*)\\textbf\{([^{}]*)\}([^{}]*)\}",
        r"\\text{\1\2\3}",
        source,
    )
    return source


def rewrite_knowledge_macros(source: str) -> tuple[str, int]:
    r"""Preserve ``\kn``/``\knref`` through Pandoc as typed pseudo-links."""

    cursor = 0
    parts: list[str] = []
    changes = 0
    while match := KNOWLEDGE_MACRO_RE.search(source, cursor):
        body_start = match.end() - 1
        body_end = _matching_delimiter(source, body_start, "{", "}")
        body = source[body_start + 1 : body_end]
        target = "qlkn:" if match.group("kind") == "kn" else "qlknref:"
        parts.extend((source[cursor : match.start()], rf"\href{{{target}}}{{{body}}}"))
        cursor = body_end + 1
        changes += 1
    if not changes:
        return source, 0
    parts.append(source[cursor:])
    return "".join(parts), changes


def extract_code(source: str) -> str:
    def replace(match: re.Match[str]) -> str:
        return (
            "\\begin{verbatim}\n"
            f"QLNOTESCODE:{match.group('kind')}\n"
            f"{match.group('body').rstrip()}\n"
            "\\end{verbatim}"
        )

    return CODE_RE.sub(replace, source)


def extract_diagrams(
    source: str,
    chapter: str,
    diagram_dir: Path,
) -> tuple[str, list[dict[str, Any]]]:
    records: list[dict[str, Any]] = []
    diagram_dir.mkdir(parents=True, exist_ok=True)

    def replace(match: re.Match[str]) -> str:
        index = len(records) + 1
        identifier = f"prob-{chapter}-diagram-{index:02d}"
        tikz_path = diagram_dir / f"{identifier}.tikz"
        tikz_path.write_text(match.group(0).strip() + "\n", encoding="utf-8")
        records.append(
            {
                "id": identifier,
                "chapter": chapter,
                "index": index,
                "tikz": str(tikz_path),
            }
        )
        return f"\\par QLNOTESDIAGRAM:{identifier} \\par"

    return TIKZ_RE.sub(replace, source), records


def run_pandoc(source: str, chapter: str, output: Path) -> None:
    output.parent.mkdir(parents=True, exist_ok=True)
    environment = os.environ.copy()
    environment["QLNOTES_CHAPTER"] = chapter
    with tempfile.NamedTemporaryFile(
        mode="w",
        suffix=".tex",
        encoding="utf-8",
        delete=False,
    ) as stream:
        stream.write(source)
        temporary = Path(stream.name)

    try:
        result = subprocess.run(
            [
                "pandoc",
                str(temporary),
                "--from",
                "latex",
                "--to",
                "typst",
                "--wrap",
                "preserve",
                "--lua-filter",
                str(FILTER),
                "--output",
                str(output),
            ],
            check=False,
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            env=environment,
        )
    finally:
        temporary.unlink(missing_ok=True)

    if result.returncode:
        detail = result.stderr.strip() or result.stdout.strip()
        raise MigrationError(f"Pandoc failed for {output.name}:\n{detail}")
    if result.stderr.strip():
        print(result.stderr.strip(), file=sys.stderr)


def _matching_delimiter(
    source: str,
    start: int,
    opening: str,
    closing: str,
) -> int:
    depth = 0
    in_string = False
    escaped = False
    for index in range(start, len(source)):
        character = source[index]
        if in_string:
            if escaped:
                escaped = False
            elif character == "\\":
                escaped = True
            elif character == '"':
                in_string = False
            continue
        if escaped:
            escaped = False
            continue
        if character == '"':
            in_string = True
            continue
        if character == "\\":
            escaped = True
            continue
        if character == opening:
            depth += 1
        elif character == closing:
            depth -= 1
            if depth == 0:
                return index
    raise MigrationError(
        f"unbalanced Typst delimiter {opening!r} starting at byte {start}"
    )


def hoist_example_supporting_blocks(source: str) -> tuple[str, int]:
    """Move proof/solution blocks out of example figures so they can paginate."""

    pattern = re.compile(r"(?m)^[ \t]*#example(?=[(\[])")
    support = re.compile(r"(?m)^[ \t]*#(?:proof|solution)\[")
    cursor = 0
    changes = 0
    while match := pattern.search(source, cursor):
        call_end = match.end()
        if source[call_end] == "(":
            arguments_end = _matching_delimiter(source, call_end, "(", ")")
            body_start = arguments_end + 1
            while body_start < len(source) and source[body_start].isspace():
                body_start += 1
        else:
            body_start = call_end
        if body_start >= len(source) or source[body_start] != "[":
            cursor = call_end
            continue
        body_end = _matching_delimiter(source, body_start, "[", "]")
        nested = support.search(source, body_start + 1, body_end)
        if nested is None:
            cursor = body_end + 1
            continue
        support_start = nested.start()
        source = (
            source[:support_start]
            + "]\n"
            + source[support_start:body_end]
            + source[body_end + 1 :]
        )
        changes += 1
        cursor = support_start + 2
    return source, changes


def replace_typst_function(
    source: str,
    name: str,
    replacement: str,
) -> tuple[str, int]:
    """Rewrite a generated Typst math function while preserving its body."""

    pattern = re.compile(rf"\b{re.escape(name)}\(")
    cursor = 0
    changes = 0
    while match := pattern.search(source, cursor):
        body_start = match.end() - 1
        body_end = _matching_delimiter(source, body_start, "(", ")")
        body = source[body_start + 1 : body_end]
        rewritten = replacement.format(body=body)
        source = source[: match.start()] + rewritten + source[body_end + 1 :]
        changes += 1
        cursor = match.start() + len(rewritten)
    return source, changes


def normalize_typst_output(source: str) -> tuple[str, int]:
    """Normalize Pandoc output for paged and experimental HTML targets."""

    changes = 0
    before = source
    source = source.replace('mat(delim: "||",', 'mat(delim: "|",')
    changes += before.count('mat(delim: "||",')
    # Typst's HTML backend currently ignores `overline`; `accent` preserves the
    # notation in both paged PDF and HTML output.
    source, rewritten = replace_typst_function(
        source,
        "overline",
        "accent({body}, macron)",
    )
    changes += rewritten
    # `underline` is currently dropped by Typst's MathML exporter. Express the
    # same lower bar as an under-attachment, which survives both targets.
    source, rewritten = replace_typst_function(
        source,
        "underline",
        "attach(limits({body}), b: macron)",
    )
    changes += rewritten

    # Pandoc emits set difference as two backslashes. Keep the following union
    # operator lexically separate so Typst does not parse one unknown symbol.
    before = source
    source = source.replace("\\\\union.big", "\\\\ union.big")
    changes += before.count("\\\\union.big")

    # A TeX exponent or subscript ends before the following relation/spacing
    # command. Pandoc occasionally omits the separating space in Typst output.
    source, separated = re.subn(
        r"\^([A-Za-z0-9]+?)(thin|quad|approx|epsilon\.alt|lt\.eq|gt\.eq|arrow\.r|in\b|dot\.op)",
        r"^\1 \2",
        source,
    )
    changes += separated
    source, separated = re.subn(r"_sup(lt\.eq|gt\.eq)", r"_sup \1", source)
    changes += separated
    source, separated = re.subn(
        r"_([A-Za-z0-9]+?)(thin|quad|lt\.eq|gt\.eq|arrow\.r|in\b|dot\.op)",
        r"_\1 \2",
        source,
    )
    changes += separated
    source, separated = re.subn(r"\^nm\\\(", r"^n m\\(", source)
    changes += separated
    # Pandoc uses scaled one-character wrappers for TeX sizing commands such
    # as `\bigl`. The scale is ignored in HTML and can detach following
    # superscripts in MathML, so keep only the delimiter itself.
    source, unwrapped = re.subn(
        r"#scale\(x: [^,]+, y: [^)]+\)\[((?:\\[\[\]]|[^\[\]])*)\]",
        r"\1",
        source,
    )
    changes += unwrapped
    return source, changes


def migrate(
    sources: list[Path],
    output_dir: Path,
    diagram_dir: Path,
    manifest: Path | None,
) -> None:
    all_diagrams: list[dict[str, Any]] = []
    for source_path in sources:
        source_path = source_path.resolve()
        if not source_path.is_file():
            raise MigrationError(f"source does not exist: {source_path}")
        chapter = slug(source_path.stem)
        text = source_path.read_text(encoding="utf-8")
        text, knowledge_markers = rewrite_knowledge_macros(text)
        text, diagrams = extract_diagrams(text, chapter, diagram_dir)
        text = extract_code(text)
        text = expand_picture_aliases(text)
        text = normalize_nested_math_text(text)
        text = expand_math_aliases(text)
        output = output_dir / f"{source_path.stem}.typ"
        run_pandoc(text, chapter, output)
        migrated, hoisted = hoist_example_supporting_blocks(
            output.read_text(encoding="utf-8")
        )
        migrated, normalized = normalize_typst_output(migrated)
        if hoisted or normalized:
            output.write_text(migrated, encoding="utf-8")
        all_diagrams.extend(diagrams)
        print(
            f"Migrated {source_path.name} -> {output} "
            f"({len(diagrams)} diagram(s), "
            f"{knowledge_markers} knowledge marker(s), "
            f"{hoisted} supporting block(s) hoisted, "
            f"{normalized} HTML-safe math normalization(s))"
        )

    if manifest is not None:
        manifest.parent.mkdir(parents=True, exist_ok=True)
        manifest.write_text(
            json.dumps(all_diagrams, ensure_ascii=False, indent=2) + "\n",
            encoding="utf-8",
        )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("sources", nargs="+", type=Path)
    parser.add_argument("--output-dir", required=True, type=Path)
    parser.add_argument("--diagram-dir", required=True, type=Path)
    parser.add_argument("--manifest", type=Path)
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    try:
        migrate(
            args.sources,
            args.output_dir.resolve(),
            args.diagram_dir.resolve(),
            args.manifest.resolve() if args.manifest else None,
        )
    except (MigrationError, OSError) as error:
        print(f"migration failed: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
