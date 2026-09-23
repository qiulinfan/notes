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
source: "notes/math/multivariate-analysis/homeworks/hw02.typ"
subtitle: Historical personal working notes
title: Multivariate Analysis Homeworks
---
# HW 2

## Problem A

If $\| \cdot \|$ is a norm on a vector space $V$, then $d\left( {x,y} \right) = \| x - y\|$ is a metric. For $x,y,z \in V$, positivity gives $\| x - y\| \geq 0$, with equality iff $x = y$; homogeneity gives $\| y - x\| = \| - \left( {x - y} \right)\| = \| x - y\|$; and

$\| x - y\| = \|\left( {x - z} \right) + \left( {z - y} \right)\| \leq \| x - z\| + \| z - y\|.$

Thus a norm induces a metric.

## Problem B

For a linear $T:V_{1}\rightarrow V_{2}$, the operator norm is $\| T\| = \sup_{v \neq 0}\| Tv\frac{\|_{2}}{\|}v\|_{1} = \sup_{\| v\|_{1} = 1}\| Tv\|_{2}$. If $\| T\| = C < \infty$, then $\| Tv - Tw\|_{2} = \| T\left( {v - w} \right)\|_{2} \leq C\| v - w\|_{1}$, so $\delta = \frac{\varepsilon}{C}$ proves continuity. Conversely, continuity at $0$ gives $\delta > 0$ such that $\| Tv\|_{2} < 1$ for $\| v\|_{1} < \delta$. Applying this to $\left( \frac{\delta}{2} \right)w$ with $\| w\|_{1} = 1$ gives $\| Tw\|_{2} < \frac{2}{\delta}$. Hence $T$ is bounded.

## Problem C

An unbounded linear map is the derivative $T:C\left\lbrack {0,1} \right\rbrack\rightarrow{\mathbb{R}}$, with the sup norm on the domain. For $f_{n{(x)}} = \frac{\sin\left( {nx} \right)}{n}$, $\| f_{n}\|_{\infty} \leq \frac{1}{n}$, while $\| Tf_{n}\| = \|\cos\left( {nx} \right)\|_{\infty} = 1$. Therefore the ratios are at least $n$.

## Problem D

Take $T_{i} = \left( {\left( {1,i} \right),\left( {0,1} \right)} \right)$. Every $T_{i}$ is diagonalizable with eigenvalues $1,1$. For $v_{i} = \left( {1,i} \right)^{T}$, $\| T_{i}v_{i}\frac{\|_{2}}{\|}v_{i}\|_{2} = \frac{\sqrt{1 + 2i^{2}}}{\sqrt{1 + i^{2}}} > i$, so $\| T_{i}\|\rightarrow\infty$ although the eigenvalues are bounded.

## Problem E

If $S$ is totally bounded, for every $n$ choose a finite $\frac{1}{n}$-cover with centres $x_{i}^{n}$. The union of the centres is countable and dense: every $x \in S$ either occurs among them or is the limit of selected centres at distance $< \frac{1}{n}$. Hence $S$ is separable.

## Problem F

Let $X$ be countably many copies of $\left\lbrack {0,1} \right\rbrack$ with their left endpoints glued. Write points as $\left\lbrack \left( {i,x} \right) \right\rbrack$ and use $\left. d\left( {\left\lbrack \left( {i,x} \right) \right\rbrack,\left\lbrack \left( {j,y} \right) \right\rbrack} \right) = \middle| x \middle| + \middle| y| \right.$ if $i \neq j$, and $|x - y|$ if $i = j$. It is bounded. At radius $\frac{1}{2}$, a ball can cover at most one of the points from distinct far ends, since two such points have distance $2$. Thus infinitely many balls are needed and $X$ is not totally bounded.

## Problem G

For $Q \subset c_{0}$ with the sup metric, total boundedness is equivalent to boundedness plus: for every $\varepsilon > 0$, some $N$ has $\left. |x_{n} \middle| < \varepsilon \right.$ for every $x \in Q$ and $n \geq N$. A finite cover proves the tail condition by contradiction (choose increasingly far non-small entries and form a separated subsequence). Conversely, partition the first $N$ bounded coordinates into finitely many pieces of length $\frac{\varepsilon}{2}$ and combine this finite head cover with the $\frac{\varepsilon}{2}$ tail bound.

## Bonus problem

For a countable dense set $E = \left\{ p_{n} \right\}$ in $X$, define $f(x) = \left( {d\left( {x,p_{n}} \right) - d\left( {x_{0},p_{n}} \right)} \right)_{n \in {\mathbb{N}}}$. Triangle inequality makes this bounded and gives $\| f(x) - f(y)\|_{\infty} \leq d\left( {x,y} \right)$. Along a subsequence $p_{n_{j}}\rightarrow x$, the coordinate differences tend to $d\left( {x,y} \right)$, so equality holds. This is an isometric embedding into $\ell^{\infty{(N)}}$.

