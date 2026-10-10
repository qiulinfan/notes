---
schema: kgdistiller-entry-v1
id: multinomial-coefficient
label: multinomial coefficient
kind: definition
aliases: []
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
line_start: 46
line_end: 52
understanding: unknown
---

# multinomial coefficient

## Summary

若 n₁ + ⋯ + nₖ = n，则 multinomial coefficient 定义为 n!/(n₁!⋯nₖ!)。它给出含 nᵢ 个第 i 类相同对象时 distinct permutations 的数量。

## Evidence

```
\begin{definition}{\kn{multinomial coefficient}}

令 \(\mathit{n} \in \mathbb{N},\mathit{n}_{1},\mathit{n}_{2},\cdots,\mathit{n}_{\mathit{k}} \in \mathbb{N},\mathit{n}_{1} + \mathit{n}_{2} + \cdots + \mathit{n}_{\mathit{k}} = \mathit{n}\), 我们定义 multinomial coefficient:

\[\binom{\mathit{n}}{\mathit{n}_{1},\mathit{n}_{2},\cdots,\mathit{n}_{\mathit{k}}} = \frac{\mathit{n}!}{\mathit{n}_{1}!\mathit{n}_{2}!\cdots\mathit{n}_{\mathit{k}}!}\]

\end{definition}
```
