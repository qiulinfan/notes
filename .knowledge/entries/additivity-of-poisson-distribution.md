---
schema: kgdistiller-entry-v1
id: additivity-of-poisson-distribution
label: additivity of Poisson distribution
kind: theorem
aliases: []
source: notes/math/prob/chapters/02-random-variables.tex
line_start: 1172
line_end: 1178
understanding: unknown
---

# additivity of Poisson distribution

## Summary

独立 Poisson 变量之和仍为 Poisson，参数为参数之和。

## Evidence

```
\begin{theorem}{\kn{additivity of Poisson distribution}}

如果 \(\mathit{X} \sim \text{Poi}(\mathit{\lambda}_{1})\), \(\mathit{Y} \sim \text{Poi}(\mathit{\lambda}_{2})\) are independent, 那么

\[\mathit{X} + \mathit{Y} \sim \text{Poi}(\mathit{\lambda}_{1} + \mathit{\lambda}_{2})\]

\end{theorem}
```
