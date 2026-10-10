---
label: mutual independence of multiple random variables generalizes independence via product distribution of marginal distributions
kind: generalizes
general:
  - "[[mutual-independence-of-multiple-random-variables]]"
special:
  - "[[independence-via-product-distribution]]"
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 490-498
---
The source explicitly extends two-variable independence to every finite subfamily of an indexed family.

## Evidence

> \begin{definition}{\kn{\textbf{mutual independence} of multiple random variables}}
>
> 令 \(\left\{ {\mathit{X}_{\mathit{i}}:\mathit{i} \in \mathit{I}} \right\}\) 是一个 random variables 的 family, 其中 \(\mathit{I}\) 是一个 index set. 则如果对于任意的 finite subset \(\mathit{J} \subseteq \mathit{I}\), 以及对于任意的 Borel sets \(\left\{ {\mathit{A}_{\mathit{j}}:\mathit{j} \in \mathit{J}} \right\}\), 都有
>
> \[\mathbb{P}(\mathit{X}_{\mathit{j}} \in \mathit{A}_{\mathit{j}},\forall\mathit{j} \in \mathit{J}) = \prod\limits_{\mathit{j} \in \mathit{J}}\mathbb{P}(\mathit{X}_{\mathit{j}} \in \mathit{A}_{\mathit{j}})\]
>
> 则称这个 family of random variables 是 independent 的.
>
> \end{definition}
