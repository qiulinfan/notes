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
source: "notes/math/multivariate-analysis/homeworks/hw15.typ"
subtitle: Historical personal working notes
title: Multivariate Analysis Homeworks
---
# HW 15

## Problem A

There is no injective smooth $f:{\mathbb{R}}^{n}\rightarrow{\mathbb{R}}^{m}$ for $n > m$. The proof first records the constant rank theorem: if $Df$ has constant rank $r$ near $x_{0}$, choose a nonsingular $r \times r$ minor and set $\varphi(x) = \left( {f_{1}(x),\ldots,f_{r{(x)}},x_{r + 1},\ldots,x_{n}} \right)$. IFT makes $\varphi$ a local diffeomorphism. In these coordinates $fo\varphi^{- 1}(v) = \left( {v_{1},\ldots,v_{r},g_{r + 1}(v),\ldots,g_{m{(v)}}} \right)$; the rank calculation makes the partial derivatives of the $g$ terms in the last variables zero. A target coordinate change then gives $\left( {v_{1},\ldots,v_{r},0,\ldots,0} \right)$.

For the claimed non-injectivity, lower semicontinuity and the finite set of possible ranks make rank locally constant on some neighbourhood. The normal form is not injective when $n > m$, and composing with local diffeomorphisms preserves this contradiction.

## Problem B

For continuous compactly supported $f,g:{\mathbb{R}}^{n}\rightarrow{\mathbb{R}}$, define convolution by $\left( {f \ast g} \right)(x)$ equal to the integral of $f\left( {x - y} \right)g(y)$ over ${\mathbb{R}}^{n}$. On a product box containing both supports, Fubini and the substitution $z = x - y$ give

the integral of $f \ast g$ equals the product of the integrals of $f$ and $g$.

The same substitution proves $f \ast g = g \ast f$. Applying Fubini twice shows

The iterated-integral calculation has integrand $f\left( {x - y - z} \right)g(z)h(y)$ and yields $\left( {\left( {f \ast g} \right) \ast h} \right)(x) = \left( {f \ast \left( {g \ast h} \right)} \right)(x)$,

so convolution is associative.

## Problem C

For $f\left( {x,y} \right) = 4x^{2} + 10y^{2}$ on $x^{2} + y^{2} \leq 4$, the only interior critical point is $\left( {0,0} \right)$, where $f = 0$. On the boundary, $f = 16 + 6y^{2}$, so the maximum is $40$ at $\left( {0,2} \right)$ and $\left( {0, - 2} \right)$. Thus the minimum is $0$ at $\left( {0,0} \right)$.

## Problem D

Of $f\left( {x,y} \right) = 3x_{1}y_{2} + 5x_{2}x_{3}$, $g\left( {x,y} \right) = x_{1}y_{2} + x_{2}y_{4} + 1$, and $h\left( {x,y} \right) = x_{1}y_{1} - 7x_{2}y_{3}$, only $h$ is a tensor: the first has a quadratic factor in $x$, and the second has a constant term. In the elementary dual basis,

$h = e^{1}o \times e^{1} - 7e^{2}o \times e^{3}.$

## Problem E

For a vector space $V$, $L^{k{(V)}}$ is a vector space under pointwise addition and scalar multiplication: the displayed verification checks linearity in each argument, the zero map, additive inverses, commutativity, associativity, and distributivity.

## Problem F

For the cycle taking $1$ to $2$ through $k$ and $k$ back to $1$, write it as $k - 1$ transpositions, so its sign is $\left( {- 1} \right)^{k - 1}$.

## Problem G

If $T:V\rightarrow W$ is linear and $f \in A^{k{(W)}}$, then $T^{\ast}f\left( {v_{1},\ldots,v_{k}} \right) = f\left( {Tv_{1},\ldots,Tv_{k}} \right)$ is multilinear. For a permutation $\sigma$, substituting the permuted arguments gives $T^{\ast}f\left( {v_{\sigma{(1)}},\ldots,v_{\sigma{(k)}}} \right)$ equal to the sign of $\sigma$ times $T^{\ast}f\left( {v_{1},\ldots,v_{k}} \right)$, so $T^{\ast}f \in A^{k{(V)}}$.

## Problem H

For the elementary alternating tensor $\varphi_{I}$ on ${\mathbb{R}}^{n}$, with $I = \left( {i_{1},\ldots,i_{k}} \right)$ and column matrix $X = \left\lbrack {x_{1}\ldots x_{k}} \right\rbrack$,

$\varphi_{I{({x_{1},\ldots,x_{k}})}}$ is the sum over permutations of the sign of $\sigma$ times the corresponding product of the selected coordinates, and equals $\det X_{I}$,

the determinant expansion of the submatrix whose rows are indexed by $I$.

## Bonus

The printed bonus gives the definition of a real analytic function, a binomial-series exercise, radius of convergence $\left. R = \frac{1}{\operatorname{lim\, sup}}\  \middle| c_{n}|^{\frac{1}{n}} \right.$, convergence properties, coefficient bounds, and differentiation of a power series. The source page contains no handwritten solution for these printed bonus parts.
