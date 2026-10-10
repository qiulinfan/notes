---
schema: kgdistiller-entry-v1
id: discrete-random-variable-expectation-variance
label: discrete random variable 的 expectation 和 variance
kind: proposition
aliases: []
source: notes/math/prob/chapters/02-random-variables.tex
line_start: 622
line_end: 628
understanding: unknown
---

# discrete random variable 的 expectation 和 variance

## Summary

离散情形的 expectation/variance 分别按取值和 pmf 的加权和计算。

## Evidence

```
\begin{proposition}{\kn{discrete random variable 的 expectation 和 variance}}

对于 discrete random variable \(\mathit{X}\) with pmf \(\mathit{p}_{\mathit{X}}\),

\[\mathbb{E}\lbrack\mathit{X}\rbrack = \sum\limits_{\mathit{x}}\mathit{x}\mathit{p}_{\mathit{X}}(\mathit{x}),\quad\text{Var}(\mathit{X}) = \sum\limits_{\mathit{x}}(\mathit{x} - \mathbb{E}\lbrack\mathit{X}\rbrack)^{2}\mathit{p}_{\mathit{X}}(\mathit{x})\]

\end{proposition}
```
