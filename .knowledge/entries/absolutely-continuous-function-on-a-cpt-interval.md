---
schema: kgdistiller-entry-v1
id: absolutely-continuous-function-on-a-cpt-interval
label: absolutely continuous function on a cpt interval
kind: definition
aliases: []
source: notes/math/measure-theory/chapters/12-differentiation_on_real_spaces.tex
line_start: 854
line_end: 860
understanding: unknown
---

# absolutely continuous function on a cpt interval

## Summary

我们定义 $F : I arrow.r bb(C)$ 是 absolutely ctn 的, if 对于任意 $epsilon.alt > 0$ 都存在 $delta > 0$ 使得对于任意的 disjoint intervals $\(a_1\,b_1\)\,dots.h.c\,\(a_N\,b_N\)subset I$, 都有: $ sum_1^N\|F\(b_j\)- F\(a_j\)\|< epsilon.alt quad upright("whenever") quad sum_1^N\|b_j - a_j\|< delta $

## Evidence

```
\begin{definition}{\kn{absolutely continuous function on a cpt interval}}

我们定义 \(F:I\rightarrow\mathbb{C}\) 是 absolutely ctn 的, if 对于任意 \(\varepsilon > 0\) 都存在 \(\delta > 0\) 使得对于任意的 disjoint intervals \((a_{1},b_{1}),\cdots,(a_{N},b_{N}) \subset I\), 都有:

\[\left. \sum\limits_{1}^{N} \middle| F(b_{j}) - F(a_{j}) \middle| < \varepsilon\quad\text{whenever}\quad\sum\limits_{1}^{N} \middle| b_{j} - a_{j} \middle| < \delta \right.\]

\end{definition}
```
