---
schema: kgdistiller-entry-v1
id: exponential-distribution
label: exponential distribution
kind: definition
aliases: []
source: notes/math/prob/chapters/02-random-variables.tex
line_start: 1289
line_end: 1302
understanding: unknown
---

# exponential distribution

## Summary

Exponential(λ) 在非负半轴有 λe^(−λx) 密度。

## Evidence

```
\begin{definition}{\kn{exponential distribution}}

我们称 \(\mathit{X}\) 为一个 \textbf{exponential random variable} with parameter \(\mathit{\lambda}\), 如果它的 pdf is given by:

\[\begin{matrix}
{\mathit{f}(\mathit{x}) = \{\mathit{\lambda}\mathit{e}^{- \mathit{\lambda}\mathit{x}},\quad\mathit{x} > 0} \\
{0,\quad\mathit{x} \leq 0}
\end{matrix}\]

写作

\[\mathit{X} \sim \text{Exp}(\mathit{\lambda})\]

\end{definition}
```
