---
label: Lebesgue Decomposition Theorem
kind: theorem
source: notes/math/prob/chapters/02-random-variables.tex
lines: 562-570
understanding: unknown
---
distribution 可分为绝对连续、离散原子与奇异连续部分。

## Evidence

> \begin{theorem}{\kn{Lebesgue Decomposition Theorem}}
>
> 对于任意 random variable \(\mathit{X}:\Omega\rightarrow\mathbb{R}\), 其 distribution \(\mathbb{P}^{\mathit{X}}\) 可以唯一分解为三个 mutually singular 的 measure 的和:
>
> \[\mathbb{P}^{\mathit{X}} = \mathbb{P}_{\mathit{a}\mathit{c}}^{\mathit{X}} + \mathbb{P}_{\mathit{s}\mathit{c}}^{\mathit{X}} + \mathbb{P}_{\mathit{d}}^{\mathit{X}}\]
>
> 其中 \(\mathbb{P}_{\mathit{a}\mathit{c}}^{\mathit{X}} \ll \mathit{m}\) 是 absolutely continuous measure, \(\mathbb{P}_{\mathit{s}\mathit{c}}^{\mathit{X}} \perp \mathit{m}\) 是一个 singular continuous measure, \(\mathbb{P}_{\mathit{d}}^{\mathit{X}} \perp \mathit{m}\) 是 discrete measure.
>
> \end{theorem}
