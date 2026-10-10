---
label: law of total probability
kind: theorem
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
lines: 498-504
understanding: unknown
---
若 (Aᵢ) 是 pairwise disjoint events 且其并为 Ω，则任意 event E 满足 P(E)=∑ᵢP(Aᵢ)P(E|Aᵢ)。该公式把 E 按 partition (Aᵢ) 分解并求和。

## Evidence

> \begin{theorem}{\kn{law of total probability}}
>
> 令 \(\left( \mathit{A}_{\mathit{i}} \right)_{\mathit{i} \in \mathbb{N}}\) 为一个 seq of \textbf{pairwise disjoint} events, 如果 \(\sqcup_{\mathit{i} = 1}^{\infty}\mathit{A}_{\mathit{i}} = \Omega\), 那么对于任意 event \(\mathit{E} \subseteq \Omega\):
>
> \[\mathbb{P}(\mathit{E}) = \sum\limits_{\mathit{i} = 1}^{\infty}\mathbb{P}\left( \mathit{A}_{\mathit{i}} \right)\mathbb{P}\left( {\mathit{E} \mid \mathit{A}_{\mathit{i}}} \right)\]
>
> \end{theorem}
