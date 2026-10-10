---
schema: kgdistiller-entry-v1
id: singular-continuous-random-variable
label: singular continuous random variable
kind: definition
aliases: []
source: notes/math/prob/chapters/02-random-variables.tex
line_start: 548
line_end: 552
understanding: unknown
---

# singular continuous random variable

## Summary

连续但 distribution 与 Lebesgue 测度奇异的随机变量。

## Evidence

```
\begin{definition}{\kn{singular continuous random variable}}

对于 random variable \(\mathit{X}:\Omega\rightarrow\mathbb{R}\), 如果 \(\mathit{X}\) 的 cdf \(\mathit{F}_{\mathit{X}}\) 是一个 continuous function, 并且 \(\mathbb{P}^{\mathit{X}}\bot\mathit{m}\) (即存在一个 measure zero 的 Borel set \(\mathit{N}\) 使得 \(\mathbb{P}^{\mathit{X}}(\mathit{N}) = 1\), 也等价于 \(\mathit{F}_{\mathit{X}}\) 的导数 \(\mathit{F}_{\mathit{X}}' = 0\) a.e.), 那么我们称 \(\mathit{X}\) 是一个 singular continuous random variable.

\end{definition}
```
