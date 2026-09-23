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
source: "notes/math/multivariate-analysis/homeworks/hw01.typ"
subtitle: Historical personal working notes
title: Multivariate Analysis Homeworks
---
# HW 1

## Problem A

Suppose $\left( {X,d} \right)$ is a metric space. For $0 < \varepsilon < 1$, show that $d^{\varepsilon}$ is a metric on $X$. If $X = \left\lbrack {0,1} \right\rbrack$ has its usual metric, show that $X$ has "infinite length" using $\sum_{i = 1}^{n}d^{\varepsilon{({t_{i},t_{i - 1}})}}$.

**Proof.** Take $x,y,z \in X$. Positivity and symmetry are immediate: ${d\left( {x,y} \right)}^{\varepsilon} \geq 0$, with equality exactly when $x = y$, and ${d\left( {x,y} \right)}^{\varepsilon} = {d\left( {y,x} \right)}^{\varepsilon}$. Let $f(r) = r^{\varepsilon}$ for $r \geq 0$. Then $f'(r) = \varepsilon r^{\varepsilon - 1} \geq 0$ and $f^{''}(r) = \varepsilon\left( {\varepsilon - 1} \right)r^{\varepsilon - 2} \leq 0$, so $f$ is increasing and concave. Thus

$f\left( {d\left( {x,y} \right)} \right) + f\left( {d\left( {y,z} \right)} \right) \geq f\left( {d\left( {x,y} \right) + d\left( {y,z} \right)} \right) \geq f\left( {d\left( {x,z} \right)} \right)$.

Hence $d^{\varepsilon{({x,y})}} + d^{\varepsilon{({y,z})}} \geq d^{\varepsilon{({x,z})}}$, completing the metric axioms.

For the length claim, take an equally spaced partition into $n$ subintervals. Then $t_{i} - t_{i - 1} = \frac{1}{n}$ and

$\sum_{i = 1}^{n}d^{\varepsilon{({t_{i},t_{i - 1}})}} = {n\left( \frac{1}{n} \right)}^{\varepsilon} = n^{1 - \varepsilon}$.

Since $1 - \varepsilon > 0$, these sums are unbounded above, so for every $M \in {\mathbb{N}}$ some partition has sum greater than $M$.

## Bonus problem

If $X$ is $a \times b$, $Y$ is $b \times c$, ordinary multiplication takes $abc$ scalar multiplications. For

$A_{1}:5 \times 1,\quad A_{2}:1 \times 5,\quad A_{3}:5 \times 2,\quad A_{4}:2 \times 5,\quad A_{5}:5 \times 1,\quad A_{6}:1 \times 10$,

find the cheapest parenthesization. The submitted parenthesization is

$\left( {\left( {A_{1}\left( {A_{2}A_{3}} \right)} \right)\left( {A_{4}A_{5}} \right)} \right)A_{6}$.

Let $m\left( {i,j} \right)$ be the minimal cost for multiplying the matrix chain from $A_{i}$ through $A_{j}$. The recursion used was

$m\left( {i,j} \right) = \min_{i \leq k < j}\left( {m\left( {i,k} \right) + m\left( {k + 1,j} \right) + \text{row}\left( A_{i} \right)\ \text{col}\left( A_{k} \right)\ \text{col}\left( A_{j} \right)} \right)$.

The dynamic-programming calculations recorded on the page are

$m\left( {1,3} \right) = \min\left( {25 + 5 \ast 5 \ast 2,10 + 5 \ast 1 \ast 2} \right) = 20,$

$m\left( {2,4} \right) = \min\left( {25 + 50,10 + 10} \right) = 20,\quad m\left( {3,5} \right) = \min\left( {50 + 25,10 + 10} \right) = 20,$

$m\left( {4,6} \right) = \min\left( {10 + 20,50 + 100} \right) = 30,$

$m\left( {1,4} \right) = \min\left( {20 + 50,25 + 50 + 125,20 + 25} \right) = 45,$

$m\left( {2,5} \right) = 22,\quad m\left( {3,6} \right) = 70,\quad m\left( {1,5} \right) = 27,$

$m\left( {2,6} \right) = 32,\quad m\left( {1,6} \right) = 77.$

Thus the final answer costs $77$ scalar multiplications.

