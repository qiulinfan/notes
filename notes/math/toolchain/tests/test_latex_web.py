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
sys.path.insert(0, str(TOOLCHAIN / "scripts"))
WEB_MODULE_PATH = TOOLCHAIN / "scripts/export_latex_web.py"
WEB_SPEC = importlib.util.spec_from_file_location("qlnotes_export_latex_web", WEB_MODULE_PATH)
assert WEB_SPEC is not None and WEB_SPEC.loader is not None
export_latex_web = importlib.util.module_from_spec(WEB_SPEC)
sys.modules[WEB_SPEC.name] = export_latex_web
WEB_SPEC.loader.exec_module(export_latex_web)
# The real converter integration runs only when its argv is configured; the
# mocked tests clear the variable so they always exercise the default command.
REAL_CONVERTER = os.environ.get("LATEX_LIVE_EXPORT_COMMAND")


class FakeConverter:
    """Stand-in for subprocess.Popen that records one converter request."""

    def __init__(self, stdout: str, *, returncode: int = 0, stderr: str = "", timeout: bool = False) -> None:
        self.stdout = stdout
        self.returncode = returncode
        self.stderr = stderr
        self.timeout = timeout
        self.command: list[str] | None = None
        self.options: dict[str, object] = {}
        self.request: dict[str, object] | None = None
        self.source_text = ""
        self.timeouts: list[object] = []
        self.terminated = False

    def __call__(self, command: list[str], **options: object) -> "FakeConverter":
        self.command = command
        self.options = options
        return self

    def communicate(self, input: str | None = None, timeout: object = None) -> tuple[str, str]:
        self.timeouts.append(timeout)
        if input is not None:
            self.request = json.loads(input)
            self.source_text = Path(str(self.request["source"])).read_text(encoding="utf-8")
            if self.timeout:
                raise subprocess.TimeoutExpired(self.command or [], timeout or 0)
        return self.stdout, self.stderr

    def terminate(self) -> None:
        self.terminated = True

    def kill(self) -> None:
        raise AssertionError("the converter should stop after SIGTERM")


def converter_result(**changes: object) -> str:
    result: dict[str, object] = {
        "schema": "latex-live-html-result-v1",
        "operation": "document",
        "html": '<!doctype html><html><body><span id="kn-measure-space" data-ql-kn="measure-space">'
                'measure space</span></body></html>',
        "report": {},
    }
    result.update(changes)
    return json.dumps(result)


class DirectLatexWebTest(unittest.TestCase):
    def setUp(self) -> None:
        self.temporary = tempfile.TemporaryDirectory(prefix="qlnotes-direct-latex-")
        self.repo = Path(self.temporary.name).resolve()
        self.source = self.repo / "notes/math/demo/knowledge.tex"
        self.source.parent.mkdir(parents=True)
        shutil.copyfile(Path(__file__).parent / "fixtures/knowledge.tex", self.source)
        (self.repo / "courses.json").write_text(json.dumps({
            "schema": "notes-courses-v1",
            "fields": [],
            "courses": [{
                "id": "math:demo", "title": "Demo", "description": "Synthetic fixture.",
                "subject": "math", "course": "demo",
                "root": "notes/math/demo", "files": ["*.tex"],
                "fields": [], "topics": [], "publish": False, "listed": False,
                "web": "https://example.test/demo",
            }],
        }), encoding="utf-8")
        ids = self.repo / "notes/math/toolchain/knowledge-ids.json"
        ids.parent.mkdir(parents=True)
        ids.write_text("{}\n", encoding="utf-8")
        self.output = self.repo / "build/index.html"
        environment = patch.dict(os.environ)
        environment.start()
        self.addCleanup(environment.stop)
        os.environ.pop("LATEX_LIVE_EXPORT_COMMAND", None)

    def tearDown(self) -> None:
        self.temporary.cleanup()

    def export(self, sources: list[Path] | None = None) -> None:
        export_latex_web.export_latex_web(
            sources or [self.source], self.repo, self.repo / "build/work", self.output,
            title="LaTeX Knowledge Fixture", course="Demo & Tests", author="Test_One",
        )

    def run_with(self, converter: FakeConverter, sources: list[Path] | None = None) -> FakeConverter:
        with patch.object(export_latex_web.subprocess, "Popen", side_effect=converter) as popen:
            self.export(sources)
        self.assertEqual(1, popen.call_count)
        return converter

    def test_fragments_send_one_document_request_with_notes_markers(self) -> None:
        original = self.source.read_bytes()
        converter = self.run_with(FakeConverter(converter_result()))
        self.assertEqual(["latex-live-export"], converter.command)
        self.assertNotIn("shell", converter.options)
        self.assertEqual(subprocess.PIPE, converter.options["stdin"])
        request = converter.request
        assert request is not None
        self.assertEqual("latex-live-html-request-v1", request["schema"])
        self.assertEqual("document", request["operation"])
        self.assertEqual(str(self.repo), request["project_root"])
        self.assertEqual([{
            "name": "measure space", "id": "measure-space",
            "url": "https://example.test/demo/#kn-measure-space",
        }], request["markers"])
        self.assertEqual(600, converter.timeouts[0])
        wrapper = Path(str(request["source"]))
        self.assertEqual(self.repo / "build/work", wrapper.parent.parent)
        self.assertFalse(wrapper.exists())
        self.assertIn(r"\documentclass{article}", converter.source_text)
        self.assertIn(r"\newtheorem{definition}{Definition}", converter.source_text)
        self.assertIn(r"\title{LaTeX Knowledge Fixture\\Demo \& Tests}", converter.source_text)
        self.assertIn(r"\author{Test\_One}", converter.source_text)
        self.assertIn(rf'\input{{"{self.source.as_posix()}"}}', converter.source_text)
        self.assertEqual(original, self.source.read_bytes())
        self.assertIn('data-ql-kn="measure-space"', self.output.read_text(encoding="utf-8"))
        self.assertEqual(["index.html"], [path.name for path in self.output.parent.iterdir() if path.is_file()])

    def test_complete_root_is_forwarded_to_the_configured_command(self) -> None:
        self.source.write_text(
            r"\documentclass{book}" + "\n" + r"\input{chapters/one}" + "\n",
            encoding="utf-8",
        )
        original = self.source.read_bytes()
        os.environ["LATEX_LIVE_EXPORT_COMMAND"] = json.dumps(["node", "/tools/latex live/export.mjs"])
        converter = self.run_with(FakeConverter(converter_result()))
        self.assertEqual(["node", "/tools/latex live/export.mjs"], converter.command)
        assert converter.request is not None
        self.assertEqual(str(self.source), converter.request["source"])
        self.assertEqual([], converter.request["markers"])
        self.assertEqual(original, self.source.read_bytes())
        self.assertNotIn("LaTeX Knowledge Fixture", converter.source_text)

    def test_command_override_must_be_a_nonempty_string_list(self) -> None:
        for value in ("not JSON", "[]", '"latex-live-export"', "[1]", '[""]'):
            with self.subTest(value=value), \
                    patch.object(export_latex_web.subprocess, "Popen") as popen:
                os.environ["LATEX_LIVE_EXPORT_COMMAND"] = value
                with self.assertRaisesRegex(export_latex_web.LatexWebError, "LATEX_LIVE_EXPORT_COMMAND"):
                    self.export()
                popen.assert_not_called()

    def test_cjk_fragment_selects_portable_fonts_and_keeps_quoted_source_path(self) -> None:
        source = self.source.with_name("知识 片段.tex")
        self.source.rename(source)
        self.source = source
        source.write_text("\\kn{测度空间}\n", encoding="utf-8")
        (self.repo / "notes/math/toolchain/knowledge-ids.json").write_text(
            json.dumps({"测度空间": "measure-space"}, ensure_ascii=False), encoding="utf-8",
        )
        converter = self.run_with(FakeConverter(converter_result()))
        self.assertIn(r"\usepackage[UTF8,fontset=fandol]{ctex}", converter.source_text)
        self.assertIn(rf'\input{{"{source.as_posix()}"}}', converter.source_text)
        assert converter.request is not None
        self.assertEqual("测度空间", converter.request["markers"][0]["name"])
        self.assertEqual("\\kn{测度空间}\n", source.read_text(encoding="utf-8"))

    def test_cjk_metadata_selects_portable_fonts_for_ascii_fragment(self) -> None:
        wrapper = export_latex_web.fragment_document(
            [self.source], title="数学笔记", course=None, author=None,
        )
        self.assertIn(r"\usepackage[UTF8,fontset=fandol]{ctex}", wrapper)

    def test_invalid_converter_results_fail_without_output(self) -> None:
        self.output.parent.mkdir()
        self.output.write_text("<html><body>old output</body></html>", encoding="utf-8")
        cases = (
            (FakeConverter("", returncode=1, stderr="Unmapped explicit knowledge marker: x"), "Unmapped explicit"),
            (FakeConverter(converter_result(schema="latex-live-html-result-v0")), "latex-live-html-result-v1"),
            (FakeConverter(converter_result(operation="labels")), "another operation"),
            (FakeConverter(converter_result(html="<body>fragment</body>")), "complete HTML"),
            (FakeConverter(converter_result(html=None)), "complete HTML"),
            (FakeConverter("not JSON"), "did not return JSON"),
        )
        for converter, message in cases:
            with self.subTest(message=message):
                with self.assertRaisesRegex(export_latex_web.LatexWebError, message):
                    self.run_with(converter)
                self.assertEqual("<html><body>old output</body></html>", self.output.read_text(encoding="utf-8"))
                self.assertFalse(list((self.repo / "build/work").iterdir()))

    def test_oversized_result_is_rejected(self) -> None:
        with patch.object(export_latex_web, "MAX_RESULT_CHARACTERS", 10):
            with self.assertRaisesRegex(export_latex_web.LatexWebError, "64 MiB"):
                self.run_with(FakeConverter(converter_result()))
        self.assertFalse(self.output.exists())

    def test_timeout_terminates_the_converter(self) -> None:
        converter = FakeConverter("", timeout=True)
        with self.assertRaisesRegex(export_latex_web.LatexWebError, "failed"):
            self.run_with(converter)
        self.assertTrue(converter.terminated)
        self.assertEqual([600, 10], converter.timeouts)
        self.assertFalse(self.output.exists())

    def test_missing_converter_is_reported(self) -> None:
        with patch.object(export_latex_web.subprocess, "Popen", side_effect=FileNotFoundError("latex-live-export")):
            with self.assertRaisesRegex(export_latex_web.LatexWebError, "latex-live-export"):
                self.export()

    def test_unresolved_registered_reference_fails_before_the_converter(self) -> None:
        self.source.write_text("\\knref{unknown concept}\n", encoding="utf-8")
        with patch.object(export_latex_web.subprocess, "Popen") as popen:
            with self.assertRaisesRegex(export_latex_web.LatexWebError, "unresolved LaTeX knowledge reference"):
                self.export()
        popen.assert_not_called()

    def test_paths_outside_the_repository_fail_before_the_converter(self) -> None:
        with patch.object(export_latex_web.subprocess, "Popen") as popen:
            with self.assertRaisesRegex(export_latex_web.LatexWebError, "inside repo root"):
                export_latex_web.export_latex_web(
                    [self.source], self.repo, self.repo / "build", self.repo.parent / "outside.html",
                    title=None, course=None, author=None,
                )
        popen.assert_not_called()

    def real_converter(self) -> None:
        if not REAL_CONVERTER:
            self.skipTest("Set LATEX_LIVE_EXPORT_COMMAND to run the real converter integration")
        os.environ["LATEX_LIVE_EXPORT_COMMAND"] = REAL_CONVERTER

    def test_latex_source_compiles_to_self_contained_html_directly(self) -> None:
        self.real_converter()
        self.export()
        rendered = self.output.read_text(encoding="utf-8")
        self.assertIn("LaTeX Knowledge Fixture", rendered)
        self.assertIn('data-ql-kn="measure-space"', rendered)
        self.assertIn('id="kn-measure-space"', rendered)
        self.assertIn('data-ql-ref="measure-space"', rendered)
        self.assertIn("<style>", rendered)

    def test_opaque_drawing_keeps_native_svg_and_a_linked_caption(self) -> None:
        self.real_converter()
        self.source.with_name("drawings.sty").write_text(r"""\ProvidesPackage{drawings}
\RequirePackage{tikz}
\newenvironment{qldrawing}{}{}
\expandafter\newcommand\csname demo-diagram-01\endcsname{\tikz\draw (0,0) circle (1em);}
""", encoding="utf-8")
        self.source.write_text(r"""\documentclass{article}
\usepackage{drawings}
\begin{document}
\kn{measure space}: a named concept.
\begin{figure}
\begin{qldrawing}
\csname demo-diagram-01\endcsname
\end{qldrawing}
\caption{Drawing for \knref{measure space}}
\end{figure}
\end{document}
""", encoding="utf-8")
        self.export()
        rendered = self.output.read_text(encoding="utf-8")
        self.assertIn('<svg', rendered)
        self.assertIn('data-ql-ref="measure-space"', rendered)
        self.assertIn('<figcaption>', rendered)
        self.assertNotIn('demo-diagram-01', rendered)

    def test_cjk_fragment_with_unicode_path_exports_directly(self) -> None:
        self.real_converter()
        source = self.source.with_name("知识 片段.tex")
        self.source.rename(source)
        self.source = source
        source.write_text(source.read_text(encoding="utf-8") + "\n测度空间的定义。\n", encoding="utf-8")
        self.export()
        rendered = self.output.read_text(encoding="utf-8")
        self.assertIn("测度空间的定义", rendered)
        self.assertIn('data-ql-kn="measure-space"', rendered)

    def test_latex_web_export_rejects_unregistered_markers(self) -> None:
        self.real_converter()
        unknown = self.repo / "unknown.tex"
        unknown.write_text("\\kn{fixture concept that is not registered}\n", encoding="utf-8")
        with self.assertRaisesRegex(
            export_latex_web.LatexWebError,
            r"(?i)(unregistered|unknown|unmapped).*fixture concept that is not registered",
        ):
            self.export([unknown])


if __name__ == "__main__":
    unittest.main()
