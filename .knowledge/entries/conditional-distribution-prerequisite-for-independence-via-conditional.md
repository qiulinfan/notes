---
label: "conditional distribution prerequisite for independence via conditional distribution: marginal distribution"
kind: prerequisite-for
prerequisite:
  - "[[conditional-distribution]]"
dependent:
  - "[[independence-via-conditional-distribution]]"
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 449-457
---
The characterization compares conditional and marginal distributions.

## Evidence

> \begin{proposition}{\kn{independence via conditional distribution: marginal distribution}}
>
> 两个 random variables \(\mathit{X},\mathit{Y}\) 是 independent 的, iff: 对于任意的 Borel sets \(\mathit{A},\mathit{B}\), 如果\(\mathbb{P}(\mathit{Y} \in \mathit{B}) > 0\), 则
>
> \[\mathbb{P}(\mathit{X} \in \mathit{A} \mid \mathit{Y} \in \mathit{B}) = \mathbb{P}(\mathit{X} \in \mathit{A})\]
>
> 即: \textbf{\(\mathit{X}\) 的 conditional distribution, 不论给定 \(\mathit{Y}\) 的任何信息, 都等于 \(\mathit{X}\) 的 marginal distribution.}
>
> \end{proposition}
