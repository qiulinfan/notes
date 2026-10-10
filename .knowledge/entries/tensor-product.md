---
schema: kgdistiller-entry-v1
id: tensor-product
label: Tensor product
kind: definition
aliases: []
source: notes/math/numerical-linear-algebra/chapters/01-tensor-products-and-matrix-multiplication.tex
line_start: 6
line_end: 20
understanding: unknown
---

# Tensor product

## Summary

The notes introduce a bilinear tensor-product operation on vector spaces and span the basis tensors as V tensor W.

## Evidence

```
\begin{definition}{(not rigorous) \kn{Tensor product}}

令 \(V,W\) be vector spaces over \(\mathbb{F}\)，我们定义一个 vector 与 vector 之间的 tensor product operation：

\(\otimes :\left( {v,w} \right)\rightarrow v \otimes w\)

s.t. 对于 \(V,W\) 的 basis \(e_{1},\ldots,e_{n}\) 和 \(\varepsilon_{1},\ldots,\varepsilon_{m}\)，我们给每个 \(\left( {e_{i},\varepsilon_{j}} \right)\) 都赋予一个不同的 image \(e_{i} \otimes \varepsilon_{j}\)，其 over \(\mathbb{F}\) 具有 bilinear 性。

对于

\(V \otimes W := \text{span}\left( \left\{ {e_{i} \otimes e_{j}:1 \leq i \leq n,1 \leq j \leq m} \right\} \right)\)

\(V \otimes W\) 也是一个 over \(\mathbb{F}\) 的 vector space，且 \(\text{dim}\left( {V \otimes W} \right) = mn\)。

\end{definition}
```
