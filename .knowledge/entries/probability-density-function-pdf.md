---
schema: kgdistiller-entry-v1
id: probability-density-function-pdf
label: probability density function (pdf)
kind: definition
aliases: []
source: notes/math/prob/chapters/02-random-variables.tex
line_start: 452
line_end: 458
understanding: unknown
---

# probability density function (pdf)

## Summary

pdf 是 distribution 对 Lebesgue 测度的 RN 导数，并积分给出概率。

## Evidence

```
\begin{definition}{\kn{probability density function (pdf)}}

对于 continuous random variable \(\mathit{X}\), 其 probability density function 定义为 \(\mathit{F}_{\mathit{X}}\) 的 (\(\mathit{m}\)-a.e.)导数, 即

\[\mathit{f}_{\mathit{X}}(\mathit{x}) := \mathit{F}_{\mathit{X}}'(\mathit{x}),\quad\mathit{m}\ \text{-a.e.}\ \mathit{x} \in \mathbb{R}\]

\end{definition}
```
