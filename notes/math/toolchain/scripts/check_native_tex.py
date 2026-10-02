#!/usr/bin/env python3
"""Audit native companions and compile entries plus otherwise uncovered fragments.

Sources stay read-only. Every TeX output and fragment wrapper belongs to the
selected check directory under knowledge/build (or the system temporary tree).
"""
from __future__ import annotations

import argparse
from concurrent.futures import ThreadPoolExecutor
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import tempfile

TOOLCHAIN = Path(__file__).resolve().parents[1]
REPO = TOOLCHAIN.parents[2]
EXCLUDED = {"build", "exports", "site"}
INPUT = re.compile(r"\\(?:input|include)\s*\{([^{}]+)\}")


def uncomment(text: str) -> str:
    result = []
    for line in text.splitlines(keepends=True):
        for index, char in enumerate(line):
            if char != "%":
                continue
            slashes = 0
            cursor = index - 1
            while cursor >= 0 and line[cursor] == "\\":
                slashes += 1
                cursor -= 1
            if slashes % 2 == 0:
                line = line[:index] + ("\n" if line.endswith("\n") else "")
                break
        result.append(line)
    return "".join(result)


def companion_sources(math_root: Path, courses: list[str] | None = None) -> list[Path]:
    return sorted(
        source
        for course in math_root.iterdir()
        if course.is_dir() and course.name != "toolchain"
        and (courses is None or course.name in courses)
        for source in course.rglob("*.typ")
        if not (set(source.relative_to(course).parts) & EXCLUDED)
    )


def include_closure(entry: Path, course: Path) -> tuple[set[Path], list[str]]:
    """Follow literal TeX inputs using the course's actual compile directory."""
    seen: set[Path] = set()
    missing: list[str] = []
    pending = [entry.resolve()]
    while pending:
        source = pending.pop()
        if source in seen:
            continue
        seen.add(source)
        for match in INPUT.finditer(uncomment(source.read_text(encoding="utf-8"))):
            name = match[1].strip().strip('"')
            if "\\" in name or "#" in name:
                missing.append(f"{source.name}: nonliteral input {name}")
                continue
            target = Path(name)
            if not target.suffix:
                target = target.with_suffix(".tex")
            target = (course / target).resolve()
            if not target.is_file():
                missing.append(f"{source.name}: {name}")
            elif target.suffix.lower() == ".tex":
                pending.append(target)
    return seen, sorted(set(missing))


def audit_pairs(math_root: Path, courses: list[str] | None = None) -> dict:
    math_root = math_root.resolve()
    sources = companion_sources(math_root, courses)
    entries: list[Path] = []
    fragments: list[Path] = []
    missing: list[str] = []
    empty: list[str] = []
    for source in sources:
        companion = source.with_suffix(".tex")
        relative = companion.relative_to(math_root).as_posix()
        if not companion.is_file():
            missing.append(relative)
            continue
        text = uncomment(companion.read_text(encoding="utf-8"))
        if re.search(r"\\documentclass\b", text):
            entries.append(companion.resolve())
        elif text.strip():
            fragments.append(companion.resolve())
        else:
            empty.append(relative)
    covered: set[Path] = set()
    missing_inputs: dict[str, list[str]] = {}
    for entry in entries:
        course = math_root / entry.relative_to(math_root.resolve()).parts[0]
        closure, absent = include_closure(entry, course)
        covered.update(closure)
        if absent:
            missing_inputs[entry.relative_to(math_root).as_posix()] = absent
    return {
        "typst_sources": len(sources),
        "companions": len(sources) - len(missing),
        "missing_companions": missing,
        "entries": [path.relative_to(math_root).as_posix() for path in entries],
        "uncovered_fragments": [path.relative_to(math_root).as_posix() for path in fragments if path not in covered],
        "empty_fragments": empty,
        "missing_inputs": missing_inputs,
    }


def diagnostics(log: str) -> dict[str, list[str]]:
    patterns = {
        "missing_glyphs": r"^Missing character:.*$",
        "undefined_controls": r"^.*Undefined control sequence.*$",
        "undefined_references": r"^LaTeX Warning: (?:Reference|Citation).*undefined.*$",
        "duplicate_labels": r"^LaTeX Warning: Label .*multiply defined.*$",
        "structural_errors": r"^(?:! (?!==>).*|.*\.(?:tex|cls|sty):\d+: .*)$",
    }
    return {name: sorted(set(re.findall(pattern, log, re.MULTILINE))) for name, pattern in patterns.items()}


def fragment_document(entry: Path, fragment: Path) -> str:
    text = entry.read_text(encoding="utf-8")
    before, separator, _ = text.partition(r"\begin{document}")
    if not separator:
        raise ValueError(f"root context has no document body: {entry}")
    return (before + "\n\\begin{document}\n\\mainmatter\n"
            + '\\input{"' + fragment.as_posix() + '"}\n\\end{document}\n')


def compile_document(
    source: Path, course: Path, output: Path, *, root_context: Path | None = None,
    engine: str = "xelatex", timeout: int = 120,
) -> dict:
    source, course, output = source.resolve(), course.resolve(), output.resolve()
    if root_context is not None:
        root_context = root_context.resolve()
    output.mkdir(parents=True, exist_ok=True)
    for name in ("check.log", "check.pdf"):
        (output / name).unlink(missing_ok=True)
    target = source
    if root_context is not None:
        target = output / "fragment.tex"
        target.write_text(fragment_document(root_context, source), encoding="utf-8")
    environment = dict(os.environ)
    environment["TEXINPUTS"] = str(TOOLCHAIN / "latex") + os.pathsep + environment.get("TEXINPUTS", "")
    environment["max_print_line"] = "10000"
    command = [engine, "-interaction=nonstopmode", "-halt-on-error", "-file-line-error",
               "-no-shell-escape", "-recorder", "-synctex=0", "-jobname=check",
               "-output-directory=" + str(output), str(target)]
    runs = []
    timed_out = False
    for number in (1, 2):
        try:
            result = subprocess.run(command, cwd=course, env=environment,
                                    capture_output=True, text=True, encoding="utf-8",
                                    errors="replace", timeout=timeout, check=False)
            runs.append(result.returncode)
            (output / f"run-{number}.txt").write_text(result.stdout + result.stderr, encoding="utf-8")
        except subprocess.TimeoutExpired as error:
            timed_out = True
            stdout = error.stdout or b""
            stderr = error.stderr or b""
            if isinstance(stdout, bytes): stdout = stdout.decode("utf-8", "replace")
            if isinstance(stderr, bytes): stderr = stderr.decode("utf-8", "replace")
            (output / f"run-{number}.txt").write_text(stdout + stderr, encoding="utf-8")
            break
        if result.returncode:
            break
    log_path = output / "check.log"
    log = log_path.read_text(encoding="utf-8", errors="replace") if log_path.is_file() else ""
    findings = diagnostics(log)
    complete = runs == [0, 0] and not timed_out and (output / "check.pdf").is_file()
    failed = not complete or findings["undefined_controls"] or findings["missing_glyphs"] or findings["structural_errors"]
    warnings = findings["undefined_references"] or findings["duplicate_labels"]
    return {
        "source": source.relative_to(course).as_posix(), "course": course.name,
        "kind": "fragment" if root_context else "entry",
        "status": "failed" if failed else ("passed-with-warnings" if warnings else "passed"),
        "returncodes": runs, "timed_out": timed_out, "diagnostics": findings,
        "log": str(log_path), "output": str(output),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--course", action="append", default=[])
    parser.add_argument("--skip-course", action="append", default=[])
    parser.add_argument("--audit-only", action="store_true")
    parser.add_argument("--jobs", type=int, default=2)
    parser.add_argument("--timeout", type=int, default=120)
    parser.add_argument("--output", type=Path, default=REPO / "knowledge/build/native-tex/check")
    args = parser.parse_args()
    if args.jobs < 1 or args.timeout < 1:
        parser.error("--jobs and --timeout must be positive")
    output = args.output.resolve()
    allowed_roots = [(REPO / "knowledge/build").resolve(), Path(tempfile.gettempdir()).resolve(), Path("/tmp").resolve()]
    if not any(output.is_relative_to(path) for path in allowed_roots):
        parser.error("check output must be under knowledge/build or the system temporary tree")
    math_root = (REPO / "notes/math").resolve()
    courses = [course.name for course in math_root.iterdir() if course.is_dir() and course.name != "toolchain"
               and (not args.course or course.name in args.course) and course.name not in args.skip_course]
    unknown = sorted(set(args.course) - {course.name for course in math_root.iterdir() if course.is_dir()})
    if unknown:
        parser.error("unknown course: " + ", ".join(unknown))
    audit = audit_pairs(math_root, courses)
    results = []
    if not args.audit_only and not audit["missing_companions"]:
        entries = [math_root / name for name in audit["entries"]]
        jobs = [(entry, None) for entry in entries]
        for name in audit["uncovered_fragments"]:
            fragment = math_root / name
            roots = [entry for entry in entries if entry.parent == math_root / Path(name).parts[0]]
            roots.sort(key=lambda entry: (entry.stem != "main", entry.name))
            if not roots:
                raise ValueError(f"fragment has no course root context: {name}")
            jobs.append((fragment, roots[0]))
        source_hashes = {math_root / name: hashlib.sha256((math_root / name).read_bytes()).hexdigest()
                         for name in audit["entries"] + audit["uncovered_fragments"]}
        def compile_job(job):
            source, context = job
            relative = source.relative_to(math_root)
            course = math_root / relative.parts[0]
            result = compile_document(source, course, output / relative.with_suffix(""),
                                      root_context=context, timeout=args.timeout)
            print(result["status"], relative.as_posix(), flush=True)
            return result
        with ThreadPoolExecutor(max_workers=args.jobs) as pool:
            results = list(pool.map(compile_job, jobs))
        changed = [str(path) for path, digest in source_hashes.items()
                   if hashlib.sha256(path.read_bytes()).hexdigest() != digest]
        if changed:
            raise ValueError("source changed during check: " + ", ".join(changed))
    report = {"schema": "qlnotes-native-tex-check-v1", "audit": audit, "compiles": results}
    output.mkdir(parents=True, exist_ok=True)
    (output / "report.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"sources": audit["typst_sources"], "companions": audit["companions"],
                      "entries": len(audit["entries"]), "uncovered_fragments": len(audit["uncovered_fragments"]),
                      "failed": sum(result["status"] == "failed" for result in results),
                      "report": str(output / "report.json")}, ensure_ascii=False))
    return int(bool(audit["missing_companions"] or audit["missing_inputs"]
                    or any(result["status"] == "failed" for result in results)))


if __name__ == "__main__":
    raise SystemExit(main())
