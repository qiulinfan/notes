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
source: "notes/math/prob/homeworks/hw04.typ"
subtitle: Typst-first worked solutions
title: "Math 525: Probability Homeworks"
---
# Homework 4

## Problem 1 {#problem-1-4}

Let $X$ be a random variable with values in $\lbrack 0, + \infty\rbrack$ such that ${\mathbb{E}}\lbrack X\rbrack = 0$. Explain why $X < \infty$ almost surely and show that $X = 0$ almost surely.

> **Proof**
>
> Since $X \geq 0$ and ${\mathbb{E}}\lbrack X\rbrack = 0 < \infty$, by Markov's inequality, for any $t > 0$,
>
> $$
> {\mathbb{P}}(X \geq t) \leq \frac{{\mathbb{E}}\lbrack X\rbrack}{t} = 0
> $$
>
> Hence ${\mathbb{P}}(X \geq t) = 0$ for all $t > 0$. In particular,
>
> $$
> {\mathbb{P}}(X = + \infty) = \lim\limits_{t\rightarrow + \infty}{\mathbb{P}}(X \geq t) = \lim\limits_{t\rightarrow + \infty}0 = 0
> $$
>
> that is, $X < \infty$ almost surely.
>
> Also notice that
>
> $$
> \left\{ {X > 0} \right\} = \bigcup\limits_{n = 1}^{\infty}\left\{ {X \geq \frac{1}{n}} \right\}
> $$
>
> and by countable subadditivity,
>
> $$
> {\mathbb{P}}(X > 0) \leq \sum\limits_{n = 1}^{\infty}{\mathbb{P}}\left( {X \geq \frac{1}{n}} \right) = 0
> $$
>
> Thus ${\mathbb{P}}(X > 0) = 0$. And since $X$ takes values in $\lbrack 0, + \infty\rbrack$, we have
>
> $$
> {\mathbb{P}}(\left\{ {X = 0} \right\}) = {\mathbb{P}}(\left\{ {X \leq 0} \right\}) = 1 - {\mathbb{P}}(\left\{ {X > 0} \right\}) = 1
> $$
>
> , and
>
> This finishes the proof that $X < \infty$ a.s. and $X = 0$ a.s.

## Problem 2 {#problem-2-4}

Let $X$ be a random variable with ${\mathbb{E}}\lbrack X\rbrack = 3$ and ${\mathbb{E}}\lbrack X^{2}\rbrack = 13$. Show that:

$$
{\mathbb{P}}( - 2 \leq X \leq 8) \geq \frac{21}{25}
$$

> **Solution**
>
> Compute the variance of $X$:
>
> $$
> Var(X) = {\mathbb{E}}\lbrack X^{2}\rbrack - ({\mathbb{E}}\lbrack X\rbrack)^{2} = 13 - 3^{2} = 4
> $$
>
> Observe that
>
> $$
> \left. {\mathbb{P}}( - 2 \leq X \leq 8) = {\mathbb{P}}( \middle| X - 3 \middle| \leq 5) \right.
> $$
>
> By Chebyshev's inequality,
>
> $$
> \left. {\mathbb{P}}( \middle| X - 3 \middle| \geq 5) \leq \frac{Var(X)}{5^{2}} = \frac{4}{25} \right.
> $$
>
> Therefore,
>
> $$
> \left. {\mathbb{P}}( \middle| X - 3 \middle| \leq 5) = 1 - {\mathbb{P}}( \middle| X - 3 \middle| \geq 5) \geq 1 - \frac{4}{25} = \frac{21}{25} \right.
> $$
>
> Thus,
>
> $$
> {\mathbb{P}}( - 2 \leq X \leq 8) \geq \frac{21}{25}
> $$

## Problem 3 {#problem-3-4}

Let $X,Y$ be two random variables such that ${\mathbb{P}}(Y = 1) = 1/5,{\mathbb{P}}(Y = 2) = 3/5$ and ${\mathbb{P}}(Y = 3) = 1/5$. In addition

$$
\left. X \middle| \left\{ {Y = 1} \right\} \sim \text{Exp}(2),X \middle| \left\{ {Y = 2} \right\} \sim \text{Exp}(3)\text{and}\ X \mid \left\{ {Y = 3} \right\} = 7. \right.
$$

Compute the moment generating function of $X$.

> **Solution**
>
> Compute each conditional moment generating function:
>
> For $X \mid \left\{ {Y = 1} \right\} \sim \text{Exp}(2)$
>
> $$
> {\mathbb{E}}\lbrack e^{tX} \mid Y = 1\rbrack = \frac{2}{2 - t},\quad t < 2
> $$
>
> For $X \mid \left\{ {Y = 2} \right\} \sim \text{Exp}(3)$
>
> $$
> {\mathbb{E}}\lbrack e^{tX} \mid Y = 2\rbrack = \frac{3}{3 - t},\quad t < 3
> $$
>
> For $X \mid \left\{ {Y = 3} \right\} = 7$,
>
> $$
> {\mathbb{E}}\lbrack e^{tX} \mid Y = 3\rbrack = e^{7t}
> $$
>
> Then we use the law of total expectation conditioning on $Y$: for any $t$ such that the expectations below are finite, we have
>
> $$
> \begin{matrix}
> {M_{X}(t) = {\mathbb{E}}\lbrack e^{tX}\rbrack} & {= \sum\limits_{y = 1}^{3}{\mathbb{E}}\lbrack e^{tX} \mid Y = y\rbrack{\mathbb{P}}(Y = y)} \\
>  & {= \frac{1}{5} \cdot \frac{2}{2 - t} + \frac{3}{5} \cdot \frac{3}{3 - t} + \frac{1}{5}e^{7t}} \\
>  & {= \frac{2}{5(2 - t)} + \frac{9}{5(3 - t)} + \frac{1}{5}e^{7t},\quad t < 2}
> \end{matrix}
> $$
>
> So the moment generating function of $X$ is
>
> $$
> M_{X}(t) = \frac{2}{5(2 - t)} + \frac{9}{5(3 - t)} + \frac{1}{5}e^{7t},\quad t < 2
> $$

## Problem 4 {#problem-4-4}

For any $n \in {\mathbb{N}}$ with $n \geq 1$ we set $a_{n} = 1/\left( {2n^{2}} \right)$. Consider the sequence of random variables $\left( X_{n} \right)_{n \in {\mathbb{N}}}$ with

$$
X_{n} = \left\{ \begin{matrix}
{0,} & {\text{with probability}\ a_{n}} \\
{1,} & {\text{with probability}\ 1 - 2a_{n}} \\
{n^{2},} & {\text{with probability}\ a_{n}}
\end{matrix} \right.
$$

Check if $\left( X_{n} \right)$ converges in probability and if $\left( X_{n} \right)$ converges in $L^{1}$.

> **Solution**
>
> We first show that $X_{n}\rightarrow 1$ in probability.
>
> Let $\varepsilon > 0$.\
> For $n$ large enough s.t. $n^{2} - 1 > \varepsilon$, $\left. |X_{n} - 1 \middle| > \varepsilon \right.$ iff $X_{n} = 0$ or $X_{n} = n^{2}$. Therefore,
>
> $$
> \left. {\mathbb{P}}( \middle| X_{n} - 1 \middle| > \varepsilon) = {\mathbb{P}}(X_{n} = 0) + {\mathbb{P}}(X_{n} = n^{2}) = a_{n} + a_{n} = 2a_{n} = \frac{1}{n^{2}} \right.
> $$
>
> Since $\frac{1}{n^{2}}\rightarrow 0$, we have:
>
> $$
> \left. \lim\limits_{n\rightarrow\infty}\ {\mathbb{P}}( \middle| X_{n} - 1 \middle| > \varepsilon) = 0 \right.
> $$
>
> Since $\varepsilon > 0$ is arbitrary, we conclude that
>
> $$
> X_{n}\overset{\mathbb{P}}{\rightarrow}1
> $$
>
> We then show that $X_{n}$ does not converge to $1$ in $L^{1}$.
>
> We compute
>
> $$
> \begin{matrix}
> \left. {\mathbb{E}}\lbrack \middle| X_{n} - 1 \middle| \rbrack \right. & \left. = \middle| 0 - 1 \middle| a_{n} + \middle| 1 - 1 \middle| (1 - 2a_{n}) + \middle| n^{2} - 1 \middle| a_{n} \right. \\
>  & {= a_{n} + (n^{2} - 1)a_{n}} \\
>  & {= n^{2}a_{n} = \frac{1}{2}\operatorname{\rightarrow\not{}}0}
> \end{matrix}
> $$
>
> Hence \$\$X_n \\not\\xrightarrow{L\^1} 1\$\$

## Problem 5 {#problem-5-4}

Let $X$ and $Y$ be independent random variables with densities

$$
\begin{matrix}
{f_{X}(x) = \{ 2x,} & {0 \leq x \leq 1,} \\
{0,} & {\text{otherwise}\quad f_{Y}(y) = \left\{ \begin{matrix}
{1/2,} & {0 \leq y \leq 2} \\
{0,} & \text{otherwise}
\end{matrix} \right.}
\end{matrix}
$$

Find the distribution function of the sum $Z = X + Y$.

> **Solution**
>
> Since $X$ and $Y$ are independent, the density of $Z = X + Y$ is given by convolution:
>
> $$
> f_{Z}(z) = \int_{- \infty}^{\infty}f_{X}(x)f_{Y}(z - x)\, dx
> $$
>
> where we know
>
> $$
> f_{X}(x) = 2x\mathbf{1}_{\lbrack 0,1\rbrack}(x),\quad f_{Y}(y) = \frac{1}{2}\mathbf{1}_{\lbrack 0,2\rbrack}(y)
> $$
>
> Thus
>
> $$
> \begin{matrix}
> {f_{Z}(z)} & {= \int_{- \infty}^{\infty}2x \cdot \frac{1}{2}\mathbf{1}_{\lbrack 0,1\rbrack}(x)\mathbf{1}_{\lbrack 0,2\rbrack}(z - x)\, dx} \\
>  & {= \int_{- \infty}^{\infty}x\ \ \mathbf{1}_{\lbrack 0,1\rbrack}(x)\ \ \mathbf{1}_{\lbrack 0,2\rbrack}(z - x)\, dx} \\
>  & {= \int_{\max(0,z - 2)}^{\min(1,z)}x\, dx}
> \end{matrix}
> $$
>
> Compute this piecewise: If $0 \leq z \leq 1$, then the interval is $\lbrack 0,z\rbrack$, so
>
> $$
> f_{Z}(z) = \int_{0}^{z}x\, dx = \frac{z^{2}}{2}
> $$
>
> If $1 \leq z \leq 2$, then the interval is $\lbrack 0,1\rbrack$, so
>
> $$
> f_{Z}(z) = \int_{0}^{1}x\, dx = \frac{1}{2}
> $$
>
> If $2 \leq z \leq 3$, then the interval is $\lbrack z - 2,1\rbrack$, so
>
> $$
> f_{Z}(z) = \int_{z - 2}^{1}x\, dx = \frac{1 - (z - 2)^{2}}{2}
> $$
>
> Outside $\lbrack 0,3\rbrack$, clearly $f_{Z}(z) = 0$. Therefore,
>
> $$
> f_{Z}(z) = \left\{ \begin{matrix}
> {0,} & {z < 0,} \\
> {\frac{z^{2}}{2},} & {0 \leq z \leq 1,} \\
> {\frac{1}{2},} & {1 \leq z \leq 2,} \\
> {\frac{1 - (z - 2)^{2}}{2},} & {2 \leq z \leq 3,} \\
> {0,} & {z > 3}
> \end{matrix} \right.
> $$
>
> Now we integrate to get the cdf. For $z < 0$, $F_{Z}(z) = 0$.
>
> For $0 \leq z \leq 1$,
>
> $$
> F_{Z}(z) = \int_{0}^{z}\frac{t^{2}}{2}\, dt = \frac{z^{3}}{6}
> $$
>
> For $1 \leq z \leq 2$,
>
> $$
> F_{Z}(z) = F_{Z}(1) + \int_{1}^{z}\frac{1}{2}\, dt = \frac{1}{6} + \frac{z - 1}{2} = \frac{z}{2} - \frac{1}{3}
> $$
>
> For $2 \leq z \leq 3$,
>
> $$
> F_{Z}(z) = F_{Z}(2) + \int_{2}^{z}\frac{1 - (t - 2)^{2}}{2}\, dt = \frac{2}{3} + \frac{z - 2}{2} - \frac{(z - 2)^{3}}{6}
> $$
>
> And for $z \geq 3$, $F_{Z}(z) = 1$.
>
> Hence the cdf of $Z = X + Y$ is
>
> $$
> F_{Z}(z) = \left\{ \begin{matrix}
> {0,} & {z < 0,} \\
> {\frac{z^{3}}{6},} & {0 \leq z \leq 1,} \\
> {\frac{z}{2} - \frac{1}{3},} & {1 \leq z \leq 2,} \\
> {\frac{2}{3} + \frac{z - 2}{2} - \frac{(z - 2)^{3}}{6},} & {2 \leq z \leq 3,} \\
> {1,} & {z \geq 3}
> \end{matrix} \right.
> $$

## Problem 6 {#problem-6-4}

Let $a_{1},a_{2},\ldots,a_{n}$ and $\lambda$ be positive constants and let $\left\{ {X_{i}:1 \leq i \leq n} \right\}$ be independent random variables with

$$
X_{i} \sim \Gamma\left( {a_{i},\lambda} \right),\quad i = 1,2,\ldots,n
$$

(i.e., with the same second parameter $\lambda$ ). Show that $X_{1} + X_{2} + \cdots + X_{n} \sim \Gamma(a,\lambda)$, with $a = \sum_{i = 1}^{n}a_{i}$.

> **Proof**
>
> Let
>
> $$
> S_{n} := X_{1} + X_{2} + \cdots + X_{n},\quad a = \sum\limits_{i = 1}^{n}a_{i}
> $$
>
> We need to show that $S_{n} \sim \Gamma(a,\lambda)$.
>
> Since $X_{i} \sim \Gamma(a_{i},\lambda)$, its moment generating function is
>
> $$
> M_{X_{i}}(t) = {\mathbb{E}}\lbrack e^{tX_{i}}\rbrack = \left( \frac{\lambda}{\lambda - t} \right)^{a_{i}},\quad t < \lambda
> $$
>
> Since $X_{1},\ldots,X_{n}$ are independent, the moment generating function of $S_{n}$ is
>
> $$
> M_{S_{n}}(t) = {\mathbb{E}}\lbrack e^{t(X_{1} + \cdots + X_{n})}\rbrack = \prod\limits_{i = 1}^{n}{\mathbb{E}}\lbrack e^{tX_{i}}\rbrack = \prod\limits_{i = 1}^{n}M_{X_{i}}(t)
> $$
>
> Therefore,
>
> $$
> M_{S_{n}}(t) = \prod\limits_{i = 1}^{n}\left( \frac{\lambda}{\lambda - t} \right)^{a_{i}} = \left( \frac{\lambda}{\lambda - t} \right)^{\sum_{i = 1}^{n}a_{i}} = \left( \frac{\lambda}{\lambda - t} \right)^{a},\quad t < \lambda
> $$
>
> Note this is exactly the moment generating function of a $\Gamma(a,\lambda)$ random variable. Hence,
>
> $$
> S_{n} = X_{1} + \cdots + X_{n} \sim \Gamma(a,\lambda),\quad a = \sum\limits_{i = 1}^{n}a_{i}
> $$

