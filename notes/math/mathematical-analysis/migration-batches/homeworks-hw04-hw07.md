# Mathematical Analysis homeworks HW04–HW07 migration receipt

Batch date: 2026-08-16
Authoritative source directory:
`C:\Users\rynne\Desktop\math-notes-sources-review-2026-08-15\selected-sources\mathematical-analysis-single\Homework`

The rendered visual PDF pages were the authority for this migration. Text
extraction was used only to navigate pages. The four personal homework PDFs
below are the only body authority. The raw assignments and the solution
collection were rendered and visually checked only to confirm problem numbers
and symbols; no assignment wording or official solution prose was substituted
for personal work.

## Source coverage and authority

| Source PDF | Actual pages | Role | Destination | Visual coverage / use |
|---|---:|---|---|---|
| `451-hw-4.pdf` | 15 | **Body authority**: personal handwritten work and its printed prompts | `homeworks/hw04.typ` | pp. 1–15 rendered and visually read. pp. 14–15 are blank; p. 13 has printed problems 12–14 without a handwritten answer. |
| `451-hw-5.pdf` | 15 | **Body authority**: personal handwritten work and its printed prompts | `homeworks/hw05.typ` | pp. 1–15 rendered and visually read. p. 15 has optional problems 14–15 but no handwritten response. |
| `451-hw-6.pdf` | 16 | **Body authority**: personal handwritten work and its printed prompts | `homeworks/hw06.typ` | pp. 1–16 rendered and visually read. p. 16 has optional problem 13 but no handwritten response. |
| `451-hw-7.pdf` | 15 | **Body authority**: personal handwritten work and its printed prompts | `homeworks/hw07.typ` | pp. 1–15 rendered and visually read. pp. 14–15 contain printed problems 13–14 but no handwritten response. |
| `451-hw-4-raw.pdf` | 2 | Reference-only assignment | `homeworks/hw04.typ` | pp. 1–2 rendered and visually checked only for prompt numbering and notation; no body text imported. |
| `451-hw-5-raw.pdf` | 2 | Reference-only assignment | `homeworks/hw05.typ` | pp. 1–2 rendered and visually checked only for prompt numbering and notation; no body text imported. |
| `451-hw-6-raw.pdf` | 2 | Reference-only assignment | `homeworks/hw06.typ` | pp. 1–2 rendered and visually checked only for prompt numbering and notation; no body text imported. |
| `451-hw-7-raw.pdf` | 2 | Reference-only assignment | `homeworks/hw07.typ` | pp. 1–2 rendered and visually checked only for prompt numbering and notation; no body text imported. |
| `451-hw-sol-all.pdf` | 26 | Reference-only official solution collection | `homeworks/hw04.typ`, `homeworks/hw05.typ`, `homeworks/hw06.typ`, `homeworks/hw07.typ` | Relevant pp. 13–16 (HW4), 17–20 (HW5), 21–23 (HW6), and 24–26 (HW7) rendered and visually checked only for page identity, problem numbering, and symbols. No solution prose or proof was transcribed. |

## Retained precise TODOs

- `451-hw-4.pdf` p. 13, problems 12–14; pp. 14–15: printed prompts are present but the personal submission has no handwritten solution.
- `451-hw-5.pdf` p. 15, optional problems 14–15: printed prompts are present but the personal submission has no handwritten solution.
- `451-hw-6.pdf` p. 16, optional problem 13: printed prompt is present but the personal submission has no handwritten solution.
- `451-hw-7.pdf` p. 14, problem 13; p. 15, problem 14: printed prompts are present but the personal submission has no handwritten solution.

There were no visually unreadable mathematical passages in the personal body
sources. The TODOs above record source-absent work, not reconstruction gaps.

## Modified files and exact scope

- `notes/math/mathematical-analysis/homeworks/hw04.typ` — HW4 problems 1–11, retained Chinese margin notes, and labeled unsolved printed problems 12–14.
- `notes/math/mathematical-analysis/homeworks/hw05.typ` — HW5 problems 1–13, retained Chinese margin notes, and labeled unsolved optional problems 14–15.
- `notes/math/mathematical-analysis/homeworks/hw06.typ` — HW6 problems 1–12, retained Chinese margin notes, and labeled unsolved optional problem 13.
- `notes/math/mathematical-analysis/homeworks/hw07.typ` — HW7 problems 1–12, retained Chinese margin notes, and labeled unsolved problems 13–14.
- `notes/math/mathematical-analysis/migration-batches/homeworks-hw04-hw07.md` — this receipt only.

No source PDF, page render, OCR output, or generated PDF was placed under
`notes/`.

## Validation

All commands below passed on 2026-08-16. Temporary outputs were created only
under `tmp/pdfs/analysis-hw04-hw07`, never under `notes/`. Cleanup of that
exact directory was attempted after validation: one text-extraction navigation
file was removed, but the execution environment blocked the authorized
recursive deletion command before it ran on the remaining generated binary
artifacts. The remaining temporary directory is confined to that path and
needs a permitted cleanup action.

- `typst compile --root . notes/math/mathematical-analysis/homeworks/hw04.typ tmp/pdfs/analysis-hw04-hw07/compiled-final/hw04.pdf` — pass; rendered 4 pages and visually checked for clipping, overflow, and missing glyphs.
- `typst compile --root . notes/math/mathematical-analysis/homeworks/hw05.typ tmp/pdfs/analysis-hw04-hw07/compiled-final/hw05.pdf` — pass; rendered 5 pages and visually checked for clipping, overflow, and missing glyphs.
- `typst compile --root . notes/math/mathematical-analysis/homeworks/hw06.typ tmp/pdfs/analysis-hw04-hw07/compiled-final/hw06.pdf` — pass; rendered 4 pages and visually checked for clipping, overflow, and missing glyphs.
- `typst compile --root . notes/math/mathematical-analysis/homeworks/hw07.typ tmp/pdfs/analysis-hw04-hw07/compiled-final/hw07.pdf` — pass; rendered 5 pages and visually checked for clipping, overflow, and missing glyphs.
- `typst compile --root . notes/math/mathematical-analysis/homeworks.typ tmp/pdfs/analysis-hw04-hw07/homeworks-integration.pdf` — pass (read-only integration compile). It emitted only existing local font-family warnings for `Songti SC` and `PingFang SC` declared by `notes/math/toolchain/qlnotes.typ`.
- `git diff --check` — pass; the only output was the pre-existing, unrelated
  working-copy line-ending warning for `knowledge/sources.json`, which is outside
  this batch's write scope.
