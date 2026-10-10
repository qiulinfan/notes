---
label: independence via product distribution of marginal distributions
kind: definition
aliases:
  - independence of random variables
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 372-384
understanding: unknown
---
random variables X,Y independent 是指任意 Borel sets A,B 都满足 P(X in A,Y in B)=P(X in A)P(Y in B)；等价地，joint cdf 分解为 F_X(x)F_Y(y)。

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
