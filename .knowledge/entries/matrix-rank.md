---
label: Matrix rank
kind: definition
aliases:
  - rank of a matrix
source: notes/math/linear-algebra/chapters/03-linear-combinations.tex
lines: 48-60
understanding: unknown
---
The number of leading ones in the reduced row-echelon form of a matrix.

## Evidence

> \begin{definition}{\kn{Matrix rank}}
>
> The number of leading \(1\)′s in \(\text{rref}(A)\) is denoted \(\text{rank}(A)\). For \(A = \begin{pmatrix}
> 1 & 2 & 3 \\
> 4 & 5 & 6 \\
> 7 & 8 & 9
> \end{pmatrix}\), \(\text{rref}(A) = \begin{pmatrix}
> 1 & 0 & {- 1} \\
> 0 & 1 & 2 \\
> 0 & 0 & 0
> \end{pmatrix}\), so \(\text{rank}(A) = 2\).
>
> \end{definition}
