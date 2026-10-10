---
label: L^ + space and integration on it prerequisite for Tonelli
kind: prerequisite-for
prerequisite:
  - "[[l-space-and-integration-on-it]]"
dependent:
  - "[[tonelli-theorem]]"
source: notes/math/measure-theory/chapters/06-product_measure&Fubini-Tonelli.tex
lines: 493-509
---
Tonelli integrates nonnegative measurable functions

## Evidence

> \begin{theorem}{\kn{Tonelli}}
>
> Let \((X,\mathcal{A},\mu)\), \((Y,\mathcal{B},\nu)\) be \(\sigma\)-finite measure spaces.\\
> 条件: 这里所用的非负可测函数积分空间见 \knref{l-space-and-integration-on-it}.\\
> 令 \(f \in L^{+}(X \times Y)\),\\
> 结论:
>
> \[g(x) := \int f(x,y) d\nu \in L^{+}(X)\quad h(y) := \int f(x,y) d\mu \in L^{+}(Y)\]
>
> (显然) 并且
>
> \[\begin{matrix}
> {\int f d(\mu \times \nu)} & {= \int\lbrack\int f(x,y) d\nu(y)\rbrack d\mu(x)} \\
>  & {= \int\lbrack\int f(x,y) d\mu(x)\rbrack d\nu(y)}
> \end{matrix}\]
>
> \end{theorem}
