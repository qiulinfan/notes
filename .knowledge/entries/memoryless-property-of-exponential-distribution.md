---
schema: kgdistiller-entry-v1
id: memoryless-property-of-exponential-distribution
label: memoryless property of exponential distribution
kind: theorem
aliases: []
source: notes/math/prob/chapters/02-random-variables.tex
line_start: 1356
line_end: 1362
understanding: unknown
---

# memoryless property of exponential distribution

## Summary

指数分布满足 P(X>s+t｜X>s)=P(X>t)。

## Evidence

```
\begin{theorem}{\kn{memoryless property of exponential distribution}}

任意 continuous RV,

\[\mathbb{P}(\mathit{X} > \mathit{b} + \mathit{t} \mid \mathit{X} > \mathit{b}) = \mathbb{P}(\mathit{X} > \mathit{t})\Leftrightarrow\mathit{X}\ \text{is an exponential random variable}\]

\end{theorem}
```
