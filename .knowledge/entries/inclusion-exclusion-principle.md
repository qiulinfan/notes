---
label: inclusion-exclusion principle
kind: proposition
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
lines: 288-294
understanding: unknown
---
Inclusion-exclusion principle 在 finite measure space 中以交集大小的交替和计算有限并集：先加各集合，再减二重交，加三重交，依此类推直到全体交集。

## Evidence

> \begin{proposition}{\kn{inclusion-exclusion principle}}
>
> 如果 \(\Omega\) 是 \knref{measure space} 意义下的一个 finite measure space, 那么对于任意 \(\mathit{A}_{1},\ldots,\mathit{A}_{\mathit{n}} \subseteq \Omega\) 的, 有:
>
> \[\left| {\cup_{\mathit{i} = 1}^{\mathit{n}}\mathit{A}_{\mathit{i}}} \right| = \sum\limits_{\mathit{i} = 1}^{\mathit{n}}\left| \mathit{A}_{\mathit{i}} \right| - \sum\limits_{\mathit{i} < \mathit{j}}\left| {\mathit{A}_{\mathit{i}} \cap \mathit{A}_{\mathit{j}}} \right| + \sum\limits_{\mathit{i} < \mathit{j} < \mathit{k}}\left| {\mathit{A}_{\mathit{i}} \cap \mathit{A}_{\mathit{j}} \cap \mathit{A}_{\mathit{k}}} \right| - \ldots + ( - 1)^{\mathit{n} + 1}\left| {\mathit{A}_{1} \cap \ldots \cap \mathit{A}_{\mathit{n}}} \right|.\]
>
> \end{proposition}
