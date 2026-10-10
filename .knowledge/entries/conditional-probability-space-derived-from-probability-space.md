---
label: conditional probability space derived from probability space
kind: derived-from
derived:
  - "[[conditional-probability-space-and-trace-sigma-algebra]]"
origin:
  - "[[probability-space]]"
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
lines: 673-683
---
The conditional probability space is constructed by restricting a given probability space to an event B.

## Evidence

> \begin{definition}{\kn{conditional probability space} and
> \kn{trace $\mathit{\sigma}$-algebra}}
>
> 对于给定的 prob space \((\Omega,\mathcal{F},\mathbb{P})\), 给定一个 event \(\mathit{B} \in \mathcal{F}\) 且 \(\mathbb{P}(\mathit{B}) > 0\), 我们定义 conditional probability space as the triplet \((\mathit{B},\mathcal{F}_{\mathit{B}},\mathbb{P}( \cdot \mid \mathit{B}))\), 其中:
>
> \[\mathit{F}_{\mathit{B}} := \left\{ {\mathit{A} \cap \mathit{B} \mid \mathit{A} \in \mathcal{F}} \right\}\]
>
> 继承自原空间的 \knref{$\mathit{\sigma}$-algebra} \(\mathcal{F}\), 并被称为 \textbf{trace \(\mathit{\sigma}\)-algebra on \(\mathit{B}\)}.\\
> 容易验证, 这个 triplet 是一个 prob space.
>
> \end{definition}
