---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: MATH 597
date: Winter 2025
description: Supplementary Measure Theory material outside the main course sequence.
keywords:
- measure theory
- problem solving
- practice problems
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/measure-theory/extras/practice_problems.typ"
subtitle: Homework 0, problem-solving lectures, and practice problems
title: "MATH 597: Measure Theory --- Supplementary Material"
---
# Use Egoroff and Hölder

Let $\left\{ f_{n} \right\}$ be a sequence of functions in $L^{p}\left( {\mathbb{R}}^{n} \right),1 < p < \infty$, which converge almost everywhere to a function $f \in L^{p}\left( {\mathbb{R}}^{n} \right)$, and suppose that there is a constant $M$ such that $\parallel f_{n}\underset{p}{\parallel} \leq M$ for all $n$. Show that for every $g \in L^{q}\left( {\mathbb{R}}^{n} \right),q$ the conjugate of $p$,

$$
\int fg = \lim\limits_{n\rightarrow\infty}\int f_{n}g
$$

Is the statement true for $p = 1$ ? (Hint: you may want to use Egorov's Theorem.)

