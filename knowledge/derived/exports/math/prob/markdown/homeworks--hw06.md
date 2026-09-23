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
source: "notes/math/prob/homeworks/hw06.typ"
subtitle: Typst-first worked solutions
title: "Math 525: Probability Homeworks"
---
# Homework 6

## Problem 1 {#problem-1-6}

Let $X$ be a random variable such that ${\mathbb{E}}\left\lbrack |X| \right\rbrack < \infty$, that is $X \in L^{1}$. Denote by $\phi_{X}(t) := {\mathbb{E}}\left\lbrack e^{itX} \right\rbrack,t \in {\mathbb{R}}$, its characteristic function.

- Show that $\phi_{X}$ is differentiable with $\phi_{X}'(t) = i{\mathbb{E}}\left\lbrack {Xe^{itX}} \right\rbrack$. (Hint: DCT)

- If, in addition, $X$ has symmetric distribution(i.e. $X, - X$ have the same distribution), then show that $\phi_{X}(t) \in {\mathbb{R}}$ for any $t \in {\mathbb{R}}$.

> **Proof**
>
> - Fix $t \in {\mathbb{R}}$. Consider the difference quotient
>
>   $$
>   \frac{\phi_{X}(t + h) - \phi_{X}(t)}{h} = {\mathbb{E}}\left\lbrack {e^{itX}\frac{e^{ihX} - 1}{h}} \right\rbrack
>   $$
>
>   Notice we have (for a.e. $\omega$):
>
>   $$
>   \lim\limits_{h\rightarrow 0}\frac{e^{ihX} - 1}{h} = iX
>   $$
>
>   Hence
>
>   $$
>   e^{itX}\frac{e^{ihX} - 1}{h}\rightarrow iXe^{itX}\quad\text{a.s.}\quad\text{as}\ h\rightarrow 0
>   $$
>
>   Using the mean value theorem for the function $u\mapsto e^{iuX}$, for $\left. |h \middle| \leq 1 \right.$ we have
>
>   $$
>   \left. \left| \frac{e^{ihX} - 1}{h} \right| \leq \middle| X| \right.
>   $$
>
>   Also, $\left. |e^{itX} \middle| = 1 \right.$, so
>
>   $$
>   \left. \left| {e^{itX}\frac{e^{ihX} - 1}{h}} \right| = \middle| e^{itX} \middle| \left| \frac{e^{ihX} - 1}{h} \right| \leq \middle| X| \right.
>   $$
>
>   Since $X \in L^{1}$, we have $\left. {\mathbb{E}}\lbrack \middle| X \middle| \rbrack < \infty \right.$, therefore $|X|$ is a dominating integrable random variable for $e^{itX}\frac{e^{ihX} - 1}{h}$. Then by DCT,
>
>   $$
>   \lim\limits_{h\rightarrow 0}\frac{\phi_{X}(t + h) - \phi_{X}(t)}{h} = {\mathbb{E}}\left\lbrack {\lim\limits_{h\rightarrow 0}e^{itX}\frac{e^{ihX} - 1}{h}} \right\rbrack = {\mathbb{E}}\lbrack iXe^{itX}\rbrack
>   $$
>
>   Thus $\phi_{X}$ is differentiable and
>
>   $$
>   \phi_{X}'(t) = i{\mathbb{E}}\lbrack Xe^{itX}\rbrack
>   $$
>
> - Since random variables with the same distribution have the same expectation under measurable functions for which the expectation exists, we get
>
>   $$
>   \phi_{X}(t) = {\mathbb{E}}\lbrack e^{itX}\rbrack = {\mathbb{E}}\lbrack e^{it( - X)}\rbrack = {\mathbb{E}}\lbrack e^{- itX}\rbrack = \phi_{X}( - t)
>   $$
>
>   On the other hand since $\phi_{X}( - t) = \bar{\phi_{X}(t)}$, we thus have
>
>   $$
>   \phi_{X}(t) = \bar{\phi_{X}(t)}
>   $$
>
>   A complex number equal to its own conjugate must be real. Therefore,
>
>   $$
>   \phi_{X}(t) \in {\mathbb{R}},\qquad\forall t \in {\mathbb{R}}
>   $$
>
>   Writing
>
>   $$
>   \phi_{X}(t) = {\mathbb{E}}\lbrack\cos(tX)\rbrack + i{\mathbb{E}}\lbrack\sin(tX)\rbrack
>   $$
>
>   Since $X$ is symmetric, $\sin(tx)$ is odd, so
>
>   $$
>   {\mathbb{E}}\lbrack\sin(tX)\rbrack = 0
>   $$
>
>   Therefore $\phi_{X}(t) = {\mathbb{E}}\lbrack\cos(tX)\rbrack \in {\mathbb{R}}$.

## Problem 2 {#problem-2-6}

Let $X \sim \text{Bin}(n,p)$, where $n \in {\mathbb{N}},p \in (0,1)$ and $Y \sim \text{Pois}(\lambda)$, where $\lambda > 0$.

- Compute the characteristic functions of $X,Y$.

- Let $\left( p_{n} \right)_{n \in {\mathbb{N}}}$ be a sequence in $(0,1)$ such that $\lim_{n\rightarrow\infty}np_{n} = \lambda$ and $\left( X_{n} \right)_{n \in {\mathbb{N}}}$ be a sequence of random variables with $X_{n} \sim \text{Bin}\ \left( {n,p_{n}} \right)$. Show that $X_{n}\overset{d}{\rightarrow}Y$.

> **Proof**
>
> - We have
>
>   $$
>   {\mathbb{P}}(X = k) = \left( \frac{n}{k} \right)p^{k}(1 - p)^{n - k},\quad k = 0,1,\ldots,n
>   $$
>
>   Therefore,
>
>   $$
>   \phi_{X}(t) = {\mathbb{E}}\lbrack e^{itX}\rbrack = \sum\limits_{k = 0}^{n}e^{itk}\left( \frac{n}{k} \right)p^{k}(1 - p)^{n - k}
>   $$
>
>   We factor $e^{itk}$ into $(pe^{it})^{k}/p^{k}$ and obtain
>
>   $$
>   \phi_{X}(t) = \sum\limits_{k = 0}^{n}\left( \frac{n}{k} \right)(pe^{it})^{k}(1 - p)^{n - k}
>   $$
>
>   By the binomial formula,
>
>   $$
>   \phi_{X}(t) = (1 - p + pe^{it})^{n}
>   $$
>
>   Next for $Y \sim \text{Pois}(\lambda)$ we have
>
>   $$
>   {\mathbb{P}}(Y = k) = e^{- \lambda}\frac{\lambda^{k}}{k!},\quad k = 0,1,2,\ldots
>   $$
>
>   Hence
>
>   $$
>   \phi_{Y}(t) = {\mathbb{E}}\lbrack e^{itY}\rbrack = \sum\limits_{k = 0}^{\infty}e^{itk}e^{- \lambda}\frac{\lambda^{k}}{k!}
>   $$
>
>   Thus
>
>   $$
>   \phi_{Y}(t) = e^{- \lambda}\sum\limits_{k = 0}^{\infty}\frac{(\lambda e^{it})^{k}}{k!} = e^{- \lambda}e^{\lambda e^{it}} = e^{\lambda(e^{it} - 1)}
>   $$
>
>   So the characteristic functions are
>
>   $$
>   \phi_{X}(t) = (1 - p + pe^{it})^{n},\quad\phi_{Y}(t) = e^{\lambda(e^{it} - 1)}
>   $$
>
> - By part (a),
>
>   $$
>   \phi_{X_{n}}(t) = (1 - p_{n} + p_{n}e^{it})^{n} = \left( {1 + p_{n}(e^{it} - 1)} \right)^{n}
>   $$
>
>   We now compute the limit as $n\rightarrow\infty$.
>
>   Set
>
>   $$
>   a_{n} := p_{n}(e^{it} - 1)
>   $$
>
>   Since $p_{n}\rightarrow 0$ (as $np_{n}\rightarrow\lambda < \infty$), we have $a_{n}\rightarrow 0$. Therefore,
>
>   $$
>   \log(1 + a_{n})\rightarrow a_{n},\quad n\rightarrow\infty
>   $$
>
>   Hence
>
>   $$
>   n\log(1 + a_{n})\rightarrow na_{n} = np_{n}(e^{it} - 1)\Longrightarrow\lambda(e^{it} - 1)
>   $$
>
>   Exponentiating, we get
>
>   $$
>   \phi_{X_{n}}(t) = \exp\ n\log(1 + a_{n})\rightarrow\exp\ \lambda(e^{it} - 1)
>   $$
>
>   But by part (a),
>
>   $$
>   \exp\ \lambda(e^{it} - 1) = \phi_{Y}(t)
>   $$
>
>   Thus for every $t \in {\mathbb{R}}$,
>
>   $$
>   \phi_{X_{n}}(t)\rightarrow\phi_{Y}(t)
>   $$
>
>   Since $\phi_{Y}$ is the characteristic function of $Y \sim \text{Pois}(\lambda)$, by the uniqueness theorem for characteristic functions, this implies
>
>   $$
>   X_{n}\overset{d}{\rightarrow}Y
>   $$

## Problem 3 {#problem-3-6}

Show that

$$
\lim\limits_{n\rightarrow\infty}\int_{0}^{n/2}\frac{2^{n}}{(n - 1)!}t^{n - 1}e^{- 2t}dt = \frac{1}{2}
$$

Hint: Observe that the integral is the probability of an event related to a Gamma distribution. Can we apply the central limit theorem?

> **Proof**
>
> Let
>
> $$
> I_{n} := \int_{0}^{n/2}\frac{2^{n}}{(n - 1)!}t^{n - 1}e^{- 2t}\, dt
> $$
>
> Then
>
> $$
> f_{n}(t) = \frac{2^{n}}{(n - 1)!}t^{n - 1}e^{- 2t}\mathbf{1}_{(0,\infty)}(t)
> $$
>
> is the density of a Gamma distribution with parameters $(n,2)$, that is, $T_{n} \sim \Gamma(n,2)$. Hence
>
> $$
> I_{n} = {\mathbb{P}}(T_{n} \leq n/2)
> $$
>
> Now let $X_{1},X_{2},\ldots$ be i.i.d. random variables with
>
> $$
> X_{i} \sim \text{Exp}(2)
> $$
>
> We know that
>
> $$
> T_{n} = X_{1} + \cdots + X_{n}
> $$
>
> Also,
>
> $$
> \mu := {\mathbb{E}}\lbrack X_{1}\rbrack = \frac{1}{2},\quad\sigma^{2} := \text{Var}(X_{1}) = \frac{1}{4}
> $$
>
> Therefore,
>
> $$
> I_{n} = {\mathbb{P}}(X_{1} + \cdots + X_{n} \leq n/2) = {\mathbb{P}}\mspace{-18mu}\left( {\frac{T_{n} - n\mu}{\sigma\sqrt{n}} \leq 0} \right)
> $$
>
> Since $\mu = 1/2$ and $\sigma = 1/2$, this is
>
> $$
> I_{n} = {\mathbb{P}}\mspace{-18mu}\left( {\frac{T_{n} - n/2}{\sqrt{n}/2} \leq 0} \right)
> $$
>
> By the Central Limit Theorem,
>
> $$
> \frac{T_{n} - n\mu}{\sigma\sqrt{n}} = \frac{T_{n} - n/2}{\sqrt{n}/2}\overset{d}{\rightarrow}Z,\quad Z \sim N(0,1)
> $$
>
> Hence, since the standard normal distribution function is continuous at $0$,
>
> $$
> \lim\limits_{n\rightarrow\infty}I_{n} = \lim\limits_{n\rightarrow\infty}{\mathbb{P}}\mspace{-18mu}\left( {\frac{T_{n} - n/2}{\sqrt{n}/2} \leq 0} \right) = {\mathbb{P}}(Z \leq 0) = \frac{1}{2}
> $$
>
> Thus
>
> $$
> \lim\limits_{n\rightarrow\infty}\int_{0}^{n/2}\frac{2^{n}}{(n - 1)!}t^{n - 1}e^{- 2t}dt = \frac{1}{2}
> $$

## Problem 4 {#problem-4-6}

A casino offers the following random game: A player rolls a fair die once. If the outcome is 2 or 4, then the player wins 3 euros from the casino. If the outcome is $1,3,5$, then the player loses 4 euros to the casino. If the outcome is 6 , then the player neither wins nor loses. If 90 players play the above game independently, find approximately the probability that the casino wins at least 30 euros in total.

> **Solution**
>
> Let $X_{i}$ be the gain of the casino from the $i$-th player, for $i = 1,\ldots,90$. Then the random variables $X_{1},\ldots,X_{90}$ are independent and identically distributed, with
>
> $$
> X_{i} = \left\{ \begin{matrix}
> {- 3,} & \text{if the player wins 3 euros} \\
> {4,} & \text{if the player loses 4 euros} \\
> {0,} & \text{if the outcome is 6}
> \end{matrix} \right.
> $$
>
> Since the die is fair, we have
>
> $$
> {\mathbb{P}}(X_{i} = - 3) = \frac{2}{6} = \frac{1}{3},\qquad{\mathbb{P}}(X_{i} = 4) = \frac{3}{6} = \frac{1}{2},\qquad{\mathbb{P}}(X_{i} = 0) = \frac{1}{6}
> $$
>
> Let
>
> $$
> S_{90} = X_{1} + \cdots + X_{90}
> $$
>
> be the total gain of the casino after 90 players. We want to approximate
>
> $$
> {\mathbb{P}}(S_{90} \geq 30)
> $$
>
> We first compute the mean and variance of $X_{1}$. The mean is
>
> $$
> \mu := {\mathbb{E}}\lbrack X_{1}\rbrack = ( - 3) \cdot \frac{1}{3} + 4 \cdot \frac{1}{2} + 0 \cdot \frac{1}{6} = - 1 + 2 = 1
> $$
>
> Also,
>
> $$
> {\mathbb{E}}\lbrack X_{1}^{2}\rbrack = 9 \cdot \frac{1}{3} + 16 \cdot \frac{1}{2} + 0 = 3 + 8 = 11
> $$
>
> Hence
>
> $$
> \sigma^{2} := \text{Var}(X_{1}) = {\mathbb{E}}\lbrack X_{1}^{2}\rbrack - \mu^{2} = 11 - 1 = 10
> $$
>
> Therefore,
>
> $$
> {\mathbb{E}}\lbrack S_{90}\rbrack = 90\mu = 90,\quad\text{Var}(S_{90}) = 90\sigma^{2} = 900
> $$
>
> So the standard deviation of $S_{90}$ is
>
> $$
> \sqrt{900} = 30
> $$
>
> By the Central Limit Theorem,
>
> $$
> \frac{S_{90} - 90}{30} \approx N(0,1)
> $$
>
> Thus,
>
> $$
> {\mathbb{P}}(S_{90} \geq 30) = {\mathbb{P}}\left( {\frac{S_{90} - 90}{30} \geq \frac{30 - 90}{30}} \right) \approx {\mathbb{P}}(Z \geq - 2)
> $$
>
> where $Z \sim N(0,1)$. Since
>
> $$
> {\mathbb{P}}(Z \geq - 2) = {\mathbb{P}}(Z \leq 2) \approx 0.9772
> $$
>
> we conclude that
>
> $$
> {\mathbb{P}}(S_{90} \geq 30) \approx 0.9772
> $$
>
> Hence, the probability that the casino wins at least 30 euros in total is approximately 0.9772.

## Problem 5 {#problem-5-6}

Assume that $\left( X_{n} \right)_{n \in {\mathbb{N}}}$ is an i.i.d. sequence of random variables such that ${\mathbb{E}}\left\lbrack X_{1} \right\rbrack = 0$ and ${\mathbb{E}}\left\lbrack X_{1}^{2} \right\rbrack = 1$. Show that

$$
\frac{\sum_{i = 1}^{n}X_{i}}{\sqrt{\sum_{i = 1}^{n}X_{i}^{2}}}\overset{d}{\rightarrow}Z,\quad Z \sim N(0,1)
$$

> **Proof**
>
> Let
>
> $$
> S_{n} := \sum\limits_{i = 1}^{n}X_{i},\quad Q_{n} := \sum\limits_{i = 1}^{n}X_{i}^{2}
> $$
>
> We want to show that
>
> $$
> \frac{S_{n}}{\sqrt{Q_{n}}}\overset{d}{\rightarrow}Z,\quad Z \sim N(0,1)
> $$
>
> First, since $(X_{n})_{n \in {\mathbb{N}}}$ are i.i.d. with ${\mathbb{E}}\lbrack X_{1}\rbrack = 0,$ and ${\mathbb{E}}\lbrack X_{1}^{2}\rbrack = 1$, we have $\text{Var}(X_{1}) = 1$. And thus by the Central Limit Theorem,
>
> $$
> \frac{S_{n}}{\sqrt{n}}\overset{d}{\rightarrow}Z,\quad Z \sim N(0,1)
> $$
>
> And then, consider $Q_{n}$. Since $(X_{i}^{2})$ are i.i.d. and ${\mathbb{E}}\lbrack X_{1}^{2}\rbrack = 1 < \infty$, by the Law of Large Numbers we have
>
> $$
> \frac{Q_{n}}{n}\overset{P}{\rightarrow}1
> $$
>
> By continuity of the square root function,
>
> $$
> \sqrt{\frac{Q_{n}}{n}}\overset{P}{\rightarrow}1
> $$
>
> Write
>
> $$
> \frac{S_{n}}{\sqrt{Q_{n}}} = \frac{S_{n}}{\sqrt{n}} \cdot \frac{1}{\sqrt{Q_{n}/n}}
> $$
>
> Define
>
> $$
> A_{n} := \frac{S_{n}}{\sqrt{n}},\quad B_{n} := \frac{1}{\sqrt{Q_{n}/n}}
> $$
>
> Then we have shown that $A_{n}\overset{d}{\rightarrow}Z$ and $B_{n}\overset{P}{\rightarrow}1$.
>
> **Now we claim that: $A_{n}B_{n}\overset{d}{\rightarrow}Z$.**
>
> It suffices to show that ${\mathbb{E}}\lbrack f(A_{n}B_{n})\rbrack\rightarrow{\mathbb{E}}\lbrack f(Z)\rbrack$ for every bounded continuous function $f:{\mathbb{R}}\rightarrow{\mathbb{R}}$.
>
> Let $f:{\mathbb{R}}\rightarrow{\mathbb{R}}$ be bounded and continuous. Then
>
> $$
> {\mathbb{E}}\lbrack f(A_{n}B_{n})\rbrack - {\mathbb{E}}\lbrack f(Z)\rbrack = \ {\mathbb{E}}\lbrack f(A_{n}B_{n})\rbrack - {\mathbb{E}}\lbrack f(A_{n})\rbrack + \ {\mathbb{E}}\lbrack f(A_{n})\rbrack - {\mathbb{E}}\lbrack f(Z)\rbrack
> $$
>
> Since $A_{n}\overset{d}{\rightarrow}Z$, the second term converges to $0$. It remains to show that ${\mathbb{E}}\lbrack f(A_{n}B_{n})\rbrack - {\mathbb{E}}\lbrack f(A_{n})\rbrack\rightarrow 0$.
>
> Observe $A_{n}B_{n} - A_{n} = A_{n}(B_{n} - 1)$. Because $A_{n}\overset{d}{\rightarrow}Z$, the sequence $(A_{n})$ is tight. Also, since $B_{n}\overset{P}{\rightarrow}1$, we have
>
> $$
> B_{n} - 1\overset{P}{\rightarrow}0
> $$
>
> It follows that
>
> $$
> A_{n}(B_{n} - 1) = A_{n}B_{n} - A_{n}\overset{P}{\rightarrow}0
> $$
>
> We now show that
>
> $$
> f(A_{n}B_{n}) - f(A_{n})\overset{P}{\rightarrow}0
> $$
>
> Fix $\varepsilon > 0$. Since $(A_{n})$ is tight, there exists $M > 0$ such that
>
> $$
> \left. \sup\limits_{n \geq 1}{\mathbb{P}}( \middle| A_{n} \middle| > M) < \varepsilon \right.
> $$
>
> Since $f$ is continuous on the compact interval $\lbrack - M - 1,M + 1\rbrack$, it is uniformly continuous there. Thus there exists $\delta > 0$ such that whenever $x,y \in \lbrack - M - 1,M + 1\rbrack$ and $\left. |x - y \middle| < \delta \right.$, we have
>
> $$
> \left. |f(x) - f(y) \middle| < \varepsilon \right.
> $$
>
> Now on the event
>
> $$
> \left\{ |A_{n} \middle| \leq M,\  \middle| A_{n}B_{n} - A_{n} \middle| < \min(\delta,1) \right\}
> $$
>
> we also have $\left. |A_{n}B_{n} \middle| \leq M + 1 \right.$, so
>
> $$
> \left. |f(A_{n}B_{n}) - f(A_{n}) \middle| < \varepsilon \right.
> $$
>
> Therefore,
>
> $$
> \left. {\mathbb{P}}\  \middle| f(A_{n}B_{n}) - f(A_{n}) \middle| > \varepsilon\  \leq {\mathbb{P}}( \middle| A_{n} \middle| > M) + {\mathbb{P}}( \middle| A_{n}B_{n} - A_{n} \middle| \geq \min(\delta,1)) \right.
> $$
>
> The first term is less than $\varepsilon$, and the second term tends to $0$. Hence
>
> $$
> f(A_{n}B_{n}) - f(A_{n})\overset{P}{\rightarrow}0
> $$
>
> Since $f$ is bounded, the random variables $f(A_{n}B_{n}) - f(A_{n})$ are uniformly bounded. Therefore,
>
> $$
> {\mathbb{E}}\lbrack f(A_{n}B_{n}) - f(A_{n})\rbrack\rightarrow 0
> $$
>
> Combining this with ${\mathbb{E}}\lbrack f(A_{n})\rbrack\rightarrow{\mathbb{E}}\lbrack f(Z)\rbrack$, we get
>
> $$
> {\mathbb{E}}\lbrack f(A_{n}B_{n})\rbrack\rightarrow{\mathbb{E}}\lbrack f(Z)\rbrack
> $$
>
> Thus
>
> $$
> A_{n}B_{n}\overset{d}{\rightarrow}Z
> $$
>
> This finishes the proof that
>
> $$
> \frac{S_{n}}{\sqrt{Q_{n}}} = A_{n}B_{n}\overset{d}{\rightarrow}Z
> $$
>
> That is,
>
> $$
> \frac{\sum_{i = 1}^{n}X_{i}}{\sqrt{\sum_{i = 1}^{n}X_{i}^{2}}}\overset{d}{\rightarrow}Z,\quad Z \sim N(0,1)
> $$
