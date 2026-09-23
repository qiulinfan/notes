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
source: "notes/math/numerical-linear-algebra/chapters/03-norms.typ"
subtitle: Typst-first mathematics notes
title: Numerical Linear Algebra
---
# norms

> **Definition: norm**
>
> 一个 norm on a vector space $V$是一个满足：
>
> 1.  nonnegativity (0 iff $x = 0$)
> 2.  trianglar ineq
> 3.  homogenity
>
> 的 function $\left\| \cdot \right\|:V\rightarrow\mathbb{R}$

## norms on $\text{ℂ}^{m}$

> **Example**
>
> 以下为 $\text{ℂ}^{m}$ 上的典型 norms: (absolute value 表示 length, 即 $\sqrt{x^{\ast}x}$)
>
> Lp-norm: $p$ 越大，the largest length dimension 占 norm 的比重就越大
>
> $\left\| x \right\|_{p} = \left( {\sum_{i = 1}^{m}\left| x_{i} \right|^{p}} \right)^{\frac{1}{p}}$
>
> **$L_{\infty}$-norm:最长维度.**
>
> $\left\| x \right\|_{\infty} = \max_{i}\left| x_{i} \right|$
>
> weighted norm: 给定一个 norm $\left\| \cdot \right\|_{k}$，这是 weighted version of this norm. 其中 **$W$ 是一个 diagonal matrix, diag 上的是 weights.**
>
> $\left\| x \right\|_{W,k} = \left\| {Wx} \right\|_{k}$
>
> TODO (source `03-norms.tex`, line 28): selected TeX refers to `01-fundamentals.assets/Screenshot 2025-01-29 at 22.41.10.png`; the asset is not among the selected chapter sources.
>
> TODO (source `03-norms.tex`, line 29): selected TeX refers to `01-fundamentals.assets/Screenshot 2025-01-29 at 22.41.52.png`; the asset is not among the selected chapter sources.

## operator norms on matrix spaces

We know: 所有的 $m \times n$ matrix, every entry in $\text{F}$ 也是一个 vector space of $\text{dim}\ nm$ over $\text{F}$。

所以我们当然也可以给 matrix 赋范。

matrix 代表一个 linear transformation，所以 norm 的意义实际上是它 stretch vector 的程度的一种评估。

> **Example**
>
> > **Definition: operator norm**
> >
> > $\left\| A \right\|_{m,n} = \sup_{z \in \text{ℂ}^{m},{\| z\|}_{n} = 1}\left\| {Ax} \right\|_{m}$
> >
> > induced by vector norm. 表示它**stretch vector 的最大程度**。其中, source 和 image vector 分别用 norm n,m 来判定。
> >
> > 如果 source 和 image vector 的 norm 是一样的，比如都使用某个 $L_{p}$ norm，那么我们可以用单个符号表示(induced by $p$-norm):
> >
> > $\left\| A \right\|_{p} = \sup_{z \in \text{ℂ}^{m},{\| z\|}_{p} = 1}\left\| {Ax} \right\|_{p}$
> >
> > (这更加常用，因为通常我们会对 source 和 image vector 的大小使用相同的评估)
>
> > **Proposition: **diagonal matrix 的 norm: reduced to max diag element****
> >
> > 如果 $D$ 是一个 diagonal matrix，那么不论取什么 $p$-norm，我们都有：
> >
> > $\left\| D \right\|_{p} = \max_{1 \leq i \leq m}\left| d_{i} \right|$
> >
> > 其中 $d_{i}$ 为对角线上的元素。
>
> > **Proof**
> >
> > 很直观。我们要把一个以 $\left\| \cdot \right\|_{p}$ 为衡量的 unit ball 上的哪个 vector 被拉伸的程度最大，而 diagonal matrix 把每个坐标 $i$ 上的点固定放大 $d_{i}$ 倍，
> >
> > 因而选择绝对值最大的 $d_{k}$，拉伸最大的 vector 一定是 $\left\lbrack {0\ldots 1\ldots 0} \right\rbrack$ where only the $k$-th coordinate is $1$，因为这个 ball 上所有的 vectors 原本的 norm 都是一样的，而这个 vector 完整地吃到了最大的拉伸程度，其他 vectors 都或多或少吃到了其他 $d_{i}$ 的拉伸效果。
>
> > **Proposition: **1-norm: reduced to max column sum****
> >
> > $\left\| A \right\|_{1} = \max_{1 \leq j \leq n}\left\| A_{\ast j} \right\|_{1}$
> >
> > **matrix 的 1-norm 实则就是 1-norm 最大列的 1-norm.**
>
> > **Proof**
> >
> > 因为
> >
> > $\left\| {Ax} \right\|_{1} = \left\| {\sum_{i}x_{j}a_{j}} \right\|_{1} \leq \sum_{j}\left| x_{j} \right|\left| a_{j} \right|_{1}$
> >
> > 并且 $\sum_{j}\left| x_{j} \right| = 1$，因而这个和 $\leq \max_{j}\left\| a_{j} \right\|_{1}$。
> >
> > 并且我们发现，这个值是可以取到的: suppose $\left\| a_{k} \right\|_{1}$ 最大，那么取 $e_{k}$ 就可以了。
> >
> > 直观而言，由于 1-norm 的单位球和它的 image 都是一个多面体，它取到最大的点一定是某个顶点。以这里的 $\mathbb{R}^{2}$ 为例，一定是 $e_{1}$, $e_{2}$ 中的一个。
>
> > **Proposition: **$\infty$-norm: reduced to max row sum****
> >
> > $\left\| A \right\|_{1} = \max_{1 \leq i \leq m}\left\| A_{i \ast} \right\|_{1}$
> >
> > **matrix 的 $\infty$-norm 实则就是 $1$-norm 最大行的 $1$-norm.**
>
> > **Proof**
> >
> > 直观上，image 的 sup norm 只取最大的那一个 entry，因而一定是取矩阵**总(absolute)长度最大的一列, 因为每一列都只贡献 image vector 中的一个 entry。**
> >
> > 并且，我们注意到，source vector (on单位球) 包括了**所有的最大 entry 为 $1$ 的 vectors**，这些 vectors 的 sup norm 都是一样的。而要使得 image vector 的 entries 尽可能大，我们一定会**取所有 entries 都为 1 的 vector 作为 input.**
> >
> > TODO (source `03-norms.tex`, line 89): selected TeX refers to `01-fundamentals.assets/image-20250130003611232.png`; the asset is not among the selected chapter sources.
> >
> > Note: sup norm 的单位球和它的 image 也都是一个多面体。

## Caychy-Swartz and Frobeniu norm

> **Theorem: Hölder inequility and Cachy-Swartz**
>
> Let $x,y \in \text{ℂ}^{m}$, let $p \geq 1,q \leq \infty$ s.t.
>
> $\frac{1}{p} + \frac{1}{q} = 1$
>
> **Holder ineq:**
>
> $\left| {x^{\ast}y} \right| \leq \left\| x \right\|_{p}\left\| y \right\|_{q}$
>
> **Cauchy-Schwarz ineq(special case of Hölder ineq when $p = q = 2$):**
>
> $\left| {x^{\ast}y} \right| \leq \left\| x \right\|_{2}\left\| y \right\|_{2}$

> **Remark**
>
> Holder' ineq 可以 generalize 到 $L_{p}$-measurable space, Cauchy-Swartz 可以推广到任何 Banach space. 此处不展开.

> **Proof**
>
> **of Cauchy-Swartz:**
>
> By homogenity of inner product and norm, it **suffices to prove for unit vector $u,v$.**
>
> $\left( {u - v} \right)^{2} = \left\| u \right\|^{2} - 2u^{\ast}v + \left\| v \right\|^{2}$
>
> 因而
>
> $u^{\ast}v \leq \frac{\left\| u \right\|^{2} + \left\| v \right\|^{2}}{2} = 1 = \left\| u \right\|\left\| v \right\|$
>
> 等号成立 iff $u = v$.

> **Example**
>
> Applying Cauchy-Swartz 可以发现: row vector 的 matrix 2-norm 等于它 (adjointed) 作为 vector 的 vector 2-norm.
>
> 这是因为 consider $a := A^{\ast}$, 则 $\left\| {Ax} \right\| = \left| {a^{\ast}x} \right| \leq \left\| a \right\|_{2}\left\| x \right\|_{2}$，因而总有 $\frac{\left\| {Ax} \right\|}{\left\| x \right\|_{2}} \leq \left\| a \right\|_{2}$。并且这个等号可以取到, by taking $x := a$.

> **Example**
>
> 任取两个 vectors $u,v$，它们 outer product 成的 rank-one matrix，其 operator 2-norm 小于等于它们自身的 2-norm 的乘积。
>
> $\left\| {Ax} \right\|_{2} = \left\| {uv^{\ast}x} \right\|_{2} = \left\| u \right\|_{2}\left| {v^{\ast}x} \right| \leq \left\| u \right\|_{2}\left\| v \right\|_{2}\left\| x \right\|_{2}$
>
> 这是因为: $uv^{\ast}$ 这一 outer product 乘以一个向量，即每行都是 $v^{\ast}$ 的一个倍数 ($u_{i}$ 倍) 的矩阵乘以这个向量。因而，每行得到的都是 $u_{i}$ 乘上 $v^{\ast}x$ 这个 inner product，最后得到的就是
>
> $Ax = \left( {v^{\ast}x} \right)u$
>
> 即 $u$ 的一个倍数，这个倍数等于 $v^{\ast}x$。

> **Example**
>
> > **Theorem**
> >
> > $\left\| {AB} \right\|_{l,n} \leq \left\| A \right\|_{l,m}\left\| B \right\|_{m,n}$
>
> (并且通常取不到等号.)
>
> > **Proof**
> >
> > 不证明了. Playing with definition 加上 Cauchy-Swartz.

> **Definition: Frobenious norm**
>
> $\left\| A \right\|_{F} := \left( {\sum_{m}\sum_{n}\left| a_{ij} \right|^{2}} \right)$
>
> 等于把这个 matrix 展开为 $m \times n$ 的 vector 的 vector 2-norm.

> **Theorem: equivalent form of Frobenius norm**
>
> $\left\| A \right\|_{F} = \sqrt{\text{tr}\left( {A^{\ast}A} \right)} = \sqrt{\text{tr}\left( {AA^{\ast}} \right)}$

> **Proof**
>
> trivial. $A^{\ast}A$, $AA^{\ast}$ 的 trace 上每个元素，都是 $A$ 的一行与自己的 dot product，即这一行作为 row vector 的 2-norm 的平方;

> **Proposition**
>
> $\left\| {AB} \right\|_{F}^{2} \leq \left\| A \right\|_{F}^{2}\left\| B \right\|_{F}^{2}$

> **Proof**
>
> 因为 $AB$ 的每个 entry $c_{ij}$ 作为 $A_{i}$ 和 $B_{j}$ 的 inner product, by Cauchy-Swartz, have
>
> $\left| c_{ij} \right| \leq \left\| A_{i} \right\|_{2}\left\| B_{i} \right\|_{2}$
>
> 因而：
>
> $\left\| {AB} \right\|_{F} \leq \sum_{n}\sum_{m}\left( {\left\| A_{i} \right\|_{2}\left\| B_{j} \right\|_{2}} \right)$
>
> $= \left( {\sum_{n}\left\| A_{i} \right\|_{2}} \right)\left( {\sum_{m}\left\| B_{j} \right\|_{2}} \right)$
>
> $= \left\| A \right\|_{F}\left\| B \right\|_{F}$
>
> (虽然这看起来很不对, 但容易验证, 这上下两个 sum 是相等的. )

> **Theorem: unitrary matrix preserves 2-norm 和 Frobenius norm**
>
> Let $Q$ be unitrary, then
>
> $\left\| {QA} \right\|_{2} = \left\| A \right\|_{2},\left\| {QA} \right\|_{F} = \left\| A \right\|_{F}$

> **Proof**
>
> 因为 $\left\| {Qx} \right\|_{2} = \left\| x \right\|_{2}$ for each $x$.
>
> Frobenius norm:
>
> $\text{tr}\left( {\left( {UA} \right)^{\ast}\left( {UA} \right)} \right) = \text{tr}\left( {A^{\ast}U^{\ast}UA} \right) = \text{tr}\left( {A^{\ast}A} \right)$

