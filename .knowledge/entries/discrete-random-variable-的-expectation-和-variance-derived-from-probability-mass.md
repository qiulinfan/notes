---
label: discrete random variable 的 expectation 和 variance derived from probability mass function (pmf)
kind: derived-from
derived:
  - "[[discrete-random-variable-expectation-variance]]"
origin:
  - "[[probability-mass-function-pmf]]"
source: notes/math/prob/chapters/02-random-variables.tex
lines: 622-628
---
616–630：离散 expectation/variance 按 pmf 加权和计算。

## Evidence

> \begin{proposition}{\kn{discrete random variable 的 expectation 和 variance}}
>
> 对于 discrete random variable \(\mathit{X}\) with pmf \(\mathit{p}_{\mathit{X}}\),
>
> \[\mathbb{E}\lbrack\mathit{X}\rbrack = \sum\limits_{\mathit{x}}\mathit{x}\mathit{p}_{\mathit{X}}(\mathit{x}),\quad\text{Var}(\mathit{X}) = \sum\limits_{\mathit{x}}(\mathit{x} - \mathbb{E}\lbrack\mathit{X}\rbrack)^{2}\mathit{p}_{\mathit{X}}(\mathit{x})\]
>
> \end{proposition}
