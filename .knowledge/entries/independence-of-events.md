---
label: independence of events
kind: definition
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
lines: 736-749
understanding: unknown
---
Events A 与 B independent 当且仅当 P(A∩B)=P(A)P(B)。更一般地，一族 events mutually independent 是指每个有限子族的交集概率都等于各自概率的乘积。

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
