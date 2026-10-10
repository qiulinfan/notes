---
label: measure space prerequisite for inclusion-exclusion principle
kind: prerequisite-for
prerequisite:
  - "[[measure-space]]"
dependent:
  - "[[inclusion-exclusion-principle]]"
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
lines: 288-294
---
The proposition is formulated for a finite measure space and evaluates measures of unions and intersections.

## Evidence

> \begin{proposition}{\kn{inclusion-exclusion principle}}
>
> 如果 \(\Omega\) 是 \knref{measure space} 意义下的一个 finite measure space, 那么对于任意 \(\mathit{A}_{1},\ldots,\mathit{A}_{\mathit{n}} \subseteq \Omega\) 的, 有:
>
> \[\left| {\cup_{\mathit{i} = 1}^{\mathit{n}}\mathit{A}_{\mathit{i}}} \right| = \sum\limits_{\mathit{i} = 1}^{\mathit{n}}\left| \mathit{A}_{\mathit{i}} \right| - \sum\limits_{\mathit{i} < \mathit{j}}\left| {\mathit{A}_{\mathit{i}} \cap \mathit{A}_{\mathit{j}}} \right| + \sum\limits_{\mathit{i} < \mathit{j} < \mathit{k}}\left| {\mathit{A}_{\mathit{i}} \cap \mathit{A}_{\mathit{j}} \cap \mathit{A}_{\mathit{k}}} \right| - \ldots + ( - 1)^{\mathit{n} + 1}\left| {\mathit{A}_{1} \cap \ldots \cap \mathit{A}_{\mathit{n}}} \right|.\]
>
> \end{proposition}
