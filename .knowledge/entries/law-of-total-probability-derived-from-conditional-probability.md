---
label: law of total probability derived from conditional probability
kind: derived-from
derived:
  - "[[law-of-total-probability]]"
origin:
  - "[[conditional-probability]]"
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
lines: 498-504
---
The proof rewrites each partition contribution P(E intersection A_i) as P(A_i)P(E given A_i).

## Evidence

> \begin{theorem}{\kn{law of total probability}}
>
> 令 \(\left( \mathit{A}_{\mathit{i}} \right)_{\mathit{i} \in \mathbb{N}}\) 为一个 seq of \textbf{pairwise disjoint} events, 如果 \(\sqcup_{\mathit{i} = 1}^{\infty}\mathit{A}_{\mathit{i}} = \Omega\), 那么对于任意 event \(\mathit{E} \subseteq \Omega\):
>
> \[\mathbb{P}(\mathit{E}) = \sum\limits_{\mathit{i} = 1}^{\infty}\mathbb{P}\left( \mathit{A}_{\mathit{i}} \right)\mathbb{P}\left( {\mathit{E} \mid \mathit{A}_{\mathit{i}}} \right)\]
>
> \end{theorem}
