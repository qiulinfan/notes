---
schema: kgdistiller-entry-v1
id: discrete-rv-independence-characterization
label: discrete RV independence 的 characterization
kind: proposition
aliases: []
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
line_start: 646
line_end: 650
understanding: unknown
---

# discrete RV independence 的 characterization

## Summary

两个 discrete random variables independent 当且仅当由 joint pmf 排成的矩阵 rank 为 1；此时该矩阵正是两个 marginal pmf vectors 的 outer product。

## Evidence

```
\begin{proposition}{\kn{discrete RV independence 的 characterization}}

两个 discrete random variables \(\mathit{X},\mathit{Y}\) 是 independent 的 iff 它们的 joint pmf as a matrix 有 rank 1(每行每列都互为倍数).

\end{proposition}
```
