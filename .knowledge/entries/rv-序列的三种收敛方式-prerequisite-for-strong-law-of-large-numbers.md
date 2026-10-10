---
label: RV 序列的三种收敛方式 prerequisite for strong Law of Large Numbers
kind: prerequisite-for
prerequisite:
  - "[[modes-of-convergence-for-random-variables]]"
dependent:
  - "[[strong-law-of-large-numbers]]"
source: notes/math/prob/chapters/04-LLN.tex
lines: 269-275
---
the strong law is almost-sure convergence

## Evidence

> \begin{theorem}{\kn{strong Law of Large Numbers}}
>
> 在 weak LLN\ref{thm-04-lln-weak-law-of-large-numbers} 的相同条件 (其实可以更弱, 让 \(\mathit{E}\lbrack\mathit{X}_{1}\rbrack < \infty\) 即可) 下, 我们其实可以得到一个更强的结论:
>
> \[\frac{\mathit{X}_{1} + \ldots + \mathit{X}_{\mathit{n}}}{\mathit{n}}\overset{\text{a.s.}}{\rightarrow}\mathbb{E}\left\lbrack \mathit{X}_{1} \right\rbrack,\quad\text{as}\ \mathit{n}\rightarrow\infty\]
>
> \end{theorem}
