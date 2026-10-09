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
                "files": ["main.typ", "main.tex", "chapters/*.typ", "chapters/*.tex"],
                "fields": [], "topics": [], "publish": True, "listed": True,
                "web": "https://example.test/notes/math/measure",
            },
            {
                "id": "math:draft", "title": "Draft", "description": "Fixture.",
                "subject": "math", "course": "draft", "root": "notes/math/draft",
                "files": ["*.typ", "*.tex"],
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

    def test_ids_come_from_the_map_or_the_slug_rule(self) -> None:
        self.write("notes/math/measure/main.typ", (
            "#kn[$sigma$-algebra] and #kn[Fatou's Lemma]\n"
            "#kn[#strong[Monotone] convergence\ntheorem]\n"
        ))
        self.ids = {"#strong[Monotone] convergence\ntheorem": "monotone-convergence-theorem"}
        self.write_ids()
        entries = self.entries()
        self.assertEqual(["fatou-s-lemma", "monotone-convergence-theorem", "sigma-algebra"], sorted(entries))
        self.assertEqual(["#strong[Monotone] convergence\ntheorem"], entries["monotone-convergence-theorem"][0])
        self.assertEqual("lambda-system", knowledge_registry.slug("λ-system"))
        self.assertEqual("x" * 120, knowledge_registry.slug("x" * 130))

    def test_urls_point_at_the_course_web_anchor(self) -> None:
        self.write("notes/math/measure/chapters/01.typ", "#kn[measure space]\n")
        self.assertEqual(
            "https://example.test/notes/math/measure/#kn-measure-space",
            self.entries()["measure-space"][1],
        )

    def test_published_typst_references_reach_definitions_through_map_aliases(self) -> None:
        self.write("notes/math/measure/main.typ", "#kn[$sigma$-algebra]\n#ref[sigma-algebra] #ref[$sigma$-algebra]\n")
        self.write("notes/math/measure/main.tex", "\\kn{$\\sigma$-algebra}\n\\knref{$\\mathit{\\sigma}$-algebra}\n")
        self.ids = {
            "sigma-algebra": "sigma-algebra",
            "$\\mathit{\\sigma}$-algebra": "sigma-algebra",
        }
        self.write_ids()
        self.assertEqual((["$sigma$-algebra", "sigma-algebra"]), self.entries()["sigma-algebra"][0])

    def test_typst_references_resolve_by_identity_key(self) -> None:
        self.write("notes/math/measure/main.typ", (
            "#kn[measure space] #kn[$σ$-finite measure]\n"
            "#ref[Measure  Space] #ref[$Σ$-FINITE measure] #ref[measure space]\n"
        ))
        self.assertEqual(["measure space", "Measure  Space"], self.entries()["measure-space"][0])
        self.assertEqual(
            ["$σ$-finite measure", "$Σ$-FINITE measure"],
            self.entries()["sigma-finite-measure"][0],
        )

    def test_mapped_spellings_extend_the_identity_keys(self) -> None:
        self.write("notes/math/measure/main.typ", "#kn[Fatou's Lemma]\n#ref[Fatou lemma]\n")
        self.ids = {"Fatou's Lemma": "fatou-lemma", "fatou lemma": "fatou-lemma"}
        self.write_ids()
        self.assertEqual(["Fatou's Lemma", "Fatou lemma"], self.entries()["fatou-lemma"][0])

    def test_unresolved_typst_references_are_reported_not_linked(self) -> None:
        self.write("notes/math/measure/main.typ", "#kn[Fatou's Lemma]\n#ref[fatou-lemma] #ref[fatou-lemma]\n")
        self.write("notes/math/draft/main.typ", "#ref[draft only]\n")
        registry = knowledge_registry.build(self.repo)
        self.assertEqual([("fatou-lemma", "notes/math/measure/main.typ")], registry.unresolved_typst)
        self.assertEqual([["Fatou's Lemma"]], [names for _, names in registry.entries])
        status, output = self.run_main()
        self.assertEqual(0, status, output)
        self.assertIn("notes/math/measure/main.typ: Typst reference #ref[fatou-lemma] matches no", output)
        status, output = self.run_main("--check")
        self.assertEqual(0, status, output)
        self.assertIn("#ref[fatou-lemma]", output)

    def test_ambiguous_identity_keys_resolve_nothing(self) -> None:
        self.write("notes/math/measure/main.typ", "#kn[Measure] #kn[MEASURE]\n#ref[measure]\n")
        self.ids = {"Measure": "measure-a", "MEASURE": "measure-b"}
        self.write_ids()
        registry = knowledge_registry.build(self.repo)
        self.assertEqual([("measure", "notes/math/measure/main.typ")], registry.unresolved_typst)

    def test_typst_registry_covers_published_courses_only(self) -> None:
        self.write("notes/math/measure/main.typ", "#kn[measure space]\n")
        self.write("notes/math/draft/main.typ", "#kn[draft concept]\n")
        self.write("notes/math/measure/build/main.typ", "#kn[build output]\n")
        self.assertEqual(["measure-space"], list(self.entries()))

    def test_registry_text_is_self_contained_and_keeps_bodies_verbatim(self) -> None:
        self.write("notes/math/measure/main.typ", '#kn[interval $[0,1)$ and "]" text]\n#kn[b]\n')
        status, output = self.run_main()
        self.assertEqual(0, status, output)
        text = (self.repo / knowledge_registry.REGISTRY).read_text(encoding="utf-8")
        self.assertTrue(text.startswith("// Generated by notes/math/toolchain/scripts/knowledge_registry.py"))
        self.assertNotIn("import", text)
        self.assertIn(
            '  (names: ([interval $[0,1)$ and "]" text],), id: "interval-0-1-and-text", '
            'url: "https://example.test/notes/math/measure/#kn-interval-0-1-and-text"),\n',
            text,
        )
        self.assertLess(text.index('id: "b"'), text.index('id: "interval-0-1-and-text"'))

    def test_registry_json_carries_the_same_entries(self) -> None:
        self.write("notes/math/measure/main.typ", "#kn[measure space] #kn[$σ$-algebra]\n#ref[Measure Space]\n")
        status, output = self.run_main()
        self.assertEqual(0, status, output)
        payload = json.loads((self.repo / knowledge_registry.REGISTRY_JSON).read_text(encoding="utf-8"))
        measure = "https://example.test/notes/math/measure/#kn-"
        self.assertEqual({
            "schema": "notes-knowledge-registry-v1",
            "entries": [
                {"names": ["measure space", "Measure Space"], "id": "measure-space", "url": measure + "measure-space"},
                {"names": ["$σ$-algebra"], "id": "sigma-algebra", "url": measure + "sigma-algebra"},
            ],
        }, payload)

    def test_check_reports_a_stale_registry(self) -> None:
        self.write("notes/math/measure/main.typ", "#kn[measure space]\n")
        self.assertEqual(1, self.run_main("--check")[0])
        self.assertEqual(0, self.run_main()[0])
        self.assertEqual(0, self.run_main("--check")[0])
        self.write("notes/math/measure/main.typ", "#kn[measure space] #kn[outer measure]\n")
        status, output = self.run_main("--check")
        self.assertEqual(1, status)
        self.assertIn("make knowledge-registry", output)
        self.assertEqual(0, self.run_main()[0])
        (self.repo / knowledge_registry.REGISTRY_JSON).write_text("{}\n", encoding="utf-8")
        status, output = self.run_main("--check")
        self.assertEqual(1, status)
        self.assertIn(f"{knowledge_registry.REGISTRY_JSON} is stale", output)
        self.assertNotIn(f"{knowledge_registry.REGISTRY} is stale", output)

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

    def test_duplicate_typst_definitions_fail(self) -> None:
        cases = (
            ("notes/math/measure/main.typ", "#kn[measure space] #kn[measure space]\n", {}, "duplicate Typst knowledge definition"),
            ("notes/math/measure/main.typ", "#kn[measure space] #kn[Measure Space]\n", {}, "duplicate Typst knowledge ID"),
        )
        for relative, text, ids, message in cases:
            with self.subTest(message=message):
                path = self.write(relative, text)
                self.ids = ids
                self.write_ids()
                with self.assertRaisesRegex(RegistryError, message):
                    knowledge_registry.build(self.repo)
                path.unlink()

    def test_invalid_markers_and_maps_fail(self) -> None:
        cases = (
            ("notes/math/measure/main.typ", "#kn[测度]\n", {}, "has no slug"),
            ("notes/math/measure/main.typ", "#kn[a]\n", {"old spelling": "removed-id"}, "stale entry"),
            ("notes/math/measure/main.typ", "#kn[a]\n", {"a": "Not An ID"}, "invalid knowledge ID"),
            ("notes/math/measure/main.typ", "#kn[unclosed\n", {}, "unclosed Typst content block"),
        )
        for relative, text, ids, message in cases:
            with self.subTest(message=message):
                path = self.write(relative, text)
                self.ids = ids
                self.write_ids()
                with self.assertRaisesRegex(RegistryError, message):
                    knowledge_registry.build(self.repo)
                path.unlink()

    def test_latex_marker_problems_warn_in_the_registry_and_fail_the_latex_markers(self) -> None:
        self.write("notes/math/measure/main.typ", "#kn[measure space]\n")
        self.write("notes/math/measure/main.tex", (
            "\\kn{a} \\knref{unknown} \\knref{unknown}\n"
            "\\kn{b} \\kn{测度}\n\\begin{verbatim}\n"
        ))
        self.write("notes/math/draft/notes.tex", "\\kn{c}\n\\kn{unclosed\n")
        self.ids = {"b": "a"}
        self.write_ids()
        problems = knowledge_registry.build(self.repo).latex_problems
        self.assertEqual(5, len(problems), problems)
        for message in (
            "notes/math/measure/main.tex: unresolved LaTeX knowledge reference 'unknown'",
            "notes/math/measure/main.tex: knowledge marker '测度' has no slug",
            "notes/math/measure/main.tex: unclosed literal environment 'verbatim' at line 3",
            "notes/math/draft/notes.tex: unclosed TeX group '{' at line 2",
            "duplicate LaTeX knowledge ID 'a' for 'a' (notes/math/measure/main.tex) and 'b'",
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
        self.write("notes/math/measure/main.typ", "#kn[测度]\n")
        self.ids = {"测度": "measure"}
        self.write_ids()
        self.assertEqual(["measure"], list(self.entries()))


if __name__ == "__main__":
    unittest.main()
