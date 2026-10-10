---
schema: kgdistiller-entry-v1
id: conditional-probability
label: conditional probability
kind: definition
aliases: []
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
line_start: 476
line_end: 482
understanding: unknown
---

# conditional probability

## Summary

在 probability space (Ω,𝓕,P) 中，若 B∈𝓕 且 P(B)>0，则 event A given B 的 conditional probability 定义为 P(A|B)=P(A∩B)/P(B)。

## Evidence

```
\begin{definition}{\kn{conditional probability}}

对于 probability space \((\Omega,\mathcal{F},\mathbb{P})\), 给定一个 event \(\mathit{B} \in \mathcal{F}\), 如果 \(\mathbb{P}(\mathit{B}) > 0\), 我们定义 conditional probability of an event \(\mathit{A} \in \mathcal{F}\) given \(\mathit{B}\) 为:

\[\mathbb{P}(\mathit{A} \mid \mathit{B}) = \frac{\mathbb{P}(\mathit{A} \cap \mathit{B})}{\mathbb{P}(\mathit{B})}\]

\end{definition}
```
