---
label: marginal distribution prerequisite for 通过 joint distribution 的极限得到 marginal distribution
kind: prerequisite-for
prerequisite:
  - "[[marginal-distribution]]"
dependent:
  - "[[marginal-distribution-from-joint-limits]]"
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 103-124
---
The proposition identifies the limiting joint-cdf value with the component's marginal distribution.

## Evidence

> \begin{proposition}{\kn{通过 joint distribution 的极限得到 marginal distribution}}
>
> 令 \(\mathbf{X} = (\mathit{X}_{1},\mathit{X}_{2})^{\mathit{T}}\) 是一个 random vector. 则对于任意 \(\mathit{x} \in \mathbb{R}\), 有
>
> \[\mathbb{P}(\mathit{X}_{1} \leq \mathit{x}) = \lim\limits_{\mathit{y}\rightarrow\infty}\mathit{F}_{\mathbf{X}}(\mathit{x},\mathit{y})\]
>
> \(\mathit{X}_{2}\) 的 marginal distribution 也可以通过同样的方法得到.
>
> 此外, joint distribution 有其他明显的 limit behaviors:
>
> \begin{itemize}
> \item
>   \[\lim\limits_{\mathit{x}\rightarrow - \infty}\mathit{F}(\mathit{x},\mathit{y}) = \lim\limits_{\mathit{y}\rightarrow - \infty}\mathit{F}(\mathit{x},\mathit{y}) = 0\]
> \item
>   \(\mathit{F}_{\mathbf{X}}\) 对于每个维度都是 increasing 且 right-continuous 的.
> \item
>   \[\mathbb{P}(\mathit{X} \leq \mathit{x},\mathit{Y} \leq \mathit{y}) = \lim\limits_{\mathit{z} \uparrow \mathit{y}}\mathit{F}(\mathit{x},\mathit{z}) = \lim\limits_{\mathit{z} \uparrow \mathit{x}}\mathit{F}(\mathit{z},\mathit{y}) = \lim\limits_{\mathit{z}_{1} \uparrow \mathit{x},\mathit{z}_{2} \uparrow \mathit{y}}\mathit{F}(\mathit{z}_{1},\mathit{z}_{2})\]
> \item
>   \[\mathbb{P}(\mathit{x}_{1} \leq \mathit{X} \leq \mathit{x}_{2},\mathit{y}_{1} \leq \mathit{Y} \leq \mathit{y}_{2}) = \mathit{F}(\mathit{x}_{2},\mathit{y}_{2}) - \mathit{F}(\mathit{x}_{1},\mathit{y}_{2}) = \mathit{F}(\mathit{x}_{2},\mathit{y}_{1}) + \mathit{F}(\mathit{x}_{1},\mathit{y}_{1})\]
> \end{itemize}
>
> \end{proposition}
