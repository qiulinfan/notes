---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
date: 2024
description: Mainly intended to serve the convenience of Analysis.
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/advanced-linear-algebra/chapters/01-review-on-basic-concepts.typ"
subtitle: Taken from LADR and GTM 135
title: Some Linear Algebra
---
# Review on Basic Concepts

## Subspace and direct sum

> **Definition: subsapce**
>
> vector space 的 subset $U \subset V$ 为一个 subspace，if 它满足条件：
>
> 1.  包含 0
> 2.  对 addition 和 scalar multiplication 闭合

两个 subset 的和就是各取一个元素相加的所有情况.\
很显然我们知道：

> **Proposition**
>
> 两个 subspace $U_{1},U_{2}$ 的 sum $U_{1} + U_{2}$ 也是一个 subspace, 并且
>
> $$
> \dim\left( {U_{1} + U_{2}} \right) \leq \dim\left( U_{1} \right) + \dim\left( U_{2} \right)
> $$
>
> 且 $U_{1} + U_{2}$ 是同时包含 $U_{1}$ 和 $U_{2}$ 的 $V$ 的最小 subspace.

显然可以随便和。同一个 $U$ 自己和自己的和就是自己。所以 subspace sum 这个概念比较大，没什么用。我们需要用 direct sum 来作为一个小一点但是更有用的概念，表达出一种垂直的 subspace 的直观.

> **Definition: direct sum**
>
> 如果 $U_{1} + U_{2} + \ldots + U_{m}$ 中的任意元素 $v$，都存在唯一的 $v_{k} \in U_{k}$ for each $k$ 使得 $v = \sum_{k}v_{k}$，就称 $U_{1} + \ldots + U_{m} = \oplus_{i = 1}^{m}U_{i}$ 为一个 direct sum.

我们显然发现：

> **Proposition**
>
> $$
> \dim\left( {\oplus_{i = 1}^{m}U_{i}} \right) = \sum\limits_{i = 1}^{m}\dim\left( U_{i} \right)
> $$

我们发现，其实可以 direct sum 的 subspaces 是 "垂直的"，意思是:

> **Theorem**
>
> $U_{1} + U_{2} + \ldots + U_{m}$ 是一个 direct sum (这几个空间"垂直") iff 任取 $u_{1},u_{2},\ldots,u_{m}$ 分别来自 $U_{1},U_{2},\ldots,U_{m}$，它们都 lin. ind.

并且：

> **Theorem**
>
> $U_{1} + U_{2}$ 为一个 direct sum iff $U_{1} \cap U_{2} = \left\{ 0 \right\}$.

> **Remark**
>
> 实际上两个 subspace 的交集里只要有一个非 0 点，那么这个点 span 的整个 dim 为 1 的线都在交集里.

> **Note**
>
> $\text{F}^{n} = \oplus_{i = 1}^{n}\text{span}\left( e_{i} \right)$

