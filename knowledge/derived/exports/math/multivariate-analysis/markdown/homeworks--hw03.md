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
source: "notes/math/multivariate-analysis/homeworks/hw03.typ"
subtitle: Historical personal working notes
title: Multivariate Analysis Homeworks
---
# HW 3

## Problem A

For a Lipschitz map $f:X\rightarrow Y$ with constant $C$, $d_{2}\left( {f(x),f(y)} \right) \leq Cd_{1}\left( {x,y} \right)$. Taking $\delta = \frac{\varepsilon}{C}$ proves uniform continuity. If $f_{n}$ have one common Lipschitz constant $C$ and converge uniformly to $f$, then $d\left( {f(x),f(y)} \right) \leq d\left( {f(x),f_{n{(x)}}} \right) + Cd\left( {x,y} \right) + d\left( {f_{n{(y)}},f(y)} \right)$. Letting the uniform error tend to zero proves that $f$ is also Lipschitz with constant $C$. Without a common constant this is false: on $\left( {0,\infty} \right)$, $f_{n{(x)}} = \sqrt{x + \frac{1}{n}}$ converge uniformly to $\sqrt{x}$, which is not Lipschitz near $0$.

## Problem B

If $X$ is connected and $f:X\rightarrow Y$ is continuous, then $f(X)$ is connected: a separation $f(X) = B_{1} \cup B_{2}$ pulls back to a separation of $X$. Consequently a continuous $f:X\rightarrow{\mathbb{R}}$ assumes every intermediate value between $\inf f$ and $\sup f$.

## Problem C

For a continuous bijection $f:X\rightarrow Y$ with $X$ compact, $f^{- 1}$ is continuous. A closed $B \subset X$ is compact, hence $f(B)$ is compact and closed in the metric space $Y$. Thus $f$ is a closed map. Compactness is necessary: $\left\lbrack {0,2\pi} \right)\rightarrow S^{1}$, $t\mapsto e^{it}$, is a continuous bijection whose inverse is discontinuous at $1$.

## Problem D

If $D_{v}f(p)$ exists, then $D_{cv}f(p) = cD_{v}f(p)$: for $c \neq 0$ substitute $h = ct$ in the defining limit, and $c = 0$ is immediate. For $f\left( {x,y} \right) = \sqrt{|xy|}$ at $\left( {0,0} \right)$, the derivatives in $\left( {1,0} \right)$ and $\left( {0,1} \right)$ are $0$, but that in $\left( {1,1} \right)$ does not exist because $|t\frac{|}{t}$ has unequal one-sided limits. For $f\left( {x,y} \right) = x\frac{y^{2}}{x^{2} + y^{2}}$ off the origin and $0$ at it, $D_{a,b}f\left( {0,0} \right) = 0$ when $\left( {a,b} \right) = 0$, and $D_{a,b}f\left( {0,0} \right) = a\frac{b^{2}}{a^{2} + b^{2}}$ otherwise. This formula is not linear in the direction, though polar coordinates show continuity at the origin.

## Problem E

The Baire Category Theorem was written as: in a complete metric space, every countable intersection of open dense subsets is dense.

## Problem F

Let $N \subset \left\lbrack {0,1} \right\rbrack$ select one element from each class modulo $\mathbb{Q}$. The translations $N_{r}$ form a disjoint decomposition of $\left\lbrack {0,1} \right\rbrack$. A countably additive, translation-invariant measure on every subset with $m\left( \left\lbrack {0,1} \right\rbrack \right) = 1$ would make all $N_{r}$ have the same measure; this gives either $0$ or infinity for the interval. Therefore the stipulated measure does not exist.

## Bonus problem

The Cantor set is uniformly disconnected by its middle-third gaps. The recorded equivalent ultrametric is the infimum of $\varepsilon$ for which an $\frac{\varepsilon}{d\left( {x,y} \right)}$-chain joins $x$ to $y$. Concatenating chains yields the ultrametric inequality. Conversely, if $\frac{d'}{C} \leq d \leq Cd'$ and $d'$ is ultrametric, the $\varepsilon = \frac{1}{2C}$ chain would force $d'\left( {x,y} \right) \leq d'\frac{x,y}{2}$, impossible for distinct points.

