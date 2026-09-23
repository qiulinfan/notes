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
source: "notes/math/multivariate-analysis/homeworks/hw05.typ"
subtitle: Historical personal working notes
title: Multivariate Analysis Homeworks
---
# HW 5

## Problem A

For $F:{\mathbb{R}}^{3}\rightarrow{\mathbb{R}}^{3}$,

$F\left( {x,y,z} \right) = \left( {\exp\left( {x^{2} + 2y^{2}} \right),\sin\left( {z^{2} - y^{2}} \right)\left( {x^{2} + 2z^{2}} \right),\left( {x^{2} + y^{2} + z^{2}} \right)^{9}} \right)$,

each component is a composition or product of smooth elementary functions, hence $F$ is differentiable. Factor $F = F_{2}oF_{1}$ with $F_{1}\left( {x,y,z} \right) = \left( {x,x^{2} + 2y^{2},x^{2} + 2z^{2}} \right)$ and $F_{2}\left( {a,b,c} \right) = \left( {\exp(a),b\sin(c),\left( {a + b} \right)^{9}} \right)$. The displayed $DF_{1}$ has third row equal to half the difference of the second and first rows, so $\det DF_{1} = 0$. Chain rule gives $\det DF = 0$.

## Problem B

If differentiable maps $F:A \subset {\mathbb{R}}^{n}\rightarrow B \subset {\mathbb{R}}^{m}$ and $G:B\rightarrow A$ are inverse, then $DG\left( {Fx} \right)DF(x) = I_{n}$ and $DF\left( {Gy} \right)DG(y) = I_{m}$. Both products being identities forces $n = m$ and $D{F(a)}^{- 1} = DG(b)$ when $F(a) = b$.

## Problem C

$f(x) = x^{3}$ is a differentiable homeomorphism of $\mathbb{R}$, but $f^{- 1}(x) = \sqrt[3]{x}$ is not differentiable at $0$.

## Problem D

If $F:{\mathbb{R}}^{2}\rightarrow{\mathbb{R}}$ is continuous at $0$ and the iterated limits exist, each equals $F\left( {0,0} \right)$. For example, define $F\left( {h,k} \right) = \frac{h^{2} - k^{2}}{h^{2} + k^{2}}$ away from $\left( {0,0} \right)$ and $0$ there. Then $\lim_{h\rightarrow 0}\lim_{k\rightarrow 0}F\left( {h,k} \right) = 1$ while the reversed order is $- 1$.

## Problem E

The number of four-variable monomials of degree at most $10$ is $\left( \frac{14}{4} \right) = 1001$ (the red working also sums $\sum_{k = 0}^{10}\left( \frac{k + 3}{3} \right)$).

## Problem F

If $A \subset {\mathbb{R}}^{n}$ is open and connected, $F:A\rightarrow{\mathbb{R}}^{m}$ is differentiable, and $DF = 0$ on $A$, then $F$ is locally constant: join nearby $x,y$ by coordinate segments inside a small ball and use the one-variable mean value theorem on each segment. The set $\{ x:F(x) = F(a)\}$ is both open and closed in $A$, hence is all of $A$.

## Problem G

Leibniz's formula was proved by induction:

The displayed Leibniz formula differentiates the product of $f_{1}$ through $f_{m}$: $\partial^{k{({f_{1}f_{2}})}} = \sum_{|\alpha| = k}\frac{k!}{\alpha!}\partial^{\alpha_{1}}f_{1}\partial^{\alpha_{2}}f_{2}$, with the same multi-index distribution among all factors.

Differentiating the $k$ case and grouping every new multi-index $\beta$ with $\left. |\beta \middle| = k + 1 \right.$ gives coefficient $\sum_{i}k!\frac{\beta_{i}}{\beta} \neq \frac{\left( {k + 1} \right)!}{\beta!}$.

## Problem H

Let $T_{k}$ be the degree-$k$ Taylor polynomial centered at $x_{0}$. For the backward direction, Taylor's theorem writes $T_{k{(x)}} - f(x)$ as a remainder whose terms have $\left. |\alpha \middle| = k + 1 \right.$; bounding each monomial by $\left\| x \right\|^{k + 1}$ gives the required little-$o$ statement.

For the forward direction, the submitted work writes $f(x) - P(x) = c_{1}x^{\alpha^{1}} + \ldots + c_{m}x^{\alpha^{m}}$ and seeks to show the quotient by $\left\| x \right\|^{k}$ does not tend to zero. In Case 1, $\sum_{i}c_{i} \neq 0$, it chooses $x_{n} = \left( {t_{n},\ldots,t_{n}} \right)$ with $t_{n} = \frac{1}{n}$ and obtains a nonzero constant quotient. Case 2, $\sum_{i}c_{i} = 0$, ends with "idk". A subsequent attempted route states that a nonzero homogeneous polynomial of degree $k$ is not $o\left( \left\| x \right\|^{k} \right)$, using $x_{n} = t_{n}x_{0}$; it then notes that a degree-$k$ polynomial need not be homogeneous.

## Problem I

For $F\left( {x,y} \right) = f\left( {x^{2} + y^{2}} \right)$, chain rule gives $F_{x} = 2xf'\left( {x^{2} + y^{2}} \right)$ and $F_{y} = 2yf'\left( {x^{2} + y^{2}} \right)$, hence $xF_{y} = yF_{x}$. For the displayed composition problem, write $\varphi = \varphi_{m}o\varphi_{n}$ and apply the chain rule. At $\left( {1,1,1} \right)$ with $f = x^{2} + yz$, $g = y^{3} + xy$, $h = e^{x}$, both the formula and direct computation give

$D\varphi\left( {1,1,1} \right) = \left( {\left( {2e^{2} + 2,4,2} \right),\left( {0,1,4} \right)} \right).$

## Problems J and K

For the specified $f:{\mathbb{R}}^{2}\rightarrow{\mathbb{R}}^{3}$ and $g:{\mathbb{R}}^{3}\rightarrow{\mathbb{R}}^{2}$, the chain-rule calculation records $D\left( {gof} \right)(0) = \left( {\left( {6,13} \right),\left( {6,2} \right)} \right)$. The third order Taylor polynomial of $e^{x + y^{2}}$ at $0$ is

$1 + x + \frac{x^{2}}{2} + y^{2} + xy^{2} + \frac{x^{3}}{6}$.

## Positive definite matrices

For a real symmetric matrix $A$, positive definiteness implies invertibility and $x^{T}Ax > 0$, so the angle of $Ax$ with $x$ is acute. Conversely, the acute-angle condition gives $x^{T}Ax > 0$. In an orthonormal eigenbasis, $x^{T}Ax = \sum\lambda_{i}c_{i}^{2}$, proving positive definiteness iff every eigenvalue is positive. Each leading principal minor inherits positive definiteness; the forward direction of Sylvester's criterion follows. The submitted converse attempt is marked "didn't work at all."

