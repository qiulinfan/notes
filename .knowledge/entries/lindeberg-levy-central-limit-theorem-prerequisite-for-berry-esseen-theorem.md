---
label: Lindeberg-Levy Central Limit Theorem prerequisite for Berry-Esseen Theorem
kind: prerequisite-for
prerequisite:
  - "[[lindeberg-levy-central-limit-theorem]]"
dependent:
  - "[[berry-esseen-theorem]]"
source: notes/math/prob/chapters/05-CLT.tex
lines: 171-177
---
Berry-Esseen quantifies the rate in the central limit theorem

## Evidence

> \begin{theorem}{\kn{Berry-Esseen Theorem}}
>
> 给定一个 seq of i.i.d. random variables \(\left\{ \mathit{X}_{\mathit{i}} \right\}\) with mean \(\mathit{\mu}\) and variance \(\mathit{\sigma}^{2} < \infty\), 以及 \(\left. \mathbb{E}\lbrack \middle| \mathit{X}_{\mathit{i}} - \mathit{\mu} \middle| {}_{3}\rbrack = \mathit{\rho} < \infty \right.\), set \(\mathit{S}_{\mathit{n}} = \mathit{X}_{1} + \mathit{X}_{2} + \cdots + \mathit{X}_{\mathit{n}}\), 我们有: 对于任意 \(\mathit{x} \in \mathbb{R}\),
>
> \[\left| {\mathbb{P}\left( {\frac{\mathit{S}_{\mathit{n}} - \mathit{n}\mathit{\mu}}{\sqrt{\mathit{n}\mathit{\sigma}^{2}}} \leq \mathit{x}} \right) - \Phi(\mathit{x})} \right| \leq \frac{3\mathit{\rho}}{\mathit{\sigma}^{2}\sqrt{\mathit{n}}}\]
>
> \end{theorem}
