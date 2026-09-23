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
source: "notes/math/mathematical-analysis/homeworks/hw04.typ"
subtitle: Historical personal work, with separately labelled checking material
title: Mathematical Analysis Homeworks
---
# Homework 4: limits and closure

> **Remark: Authority label**
>
> This transcription follows the personal handwritten work in `451-hw-4.pdf`. The raw assignment and sample solutions are used only to check problem numbering and notation; they are not substituted for personal work.

> **Remark: 原稿红字旁注**
>
> - hw4① $\lim\left( {a_{n + 1} - a_{n}} \right) = 0$ 未必有 $\left( a_{n} \right)$ conv.；反例：$a_{n} = \sqrt{n}$。
> - hw4③ $\forall A \subset \mathbb{R}$，都有 $A'$、$\operatorname{cl}(A)$ 为 closed 的，且 $\operatorname{cl}(A)$ 为最小的含 $A$ 闭集。
> - hw4④ composition limit law 需搞清楚 upper/lower limit。
> - hw4⑤ $\operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}} \leq \operatorname{lim\, sup}\left| \frac{a_{n + 1}}{a_{n}} \right|$。
> - hw4⑦ 如果 $A \subset \mathbb{R}$ 不是 closed，那么 $A$ 上存在 unbounded ctn function。

## Problem 1

**Do Challenge Problem (14) from HW 2: if $\left( a_{n} \right)$ is a sequence in $\mathbb{R}$ and $\lim_{n\rightarrow\infty}\left( {a_{n + 1} - a_{n}} \right) = 0$, must $\left( a_{n} \right)$ converge? Justify your answer.**

No. A counterexample is $a_{n} = \sqrt{n}$. Then

$$
\lim\limits_{n\rightarrow\infty}\left( {a_{n + 1} - a_{n}} \right) = \lim\limits_{n\rightarrow\infty}\left( {\sqrt{n + 1} - \sqrt{n}} \right) = \lim\limits_{n\rightarrow\infty}\frac{1}{\sqrt{n + 1} + \sqrt{n}} = 0,
$$

but $\lim_{n\rightarrow\infty}a_{n} = \lim_{n\rightarrow\infty}\sqrt{n} = \infty$.

## Problem 2

**Let $\left( a_{n} \right)$ be a sequence in $\mathbb{R}$, and let $S \subset \mathbb{R}$ be its set of real subsequential limits. Prove that $S$ is closed.**

> **Proof**
>
> Let $c \in S'$ be arbitrary. We show $c \in S$: that is, there is a subsequence of $\left( a_{n} \right)$ converging to $c$.
>
> Let $m \in \mathbb{N}$. Since $c \in S'$, $V_{\frac{1}{2m}}(c) \cap S \smallsetminus \left\{ c \right\} \neq \varnothing$. Choose $x \in V_{\frac{1}{2m}}(c) \cap S \smallsetminus \left\{ c \right\}$. Then $x \in S$ and $\left| {x - c} \right| \leq \frac{1}{2m}$, so there is a subsequence $\left( a_{n_{k}} \right)$ of $\left( a_{n} \right)$ such that $a_{n_{k}}\rightarrow x$ as $k\rightarrow\infty$, where $\left( n_{k} \right)$ is monotonically increasing. Hence there is $K_{m} \in \mathbb{N}$ such that, for all $k \geq K_{m}$, $\left| {a_{n_{k}} - x} \right| \leq \frac{1}{2m}$.
>
> Construct $\left( b_{m} \right)$ recursively. For $m = 1$, choose $a_{n_{k}}$ as $b_{m}$. If $m > 1$ and $b_{m - 1} = a_{n_{k_{0}}}$, take $k = \max\left( {K_{m},k_{0}} \right) + 1$ and choose $a_{n_{k}}$ as $b_{m}$. Then
>
> $$
> \left| {b_{m} - c} \right| \leq \left| {b_{m} - x} \right| + \left| {x - c} \right| \leq \frac{1}{m}.
> $$
>
> Thus $\left( b_{m} \right)$ is a subsequence of $\left( a_{n} \right)$, because every term is a term of $\left( a_{n} \right)$ with increasing index. For $\varepsilon > 0$, choose $n \in \mathbb{N}$ with $\varepsilon > \frac{1}{n}$, and take $N = n + 1$. Then $\left| {b_{m} - c} \right| \leq \frac{1}{m + 1} < \varepsilon$ for every $m \geq N$. Thus $b_{m}\rightarrow c$.
>
> We have proved $c$ is a subsequential limit of $\left( a_{n} \right)$. Since $c$ was arbitrary, $S' \subset S$, so $S$ is closed.

## Problem 3

**Given $A \subset \mathbb{R}$, write $A'$ for the set of all limit points of $A$ and define $\operatorname{cl}(A) = A \cup A'$. (a) Prove that $A'$ is closed. (b) Prove that $\operatorname{cl}(A)$ is closed. (c) Prove that $\operatorname{cl}(A)$ is the smallest closed set containing $A$.**

### (a)

> **Proof**
>
> Let $c \in \left( A' \right)^{c}$. Then $c$ is not a limit point of $A$, so for some $\varepsilon > 0$,
>
> $$
> V_{\varepsilon{(c)}} \cap A \smallsetminus \left\{ c \right\} = \varnothing.
> $$
>
> Let $x \in V_{\frac{\varepsilon}{2}}(c)$ be arbitrary. Since $\left| {x - c} \right| < \frac{\varepsilon}{2}$, $V_{|{x - c}|}(x) \cap A = \varnothing$. Thus $x \notin A'$, which implies $x \in \left( A' \right)^{c}$. Hence $V_{\frac{\varepsilon}{2}}(c) \subset \left( A' \right)^{c}$. Since $c$ is arbitrary, $\left( A' \right)^{c}$ is open, and so $A'$ is closed.

### (b)

> **Proof**
>
> Let $c \in \left( {\operatorname{cl}(A)} \right)^{c}$. Then $c \notin A$ and $c \notin A'$. Fix $\varepsilon > 0$ such that $V_{\frac{\varepsilon}{2}}(c) \cap A \smallsetminus \left\{ c \right\} = \varnothing$. Since $c \notin A$, also $V_{\frac{\varepsilon}{2}}(c) \cap A = \varnothing$. If $x \in V_{\frac{\varepsilon}{2}}(c)$, then $x \notin A$ and $V_{\frac{\varepsilon}{2}}(x) \subset V_{\varepsilon{(c)}}$, so $V_{\frac{\varepsilon}{2}}(x) \cap A = \varnothing$ and $x \notin A'$. Therefore $V_{\frac{\varepsilon}{2}}(c) \subset \left( {\operatorname{cl}(A)} \right)^{c}$. Thus $\left( {\operatorname{cl}(A)} \right)^{c}$ is open, and $\operatorname{cl}(A)$ is closed.

### (c)

> **Proof**
>
> Let $F$ be a closed set with $A \subset F$. Let $a \in A'$ be arbitrary and let $\left( a_{n} \right)$ be a sequence in $A$ converging to $a$. Since $A \subset F$ and $F$ is closed, $a = \lim a_{n} \in F$. Thus $A' \subset F$, so $\operatorname{cl}(A) = A' \cup A \subset F$. Since $F$ was arbitrary, this proves that $\operatorname{cl}(A)$ is the smallest closed set containing $A$.

## Problem 4

**(a) Prove explicitly using the $\frac{\varepsilon}{\delta}$ definition that $\lim_{x\rightarrow 2}x^{3} = 8$. (b) Given $\varepsilon > 0$, find the largest $\delta > 0$ such that $\left| {x^{3} - 8} \right| < \varepsilon$ whenever $\left| {x - 2} \right| < \delta$. (c) Prove explicitly using the $\frac{\varepsilon}{\delta}$ definition that $\lim_{x\rightarrow 4}\sqrt{x} = 2$. (d) Given $\varepsilon > 0$, find the largest $\delta > 0$ such that $\left| {\sqrt{x} - 2} \right| < \varepsilon$ whenever $\left| {x - 4} \right| < \delta$.**

### (a)

> **Proof**
>
> Let $\varepsilon > 0$. Since
>
> $$
> \left| {x^{3} - 8} \right| = \left| {x - 2} \right|\left| {x^{2} + 2x + 4} \right|,
> $$
>
> and, for $1 < x < 3$, $\left| {x^{2} + 2x + 4} \right| = \left( {x + 1} \right)^{2} + 3 \in \left\lbrack {3,19} \right\rbrack$, take $\delta = \min\left( {1,\frac{\varepsilon}{19}} \right)$. If $0 < \left| {x - 2} \right| < \delta$, then
>
> $$
> \left| {x^{3} - 8} \right| < \delta \cdot 19 < \varepsilon.
> $$
>
> Hence $\lim_{x\rightarrow 2}x^{3} = 8$.

### (b)

For $\varepsilon > 0$ we want $\left( {2 - \delta} \right)^{3} \geq 8 - \varepsilon$ and $\left( {2 + \delta} \right)^{3} \leq 8 + \varepsilon$. Thus

$$
\delta \leq 2 - \sqrt[3]{8 - \varepsilon}\quad\text{and}\quad\delta \leq \sqrt[3]{8 + \varepsilon} - 2.
$$

The personal calculation records the largest value as $\delta = \sqrt[3]{8 + \varepsilon} - 2$.

### (c)

> **Proof**
>
> Let $\varepsilon > 0$. Since
>
> $$
> \left| {\sqrt{x} - 2} \right| = \frac{\left| {x - 4} \right|}{\left| {\sqrt{x} + 2} \right|}
> $$
>
> and $\left| {\sqrt{x} + 2} \right| \geq 2$, take $\delta = \varepsilon$. If $0 < \left| {x - 4} \right| < \delta$, then
>
> $$
> \left| {\sqrt{x} - 2} \right| < \frac{\delta}{2} \leq \delta < \varepsilon.
> $$
>
> Hence $\lim_{x\rightarrow 4}\sqrt{x} = 2$.

### (d)

For $\varepsilon > 0$ we want $\sqrt{4 + \delta} \leq 2 + \varepsilon$ and $\sqrt{4 - \delta} \geq 2 - \varepsilon$. Thus

$$
\delta \leq \left( {2 + \varepsilon} \right)^{2} - 4\quad\text{and}\quad\delta \leq \left( {2 - \varepsilon} \right)^{2} - 4.
$$

The personal calculation records the largest value as $\delta = \left( {2 + \varepsilon} \right)^{2} - 4$.

## Problem 5

**Let $A \subset \mathbb{R}$, let $f:A\rightarrow\mathbb{R}$, suppose $a \in \mathbb{R}$ is a limit point of $A \cap \left( {a,\infty} \right)$, and suppose $\lim_{x\rightarrow a^{+}}f(x) = \infty$. Let $g:\left( {c,\infty} \right)\rightarrow\mathbb{R}$ and suppose $\lim_{x\rightarrow\infty}g(x) = L \in \mathbb{R}$. Prove that $\lim_{x\rightarrow a^{+}}\left( {g \circ f} \right)(x) = L$.**

> **Proof**
>
> Let $\varepsilon > 0$. There is $N \in \mathbb{R}$ such that $\left| {g(x) - L} \right| < \varepsilon$ whenever $x \geq N$. Also, since $\lim_{x\rightarrow a^{+}}f(x) = \infty$, there is $\delta > 0$ such that $f(x) \geq N$ whenever $0 < x - a < \delta$. Therefore, if $a < x < a + \delta$, then $\left| {g\left( {f(x)} \right) - L} \right| < \varepsilon$. Hence $\lim_{x\rightarrow a^{+}}\left( {g \circ f} \right)(x) = L$.

## Problem 6

**Let $f,g:\mathbb{R}\rightarrow\mathbb{R}$, let $a \in \mathbb{R}$, and suppose $\lim_{x\rightarrow a}f(x) = b$ and $\lim_{x\rightarrow b}g(x) = L$. Show by example that $L$ need not be the limit of $g \circ f$ as $x\rightarrow a$.**

Consider $f(x) = 0$ if $x \neq 1$, and $f(1) = 1$. Also, let $g(0) = 2$ and $g(x) = 0$ if $x \neq 0$. Then $\lim_{x\rightarrow 1}f(x) = 0$ and $L = \lim_{x\rightarrow 0}g(x) = 0$, but $g\left( {f(x)} \right) = 2$ if $x \neq 1$ and $g\left( {f(1)} \right) = 0$. Hence $\lim_{x\rightarrow 1}g\left( {f(x)} \right) = 2 \neq 0$.

## Problem 7

**Prove that for any sequence $\left( a_{n} \right)$ of nonzero real numbers, $\operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}} \leq \operatorname{lim\, sup}\left| \frac{a_{n + 1}}{a_{n}} \right|$.**

> **Proof**
>
> Let $L > \operatorname{lim\, sup}\left| \frac{a_{n + 1}}{a_{n}} \right|$ be arbitrary. Then there is $N \in \mathbb{N}$ such that $\left| \frac{a_{n + 1}}{a_{n}} \right| < L$ whenever $n \geq N$. For $n \geq N$,
>
> $$
> \left| a_{n} \right| = \left| \frac{a_{n}}{a_{n - 1}} \right| \cdot \left| \frac{a_{n - 1}}{a_{n - 2}} \right|\ldots\left| \frac{a_{N + 1}}{a_{N}} \right| \cdot \left| a_{N} \right| < L^{n - N}\left| a_{N} \right|.
> $$
>
> Hence
>
> $$
> \left| a_{n} \right|^{\frac{1}{n}} < L^{\frac{n - N}{n}}\left| a_{N} \right|^{\frac{1}{n}} = L\sqrt[n]{L^{- N}\left| a_{N} \right|}.
> $$
>
> The final factor tends to $1$, and hence $\operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}} \leq L$. Since this holds for every $L > \operatorname{lim\, sup}\left| \frac{a_{n + 1}}{a_{n}} \right|$, the required inequality follows.

## Problem 8

**Let $A \subset \mathbb{R}$, suppose $a \in A \cap A'$, and let $f:A\rightarrow\mathbb{R}$. Prove that if $f(a) > 0$ and $f$ is continuous at $a$, then there is $\varepsilon > 0$ such that $f$ is positive and bounded on $A \cap V_{\varepsilon{(a)}}$.**

> **Proof**
>
> Since $f$ is continuous at $a$, there is $\varepsilon > 0$ such that $\left| {f(a) - f(x)} \right| < f(a)$ whenever $\left| {a - x} \right| < \varepsilon$ and $x \in A$. Thus $0 < f(x) < 2f(a)$ whenever $x \in V_{\varepsilon{(a)}} \cap A$. Therefore $f$ is positive and bounded on $A \cap V_{\varepsilon{(a)}}$.

## Problem 9

**Suppose $f,g:\mathbb{R}\rightarrow\mathbb{R}$ are continuous. Prove that if $f(x) = g(x)$ for all $x \in \mathbb{Q}$, then $f = g$.**

> **Proof**
>
> Let $a \in \mathbb{R} \smallsetminus \mathbb{Q}$ be arbitrary, and let $\varepsilon > 0$. By continuity of $f$, there is $\delta > 0$ such that $\left| {f(x) - f(a)} \right| < \frac{\varepsilon}{2}$ whenever $x \in V_{\delta{(a)}}$. By density of $\mathbb{Q}$ in $\mathbb{R}$, choose $q \in \mathbb{Q} \cap V_{\delta{(a)}}$. Then $\left| {f(a) - f(q)} \right| < \frac{\varepsilon}{2}$; similarly, $\left| {g(q) - g(a)} \right| < \frac{\varepsilon}{2}$. Since $q \in \mathbb{Q}$, $f(q) = g(q)$, and so
>
> $$
> \left| {f(a) - g(a)} \right| \leq \left| {f(a) - f(q)} \right| + \left| {f(q) - g(a)} \right| < \varepsilon.
> $$
>
> Thus $f(a) = g(a)$. Since $a$ was arbitrary, $f = g$ on $\mathbb{Q} \cup \left( {\mathbb{R} \smallsetminus \mathbb{Q}} \right) = \mathbb{R}$.

## Problem 10

**Prove that if $A \subset \mathbb{R}$ is not closed, then there is an unbounded continuous function $f:A\rightarrow\mathbb{R}$.**

> **Proof**
>
> Since $A$ is not closed, choose $c \in A'$ with $c \notin A$. Define $f:A\rightarrow\mathbb{R}$ by $f(x) = \frac{1}{\left| {x - c} \right|}$. This is well defined, and is continuous as a composition of the continuous rational function $\frac{1}{x - c}$ and the absolute-value function.
>
> Let $m \in \mathbb{N}$. Since $c \in A'$, there is $x \in A$ with $0 < \left| {x - c} \right| < \frac{1}{m}$. Thus $f(x) > m$. Hence $f$ is unbounded.

## Problem 11

**Using only the definitions of continuity and open set, prove that for any $f:\mathbb{R}\rightarrow\mathbb{R}$, $f$ is continuous if and only if $f^{- 1}\lbrack V\rbrack$ is open for every open set $V \subset \mathbb{R}$.**

> **Proof**
>
> Suppose $f$ is continuous and let $V \subset \mathbb{R}$ be open. If $x \in f^{- 1}\lbrack V\rbrack$, then $f(x) \in V$, so there is $\varepsilon > 0$ with $V_{\varepsilon{({f{(x)}})}} \subset V$. By continuity, there is $\delta > 0$ such that $\left| {f(x) - f(y)} \right| < \varepsilon$ whenever $\left| {x - y} \right| < \delta$. Thus $V_{\delta{(x)}} \subset f^{- 1}\lbrack V\rbrack$, proving $f^{- 1}\lbrack V\rbrack$ open.
>
> Conversely, suppose $f^{- 1}\lbrack V\rbrack$ is open for every open $V \subset \mathbb{R}$. Let $x \in \mathbb{R}$ and $\varepsilon > 0$, and take $V = \left\{ {y \in \mathbb{R}:\left| {f(x) - y} \right| < \varepsilon} \right\} = V_{\varepsilon{({f{(x)}})}}$. Then $f^{- 1}\lbrack V\rbrack$ is open and contains $x$, so some $V_{\delta{(x)}}$ lies in $f^{- 1}\lbrack V\rbrack$. Therefore $\left| {f(a) - f(x)} \right| < \varepsilon$ whenever $\left| {x - a} \right| < \delta$. Thus $f$ is continuous at $x$, and hence continuous.

## Problems 12--14

The source records these printed problems but no handwritten response:

- **(12)** If $A \subset \mathbb{R}$ is closed and $f:A\rightarrow\mathbb{R}$ is continuous, prove there is a continuous $g:\mathbb{R}\rightarrow\mathbb{R}$ with $\left. g\  \middle| \ A = f \right.$.
- **(13)** For pairwise disjoint nonempty open sets $\left( U_{i} \right)_{i \in I}$ in $\mathbb{R}$, prove $I$ is countable.
- **(14a)** Prove an open subset of $\mathbb{R}$ is a union of countably many open intervals; **(14b)** decide whether the intervals can be chosen with rational endpoints.

