---
label: law of total expectation
kind: theorem
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 991-999
understanding: unknown
---
若 E[|E[X|Y]|]<infinity，则 law of total expectation 给出 E[X]=E[E[X|Y]]：先对 Y conditioning 再取 expectation 不改变 X 的 expectation。

## Evidence

> \begin{theorem}{\kn{law of total expectation}}
>
> 令 \(\mathit{X},\mathit{Y}:\Omega\rightarrow\mathbb{R}\) 为 RVs, 我们知道它们的 conditional expectation \(\left. \mathbb{E}\lbrack\mathit{X} \middle| \mathit{Y}\rbrack \right.\) 也是一个 \(\Omega\rightarrow\mathbb{R}\) 的 RV.
>
> 如果 \(\left. \mathbb{E}\lbrack \middle| \mathbb{E}\lbrack\mathit{X} \middle| \mathit{Y}\rbrack \middle| \rbrack < \infty \right.\), 则
>
> \[\left. \mathbb{E}\lbrack\mathit{X}\rbrack = \mathbb{E}\lbrack\mathbb{E}\lbrack\mathit{X} \middle| \mathit{Y}\rbrack\rbrack \right.\]
>
> \end{theorem}
