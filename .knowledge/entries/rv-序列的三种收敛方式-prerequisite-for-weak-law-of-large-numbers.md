---
label: RV 序列的三种收敛方式 prerequisite for weak Law of Large Numbers
kind: prerequisite-for
prerequisite:
  - "[[modes-of-convergence-for-random-variables]]"
dependent:
  - "[[weak-law-of-large-numbers]]"
source: notes/math/prob/chapters/04-LLN.tex
lines: 242-248
---
the weak law is convergence in probability

## Evidence

> \begin{theorem}{\kn{weak Law of Large Numbers}}\label{thm-04-lln-weak-law-of-large-numbers}
>
> 对于一列 i.i.d. 的 random variables \(\left\{ \mathit{X}_{\mathit{i}} \right\}\), 只要这个 random variable 的 expectation 是 finite 的 \(\mathbb{E}\lbrack\mathit{X}_{1}^{2}\rbrack < \infty\), 那么就有:
>
> \[\frac{\mathit{X}_{1} + \mathit{X}_{2} + \cdots + \mathit{X}_{\mathit{n}}}{\mathit{n}}\overset{\mathit{p}}{\rightarrow}\mathbb{E}\lbrack\mathit{X}_{1}\rbrack\quad\text{as}\ \mathit{n}\rightarrow\infty\]
>
> \end{theorem}
