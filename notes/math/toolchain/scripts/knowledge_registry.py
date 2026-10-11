#!/usr/bin/env python3
"""Generate the public knowledge-marker JSON registry from authored TeX notes.

LaTeX sources define names with ``\\kn{...}`` and refer to them with
``\\knref{...}``. IDs come from knowledge-ids.json or the stable slug rule.
Only published courses contribute public anchors. All courses contribute marker
rows for direct LaTeX HTML export. Explicit map aliases retain existing links.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
import unicodedata
from dataclasses import dataclass
from pathlib import Path
from typing import NamedTuple


TOOLCHAIN = Path(__file__).resolve().parents[1]
REPO_ROOT = TOOLCHAIN.parents[2]
COURSES = Path("courses.json")
KNOWLEDGE_IDS = Path("notes/math/toolchain/knowledge-ids.json")
REGISTRY_JSON = Path("notes/math/toolchain/generated/knowledge-registry.json")
REGISTRY_SCHEMA = "notes-knowledge-registry-v1"
ID_RE = re.compile(r"[a-z0-9]+(?:-[a-z0-9]+)*")
LATEX_MARKER_RE = re.compile(r"\\(?P<command>knref|kn)\s*\{")
GREEK_NAMES = {"σ": " sigma ", "π": " pi ", "λ": " lambda ", "μ": " mu ", "ρ": " rho ", "ω": " omega "}
# TeX whose content is literal or inactive, so it holds no knowledge markers.
LITERAL_ENVIRONMENTS = frozenset({
    "verbatim", "verbatim*", "Verbatim", "BVerbatim", "LVerbatim", "SaveVerbatim",
    "lstlisting", "minted", "comment", "filecontents", "filecontents*", "luacode", "luacode*",
})
INLINE_LITERALS = frozenset({"verb", "Verb", "lstinline", "mintinline"})
CONDITIONALS = frozenset({
    "if", "ifcat", "ifnum", "ifdim", "ifodd", "ifvmode", "ifhmode", "ifmmode",
    "ifinner", "ifvoid", "ifhbox", "ifvbox", "ifx", "ifeof", "iftrue", "iffalse",
    "ifcase", "ifdefined", "ifcsname", "iffontchar",
})
COMMAND_DEFINITIONS = frozenset({
    "newcommand", "renewcommand", "providecommand", "DeclareRobustCommand", "DeclareMathOperator",
})
ENVIRONMENT_DEFINITIONS = frozenset({"newenvironment", "renewenvironment", "provideenvironment"})
DOCUMENT_COMMAND_DEFINITIONS = frozenset({
    "NewDocumentCommand", "RenewDocumentCommand", "ProvideDocumentCommand", "DeclareDocumentCommand",
})
DOCUMENT_ENVIRONMENT_DEFINITIONS = frozenset({
    "NewDocumentEnvironment", "RenewDocumentEnvironment", "ProvideDocumentEnvironment",
    "DeclareDocumentEnvironment",
})
PRIMITIVE_DEFINITIONS = frozenset({"def", "gdef", "edef", "xdef"})
DEFINITIONS = (
    COMMAND_DEFINITIONS | ENVIRONMENT_DEFINITIONS | DOCUMENT_COMMAND_DEFINITIONS
    | DOCUMENT_ENVIRONMENT_DEFINITIONS | PRIMITIVE_DEFINITIONS
)


class RegistryError(RuntimeError):
    pass


@dataclass(frozen=True)
class Definition:
    spelling: str
    id: str
    url: str
    source: str


class Registry(NamedTuple):
    entries: list[tuple[Definition, list[str]]]
    latex_rows: list[dict[str, str]]
    latex_problems: list[str]


def slug(value: str) -> str:
    normalized = unicodedata.normalize("NFKC", value).casefold()
    normalized = (
        normalized.replace("σ", " sigma ").replace("π", " pi ").replace("λ", " lambda ")
    )
    return re.sub(r"[^a-z0-9]+", "-", normalized).strip("-")[:120].rstrip("-")


def identity_key(value: str) -> str:
    """Compare spellings up to case, Unicode compatibility, Greek names and whitespace.

    The homepage notes dock applies the same rule to Markdown ``[[X]]`` references.
    """
    normalized = unicodedata.normalize("NFKC", value).casefold()
    for symbol, name in GREEK_NAMES.items():
        normalized = normalized.replace(symbol, name)
    return re.sub(r"\s+", " ", normalized).strip()


def tex_error(text: str, position: int, message: str) -> RegistryError:
    return RegistryError(f"{message} at line {text.count(chr(10), 0, position) + 1}")


def tex_command(text: str, position: int) -> tuple[str, int]:
    """Read the control word or control symbol whose backslash is at ``position``."""
    cursor = position + 1
    if cursor >= len(text):
        return "", cursor
    if not (text[cursor].isascii() and (text[cursor].isalpha() or text[cursor] == "@")):
        return text[cursor], cursor + 1
    while cursor < len(text) and text[cursor].isascii() and (text[cursor].isalpha() or text[cursor] == "@"):
        cursor += 1
    return text[position + 1:cursor], cursor


def comment_end(text: str, position: int) -> int:
    end = text.find("\n", position)
    return len(text) if end < 0 else end


def skip_trivia(text: str, position: int) -> int:
    while position < len(text):
        if text[position].isspace():
            position += 1
        elif text[position] == "%":
            position = comment_end(text, position)
        else:
            break
    return position


def tex_group_end(
    text: str, start: int, opening: str = "{", closing: str = "}", *, literals: bool = True,
) -> int:
    """Return the delimiter closing the TeX group opened at ``start``.

    Escaped delimiters, comments and inline literals cannot change the depth;
    braces inside an optional ``[...]`` argument hide its brackets.
    """
    if start >= len(text) or text[start] != opening:
        raise tex_error(text, min(start, len(text)), f"expected {opening!r}")
    depth = 1
    braces = 0
    cursor = start + 1
    while cursor < len(text):
        character = text[cursor]
        if literals and character == "%":
            cursor = comment_end(text, cursor)
            continue
        if character == "\\":
            name, cursor = tex_command(text, cursor)
            if literals and name in INLINE_LITERALS:
                cursor = inline_literal_end(text, cursor, name)
            continue
        if opening == "[" and character == "{":
            braces += 1
        elif opening == "[" and character == "}" and braces:
            braces -= 1
        elif not braces and character == opening:
            depth += 1
        elif not braces and character == closing:
            depth -= 1
            if depth == 0:
                return cursor
        cursor += 1
    raise tex_error(text, start, f"unclosed TeX group {opening!r}")


def required_group_end(text: str, position: int) -> int:
    """Return the offset after the ``{...}`` argument at ``position``."""
    return tex_group_end(text, skip_trivia(text, position)) + 1


def optional_arguments_end(text: str, position: int) -> int:
    cursor = skip_trivia(text, position)
    while cursor < len(text) and text[cursor] == "[":
        cursor = skip_trivia(text, tex_group_end(text, cursor, "[", "]") + 1)
    return cursor


def inline_literal_end(text: str, position: int, name: str) -> int:
    """Return the offset after the argument of ``\\verb``-like commands."""
    cursor = position + 1 if text.startswith("*", position) else position
    if name in {"lstinline", "mintinline"}:
        cursor = optional_arguments_end(text, cursor)
    if name == "mintinline":
        cursor = skip_trivia(text, required_group_end(text, cursor))  # language
    if cursor >= len(text) or text[cursor] in "\r\n":
        raise tex_error(text, position, f"missing delimiter for \\{name}")
    if name in {"lstinline", "mintinline"} and text[cursor] == "{":
        return tex_group_end(text, cursor, literals=False) + 1
    end = text.find(text[cursor], cursor + 1)
    newline = text.find("\n", cursor + 1)
    if end < 0 or 0 <= newline < end:
        raise tex_error(text, cursor, f"unclosed \\{name} literal")
    return end + 1


def definition_end(text: str, position: int, name: str) -> int:
    """Return the offset after a macro or environment definition's replacement text."""
    cursor = skip_trivia(text, position)
    if text.startswith("*", cursor):
        cursor = skip_trivia(text, cursor + 1)
    if name in PRIMITIVE_DEFINITIONS:
        if not text.startswith("\\", cursor):
            raise tex_error(text, cursor, f"expected a macro name after \\{name}")
        _, cursor = tex_command(text, cursor)
        while cursor < len(text) and text[cursor] != "{":  # parameter text
            if text[cursor] == "%":
                cursor = comment_end(text, cursor)
            elif text[cursor] == "\\":
                _, cursor = tex_command(text, cursor)
            else:
                cursor += 1
        return tex_group_end(text, cursor) + 1
    commands = COMMAND_DEFINITIONS | DOCUMENT_COMMAND_DEFINITIONS
    if name in commands and text.startswith("\\", cursor):
        _, cursor = tex_command(text, cursor)
    else:
        cursor = required_group_end(text, cursor)
    if name in DOCUMENT_COMMAND_DEFINITIONS | DOCUMENT_ENVIRONMENT_DEFINITIONS:
        cursor = required_group_end(text, cursor)  # argument specification
    else:
        cursor = optional_arguments_end(text, cursor)
    cursor = required_group_end(text, cursor)
    if name in ENVIRONMENT_DEFINITIONS | DOCUMENT_ENVIRONMENT_DEFINITIONS:
        cursor = required_group_end(text, cursor)
    return cursor


def false_branch_end(text: str, position: int, conditionals: set[str]) -> int:
    """Return the offset after the ``\\else`` or ``\\fi`` ending an ``\\iffalse`` branch."""
    depth = 1
    cursor = position
    while cursor < len(text):
        if text[cursor] == "%":
            cursor = comment_end(text, cursor)
        elif text[cursor] == "\\":
            name, cursor = tex_command(text, cursor)
            if name in conditionals:
                depth += 1
            elif name == "fi":
                depth -= 1
                if depth == 0:
                    return cursor
            elif name == "else" and depth == 1:
                return cursor
        else:
            cursor += 1
    raise tex_error(text, position, "unclosed \\iffalse")


def inert_end(text: str, start: int, name: str, position: int, conditionals: set[str]) -> int | None:
    """Return where the inert construct begun by ``\\name`` at ``start`` ends, if it is one.

    ``position`` follows the command name. ``\\newif`` declarations extend
    ``conditionals`` so inactive branches nest correctly.
    """
    if name == "newif":
        declared = skip_trivia(text, position)
        if text.startswith("\\", declared):
            conditional, _ = tex_command(text, declared)
            if conditional.startswith("if"):
                conditionals.add(conditional)
    elif name == "begin":
        group = skip_trivia(text, position)
        environment = text[group + 1:tex_group_end(text, group)].strip()
        if environment in LITERAL_ENVIRONMENTS:
            closing = re.compile(r"\\end\s*\{\s*" + re.escape(environment) + r"\s*\}")
            match = closing.search(text, group)
            if match is None:
                raise tex_error(text, start, f"unclosed literal environment {environment!r}")
            return match.end()
    elif name in INLINE_LITERALS:
        return inline_literal_end(text, position, name)
    elif name == "iffalse":
        return false_branch_end(text, position, conditionals)
    elif name in DEFINITIONS:
        return definition_end(text, position, name)
    return None


def mask_tex(text: str) -> tuple[str, list[str]]:
    """Blank TeX that cannot hold knowledge markers, keeping offsets and line breaks.

    Comments, literal environments, inline literals, inactive ``\\iffalse``
    branches and macro or environment definitions are blanked. A construct that
    does not parse stays visible and is returned as a problem.
    """
    result = list(text)
    problems: list[str] = []
    conditionals = set(CONDITIONALS)

    def hide(start: int, end: int) -> None:
        for index in range(start, end):
            if text[index] not in "\r\n":
                result[index] = " "

    cursor = 0
    while cursor < len(text):
        if text[cursor] == "%":
            end = comment_end(text, cursor)
            hide(cursor, end)
            cursor = end
            continue
        if text[cursor] != "\\":
            cursor += 1
            continue
        name, end = tex_command(text, cursor)
        try:
            inert = inert_end(text, cursor, name, end, conditionals)
        except RegistryError as error:
            problems.append(str(error))
            inert = None
        if inert is not None:
            hide(cursor, inert)
            end = inert
        cursor = end
    return "".join(result), problems


def load_courses(repo_root: Path) -> list[dict]:
    path = repo_root / COURSES
    data = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(data, dict) or data.get("schema") != "notes-courses-v1":
        raise RegistryError(f"{COURSES} must use schema notes-courses-v1")
    courses = data.get("courses")
    if not isinstance(courses, list):
        raise RegistryError(f"{COURSES} must list courses")
    return courses


def load_knowledge_ids(repo_root: Path) -> dict[str, str]:
    data = json.loads((repo_root / KNOWLEDGE_IDS).read_text(encoding="utf-8"))
    if not isinstance(data, dict) or not all(
        isinstance(key, str) and key.strip() and isinstance(value, str)
        for key, value in data.items()
    ):
        raise RegistryError(f"{KNOWLEDGE_IDS} must map marker spellings to IDs")
    for spelling, node_id in data.items():
        if not ID_RE.fullmatch(node_id):
            raise RegistryError(f"invalid knowledge ID {node_id!r} for {spelling!r} in {KNOWLEDGE_IDS}")
    return data


def course_files(repo_root: Path, course: dict, suffix: str) -> list[Path]:
    root = repo_root / course["root"]
    found: dict[Path, None] = {}
    for pattern in course["files"]:
        for path in sorted(root.glob(pattern)):
            if path.is_file() and path.suffix == suffix:
                found.setdefault(path, None)
    return list(found)


def definition_id(spelling: str, ids: dict[str, str], source: str) -> str:
    node_id = ids.get(spelling) or slug(spelling)
    if not node_id:
        raise RegistryError(
            f"{source}: knowledge marker {spelling!r} has no slug; add its ID to {KNOWLEDGE_IDS}"
        )
    if not ID_RE.fullmatch(node_id):
        raise RegistryError(f"{source}: invalid knowledge ID {node_id!r}")
    return node_id


def unique_definitions(definitions: list[Definition], kind: str) -> tuple[dict[str, Definition], list[str]]:
    """Index definitions by spelling; a duplicate spelling or ID is a problem and is skipped."""
    by_spelling: dict[str, Definition] = {}
    by_id: dict[str, Definition] = {}
    problems: list[str] = []
    for definition in definitions:
        if definition.spelling in by_spelling:
            problems.append(
                f"duplicate {kind} knowledge definition {definition.spelling!r} in "
                f"{by_spelling[definition.spelling].source} and {definition.source}"
            )
        elif definition.id in by_id:
            problems.append(
                f"duplicate {kind} knowledge ID {definition.id!r} for "
                f"{by_id[definition.id].spelling!r} ({by_id[definition.id].source}) and "
                f"{definition.spelling!r} ({definition.source})"
            )
        else:
            by_spelling[definition.spelling] = definition
            by_id[definition.id] = definition
    return by_spelling, problems


def scan_latex(
    repo_root: Path, courses: list[dict], ids: dict[str, str]
) -> tuple[list[Definition], list[tuple[str, str]], list[str]]:
    """Return LaTeX definitions, references and marker problems of every course."""
    definitions: list[Definition] = []
    references: list[tuple[str, str]] = []
    problems: list[str] = []
    for course in courses:
        for path in course_files(repo_root, course, ".tex"):
            source = path.relative_to(repo_root).as_posix()
            text = path.read_text(encoding="utf-8")
            active, masked = mask_tex(text)
            problems += [f"{source}: {problem}" for problem in masked]
            for match in LATEX_MARKER_RE.finditer(active):
                cursor = match.start()
                while cursor > 0 and active[cursor - 1] == "\\":
                    cursor -= 1
                if (match.start() - cursor) % 2:
                    continue  # ``\\kn{`` is a line break followed by text
                try:
                    close = tex_group_end(active, match.end() - 1)
                except RegistryError as error:
                    problems.append(f"{source}: {error}")
                    continue
                spelling = text[match.end():close]
                if match.group("command") == "knref":
                    references.append((spelling, source))
                    continue
                try:
                    node_id = definition_id(spelling, ids, source)
                except RegistryError as error:
                    problems.append(str(error))
                    continue
                definitions.append(Definition(spelling, node_id, f"{course['web']}/#kn-{node_id}", source))
    return definitions, references, problems


def build(repo_root: Path) -> Registry:
    courses = load_courses(repo_root)
    ids = load_knowledge_ids(repo_root)
    definitions, references, problems = scan_latex(repo_root, courses, ids)
    defined = {definition.id for definition in definitions}
    for spelling, node_id in sorted(ids.items()):
        if node_id not in defined:
            raise RegistryError(
                f"stale entry in {KNOWLEDGE_IDS}: {spelling!r} -> {node_id!r} names no definition"
            )

    latex, duplicates = unique_definitions(definitions, "LaTeX")
    problems += duplicates
    rows: dict[str, dict[str, str]] = {
        definition.spelling: {"name": definition.spelling, "id": definition.id, "url": definition.url}
        for definition in latex.values()
    }
    by_id = {definition.id: definition for definition in latex.values()}
    for spelling, node_id in sorted(ids.items()):
        target = by_id.get(node_id)
        if target is not None:
            rows.setdefault(spelling, {"name": spelling, "id": target.id, "url": target.url})
    for spelling, source in references:
        if spelling in rows:
            continue
        target = by_id.get(slug(spelling))
        if target is None:
            problems.append(f"{source}: unresolved LaTeX knowledge reference {spelling!r}")
            continue
        rows[spelling] = {"name": spelling, "id": target.id, "url": target.url}

    published_sources = {
        path.relative_to(repo_root).as_posix()
        for course in courses if course.get("publish")
        for path in course_files(repo_root, course, ".tex")
    }
    public, public_problems = unique_definitions(
        [definition for definition in definitions if definition.source in published_sources], "LaTeX"
    )
    if public_problems:
        raise RegistryError("\n".join(public_problems))
    names: dict[str, list[str]] = {}
    for row in rows.values():
        names.setdefault(row["id"], []).append(row["name"])
    entries = [
        (definition, [definition.spelling, *sorted(
            name for name in names.get(definition.id, []) if name != definition.spelling
        )])
        for definition in sorted(public.values(), key=lambda item: item.id)
    ]
    return Registry(entries, sorted(rows.values(), key=lambda row: (row["id"], row["name"])),
                    list(dict.fromkeys(problems)))


def registry_json(entries: list[tuple[Definition, list[str]]]) -> str:
    """Return public anchors as JSON for the homepage Markdown reference resolver."""
    payload = {
        "schema": REGISTRY_SCHEMA,
        "entries": [
            {"names": names, "id": definition.id, "url": definition.url}
            for definition, names in entries
        ],
    }
    return json.dumps(payload, ensure_ascii=False, indent=2) + "\n"


def latex_markers(repo_root: Path) -> list[dict[str, str]]:
    """Return ``{name, id, url}`` rows for every LaTeX marker spelling.

    Unlike the registry commands, this fails on any LaTeX marker problem, so
    the HTML converter never receives incomplete markers.
    """
    registry = build(repo_root.resolve())
    if registry.latex_problems:
        raise RegistryError("\n".join(registry.latex_problems))
    return registry.latex_rows


def parse_args(argv: list[str] | None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--repo-root", type=Path, default=REPO_ROOT)
    parser.add_argument("--check", action="store_true", help="fail when the committed registry is stale")
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = parse_args(argv)
    repo_root = args.repo_root.resolve()
    try:
        entries, _, latex_problems = build(repo_root)
        outputs = {REGISTRY_JSON: registry_json(entries)}
    except (RegistryError, OSError, ValueError, KeyError) as error:
        print(f"knowledge registry: {error}", file=sys.stderr)
        return 1
    for problem in latex_problems:
        print(
            f"knowledge registry: warning: {problem}; the LaTeX web export fails until it is fixed",
            file=sys.stderr,
        )
    if args.check:
        stale = [
            relative for relative, text in outputs.items()
            if not (repo_root / relative).is_file()
            or (repo_root / relative).read_text(encoding="utf-8") != text
        ]
        for relative in stale:
            print(
                f"knowledge registry: {relative} is stale; run `make knowledge-registry`",
                file=sys.stderr,
            )
        if stale:
            return 1
        print(f"knowledge registry: {len(entries)} LaTeX entries are current")
        return 0
    for relative, text in outputs.items():
        output = repo_root / relative
        output.parent.mkdir(parents=True, exist_ok=True)
        temporary = output.with_name(output.name + ".tmp")
        temporary.write_text(text, encoding="utf-8")
        temporary.replace(output)
    print(f"knowledge registry: wrote {len(entries)} LaTeX entries to {REGISTRY_JSON}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
