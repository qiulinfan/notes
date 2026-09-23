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
source: "notes/math/multivariate-analysis/homeworks/hw13.typ"
subtitle: Historical personal working notes
title: Multivariate Analysis Homeworks
---
# HW 13

## Problem A

The coordinate swap matrix factors as

$\left( {\left( {0,1} \right),\left( {1,0} \right)} \right) = \left( {\left( {- 1,0} \right),\left( {0,1} \right)} \right)\left( {\left( {1, - 1} \right),\left( {0,1} \right)} \right)\left( {\left( {1,0} \right),\left( {1,1} \right)} \right)\left( {\left( {1, - 1} \right),\left( {0,1} \right)} \right),$

each factor a primitive diffeomorphism on ${\mathbb{R}}^{2}$.

## Problem B

Let $\psi(x) = \exp\left( {- \frac{1}{1 - \left( \frac{x}{3.5} \right)^{2}}} \right)$ for $\left. |x \middle| < 3.5 \right.$ and $0$ otherwise. Put $\psi_{n{(x)}} = \psi\left( {x - n} \right)$ for odd $n$ and $\psi\left( {x + n} \right)$ for even $n$. The supports are the listed intervals $\left\lbrack {n - 3.4,n + 3.4} \right\rbrack$ or $\left\lbrack {- n - 3.4, - n + 3.4} \right\rbrack$; at any $x$ at most four are supported. Thus $\lambda = \sum_{n}\psi_{n}$ is smooth and positive. Setting $\varphi_{n} = \frac{\psi_{n}}{\lambda}$ gives $\sum_{n}\varphi_{n} = 1$ and a smooth partition of unity dominated by the open intervals of length $7$.

## Problem C

For $f(x) = e^{- \frac{1}{x}}$ when $x > 0$ and $0$ otherwise, $f^{n}(x) = P_{n{(\frac{1}{x})}}e^{- \frac{1}{x}}$ on $x > 0$, with $P_{n}$ polynomial. Inductively $f^{n}(0) = 0$: after $t = \frac{1}{x}$, a bound $\left. |Q_{n{(t)}} \middle| \leq C_{n}t^{2n} \right.$ makes the difference quotient tend to $0$. Thus $f \in C^{\infty{({\mathbb{R}})}}$.

## Problem D

If $f:{\mathbb{R}}^{n}\rightarrow{\mathbb{R}}^{m}$ is smooth and $n < m$, its image has measure zero by the cited class result. If it contained nonempty open $U$, it would contain a ball of positive Jordan and Lebesgue measure, contradicting monotonicity.

## Problem E

A local diffeomorphism $g$ with $g(0) = 0$, $Dg(0) = I$ is locally factored by choosing a coordinate $i$, setting $h(x) = \left( {g_{1}(x),\ldots,g_{i - 1}(x),x_{i},g_{i + 1}(x),\ldots,g_{n{(x)}}} \right)$, and correcting the $i$th coordinate in the target. IFT gives a local factorization into primitive diffeomorphisms. Induction freezes one coordinate at a time, giving a finite factorization into super-primitive diffeomorphisms; translations and elementary linear maps are also decomposed this way.

## Problem F

No injective smooth $f:{\mathbb{R}}^{2}\rightarrow{\mathbb{R}}$ exists. If all partials vanished everywhere, $f$ would be constant. Otherwise, say $f_{x{({a,b})}} \neq 0$; IFT writes the level set $f\left( {x,y} \right) = f\left( {a,b} \right)$ locally as $y = g(x)$, contradicting injectivity.

## Problem G

If $f:S\rightarrow{\mathbb{R}}$ is smooth at each $x \in S$, choose local smooth extensions $f_{x}:U_{x}\rightarrow{\mathbb{R}}$. A locally finite smooth partition of unity $\varphi_{n}$ subordinate to $\{ U_{x}\}$ gives $h_{n} = \varphi_{n}f_{x_{n}}$ on $U_{x_{n}}$ and $0$ elsewhere. The locally finite sum $g = \sum_{n}h_{n}$ is smooth and, at $x_{0} \in S$, equals $f\left( x_{0} \right)\sum_{n}\varphi_{n{(x_{0})}} = f\left( x_{0} \right)$.

## Problem H

If matrix $A$ has rank $k$, select $k$ independent columns and then $k$ independent rows among them to obtain a $k \times k$ minor with nonzero determinant. Any larger minor has rank at most $k$, so determinant zero. Hence rank is the maximum order of a nonzero minor.

