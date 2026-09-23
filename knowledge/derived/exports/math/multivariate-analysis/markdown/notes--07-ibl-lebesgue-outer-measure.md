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
source: "notes/math/multivariate-analysis/chapters/07-ibl-lebesgue-outer-measure.typ"
subtitle: Typst-first mathematics notes
title: Multivariate Analysis
---
# IBL: Lebesgue outer measure

> **Definition: Lebesgue outer measure**
>
> For $E \subseteq \mathbb{R}^{d}$, $m^{\ast}(E) = \inf_{E \subseteq \bigcup_{j = 1}^{\infty}B_{j}}\sum_{j = 1}^{\infty}\left| B_{j} \right|$, where the cover is by boxes. This replaces the finite covers in Jordan outer measure by countable covers.

> **Theorem: Basic outer-measure facts**
>
> $m^{\ast}(\varnothing) = 0$; if $E \subseteq F$, then $m^{\ast}(E) \leq m^{\ast}(F)$; and $m^{\ast}\left( {\bigcup_{n}E_{n}} \right) \leq \sum_{n = 1}^{\infty}m^{\ast}\left( E_{n} \right)$.

对 monotonicity，来源的中文批注是「trivial. 每个 $F$ 的覆盖也覆盖了 $E$」； 这正是 $E \subseteq F$ 时外测度不增的覆盖论证。

来源对 countable subadditivity 的中文证明思路是：为序列中每个集合创造一个 可数覆盖，得到一个 double union；再用 $\frac{\varepsilon}{2^{n}}$ 控制每个集合的覆盖和 与它的 Lebesgue outer measure 的差距，从而把双累加变成单累加。

The IBL problems record that a Jordan-measurable set can be outer-approximated by an elementary set; $m^{\ast}(E) \leq {\bar{m}}_{J{(E)}}$; the defining covers may be restricted to open or closed boxes; and every countable set has outer measure zero. The proof sketch preserves the source's $\frac{\varepsilon}{2^{n}}$ allocation for the countable cover.

> **Remark: 来源中文批注**
>
> Jordan measurable 的意义是可以 outer-approximate by elementary set。关于 closed/open boxes 的定义限制，来源指出 boundary 的 Jordan measure 为 $0$， 可以在每个 open box 内用误差小于 $\frac{\varepsilon}{2^{n}}$ 的 closed boxes 覆盖；dually 亦然。对于 countable set，只需对每个点给出体积小于对应 $\frac{\varepsilon}{2^{n}}$ 的 box 覆盖，因此其 Lebesgue outer measure 总是 $0$；这也 说明 Lebesgue measure 比 Jordan measure 更好。

> **Definition: Lebesgue measurability --- course definition**
>
> A set $E \subseteq \mathbb{R}^{d}$ is Lebesgue measurable if for each $\varepsilon > 0$ there is an open $U \supseteq E$ with $m^{\ast}\left( {UE} \right) \leq \varepsilon$. Its Lebesgue measure is $m(E) = m^{\ast}(E)$.

> **Theorem: elementary set 的 Lebesgue measure 就是 elementary measure**
>
> If $E$ is elementary, then $m^{\ast}(E) = m(E)$, where the right side is elementary measure.

来源中的证明记录为：$m^{\ast}(E) \leq m(E)$ 显然；反向不等式则对任意 ctbl covering 取一个 disjoint cover。后一步的具体推导在来源中未完成，故这里不补造。

> **Theorem: dist\>0 的集合外测度 union additive；ctbl 个 almost disjoint boxes**
>
> If $\text{dist}\left( {E,F} \right) > 0$, then $m^{\ast}\left( {E \cup F} \right) = m^{\ast}(E) + m^{\ast}(F)$. If $E$ is a countable union of almost-disjoint boxes $B_{k}$, then $m^{\ast}(E) = \sum_{k}\left| B_{k} \right|$.

关于从 finite 到 countable 的过渡，来源的中文提示为：「extend finite to countable by continuing the seq using empty sets 即可得到。」

## Lebesgue measure 的大小处于 Jordan outer/inner measure 之间

来源把这一节保留为由 elementary measure 与 outer measure 比较得出的结论， 并单独要求构造 non-Jordan-measurable 的 bounded open set，以及证明 ctbl 个 almost disjoint boxes 的 outer-measure union additivity。

> **Example: example：non J-measurable 的 open set**
>
> Enumerate the rationals in $\left\lbrack {0,1} \right\rbrack$ and cover the $n$th rational by an open interval whose lengths form a summable sequence. The union can have arbitrarily small outer measure but dense complement structure that prevents Jordan measurability, exactly as posed in the source.

来源的 personal solution 只写到「我们首先 list 出 $\left\lbrack {0,1} \right\rbrack$ 之间的 ratioals， 称为 $\left( q_{n} \right)$。我们对于每个......」便中断；这里保留其不完整状态，而不把后续构造 误标为来源解答。

