---
label: Uniform convergence
kind: definition
source: notes/math/mathematical-analysis/chapters/08-sequences-and-series-of-functions.tex
lines: 95-107
understanding: unknown
---
A sequence of functions converges uniformly when a single index bound controls the error over the entire domain.

## Evidence

> \begin{definition}{\kn{Uniform convergence}}
>
> 令 \(\left( {f_{n}:A\rightarrow\mathbb{R}} \right)_{n \in \ \mathbb{N}}\) 是一个 seq. of functions。称 \(\left( f_{n} \right)\) 在 \(A\) 上 uniformly converges to \(f:A\rightarrow\mathbb{R}\)，if
>
> \[\forall\varepsilon > 0,\exists N \in \mathbb{N}\text{such that}\ \forall x \in A\ \text{and}\ n \geq N,\left| {f_{n{(x)}} - f(x)} \right| < \varepsilon.\]
>
> 两个 definitions 的 distinction 是：
>
> \[\text{pointwise}:\forall x \in A,\forall\varepsilon > 0,\exists N \in \mathbb{N}\text{such that}\ \left| {f_{n{(x)}} - f(x)} \right| < \varepsilon\ \text{whenever}n \geq N;\]\[\text{uniform}:\forall\varepsilon > 0,\exists N \in \mathbb{N}\text{such that}\ \forall x \in A,\left| {f_{n{(x)}} - f(x)} \right| < \varepsilon\ \text{whenever}n \geq N.\]
>
> pointwise 是逐点各自使用自己的 \(\varepsilon\) bound；uniform 是一个 \(\varepsilon\) bound 所有 \(x \in A\) 共用，把 \(A\) 中所有点作为整体联系起来。
>
> \end{definition}
