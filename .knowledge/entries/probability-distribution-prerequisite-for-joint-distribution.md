---
label: probability distribution prerequisite for joint distribution
kind: prerequisite-for
prerequisite:
  - "[[probability-distribution]]"
dependent:
  - "[[joint-distribution-and-joint-cdf]]"
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 74-91
---
The joint distribution is defined as the push-forward probability distribution of a random vector.

## Evidence

> \begin{definition}{\kn{joint distribution} and \kn{joint cdf}}
>
> 令 \(\mathit{X}_{1},\cdots,\mathit{X}_{\mathit{n}}\) 为 RV from the same prob space. 即 \(\mathbf{X} := (\mathit{X}_{1},\cdots,\mathit{X}_{\mathit{n}})\) 是一个 random vector. 下面的两个对象分别将 \knref{probability distribution} 和 \knref{distribution function (也称 \textbf{cumulative distribution function,
> cdf})} 推广到 random vector.
>
> 我们称 \(\mathbb{P}^{\mathbf{X}}:\mathbb{R}^{\mathit{n}}\rightarrow\mathbb{R}\) defined by
>
> \[\mathbb{P}^{\mathbf{X}}(\mathit{B}) = \mathbb{P}(\mathbf{X}^{- 1}(\mathit{B})),\quad\forall\mathit{B} \in \mathcal{B}(\mathbb{R}^{\mathit{n}})\]
>
> 为 \(\mathit{X}_{1},\cdots,\mathit{X}_{\mathit{n}}\) 的 \textbf{joint distribution}.
>
> 而我们称 \(\mathit{F}_{\mathbf{X}} = \mathit{F}_{\mathit{X}_{1},\cdots,\mathit{X}_{\mathit{n}}}:\mathbb{R}^{\mathit{n}}\rightarrow\mathbb{R}\) defined by
>
> \[\mathit{F}_{\mathbf{X}}(\mathit{x}_{1},\cdots,\mathit{x}_{\mathit{n}}) = \mathbb{P}(\mathit{X}_{1} \leq \mathit{x}_{1},\cdots,\mathit{X}_{\mathit{n}} \leq \mathit{x}_{\mathit{n}})\]
>
> (即 \(\mathbb{P}^{\mathbf{X}}\) restricted to the set of rectangles \(\left\{ {( - \infty,\mathit{x}_{1}\rbrack \times \cdots \times ( - \infty,\mathit{x}_{\mathit{n}}\rbrack:(\mathit{x}_{1},\cdots,\mathit{x}_{\mathit{n}}) \in \mathbb{R}^{\mathit{n}}} \right\}\)) 为它们的 \textbf{joint distribution function (或称 joint cdf)}.
>
> \end{definition}
