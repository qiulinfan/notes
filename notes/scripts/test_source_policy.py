from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

from notes.scripts.check_source_policy import find_pdfs, tracked_violation


class NotesSourcePolicyTest(unittest.TestCase):
    def test_accepts_authoritative_source_formats(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            notes_root = Path(temporary)
            for name in ("chapter.typ", "paper.tex", "research.md"):
                (notes_root / name).write_text("source", encoding="utf-8")

            self.assertEqual([], find_pdfs(notes_root))

    def test_rejects_pdf_case_insensitively_and_recursively(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            notes_root = Path(temporary)
            nested = notes_root / "course" / "build"
            nested.mkdir(parents=True)
            artifact = nested / "preview.PDF"
            artifact.write_bytes(b"artifact")

            self.assertEqual([artifact], find_pdfs(notes_root))

    def test_rejects_tracked_generated_directories(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            notes_root = Path(temporary)
            artifact = notes_root / "course" / "exports" / "chapter.md"
            artifact.parent.mkdir(parents=True)
            artifact.write_text("generated", encoding="utf-8")

            self.assertEqual(
                "generated directory",
                tracked_violation(artifact, notes_root),
            )

    def test_accepts_referenced_assets_below_size_budget(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            notes_root = Path(temporary)
            asset = notes_root / "course" / "assets" / "diagram.svg"
            asset.parent.mkdir(parents=True)
            asset.write_text("<svg/>", encoding="utf-8")

            self.assertIsNone(tracked_violation(asset, notes_root))


if __name__ == "__main__":
    unittest.main()
