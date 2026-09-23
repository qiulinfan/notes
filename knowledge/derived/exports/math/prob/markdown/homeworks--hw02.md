---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: Math 525
date: 2026
description: Complete migrated probability homework solutions.
keywords:
- probability
- homework
- worked solutions
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/prob/homeworks/hw02.typ"
subtitle: Typst-first worked solutions
title: "Math 525: Probability Homeworks"
---
# Homework 2

## Problem 1 {#problem-1-2}

Suppose that the cumulative distribution function (CDF) of a random variable $F:{\mathbb{R}}\rightarrow{\mathbb{R}}$ is strictly increasing and continuous. Let $U$ be a random variable with the uniform distribution on $(0,1)$ and define

$$
X := F^{- 1}(U)
$$

Show that $X$ has CDF equal to $F$. This exercise shows us how to construct a random variable with given distribution, assuming that we have a uniform random variable.

> **Proof**
>
> Since $F$ is strictly increasing and continuous, it has an inverse function $F^{- 1}$ on its range, and $F^{- 1}$ is also strictly increasing. Thus for any $x,y \in {\mathbb{R}}$,
>
> $$
> F^{- 1}(y) \leq x\Leftrightarrow y \leq (F^{- 1})^{- 1}(x) = F(x)
> $$
>
> Therefore for any $x \in {\mathbb{R}}$, we have
>
> $$
> \left\{ {x \mid X(x) \leq x} \right\} = \left\{ {x \mid F^{- 1}(U(x)) \leq x} \right\} = \left\{ {x \mid U(x) \leq F(x)} \right\}
> $$
>
> Therefore
>
> $$
> {\mathbb{P}}(X \leq x) = {\mathbb{P}}(U(x) \leq F(x))
> $$
>
> Since $U \sim Unif(0,1)$ and for a CDF we have $F(x) \in \lbrack 0,1\rbrack$, we get
>
> $$
> {\mathbb{P}}(U(x) \leq F(x)) = F(x)
> $$
>
> Thus for all $x$ ${\mathbb{P}}(X \leq x) = F(x)$, i.e., the CDF of $X$ equals $F$.

## Problem 2 {#problem-2-2}

A gas station fills its tank completely once a week. Let the weekly sales volume (in thousands of liters) be a random variable with density

$$
f(x) = \left\{ \begin{matrix}
{a(1 - x)^{4},} & {x \in (0,1),} \\
{0,} & \text{otherwise}
\end{matrix} \right.
$$

Find the constant $a$. What should be the tank capacity so that the probability of running out of fuel during a given week is $1/100$ ?

> **Solution**
>
> Since the density integrates to 1,
>
> $$
> 1 = \int_{- \infty}^{\infty}f(x)\, dx = \int_{0}^{1}a(1 - x)^{4}\, dx = a\int_{0}^{1}(1 - x)^{4}\, dx
> $$
>
> Let $u = 1 - x$, then
>
> $$
> \int_{0}^{1}(1 - x)^{4}dx = \int_{0}^{1}u^{4}du = \frac{1}{5}
> $$
>
> So $\frac{1}{5}a = 1$, which gives
>
> $$
> a = 5
> $$
>
> Now we look for the tank capacity $c$ such that ${\mathbb{P}}(X > c) = \frac{1}{100}$.\
> Let the tank capacity be $c$ (in thousands of liters). Running out of fuel in a week occurs when sales exceed $c$, i.e., the event $\left\{ {X > c} \right\}$. We need
>
> $$
> {\mathbb{P}}(X > c) = \frac{1}{100}
> $$
>
> Since $a = 5$,
>
> $$
> {\mathbb{P}}(X > c) = \int_{c}^{1}5(1 - x)^{4}\, dx
> $$
>
> Again let $u = 1 - x$, then we have
>
> $$
> \int_{c}^{1}5(1 - x)^{4}dx = 5\int_{1 - c}^{0}u^{4}( - du) = 5\int_{0}^{1 - c}u^{4}du = 5 \cdot \frac{(1 - c)^{5}}{5} = (1 - c)^{5}
> $$
>
> Therefore
>
> $$
> (1 - c)^{5} = \frac{1}{100}\Longrightarrow 1 - c = 100^{- 1/5} = 10^{- 2/5}\Longrightarrow c = 1 - 10^{- 2/5}
> $$
>
> So the tank capacity should be $1 - 10^{- 2/5}$ thousand liters.

## Problem 3 {#problem-3-2}

Let the random variable $X$ have density

$$
f_{X}(x) = \left\{ \begin{matrix}
{\frac{1}{2x^{2}},} & \left. |x \middle| \geq 1, \right. \\
{0,} & \left. |x \middle| < 1. \right.
\end{matrix} \right.
$$

Find the probability density function of $Y := X^{2}$ and compute the probability ${\mathbb{P}}(2Y + 3 \leq 10)$.

> **Solution**
>
> Since $f_{X}(x) = 0$ for $\left. |x \middle| < 1 \right.$, we have $\left. {\mathbb{P}}( \middle| X \middle| \geq 1) = 1 \right.$. Hence $Y = X^{2} \geq 1$ almost surely, so $F_{Y}(y) = 0$ for $y < 1$ and therefore $f_{Y}(y) = 0$ for $y < 1$ (a.e.).
>
> For $y \geq 1$,
>
> $$
> F_{Y}(y) = {\mathbb{P}}(X^{2} \leq y) = {\mathbb{P}}( - \sqrt{y} \leq X \leq \sqrt{y}) = \int_{- \sqrt{y}}^{- 1}\frac{1}{2x^{2}}\, dx + \int_{1}^{\sqrt{y}}\frac{1}{2x^{2}}\, dx
> $$
>
> Compute each integral:
>
> [∫1y12x2dx=12∫1yx−2dx=12−x−11y=12(1−1y)]{.math display="block"}
>
> and similarly $\int_{- \sqrt{y}}^{- 1}\frac{1}{2x^{2}}\, dx = \frac{1}{2}\left( {1 - \frac{1}{\sqrt{y}}} \right)$ since the function is even. Therefore, for $y \geq 1$,
>
> $$
> F_{Y}(y) = 1 - \frac{1}{\sqrt{y}}
> $$
>
> Combining both cases we have
>
> $$
> F_{Y}(y) = \left\{ \begin{matrix}
> {0,} & {y < 1,} \\
> {1 - \frac{1}{\sqrt{y}}} & {y \geq 1}
> \end{matrix} \right.
> $$
>
> Notice that on $y \geq 1$, $F_{Y}(y)$ is differentiable (except on $y = 1$):
>
> $$
> F_{Y}'(y) = \frac{d}{dy}\left( {1 - y^{- 1/2}} \right) = \frac{1}{2}\, y^{- 3/2}
> $$
>
> So consider the function
>
> $$
> g(y) = \left\{ \begin{matrix}
> {\frac{1}{2y^{3/2}},} & {y \geq 1,} \\
> {0,} & {y < 1.}
> \end{matrix} \right.
> $$
>
> Then for $x < 1$,
>
> $$
> \int_{- \infty}^{x}g(y)\, dy = 0 = F_{Y}(x)
> $$
>
> and for $x \geq 1$
>
> $$
> \int_{- \infty}^{x}g(y)\, dy = \int_{1}^{x}\frac{1}{2y^{3/2}}\, dy = \left\lbrack {- y^{- 1/2}} \right\rbrack_{1}^{x} = 1 - \frac{1}{\sqrt{x}} = F_{Y}(x)
> $$
>
> This shows that **$Y$ is absolutely continuous and $g$ is a probability density of $Y$**. Hence
>
> $$
> f_{Y}(y) = \left\{ \begin{matrix}
> {\frac{1}{2y^{3/2}},} & {y \geq 1,} \\
> {0,} & {y < 1}
> \end{matrix} \right.
> $$
>
> Now we compute ${\mathbb{P}}(2Y + 3 \leq 10)$.
>
> We have $2Y + 3 \leq 10\Leftrightarrow Y \leq \frac{7}{2}$. Thus
>
> $$
> {\mathbb{P}}(2Y + 3 \leq 10) = {\mathbb{P}}\left( {Y \leq \frac{7}{2}} \right) = F_{Y}\mspace{-18mu}\left( \frac{7}{2} \right) = 1 - \frac{1}{\sqrt{7/2}} = 1 - \sqrt{\frac{2}{7}}
> $$
>
> Thus,
>
> $$
> {\mathbb{P}}(2Y + 3 \leq 10) = 1 - \sqrt{\frac{2}{7}}
> $$

## Problem 4 {#problem-4-2}

Let the random variable $X$ have density $f$, which is symmetric about $\mu \in {\mathbb{R}}$, that is, $f(\mu + x) = f(\mu - x)$, for all $x \in {\mathbb{R}}$. Show that ${\mathbb{P}}(X \leq \mu) = {\mathbb{P}}(X \geq \mu)$. If in addition $\left. {\mathbb{E}} \middle| X \middle| < \infty \right.$, show that ${\mathbb{E}}(X) = \mu$. Can you use this observation if $X \sim N(0,1)$ ?

> **Proof**
>
> Since $X$ has density $f$,
>
> $$
> {\mathbb{P}}(X \leq \mu) = \int_{- \infty}^{\mu}f(t)\, dt
> $$
>
> Let $t = \mu - x$ so that $dt = - dx$. Then
>
> $$
> \int_{- \infty}^{\mu}f(t)\, dt = \int_{\infty}^{0}f(\mu - x)( - dx) = \int_{0}^{\infty}f(\mu - x)\, dx
> $$
>
> Similarly,
>
> $$
> {\mathbb{P}}(X \geq \mu) = \int_{\mu}^{\infty}f(t)\, dt = \int_{0}^{\infty}f(\mu + x)\, dx
> $$
>
> By symmetry $f(\mu - x) = f(\mu + x)$ for all $x$, hence the two integrals are equal, i.e. proved
>
> $$
> {\mathbb{P}}(X \leq \mu) = {\mathbb{P}}(X \geq \mu)
> $$
>
> If $\left. {\mathbb{E}} \middle| X \middle| < \infty \right.$, then ${\mathbb{E}}\lbrack X\rbrack = \mu$ for some $\mu \in {\mathbb{R}}$, We want to show that this $\mu$ is the same as the one in the symmetry condition. Consider ${\mathbb{E}}\lbrack X - \mu\rbrack$. Since $\left. {\mathbb{E}} \middle| X \middle| < \infty \right.$, we also have $\left. {\mathbb{E}} \middle| X - \mu \middle| < \infty \right.$, so the following integral is well-defined:
>
> $$
> {\mathbb{E}}\lbrack X - \mu\rbrack = \int_{- \infty}^{\infty}(t - \mu)f(t)\, dt
> $$
>
> Let $t = \mu + x$; then
>
> $$
> {\mathbb{E}}\lbrack X - \mu\rbrack = \int_{- \infty}^{\infty}x\, f(\mu + x)\, dx
> $$
>
> Define $g(x) := f(\mu + x)$. The symmetry condition $f(\mu + x) = f(\mu - x)$ implies that $g$ is an even function, thus $xg(x)$ is an odd function. Since $\left. \int \middle| x \middle| g(x)\, dx < \infty \right.$, we may integrate over symmetric limits to get
>
> $$
> \int_{- \infty}^{\infty}xg(x)\, dx = 0
> $$
>
> Therefore ${\mathbb{E}}\lbrack X - \mu\rbrack = 0$, thus
>
> $$
> {\mathbb{E}}\lbrack X\rbrack = \mu
> $$
>
> Application to $X \sim N(0,1)$: Since the standard normal density $\varphi(x) = \frac{1}{\sqrt{2\pi}}e^{- x^{2}/2}$ satisfies $\varphi(0 + x) = \varphi(0 - x)$, so it is symmetric about $\mu = 0$. Hence
>
> $$
> {\mathbb{P}}(X \leq 0) = {\mathbb{P}}(X \geq 0) = \frac{1}{2}\quad\text{and}\quad{\mathbb{E}}\lbrack X\rbrack = 0
> $$

## Problem 5 {#problem-5-2}

An airline has observed that $5\%$ of ticket holders do not show up for their flight. Today's flight has an airplane with 200 seats, and the airline has sold 203 tickets. What is the probability that the airline will not be able to accommodate a ticketed passenger? Assume that, for each passenger $i$, the event $A_{i}$ that passenger $i$ shows up is independent of all others, for $1 \leq i \leq 203$.

> **Solution**
>
> Let $S$ be the number of passengers who show up. The condition indicates that $S$ is a binomial random variable with parameters $n = 203$ and $p = 0.95$:
>
> $$
> S \sim Binomial(n = 203,p = 0.95)
> $$
>
> The airline cannot accommodate everyone exactly when more than 200 passengers show up, i.e.
>
> $$
> {\mathbb{P}}(\text{cannot accommodate}) = {\mathbb{P}}(S \geq 201) = \sum\limits_{k = 201}^{203}\left( \frac{203}{k} \right)(0.95)^{k}(0.05)^{203 - k}
> $$
>
> Equivalently, letting $N := 203 - S$ be the number of no-shows, we have $N \sim Binomial(203,0.05)$ and
>
> $$
> {\mathbb{P}}(S \geq 201) = {\mathbb{P}}(N \leq 2) = \sum\limits_{j = 0}^{2}\left( \frac{203}{j} \right)(0.05)^{j}(0.95)^{203 - j}
> $$
>
> Numerically we can calculate
>
> $$
> {\mathbb{P}}(\text{cannot accommodate}) \approx 0.206\%
> $$

## Problem 6 {#problem-6-2}

Consider a sequence of tosses of a fair die. We continue tossing until both outcomes 3 and 4 have appeared at least once. For example, one possible sequence of results is

$$
5,1,1,4,6,5,4,2,6,3,
$$

and we then stop. Let $X$ be the number of tosses required (in this example, $X = 10$ ). What is the expected value of the random variable $X$ ?

> **Solution**
>
> We can decompose the waiting time into two stages.
>
> Stage 1: wait until the first time we see either 3 or 4: On each toss, the probability to get a 3 or 4 is $2/6 = 1/3$. Hence the number of tosses $T_{1}$ until the first occurrence of $\left\{ {3,4} \right\}$ is geometric with success probability $1/3$, so
>
> $$
> {\mathbb{E}}\lbrack T_{1}\rbrack = \frac{1}{1/3} = 3
> $$
>
> Stage 2: after seeing one of them, wait until we see the other: Once 3 has appeared, each subsequent toss produces a 4 with probability $1/6$; otherwise we are still missing a 4. Thus the additional waiting time $T_{2}$ is geometric with success probability $1/6$, so
>
> $$
> {\mathbb{E}}\lbrack T_{2}\rbrack = \frac{1}{1/6} = 6
> $$
>
> Since $X = T_{1} + T_{2}$, by linearity of expectation we get
>
> $$
> {\mathbb{E}}\lbrack X\rbrack = {\mathbb{E}}\lbrack T_{1}\rbrack + {\mathbb{E}}\lbrack T_{2}\rbrack = 3 + 6 = 9
> $$

