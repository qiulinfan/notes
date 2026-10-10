---
label: De Moivre--Laplace theorem
kind: theorem
aliases:
  - De Moivre–Laplace theorem
source: notes/math/prob/chapters/02-random-variables.tex
lines: 1632-1638
understanding: unknown
---
标准化二项分布在参数增大时按分布收敛到标准正态。

## Evidence

> \begin{theorem}{\kn{De Moivre--Laplace theorem}}
>
> 令 \(\mathit{S}_{\mathit{n}} \sim \text{Bin}(\mathit{n},\mathit{p})\), 则
>
> \[\lim\limits_{\mathit{n}\rightarrow\infty}\mathit{P}(\frac{\mathit{S}_{\mathit{n}} - \mathbb{E}(\mathit{S}_{\mathit{n}})}{\mathit{\sigma}(\mathit{S}_{\mathit{n}})} \in (\mathit{a},\mathit{b})) = \Phi(\mathit{b}) - \Phi(\mathit{a}) = \frac{1}{\sqrt{2\mathit{\pi}}}\int_{(\mathit{a},\mathit{b})}\mathit{e}^{- \frac{\mathit{x}^{2}}{2}}\mathit{d}\mathit{x}\]
>
> \end{theorem}
