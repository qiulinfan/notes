---
label: Condition number
kind: definition
aliases:
  - matrix condition number
source: notes/math/numerical-linear-algebra/chapters/07-conditioning-and-stability.tex
lines: 224-236
understanding: unknown
---
For a matrix A, the notes define kappa(A) as the product of the operator norms of A and its pseudoinverse.

## Evidence

> \begin{definition}{\kn{Condition number} of a matrix}
>
> 我们定义 condition number of a matrix:
>
> \(\kappa(A) := \left\| A \right\|\left\| A^{\dagger} \right\|\)
>
> Notice: 如果 \(\left\| \cdot \right\| := \left\| \cdot \right\|_{2}\), 那么 for \(A \in \mathbb{C}^{m \times n}\), we have:
>
> \(\left\| A \right\|_{2} = \sigma_{1},\quad\left\| A^{\dagger} \right\|_{2} = \frac{1}{\sigma_{r}}\)
>
> where \textbf{\(\sigma_{r}\) 是最小的非零的 singular value.}
>
> \end{definition}
