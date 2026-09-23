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
source: "notes/math/numerical-linear-algebra/chapters/02-orthogonal-vectors-and-matrices.typ"
subtitle: Typst-first mathematics notes
title: Numerical Linear Algebra
---
# orthogonal vectors and matrices

> **Definition: adjoint(hermitian conjugate)**
>
> `^*:` $A = \begin{pmatrix}
> a_{11} & a_{12} \\
> a_{21} & a_{22} \\
> a_{31} & a_{32}
> \end{pmatrix}\rightarrow A^{\ast} = \begin{pmatrix}
> \left| a_{11} \right| & \left| a_{21} \right| & \left| a_{31} \right| \\
> \left| a_{12} \right| & \left| a_{22} \right| & \left| a_{32} \right|
> \end{pmatrix}$
>
> (where each overline means complex conjuate.)

> **Remark**
>
> Can easily comfirm:
>
> $\left( {AB} \right)^{\ast} = B^{\ast}A^{\ast}$

> **Definition: standard inner product and norm on $\text{ℂ}^{m}$**
>
> The **standard inner product**:
>
> $< x,y > := x^{\ast}y = \sum_{i = 1}^{m}\left| x_{i} \right|y_{i}$
>
> The **standard norm**:
>
> $\left\| x \right\| := \sqrt{x^{\ast}x}$

> **Remark**
>
> $\sqrt{x^{\ast}x} = \sqrt{\sum_{i = 1}^{m}\left| x_{i} \right|^{2}}$，其中 $\left| x_{i} \right| = \left| {a + bi} \right| = \sqrt{a^{2} + b^{2}}$。
>
> **Note: It is actually $\sqrt{\left| x_{i} \right|x_{i}}$, but not $\sqrt{x_{i}^{2}}$，这是因为 $\sqrt{\left| x_{i} \right|x_{i}}$ 等于这个 complex scalar isomorphic 到 $\mathbb{R}^{2}$ 上的 Euclidean norm，**
>
> 这是因为两个复数相乘等于长度相乘幅角相加，而 conjugate 的幅角是相反的，**所以 conjugate 之间相乘等于幅角相互抵消，结果在 positive real axis 上，取开方得到长度。**
>
> 而平方得到的则是一个转两次的幅角。

> **Remark**
>
> Can easily verifies:
>
> $\left\langle {a,b} \right\rangle_{\text{ℂ}} = \left| \left\langle {b,a} \right\rangle_{\text{ℂ}} \right|$
>
> 且注意：By bilinearity，**对于 $a$ 上的 scaling 在拿出 inner product 外后要进行 conjugate。**

> **Definition: orthogonal, orthonomal vectors**
>
> Say $x,y \in \text{ℂ}^{m}$ 是 orthogonal vectors，if $x^{\ast}y = 0$。
>
> Say $S \subset \text{ℂ}^{m}$ 是 orthogonal 的，如果其中的 vectors 相互 orthogonal。
>
> Say $S \subset \text{ℂ}^{m}$ 是 orthonomal 的，如果其中的 vectors 相互 orthogonal，并且每个 vector 的 norm 都是 1。

> **Theorem: orthogonal $\Rightarrow$ lin.ind**
>
> orthogonal 的 vectors 一定 linearly independent。

> **Proof**
>
> trivial.

> **Corollary**
>
> orthogonal 的 $\text{dim}(V)$ 个 vectors 一定是 $V$ 的一个 basis。

## decomposing vector by an orthonormal set

> **Theorem: decomposing vector by an orthonormal set**
>
> 给定 $\text{ℂ}^{m}$ 中的一个 orthonormal set $\left\{ {q_{1},\ldots,q_{n}} \right\}$ (by inner product $< \cdot >$，这里以 standard complex inner product 为例)， 对于一个 arbitrary vector $v$，我们 define:
>
> $r := v - \sum_{i = 1}^{n} < q_{i},v > q_{i}$
>
> Claim：这个 **$r$ is orthogonal to $\left\{ {q_{1},\ldots,q_{n}} \right\}$,** 即我们把这个 $v$ 分解成了在这个 orthonormal set 上的投影与一个和它们都正交的 vector。

> **Proof**
>
> 注意：由于 $q_{i}$ 都是 unit vectors，$< q_{i},v > q_{i} = \frac{v}{\left\| v \right\|}\cos\alpha = \text{proj}_{q_{i}}(v)$ **is the projection of $v$ onto the direction of $q_{i}$.**
>
> 我们在两边取和 $q_{i}$ 的 inner product，for each $i$。由 linearity 可拆开，由 orthgonality 可得到：
>
> $< q_{i},r > = < q_{i},v > - < q_{i},v > < q_{i},q_{i} >$
>
> 并且由于 $q_{i}$ 是 unit vector，得到 $< q_{i},q_{i} > = 1$，从而右边为 0。

> **Remark**
>
> 如果 $n = m$，那么 $r = 0$，我们把 arbitrary vector 分解成了 $\left\{ {q_{1},\ldots,q_{n}} \right\}$ 方向上的向量，相当于对它进行了 change of basis。这个 change of basis matrix 就等于 $\begin{pmatrix}
> q_{1} & \ldots & q_{n}
> \end{pmatrix}^{T}$。

对于 unit vector $w$，我们刚才已经展示了一个 arbitrary vector $v$ 在它上面的 projection 是：

$\text{proj}_{w{(v)}} = < w,v > w$

现在我们引入另一个形式的 projection 表达：projection matrix

> **Theorem: projection matrix**
>
> 对于任意的 **unit vector $w$**，we have
>
> $\text{proj}_{w{(v)}} = \left( {w \otimes w^{\ast}} \right)v$
>
> 其中 $w \otimes w^{\ast}$ is called the **projection matrix** onto $w$.

> **Proof**
>
> In md.
>
> **Notice that this matrix is rank 1.**

> **Definition: unitrary matrix**
>
> 一个 square matrix $Q \in \text{ℂ}^{m \times m}$ 被称为 unitrary 的，if $Q^{\ast} = Q^{- 1}$。

> **Remark**
>
> unitrary: 即 $QQ^{\ast} = Q^{\ast}Q = I$。
>
> **In real case, 它被称为 orthogonal matrix.**

> **Theorem: unitrary matrix 的充要条件**
>
> $Q \in \text{ℂ}^{m \times m}$ is unitrary $\Leftrightarrow$ **its columns are orthonormal** $\Leftrightarrow$ **its rows are orthonormal**

> **Proof**
>
> 显然，因为 unitrary $\Leftrightarrow QQ^{\ast} = Q^{\ast}Q = I\Leftrightarrow\left\langle {q_{i},q_{j}} \right\rangle = \delta_{ij}$

> **Theorem: unitrary transfromation preserves inner product and length**
>
> 如果 $Q \in \text{ℂ}^{m \times m}$ is unitrary，那么对于任意的 $x,y \in \text{ℂ}^{m}$，都有：
>
> $\left( {Qx} \right)^{\ast}\left( {Qy} \right) = x^{\ast}y$
>
> 并且自然得到 $\left\| {Qx} \right\| = \left\| x \right\|$

> **Proof**
>
> Follows from: $\left( {AB} \right)^{\ast} = B^{\ast}A^{\ast}$: $\left( {Qx} \right)^{\ast}\left( {Qy} \right) = x^{\ast}Q^{\ast}Qy = x^{\ast}y$

> **Remark**
>
> 并不 preserve 自定义的 inner product，只 **preserve standard inner product 和 standard norm.**

