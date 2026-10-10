---
schema: kgdistiller-entry-v1
id: covariance
label: covariance
kind: definition
aliases: []
source: notes/math/prob/chapters/02-random-variables.tex
line_start: 761
line_end: 767
understanding: unknown
---

# covariance

## Summary

Cov(X,Y)=E[(X−EX)(Y−EY)]，描述中心化变量的共同变化。

## Evidence

```
\begin{definition}{\kn{covariance}}

给定两个 random variables \(\mathit{X},\mathit{Y}\), 我们定义它们的 covariance 为

\[\text{Cov}(\mathit{X},\mathit{Y}) := \mathbb{E}\lbrack(\mathit{X} - \mathbb{E}\lbrack\mathit{X}\rbrack)(\mathit{Y} - \mathbb{E}\lbrack\mathit{Y}\rbrack)\rbrack = \mathbb{E}\lbrack\mathit{X}\mathit{Y}\rbrack - \mathbb{E}\lbrack\mathit{X}\rbrack\mathbb{E}\lbrack\mathit{Y}\rbrack\]

\end{definition}
```
