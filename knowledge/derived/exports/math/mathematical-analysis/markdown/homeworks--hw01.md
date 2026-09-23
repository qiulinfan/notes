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
source: "notes/math/mathematical-analysis/homeworks/hw01.typ"
subtitle: Historical personal work, with separately labelled checking material
title: Mathematical Analysis Homeworks
---
# Homework 1: sets, order, and induction

> **Remark: Authority label**
>
> This is a visual transcription of **personal work** in `451-Hw-1.pdf`. `451-hw-1-raw.pdf` and `451-hw-sol-all.pdf` are checking-only material: they were used to identify the assignment and check notation, never as the body of the submitted solutions below.

## Problem 1 --- set identities

For each statement about sets, either prove the statement if it is true for all sets, or give a counterexample using specific sets if it is false.

- \(a\) $\left( {A \cup B} \right) \smallsetminus C \subseteq A \cup \left( {B \smallsetminus C} \right)$.
- \(b\) $\left( {A \cup B} \right) \smallsetminus C \supseteq A \cup \left( {B \smallsetminus C} \right)$.
- \(c\) $A \smallsetminus \left( {B \cup C} \right) = \left( {A \smallsetminus B} \right) \cup \left( {A \smallsetminus C} \right)$.
- \(d\) $A \subseteq B$ if and only if $A \cap B = A$.

> **Solution: Proof**
>
> Assume $x \in \left( {A \cup B} \right) \smallsetminus C$. So $(x \in A$ or $x \in B)$, and $x \notin C$. Hence $(x \in A$ but $x \notin C)$ or $(x \in B$ but $x \notin C)$. This contains $x \in A$ or $(x \in B$ but $x \notin C)$, so $x \in A \cup \left( {B \smallsetminus C} \right)$. Therefore $\left( {A \cup B} \right) \smallsetminus C \subseteq A \cup \left( {B \smallsetminus C} \right)$.

> **Solution: Counterexample**
>
> Let $A = \left\{ {1,2,3,4,5} \right\}$, $B = \left\{ {1,2,3} \right\}$, and $C = \left\{ {1,2,3,4,5} \right\}$. Then $5 \in A$, hence $5 \in A \cup \left( {B \smallsetminus C} \right)$, but $5 \notin \left( {A \cup B} \right) \smallsetminus C$. Thus $\left( {A \cup B} \right) \smallsetminus C \neq A \cup \left( {B \smallsetminus C} \right)$.

> **Solution: Counterexample**
>
> Let $A = \left\{ {1,2,3,4,5} \right\}$, $B = \left\{ {1,2,3,4,5} \right\}$, and $C = \left\{ {1,2,3} \right\}$. Then $4 \in A \smallsetminus C$, so $4 \in \left( {A \smallsetminus B} \right) \cup \left( {A \smallsetminus C} \right)$, but $4 \notin A \smallsetminus \left( {B \cup C} \right)$. Thus $A \smallsetminus \left( {B \cup C} \right) \neq \left( {A \smallsetminus B} \right) \cup \left( {A \smallsetminus C} \right)$.

> **Solution: Proof**
>
> Assume $A \subseteq B$. If $x \in A$, then $x \in B$. Take $x \in A \cap B$; then $x \in A$. Conversely, take $x \in A$; then $x \in B$, so $x \in A \cap B$. Therefore $A \subseteq A \cap B$ and $A \cap B \subseteq A$, hence $A = A \cap B$.
>
> Assume $A = A \cap B$. Fix $a \in A$. Then $a \in A \cap B$, so $a \in A$ and $a \in B$. Thus $A \subseteq B$. This proves $A = A \cap B$ if and only if $A \subseteq B$.

## Problem 2 --- multiples

For each $n \in \mathbb{N}$, let $A_{n} = \left\{ {nk:k \in \mathbb{N}} \right\}$.

> **Solution**
>
> $A_{2} = \left\{ {2k:k \in \mathbb{N}} \right\}$ and $A_{3} = \left\{ {3k:k \in \mathbb{N}} \right\}$. Thus $x \in A_{2} \cap A_{3}$ if and only if $\left. 2 \middle| x \right.$ and $\left. 3 \middle| x \right.$ (and $x \in \mathbb{N}$), if and only if $\left. 6 \middle| x \right.$ (and $x \in \mathbb{N}$). So $A_{2} \cap A_{3} = \left\{ {6k:k \in \mathbb{N}} \right\}$.

> **Solution**
>
> $\left. \cup_{n = 2}^{\infty}A_{n} = \{ x \in \mathbb{N}:2 \middle| x \right.$ or $\left. 3 \middle| x \right.$ or $\ldots\}$ $= \left\{ {x \in \mathbb{N}:x \geq 2} \right\}$.
>
> $\left. \cap_{n = 2}^{\infty}A_{n} = \{ x \in \mathbb{N}:2 \middle| x \right.$ and $\left. 3 \middle| x \right.$ and $\ldots\}$ $= \{ x \in \mathbb{N}:x$ has all natural numbers that are at least $2$ as factors$\} = \varnothing$.

## Problem 3 --- sum of odd integers

Guess a formula for $1 + 3 + \ldots + \left( {2n - 1} \right)$, then prove it by induction.

> **Solution**
>
> $1 + 3 + \ldots + \left( {2n - 1} \right) = 1 + \left( {2n - 1} \right) + \left( {3 + 2\left( {n + 1} \right) - 1} \right) + \ldots$. There are $\frac{n}{2} \cdot 2n$ terms in this pairing, so the formula is $n^{2}$.

> **Solution: Proof by induction on n**
>
> Base case: $n = 1$, and $\sum_{k = 1}^{1}\left( {2k - 1} \right) = 1 = 1^{2}$.
>
> Inductive step: assume, for $n = k$, that $\sum_{k = 1}^{n{({2k - 1})}} = k^{2}$. Then, for $n = k + 1$,
>
> $$
> \sum\limits_{k = 1}^{k + 1}\left( {2k - 1} \right) = \sum\limits_{k = 1}^{k{({2k - 1})}} + 2\left( {k + 1} \right) - 1 = k^{2} + 2k + 1 = \left( {k + 1} \right)^{2}.
> $$
>
> This finishes the proof that for all $n \in \mathbb{N}$, $\sum_{k = 1}^{n{({2k - 1})}} = k^{2}$.

## Problem 4 --- $2^{n} > n^{2}$

Determine for which integers $2^{n} > n^{2}$ is true, and prove the claim by induction.

> **Solution**
>
> The submitted claim is: $n = 0$ or $n \geq 5$.
>
> Case 1: $n = 0$. Then $2^{n} = 1$ and $n^{2} = 0$, hence $2^{n} > n^{2}$.
>
> Case 2: $n \geq 5$. The proof is by induction on $n$. Base case: $n = 5$, $2^{n} = 32$ and $n^{2} = 25$, so $2^{n} > n^{2}$.
>
> Inductive step: assume for $n = k$ (where $k \in \mathbb{N}$ and $k \geq 5$) that $2^{k} > k^{2}$. Then $2^{k + 1} = 2 \cdot 2^{k} = 2^{k + 1}$ and $\left( {k + 1} \right)^{2} = k^{2} + 2k + 1$. Note that $k^{2} - \left( {2k + 1} \right) = \left( {k - 2} \right)k - 1$. Since $k \geq 5$, $k - 2 \geq 3$, so $\left( {k - 2} \right)k - 1 \geq 14 > 0$. Therefore $k^{2} > 2k + 1$, and
>
> $$
> 2^{k + 1} = 2^{k} + 2^{k} > k^{2} + k^{2} > k^{2} + 2k + 1 = \left( {k + 1} \right)^{2}.
> $$
>
> This finishes the proof that for all integer $n \geq 5$, $2^{n} > n^{2}$.

## Problem 5 --- boundedness, supremum, and infimum

For each listed subset of $\mathbb{R}$, state whether it is bounded above and below, and its supremum and infimum when they exist. The submitted one-line answers are retained below.

- \(a\) $\mathbb{N}$: bounded below but not above; $\inf = 1$.
- \(b\) $\left\lbrack {0,1} \right\rbrack$: bounded below and above; $\inf = 0$, $\sup = 1$.
- \(c\) $\left\{ {2,7} \right\}$: bounded below and above; $\inf = 2$, $\sup = 7$.
- \(d\) $\left\{ {\pi,e} \right\}$: bounded below and above; $\inf = e$, $\sup = \pi$.
- \(e\) $\left\{ {\frac{1}{n}:n \in \mathbb{N}} \right\}$: bounded below and above; $\inf = 0$, $\sup = 1$.
- \(f\) $\left\{ 0 \right\}$: bounded below and above; $\inf = \sup = 0$.
- \(g\) $\left\lbrack {0,1} \right\rbrack \cup \left\lbrack {2,3} \right\rbrack$: bounded below and above; $\inf = 0$, $\sup = 3$.
- \(h\) $\cup_{n = 1}^{\infty{\lbrack{2n,2n + 1}\rbrack}}$: bounded below but not above; $\inf = 2$.
- \(i\) $\cap_{n = 1}^{\infty{\lbrack{- \frac{1}{n},1 + \frac{1}{n}}\rbrack}}$: bounded below and above; $\inf = 0$, $\sup = 1$.
- \(j\) $\left\{ {1 - \frac{1}{3n}:n \in \mathbb{N}} \right\}$: bounded below and above; $\inf = \frac{2}{3}$, $\sup = 1$.
- \(k\) $\left\{ {n + \frac{\left( {- 1} \right)^{n}}{n}:n \in \mathbb{N}} \right\}$: bounded below but not above; $\inf = 0$.
- \(l\) $\left\{ {r \in \mathbb{Q}:r < 2} \right\}$: bounded above but not below; $\sup = 2$.
- \(m\) $\left\{ {r \in \mathbb{Q}:r^{2} < 4} \right\}$: bounded below and above; $\inf = - 2$, $\sup = 2$.
- \(n\) $\left\{ {r \in \mathbb{Q}:r^{2} < 2} \right\}$: bounded below and above; $\inf = - \sqrt{2}$, $\sup = \sqrt{2}$.
- \(o\) $\left\{ {x \in \mathbb{R}:x < 0} \right\}$: bounded above but not below; $\sup = 0$.
- \(p\) $\left\{ {1,\frac{\pi}{3},\pi^{2},10} \right\}$: bounded below and above; $\inf = 1$, $\sup = 10$.
- \(q\) $\left\{ {0,1,2,4,8,16} \right\}$: bounded below and above; $\inf = 0$, $\sup = 16$.
- \(r\) $\cap_{n = 1}^{\infty{({1 - \frac{1}{n},1 + \frac{1}{n}})}}$: bounded below and above; $\inf = \sup = 1$.
- \(s\) $\{\frac{1}{n}:n \in \mathbb{N}$ and $n$ is prime$\}$: bounded below and above; $\inf = 0$, $\sup = \frac{1}{2}$.
- \(t\) $\left\{ {x \in \mathbb{R}:x^{3} < 8} \right\}$: bounded above but not below; $\sup = 2$.
- \(u\) $\left\{ {x^{2}:x \in \mathbb{R}} \right\}$: bounded below but not above; $\inf = 0$.
- \(v\) $\left\{ {\cos\left( {n\frac{\pi}{3}} \right):n \in \mathbb{N}} \right\}$: bounded below and above; $\inf = - 1$, $\sup = 1$.
- \(w\) $\cup_{n = 1}^{\infty{\{{\frac{k}{n}:k \in \ \mathbb{N}}\}}}$: bounded below but not above; $\inf = 0$.
- \(x\) $\cap_{n = 1}^{\infty{\{{\frac{k}{n}:k \in \ \mathbb{N}}\}}}$: bounded below but not above; $\inf = 1$.

## Problem 6 --- no ordered-field order on $\text{ℂ}$

> **Note: 原稿红字**
>
> hw 1 ①：$\text{ℂ}$ 上不可能 define linear relation；P：$\text{ℂ}$ 无法成为 ordered field。

Assume for contradiction that a linear relation $<$ is defined on $\text{ℂ}$ such that Axioms 13--14 hold: if $x < y$ then $z + x < z + y$, and if $x < y$ and $z > 0$ then $xz < yz$.

Case 1: define $i > 0$. By Axiom 14, multiplying both sides by $i > 0$ gives $i \cdot i > 0 \cdot i$, hence $- 1 > 0$. Multiplying both sides by $- 1 > 0$ gives $1 > 0$. By Axiom 13, $- 1 + 1 > 0 + 1$, so $0 > 1$. This contradicts the definition of $- 1$ that $- 1 + 1 = 0$.

Case 2: define $i = 0$. Then $i^{2} = - 1 = 0$ by Axiom 4, so $1 = - \left( {- 1} \right) = 0$, contradicting Axiom 5.

Case 3: define $i < 0$. Then $i = - a$ for some $a \in \text{ℂ}$ with $a > 0$. Thus $i^{2} = \left( {- a} \right)\left( {- a} \right) = \left( {- 1} \right)\left( {- 1} \right)a^{2} = a^{2} > 0$, so $- 1 > 0$ (by Axiom 5 and Axiom 14). The same result as in Case 1 contradicts the definition of $- 1$.

Since in all cases the assumption of a linear order contradicts the properties of $\text{ℂ}$, it is impossible to define a linear relation on $\text{ℂ}$ such that Axioms 13--14 hold.

## Problem 7 --- order and supremum

> **Note: 原稿红字**
>
> hw 1 ②：判定 $\sup A$ 的方法：满足任意 $\varepsilon > 0$，都存在 $a \in A$ 在 $L - \varepsilon$ 和 $L$ 之间。

### (a)

Let $a,b \in \mathbb{R}$. If $a \leq c$ for every $c > b$, then $a \leq b$.

> **Proof**
>
> Suppose $a > b$ for contradiction. By density of $\mathbb{Q}$ in $\mathbb{R}$, there exists $q \in \mathbb{Q}$ such that $a > q > b$. By the given condition, $a \leq q$, which contradicts $a > q$. Hence $a \leq b$.

### (b)

Let $A \subseteq \mathbb{R}$ and let $L \in \mathbb{R}$ be an upper bound of $A$. Show that $L = \sup A$ if and only if, for every $\varepsilon > 0$, there is $a \in A$ such that $L - \varepsilon < a \leq L$.

> **Proof**
>
> One direction: assume $L = \sup A$. Suppose for contradiction that, for some $\varepsilon > 0$, there is no $a \in A$ such that $L - \varepsilon < a \leq L$. Since $L = \sup A$, no $a \in A$ satisfies $a > L$. Combining the two statements, no $a \in A$ satisfies $a > L - \varepsilon$. Thus $L - \varepsilon$ is an upper bound of $A$, contradicting the definition of supremum since $L - \varepsilon < L$.
>
> The other direction: assume that for every $\varepsilon > 0$ there is $a \in A$ with $L - \varepsilon < a \leq L$. Let $M$ be an arbitrary upper bound of $A$. If $M < L$, then there is $a \in A$ with $M < a \leq L$, contradicting that $M$ is an upper bound. Therefore $M \geq L$. Since $M$ is arbitrary, $L = \sup A$.

## Problem 8 --- bounded sets

Let $S$ and $T$ be nonempty bounded subsets of $\mathbb{R}$.

> **Note: 原稿红字**
>
> hw 1 ③：$\sup\left( {S \cup T} \right) = \max\left\{ {\sup S,\sup T} \right\}$。

### (a)

> **Proof**
>
> Take arbitrary $s \in S$. By the definitions of upper and lower bounds, $\inf S \leq s$ and $\sup S \geq s$. Hence $\inf S \leq \sup S$ by transitivity of the linear order and equivalence relation.

### (b)

If $S \subseteq T$, the submitted order is $\inf T \leq \inf S \leq \sup S \leq \sup T$.

> **Proof**
>
> Part (a) gives $\inf S \leq \sup S$. It remains to prove $\inf T \leq \inf S$ and $\sup S \leq \sup T$. Let $s \in S$; since $S \subseteq T$, $s \in T$. Thus every upper bound of $T$ is also an upper bound of $S$, and every lower bound of $T$ is also a lower bound of $S$. Therefore the lower bounds of $T$ are included in the lower bounds of $S$, while the upper bounds of $T$ are included in the upper bounds of $S$. Hence $\inf S \geq \inf T$ and $\sup T \leq \sup S$.

### (c)

> **Proof**
>
> First claim: $\max\left( {\sup S,\sup T} \right)$ is an upper bound of $S \cup T$. Let $x$ be an arbitrary element of $S \cup T$. If $x \in S$, then $x \leq \sup S$, so $x \leq \max\left( {\sup S,\sup T} \right)$. If $x \in T$, then $x \leq \sup T$, so again $x \leq \max\left( {\sup S,\sup T} \right)$. Hence $\max\left( {\sup S,\sup T} \right)$ is an upper bound of $S \cup T$.
>
> Let $b$ be an arbitrary upper bound of $S \cup T$. Then $b$ is an upper bound of both $S$ and $T$. Suppose $b < \max\left( {\sup S,\sup T} \right)$. Without loss of generality suppose $b < \sup S$. Then $b$ is not an upper bound of $S$, a contradiction. Therefore $b \geq \max\left( {\sup S,\sup T} \right)$, which proves $\sup\left( {S \cup T} \right) = \max\left( {\sup S,\sup T} \right)$.

## Problem 9 --- supremum of a sum set

Let $A$ and $B$ be nonempty bounded subsets of $\mathbb{R}$, and let $A + B = \{ a + b:a \in A$ and $b \in B\}$. Prove $\sup\left( {A + B} \right) = \sup A + \sup B$.

> **Proof**
>
> First claim: $\sup A + \sup B$ is an upper bound of $A + B$. Let $a + b$ be an arbitrary element of $A + B$ ($a \in A$, $b \in B$). Then $\sup A > a$ and $\sup B > b$, hence $\sup A + \sup B > a + \sup B > a + b$. Thus $\sup\left( {A + B} \right) \leq \sup A + \sup B$.
>
> Now show $\sup A + \sup B \leq \sup\left( {A + B} \right)$. Assume for contradiction that $\sup\left( {A + B} \right) < \sup A + \sup B$. Then, for some $\varepsilon > 0$, $\sup\left( {A + B} \right) = \sup A + \sup B - \varepsilon = \left( {\sup A - \frac{\varepsilon}{2}} \right) + \left( {\sup B - \frac{\varepsilon}{2}} \right)$. By definition of supremum, $\sup A - \frac{\varepsilon}{2}$ is not an upper bound of $A$, so there is $a_{0} \in A$ with $a_{0} > \sup A - \frac{\varepsilon}{2}$. Similarly, there is $b_{0} \in B$ with $b_{0} > \sup B - \frac{\varepsilon}{2}$. Therefore $a_{0} + b_{0} \in A + B$ but $a_{0} + b_{0} > \sup\left( {A + B} \right)$, a contradiction. Thus $\sup A + \sup B \leq \sup\left( {A + B} \right)$.

## Problem 10 --- density of irrationals

Prove that $\mathbb{R} \smallsetminus \mathbb{Q}$ is dense in $\mathbb{R}$.

> **Proof**
>
> Take arbitrary $a,b \in \mathbb{R}$ with $a < b$. Then $b = a + \varepsilon$ for some $\varepsilon \in \mathbb{R}$ with $\varepsilon > 0$. By the Archimedean property of $\mathbb{R}$, there exists $n \in \mathbb{N}$ such that $n > \frac{1}{\varepsilon}$, so $\varepsilon > \frac{1}{n}$. Consider $\varepsilon' = \frac{1}{n\sqrt{2}} = \frac{1}{n} \cdot \frac{\sqrt{2}}{2}$, which is irrational since $\frac{1}{n} \in \mathbb{Q}$ and $\frac{\sqrt{2}}{2}$ is irrational. Also $\varepsilon' < \varepsilon$, since $\frac{\sqrt{2}}{2} < 1$; by Axiom 14, $\frac{1}{n} \cdot \frac{\sqrt{2}}{2} < \frac{1}{n} \cdot 1 = \frac{1}{n}$. Therefore $a < a + \varepsilon' < a + \varepsilon = b$. Hence $\mathbb{R} \smallsetminus \mathbb{Q}$ is dense in $\mathbb{R}$.

## Problem 11 --- discrete sets

A set $A \subseteq \mathbb{R}$ is discrete if for every $a \in A$ there is $\varepsilon > 0$ such that $V_{\varepsilon{(a)}} \cap A = \left\{ a \right\}$, where $V_{\varepsilon{(a)}} = \left( {a - \varepsilon,a + \varepsilon} \right)$.

> **Note: 原稿红字**
>
> hw 1 ④：任意 finite $A \subseteq \mathbb{R}$ 一定 discrete。

### (a)

> **Proof**
>
> Let $A \subseteq \mathbb{R}$ be an arbitrary finite set and let $a \in A$ be arbitrary. Consider $B = \left\{ |a - x \middle| :x \in A \right\}$. This is finite since $A$ is finite, so $B$ has a smallest element. Let $\varepsilon = \min(B)$. Then $V_{\varepsilon{(a)}} = \left( {a - \varepsilon,a + \varepsilon} \right)$, where $\varepsilon$ is the distance of $a$ from its nearest element in $A$. Thus $V_{\varepsilon{(a)}} \cap A = \left\{ a \right\}$. Since $a$ is arbitrary, $A$ is discrete.

### (b)

> **Solution: False --- counterexample**
>
> Consider $A = \left\{ {\frac{1}{n}:n \in \mathbb{N}} \right\}$. This is a discrete set: for any $\frac{1}{n} \in A$, consider $\varepsilon = \frac{1}{n} - \frac{1}{n + 1}$. Then $V_{\varepsilon{(\frac{1}{n})}} = \left( {\frac{1}{n + 1},\frac{2}{n} - \frac{1}{n + 1}} \right)$, so $V_{\varepsilon{(\frac{1}{n})}} \cap A = \left\{ \frac{1}{n} \right\}$. But no uniform $\varepsilon$ exists. If it did, then $\frac{1}{n} - \frac{1}{n + 1} > \varepsilon$ for all $n \in \mathbb{N}$, so $\varepsilon < \frac{1}{n\left( {n + 1} \right)}$ for all $n \in \mathbb{N}$, which contradicts the Archimedean property of $\mathbb{R}$.

## Problem 12 --- optional challenge problem

For $A,B \subseteq \mathbb{R}$, let $AB = \{ ab:a \in A$ and $b \in B\}$. The submitted answer, without a proof, is

$\sup\left( {AB} \right) = \max\left\{ {\inf A \cdot \inf B,\inf A \cdot \sup B,\sup A \cdot \inf B,\sup A \cdot \sup B} \right\}$.

