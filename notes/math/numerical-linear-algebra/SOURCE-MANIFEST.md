# Numerical Linear Algebra source manifest

The eight TeX files in the explicitly selected
`numerical-linear-algebra/chapters/` directory are the sole body authority for
this course. No source `main.tex`, bibliography file, PDF, homework, MATLAB
file, image asset, documentation, or script was selected. `main.typ` therefore
keeps its existing course metadata and includes; it has no selected TeX main
metadata to migrate. The DOI strings below are retained as literal
plain-source attributions, not as invented bibliography entries.

| Selected source | Role | Typst target | Alignment status | Exact outstanding TODO / source limitation |
| --- | --- | --- | --- | --- |
| `numerical-linear-algebra/chapters/01-tensor-products-and-matrix-multiplication.tex` | Body | `chapters/01-tensor-products-and-matrix-multiplication.typ` | Source body and all displayed formulae, proposition/theorem/proof/remark structure, and original Chinese/English mixing are aligned. | Lines 56–58 contain only `In md.` as the proof body; target preserves that literal source content and adds no proof. |
| `numerical-linear-algebra/chapters/02-orthogonal-vectors-and-matrices.tex` | Body | `chapters/02-orthogonal-vectors-and-matrices.typ` | Source body and all displayed formulae, definition/theorem/proof/corollary/remark structure, and original Chinese/English mixing are aligned. | Lines 93–96 contain only `In md.` followed by the rank-one notice; target preserves both literal source contents and adds no proof. |
| `numerical-linear-algebra/chapters/03-norms.tex` | Body | `chapters/03-norms.typ` | Source body, including the source's nested theorem/proof and its original Chinese/English mixing, is aligned. | Image references at lines 28 (`01-fundamentals.assets/Screenshot 2025-01-29 at 22.41.10.png`), 29 (`01-fundamentals.assets/Screenshot 2025-01-29 at 22.41.52.png`), and 89 (`01-fundamentals.assets/image-20250130003611232.png`) are not among selected sources; exact TODOs remain at their source locations in Typst. |
| `numerical-linear-algebra/chapters/04-svd.tex` | Body | `chapters/04-svd.typ` | The title, motivation, incomplete definition, and reduced-SVD heading are aligned exactly to the supplied source body. | Line 6 ends after `而 $\{v_1,\cdots,v_m\}$ 作为`; the target leaves the definition equally incomplete. Lines 11–24 contain only the `reduced SVD` heading and blank lines; no body is added. |
| `numerical-linear-algebra/chapters/05-qr-factorization.tex` | Body | `chapters/05-qr-factorization.typ` | Source body, equations, algorithm, headings, and original Chinese/English mixing are aligned. | Figure at lines 77–82 (`assets/Screenshot 2025-04-17 at 11.44.46.png`, caption `reduced QR`, label `fig:reduced QR`) is outside selected sources and remains an exact TODO. Lines 144–149 and 150–156 contain headings only; target adds no body. |
| `numerical-linear-algebra/chapters/06-discrete-fourier-transform.tex` | Body | `chapters/06-discrete-fourier-transform.typ` | Source title is aligned. | Lines 2–10 are blank; no body exists or is added. |
| `numerical-linear-algebra/chapters/07-conditioning-and-stability.tex` | Body | `chapters/07-conditioning-and-stability.typ` | Source body, formulae, table, theorem/proof/definition/example/remark structure, and original Chinese/English mixing are aligned. The line-1 DOI is preserved as a literal plain-source attribution. | Image references at lines 70–73 (`assets/condition1.png`), 138–143 (`assets/Screenshot 2025-04-15 at 00.21.49.png`, caption and label retained), and 297–302 (`assets/Screenshot 2025-04-15 at 10.56.30.png`, caption and label retained) are outside selected sources; exact TODOs remain in Typst. No selected bibliography file supplies `doi:10.1137/1.9780898719574.ch3`. |
| `numerical-linear-algebra/chapters/08-backward-error-analysis.tex` | Body | `chapters/08-backward-error-analysis.typ` | Source prose, Matlab verbatim blocks, displayed experiment, and headings are aligned. The line-1 DOI is preserved as a literal plain-source attribution. | Line 28 ends mid-sentence at `这个 QR 分解的 error`; target ends this sentence there before reproducing the following displayed experiment. Lines 44–80 have only the three following section headings and blank lines; target adds no body. No selected bibliography file supplies `doi:10.1137/1.9780898719574.ch3`. |

No reference-only files were selected for this course.
