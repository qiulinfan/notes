---
schema: kgdistiller-entry-v1
id: continuity-of-signed-measures
label: continuity from below and above for signed measures
kind: proposition
aliases: []
source: notes/math/measure-theory/chapters/10-signed_measure&Jordan-decomposition.tex
line_start: 77
line_end: 87
understanding: unknown
---

# continuity from below and above for signed measures

## Summary

给定 signed measure $nu$, 对于 increasing seq $E_j$, 有 $ nu\(union.big_(j = 1)^oo E_j\)= lim_(j arrow.r oo) nu\(E_j\) $ 对于 decreasing seq $F_j$, 有: $ nu\(inter.big_(j = 1)^oo F_j\)= lim_(j arrow.r oo) nu\(F_j\) $

## Evidence

```
\begin{proposition}{\kn{continuity from below and above for signed measures}}

给定 signed measure \(\nu\), 对于 increasing seq \(E_{j}\), 有

\[\nu(\bigcup\limits_{j = 1}^{\infty}E_{j}) = \lim\limits_{j\rightarrow\infty}\nu(E_{j})\]

对于 decreasing seq \(F_{j}\), 有:

\[\nu(\bigcap\limits_{j = 1}^{\infty}F_{j}) = \lim\limits_{j\rightarrow\infty}\nu(F_{j})\]

\end{proposition}
```
