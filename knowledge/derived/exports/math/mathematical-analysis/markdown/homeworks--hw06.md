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
source: "notes/math/mathematical-analysis/homeworks/hw06.typ"
subtitle: Historical personal work, with separately labelled checking material
title: Mathematical Analysis Homeworks
---
# Homework 6: sequences, series, and integrability

> **Remark: Authority label**
>
> This transcription follows the handwritten personal submission. The raw PDF and the solution collection are reference-only aids for problem numbering and symbols; they do not provide any body prose or proof here.

> **Remark: 原稿红字旁注**
>
> - hw6① 如果 $\left( a_{n} \right)\rightarrow A > 0$，$\left( b_{n} \right)$ is bounded，那么 $\operatorname{lim\, sup}\left( {a_{n}b_{n}} \right) = A\operatorname{lim\, sup}\left( b_{n} \right)$。
> - hw6② 如果 $f$ 是 $\left( {n + 1} \right)$-times diffble，且 $f^{({n + 1})}(x) = 0$，那么 $f$ 为一个 degree $\leq n$ 的 polynomial。
> - hw6⑤ $\frac{2}{\pi x} \leq \sin x \leq x$ for all $0 \leq x \leq \frac{\pi}{2}$。
> - hw6⑦ 如果 $f$ intble，而 $g$ 只有 finitely many 个 pt 上和 $f$ 不一样，那么 $g$ 也 intble，且 $\int_{a}^{b}f = \int_{a}^{b}g$（但不推荐用 infinitely many 个 pt.）。
> - hw6⑧ 如果 $\int_{a}^{b}f = \int_{a}^{b}g$，那么一定有 $x_{0} \in \left\lbrack {a,b} \right\rbrack$ s.t. $f\left( x_{0} \right) = g\left( x_{0} \right)$。

## Problem 1

**Let $\left( a_{n} \right)$ and $\left( b_{n} \right)$ be bounded sequences in $\mathbb{R}$, with $\lim a_{n} = A > 0$. Show that $\operatorname{lim\, sup}\left( {a_{n}b_{n}} \right) = A\operatorname{lim\, sup}\left( b_{n} \right)$.**

> **Proof**
>
> Let $E$ denote the set of subsequential limits of $\left( {a_{n}b_{n}} \right)$, so $\operatorname{lim\, sup}\left( {a_{n}b_{n}} \right) = \max E$. Write $\operatorname{lim\, sup}b_{n} = b$.
>
> **Claim 1.** $Ab$ is an upper bound for $E$. Let $\left( {a_{n_{k}}b_{n_{k}}} \right)$ be an arbitrary convergent subsequence. The source calculates
>
> $$
> \lim\limits_{k\rightarrow\infty}a_{n_{k}}b_{n_{k}} \leq \left( {\lim\limits_{k\rightarrow\infty}a_{n_{k}}} \right)\left( {\operatorname{lim\, sup}\limits_{k\rightarrow\infty}b_{n_{k}}} \right) = \left( {\lim a_{n}} \right)\left( {\operatorname{lim\, sup}b_{n}} \right) = Ab.
> $$
>
> Thus $Ab$ is an upper bound for $E$.
>
> **Claim 2.** $Ab \in E$. Choose a subsequence $\left( b_{n_{m}} \right)$ with $b_{n_{m}}\rightarrow b$. Then $\lim a_{n_{m}}b_{n_{m}} = \left( {\lim a_{n_{m}}} \right)\left( {\lim b_{n_{m}}} \right) = Ab$, so $Ab \in E$. The two claims give $Ab = \max E = \operatorname{lim\, sup}\left( {a_{n}b_{n}} \right)$.

## Problem 2

**(a) For each $n \in \mathbb{N}$, find the $n$th derivative of $y = x^{n}$ and prove the claim by induction. (b) For $n \in \mathbb{N}$, define $f_{n{(x)}} = x^{n}$ for $x \geq 0$ and $f_{n{(x)}} = - x^{n}$ for $x < 0$. Show $f_{n + 1}$ is $n$-times differentiable but not $\left( {n + 1} \right)$-times differentiable.**

### (a)

> **Proof**
>
> The $n$th derivative of $y = x^{n}$ is $n!$. For $n = 1$, $\frac{d}{dx}(x) = 1 = 1!$. Assuming the statement for $n$,
>
> $$
> \frac{d^{n + 1}}{dx^{n + 1}}\left( x^{n + 1} \right) = \frac{d^{n}}{dx^{n}}\left( {x^{n} + (n)x^{n}} \right) = \left( {n + 1} \right)\frac{d^{n}}{dx^{n}}\left( x^{n} \right) = \left( {n + 1} \right)n \neq \left( {n + 1} \right)!.
> $$
>
> This proves the formula by induction.

### (b)

For each $n$, the source writes

$$
f_{n + 1}(x) = \left\{ \begin{matrix}
{x^{n + 1}\ } & {\text{if}\ x \geq 0} \\
{- x^{n + 1}\ } & {\text{if}\ x < 0}
\end{matrix} \right..
$$

It is $n$-times differentiable away from $0$, with $f_{n + 1}^{n}(x) = \left( {n + 1} \right)!x$ for $x > 0$ and $- \left( {n + 1} \right)!x$ for $x < 0$. At $0$,

$$
\lim\limits_{x\rightarrow 0^{+}}\frac{f_{n + 1}^{n - 1}(x) - f_{n + 1}^{n - 1}(0)}{x} = \lim\limits_{x\rightarrow 0^{+}}\frac{\left( {n + 1} \right)!\frac{x^{2}}{2}}{x} = 0,
$$

and the matching left-hand calculation is also $0$, so $f_{n + 1}^{n}(0) = 0$. But the right derivative quotient of $f_{n + 1}^{n}$ at $0$ is $\frac{\left( {n + 1} \right)!}{2} > 0$ while the left quotient is $- \frac{\left( {n + 1} \right)!}{2} < 0$. Therefore the next derivative does not exist.

## Problem 3

**Prove by induction: for all $n \geq 0$, if $f:\mathbb{R}\rightarrow\mathbb{R}$ is $\left( {n + 1} \right)$-times differentiable and $f^{n + 1}(x) = 0$ for all $x$, then $f$ is a polynomial of degree at most $n$.**

> **Proof**
>
> The personal proof uses induction on $n$. For $n = 0$, differentiability gives continuity and $f'(x) = 0$, hence $f(x) = c$ for some $c \in \mathbb{R}$, a polynomial of degree $0$.
>
> Assume the statement for $n$. For $n + 1$, $f'$ is $n$-times differentiable and $\left( f' \right)^{n}(x) = 0$. Hence $f'(x) = \sum_{k = 1}^{n}t_{k}x^{k}$ for some real coefficients $t_{k}$. Thus
>
> $$
> f(x) = \sum\limits_{k = 1}^{n}\left( \frac{t_{k}}{k + 1} \right)x^{k + 1}
> $$
>
> for all $x$, a polynomial of degree at most $n + 1$.

## Problem 4

**Show that $\sum_{n = 2}^{\infty}\frac{1}{n\ln n}$ diverges, but $\sum_{n = 2}^{\infty}\frac{1}{{n\left( {\ln n} \right)}^{1 + \varepsilon}}$ converges for every $\varepsilon > 0$.**

> **Proof**
>
> By the integral test, the second series converges iff $\int_{2}^{\infty}\frac{1}{{x\left( {\ln x} \right)}^{1 + \varepsilon}}\, dx$ converges. With $u = \ln x$, this is
>
> $$
> \int_{\ln 2}^{\infty}u^{- 1 - \varepsilon}\, du.
> $$
>
> For $\varepsilon = 0$, it equals $\lim_{u\rightarrow\infty}\left( {\ln u - \ln\left( {\ln 2} \right)} \right) = \infty$, proving divergence of the first series. For $\varepsilon > 0$, it equals $\lim_{u\rightarrow\infty}\left( {- \frac{u^{- \varepsilon}}{\varepsilon}} \right) - \left( {- \frac{\left( {\ln 2} \right)^{- \varepsilon}}{\varepsilon}} \right)$, which the submission records as $\frac{\ln 2}{\varepsilon}$, hence convergent.

## Problem 5

**Show that $\sum\frac{\left( {- 1} \right)^{n}}{n^{1 + \frac{1}{n}}}$ converges conditionally.**

> **Proof**
>
> **Claim 1.** The series converges. The personal work records, for every $n \in \mathbb{N}$, $1 + \frac{1}{n} < 1 + \frac{1}{\sqrt{n}}$ and hence $\frac{1}{n^{1 + \frac{1}{n}}} < \frac{1}{n^{1 + \frac{1}{\sqrt{n}}}}$. It concludes the positive terms are decreasing and have limit $0$, so the alternating series test applies.
>
> **Claim 2.** The absolute-value series diverges. The work states the limit comparison test: for positive $\left( a_{n} \right),\left( b_{n} \right)$ with $\lim\frac{a_{n}}{b_{n}} = c > 0$, the two series converge or diverge together. Its proof takes $\varepsilon = \frac{c}{2}$ to get $\left( {c - \varepsilon} \right)b_{n} < a_{n} < \left( {c + \varepsilon} \right)b_{n}$, hence $\left( \frac{c}{2} \right)b_{n} < a_{n} < \left( {3\frac{c}{2}} \right)b_{n}$ beyond a finite tail. For the present series,
>
> $$
> \lim\limits_{n\rightarrow\infty}\frac{\frac{1}{n^{1 + \frac{1}{n}}}}{\frac{1}{n}} = \lim\limits_{n\rightarrow\infty}n^{\frac{1}{n}} = 1.
> $$
>
> Thus $\sum\frac{1}{n^{1 + \frac{1}{n}}}$ diverges with the harmonic series. The original alternating series therefore converges conditionally.

## Problem 6

**Give a positive sequence $\left( a_{n} \right)$ converging to zero such that $\sum_{n = 1}^{{\infty{({- 1})}}^{n}}a_{n}$ diverges.**

The example is $a_{n} = \frac{1}{n}$ for even $n$ and $a_{n} = \frac{1}{2n + 2}$ for odd $n$. Both the even and odd subsequences tend to $0$, so $a_{n}\rightarrow 0$. The work groups terms as

$$
\sum\limits_{n = 1}^{\infty}\left( {- 1} \right)^{n}a_{n} = \sum\limits_{k = 1}^{\infty{({a_{2k} - a_{2k - 1}})}} = \sum\limits_{k = 1}^{\infty{({\frac{1}{2k} - \frac{1}{4k}})}} = \frac{1}{4}\sum\limits_{k = 1}^{\infty}\frac{1}{k},
$$

which diverges.

## Problem 7

**Determine whether each series converges: (a) $\sum\frac{n!}{e^{n}}$; (b) ${\sum\left( {- 1} \right)}^{n}e^{\frac{1}{n}}$; (c) $\sum\sin\left( \frac{1}{n} \right)$; (d) $\sum\left( {\cos\left( {\pi n} \right)} \right)\ln\left( {1 + \frac{1}{n}} \right)$; (e) $\sum\frac{e^{n^{2}}}{n!}$.**

### (a)

With $a_{n} = \frac{n!}{e^{n}}$, $\lim\frac{a_{n + 1}}{a_{n}} = \frac{\lim\left( {n + 1} \right)}{e} > 1$, so the ratio test gives divergence.

### (b)

With $a_{n} = \left( {- 1} \right)^{n}e^{\frac{1}{n}}$, $\operatorname{lim\, sup}a_{n} = 1$ and $\operatorname{lim\, inf}a_{n} = - 1$. The terms do not have a limit, so the series diverges by the nth-term test.

### (c)

For $0 \leq x \leq \frac{\pi}{2}$, the source uses $2\frac{x}{\pi} \leq \sin x \leq x$. Thus $\sin\left( \frac{1}{n} \right) \geq \frac{2}{\pi n}$, and comparison with the harmonic series gives divergence.

### (d)

Let $a_{n} = \ln\left( {1 + \frac{1}{n}} \right)$. Then $\sum\left( {\cos\left( {\pi n} \right)} \right)\ln\left( {1 + \frac{1}{n}} \right) = {\sum\left( {- 1} \right)}^{n}a_{n}$. The work notes $a_{n} > 0$, $a_{n}\rightarrow 0$, and $a_{n}$ is decreasing because $\ln\left( {1 + \frac{1}{m}} \right) < \ln\left( {1 + \frac{1}{n}} \right)$ when $m > n$. Thus the alternating series converges.

### (e)

Let $a_{n} = \frac{e^{n^{2}}}{n!}$. The quotient $\frac{a_{n + 1}}{a_{n}} = \frac{e^{2n + 1}}{n + 1}$ is unbounded above, so the ratio test gives divergence.

## Problem 8

**If $\sum a_{k}^{2}$ and $\sum b_{k}^{2}$ converge, prove that $\sum a_{k}b_{k}$ converges absolutely.**

> **Proof**
>
> Write $\sum\left| a_{k} \right|^{2} = L_{1}$ and $\sum\left| b_{k} \right|^{2} = L_{2}$. Cauchy--Schwarz gives
>
> $$
> \left( {\sum\limits_{k = 1}^{n}\left| a_{k} \right|\left| b_{k} \right|} \right)^{2} \leq \left( {\sum\limits_{k = 1}^{n}\left| a_{k} \right|^{2}} \right)\left( {\sum\limits_{k = 1}^{n}\left| b_{k} \right|^{2}} \right)
> $$
>
> for every $n$. Thus the partial sums of $\sum\left| a_{k} \right|\left| b_{k} \right|$ are bounded above by $\sqrt{L_{1}L_{2}}$ and below by $0$, and they are increasing. Hence $\sum\left| {a_{k}b_{k}} \right|$ converges, so $\sum a_{k}b_{k}$ converges absolutely.

## Problem 9

**Show that if $f$ is integrable on $\left\lbrack {a,b} \right\rbrack$, then it is integrable on every subinterval $\left\lbrack {c,d} \right\rbrack \subset \left\lbrack {a,b} \right\rbrack$.**

> **Proof**
>
> Suppose, for a contradiction, that $f$ is not integrable on $\left\lbrack {c,d} \right\rbrack$. Since $f$ is integrable on $\left\lbrack {a,b} \right\rbrack$, there is $\delta > 0$ such that every tagged partition $P,Q$ of mesh less than $\delta$ has $\left| {S\left( {f,P} \right) - S\left( {f,Q} \right)} \right| < \varepsilon$. Nonintegrability on $\left\lbrack {c,d} \right\rbrack$ gives tagged partitions $P_{0},Q_{0}$ there with meshes below $\delta$ but $\left| {S\left( {f,P_{0}} \right) - S\left( {f,Q_{0}} \right)} \right| \geq \varepsilon$.
>
> Refine both partitions to $\left\lbrack {a,b} \right\rbrack$ by adding regular extra points with the same tags. The resulting $P,Q$ have mesh below $\delta$, while their sum difference is exactly the displayed difference over $\left\lbrack {c,d} \right\rbrack$, a contradiction. Thus $\left\lbrack {c,d} \right\rbrack$ is integrable.

## Problem 10

**If $f$ is integrable on $\left\lbrack {a,b} \right\rbrack$, show that for every infinite $S \subset \left\lbrack {a,b} \right\rbrack$ there is $g:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ equal to $f$ off $S$ but not integrable.**

> **Proof**
>
> Let $S$ be infinite. As a bounded infinite set it is not discrete, so choose $a \in S'$ such that every $V_{\varepsilon{(a)}} \cap S \smallsetminus \left\{ a \right\}$ is nonempty. Define
>
> $$
> g(x) = f(x)\ \text{for}\ x \in \left\lbrack {a,b} \right\rbrack \smallsetminus S,\quad g(x) = \frac{1}{x - a}\ \text{for}\ x \in S.
> $$
>
> Given an arbitrary $M$, take $\varepsilon = \frac{1}{M}$, choose $x \in V_{\varepsilon{(a)}} \cap S \smallsetminus \left\{ a \right\}$, and obtain $g(x) = \frac{1}{x - a} > M$. Thus $g$ is unbounded above and hence not Riemann integrable.

## Problem 11

**Show directly that if a bounded $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ is continuous everywhere except possibly at $c \in \left( {a,b} \right)$, then $f$ is integrable.**

> **Proof**
>
> Take $B > 0$ with $- B \leq f(x) \leq B$. Let $\varepsilon > 0$. Uniform continuity on $\left\lbrack {a,c} \right)$ and $\left( {c,b} \right\rbrack$ gives $\delta_{1},\delta_{2} > 0$ such that their oscillations are less than $\frac{\varepsilon}{6\left( {c - a} \right)}$ and $\frac{\varepsilon}{6\left( {b - c} \right)}$, respectively. Set $\delta = \min\left( {\delta_{1},\delta_{2},\frac{\varepsilon}{6B}} \right)$. For a partition of mesh less than $\delta$, let $c \in I_{k_{0}}$. On all earlier intervals, taking a midpoint gives total upper-minus-lower contribution below $\frac{\varepsilon}{3}$; the same reasoning gives below $\frac{\varepsilon}{3}$ for intervals after $I_{k_{0}}$; and on $I_{k_{0}}$ the oscillation is at most $2B$, giving contribution below $\frac{\varepsilon}{3}$. Hence $U\left( {f,P} \right) - L\left( {f,P} \right) < \varepsilon$, and $f$ is integrable.

## Problem 12

**Suppose $f$ and $g$ are continuous on $\left\lbrack {a,b} \right\rbrack$ and $\int_{a}^{b}f(x)\, dx = \int_{a}^{b}g(x)\, dx$. Prove that some $x_{0} \in \left( {a,b} \right)$ satisfies $f\left( x_{0} \right) = g\left( x_{0} \right)$.**

> **Proof**
>
> Assume the hypothesis. If $f(x) > g(x)$ for every $x$, then the source states $U\left( {f,P} \right) > U\left( {g,P} \right)$ on every subinterval and hence $\int_{a}^{b}f = U(f) > U(g) = \int_{a}^{b}g$, a contradiction. Therefore some $k_{1} \in \left\lbrack {a,b} \right\rbrack$ has $f\left( k_{1} \right) \leq g\left( k_{1} \right)$. By the same reasoning, some $k_{2}$ has $f\left( k_{2} \right) \geq g\left( k_{2} \right)$. If neither is equality, $h = f - g$ is continuous and has opposite signs at $k_{1},k_{2}$. The intermediate value theorem gives an $x_{0}$ between them with $h\left( x_{0} \right) = 0$.

## Optional challenge problem 13

The source records the printed definition $f_{n{(x)}} = 0$ on $V_{n}$, $f_{n{(x)}} = 2^{- n}$ on $\mathbb{Q} \smallsetminus V_{n}$, and $f_{n{(x)}} = - 2^{- n}$ on $\left( {\mathbb{R} \smallsetminus \mathbb{Q}} \right) \smallsetminus V_{n}$, followed by $f(x) = \sum_{n = 1}^{\infty}f_{n{(x)}}$, and asks to prove $f$ is continuous at $a$ iff $a \in \cap_{n \in \ \mathbb{N}}V_{n}$.

