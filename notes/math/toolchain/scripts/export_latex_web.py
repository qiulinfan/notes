#!/usr/bin/env python3
"""Export maintained LaTeX sources to self-contained HTML.

The obsidian-latex-live converter (``latex-live-export``, or the JSON argv in
LATEX_LIVE_EXPORT_COMMAND) receives one ``latex-live-html-request-v1`` document
request on stdin. Its knowledge markers come from the notes-owned registry
(knowledge_registry.latex_markers); no shell evaluates the command.
"""

from __future__ import annotations

import argparse
import json
import os
import re
import subprocess
import sys
import tempfile
from pathlib import Path

from knowledge_registry import RegistryError, latex_markers


class LatexWebError(RuntimeError):
    pass


COMMAND_ENV = "LATEX_LIVE_EXPORT_COMMAND"
DEFAULT_COMMAND = ("latex-live-export",)
REQUEST_SCHEMA = "latex-live-html-request-v1"
RESULT_SCHEMA = "latex-live-html-result-v1"
TIMEOUT_SECONDS = 600
MAX_RESULT_CHARACTERS = 64 * 1024 * 1024
HTML_RE = re.compile(r"<html(?:\s|>)", re.IGNORECASE)
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


def converter_command() -> list[str]:
    configured = os.environ.get(COMMAND_ENV)
    if configured is None:
        return list(DEFAULT_COMMAND)
    try:
        command = json.loads(configured)
    except json.JSONDecodeError as error:
        raise LatexWebError(f"{COMMAND_ENV} must be a JSON array of command arguments") from error
    if not isinstance(command, list) or not command or any(
        not isinstance(argument, str) or not argument or "\0" in argument for argument in command
    ):
        raise LatexWebError(f"{COMMAND_ENV} must be a non-empty JSON array of strings")
    return command


def run_export(root: Path, repo_root: Path, output: Path) -> None:
    """Send one document request to the converter and write its HTML atomically."""
    try:
        markers = latex_markers(repo_root)
    except (RegistryError, ValueError, KeyError) as error:
        raise LatexWebError(f"cannot read the knowledge markers: {error}") from error
    request = {
        "schema": REQUEST_SCHEMA,
        "operation": "document",
        "source": str(root),
        "project_root": str(repo_root),
        "markers": markers,
    }
    try:
        process = subprocess.Popen(
            converter_command(),
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            encoding="utf-8",
        )
        try:
            stdout, stderr = process.communicate(
                json.dumps(request, ensure_ascii=False), timeout=TIMEOUT_SECONDS,
            )
        except (subprocess.TimeoutExpired, KeyboardInterrupt):
            # The converter's SIGTERM handler disposes its TeX process groups;
            # killing it immediately would bypass that cleanup.
            process.terminate()
            try:
                process.communicate(timeout=10)
            except subprocess.TimeoutExpired:
                process.kill()
                process.communicate()
            raise
    except FileNotFoundError as error:
        raise LatexWebError(
            "the LaTeX HTML converter is unavailable; install obsidian-latex-live's "
            f"latex-live-export command or set {COMMAND_ENV} to its JSON argv"
        ) from error
    except (OSError, UnicodeError, subprocess.TimeoutExpired) as error:
        raise LatexWebError(f"the LaTeX HTML converter failed: {error}") from error
    if process.returncode:
        detail = stderr.strip() or stdout.strip() or f"exit {process.returncode}"
        raise LatexWebError(f"direct LaTeX HTML export failed:\n{detail}")
    if len(stdout) > MAX_RESULT_CHARACTERS:
        raise LatexWebError("the LaTeX HTML converter result exceeds 64 MiB")
    try:
        response = json.loads(stdout)
    except (ValueError, TypeError) as error:
        raise LatexWebError("the LaTeX HTML converter did not return JSON") from error
    if not isinstance(response, dict) or response.get("schema") != RESULT_SCHEMA:
        raise LatexWebError(f"the LaTeX HTML converter must return {RESULT_SCHEMA}")
    if response.get("operation") != "document":
        raise LatexWebError("the LaTeX HTML converter returned another operation")
    document = response.get("html")
    if not isinstance(document, str) or not HTML_RE.search(document):
        raise LatexWebError("the LaTeX HTML converter omitted the complete HTML document")
    output.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile(
        "w", encoding="utf-8", dir=output.parent, prefix=f".{output.name}.", delete=False,
    ) as handle:
        handle.write(document)
        temporary = Path(handle.name)
    try:
        os.replace(temporary, output)
    except OSError:
        temporary.unlink(missing_ok=True)
        raise


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
