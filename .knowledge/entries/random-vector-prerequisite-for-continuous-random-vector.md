---
label: random vector prerequisite for continuous random vector
kind: prerequisite-for
prerequisite:
  - "[[random-vector]]"
dependent:
  - "[[continuous-random-vector-continuous-joint-cdf]]"
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 146-158
---
A continuous random vector is defined by imposing absolute continuity on a random vector's law.

## Evidence

> \begin{definition}{\kn{continuous random vector} 和 \kn{continuous joint cdf}}
>
> 对于 random vector \(\mathbf{X} = (\mathit{X}_{1},\cdots,\mathit{X}_{\mathit{n}})^{\mathit{T}}\) 如果 \(\mathbb{P}^{\mathbf{X}} \ll \mathit{\lambda}^{\mathit{n}}\), 即它满足 \knref{absolute continuity of signed measures} 中的绝对连续性条件, 即存在一个函数 \(\mathit{f}_{\mathbf{X}}:\mathbb{R}^{\mathit{n}}\rightarrow\lbrack 0,\infty)\) 使得对于任意 Borel set \(\mathit{B} \subseteq \mathbb{R}^{\mathit{n}}\), 有
>
> \[\mathbb{P}^{\mathbf{X}}(\mathit{B}) = \int_{\mathit{B}}\mathit{f}_{\mathbf{X}}(\mathit{x}_{1},\cdots,\mathit{x}_{\mathit{n}})\,\mathit{d}\mathit{\lambda}^{\mathit{n}}(\mathit{x}_{1},\cdots,\mathit{x}_{\mathit{n}})\]
>
> 则称 \(\mathbf{X}\) 是一个 \textbf{continuous random vector}.
>
> 注意: 由于是在 \(\mathbb{R}^{\mathit{n}}\) 上, 这等价于存在一个函数 \(\mathit{f}_{\mathbf{X}}:\mathbb{R}^{\mathit{n}}\rightarrow\lbrack 0,\infty)\) 使得对于任意 \(\mathit{x}_{1},\cdots,\mathit{x}_{\mathit{n}}\), 有
>
> \[\mathit{F}_{\mathbf{X}}(\mathit{x}_{1},\cdots,\mathit{x}_{\mathit{n}}) = \int_{- \infty}^{\mathit{x}_{1}}\cdots\int_{- \infty}^{\mathit{x}_{\mathit{n}}}\mathit{f}_{\mathbf{X}}(\mathit{t}_{1},\cdots,\mathit{t}_{\mathit{n}})\,\mathit{d}\mathit{t}_{\mathit{n}}\cdots\mathit{d}\mathit{t}_{1}\]
>
> \end{definition}
