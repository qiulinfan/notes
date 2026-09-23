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
source: "notes/math/prob/homeworks/hw05.typ"
subtitle: Typst-first worked solutions
title: "Math 525: Probability Homeworks"
---
# Homework 5

## Problem 1 {#problem-1-5}

Let $\left( U_{i} \right)_{i \in {\mathbb{N}}}$ be an i.i.d sequence of random variables with $U_{i} \sim U(\lbrack 0,1\rbrack)$. Show that

- $\lim_{n\rightarrow\infty}\left( {U_{1}U_{2}\ldots U_{n}} \right)^{1/n} = e^{- 1}$ almost surely.

- $\lim_{n\rightarrow\infty}U_{1}U_{2}\ldots U_{n} = 0$ almost surely.

> **Proof**
>
> - Let
>
>   $$
>   X_{i} := - \log U_{i},\quad i \in {\mathbb{N}}
>   $$
>
>   Since $U_{i} \sim U(\lbrack 0,1\rbrack)$, for $x \geq 0$,
>
>   $$
>   {\mathbb{P}}(X_{i} \leq x) = {\mathbb{P}}( - \log U_{i} \leq x) = {\mathbb{P}}(U_{i} \geq e^{- x}) = 1 - e^{- x}
>   $$
>
>   Thus $X_{i} \sim Exp(1)$, so ${\mathbb{E}}\lbrack X_{i}\rbrack = 1$. Also,
>
>   $$
>   \log\left( {(U_{1}U_{2}\cdots U_{n})^{1/n}} \right) = \frac{1}{n}\sum\limits_{i = 1}^{n}\log U_{i} = - \frac{1}{n}\sum\limits_{i = 1}^{n}X_{i}
>   $$
>
>   By the Strong Law of Large Numbers,
>
>   $$
>   \frac{1}{n}\sum\limits_{i = 1}^{n}X_{i} = \frac{1}{n}\sum\limits_{i = 1}^{n}\log U_{i}\rightarrow 1\quad\text{a.s.}
>   $$
>
>   Since the exponential function is continuous,
>
>   $$
>   (U_{1}U_{2}\cdots U_{n})^{1/n} = \exp\left( {\frac{1}{n}\sum\limits_{i = 1}^{n}\log U_{i}} \right)\rightarrow e^{- 1}\quad\text{a.s.}
>   $$
>
> - Let
>
>   $$
>   P_{n} := U_{1}U_{2}\cdots U_{n}
>   $$
>
>   Then from the first part we instantly have
>
>   $$
>   P_{n}^{1/n}\rightarrow e^{- 1} < 1\quad\text{a.s.}
>   $$
>
>   Then for any event $\omega$ in the event of probability one where this convergence holds, choose $r$ s.t. $e^{- 1} < r < 1$, then for all sufficiently large $n$,
>
>   $$
>   P_{n}(\omega)^{1/n} < r,\quad\text{i.e.}\quad P_{n}(\omega) < r^{n}
>   $$
>
>   Since $0 < r < 1$, we have $r^{n}\rightarrow 0$. Therefore $P_{n}(\omega)\rightarrow 0$. Therefore
>
>   $$
>   U_{1}U_{2}\cdots U_{n}\rightarrow 0\quad\text{a.s.}
>   $$

## Problem 2 {#problem-2-5}

A factory produces small resistors, and the resistance of each resistor is a random variable $X_{i}$ with unknown mean $\mu$ and variance $\sigma^{2} = 0.25$ ohms $\begin{matrix}
\end{matrix}^{2}$. The quality control engineer wants to estimate the average resistance of a batch. She decides to measure $n$ resistors and compute the sample average

$$
{\bar{X}}_{n} := \frac{X_{1} + X_{2} + \cdots + X_{n}}{n}
$$

Determine approximately the number of resistors $n$ she needs to measure so that the probability that the sample mean differs from the true mean by more than 0.005 ohms is less than $1\%$, i.e.,

$$
{\mathbb{P}}\left( {\left| {{\bar{X}}_{n} - \mu} \right| > 0.005} \right) < 0.01
$$

> **Proof**
>
> By linearity of expectation,
>
> $$
> {\mathbb{E}}\lbrack{\bar{X}}_{n}\rbrack = \mu
> $$
>
> And (assmuming the $X_{i}$ are independent), we have
>
> $$
> Var\left( {\sum\limits_{i = 1}^{n}X_{i}} \right) = \sum\limits_{i = 1}^{n}Var(X_{i}) + \sum\limits_{i \neq j}Cov(X_{i},X_{j}) = n\sigma^{2} = 0.25n
> $$
>
> Thus
>
> $$
> Var({\bar{X}}_{n}) = \frac{\sigma^{2}}{n} = \frac{0.25}{n}
> $$
>
> By Chebyshev's inequality, for any $\varepsilon > 0$,
>
> $$
> {\mathbb{P}}\left( |\ {\bar{X}}_{n} - \mu\  \middle| > \varepsilon \right) \leq \frac{Var({\bar{X}}_{n})}{\varepsilon^{2}}
> $$
>
> Taking $\varepsilon = 0.005$, we get
>
> $$
> {\mathbb{P}}\left( |\ {\bar{X}}_{n} - \mu\  \middle| > 0.005 \right) \leq \frac{0.25/n}{(0.005)^{2}} = \frac{0.25}{n \cdot 0.000025} = \frac{10000}{n}
> $$
>
> We want this upper bound to be less than $0.01$, so it is enough to require
>
> $$
> \frac{10000}{n} < 0.01
> $$
>
> Therefore, she needs to measure approximately $n \approx 1,000,000$ resistors.

## Problem 3 {#problem-3-5}

Let $\left( X_{n} \right)_{n \in {\mathbb{N}}}$ be a sequence of random variables with ${\mathbb{P}}\left( {X_{n} \neq 0} \right) = 1/n^{2}$ for all $n \in {\mathbb{N}}$. Show that with probability 1, there exists an $n_{0} \in {\mathbb{N}}$ such that $X_{n} = 0$ for all $n \geq n_{0}$.

> **Proof**
>
> Let
>
> $$
> A_{n} := \left\{ {X_{n} \neq 0} \right\},\quad n \in {\mathbb{N}}
> $$
>
> Then ${\mathbb{P}}(A_{n}) = \frac{1}{n^{2}}$ by assumption. Hence
>
> $$
> \sum\limits_{n = 1}^{\infty}{\mathbb{P}}(A_{n}) = \sum\limits_{n = 1}^{\infty}\frac{1}{n^{2}} < \infty
> $$
>
> By Borel-Cantelli lemma,
>
> $$
> {\mathbb{P}}\left( {\operatorname{lim\, sup}\limits_{n\rightarrow\infty}A_{n}} \right) = 0
> $$
>
> So with probability $1$, only finitely many of the events $A_{n}$ occur. In other words, with probability $1$, there exists $n_{0} \in {\mathbb{N}}$ such that for all $n \geq n_{0}$,
>
> $$
> A_{n}^{c} = \left\{ {X_{n} = 0} \right\}
> $$
>
> occurs. Equivalently,
>
> $$
> X_{n} = 0\qquad\text{for all}\ n \geq n_{0}
> $$
>
> Therefore, with probability $1$, there exists $n_{0} \in {\mathbb{N}}$ such that $X_{n} = 0$ for all $n \geq n_{0}$.

## Problem 4 {#problem-4-5}

Assume that $\left( X_{n} \right)_{n \in {\mathbb{N}}}$ be a sequence of i.i.d random variables with density

$$
f(x) = \left\{ \begin{matrix}
{\frac{1}{2\sqrt{x}},} & {\text{if}\ x \in (0,1),} \\
{0,} & \text{otherwise}
\end{matrix} \right.
$$

- Find the distribution function of $X_{1}$.

- Let $Y_{n} = \min\left\{ {X_{1},\ldots,X_{n}} \right\}$ for any $n \in {\mathbb{N}}$. Show that $n^{2}Y_{n}\overset{d}{\rightarrow}Y$, where $Y$ has distribution function

  $$
  F_{Y}(x) = \left\{ \begin{matrix}
  {0,} & {\text{if}\ x \leq 0} \\
  {1 - e^{- \sqrt{x}},} & \text{otherwise}
  \end{matrix} \right.
  $$

> **Proof**
>
> - For $x \in {\mathbb{R}}$,
>
>   $$
>   F_{X_{1}}(x) = {\mathbb{P}}(X_{1} \leq x) = \int_{- \infty}^{x}f(t)\, dt = \left\{ \begin{matrix}
>   {0,} & {x \leq 0,} \\
>   {\int_{0}^{x}\frac{1}{2\sqrt{t}}\, dt = \sqrt{x},} & {0 < x < 1,} \\
>   {1,} & {x \geq 1.}
>   \end{matrix} \right.
>   $$
>
> - If $x \leq 0$, then $n^{2}Y_{n} \geq 0$, so
>
>   $$
>   {\mathbb{P}}(n^{2}Y_{n} \leq x) = 0
>   $$
>
>   Now consider $x > 0$. Then
>
>   $$
>   {\mathbb{P}}(n^{2}Y_{n} > x) = {\mathbb{P}}\left( {Y_{n} > \frac{x}{n^{2}}} \right)
>   $$
>
>   Since
>
>   $$
>   Y_{n} > \frac{x}{n^{2}}\Leftrightarrow X_{1} > \frac{x}{n^{2}},\ldots,X_{n} > \frac{x}{n^{2}}
>   $$
>
>   and the $X_{i}$ are independent,
>
>   $$
>   {\mathbb{P}}\left( {Y_{n} > \frac{x}{n^{2}}} \right) = \left( {{\mathbb{P}}\left( {X_{1} > \frac{x}{n^{2}}} \right)} \right)^{n}
>   $$
>
>   For all sufficiently large $n$, we have $0 < \frac{x}{n^{2}} < 1$, hence
>
>   $$
>   {\mathbb{P}}\left( {X_{1} > \frac{x}{n^{2}}} \right) = 1 - F_{X_{1}}\left( \frac{x}{n^{2}} \right) = 1 - \sqrt{\frac{x}{n^{2}}} = 1 - \frac{\sqrt{x}}{n}
>   $$
>
>   Therefore,
>
>   $$
>   {\mathbb{P}}(n^{2}Y_{n} > x) = \left( {1 - \frac{\sqrt{x}}{n}} \right)^{n}
>   $$
>
>   so
>
>   $$
>   F_{n^{2}Y_{n}}(x) = {\mathbb{P}}(n^{2}Y_{n} \leq x) = 1 - \left( {1 - \frac{\sqrt{x}}{n}} \right)^{n}
>   $$
>
>   Taking $n\rightarrow\infty$, we use the standard limit
>
>   $$
>   \left( {1 - \frac{a}{n}} \right)^{n}\rightarrow e^{- a}
>   $$
>
>   with $a = \sqrt{x}$, we obtain
>
>   $$
>   F_{n^{2}Y_{n}}(x)\rightarrow 1 - e^{- \sqrt{x}},\quad x > 0
>   $$
>
>   Thus,
>
>   $$
>   F_{n^{2}Y_{n}}(x)\rightarrow\left\{ \begin{matrix}
>   {0,} & {x \leq 0,} \\
>   {1 - e^{- \sqrt{x}},} & {x > 0}
>   \end{matrix} \right.
>   $$
>
>   which is exactly $F_{Y}(x)$. Hence
>
>   $$
>   n^{2}Y_{n}\overset{d}{\rightarrow}Y
>   $$

## Problem 5 {#problem-5-5}

Let $\left( X_{n} \right)_{n \in {\mathbb{N}}}$ be a sequence of random variables with values in $\mathbb{R}$. Show that there exists a sequence $\left( a_{n} \right)_{n \in {\mathbb{N}}}$ with $a_{n} > 0$ such that

$$
\frac{X_{n}}{a_{n}}\overset{\text{a.s.}}{\rightarrow}0
$$

For simplicity you may assume that $X_{n} \sim \text{Exp}(1/n)$.

Hint: For any $n \in {\mathbb{N}}$ construct $b_{n}$ such that ${\mathbb{P}}\left( {\left| X_{n} \right| \geq b_{n}} \right) \leq \frac{1}{2^{n}}$ and use Borel-Cantelli for the events $\left\{ {\left| X_{n} \right|/b_{n} \geq n} \right\}$.

> **Proof**
>
> For each $n \in {\mathbb{N}}$, choose $b_{n} > 0$ such that
>
> $$
> \left. {\mathbb{P}}( \middle| X_{n} \middle| \geq b_{n}) \leq \frac{1}{2^{n}} \right.
> $$
>
> Notice such a choice is always possible, since $|X_{n}|$ is a well-defined random variable, which implies $\left. {\mathbb{P}}( \middle| X_{n} \middle| \geq t)\rightarrow 0 \right.$ as $t\rightarrow\infty$.
>
> Now define
>
> $$
> a_{n} := nb_{n} > 0
> $$
>
> Consider the sequence of events
>
> $$
> E_{n} := \left\{ {\frac{|X_{n}|}{a_{n}} \geq \frac{1}{n}} \right\}
> $$
>
> By the definition of $a_{n}$, we have
>
> $$
> E_{n} = \left\{ {\frac{|X_{n}|}{nb_{n}} \geq \frac{1}{n}} \right\} = \left\{ |X_{n} \middle| \geq b_{n} \right\}
> $$
>
> It follows that
>
> $$
> \left. \sum\limits_{n = 1}^{\infty}{\mathbb{P}}(E_{n}) = \sum\limits_{n = 1}^{\infty}{\mathbb{P}}( \middle| X_{n} \middle| \geq b_{n}) \leq \sum\limits_{n = 1}^{\infty}\frac{1}{2^{n}} < \infty \right.
> $$
>
> By the first Borel-Cantelli lemma,
>
> $$
> {\mathbb{P}}(E_{n}\ \text{infinitely often}) = 0
> $$
>
> This means that for almost all $\omega \in \Omega$, there exists $N(\omega) \in {\mathbb{N}}$ such that: for all $n \geq N(\omega)$, the event $E_{n}$ does not occur, i.e.,
>
> $$
> \frac{|X_{n}(\omega)|}{a_{n}} < \frac{1}{n}
> $$
>
> Since $1/n\rightarrow 0$ as $n\rightarrow\infty$, it follows immediately that
>
> $$
> \frac{X_{n}}{a_{n}}\rightarrow 0\quad\text{a.s.}
> $$
>
> If we assume $X_{n} \sim Exp(1/n)$, we can provide an explicit sequence. Since
>
> $$
> {\mathbb{P}}(X_{n} \geq t) = e^{- t/n}\quad\text{for}\ t \geq 0
> $$
>
> we can choose $b_{n} = n^{2}\log 2$. So that
>
> $$
> {\mathbb{P}}(X_{n} \geq b_{n}) = e^{- (n^{2}\log 2)/n} = e^{- n\log 2} = \frac{1}{2^{n}}
> $$
>
> Then $a_{n} = nb_{n} = n^{3}\log 2$, the general argument above guarantees that
>
> $$
> \frac{X_{n}}{a_{n}} = \frac{X_{n}}{n^{3}\log 2}\overset{\text{a.s.}}{\rightarrow}0
> $$
>
> This completes the proof.

## Problem 6 {#problem-6-5}

Let $\left\{ X_{i} \right\}_{i \geq 1}$ be i.i.d. positive integer-valued random variables with $0 < {\mathbb{E}}\left\lbrack X_{1} \right\rbrack < \infty$. Interpret $X_{i}$ as the number of children in family $i$. From the first $n$ families, choose a child uniformly at random among all children. Let $N_{n}$ denote the number of children in the selected child's family. Show that $N_{n}\overset{d}{\rightarrow}X_{1}^{\ast}$, where $X_{1}^{\ast}$ has distribution

$$
{\mathbb{P}}\left( {X_{1}^{\ast} = k} \right) = \frac{k{\mathbb{P}}\left( {X_{1} = k} \right)}{{\mathbb{E}}\left\lbrack X_{1} \right\rbrack}
$$

> **Proof**
>
> For each $n \in {\mathbb{N}}$, let
>
> $$
> S_{n} := X_{1} + \cdots + X_{n}
> $$
>
> be the total number of children in the first $n$ families.
>
> Given $X_{1},\ldots,X_{n}$, we choose one child uniformly at random among these $S_{n}$ children. Hence, conditionally on $X_{1},\ldots,X_{n}$, the probability that the chosen child comes from a family with exactly $k$ children is
>
> $$
> {\mathbb{P}}(N_{n} = k \mid X_{1},\ldots,X_{n}) = \frac{\sum_{i = 1}^{n}X_{i}\mathbf{1}_{\{{X_{i} = k}\}}}{S_{n}}
> $$
>
> Since $X_{i}\mathbf{1}_{\{{X_{i} = k}\}} = k\mathbf{1}_{\{{X_{i} = k}\}}$, this becomes
>
> $$
> {\mathbb{P}}(N_{n} = k \mid X_{1},\ldots,X_{n}) = \frac{k\sum_{i = 1}^{n}\mathbf{1}_{\{{X_{i} = k}\}}}{S_{n}} = \frac{k \cdot \frac{1}{n}\sum_{i = 1}^{n}\mathbf{1}_{\{{X_{i} = k}\}}}{\frac{1}{n}\sum_{i = 1}^{n}X_{i}}
> $$
>
> By the Strong Law of Large Numbers,
>
> $$
> \frac{1}{n}\sum\limits_{i = 1}^{n}\mathbf{1}_{\{{X_{i} = k}\}}\rightarrow{\mathbb{E}}\lbrack\mathbf{1}_{\{{X_{1} = k}\}}\rbrack = {\mathbb{P}}(X_{1} = k)\quad\text{a.s.}
> $$
>
> and
>
> $$
> \frac{1}{n}\sum\limits_{i = 1}^{n}X_{i}\rightarrow{\mathbb{E}}\lbrack X_{1}\rbrack\quad\text{a.s.}
> $$
>
> Since $0 < {\mathbb{E}}\lbrack X_{1}\rbrack < \infty$, it follows that
>
> $$
> {\mathbb{P}}(N_{n} = k \mid X_{1},\ldots,X_{n})\rightarrow\frac{k{\mathbb{P}}(X_{1} = k)}{{\mathbb{E}}\lbrack X_{1}\rbrack}\quad\text{a.s.}
> $$
>
> Taking expectations on both sides, and using dominated convergence because $0 \leq {\mathbb{P}}(N_{n} = k \mid X_{1},\ldots,X_{n}) \leq 1$, we obtain
>
> $$
> {\mathbb{P}}(N_{n} = k) = {\mathbb{E}}\ \ {\mathbb{P}}(N_{n} = k \mid X_{1},\ldots,X_{n})\rightarrow\frac{k{\mathbb{P}}(X_{1} = k)}{{\mathbb{E}}\lbrack X_{1}\rbrack}
> $$
>
> Thus, for every $k \in {\mathbb{N}}$,
>
> $$
> {\mathbb{P}}(N_{n} = k)\rightarrow{\mathbb{P}}(X_{1}^{\ast} = k)
> $$
>
> Hence
>
> $$
> N_{n}\overset{d}{\rightarrow}X_{1}^{\ast}
> $$

