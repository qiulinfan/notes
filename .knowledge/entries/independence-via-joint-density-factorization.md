---
schema: kgdistiller-entry-v1
id: independence-via-joint-density-factorization
label: independence via joint-density factorization marginal densities
kind: theorem
aliases: []
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
line_start: 397
line_end: 412
understanding: unknown
---

# independence via joint-density factorization marginal densities

## Summary

两个 discrete random variables independent 当且仅当 joint pmf 等于 marginal pmfs 的乘积；两个 continuous random variables independent 当且仅当 joint pdf 等于 marginal pdfs 的乘积。

## Evidence

```
\begin{theorem}{\kn{independence via joint-density factorization marginal densities}}

令 \(\mathit{X},\mathit{Y}\) 是两个 random variables.

\begin{itemize}
\item
  如果 \(\mathit{X},\mathit{Y}\) 是 discrete random variables, 则它们 independent 的条件等价于对于任意 \(\mathit{x},\mathit{y}\), 都有

  \[\mathit{p}_{\mathit{X},\mathit{Y}}(\mathit{x},\mathit{y}) = \mathit{p}_{\mathit{X}}(\mathit{x}) \cdot \mathit{p}_{\mathit{Y}}(\mathit{y})\]
\item
  如果 \(\mathit{X},\mathit{Y}\) 是 continuous random variables, 则它们 independent 的条件等价于对于任意 \(\mathit{x},\mathit{y}\), 都有

  \[\mathit{f}_{\mathit{X},\mathit{Y}}(\mathit{x},\mathit{y}) = \mathit{f}_{\mathit{X}}(\mathit{x}) \cdot \mathit{f}_{\mathit{Y}}(\mathit{y})\]
\end{itemize}

\end{theorem}
```
