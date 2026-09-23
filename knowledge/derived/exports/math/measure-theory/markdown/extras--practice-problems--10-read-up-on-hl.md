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
# Read up on HL

Let $f( \cdot )$ be a locally integrable function on ${\mathbb{R}}^{n}$ and $Mf$ the corresponding Hardy-Littlewood maximal function

$$
\left. Mf(x) = \sup\limits_{R > 0}\frac{1}{|B(x,R)|}\int_{B(x,R)} \middle| f(y) \middle| dy,\quad x \in {\mathbb{R}}^{n} \right.
$$

where $B(x,R)$ denotes the ball centered at $x$ with radius $R$. a) Show that if $f$ is integrable on ${\mathbb{R}}^{n}$ then $\sup_{\lambda > 0}\lambda m\left\{ x \in {\mathbb{R}}^{n}: \middle| \ f(x)\  \middle| > \lambda \right\} < \infty$. b) Let $f$ be the function

$$
f(x) = \left\{ \begin{matrix}
{1\ } & {\text{if}\left| x \middle| < 1 \right.} \\
{0\ } & {\text{if}\left| x \middle| \geq 1 \right.}
\end{matrix} \right.
$$

Show that $Mf$ is not integrable on ${\mathbb{R}}^{n}$, but $\sup_{\lambda > 0}\lambda m\left\{ {x \in {\mathbb{R}}^{n}:Mf(x) > \lambda} \right\} <$ $\infty$.

