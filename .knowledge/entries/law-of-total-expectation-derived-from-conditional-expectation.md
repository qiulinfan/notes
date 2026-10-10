---
label: law of total expectation derived from conditional expectation
kind: derived-from
derived:
  - "[[law-of-total-expectation]]"
origin:
  - "[[conditional-expectation]]"
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 991-999
---
The theorem averages the conditional expectation and proves E[X]=E[E[X|Y]].

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
