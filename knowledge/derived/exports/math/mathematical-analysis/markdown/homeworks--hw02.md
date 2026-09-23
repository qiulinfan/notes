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
source: "notes/math/mathematical-analysis/homeworks/hw02.typ"
subtitle: Historical personal work, with separately labelled checking material
title: Mathematical Analysis Homeworks
---
# Homework 2: cardinality and sequences

> **Remark: Authority label**
>
> This is a visual transcription of **personal work** in `451-hw-2.pdf`. The raw assignment and consolidated solution PDF are checking-only sources; neither supplies the solution body below.

The submission uses $X \preceq Y$ for the existence of an injective function from $X$ to $Y$, and $X \approx Y$ for the existence of a bijection. It recalls Cantor--Schröder--Bernstein: $X \approx Y$ if and only if $X \preceq Y$ and $Y \preceq X$.

## Problem 1 --- triangle inequality for finite sums

> **Note: 原稿红字**
>
> hw 2 ①：$\left. |\sum_{k = 1}^{n}a_{k} \middle| \leq \sum_{k = 1}^{n} \middle| a_{k}| \right.$。

For $a_{1},\ldots,a_{n} \in \mathbb{R}$, prove by induction that $\left. |\sum_{k = 1}^{n}a_{k} \middle| \leq \sum_{k = 1}^{n} \middle| a_{k}| \right.$.

> **Proof**
>
> We prove it by induction on $n \in \mathbb{N}$. Base case: $n = 1$, and $\left. |\sum_{k = 1}^{1}a_{k} \middle| = \middle| a_{1} \middle| = \sum_{k = 1}^{1} \middle| a_{k}| \right.$, so the claim holds.
>
> Inductive step: assume the inequality holds for all $a_{1},\ldots,a_{n} \in \mathbb{R}$ for $n = 1,2,\ldots,j$. Then
>
> $$
> \left. |\sum\limits_{k = 1}^{j + 1}a_{k} \middle| = \middle| \sum\limits_{k = 1}^{j}a_{k} + a_{j + 1} \middle| \leq \middle| \sum\limits_{k = 1}^{j}a_{k} \middle| + \middle| a_{j + 1} \middle| \quad(1) \right.
> $$
>
> By the inductive hypothesis for $n = j$, $\left. |\sum_{k = 1}^{j}a_{k} \middle| \leq \sum_{k = 1}^{j} \middle| a_{k}| \right.$. Combining this with (1), $\left. |\sum_{k = 1}^{j + 1}a_{k} \middle| \leq \sum_{k = 1}^{j + 1} \middle| a_{k}| \right.$. This finishes the proof.

## Problem 2 --- bounds of a scalar multiple

Let $A \subseteq \mathbb{R}$ be bounded, let $c \in \mathbb{R}$, and write $cA = \left\{ {ca:a \in A} \right\}$.

> **Solution**
>
> If $c > 0$, the submitted expressions are $\sup\left( {cA} \right) = c\sup A$ and $\inf\left( {cA} \right) = c\inf A$; if $c = 0$, both are $0$; and if $c < 0$, they are $\sup\left( {cA} \right) = c\inf A$ and $\inf\left( {cA} \right) = c\sup A$.
>
> For $c > 0$, take arbitrary $a \in A$. Since $\sup A \geq a$, $c\sup A \geq ca$, so $c\sup A$ is an upper bound of $cA$. If $cb$ is an upper bound of $cA$, then $cb \geq ca$ for all $a \in A$. Since $c > 0$, $b \geq a$, so $b$ is an upper bound of $A$. Thus $b \geq \sup A$, hence $cb \geq c\sup A$. Therefore $c\sup A = \sup\left( {cA} \right)$.
>
> For $c = 0$, $cA = \left\{ 0 \right\}$, so $c\sup A = 0 = \sup\left( {cA} \right)$. For $c < 0$, take arbitrary $a \in A$. Since $\inf A \leq a$, $c\inf A \geq ca$, so $c\inf A$ is an upper bound of $cA$. If $cb$ is an upper bound of $cA$, then $cb \geq ca$ for all $a \in A$. Since $c < 0$, $b \leq a$, so $b$ is a lower bound of $A$; hence $b \leq \inf A$ and $cb \geq c\inf A$. Thus $c\inf A = \sup\left( {cA} \right)$.

## Problem 3 --- injective maps and $\preceq$

> **Note: 原稿红字**
>
> hw 2 ②：$\preceq$ 是一个 partial order。

Let $f:X\rightarrow Y$ and $g:Y\rightarrow Z$ be functions.

### (a)

> **Proof**
>
> Suppose $f$ and $g$ are injective. Let $g \circ f(a) = g \circ f(b)$, where $a,b$ are in the domain of $g \circ f$. Since $g$ is injective, $f(a) = f(b)$; since $f$ is injective, $a = b$. Hence $g \circ f$ is injective.

### (b)

> **Proof**
>
> Let $X$ be an arbitrary set. The function $f:X\rightarrow X$ defined by $f(x) = x$ is injective by uniqueness of every element in a set, so $X \preceq X$. Thus $\preceq$ is reflexive.
>
> Let $X \preceq Y$ and $Y \preceq Z$. There are injective functions $f:X\rightarrow Y$ and $g:Y\rightarrow Z$. By part (a), $g \circ f:X\rightarrow Z$ is injective, so $X \preceq Z$. Therefore $\preceq$ is transitive.

## Problem 4 --- inclusions, injections, and surjections

> **Note: 原稿红字**
>
> hw 2 ③：$A \subseteq B\Rightarrow A \preceq B$。

### (a)

> **Proof**
>
> Assume $A \subseteq B$. Consider $f:A\rightarrow B$ defined by $f(x) = x$. It is injective by uniqueness of every element in a set. Therefore $A \preceq B$.

### (b)

> **Proof**
>
> First suppose $f:A\rightarrow B$ is injective. Let $a \in A$ be arbitrary and define $g:B\rightarrow A$ by $g(x) = f^{- 1}\left( \left\{ x \right\} \right)$ if $x$ is in the range of $f$, and $g(x) = a$ if $x$ is not in the range of $f$. This function is well-defined since $f$ is injective, so there is only one element in $f^{- 1}\left( \left\{ x \right\} \right)$ for each $x \in B$. Thus The range of $g$ is $A$, so $g$ is surjective.
>
> Conversely suppose $g:B\rightarrow A$ is surjective. For every $a \in A$, there is some $b \in B$ with $g(b) = a$, i.e. $g^{- 1}\left( \left\{ a \right\} \right) \neq \varnothing$. Define $f:A\rightarrow B$ by sending every $a \in A$ to some $b \in g^{- 1}\left( \left\{ a \right\} \right)$. Its well-definedness is guaranteed by $g^{- 1}\left( \left\{ a \right\} \right) \neq \varnothing$; it is injective because $g^{- 1}\left( \left\{ a_{1} \right\} \right) \cap g^{- 1}\left( \left\{ a_{2} \right\} \right) = \varnothing$. This finishes the if-and-only-if proof.

## Problem 5 --- remove a finite or countable subset

> **Note: 原稿红字**
>
> hw 2 ④：infinite set / finite set / unctb set / ctb set，基数不变。

### (a)

> **Proof**
>
> First construct $f:A \smallsetminus A_{0}\rightarrow A$ by $f(a) = a$. It is injective, hence $A \smallsetminus A_{0} \preceq A$. Let $A_{0} = \left\{ {z_{1},z_{2},\ldots,z_{n}} \right\}$ for some $z_{1},\ldots,z_{n} \in A$. Since $A$ is infinite and $A_{0}$ is finite, $A \smallsetminus A_{0}$ is infinite. Take a countable subset $A_{1} = \left\{ {y_{1},y_{2},\ldots} \right\} \subseteq A \smallsetminus A_{0}$. Define $f:A\rightarrow A \smallsetminus A_{0}$ piecewise: for $x \in \left( {A \smallsetminus A_{0}} \right) \smallsetminus A_{1}$, let $f(x) = x$; for $x = z_{k}$ with $k \in \mathbb{N}$, let $f(x) = y_{2k}$; and for $x = y_{k}$ with $k \in \mathbb{N}$, let $f(x) = y_{2k - 1}$. The work records that it is well-defined since $\left( {\left( {A \smallsetminus A_{0}} \right) \smallsetminus A_{1}} \right) \cup A_{0} \cup A_{1} = A$, and injective since $\left( {\left( {A \smallsetminus A_{0}} \right) \smallsetminus A_{1}} \right) \cap A_{0} \cap A_{1} = \varnothing$. Thus $A \preceq A \smallsetminus A_{0}$. Cantor--Schröder--Bernstein gives $A \approx A \smallsetminus A_{0}$.

### (b)

> **Proof**
>
> Since $A_{0}$ is countable, write $A_{0} = \left\{ {z_{1},z_{2},\ldots} \right\}$. Take a countably infinite subset $A_{1} = \left\{ {y_{1},y_{2},\ldots} \right\} \subseteq A \smallsetminus A_{0}$. Define $f:A\rightarrow A \smallsetminus A_{0}$ by the same three cases as in part (a): it fixes $\left( {A \smallsetminus A_{0}} \right) \smallsetminus A_{1}$, sends $z_{k}$ to $y_{2k}$, and sends $y_{k}$ to $y_{2k - 1}$. The submission records that this is well-defined, injective, and surjective: every $a \in A \smallsetminus A_{0}$ is either in $\left( {A \smallsetminus A_{0}} \right) \smallsetminus A_{1}$ or in $A_{1}$, and in either case there is $x$ with $f(x) = a$. Therefore $A \approx A \smallsetminus A_{0}$.

## Problem 6 --- algebraic and transcendental real numbers

> **Note: 原稿红字**
>
> hw 2 ⑤：代数无理数 $\mathbb{R} \smallsetminus \mathbb{Q}$ unctb。

### (a)

> **Proof**
>
> Let $A_{k}$ be the set of all roots of polynomials with rational-number coefficients with $k$ terms. By definition, $\mathbb{Q} = \cup_{k \in \ \mathbb{N}}A_{k}$. For arbitrary $k \in \mathbb{N}$, let $q = \left( {\frac{b_{1}}{a_{1}},\frac{b_{2}}{a_{2}},\ldots,\frac{b_{k}}{a_{k}}} \right) \in \mathbb{Q}^{k}$ be the polynomial with those coefficients. Then $A_{k} = \cup_{q \in \mathbb{Q}^{k}}A_{k,q}$. Since $\mathbb{Q} \subseteq \text{ℂ}$, the fundamental theorem of algebra gives that $A_{k,q}$ has at most $k$ roots. Thus every $A_{k,q}$ is finite. Because $\mathbb{Q}^{k}$ is countable, $A_{k}$ is countable for each $k$, and so $\mathbb{Q} = \cup_{k \in \ \mathbb{N}}A_{k}$ is countable.
>
> Since $\text{ℂ} \approx \mathbb{R}^{2}$ is uncountable and $\mathbb{Q}$ is countable, $\text{ℂ} \smallsetminus \mathbb{Q}$ is uncountable (and $\text{ℂ} \smallsetminus \mathbb{Q} \approx \text{ℂ}$). This indicates uncountably many transcendental numbers.

### (b)

> **Proof**
>
> Let $a,b \in \mathbb{R}$ with $a < b$, and let $\mathbb{Q}_{0}$ be the set of all algebraic numbers in $\left( {a,b} \right)$. Since $\mathbb{Q}_{0} \subseteq \mathbb{Q}$ and $\mathbb{Q}$ is countable, $\mathbb{Q}_{0}$ is countable. Since $\left( {a,b} \right)$ is uncountable, $\left( {a,b} \right) \smallsetminus \mathbb{Q}_{0}$ is uncountable. Thus there are uncountably many transcendental numbers in $\left( {a,b} \right)$.

## Problem 7 --- power sets and functions $\mathbb{R}\rightarrow\mathbb{R}$

> **Note: 原稿红字**
>
> hw 2 ⑥：$\mathbb{R} \preceq \mathcal{P}\left( \mathbb{R} \right) \preceq \mathbb{R}^{\mathbb{R}}$。

### (a)

> **Proof**
>
> Let $A \in \mathcal{P}\left( \mathbb{R} \right)$ be arbitrary. Consider the characteristic function $f_{A}:\mathbb{R}\rightarrow\mathbb{R}$ defined by $f_{A{(x)}} = 1$ if $x \in A$, and $f_{A{(x)}} = 0$ if $x \notin A$. Define $\psi:\mathcal{P}\left( \mathbb{R} \right)\rightarrow\mathbb{R}^{\mathbb{R}}$ by $\psi(A) = f_{A{(x)}}$ for each $A \in \mathcal{P}\left( \mathbb{R} \right)$. If $\psi(A) = \psi(B)$, then $f_{A{(x)}} = f_{B{(x)}}$, so every $x \in A$ is in $B$ and every $x \in B$ is in $A$; hence $A = B$. Therefore $\mathcal{P}\left( \mathbb{R} \right) \preceq \mathbb{R}^{\mathbb{R}}$.

### (b)

> **Proof**
>
> Assume for contradiction that there is a surjective function from $\mathbb{R}$ to $\mathbb{R}^{\mathbb{R}}$. By Problem 4(b), there is an injective function from $\mathbb{R}^{\mathbb{R}}$ to $\mathbb{R}$, so $\mathbb{R}^{\mathbb{R}} \preceq \mathbb{R}$. Together with $\mathcal{P}\left( \mathbb{R} \right) \preceq \mathbb{R}^{\mathbb{R}}$ and $\mathbb{R} \preceq \mathcal{P}\left( \mathbb{R} \right)$ by Problem 3(b), there is a surjective function from $\mathbb{R}$ to $\mathcal{P}\left( \mathbb{R} \right)$, contradicting Cantor's theorem. Hence no surjective function from $\mathbb{R}$ to $\mathbb{R}^{\mathbb{R}}$ exists.

## Problem 8 --- direct proofs of sequence limits

### (a)

> **Proof**
>
> Let $\varepsilon > 0$. Take $N > \frac{1}{\varepsilon}$ by the Archimedean property, so $\varepsilon > \frac{1}{N}$. For $n \geq N$, $\left. |\frac{\left( {- 1} \right)^{n}}{n} - 0 \middle| = \frac{1}{n} \leq \frac{1}{N} < \varepsilon \right.$. Thus $\lim_{n\rightarrow\infty}\frac{\left( {- 1} \right)^{n}}{n} = 0$.

### (b)

> **Proof**
>
> Let $\varepsilon > 0$. Take $N > \frac{1}{\varepsilon} - 1$, so $N + 1 > \frac{1}{\varepsilon}$ and $\varepsilon > \frac{1}{N + 1}$. For $n \geq N$, $\left. |\frac{n}{n + 1} - 1 \middle| = \frac{1}{n + 1} \leq \frac{1}{N + 1} < \varepsilon \right.$. Thus $\lim_{n\rightarrow\infty}\frac{n}{n + 1} = 1$.

## Problem 9 --- absolute values and powers

> **Note: 原稿红字**
>
> hw 2 ⑦：$\left. \lim a_{n} = L\Rightarrow\lim \middle| a_{n} \middle| = \middle| L| \right.$；${\lim\left( a_{n} \right)}^{k} = L^{k}$。

> **Proof**
>
> Let $\varepsilon > 0$ and fix $N \in \mathbb{N}$ such that $\left. |a_{n} - L \middle| < \varepsilon \right.$ whenever $n \geq N$. Since $\left. \left( |a_{n} \middle| - \middle| L| \right)^{2} = a_{n}^{2} - 2 \middle| a_{n}\| L \middle| + L^{2} \right.$ and $\left. |a_{n} - L \middle| {}_{2} = a_{n}^{2} - 2a_{n}L + L^{2} \right.$, the submission concludes $\left. \left( |a_{n} \middle| - \middle| L| \right)^{2} \leq \middle| a_{n} - L|^{2} \right.$, hence $\left. \| a_{n} \middle| - \middle| L\| \leq \middle| a_{n} - L \middle| < \varepsilon \right.$. Therefore $\left. \lim_{n\rightarrow\infty} \middle| a_{n} \middle| = \middle| L| \right.$.

## Problem 10 --- powers of a convergent sequence

> **Proof**
>
> The proof is by induction on $n$. Base case: $n = 1$ and $\lim_{k\rightarrow\infty}a_{k} = L = L^{1}$. Assume for $n = k$ that $\lim_{k\rightarrow\infty}a_{k}^{n} = L^{n}$. Then
>
> $$
> \lim\limits_{k\rightarrow\infty}a_{k}^{n + 1} = \lim\limits_{k\rightarrow\infty}\left( {a_{k}^{n}a_{k}} \right) = \lim\limits_{k\rightarrow\infty}a_{k}^{n} \cdot \lim\limits_{k\rightarrow\infty}a_{k} = L^{n} \cdot L = L^{n + 1}
> $$
>
> by the limit law. Thus if $\left( a_{k} \right)$ converges to $L$, then $\lim_{k\rightarrow\infty}a_{k}^{n} = L^{n}$ for all $n \in \mathbb{N}$.

## Problem 11 --- successive differences

Let $s_{n} = a_{n + 1} - a_{n}$. If $\left( a_{n} \right)$ converges, prove $\left( s_{n} \right)$ converges to zero.

> **Proof**
>
> Since $\left( a_{n} \right)$ converges, $\lim a_{n} = L$ for some $L \in \mathbb{R}$. Let $\varepsilon > 0$ and fix $N \in \mathbb{N}$ such that $\left. |a_{n} - L \middle| < \frac{\varepsilon}{2} \right.$ whenever $n \geq N$. Then $L - \frac{\varepsilon}{2} < a_{n + 1} < L + \frac{\varepsilon}{2}$ and $L - \frac{\varepsilon}{2} < a_{n} < L + \frac{\varepsilon}{2}$, so $\left. 0 < \middle| a_{n + 1} - a_{n} \middle| < \frac{\varepsilon}{2} - \left( {- \frac{\varepsilon}{2}} \right) = \varepsilon \right.$. Hence $\left. |s_{n} - 0 \middle| < \varepsilon \right.$ and $\lim_{n\rightarrow\infty}s_{n} = 0$.

## Problem 12 --- a sequence converging to $\sup S$

> **Note: 原稿红字**
>
> hw 2 ⑧：$S$ bounded $\Rightarrow\exists\left( a_{n} \right)\rightarrow\sup S$ in $S$。

Let $S$ be a bounded nonempty subset of $\mathbb{R}$. Show that there is a sequence in $S$ converging to $\sup S$.

> **Proof**
>
> Consider $b_{n} = \sup S - \frac{1}{n}$ for $n \in \mathbb{N}$. By the definition of supremum, $b_{n}$ is not an upper bound of $S$; for each $n$, there exists some $a > b_{n}$ where $a \in S$. Take one such $a$ as $a_{n}$ for each $b_{n}$ (the same $a$ can be taken repeatedly). Then $\left( a_{n} \right)$ is a sequence in $S$.
>
> Let $\varepsilon > 0$ and take $N \in \mathbb{N}$ with $N > \frac{1}{\varepsilon}$, so $\frac{1}{N} < \varepsilon$. For $n \geq N$, $\left. |b_{n} - \sup S \middle| = \frac{1}{n} < \frac{1}{N} < \varepsilon \right.$. Since $a_{n} > b_{n}$ and $a_{n} < \sup S$, $\left. |a_{n} - \sup S \middle| < \middle| b_{n} - \sup S \middle| < \varepsilon \right.$. Therefore $\lim_{n\rightarrow\infty}a_{n} = \sup S$.

## Optional challenge problems

The personal PDF prints Problem 13(a)--(b), concerning $\left\lbrack {0,1} \right\rbrack$ as a union of open intervals and $\left( {0,1} \right)$ as an intersection of closed intervals, and Problem 14, asking whether the converse of Problem 11 is true. No personal answer is written on source page 14; source pages 15--16 are blank.

