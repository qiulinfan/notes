---
schema: kgdistiller-entry-v1
id: integration-w-r-t-signed-measure
label: integration w.r.t. signed measure
kind: definition
aliases: []
source: notes/math/measure-theory/chapters/10-signed_measure&Jordan-decomposition.tex
line_start: 574
line_end: 584
understanding: unknown
---

# integration w.r.t. signed measure

## Summary

对于 signed measure $nu$, 我们 set: $ L^1\(nu\): = L^1\(\|nu\|\)= L^1\(nu^(+)\)inter L^1\(nu^(-)\) $ 且对于每个 $f in L^1\(nu\)$, 我们 set: $ integral f thin d nu : = integral f thin d nu^(+) - integral f thin d nu^(-) $

## Evidence

```
\begin{definition}{\kn{integration w.r.t. signed measure}}

对于 signed measure \(\nu\), 我们 set:

\[\left. L^{1}(\nu): = L^{1}( \middle| \nu \middle| ) = L^{1}(\nu^{+}) \cap L^{1}(\nu^{-}) \right.\]

且对于每个 \(f \in L^{1}(\nu)\), 我们 set:

\[\int f\, d\nu: = \int f\, d\nu^{+} - \int f\, d\nu^{-}\]

\end{definition}
```
