# Advanced Linear Algebra source manifest

The complete authority is the six-file snapshot at
`C:\Users\rynne\Desktop\math-notes-sources-review-2026-08-15\selected-sources\advanced-linear-algebra`.
No TeX, asset, or prose outside that snapshot is represented as source for this
course. Typst imports and the `qlnotes` wrapper are compilation scaffolding,
not source content.

| Selected source | Source lines | Typst target | Actual coverage | Exact TODO / source boundary |
| --- | --- | --- | --- | --- |
| `advanced-linear-algebra/main.tex` | 1–30 | `main.typ` | Exact: `\\title` (line 5), `\\subtitle` (6), `\\author` (7), `\\date` (8), `\\extrainfo` (10), and all five `\\input`s (24–28) in source order. The `qlnotes` wrapper supplies the document/start/end structure and renders the Chinese source text. | `main.tex:1–4` selects ElegantBook/ctex and `11pt`; these LaTeX package and class settings have no one-to-one local Typst transfer, so the existing shared `qlnotes` layout remains authoritative. `main.tex:12–16` is ElegantBook-only logo, cover, and colour configuration. `assets/M.jpg` is not among the six selected artifacts, so no cover/logo asset is migrated. |
| `advanced-linear-algebra/chapters/01-review-on-basic-concepts.tex` | 1–50 | `chapters/01-review-on-basic-concepts.typ` | Complete: chapter/section headings; original mixed Chinese-English prose; `subsapce` and `direct sum` definitions; list; both propositions; both theorems; remark; note; and the two source labels as Typst anchors. The source's `\\bigoplus` is rendered as compilable equivalent `⊕`. | No unresolved source content. |
| `advanced-linear-algebra/chapters/02-linear-functionals-and-duality.tex` | 1–5 | `chapters/02-linear-functionals-and-duality.typ` | Complete: exact chapter title and the empty `Linear functional` definition environment. | `chapters/02-linear-functionals-and-duality.tex:2–3` has an empty definition body. It remains an empty Typst definition shell; do not add a definition without author source. |
| `advanced-linear-algebra/chapters/03-eigenvalues-and-operators.tex` | 1–3 | `chapters/03-eigenvalues-and-operators.typ` | Complete: exact chapter title only. | Source ends after blank lines 2–3; no body exists to migrate. |
| `advanced-linear-algebra/chapters/04-operators-on-complex-vector-spaces.tex` | 1–3 | `chapters/04-operators-on-complex-vector-spaces.typ` | Complete: exact chapter title only. | Source ends after blank lines 2–3; no body exists to migrate. |
| `advanced-linear-algebra/chapters/05-multilinear-algebra.tex` | 1–2 | `chapters/05-multilinear-algebra.typ` | Complete: exact chapter title only. | Source ends after blank line 2; no body exists to migrate. |

`reference.bib` is retained as the existing course bibliography configuration,
but no reference-only artifact was selected as a source for this migration.
