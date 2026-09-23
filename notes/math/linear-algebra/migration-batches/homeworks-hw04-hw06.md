# MATH217 personal-homework migration receipt: HW04-HW06

## Sources and page review

| Source PDF | Actual pages | Visual processing status | Target |
| --- | ---: | --- | --- |
| `217-Hw-4-finished.pdf` | 22 | pp. 1-2 Exercise 28; p. 3 Exercise 30; p. 4 Exercise 42; pp. 5-6 Exercises 6 and 14; pp. 7-10 Part B Problem 1; pp. 10-13 Part B Problem 2; pp. 14-16 Part B Problem 3; pp. 16-20 Part B Problem 4; pp. 20-22 Part B Problem 5. Every page rendered and visually checked. | `notes/math/linear-algebra/homeworks/hw04.typ` |
| `217-Hw-5-finished.pdf` | 23 | pp. 1-2 Exercise 56; pp. 2-3 Exercise 33; pp. 3-4 Exercise 63; pp. 4-5 Exercise 12; pp. 5-6 Exercise 28; pp. 7-8 Part A Problem 6; pp. 8-9 Part B Problem 1; pp. 10-12 Part B Problem 2; pp. 13-16 Part B Problem 3; pp. 17-18 Part B Problem 4; pp. 19-23 Part B Problem 5. Every page rendered and visually checked. | `notes/math/linear-algebra/homeworks/hw05.typ` |
| `217-Hw-6-finished.pdf` | 27 | pp. 1-2 Exercise 50; pp. 2-3 Exercise 70; pp. 4-5 Exercise 58; p. 6 Exercise 46; p. 7 Exercise 68; pp. 8-11 Part B Problem 1; pp. 12-16 Part B Problem 2; pp. 17-21 Part B Problem 3; pp. 21-23 Part B Problem 4; pp. 24-27 Part B Problem 5. Every page rendered and visually checked. | `notes/math/linear-algebra/homeworks/hw06.typ` |

All body content was transcribed only from the specified personal `finished`
PDFs. Text extraction was used for page navigation only; every transcription
was checked against its rendered source page.

## TODOs

None. All mathematical symbols retained in the targets were visually legible
in the source PDFs.

## Actual modifications

- `notes/math/linear-algebra/homeworks/hw04.typ`
- `notes/math/linear-algebra/homeworks/hw05.typ`
- `notes/math/linear-algebra/homeworks/hw06.typ`
- `notes/math/linear-algebra/migration-batches/homeworks-hw04-hw06.md`

## Validation

Individual compile and generated-PDF visual review both passed:

| Target | Compile result | Generated-PDF visual review |
| --- | --- | --- |
| `homeworks/hw04.typ` | passed | 4 of 4 output pages rendered and checked |
| `homeworks/hw05.typ` | passed | 4 of 4 output pages rendered and checked |
| `homeworks/hw06.typ` | passed | 6 of 6 output pages rendered and checked |

`notes/math/linear-algebra/main.typ` was also compiled as a read-only
integration check. It is currently blocked before it reaches these homework
targets by an out-of-scope error in
`chapters/01-linear-equations.typ:19` (`unknown variable: nn`). No shared or
out-of-scope file was changed to suppress that error.

`git diff --check` passed. Temporary source renders and compile outputs were
kept outside `notes/` and removed after this validation.
