---
label: independence via product distribution of marginal distributions implies independence 下 conditional distribution 不变
kind: implies
premise:
  - "[[independence-via-product-distribution]]"
conclusion:
  - "[[independence-conditional-distribution-density-expectation]]"
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 372-384
---
The proposition states that independence makes F_{X|Y=y} equal the marginal cdf F_X.

## Evidence

> \begin{definition}{\kn{independence via product distribution of marginal distributions}}
>
> 两个 random variables \(\mathit{X},\mathit{Y}:\Omega\rightarrow\mathbb{R}\) 被称为 independent 的, 如果对于任意的 Borel sets \(\mathit{A},\mathit{B} \subseteq \mathbb{R}\), 都有
>
> \[\mathbb{P}(\mathit{X} \in \mathit{A},\mathit{Y} \in \mathit{B}) = \mathbb{P}(\mathit{X} \in \mathit{A}) \cdot \mathbb{P}(\mathit{Y} \in \mathit{B})\]
>
> 注意这个定义等价于 for all points \((\mathit{x},\mathit{y}) \in \mathbb{R}^{2}\),
>
> \[\mathit{F}_{\mathit{X},\mathit{Y}}(\mathit{x},\mathit{y}) = \mathit{F}_{\mathit{X}}(\mathit{x})\mathit{F}_{\mathit{Y}}(\mathit{y})\]
>
> 即\textbf{它们的 joint distribution 是它们 marginal distributions 的 product.}
>
> \end{definition}
