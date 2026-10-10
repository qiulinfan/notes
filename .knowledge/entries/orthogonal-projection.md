---
schema: kgdistiller-entry-v1
id: orthogonal-projection
label: Orthogonal projection
kind: definition
aliases: []
source: notes/math/linear-algebra/chapters/05-geometry-of-linear-transformations.tex
line_start: 70
line_end: 82
understanding: unknown
---

# Orthogonal projection

## Summary

The component of a vector parallel to a line, with its projection formula.

## Evidence

```
\begin{definition}{\kn{Orthogonal projection}}

Consider a line \(L\) in coordinate plane, 经过 \(\left( {0,0} \right)\). 任何 \(x \in \mathbb{R}^{2}\) 都可以写成 \(x = x^{\parallel} + x^{\perp}\), where \(x^{\parallel}\ \|\ L\) and \(x^{\perp} \perp L\). The transformation \(T(x) = x^{\parallel}\) is the orthogonal projection of \(x\) onto \(L\), denoted \(\text{proj}_{L{(x)}}\).

随意取 \(w\ \|\ L\), \(\text{proj}_{L{(x)}} = \frac{x \cdot w}{w \cdot w}w\). 特别地，如果 \(w\) 是 unit vector \(u = \begin{pmatrix}
u_{1} \\
u_{2}
\end{pmatrix}\ \|\ L\), then \(\text{proj}_{L{(x)}} = \left( {x \cdot u} \right)u\). 这一个 transformation 是 linear 的；with matrix \(P = \begin{pmatrix}
u_{1}^{2} & {u_{1}u_{2}} \\
{u_{1}u_{2}} & u_{2}^{2}
\end{pmatrix}\).

\end{definition}
```
