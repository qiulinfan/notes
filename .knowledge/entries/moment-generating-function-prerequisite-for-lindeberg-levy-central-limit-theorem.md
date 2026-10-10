---
label: moment generating function prerequisite for Lindeberg-Levy Central Limit Theorem
kind: prerequisite-for
prerequisite:
  - "[[moment-generating-function]]"
dependent:
  - "[[lindeberg-levy-central-limit-theorem]]"
source: notes/math/prob/chapters/05-CLT.tex
lines: 66-74
---
the notes prove the central limit theorem through transform convergence

## Evidence

> \begin{theorem}{\kn{Lindeberg-Levy Central Limit Theorem}}
>
> 对于任意一个 seq of i.i.d. random variables \(\left\{ \mathit{X}_{\mathit{i}} \right\}\) with mean \(\mathit{\mu}\) and variance \(\mathit{\sigma}^{2} < \infty\), set \(\mathit{S}_{\mathit{n}} = \mathit{X}_{1} + \mathit{X}_{2} + \cdots + \mathit{X}_{\mathit{n}}\) for each \(\mathit{n}\).
>
> 我们有:
>
> \[\frac{\mathit{S}_{\mathit{n}} - \mathit{n}\mathit{\mu}}{\sqrt{\mathit{n}\mathit{\sigma}^{2}}}\overset{\mathit{d}}{\rightarrow}\mathit{N}(0,1)\]
>
> \end{theorem}
