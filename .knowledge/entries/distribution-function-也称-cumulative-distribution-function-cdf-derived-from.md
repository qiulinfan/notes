---
label: "distribution function (也称 cumulative distribution function, cdf ) derived from probability distribution"
kind: derived-from
derived:
  - "[[distribution-function-cumulative-distribution-function-cdf]]"
origin:
  - "[[probability-distribution]]"
source: notes/math/prob/chapters/02-random-variables.tex
lines: 188-195
---
210：F_X(x)=P(X≤x)，直接由 X 的分布给出。

## Evidence

> \begin{definition}{\kn{distribution function (也称 \textbf{cumulative distribution function,
> cdf})}}
>
> 对于 random variable \(\mathit{X}:\Omega\rightarrow\mathbb{R}\), 其 \textbf{cumulative distribution function} 是 \(\mathbb{P}^{\mathit{X}}\) 这一函数的 distribution function, 记作 \(\mathit{F}_{\mathit{X}}\). 即对于任意 \(\mathit{x} \in \mathbb{R}\), 有
>
> \[\mathit{F}_{\mathit{X}}(\mathit{x}) := \mathbb{P}^{\mathit{X}}(( - \infty,\mathit{x}\rbrack) = \mathbb{P}(\mathit{X}^{- 1}(( - \infty,\mathit{x}\rbrack))\]
>
> \end{definition}
