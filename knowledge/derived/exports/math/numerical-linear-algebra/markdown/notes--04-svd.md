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
source: "notes/math/numerical-linear-algebra/chapters/04-svd.typ"
subtitle: Typst-first mathematics notes
title: Numerical Linear Algebra
---
# SVD

SVD 的 motivation：一个 linear transformation 可以通过 **unit sphere 的 image 来唯一确定**。并且，这个 **unit sphere 的 image 一定是一个 hyperellipse (高维椭圆)。**

> **Definition: principal semiaxes, singular value**
>
> 对于一个 linear transformation $T:\mathbb{R}^{n}\rightarrow\mathbb{R}^{m}$，我们 denote the unit sphere in $\mathbb{R}^{n}$ as $S$，把 $T(S)$ 这一 hyperellipse 中相互 orthogonal 的各轴上的 vectors 表示为 $\left\{ {\sigma_{1}u_{1},\ldots,\sigma_{n}u_{n}} \right\}$。其中 $\sigma_{i}$ decsending，$u_{1},\ldots,u_{n}$ 为 unit vectors。
>
> 我们称 $u_{1},\ldots,u_{n}$ 为 left singular vectors，$\sigma_{1},\ldots,\sigma_{n}$ 为 singular values，而 $\left\{ {v_{1},\ldots,v_{m}} \right\}$ 作为

## reduced SVD

