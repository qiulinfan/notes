---
schema: kgdistiller-entry-v1
id: conditional-probability-space-and-trace-sigma-algebra
label: conditional probability space
kind: definition
aliases:
  - conditional probability space and trace σ-algebra
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
line_start: 673
line_end: 683
understanding: unknown
---

# conditional probability space

## Summary

给定 probability space (Ω,𝓕,P) 与 P(B)>0 的 event B，conditional probability space 是 (B,𝓕_B,P(·|B))。它把原空间限制到 B，并以 conditional probability 作为新的 probability measure。

## Evidence

```
\begin{definition}{\kn{conditional probability space} and
\kn{trace $\mathit{\sigma}$-algebra}}

对于给定的 prob space \((\Omega,\mathcal{F},\mathbb{P})\), 给定一个 event \(\mathit{B} \in \mathcal{F}\) 且 \(\mathbb{P}(\mathit{B}) > 0\), 我们定义 conditional probability space as the triplet \((\mathit{B},\mathcal{F}_{\mathit{B}},\mathbb{P}( \cdot \mid \mathit{B}))\), 其中:

\[\mathit{F}_{\mathit{B}} := \left\{ {\mathit{A} \cap \mathit{B} \mid \mathit{A} \in \mathcal{F}} \right\}\]

继承自原空间的 \knref{$\mathit{\sigma}$-algebra} \(\mathcal{F}\), 并被称为 \textbf{trace \(\mathit{\sigma}\)-algebra on \(\mathit{B}\)}.\\
容易验证, 这个 triplet 是一个 prob space.

\end{definition}
```
