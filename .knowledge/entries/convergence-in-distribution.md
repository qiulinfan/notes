---
label: convergence in distribution
kind: definition
source: notes/math/prob/chapters/05-CLT.tex
lines: 6-12
understanding: unknown
---
在极限 CDF 连续点上 F_Xn(x)→F_X(x) 定义按分布收敛。

## Evidence

> \begin{definition}{\kn{convergence in distribution}}
>
> 这里的分布采用 \knref{probability distribution} 的定义。我们称一个 seq of random variables \(\left\{ \mathit{X}_{\mathit{n}} \right\}\) converge in distribution to a random variable \(\mathit{X}\), 写作 \(\mathit{X}_{\mathit{n}}\overset{\mathit{d}}{\rightarrow}\mathit{X}\), 如果 \(\mathit{X}\) 的 分布函数 \(\mathit{F}_{\mathit{X}}\) 下所有 右连续的 \(\mathit{x}\) (即 \(\mathit{F}_{\mathit{X}}(\mathit{x}) = \mathit{F}_{\mathit{X}}(\mathit{x} - )\) ), 都有
>
> \[\lim\limits_{\mathit{n}\rightarrow\infty}\mathit{F}_{\mathit{X}_{\mathit{n}}}(\mathit{x}) = \mathit{F}_{\mathit{X}}(\mathit{x})\]
>
> \end{definition}
