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
# Integration can be a trick to prove that a nonnegative function can't be identically zero.

Let $f$ and $g$ be nonnegative functions in $L^{1}({\mathbb{R}})$. Suppose that each function is positive on some set of positive measure. (However, there need not be a single set of positive measure where both functions are positive.) Prove that the convolution

$$
h(x) = \int_{- \infty}^{\infty}f(x - t)g(t)dt
$$

is positive on some set of positive measure.

