---
label: Gamma-distribution
kind: definition
source: notes/math/prob/chapters/02-random-variables.tex
lines: 1422-1437
understanding: unknown
---
Gamma(α,λ) 以 x^(α−1)e^(−λx) 型密度描述正半轴连续分布。

## Evidence

> \begin{definition}{\kn{$\Gamma$-distribution}}
>
> 如果 continuous random variable \(\mathit{X}\) 的 pdf 是:
>
> \[\mathit{f}_{\mathit{X}}(\mathit{x}) = \left\{ \begin{matrix}
> {\frac{\mathit{\lambda}^{\mathit{\alpha}}}{\Gamma(\mathit{\alpha})}\mathit{x}^{\mathit{\alpha} - 1}\mathit{e}^{- \mathit{\lambda}\mathit{x}},} & {\mathit{x} > 0,} \\
> {0,} & {\mathit{x} \leq 0}
> \end{matrix} \right.\]
>
> 那么我们称 \(\mathit{X}\) 服从 \textbf{\(\Gamma\) distribution}, 写作
>
> \[\mathit{X} \sim \Gamma(\mathit{\alpha},\mathit{\lambda})\]
>
> 其中 \(\mathit{\alpha} > 0\) 称为 shape parameter, \(\mathit{\lambda} > 0\) 称为 rate parameter.
>
> \end{definition}
