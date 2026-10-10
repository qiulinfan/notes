---
schema: kgdistiller-entry-v1
id: series
label: Series
kind: definition
aliases:
  - numerical series
source: notes/math/mathematical-analysis/chapters/06-numerical-series.tex
line_start: 4
line_end: 14
understanding: unknown
---

# Series

## Summary

A numerical series is defined through convergence of its sequence of partial sums.

## Evidence

```
\begin{definition}{\kn{Series}}

若 \(\left( a_{k} \right)_{k \in \ \mathbb{N}}\) 是 \(\mathbb{R}\) 中的一个 sequence，记

\[s_{n} = \sum\limits_{k = 1}^{n}a_{k}\]

为其 \(n\)th partial sum；\(\left( s_{n} \right)\) 是 sequence of partial sums。用 \(\sum_{k = 1}^{\infty}a_{k}\) 表示由 \(\left( a_{k} \right)\) 确定的 infinite series。

若 \(\lim_{n\rightarrow\infty}\sum_{k = 1}^{n}a_{k} = L\)，则 series \textbf{converges}；否则 \textbf{diverges}。Informally，\(\sum a_{k} < \infty\)。Note： \(\sum_{k = 1}^{\infty}a_{k}\) 代表一个 limit 而非 algebraic operation.

\end{definition}
```
