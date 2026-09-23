#!/usr/bin/env python3
"""Reject PDF artifacts inside the source-only notes tree."""

from __future__ import annotations

import argparse
import subprocess
from pathlib import Path

MAX_TRACKED_BYTES = 10 * 1024 * 1024
FORBIDDEN_TRACKED_DIRECTORIES = {"build", "exports", "site"}
FORBIDDEN_TRACKED_NAMES = {"mkdocs.yml"}


def find_pdfs(notes_root: Path) -> list[Path]:
    return sorted(
        (
            candidate
            for candidate in notes_root.rglob("*")
            if candidate.is_file() and candidate.suffix.casefold() == ".pdf"
        ),
        key=lambda candidate: candidate.as_posix().casefold(),
    )


def tracked_note_files(repo_root: Path) -> list[Path]:
    result = subprocess.run(
        ["git", "ls-files", "-z", "notes"],
        cwd=repo_root,
        check=True,
        capture_output=True,
    )
    return [
        repo_root / raw.decode()
        for raw in result.stdout.split(b"\0")
        if raw and (repo_root / raw.decode()).is_file()
    ]


def tracked_violation(path: Path, notes_root: Path) -> str | None:
    relative = path.relative_to(notes_root)
    if path.name.casefold() in FORBIDDEN_TRACKED_NAMES:
        return "obsolete site generator"
    if any(part.casefold() in FORBIDDEN_TRACKED_DIRECTORIES for part in relative.parts[:-1]):
        return "generated directory"
    if path.stat().st_size > MAX_TRACKED_BYTES:
        return f"oversized file ({path.stat().st_size} bytes)"
    return None


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--repo-root",
        type=Path,
        default=Path(__file__).resolve().parents[2],
    )
    args = parser.parse_args()
    repo_root = args.repo_root.resolve()
    notes_root = repo_root / "notes"
    pdfs = find_pdfs(notes_root)
    if pdfs:
        print("notes/ must contain no PDF files; publish HTML from .typ/.tex/.md sources:")
        for candidate in pdfs:
            print(f"  - {candidate.relative_to(repo_root).as_posix()}")
        return 1
    tracked_errors = [
        (candidate, reason)
        for candidate in tracked_note_files(repo_root)
        if (reason := tracked_violation(candidate, notes_root)) is not None
    ]
    if tracked_errors:
        print("notes/ contains tracked generated or heavyweight artifacts:")
        for candidate, reason in tracked_errors:
            print(f"  - {candidate.relative_to(repo_root).as_posix()}: {reason}")
        return 1
    print("notes source policy: OK (source-only, no PDFs or tracked build artifacts)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
