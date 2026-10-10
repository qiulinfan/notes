---
label: "probability distribution prerequisite for distribution function (也称 cumulative distribution function, cdf )"
kind: prerequisite-for
prerequisite:
  - "[[probability-distribution]]"
dependent:
  - "[[distribution-function-cumulative-distribution-function-cdf]]"
source: notes/math/prob/chapters/02-random-variables.tex
lines: 188-195
---
the CDF represents a probability distribution on the real line

## Evidence

> \begin{definition}{\kn{distribution function (也称 \textbf{cumulative distribution function,
> cdf})}}
>
> 对于 random variable \(\mathit{X}:\Omega\rightarrow\mathbb{R}\), 其 \textbf{cumulative distribution function} 是 \(\mathbb{P}^{\mathit{X}}\) 这一函数的 distribution function, 记作 \(\mathit{F}_{\mathit{X}}\). 即对于任意 \(\mathit{x} \in \mathbb{R}\), 有
>
> \[\mathit{F}_{\mathit{X}}(\mathit{x}) := \mathbb{P}^{\mathit{X}}(( - \infty,\mathit{x}\rbrack) = \mathbb{P}(\mathit{X}^{- 1}(( - \infty,\mathit{x}\rbrack))\]
>
> \end{definition}
