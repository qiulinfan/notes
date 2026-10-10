---
label: probability space prerequisite for independence of events
kind: prerequisite-for
prerequisite:
  - "[[probability-space]]"
dependent:
  - "[[independence-of-events]]"
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
lines: 736-749
---
Independence is defined through probabilities of event intersections within a probability space.

## Evidence

> \begin{definition}{\kn{independence of events}}
>
> 对于 prob space \((\Omega,\mathcal{F},\mathbb{P})\), 两个 events \(\mathit{A},\mathit{B} \in \mathcal{F}\) 如果有
>
> \[\mathbb{P}(\mathit{A} \cap \mathit{B}) = \mathbb{P}(\mathit{A}) \cdot \mathbb{P}(\mathit{B})\]
>
> 则称 \(\mathit{A}\) 和 \(\mathit{B}\) 是 independent 的.\\
> 更加 generally, 对于任意 collection of events \(\left\{ \mathit{A}_{\mathit{i}} \right\}_{\mathit{i} \in \mathit{I}}\), 如果对于任意有限子集 \(\mathit{J} \subseteq \mathit{I}\), 有
>
> \[\mathbb{P}\left( {\bigcap\limits_{\mathit{j} \in \mathit{J}}\mathit{A}_{\mathit{j}}} \right) = \prod\limits_{\mathit{j} \in \mathit{J}}\mathbb{P}(\mathit{A}_{\mathit{j}})\]
>
> 则称 \(\left\{ \mathit{A}_{\mathit{i}} \right\}_{\mathit{i} \in \mathit{I}}\) 是 mutually independent 的.
>
> \end{definition}
