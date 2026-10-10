---
label: "Hölder's ineq"
kind: theorem
source: notes/math/measure-theory/chapters/09-L^P-space_and_inequalities.tex
lines: 267-281
understanding: unknown
---
Consider conjugate pair: $p\,q in\[1\,oo\)$ s.t. $ 1 / p + 1 / q = 1 $ 则对于任意两个 measurable function $f\,g : X arrow.r bb(C)$, 一定有: $ parallel f g parallel_1 lt.eq parallel f parallel_p dot.op parallel g parallel_q $特别地, 如果 $f in L^p\(mu\)$, $g in L^q\(mu\)$, 则 $f g in L^1\(mu\)$, 并且 equality holds iff $ parallel g parallel_q^q\|f\|^p= parallel f parallel_p^p\|g\|^q quad mu upright("-a.e.") $

## Evidence

> \begin{theorem}{\kn{Hölder's ineq}}
>
> Consider conjugate pair: \(p,q \in \lbrack 1,\infty)\) s.t.
>
> \[\frac{1}{p} + \frac{1}{q} = 1\]
>
> 则对于任意两个 measurable function \(f,g:X\rightarrow\mathbb{C}\), 一定有:
>
> \[\parallel fg\underset{1}{\parallel} \leq \parallel f\underset{p}{\parallel} \cdot \parallel g\underset{q}{\parallel}\]
>
> 特别地, 如果 \(f \in L^{p}(\mu)\), \(g \in L^{q}(\mu)\), 则 \(fg \in L^{1}(\mu)\), 并且 equality holds iff
>
> \[\left. \parallel g\underset{q}{\overset{q}{\parallel}} \middle| f \middle| {}_{p} = \parallel f\underset{p}{\overset{p}{\parallel}} \middle| g \middle| {}_{q}\quad\mu\ \text{-a.e.} \right.\]
>
> \end{theorem}
