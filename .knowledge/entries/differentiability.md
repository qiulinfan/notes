---
label: Differentiability
kind: definition
source: notes/math/multivariate-analysis/chapters/02-multivariable-differentiation.tex
lines: 30-34
understanding: unknown
---
A map on an open subset of R^n is differentiable at a point when a linear map gives a remainder negligible relative to the displacement.

## Evidence

> \begin{definition}{\kn{Differentiability}}
>
> Let \(A \subseteq \mathbb{R}^{n}\) be open and \(f:A\rightarrow\mathbb{R}^{m}\). The map \(f\) is differentiable at \(x_{0} \in A\) if there is a linear map \(A_{0}:\mathbb{R}^{n}\rightarrow\mathbb{R}^{m}\) such that \(\lim_{{\| h\|}\rightarrow 0}\frac{\left\| {f\left( {x_{0} + h} \right) - f\left( x_{0} \right) - A_{0}h} \right\|}{\left\| h \right\|} = 0\). The linear map is unique and is denoted \(Df\left( x_{0} \right)\).
>
> \end{definition}
