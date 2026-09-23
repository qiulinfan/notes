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
source: "notes/math/multivariate-analysis/chapters/09-ibl-limits-and-carathéodory.typ"
subtitle: Typst-first mathematics notes
title: Multivariate Analysis
---
# IBL: limits and Carathéodory's criterion

> **Theorem: Jordan measurable implies Lebesgue measurable**
>
> Every Jordan measurable subset of $\mathbb{R}^{n}$ is Lebesgue measurable. The source points to the zero-boundary characterization as the route to the proof.

> **Theorem: Continuity from below**
>
> For measurable $E_{1} \subseteq E_{2} \subseteq \ldots$, $m\left( {\bigcup_{k = 1}^{\infty}E_{k}} \right) = \lim_{k\rightarrow\infty}m\left( E_{k} \right)$.

The source suggests taking the disjoint increments $F_{k} = E_{k}\bigcup_{i = 1}^{k - 1}E_{i}$ and applying countable additivity.

> **Theorem: Continuity from above**
>
> For measurable $E_{1} \supseteq E_{2} \supseteq \ldots$, if some $E_{k}$ has finite measure, then $m\left( {\bigcap_{k = 1}^{\infty}E_{k}} \right) = \lim_{k\rightarrow\infty}m\left( E_{k} \right)$.

> **Remark**
>
> The finite-measure assumption in continuity from above is necessary; the source asks for a counterexample when it is dropped.

> **Theorem: Finite-measure approximation by elementary sets**
>
> A finite-measure set $E \subseteq \mathbb{R}^{n}$ is measurable exactly when it differs from an elementary set by a set of arbitrarily small outer measure.

> **Theorem: Carathéodory's criterion --- elementary test sets**
>
> A set $E \subseteq \mathbb{R}^{n}$ is measurable if and only if for every elementary set $A$, $m(A) = m^{\ast}\left( {A \cap E} \right) + m^{\ast}\left( {AE} \right)$.

The source remarks that some texts use this elementary-test identity as the definition of measurability. Its final linear-map problem asks for the precise Jacobian factor $\left| {\det T} \right|$, including singular linear maps.

> **Theorem: Linear change of measure**
>
> If $E \subseteq \mathbb{R}^{n}$ is measurable and $T:\mathbb{R}^{n}\rightarrow\mathbb{R}^{n}$ is linear, then $T(E)$ is measurable and $m\left( {T(E)} \right) = \left| {\det T} \right|m(E)$.
