---
schema: kgdistiller-entry-v1
id: total-variation-function
label: total variation function
kind: definition
aliases: []
source: notes/math/measure-theory/chapters/12-differentiation_on_real_spaces.tex
line_start: 337
line_end: 346
understanding: unknown
---

# total variation function

## Summary

给定一个 function $F : bb(R) arrow.r bb(C)$, 我们定义它的 total variation function $T_F$ 为:$ T_F : bb(R) & arrow.r\[0\,oo\]\ x & mapsto sup { sum_(j = 1)^n\|F\(x_j\)- F\(x_(j + 1)\)\|: - oo < x_0 < dots.h.c < x_n = x } $

## Evidence

```
\begin{definition}{\kn{total variation function}}

给定一个 function \(F:\mathbb{R}\rightarrow\mathbb{C}\), 我们定义它的 total variation function \(T_{F}\) 为:

\[\begin{matrix}
{T_{F}:\mathbb{R}} & {\rightarrow\lbrack 0,\infty\rbrack} \\
x & {\mapsto\sup\left\{ \sum\limits_{j = 1}^{n} \middle| F(x_{j}) - F(x_{j + 1}) \middle| : - \infty < x_{0} < \cdots < x_{n} = x \right\}}
\end{matrix}\]

\end{definition}
```
