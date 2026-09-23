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
# Check what happens on some set $\left\{ {f < c} \right\}$ with $\left. c < \middle| \middle| f \middle| |_{\infty} \right.$ {#check-what-happens-on-some-set-fc-with-cf_infty}

Let $E$ be a measurable subset of $\mathbb{R}$ such that $m(E) < \infty$. Let $f \in L^{\infty}(E)$ with $\parallel f\underset{\infty}{\parallel} > 0$. Show that

$$
\lim\limits_{n\rightarrow\infty}\frac{\parallel f\underset{n + 1}{\overset{n + 1}{\parallel}}}{\parallel f\underset{n}{\overset{n}{\parallel}}} = \parallel f\underset{\infty}{\parallel}
$$

Here $\parallel f\underset{n}{\parallel} := \parallel f\underset{L^{n}(E)}{\parallel}, \parallel f\underset{n + 1}{\parallel} := \parallel f\underset{L^{n + 1}(E)}{\parallel}$.

