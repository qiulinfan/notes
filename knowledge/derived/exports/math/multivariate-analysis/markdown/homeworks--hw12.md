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
source: "notes/math/multivariate-analysis/homeworks/hw12.typ"
subtitle: Historical personal working notes
title: Multivariate Analysis Homeworks
---
# HW 12

## Problem A

Let $S$ be bounded, let $A$ be the interior of $S$, and let bounded $f:S\rightarrow{\mathbb{R}}$ be Riemann integrable on $S$. Since $D_{f|A} \subset D_{f}$, Lebesgue's criterion makes $f$ integrable on $A$. Also $\partial A \subset \partial S$. Split the complement of $A$ in $S$ into its isolated points, its non-isolated discontinuities, and its non-isolated continuity points. The first is countable; the second has measure zero; on the third, $f$ has limiting value $f\left( x_{0} \right)$ and the integral over the set is zero. Hence the integral over the complement is $0$, so the integrals over $A$ and $S$ agree. If $S$ is Jordan measurable, then $m\left( {\partial A} \right) \leq m\left( {\partial S} \right) = 0$, and $m(A) = m(S)$.

## Problem B

For $B_{a}^{n{(x)}}$, polar coordinates give its volume as $\Gamma_{n}a^{n}$. The spherical-coordinate Jacobian recorded is $r^{n - 1}\prod_{k = 1}^{n - 2}\sin^{k{(\theta_{k})}}$; integration produces the factor $\frac{a^{n}}{n}$. Translation has determinant one, giving the formula for all centres. $\Gamma_{1} = 2$ and $\Gamma_{2} = \pi$. Slicing the unit $n$-ball by one coordinate and using polar coordinates gives $\Gamma_{n} = \left( {2\frac{\pi}{n}} \right)\Gamma_{n - 2}$, hence $\Gamma_{2k} = \frac{\pi^{k}}{k!}$ and $\Gamma_{2k + 1} = 2^{k + 1}\frac{\pi^{k}}{\left( {2k + 1} \right)!!}$.

## Problem C

For $p = \left( {p',p_{n}} \right)$ with $p_{n} > 0$ and open Jordan measurable $A \subset {\mathbb{R}}^{n - 1}$, define $g:A \times \left( {0,1} \right)\rightarrow S$ by $g\left( {a',t} \right) = \left( {1 - t} \right)\left( {a',0} \right) + tp$. It is a $C^{1}$ diffeomorphism. Its derivative is upper triangular with determinant $\left( {1 - t} \right)^{n - 1}p_{n}$, so change of variables gives the volume of $S$ as $p_{n}$ times the volume of $A$ divided by $n$.

## Problem D

The ellipsoid $\left( \frac{\left( {x - u} \right)^{2}}{a^{2}} \right) + \left( \frac{\left( {y - v} \right)^{2}}{b^{2}} \right) + \left( \frac{\left( {z - w} \right)^{2}}{c^{2}} \right) < 1$ is the inverse image of the unit ball under $\left( {x,y,z} \right)\mapsto\left( {\frac{x - u}{a},\frac{y - v}{b},\frac{z - w}{c}} \right)$. The inverse has determinant $abc$, so its volume is $4\pi ab\frac{c}{3}$.

## Problem E

The solid between $z = x^{2} + 2y^{2}$ and $z = 2x + 6y + 1$ projects to $\left( {x - 1} \right)^{2} + 2\left( {y - \frac{3}{2}} \right)^{2} < \frac{13}{2}$. Translating then using the displayed elliptical polar substitution gives the recorded volume $169\sqrt{2}\frac{\pi}{16}$.

## Problem F

Integrating $\exp\left( {- x^{2} - y^{2}} \right)$ over larger and larger disks, polar coordinates give the two-dimensional Gaussian integral as $\pi$. Fubini over expanding squares makes this the square of the one-dimensional Gaussian integral, so the integral is $\sqrt{\pi}$.

## Problem G

$|x|^{e}$ is integrable over the unit ball iff $e > - n$: decompose the punctured ball into annuli and compare the radial series with $\sum_{i}i^{- {({n + e})}}$. It is integrable outside the closed unit ball iff $e\leftarrow n$, by the analogous tail series.

## Bonus

For $f:{\mathbb{R}}\rightarrow{\mathbb{R}}$ differentiable on compact $I$ with $\left. |f' \middle| \leq \delta \right.$, the mean value theorem gives $\left. |f(I) \middle| \leq \delta \middle| I| \right.$. If $f \in C^{1}({\mathbb{R}})$, write $A_{n} = \{ x \in \left\lbrack {- n,n} \right\rbrack:f'(x) = 0\}$. Uniform continuity of $f'$ lets finitely many short intervals cover $A_{n}$ so that $f\left( A_{n} \right)$ has arbitrarily small total length. Thus $m\left( {f\left( A_{n} \right)} \right) = 0$ and $m\left( {f\left( {\{ f' = 0\}} \right)} \right) = 0$.

