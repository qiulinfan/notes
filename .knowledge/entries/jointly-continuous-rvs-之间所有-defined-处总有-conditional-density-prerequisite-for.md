---
label: jointly continuous RVs 之间所有 defined 处总有 conditional density prerequisite for independence 下 conditional density 不变
kind: prerequisite-for
prerequisite:
  - "[[jointly-continuous-rvs-defined-conditional-density]]"
dependent:
  - "[[independence-conditional-density]]"
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 909-921
---
The density conclusion uses the conditional-density formula for jointly continuous variables.

## Evidence

> \begin{proposition}{\kn{independence 下 conditional distribution 不变},
> \kn{independence 下 conditional density 不变} 和
> \kn{independence 下 conditional expectation 不变}}
>
> 如果 \(\mathit{X},\mathit{Y}\) 是 independent 的, 那么在任意 defined \(\mathit{y}\) 上,
>
> \[\mathit{F}_{\mathit{X}|\mathit{Y} = \mathit{y}} = \mathit{F}_{\mathit{X}},\quad\mathit{f}_{\mathit{X}|\mathit{Y} = \mathit{y}} = \mathit{f}_{\mathit{X}},\]
>
> 以及
>
> \[\left. \quad\mathbb{E}\lbrack\mathit{X} \middle| \mathit{Y}\rbrack = \mathbb{E}\lbrack\mathit{X}\rbrack \right.\]
>
> \end{proposition}
