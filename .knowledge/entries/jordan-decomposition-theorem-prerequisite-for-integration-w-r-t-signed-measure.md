---
label: Jordan decomposition theorem prerequisite for integration w.r.t. signed measure
kind: prerequisite-for
prerequisite:
  - "[[jordan-decomposition-theorem]]"
dependent:
  - "[[integration-w-r-t-signed-measure]]"
source: notes/math/measure-theory/chapters/10-signed_measure&Jordan-decomposition.tex
lines: 574-584
---
signed integration is defined through the Jordan components

## Evidence

> \begin{definition}{\kn{integration w.r.t. signed measure}}
>
> 对于 signed measure \(\nu\), 我们 set:
>
> \[\left. L^{1}(\nu): = L^{1}( \middle| \nu \middle| ) = L^{1}(\nu^{+}) \cap L^{1}(\nu^{-}) \right.\]
>
> 且对于每个 \(f \in L^{1}(\nu)\), 我们 set:
>
> \[\int f\, d\nu: = \int f\, d\nu^{+} - \int f\, d\nu^{-}\]
>
> \end{definition}
