---
schema: kgdistiller-entry-v1
id: inverse-function-theorem
label: Inverse function theorem
kind: theorem
aliases: []
source: notes/math/multivariate-analysis/chapters/03-implicit-and-inverse-functions.tex
line_start: 54
line_end: 58
understanding: unknown
---

# Inverse function theorem

## Summary

A C^r map on an open subset of R^n with nonsingular derivative at a point has a local C^r inverse near that point.

## Evidence

```
\begin{theorem}{\kn{Inverse function theorem}}

Let \(f:A \subseteq \mathbb{R}^{n}\rightarrow\mathbb{R}^{n}\) be \(C^{r}\) (\(r \geq 1\)), with \(A\) open and \(x_{0} \in A\). If \(Df\left( x_{0} \right)\) is nonsingular, then some open neighborhoods \(U\) of \(x_{0}\) and \(V\) of \(f\left( x_{0} \right)\) satisfy: \(f:U\rightarrow V\) is bijective, its inverse \(g:V\rightarrow U\) is \(C^{r}\), and \(Dg\left( {f(x)} \right) = \left( {Df(x)} \right)^{- 1}\) for \(x \in U\).

\end{theorem}
```
