# MATH 451 homework migration receipt — HW01–HW03

## Scope and authority

This receipt covers only the three personal finished submissions and their
specified checking aids. The personal submissions are the sole authority for
solution prose, proof steps, calculations, language choice, and handwritten
annotations. The checking aids were used only to identify problem numbering and
symbols; no raw-assignment or official-solution prose was transcribed as the
student's body.

| Source file | Actual PDF pages | Role | Target | Visual coverage |
| --- | ---: | --- | --- | --- |
| `Homework/451-Hw-1.pdf` | 18 | body — personal finished work | `homeworks/hw01.typ` | Rendered and visually read pp. 1–18; p. 18 is blank. |
| `Homework/451-hw-1-raw.pdf` | 2 | reference-only — prompt/notation check | none | Used only for task/notation cross-checking. |
| `Homework/451-hw-sol-all.pdf` (used pp. 1–4) | 26 | reference-only — checking material | none | Used only for problem-number/notation cross-checking. |
| `Homework/451-hw-2.pdf` | 16 | body — personal finished work | `homeworks/hw02.typ` | Rendered and visually read pp. 1–16; pp. 15–16 are blank. |
| `Homework/451-hw-2-raw.pdf` | 2 | reference-only — prompt/notation check | none | Used only for task/notation cross-checking. |
| `Homework/451-hw-sol-all.pdf` (used pp. 5–8) | 26 | reference-only — checking material | none | Used only for problem-number/notation cross-checking. |
| `Homework/451-hw-3.pdf` | 13 | body — personal finished work | `homeworks/hw03.typ` | Rendered and visually read pp. 1–13. |
| `Homework/451-hw-3-raw.pdf` | 2 | reference-only — prompt/notation check | none | Used only for task/notation cross-checking. |
| `Homework/451-hw-sol-all.pdf` (used pp. 9–12) | 26 | reference-only — checking material | none | Used only for problem-number/notation cross-checking. |

## Exact migration content

- `homeworks/hw01.typ`: personal HW1 pp. 1–18; all numbered problems 1–12,
  including the red Chinese/English annotations, submitted proofs, calculations,
  answer lists, and the page-17 optional-problem answer.
- `homeworks/hw02.typ`: personal HW2 pp. 1–16; all numbered problems 1–12,
  including red annotations, proof steps, and the printed but unanswered
  optional Problems 13–14.
- `homeworks/hw03.typ`: personal HW3 pp. 1–13; all numbered problems 1–15,
  including red Chinese/English annotations, submitted proofs, calculations,
  answers, and counterexamples.

## Source-exact TODOs

- `451-hw-2.pdf`, p. 14, optional Problems 13(a)–14: the finished submission
  prints the prompts but includes no personal answer. Source pp. 15–16 are
  blank. This was not filled from either checking-only source.

HW1 and HW3 have no missing or illegible personal-work content. HW1 p. 18 is
a blank final PDF page, as recorded in the visual-coverage table, rather than
a missing continuation of Problem 12.

## Validation

- Individual compile: `typst compile --root .` succeeded for `hw01.typ`,
  `hw02.typ`, and `hw03.typ`. The rendered individual outputs are 5, 4, and 4
  A4 pages, respectively.
- Render and visual QA: every generated page was rendered to PNG (144 dpi) and
  visually inspected. No clipping, page-edge overflow, unreadable glyphs, or
  missing Chinese characters were observed.
- Known compile warning: the shared `qlnotes.typ` requests `PingFang SC`, which
  is not installed in this Windows environment. Typst falls back for the
  shared sans-serif styles; this batch did not modify the shared template.
- Read-only integrated homework compile: attempted
  `typst compile --root . notes/math/mathematical-analysis/homeworks.typ`.
  It is blocked by the pre-existing unrelated error
  `homeworks/hw05.typ:137: unknown variable: range`; the include chain stops at
  `homeworks.typ:19`. The three migrated files compile independently.
- `git diff --check`: passed. Git emitted only an unrelated existing line-ending
  warning for `knowledge/sources.json`; no whitespace defect remains in the
  four batch files.

## Modification boundary

Only these files were written by this batch:

- `notes/math/mathematical-analysis/homeworks/hw01.typ`
- `notes/math/mathematical-analysis/homeworks/hw02.typ`
- `notes/math/mathematical-analysis/homeworks/hw03.typ`
- `notes/math/mathematical-analysis/migration-batches/homeworks-hw01-hw03.md`

All temporary source/final render files are confined to
`tmp/pdfs/analysis-hw01-hw03`; no PDFs, rendered images, OCR output, or other
generated material is stored under `notes/`. After validation, the exact
temporary directory (76 files, 10 child directories) was verified inside the
workspace and an explicit removal was attempted. The execution policy rejected
the deletion command, so this external-to-`notes/` temporary directory remains
for a top-level cleanup; no workaround was used.
