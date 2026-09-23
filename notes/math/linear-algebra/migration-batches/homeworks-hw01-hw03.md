# MATH217 Homework 1--3 visual migration receipt

Date: 2026-08-16

## Scope

Only the personal finished PDFs below were visually reviewed, page by page:

- `217-Hw-1-finished.pdf`, pages 1--23
- `217-Hw-2-finished.pdf`, pages 1--21
- `217-Hw-3-finished.pdf`, pages 1--19

No `raw`, `sol`, other homework, worksheet, reference-only, or surrounding review-tree source was used.

## Per-page completion

| Source | Completed visual pages | Destination coverage |
| --- | --- | --- |
| `217-Hw-1-finished.pdf` | 1--23 | `homeworks/hw01.typ`, one source-page heading for every page 1--23 |
| `217-Hw-2-finished.pdf` | 1--21 | `homeworks/hw02.typ`, one source-page heading for every page 1--21 |
| `217-Hw-3-finished.pdf` | 1--19 | `homeworks/hw03.typ`, one source-page heading for every page 1--19 |

Each destination preserves the visible personal answers, derivations, proofs, and necessary problem substance. Original English remains English; the reviewed pages did not contain Chinese prose requiring preservation.

## Exact transcription TODOs

- `TODO(217-Hw-1-finished.pdf, p. 16)`: one handwritten floor/ceiling bracket symbol in the proof for Problem 2(e) is not visually unambiguous. The surrounding argument and its conclusion are transcribed without guessing that symbol.

No other illegible handwritten content was identified.

## Modified files

- `notes/math/linear-algebra/homeworks/hw01.typ`
- `notes/math/linear-algebra/homeworks/hw02.typ`
- `notes/math/linear-algebra/homeworks/hw03.typ`
- `notes/math/linear-algebra/migration-batches/homeworks-hw01-hw03.md`

## Validation

Executed on 2026-08-16:

```text
typst compile --root . notes/math/linear-algebra/homeworks/hw01.typ tmp/hw01-migration-check.pdf
typst compile --root . notes/math/linear-algebra/homeworks/hw02.typ tmp/hw02-migration-check.pdf
typst compile --root . notes/math/linear-algebra/homeworks/hw03.typ tmp/hw03-migration-check.pdf
```

All three commands exited with status 0. The only emitted diagnostic was the pre-existing toolchain warning that the local environment lacks the `pingfang sc` font family.

`git diff --check` was also run after this receipt was written.
