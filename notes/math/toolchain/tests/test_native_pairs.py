from __future__ import annotations

import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch
import xml.etree.ElementTree as ET

TOOLCHAIN = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(TOOLCHAIN / "scripts"))
import add_native_tex
import check_native_tex


class NativePairsTest(unittest.TestCase):
    def test_content_end_keeps_nested_markup_and_half_open_math_intervals(self) -> None:
        text = '#kn[#strong[domain] $[0,1)$ and "[quoted]" plus \\]] trailing'
        end = add_native_tex.content_end(text, text.index("["))
        self.assertEqual(' trailing', text[end + 1:])
        self.assertEqual('#strong[domain] $[0,1)$ and "[quoted]" plus \\]', text[text.index("[") + 1:end])

    def test_content_end_refuses_unclosed_authored_marker(self) -> None:
        with self.assertRaisesRegex(ValueError, "unclosed content"):
            add_native_tex.content_end('#kn[#strong[name] $[0,1)$', 3)

    @unittest.skipUnless(shutil.which("pandoc"), "Pandoc is needed for native MathML conversion")
    def test_zero_thickness_mathml_preserves_a_binomial_not_a_fraction(self) -> None:
        replacements = {}
        normalized = add_native_tex.normalize_mathml(
            '<math><mrow><mo>(</mo><mfrac linethickness="0pt"><mi>n</mi><mi>k</mi></mfrac><mo>)</mo></mrow></math>',
            replacements,
        )
        self.assertEqual([r"\binom{n}{k}"], list(replacements.values()))
        self.assertNotIn("mfrac", normalized)
        output = self.pandoc_native(normalized, replacements)
        self.assertIn(r"\binom{n}{k}", output)
        self.assertNotIn(r"\frac{n}{k}", output)

    @unittest.skipUnless(shutil.which("pandoc"), "Pandoc is needed for native MathML conversion")
    def test_mathstyle_preserves_blackboard_and_calligraphic_alphabets(self) -> None:
        normalized = add_native_tex.normalize_mathml('<math><mrow><mi>ℝ</mi><mo>+</mo><mi>𝒜</mi></mrow></math>', {})
        elements = list(ET.fromstring(normalized).iter("mi"))
        self.assertEqual([("R", "double-struck"), ("A", "script")],
                         [(element.text, element.get("mathvariant")) for element in elements])
        output = self.pandoc_native(normalized)
        self.assertIn(r"\mathbb{R}", output)
        self.assertIn(r"\mathcal{A}", output)

    @unittest.skipUnless(shutil.which("pandoc"), "Pandoc is needed for native MathML conversion")
    def test_styled_math_text_and_cjk_symbols_do_not_lose_their_fonts(self) -> None:
        replacements = {}
        normalized = add_native_tex.normalize_mathml(
            '<math><mrow><mtext>ℝ</mtext><mo>+</mo><mtext>𝐰𝐨𝐫𝐝</mtext><mi>有</mi></mrow></math>',
            replacements,
        )
        output = self.pandoc_native(normalized, replacements)
        self.assertIn(r"\mathbb{R}", output)
        self.assertIn(r"\text{\textbf{word}}", output)
        self.assertIn(r"\text{有}", output)

    @unittest.skipUnless(shutil.which("pandoc"), "Pandoc is needed for semantic figure conversion")
    def test_figure_caption_and_label_survive_inside_a_statement_without_a_float(self) -> None:
        html = '<div class="ql-statement-anchor" id="theorem-a"><section class="ql-callout--theorem">'
        html += '<figure id="diagram-a"><img src="../course/assets/a.png"><figcaption>Authored caption</figcaption></figure>'
        html += '</section></div>'
        output = self.pandoc_native(html)
        self.assertNotIn(r"\begin{figure}", output)
        self.assertIn(r"\captionof{figure}{Authored caption}", output)
        self.assertIn(r"\label{diagram-a}", output)
        self.assertIn("../course/assets/a.png", output)

    def test_native_underlines_keep_nested_math_and_refuse_truncated_input(self) -> None:
        self.assertEqual(r"\underline{\mathbf{x}_{i}} + \underline{\{x\}}",
                         add_native_tex.native_underlines(r"\underset{¯}{\mathbf{x}_{i}} + \underset{¯}{\{x\}}"))
        with self.assertRaisesRegex(ValueError, "unclosed underset"):
            add_native_tex.native_underlines(r"\underset{¯}{\mathbf{x}")

    def test_companion_audit_reports_missing_tex_without_changing_typst(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory).resolve()
            source = root / "course/chapter.typ"
            source.parent.mkdir()
            source.write_text("#kn[Original authority]\n", encoding="utf-8")
            before = source.read_bytes()
            report = check_native_tex.audit_pairs(root)
            self.assertEqual(1, report["typst_sources"])
            self.assertEqual(["course/chapter.tex"], report["missing_companions"])
            self.assertEqual(before, source.read_bytes())
            self.assertFalse(source.with_suffix(".tex").exists())

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
                (course / (name + ".typ")).write_text("Typst authority\n", encoding="utf-8")
                (course / (name + ".tex")).write_text(text, encoding="utf-8")
            report = check_native_tex.audit_pairs(root)
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

    @unittest.skipUnless(shutil.which("pandoc"), "Pandoc is needed for native JSON map integration")
    def test_lua_filter_uses_json_math_map_and_preserves_explicit_marker_keys(self) -> None:
        html = '<p><span class="ql-native-kn" data-native-key="source.typ:4">scalar <math><mi>x</mi></math></span> '
        html += '<span class="ql-native-ref" data-native-key="source.typ:20">same scalar</span> '
        html += '<math><mtext>QLNATIVEMATH0END</mtext></math></p>'
        with tempfile.TemporaryDirectory() as directory:
            folder = Path(directory)
            markers = folder / "markers.json"
            output = self.pandoc_native(html, {"QLNATIVEMATH0END": r"\binom{n}{k}"}, markers)
            records = json.loads(markers.read_text(encoding="utf-8"))
        self.assertEqual(["source.typ:4", "source.typ:20"], [record["key"] for record in records])
        self.assertEqual(["kn", "knref"], [record["kind"] for record in records])
        self.assertIn(r"\kn{scalar", output)
        self.assertIn(r"\knref{same scalar}", output)
        self.assertIn(r"\binom{n}{k}", output)
        self.assertNotIn("QLNATIVEMATH", output)

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

    def pandoc_native(self, html: str, replacements: dict | None = None, markers: Path | None = None) -> str:
        with tempfile.TemporaryDirectory() as directory:
            mapping = Path(directory) / "math.json"
            mapping.write_text(json.dumps(replacements or {}), encoding="utf-8")
            environment = dict(os.environ, QLNOTES_NATIVE_MATH=str(mapping))
            if markers is not None:
                environment["QLNOTES_NATIVE_MARKERS"] = str(markers)
            result = subprocess.run(["pandoc", "-f", "html", "-t", "latex", "--lua-filter",
                                     str(TOOLCHAIN / "filters/native-pairs.lua")],
                                    input=html, capture_output=True, text=True,
                                    timeout=30, check=False, env=environment)
        self.assertEqual(0, result.returncode, result.stderr)
        return result.stdout


if __name__ == "__main__":
    unittest.main()
