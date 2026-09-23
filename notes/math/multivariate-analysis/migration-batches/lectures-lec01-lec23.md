# MATH 395 lectures lec01–lec23 migration receipt

## Scope and method

- **Authoritative visual sources:** the 23 PDF files in
  C:\Users\rynne\Desktop\math-notes-sources-review-2026-08-15\selected-sources\multivariate-analysis\lectures,
  limited to 395-lec01-Metric-Spaces.pdf through
  395-lec23-Partition-of-Unity(COV3).pdf.
- **Method:** every source page was rendered to the isolated temporary
  directory tmp/pdfs/multivar-lec01-lec23/ and visually checked. PDF text
  extraction was not treated as authority. Definitions, theorem statements,
  proof steps, examples, formulas, and the source's Chinese/English mixed
  annotations were transcribed into the indicated Typst chapters.
- **Out of scope:** homework PDFs, IBL sources, lectures outside lec01–lec23,
  and bibliography entries as course prose.

## Per-source visual migration status

| Source PDF | Actual pages | Page status | Target Typst file | Retained TODO |
| --- | ---: | --- | --- | --- |
| 395-lec01-Metric-Spaces.pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/01-metric-spaces-and-compactness.typ | None |
| 395-lec02-Compactness.pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/01-metric-spaces-and-compactness.typ | None |
| 395-lec03-cplt&ttl-bdd.pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/01-metric-spaces-and-compactness.typ | None |
| 395-lec04-Differentiation.pdf | 3 | pp. 1–3 — rendered, visually checked, transcribed | chapters/02-multivariable-differentiation.typ | None |
| 395-lec05-C1-class.pdf | 3 | pp. 1–3 — rendered, visually checked, transcribed | chapters/02-multivariable-differentiation.typ | None |
| 395-lec06-Mixed-Partials.pdf | 1 | p. 1 — rendered, visually checked, transcribed | chapters/02-multivariable-differentiation.typ | None |
| 395-lec07-Chain-Rule&Multinomial-Thm.pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/02-multivariable-differentiation.typ | None |
| 395-lec08-Product-Thm&Taylor-Thm.pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/02-multivariable-differentiation.typ | None |
| 395-lec09-IFT1.pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/03-implicit-and-inverse-functions.typ | None |
| 395-lec10-IFT2.pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/03-implicit-and-inverse-functions.typ | None |
| 395-lec11-Implicit-Differentiation.pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/03-implicit-and-inverse-functions.typ | None |
| 395-lec12-Implicit-Function-Thm.pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/03-implicit-and-inverse-functions.typ | None |
| 395-lec13-Partition.pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/04-partitions-and-lebesgue-characterization.typ | None |
| 395-lec14-midreview.pdf | 4 | pp. 1–4 — rendered, visually checked, transcribed | chapters/04-partitions-and-lebesgue-characterization.typ | None |
| 395-lec15-Lebesgue-Characterization.pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/04-partitions-and-lebesgue-characterization.typ | None |
| 395-lec16-Lebesgue-Characterization-II.pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/04-partitions-and-lebesgue-characterization.typ | None |
| 395-lec17-Integral-over-Bdd-sets.pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/05-integration-and-change-of-variables.typ | None |
| 395-lec18-Extended-Integral-I.pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/05-integration-and-change-of-variables.typ | None |
| 395-lec19-Extended-Integral-II.pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/05-integration-and-change-of-variables.typ | None |
| 395-lec20-Change-of-Variable-Thm.pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/05-integration-and-change-of-variables.typ | None |
| 395-lec21-topological-properties-of-diffeo(CoV1).pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/05-integration-and-change-of-variables.typ | None |
| 395-lec22-diffeo-decomposition(COV2).pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/05-integration-and-change-of-variables.typ | None |
| 395-lec23-Partition-of-Unity(COV3).pdf | 2 | pp. 1–2 — rendered, visually checked, transcribed | chapters/05-integration-and-change-of-variables.typ | None |

Total source pages processed: **49**. No source text was left unreadable, so
there are no PDF/page-specific transcription TODOs.

## Reference handling

The user explicitly requested that the lectures retain their auxiliary
reference material. The six BibTeX records from
selected-sources/multivariate-analysis/reference-only/reference.bib
(en3, en2, en1, cn1, cn2, cn3) were copied faithfully to this course's
reference.bib. They were not added as lecture-body citations and no citations
or records were invented.

## Actual modified files

- notes/math/multivariate-analysis/chapters/01-metric-spaces-and-compactness.typ
- notes/math/multivariate-analysis/chapters/02-multivariable-differentiation.typ
- notes/math/multivariate-analysis/chapters/03-implicit-and-inverse-functions.typ
- notes/math/multivariate-analysis/chapters/04-partitions-and-lebesgue-characterization.typ
- notes/math/multivariate-analysis/chapters/05-integration-and-change-of-variables.typ
- notes/math/multivariate-analysis/reference.bib
- notes/math/multivariate-analysis/migration-batches/lectures-lec01-lec23.md

## Verification

- Independently compiled all five target chapters with Typst using project root
  .; all succeeded.
- Read-only integration compile of notes/math/multivariate-analysis/main.typ
  succeeded.
- Rendered the compiled chapter outputs for visual inspection (each chapter's
  first page; also the final page of chapter 05) and rendered representative
  main-document pages. No clipping, overflow, or missing-content defect was
  observed.
- Typst emitted only pre-existing shared-toolchain font warnings for unavailable
  PingFang SC / Songti SC; no chapter error occurred.
- git diff --check passed.
- Temporary rendered source pages, compiled PDFs, and QA PNGs were kept only in
  tmp/pdfs/multivar-lec01-lec23/ during migration and were removed after
  verification.
