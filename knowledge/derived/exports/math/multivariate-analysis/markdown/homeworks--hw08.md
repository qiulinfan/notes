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
source: "notes/math/multivariate-analysis/homeworks/hw08.typ"
subtitle: Historical personal working notes
title: Multivariate Analysis Homeworks
---
# HW 8

## Problem A

Let $f:{\mathbb{R}}^{3}\rightarrow{\mathbb{R}}^{2}$ be $C^{1}$, $f\left( {1,2,3} \right) = 0$, and

$Df\left( {1,2,3} \right) = \left( {\left( {1,2,1} \right),\left( {1, - 1,1} \right)} \right).$

The minors are $\det\left( {\partial\frac{f}{\partial\left( {x,y} \right)}} \right) = - 3$, $\det\left( {\partial\frac{f}{\partial\left( {y,z} \right)}} \right) = 3$, and $\det\left( {\partial\frac{f}{\partial\left( {x,z} \right)}} \right) = 0$. Thus $\left( {x,y} \right)$ can be solved in terms of $z$ near $\left( {1,2,3} \right)$, and $\left( {y,z} \right)$ can be solved in terms of $x$; the IFT gives no conclusion for solving $\left( {x,z} \right)$ in terms of $y$.

## Problem B

If $g:B\rightarrow{\mathbb{R}}^{2}$ satisfies $f\left( {x,g(x)} \right) = 0$ and $g(1) = \left( {2,3} \right)$, differentiating gives $f_{x} + f_{y,z}Dg = 0$. Hence

$Dg(1) = - \left\lbrack {\partial\frac{f}{\partial\left( {y,z} \right)}\left( {1,2,3} \right)} \right\rbrack^{- 1}\partial\frac{f}{\partial}x\left( {1,2,3} \right)$

$= - \left( {\left( {2,1} \right),\left( {- 1,1} \right)} \right)^{- 1}\left( {1,1} \right)^{T} = \left( {0, - 1} \right)^{T}.$

