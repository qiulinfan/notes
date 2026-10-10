---
label: continuous random vector prerequisite for joint pdf 和 joint cdf 的性质
kind: prerequisite-for
prerequisite:
  - "[[continuous-random-vector-continuous-joint-cdf]]"
dependent:
  - "[[joint-pdf-joint-cdf]]"
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 190-219
---
The proposition assumes X is a continuous random vector.

## Evidence

> \begin{proposition}{\kn{joint pdf 和 joint cdf 的性质}}
>
> 令 \(\mathbf{X} = (\mathit{X}_{1},\cdots,\mathit{X}_{\mathit{n}})^{\mathit{T}}\) 是一个 continuous random vector, 则它的 joint pdf \(\mathit{f}_{\mathbf{X}}\) 和 joint cdf \(\mathit{F}_{\mathbf{X}}\) 有以下性质:
>
> \begin{itemize}
> \item
>   \(\mathit{f}_{\mathbf{X}} \geq 0\) a.e. 并且 \(\int_{\mathbb{R}^{\mathit{n}}}\mathit{f}_{\mathbf{X}}\,\mathit{d}\mathit{\lambda}^{\mathit{n}} = 1\).
> \item
>   (如果一个集合 \(\mathit{A}\) 有一个零测维度, 那么 \(\mathbb{P}^{\mathbf{X}}(\mathit{A}) = 0\))
>
>   \[\mathbb{P}(\mathit{X}_{1} = \mathit{x}_{1},\mathit{x}_{2} \leq \mathit{X}_{2} \leq \mathit{x}_{2}'\cdots,\mathit{x}_{\mathit{n}} \leq \mathit{X}_{\mathit{n}} \leq \mathit{x}_{\mathit{n}}') = 0\]
> \item
>   每个 \(\mathit{X}_{\mathit{i}}\) 的 marginal distribution 也是 (absolutely) continuous 的, 并且
>
>   \[\mathit{f}_{\mathit{X}_{\mathit{i}}}(\mathit{x}) = \int_{\mathbb{R}^{\mathit{n} - 1}}\mathit{f}_{\mathbf{X}}(\mathit{t}_{1},\cdots,\mathit{t}_{\mathit{i} - 1},\mathit{x},\mathit{t}_{\mathit{i} + 1},\cdots,\mathit{t}_{\mathit{n}})\,\mathit{d}\mathit{t}_{1}\cdots\mathit{d}\mathit{t}_{\mathit{i} - 1}\mathit{d}\mathit{t}_{\mathit{i} + 1}\cdots\mathit{d}\mathit{t}_{\mathit{n}}\]
>
>   例如,
>
>   \[\mathit{f}_{\mathit{X}}(\mathit{x}) = \int_{- \infty}^{\infty}\mathit{f}_{\mathbf{X}}(\mathit{x},\mathit{y})\,\mathit{d}\mathit{y}\]
> \item
>   对每个 \(\mathit{x}_{1},\cdots,\mathit{x}_{\mathit{n}} \in \mathbb{R}\), 都可以通过偏导数从 joint cdf 得到 joint pdf (这个偏导数一定 (a.e.) 存在):
>
>   \[\mathit{f}_{\mathbf{X}}(\mathit{x}_{1},\cdots,\mathit{x}_{\mathit{n}}) = \frac{\mathit{\partial}^{\mathit{n}}}{\mathit{\partial}\mathit{x}_{1}\cdots\mathit{\partial}\mathit{x}_{\mathit{n}}}\mathit{F}_{\mathbf{X}}(\mathit{x}_{1},\cdots,\mathit{x}_{\mathit{n}})\]
>
>   并且 by Fubini's theorem 可以 (a.e.) 任意换序:
>
>   \[\frac{\mathit{\partial}^{\mathit{n}}}{\mathit{\partial}\mathit{x}_{\mathit{\sigma}(1)}\ldots\mathit{\partial}\mathit{x}_{\mathit{\sigma}(\mathit{n})}}\mathit{F}_{\mathbf{X}}\overset{\mathit{a}.\mathit{e}.}{=}\mathit{f}_{\mathbf{X}}\]
> \end{itemize}
>
> \end{proposition}
