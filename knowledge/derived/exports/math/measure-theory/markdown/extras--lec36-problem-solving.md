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
source: "notes/math/measure-theory/extras/lec36-problem-solving.typ"
subtitle: Homework 0, problem-solving lectures, and practice problems
title: "MATH 597: Measure Theory --- Supplementary Material"
---
# Problem solving

Recall: Given mspace $(X,\mathcal{A},\mu)$ 以及 $f:X\rightarrow{\mathbb{C}}$ mble, 我们可以 define distribution function:

$$
\lambda_{f}:(0,\infty)\rightarrow\lbrack 0,\infty\rbrack
$$

by

$$
\lambda_{f}(\alpha) = \mu(\left\{ |f \middle| > \alpha \right\})
$$

Chebyshevs ineq:

$$
\lambda_{f}(\alpha) \leq (\frac{\parallel f\underset{p}{\parallel}}{\alpha})^{p}
$$

for $0 < p < \infty$.\
Today: Problem Solving

> **Proposition**
>
> 对于任意 $0 < p < \infty$, 我们有:
>
> $$
> \left. \int_{X} \middle| f \middle| {}_{p}\, d\mu = \int_{0}^{\infty}p\alpha^{p - 1}\lambda_{f}(\alpha)\, d\alpha \right.
> $$

左边是 integral on $X$, 右边是 integral on $\mathbb{R}$.

> **Proof**
>
> Sketch: Step 1: $f$ simple $\Longrightarrow$ $|f|$ simple.\

Write

$$
\left. |f \middle| = \sum\limits_{j = 1}^{N}c_{j}\chi_{A_{j}} \right.
$$

where $A_{j}$ disjoint, $c_{1} > c_{2} > \cdots > c_{N} > 0$ This implies:

$$
\left. \int \middle| f \middle| {}_{p}\, d\mu = \sum\limits_{j = 1}^{N}c_{j}^{p}r_{j},\quad r_{j} = \mu(A_{j}) \right.
$$

Then

$$
\lambda_{f}(\alpha) = \left\{ \begin{matrix}
{\sum_{j = 1}^{N}r_{j},} & {0 < \alpha < c_{N}} \\
{\sum_{j = 1}^{n - 1}r_{j},} & {c_{n} \leq \alpha < c_{n - 1},2 \leq n \leq N} \\
{0,} & {\alpha \geq c_{1}}
\end{matrix} \right.
$$

从而

$$
\begin{matrix}
{\int_{0}^{\infty}p\alpha^{p - 1}\lambda_{f}(\alpha)d\alpha} & {= (\sum\limits_{j = 1}^{N}r_{j})\int_{0}^{c_{N}}p\alpha^{p - 1}d\alpha + \sum\limits_{n = 2}^{N}(\sum\limits_{j = 1}^{n - 1}r_{j})\int_{c_{n}}^{c_{n - 1}}p\alpha^{p - 1}\, d\alpha} \\
 & =
\end{matrix}
$$

Step 2: $f$ general.\
Use: $\exists$ simple functions $g_{n} \geq 0$ s.t. $\left. g_{n}\operatorname{\nearrow ︎} \middle| f| \right.$.\
MCT $\Longrightarrow$

$$
\left. \int_{X} \middle| f \middle| {}_{p}\, d\mu = \lim\limits_{n\rightarrow\infty}\int_{X}g_{n}^{p}\, d\mu \right.
$$

Also,

$$
\lambda_{g_{n}}\operatorname{\nearrow ︎}\limits^{\text{CFB}}\lambda_{f}\quad\text{pointwisely on}(0,\infty)
$$

从而 MCT $\Longrightarrow$

$$
\lim\limits_{n\rightarrow\infty}\int_{0}^{\infty}p\alpha^{p - 1}\lambda_{g_{n}}(\alpha)\, d\alpha\rightarrow\int_{0}^{\infty}p\alpha^{p - 1}\lambda_{f}(\alpha)\, d\alpha
$$

$\lambda_{f}(\alpha) = \mu(\left\{ |f \middle| > \alpha \right\})$, 以及 $\left\{ |f \middle| > \alpha \right\} = \bigcup_{1}^{\infty}\left\{ {g_{n} > \alpha} \right\}$ increasing union.

> **Example**
>
> Let $f:\lbrack 0,1\rbrack\rightarrow{\mathbb{R}}$ be abs ctn. Suppose $f(0) = 0$ 以及 $f^{1} \in L^{2}(\lbrack 0,1\rbrack)$.\
> Show that the limit
>
> $$
> \lim\limits_{x\rightarrow 0^{+}}x^{- 1/2}f(x)
> $$
>
> exists, 并 compute it.\
> What could the limit be? Must be $0$.\

> **Solution**
>
> Use FTOC, can recover $f$ from $f'$.\
>
> $$
> f(x) = f(0) + \int_{0}^{x}f'(t)\, dt,\quad 0 \leq x \leq 1
> $$
>
> 使用 Hölder with $p = q = 2$ (Cauchy-Swartz):
>
> $$
> \left. |f(x) \middle| \leq \int_{0}^{x} \middle| f'(t) \middle| \, dt = \int_{0}^{x} \middle| f'(t) \middle| 1\, dt \leq (\int_{0}^{x} \middle| f'(t) \middle| {}_{2})^{\frac{1}{2}}x^{\frac{1}{2}} \right.
> $$
>
> 从而
>
> $$
> \left. x^{- 1/2} \middle| f(x) \middle| \leq \int_{0}^{x} \middle| f'(t) \middle| {}_{2}\, dt \right.
> $$
>
> Use fact: $g = L^{1}(X,\mathcal{A},\mu)\Longrightarrow\forall\epsilon > 0,\exists\delta > 0$ s.t. for all $\mu(E) < \delta$ we have $\left. \int_{E} \middle| g \middle| \, d\mu < \epsilon \right.$.\
> (Proof of this fact: use approx by simple functions 可得).\
> 然后 use approx by simple functions, apply to $\left. g = \middle| f'|^{2} \right.$, $\mu = m$, $E = \lbrack 0,x\rbrack$, 于是得到
>
> $$
> \left. \int_{0}^{x} \middle| f'(t) \middle| {}_{2}dt\overset{x\rightarrow 0}{\rightarrow}0 \right.
> $$

> **Example**
>
> Let $f:{\mathbb{R}}^{n}\rightarrow{\mathbb{R}}$ be a function.\
> Assume: 对于 $\forall\epsilon > 0$, 都存在 Lebesgue mble functions $g,h \in L^{1}(m)$ s.t.
>
> $$
> g(x) \leq f(x) \leq h(x)\quad\forall x \in {\mathbb{R}}^{n}
> $$
>
> 并且
>
> $$
> \int_{{\mathbb{R}}^{n}}(h - g)\, dm < \epsilon
> $$
>
> Prove that: $f$ 也是 Lebesgue mble 的, 并且 $f \in L^{1}(m)$.\

> **Proof**
>
> By assumption: Given $k \in {\mathbb{N}}$, 存在 $g_{k},h_{k} \in L^{1}({\mathbb{R}}^{n})$ s.t.
>
> $$
> g_{k} \leq f \leq h_{k},\quad\int(h_{k} - g_{k}) < \frac{1}{k}
> $$
>
> Idea: $f = \operatorname{lim\, sup}g_{k} = \operatorname{lim\, inf}h_{k}$ ?\
> 我们应该 try to prove: for a.e. $x$ 都有 $0 \leq h_{k}(x) - g_{k}(x)\rightarrow 0$.\
> Use Fatou's Lemma:
>
> $$
> \int\operatorname{lim\, inf}\limits_{k\rightarrow\infty}(h_{k} - g_{k}) \leq \operatorname{lim\, inf}\limits_{k\rightarrow\infty}\int(h_{k} - g_{k}) = 0
> $$
>
> 而 $h_{k} - g_{k} \geq 0$, 因而 This means:
>
> $$
> \operatorname{lim\, inf}\limits_{k\rightarrow\infty}(h_{k} - g_{k}) = 0\quad\text{for a.e.}\ x
> $$
>
> 且我们知道
>
> $$
> \operatorname{lim\, inf}\limits_{k\rightarrow\infty}(h_{k} - f) \leq \operatorname{lim\, inf}\limits_{k\rightarrow\infty}(h_{k} - g_{k}) = 0\quad\text{for a.e.}\ x
> $$
>
> 从而
>
> $$
> f(x) = \operatorname{lim\, inf}\limits_{k\rightarrow\infty}h_{k}(x)\quad\text{for a.e.}\ x
> $$
>
> This proves that, $f$ is Lebesgue measurable.

> **Example**
>
> Prove that:
>
> $$
> \lim\limits_{n\rightarrow\infty}\int_{E}\sin(nx)\, dx = 0
> $$
>
> for every bounded Borel set $E \subset {\mathbb{R}}$.\

> **Proof**
>
> Step 1: $E = (a,b)$ 是一个 interval.\
>
> $$
> \int_{E}\sin(nx)\, dx = \lbrack - \frac{1}{n}\cos(nx)\rbrack_{a}^{b}
> $$
>
> 从而
>
> $$
> \left. |\int_{E}\sin(nx)\, dx\  \middle| \leq \frac{2}{n}\overset{n\rightarrow\infty}{\rightarrow}0 \right.
> $$
>
> Step 2: $E$ 是一个 finite union of disjoint open intervals.\
> Same as Step 1.\
> Step 3: General Case.\
> Fix $\epsilon > 0$.\
> Then by outer regularity: 存在 some $U$ 为 finite disjoint union of open intervals, 使得
>
> $$
> m(U\Delta E) < \epsilon
> $$
>
> 从而
>
> $$
> \left. |\int_{E}f_{n} = \int_{U}f_{n}\  \middle| < \middle| \int_{U\Delta E}f_{n}\  \middle| \leq m(U\Delta E) < \epsilon \right.
> $$
>
> 因而
>
> $$
> \left. |\int_{E}f_{n}\  \middle| < \middle| \int_{U}f_{n}\  \middle| + \epsilon \right.
> $$
>
> for all $n$. 并且 By step 2:
>
> $$
> \left. \operatorname{lim\, sup}\limits_{n\rightarrow\infty} \middle| \int_{U}f_{n}\  \middle| + \epsilon = 0 + \epsilon \right.
> $$
>
> 因而
>
> $$
> \left. \operatorname{lim\, sup}\limits_{n\rightarrow\infty} \middle| \int_{E}f_{n}\  \middle| \leq \epsilon \right.
> $$
>
> Since $\epsilon$ arbitrary, 得证.

> **Example**
>
> Let $E \subset {\mathbb{R}}$ be a Borel set, with $m(E) > 0$.\
> Set $f:{\mathbb{R}}\rightarrow{\mathbb{R}}$ be mble, nonneg, 并且 $\int f > 0$.\
> Prove that: 存在 $t \in {\mathbb{R}}$ s.t.
>
> $$
> \int_{E + t}f > 0
> $$

> **Proof**
>
> **Claim 1: STS to assume $f$ simple.**\
> Proof of Claim 1: 对于 $f$, can find seq of simple functions $0 \leq f_{n} \leq f$, s.t. $f_{n}\operatorname{\nearrow ︎}f$.\
> By MCT,

