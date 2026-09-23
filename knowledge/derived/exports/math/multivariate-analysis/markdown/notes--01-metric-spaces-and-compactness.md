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
source: "notes/math/multivariate-analysis/chapters/01-metric-spaces-and-compactness.typ"
subtitle: Typst-first mathematics notes
title: Multivariate Analysis
---
# Metric spaces and compactness

## Metric spaces, norms, and topology

> **Definition: Metric space**
>
> A metric on a set $X$ is a function $d:X \times X\rightarrow\mathbb{R}$ satisfying, for all $x,y,z \in X$: $d\left( {x,y} \right) = d\left( {y,x} \right)$ (symmetry), $d\left( {x,y} \right) \geq 0$ and $d\left( {x,y} \right) = 0$ iff $x = y$ (positivity), and $d\left( {x,y} \right) \leq d\left( {x,z} \right) + d\left( {z,y} \right)$ (triangle inequality). The pair $\left( {X,d} \right)$ is called a metric space.

> **Example: Metrics recorded in the lecture**
>
> On $\mathbb{R}$, $d\left( {x,y} \right) = \left| {x - y} \right|$, and also $d\left( {x,y} \right) = \left| {\int_{x}^{y}e^{- t}\, dt} \right|$. On $\mathbb{R}^{n}$ the notes use $d_{2}\left( {x,y} \right) = \sqrt{\sum_{i = 1}^{n}\left( {x_{i} - y_{i}} \right)^{2}}$, $d_{\sup}\left( {x,y} \right) = \max_{1 \leq i \leq n}\left| {x_{i} - y_{i}} \right|$, and $d_{1}\left( {x,y} \right) = \sum_{i = 1}^{n}\left| {x_{i} - y_{i}} \right|$. In $\mathbb{R}^{2}$, their unit balls are the circle, square, and diamond, labelled $\ell^{2}$ (Euclidean), supremum, and $\ell^{1}$ metrics.
>
> For $C\left( \left\lbrack {0,1} \right\rbrack \right)$, the lecture also writes $d\left( {f,g} \right) = \sup_{t \in {\lbrack{0,1}\rbrack}}\left| {f(t) - g(t)} \right|$ and $d\left( {f,g} \right) = \int_{0}^{1}\left| {f(t) - g(t)} \right|\, dt$.

> **Definition: Neighborhoods, open and closed sets**
>
> In a metric space $\left( {X,d} \right)$, the $\varepsilon$-neighborhood of $x_{0}$ is $B_{\varepsilon{(x_{0})}} = \left\{ x \in X\  \middle| \ d\left( {x,x_{0}} \right) < \varepsilon \right\}$. A set $\Omega \subseteq X$ is open when every $x_{0} \in \Omega$ has an $\varepsilon > 0$ with $B_{\varepsilon{(x_{0})}} \subseteq \Omega$. A set $C \subseteq X$ is closed iff $X\backslash C$ is open.

> **Lemma: Equivalent Euclidean and supremum topologies**
>
> A set $\Omega \subseteq \mathbb{R}^{n}$ is open for the Euclidean metric iff it is open for the supremum metric.

> **Proof**
>
> The norm comparison written in the notes is $\left\| x \right\|_{\sup} \leq \left\| x \right\|_{2} \leq \sqrt{n}\left\| x \right\|_{\sup}$. Hence $B_{\varepsilon}^{\sup{(x_{0})}} \subseteq B_{\varepsilon}^{2}\left( x_{0} \right) \subseteq B_{\frac{\varepsilon}{\sqrt{n}}}^{\sup{(x_{0})}}$, which transfers the ball criterion for openness in both directions.

> **Definition: Limit point and closure**
>
> If $E \subseteq X$, a point $p \in X$ is a limit point of $E$ when $B_{\varepsilon{(p)}} \cap \left( {E\backslash\left\{ p \right\}} \right) \neq \varnothing$ for every $\varepsilon > 0$. The closure is $\bar{E} = E \cup E'$. Thus $E = \left( {0,1} \right)$ has $\bar{E} = E' = \left\lbrack {0,1} \right\rbrack$, while $E = \left( {0,1} \right) \cup \left\{ 2 \right\}$ has $E' = \left\lbrack {0,1} \right\rbrack$ and $\bar{E} = \left\lbrack {0,1} \right\rbrack \cup \left\{ 2 \right\}$.

> **Lemma: Closure facts**
>
> For $E \subseteq X$, the set $\bar{E}$ is closed; $E = \bar{E}$ iff $E$ is closed; and if $E \subseteq F$ with $F$ closed, then $\bar{E} \subseteq F$. Thus the closure is the smallest closed set containing $E$.

> **Proof**
>
> If $q \notin \bar{E}$, then some $B_{\varepsilon{(q)}}$ misses $E$; consequently $X\backslash\bar{E}$ is open. If $E$ is closed, every point outside $E$ has such a ball, hence $E' \subseteq E$. Conversely, $E = \bar{E}$ is closed. The final assertion follows because a point of $F^{c}$ has a ball disjoint from $E$.

> **Lemma: Supremum in the closure**
>
> If $E \subseteq \mathbb{R}$ is nonempty and bounded above, then $\sup E \in \bar{E}$. In particular, if $E$ is closed, $\sup E \in E$; similarly a closed bounded-below set contains its infimum.

## Compactness in $\mathbb{R}^{n}$

> **Definition: Open cover and compactness**
>
> An open cover of $E \subseteq X$ is a family $\left\{ U_{\alpha} \right\}_{\alpha} \in I$ of open sets such that $E \subseteq \cup_{\alpha \in I}U_{\alpha}$. The set $E$ is compact if every open cover has a finite subcover. A set is bounded when it lies in some $B_{r{(x_{0})}}$.

> **Theorem: Elementary compactness consequences**
>
> Closed subsets of compact metric spaces are compact. A compact subset of a metric space is closed and bounded. A family of compact sets with every finite intersection nonempty has nonempty total intersection.

> **Proof**
>
> For the closed-subset result, adjoin $C^{c}$ to an open cover of a closed $C \subseteq K$ and discard it after taking a finite subcover of $K$. For closedness of a compact $K$, cover $K$ by the sets $\left\{ q\  \middle| \ d\left( {p,q} \right) > \frac{1}{n} \right\}_{n}$ for a fixed $p \notin K$; a finite subcover yields a ball about $p$ disjoint from $K$. For boundedness use the cover $\left\{ B_{n{(p)}} \right\}_{n \in \ \mathbb{N}}$. The finite-intersection assertion follows by applying compactness to the complementary open cover.

> **Theorem: Nested interval and box properties**
>
> If $I_{1} \supseteq I_{2} \supseteq \cdots$ is a nested sequence of closed, nonempty bounded intervals, then $\cap_{n}I_{n} \neq \varnothing$. Hence a nested sequence of closed boxes $B_{n} \subseteq \mathbb{R}^{d}$ has nonempty intersection.

> **Proof**
>
> Write $I_{n} = \left\lbrack {a_{n},b_{n}} \right\rbrack$. The increasing bounded sequence $\left( a_{n} \right)$ has a supremum $x$; then $a_{n} \leq x \leq b_{n}$ for every $n$. Apply this coordinatewise to $B_{n} = \left\lbrack {a_{1}^{n},b_{1}^{n}} \right\rbrack \times \cdots \times \left\lbrack {a_{d}^{n},b_{d}^{n}} \right\rbrack$.

> **Theorem: Closed boxes are compact**
>
> Every closed box in $\mathbb{R}^{n}$ is compact.

> **Proof**
>
> Suppose an open cover of a closed box $B_{0}$ has no finite subcover. Divide it into $2^{d}$ equal subboxes and choose one without a finite subcover; recursively obtain nested boxes $B_{n}$. The nested-box property gives a point $x \in \cap_{n}B_{n}$. Any cover member containing $x$ contains a small ball about $x$; for large $n$, $B_{n}$ lies in that ball, a contradiction.

> **Theorem: Heine-Borel**
>
> A subset of $\mathbb{R}^{d}$ is compact iff it is closed and bounded.

> **Proof**
>
> The forward implication was established above. If $E$ is closed and bounded, it lies in a closed box, which is compact; therefore $E$ is compact as a closed subset of a compact set.

> **Example: Why the Euclidean conclusion is special**
>
> Let $\ell^{\infty{(\mathbb{N})}}$ be the space of bounded sequences with the supremum metric and let $B = \left\{ a \in \ell^{\infty}\  \middle| \ d\left( {a,0} \right) \leq 1 \right\}$. The notes ask one to verify that $B$ is closed and bounded, and emphasize that it is **not** compact. Thus closed and bounded'' is not the general metric-space criterion.

## General metric spaces

> **Definition: Total boundedness and completeness**
>
> A subset $E$ of a metric space is totally bounded if for every $\varepsilon > 0$ there are $x_{1},\ldots,x_{N} \in E$ with $E \subseteq \cup_{i = 1}^{N}B_{\varepsilon{(x_{i})}}$. A set is complete if every Cauchy sequence in it converges to a point of it. It is sequentially compact if every sequence has a subsequence converging in the set.

> **Theorem: Metric compactness criteria**
>
> For $E \subseteq X$ in a metric space, the following are equivalent: $E$ is compact; $E$ is sequentially compact; $E$ is complete and totally bounded.

> **Proof**
>
> Sequential compactness implies total boundedness: otherwise choose points $p_{n}$ separated by a fixed $\varepsilon$, producing a sequence with no Cauchy, hence no convergent, subsequence. It also implies completeness because a convergent subsequence of a Cauchy sequence forces the entire sequence to converge to the same limit.
>
> Conversely, total boundedness lets one choose successively infinitely many terms of a given sequence in nested balls of radii $2^{-}k$; the selected subsequence is Cauchy and therefore converges by completeness.
>
> For the passage from sequential compactness to compactness, the notes prove the Lebesgue covering lemma: for every open cover of a sequentially compact set there is an $\varepsilon > 0$ such that each $p$ has $B_{\varepsilon{(p)}}$ contained in a cover member. If not, choose points $p_{n}$ for which no $B_{\frac{1}{n}}\left( p_{n} \right)$ fits; a convergent subsequence contradicts openness at its limit. A finite $\varepsilon$-ball cover then selects a finite subcover.

