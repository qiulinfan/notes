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
source: "notes/math/prob/homeworks/hw03.typ"
subtitle: Typst-first worked solutions
title: "Math 525: Probability Homeworks"
---
# Homework 3

## Problem 1 {#problem-1-3}

Let $Z$ be a standard normal random variable $Z \sim N(0,1)$. We denote by $\Phi$ its distribution function. Answer the questions below

- If $a,b \in {\mathbb{R}}$ with $a > 0$, show that the random variable $aZ + b$ is also normal and find its mean and variance.

- Show that $\Phi(0) = 1/2$.

- Show that $\Phi( - x) = 1 - \Phi(x)$ for any $x \in {\mathbb{R}}$.

> **Solution**
>
> - $Z \sim N(0,1)$ has density
>
>   $$
>   f_{Z}(z) = \frac{1}{\sqrt{2\pi}}e^{- z^{2}/2}
>   $$
>   $$
>   \begin{matrix}
>   {F_{X}(x) = {\mathbb{P}}(X \leq x)} & {= {\mathbb{P}}(aZ + b \leq x)} \\
>    & {= {\mathbb{P}}\left( {Z \leq \frac{x - b}{a}} \right)} \\
>    & {= \Phi\left( \frac{x - b}{a} \right)}
>   \end{matrix}
>   $$
>
>   Thus
>
>   $$
>   f_{X}(x) = \frac{d}{dx}\Phi\left( \frac{x - b}{a} \right) = \frac{1}{a}\varphi\left( \frac{x - b}{a} \right) = \frac{1}{\sqrt{a^{22}\pi}}e^{- \frac{(x - b)^{2}}{2a^{2}}}
>   $$
>
>   Note this is the density of a normal distribution with mean $b$ and variance $a^{2}$. Therefore
>
>   $$
>   aZ + b \sim N(b,a^{2})
>   $$
>
>   Since $Z$ has mean $0$ and variance $1$, use linearity we have
>
>   $$
>   {\mathbb{E}}\lbrack aZ + b\rbrack = a{\mathbb{E}}\lbrack Z\rbrack + b = b
>   $$
>
>   and
>
>   $$
>   Var(aZ + b) = a^{2}Var(Z) = a^{2}
>   $$
>
> - Note the standard normal density is an even function:
>
>   $$
>   \varphi(x) = \frac{1}{\sqrt{2\pi}}e^{- x^{2}/2} = \varphi( - x)
>   $$
>
>   Thus
>
>   $$
>   \Phi(0) = \int_{- \infty}^{0}\varphi(x)\, dx = \int_{0}^{\infty}\varphi(x)\, dx
>   $$
>
>   Since $\int_{- \infty}^{\infty}\varphi(x)\, dx = 1$, the two equal halves are each $1/2$, so $\Phi(0) = 1/2$.
>
> - For any $x \in {\mathbb{R}}$,
>
>   $$
>   \Phi( - x) = \int_{- \infty}^{- x}\varphi(t)\, dt
>   $$
>
>   Let $u = - t$, using $\varphi( - u) = \varphi(u)$ we have
>
>   $$
>   \Phi( - x) = \int_{\infty}^{x}\varphi( - u)( - du) = \int_{x}^{\infty}\varphi(u)\, du = 1 - \int_{- \infty}^{x}\varphi(u)\, du = 1 - \Phi(x)
>   $$

## Problem 2 {#problem-2-3}

Let $X$ and $Y$ be random variables with joint density

$$
f(x,y) = \left\{ \begin{matrix}
{- xy,} & {(x,y) \in ( - 1,0) \times (0,1) \cup (1,2) \times ( - 1,0),} \\
{0,} & \text{otherwise}
\end{matrix} \right.
$$

- Compute the probability ${\mathbb{P}}(X + Y < 0)$.

- Compute the expected value ${\mathbb{E}}\lbrack XY\rbrack$.

- Are $X$ and $Y$ independent?

> **Solution**
>
> - On $(1,2) \times ( - 1,0)$ we have $x + y > 0$ since $x > 1$ and $y > - 1$, hence this region contributes nothing to $\left\{ {X + Y < 0} \right\}$.
>
>   On $( - 1,0) \times (0,1)$, the ineq $x + y < 0$ is equivalent to $0 < y < - x$. Therefore,
>
>   $$
>   {\mathbb{P}}(X + Y < 0) = \int_{- 1}^{0}\int_{0}^{- x}( - xy)\, dy\, dx
>   $$
>
>   Compute the inner integral:
>
>   $$
>   \int_{0}^{- x}( - xy)\, dy = - x \cdot \frac{( - x)^{2}}{2} = - \frac{x^{3}}{2}
>   $$
>
>   Hence,
>
>   [ℙ(X+Y\<0)=∫−10(−x32)dx=−12⋅x44−10=18]{.math display="block"}
>
> - By def,
>
>   $$
>   \begin{matrix}
>   {{\mathbb{E}}\lbrack XY\rbrack} & {= \int_{{\mathbb{R}}^{2}}xy\, f(x,y)\, dx\, dy} \\
>    & {= - \int_{( - 1,0) \times (0,1) \cup (1,2) \times ( - 1,0)}x^{2}y^{2}\, dx\, dy} \\
>    & {= - \int_{- 1}^{0}\int_{0}^{1}x^{2}y^{2}\, dy\, dx - \int_{1}^{2}\int_{- 1}^{0}x^{2}y^{2}\, dy\, dx}
>   \end{matrix}
>   $$
>
>   Split over the two rectangles. On $( - 1,0) \times (0,1)$,
>
>   $$
>   - \int_{- 1}^{0}\int_{0}^{1}x^{2}y^{2}\, dy\, dx = - \left( {\int_{- 1}^{0}x^{2}\, dx} \right)\left( {\int_{0}^{1}y^{2}\, dy} \right) = - \left( \frac{1}{3} \right)\left( \frac{1}{3} \right) = - \frac{1}{9}
>   $$
>
>   On $(1,2) \times ( - 1,0)$,
>
>   $$
>   - \int_{1}^{2}\int_{- 1}^{0}x^{2}y^{2}\, dy\, dx = - \left( {\int_{1}^{2}x^{2}\, dx} \right)\left( {\int_{- 1}^{0}y^{2}\, dy} \right) = - \left( \frac{7}{3} \right)\left( \frac{1}{3} \right) = - \frac{7}{9}
>   $$
>
>   Thus,
>
>   $$
>   {\mathbb{E}}\lbrack XY\rbrack = - \frac{1}{9} - \frac{7}{9} = - \frac{8}{9}
>   $$
>
> - Consider: For $x \in ( - 1,0)$,
>
>   $$
>   f_{X}(x) = \int_{0}^{1}( - xy)\, dy = \frac{- x}{2}
>   $$
>
>   For $y \in (0,1)$,
>
>   $$
>   f_{Y}(y) = \int_{- 1}^{0}( - xy)\, dx = y\int_{- 1}^{0}( - x)\, dx = \frac{y}{2}
>   $$
>
>   And for $(x,y) \in ( - 1,0) \times (0,1)$,
>
>   $$
>   f_{X}(x)f_{Y}(y) = \left( \frac{- x}{2} \right)\left( \frac{y}{2} \right) = \frac{- xy}{4} \neq - xy = f(x,y)
>   $$
>
>   Thus $X$ and $Y$ are not independent.

## Problem 3 {#problem-3-3}

Let $X \sim \text{Exp}(1)$ and $Y = X + \frac{1}{X + 1}$. Find ${\mathbb{P}}((X + 1)Y \leq 2)$ and $\text{Cov}(X,Y)$.\
Hint: You may leave your answer as a function of the integral $\int_{0}^{\infty}\frac{e^{- x}}{1 + x}dx$.

> **Solution**
>
> Note
>
> $$
> (X + 1)Y = (X + 1)\left( {X + \frac{1}{X + 1}} \right) = X(X + 1) + 1 = X^{2} + X + 1
> $$
>
> Thus,
>
> $$
> (X + 1)Y \leq 2\Leftrightarrow X^{2} + X - 1 \leq 0
> $$
>
> The roots of $x^{2} + x - 1 = 0$ are $\frac{- 1 \pm \sqrt{5}}{2}$. Since $X \geq 0$, the event is
>
> $$
> 0 \leq X \leq \frac{\sqrt{5} - 1}{2}
> $$
>
> Therefore, using the CDF of $Exp(1)$,
>
> $$
> {\mathbb{P}}((X + 1)Y \leq 2) = {\mathbb{P}}(X \leq \frac{\sqrt{5} - 1}{2}) = 1 - e^{- \frac{\sqrt{5} - 1}{2}} = 1 - \exp\mspace{-18mu}\left( {- \frac{\sqrt{5} - 1}{2}} \right)
> $$
>
> Nowe we compute the covariance. By def,
>
> $$
> Cov(X,Y) = {\mathbb{E}}\lbrack XY\rbrack - {\mathbb{E}}\lbrack X\rbrack{\mathbb{E}}\lbrack Y\rbrack
> $$
>
> For $X \sim Exp(1)$, ${\mathbb{E}}\lbrack X\rbrack = 1$ and ${\mathbb{E}}\lbrack X^{2}\rbrack = 2$. Let
>
> $$
> I := \int_{0}^{\infty}\frac{e^{- x}}{1 + x}\, dx = {\mathbb{E}}\mspace{-18mu}\left\lbrack \frac{1}{1 + X} \right\rbrack
> $$
>
> Then
>
> $$
> {\mathbb{E}}\lbrack Y\rbrack = {\mathbb{E}}\lbrack X\rbrack + {\mathbb{E}}\mspace{-18mu}\left\lbrack \frac{1}{1 + X} \right\rbrack = 1 + I
> $$
>
> Also,
>
> $$
> XY = X\left( {X + \frac{1}{1 + X}} \right) = X^{2} + \frac{X}{1 + X} = X^{2} + \left( {1 - \frac{1}{1 + X}} \right)
> $$
>
> so
>
> $$
> {\mathbb{E}}\lbrack XY\rbrack = {\mathbb{E}}\lbrack X^{2}\rbrack + 1 - {\mathbb{E}}\mspace{-18mu}\left\lbrack \frac{1}{1 + X} \right\rbrack = 2 + 1 - I = 3 - I
> $$
>
> Hence,
>
> $$
> Cov(X,Y) = (3 - I) - (1)(1 + I) = 2 - 2I = 2 - 2\int_{0}^{\infty}\frac{e^{- x}}{1 + x}\, dx
> $$

## Problem 4 {#problem-4-3}

Find the conditional density $f_{Y \mid X}(y \mid x)$ of $Y$ given that $X = x$ and the corresponding conditional expectation ${\mathbb{E}}\lbrack Y \mid X = x\rbrack$ if the pair of random variables $(X,Y)$ has absolutely continuous distribution with joint density: $f_{X,Y}(x,y) = \lambda^{2}e^{- \lambda y}\mathbf{1}_{\{{0 \leq x \leq y}\}}$.

> **Solution**
>
> Given the joint density $f_{X,Y}(x,y) = \lambda^{2}e^{- \lambda y}\mathbf{1}_{\{{0 \leq x \leq y}\}}$, we first compute the marginal density of $X$. For $x \geq 0$,
>
> $$
> f_{X}(x) = \int_{y = x}^{\infty}\lambda^{2}e^{- \lambda y}\, dy = \lambda^{2} \cdot \frac{e^{- \lambda x}}{\lambda} = \lambda e^{- \lambda x}
> $$
>
> and $f_{X}(x) = 0$ for $x < 0$.
>
> Therefore, for $x \geq 0$,
>
> $$
> \left. f_{Y|X}(y \middle| x) = \frac{f_{X,Y}(x,y)}{f_{X}(x)} = \frac{\lambda^{2}e^{- \lambda y}\mathbf{1}_{\{{y \geq x}\}}}{\lambda e^{- \lambda x}} = \lambda e^{- \lambda(y - x)}\mathbf{1}_{\{{y \geq x}\}} \right.
> $$
>
> This shows that $\left. Y \middle| X = x \right.$ has the same distribution as $x + E$ where $E \sim Exp(\lambda)$, hence
>
> $$
> \left. {\mathbb{E}}\lbrack Y \middle| X = x\rbrack = x + \frac{1}{\lambda} \right.
> $$

## Problem 5 {#problem-5-3}

A machine produces a coin that shows heads with a random probability $p$. The value of $p$ is unknown to us, but from many observations of the coins produced by the machine we know that the distribution of the random parameter $p$ is uniform on $(0,1/2)$. We start tossing the coin. Compute the following probabilities:

- The coin shows heads on the first toss.

- The expected number of tosses until tails show up.

> **Solution**
>
> - The head probability $p \sim Unif(0,1/2)$. Thus the density is:
>
>   $$
>   f_{P}(p) = 2\,\mathbf{1}_{(0,1/2)}(p)
>   $$
>
>   The unconditional probability of heads on the first toss is
>
>   [ℙ(H on first toss)=E\[p\]=∫01/2p⋅2dp=2⋅p2201/2=14]{.math display="block"}
>
> - Let $T$ be the number of tosses until the first tail occurs. Conditional on $p$, tails occurs with probability $1 - p$ each toss, so $T$ is geometric with parameter $1 - p$. Hence
>
>   $$
>   \left. {\mathbb{E}}\lbrack T\, \middle| \, p\rbrack = \frac{1}{1 - p} \right.
>   $$
>
>   Taking expectation over $p$,
>
>   [E\[T\]=E\[11−p\]=∫01/211−p⋅2dp=2−ln(1−p)01/2=2ln2]{.math display="block"}

## Problem 6 {#problem-6-3}

The joint probability density function of the random variables $X$ and $Y$ is given by

$$
f_{X,Y}(x,y) = \left\{ \begin{matrix}
{c\left( {x^{2} + \frac{xy}{2}} \right),} & {(x,y) \in (0,1) \times (0,2)} \\
{0,} & \text{otherwise}
\end{matrix} \right.
$$

- Find the constant $c$.

- Find the marginal density of $X$ and compute ${\mathbb{E}}\lbrack X\rbrack$.

- Compute ${\mathbb{P}}(X > Y)$.

- Compute ${\mathbb{P}}\left( Y > \frac{1}{2} \middle| \, X < \frac{1}{2} \right)$.

> **Solution**
>
> - Determine $c$ from normalization:
>
>   $$
>   1 = \int_{0}^{1}\int_{0}^{2}c\left( {x^{2} + \frac{xy}{2}} \right)\, dy\, dx
>   $$
>
>   For fixed $x$,
>
>   [∫02(x2+xy2)dy=2x2+x2⋅y2202=2x2+x]{.math display="block"}
>
>   Thus
>
>   $$
>   1 = c\int_{0}^{1}(2x^{2} + x)\, dx = c\left( {\frac{2}{3} + \frac{1}{2}} \right) = c \cdot \frac{7}{6}
>   $$
>
>   so $c = \frac{6}{7}$
>
> - The marginal density of $X$ (for $0 < x < 1$) is
>
>   $$
>   f_{X}(x) = \int_{0}^{2}c\left( {x^{2} + \frac{xy}{2}} \right)\, dy = c(2x^{2} + x) = \frac{6}{7}(2x^{2} + x)
>   $$
>
>   and $f_{X}(x) = 0$ otherwise.
>
>   Thus
>
>   $$
>   {\mathbb{E}}\lbrack X\rbrack = \int_{0}^{1}xf_{X}(x)\, dx = \frac{6}{7}\int_{0}^{1}(2x^{3} + x^{2})\, dx = \frac{6}{7}\left( {\frac{1}{2} + \frac{1}{3}} \right) = \frac{5}{7}
>   $$
>
> - The event $\left\{ {X > Y} \right\}$ corresponds to the region $0 < y < x < 1$ (since $x \in (0,1)$). Hence
>
>   $$
>   {\mathbb{P}}(X > Y) = \int_{0}^{1}\int_{0}^{x}c\left( {x^{2} + \frac{xy}{2}} \right)\, dy\, dx
>   $$
>
>   For fixed $x$,
>
>   [∫0x(x2+xy2)dy=x3+x2⋅y220x=x3+x34=54x3]{.math display="block"}
>
>   Therefore
>
>   $$
>   {\mathbb{P}}(X > Y) = c\int_{0}^{1}\frac{5}{4}x^{3}\, dx = c \cdot \frac{5}{4} \cdot \frac{1}{4} = c \cdot \frac{5}{16} = \frac{6}{7} \cdot \frac{5}{16} = \frac{15}{56}
>   $$
>
> - By definition,
>
>   $$
>   {\mathbb{P}}\mspace{-18mu}\left( Y > \frac{1}{2} \middle| \ X < \frac{1}{2} \right) = \frac{{\mathbb{P}}\left( {Y > \frac{1}{2},\ X < \frac{1}{2}} \right)}{{\mathbb{P}}\left( {X < \frac{1}{2}} \right)}
>   $$
>
>   Calculate each part. First the denominator:
>
>   $$
>   {\mathbb{P}}\left( {X < \frac{1}{2}} \right) = \int_{0}^{1/2}f_{X}(x)\, dx = c\int_{0}^{1/2}(2x^{2} + x)\, dx = c\left( {\frac{1}{12} + \frac{1}{8}} \right) = c \cdot \frac{5}{24} = \frac{5}{28}
>   $$
>
>   And the numerator:
>
>   $$
>   {\mathbb{P}}\left( {Y > \frac{1}{2},\ X < \frac{1}{2}} \right) = \int_{0}^{1/2}\int_{1/2}^{2}c\left( {x^{2} + \frac{xy}{2}} \right)\, dy\, dx
>   $$
>
>   For fixed $x$,
>
>   [∫1/22(x2+xy2)dy=x2(2−12)+x2⋅y221/22=32x2+x4(4−14)=32x2+1516x]{.math display="block"}
>
>   Thus
>
>   $$
>   {\mathbb{P}}\left( {Y > \frac{1}{2},\ X < \frac{1}{2}} \right) = c\int_{0}^{1/2}\left( {\frac{3}{2}x^{2} + \frac{15}{16}x} \right)dx = c\left( {\frac{1}{16} + \frac{15}{128}} \right) = c \cdot \frac{23}{128} = \frac{69}{448}
>   $$
>
>   Therefore,
>
>   $$
>   {\mathbb{P}}\mspace{-18mu}\left( Y > \frac{1}{2} \middle| \ X < \frac{1}{2} \right) = \frac{69/448}{5/28} = \frac{69}{80}
>   $$

