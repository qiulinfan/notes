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
source: "notes/math/multivariate-analysis/homeworks/hw10.typ"
subtitle: Historical personal working notes
title: Multivariate Analysis Homeworks
---
# HW 10

## Problem A

For integrable $f,g:B\rightarrow{\mathbb{R}}$, $M(x) = \max\left( {f(x),g(x)} \right)$ is integrable. At every point where both $f$ and $g$ are continuous, the maximum is continuous (use the two local $\varepsilon$ bounds). Thus $D_{M} \subset D_{f} \cup D_{g}$, which has measure zero.

## Problem B

If $f$ is integrable then $|f|$ is integrable: $\left. D_{|}f \middle| \subset D_{f} \right.$, since a fixed jump in $|f|$ gives, by reverse triangle inequality, a jump in $f$. For every partition $P$, $\left. |L\left( {f,P} \right) \middle| \leq U\left( |f \middle| ,P \right) \right.$, and taking infima yields the corresponding inequality between the integrals of $f$ and $|f|$.

## Problem C

Let $R = \left( {\left( {\cos\left( {\sqrt{2}\pi} \right),\sin\left( {\sqrt{2}\pi} \right)} \right),\left( {- \sin\left( {\sqrt{2}\pi} \right),\cos\left( {\sqrt{2}\pi} \right)} \right)} \right)$ and let $S$ be the rotation of the rational points in the unit square. It is dense because $R$ is a rotation. Two points of $S$ on one vertical (or horizontal) line must have equal preimages, since the relevant sine/cosine coefficient is irrational; hence each such line meets $S$ at most once. The characteristic function of $S$ is $0$ except possibly at one point on each coordinate line, so every one-variable slice is integrable; but density gives upper sum $1$ and lower sum $0$ for every two-dimensional partition.

## Problem D

For $f \in C^{2}(A)$ and closed box $Q = \left\lbrack {a_{1},b_{1}} \right\rbrack \times \left\lbrack {a_{2},b_{2}} \right\rbrack \subset A$, Fubini and FTC give both integrals of the mixed partials as $f\left( {b_{1},b_{2}} \right) - f\left( {a_{1},b_{2}} \right) - f\left( {b_{1},a_{2}} \right) + f\left( {a_{1},a_{2}} \right)$. On a small box about $\left( {a,b} \right)$, apply the integral mean-value theorem twice to their difference; the zero double integral forces equality of mixed partials at $\left( {a,b} \right)$.

## Problem E

Riemann integrability implies Darboux integrability because a fine partition has both tagged sums within $\frac{\varepsilon}{2}$ of the integral, so upper and lower sums are within $\varepsilon$. Conversely, for a Darboux integrable $f$, refine a near-optimal partition by any sufficiently fine partition. The boundary-strip lemma bounds total volume of new subboxes crossing old boundaries; lower and upper sums on the remaining subboxes stay close to the Darboux sums. Therefore every fine tagged sum is close to the common Darboux integral.

## Problems F-G and Bonus

For $g(x) = f\left( {Ax} \right)$, chain rule gives $Dg(0) = Df(0)A$ and differentiating once more yields $H_{g{(0)}} = A^{T}H_{f{(0)}}A$. The quadratic Taylor polynomial is $T_{2}(x) = f(0) + Df(0)x + \frac{1}{2}x^{T}H_{f{(0)}}x$. The bonus proof uses that the continuity set of a map is a $G_{\delta}$ set and Baire Category: $\mathbb{Q}$ is not $G_{\delta}$, so no function can be continuous exactly on $\mathbb{Q}$ and discontinuous on its complement.

