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
source: "notes/math/mathematical-analysis/homeworks/hw05.typ"
subtitle: Historical personal work, with separately labelled checking material
title: Mathematical Analysis Homeworks
---
# Homework 5: uniform continuity and differentiation

> **Remark: Authority label**
>
> This is a transcription of personal work in `451-hw-5.pdf`. The raw assignment and sample solutions are retained only as checking aids for problem numbering and symbols.

> **Remark: 原稿红字旁注**
>
> - hw5① 在 $\left\lbrack {0,\infty} \right)$ 上的 ctn function，只要在某个 $\left\lbrack {a,\infty} \right)$ 上 uni. ctn，一定整体上 uni. ctn。（闭方向上的 uni. ctn 不推出整体的 uni. ctn。）
> - hw5② ctn function $f$ 如果在集合个 limit pt. $a$ 附近 uni. ctn，则可以将 ctnly 延伸到 $\operatorname{dom}(f) \cup \left\{ a \right\}$，且 $g(a) = \lim_{x\rightarrow a}f(x)$；后注：修正这段不行''。
> - hw5③ 两个 uni. ctn. 函数的 composition 仍是 uni. ctn. 的。
> - hw5④ 若 $f(a) = g(a)$ 且 $f'(x) \leq g'(x)$ for all $x \geq a$，则 $f(x) \leq g(x)$ for all $x \geq a$。
> - hw5⑤ $f$ 在闭区间上 diffble，则一定 bounded；而 $f'$ 则未必 bounded。$f$ 在开区间上 diffble 且 $f'$ bounded $\Rightarrow f$ 一定 bounded。
> - hw5⑥ $f'(x) \geq 0$ iff $f$ weakly ↑；$f'(x) > 0\Rightarrow f$ strictly ↑（←）。

## Problem 1

**Suppose $\left( {U_{i}:i \in I} \right)$ is a family of nonempty open sets in $\mathbb{R}$ such that $U_{i} \cap U_{j} = \varnothing$ whenever $i \neq j$. Prove that $I$ is countable.**

> **Proof**
>
> Let $i \in I$ be arbitrary, and let $x \in U_{i}$. By definition there is $\varepsilon > 0$ with $V_{\varepsilon{(x)}} \subset U_{i}$. By density of $\mathbb{Q}$ in $\mathbb{R}$, choose $q \in \mathbb{Q}$ with $q \in V_{\varepsilon{(x)}} \subset U_{i}$. Define $f:I\rightarrow\mathbb{Q}$ by sending each $i$ to a rational number in $U_{i}$. Since the $U_{i}$ are pairwise disjoint, $f$ is injective. Hence $I \subset \mathbb{Q}$ in the sense of an injection, so $I$ is countable.

## Problem 2

**Determine whether each continuous function is uniformly continuous on the given interval: (a) $x^{3}$ on $\left\lbrack {0,1} \right\rbrack$; (b) $x^{3}$ on $\left( {0,1} \right)$; (c) $x^{3}$ on $\mathbb{R}$; (d) $\frac{1}{x^{3}}$ on $\left( {0,1} \right\rbrack$.**

### (a)

$x^{3}$ is uniformly continuous because it is continuous on $\mathbb{R}$ and $\left\lbrack {0,1} \right\rbrack$ is closed and bounded.

### (b)

Let $\varepsilon > 0$ and take $\delta = \frac{\varepsilon}{3}$. If $x,y \in \left( {0,1} \right)$ and $\left| {x - y} \right| < \delta$, then

$$
\left| {x^{3} - y^{3}} \right| = \left| {x - y} \right|\left| {x^{2} + xy + y^{2}} \right| < \left( \frac{\varepsilon}{3} \right) \cdot 3 = \varepsilon.
$$

Thus $x^{3}$ is uniformly continuous on $\left( {0,1} \right)$.

### (c)

It is not uniformly continuous. Take $\varepsilon = 1$. Let $\delta > 0$ be arbitrary and take $x = \sqrt{\frac{\varepsilon}{\delta}}$, $y = x + \frac{\delta}{3}$. Then

$$
\left( {x + \frac{\delta}{3}} \right)^{3} - x^{3} = \left( \frac{\delta}{3} \right)\left( {\left( {x + \frac{\delta}{3}} \right)^{2} + \left( {x + \frac{\delta}{3}} \right)x + x^{2}} \right) > \delta x^{2} = \varepsilon.
$$

### (d)

It is not uniformly continuous. Take $\varepsilon = 1$. Given $\delta > 0$, take $x = \min\left( {1 - \frac{\delta}{3},\sqrt{\frac{\varepsilon}{\delta}}} \right)$ and $y = x + \frac{\delta}{3}$. The source records the computation

$$
\left| {\frac{1}{x^{3}} - \frac{1}{\left( {x + \frac{\delta}{3}} \right)^{3}}} \right| = \frac{\left( {x + \frac{\delta}{3}} \right)^{3} - x^{3}}{x^{3}\left( {x + \frac{\delta}{3}} \right)^{3}},
$$

and uses the preceding lower bound while $x^{3}\left( {x + \frac{\delta}{3}} \right)^{3} \leq 1$ to obtain a quantity greater than $\varepsilon$.

## Problem 3

**Prove that if there is $a > 0$ such that a continuous $f:\left\lbrack {0,\infty} \right)\rightarrow\mathbb{R}$ is uniformly continuous on $\left\lbrack {a,\infty} \right)$, then $f$ is uniformly continuous.**

> **Proof**
>
> Suppose $f$ is continuous and uniformly continuous on $\left\lbrack {a,\infty} \right)$. Since $\left\lbrack {0,a} \right\rbrack$ is closed, $f$ is uniformly continuous there. Let $\varepsilon > 0$. Take $\delta_{1} > 0$ for $\left\lbrack {0,a} \right\rbrack$ and $\delta_{2} > 0$ for $\left\lbrack {a,\infty} \right)$, each giving $\left| {f(x) - f(y)} \right| < \frac{\varepsilon}{2}$. Set $\delta = \min\left( {\delta_{1},\delta_{2}} \right)$.
>
> Let $x,y \in \left\lbrack {0,\infty} \right)$ with $\left| {x - y} \right| < \delta$. If both points are in $\left\lbrack {0,a} \right\rbrack$, use $\delta_{1}$; if both are in $\left\lbrack {a,\infty} \right)$, use $\delta_{2}$. In the remaining case, assume $x \in \left\lbrack {0,a} \right\rbrack$ and $y \in \left\lbrack {a,\infty} \right)$. Then $\left| {x - a} \right| = a - x < \delta$ and $\left| {y - a} \right| = y - a < \delta$, so
>
> $$
> \left| {f(x) - f(y)} \right| \leq \left| {f(x) - f(a)} \right| + \left| {f(a) - f(y)} \right| < \varepsilon.
> $$
>
> Thus $f$ is uniformly continuous.

## Problem 4

**Let $A \subset \mathbb{R}$, let $f:A\rightarrow\mathbb{R}$ be continuous, and suppose $a \in A' \smallsetminus A$. Suppose further that $f$ is uniformly continuous on $V_{\varepsilon{(a)}} \cap A$ for some $\varepsilon > 0$. (a) Prove that any two sequences $\left( a_{n} \right)$ and $\left( b_{n} \right)$ in $A$ converging to $a$ have the same $f$-limit. (b) Prove that $f$ extends continuously to $A \cup \left\{ a \right\}$.**

### (a)

> **Proof**
>
> Assume the hypotheses and write $\lim f\left( a_{n} \right) = L$. Let $\varepsilon_{2} > 0$. Since $a_{n},b_{n}\rightarrow a$, there is $N_{1}$ such that $a_{n},b_{n} \in V_{\varepsilon{(a)}} \cap A$ whenever $n \geq N_{1}$. Uniform continuity gives $\delta > 0$ with $\left| {f\left( b_{n} \right) - f\left( a_{n} \right)} \right| < \frac{\varepsilon_{2}}{2}$ whenever $\left| {a_{n} - b_{n}} \right| < \delta$. Since $a_{n} - b_{n}\rightarrow 0$, this holds beyond some $N_{2}$. Also choose $N_{3}$ with $\left| {f\left( a_{n} \right) - L} \right| < \frac{\varepsilon_{2}}{2}$ for $n \geq N_{3}$. For $N = \max\left( {N_{1},N_{2},N_{3}} \right)$ and $n \geq N$,
>
> $$
> \left| {f\left( b_{n} \right) - f\left( a_{n} \right)} \right| \leq \left| {f\left( b_{n} \right) - f\left( a_{n} \right)} \right| + \left| {f\left( a_{n} \right) - L} \right| < \varepsilon_{2}.
> $$
>
> Therefore $\lim f\left( a_{n} \right) = \lim f\left( b_{n} \right)$.

### (b)

Define

$$
g(x) = f(x)\ \text{for}\ x \in A,\quad g(a) = \lim\limits_{x\rightarrow a}f(x).
$$

Then $\left. g\  \middle| \ A = f \right.$. Since $a \in A'$ and $\operatorname{dom}(g) = A \cup \left\{ a \right\}$, $a \in \left( {\operatorname{dom}(g)} \right)'$. The preceding part gives $\lim_{x\rightarrow a}g(x) = \lim_{x\rightarrow a}f(x) = g(a)$, so $g$ is continuous at $a$. It is already continuous on $A$, and hence is continuous on its domain.

## Problem 5

**Show that a composition of uniformly continuous functions is uniformly continuous: if $f:A\rightarrow\mathbb{R}$ and $g:B\rightarrow\mathbb{R}$ are uniformly continuous and $\text{range}(f) \subset B$, then $g \circ f$ is uniformly continuous.**

> **Proof**
>
> Let $\varepsilon > 0$. Take $\delta_{1} > 0$ such that $\left| {g(a) - g(b)} \right| < \varepsilon$ when $\left| {a - b} \right| < \delta_{1}$, for $a,b \in B$. Take $\delta_{2} > 0$ such that $\left| {f(x) - f(y)} \right| < \delta_{1}$ when $\left| {x - y} \right| < \delta_{2}$, for $x,y \in A$. Then $\left| {x - y} \right| < \delta_{2}$ implies
>
> $$
> \left| {g\left( {f(x)} \right) - g\left( {f(y)} \right)} \right| < \varepsilon.
> $$

## Problem 6

**Find the derivatives from the definition: (a) $y = \frac{1}{x}$; (b) $y = x^{3}$.**

### (a)

$$
f'(x) = \lim\limits_{h\rightarrow 0}\left( \frac{\frac{1}{x + h} - \frac{1}{x}}{h} \right) = \lim\limits_{h\rightarrow 0}\left( {- \frac{1}{x\left( {x + h} \right)}} \right) = - \frac{1}{x^{2}}.
$$

### (b)

$$
f'(x) = \lim\limits_{h\rightarrow 0}\left( \frac{\left( {x + h} \right)^{3} - x^{3}}{h} \right) = \lim\limits_{h\rightarrow 0}\left( {3x^{2} + 3xh + h^{2}} \right) = 3x^{2}.
$$

## Problem 7

**Define $f:\mathbb{R}\rightarrow\mathbb{R}$ by $f(x) = x^{2}$ for $x \in \mathbb{Q}$ and $f(x) = x^{3}$ for $x \in \mathbb{R} \smallsetminus \mathbb{Q}$. Find all points where $f$ is continuous and differentiable (no justification needed).**

The personal answer: $f$ is continuous only at $x = 0$, and differentiable only at $x = 0$.

## Problem 8

**Show that if $\left| {f(x) - f(y)} \right| \leq \left( {x - y} \right)^{2}$ for all $x,y \in \mathbb{R}$, then $f:\mathbb{R}\rightarrow\mathbb{R}$ is constant.**

> **Proof**
>
> Fix $y \in \mathbb{R}$ and let $x \in \mathbb{R}$ be arbitrary. Consider $g(x) = \frac{f(x) - f(y)}{x - y}$. The hypothesis yields $0 \leq \left| {g(x)} \right| \leq \left| {x - y} \right|$. By the squeeze theorem, $\lim_{x\rightarrow y}g(x) = 0$, and the source concludes $f(x) - f(y) = 0$. Since $y$ is arbitrary, $f$ is constant.

## Problem 9

**If $f$ and $g$ are differentiable on $\mathbb{R}$, $f(0) = g(0)$, and $f'(x) \leq g'(x)$ for all $x \in \mathbb{R}$, prove $f(x) \leq g(x)$ for all $x \geq 0$.**

> **Proof**
>
> Let $h(x) = f(x) - g(x)$. Then $h'(x) = f'(x) - g'(x) \leq 0$, so $h$ is decreasing on $\mathbb{R}$. Since $h(0) = 0$, for $x \geq 0$ we have $h(x) \leq 0$. Thus $f(x) \leq g(x)$.

## Problem 10

**Let $a < b$. Decide each assertion: (a) differentiable $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ is bounded; (b) such $f'$ is bounded; (c) differentiable, bounded $f:\left( {a,b} \right)\rightarrow\mathbb{R}$ has bounded $f'$; (d) differentiable $f:\left( {a,b} \right)\rightarrow\mathbb{R}$ with bounded $f'$ is bounded.**

### (a)

True. A differentiable function is continuous, so the extreme value theorem on the closed, bounded interval gives $x_{0},y_{0} \in \left\lbrack {a,b} \right\rbrack$ with $f\left( x_{0} \right) \leq f(x) \leq f\left( y_{0} \right)$ for all $x$. Hence the function is bounded.

### (b)

False. The source gives $f(x) = x^{2}\sin\left( \frac{1}{x^{2}} \right)$ for $x \neq 0$ and $f(0) = 0$ on $\left\lbrack {- 1,1} \right\rbrack$. It records $f'(0) = \lim_{x\rightarrow 0}x\sin\left( \frac{1}{x^{2}} \right) = 0$, while for $x \neq 0$,

$$
f'(x) = 2x\sin\left( \frac{1}{x^{2}} \right) - 2\frac{\cos\left( \frac{1}{x^{2}} \right)}{x},
$$

which is unbounded near $0$.

### (c)

False, by restricting the same counterexample to $\left( {- 1,1} \right)$.

### (d)

True. Suppose $\left| {f'(x)} \right| \leq M$ on $\left( {a,b} \right)$. Choose $a < m < n < b$; then $f$ is differentiable on $\left\lbrack {m,n} \right\rbrack$, so the extreme value theorem gives a point $k \in \left\lbrack {m,n} \right\rbrack$ controlling $f$ there. For arbitrary $x \in \left( {a,b} \right)$, the mean value theorem gives a point between $x$ and $k$ with $f(x) - f(k) \leq M\left( {x - k} \right)$. Thus

$$
M\left( {a - k} \right) + f(k) \leq f(x) \leq M\left( {b - k} \right) + f(k),
$$

so $f$ is bounded.

## Problem 11

**For differentiable $f:\left( {a,b} \right)\rightarrow\mathbb{R}$, decide the converses of: (a) $f' \geq 0$ implies $f$ increasing; (b) $f' > 0$ implies $f$ strictly increasing.**

### (a)

> **Proof**
>
> The converse is true. Assume $f$ is increasing and let $x \in \left( {a,b} \right)$. If $f'(x) < 0$, take $\varepsilon = - f'\frac{x}{2}$. The derivative definition gives a $\delta > 0$ such that for $0 < h < \delta$,
>
> $$
> 3f'\frac{x}{2} < \frac{f\left( {x + h} \right) - f(x)}{h} < - f'\frac{x}{2} < 0.
> $$
>
> But $h > 0$ and $f$ increasing imply $\frac{f\left( {x + h} \right) - f(x)}{h} \geq 0$, a contradiction. Hence $f'(x) \geq 0$.

### (b)

The converse is false: $f(x) = x^{3}$ is strictly increasing on $\left\lbrack {0,1} \right\rbrack$, but $f'(0) = 0$.

## Problem 12

**Let $f:\mathbb{R}\rightarrow\mathbb{R}$ be differentiable. Prove that if $\lim_{x\rightarrow\infty}f(x)$ and $\lim_{x\rightarrow\infty}f'(x)$ both exist, then $\lim_{x\rightarrow\infty}f'(x) = 0$.**

> **Proof**
>
> Assume the hypotheses and, for a contradiction, suppose $\lim_{x\rightarrow\infty}f'(x) = M \neq 0$. Write $\lim_{x\rightarrow\infty}f(x) = L$. Let $0 < \varepsilon < M$. Choose $N_{1},N_{2}$ so that $\left| {f(x) - L} \right| < \varepsilon$ for $x \geq N_{1}$ and $\left| {f'(x) - M} \right| < \varepsilon$ for $x \geq N_{2}$. For $N = \max\left( {N_{1},N_{2}} \right)$, $L - \varepsilon < f(N) < L + \varepsilon$ and $f'(x) > M - \varepsilon$ for $x \geq N$.
>
> Take $x = N + 2\frac{\varepsilon}{M - \varepsilon}$. By the mean value theorem, some $c \in \left( {N,x} \right)$ has
>
> $$
> f'(c) = \frac{f(x) - f(N)}{x - N} > M - \varepsilon.
> $$
>
> Hence $f(x) - f(N) > 2\varepsilon$, so $f(x) > L + \varepsilon$, contradicting the choice of $N_{1}$. Thus the derivative limit is $0$.

## Problem 13

**Let $f:\mathbb{R}\rightarrow\mathbb{R}$ be differentiable at $a$. (a) If $f'(a) > 0$, prove that there is $\delta > 0$ such that $f(x) > f(a)$ for $x \in \left( {a,a + \delta} \right)$. (b) Decide whether this implies $f$ is strictly increasing on $\left( {a,a + \delta} \right)$.**

### (a)

> **Proof**
>
> Let $\varepsilon = f'\frac{a}{2}$. By differentiability there is $\delta > 0$ such that
>
> $$
> \left| {\frac{f(x) - f(a)}{x - a} - f'(a)} \right| < \varepsilon
> $$
>
> for $x \in \left( {a,a + \delta} \right)$. Hence $\frac{f(x) - f(a)}{x - a} > f'\frac{a}{2} > 0$, and, since $x - a > 0$, $f(x) > f(a)$.

### (b)

The personal answer is true. Use the same $\delta$ and let $a < x_{1} < x_{2} < a + \delta$. By the mean value theorem,

$$
\frac{f\left( x_{2} \right) - f\left( x_{1} \right)}{x_{2} - x_{1}} = f'(c)
$$

for some $c \in \left( {x_{1},x_{2}} \right)$. By (a), $f'(c) > 0$, so $f\left( x_{2} \right) > f\left( x_{1} \right)$ and $f$ is strictly increasing on $\left( {a,a + \delta} \right)$.

## Optional challenge problems 14--15

The source has only the printed prompts and no handwritten response:

- **(14)** For increasing $\left( a_{n} \right)$ and decreasing $\left( b_{n} \right)$ with $a_{m} < b_{n}$, decide whether $\cap_{n \in \ \mathbb{N}}\left( {a_{n},b_{n}} \right)$ must be nonempty, given that $\cap_{n \in \ \mathbb{N}}\left\lbrack {a_{n},b_{n}} \right\rbrack \neq \varnothing$.
- **(15)** Decide whether an open $U \subset \mathbb{R}$ can contain $\mathbb{Q}$ while $\mathbb{R} \smallsetminus U$ is uncountable.

