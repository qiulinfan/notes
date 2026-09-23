#!/usr/bin/env python3
"""Replace legacy statement graph metadata with explicit global kn/ref markers."""

from __future__ import annotations

import argparse
import json
import re
import unicodedata
from dataclasses import dataclass
from pathlib import Path


FORMAL_KINDS = {
    "definition",
    "theorem",
    "lemma",
    "corollary",
    "proposition",
    "axiom",
}
CALL_RE = re.compile(
    r"#(?P<kind>definition|theorem|lemma|corollary|proposition|axiom|example)\s*\("
)
GENERIC_ID_RE = re.compile(
    r"^(?:definition|theorem|lemma|corollary|proposition|axiom|example)-\d+$"
)
PARAM_LINE_RE = re.compile(
    r"(?m)^[ \t]*(?P<key>id|concepts|depends|aliases):[^\n]*(?:\n|$)"
)
LOCAL_REF_RE = re.compile(r"@(?P<id>[A-Za-z0-9_-]+)")
LOCAL_LABEL_REF_RE = re.compile(
    r'#ref\(\s*label\("(?P<id>[A-Za-z0-9_-]+)"\)\s*\)'
)
OLD_KN_RE = re.compile(r'#kn\(\s*"(?P<id>[^"]+)"\s*\)\s*\[')
OLD_REF_RE = re.compile(r'#ref\(\s*"(?P<id>[^"]+)"\s*\)')

CANONICAL_IDS = {
    "0-0": "zero-integral-iff-zero-almost-everywhere",
    "a-s-m-absolutely-continuous-w-r-t-a-p-m": "absolute-continuity-of-signed-measures",
    "algera-sigma-algebra": "sigma-algebra",
    "addition-and-multiplication-measuability": "arithmetic-preserves-measurability",
    "assotiativity": "associativity-of-product-measure",
    "approximating-a-complex-valued-measurable-function-by-simple-fun": "simple-approximation-of-complex-measurable-functions",
    "c-c-0-mathbb-r-n-is-dense-in-l-p-mathbb-r-m-for-1-leq-p-infty": "density-of-compactly-supported-continuous-functions-in-lp",
    "cfb-and-cfa": "continuity-of-signed-measures",
    "chebyshev-s-inequality": "chebyshev-inequality",
    "chebyshevs-inequality": "chebyshev-inequality",
    "covariance-a-positive-semi-definite-symmetric-bilinear-f": "covariance-positive-semidefinite-bilinear-form",
    "dehavres-central-limit-theorem-for-binomial-distribution": "de-moivre-laplace-theorem",
    "discrete-and-continuous-independence-joint-density-is-product-of": "independence-via-joint-density-factorization",
    "dominated-convergence-theorem-dct": "dominated-convergence-theorem",
    "fatou-s-lemma": "fatou-lemma",
    "fatous-lemma": "fatou-lemma",
    "fubini-s-theorem": "fubini-theorem",
    "fubinis-theorem": "fubini-theorem",
    "fast-l-1-convergence-convergence-in-measure-subseq-a-e-convergen": "modes-of-convergence-for-functions",
    "gamma-distribution-independent-exponential-distribution-su": "gamma-as-sum-of-independent-exponentials",
    "hahn-kolmogrov-theorem": "hahn-kolmogorov-theorem",
    "h-lder-s-ineq": "holder-inequality",
    "jensens-inequality": "jensen-inequality",
    "integratal-restricted-to-a-measurable-set": "integral-restricted-to-a-measurable-set",
    "independence-of-random-variables-def-1-joint-distribution-is-pro": "independence-via-product-distribution",
    "independence-of-random-variables-def-2-conditional-distribution": "independence-via-conditional-distribution",
    "independence-of-random-variables-def-3-generated-sigma-algebras": "independence-via-generated-sigma-algebras",
    "joint-distribution-limit-behavior-marginal-distributio": "marginal-distribution-from-joint-limits",
    "l-2-0-omega-mathcal-f-mathbb-p-hilbert-space-with-covar": "centered-l2-hilbert-space-under-covariance",
    "lebesgue-differentition-theorem": "lebesgue-differentiation-theorem",
    "mincowski-s-ineq": "minkowski-inequality",
    "markovs-inequality": "markov-inequality",
    "monotone-convergence-theorem-mct": "monotone-convergence-theorem",
    "tonnelis-theorem": "tonelli-theorem",
    "tonelli": "tonelli-theorem",
    "open-intervals-can-substitute-for-h-intervals-when-computing-mea": "open-interval-covers-for-lebesgue-stieltjes-measure",
    "rv": "modes-of-convergence-for-random-variables",
    "vitali-type-convering-lemma": "vitali-covering-lemma",
    "zero-centered-square-integrable-random-variables-l-2-0-omega-mat": "centered-square-integrable-random-variables",
}


class MigrationError(RuntimeError):
    pass


@dataclass
class Occurrence:
    path: Path
    kind: str
    title_start: int
    title_end: int
    title: str
    node_id: str | None
    attr_spans: list[tuple[int, int]]
    markable: bool
    role: str | None = None


def find_matching(text: str, start: int, opening: str, closing: str) -> int:
    if start >= len(text) or text[start] != opening:
        raise MigrationError(f"expected {opening!r} at offset {start}")
    depth = 0
    content_depth = 0
    quote: str | None = None
    escaped = False
    for index in range(start, len(text)):
        character = text[index]
        if quote is not None:
            if escaped:
                escaped = False
            elif character == "\\":
                escaped = True
            elif character == quote:
                quote = None
            continue
        if character == '"' and (index == 0 or text[index - 1] != "\\"):
            quote = character
            continue
        if opening == "(" and character == "[" and (index == 0 or text[index - 1] != "\\"):
            content_depth += 1
            continue
        if opening == "(" and character == "]" and (index == 0 or text[index - 1] != "\\"):
            content_depth = max(0, content_depth - 1)
            continue
        if content_depth > 0:
            continue
        if character == opening and (index == 0 or text[index - 1] != "\\"):
            depth += 1
        elif character == closing and (index == 0 or text[index - 1] != "\\"):
            depth -= 1
            if depth == 0:
                return index
    raise MigrationError(f"unclosed {opening!r} starting at offset {start}")


def slug(value: str) -> str:
    value = unicodedata.normalize("NFKC", value).lower()
    value = value.replace("σ", "sigma").replace("π", "pi").replace("λ", "lambda")
    value = re.sub(r"[^a-z0-9]+", "-", value).strip("-")
    return value[:120].rstrip("-")


def plain_title(value: str) -> str:
    value = re.sub(r"#(?:strong|emph|text)\[", "", value)
    value = value.replace("$", "").replace("\\", "")
    value = re.sub(r"[#\[\]{}()]", " ", value)
    value = re.sub(r"\s+", " ", value).strip(" ,:;")
    return value


def inside(path: Path, roots: list[Path]) -> bool:
    resolved = path.resolve()
    return any(resolved == root or root in resolved.parents for root in roots)


def collect_files(paths: list[Path]) -> list[Path]:
    files: set[Path] = set()
    for path in paths:
        resolved = path.resolve()
        if resolved.is_file() and resolved.suffix == ".typ":
            files.add(resolved)
        elif resolved.is_dir():
            files.update(
                candidate.resolve()
                for candidate in resolved.rglob("*.typ")
                if not {"build", "exports"}.intersection(candidate.parts)
            )
        else:
            raise MigrationError(f"missing Typst path: {path}")
    return sorted(files, key=lambda item: item.as_posix())


def parse_occurrences(
    path: Path,
    mark_roots: list[Path],
    referenced_ids: set[str],
) -> list[Occurrence]:
    text = path.read_text(encoding="utf-8")
    result: list[Occurrence] = []
    for match in CALL_RE.finditer(text):
        kind = match.group("kind")
        open_paren = match.end() - 1
        try:
            close_paren = find_matching(text, open_paren, "(", ")")
        except MigrationError as error:
            raise MigrationError(f"{path}: {error}") from error
        params_start = open_paren + 1
        params = text[params_start:close_paren]
        legacy_id_match = re.search(r'(?m)^[ \t]*id:\s*"([^"]+)"', params)
        legacy_id = legacy_id_match.group(1) if legacy_id_match else None
        attrs = []
        for item in PARAM_LINE_RE.finditer(params):
            if item.group("key") == "id" and legacy_id in referenced_ids:
                continue
            attrs.append((params_start + item.start(), params_start + item.end()))
        title_match = re.search(r"(?m)^[ \t]*title:\s*\[", params)
        if title_match is None:
            result.append(Occurrence(path, kind, -1, -1, "", None, attrs, False))
            continue
        title_open = params_start + title_match.end() - 1
        try:
            title_close = find_matching(text, title_open, "[", "]")
        except MigrationError as error:
            raise MigrationError(f"{path}: {error}") from error
        title = text[title_open + 1 : title_close]
        concept_match = re.search(r'concepts:\s*\(\s*"([^"]+)"', params)
        candidate = concept_match.group(1) if concept_match else ""
        title_text = plain_title(title)
        meaningful = (
            kind in FORMAL_KINDS
            and inside(path, mark_roots)
            and title_text.lower() not in FORMAL_KINDS
            and title_text != ""
            and re.search(r"\b(?:exercise|problem)\s+\d+\b", title_text, re.I) is None
            and re.search(r"#(?:kn|ref)(?:\(|\[)", title) is None
        )
        if not candidate or GENERIC_ID_RE.fullmatch(candidate):
            candidate = slug(title_text)
        candidate = CANONICAL_IDS.get(candidate, candidate)
        candidate = slug(candidate)
        result.append(
            Occurrence(
                path,
                kind,
                title_open + 1,
                title_close,
                title,
                candidate if meaningful and candidate else None,
                attrs,
                meaningful,
            )
        )
    return result


def assign_roles(occurrences: list[Occurrence]) -> None:
    owners: dict[str, Occurrence] = {}
    for occurrence in occurrences:
        if not occurrence.markable or occurrence.node_id is None:
            continue
        owner = owners.get(occurrence.node_id)
        if owner is None:
            occurrence.role = "kn"
            owners[occurrence.node_id] = occurrence
        else:
            occurrence.role = "ref"
            occurrence.title = owner.title


def rewrite(path: Path, occurrences: list[Occurrence], write: bool) -> bool:
    text = path.read_text(encoding="utf-8")
    replacements: list[tuple[int, int, str]] = []
    for occurrence in occurrences:
        replacements.extend((start, end, "") for start, end in occurrence.attr_spans)
        if occurrence.role and occurrence.node_id:
            marker = f'#{occurrence.role}[{occurrence.title}]'
            replacements.append((occurrence.title_start, occurrence.title_end, marker))
    updated = text
    for start, end, value in sorted(replacements, reverse=True):
        updated = updated[:start] + value + updated[end:]
    changed = updated != text
    if changed and write:
        path.write_text(updated, encoding="utf-8")
    return changed


def upgrade_name_api(files: list[Path], write: bool) -> tuple[set[Path], int]:
    names: dict[str, str] = {}
    for path in files:
        text = path.read_text(encoding="utf-8")
        for match in OLD_KN_RE.finditer(text):
            close = find_matching(text, match.end() - 1, "[", "]")
            name = text[match.end() : close]
            existing = names.get(match.group("id"))
            if existing is not None and existing != name:
                raise MigrationError(
                    f"conflicting names for knowledge id {match.group('id')!r}"
                )
            names[match.group("id")] = name

    changed: set[Path] = set()
    upgraded = 0
    for path in files:
        text = path.read_text(encoding="utf-8")
        replacements: list[tuple[int, int, str]] = []
        for match in OLD_KN_RE.finditer(text):
            close = find_matching(text, match.end() - 1, "[", "]")
            replacements.append(
                (match.start(), close + 1, f"#kn[{text[match.end() : close]}]")
            )
        for match in OLD_REF_RE.finditer(text):
            name = names.get(match.group("id"))
            if name is None:
                raise MigrationError(
                    f"#ref points to an unknown knowledge name: {match.group('id')!r}"
                )
            end = match.end()
            cursor = end
            while cursor < len(text) and text[cursor].isspace():
                cursor += 1
            if cursor < len(text) and text[cursor] == "[":
                end = find_matching(text, cursor, "[", "]") + 1
            replacements.append((match.start(), end, f"#ref[{name}]"))
        if not replacements:
            continue
        updated = text
        for start, end, value in sorted(replacements, reverse=True):
            updated = updated[:start] + value + updated[end:]
        if updated != text:
            changed.add(path)
            upgraded += len(replacements)
            if write:
                path.write_text(updated, encoding="utf-8")
    return changed, upgraded


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--clean",
        action="append",
        required=True,
        type=Path,
        help="Typst file or directory whose legacy statement metadata is removed",
    )
    parser.add_argument(
        "--mark",
        action="append",
        required=True,
        type=Path,
        help="file or directory where meaningful formal titles become kn/ref markers",
    )
    parser.add_argument("--write", action="store_true", help="apply the migration")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    try:
        mark_roots = [path.resolve() for path in args.mark]
        files = collect_files(args.clean)
        referenced_ids = {
            match.group("id")
            for path in files
            for match in LOCAL_REF_RE.finditer(path.read_text(encoding="utf-8"))
        }
        referenced_ids.update(
            match.group("id")
            for path in files
            for match in LOCAL_LABEL_REF_RE.finditer(path.read_text(encoding="utf-8"))
        )
        by_path = {
            path: parse_occurrences(path, mark_roots, referenced_ids)
            for path in files
        }
        occurrences = [item for path in files for item in by_path[path]]
        assign_roles(occurrences)
        changed = {
            path for path in files if rewrite(path, by_path[path], write=args.write)
        }
        upgraded_paths, upgraded = upgrade_name_api(files, write=args.write)
        changed.update(upgraded_paths)
        report = {
            "mode": "write" if args.write else "dry-run",
            "files": len(files),
            "changed_files": len(changed),
            "knowledge_nodes": sum(item.role == "kn" for item in occurrences),
            "references": sum(item.role == "ref" for item in occurrences),
            "upgraded_name_markers": upgraded,
            "unmarked_formal_statements": sum(
                item.kind in FORMAL_KINDS and item.role is None for item in occurrences
            ),
            "removed_legacy_attributes": sum(
                len(item.attr_spans) for item in occurrences
            ),
        }
        print(json.dumps(report, ensure_ascii=False, indent=2))
    except (MigrationError, OSError, UnicodeError) as error:
        print(f"knowledge marker migration failed: {error}")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
