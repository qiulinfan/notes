---
label: Generalized DCT generalizes dominated convergence theorem
kind: generalizes
general:
  - "[[generalized-dct]]"
special:
  - "[[dominated-convergence-theorem]]"
source: notes/math/measure-theory/homeworks/hw08-on_L^p-spacecs.tex
lines: 434-452
---
the source replaces a fixed integrable dominator by a convergent sequence of nonnegative dominators

## Evidence

> \begin{theorem}{\kn{Generalized DCT}}
>
> Let \((X,\mathcal{A},\mu)\) be a measure space, and \(f_{n},g_{n},f,g \in L^{1}\), \(n \in \mathbb{N}\). This is the varying-dominator extension of \knref{dominated-convergence-theorem}.\\
> Suppose that
>
> \begin{itemize}
> \item
>   \(\lim_{n\rightarrow\infty}f_{n}(x) = f(x)\) and \(\lim_{n\rightarrow\infty}g_{n}(x) = g(x)\) for a.e. \(x\);
> \item
>   \(\left. |f_{n}(x) \middle| \leq g_{n}(x) \right.\) a.e. for every \(n \in \mathbb{N}\);
> \item
>   \(g_{n}:X\rightarrow\lbrack 0,\infty\rbrack\) and \(\lim_{n\rightarrow\infty}\int g_{n} d\mu = \int g d\mu\).
> \end{itemize}
>
> Then we have:
>
> \[\lim\limits_{n\rightarrow\infty}\int f_{n} d\mu = \int f d\mu\]
>
> \end{theorem}
