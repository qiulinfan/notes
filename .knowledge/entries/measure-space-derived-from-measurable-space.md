---
label: measure space derived from measurable space
kind: derived-from
derived:
  - "[[measure-space]]"
origin:
  - "[[measurable-space-and-measure-space]]"
source: notes/math/measure-theory/chapters/01-sigma-algebra-与-measure.tex
lines: 206-224
---
The source forms a measure space by equipping a measurable space with a measure.

## Evidence

> \begin{definition}{\kn{measurable space} and \kn{measure space}}
>
> Let \(X\) be a set, \(\mathcal{M}\) be a \(\sigma\)-algebra on \(X\). We call \((X,\mathcal{M})\) a measurable space.\\
> A \kn{measure} on this measurable space is a function \(\mu:\mathcal{M}\rightarrow\lbrack 0,\infty)\) satisfying:
>
> \begin{enumerate}
> \item
>   \(\mu(\varnothing) = 0\)
> \item
>   countable additive:
>
>   \[\mu(\bigcup\limits_{i = 1}^{\infty}E_{i}) = \sum\limits_{i = 1}^{\infty}\mu(E_{i})\]
>
>   for disjoint seq of \(E_{i} \in \mathcal{M}\).
> \end{enumerate}
>
> 我们称 \((X,\mathcal{M},\mu)\) 为一个 measure space.
>
> \end{definition}
