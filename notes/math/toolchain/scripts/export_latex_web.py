#!/usr/bin/env python3
"""Convert maintained LaTeX authorities through Typst and compile QLNotes HTML."""

from __future__ import annotations

import argparse
import re
import shutil
import subprocess
import sys
from pathlib import Path

from convert_latex_project import LatexProjectError, convert_latex_project, inspect_project
from migrate_latex import MigrationError


class LatexWebError(RuntimeError):
    pass


LATEX_KN_RE = re.compile(r"\\kn\s*\{")
LATEX_REF_RE = re.compile(r"\\knref\s*\{")


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
    if shutil.which("pandoc") is None or shutil.which("typst") is None:
        raise LatexWebError("Pandoc and Typst are required for LaTeX web export")
    repo_root = repo_root.resolve()
    build = build.resolve()
    output = output.resolve()
    for path in (build, output.parent):
        try:
            path.relative_to(repo_root)
        except ValueError as error:
            raise LatexWebError(f"generated LaTeX web paths must stay inside repo root: {path}") from error
    resolved_sources = [source.resolve() for source in sources]
    for source in resolved_sources:
        try:
            source.relative_to(repo_root)
        except ValueError as error:
            raise LatexWebError(f"LaTeX authority must stay inside repo root: {source}") from error
    project = inspect_project(resolved_sources)
    expected_kn = sum(len(LATEX_KN_RE.findall(source.read_text(encoding="utf-8"))) for source in project.content_sources)
    expected_refs = sum(len(LATEX_REF_RE.findall(source.read_text(encoding="utf-8"))) for source in project.content_sources)
    wrapper = convert_latex_project(
        project,
        build,
        title=title,
        course=course,
        author=author,
    )
    output.parent.mkdir(parents=True, exist_ok=True)
    result = subprocess.run(
        [
            "typst",
            "compile",
            "--root",
            str(build),
            "--features",
            "html",
            "--format",
            "html",
            str(wrapper),
            str(output),
        ],
        check=False,
        capture_output=True,
        text=True,
        encoding="utf-8",
    )
    if result.returncode:
        detail = result.stderr.strip() or result.stdout.strip()
        raise LatexWebError(f"Typst HTML compilation failed:\n{detail}")
    rendered = output.read_text(encoding="utf-8")
    actual_kn = rendered.count("data-ql-kn=")
    actual_refs = rendered.count("data-ql-ref=")
    if actual_kn != expected_kn or actual_refs != expected_refs:
        raise LatexWebError(
            "knowledge markers did not resolve in generated HTML "
            f"(kn {actual_kn}/{expected_kn}, refs {actual_refs}/{expected_refs}); "
            "synchronize the configured LaTeX authority before export"
        )
    print(f"LaTeX -> Typst -> HTML: {len(project.content_sources)} source(s) -> {output}")


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
            args.sources,
            args.repo_root,
            args.build,
            args.output,
            title=args.title,
            course=args.course,
            author=args.author,
        )
    except (LatexWebError, LatexProjectError, MigrationError, OSError) as error:
        print(f"LaTeX web export failed: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
