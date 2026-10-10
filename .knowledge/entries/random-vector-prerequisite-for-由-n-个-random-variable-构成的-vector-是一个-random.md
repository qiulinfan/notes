---
label: random vector prerequisite for 由 n 个 random variable 构成的 vector 是一个 random vector
kind: prerequisite-for
prerequisite:
  - "[[random-vector]]"
dependent:
  - "[[n-random-variable-vector-random-vector]]"
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 20-28
---
The proposition concludes that the componentwise map is a random vector.

## Evidence

> \begin{proposition}{\kn{由 $\mathit{n}$ 个 random variable 构成的 vector 是一个 random vector}}
>
> 令 \(\mathit{X}_{1},\mathit{X}_{2},\cdots,\mathit{X}_{\mathit{n}}\) 是定义在\textbf{同一个 prob space} \((\Omega,\mathcal{F},\mathbb{P})\) 上的 \(\mathit{n}\) 个 random variables. 则函数 \(\mathbf{X}:\Omega\rightarrow\mathbb{R}^{\mathit{n}}\) defined by
>
> \[\mathit{\omega}\mapsto(\mathit{X}_{1}(\mathit{\omega}),\mathit{X}_{2}(\mathit{\omega}),\cdots,\mathit{X}_{\mathit{n}}(\mathit{\omega}))^{\mathit{T}}\]
>
> 是一个 random vector.
>
> \end{proposition}
