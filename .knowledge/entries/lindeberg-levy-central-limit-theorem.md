---
schema: kgdistiller-entry-v1
id: lindeberg-levy-central-limit-theorem
label: Lindeberg-Levy Central Limit Theorem
kind: theorem
aliases: []
source: notes/math/prob/chapters/05-CLT.tex
line_start: 66
line_end: 74
understanding: unknown
---

# Lindeberg-Levy Central Limit Theorem

## Summary

i.i.d.、均值 μ、有限方差 σ² 时，(S_n−nμ)/√(nσ²) 按分布收敛到 N(0,1)。

## Evidence

```
\begin{theorem}{\kn{Lindeberg-Levy Central Limit Theorem}}

对于任意一个 seq of i.i.d. random variables \(\left\{ \mathit{X}_{\mathit{i}} \right\}\) with mean \(\mathit{\mu}\) and variance \(\mathit{\sigma}^{2} < \infty\), set \(\mathit{S}_{\mathit{n}} = \mathit{X}_{1} + \mathit{X}_{2} + \cdots + \mathit{X}_{\mathit{n}}\) for each \(\mathit{n}\).

我们有:

\[\frac{\mathit{S}_{\mathit{n}} - \mathit{n}\mathit{\mu}}{\sqrt{\mathit{n}\mathit{\sigma}^{2}}}\overset{\mathit{d}}{\rightarrow}\mathit{N}(0,1)\]

\end{theorem}
```
