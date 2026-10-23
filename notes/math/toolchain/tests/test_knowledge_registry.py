from __future__ import annotations

import contextlib
import io
import json
import sys
import tempfile
import unittest
from pathlib import Path


TOOLCHAIN = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(TOOLCHAIN / "scripts"))
import knowledge_registry
from knowledge_registry import RegistryError


class KnowledgeRegistryTest(unittest.TestCase):
    def setUp(self) -> None:
        self.temporary = tempfile.TemporaryDirectory(prefix="qlnotes-knowledge-registry-")
        self.repo = Path(self.temporary.name).resolve()
        self.courses = [
            {
                "id": "math:measure", "title": "Measure", "description": "Fixture.",
                "subject": "math", "course": "measure", "root": "notes/math/measure",
                "files": ["main.tex", "chapters/*.tex"],
                "fields": [], "topics": [], "publish": True, "listed": True,
                "web": "https://example.test/notes/math/measure",
            },
            {
                "id": "math:draft", "title": "Draft", "description": "Fixture.",
                "subject": "math", "course": "draft", "root": "notes/math/draft",
                "files": ["*.tex"],
                "fields": [], "topics": [], "publish": False, "listed": False,
                "web": "https://example.test/notes/math/draft",
            },
        ]
        self.write("courses.json", json.dumps({"schema": "notes-courses-v1", "fields": [], "courses": self.courses}))
        self.ids: dict[str, str] = {}
        self.write_ids()

    def tearDown(self) -> None:
        self.temporary.cleanup()

    def write(self, relative: str, text: str) -> Path:
        path = self.repo / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8")
        return path

    def write_ids(self) -> None:
        self.write(str(knowledge_registry.KNOWLEDGE_IDS), json.dumps(self.ids, ensure_ascii=False))

    def entries(self) -> dict[str, tuple[list[str], str]]:
        entries = knowledge_registry.build(self.repo).entries
        return {definition.id: (names, definition.url) for definition, names in entries}

    def run_main(self, *arguments: str) -> tuple[int, str]:
        stream = io.StringIO()
        with contextlib.redirect_stdout(stream), contextlib.redirect_stderr(stream):
            status = knowledge_registry.main(["--repo-root", str(self.repo), *arguments])
        return status, stream.getvalue()

    def test_public_tex_anchors_keep_mapped_ids_and_aliases(self) -> None:
        self.write("notes/math/measure/main.tex", "\\kn{$\\sigma$-algebra} \\kn{measure space}\n")
        self.write("notes/math/draft/main.tex", "\\kn{draft concept}\n")
        self.ids = {"$\\sigma$-algebra": "sigma-algebra", "$sigma$-algebra": "sigma-algebra",
                    "sigma algebra": "sigma-algebra"}
        self.write_ids()
        self.assertEqual(["measure-space", "sigma-algebra"], sorted(self.entries()))
        self.assertEqual(["$\\sigma$-algebra", "$sigma$-algebra", "sigma algebra"],
                         self.entries()["sigma-algebra"][0])
        self.assertEqual("https://example.test/notes/math/measure/#kn-sigma-algebra",
                         self.entries()["sigma-algebra"][1])
        self.assertEqual("lambda-system", knowledge_registry.slug("λ-system"))

    def test_json_freshness_tracks_tex_changes(self) -> None:
        self.write("notes/math/measure/main.tex", "\\kn{measure space}\n")
        self.assertEqual(1, self.run_main("--check")[0])
        self.assertEqual(0, self.run_main()[0])
        self.assertEqual(0, self.run_main("--check")[0])
        self.write("notes/math/measure/main.tex", "\\kn{outer measure}\n")
        self.assertEqual(1, self.run_main("--check")[0])
        self.assertEqual(0, self.run_main()[0])
        payload = json.loads((self.repo / knowledge_registry.REGISTRY_JSON).read_text())
        self.assertEqual(["outer-measure"], [entry["id"] for entry in payload["entries"]])

    def test_duplicate_public_ids_fail(self) -> None:
        self.write("notes/math/measure/main.tex", "\\kn{measure space} \\kn{Measure Space}\n")
        with self.assertRaisesRegex(RegistryError, "duplicate LaTeX knowledge ID"):
            knowledge_registry.build(self.repo)

    def test_stale_map_fails(self) -> None:
        self.ids = {"removed spelling": "removed-id"}
        self.write_ids()
        with self.assertRaisesRegex(RegistryError, "stale entry"):
            knowledge_registry.build(self.repo)

    def test_latex_markers_cover_every_course_and_resolve_references(self) -> None:
        self.write("notes/math/measure/main.tex", (
            "\\kn{measure space}\n"
            "\\kn{$\\sigma$-algebra}\n"
            "\\knref{measure space} \\knref{Measure Space} \\knref{sigma algebra}\n"
        ))
        self.write("notes/math/draft/notes.tex", "\\kn{draft concept} \\knref{measure space}\n")
        self.ids = {"sigma algebra": "sigma-algebra"}
        self.write_ids()
        measure = "https://example.test/notes/math/measure/#kn-"
        self.assertEqual([
            {"name": "draft concept", "id": "draft-concept", "url": "https://example.test/notes/math/draft/#kn-draft-concept"},
            {"name": "Measure Space", "id": "measure-space", "url": measure + "measure-space"},
            {"name": "measure space", "id": "measure-space", "url": measure + "measure-space"},
            {"name": "$\\sigma$-algebra", "id": "sigma-algebra", "url": measure + "sigma-algebra"},
            {"name": "sigma algebra", "id": "sigma-algebra", "url": measure + "sigma-algebra"},
        ], knowledge_registry.latex_markers(self.repo))

    def test_tex_comments_hide_markers(self) -> None:
        self.write("notes/math/measure/main.tex", (
            "% \\kn{commented definition}\n"
            "100\\% \\kn{measure space} % \\knref{missing}\n"
            "\\\\kn{not a marker}\n"
        ))
        self.assertEqual(["measure space"], [row["name"] for row in knowledge_registry.latex_markers(self.repo)])

    def test_a_bracketed_name_defines_it_whatever_the_text_shows(self) -> None:
        self.write("notes/math/measure/main.tex", (
            "\\kn[measure space]{} A triple.\n"
            "\\kn [outer measure] {the outer measure of a set}\n"
            "\\knref{outer measure}\n"
        ))
        self.assertEqual(
            [("measure space", "measure-space"), ("outer measure", "outer-measure")],
            [(row["name"], row["id"]) for row in knowledge_registry.latex_markers(self.repo)],
        )
        self.assertEqual([], knowledge_registry.build(self.repo).latex_problems)

    def test_bracket_misuse_is_a_marker_problem(self) -> None:
        self.write("notes/math/measure/main.tex", "\\kn[ ]{empty name} \\knref[x]{y}\n")
        problems = knowledge_registry.build(self.repo).latex_problems
        self.assertTrue(any("needs a name" in problem for problem in problems), problems)
        self.assertTrue(any("takes no optional name" in problem for problem in problems), problems)

    def test_literal_and_inactive_tex_creates_no_markers(self) -> None:
        self.write("notes/math/measure/main.tex", (
            "% \\kn{comment}\n\\newcommand{\\alias}[1]{\\kn{#1}}\n"
            "\\renewcommand*\\other[2][x]{\\knref{#2}} \\providecommand{\\third}{\\kn{third}}\n"
            "\\def\\byhand#1.{\\kn{#1}} \\newenvironment{box}{\\kn{begin}}{\\knref{end}}\n"
            "\\begin{verbatim}\n\\kn{literal}\n\\end{verbatim}\n"
            "\\begin{lstlisting}[language=TeX]\n\\knref{listing}\n\\end{lstlisting}\n"
            "\\begin{minted}{latex}\n\\kn{minted}\n\\end{minted} \\verb|\\kn{inline}|\n"
            "\\iffalse\\kn{disabled}\\ifx a b \\kn{nested}\\fi\\knref{still disabled}\\fi\n"
            "\\iffalse\\kn{draft}\\else\\kn{active branch}\\fi\n"
            "\\\\kn{escaped}\n\\kn{A \"quoted name}\n"
        ))
        registry = knowledge_registry.build(self.repo)
        self.assertEqual([], registry.latex_problems)
        self.assertEqual(
            ['A "quoted name', "active branch"],
            [row["name"] for row in knowledge_registry.latex_markers(self.repo)],
        )

    def test_masking_keeps_offsets_and_reports_unparsed_constructs(self) -> None:
        text = "\\begin{verbatim}\n\\kn{x}\n\\end{verbatim}\n\\def\\a{\\kn{y}} % \\kn{z}\n"
        masked, problems = knowledge_registry.mask_tex(text)
        self.assertEqual([], problems)
        self.assertEqual(len(text), len(masked))
        self.assertEqual(text.count("\n"), masked.count("\n"))
        self.assertNotIn("kn", masked)
        masked, problems = knowledge_registry.mask_tex("\\iffalse \\kn{x}\n\\begin{verbatim} \\kn{y}\n")
        self.assertEqual(
            ["unclosed \\iffalse at line 1", "unclosed literal environment 'verbatim' at line 2"],
            problems,
        )
        self.assertIn("\\kn{y}", masked)

    def test_latex_marker_problems_warn_in_the_registry_and_fail_the_latex_markers(self) -> None:
        self.write("notes/math/measure/main.tex", (
            "\\kn{a} \\knref{unknown} \\knref{unknown}\n"
            "\\kn{测度}\n\\begin{verbatim}\n"
        ))
        self.write("notes/math/draft/notes.tex", "\\kn{c}\n\\kn{unclosed\n")
        self.ids = {}
        self.write_ids()
        problems = knowledge_registry.build(self.repo).latex_problems
        self.assertEqual(4, len(problems), problems)
        for message in (
            "notes/math/measure/main.tex: unresolved LaTeX knowledge reference 'unknown'",
            "notes/math/measure/main.tex: knowledge marker '测度' has no slug",
            "notes/math/measure/main.tex: unclosed literal environment 'verbatim' at line 3",
            "notes/math/draft/notes.tex: unclosed TeX group '{' at line 2",
        ):
            self.assertTrue(any(problem.startswith(message) for problem in problems), message)
        for arguments in ((), ("--check",)):
            with self.subTest(arguments=arguments):
                status, output = self.run_main(*arguments)
                self.assertEqual(0, status, output)
                self.assertIn(
                    "warning: notes/math/measure/main.tex: unresolved LaTeX knowledge reference 'unknown'; "
                    "the LaTeX web export fails until it is fixed",
                    output,
                )
        with self.assertRaisesRegex(RegistryError, "unresolved LaTeX knowledge reference 'unknown'"):
            knowledge_registry.latex_markers(self.repo)

    def test_cjk_definition_takes_its_id_from_the_map(self) -> None:
        self.write("notes/math/measure/main.tex", "\\kn{测度}\n")
        self.ids = {"测度": "measure"}
        self.write_ids()
        self.assertEqual(["measure"], list(self.entries()))


if __name__ == "__main__":
    unittest.main()
