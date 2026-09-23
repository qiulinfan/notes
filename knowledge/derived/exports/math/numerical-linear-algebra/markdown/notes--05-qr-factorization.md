---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: Numerical Linear Algebra
date: 2026
description: Numerical Linear Algebra notes migrated from the explicitly selected personal historical sources.
keywords:
- Numerical Linear Algebra
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/numerical-linear-algebra/chapters/05-qr-factorization.typ"
subtitle: Typst-first mathematics notes
title: Numerical Linear Algebra
---
# QR factorization

## projector

> **Definition**
>
> 我们称一个 operator $P:\text{ℂ}^{n}\rightarrow\text{ℂ}^{n}$ 为一个 projector, if
>
> $P^{2} = P$
>
> Note: **不要求是 linear 的.** For linear case, 这是一个**idempotent linear map.**
>
> (而我们将主要关注于 linear orthogonal projector.)

> **Remark**
>
> 一个 projector 总有：
>
> $P^{m} = P$
>
> 对于任意 $m$ 次 composition。
>
> 即：在第一次作用后，之后再对其结果进行这一映射不作出任何改变。
>
> 直观：这个映射的效果是把一个向量投影到一个低维度子空间上，从而，在作用过一次后，再次施加这一映射将没有任何改变。

> **Remark**
>
> 对于 orthogonal 的 projector，我们称其为 orthogonal projector; 对于 non-orthogonal 的 projector，我们称其为 oblique projector.

> **Remark**
>
> projector 虽然不保证是 linear 的，但是要么是 linear 的，要么就是个 affine transformation. 和 linear 也差不多. 不用在意这些细节.

以下，我们都只考虑 projector linear 的情况. nonlinear 的情况是类似的.

> **Lemma**
>
> 我们发现，一个 projector $P$ 沿着 $S_{1} := \text{ker}(P)$ 把空间投影到 $S_{2} := \text{im}(P)$ 上.

> **Lemma**
>
> 一个 projector 的 eigenvalue 只有可能是 $0$ 或者 $1$. 它的 SVD 同时也是 eigenvalue decomposition:
>
> $P = Q\Sigma Q^{\ast}$
>
> 其中 $\Sigma$ 是一个前面全 1, 后面全 0 的对角矩阵.

> **Lemma: complement projector**
>
> 如果 $P$ 是一个 projector，那么 $I - P$ 也是一个 projector.
>
> 我们称 $I - P$ 为 $P$ 的 complementary projector.
>
> 并且我们有: **complementary projector 的 ker 是原 projector 的 im, im 是原 projector 的 ker.**

> **Remark**
>
> $P$ 把 vectors 沿着 $S_{1}$ 投影到 $S_{2}$;
>
> $I - P$ 把 vectors 沿着 $S_{2}$ 投影到 $S_{1}$.

> **Definition: orthogonal projector**
>
> 我们称一个 projector 是 orthogonal projector，如果 $\text{ker}(P) \perp \text{im}(P)$.

> **Theorem**
>
> 一个 projector $P$ 是 orthogonal projector $\Leftrightarrow P = P^{\ast}$，即 $P$ 是 Hermitian 的.

> **Theorem**
>
> 一个 projector $P$ 是 orthogonal projector，则它的 **complementary projector $I - P$ 也是 orthogonal projector.**

> **Corollary**
>
> orthogonal projector $P$ 的 complementary $I - P$ 把 vectors 投影到 ${\text{im}(P)}^{\perp}$ 上.

## classical Gram-Schmidt orthogonalization

classical Gram-Schmidt 是计算 reduced QR 分解的算法.

TODO (source `05-qr-factorization.tex`, lines 77--82): selected TeX includes the figure `assets/Screenshot 2025-04-17 at 11.44.46.png`, captioned `reduced QR` and labelled `fig:reduced QR`; the asset is not among the selected chapter sources.

### idea of triangular orthogonalization

classical Gram-Schmidt orthogonalization 的 idea 是: 我们逐列地将 $A$ 的 columns 转变为相互 orthogonal 的新列.

具体: 我们每次都把 $a_{j}$ 减去 $a_{1},\ldots,a_{j - 1}$ 的 span 包含的成分，从而制作成和 $a_{1},\ldots,a_{j - 1}$ 的 span 正交的新列 $q_{j}$:

$q_{j} := \text{normalized}\left( {a_{j} - \text{proj}_{\langle{a_{1},\ldots,a_{j - 1}}\rangle}a_{j}} \right)$

$= \text{normalized}\left( {a_{j} - \text{proj}_{\langle{q_{1},\ldots,q_{j - 1}}\rangle}a_{j}} \right)$

展开这个定义:

$v_{j} := a_{j} - \left( {q_{1}^{\ast}a_{j}} \right)q_{1} - \left( {q_{2}^{\ast}a_{j}} \right)q_{2} - \ldots - \left( {q_{j - 1}^{\ast}a_{j}} \right)q_{j - 1}$

$q_{j} := \frac{v_{j}}{\left| v_{j} \right|}$

这个过程可以通过定义:

$r_{ij} = q_{i}^{\ast}a_{j}\left( {i \neq j} \right),\quad\left| r_{jj} \right| = \left\| {a_{j} - \sum_{i = 1}^{j - 1}r_{ij}q_{i}} \right\|_{2}$

(Note that the sign of $r_{jj}$ is not determined. Arbitrarily, we may choose $r_{jj} > 0$, in which case we shall finish with a factorization $A = \widehat{Q}\widehat{R}$ in which $\widehat{R}$ has positive entries along the diagonal.)

从而这个过程写作:

$v_{j} := a_{j} - \sum_{i = 1}^{j - 1}r_{ij}q_{i}$

$q_{j} := \frac{v_{j}}{r_{jj}}$

我们发现:

$q_{1} = \frac{a_{1}}{r_{11}}$

$q_{2} = \frac{a_{2} - r_{12}q_{1}}{r_{22}}$

$q_{3} = \frac{a_{3} - r_{13}q_{1} - r_{23}q_{2}}{r_{33}}$

$\vdots$

$q_{n} = \frac{a_{n} - \sum_{i = 1}^{n - 1}r_{in}q_{i}}{r_{nn}}$

这个过程使得:

$a_{j} = \sum_{i = 1}^{j}r_{ij}q_{i}$

从而:

$A = \widehat{Q}\widehat{R}$

### algorithm

Classical Gram-Schmidt (unstable)

``` {data-lang="text"}
FOR j = 1 TO n
    v_j ← a_j
    FOR i = 1 TO j-1
        r_ij ← q_i* a_j
        v_j ← v_j - r_ij q_i
    ENDFOR
    r_jj ← ||v_j||_2
    q_j ← v_j / r_jj
ENDFOR
```

## modified Gram-Shimitdt (triangular orthogonalization)

## Household Triangularization

