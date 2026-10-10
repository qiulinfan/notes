---
schema: kgdistiller-entry-v1
id: gamma-as-sum-of-independent-exponentials
label: Gamma distribution as a sum of independent exponentials
kind: proposition
aliases: []
source: notes/math/prob/chapters/02-random-variables.tex
line_start: 1466
line_end: 1472
understanding: unknown
---

# Gamma distribution as a sum of independent exponentials

## Summary

同率独立指数变量的和服从相应 shape 参数的 Gamma 分布。

## Evidence

```
\begin{proposition}{\kn{Gamma distribution as a sum of independent exponentials}}

Let \(\mathit{X}_{1},\mathit{X}_{2},\cdots,\mathit{X}_{\mathit{n}} \sim \text{Exp}(\mathit{\lambda})\) be i.i.d., 则

\[\Gamma(\mathit{n},\mathit{\lambda}) = \sum\limits_{\mathit{i} = 1}^{\mathit{n}}\mathit{X}_{\mathit{i}}\]

\end{proposition}
```
