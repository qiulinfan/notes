---
label: decomposing probability of intersection of events
kind: proposition
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
lines: 484-490
understanding: unknown
---
对 events A₁,…,Aₙ，交集概率可逐步分解为 P(A₁)P(A₂|A₁)⋯P(Aₙ|A₁∩⋯∩Aₙ₋₁)。这是 conditional probability 定义的连锁展开。

## Evidence

> \begin{proposition}{\kn{decomposing probability of intersection of events}}
>
> 令 \(\left( \mathit{A}_{\mathit{i}} \right)_{\mathit{i} \in \mathbb{N}}\) 为一个 seq of events, 对于任意 \(\mathit{n} \in \mathbb{N}\):
>
> \[\mathbb{P}\left( {\mathit{A}_{1} \cap \mathit{A}_{2} \cap \ldots \cap \mathit{A}_{\mathit{n}}} \right) = \mathbb{P}\left( \mathit{A}_{1} \right) \cdot \mathbb{P}\left( {\mathit{A}_{2} \mid \mathit{A}_{1}} \right) \cdot \mathbb{P}\left( {\mathit{A}_{3} \mid \mathit{A}_{1} \cap \mathit{A}_{2}} \right)\ldots \cdot \mathbb{P}\left( {\mathit{A}_{\mathit{n}} \mid \mathit{A}_{1} \cap \ldots \cap \mathit{A}_{\mathit{n} - 1}} \right)\]
>
> \end{proposition}
