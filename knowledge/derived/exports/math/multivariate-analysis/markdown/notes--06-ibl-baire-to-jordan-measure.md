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
source: "notes/math/multivariate-analysis/chapters/06-ibl-baire-to-jordan-measure.typ"
subtitle: Typst-first mathematics notes
title: Multivariate Analysis
---
# IBL: Baire category through Jordan measure

## 1A：证明 metric space 是 topological space

> **Definition: Open balls and the metric topology**
>
> In a metric space $\left( {X,d} \right)$, $U \subseteq X$ is open when every $x \in U$ has an $\varepsilon > 0$ with $B_{\varepsilon{(x)}} \subseteq U$. A sequence converges in this topology exactly when it satisfies the metric epsilon definition.

The source's 1A problem has five parts: prove that these open sets form a topology; compare topological and metric convergence; prove open balls open; prove closed balls closed; and give the discrete-metric counterexample above.

> **Solution: 1A：闭球不一定是开球的 closure**
>
> 考虑 discrete topology。此时 $B_{r{(x)}}$ 可以等于 $\left\{ x \right\}$，而在距离发生跳跃的 半径处，closed ball 可能更大，因此它不必等于 open ball 的 closure。

> **Theorem: Baire category theorem**
>
> If $\left( {X,d} \right)$ is complete and $\left( U_{n} \right)_{n = 1}^{\infty}$ are open dense subsets of $X$, then $\bigcap_{n = 1}^{\infty}U_{n}$ is dense in $X$.

> **Solution: 1B：Baire Category Thm 在不 complete MS 中的反例**
>
> 考虑 $\mathbb{Q}$ 的 usual metric。令 $\left\{ q_{n} \right\}$ 枚举所有既约分数；对于任意 $n \in \mathbb{N}$，取 $U_{n} = \mathbb{Q}\{ q_{n}\}$。每个 $U_{n}$ 都是 $\mathbb{Q}$ 中 dense and open set， 但是 $\bigcap_{n}U_{n} = \varnothing$。

## 1C：证明 Baire Category Thm

原 worksheet 接着要求用 nested balls 证明：从任意 ball 出发，选择 $x_{i + 1}$ 与 $0 < r_{i + 1} < \frac{r_{i}}{2}$，使得 $\bar{B_{r_{i+1}}\left( x_{i+1} \right)} \subseteq B_{r_{i}}\left( x_{i} \right) \cap U_{i + 1}$; prove $\left( x_{i} \right)$ 是 Cauchy，并识别其 limit。1D 再要求推出：每点都是 limit point 的 nonempty complete metric space 必为 uncountable。

## Why not measure every subset?

> **Definition: Middle-thirds Cantor set**
>
> Begin with $C = \left\lbrack {0,1} \right\rbrack$ and remove the middle third at each stage. The set $C = \bigcap_{n = 1}^{\infty}C_{n}$ is the middle-thirds Cantor set; $C_{n}$ is a union of $2^{n}$ closed intervals, each of length $3^{- n}$.

The migrated problems ask to show that $C$ is nonempty and compact, every point is a limit point, $C$ is uncountable by Baire category, and $C$ contains no interval. Its stage-$n$ total length is $\left( \frac{2}{3} \right)^{n}$, motivating a notion of measure beyond intervals.

> **Remark: 来源中文批注**
>
> Cantor set 是一个 compact 且 closed 的集合（甚至 perfect）；由于它在 $\mathbb{R}^{n}$ 中，它还是 complete metric space。它 uncountable，却不包含任何 open interval；来源同时标注其 Lebesgue measure 为 $0$。

> **Definition: Vitali-type obstruction**
>
> On $\left\lbrack {0,1} \right)$ define $x \sim y$ when $x - y \in \mathbb{Q}$. Choose one representative from each equivalence class, forming $N$. For $r \in \mathbb{Q} \cap \left\lbrack {0,1} \right)$, let $N_{r}$ be the translate of $N$ by $r$, taken modulo one.

> **Theorem: No translation-invariant countably additive measure on every subset**
>
> The sets $N_{r}$ are disjoint and their union is $\left\lbrack {0,1} \right)$. If a function on all subsets were countably additive, invariant under rigid motions, and normalized by $m\left( \left\lbrack {0,1} \right) \right) = 1$, then all $N_{r}$ would have a common measure. It would be either zero or positive, forcing the union's measure to be either zero or infinity --- a contradiction.

> **Solution: 来源中的中文归谬说明**
>
> 我们想测量 $\mathbb{R}^{n}$ 子集的「长度」，希望它对可数个 disjoint sets closed under addition，对通过 translate、rotation 或 reflection 得到的 congruent sets 取相同 measure，并且精准满足 $m\left( \left\lbrack {0,1} \right) \right) = 1$。但是把 $\left\lbrack {0,1} \right)$ 中相差 rational 的点分成 congruent classes（所有 rational 都进入同一类；不同的 irrational roots 与 transcendental numbers 会形成各自的 classes），并把 $\left\lbrack {0,1} \right)$ 的 rationals 放入 $R$、在每一类取一点组成 $N$。任取 $r \in R$，对 $N$ 作 circular translate 得到 $N_{r}$；每个 $N_{r}$ 的 measure 相同，且它们的 disjoint union 是 $\left\lbrack {0,1} \right)$。$m(N) = 0$ 与 $m(N) \neq 0$ 都导致矛盾。

The source explicitly notes that merely replacing countable additivity by finite additivity does not solve this problem: Banach--Tarski supplies a finite-piece obstruction in three dimensions. The conclusion is to measure a proper family of subsets rather than every subset of $\mathbb{R}^{d}$.

## Elementary and pixel measure

> **Definition: Boxes, elementary sets, and elementary measure**
>
> An interval is any of $\left\lbrack {a,b} \right\rbrack$, $\left\lbrack {a,b} \right)$, $\left( {a,b} \right\rbrack$, or $\left( {a,b} \right)$, with length $b - a$. A box is a Cartesian product of intervals; its volume is the product of their lengths. An elementary set is a finite union of boxes. After writing it as a finite disjoint union $\bigcup_{i}B_{i}$, define $m(E) = \sum_{i}\left| B_{i} \right|$.

The source's problem sequence establishes closure of elementary sets under union, intersection, difference, symmetric difference, and translation; it then asks for a disjoint-box decomposition and well-definedness of $m$. A lattice-counting route is recorded: scale the number of lattice points in $B \cap \left( \frac{1}{N} \right)\mathbb{Z}^{d}$ by $N^{- d}$ and pass to the limit.

It then asks for finite additivity on disjoint elementary sets, monotonicity, and finite subadditivity for arbitrary finite collections. The pixel-measure exercise is deliberately retained as a counterexample prompt, since the source does not supply a completed personal answer.

> **Theorem: Elementary-measure properties**
>
> For elementary sets, elementary measure is finitely additive on disjoint unions, monotone, and finitely subadditive.

> **Remark**
>
> The exploratory "pixel measure" The pixel measure is the limit of $N^{- d}$ times the number of lattice points in $E \cap \left( \frac{1}{N} \right)\mathbb{Z}^{d}$. It is not translation invariant whenever both displayed limits exist; the source asks for an explicit example.

## Jordan measure and Riemann integrability

> **Definition: Jordan inner and outer measure**
>
> For bounded $E \subseteq \mathbb{R}^{d}$, ${\underset{¯}{m}}_{J{(E)}} = \sup_{A \subseteq E,A\ \text{elementary}}m(A)$ and ${\bar{m}}_{J{(E)}} = \inf_{B \supseteq E,B\ \text{elementary}}m(B)$. The set is Jordan measurable when these agree.

> **Theorem: Jordan measurability criteria**
>
> A bounded set is Jordan measurable exactly when it can be sandwiched between elementary sets $A \subseteq E \subseteq B$ with $m\left( {BA} \right)$ arbitrarily small; equivalently, it can be approximated in Jordan outer measure by an elementary set. Its boundary has Jordan outer measure zero exactly when it is Jordan measurable.

The retained problem set establishes that elementary sets are Jordan measurable, then asks for closure under union, intersection, difference, and symmetric difference, as well as finite additivity, monotonicity, finite subadditivity, and translation invariance. It asks to prove that the graph of a continuous function on a closed box has Jordan measure zero and that the region below such a graph is Jordan measurable.

The next chapter asks to prove that open and closed balls are Jordan measurable with measure $c_{d}r^{d}$, to bound $c_{d}$, and to compare a bounded set with its closure and interior. It gives the boundary criterion above. Finally it defines lower and upper Darboux integrals through a partition $a = x_{0} < x_{1} < \ldots < x_{n} = b$ and asks to show that a bounded nonnegative $f$ is Riemann integrable exactly when its subgraph is Jordan measurable.

