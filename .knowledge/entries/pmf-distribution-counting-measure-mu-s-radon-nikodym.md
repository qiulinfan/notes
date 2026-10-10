---
schema: kgdistiller-entry-v1
id: pmf-distribution-counting-measure-mu-s-radon-nikodym
label: pmf 是 distribution 对于 counting measure μ _ S 的 Radon-Nikodym 导数
kind: proposition
aliases:
  - pmf 是 distribution 对于 counting measure mu_S 的 Radon-Nikodym 导数
source: notes/math/prob/chapters/02-random-variables.tex
line_start: 330
line_end: 341
understanding: unknown
---

# pmf 是 distribution 对于 counting measure μ _ S 的 Radon-Nikodym 导数

## Summary

离散 distribution 对 counting measure 绝对连续，其 RN 导数即 pmf。

## Evidence

```
\begin{proposition}{\kn{pmf 是 distribution 对于 counting measure $\mathit{\mu}_{\mathit{S}}$
的 Radon-Nikodym 导数}}

对于一个 discrete random variable \(\mathit{X}\), 假设其 range 是 countable set \(\mathit{S}\), 则我们定义 counting measure \(\mathit{\mu}_{\mathit{S}}\) on \(\mathit{S}\) 为:

\[\mathit{\mu}_{\mathit{S}}(\mathit{A}) := \sum\limits_{\mathit{x}_{\mathit{i}} \in \mathit{S}}\mathbf{1}_{\mathit{A}}(\mathit{x}_{\mathit{i}})\]

那么, distribution \(\mathbb{P}^{\mathit{X}} \ll \mathit{\mu}_{\mathit{S}}\) (绝对连续), 并且有:

\[\mathit{p}_{\mathit{X}} = \frac{\mathit{d}\mathbb{P}^{\mathit{X}}}{\mathit{d}\mathit{\mu}_{\mathit{S}}}\]

\end{proposition}
```
