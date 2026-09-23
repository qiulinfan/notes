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
source: "notes/math/multivariate-analysis/homeworks/hw07.typ"
subtitle: Historical personal working notes
title: Multivariate Analysis Homeworks
---
# HW 7

## Problem A

For differentiable $f:A \subset {\mathbb{R}}^{n}\rightarrow{\mathbb{R}}$ and unit $u$, $D_{u}f(x) = Df(x)u = \nabla f(x) \cdot u$. Cauchy-Schwarz gives $D_{u}f(x) \leq \| Df(x)\|$, with equality precisely for $u = D\frac{f(x)}{\|}Df(x)\|$. Also $D_{u}f(x) = 0$ iff $u$ is orthogonal to $Df(x)$.

## Problem B

Let $M = c^{- 1}(0)$, $f:U\rightarrow{\mathbb{R}}$, $c:U\rightarrow{\mathbb{R}}$ be $C^{1}$, $f|_{M}$ have a local minimum at $p$, and $Dc(p)$ be surjective. Reorder coordinates so $\partial\frac{c}{\partial}x_{n{(p)}} \neq 0$. By IFT, locally $M = \{\left( {x,g(x)} \right):x \in B_{e{(a)}}\}$. For $h(x) = f\left( {x,g(x)} \right)$, $Dh(a) = 0$. Differentiating $c\left( {x,g(x)} \right) = 0$ gives $g_{x_{i}} = - \frac{c_{x_{i}}}{c_{x_{n}}}$, hence $f_{x_{i}}(p) - f_{x_{n}}(p)c_{x_{i}}\frac{p}{c_{x_{n}}}(p) = 0$ for every $i$. Put $\lambda = f_{x_{n}}\frac{p}{c_{x_{n}}}(p)$; then $Df(p) = \lambda Dc(p)$.

## Problems C-D

The intuitive explanation says that at a constrained minimum the gradient of $f$ is normal to all allowed directions, while $Dc(p)$ is normal to $M$, so the two gradients are parallel. For $f\left( {x,y} \right) = 3x + y$ on $x^{2} + y^{2} = 1$, $Df = \left( {3,1} \right) = \lambda\left( {2x,2y} \right)$. The critical points are $\left( {\frac{3}{\sqrt{10}},\frac{1}{\sqrt{10}}} \right)$ and its negative; the minimum is $- \sqrt{10}$ at $\left( {- \frac{3}{\sqrt{10}}, - \frac{1}{\sqrt{10}}} \right)$.

## Problem E

For $c:U\rightarrow{\mathbb{R}}^{k}$ with full rank $Dc(p) = k$, the stated generalization is $Df(p) = \sum_{i = 1}^{k}\lambda_{i}Dc_{i{(p)}}$. Split variables as $\left( {x,y} \right)$ with a nonsingular $\partial\frac{c}{\partial}y$ block. IFT writes $M$ locally as $\left( {x,g(x)} \right)$. The identities $Dh(a) = 0$ and $D\left( {c\left( {x,g(x)} \right)} \right) = 0$ combine to give $Df(p) = \left( {\partial\frac{f}{\partial}y} \right)\left( {\partial\frac{c}{\partial}y} \right)^{- 1}Dc(p)$.

## Problem F

Positive definite symmetric matrices form an open subset of symmetric matrices. For $A > 0$, the quadratic form $x^{T}Ax$ has positive minimum $m$ on the compact unit sphere. If $\| A - B\| < m$, then $x^{T}Bx = x^{T}Ax + x^{T{({B - A})}}x \geq m - \| B - A\| > 0$ on the sphere, and hence for all nonzero $x$.

## Problem G

If $f \in C^{2}(A)$, $x_{0}$ is critical, and $H_{f{(x_{0})}}$ is positive definite, continuity of the Hessian makes $H_{f}$ positive definite near $x_{0}$. Taylor's formula along the segment gives $f(x) - f\left( x_{0} \right) = \frac{1}{2}\left( {x - x_{0}} \right)^{T}H_{f{(c)}}\left( {x - x_{0}} \right) > 0$ for nearby $x \neq x_{0}$; hence a strict local minimum.

## Problem H

For an invertible matrix $A$ with cofactor matrix $C$, the diagonal entry $\left( {AC^{T}} \right)_{ij}$ equals $\det A$ when $i = j$ by cofactor expansion. For $i \neq j$, replace row $j$ by row $i$ to obtain a matrix with determinant $0$ whose cofactor expansion is $\left( {AC^{T}} \right)_{ij}$. Thus $AC^{T} = \left( {\det A} \right)I$, so $A^{- 1} = \frac{C^{T}}{\det A}$.

## Problem I

For differentiable $f,g:\left( {a,b} \right)\rightarrow{\mathbb{R}}^{n}$, $\left( {f \cdot g} \right)(t) = \sum_{i}f_{i{(t)}}g_{i{(t)}}$, and differentiating term by term gives $\left( {f \cdot g} \right)' = f' \cdot g + f \cdot g'$.

## Bonus

The epigraph of $f$ is convex iff $H_{f{(x)}}$ is positive semidefinite everywhere. For the forward direction, restrict $f$ to $x + tv$; convexity gives its second derivative $v^{T}H_{f{(x)}}v \geq 0$. For the converse, the same one-variable restriction has nonnegative second derivative, hence is convex, and this is exactly the epigraph inequality.

