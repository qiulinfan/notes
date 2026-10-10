---
schema: kgdistiller-entry-v1
id: continuous-random-variable-expectation-variance
label: continuous random variable 的 expectation 和 variance
kind: proposition
aliases: []
source: notes/math/prob/chapters/02-random-variables.tex
line_start: 659
line_end: 669
understanding: unknown
---

# continuous random variable 的 expectation 和 variance

## Summary

连续情形按 pdf 的积分计算 expectation 和 variance。

## Evidence

```
\begin{proposition}{\kn{continuous random variable 的 expectation 和 variance}}

对于 continuous random variable \(\mathit{X}\) with pdf \(\mathit{f}_{\mathit{X}}\), 如果 \(\mathbb{E}\lbrack\mathit{X}\rbrack\) 和 \(\text{Var}(\mathit{X})\) 都是 finite 的, 那么

\[\mathbb{E}\lbrack\mathit{X}\rbrack = \int_{- \infty}^{+ \infty}\mathit{x}\mathit{f}_{\mathit{X}}(\mathit{x})\mathit{d}\mathit{x},\quad\text{Var}(\mathit{X}) = \int_{- \infty}^{+ \infty}(\mathit{x} - \mathbb{E}\lbrack\mathit{X}\rbrack)^{2}\mathit{f}_{\mathit{X}}(\mathit{x})\mathit{d}\mathit{x}\]

并且, 对于任意的 measurable function \(\mathit{g}:\mathbb{R}\rightarrow\mathbb{R}\), 都有

\[\mathbb{E}\lbrack\mathit{g}(\mathit{X})\rbrack = \int_{- \infty}^{+ \infty}\mathit{g}(\mathit{x})\mathit{f}_{\mathit{X}}(\mathit{x})\mathit{d}\mathit{x}\]

\end{proposition}
```
