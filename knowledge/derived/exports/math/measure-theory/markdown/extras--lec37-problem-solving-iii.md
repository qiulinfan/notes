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
source: "notes/math/measure-theory/extras/lec37-problem-solving-iii.typ"
subtitle: Homework 0, problem-solving lectures, and practice problems
title: "MATH 597: Measure Theory --- Supplementary Material"
---
# problem solving-III

> **Example**
>
> Let $f \in L_{loc}^{2}({\mathbb{R}})$.\
> Assume
>
> $$
> \left. \int_{a}^{a} \middle| t \middle| \middle| f(x + t) \middle| \, dt \geq \frac{2}{\sqrt{3}}a^{2} \right.
> $$
>
> for all $a > 0$, $x \in {\mathbb{R}}$.\
> Now show: $\left. |f(x) \middle| \geq 1 \right.$ for a.e. $x$.\

> **Proof**
>
> WLOG 可以假设 $f$ 是 nonneg 的. ($\left. f\mapsto \middle| f| \right.$).\
> WTS: $\left. |f(x) \middle| \geq 1 \right.$ for a.e. $x$.\
> Claim 1: by LDT, it STS:
>
> $$
> \frac{1}{2a}\int_{- a}^{a}f(x + t)\, dt \geq 1
> $$
>
> for all $x \in {\mathbb{R}}$.\
> 我们 try Cauchy Swartz:
>
> $$
> \left. \int_{- a}^{a} \middle| t \middle| f(x + t)\, dt \leq (\int_{- a}^{a}t^{2}\, dt)^{1/2}(\int_{- a}^{a}f(x + t)^{2}\, dt)^{1/2} \right.
> $$
>
> 我们知道: 左边 $\geq \frac{2}{\sqrt{3}}a^{2}$, 而右边第一项 $(\int_{- a}^{a}t^{2}\, dt)^{1/2}$ 是可以计算的: 等于 $(\frac{2a^{3}}{3})^{1/2}$.\
> 于是, 我们得到
>
> $$
> \int_{- a}^{a}f(x + t)^{2}\, dt \geq 2a
> $$
>
> 从而:
>
> $$
> \frac{1}{2a}\int_{- a}^{a}f(x + t)^{2}\, dt \geq 1
> $$
>
> 然后 by LDT:
>
> $$
> \frac{1}{2a}\int_{- a}^{a}f(x + t)^{2}\, dt = \frac{1}{2a}\int_{x - a}^{x + a}f(y)^{2}\, dy = f(x)^{2}
> $$
>
> for a.e. $x$. 因而
>
> $$
> f(x)^{2} \geq 1\,\quad\text{for a.e.}\ x
> $$
>
> 于是
>
> $$
> \left. |f(x) \middle| \geq 1\,\quad\text{for a.e.}\ x \right.
> $$

> **Example**
>
> Prove or disprove: 对于 bounded open set $E \subset {\mathbb{R}}$, 它的 boundary 是否一定满足 $m(\partial E) = 0$ ?\

> **Solution**
>
> Astonishingly 这个问题的回答是否定的. 我们可以构造

