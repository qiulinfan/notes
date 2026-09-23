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
# Use a suitable theorem allowing you to differentiate $\exp(g)$ under the integral sign {#use-a-suitable-theorem-allowing-you-to-differentiate-exp-g-under-the-integral-sign}

Let $f$ be a real Lebesgue measurable function on the interval $\lbrack 0,1\rbrack$ such that $\parallel f\underset{\infty}{\parallel} < \infty$. For $\alpha \in {\mathbb{R}}$ define a function $g(\alpha)$ by

$$
g(\alpha) = \log\left\lbrack {\int_{0}^{1}\exp\lbrack\alpha f(x)\rbrack dx} \right\rbrack
$$



\(a\) Prove that the function $g( \cdot )$ is twice continuously differentiable and that $g^{''}(\alpha) \geq 0$ for all $\alpha \in {\mathbb{R}}$, i.e. the function $g( \cdot )$ is convex. (b) Prove that if $f$ is a non-constant function, i.e. $m\left\{ x \in \lbrack 0,1\rbrack: \middle| f(x) - c \middle| \neq 0 \right\} > 0$ for all constants $c \in {\mathbb{R}}$, then $g^{''}(\alpha) > 0,\alpha \in {\mathbb{R}}$.

