---
schema: kgdistiller-entry-v1
id: distribution-x-push-forward-measure-expectation
label: 用 distribution ( X 的 push-forward measure) 计算 expectation
kind: lemma
aliases:
  - 用 distribution (X 的 push-forward measure) 计算 expectation
source: notes/math/prob/chapters/02-random-variables.tex
line_start: 636
line_end: 643
understanding: unknown
---

# 用 distribution ( X 的 push-forward measure) 计算 expectation

## Summary

可把 E[g(X)] 改写为对 P^X 的积分。

## Evidence

```
\begin{lemma}{\kn{用 distribution ($\mathit{X}$ 的 push-forward measure) 计算
expectation}}

对于 random variable \(\mathit{X}:\Omega\rightarrow\mathbb{R}\), 如果 \(\mathit{X}\) integrable, 那么其 expectation

\[\mathbb{E}\lbrack\mathit{X}\rbrack = \int_{\mathbb{R}}\mathit{x}\mathit{d}\mathbb{P}^{\mathit{X}}(\mathit{x})\]

\end{lemma}
```
