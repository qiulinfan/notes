# MATH217 personal homework migration receipt — HW07–HW10

## Authority and handling

Only the four finished PDFs in
`C:\Users\rynne\Desktop\math-notes-sources-review-2026-08-15\selected-sources\linear-algebra-math217\Homeworks`
were used as body authority.  Each source page was raster-rendered and
visually reviewed before transcription.  Text extraction was navigation only;
no raw, solution, worksheet, or other-homework document was consulted.

| Source PDF | Actual pages | Target | Visual processing status by source page/range |
| --- | ---: | --- | --- |
| `217-Hw-7-finished.pdf` | 18 | `homeworks/hw07.typ` | pp. 1–2: Part A 4.3 Ex. 14 and 28; p. 3: Ex. 60; p. 4: 5.1 Ex. 6 and 17; pp. 5–6: Ex. 26; pp. 7–8: Part B Problem 1; pp. 8–9: Problem 2; pp. 9–12: Problem 3; pp. 12–14: Problem 4; pp. 15–16: Problem 5; pp. 16–18: Problem 6. All rendered pages transcribed/reviewed. |
| `217-Hw-8-finished.pdf` | 18 | `homeworks/hw08.typ` | p. 1: 5.1 Ex. 45; p. 2: 5.2 Ex. 14; p. 3: Ex. 26; p. 4: 5.3 Ex. 36; p. 5: 5.4 Ex. 26; p. 6: Ex. 32; pp. 7–8: Part B Problem 1; pp. 8–10: Problem 2; pp. 10–11: Problem 3; pp. 12–13: Problem 4; pp. 14–17: Problem 5; pp. 17–18: Problem 6. All rendered pages reviewed. |
| `217-Hw-9-finished.pdf` | 14 | `homeworks/hw09.typ` | p. 1: 5.4 Ex. 27; p. 2: Ex. 31; p. 3: 5.5 Ex. 15; p. 4: Ex. 23; pp. 5–6: Ex. 32; pp. 7–9: Part B Problem 1; pp. 9–11: Problem 2; pp. 12–14: Problem 3. All rendered pages reviewed. |
| `217-Hw-10-finished.pdf` | 20 | `homeworks/hw10.typ` | p. 1: 6.1 Ex. 20; p. 2: Ex. 54; p. 3: 6.2 Ex. 42; p. 4: Ex. 50; p. 5: 6.3 Ex. 14; pp. 6–7: 7.1 Ex. 12; p. 8: Ex. 18; p. 9: Ex. 42; pp. 10–11: Part B Problem 1; pp. 12–14: Problem 2; pp. 14–16: Problem 3; pp. 16–18: Problem 4; pp. 18–20: Problem 5. All rendered pages reviewed. |

## Preserved source limits / TODOs

- `217-Hw-8-finished.pdf`, p. 18: Part B Problem 6(b) has no visible
  submitted proof after the visible conclusion of 6(a).  `hw08.typ` states
  this omission rather than inventing an answer.
- `217-Hw-9-finished.pdf`, pp. 12–14: Part B Problem 3(d–e) is present as
  assignment/prompt context but has no visible submitted response.  A precise
  PDF/page TODO is retained in `hw09.typ`; no answer was inferred.
- No page had an unreadable symbol requiring a speculative transcription.

## Modified files

- `notes/math/linear-algebra/homeworks/hw07.typ`
- `notes/math/linear-algebra/homeworks/hw08.typ`
- `notes/math/linear-algebra/homeworks/hw09.typ`
- `notes/math/linear-algebra/homeworks/hw10.typ`
- `notes/math/linear-algebra/migration-batches/homeworks-hw07-hw10.md`

## Validation

- `typst compile --root . notes/math/linear-algebra/homeworks/hw07.typ …` —
  passed; output rendered and visually checked (4 pages).
- `typst compile --root . notes/math/linear-algebra/homeworks/hw08.typ …` —
  passed; output rendered and visually checked (4 pages).
- `typst compile --root . notes/math/linear-algebra/homeworks/hw09.typ …` —
  passed; output rendered and visually checked (2 pages).
- `typst compile --root . notes/math/linear-algebra/homeworks/hw10.typ …` —
  passed; output rendered and visually checked (3 pages).
- Read-only `typst compile --root . notes/math/linear-algebra/main.typ …` is
  still blocked by the pre-existing `chapters/01-linear-equations.typ:19`
  error `unknown variable: nn`; no out-of-scope change was made.
- `git diff --check` was run after the migration changes.

Temporary source and output renders were kept under
`tmp/pdfs/linear-hw07-hw10/` only for validation and are removed at the end of
this batch.
