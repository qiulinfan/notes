---
schema: kgdistiller-entry-v1
id: lebesgue-stieltjes-measure-associated-with-f
label: Lebesgue-Stieltjes measure associated with F
kind: definition
aliases: []
source: notes/math/measure-theory/chapters/03-distribution-function-与-lebesgue-stieltjes-measures.tex
line_start: 209
line_end: 221
understanding: unknown
---

# Lebesgue-Stieltjes measure associated with F

## Summary

给定一个 distribution function $F$, 我们使用它来定义 h-intervals 的 premeasure $mu_0$, 并把这个 premeasure induce 出的 outer measure $mu^(*)$ 限制在 $ cal(M)_mu := { upright("all ") mu^(*) upright("-measurable set}") $ 上, 由 Carathéodory Thm 得它是 complete 的. 称这个 complete 的 measure $ mu_F := mu^(*)\|_(cal(M)_mu) $ 为 Lebesgue Stieltjes measure associated with $F$.

## Evidence

```
\begin{definition}{\kn{Lebesgue-Stieltjes measure associated with $F$}}

给定一个 distribution function \(F\), 我们使用它来定义 h-intervals 的 premeasure \(\mu_{0}\), 并把这个 premeasure induce 出的 outer measure \(\mu^{\ast}\) 限制在

\[\mathcal{M}_{\mu} := \{\text{all}\ \mu^{\ast}\ \text{-measurable set\}}\]

上, 由 Carathéodory Thm 得它是 complete 的. 称这个 complete 的 measure

\[\mu_{F} := \mu^{\ast}|_{\mathcal{M}_{\mu}}\]

为 \textbf{Lebesgue Stieltjes measure associated with \(F\).}

\end{definition}
```
