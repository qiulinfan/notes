---
label: Riemann integrability
kind: definition
aliases:
  - Riemann integrable
source: notes/math/mathematical-analysis/chapters/07-riemann-integration.tex
lines: 104-118
understanding: unknown
---
A function is Riemann integrable when all sufficiently fine tagged Riemann sums approach one common limit.

## Evidence

> \begin{definition}{\kn{Riemann integrability}}
>
> 称 \(f\) 在 \(\left\lbrack {a,b} \right\rbrack\) 上 Riemann Integrable，若存在 \(L \in \mathbb{R}\)，使对任意 \(\varepsilon > 0\)，存在 \(\delta > 0\) 满足
>
> \[\left| {S\left( {f, \cdot P} \right) - L} \right| < \varepsilon\]
>
> 对任何 \(\left\| P \right\| < \delta\) 的 tagged partition \(\cdot P\) 都成立。记
>
> \[L = \int_{a}^{b}f(x)\, dx = \int_{a}^{b}f\]
>
> 并称为 \(f\) 在 \(\left\lbrack {a,b} \right\rbrack\) 上的 Riemann integral。
>
> Riemann Integrable: 对于任意小的 \(\varepsilon\)，都存在 \(\delta\) 使得对于任何 mesh 小于 \(\delta\) 的 partition，都有其 Riemann Sum 和 \(L\) 的距离小于 \(\varepsilon\)。我们发现这是一个 Cauchy 式的 Definition；直觉上（稍后将证明） mesh \(\left\| P \right\|\) 越小，即 partition 越精细，Riemann Sum 就会越接近 area so far，因而这个定义很符合直觉。Informally, \(\lim_{{\| P\|}\rightarrow 0}S\left( {f, \cdot P} \right) = L\).
>
> \end{definition}
