from __future__ import annotations

import importlib.util
import json
import os
import shutil
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch


TOOLCHAIN = Path(__file__).resolve().parents[1]
REPO_ROOT = TOOLCHAIN.parents[2]
MODULE_PATH = TOOLCHAIN / "scripts/migrate_latex.py"
sys.path.insert(0, str(MODULE_PATH.parent))
SPEC = importlib.util.spec_from_file_location("qlnotes_migrate_latex", MODULE_PATH)
assert SPEC is not None and SPEC.loader is not None
migrate_latex = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = migrate_latex
SPEC.loader.exec_module(migrate_latex)
from convert_latex_project import convert_latex_project, inspect_project
WEB_MODULE_PATH = TOOLCHAIN / "scripts/export_latex_web.py"
WEB_SPEC = importlib.util.spec_from_file_location("qlnotes_export_latex_web", WEB_MODULE_PATH)
assert WEB_SPEC is not None and WEB_SPEC.loader is not None
export_latex_web = importlib.util.module_from_spec(WEB_SPEC)
sys.modules[WEB_SPEC.name] = export_latex_web
WEB_SPEC.loader.exec_module(export_latex_web)


class MultiSourceExportTest(unittest.TestCase):
    def test_typst_math_relations_stay_separate_from_preceding_exponents(self) -> None:
        rendered, changes = migrate_latex.normalize_typst_output(
            '$x^iapprox y + z^nepsilon.alt + mat(delim: "||", a; b)$'
        )

        self.assertEqual(
            '$x^i approx y + z^n epsilon.alt + mat(delim: "|", a; b)$',
            rendered,
        )
        self.assertEqual(3, changes)

    def test_latex_markers_are_rewritten_without_losing_nested_markup(self) -> None:
        source = r"\kn{$L^p$ \textbf{space}} and \knref{$L^p$ \textbf{space}}"
        rewritten, count = migrate_latex.rewrite_knowledge_macros(source)

        self.assertEqual(2, count)
        self.assertIn(r"\href{qlkn:}{$L^p$ \textbf{space}}", rewritten)
        self.assertIn(r"\href{qlknref:}{$L^p$ \textbf{space}}", rewritten)

    @unittest.skipUnless(shutil.which("pandoc"), "Pandoc is required for the integration fixture")
    def test_latex_markers_survive_tex_to_typst(self) -> None:
        fixture = Path(__file__).parent / "fixtures/knowledge.tex"
        with tempfile.TemporaryDirectory(prefix="qlnotes-latex-test-") as temporary:
            root = Path(temporary)
            output = root / "typst"
            migrate_latex.migrate(
                [fixture],
                output,
                root / "diagrams",
                None,
            )
            rendered = (output / "knowledge.typ").read_text(encoding="utf-8")

        self.assertIn("#kn[measure space]", rendered)
        self.assertIn("#ref[measure space]", rendered)

    @unittest.skipUnless(
        shutil.which("pandoc") and shutil.which("typst"),
        "Pandoc and Typst are required for the project integration fixture",
    )
    def test_elegantbook_entrypoint_becomes_self_contained_previewable_typst(self) -> None:
        fixture = Path(__file__).parent / "fixtures/latex-project/main.tex"
        build_parent = REPO_ROOT / "knowledge/build"
        build_parent.mkdir(parents=True, exist_ok=True)
        with tempfile.TemporaryDirectory(prefix="qlnotes-latex-project-", dir=build_parent) as temporary:
            root = Path(temporary)
            project = inspect_project([fixture])
            main = convert_latex_project(project, root / "typst")
            preview = root / "typst/index.html"
            result = subprocess.run(
                [
                    "typst",
                    "compile",
                    "--root",
                    str(root / "typst"),
                    "--features",
                    "html",
                    "--format",
                    "html",
                    str(main),
                    str(preview),
                ],
                check=False,
                capture_output=True,
                text=True,
                encoding="utf-8",
            )
            self.assertEqual(0, result.returncode, result.stderr)
            self.assertTrue(preview.is_file())
            self.assertTrue((root / "typst/Makefile").is_file())
            self.assertTrue((root / "typst/toolchain/qlnotes.typ").is_file())
            rendered_main = main.read_text(encoding="utf-8")

        self.assertIn('title: "Measure Preview"', rendered_main)
        self.assertIn('#include "chapters/01-measure.typ"', rendered_main)


class DirectLatexWebTest(unittest.TestCase):
    def setUp(self) -> None:
        self.temporary = tempfile.TemporaryDirectory(prefix="qlnotes-direct-latex-")
        self.repo = Path(self.temporary.name).resolve()
        self.source = self.repo / "notes/math/demo/knowledge.tex"
        self.source.parent.mkdir(parents=True)
        shutil.copyfile(Path(__file__).parent / "fixtures/knowledge.tex", self.source)
        registry = self.repo / "knowledge/sources.json"
        registry.parent.mkdir()
        registry.write_text(json.dumps({
            "schema": "kgdistiller-sources-v1",
            "fields": [{"id": "analysis", "label": "Analysis", "text": "Synthetic fixture."}],
            "sources": [{
                "id": "math:demo", "subject": "math", "course": "demo",
                "root": "notes/math/demo", "files": ["*.tex"],
                "fields": ["analysis"],
                "web": "https://example.test/demo",
            }],
        }), encoding="utf-8")
        self.output = self.repo / "build/index.html"
        self.wrapper_text = ""

    def tearDown(self) -> None:
        self.temporary.cleanup()

    def export(self, sources: list[Path] | None = None) -> None:
        export_latex_web.export_latex_web(
            sources or [self.source], self.repo, self.repo / "build/work", self.output,
            title="LaTeX Knowledge Fixture", course="Demo & Tests", author="Test_One",
        )

    def fake_export(self, command: list[str], **options: object) -> subprocess.CompletedProcess[str]:
        self.assertEqual(["--repo-root", str(self.repo), "export", "latex"], command[1:5])
        self.assertEqual(["--output", str(self.output), "--replace"], command[6:])
        self.assertTrue(options["capture_output"])
        self.wrapper_text = Path(command[5]).read_text(encoding="utf-8")
        self.output.parent.mkdir(parents=True, exist_ok=True)
        self.output.write_text(
            '<!doctype html><html><body><a id="kn-measure-space" data-ql-kn="measure-space"></a>'
            '<a data-ql-ref="measure-space" href="#kn-measure-space">measure space</a></body></html>',
            encoding="utf-8",
        )
        return subprocess.CompletedProcess(command, 0, json.dumps({
            "schema": "kgdistiller-latex-html-export-v1",
            "status": "exported", "output": str(self.output),
        }), "")

    def test_fragments_use_direct_cli_and_temporary_article_wrapper(self) -> None:
        original = self.source.read_bytes()
        with patch.object(export_latex_web.shutil, "which", return_value="/tools/kgdistiller"), \
                patch.object(export_latex_web.subprocess, "run", side_effect=self.fake_export) as run:
            self.export()
        self.assertEqual(1, run.call_count)
        self.assertIn(r"\documentclass{article}", self.wrapper_text)
        self.assertIn(r"\newtheorem{definition}{Definition}", self.wrapper_text)
        self.assertIn(r"\title{LaTeX Knowledge Fixture\\Demo \& Tests}", self.wrapper_text)
        self.assertIn(r"\author{Test\_One}", self.wrapper_text)
        self.assertIn(rf'\input{{"{self.source.as_posix()}"}}', self.wrapper_text)
        self.assertEqual(original, self.source.read_bytes())
        self.assertFalse(Path(run.call_args.args[0][5]).exists())
        self.assertTrue(self.output.is_file())

    def test_complete_root_is_forwarded_without_template_restrictions(self) -> None:
        self.source.write_text(
            r"\documentclass{book}" + "\n" + r"\input{chapters/one}" + "\n",
            encoding="utf-8",
        )
        original = self.source.read_bytes()
        with patch.dict(os.environ, {"KGDISTILLER_BIN": "custom-kgd"}), \
                patch.object(export_latex_web.shutil, "which", return_value="/tools/custom-kgd") as which, \
                patch.object(export_latex_web.subprocess, "run", side_effect=self.fake_export) as run:
            self.export()
        which.assert_called_once_with("custom-kgd")
        self.assertEqual(str(self.source), run.call_args.args[0][5])
        self.assertEqual(original, self.source.read_bytes())
        self.assertNotIn("LaTeX Knowledge Fixture", self.wrapper_text)

    def test_cjk_fragment_selects_portable_fonts_and_keeps_quoted_source_path(self) -> None:
        source = self.source.with_name("知识 片段.tex")
        self.source.rename(source)
        self.source = source
        source.write_text("\\kn{测度空间}\n", encoding="utf-8")
        with patch.object(export_latex_web.shutil, "which", return_value="/tools/kgdistiller"), \
                patch.object(export_latex_web.subprocess, "run", side_effect=self.fake_export):
            self.export()
        self.assertIn(r"\usepackage[UTF8,fontset=fandol]{ctex}", self.wrapper_text)
        self.assertIn(rf'\input{{"{source.as_posix()}"}}', self.wrapper_text)
        self.assertEqual("\\kn{测度空间}\n", source.read_text(encoding="utf-8"))

    def test_cjk_metadata_selects_portable_fonts_for_ascii_fragment(self) -> None:
        wrapper = export_latex_web.fragment_document(
            [self.source], title="数学笔记", course=None, author=None,
        )
        self.assertIn(r"\usepackage[UTF8,fontset=fandol]{ctex}", wrapper)

    def test_provider_rejection_is_not_reported_as_success(self) -> None:
        with patch.object(export_latex_web.shutil, "which", return_value="/tools/kgdistiller"), \
                patch.object(export_latex_web.subprocess, "run", return_value=subprocess.CompletedProcess(
                    [], 1, "", "unregistered knowledge marker: fixture concept",
                )):
            with self.assertRaisesRegex(export_latex_web.LatexWebError, "unregistered knowledge marker"):
                self.export()
        self.assertFalse(self.output.exists())
        self.assertFalse(list((self.repo / "build/work").iterdir()))

    def test_paths_outside_the_repository_fail_before_cli(self) -> None:
        with patch.object(export_latex_web.subprocess, "run") as run:
            with self.assertRaisesRegex(export_latex_web.LatexWebError, "inside repo root"):
                export_latex_web.export_latex_web(
                    [self.source], self.repo, self.repo / "build", self.repo.parent / "outside.html",
                    title=None, course=None, author=None,
                )
        run.assert_not_called()

    def test_missing_output_and_invalid_status_fail(self) -> None:
        for stdout, message in (("{}", "requested HTML"), ("not JSON", "JSON export")):
            with self.subTest(stdout=stdout), \
                    patch.object(export_latex_web.shutil, "which", return_value="/tools/kgdistiller"), \
                    patch.object(export_latex_web.subprocess, "run", return_value=subprocess.CompletedProcess(
                        [], 0, stdout, "",
                    )):
                with self.assertRaisesRegex(export_latex_web.LatexWebError, message):
                    self.export()

    def test_existing_html_does_not_make_an_unsuccessful_status_pass(self) -> None:
        self.output.parent.mkdir()
        self.output.write_text("<html><body>old output</body></html>", encoding="utf-8")
        with patch.object(export_latex_web.shutil, "which", return_value="/tools/kgdistiller"), \
                patch.object(export_latex_web.subprocess, "run", return_value=subprocess.CompletedProcess(
                    [], 0, json.dumps({
                        "schema": "kgdistiller-latex-html-export-v1",
                        "status": "error", "output": str(self.output),
                    }), "",
                )):
            with self.assertRaisesRegex(export_latex_web.LatexWebError, "requested HTML"):
                self.export()

    def sync_fixture(self) -> None:
        executable = shutil.which(os.environ.get("KGDISTILLER_BIN", "kgdistiller"))
        if executable is None:
            self.skipTest("kgdistiller is required for direct provider integration")
        result = subprocess.run(
            [executable, "--repo-root", str(self.repo), "sync"],
            capture_output=True, text=True, encoding="utf-8", check=False,
        )
        self.assertEqual(0, result.returncode, result.stderr)

    @unittest.skipUnless(
        os.environ.get("KGDISTILLER_LATEX_HTML_COMMAND"),
        "Set KGDISTILLER_LATEX_HTML_COMMAND to run the direct provider integration",
    )
    def test_latex_source_compiles_to_self_contained_html_directly(self) -> None:
        self.sync_fixture()
        self.export()
        rendered = self.output.read_text(encoding="utf-8")
        self.assertIn("LaTeX Knowledge Fixture", rendered)
        self.assertIn('data-ql-kn="measure-space"', rendered)
        self.assertIn('id="kn-measure-space"', rendered)
        self.assertIn('data-ql-ref="measure-space"', rendered)
        self.assertIn("<style>", rendered)

    @unittest.skipUnless(
        os.environ.get("KGDISTILLER_LATEX_HTML_COMMAND"),
        "Set KGDISTILLER_LATEX_HTML_COMMAND to run the direct provider integration",
    )
    def test_cjk_fragment_with_unicode_path_exports_directly(self) -> None:
        source = self.source.with_name("知识 片段.tex")
        self.source.rename(source)
        self.source = source
        source.write_text(source.read_text(encoding="utf-8") + "\n测度空间的定义。\n", encoding="utf-8")
        self.sync_fixture()
        self.export()
        rendered = self.output.read_text(encoding="utf-8")
        self.assertIn("测度空间的定义", rendered)
        self.assertIn('data-ql-kn="measure-space"', rendered)

    @unittest.skipUnless(
        os.environ.get("KGDISTILLER_LATEX_HTML_COMMAND"),
        "Set KGDISTILLER_LATEX_HTML_COMMAND to run the direct provider integration",
    )
    def test_latex_web_export_rejects_unregistered_markers(self) -> None:
        self.sync_fixture()
        unknown = self.repo / "unknown.tex"
        unknown.write_text("\\kn{fixture concept that is not registered}\n", encoding="utf-8")
        with self.assertRaisesRegex(
            export_latex_web.LatexWebError,
            r"(?i)(unregistered|unknown|unmapped).*fixture concept that is not registered",
        ):
            self.export([unknown])


if __name__ == "__main__":
    unittest.main()
