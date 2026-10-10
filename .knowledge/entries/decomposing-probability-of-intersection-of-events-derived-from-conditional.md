---
label: decomposing probability of intersection of events derived from conditional probability
kind: derived-from
derived:
  - "[[decomposing-probability-of-intersection-of-events]]"
origin:
  - "[[conditional-probability]]"
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
lines: 484-490
---
The source says the intersection chain formula follows directly by repeatedly applying the conditional-probability definition.

## Evidence

> \begin{proposition}{\kn{decomposing probability of intersection of events}}
>
> 令 \(\left( \mathit{A}_{\mathit{i}} \right)_{\mathit{i} \in \mathbb{N}}\) 为一个 seq of events, 对于任意 \(\mathit{n} \in \mathbb{N}\):
>
> \[\mathbb{P}\left( {\mathit{A}_{1} \cap \mathit{A}_{2} \cap \ldots \cap \mathit{A}_{\mathit{n}}} \right) = \mathbb{P}\left( \mathit{A}_{1} \right) \cdot \mathbb{P}\left( {\mathit{A}_{2} \mid \mathit{A}_{1}} \right) \cdot \mathbb{P}\left( {\mathit{A}_{3} \mid \mathit{A}_{1} \cap \mathit{A}_{2}} \right)\ldots \cdot \mathbb{P}\left( {\mathit{A}_{\mathit{n}} \mid \mathit{A}_{1} \cap \ldots \cap \mathit{A}_{\mathit{n} - 1}} \right)\]
>
> \end{proposition}
