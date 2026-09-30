#!/usr/bin/env python3
"""Export maintained LaTeX authorities directly through kgdistiller's HTML provider."""

from __future__ import annotations

import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path


class LatexWebError(RuntimeError):
    pass


DOCUMENT_CLASS_RE = re.compile(r"(?m)^\s*\\documentclass(?:\s*\[[^\]]*\])?\s*\{")
CJK_RE = re.compile(r"[\u3400-\u9fff\uf900-\ufaff\U00020000-\U0002ffff]")
THEOREM_ENVIRONMENTS = (
    ("definition", "Definition"),
    ("theorem", "Theorem"),
    ("lemma", "Lemma"),
    ("proposition", "Proposition"),
    ("corollary", "Corollary"),
    ("axiom", "Axiom"),
    ("example", "Example"),
    ("remark", "Remark"),
)


def tex_text(value: str) -> str:
    """Escape plain metadata, keeping source TeX in the input files untouched."""
    escaped = {
        "\\": r"\textbackslash{}",
        "{": r"\{",
        "}": r"\}",
        "&": r"\&",
        "%": r"\%",
        "$": r"\$",
        "#": r"\#",
        "_": r"\_",
        "^": r"\textasciicircum{}",
        "~": r"\textasciitilde{}",
    }
    return "".join(escaped.get(character, character) for character in " ".join(value.split()))


def fragment_document(
    sources: list[Path], *, title: str | None, course: str | None, author: str | None,
) -> str:
    heading = tex_text(title or sources[0].stem.replace("-", " ").title())
    if course:
        heading += r"\\" + tex_text(course)
    lines = [
        r"\documentclass{article}",
        r"\usepackage{amsmath,amssymb,amsthm}",
    ]
    if any(CJK_RE.search(text) for text in [
        title or "", course or "", author or "",
        *(source.read_text(encoding="utf-8") for source in sources),
    ]):
        # Fandol is supplied by TeX Live; ctex also selects XeLaTeX in the provider.
        lines.append(r"\usepackage[UTF8,fontset=fandol]{ctex}")
    lines.extend([
        r"\providecommand{\kn}[1]{\textbf{#1}}",
        r"\providecommand{\knref}[1]{#1}",
        *(rf"\newtheorem{{{name}}}{{{label}}}" for name, label in THEOREM_ENVIRONMENTS),
        rf"\title{{{heading}}}",
        rf"\author{{{tex_text(author or '')}}}",
        r"\date{}",
        r"\begin{document}",
        r"\maketitle",
    ])
    for source in sources:
        name = source.as_posix()
        if any(character in name for character in '{}%#"\\\r\n'):
            raise LatexWebError(f"unsupported TeX input filename: {source}")
        # TeX and the provider both accept quoted paths containing spaces or Unicode.
        lines.append(rf'\input{{"{name}"}}')
    return "\n".join([*lines, r"\end{document}", ""])


def run_export(root: Path, repo_root: Path, output: Path) -> None:
    executable = os.environ.get("KGDISTILLER_BIN", "kgdistiller")
    command = shutil.which(executable)
    if command is None:
        raise LatexWebError("kgdistiller is required for direct LaTeX HTML export (set KGDISTILLER_BIN)")
    result = subprocess.run(
        [command, "--repo-root", str(repo_root), "export", "latex", str(root),
         "--output", str(output), "--replace"],
        check=False,
        capture_output=True,
        text=True,
        encoding="utf-8",
    )
    if result.returncode:
        detail = result.stderr.strip() or result.stdout.strip()
        raise LatexWebError(f"direct LaTeX HTML export failed:\n{detail}")
    try:
        status = json.loads(result.stdout)
    except (ValueError, TypeError) as error:
        raise LatexWebError("kgdistiller did not return a JSON export result") from error
    if (
        not isinstance(status, dict)
        or status.get("schema") != "kgdistiller-latex-html-export-v1"
        or status.get("status") != "exported"
        or not isinstance(status.get("output"), str)
        or Path(status["output"]).resolve() != output
        or not output.is_file()
    ):
        raise LatexWebError("kgdistiller did not produce the requested HTML output")


def export_latex_web(
    sources: list[Path],
    repo_root: Path,
    build: Path,
    output: Path,
    *,
    title: str | None,
    course: str | None,
    author: str | None,
) -> None:
    repo_root = repo_root.resolve()
    build = build.resolve()
    output = output.resolve()
    for path in (build, output):
        try:
            path.relative_to(repo_root)
        except ValueError as error:
            raise LatexWebError(f"generated LaTeX web paths must stay inside repo root: {path}") from error
    if not sources:
        raise LatexWebError("at least one LaTeX source is required")
    resolved_sources = [source.resolve() for source in sources]
    complete = []
    for source in resolved_sources:
        try:
            source.relative_to(repo_root)
        except ValueError as error:
            raise LatexWebError(f"LaTeX authority must stay inside repo root: {source}") from error
        if not source.is_file() or source.suffix.lower() != ".tex":
            raise LatexWebError(f"LaTeX source must be an existing .tex file: {source}")
        complete.append(bool(DOCUMENT_CLASS_RE.search(source.read_text(encoding="utf-8"))))
    if any(complete):
        if len(sources) != 1:
            raise LatexWebError("pass one complete LaTeX root or a list of LaTeX fragments")
        run_export(resolved_sources[0], repo_root, output)
    else:
        build.mkdir(parents=True, exist_ok=True)
        with tempfile.TemporaryDirectory(prefix="latex-html-", dir=build) as temporary:
            wrapper = Path(temporary) / "main.tex"
            wrapper.write_text(
                fragment_document(resolved_sources, title=title, course=course, author=author),
                encoding="utf-8",
            )
            run_export(wrapper, repo_root, output)
    print(f"LaTeX -> HTML: {len(sources)} source(s) -> {output}")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("sources", nargs="+", type=Path)
    parser.add_argument("--repo-root", required=True, type=Path)
    parser.add_argument("--build", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--title")
    parser.add_argument("--course")
    parser.add_argument("--author")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    try:
        export_latex_web(
            args.sources, args.repo_root, args.build, args.output,
            title=args.title, course=args.course, author=args.author,
        )
    except (LatexWebError, OSError) as error:
        print(f"LaTeX web export failed: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
