---
label: independence via joint-density factorization marginal densities implies independence via product distribution of marginal distributions
kind: implies
premise:
  - "[[independence-via-joint-density-factorization]]"
conclusion:
  - "[[independence-via-product-distribution]]"
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 397-412
---
The theorem proves that pmf summation or pdf integration recovers product-distribution independence.

## Evidence

> \begin{theorem}{\kn{independence via joint-density factorization marginal densities}}
>
> 令 \(\mathit{X},\mathit{Y}\) 是两个 random variables.
>
> \begin{itemize}
> \item
>   如果 \(\mathit{X},\mathit{Y}\) 是 discrete random variables, 则它们 independent 的条件等价于对于任意 \(\mathit{x},\mathit{y}\), 都有
>
>   \[\mathit{p}_{\mathit{X},\mathit{Y}}(\mathit{x},\mathit{y}) = \mathit{p}_{\mathit{X}}(\mathit{x}) \cdot \mathit{p}_{\mathit{Y}}(\mathit{y})\]
> \item
>   如果 \(\mathit{X},\mathit{Y}\) 是 continuous random variables, 则它们 independent 的条件等价于对于任意 \(\mathit{x},\mathit{y}\), 都有
>
>   \[\mathit{f}_{\mathit{X},\mathit{Y}}(\mathit{x},\mathit{y}) = \mathit{f}_{\mathit{X}}(\mathit{x}) \cdot \mathit{f}_{\mathit{Y}}(\mathit{y})\]
> \end{itemize}
>
> \end{theorem}
