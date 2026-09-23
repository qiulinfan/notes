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
source: "notes/math/multivariate-analysis/homeworks/hw04.typ"
subtitle: Historical personal working notes
title: Multivariate Analysis Homeworks
---
# HW 4

## Problem A

Let $F:{\mathbb{R}}^{n}\rightarrow{\mathbb{R}}^{m}$ satisfy $F\left( {tx} \right) = tF(x)$ for every $t > 0$ and suppose $F$ is differentiable at $0$. Put $r(h) = F(h) - F(0) - DF(0)h = F(h) - DF(0)h$. Homogeneity gives $r\left( {th} \right) = tr(h)$. If $r\left( h_{0} \right) \neq 0$, then $\| r\left( {th_{0}} \right)\frac{\|}{\|}th_{0}\| = \| r\left( h_{0} \right)\frac{\|}{\|}h_{0}\| > 0$ for every $t > 0$, contradicting differentiability as $t\rightarrow 0$. Hence $F(h) = DF(0)h$, so $F$ is linear.

## Problem B

For $f:A \subset {\mathbb{R}}^{n}\rightarrow{\mathbb{R}}^{m}$, if all partial derivatives exist and are bounded on the open set $A$, then $f$ is continuous. Write $x = x_{0} + h$ and pass from $x_{0}$ to $x$ one coordinate at a time: $p_{0} = x_{0}$, $p_{i} = p_{i - 1} + h_{i}e_{i}$. Applying the one-variable mean value theorem to $s\mapsto f_{i{({p_{i - 1} + se_{i}})}}$ gives $\left. |f_{i{(p_{i})}} - f_{i{(p_{i - 1})}} \middle| \leq M \middle| h_{i}| \right.$. Summing coordinate and target components yields $\| f(x) - f\left( x_{0} \right)\| \leq nM\| x - x_{0}\|$.

## Problem C

For $f\left( {r,\theta} \right) = \left( {r\cos\theta,r\sin\theta} \right)$, $Df = \left( {\left( {\cos\theta, - r\sin\theta} \right),\left( {\sin\theta,r\cos\theta} \right)} \right)$ and $\det Df = r$. On $S = \left\lbrack {1,2} \right\rbrack \times \left\lbrack {0,\frac{\pi}{2}} \right\rbrack$, $f(S)$ is the quarter-annulus $1 \leq x^{2} + y^{2} \leq 4$, $x,y \geq 0$. The inverse is $\left( {x,y} \right)\mapsto\left( {\sqrt{x^{2} + y^{2}},\arctan\left( \frac{y}{x} \right)} \right)$, continuous on this set. Its derivative is $Df^{- 1} = \frac{1}{r}\left( {\left( {\cos\theta,\sin\theta} \right),\left( {- \sin\theta,\cos\theta} \right)} \right)$ and $DfDf^{- 1} = I_{2}$.

## Problem D

Take $F\left( {x,y} \right) = \left( {x^{2}\frac{y}{x^{2} + y^{2}},x\frac{y^{2}}{x^{2} + y^{2}}} \right)$ away from $0$ and $F(0) = 0$. Every directional derivative at $0$ is $\left( {0,0} \right)$, yet along $\left( {x_{n},y_{n}} \right) = \left( {\frac{1}{n},\frac{1}{n}} \right)$ the quotient of $F\left( {x,y} \right)$ by $\sqrt{x^{2} + y^{2}}$ does not tend to $0$, so $F$ is not differentiable at the origin.

## Problem E

For $f(0) = 0$ and $f\left( {x,y} \right) = x\frac{y\left( {x^{2} - y^{2}} \right)}{x^{2} + y^{2}}$ off $0$, the first partials at $0$ are $0$. Off $0$, product and quotient rules give

$f_{x} = \frac{y\left( {x^{2} - y^{2}} \right)}{x^{2} + y^{2}} + 4x^{2}\frac{y^{3}}{\left( {x^{2} + y^{2}} \right)^{2}},$

$f_{y} = \frac{x\left( {x^{2} - y^{2}} \right)}{x^{2} + y^{2}} - 4x^{3}\frac{y^{2}}{\left( {x^{2} + y^{2}} \right)^{2}}.$

Both tend to $0$ at the origin (each term is bounded by a multiple of $|y|$ or $|x|$), so $f \in C^{1}\left( {\mathbb{R}}^{2} \right)$. The mixed partials are equal off $0$, while at $0$ direct difference quotients give $\partial_{x}\partial_{y}f(0) = \partial_{y}\partial_{x}f(0) = - 1$.

## Bonus problem

In an ultrametric space, $B_{r{(c)}}$ is closed: if $a$ lies outside it and $z \in B_{r{(a)}}$, then $d\left( {z,c} \right) \leq \max\left( {d\left( {z,a} \right),d\left( {a,c} \right)} \right)$ would otherwise contradict $d\left( {a,c} \right) \geq r$. Intersecting balls are nested: if $r \leq s$ and $a$ belongs to both $B_{r{(x)}}$ and $B_{s{(y)}}$, then $z \in B_{r{(x)}}$ satisfies $d\left( {z,y} \right) < s$, hence $B_{r{(x)}} \subset B_{s{(y)}}$. Thus every point of a ball is a centre.

For a connected weighted graph, define $d\left( {v,w} \right)$ as the least possible largest edge-weight along a path. Concatenating a best $v$-$z$ path and a best $z$-$w$ path yields $d\left( {v,w} \right) \leq \max\left( {d\left( {v,z} \right),d\left( {z,w} \right)} \right)$. Conversely, from a finite ultrametric space, join every pair with an edge weighted by its distance; the least maximum path weight is the original metric.

