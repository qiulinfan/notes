---
schema: kgdistiller-entry-v1
id: permutations
label: permutations
kind: definition
aliases: []
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
line_start: 8
line_end: 17
understanding: unknown
---

# permutations

## Summary

Permutation 是一组 objects 的 rearrangement；对 n 个互异对象共有 n! 种排列。对象含重复项时，distinct permutations 的数量需除以各组相同对象内部排列数的乘积。

## Evidence

```
\begin{definition}{\kn{permutations}}

一个 permutation 就是对一组 objects 的一个 \textbf{rearrangement} (这些 objects 中可以有 same 的也可以有 distinct 的).\\
对于 \(\mathit{n}\) 个 \textbf{distinct objects}, 一共存在

\[\mathit{n}! = \mathit{n}(\mathit{n} - 1)(\mathit{n} - 2)\cdots\]

个 permutations.

\end{definition}
```
