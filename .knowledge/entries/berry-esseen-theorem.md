---
schema: kgdistiller-entry-v1
id: berry-esseen-theorem
label: Berry-Esseen Theorem
kind: theorem
aliases: []
source: notes/math/prob/chapters/05-CLT.tex
line_start: 171
line_end: 177
understanding: unknown
---

# Berry-Esseen Theorem

## Summary

在有限三阶中心绝对矩条件下，以 O(n^−1/2) 一致界控制标准化和的 CDF 与 Φ 的差。

## Evidence

```
\begin{theorem}{\kn{Berry-Esseen Theorem}}

给定一个 seq of i.i.d. random variables \(\left\{ \mathit{X}_{\mathit{i}} \right\}\) with mean \(\mathit{\mu}\) and variance \(\mathit{\sigma}^{2} < \infty\), 以及 \(\left. \mathbb{E}\lbrack \middle| \mathit{X}_{\mathit{i}} - \mathit{\mu} \middle| {}_{3}\rbrack = \mathit{\rho} < \infty \right.\), set \(\mathit{S}_{\mathit{n}} = \mathit{X}_{1} + \mathit{X}_{2} + \cdots + \mathit{X}_{\mathit{n}}\), 我们有: 对于任意 \(\mathit{x} \in \mathbb{R}\),

\[\left| {\mathbb{P}\left( {\frac{\mathit{S}_{\mathit{n}} - \mathit{n}\mathit{\mu}}{\sqrt{\mathit{n}\mathit{\sigma}^{2}}} \leq \mathit{x}} \right) - \Phi(\mathit{x})} \right| \leq \frac{3\mathit{\rho}}{\mathit{\sigma}^{2}\sqrt{\mathit{n}}}\]

\end{theorem}
```
