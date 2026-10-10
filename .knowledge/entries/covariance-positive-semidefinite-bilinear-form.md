---
label: covariance is a positive-semidefinite symmetric bilinear form
kind: theorem
source: notes/math/prob/chapters/02-random-variables.tex
lines: 815-826
understanding: unknown
---
covariance 在 L₀² 上对称、双线性并正半定。

## Evidence

> \begin{theorem}{\kn{covariance is a positive-semidefinite symmetric bilinear form}}
>
> \begin{itemize}
> \item
>   covariance 是一个 \textbf{symmetric bilinear form} (并且 \textbf{translation-invariant}, 忽略 translation) 的 operator:
>
>   \[\text{Cov}(\mathit{a}\mathit{X} + \mathit{b},\mathit{c}\mathit{Y} + \mathit{d}) = \mathit{a}\mathit{c}\,\text{Cov}(\mathit{X},\mathit{Y})\]\[\text{Cov}(\mathit{X},\mathit{Y}) = \text{Cov}(\mathit{Y},\mathit{X})\]\[\text{Cov}(\mathit{X} + \mathit{Y},\mathit{Z}) = \text{Cov}(\mathit{X},\mathit{Z}) + \text{Cov}(\mathit{Y},\mathit{Z})\]
> \item
>   covariance 满足 positive definiteness: \(\text{Cov}(\mathit{X},\mathit{X}) = \text{Var}(\mathit{X}) \geq 0\).
> \end{itemize}
>
> \end{theorem}
