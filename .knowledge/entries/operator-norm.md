---
schema: kgdistiller-entry-v1
id: operator-norm
label: Operator norm
kind: definition
aliases:
  - induced norm
source: notes/math/numerical-linear-algebra/chapters/03-norms.tex
line_start: 56
line_end: 68
understanding: unknown
---

# Operator norm

## Summary

The induced matrix norm given by the supremum of the output norm over unit input vectors, measuring maximum stretching.

## Evidence

```
\begin{definition}{\kn{Operator norm}}

\(\left\| A \right\|_{m,n} = \sup_{z \in \mathbb{C}^{m},{\| z\|}_{n} = 1}\left\| {Ax} \right\|_{m}\)

induced by vector norm. 表示它\textbf{stretch vector 的最大程度}。其中, source 和 image vector 分别用 norm n,m 来判定。

如果 source 和 image vector 的 norm 是一样的，比如都使用某个 \(L_{p}\) norm，那么我们可以用单个符号表示(induced by \(p\)-norm):

\(\left\| A \right\|_{p} = \sup_{z \in \mathbb{C}^{m},{\| z\|}_{p} = 1}\left\| {Ax} \right\|_{p}\)

(这更加常用，因为通常我们会对 source 和 image vector 的大小使用相同的评估)

\end{definition}
```
