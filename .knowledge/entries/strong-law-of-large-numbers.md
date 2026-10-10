---
schema: kgdistiller-entry-v1
id: strong-law-of-large-numbers
label: strong Law of Large Numbers
kind: theorem
aliases: []
source: notes/math/prob/chapters/04-LLN.tex
line_start: 269
line_end: 275
understanding: unknown
---

# strong Law of Large Numbers

## Summary

在笔记所用的同一条件下，样本均值几乎处处收敛到 E[X₁]。

## Evidence

```
\begin{theorem}{\kn{strong Law of Large Numbers}}

在 weak LLN\ref{thm-04-lln-weak-law-of-large-numbers} 的相同条件 (其实可以更弱, 让 \(\mathit{E}\lbrack\mathit{X}_{1}\rbrack < \infty\) 即可) 下, 我们其实可以得到一个更强的结论:

\[\frac{\mathit{X}_{1} + \ldots + \mathit{X}_{\mathit{n}}}{\mathit{n}}\overset{\text{a.s.}}{\rightarrow}\mathbb{E}\left\lbrack \mathit{X}_{1} \right\rbrack,\quad\text{as}\ \mathit{n}\rightarrow\infty\]

\end{theorem}
```
