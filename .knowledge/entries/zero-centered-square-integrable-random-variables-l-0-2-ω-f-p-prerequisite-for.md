---
label: "zero-centered square integrable random variables L _0^2(Ω,F,P) prerequisite for covariance is a positive-semidefinite symmetric bilinear form"
kind: prerequisite-for
prerequisite:
  - "[[centered-square-integrable-random-variables]]"
dependent:
  - "[[covariance-positive-semidefinite-bilinear-form]]"
source: notes/math/prob/chapters/02-random-variables.tex
lines: 815-826
---
covariance is studied on centered square-integrable variables

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
