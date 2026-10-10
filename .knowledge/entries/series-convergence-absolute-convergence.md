---
schema: kgdistiller-entry-v1
id: series-convergence-absolute-convergence
label: "series: convergence 和 absolute convergence"
kind: definition
aliases: []
source: notes/math/measure-theory/chapters/09-L^P-space_and_inequalities.tex
line_start: 68
line_end: 84
understanding: unknown
---

# series: convergence 和 absolute convergence

## Summary

对于一个 normed VS $\(V\,\|\|dot.op\|\|\)$ 中的 seq $\(v_n\)$, 我们称 $sum_(n = 1)^oo v_n$ converges, 如果存在 $v in V$ s.t. $ lim_(N arrow.r oo) sum_(n = 1)^N v_n = v $ 即 $ lim_(N arrow.r oo) parallel v - sum_(n = 1)^N v_n parallel = 0 $ 我们称 $sum_(n = 1)^oo v_n$ absolutely converges, 如果 $ sum_(n = 1)^oo\|\|v_n\|\|< oo $ 即这个 series 对应的 norm series converges to some real number.

## Evidence

```
\begin{definition}{\kn{series: convergence 和 absolute convergence}}

对于一个 normed VS \(\left. (V, \middle| \middle| \cdot \middle| \middle| ) \right.\) 中的 seq \((v_{n})\), 我们称 \(\sum_{n = 1}^{\infty}v_{n}\) \textbf{converges}, 如果存在 \(v \in V\) s.t.

\[\lim\limits_{N\rightarrow\infty}\sum\limits_{n = 1}^{N}v_{n} = v\]

即

\[\lim\limits_{N\rightarrow\infty} \parallel v - \sum\limits_{n = 1}^{N}v_{n} \parallel = 0\]

我们称 \(\sum_{n = 1}^{\infty}v_{n}\) \textbf{absolutely converges}, 如果

\[\left. \sum\limits_{n = 1}^{\infty} \middle| \middle| v_{n} \middle| \middle| < \infty \right.\]

即这个 series 对应的 norm series converges to some real number.

\end{definition}
```
