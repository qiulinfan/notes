---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: MATH 395
date: 2026
description: Selected personal MATH 395 homework transcriptions, retaining source-page traceability.
keywords:
- multivariate analysis
- homework
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/multivariate-analysis/homeworks/hw09.typ"
subtitle: Historical personal working notes
title: Multivariate Analysis Homeworks
---
# HW 9

## Problem A

Let $O_{n} = \{ x:\exists\delta > 0,\forall x_{1},x_{2} \in B_{\delta{(x)}},d\left( {f\left( x_{1} \right),f\left( x_{2} \right)} \right) < \frac{1}{n}\}$. The continuity set $C_{f}$ is the intersection of all $O_{n}$. If $f$ is continuous at $x_{0}$, choose a ball mapping into $B_{\frac{1}{2n}}\left( {f\left( x_{0} \right)} \right)$, and the triangle inequality gives $x_{0} \in O_{n}$. Conversely, choose $n$ with $\frac{1}{n} < \varepsilon$ and a ball supplied by $O_{n}$; then $f$ is continuous at $x_{0}$. Each $O_{n}$ is open: a witnessing ball at $x_{0}$ contains a smaller ball about every one of its points.

## Problem B

A bounded non-decreasing $f:\left\lbrack {a,b} \right\rbrack\rightarrow{\mathbb{R}}$ is Riemann integrable. For a rational $q$ between $m$ and $M$, let $D_{q} = \{ x:\lim_{t\rightarrow x -}f(t) \leq q \leq \lim_{t\rightarrow x +}f(t)\}$. Every discontinuity belongs to some $D_{q}$ by density of $\mathbb{Q}$. Each $D_{q}$ has at most one point, since $x_{1} < x_{2}$ in it would force values left/right incompatible with monotonicity. So the discontinuity set is countable and has measure zero.

## Problem C

For integrable $f,g:\left\lbrack {0,1} \right\rbrack\rightarrow{\mathbb{R}}$, $F\left( {x,y} \right) = f(x)g(y)$ is bounded. It is continuous at $\left( {x_{0},y_{0}} \right)$ whenever both factors are continuous at the corresponding coordinates; hence $D_{F} \subset \left( {D_{f} \times \left\lbrack {0,1} \right\rbrack} \right) \cup \left( {\left\lbrack {0,1} \right\rbrack \times D_{g}} \right)$. The product covers of measure-zero sets show $D_{F}$ has measure zero, so $F$ is integrable.

## Problem D

Define $f(x) = \frac{1}{q}$ if $x = \frac{p}{q} \in \left\lbrack {0,1} \right\rbrack$ in lowest terms and $0$ on irrationals. Given $\varepsilon > 0$, choose $N$ with $\frac{1}{N} < \frac{\varepsilon}{2}$, let $A_{N}$ be rationals with denominator at most $N$, and make a partition containing $A_{N}$ with mesh $< \frac{\varepsilon}{N^{2}}$. On subintervals missing $A_{N}$, the supremum is at most $\frac{1}{N}$; the other intervals have total length $< \frac{\varepsilon}{N^{2}}$. Thus $U\left( {f,P} \right) - L\left( {f,P} \right) < \varepsilon$. It is continuous at every irrational because its values along rationals with unbounded denominators tend to $0$; discontinuities are contained in the countable rationals.

## Problem E

If bounded $f:Q\rightarrow{\mathbb{R}}$ vanishes off a closed measure-zero $B$, cover $B$ by finitely many boxes of total volume $< \frac{\varepsilon}{2M}$ and choose a partition having these boxes as subboxes. On the remaining subboxes $f = 0$, so the difference of upper and lower sums is $< \varepsilon$. Hence $f$ is integrable.

## Problem F

For a countable closed-box cover $Q \subset \cup_{i}Q_{i}$, first enlarge to open boxes with volume increase $< \frac{\varepsilon}{2^{i}}$. Compactness gives a finite subcover. Successively subtract earlier boxes to make a disjoint measurable cover; additivity and monotonicity give $v(Q) \leq \sum_{i}v\left( Q_{i} \right) + \varepsilon$, and then let $\varepsilon\rightarrow 0$.

## Problem G

For $f:{\mathbb{R}}^{2}\rightarrow{\mathbb{R}}$, $f\left( {x_{0},y_{0}} \right) = 0$, $f_{y{({x_{0},y_{0}})}} \neq 0$, define $F\left( {x,y} \right) = \left( {x,f\left( {x,y} \right)} \right)$. Since $\det DF = f_{y} \neq 0$, IFT gives a local inverse $G = \left( {G_{1},G_{2}} \right)$ with $G_{1}$ the identity. Then $g(x) = G_{2}\left( {x,0} \right)$ is $C^{1}$ and $f\left( {x,g(x)} \right) = 0$.

## Bonus

For an open box $B = \prod_{i{({a_{i},b_{i}})}}$, choose smooth one-variable functions $\varphi_{i} > 0$ on $\left( {a_{i},b_{i}} \right)$ and zero outside; $\prod_{i}\varphi_{i{(x_{i})}}$ is smooth, positive on $B$, and zero outside. For an open $U$, use a countable ball cover and a locally finite smooth partition of unity $\varphi_{n}$ subordinate to it; $\sum_{n}\varphi_{n}$ is smooth, positive exactly on $U$. For Cantor $C$, apply this to the complement of $C^{2}$ in ${\mathbb{R}}^{2}$. Taking $h = 0$ on $C$ and $h > 0$ off $C$, the graphs of $y^{2}$ and $h(x)$ meet exactly at $C \times \{ 0\}$.

