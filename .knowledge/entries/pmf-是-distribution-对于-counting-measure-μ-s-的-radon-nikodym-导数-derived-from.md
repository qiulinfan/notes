---
label: pmf 是 distribution 对于 counting measure μ _ S 的 Radon-Nikodym 导数 derived from probability mass function (pmf)
kind: derived-from
derived:
  - "[[pmf-distribution-counting-measure-mu-s-radon-nikodym]]"
origin:
  - "[[probability-mass-function-pmf]]"
source: notes/math/prob/chapters/02-random-variables.tex
lines: 330-341
---
327–348：pmf 被表述为 distribution 对 counting measure 的 RN 导数。

## Evidence

> \begin{proposition}{\kn{pmf 是 distribution 对于 counting measure $\mathit{\mu}_{\mathit{S}}$
> 的 Radon-Nikodym 导数}}
>
> 对于一个 discrete random variable \(\mathit{X}\), 假设其 range 是 countable set \(\mathit{S}\), 则我们定义 counting measure \(\mathit{\mu}_{\mathit{S}}\) on \(\mathit{S}\) 为:
>
> \[\mathit{\mu}_{\mathit{S}}(\mathit{A}) := \sum\limits_{\mathit{x}_{\mathit{i}} \in \mathit{S}}\mathbf{1}_{\mathit{A}}(\mathit{x}_{\mathit{i}})\]
>
> 那么, distribution \(\mathbb{P}^{\mathit{X}} \ll \mathit{\mu}_{\mathit{S}}\) (绝对连续), 并且有:
>
> \[\mathit{p}_{\mathit{X}} = \frac{\mathit{d}\mathbb{P}^{\mathit{X}}}{\mathit{d}\mathit{\mu}_{\mathit{S}}}\]
>
> \end{proposition}
