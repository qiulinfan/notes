---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: MATH 395
date: 2026
description: Multivariate Analysis notes migrated from the explicitly selected personal historical sources.
keywords:
- Multivariate Analysis
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/multivariate-analysis/chapters/08-ibl-measurability-regularity-and-additivity.typ"
subtitle: Typst-first mathematics notes
title: Multivariate Analysis
---
# IBL: regularity, measurability, and additivity

> **Theorem: $\mathbb{R}^{n}$ 中任意开集都是一个 ctbl union of almost disjoint boxes**
>
> Every open subset of $\mathbb{R}^{d}$ is a countable union of almost-disjoint boxes; the source gives a dyadic construction selecting boxes not already chosen at earlier scales.

The source's construction starts with unit grid boxes contained in an open set, then repeats at dyadic scales after removing boxes selected earlier. It asks to verify that their union is the original open set and that interiors do not overlap.

来源的中文批注说，这与在 $\mathbb{R}$ 上用 ctbl closed intervals 逼近任意 open interval 如出一辙；随后给出的 process 只是更 generalized 的算法。

> **Theorem: Outer regularity**
>
> For every $E \subseteq \mathbb{R}^{d}$, $m^{\ast}(E) = \inf_{E \subseteq U,U\ \text{open}}m^{\ast}(U)$.

> **Remark**
>
> The reverse inner approximation by open subsets is false in general; the source asks for a counterexample and foreshadows compact inner regularity.

## outer regularity 的 dual 并不正确

来源要求给出反例，说明不能用 contained open sets 的 outer measure supremum 来代替 outer regularity；正确的 inner regularity 要以 compact sets 逼近。

## Closure properties of measurable sets

> **Theorem: Null sets are measurable**
>
> Every set of outer measure zero is Lebesgue measurable.

> **Theorem: Countable unions, complements, and intersections**
>
> A countable union of Lebesgue measurable sets is measurable. Complements of measurable sets are measurable, and hence countable intersections are measurable.

来源的中文证明提示为：$\mathbb{N}^{2}$ 也是 ctbl 的。对每个 $E_{n}$ 都选取一个 open cover，最后的 double union 仍是 countable open cover；取任意 $\varepsilon$， 再用 $\frac{\varepsilon}{2^{n}}$ bound 每个 $E_{n}$ 与其 cover 的差距即可。

> **Theorem: Closed sets are measurable**
>
> Every closed subset of $\mathbb{R}^{d}$ is Lebesgue measurable. The recorded approach reduces to compact pieces and uses the almost-disjoint-box decomposition of an open complement.

The recorded proof plan writes an unbounded closed set as a countable union of closed bounded pieces, reduces to compact sets, and decomposes their open complements into almost-disjoint closed cubes.

## Approximation and regularity

> **Definition: Symmetric difference**
>
> $A \bigtriangleup B = \left( {AB} \right) \cup \left( {BA} \right)$. The source notes $A \bigtriangleup B \subseteq \left( {A \bigtriangleup C} \right) \cup \left( {C \bigtriangleup B} \right)$.

> **Remark: 来源中文批注**
>
> sym diff 越加入更多 set 越大；这正是 $A \bigtriangleup B \subseteq \left( {A \bigtriangleup C} \right) \cup \left( {C \bigtriangleup B} \right)$ 的直观来源。

> **Theorem: Approximation by open sets**
>
> $E$ is measurable if and only if for every $\varepsilon > 0$ there is an open $U$ with $m^{\ast}\left( {E \bigtriangleup U} \right) \leq \varepsilon$.

For the difficult direction, the IBL notes choose open $U_{n}$ with errors $\frac{\varepsilon}{2^{n + 67}}$, take their union, then cover the remaining null set by an open set of small outer measure. This preserves the original proof strategy without inventing its omitted final estimates.

来源的中文说明强调：和 9D 一样，当希望两个相近集合具有包含关系、但已知条件 又不能直接构造包含关系时，可以先用近似条件构造 measure 无限接近的序列，再经由 intersection 得到一个 measure $0$ set，最后通过交、并、补得到所需关系。它还 指出 ordinary set diff 的 measure 总小于等于 sym diff 的大小，以此估计 $m^{\ast}\left( {U \smallsetminus E} \right)$。

> **Theorem: Inner regularity**
>
> If $E$ is measurable, then $m^{\ast}(E) = \sup_{K}m^{\ast}(K)$ as $K$ ranges over compact subsets of $E$. The source also records the equivalent approximation by closed sets in symmetric difference.

> **Theorem: Countable additivity**
>
> For pairwise disjoint Lebesgue measurable sets $\left( E_{n} \right)$, $m\left( {\bigcup_{n = 1}^{\infty}E_{n}} \right) = \sum_{n = 1}^{\infty}m\left( E_{n} \right)$.

The explicit $\frac{\varepsilon}{2^{n}}$ exercise is retained: with $a_{n,m} = \frac{1}{nm}$, one must not interchange an infimum and an infinite sum without a valid argument.

