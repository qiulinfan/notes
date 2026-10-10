---
label: independence 下 conditional distribution 不变
kind: proposition
aliases:
  - "independence 让 conditional distribution, density 和 expectation 都退化"
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 909-921
understanding: unknown
---
若 X,Y independent，则在 conditional distribution 有定义的每个 y 上，F_{X|Y=y}=F_X；conditioning on Y 不改变 X 的 distribution。

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
