# Mathematical Analysis

This is a Typst-first, independently buildable MATH 451 project. `main.typ`
contains the lecture notes and `homeworks.typ` contains historical homework
material. Both use the shared `../toolchain/` rather than a local copy.

The selected homework directory includes personal submissions, raw working
copies, and a consolidated solution document. The handwritten/personal
transcriptions are labelled **personal work**; raw and solution documents are
explicitly marked **checking material**, never presented as the same authority.

`SOURCE-MANIFEST.md` is the page-level source map, including exact outstanding
transcription work. The pre-existing `期末复习整理.md` is retained unchanged.

```sh
make                 # lecture and homework HTML validation
make web-check       # lecture entry only
make export          # optional ignored snapshots
```

All local HTML, export snapshots, and intermediates remain under ignored
`build/` or `exports/`; no PDFs are written under `notes/`.
