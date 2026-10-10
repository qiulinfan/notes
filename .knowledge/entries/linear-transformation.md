---
schema: kgdistiller-entry-v1
id: linear-transformation
label: Linear transformation
kind: definition
aliases:
  - linear map
source: notes/math/linear-algebra/chapters/04-linear-transformations.tex
line_start: 30
line_end: 42
understanding: unknown
---

# Linear transformation

## Summary

A map between real vector spaces represented by a matrix in the notes.

## Evidence

```
\begin{definition}{\kn{Linear transformation}}

A function \(T:\mathbb{R}^{m}\rightarrow\mathbb{R}^{n}\) is called a linear transformation if for every \(x \in \mathbb{R}^{m}\) there is an \(n \times m\) matrix \(A\) such that \(T(x) = Ax\).

Example: \(y = x_{1}^{2} + x_{2}^{2} + x_{3}^{2}\) has input \(\begin{pmatrix}
x_{1} \\
x_{2} \\
x_{3}
\end{pmatrix}\) and output \(\lbrack y\rbrack\); \(A = \begin{pmatrix}
x_{1} & x_{2} & x_{3}
\end{pmatrix}\). 可以发现 \(y = x \cdot x\) is not a linear transformation of \(x\).

\end{definition}
```
