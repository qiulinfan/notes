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
# Fubini and Tonelli

Suppose that $f(x),x > 0$, is a real valued Lebesgue measurable square integrable function. (a) Prove that for any $\alpha > 0$, the inequality $\left. 2 \middle| f(z) \middle| \middle| f(y) \middle| \leq \alpha f(z)^{2} + f(y)^{2}/\alpha \right.$ holds for all $z,y,\alpha > 0$. (b) Express the double integral

$$
\int_{0}^{\infty}\int_{0}^{\infty}\frac{\left. |f(z) \middle| \middle| f(y)| \right.}{y + z}dzdy
$$

as an integral over the region $\left\{ {0 < z < y < \infty} \right\}$. (c) Show using your work from (a) and (b) that $\left. |f(z) \middle| \middle| f(y) \middle| /(y + z),y,z > 0 \right.$, is integrable and

$$
\int_{0}^{\infty}\int_{0}^{\infty}\frac{\left. |f(z) \middle| \middle| f(y)| \right.}{y + z}dzdy \leq 4\int_{0}^{\infty}f(x)^{2}dx
$$

Hint: Use the inequality in (a) with $\alpha = (z/y)^{1/2}$.

