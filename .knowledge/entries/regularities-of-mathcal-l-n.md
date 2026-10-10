---
schema: kgdistiller-entry-v1
id: regularities-of-mathcal-l-n
label: regularities of L^n
kind: theorem
aliases:
  - regularities of cal(L)^n
source: notes/math/measure-theory/chapters/07-Lebesgue_measure_on_R^n.tex
line_start: 67
line_end: 86
understanding: unknown
---

# regularities of L^n

## Summary

If $E subset cal(L)^n$, 则有: - outer regularity: $ m\(E\)= inf { m\(U\)divides U upright(" open") supset E } $ - inner regularity: $ m\(E\)= sup { m\(K\)divides K upright(" compact") subset E } $ - if $m\(E\)< oo$, 则对于任意 $epsilon.alt > 0$, 都存在 disjoint rectangles $R_1\,dots.h.c R_N$ with sides that are open intervals (literally rectangles) s.t. $ m\(E Delta union.big_j R_j\)< epsilon.alt $

## Evidence

```
\begin{theorem}{\kn{regularities of $\mathcal{L}^n$}}

If \(E \subset \mathcal{L}^{n}\), 则有:

\begin{itemize}
\item
  \textbf{outer regularity}:

  \[m(E) = \inf\left\{ {m(U) \mid U\ \text{open} \supset E} \right\}\]
\item
  \textbf{inner regularity}:

  \[m(E) = \sup\left\{ {m(K) \mid K\ \text{compact} \subset E} \right\}\]
\item
  if \(m(E) < \infty\), 则对于任意 \(\varepsilon > 0\), 都存在 disjoint rectangles \(R_{1},\cdots R_{N}\) with sides that are open intervals (literally rectangles) s.t.

  \[m(E\Delta\bigcup\limits_{j}R_{j}) < \varepsilon\]
\end{itemize}

\end{theorem}
```
