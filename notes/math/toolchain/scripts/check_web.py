#!/usr/bin/env python3
"""Check a generated QLNotes HTML document for web-output invariants."""

from __future__ import annotations

import argparse
import sys
from html.parser import HTMLParser
from pathlib import Path


class CheckError(RuntimeError):
    """Raised when a web output violates the QLNotes contract."""


class QLNotesHTMLParser(HTMLParser):
    def __init__(self) -> None:
        super().__init__(convert_charrefs=True)
        self.in_title = False
        self.title_parts: list[str] = []
        self.has_site_shell = False
        self.has_toc = False
        self.has_utf8_charset = False
        self.math_count = 0
        self.svg_count = 0
        self.data_image_count = 0
        self.knowledge_ids: list[str] = []
        self.reference_ids: list[str] = []
        self.diagram_ids: list[str] = []
        self.diagram_svg: list[bool] = []
        self._open_diagrams: list[int] = []

    def handle_starttag(
        self, tag: str, attrs: list[tuple[str, str | None]]
    ) -> None:
        values = {name: value or "" for name, value in attrs}
        classes = set(values.get("class", "").split())

        if tag == "title":
            self.in_title = True
        if tag == "meta" and values.get("charset", "").lower().replace("-", "") == "utf8":
            self.has_utf8_charset = True
        if "ql-site" in classes:
            self.has_site_shell = True
        if tag == "nav" and values.get("role") == "doc-toc":
            self.has_toc = True
        if tag == "math":
            self.math_count += 1
        if tag == "svg":
            self.svg_count += 1
            for index in self._open_diagrams:
                self.diagram_svg[index] = True
        if tag == "img" and values.get("src", "").startswith("data:image/"):
            self.data_image_count += 1

        knowledge_id = values.get("data-ql-kn")
        if knowledge_id:
            self.knowledge_ids.append(knowledge_id)
        reference_id = values.get("data-ql-ref")
        if reference_id:
            self.reference_ids.append(reference_id)

        if tag == "figure" and "ql-diagram" in classes:
            diagram_id = values.get("data-ql-id") or values.get("id")
            if not diagram_id:
                raise CheckError("diagram figure is missing a stable ID")
            if values.get("role") != "img":
                raise CheckError(f"diagram {diagram_id} must use role=img")
            if not values.get("aria-label", "").strip():
                raise CheckError(f"diagram {diagram_id} is missing aria-label alt text")
            self.diagram_ids.append(diagram_id)
            self.diagram_svg.append(False)
            self._open_diagrams.append(len(self.diagram_ids) - 1)

    def handle_endtag(self, tag: str) -> None:
        if tag == "title":
            self.in_title = False
        if tag == "figure" and self._open_diagrams:
            self._open_diagrams.pop()

    def handle_data(self, data: str) -> None:
        if self.in_title:
            self.title_parts.append(data)

    @property
    def title(self) -> str:
        return "".join(self.title_parts).strip()


def check(args: argparse.Namespace) -> None:
    html_path = args.html.resolve()
    if not html_path.is_file():
        raise CheckError(f"missing HTML output: {html_path}")
    text = html_path.read_text(encoding="utf-8")
    if "\ufffd" in text:
        raise CheckError("replacement character found in generated HTML")
    mojibake_markers = ("Ã", "Â", "â€", "ï¿½", "锟斤拷")
    found_mojibake = [marker for marker in mojibake_markers if marker in text]
    if found_mojibake:
        raise CheckError(f"common mojibake marker found: {found_mojibake}")

    parser = QLNotesHTMLParser()
    parser.feed(text)
    parser.close()

    if not parser.title:
        raise CheckError("HTML document has no title")
    if not parser.has_utf8_charset:
        raise CheckError("HTML document does not declare UTF-8")
    if not parser.has_site_shell:
        raise CheckError("HTML document has no ql-site responsive shell")
    if not parser.has_toc:
        raise CheckError("HTML document has no document table of contents")

    theme_markers = (
        ":root.dark",
        "--ql-canvas:",
        "--ql-paper:",
        "--ql-text:",
        "--ql-blue:",
        "--ql-primary-contrast:",
        "--ql-border:",
        'data-ql-theme="light"',
    )
    missing_theme_markers = [marker for marker in theme_markers if marker not in text]
    if missing_theme_markers:
        raise CheckError(
            f"shared QLNotes light/dark theme is incomplete: {missing_theme_markers}"
        )

    id_counts = {
        identifier: parser.knowledge_ids.count(identifier)
        for identifier in set(parser.knowledge_ids)
    }
    duplicates = sorted(
        identifier for identifier, count in id_counts.items() if count > 1
    )
    if duplicates:
        raise CheckError(f"duplicate semantic IDs: {duplicates}")
    invalid = sorted(
        identifier
        for identifier in parser.knowledge_ids + parser.reference_ids
        if not identifier.isascii() or not identifier.strip()
    )
    if invalid:
        raise CheckError(f"invalid semantic IDs: {invalid}")
    missing_svg = [
        identifier
        for identifier, has_svg in zip(parser.diagram_ids, parser.diagram_svg)
        if not has_svg
    ]
    if missing_svg:
        raise CheckError(f"diagram figures without inline SVG: {missing_svg}")
    if args.expected_nodes is not None and len(parser.knowledge_ids) != args.expected_nodes:
        raise CheckError(
            f"knowledge node count is {len(parser.knowledge_ids)}, expected {args.expected_nodes}"
        )
    if args.expected_diagrams is not None and len(parser.diagram_ids) != args.expected_diagrams:
        raise CheckError(
            f"diagram count is {len(parser.diagram_ids)}, expected {args.expected_diagrams}"
        )

    print(f"OK: {html_path}")
    print(
        f"title: {parser.title}; knowledge nodes: {len(parser.knowledge_ids)}; "
        f"references: {len(parser.reference_ids)}; "
        f"diagrams: {len(parser.diagram_ids)}; inline SVGs: {parser.svg_count}; "
        f"embedded authored images: {parser.data_image_count}; "
        f"math elements: {parser.math_count}"
    )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("html", type=Path, help="generated QLNotes HTML file")
    parser.add_argument("--expected-nodes", type=int)
    parser.add_argument("--expected-diagrams", type=int)
    return parser.parse_args()


def main() -> int:
    try:
        check(parse_args())
    except (CheckError, OSError, UnicodeError) as error:
        print(f"web check failed: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
