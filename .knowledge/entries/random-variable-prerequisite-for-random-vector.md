---
label: random variable prerequisite for random vector
kind: prerequisite-for
prerequisite:
  - "[[random-variable]]"
dependent:
  - "[[random-vector]]"
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 8-16
---
The source defines an n-dimensional random variable as the same measurable map as a random vector.

## Evidence

> \begin{definition}{\kn{random vector}}
>
> 对于 prob space \((\Omega,\mathcal{F},\mathit{P})\), 一个 function \(\mathbf{X}:\Omega\rightarrow\mathbb{R}^{\mathit{n}}\) 如果是一个 \((\mathcal{F},\mathcal{B}(\mathbb{R}^{\mathit{n}}))\)-measurable function (即 \knref{$(\mathcal{M},\mathcal{N})$-measurable function} 在这两个 measurable spaces 上的情形), 则 称它为一个 \(\mathit{n}\)-dimensional \knref{random variable}, 或者 \(\mathit{n}\)-dimensional random vector.
>
> 通常我们将 random vector 写成分量形式
>
> \[\mathbf{X}(\mathit{\omega}) = (\mathit{X}_{1}(\mathit{\omega}),\mathit{X}_{2}(\mathit{\omega}),\ldots,\mathit{X}_{\mathit{n}}(\mathit{\omega}))^{\mathit{T}}\]
>
> \end{definition}
