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
source: "notes/math/multivariate-analysis/chapters/04-partitions-and-lebesgue-characterization.typ"
subtitle: Typst-first mathematics notes
title: Multivariate Analysis
---
# Partitions and Lebesgue's characterization

## Partitions and Darboux sums

> **Definition: Box, partition, mesh**
>
> A box in $\mathbb{R}^{n}$ is $B = I_{1} \times \cdots \times I_{n}$, where the $I_{i}$ are intervals; here the notes use closed intervals, $B = \left\lbrack {a_{1},b_{1}} \right\rbrack \times \cdots \times \left\lbrack {a_{n},b_{n}} \right\rbrack$, with $v(B) = \prod_{i{({b_{i} - a_{i}})}}$. A partition of $\left\lbrack {a,b} \right\rbrack$ is a finite increasing sequence $a = x_{0} < x_{1} < \cdots < x_{k} = b$, with mesh $\left\| P \right\| = \max_{i{({x_{i} - x_{i - 1}})}}$.
>
> A partition $P = \left( {P_{1},\ldots,P_{n}} \right)$ of a box is an $n$-tuple of coordinate partitions. It decomposes $B$ into boxes $J_{1} \times \cdots \times J_{n}$ with pairwise disjoint interiors and mesh $\left\| P \right\| = \max_{1 \leq j \leq n}\left\| P_{j} \right\|$.

> **Definition: Lower and upper sums**
>
> Let $f:B\rightarrow\mathbb{R}$ be bounded and let the subboxes of $P$ be $B_{1},\ldots,B_{N}$. Set $m_{B_{i}}(f) = \inf_{B_{i}}f$ and $M_{B_{i}}(f) = \sup_{B_{i}}f$. The lower and upper sums are $L\left( {f,P} \right) = \sum_{i}m_{B_{i}}(f)v\left( B_{i} \right)$ and $U\left( {f,P} \right) = \sum_{i}M_{B_{i}}(f)v\left( B_{i} \right)$.

> **Definition: Refinement**
>
> A partition $Q$ is a refinement of $P$ if $P_{j} \subseteq Q_{j}$ for every coordinate. The common refinement of $P,P'$ is obtained by taking the union of the coordinate partition points.

> **Lemma: Monotonicity under refinement**
>
> If $Q$ refines $P$, then $L\left( {f,P} \right) \leq L\left( {f,Q} \right)$ and $U\left( {f,P} \right) \geq U\left( {f,Q} \right)$. Therefore for arbitrary partitions $P,P'$, $L\left( {f,P} \right) \leq U\left( {f,P'} \right)$.

> **Proof**
>
> It is enough to add one point to one coordinate partition. Each affected subbox splits into two smaller boxes, whose infima are at least the old infimum and whose volumes add to the old volume. Apply the same fact to $- f$ for upper sums, and use a common refinement.

> **Definition: Lower/upper integrals and Riemann integrability**
>
> Define $\int_{B}f\, dx = \sup_{P}L\left( {f,P} \right)$ and $\int_{B}\, f\, dx = \inf_{P}U\left( {f,P} \right)$. The function $f$ is Riemann integrable if these values agree; then their common value is written $\int_{B}f\, dx$.

> **Theorem: Riemann condition**
>
> A bounded $f:B\rightarrow\mathbb{R}$ is Riemann integrable iff, for every $\varepsilon > 0$, there is a partition $P$ with $U\left( {f,P} \right) - L\left( {f,P} \right) < \varepsilon$.

> **Proof**
>
> If the lower and upper integrals agree, choose $P_{1},P_{2}$ whose lower and upper sums are each within $\frac{\varepsilon}{2}$ of that number, and take a common refinement. The converse follows from $L\left( {f,P} \right) \leq \int_{B}f\, dx \leq \int_{B}\, f\, dx \leq U\left( {f,P} \right)$.

> **Example: A nonintegrable function**
>
> On $\left\lbrack {0,1} \right\rbrack^{2}$, take $f\left( {x,y} \right) = 0$ when $x,y$ are rationally dependent and $1$ otherwise. Every subbox meets both types of points, so every lower sum is $0$ and every upper sum is $1$. Hence $f$ is not Riemann integrable.

> **Lemma: Vector-space property**
>
> If $f,g \in R(B)$, then $f + g \in R(B)$. Consequently $R(B)$ is a vector space; all constant functions belong to it.

> **Proof**
>
> For each subbox $S$, $\inf_{S}f + \inf_{S}g \leq \inf_{S{({f + g})}}$ and $\sup_{S{({f + g})}} \leq \sup_{S}f + \sup_{S}g$. Choose partitions making the two Darboux gaps small and take their common refinement.

## The review sheet

> **Remark: Midterm review**
>
> The four-page review re-records the earlier core facts: boundedness, total boundedness, completeness, compactness, and sequential compactness satisfy $\text{sequentially compact}\Leftrightarrow\text{compact}\Leftrightarrow\text{complete and totally bounded}$ in metric spaces; in $\mathbb{R}^{n}$, compactness is equivalent to closed and bounded. It also restates differentiability, directional derivatives, the Jacobian, the $C^{1}$ criterion, mixed partials, multi-index notation, the chain rule, product rule, Taylor theorem, inverse function theorem, and implicit function theorem. For a linear map $\left( {x,y} \right)\mapsto Ax + By$, the implicit solution is $y = - B^{- 1}Ax$ when $B$ is invertible.

## Measure zero and the Lebesgue criterion

> **Definition: Measure zero**
>
> A set $A \subseteq \mathbb{R}^{n}$ has (Lebesgue) measure zero if, for every $\varepsilon > 0$, it can be covered by countably many boxes $B_{i}$ with $\sum_{i = 1}^{\infty}v\left( B_{i} \right) < \varepsilon$. It does not matter whether the covering boxes are open or closed; a countable union of measure-zero sets has measure zero.

> **Definition: Oscillation**
>
> For bounded $f:B\rightarrow\mathbb{R}$, put $\text{osc}_{\delta}f(x) = \sup_{x_{1},x_{2} \in B \cap B_{\delta{(x)}}}\left( {f\left( x_{1} \right) - f\left( x_{2} \right)} \right)$ and $\text{osc}\ f(x) = \inf_{\delta > 0}\text{osc}_{\delta}f(x)$. Then $f$ is continuous at $x$ iff $\text{osc}\ f(x) = 0$.

> **Remark**
>
> The notes ask one to verify $\text{osc}_{\delta}f(x) = \sup_{B \cap B_{\delta{(x)}}}f - \inf_{B \cap B_{\delta{(x)}}}f$ and that $\delta_{1} < \delta_{2}$ implies $\text{osc}_{\delta_{1}}f(x) \leq \text{osc}_{\delta_{2}}f(x)$. For the Dirichlet function ($1$ on rationals and $0$ on irrationals), the oscillation is $1$ everywhere.

> **Theorem: Lebesgue characterization of Riemann integrability**
>
> Let $B \subseteq \mathbb{R}^{n}$ be a box and $f:B\rightarrow\mathbb{R}$ be bounded. Let $D_{f} = \left\{ x\  \middle| \ f\ \text{is not continuous at}\ x \right\}$. Then $f$ is Riemann integrable iff $D_{f}$ has measure zero.

> **Proof**
>
> First suppose $D_{f}$ has measure zero. Let $|f| \leq M$ and cover $D_{f}$ by finitely many open boxes $B_{i}$ whose total volume is less than $\frac{\varepsilon}{4M}$. For each point outside their union, continuity supplies an open box on which the oscillation is less than $\frac{\varepsilon}{2v(B)}$. Compactness of $B$ gives a finite cover. Choose a partition whose subboxes lie in a chosen member of this finite cover. The boxes inside the first family contribute at most $2M\frac{\varepsilon}{4M}$ to the Darboux gap; the rest contribute at most $\frac{\varepsilon}{2}$. Hence the gap is below $\varepsilon$.
>
> Conversely define $D_{m} = \left\{ x \in B\  \middle| \ \text{osc}\ f(x) \geq \frac{1}{m} \right\}$. If a partition $P$ has $U\left( {f,P} \right) - L\left( {f,P} \right) < \frac{\varepsilon}{2m}$, then the subboxes of $P$ meeting $D_{m}$ in their interiors have total volume below $\frac{\varepsilon}{2}$, because each has oscillation at least $\frac{1}{m}$. The union of the subbox boundaries has measure zero and can be covered with total volume below $\frac{\varepsilon}{2}$. Thus $D_{m}$ has measure zero. Since $D_{f} = \cup_{m = 1}^{\infty}D_{m}$, so does $D_{f}$.

> **Example: Two familiar discontinuity sets**
>
> The Dirichlet function on $\left\lbrack {0,1} \right\rbrack$ has $D_{f} = \left\lbrack {0,1} \right\rbrack$ and is not integrable. The function that is $1$ on rational points whose fraction is in lowest terms and has bounded denominator, and $0$ elsewhere, has a countable discontinuity set and is Riemann integrable.

> **Theorem: Almost-everywhere zero and Fubini**
>
> If $f:B\rightarrow\mathbb{R}$ is Riemann integrable and $f = 0$ almost everywhere, then $\int_{B}f = 0$. If $f \geq 0$ and $\int_{B}f = 0$, then $f = 0$ almost everywhere. For boxes $A \subseteq \mathbb{R}^{k}$, $B \subseteq \mathbb{R}^{\ell}$, an integrable $f:A \times B\rightarrow\mathbb{R}$ satisfies Fubini's theorem: $\int_{A \times B}f = \int_{A}\left( {\int_{B}f\left( {x,y} \right)\, dy} \right)\, dx$.

> **Remark**
>
> Under Fubini's hypotheses, the inner integral exists almost everywhere; if it exists for every $x$, the iterated integral is defined everywhere. The review example with a vertical rational/irrational slice shows why almost everywhere'' is necessary.

