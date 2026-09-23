# Multivariate Analysis homework migration: HW01--HW15

## Scope and authority

- Authority: visual reading of the PDF pages in `C:\Users\rynne\Desktop\math-notes-sources-review-2026-08-15\selected-sources\multivariate-analysis\Homework`.
- This batch migrates only the existing homework targets `hw01`, `hw02`, `hw03`, `hw04`, `hw05`, `hw07`, `hw08`, `hw09`, `hw10`, `hw12`, `hw13`, `hw14`, and `hw15`.
- `HW06` and `HW11` are confirmed missing from the selected-source set. No source was sought beyond that set and no corresponding target was created.

## Visual source coverage

Every listed page was rendered and visually read. The page ranges below are continuous and cover the whole source file.

| Source | Actual pages | Target | Visual coverage | TODO |
| --- | ---: | --- | --- | --- |
| `395-hw-01.pdf` | 1 | `homeworks/hw01.typ` | pp. 1--1 | None. |
| `395-hw-02.pdf` | 2 | `homeworks/hw02.typ` | pp. 1--2 | None. |
| `395-hw-03.pdf` | 3 | `homeworks/hw03.typ` | pp. 1--3 | None. |
| `395-hw-04.pdf` | 3 | `homeworks/hw04.typ` | pp. 1--3 | None. |
| `395-hw-05.pdf` | 5 | `homeworks/hw05.typ` | pp. 1--5 | p. 3, Problem H, forward direction Case 2 ends “idk”; p. 5, Sylvester-criterion converse is marked “didn't work at all.” |
| `395-hw-07.pdf` | 4 | `homeworks/hw07.typ` | pp. 1--4 | None. |
| `395-hw-08.pdf` | 1 | `homeworks/hw08.typ` | pp. 1--1 | None. |
| `395-hw-09.pdf` | 4 | `homeworks/hw09.typ` | pp. 1--4 | None. |
| `395-hw-10.pdf` | 4 | `homeworks/hw10.typ` | pp. 1--4 | None. |
| `395-hw-12.pdf` | 5 | `homeworks/hw12.typ` | pp. 1--5 | None. |
| `395-hw-13.pdf` | 4 | `homeworks/hw13.typ` | pp. 1--4 | None. |
| `395-hw-14.pdf` | 2 | `homeworks/hw14.typ` | pp. 1--2 | None. |
| `395-hw-15.pdf` | 3 | `homeworks/hw15.typ` | pp. 1--3 | p. 3, Bonus has printed questions only and no handwritten solution. |

Actual source coverage: 13 PDFs and 41 pages.

## Validation

- Compiled each of the 13 target files individually with `typst compile --root .`; all succeeded (16 rendered output pages in total).
- Rendered the individual compiled PDFs for visual inspection. The final renders were checked for readable equations, clipping, overflow, and page breaks.
- Performed a read-only integrated compilation of `notes/math/multivariate-analysis/homeworks.typ` with `typst compile --root .`; it succeeded and produced 20 pages. The only diagnostics were the repository template's pre-existing unavailable-font warnings for `Songti SC` and `PingFang SC`.
- Ran `git diff --check`.

## Modified scope

Only the 13 listed homework `.typ` files and this receipt are part of this batch. No source PDF, rendered image, OCR artifact, generated PDF, or HW06/HW11 target is retained under `notes/`.
