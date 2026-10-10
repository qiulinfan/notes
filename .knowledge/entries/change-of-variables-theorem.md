---
label: Change-of-variables theorem
kind: theorem
aliases:
  - change of variables formula
source: notes/math/multivariate-analysis/chapters/05-integration-and-change-of-variables.tex
lines: 197-207
understanding: unknown
---
For a C^1 diffeomorphism between open subsets of R^n, the integral transforms by the absolute determinant of its derivative.

## Evidence

> \begin{theorem}{\kn{Change-of-variables theorem}}
>
> Let \(A,B \subset \mathbb{R}^{n}\) be open, let \(g:A\rightarrow B\) be a \(C^{1}\) diffeomorphism, and let \(f:B\rightarrow\mathbb{R}\) be continuous. Then
>
> \[f\ \text{is integrable over}\ B\quad\Leftrightarrow\quad f\left( {g(x)} \right)\left| {\det Dg(x)} \right|\ \text{is integrable over}\ A,\]
>
> and, whenever either condition holds,
>
> \[\int_{B}f(y)\, dy = \int_{A}f\left( {g(x)} \right)\left| {\det Dg(x)} \right|\, dx.\]
>
> \end{theorem}
