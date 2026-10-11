from __future__ import annotations

from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

TOOLCHAIN = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(TOOLCHAIN / "scripts"))
import check_native_tex


class NativeTexTest(unittest.TestCase):
    def test_recursive_include_coverage_identifies_only_uncovered_nonempty_fragments(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory).resolve()
            course = root / "course"
            (course / "chapters").mkdir(parents=True)
            data = {
                "main": r"\documentclass{book}" + "\n" + r"\input{chapters/one}" + "\n",
                "chapters/one": r"\input{chapters/two.tex}" + "\nBody.\n",
                "chapters/two": "Nested body.\n",
                "unused": "Standalone draft.\n",
                "empty": "% Deliberately empty draft.\n",
            }
            for name, text in data.items():
                (course / (name + ".tex")).write_text(text, encoding="utf-8")
            report = check_native_tex.audit_sources(root)
            self.assertEqual(["course/main.tex"], report["entries"])
            self.assertEqual(["course/unused.tex"], report["uncovered_fragments"])
            self.assertEqual(["course/empty.tex"], report["empty_fragments"])
            self.assertEqual({}, report["missing_inputs"])

    def test_fragment_compilation_uses_root_preamble_course_cwd_and_bounded_external_output(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory).resolve()
            course = root / "course"
            course.mkdir()
            entry = course / "main.tex"
            entry.write_text(r"\documentclass{book}" + "\n" + r"\newcommand{\custom}{Defined}" + "\n"
                             + r"\begin{document}" + "Root body.\n" + r"\end{document}", encoding="utf-8")
            fragment = course / "章 节.tex"
            fragment.write_text(r"\custom", encoding="utf-8")
            original = {path.name: path.read_bytes() for path in course.iterdir()}
            output = root / "build/check"
            def compile_fake(command, **options):
                self.assertEqual(course, options["cwd"])
                self.assertEqual(15, options["timeout"])
                self.assertIn("-output-directory=" + str(output), command)
                self.assertIn("-no-shell-escape", command)
                wrapper = Path(command[-1]).read_text(encoding="utf-8")
                self.assertIn(r"\newcommand{\custom}{Defined}", wrapper)
                self.assertNotIn("Root body.", wrapper)
                self.assertIn('\\input{"' + fragment.as_posix() + '"}', wrapper)
                (output / "check.log").write_text("No compile diagnostics.\n", encoding="utf-8")
                (output / "check.pdf").write_bytes(b"%PDF-fixture")
                return subprocess.CompletedProcess(command, 0, "", "")
            with patch.object(check_native_tex.subprocess, "run", side_effect=compile_fake) as run:
                result = check_native_tex.compile_document(fragment, course, output, root_context=entry, timeout=15)
            self.assertEqual(2, run.call_count)
            self.assertEqual("passed", result["status"])
            self.assertEqual(original, {path.name: path.read_bytes() for path in course.iterdir()})
            self.assertFalse(list(course.glob("*.pdf")))

    def test_diagnostics_keep_authored_omissions_distinct_from_glyph_and_structure_failures(self) -> None:
        log = ("Missing character: There is no 🞟 in font Latin Modern!\n"
               "chapter.tex:42: Undefined control sequence.\n"
               "LaTeX Warning: Reference `authored-later' on page 1 undefined on input line 3.\n"
               "LaTeX Warning: Label `repeated' multiply defined.\n"
               "chapter.tex:283: Extra alignment tab has been changed to \\cr.\n"
               "! LaTeX Error: Environment unknown undefined.\n")
        findings = check_native_tex.diagnostics(log)
        self.assertEqual(1, len(findings["missing_glyphs"]))
        self.assertEqual(1, len(findings["undefined_controls"]))
        self.assertEqual(1, len(findings["undefined_references"]))
        self.assertEqual(1, len(findings["duplicate_labels"]))
        self.assertEqual(3, len(findings["structural_errors"]))


if __name__ == "__main__":
    unittest.main()
