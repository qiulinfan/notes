---
label: probability space prerequisite for conditional probability
kind: prerequisite-for
prerequisite:
  - "[[probability-space]]"
dependent:
  - "[[conditional-probability]]"
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
lines: 476-482
---
Conditional probability is defined for events and a probability measure within a probability space.

## Evidence

> \begin{definition}{\kn{conditional probability}}
>
> 对于 probability space \((\Omega,\mathcal{F},\mathbb{P})\), 给定一个 event \(\mathit{B} \in \mathcal{F}\), 如果 \(\mathbb{P}(\mathit{B}) > 0\), 我们定义 conditional probability of an event \(\mathit{A} \in \mathcal{F}\) given \(\mathit{B}\) 为:
>
> \[\mathbb{P}(\mathit{A} \mid \mathit{B}) = \frac{\mathbb{P}(\mathit{A} \cap \mathit{B})}{\mathbb{P}(\mathit{B})}\]
>
> \end{definition}
