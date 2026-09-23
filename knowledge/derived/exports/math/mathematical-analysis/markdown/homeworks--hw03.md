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
source: "notes/math/mathematical-analysis/homeworks/hw03.typ"
subtitle: Historical personal work, with separately labelled checking material
title: Mathematical Analysis Homeworks
---
# Homework 3: sequence limits and topology

> **Remark: Authority label**
>
> This is a visual transcription of **personal work** in `451-hw-3.pdf`. The raw assignment and consolidated solution file were used only for checking problem identities and notation; they are not the authority for any solution below.

The submission begins with the definition: a sequence $\left( a_{n} \right)$ of real numbers is **eventually constant** if there are $c \in \mathbb{R}$ and $N \in \mathbb{N}$ such that $a_{n} = c$ for all $n \geq N$.

## Problem 1 --- reciprocals and divergence to infinity

Consider the bi-implication $\lim a_{n} = \infty\Leftrightarrow\lim\frac{1}{a_{n}} = 0$.

> **Solution: Forward direction**
>
> Suppose $\lim a_{n} = \infty$. Let $\varepsilon > 0$ and consider $M = \frac{1}{\varepsilon}$. Then for some $N > M$, $a_{n} > M$ whenever $n \geq N$. Thus $a_{n} > \frac{1}{\varepsilon}$ implies $\left. |\frac{1}{a_{n}} \middle| < \varepsilon \right.$ whenever $n \geq N$. So $\lim\frac{1}{a_{n}} = 0$.

> **Solution: Backward direction --- counterexample**
>
> Consider $a_{n} = - n$. Then $\lim\frac{1}{a_{n}} = \lim\left( {- \frac{1}{n}} \right) = 0$, but $\lim a_{n} = - \infty$.

## Problem 2 --- a bounded factor

Let $\left( a_{n} \right)$ and $\left( b_{n} \right)$ be sequences of real numbers. Prove that if $\lim a_{n} = 0$ and $\left( b_{n} \right)$ is bounded, then $\lim a_{n}b_{n} = 0$.

> **Proof**
>
> Since $\left( b_{n} \right)$ is bounded, $\left( {|b_{n}|} \right)$ is also bounded. Consider the constant sequence $s_{n} = \sup\left( {|b_{n}|} \right)$. Then $\left. \lim\left( s_{n} \right) = \sup \middle| b_{n}| \right.$. Since $\lim a_{n} = 0$, $\lim\left( {|a_{n}|} \right) = 0$, and hence $\lim\left( |a_{n} \middle| \cdot \middle| s_{n}| \right) = 0$. As $\left. s_{n} = \sup \middle| b_{n}| \right.$, $\left. 0 \leq \middle| b_{n} \middle| \leq \middle| s_{n}| \right.$ for all $n \in \mathbb{N}$, so $\left. 0 \leq \middle| a_{n}b_{n} \middle| \leq \middle| a_{n}s_{n}| \right.$ for all $n \in \mathbb{N}$. By the squeeze theorem, $\left. \lim \middle| a_{n}b_{n} \middle| = 0 \right.$. Therefore $\left. \lim a_{n}b_{n} = \lim \middle| a_{n}b_{n} \middle| = 0 \right.$.

## Problem 3 --- three limits

Determine the limits in the extended real line (including positive or negative infinity) of the following sequences and prove the results.

### (a) $\frac{2^{n}}{n!}$

> **Proof**
>
> The submitted answer is $\lim_{n\rightarrow\infty}\frac{2^{n}}{n} \neq 0$. Let $a_{n} = \frac{2^{n}}{n!}$. Then
>
> $$
> \lim\limits_{n\rightarrow\infty}\frac{a_{n + 1}}{a_{n}} = \lim\limits_{n\rightarrow\infty}\frac{2^{n + 1}n!}{\left( {n + 1} \right)!2^{n}} = \lim\limits_{n\rightarrow\infty}\frac{2}{n + 1} = 0 < 1.
> $$
>
> So $\lim\frac{2^{n}}{n} \neq 0$.

### (b) $\frac{n^{n}}{n!}$

> **Proof**
>
> The submitted answer is $\lim_{n\rightarrow\infty}\frac{n^{n}}{n} \neq + \infty$. It writes $\frac{n^{n}}{n} \neq \frac{n}{n - 1} \cdot \frac{n}{n - 2}\ldots\frac{n}{1} > n$. Let $M > 0$ and choose an integer $N \geq M$. For $n \geq N$, $\frac{n^{n}}{n!} > n \geq N > M$. Hence the limit is $+ \infty$.

### (c) $b_{1} = 2$, $b_{n + 1} = \frac{b_{n}^{2} + 2}{2b_{n}}$

> **Proof**
>
> Assume $\lim b_{n} = L$. Then $L = \lim b_{n + 1} = \lim\left( {\frac{b_{n}}{2} + \frac{1}{b_{n}}} \right) = \frac{L}{2} + \frac{1}{L}$, so $\frac{L^{2}}{2} = 1$ and $L = \sqrt{2}$. Since $b_{n} > 0$ for all $n \in \mathbb{N}$, the limit can only be $\sqrt{2}$ if it exists.
>
> Now prove $\left( b_{n} \right)$ converges. For $n \in \mathbb{N}$, $b_{n + 1} = \frac{b_{n}}{2} + \frac{1}{b_{n}} \geq 2\sqrt{\frac{b_{n}}{2} \cdot \frac{1}{b_{n}}} = \sqrt{2}$. Since $b_{1} = 2$, $b_{n} \geq \sqrt{2}$ for all $n \in \mathbb{N}$. Also $\frac{b_{n + 1}}{b_{n}} = \frac{1}{2} + \frac{1}{b_{n}^{2}} \leq 1$. Hence $\left( b_{n} \right)$ is decreasing and bounded below, so it converges. Therefore $\lim b_{n} = \sqrt{2}$.

## Problem 4 --- limits in a discrete set

> **Note: 原稿红字**
>
> hw 3 ①：discrete $A \subseteq \mathbb{R}$ 中的任意 seq 要么 eventually constant，要么 $\lim\left( a_{n} \right)$ 在 $A$ 之外。

Suppose $A$ is a discrete subset of $\mathbb{R}$, and $\left( a_{n} \right)$ is a convergent sequence of numbers in $A$. Prove that either $\left( a_{n} \right)$ is eventually constant or $\lim a_{n} \notin A$.

> **Proof**
>
> Write $\lim a_{n} = L$. Assume $\left( a_{n} \right)$ is not eventually constant and $\lim a_{n} \in A$. Since $A$ is discrete, there is some $\varepsilon > 0$ such that $\left( {L - \varepsilon,L + \varepsilon} \right) \cap A \smallsetminus \left\{ L \right\} = \varnothing$. Since $\lim a_{n} = L$, there is $N \in \mathbb{N}$ such that $\left. |a_{n} - L \middle| < \varepsilon \right.$ for all $n \geq N$. Since $\left( a_{n} \right)$ is not eventually constant, there is $n \geq N$ such that $a_{n} \neq L$ and $\left. |a_{n} - L \middle| < \varepsilon \right.$, i.e. $a_{n} \in \left( {L - \varepsilon,L + \varepsilon} \right)$. Thus $a_{n} \in \left( {L - \varepsilon,L + \varepsilon} \right) \cap A \smallsetminus \left\{ L \right\}$, a contradiction. Therefore $\left( a_{n} \right)$ is either eventually constant or $\lim a_{n} \notin A$.

## Problem 5 --- sequences of rationals with bounded numerators

For positive integer $M$, let $\mathbb{Q}_{M}$ be the set of rational numbers $\frac{m}{n}$ with $m,n \in \mathbb{Z}$ and $\left. |m \middle| \leq M \right.$. Prove every sequence of distinct numbers in $\mathbb{Q}_{M}$ converges.

> **Proof**
>
> Let $\left( a_{n} \right)$ be an arbitrary sequence in $\mathbb{Q}_{M}$ and let $\varepsilon > 0$. Since for each $q \in \mathbb{Z}$ there are only finitely many terms of $\left( a_{n} \right)$ that have $q$ as a denominator, consider $N = \max\{ k:a_{k} = \frac{p}{q}$ for some $p \leq M$ and $q$ an integer with $q \geq \frac{M}{\varepsilon}\}.$ Take arbitrary $n \geq N + 1$. Then $a_{n} = \frac{m}{q}$ where $q > \frac{M}{\varepsilon}$. Thus $a_{n} \leq \frac{M}{q} < \varepsilon$. So $\lim a_{n} = 0$. This finishes the proof that every sequence of distinct numbers in $\mathbb{Q}_{M}$ converges.

## Problem 6 --- strict inequalities between sequences

Let $a_{n} < b_{n}$ for all $n$.

### (a)

> **Proof**
>
> Suppose $\lim a_{n} = \infty$. Let $M > 0$ and fix it. Then for some $N \in \mathbb{N}$, $a_{n} > M$ whenever $n \geq N$. Since $a_{n} < b_{n}$ for all $n$, $b_{n} > a_{n} > M$ for all $n \geq N$. Therefore $\lim b_{n} = \infty$.

### (b)

> **Solution**
>
> Consider $a_{n} = \frac{1}{n^{2}}$ and $b_{n} = \frac{2}{n^{2}}$ for all $n \in \mathbb{N}$. Then $a_{n} < b_{n}$ for all $n \in \mathbb{N}$, but $\lim a_{n} = \lim b_{n} = 0$.

## Problem 7 --- ratio limit greater than one

> **Note: 原稿红字**
>
> hw 3 ②：if positive seq $\left( a_{n} \right)$ and $\lim\frac{a_{n + 1}}{a_{n}} = L > 1$，则 $\lim\left( a_{n} \right) = \infty$。

Let $\left( a_{n} \right)$ be a sequence of positive real numbers. Show that if $\lim\frac{a_{n + 1}}{a_{n}} = L > 1$, then $\lim a_{n} = \infty$.

> **Proof**
>
> Let $\varepsilon = \frac{L - 1}{2}$. Since $\lim\frac{a_{n + 1}}{a_{n}} = L$, there is some $N_{1} \in \mathbb{N}$ such that $\left. |\frac{a_{n + 1}}{a_{n}} - L \middle| < \varepsilon \right.$ for all $n \geq N_{1}$, i.e. $a_{n + 1} > \left( {\frac{L}{2} + \frac{1}{2}} \right)a_{n}$ for all $n \geq N_{1}$. Let $M > 0$. There is some $N_{2} \geq N_{1}$ such that $\left( {\frac{L}{2} + \frac{1}{2}} \right)^{N_{2}}a_{N_{2}} > M$, since $\frac{L}{2} + \frac{1}{2} > 1$. Then for all $n \geq N_{2}$, $a_{n} \geq \left( {\frac{L}{2} + \frac{1}{2}} \right)^{n}a_{N_{2}} > M$. Therefore $\lim a_{n} = \infty$.

## Problem 8 --- lim sup and lim inf

Find the lim sup and lim inf of the following sequences.

- \(a\) $a_{n} = \left( {- 1} \right)^{n + 1} + \frac{\left( {- 1} \right)^{n}}{n}$: $\operatorname{lim\, sup}\left( a_{n} \right) = 1$ and $\operatorname{lim\, inf}\left( a_{n} \right) = - 1$.
- \(b\) $b_{n} = \sin\left( \frac{1}{n} \right)$: $\operatorname{lim\, sup}\left( b_{n} \right) = \operatorname{lim\, inf}\left( b_{n} \right) = 0$.
- \(c\) $c:\mathbb{N}\rightarrow\mathbb{Q}$ any bijection: $\operatorname{lim\, sup}\left( c_{n} \right) = + \infty$ and $\operatorname{lim\, inf}\left( c_{n} \right) = - \infty$.
- \(d\) $d_{n} = \ln n + \cos n$: $\operatorname{lim\, sup}\left( d_{n} \right) = \operatorname{lim\, inf}\left( d_{n} \right) = + \infty$.

## Problem 9 --- a recursive average

Let $a,b \in \mathbb{R}$ with $a < b$. Let $s_{1} = a$, $s_{2} = b$, and $s_{n + 2} = \frac{s_{n} + s_{n + 1}}{2}$. The submitted claim is $\lim_{n\rightarrow\infty}s_{n} = \frac{2}{3}b + \frac{1}{3}a$.

> **Proof**
>
> Let $d_{n} = s_{n + 1} - s_{n}$ for all $n \in \mathbb{N}$. Then $d_{1} = s_{2} - s_{1} = b - a$, and, for $n \geq 2$,
>
> $$
> d_{n} = \frac{s_{n - 1} + s_{n}}{2} - s_{n} = - \left( \frac{1}{2} \right)s_{n} - \left( \frac{1}{2} \right)s_{n - 1} = - \left( \frac{1}{2} \right)d_{n - 1}.
> $$
>
> For all $n \in \mathbb{N}$,
>
> $$
> s_{n + 1} = \sum\limits_{i = 1}^{n{({s_{n + 1} - s_{n}})}} + s_{1} = s_{1} + \sum\limits_{i = 1}^{n}d_{n} = a + \frac{1 - \left( {- \frac{1}{2}} \right)^{n}}{1 - \left( {- \frac{1}{2}} \right)}d_{1} = a + \frac{2}{3}\left( {1 - \left( {- \frac{1}{2}} \right)^{n}} \right)\left( {b - a} \right).
> $$
>
> Thus
>
> $$
> \lim\limits_{n\rightarrow\infty}s_{n} = \lim\limits_{n\rightarrow\infty}s_{n + 1} = \lim\limits_{n\rightarrow\infty}\left( {a + \frac{2}{3}\left( {b - a} \right) - \frac{2}{3}\left( {- \frac{1}{2}} \right)^{n{({b - a})}}} \right) = \frac{2}{3}b + \frac{1}{3}a,
> $$
>
> since $\left. | - \frac{1}{2} \middle| < 1 \right.$.

## Problem 10 --- a divergent sequence with one possible subsequential limit

Consider $a_{n} = n^{{({- 1})}^{n}}$, i.e. $\left( a_{n} \right) = \left( {1,2,\frac{1}{3},4,\frac{1}{5},6,\ldots} \right)$. The work claims $\left( a_{n} \right)$ diverges, but every convergent subsequence converges to $L = 0$.

> **Proof**
>
> The odd-indexed terms $(a_{n_{k}}:k$ is odd$) = \left( {1,\frac{1}{3},\frac{1}{5},\ldots} \right)\rightarrow 0$. Let $\left( a_{n_{k}} \right)$ be a convergent subsequence of $\left( a_{n} \right)$; then $k\mapsto n_{k}$ is strictly increasing. Suppose there are infinitely many $k \in \mathbb{N}$ such that $n_{k}$ is even. We show $\left( a_{n_{k}} \right)$ diverges. Let $L \in \mathbb{R}$, take $M = 1$, and fix $N \in \mathbb{N}$. If there is no $n_{k} > N$ with $a_{n_{k}} > L + 1$, then there are only finitely many even $n_{k}$, a contradiction. Thus there must be $n_{k} > N$ with $\left. |a_{n_{k}} - L \middle| > M \right.$, so $\left( a_{n_{k}} \right)$ diverges. Hence only finitely many $n_{k}$ are even. Cutting the tail makes all remaining $n_{k}$ odd, and so $\left( a_{n_{k}} \right)$ converges to $0$.

## Problem 11 --- lim sup of a sum

Let $\left( a_{n} \right)$ and $\left( b_{n} \right)$ be bounded sequences of positive real numbers.

### (a)

> **Proof**
>
> Write $l_{n} = \sup\left\{ {a_{k} + b_{k}:k \geq n} \right\}$, $u_{n} = \sup\left\{ {a_{k}:k \geq n} \right\}$, and $v_{n} = \sup\left\{ {b_{k}:k \geq n} \right\}$. Let $\varepsilon > 0$. Then for every $k \geq n$, $a_{k} < u_{n} + \frac{\varepsilon}{2}$ and $b_{k} < v_{n} + \frac{\varepsilon}{2}$, so $a_{k} + b_{k} < u_{n} + v_{n} + \varepsilon$. Hence $l_{n} \leq u_{n} + v_{n}$. Since $n$ is arbitrary, $\lim l_{n} \leq \lim u_{n} + \lim v_{n}$, i.e. $\operatorname{lim\, sup}\left( {a_{n} + b_{n}} \right) \leq \operatorname{lim\, sup}\left( a_{n} \right) + \operatorname{lim\, sup}\left( b_{n} \right)$.

### (b)

> **Solution: Counterexample**
>
> $a_{n} = 1 + \left( {- 1} \right)^{n}$, so $\operatorname{lim\, sup}\left( a_{n} \right) = 2$. Let $b_{n} = 1 + \left( {- 1} \right)^{n + 1}$, so $\operatorname{lim\, sup}\left( b_{n} \right) = 2$. But $\operatorname{lim\, sup}\left( {a_{n} + b_{n}} \right) = 1 + 1 = 2 < \operatorname{lim\, sup}\left( a_{n} \right) + \operatorname{lim\, sup}\left( b_{n} \right)$.

### (c)

> **Solution**
>
> Write $\lim a_{n} = L$. Then $\operatorname{lim\, sup}\left( a_{n} \right) = \lim a_{n} = L$ since $\left( a_{n} \right)$ converges. Thus $\operatorname{lim\, sup}\left( a_{n} \right) + \operatorname{lim\, sup}\left( b_{n} \right) = L + \lim v_{n} = \lim\left( {L + v_{n}} \right) = \operatorname{lim\, sup}\left( {a_{n} + b_{n}} \right)$.

## Problem 12 --- a sequence with every real subsequential limit

> **Note: 原稿红字**
>
> hw 3 ③：$\mathbb{R}$ 中存在一个 seq，使得 "all sub seq lim of $\left( a_{n} \right)$" $= \mathbb{R}$。

> **Proof**
>
> Since $\mathbb{N} \approx \mathbb{Q}$, there exists a surjective function $S:\mathbb{N}\rightarrow\mathbb{Q}$. Note that $\left( S_{n} \right)$ is a sequence. Let $r \in \mathbb{R}$ be arbitrary. There exists a sequence in $\mathbb{Q}$, $\left( q_{n} \right)\rightarrow r$. Since $S:\mathbb{N}\rightarrow\mathbb{Q}$ is surjective, consider the subsequence $\left( S_{n_{k}} \right)$ of $\left( S_{n} \right)$ defined by $S_{n_{k}} = q_{n}$ for some $n \in \mathbb{N}$, for all $k \in \mathbb{N}$. Take a monotonic subsequence of $\left( S_{n_{k}} \right)$ as $\left( S_{m} \right)$. It is a subsequence of $\left( S_{n_{k}} \right)$, so it is also a subsequence of $\left( S_{n} \right)$. Let $\varepsilon > 0$. There is some $N \in \mathbb{N}$ such that $\left. |q_{n} - r \middle| < \varepsilon \right.$ whenever $n \geq N$. Since there is some term $S_{m}$ with $S_{m} = q_{N}$ and $\left( S_{m} \right)$ is monotonic, $\left. |S_{m} - r \middle| < \varepsilon \right.$ whenever $m \geq M$. Therefore $\left( S_{m} \right)\rightarrow r$.

## Problem 13 --- open and closed sets

The submitted classifications are:

- \(a\) $\left\{ {\frac{1}{n}:n \in \mathbb{N}} \right\}$: neither.
- \(b\) $\left\{ {\frac{1}{n}:n \in \mathbb{N}} \right\} \cup \left\{ 0 \right\}$: closed and not open.
- \(c\) $\cup_{n \geq 1}\left\lbrack {\frac{1}{n},3 - \frac{1}{n}} \right\rbrack$: open and not closed.
- \(d\) $\mathbb{Z}$: closed and not open.
- \(e\) $\mathbb{Q}$: neither.
- \(f\) $\cap_{n \geq 1}\left( {- \frac{1}{n},\frac{1}{n}} \right)$: closed and not open.

## Problem 14 --- closed discrete set with no uniform separation

> **Solution: Counterexample**
>
> Consider $S_{n} = \sum_{k = 1}^{n}\frac{1}{k}$, a partial sum of the harmonic series, and $A = \left\{ {S_{n}:n \in \mathbb{N}} \right\}$. There is no subsequential limit in $S_{n}$, so $A$ has no limit point; hence $A = A'$ and $A$ is closed. For each $S_{n}$ consider $\varepsilon = \frac{1}{n + 1}$; then $V_{\varepsilon{(S_{n})}} \cap A \smallsetminus \left\{ S_{n} \right\} = \varnothing$, so $A$ is discrete. But there is no $\varepsilon > 0$ such that $\left. |a - b \middle| \geq \varepsilon \right.$ for every pair $a,b \in A$, since for any $\varepsilon > 0$, $S_{k + 1} - S_{k} < \frac{1}{\varepsilon} = \varepsilon$ (as recorded in the submission).

## Problem 15 --- an external limit point

> **Note: 原稿红字**
>
> hw 3 ④：bounded + infinite + discrete $A \subseteq \mathbb{R}$ 一定存在不在 $A$ 中的 subseq lim。

Suppose $A \subseteq \mathbb{R}$ is infinite, bounded, and discrete. Prove that there is a convergent sequence in $A$ whose limit is not in $A$.

> **Proof**
>
> Take an arbitrary sequence $\left( a_{n} \right)$ in $A$ such that $\forall m,n \in \mathbb{N}$, $a_{m} \neq a_{n}$. By the Bolzano--Weierstrass theorem, there is a convergent subsequence $\left( a_{n_{k}} \right)$; write $\lim a_{n_{k}} = L$. Claim: $L \notin A$. Suppose $L \in A$. Since $L$ is the limit of a sequence in $A$, it is a limit point of $A$, so for every $\varepsilon > 0$ there exists $x \in A \smallsetminus \left\{ L \right\}$ with $\left. 0 < \middle| x - L \middle| < \varepsilon \right.$, i.e. $x \in V_{\varepsilon{(L)}} \cap A \smallsetminus \left\{ L \right\}$. Since $A$ is discrete and $L \in A$, there exists $\varepsilon > 0$ such that $V_{\varepsilon{(L)}} \cap A = \left\{ L \right\}$. These two statements contradict. So $L \notin A$.

