---
label: expectation and variance of random variable prerequisite for covariance
kind: prerequisite-for
prerequisite:
  - "[[expectation-and-variance-of-random-variable]]"
dependent:
  - "[[covariance]]"
source: notes/math/prob/chapters/02-random-variables.tex
lines: 761-767
---
covariance centers two variables by their expectations

## Evidence

> \begin{definition}{\kn{covariance}}
>
> 给定两个 random variables \(\mathit{X},\mathit{Y}\), 我们定义它们的 covariance 为
>
> \[\text{Cov}(\mathit{X},\mathit{Y}) := \mathbb{E}\lbrack(\mathit{X} - \mathbb{E}\lbrack\mathit{X}\rbrack)(\mathit{Y} - \mathbb{E}\lbrack\mathit{Y}\rbrack)\rbrack = \mathbb{E}\lbrack\mathit{X}\mathit{Y}\rbrack - \mathbb{E}\lbrack\mathit{X}\rbrack\mathbb{E}\lbrack\mathit{Y}\rbrack\]
>
> \end{definition}
