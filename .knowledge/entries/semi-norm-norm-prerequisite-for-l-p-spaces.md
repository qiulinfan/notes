---
label: "semi-norm, norm prerequisite for L_p spaces"
kind: prerequisite-for
prerequisite:
  - "[[semi-norm-norm]]"
dependent:
  - "[[l-p-spaces]]"
source: notes/math/measure-theory/chapters/09-L^P-space_and_inequalities.tex
lines: 183-197
---
Lp spaces are organized by their p-norms

## Evidence

> \begin{definition}{\kn{$L_p$ spaces}}
>
> Consider \(p \in (0,\infty)\).\\
> Let \((X,\mathcal{A},\mu)\) 为一个 measure space.\\
> Define for \(f:X\rightarrow\mathbb{R}\) measurable:
>
> \[\left. | \middle| f \middle| \middle| {}_{p}: = (\int \middle| f \middle| {}_{p} d\mu)^{\frac{1}{p}} \in \lbrack 0,\infty\rbrack \right.\]
>
> Define
>
> \[L^{p}(\mu): = \left\{ f: \middle| \middle| f \middle| \middle| {}_{p} < \infty \right\}/ \sim\]
>
> where \(f \sim g\) if \(f = g\) a.e.
>
> \end{definition}
