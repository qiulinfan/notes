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
source: "notes/math/multivariate-analysis/homeworks/hw14.typ"
subtitle: Historical personal working notes
title: Multivariate Analysis Homeworks
---
# HW 14

## Problem A

For $a_{i} = \frac{1}{2^{2i + 2}}$, $b_{i} = \frac{1}{2^{2i + 1}}$, $I_{i} = \left\lbrack {a_{i},b_{i}} \right\rbrack$, and $M_{i} = 4^{i + 1}$, let $\varphi(t) = \exp\left( {- \frac{1}{1 - t^{2}}} \right)$ for $\left. |t \middle| < 1 \right.$ and $0$ otherwise. Define

$\psi_{i{(x)}} = M_{i}\varphi\left( {\frac{2x - \left( {a_{i} + b_{i}} \right)}{|}I_{i}|} \right).$

The $\psi_{i}$ are smooth with disjoint supports $I_{i}$. If $\lambda = \sum_{i}\psi_{i}$, then at the midpoint of $I_{i}$, $\psi_{i} = M_{i}\varphi(0) = M_{i}e^{- 1}\rightarrow\infty$ while the midpoints tend to $0$ and $\lambda(0) = 0$. Thus $\lambda$ is not continuous at $0$.

## Problem B

The change-of-variables theorem for linear diffeomorphisms and compactly supported continuous $f$ is proved by induction on the dimension, after decomposing a linear map into primitive linear diffeomorphisms. The $n = 1$ case is the one-variable substitution theorem. For a primitive map preserving the last coordinate, write $Q = D \times I$, restrict to $S = h^{- 1}(Q)$, extend $\left. \left( {foh} \right) \middle| \det Dh| \right.$ by $0$, and use Fubini. For each fixed $t$, the $\left( {n - 1} \right)$-dimensional induction hypothesis supplies the inner substitution formula, which Fubini integrates to the result.

## Problem C

The rank map on $M_{n,m}$ is lower semicontinuous. If matrix $A$ has rank $r > 0$, choose a nonzero $r \times r$ minor. Continuity of determinant supplies a Frobenius-norm ball about $A$ in which the same minor remains nonzero, so ranks are at least $r$. It need not be continuous: $A_{k} = \left( \frac{1}{k} \right)I_{n}\rightarrow 0$, but $A_{k}$ has rank $n$ while zero has rank $0$.

