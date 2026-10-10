---
label: complete measure space prerequisite for every measure space can be completed
kind: prerequisite-for
prerequisite:
  - "[[complete-measure-space]]"
dependent:
  - "[[every-measure-space-can-be-completed]]"
source: notes/math/measure-theory/chapters/02-outer-measure-与-completion-of-a-measurable-space.tex
lines: 43-56
---
The theorem constructs the completion characterized by the preceding complete-measure-space definition.

## Evidence

> \begin{theorem}{\kn{every measure space can be completed}}
>
> Suppose \((X,\mathcal{M},\mu)\) is a measure space.\\
> Let
>
> \[\mathcal{N} := \left\{ {\text{all null sets in}\ \mathcal{M}} \right\}\]
>
> Claim:
>
> \[\bar{M} := \left\{ {E \cup F \mid E \in \mathcal{M},F \subseteq N\ \text{for some}\ N \in \mathcal{N}} \right\}\]
>
> is a \(\sigma\)-algebra, 并且在 \(\bar{\mathcal{M}}\) 上存在一个 unique 的 extension \(\bar{\mu}\) of \(\mu\).
>
> \end{theorem}
