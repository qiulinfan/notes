---
schema: kgdistiller-entry-v1
id: fubini-for-series-and-integral
label: Fubini for series and integral
kind: corollary
aliases: []
source: notes/math/measure-theory/chapters/05-integration_of_real_and_complex_functions.tex
line_start: 358
line_end: 368
understanding: unknown
---

# Fubini for series and integral

## Summary

对于 $L^1\(mu\)$ 中的 sequence $\(f_n\)$, 如果 $sum_(n = 1)^oo integral\|f_n\|< oo$, 则 $ sum_(n = 1)^oo f_n arrow.r^(a . e .) F in L^1\(mu\) $ 并且 $ integral sum_(n = 1)^oo f_n = integral F = sum_(n = 1)^oo integral f_n $

## Evidence

```
\begin{corollary}{\kn{Fubini for series and integral}}

对于 \(L^{1}(\mu)\) 中的 sequence \((f_{n})\), 如果 \(\left. \sum_{n = 1}^{\infty}\int \middle| f_{n} \middle| < \infty \right.\), 则

\[\sum\limits_{n = 1}^{\infty}f_{n}\overset{a.e.}{\rightarrow}F \in L^{1}(\mu)\]

并且

\[\int\sum\limits_{n = 1}^{\infty}f_{n} = \int F = \sum\limits_{n = 1}^{\infty}\int f_{n}\]

\end{corollary}
```
