---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: MATH 451
date: 2026
description: Transcriptions from the complete selected MATH 451 homework directory. Personal work and answer-key material retain different authority labels.
keywords:
- real analysis
- homework
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/mathematical-analysis/homeworks/hw07.typ"
subtitle: Historical personal work, with separately labelled checking material
title: Mathematical Analysis Homeworks
---
# Homework 7: integration and convergence

> **Remark: Authority label**
>
> This is a transcription of the handwritten personal submission in `451-hw-7.pdf`. The raw assignment and solution collection are checking-only reference material; they supply no substituted proof text.

> **Remark: 原稿红字旁注**
>
> - hw7①（积分中值定理）如果 $f(x)$ ctn on $\left\lbrack {a,b} \right\rbrack$，则有 $c \in \left\lbrack {a,b} \right\rbrack$ s.t. $f(c) = \frac{1}{b - a}\int_{a}^{b}f(x)\, dx$。
> - hw7② 若 $f$ 在 $\left\lbrack {a,b} \right\rbrack$ 上非负且 ctn，只要有一点 $f(x) > 0$ 则 $\int_{a}^{b}f > 0$。
> - hw7③ 在 $\left\lbrack {a,b} \right\rbrack$ 上 intble 的 $f$ 一定有一点 $c \in \left\lbrack {a,b} \right\rbrack$ 使得 $\int_{a}^{c}f = \int_{c}^{b}f$。
> - hw7⑤ 即使 $f_{n}\rightarrow f$ 中每个 $f$ 都 uni. ctn，整体 convergence 的行为也未必 uniform。
> - hw7⑥ 若 $\left( {f_{n} \in C^{1}} \right)$ 的 $\left( f_{n'} \right)$ uni. conv.，且 $\left( f_{n} \right)$ 在一点 conv.，$\Rightarrow\left( f_{n} \right)$ uni. conv.
> - hw7⑦ 任何一个 closed interval 上的 ctn function $f$ 都可以用一个 step function seq. $\left( f_{n} \right)$ 来逼近（欲证 step $\left( f_{n} \right)\rightarrow f$ unily.）。

## Problem 1

**Prove that if $f$ is continuous on $\left\lbrack {a,b} \right\rbrack$, there is $c \in \left\lbrack {a,b} \right\rbrack$ such that $f(c) = \frac{1}{b - a}\int_{a}^{b}f(x)\, dx$.**

> **Proof**
>
> By the extreme value theorem, there are $x_{1},x_{2} \in \left\lbrack {a,b} \right\rbrack$ with $f\left( x_{1} \right) \leq f(x) \leq f\left( x_{2} \right)$ for all $x \in \left\lbrack {a,b} \right\rbrack$. Since $f$ is continuous, it is integrable, and monotonicity gives
>
> $$
> \int_{a}^{b}f\left( x_{1} \right)\, dx \leq \int_{a}^{b}f(x)\, dx \leq \int_{a}^{b}f\left( x_{2} \right)\, dx.
> $$
>
> Hence
>
> $$
> f\left( x_{1} \right) \leq \frac{1}{b - a}\int_{a}^{b}f(x)\, dx \leq f\left( x_{2} \right).
> $$
>
> By continuity of $f$ between $x_{1}$ and $x_{2}$ and the intermediate value theorem, there is $c \in \left\lbrack {x_{1},x_{2}} \right\rbrack$ with the required equality.

## Problem 2

**(a) Let $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ be nonnegative and continuous. Prove that if $f(x) > 0$ for some $x \in \left\lbrack {a,b} \right\rbrack$, then $\int_{a}^{b}f > 0$. (b) Let continuous $f,g:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ have $f(x) \leq g(x)$ for all $x$. Prove that equal integrals imply $f = g$.**

### (a)

> **Proof**
>
> Let $x_{0} \in \left\lbrack {a,b} \right\rbrack$ satisfy $f\left( x_{0} \right) > 0$. By continuity, there is $\varepsilon > 0$ such that $f(x) > 0$ for all $x \in V_{\varepsilon{(x_{0})}} \cap \left\lbrack {a,b} \right\rbrack$ (by HW 4, problem 8). This set is an interval; fix a closed interval $\left\lbrack {c,d} \right\rbrack$ inside it. Then $f$ is integrable on $\left\lbrack {c,d} \right\rbrack$, and by problem 1,
>
> $$
> \int_{c}^{d}f = \left( {d - c} \right)f\left( x_{1} \right) > 0
> $$
>
> for some $x_{1} \in \left\lbrack {c,d} \right\rbrack$. Since $f \geq 0$ on $\left\lbrack {a,b} \right\rbrack$,
>
> $$
> \int_{a}^{b}f = \int_{a}^{c}f + \int_{c}^{d}f + \int_{d}^{b}f > 0.
> $$

### (b)

> **Proof**
>
> Suppose the integrals are equal but $f \neq g$. The function $g - f$ is nonnegative and continuous. Since $f \leq g$ everywhere and $f \neq g$, there is $c \in \left\lbrack {a,b} \right\rbrack$ with $f(c) < g(c)$. Part (a) gives $\int_{a}^{b{({g - f})}} > 0$, that is, $\int_{a}^{b}g > \int_{a}^{b}f$, a contradiction. Therefore $f = g$.

## Problem 3

**(a) If $f$ is integrable on $\left\lbrack {a,b} \right\rbrack$, prove there is $c \in \left\lbrack {a,b} \right\rbrack$ with $\int_{a}^{c}f = \int_{c}^{b}f$. (b) Give an example showing $c$ need not be in $\left( {a,b} \right)$.**

### (a)

> **Proof**
>
> By the fundamental theorem of calculus, $F(x) = \int_{a}^{x}f(y)\, dy$ is continuous on $\left\lbrack {a,b} \right\rbrack$. Since
>
> $$
> 0 = F(a) < \frac{F(a) + F(b)}{2} < F(b) = \int_{a}^{b}f,
> $$
>
> the intermediate value theorem gives $c \in \left\lbrack {a,b} \right\rbrack$ with $F(c) = \frac{F(a) + F(b)}{2}$. Therefore
>
> $$
> \int_{a}^{c}f = \int_{c}^{b}f = \frac{1}{2}\int_{a}^{b}f.
> $$

### (b)

Take $a = 0$, $b = 2\pi$, and $f(x) = \sin(x)$. It is continuous and integrable on $\left\lbrack {a,b} \right\rbrack$, and $c = a$ gives $\int_{a}^{c}f = \int_{c}^{b}f = 0$.

## Problem 4

**Compute: (a) $\lim_{x\rightarrow 0}\frac{1}{x}\int_{0}^{x}e^{t^{2}}\, dt$; (b) $\lim_{h\rightarrow 0}\int_{3}^{3 + h}e^{t^{2}}\, dt$.**

### (a)

Since $e^{t^{2}}$ is continuous at $0$, the fundamental theorem gives $F(x) = \int_{0}^{x}e^{t^{2}}\, dt$ differentiable at $0$. Thus

$$
\lim\limits_{x\rightarrow 0}\frac{\int_{0}^{x}e^{t^{2}}\, dt}{x} = \lim\limits_{x\rightarrow 0}\frac{F(x) - F(0)}{x - 0} = F'(0) = e^{0^{2}} = 1.
$$

### (b)

The submission rewrites

$$
\lim\limits_{h\rightarrow 0}\int_{3}^{3 + h}e^{t^{2}}\, dt = \lim\limits_{h\rightarrow 0}\left( {\frac{\int_{3}^{3 + h}e^{t^{2}}\, dt - 0}{h - 0} \cdot h} \right).
$$

The derivative factor tends to $e^{3^{2}}$ by the fundamental theorem and $h\rightarrow 0$, so the limit is $e^{9} \cdot 0 = 0$.

## Problem 5

**For $x \geq 0$ and $n \in \mathbb{N}$, let $f_{n{(x)}} = \frac{x^{n}}{1 + x^{n}}$. (a) Find the pointwise limit. (b) Prove uniform convergence on $\left\lbrack {0,b} \right\rbrack$ for $0 < b < 1$. (c) Decide uniform convergence on $\left\lbrack {0,1} \right\rbrack$.**

### (a)

The source computes

$$
f(x) = \lim\limits_{n\rightarrow\infty}f_{n{(x)}} = \left\{ \begin{matrix}
{0\ } & {\text{if}\ x \in \left\lbrack {0,1} \right)} \\
{\frac{1}{2}\ } & {\text{if}\ x = 1} \\
{1\ } & {\text{if}\ x > 1}
\end{matrix} \right..
$$

Indeed, $x^{n}\rightarrow 0$ for $x \in \left\lbrack {0,1} \right)$, $x^{n} = 1$ at $x = 1$, and $\frac{1}{1 + x^{n}}\rightarrow 0$ for $x > 1$.

### (b)

> **Proof**
>
> Let $0 < b < 1$ and $\varepsilon > 0$. For $0 \leq x \leq b$, $x^{n} \leq b^{n}$, and hence $\frac{1}{1 + x^{n}} \geq \frac{1}{1 + b^{n}}$. Since $\frac{1}{1 + b^{n}}\rightarrow 1$, choose $N$ with $\left| {\frac{1}{1 + b^{n}} - 1} \right| < \varepsilon$ for $n \geq N$. Then
>
> $$
> \left| {\frac{1}{1 + x^{n}} - 1} \right| < 1 - \frac{1}{1 + x^{n}} \leq 1 - \frac{1}{1 + b^{n}} < \varepsilon
> $$
>
> for all $x \in \left\lbrack {0,b} \right\rbrack$. Thus $f_{n}$ converges uniformly on $\left\lbrack {0,b} \right\rbrack$.

### (c)

The sequence does not converge uniformly to $f$ on $\left\lbrack {0,1} \right\rbrack$. Take $\varepsilon = \frac{1}{4}$ and let $n \in \mathbb{N}$ be arbitrary. Since $\lim_{x\rightarrow 1^{-}}f_{n{(x)}} = \frac{1}{2}$, there is $\delta > 0$ such that $f_{n{(x)}} \in \left( {\frac{1}{4},\frac{3}{4}} \right)$ whenever $1 > x > 1 - \delta$. Take $x_{0} \in \left( {1 - \delta,1} \right)$. Then $f\left( x_{0} \right) = 0$ and $\left| {f_{n{(x_{0})}} - f\left( x_{0} \right)} \right| = f_{n{(x_{0})}} > \frac{1}{4}$.

## Problem 6

**If $\left( f_{n} \right)$ is a sequence of uniformly continuous functions on $\left( {a,b} \right)$ and $f_{n}\rightarrow f$ uniformly, prove that $f$ is uniformly continuous.**

> **Proof**
>
> Let $\varepsilon > 0$. Choose $N$ such that $\left| {f_{N{(x)}} - f(x)} \right| < \frac{\varepsilon}{3}$ for all $x \in \left( {a,b} \right)$. Since $f_{N}$ is uniformly continuous, choose $\delta > 0$ with $\left| {f_{N{(x)}} - f_{N{(y)}}} \right| < \frac{\varepsilon}{3}$ whenever $\left| {x - y} \right| < \delta$. Then
>
> $$
> \left| {f(x) - f(y)} \right| \leq \left| {f_{N{(x)}} - f(x)} \right| + \left| {f_{N{(x)}} - f_{N{(y)}}} \right| + \left| {f_{N{(y)}} - f(y)} \right| < \varepsilon.
> $$

## Problem 7

**Give a sequence of continuous $f_{n}:\left\lbrack {0,1} \right\rbrack\rightarrow\mathbb{R}$ converging pointwise but not uniformly to a continuous limit.**

Take

$$
f_{n{(x)}} = \left\{ \begin{matrix}
{n^{2}x\ } & {\text{if}\ 0 \leq x \leq \frac{1}{n}} \\
{2n - n^{2}x\ } & {\text{if}\ \frac{1}{n} < x < \frac{2}{n}} \\
{0\ } & {\text{if}\ \frac{2}{n} \leq x}
\end{matrix} \right..
$$

Then $f_{n}\rightarrow f = 0$ pointwise on $\left\lbrack {0,1} \right\rbrack$. But with $\varepsilon = 1$, for arbitrary $n$ choose $x = \frac{1}{n}$; then $f_{n{(x)}} = n \geq 1$, so the convergence is not uniform.

## Problem 8

**Let $\left( f_{n} \right)$ be a sequence of $C^{1}$ functions on $\left\lbrack {0,1} \right\rbrack$ such that $\left( f_{n'} \right)$ converges uniformly. Prove that if $\left( f_{n{(a)}} \right)$ converges for some $a \in \left\lbrack {0,1} \right\rbrack$, then $\left( f_{n{(x)}} \right)$ converges for all $x \in \left\lbrack {0,1} \right\rbrack$.**

> **Proof**
>
> Let $\varepsilon > 0$. The source chooses $N$ so that, for $m,n \geq N$,
>
> $$
> \left| {f_{m'}(x) - f_{n'}(x)} \right| < \frac{\varepsilon}{2\left( {b - a} \right)}
> $$
>
> for all $x \in \left\lbrack {0,1} \right\rbrack$, and $\left| {f_{m{(a)}} - f_{n{(a)}}} \right| < \frac{\varepsilon}{2}$. For an arbitrary $x \in \left\lbrack {0,1} \right\rbrack$, the fundamental theorem gives
>
> $$
> \left| {f_{m{(x)}} - f_{n{(x)}}} \right| \leq \left| {f_{m{(a)}} - f_{n{(a)}}} \right| + \left| {\int_{a}^{x{({f_{m'}{(t)} - f_{n'}{(t)}})}}\, dt} \right| < \frac{\varepsilon}{2} + \frac{\varepsilon}{2\left( {b - a} \right)}\left| {x - a} \right| < \varepsilon.
> $$
>
> Thus $\left( f_{n} \right)$ is uniformly Cauchy and hence converges uniformly on $\left\lbrack {0,1} \right\rbrack$.

## Problem 9

**A step function on $\left\lbrack {a,b} \right\rbrack$ is constant on every open part of a finite partition. Prove that every continuous $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ is the uniform limit of step functions $f_{n}$ satisfying $f_{n{(x)}} \leq f(x)$.**

> **Proof**
>
> For $n \in \mathbb{N}$, let $P_{n} = \left\{ {x_{0},x_{1},\ldots,x_{n}} \right\}$ where $x_{k} = a + \frac{k\left( {b - a} \right)}{n}$, and define
>
> $$
> f_{n{(x)}} = \inf\limits_{y \in {\lbrack{x_{k - 1},x_{k}}\rbrack}}f(y)
> $$
>
> when $x \in \left\lbrack {x_{k - 1},x_{k}} \right\rbrack$. Then $f_{n{(x)}} \leq f(x)$.
>
> Let $\varepsilon > 0$. Uniform continuity of $f$ gives $\delta > 0$ such that $\left| {f(x) - f(y)} \right| < \varepsilon$ if $\left| {x - y} \right| < \delta$. Choose $N$ with $\frac{b - a}{N} < \delta$. For $n \geq N$ and $x \in \left\lbrack {a,b} \right\rbrack$, take the partition interval containing $x$. The extreme value theorem gives $x_{0}$ in it with $f_{n{(x)}} = f\left( x_{0} \right)$; then
>
> $$
> \left| {f_{n{(x)}} - f(x)} \right| = \left| {f\left( x_{0} \right) - f(x)} \right| < \varepsilon.
> $$
>
> Thus $f_{n}\rightarrow f$ uniformly.

## Problem 10

**Suppose $\sum c_{n}x^{n}$ is a power series with $\lim\left| \frac{c_{n + 1}}{c_{n}} \right| = L > 0$. Prove convergence for $x \in \left( {- R,R} \right)$ and divergence for $\begin{matrix}
{x \in \mathbb{R}} \\
\left\lbrack {- R,R} \right\rbrack
\end{matrix}$, where $R = \frac{1}{L}$.**

> **Proof**
>
> If $- R < x < R = \frac{1}{L}$, then $|x|\lim\left| \frac{c_{n + 1}}{c_{n}} \right| < 1$, so
>
> $$
> \lim\left| \frac{c_{n + 1}x^{n + 1}}{c_{n}x^{n}} \right| < 1.
> $$
>
> The ratio test gives absolute convergence. Likewise, when $|x| > R$, this quotient limit is greater than $1$, so the series diverges by the ratio test.

## Problem 11

**Find radii and exact intervals of convergence: (a) $\sum n^{2}x^{n}$; (b) $\sum\left( \frac{2^{n}}{n^{2}} \right)x^{n}$; (c) $\sum\left( \frac{2^{n}}{n!} \right)x^{n}$.**

### (a)

$\lim\left| \frac{\left( {n + 1} \right)^{2}}{n^{2}} \right| = 1$, so the radius is $1$. At $x = 1$, $\sum n^{2}$ diverges; at $x = - 1$, ${\sum\left( {- 1} \right)}^{n}n^{2} = \sum_{k = 1}^{\infty{({2k - {({2k - 1})}})}} = \sum 4k - 1$ diverges. Thus the interval is $\left( {- 1,1} \right)$.

### (b)

$$
\lim\left| \frac{\frac{2^{n + 1}}{\left( {n + 1} \right)^{2}}}{\frac{2^{n}}{n^{2}}} \right| = 2,
$$

so the radius is $\frac{1}{2}$. At $x = \frac{1}{2}$, the series is $\sum\frac{1}{n^{2}}$, and at $x = - \frac{1}{2}$ it is $\frac{{\sum\left( {- 1} \right)}^{n}}{n^{2}}$; both converge. The interval is $\left\lbrack {- \frac{1}{2},\frac{1}{2}} \right\rbrack$.

### (c)

$$
\lim\left| \frac{\frac{2^{n + 1}}{\left( {n + 1} \right)!}}{\frac{2^{n}}{n!}} \right| = \lim\frac{2}{n + 1} = 0.
$$

The radius is infinity and the interval is $\mathbb{R}$.

## Problem 12

**Define $f:\mathbb{R}\rightarrow\mathbb{R}$ by $f(x) = e^{- \frac{1}{x^{2}}}$ for $x \neq 0$ and $f(0) = 0$. (a) Show by induction that $f^{n}(x) = p\left( \frac{1}{x} \right)f(x)$ for $x \neq 0$, with $p$ a polynomial. (b) Show $\lim_{x\rightarrow 0}p\left( \frac{1}{x} \right)f(x) = 0$ for every polynomial $p$. (c) Show $f^{n}(0)$ exists and equals $0$. (d) Give the stated $C^{\infty}$ example.**

### (a)

> **Proof**
>
> The base case is
>
> $$
> f'(x) = \left( e^{- \frac{1}{x^{2}}} \right)\left( {2x^{- 3}} \right) = 2\left( \frac{1}{x} \right)^{3}f(x).
> $$
>
> For the induction step, suppose $f^{n}(x) = p\left( \frac{1}{x} \right)f(x)$, where $p\left( \frac{1}{x} \right) = \sum_{k = 1}^{q}c_{k{(\frac{1}{x})}}^{k}$. Then
>
> $$
> f^{n + 1}(x) = f(x)p'\left( \frac{1}{x} \right) + f(x)\sum\limits_{k = 1}^{q} - qc_{k{(\frac{1}{x})}}^{k + 1},
> $$
>
> the product of $f(x)$ and another polynomial in $\frac{1}{x}$.

### (b)

Let $p\left( \frac{1}{x} \right) = \sum_{k = 1}^{q}c_{k{(\frac{1}{x})}}^{k}$. The source applies L'Hopital's rule, $k$ times, term-by-term to $c_{k}\frac{e^{- \frac{1}{x^{2}}}}{x^{k}}$ and obtains $0$. Thus $\lim_{x\rightarrow 0}p\left( \frac{1}{x} \right)f(x) = \sum 0 = 0$.

### (c)

> **Proof**
>
> Induct on $n$. For $n = 1$,
>
> $$
> f'(0) = \lim\limits_{x\rightarrow 0}\frac{f(x) - f(0)}{x - 0} = \lim\limits_{x\rightarrow 0}\frac{f(x)}{x} = 0
> $$
>
> by part (b). If $f^{n}(0) = 0$, then
>
> $$
> f^{n + 1}(0) = \lim\limits_{x\rightarrow 0}\frac{f^{n}(x) - f^{n}(0)}{x - 0} = \lim\limits_{x\rightarrow 0}\left( \frac{1}{x} \right)p\left( \frac{1}{x} \right)f(x) = 0
> $$
>
> for some polynomial $p$, again by part (b).

### (d)

The source gives $g(x) = e^{- \frac{1}{x^{2}}}$ for $x \neq 0$ and $g(0) = 0$.

## Problems 13--14

The final two printed problems have no personal handwritten response.

- **(13a)** The piecewise $f_{n}:\left( {- 1,1} \right)\rightarrow\mathbb{R}$ made of $- x - 2^{- n - 1}$, $2^{n - 1}x^{2}$, and $x - 2^{- n - 1}$ is to be shown differentiable and uniformly convergent to $|x|$; **(13b)** $g_{n{(x)}} = \frac{\sin\left( {nx} \right)}{n}$ is to be used to show that uniform convergence need not commute with derivatives.
- **(14)** Enumerate $\mathbb{Q} = \left\{ {q_{n}:n \in \mathbb{N}} \right\}$, set $f_{n{(x)}} = 4^{- n}\sin\left( \frac{1}{x - q_{n}} \right)$ on $\begin{matrix}
  \mathbb{R} \\
  \left\{ q_{n} \right\}
  \end{matrix}$, and prove convergence and continuity on the irrational domain while limits fail at rational points.
