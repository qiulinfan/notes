---
label: "independence via conditional distribution: marginal distribution"
kind: proposition
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 449-457
understanding: unknown
---
X,Y independent 当且仅当对所有 P(Y in B)>0 的 Borel sets A,B，P(X in A | Y in B)=P(X in A)；获知 Y 的事件不会改变 X 的 distribution。

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
