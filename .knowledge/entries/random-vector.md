---
label: random vector
kind: definition
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 8-16
understanding: unknown
---
在 probability space (Omega, F, P) 上，n-dimensional random vector 是从 Omega 到 R^n 的 (F, B(R^n))-measurable function，通常写成分量向量 (X_1,...,X_n)^T。

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
