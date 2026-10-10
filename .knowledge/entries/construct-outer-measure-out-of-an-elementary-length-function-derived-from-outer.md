---
label: "construct outer measure out of an \"elementary length function\" derived from outer measure"
kind: derived-from
derived:
  - "[[construct-outer-measure-out-of-an-elementary-length-function]]"
origin:
  - "[[outer-measure]]"
source: notes/math/measure-theory/chapters/02-outer-measure-与-completion-of-a-measurable-space.tex
lines: 100-108
---
The proof verifies the three outer-measure axioms for the covering-infimum construction.

## Evidence

> \begin{theorem}{\kn{construct outer measure out of an "elementary length function"}}\label{thm-02-outer-measure-completion-of-a-measurable-space-construct-outer-measure-out-of-an-elementary-length-function}
>
> 另 \(\mathcal{E} \subseteq \mathcal{P}(X)\) 为一个包含 \(\varnothing,X\) 的集合, 并定义 \(\rho:\mathcal{E}\rightarrow\lbrack 0,\infty)\) 为一个满足 \(\rho(\varnothing) = 0\) 的函数, 则
>
> \[\mu^{\ast}(A) = \inf\left\{ {\sum\limits_{i = 1}^{\infty}\rho(E_{i}) \mid E_{i} \in \mathcal{E}\ \text{for each i and}\ A \subseteq \bigcup\limits_{i = 1}^{\infty}E_{i}} \right\}\]
>
> is an outer measure.
>
> \end{theorem}
