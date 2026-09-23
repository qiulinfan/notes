---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: Mathematical Analysis Collection
date: 2026
description: A combined collection of single-variable and multivariate mathematical analysis notes.
keywords:
- mathematical analysis
- real analysis
- multivariable analysis
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/single-and-multivariate-mathematical-analysis/main.typ"
subtitle: From real numbers and limits to several variables and measure
title: Single and Multivariate Mathematical Analysis
---

# Introduction

This collection joins the single-variable MATH 451 notes with the multivariate MATH 395 notes. The reading path moves from the real-number system, sequences, continuity, differentiation, series, and Riemann integration to metric spaces, multivariable differentiation, implicit functions, change of variables, and an IBL transition toward Lebesgue measure.

The original course directories and their source manifests remain authoritative. This entry only composes their lecture notes and personal homework transcriptions for publication. Missing submissions and unfinished source proofs remain visibly missing rather than being reconstructed from checking-only material.

# The real-number system

## Set notation and the construction of $\mathbb{N}$

源页题记：「此课将使用以下 symbols」。

> **Definition: Power set and indexed families**
>
> The power set of $X$ is $\mathcal{P}(X) = \left\{ {A:A \subseteq X} \right\}$. 若 $I$ 是一个 set，且对每个 $i \in I$， $A_{i}$ 是一个 set，则 $\left\{ {A_{i}:i \in I} \right\}$ 是一个 **indexed family of sets**。

For such a family,

$$
\bigcup\limits_{i \in I}A_{i} = \left\{ {x:x \in A_{i}\ \text{for some}\ i \in I} \right\}
$$

and

$$
\bigcap\limits_{i \in I}A_{i} = \left\{ {x:x \in A_{i}\ \text{for all}\ i \in I} \right\}.
$$

The relative complement is $A \smallsetminus B = \left\{ {x \in A:x \notin B} \right\}$. The source places these next to the inclusion chain

$$
\mathbb{N} \subseteq \mathbb{Z} \subseteq \mathbb{Q} \subseteq \mathbb{R} \subseteq \text{ℂ}.
$$

It annotates this chain with "given by God" below $\mathbb{N}$ and "algebraically closed" below $\text{ℂ}$. The structural discussion distinguishes three approaches to fundamental issues:

- naïve approach;
- axiomatic approach; and
- constructive approach (set theory, 582).

constructive approach 从 $0 = \varnothing$, $1 = \left\{ 0 \right\} = \left\{ \varnothing \right\}$, $2 = \left\{ {0,1} \right\} = \left\{ {\varnothing,\left\{ \varnothing \right\}} \right\}$, and $3 = \left\{ {0,1,2} \right\}$ 构造 $\mathbb{N}$。本课程中 $0 \notin \mathbb{N}$。

> **Definition: Inductive subset of $\mathbb{R}$**
>
> A set $I \subseteq \mathbb{R}$ is **inductive** if:
>
> - $0 \in I$; and
> - for every $x \in \mathbb{R}$, $x \in I$ implies $x + 1 \in I$.
>
> Then $\mathbb{N} = \bigcap\left\{ {I \subseteq \mathbb{R}:I\ \text{is inductive}} \right\}$ is the smallest inductive subset of $\mathbb{R}$; hence $\mathbb{N} = \left\{ {1,2,3,\ldots} \right\}$ under the course convention.

> **Definition: Definitions by induction**
>
> For $a \in \mathbb{R}$ and $n \in \mathbb{N}$, integer powers are fixed by $a^{0} = 1$ and $a^{n} = a^{n - 1}a$. The factorial is fixed by $0! = 1$ and $\left( {n + 1} \right)! = \left( {n + 1} \right)n!$.
>
> The handout also records summation and product notation: $\sum_{k = 1}^{n + 1}a_{k} = \sum_{k = 1}^{n}a_{k} + a_{n + 1}$ and $\prod_{k = 1}^{n + 1}a_{k} = \left( {\prod_{k = 1}^{n}a_{k}} \right)a_{n + 1}$.

The recalled identities are

- $\sum_{k = 1}^{n}k = \frac{n\left( {n + 1} \right)}{2}$;
- $\sum_{k = 1}^{n}k^{2} = n\left( {n + 1} \right)\frac{2n + 1}{6}$;
- $\sum_{k = 0}^{n}r^{k} = \frac{1 - r^{n + 1}}{1 - r}$ for $r \neq 1$;
- $\left( \frac{n}{k} \right) = \left( \frac{n - 1}{k} \right) + \left( \frac{n - 1}{k - 1} \right)$; and
- $\left( {a + b} \right)^{n} = \sum_{k = 0}^{n}\left( \frac{n}{k} \right)a^{n - k}b^{k}$.

The source labels the last formula "Binomial Thm".

## Ordered fields and completeness

$\mathbb{R}$ 是一个 ordered field：其 order 是 transitive、irreflexive 和 trichotomous。它满足 completeness axiom：每个非空且 bounded above 的 $\mathbb{R}$ 的 subset 在 $\mathbb{R}$ 中都有 supremum。这是 $\mathbb{R}$ 的 geometric'' closure， 区别于 $\text{ℂ}$ 的 algebraic closure。

> **Theorem: The unique complete ordered field**
>
> $\mathbb{R}$ is the unique complete ordered field. Also, $\mathbb{N}$ is the intersection of all inductive subsets of $\mathbb{R}$.

源页以混排写道：$\mathbb{N}$ 有 $+$ 和 $\times$，但没有 $+^{- 1}$；$\mathbb{Z}$ 有 $+^{- 1}$，但没有 $\times^{- 1}$；$\left( {\mathbb{Q}, + , \times , <} \right)$ 才满足 ordered-field axioms。 随后标出 $\mathbb{Q}$ 的 algebraic deficiency''：有 rational coefficients 的 polynomial equation 却没有 rational root。例子是 $x^{2} - 2 = 0$，旁注为 Pythagoras: $\sqrt{2}$ is irrational''。

> **Theorem: Rational roots theorem**
>
> Let $f(x) = \sum_{k = 0}^{n}a_{k}x^{k}$ with $a_{k} \in \mathbb{Z}$ and $a_{0}a_{n} \neq 0$. If $r = \frac{p}{q}$ is a root, where $p,q \in \mathbb{Z}$ are coprime and $q \neq 0$, then $\left. p\  \middle| \ a_{0} \right.$ and $\left. q\  \middle| \ a_{n} \right.$.

Indeed, multiplying $0 = f\left( \frac{p}{q} \right) = \sum_{k = 0}^{n}a_{k{(\frac{p}{q})}}^{k}$ by $q^{n}$ yields

$a_{0}q^{n} = - \sum_{k = 1}^{n}a_{k}p^{k}q^{n - k}$

and, symmetrically,

$a_{n}p^{n} = - \sum_{k = 0}^{n - 1}a_{k}p^{k}q^{n - k}$.

Thus $\left. p\  \middle| \ a_{0}q^{n} \right.$ and $\left. q\  \middle| \ a_{n}p^{n} \right.$; coprimality and the Fundamental Theorem of Arithmetic give $\left. p\  \middle| \ a_{0} \right.$ and $\left. q\  \middle| \ a_{n} \right.$. For $f(x) = x^{2} - 2$, the only possible rational roots would be in $\left\{ {- 2, - 1,1,2} \right\}$, and none is a root.

> **Definition: Algebraic and transcendental numbers**
>
> A complex number $z$ is **algebraic** if it is a root of a polynomial with coefficients in $\mathbb{Q}$; otherwise $z$ is **transcendental**.

The examples in the source are $\sqrt{2}$ (a root of $x^{2} - 2$), $\sqrt{2 + \sqrt[3]{4}}$ (a root of $x^{6} - 6x^{4} + 12x^{2} - 12$), $i = \sqrt{- 1}$ (a root of $x^{2} + 1$), and every $q \in \mathbb{Q}$ (a root of $x - q$). The annotation is "$\pi$ and $e$ are transcendental (hard to prove)". The set of all algebraic numbers is denoted $\bar{\mathbb{Q}}$, the algebraic closure of $\mathbb{Q}$, and is a field.

> **Definition: Algebraically closed field**
>
> A field $F$ is algebraically closed if every polynomial of degree $n$ with coefficients in $F$ has $n$ roots in $F$, counting multiplicities.

Thus $\bar{\mathbb{Q}}$ is algebraically closed, and the Fundamental Theorem of Algebra says that $\text{ℂ}$ is algebraically closed. 源页旁注以原来的 混排对照 algebraically closed'' 与 geometric deficiency (R.F. order theory)''：$\bar{\mathbb{Q}}$ 有一部分 real numbers 和一部分 non-real numbers，但缺少 $\mathbb{R}$ 的 order-theoretic completeness。

## Bounds, extrema, and intervals

> **Definition: Upper/lower bounds and extrema**
>
> Let $X$ have a linear relation $\leq$, and let $A \subseteq X$. A point $b \in X$ is an **upper bound** of $A$ when $a \leq b$ for every $a \in A$; then $A$ is bounded above in $X$. Lower bounds and bounded below are defined dually.
>
> If $b \in A$ is an upper bound, then $b = \max A$, the largest element of $A$. If $b$ is an upper bound and every upper bound $u$ satisfies $u \geq b$, then $b = \sup A$, the least upper bound (supremum). Dually one has $\min A$ and $\inf A$ (infimum).

The notes emphasize that $A$ may have no $\frac{\max}{\min}$ in $X$ and may have no $\frac{\sup}{\inf}$ in $X$. If a maximum exists, it is unique: if $a,b = \max A$, then $a \leq b$ and $b \leq a$, so $a = b$.

> **Definition: Bounded set and interval**
>
> $A \subseteq X$ is **bounded in $X$** if it is both bounded above and bounded below. An interval $I \subseteq X$ is a set such that whenever $x,y \in I$ and $x \leq z \leq y$, then $z \in I$.

For a linear order, $\left\lbrack {a,b} \right\rbrack = \left\{ {x \in X:a \leq x \leq b} \right\}$ and $\left( {a,b} \right\rbrack = \left\{ {x \in X:a < x \leq b} \right\}$; similarly for the other endpoint choices. The convention on the page is $\left\lbrack {a,\infty} \right) = \left\{ {x \in X:x \geq a} \right\}$, $\sup\varnothing = - \infty$, and $\inf\varnothing = + \infty$. The latter two are explicitly "not in $\mathbb{R}$".

Examples from the page:

- every finite $A \subseteq \mathbb{R}$ is bounded and has a maximum and minimum;
- $\mathbb{N}$, $\mathbb{Z}$, and $\mathbb{Q}$ are not bounded above in $\mathbb{R}$;
- $\mathbb{N}$ is bounded below in $\mathbb{R}$, with $\inf\mathbb{N} = 1$ and its lower bounds $\left( {- \infty,1} \right\rbrack$;
- $\inf\left( {0,1} \right) = \inf\left\lbrack {0,1} \right\rbrack = 0$ and $\sup\left( {0,1} \right) = \sup\left\lbrack {0,1} \right\rbrack = 1$;
- $\min\left( {0,1} \right)$ does not exist, while $\min\left\lbrack {0,1} \right\rbrack = 0$;
- for $A = \left\{ {\frac{1}{n}:n \in \mathbb{N}} \right\}$, $\inf A = 0$, $\sup A = \max A = 1$, and $\min A$ does not exist.

If $x$ is an upper bound of $A$ in $X$, every $y \geq x$ in $X$ is an upper bound; lower bounds satisfy the dual statement. If $A$ has a maximum, then $\sup A = \max A$.

> **Theorem: Completeness axiom and its dual**
>
> Every nonempty $A \subseteq \mathbb{R}$ that is bounded above has $\sup A \in \mathbb{R}$. Equivalently, every nonempty $A \subseteq \mathbb{R}$ bounded below has $\inf A \in \mathbb{R}$.

For the dual statement, let $L$ be the set of all lower bounds of $A$. Then $\sup L \in \mathbb{R}$, and $\inf A = \sup L$. Equivalently, with $- A = \left\{ {- a:a \in A} \right\}$, a nonempty set bounded below has $\inf A = - \sup\left( {- A} \right)$.

源页称此为 LUB property''，并写道 geometrically complete ordered set 需要 LUB property''；从这个意义上 complete ordered field 就是 $\mathbb{R}$。In particular, $A = \left\{ {r \in \mathbb{Q}:r^{2} < 2} \right\}$ has $\sup A = \sqrt{2}$ outside $\mathbb{Q}$; this exhibits the geometric deficiency of both $\mathbb{Q}$ and $\bar{\mathbb{Q}}$.

## Page-complete lecture record

The following preserves the remaining readable working, labels, and native schematics from the two source pages. It is intentionally kept in the source's Chinese--English mixed language.

### L01--Real--Num--System--I, p. 1

The sheet begins Instructor: Scott Schneider and records the four symbols power set, indexed family, indexed union, indexed intersection, and relative complement. Its number-system relationship is reconstructed as a native table; the labels given by god, ordered field, field, and algebraically closed occur at these positions.

It explicitly gives

$\mathcal{P}(X) = \left\{ {A:A \subseteq X} \right\},\quad\bigcup_{i \in I}A_{i} = \left\{ {x:x \in A_{i}\ \text{for some}\ i \in I} \right\},$

$\bigcap_{i \in I}A_{i} = \left\{ {x:x \in A_{i}\ \text{for all}\ i \in I} \right\},\quad A \smallsetminus B = \left\{ {x \in A:x \notin B} \right\}.$

If $I$ is a set and, for every $i \in I$, $A_{i}$ is a set, then $\left\{ {A_{i}:i \in I} \right\}$ is an **indexed family of sets**. The three approaches are The three approaches are (1) naive approach; (2) axiomatic approach; and (3) constructive approach (set theory, 582). Under Using constructive approach to build $\mathbb{N}$, it lists

$0 = \varnothing,\quad 1 = \left\{ 0 \right\} = \left\{ \varnothing \right\},\quad 2 = \left\{ {0,1} \right\} = \left\{ {\varnothing,\left\{ \varnothing \right\}} \right\},\quad 3 = \left\{ {0,1,2} \right\} = \left\{ {\varnothing,\left\{ {\varnothing,\left\{ \varnothing \right\}} \right\}} \right\},\ldots.$

In this class, $0 \notin \mathbb{N}$. The inductive definition reads

$I \subseteq \mathbb{R}\text{is inductive}\Rightarrow 0 \in I\ \text{and}\ \left( {\forall x \in \mathbb{R}} \right)\left( {x \in I\Rightarrow x + 1 \in I} \right),$

$\mathbb{N} = \bigcap\left\{ {I:I\ \text{is an inductive subset of}\ \mathbb{R}} \right\}\quad\text{(smallest inductive subset)},$

followed by Then $\mathbb{N} = \left\{ {1,2,3,\ldots} \right\}$. The recalled secondary-school formulas are, in the source order,

$\sum_{k = 1}^{n}k = \frac{n\left( {n + 1} \right)}{2},\quad\sum_{k = 1}^{n}k^{2} = n\left( {n + 1} \right)\frac{2n + 1}{6},$

$\sum_{k = 0}^{n}r^{k} = \frac{1 - r^{n + 1}}{1 - r},\quad\left( \frac{n}{k} \right) = \left( \frac{n - 1}{k} \right) + \left( \frac{n - 1}{k - 1} \right),$

and, for all $a,b \in \mathbb{R}$, $\left( {a + b} \right)^{n} = \sum_{k = 0}^{n}\left( \frac{n}{k} \right)a^{n - k}b^{k}$ (Binomial Thm.). The induction definitions also state, for $a \in \mathbb{R}$,

$a^{0} = 1,\quad a^{n} = a^{n - 1}a;\quad 0 \neq 1,\quad\left( {n + 1} \right) \neq \left( {n + 1} \right)n!,$

$\sum_{k = 1}^{1}a_{k} = \prod_{k = 1}^{1}a_{k} = a_{1},$

$\sum_{k = 1}^{n + 1}a_{k} = \sum_{k = 1}^{n}a_{k} + a_{n + 1},\quad\prod_{k = 1}^{n + 1}a_{k} = \left( {\prod_{k = 1}^{n}a_{k}} \right)a_{n + 1}.$

The last lower-right note says that $\mathbb{R}$ has the linear relation $<$, marked (1) transitive, irreflexive; (2) trichotomy, and the completeness axiom $\forall S \subseteq \mathbb{R}$, $S \neq \varnothing$, $\sup S \in \mathbb{R}$.

### L02--Real--Num--System--II, p. 1

The top note is $\mathbb{R}$ is the unique complete ordered field (所有 complete ordered field 都同构 $\mathbb{R}$), and again $\mathbb{N}$ is the intersection of all inductive subsets of $\mathbb{R}$. The deficiency table is retained in source order:

  ----------------------------------------------- -------------------------------------------------------------------------------------------
  $\mathbb{N}$                                    没有 $+^{- 1}$, $\times^{- 1}$
  $\mathbb{Z}$                                    没有 $\times^{- 1}$
  $\left( {\mathbb{Q}, + , \times , <} \right)$   satisfies Axiom 1--14, so $\mathbb{Q}$ is an ordered field
  $\mathbb{Q}$                                    algebraic deficiency: rational-coefficient algebraic equations can have no rational roots
  ----------------------------------------------- -------------------------------------------------------------------------------------------

For $f(x) = x^{2} - 2$, the page writes $r = \frac{p}{q}$, $\left. p \middle| - 2 \right.$, $\left. q \middle| 1 \right.$, hence $r \in \left\{ {- 2, - 1,1,2} \right\}$, and says these are not roots. Its complete calculation is

$f\left( \frac{p}{q} \right) = \sum_{k = 0}^{n}a_{k{(\frac{p}{q})}}^{k} = 0,$

$\sum_{k = 0}^{n}a_{k}p^{k}q^{n - k} = 0,$

$a_{0}q^{n} = - \sum_{k = 1}^{n}a_{k}p^{k}q^{n - k} = p\left( {- \sum_{k = 1}^{n}a_{k}p^{k - 1}q^{n - k}} \right) \in \mathbb{Z},$

$a_{n}p^{n} = q\left( {- \sum_{k = 0}^{n - 1}a_{k}p^{k}q^{n - k - 1}} \right) \in \mathbb{Z}.$

By FTA and $\left( {p,q} \right) = 1$, this yields $\left. p \middle| a_{0} \right.$ and $\left. q \middle| a_{n} \right.$. The algebraic-number examples are: $\sqrt{2}$ is a root of $x^{2} - 2$; $\sqrt{2 + \sqrt[3]{4}}$ is a root of $x^{6} - 6x^{4} + 12x^{2} - 12$; $i = \sqrt{- 1}$ is a root of $x^{2} + 1$; and every $q \in \mathbb{Q}$ is algebraic since it is a root of $x - q = 0$. $\pi$ and $e$ are transcendental (hard to prove). The set of all algebraic numbers is $\bar{\mathbb{Q}}$, which is a field, called the algebraic closure of $\mathbb{Q}$.

An algebraically closed field is stated as: every polynomial of degree $n$ with coeffs in $F$ has $n$ roots in $F$ (counting multiplicities). Thus $\bar{\mathbb{Q}}$ is algebraically closed; by FTA, $\text{ℂ}$ is algebraically closed. $\bar{\mathbb{Q}}$ has some irrational and some non-real numbers, but still has geometric deficiency (see order theory). The reminder is: an irreflexive, transitive partial order ($\leq$) that also has trichotomy is a linear order ($<$).

### L02--Real--Num--System--II, p. 2

For bounds, the sheet requires $A \subseteq X$, $b \in X$, and a linear relation on $X$:

$b\ \text{is an upper bound of}\ A\Rightarrow\left( {\forall a \in A} \right)a \leq b,$

$b = \max A\Rightarrow b \in A\ \text{and}\ b\ \text{is an upper bound},$

$b = \sup A\Rightarrow b\ \text{is an upper bound and}\ \left( {\forall u\ \text{upper bound of}\ A} \right)u \geq b.$

Similarly we have lower bound, bounded below, $\min A$, infimum $\left( {\inf A} \right)$. Its proof of uniqueness is $a,b = \max A\Rightarrow a \leq b,b \leq a\Rightarrow a = b$. An interval is

$I \subseteq X\ \text{is an interval}\Rightarrow x,y \in I,x < z < y\Rightarrow z \in I.$

It records $\left\lbrack {a,b} \right\rbrack = \left\{ {x \in X:a \leq x \leq b} \right\}$ and $\left( {a,b} \right\rbrack = \left\{ {x \in X:a < x \leq b} \right\}$, then the convention $\left\lbrack {a,\infty} \right) = \left\{ {x \in X:x \geq a} \right\}$, $\sup\varnothing = - \infty$, $\inf\varnothing = + \infty$ (They are not in $\mathbb{R}$). The listed examples are:

- Every finite $A \subseteq \mathbb{R}$ is bounded and has $\max,\min$.
- $\mathbb{N},\mathbb{Z},\mathbb{Q}$ are not bounded above in $\mathbb{R}$.
- $\mathbb{N}$ is bounded below in $\mathbb{R}$, $\inf\mathbb{N} = 1$, and all lower bounds of $\mathbb{N}$ in $\mathbb{R}$ are $\left( {- \infty,1} \right\rbrack$.
- $\inf\left( {0,1} \right) = \inf\left\lbrack {0,1} \right\rbrack = 0$, $\sup\left( {0,1} \right) = \sup\left\lbrack {0,1} \right\rbrack = 1$, $\min\left( {0,1} \right)$ and $\max\left( {0,1} \right)$ DNE, while $\min\left\lbrack {0,1} \right\rbrack = 0$, $\max\left\lbrack {0,1} \right\rbrack = 1$.
- For $A = \left\{ {\frac{1}{n}:n \in \mathbb{N}} \right\}$, $\min A$ DNE, $\inf A = 0$, $\max A = \sup A = 1$.

If $x$ is a UB of $A$ in $X$, every $y \geq x$ in $X$ is a UB (LB similarly); if $A$ has a maximum then $\max A = \sup A$. The LUB property is: if $A \subseteq X$ is not empty, then $\sup A \in X$; an ordered set with it is geometrically complete, and an ordered field with it is a complete ordered field. The handwritten example is

$A = \left\{ {r \in \mathbb{Q}:r^{2} < 2} \right\}\Rightarrow\sup A = \sqrt{2} \notin \mathbb{Q},$

and it closes: $\mathbb{Q}$ and $\bar{\mathbb{Q}}$ have geometric deficiency, whereas $\mathbb{R}$ is a complete ordered field (but has algebraic deficiency).

# Functions, countability, and metric spaces

## Archimedean facts and metric spaces

源页问 一个 field 既 algebraically closed 又 geometrically closed''。 答案是 $\text{ℂ}$：both algebraically and geometrically closed (topologically)''； 但 $\text{ℂ}$ 不是 ordered field。作业旁注是 impossible to define linear order on $\text{ℂ}$''。尽管 $\mathbb{R}$ 的 completeness axiom 用 order 表述，后面会从 Cauchy sequences 得到一个不依赖 order 的版本。

> **Theorem: Useful supremum test**
>
> Let $A \subseteq \mathbb{R}$ and $l \in \mathbb{R}$. Then $l = \sup A$ if and only if $l$ is an upper bound of $A$ and, for every $\varepsilon > 0$, there exists $a \in A$ with $l - \varepsilon < a \leq l$.

The Chinese explanation is: "只要下移一点点，就会超进去". For a set bounded below, if $L$ is its set of lower bounds, then $\inf A = \sup L$; equivalently, $\inf A = - \sup\left( {- A} \right)$.

> **Theorem: Copies of $\mathbb{N}$, $\mathbb{Z}$, and $\mathbb{Q}$**
>
> Every ordered field $F$ contains copies of $\mathbb{N}$, $\mathbb{Z}$, and $\mathbb{Q}$: $1_{F}$, $2_{F} = 1_{F} + 1_{F}$, and so on give $\mathbb{N}$; additive inverses give $\mathbb{Z}$; and $\frac{p_{F}}{q_{F}}$ gives $\mathbb{Q}$.

> **Theorem: Archimedean properties**
>
> In an Archimedean ordered field $F$:
>
> - for every $x \in F$, there is $n \in \mathbb{N}$ with $x < n$;
> - for every $x > 0$ in $F$, there is $n \in \mathbb{N}$ with $\frac{1}{n} < x$;
> - for every $x \in F$, there is $n \in \mathbb{Z}$ with $n - 1 \leq x \leq n$;
> - equivalently, for $x,y > 0$ in $F$, there is $n \in \mathbb{N}$ with $ny > x$.

这些 characterizations 给出 $\mathbb{Q}$ 的 density：

$\forall x < y \in F,\exists r \in \mathbb{Q}:x < r < y.$

取 $n$ 使 $n\left( {y - x} \right) > 2$，再取 $m \in \mathbb{Z}$ 使 $nx < m < ny$，于是 $x < \frac{m}{n} < y$。所以任意两个 reals 之间有 infinitely many rational points。 源页还写 $\mathbb{R} \smallsetminus \mathbb{Q}$ is also dense in $\mathbb{R}$ (hw)''。

> **Theorem: $\mathbb{R}$ is Archimedean**
>
> $\mathbb{R}$ is an Archimedean ordered field.

若 $\mathbb{N}$ 有 upper bound，令 $s = \sup\mathbb{N}$。则 $s - 1$ 不是 upper bound，故某个 $n \in \mathbb{N}$ 满足 $s - 1 < n$。于是 $s < n + 1$，但 $n + 1 \in \mathbb{N}$，矛盾。源页给出 $\mathbb{R}(x)$（rational functions）和 $p$-adic fields $\mathbb{Q}_{p}$ 作为 non-Archimedean examples，并写道： "there is a consistent and rigorous way to do calculus with infinitesimals (non-standard analysis)".

> **Definition: Absolute value**
>
> For $a,b \in \mathbb{R}$, $- |a| \leq a \leq |a|$, $|a| = \sqrt{a^{2}}$, $\left| {ab} \right| = |a||b|$, and $\left| {a + b} \right| \leq |a| + |b|$. Consequently $\left| {|a| - |b|} \right| \leq \left| {a - b} \right|$.

The proof of the triangle inequality squares both sides: $\left( {a + b} \right)^{2} \leq a^{2} + 2|a||b| + b^{2} = \left( {|a| + |b|} \right)^{2}$. The extended form is $\left| {\sum_{i = 1}^{n}a_{i}} \right| \leq \sum_{i = 1}^{n}\left| a_{i} \right|$.

> **Definition: Metric and metric space**
>
> A metric on $X$ is a map $d:X \times X\rightarrow\mathbb{R}$ such that, for all $a,b,c \in X$:
>
> - $d\left( {a,b} \right) \geq 0$, with equality if and only if $a = b$;
> - $d\left( {a,b} \right) = d\left( {b,a} \right)$; and
> - $d\left( {a,c} \right) \leq d\left( {a,b} \right) + d\left( {b,c} \right)$.
>
> The pair $\left( {X,d} \right)$ is a metric space.

> **Theorem: Euclidean metric**
>
> For every $k \in \mathbb{N}$, $\mathbb{R}^{k}$ is a metric space under $d\left( {\begin{pmatrix}
> x
> \end{pmatrix},\begin{pmatrix}
> y
> \end{pmatrix}} \right) = \left\| {\begin{pmatrix}
> x
> \end{pmatrix} - \begin{pmatrix}
> y
> \end{pmatrix}} \right\|$, where $\begin{pmatrix}
> x
> \end{pmatrix} \cdot \begin{pmatrix}
> y
> \end{pmatrix} = \sum_{i = 1}^{k}x_{i}y_{i}$ and $\left\| \begin{pmatrix}
> x
> \end{pmatrix} \right\| = \sqrt{\begin{pmatrix}
> x
> \end{pmatrix} \cdot \begin{pmatrix}
> x
> \end{pmatrix}}$.

Cauchy--Schwarz, $\left| {\begin{pmatrix}
x
\end{pmatrix} \cdot \begin{pmatrix}
y
\end{pmatrix}} \right| \leq \left\| \begin{pmatrix}
x
\end{pmatrix} \right\|\left\| \begin{pmatrix}
y
\end{pmatrix} \right\|$, follows by expanding $\left\| {\lambda\begin{pmatrix}
x
\end{pmatrix} - \begin{pmatrix}
y
\end{pmatrix}} \right\|^{2} \geq 0$ and taking $\lambda = \frac{\begin{pmatrix}
x
\end{pmatrix} \cdot \begin{pmatrix}
y
\end{pmatrix}}{\left\| \begin{pmatrix}
x
\end{pmatrix} \right\|^{2}}$ when $\begin{pmatrix}
x
\end{pmatrix} \neq 0$. The metric triangle inequality then follows from $\begin{pmatrix}
x
\end{pmatrix} - \begin{pmatrix}
y
\end{pmatrix} = \left( {\begin{pmatrix}
x
\end{pmatrix} - \begin{pmatrix}
z
\end{pmatrix}} \right) + \left( {\begin{pmatrix}
z
\end{pmatrix} - \begin{pmatrix}
y
\end{pmatrix}} \right)$.

## Functions

The lecture begins with

$\left\lbrack {a,b} \right\rbrack = \bigcap_{n \in \ \mathbb{N}}\left( {a - \frac{1}{n},b + \frac{1}{n}} \right)$

and

$\left( {a,b} \right) = \bigcup_{n \in \ \mathbb{N}}\left\lbrack {a + \frac{1}{n},b - \frac{1}{n}} \right\rbrack$.

It records $\inf\left( {A \cup B} \right) = \min\left( {\inf A,\inf B} \right)$, $\sup\left( {A \cup B} \right) = \max\left( {\sup A,\sup B} \right)$, $\sup\left( {cA} \right) = c\sup A$ for $c > 0$, $\sup\left( {- A} \right) = - \inf A$, and $\sup\left( {A + B} \right) = \sup A + \sup B$. The warning is $\sup\left( {AB} \right) \neq \sup A\sup B$ in general.

> **Definition: Function, domain, codomain, image**
>
> 一个 function $f:X\rightarrow Y$ 是 $f \subseteq X \times Y$ 的 subset，且对每个 $x \in X$，恰有一个 $y \in Y$ 满足 $\left( {x,y} \right) \in f$。 Write $\text{dom}(f) = X$, $\text{cod}(f) = Y$, and $\operatorname{im}(f) = \text{ran}(f) = \left\{ {f(x):x \in X} \right\} \subseteq Y$.
>
> For $A \subseteq X$ and $B \subseteq Y$, $f\lbrack A\rbrack = \left\{ {f(a) \in Y:a \in A} \right\}$ and $f^{- 1}\lbrack B\rbrack = \left\{ {x \in X:f(x) \in B} \right\}$.

源页 examples 为 $x\mapsto x^{2}$ on $\mathbb{R}$、$x\mapsto\frac{1}{x}$ on $\mathbb{R} \smallsetminus \left\{ 0 \right\}$、the supremum function from $\mathcal{P}\left( \mathbb{R} \right)$ to $\mathbb{R} \cup \left\{ {+ \infty, - \infty} \right\}$, the harmonic function $n\mapsto\frac{1}{n}$, and Dirichlet's function $D(x) = 1$ for $x \in \mathbb{Q}$ and $D(x) = 0$ for $x \in \mathbb{R} \smallsetminus \mathbb{Q}$.

The handout "More Joy of Sets" retains its English terminology: "map" and "mapping" are synonyms for function; domain/source and codomain/target space are $\text{dom}(f)$ and $\text{cod}(f)$; an input variable is independent and an output variable dependent. The pointwise notation is $x\mapsto f(x)$.

For image and inverse image:

- $f\left\lbrack {f^{- 1}\lbrack C\rbrack} \right\rbrack \subseteq C$ and $f^{- 1}\left\lbrack {f\lbrack A\rbrack} \right\rbrack \supseteq A$;
- $f\left\lbrack {A \cup B} \right\rbrack = f\lbrack A\rbrack \cup f\lbrack B\rbrack$;
- $f\left\lbrack {A \cap B} \right\rbrack \subseteq f\lbrack A\rbrack \cap f\lbrack B\rbrack$;
- $f\left\lbrack {A \smallsetminus B} \right\rbrack \supseteq f\lbrack A\rbrack \smallsetminus f\lbrack B\rbrack$;
- inverse images preserve union, intersection, and difference exactly.

The identity is $\operatorname{id}_{X}:X\rightarrow X$, $\operatorname{id}_{X{(x)}} = x$. Composition is $\left( {g \circ f} \right)(x) = g\left( {f(x)} \right)$ and is associative.

> **Definition: Inverse, injection, surjection, bijection**
>
> An inverse of $f:X\rightarrow Y$ is $g:Y\rightarrow X$ with $g \circ f = \operatorname{id}_{X}$ and $f \circ g = \operatorname{id}_{Y}$. A function is injective if $x \neq x'$ implies $f(x) \neq f\left( x' \right)$, surjective if each $y \in Y$ has a preimage, and bijective if it is both.

> **Theorem: Invertibility criterion**
>
> A function is invertible if and only if it is bijective.

If $f:X\rightarrow Y$ and $g:Y\rightarrow Z$, composition preserves injectivity, surjectivity, and bijectivity; if $g \circ f$ is injective, $f$ is injective, and if it is surjective, $g$ is surjective. The source's graph remark is that horizontal lines meet an injective real graph at most once and a surjective one at least once.

The restriction of $f:X\rightarrow Y$ to $A \subseteq X$ is the map $A\rightarrow Y$ which agrees with $f$ on $A$. Thus $x\mapsto x^{2}$ on $\mathbb{R}$ is neither injective nor surjective, its restriction to $\left\lbrack {0,\infty} \right)$ is injective, and $\left\lbrack {0,\infty} \right)\rightarrow\left\lbrack {0,\infty} \right)$, $x\mapsto x^{2}$, is bijective.

list 记住 order 和 repetition： $\left( {N,A,S,A} \right) \neq \left( {N,A,S} \right)$ and $\left( {N,A,S} \right) \neq \left( {N,S,A} \right)$. An $n$-tuple is $\left( {x_{1},\ldots,x_{n}} \right)$. The Cartesian product is $X \times Y = \left\{ {\left( {x,y} \right):x \in X\ \text{and}\ y \in Y} \right\}$, while $\mathbb{R}^{n}$ is both a Cartesian product and a vector space. The graph is $\text{graph}(f) = \left\{ {\left( {x,y} \right) \in X \times Y:f(x) = y} \right\}$, and the rigorous ordered-pair encoding is $\left( {x,y} \right) = \left\{ {\left\{ x \right\},\left\{ {x,y} \right\}} \right\}$.

## Cardinality and countability

> **Definition: Cardinality and countability**
>
> $X$ is finite if $\left. |X \middle| = n \right.$ for some $n \in \mathbb{N}$, and infinite if an injection $\mathbb{N}\rightarrow X$ exists. Write $X \leq Y$ for an injection $X\rightarrow Y$, and $X \approx Y$ for a bijection.
>
> $X$ is countably infinite if $X \approx \mathbb{N}$; it is countable if $X \leq \mathbb{N}$.

The example $\mathbb{N} \approx \mathbb{Z}$ maps an odd $n$ to $\frac{n - 1}{2}$ and an even $n$ to $- \frac{n}{2}$; it is bijective.

> **Theorem: Cantor--Schröder--Bernstein**
>
> If $X \leq Y$ and $Y \leq X$, then $X \approx Y$.

> **Theorem: Cantor diagonal arguments**
>
> $\mathbb{Q}$ is countable, $\mathbb{R}$ is uncountable, and every set $X$ satisfies $\left. |\mathcal{P}(X) \middle| > \middle| X| \right.$.

Rationals are diagonally enumerated as pairs $\left( {m,n} \right) \in \mathbb{Z} \times \mathbb{Z}$, $n \neq 0$. If $f:\mathbb{N}\rightarrow\left\lbrack {0,1} \right\rbrack$ were surjective, choose decimal $0.d_{1}d_{2}\ldots$ whose $n$th digit differs from the $n$th digit of $f(n)$; it is not in the range. More generally, for $f:X\rightarrow\mathcal{P}(X)$, $D = \left\{ {x \in X:x \notin f(x)} \right\}$ cannot equal $f\left( x_{0} \right)$ for any $x_{0}$. The page notes $\text{ℂ} \approx \mathbb{R}^{2}$ and calls the assertion that no cardinality lies strictly between $\mathbb{N}$ and $\mathbb{R}$ the continuum hypothesis.

> **Theorem: Countable products and unions**
>
> If $A_{1},\ldots,A_{n}$ are countable, then $A_{1} \times \ldots \times A_{n}$ is countable. If $I$ is countable and every $A_{i}$ is countable, then $\bigcup_{i \in I}A_{i}$ is countable.

For the product, injections $f_{i}:A_{i}\rightarrow\mathbb{N}$ yield

$f\left( {a_{1},\ldots,a_{n}} \right) = \prod_{i = 1}^{n}p_{i}^{f_{i{(a_{i})}}},$

an injection by unique prime factorization. For the union, take a surjection $f:\mathbb{N}\rightarrow I$, surjections $f_{n}:\mathbb{N}\rightarrow A_{f{(n)}}$, and a surjection $h:\mathbb{N}\rightarrow\mathbb{N} \times \mathbb{N}$ with $h(n) = \left( {n_{1},n_{2}} \right)$; then $g(n) = f_{n_{1}}\left( n_{2} \right)$ is surjective onto the union.

最后，$\left( {a,b} \right)$ 包含 uncountably many irrational numbers：若其 irrational part countable，与 $\left( {a,b} \right) \cap \mathbb{Q}$ 的 union 会使 $\left( {a,b} \right)$ countable。手写结论为 $\bar{\mathbb{Q}}$ is countable，so there are uncountably many transcendental numbers。

## Page-complete lecture record

### L03--Archimedean-property&Metric-Space, p. 1

The review first says $\bar{\mathbb{Q}}$ is algebraically closed and $\mathbb{R}$ is geometrically closed, but $\bar{\mathbb{Q}} \neq \mathbb{R}$ and $\mathbb{R} \neq \bar{\mathbb{Q}}$. The written question is "can we find a both-closed field?" Answer: yes, $\text{ℂ}$; "$\text{ℂ}$ is both algebraically and geometrically closed (topologically)". However, "$\text{ℂ}$ is not an ordered field" and the homework is "impossible to define linear order on $\text{ℂ}$". The note asks how $\text{ℂ}$ can be geometrically complete if the completeness axiom for $\mathbb{R}$ is based on order; answer: define an order-free axiom with Cauchy sequences (next week).

The dual completeness statement is written and proved twice:

$A \subseteq \mathbb{R},A \neq \varnothing,A\ \text{bounded below}\Rightarrow\exists\inf A \in \mathbb{R}.$

First let $L$ be the set of all lower bounds of $A$; completeness gives $\sup L \in \mathbb{R}$, and the goal is $\sup L = \inf A$. Second define $- A = \left\{ {- a:a \in A} \right\}$; then $- A \neq \varnothing$ and, since $A$ is bounded below, $- A$ is bounded above, and $\inf A = - \sup\left( {- A} \right)$.

The useful supremum fact is stated as

$l = \sup A\Rightarrow l\ \text{is a UB of}\ A\ \text{and}\ \left( {\forall\varepsilon > 0} \right)\left( {\exists a \in A} \right)\left( {l - \varepsilon < a \leq l} \right).$

The source's number-line schematic is equivalently rendered by

and its Chinese explanation is "只要下移一点点，就会超进去". It also records the "wrong" Newton/Leibniz definition $\varepsilon > 0$ is infinitesimal exactly when $\left( {\forall n \in \mathbb{N}} \right)\varepsilon \leq \frac{1}{n}$, then asks "这边 infinitesimal 吗?" The answer depends on the definition of $\mathbb{R}$; according to axioms 1--15, "NO!", and the present proof uses the Archimedean property of $\mathbb{R}$.

For every ordered field $F$, the page constructs its copies of $\mathbb{N},\mathbb{Z},\mathbb{Q}$: $1_{F}$, $2_{F} = 1_{F} + 1_{F}$, $3_{F} = 1_{F} + 1_{F} + 1_{F},\ldots$; then $0_{F} - 1_{F}, - 2_{F} = 0_{F} - 1_{F} - 1_{F},\ldots$; and finally $\left( \frac{p}{q} \right)_{F} = \frac{p_{F}}{q_{F}}$. The Archimedean properties are listed exactly as

$\forall x \in F,\exists n \in \mathbb{N}:x < n;$

$\forall x > 0 \in F,\exists n \in \mathbb{N}:\frac{1}{n} < x;$

$\forall x \in F,\exists n \in \mathbb{Z}:n - 1 \leq x < n;$

$\forall x,y > 0 \in F,\exists n \in \mathbb{N}:ny > x.$

### L03--Archimedean-property&Metric-Space, p. 2

The page observes that (4) implies (1) by taking $y = 1$, while (1) implies (4): given $x,y > 0$, choose $n > \frac{x}{y}$. It states density in the mixed wording "$\mathbb{Q}$ 在 $F$ 中稠密性：$\forall x < y \in F,\exists r \in \mathbb{Q}$ s.t. $x < r < y$". The complete working is

$x < y\Rightarrow y - x > 0;$ choose $n \in \mathbb{N}$ with $n\left( {y - x} \right) > 2$; by the integer property choose $m \in \mathbb{Z}$ with $nx < m < ny$; hence $x < \frac{m}{n} < y$.

The native number-line schematic on the sheet has the rational point between the endpoints:

The conclusion is "there are infinitely many rational pts between $x,y$"; also "$\mathbb{R} \smallsetminus \mathbb{Q}$ is also dense in $\mathbb{R}$ (hw)". It contrasts $\mathbb{R}$ and $\mathbb{Q}$ as Archimedean with non-Archimedean ordered fields, giving $\mathbb{R}(x)$ (all real functions) and $p$-adic fields $\mathbb{Q}_{p}$. The full proof of "$\mathbb{R}$ is an Archimedean ordered field" is: suppose $\exists x \in \mathbb{R}$ such that no $n \in \mathbb{N}$ has $x < n$. Then $x$ is a UB of $\mathbb{N}$, so $\sup\mathbb{N} \in \mathbb{R}$. Since $\sup\mathbb{N} - 1$ is not a UB, some $n \in \mathbb{N}$ satisfies $\sup\mathbb{N} - 1 < n$, hence $\sup\mathbb{N} < n + 1$, contradicting $n + 1 \in \mathbb{N}$. The source then says, "尽管 infinitesimal 在 real line 上不存在, there is a consistent and rigorous way to do calculus with infinitesimals (non-standard analysis)."

The absolute-value list is

$\left. - \middle| a \middle| \leq a \leq \middle| a \middle| ,\quad \middle| a \middle| = \sqrt{a^{2}},\quad \middle| ab \middle| = \middle| a\| b \middle| , \right.$

$\left. |a + b \middle| \leq \middle| a \middle| + \middle| b \middle| ,\quad \middle| a - b \middle| \geq \| a \middle| - \middle| b\|. \right.$

For the triangle inequality it writes

$\left. |a + b \middle| {}_{2} = \left( {a + b} \right)^{2} = a^{2} + 2ab + b^{2} \leq a^{2} + 2 \middle| a\| b \middle| + b^{2} = \left( |a \middle| + \middle| b| \right)^{2}, \right.$

then $\left. |a + b \middle| \leq \middle| a \middle| + \middle| b| \right.$. The extension is

$\left. \forall a_{1},\ldots,a_{n} \in \mathbb{R},\quad \middle| \sum_{i = 1}^{n}a_{i} \middle| \leq \sum_{i = 1}^{n} \middle| a_{i} \middle| . \right.$

A metric is a function $d:X \times X\rightarrow\mathbb{R}$ with (i) $d\left( {a,b} \right) \geq 0$ and $d\left( {a,b} \right) = 0\Rightarrow a = b$, (ii) $d\left( {a,b} \right) = d\left( {b,a} \right)$, and (iii) $d\left( {a,c} \right) \leq d\left( {a,b} \right) + d\left( {b,c} \right)$. If it satisfies the triangular property, $d$ is a metric and $X$ is a metric space; hence absolute value makes $\mathbb{R}$ a metric space.

### L03--Archimedean-property&Metric-Space, p. 3

For $k \in \mathbb{N}$, the source writes

$\mathbb{R}^{k} = \left\{ {\begin{pmatrix}
x
\end{pmatrix} = \left( {x_{1},x_{2},\ldots,x_{k}} \right):x_{i} \in \mathbb{R},1 \leq i \leq k} \right\},$

$\begin{pmatrix}
x
\end{pmatrix} \cdot \begin{pmatrix}
y
\end{pmatrix} = \sum_{i = 1}^{k}x_{i}y_{i},\quad\left\| \begin{pmatrix}
x
\end{pmatrix} \right\| = \sqrt{\begin{pmatrix}
x
\end{pmatrix} \cdot \begin{pmatrix}
x
\end{pmatrix}},$

and $d\left( {\begin{pmatrix}
x
\end{pmatrix},\begin{pmatrix}
y
\end{pmatrix}} \right) = \left\| {\begin{pmatrix}
x
\end{pmatrix} - \begin{pmatrix}
y
\end{pmatrix}} \right\|$. The proofs of positivity and symmetry are explicitly $\sqrt{\sum_{i = 1}^{{k{({x_{i} - y_{i}})}}^{2}}} > 0$ if $\begin{pmatrix}
x
\end{pmatrix} \neq \begin{pmatrix}
y
\end{pmatrix}$ (and $= 0$ exactly when equal), and $\sqrt{\sum_{i = 1}^{{k{({x_{i} - y_{i}})}}^{2}}} = \sqrt{\sum_{i = 1}^{{k{({y_{i} - x_{i}})}}^{2}}}$.

For Cauchy--Schwarz, $\left( {\lambda\begin{pmatrix}
x
\end{pmatrix} - \begin{pmatrix}
y
\end{pmatrix}} \right)^{2} \geq 0$ gives

$\lambda^{2}\left\| \begin{pmatrix}
x
\end{pmatrix} \right\|^{2} - 2\lambda\begin{pmatrix}
x
\end{pmatrix} \cdot \begin{pmatrix}
y
\end{pmatrix} + \left\| \begin{pmatrix}
y
\end{pmatrix} \right\|^{2} \geq 0.$

Take $\lambda = \frac{\begin{pmatrix}
x
\end{pmatrix} \cdot \begin{pmatrix}
y
\end{pmatrix}}{\left\| \begin{pmatrix}
x
\end{pmatrix} \right\|^{2}}$ when $\begin{pmatrix}
x
\end{pmatrix} \neq 0$, giving

$\frac{\left( {\begin{pmatrix}
x
\end{pmatrix} \cdot \begin{pmatrix}
y
\end{pmatrix}} \right)^{2}}{\left\| \begin{pmatrix}
x
\end{pmatrix} \right\|^{2}} \leq \left\| \begin{pmatrix}
y
\end{pmatrix} \right\|^{2},$

hence $\left\| \begin{pmatrix}
x
\end{pmatrix} \right\|\left\| \begin{pmatrix}
y
\end{pmatrix} \right\| \geq \begin{pmatrix}
x
\end{pmatrix} \cdot \begin{pmatrix}
y
\end{pmatrix}$. For the triangle inequality, let $\begin{pmatrix}
a
\end{pmatrix} = \begin{pmatrix}
x
\end{pmatrix} - \begin{pmatrix}
y
\end{pmatrix}$, $\begin{pmatrix}
b
\end{pmatrix} = \begin{pmatrix}
x
\end{pmatrix} - \begin{pmatrix}
z
\end{pmatrix}$, $\begin{pmatrix}
c
\end{pmatrix} = \begin{pmatrix}
z
\end{pmatrix} - \begin{pmatrix}
y
\end{pmatrix}$, so $\begin{pmatrix}
a
\end{pmatrix} = \begin{pmatrix}
b
\end{pmatrix} + \begin{pmatrix}
c
\end{pmatrix}$; then

$\left( {\left\| \begin{pmatrix}
b
\end{pmatrix} \right\| + \left\| \begin{pmatrix}
c
\end{pmatrix} \right\|} \right)^{2} = \left\| \begin{pmatrix}
b
\end{pmatrix} \right\|^{2} + 2\left\| \begin{pmatrix}
b
\end{pmatrix} \right\|\left\| \begin{pmatrix}
c
\end{pmatrix} \right\| + \left\| \begin{pmatrix}
c
\end{pmatrix} \right\|^{2}$

$\geq \left\| \begin{pmatrix}
b
\end{pmatrix} \right\|^{2} + 2\begin{pmatrix}
b
\end{pmatrix} \cdot \begin{pmatrix}
c
\end{pmatrix} + \left\| \begin{pmatrix}
c
\end{pmatrix} \right\|^{2} = \left\| {\begin{pmatrix}
b
\end{pmatrix} + \begin{pmatrix}
c
\end{pmatrix}} \right\|^{2} = \left\| {\begin{pmatrix}
x
\end{pmatrix} - \begin{pmatrix}
y
\end{pmatrix}} \right\|^{2}.$

### L04(1)--Function&Countability, pp. 1--3

The review uses the two native interval relationships

$\left\lbrack {a,b} \right\rbrack = \bigcap_{n \in \ \mathbb{N}}\left( {a - \frac{1}{n},b + \frac{1}{n}} \right),\quad\left( {a,b} \right) = \bigcup_{n \in \ \mathbb{N}}\left\lbrack {a + \frac{1}{n},b - \frac{1}{n}} \right\rbrack$

and the Archimedean test: in any ordered field, $\left( \forall\varepsilon > 0, \middle| a - b \middle| < \varepsilon \right)\Rightarrow a = b$; in an Archimedean ordered field it suffices that $\left( \forall n \in \mathbb{N}, \middle| a - b \middle| < \frac{1}{n} \right)\Rightarrow a = b$. It then lists $\inf A \leq \sup A$, $\inf\left( {A \cup B} \right) = \min\left( {\inf A,\inf B} \right)$, $\sup\left( {A \cup B} \right) = \max\left( {\sup A,\sup B} \right)$, $\sup\left( {cA} \right) = c\sup A$ for $c > 0$, $\sup\left( {- A} \right) = - \inf A$, $\sup\left( {A + B} \right) = \sup A + \sup B$, and $\sup\left( {AB} \right) \neq \sup(A)\sup(B)$.

The "blobs and arrows" function diagram is rebuilt natively:

Its exact definition is $f:X\rightarrow Y$, $f \subseteq X \times Y$, and $\left( {\forall x \in X} \right)\left( {\exists!y \in Y} \right)$ such that $\left( {x,y} \right) \in f$; it calls $X = \text{dom}(f)$, $Y = \text{cod}(f)$, and $\operatorname{im}(f) = \text{ran}(f) = \left\{ {f(x):x \in X} \right\} \subseteq \text{cod}(f)$. It gives $f\lbrack A\rbrack = \left\{ {f(x) \in \text{cod}(f):x \in A} \right\}$ and $f^{- 1}\lbrack B\rbrack = \left\{ {x \in \text{dom}(f):f(x) \in B} \right\}$. The explicit examples are the squaring function, reciprocal function $\mathbb{R} \smallsetminus \left\{ 0 \right\}\rightarrow\mathbb{R} \smallsetminus \left\{ 0 \right\}$, supremum function $\mathcal{P}\left( \mathbb{R} \right)\rightarrow\mathbb{R} \cup \left\{ {+ \infty, - \infty} \right\}$, harmonic function $\mathbb{N}\rightarrow\mathbb{R}$, $h(n) = \frac{1}{n}$, and Dirichlet's function $D(x) = 0$ for $x \in \mathbb{R} \smallsetminus \mathbb{Q}$, $D(x) = 1$ for $x \in \mathbb{Q}$.

Its two-level function sketch is retained natively:

For cardinality, "finite" means $\exists n \in \mathbb{N}$ such that $X$ has $n$ elements, denoted $\left. |X \middle| = n \right.$; "infinite" means an injection $\mathbb{N}\rightarrow X$. $X \leq Y$ means an injection and $X \approx Y$ a bijection. The homework remark is $X \leq Y$ iff there is an injection $X\rightarrow Y$, not merely a surjection $Y\rightarrow X$. The $\mathbb{N} \approx \mathbb{Z}$ bijection is $f(n) = \frac{n - 1}{2}$ for odd $n$ and $f(n) = \frac{n}{2}$ for even $n$, with table $1\mapsto 0$, $2\mapsto 1$, $3\mapsto - 1$, $4\mapsto 2$, $5\mapsto - 2$, $6\mapsto 3$, dots. "Countably infinite" means $X \approx \mathbb{N}$; "countable" means $X \leq \mathbb{N}$, equivalently a surjection $\mathbb{N}\rightarrow X$.

The lattice diagram for $\mathbb{Q}$ is retained natively. View $\frac{m}{n}$ as $\left( {m,n} \right) \in \mathbb{Z} \times \mathbb{Z}$, $n \neq 0$, and enumerate the lattice by increasingly large finite squares, omitting repetitions; this yields a surjection $\mathbb{N}\rightarrow\mathbb{Q}$. Cantor's proof writes any proposed $f:\mathbb{N}\rightarrow\left\lbrack {0,1} \right\rbrack$ as $f(n) = 0.n_{1}n_{2}n_{3}\ldots$, chooses $x = 0.d_{1}d_{2}d_{3}\ldots$ with $d_{n} \neq n$th digit of $f(n)$, and concludes $x \neq f(n)$ for every $n$, so $\left\lbrack {0,1} \right\rbrack$ and $\mathbb{R}$ are uncountable.

The power-set proof defines, for $f:X\rightarrow\mathcal{P}(X)$,

$D = \left\{ {x \in X:x \notin f(x)} \right\} \in \mathcal{P}(X).$

If $D = f\left( x_{0} \right)$, then $x_{0} \in D$ iff $x_{0} \notin D$, a contradiction. The page then asks whether there are cardinalities larger than $\mathbb{R}$ and answers $\text{ℂ} \approx \mathbb{R}^{2}$ (though $\text{ℂ} \neq \mathbb{R}$); whether there are cardinalities strictly between $\mathbb{N}$ and $\mathbb{R}$ remains unknown, and the assertion that there are none is the continuum hypothesis. The final theorem says finite products of countable sets are countable and, for countable $I$, a family $\left\{ {A_{i}:i \in I} \right\}$ of countable sets has countable union; the final application is that $\left( {a,b} \right)$ has uncountably many irrationals and $\bar{\mathbb{Q}}$ is countable, hence there are uncountably many transcendental numbers.

### L04(2)--Handout--Function, pp. 1--4

"More Joy of Sets" says it continues the basic-set-theory summary from "The Joy of Sets", with special emphasis on FUNCTIONS. It explains that a function from $X$ to $Y$ assigns each $x \in X$ a unique $y \in Y$; $f:X\rightarrow Y$ is read "$f$ maps $X$ to $Y$". Map/mapping are synonyms for function; $X$ is domain/source and $Y$ codomain/target space. The pointwise arrow is $x\mapsto f(x)$; a rule's input variable is independent and output variable dependent. A footnote says $(x)f$ might have been better notation for a left-to-right reader, but mathematical convention writes $f(x)$.

The image is $\operatorname{im}(f) = \left\{ {f(x):x \in X} \right\}$; for subsets, $f\lbrack A\rbrack = \left\{ {f(a) \in Y:a \in A} \right\}$ and $f^{- 1}\lbrack B\rbrack = \left\{ {x \in X:f(x) \in B} \right\}$. The complete displayed list is

$f\left\lbrack {f^{- 1}\lbrack C\rbrack} \right\rbrack \subseteq C;\quad f^{- 1}\left\lbrack {f\lbrack A\rbrack} \right\rbrack \supseteq A;$

$f\left\lbrack {A \cup B} \right\rbrack = f\lbrack A\rbrack \cup f\lbrack B\rbrack;\quad f\left\lbrack {A \cap B} \right\rbrack \subseteq f\lbrack A\rbrack \cap f\lbrack B\rbrack;$

$f\left\lbrack {A \smallsetminus B} \right\rbrack \supseteq f\lbrack A\rbrack \smallsetminus f\lbrack B\rbrack;$

$f^{- 1}\left\lbrack {C \cup D} \right\rbrack = f^{- 1}\lbrack C\rbrack \cup f^{- 1}\lbrack D\rbrack;$

$f^{- 1}\left\lbrack {C \cap D} \right\rbrack = f^{- 1}\lbrack C\rbrack \cap f^{- 1}\lbrack D\rbrack;\quad f^{- 1}\left\lbrack {C \smallsetminus D} \right\rbrack = f^{- 1}\lbrack C\rbrack \smallsetminus f^{- 1}\lbrack D\rbrack.$

The identity example is $\operatorname{id}_{X}:X\rightarrow X$, $\operatorname{id}_{X{(x)}} = x$. It gives the power-set example $\mathcal{P}:V\rightarrow V$, $\mathcal{P}(X) = \left\{ {Y:Y \subseteq X} \right\}$, then composition: if $f:X\rightarrow Y$, $g:Y\rightarrow Z$, $\left( {g \circ f} \right)(x) = g\left( {f(x)} \right)$, and $h\mathring{g\circ f} = \left( {h \circ g} \right) \circ f$. Composition is read backwards: "$g \circ f$ means first apply $f$, then apply $g$".

An inverse $g:Y\rightarrow X$ satisfies $g \circ f = \operatorname{id}_{X}$ and $f \circ g = \operatorname{id}_{Y}$; if it exists it is unique and is denoted $f^{- 1}$. Definitions are injective ($x \neq x'$ implies $f(x) \neq f\left( x' \right)$), surjective ($\left( {\forall y \in Y} \right)\left( {\exists x \in X} \right)y = f(x)$), and bijective (both); the theorem is "for any function $f$, $f$ is invertible iff $f$ is bijective". The sheet adds: equal functions require the same domain and codomain; $f$ restricted to $A \subseteq X$ is $g:A\rightarrow Y$, $g(x) = f(x)$, written $\left. f \middle| A \right.$ or $\text{res}_{A}f$; a function $X\rightarrow\operatorname{im}(f)$ with the same rule is surjective. For real graphs, injective means every horizontal line meets at most once; surjective means every horizontal line meets at least once. The squaring function example and its $\left\lbrack {0,\infty} \right)$ restriction have the same statements as above.

A list is a finite ordered set: $\left( {N,A,S,A} \right) \neq \left( {N,A,S} \right)$ and $\left( {N,A,S} \right) \neq \left( {N,S,A} \right)$; order and repetition matter. A list of length $n$ is $L = \left( {x_{1},\ldots,x_{n}} \right) = \left( {x_{k}:1 \leq k \leq n} \right)$; equal lists have the same length and entries in the same order. A sequence is an infinite ordered set ordered like $\mathbb{N}$. Cartesian products are

$X \times Y = \left\{ {\left( {x,y} \right):x \in X\ \text{and}\ y \in Y} \right\},$

$X_{1} \times \ldots \times X_{n} = \left\{ {\left( {x_{1},\ldots,x_{n}} \right):x_{k} \in X_{k}\ \text{for each}1 \leq k \leq n} \right\},$

with $\mathbb{R}^{2} = \mathbb{R} \times \mathbb{R} = \left\{ {\left( {a,b} \right):a,b \in \mathbb{R}} \right\}$ and generally $\mathbb{R}^{n}$ the set of $n$-tuples. It gives $\text{graph}\left( \exp \right) = \left\{ {\left( {x,y} \right) \in \mathbb{R}^{2}:e^{x} = y} \right\}$ and the familiar increasing exponential sketch through $\left( {0,1} \right)$; generally $\text{graph}(f) = \left\{ {\left( {x,y} \right) \in X \times Y:f(x) = y} \right\}$. The rigorous definition is then repeated: a function is its graph, and $\left( {x,y} \right) = \left\{ {\left\{ x \right\},\left\{ {x,y} \right\}} \right\}$; this has $\left( {a,b} \right) = \left( {c,d} \right)\Rightarrow a = c$ and $b = d$.

### L04(3)--Handout--Countability, pp. 1--2

The Cantor--Schröder--Bernstein proof is reproduced in full. Given injective $f:X\rightarrow Y$ and $g:Y\rightarrow X$, define $\varphi:\mathcal{P}(X)\rightarrow\mathcal{P}(X)$ by

$\varphi(A) = X \smallsetminus \left( {g\left\lbrack {Y \smallsetminus f\lbrack A\rbrack} \right\rbrack} \right).$

Put $A_{0} = \varnothing$, $A_{n + 1} = \varphi\left( A_{n} \right)$, and $A = \bigcup_{n}A_{n}$. Define

$h(x) = f(x)$ for $x \in A$, while $h(x) = g^{- 1}(x)$ for $x \in X \smallsetminus A$.

Using De Morgan and preservation of unions/intersections by forward images of injective functions,

$\varphi(A) = X \smallsetminus g\left\lbrack {Y \smallsetminus f\left\lbrack {\bigcup_{n}A_{n}} \right\rbrack} \right\rbrack$

$= X \smallsetminus g\lbrack\bigcap_{n{({Y \smallsetminus f{\lbrack A_{n}\rbrack}})}} = \bigcup_{n{({X \smallsetminus g{\lbrack{Y \smallsetminus f{\lbrack A_{n}\rbrack}}\rbrack}})}}$

$= \bigcup_{n}\varphi\left( A_{n} \right) = \bigcup_{n}A_{n + 1} = A.$

Thus $X \smallsetminus A = g\left\lbrack {Y \smallsetminus f\lbrack A\rbrack} \right\rbrack$, which makes $h$ bijective.

For countable products, injections $f_{i}:A_{i}\rightarrow\mathbb{N}$ produce

$f\left( {a_{1},\ldots,a_{n}} \right) = \prod_{i = 1}^{n}p_{i}^{f_{i{(a_{i})}}},$

where $p_{i}$ is the $i$th prime; FTA makes it injective. For countable unions, take a surjection $f:\mathbb{N}\rightarrow I$, for each $n$ a surjection $f_{n}:\mathbb{N}\rightarrow A_{f{(n)}}$, and a surjection $h:\mathbb{N}\rightarrow\mathbb{N} \times \mathbb{N}$, $h(n) = \left( {n_{1},n_{2}} \right)$. Then $g(n) = f_{n_{1}}\left( n_{2} \right)$ is surjective onto $\bigcup_{i \in I}A_{i}$.

# Sequences and metric topology

## Sequences and elementary limits

> **Definition: Sequence**
>
> 一个 sequence 是一个 function，其 domain 为某个 $n_{0} \in \mathbb{Z}$ 的 $\left\{ {n \in \mathbb{Z}:n \geq n_{0}} \right\}$；其 values 称为 terms。For $s:\mathbb{N}\rightarrow\mathbb{R}$，write $s_{n}$、$\left( s_{n} \right)_{n \in \ \mathbb{N}}$，or $\left( s_{n} \right)_{1}^{\infty}$。

源页强调 order matters in seq.!!''。其 examples 是 constant sequence $\left( {0,0,0,\ldots} \right)$、harmonic sequence $\left( \frac{1}{n} \right)_{n \in \ \mathbb{N}}$、 $\left( 2^{- n} \right)_{n \in \ \mathbb{N} \cup {\{ 0\}}}$, the Fibonacci sequence $s_{1} = s_{2} = 1$, $s_{n + 2} = s_{n + 1} + s_{n}$, $\left( \left( {- 1} \right)^{n} \right)_{n \in \ \mathbb{N}}$, decimal approximations to $\pi$, and $\left( {1 + \frac{1}{n}} \right)^{n}$.

> **Definition: Convergence in $\mathbb{R}$**
>
> A sequence $\left( s_{n} \right)$ converges to $l \in \mathbb{R}$ if, for every $\varepsilon > 0$, there is $N \in \mathbb{N}$ such that $\left| {s_{n} - l} \right| < \varepsilon$ whenever $n \geq N$. Write $\lim_{n\rightarrow\infty}s_{n} = l$ or $s_{n}\rightarrow l$.

不存在 $l \in \mathbb{R}$ 使其 converges 的 sequence 称为 divergent。源页还定义：对每个 $M \in \mathbb{R}$ 都 eventually $s_{n} > M$ 时 $s_{n}\rightarrow + \infty$；$s_{n}\rightarrow - \infty$ 对偶。 其 examples 是：

- a constant sequence converges to its constant;
- $\frac{1}{n}\rightarrow 0$ by the Archimedean property;
- $2^{- n}\rightarrow 0$;
- Fibonacci terms diverge to $+ \infty$;
- $\left( {- 1} \right)^{n}$ does not converge;
- decimal approximations converge to $\pi$; and
- $\left( {1 + \frac{1}{n}} \right)^{n}\rightarrow e$ (the definition of $e$ appears later).

> **Theorem: Every real is a rational-sequence limit**
>
> For every $r \in \mathbb{R}$, there is a sequence $\left( q_{n} \right)$ in $\mathbb{Q}$ such that $q_{n}\rightarrow r$.

Use density to choose $q_{n} \in \mathbb{Q}$ with $r < q_{n} < r + \frac{1}{n}$.

> **Theorem: Uniqueness of limit**
>
> If $s_{n}\rightarrow l_{1}$ and $s_{n}\rightarrow l_{2}$, then $l_{1} = l_{2}$.

Given $\varepsilon > 0$, choose $N = \max\left( {N_{1},N_{2}} \right)$ so that both $\left| {s_{n} - l_{i}} \right| < \frac{\varepsilon}{2}$ after $N$. Then $\left| {l_{1} - l_{2}} \right| \leq \left| {l_{1} - s_{n}} \right| + \left| {s_{n} - l_{2}} \right| < \varepsilon$.

> **Theorem: Basic limits**
>
> For $p > 0$, $n^{p}\rightarrow + \infty$; for $p < 0$, $n^{p}\rightarrow 0$. If $r > 1$, then $r^{n}\rightarrow + \infty$; if $|r| < 1$, then $r^{n}\rightarrow 0$. Also $s_{n}\rightarrow 0$ if and only if $\left| s_{n} \right|\rightarrow 0$, and $s_{n}\rightarrow 1$ if and only if $\left| {s_{n} - 1} \right|\rightarrow 0$.

For $r = 1 + a > 1$, Bernoulli gives $r^{n} > 1 + na$; for $0 < r < 1$, write $r = \frac{1}{1 + a}$ and compare with $\frac{1}{1 + na}$. The handwritten note says that the $- 1 < r < 0$ case uses an earlier fact. The source also proves $c^{\frac{1}{n}}\rightarrow 1$ for $c > 0$ and $n^{\frac{1}{n}}\rightarrow 1$, citing Rudin 3.20 for the latter.

> **Theorem: Subsequences preserve convergence**
>
> $\left( s_{n} \right)$ converges to $l$ if and only if every subsequence converges to $l$. A tail $\left( s_{n + k} \right)_{n \in \ \mathbb{N}}$ has the same limit.

源页写道 convergent sequence 与其 tail 可以看成没有任何本质区别''。

The rendered page is blank except for its page frame; it contains no mathematical text to transcribe.

## Limit laws, boundedness, and $\frac{\operatorname{lim\, sup}}{\operatorname{lim\, inf}}$

> **Theorem: Limit laws**
>
> If $s_{n}\rightarrow s$ and $t_{n}\rightarrow t$, then
>
> - $s_{n} + t_{n}\rightarrow s + t$ (and likewise for subtraction);
> - $cs_{n}\rightarrow cs$ for every $c \in \mathbb{R}$;
> - $s_{n}t_{n}\rightarrow st$; and
> - if no $s_{n}$ is zero and $s \neq 0$, then $\frac{1}{s_{n}}\rightarrow\frac{1}{s}$.

对于 product，展开 $s_{n}t_{n} - st = \left( {s_{n} - s} \right)\left( {t_{n} - t} \right) + s\left( {t_{n} - t} \right) + t\left( {s_{n} - s} \right)$ and use $\sqrt{\varepsilon}$ bounds. For reciprocals, first use convergence to obtain $\left| s_{n} \right| \geq \frac{|s|}{2}$ eventually, then $\left| {\frac{1}{s_{n}} - \frac{1}{s}} \right| \leq 2\frac{\left| {s_{n} - s} \right|}{|s|^{2}}$. The source annotates these two preliminary bounds as "bound ①" and "bound ②".

Further laws recorded on the page are: convergent $\left( a_{n} \right)$ implies $\left( \left| a_{n} \right| \right)$ converges; for $k \in \mathbb{N}$, $\lim a_{n}^{k} = \left( {\lim a_{n}} \right)^{k}$; and for $k \in \mathbb{N}$, $\lim a_{n}^{\frac{1}{k}} = \left( {\lim a_{n}} \right)^{\frac{1}{k}}$ provided $a_{n} \geq 0$. It defines real exponentiation for $x > 0$ by $x^{r} = \sup\left\{ {y \in \mathbb{R}:y \geq 0\ \text{and}\ y^{n} \leq x^{m}} \right\}$ when $r = \frac{m}{n}$.

> **Theorem: Vector sequences**
>
> A sequence $\left( \begin{pmatrix}
> x
> \end{pmatrix}_{n} \right)$ in $\mathbb{R}^{k}$, with components $\begin{pmatrix}
> x
> \end{pmatrix}_{n} = \left( {a_{1,n},\ldots,a_{k,n}} \right)$, converges to $\begin{pmatrix}
> a
> \end{pmatrix} = \left( {a_{1},\ldots,a_{k}} \right)$ if and only if $a_{i,n}\rightarrow a_{i}$ for every $i$.

正向使用 $\left| {a_{i,n} - a_{i}} \right| \leq \left\| {\begin{pmatrix}
x
\end{pmatrix}_{n} - \begin{pmatrix}
a
\end{pmatrix}} \right\|$; for the reverse direction, make each coordinate error smaller than $\frac{\varepsilon}{\sqrt{k}}$. Vector sum, dot product, and scalar multiplication obey the same limit laws as real sequences.

> **Definition: Bounded function and bounded sequence**
>
> A function $f:X\rightarrow\mathbb{R}$ is bounded when its range is bounded. In particular a sequence is bounded if all of its terms lie between two real bounds.

> **Theorem: Convergent sequences are bounded**
>
> Every convergent sequence of real numbers is bounded.

若 $a_{n}\rightarrow l$，取一个 tail 使 $\left| {a_{n} - l} \right| < 1$，再分别 bound finitely many earlier terms。直接应用 limit laws 给出 rational function $\frac{a_{m}n^{m} + \ldots + a_{0}}{b_{k}n^{k} + \ldots + b_{0}}$: it is $\frac{a_{m}}{b_{k}}$ when $m = k$, it is either $+ \infty$ or $- \infty$ when $m > k$, with the sign determined by $\frac{a_{m}}{b_{k}}$.

> **Theorem: Limits involving $+ \infty$ and $- \infty$**
>
> If $a_{n}\rightarrow + \infty$ and $b_{n}\rightarrow l > 0$, then $a_{n}b_{n}\rightarrow + \infty$; for $l < 0$ the product tends to $- \infty$. The signs reverse when $a_{n}\rightarrow - \infty$. If $a_{n}$ tends to either infinite endpoint and $b_{n}$ converges, then $a_{n} + b_{n}$ has the same infinite limit.

The exercise records, for a positive real sequence: $a_{n}\rightarrow + \infty$ if and only if $\frac{1}{a_{n}}\rightarrow 0$; the negative version gives $a_{n}\rightarrow - \infty$ if and only if $\frac{1}{a_{n}}\rightarrow 0$.

> **Definition: Monotone sequence**
>
> $\left( a_{n} \right)$ is increasing if $a_{n} \leq a_{n + 1}$ for every $n$, decreasing if $a_{n} \geq a_{n + 1}$, and monotone if it is either.

> **Theorem: Monotone convergence theorem**
>
> Every bounded monotone real sequence converges. If $\left( a_{n} \right)$ is bounded and increasing, then $a_{n}\rightarrow\sup\left\{ {a_{n}:n \in \mathbb{N}} \right\}$; if decreasing, its limit is the corresponding infimum.

源页说明 increasing seq. 必定 bounded below；decreasing seq. 必定 bounded above''。证明令 $l = \sup\left\{ a_{n} \right\}$ and takes a term with $l - \varepsilon < a_{N} \leq a_{n} \leq l$.

> **Definition: $\operatorname{lim\, sup}$ and $\operatorname{lim\, inf}$**
>
> For a bounded sequence set $u_{n} = \sup\left\{ {a_{k}:k \geq n} \right\}$ and $v_{n} = \inf\left\{ {a_{k}:k \geq n} \right\}$. Then $\left( u_{n} \right)$ is decreasing and $\left( v_{n} \right)$ increasing, and
>
> $\operatorname{lim\, sup}a_{n} = \lim_{n\rightarrow\infty}u_{n}$, $\operatorname{lim\, inf}a_{n} = \lim_{n\rightarrow\infty}v_{n}$.

The notes display

$\inf\left\{ {a_{k}:k \in \mathbb{N}} \right\} \leq \operatorname{lim\, inf}a_{n} \leq \operatorname{lim\, sup}a_{n} \leq \sup\left\{ {a_{k}:k \in \mathbb{N}} \right\}$.

直观地，$\operatorname{lim\, sup}$ 是 the largest number that can get arbitrarily close to, for infinitely often''。$l$ 是 $\operatorname{lim\, sup}a_{n}$ 当且仅当对每个 $\varepsilon > 0$，有 infinitely many $n$ 使 $a_{n} > l - \varepsilon$，且只有 finitely many $n$ 使 $a_{n} > l + \varepsilon$。定义也经由 $+ \infty$ 和 $- \infty$ 延伸至 unbounded sequences。

> **Theorem: Convergence via upper and lower limits**
>
> If $a_{n}\rightarrow l$, then $\operatorname{lim\, inf}a_{n} = \operatorname{lim\, sup}a_{n} = l$. Conversely, if $\operatorname{lim\, inf}a_{n} = \operatorname{lim\, sup}a_{n} = l \in \mathbb{R}$, then $a_{n}\rightarrow l$.

Examples include ${\operatorname{lim\, inf}\left( {- 1} \right)}^{n} = - 1$, ${\operatorname{lim\, sup}\left( {- 1} \right)}^{n} = 1$, $\operatorname{lim\, inf}\left( {\left( {- 1} \right)^{n} + \frac{1}{n}} \right) = - 1$, and $\operatorname{lim\, sup}\left( {\sin n} \right) = 1$, $\operatorname{lim\, inf}\left( {\sin n} \right) = - 1$. If $a_{n} \leq b_{n}$ eventually, then $\operatorname{lim\, sup}a_{n} \leq \operatorname{lim\, sup}b_{n}$ and $\operatorname{lim\, inf}a_{n} \leq \operatorname{lim\, inf}b_{n}$. The page proves the squeeze theorem and the ratio-test corollary: for positive $a_{n}$, if $\lim\left( \frac{a_{n + 1}}{a_{n}} \right) = l < 1$, then $a_{n}\rightarrow 0$.

## Cauchy sequences, subsequences, and completeness

> **Definition: Cauchy sequence**
>
> A real sequence $\left( a_{n} \right)$ is Cauchy if for every $\varepsilon > 0$ there is $N \in \mathbb{N}$ such that $\left| {a_{m} - a_{n}} \right| < \varepsilon$ whenever $m,n \geq N$.

> **Theorem: Cauchy criterion in $\mathbb{R}$**
>
> A sequence in $\mathbb{R}$ converges if and only if it is Cauchy.

Every Cauchy sequence is bounded: use the Cauchy condition with $\varepsilon = 1$ for a tail and bound the finitely many initial terms. The converse first proves $\operatorname{lim\, inf}a_{n} = \operatorname{lim\, sup}a_{n}$ from pairwise closeness.

> **Definition: Complete metric space**
>
> A metric space $\left( {X,d} \right)$ is complete if every Cauchy sequence in $X$ converges to a point of $X$.

源页写 $\mathbb{R}$ 和 $\text{ℂ}$ complete，而 $\mathbb{Q}$ 不 complete。一个 example 定义 $s_{0} = a$、$s_{1} = b$，and $s_{n + 2} = \frac{s_{n} + s_{n + 1}}{2}$ for $a < b$; it has $\left| {s_{n + 2} - s_{n + 1}} \right| = \frac{b - a}{2^{n + 1}}$ and is Cauchy.

> **Definition: Contractive sequence**
>
> $\left( a_{n} \right)$ is contractive if some $c \in \left( {0,1} \right)$ satisfies $\left| {a_{n + 2} - a_{n + 1}} \right| \leq c\left| {a_{n + 1} - a_{n}} \right|$ for every $n$.

Every contractive real sequence is Cauchy, hence convergent. The source uses the geometric bound $\left| {s_{m} - s_{n}} \right| \leq \sum_{k = n}^{m - 1}\frac{b - a}{2^{k}} \leq \frac{b - a}{2^{n - 1}}$. It also solves $a_{1} = 1$, $a_{n + 1} = \sqrt{2 + a_{n}}$: a bounded increasing sequence converges to the positive root $2$. The decreasing sequence $\left( {1 + \frac{1}{n}} \right)^{n + 1}$ defines $e = \lim_{n\rightarrow\infty}\left( {1 + \frac{1}{n}} \right)^{n}$.

> **Definition: Subsequence and subsequential limit**
>
> If $s:\mathbb{N}\rightarrow\mathbb{R}$ and $g:\mathbb{N}\rightarrow\mathbb{N}$ is strictly increasing, then $s \circ g = \left( s_{n_{k}} \right)_{k \in \ \mathbb{N}}$, $n_{k} = g(k)$, is a subsequence. A subsequential limit is the limit of a subsequence.

对 $s_{n} = \left( {- 1} \right)^{n}$，even subsequence converges to $1$ 而 full sequence diverges。$\left( \frac{1}{n} \right)$ 的每个 subsequence 都 converges to $0$，且每个 tail 是一个 subsequence。

> **Theorem: Monotone subsequence theorem**
>
> Every real sequence has a monotone subsequence.

A term is dominant if it is at least every later term. If infinitely many dominant terms occur, they form a decreasing subsequence; otherwise, after the final dominant term one recursively chooses later, strictly larger terms to obtain an increasing subsequence.

> **Theorem: Bolzano--Weierstrass**
>
> Every bounded real sequence has a convergent subsequence.

Apply the monotone subsequence theorem and monotone convergence. For a bounded sequence $S$ of values, the set of subsequential limits is nonempty; if $\lim a_{n} = l$, it is $\left\{ l \right\}$; and $\operatorname{lim\, sup}a_{n} = \max S$, $\operatorname{lim\, inf}a_{n} = \min S$. The source adds that these claims extend to unbounded sequences using $+ \infty$ and $- \infty$.

## Topology in metric spaces

> **Definition: Open neighborhood, open/closed set**
>
> In $\left( {X,d} \right)$, the open neighborhood of $x_{0}$ of radius $\varepsilon$ is $V_{\varepsilon{(x_{0})}} = \left\{ {x \in X:d\left( {x,x_{0}} \right) < \varepsilon} \right\}$. A set $U \subseteq X$ is open if every $x \in U$ has an $\varepsilon > 0$ with $V_{\varepsilon{(x)}} \subseteq U$. A set $F \subseteq X$ is closed if $X \smallsetminus F$ is open.

The examples say $\varnothing$ and $X$ are both open and closed in $X$, while $\mathbb{R}$ is closed but not open in $\text{ℂ}$. Common metrics are $\left| {x - y} \right|$ on $\mathbb{R}$, Euclidean distance and taxi-cab distance on $\mathbb{R}^{n}$, and $d\left( {a + bi,c + di} \right) = \sqrt{\left( {a - c} \right)^{2} + \left( {b - d} \right)^{2}}$ on $\text{ℂ}$.

> **Definition: Interior, limit point, isolated point, closure**
>
> $p \in E \subseteq X$ is an interior point if some neighborhood of $p$ lies in $E$; $\text{int}(E)$ is the set of all such points.
>
> $p \in X$ is a limit point of $E$ if every neighborhood of $p$ contains a point of $E \smallsetminus \left\{ p \right\}$. An element of $E$ which is not a limit point is isolated. The closure is $\text{cl}(E) = E \cup E'$ where $E'$ is the set of limit points.

The Chinese note says interior membership is necessary but not sufficient for being an interior point; isolated points are not necessarily interior points. A set is open exactly when $\text{int}(U) = U$. A discrete set is $A = A \smallsetminus A'$; it has no limit points, only isolated points.

> **Theorem: Sequential and closure characterizations**
>
> $F \subseteq X$ is closed if and only if every convergent sequence in $F$ has its limit in $F$. Equivalently, $F$ contains all its limit points. Also $\text{cl}(E)$ is closed and is the smallest closed subset of $X$ containing $E$.

In $\mathbb{R}$, every open neighborhood is exactly an open interval, every nonempty open $U \subseteq \mathbb{R}$ contains $\left( {a,b} \right)$ around each of its points, closed intervals are closed, finite sets are closed, and every open set is a countable union of open intervals. The generalized Bolzano--Weierstrass theorem recorded here is: every bounded sequence in a complete metric space has a convergent subsequence. In particular $\mathbb{R}^{n}$ and $\text{ℂ}$ are complete, but $\mathbb{Q}$ is not.

## Page-complete lecture record

### L05--Seq&Limit, pp. 1--3

Besides the definitions above, the source writes the divergent negation $\left. \forall l \in \mathbb{R},\exists\varepsilon > 0,\forall N \in \mathbb{N},\exists n \geq N: \middle| s_{n} - l \middle| \geq \varepsilon \right.$, and $s_{n}\rightarrow + \infty$ as $\forall M \in \mathbb{R},\exists N \in \mathbb{N},n \geq N\Rightarrow s_{n} > M$ (dually for $- \infty$). It gives the decimal sequence $\left( {3,3.1,3.14,3.141,3.1415,\ldots} \right)$ for $\pi$, the Fibonacci recurrence $s_{1} = s_{2} = 1$, $s_{n + 2} = s_{n + 1} + s_{n}$, and the proof of uniqueness: for $N = \max\left( {N_{1},N_{2}} \right)$, $\left. |l_{1} - l_{2} \middle| \leq \middle| l_{1} - s_{n} \middle| + \middle| s_{n} - l_{2} \middle| < \varepsilon \right.$. For every $r \in \mathbb{R}$, choose $q_{n} \in \mathbb{Q}$ with $r < q_{n} < r + \frac{1}{n}$.

For $p > 0$, $N = M^{\frac{1}{p}} + 1$ proves $n^{p}\rightarrow + \infty$; for $p < 0$, $N = \left( \frac{1}{\varepsilon} \right)^{- \frac{1}{p}} + 1$ proves $n^{p}\rightarrow 0$. If $r = 1 + a > 1$, $\left( {1 + a} \right)^{n} \geq 1 + na$; if $0 < r < 1$, write $r = \frac{1}{1 + a}$ and use $0 < r^{n} \leq \frac{1}{1 + na} < \varepsilon$. The $- 1 < r < 0$ case is annotated as an earlier fact. For $c > 0$, $x_{n} = c^{\frac{1}{n}} - 1$ obeys $0 < x_{n} \leq \frac{c - 1}{n}$; for $n^{\frac{1}{n}} - 1 = x_{n}$, $n = \left( {1 + x_{n}} \right)^{n} \geq \left( \frac{n}{2} \right)x_{n}^{2}$, so $x_{n}\rightarrow 0$ (Rudin 3.20). L05 p. 3 is visually blank.

### L06--Limit--II, pp. 1--4

The worked epsilon proof is $\left. |\ \frac{3n + 1}{4n - 1} - \frac{3}{4}\  \middle| = \frac{7}{4\left( {4n - 1} \right)} < \varepsilon \right.$ once $n > \frac{7}{16\varepsilon} + \frac{1}{4}$. The product-law proof expands $s_{n}t_{n} - st = \left( {s_{n} - s} \right)\left( {t_{n} - t} \right) + s\left( {t_{n} - t} \right) + t\left( {s_{n} - s} \right)$; the reciprocal proof uses eventually $\left. |s_{n} \middle| > \middle| s\frac{|}{2} \right.$ and $\left. |\frac{1}{s_{n}} - \frac{1}{s} \middle| < 2 \middle| s_{n} - s\frac{|}{|}s|^{2} \right.$. The source additionally gives $\lim\left( a_{n}^{k} \right) = \left( {\lim a_{n}} \right)^{k}$, $\lim\left( a_{n}^{\frac{1}{k}} \right) = \left( {\lim a_{n}} \right)^{\frac{1}{k}}$ for nonnegative terms, and $x^{\frac{1}{n}} = \sup\left\{ {y \in \mathbb{R}:y \geq 0\ \text{and}\ y^{n} \leq x} \right\}$.

For vector sequences, coordinatewise convergence is equivalent to Euclidean convergence: $\left. |\alpha_{i,n} - \alpha_{i} \middle| \leq \left\| {\begin{pmatrix}
x
\end{pmatrix}_{n} - \begin{pmatrix}
x
\end{pmatrix}} \right\| \right.$ one way, and coordinate errors $< \frac{\varepsilon}{\sqrt{k}}$ the other. The rational function rule is $\frac{a_{m}}{b_{k}}$ for equal degrees, $0$ for numerator degree smaller, and signed infinity for larger degree. A convergent sequence's explicit bounds are $M_{1} = \min\left( {l - 1,\min\left\{ {a_{k}:k < N} \right\}} \right)$, $M_{2} = \max\left( {l + 1,\max\left\{ {a_{k}:k < N} \right\}} \right)$.

The infinity multiplication table has the usual signs $( + )( + ) = +$, $( + )( - ) = -$, $( - )( + ) = -$, $( - )( - ) = +$; if one sequence tends to either infinity and the other converges, their sum tends to that infinity. For positive $a_{n}$, $a_{n}\rightarrow + \infty$ exactly when $\frac{1}{a_{n}}\rightarrow 0$ (negative dual). The monotone proof is: bounded increasing $\left( a_{n} \right)$ has $l = \sup\left\{ a_{n} \right\}$ and $l - \varepsilon < a_{N} \leq a_{n} \leq l$ for $n \geq N$; the decreasing dual tends to infimum.

Put $u_{n} = \sup\left\{ {a_{k}:k \geq n} \right\}$, $l_{n} = \inf\left\{ {a_{k}:k \geq n} \right\}$; $\left( u_{n} \right)$ is decreasing, $\left( l_{n} \right)$ increasing, and limsup/liminf are their limits. The native tail schematic is

It gives the "infinitely often" limsup criterion and examples ${\operatorname{lim\, inf}\left( {- 1} \right)}^{n} = - 1$, ${\operatorname{lim\, sup}\left( {- 1} \right)}^{n} = 1$, $\operatorname{lim\, inf}\left( {\left( {- 1} \right)^{n} + \frac{1}{n}} \right) = - 1$, $\operatorname{lim\, sup}\left( {\left( {- 1} \right)^{n} + \frac{1}{n}} \right) = 1$, $\operatorname{lim\, inf}\left( {\sin n} \right) = - 1$, $\operatorname{lim\, sup}\left( {\sin n} \right) = 1$. It proves convergence iff limsup equals liminf, including the $+ \infty$ extension. The comparisons, squeeze theorem, and ratio corollary are all shown with their tail bounds: positive $a_{n}$ and $\lim\left( \frac{a_{n + 1}}{a_{n}} \right) < 1$ give $a_{n}\rightarrow 0$; homework records the $> 1$ divergence case.

### L07--Cauchy-seq, pp. 1--3

The source warns $a_{n}$ convergent implies $|a_{n} - a_{n + 1}\mapsto 0$, but not conversely. The Cauchy boundedness proof takes epsilon $1$ about $a_{N}$, then bounds the initial finite set. For the reverse Cauchy criterion, pairwise closeness gives

$a_{N} - \frac{\varepsilon}{2} \leq \inf\left\{ {a_{m}:m \geq N} \right\} \leq \operatorname{lim\, inf}a_{n} \leq \operatorname{lim\, sup}a_{n} \leq \sup\left\{ {a_{m}:m \geq N} \right\} \leq a_{N} + \frac{\varepsilon}{2},$

so upper and lower limits are equal. Complete metric space means every Cauchy sequence converges; the source explicitly gives the complex metric $d\left( {a + bi,c + di} \right) = \sqrt{\left( {a - c} \right)^{2} + \left( {b - d} \right)^{2}}$.

The averaging example is $s_{0} = a$, $s_{1} = b$, $s_{n + 2} = \frac{s_{n} + s_{n + 1}}{2}$, with $\left. |s_{n + 2} - s_{n + 1} \middle| = \frac{b - a}{2^{n + 1}} \right.$ and

$\left. |s_{m} - s_{n} \middle| \leq \sum_{k = m}^{n - 1}\frac{b - a}{2^{k}} \leq \frac{b - a}{2^{m - 1}}. \right.$

A contractive sequence has $\left. |a_{n + 2} - a_{n + 1} \middle| \leq c \middle| a_{n + 1} - a_{n}| \right.$, $0 < c < 1$, and is Cauchy (Rudin 3.8). $a_{1} = 1$, $a_{n + 1} = \sqrt{2 + a_{n}}$ is bounded increasing and limits to $2$. For the same averaging recursion with $0 < a < b$, the source derives $d_{n} = - \frac{d_{n - 1}}{2}$ and limit $2\frac{b}{3} + \frac{a}{3}$. It proves $\left( {1 + \frac{1}{n}} \right)^{n + 1}$ weakly decreasing and $> 1$, then defines $e = {\lim\left( {1 + \frac{1}{n}} \right)}^{n} = {\lim\left( {1 + \frac{1}{n}} \right)}^{n + 1}$.

### L08(1)--subseqs, pp. 1--2

A subsequence is $s \circ g$ for strictly increasing $g:\mathbb{N}\rightarrow\mathbb{N}$. Examples: $\left( {- 1} \right)^{n}$ has $g(n) = 2n$ and constant subsequence $1$; $\sin\left( {n\frac{\pi}{2}} \right)$ has subsequential limits $0,1, - 1$. The forward proof for subsequences uses $n_{k} \geq k$. A dominant term has $s_{n} \geq s_{m}$ for all later $m$; infinitely many dominant terms form a decreasing subsequence, otherwise the recursive choice of later larger terms gives a strictly increasing one. Thus BW holds. It names $\left( {\sin k} \right)$ as an example.

For bounded $\left( s_{n} \right)$, the set $S$ of subsequential limits is nonempty, $\lim s_{n} = l\Rightarrow S = \left\{ l \right\}$, $\operatorname{lim\, sup}s_{n} = \max S$, $\operatorname{lim\, inf}s_{n} = \min S$. The proof chooses $n_{k}$ with both $\left. |\sup\left\{ {s_{j}:j \geq n_{k}} \right\} - l \middle| < \frac{1}{k} \right.$ and $\left. |s_{n_{k}} - l \middle| < \frac{2}{k} \right.$, and rules out $M > l$ by a tail supremum. It explicitly extends this to unbounded sequences: $n^{{({- 1})}^{n}}$ has $S = \left\{ {0, + \infty} \right\}$, limsup $+ \infty$, liminf $0$.

### L08(2)--topology-in-metric-space, pp. 1--3

The source's visible native neighborhood pictures are the circle $V_{\varepsilon{(x_{0})}}$ in $\mathbb{R}^{2}$ and interval $\left( {x_{0} - \varepsilon,x_{0} + \varepsilon} \right)$ in $\mathbb{R}$. It defines $\text{int}(E) \subseteq E$, and says membership is necessary but not sufficient for being interior; isolated points need not be interior. It defines $E'$, $\text{cl}(E) = E \cup E'$, isolated $p \in E \smallsetminus E'$, and discrete $A = A \smallsetminus A'$.

The sequential closed-set proof is complete: if $F$ is closed, an open neighborhood of any $l \in X \smallsetminus F$ eventually contains any sequence tending to $l$, so it cannot lie in $F$. If not closed, choose $a_{n} \in \left( {x_{0} - \frac{1}{n},x_{0} + \frac{1}{n}} \right) \cap F$ for a point $x_{0} \in X \smallsetminus F$ whose every neighborhood meets $F$; then $a_{n}\rightarrow x_{0}$. It also proves a limit point has infinitely many nearby points by using the minimum positive distance to a hypothetical finite list. In $\mathbb{R}$, every open set is a countable union of open intervals. General convergence, boundedness by $\exists M > 0,\forall x,y,d\left( {x,y} \right) \leq M$, and generalized BW are stated; the page concludes $\mathbb{R}^{n},\text{ℂ}$ complete and $\mathbb{Q}$ not complete.

# Limits and continuity

## Limit points and limits of functions

> **Definition: Limit point, closure, isolated and discrete sets**
>
> Let $A \subseteq \mathbb{R}$ and $c \in \mathbb{R}$. Then $c$ is a limit point of $A$ if for every $\varepsilon > 0$ there exists $x \in A$ with $0 < \left| {x - c} \right| < \varepsilon$. Equivalently, every open neighborhood of $c$ meets $A \smallsetminus \left\{ c \right\}$.
>
> Write $A'$ for the set of limit points and $\text{cl}(A) = A \cup A'$ for the closure. A point of $A \smallsetminus A'$ is isolated; a set is discrete when $A = A \smallsetminus A'$.

中文批注说，在 topology 中也能给出这个定义，但"还是等价的". 每个 limit point 都是某个 subsequence 的 limit；若 $A = \left\{ {a_{n}:n \in \mathbb{N}} \right\}$，则其 limit points 来自 $\left( a_{n} \right)$ 的 subsequential limits，但 reverse inclusion 不必成立。Examples：

- $\mathbb{N}$ has no limit point in $\mathbb{R}$;
- every real number is a limit point of $\mathbb{Q}$;
- $\left( {\left\{ 0 \right\} \cup \left( {1,2} \right) \cup \left( {2,3} \right)} \right)' = \left\lbrack {1,3} \right\rbrack$.

源页写 $\text{cl}(A)$ 是 closed，并且是包含 $A$ 的 smallest closed set。

> **Definition: Limit of a function**
>
> Let $A \subseteq \mathbb{R}$, $f:A\rightarrow\mathbb{R}$, and let $c$ be a limit point of $A$. We say $\lim_{x\rightarrow c}f(x) = l$ if for every $\varepsilon > 0$ there is $\delta > 0$ such that $\left| {f(x) - l} \right| < \varepsilon$ whenever $x \in A$ and $0 < \left| {x - c} \right| < \delta$.

中文解释把它和 sequences 比较：$n\rightarrow\infty$ 控制 index，而这里 $x\rightarrow c$ 由 distance $\delta$ 控制。此 definition 不要求 $c \in A$，并且即使 $f(c)$ 有定义， 其 value 也不起作用。

> **Theorem: Sequential criterion for a function limit**
>
> $\lim_{x\rightarrow c}f(x) = l$ if and only if every sequence $\left( a_{n} \right)$ in $A \smallsetminus \left\{ c \right\}$ with $a_{n}\rightarrow c$ satisfies $f\left( a_{n} \right)\rightarrow l$.

The source uses its contrapositive to show that if some $\left( a_{n} \right)$ approaches $c$ but $f\left( a_{n} \right)$ does not approach $l$, then the limit is not $l$; if one approaching sequence has divergent values, or two have different image limits, the function limit does not exist.

> **Definition: Infinite and one-sided function limits**
>
> $\lim_{x\rightarrow c}f(x) = + \infty$ means that for every $M > 0$ there is $\delta > 0$ such that $f(x) > M$ whenever $x \in \text{dom}(f)$ and $0 < \left| {x - c} \right| < \delta$. Definitions at $+ \infty$ and $- \infty$ are analogous.
>
> If $c$ is a limit point of $\text{dom}(f) \cap \left( {c, + \infty} \right)$, then $\lim_{x\rightarrow c^{+}}f(x) = l$ means the same estimate with $0 < x - c < \delta$. The left-hand limit is defined dually.

源页说有五种 function limits：$c,c^{+},c^{-}, + \infty, - \infty$。其 examples 包括 $\lim_{x\rightarrow 0}\frac{|x|}{x}$ does not exist and $\lim_{x\rightarrow 0}\frac{1}{x}$ does not exist.

> **Theorem: Function-limit laws**
>
> If $\lim_{x\rightarrow c}f(x)$ and $\lim_{x\rightarrow c}g(x)$ exist, then for $k \in \mathbb{R}$:
>
> - $\lim_{x\rightarrow c}kf(x) = k\lim_{x\rightarrow c}f(x)$;
> - $\lim_{x\rightarrow c}\left( {f(x) + g(x)} \right) = \lim f + \lim g$;
> - $\lim_{x\rightarrow c}f(x)g(x) = \left( {\lim f} \right)\left( {\lim g} \right)$; and
> - $\lim_{x\rightarrow c}\frac{f(x)}{g(x)} = \frac{\lim f}{\lim g}$ when $\lim g(x) \neq 0$.

Function limits are unique. If $f(x) \leq g(x)$ in a deleted neighborhood of $c$ and both limits exist, then $\lim f \leq \lim g$. The squeeze theorem says that $f(x) \leq g(x) \leq h(x)$ there and $\lim f = \lim h = l$ imply $\lim g = l$. The examples are

$\lim_{x\rightarrow 0}\frac{\sin(x)}{x} = 1$,

$\lim_{x\rightarrow 0}x\sin\left( \frac{1}{x} \right) = 0$, and

$\lim_{x\rightarrow 0}\sin\left( \frac{1}{x} \right)$ does not exist.

The last page annotation explains that $\frac{x^{2}}{x - 2}$, and every rational function in particular, is continuous at every point of its domain.

## Alternative formulations and continuity

sequence test 再次强调：$a_{n}\rightarrow c$ 不表示 every sequence of domain points 都 tends to $c$；test limit 要取 $\text{dom}(f) \smallsetminus \left\{ c \right\}$ 中 approaching $c$ 的 sequences。源页也给出如下 open-neighborhood formulation。

> **Definition: Function limit in terms of open sets**
>
> Let $A \subseteq \mathbb{R}$, $f:A\rightarrow\mathbb{R}$, and $c,l \in \mathbb{R} \cup \left\{ {+ \infty, - \infty} \right\}$, with $c \in A'$. Then $\lim_{x\rightarrow c}f(x) = l$ if every open neighborhood $V$ of $l$ contains $f\left\lbrack {\left( {A \cap U} \right) \smallsetminus \left\{ c \right\}} \right\rbrack$ for some open neighborhood $U$ of $c$.

The source convention is that if $A$ is bounded above/below, then $+ \frac{\infty}{-}\infty \in A'$; open neighborhoods of $+ \infty$ are $\left( {a, + \infty} \right)$ and of $- \infty$ are $\left( {- \infty,a} \right)$.

> **Theorem: One-sided and ordinary limits**
>
> $\lim_{x\rightarrow c}f(x) = l$ if and only if both $\lim_{x\rightarrow c^{-}}f(x) = l$ and $\lim_{x\rightarrow c^{+}}f(x) = l$, provided $c$ is a limit point from both sides.

> **Theorem: Equivalent zero formulations**
>
> For a finite limit, the following are equivalent: $\lim_{x\rightarrow c}f(x) = l$, $\lim_{x\rightarrow c}\left( {f(x) - l} \right) = 0$, $\lim_{x\rightarrow c}\left| {f(x) - l} \right| = 0$, and $\lim_{x\rightarrow c}f(x) = l$ after replacing $f$ by $\left| {f - l} \right|$.

> **Definition: Continuity**
>
> Let $A \subseteq \mathbb{R}$, $f:A\rightarrow\mathbb{R}$, and $a \in A$. Then $f$ is continuous at $a$ if, for every $\varepsilon > 0$, there exists $\delta > 0$ such that $\left| {f(x) - f(a)} \right| < \varepsilon$ whenever $x \in \text{dom}(f)$ and $\left| {x - a} \right| < \delta$.

手写 distinction 很重要：limit at $c$ 需要 $c \in \left( {\text{dom}\ f} \right)'$，却不需要 $c \in \text{dom}\ f$；continuity at $a$ 需要 $a \in \text{dom}\ f$，却不需要 $a$ 是 limit point。 Accordingly, every function is continuous at an isolated point of its domain.

> **Theorem: Continuity criteria**
>
> For $a \in A$, the following are equivalent:
>
> - $f$ is continuous at $a$;
> - either $a$ is isolated in $A$, or $\lim_{x\rightarrow a}f(x) = f(a)$;
> - for every sequence $\left( a_{n} \right)$ in $A$ with $a_{n}\rightarrow a$, one has $f\left( a_{n} \right)\rightarrow f(a)$;
> - for every open neighborhood $V$ of $f(a)$, there is an open neighborhood $U$ of $a$ with $f\left\lbrack {A \cap U} \right\rbrack \subseteq V$.

The source lists rational functions (especially polynomials), power functions $x^{p}$ on $x > 0$, exponential functions, logarithms, trig/inverse trig functions, and $|x|$ as continuous on their natural domains.

> **Definition: Continuous on a set and topological continuity**
>
> $f$ is continuous on $B \subseteq \text{dom}(f)$ when it is continuous at every $b \in B$; it is a continuous function when this holds on all of $\text{dom}(f)$. More generally, $f:X\rightarrow Y$ between metric/topological spaces is continuous if $f^{- 1}\lbrack V\rbrack$ is open in $X$ for every open $V \subseteq Y$.

源页给出 $x^{2}$ 在 $2$ ctn 的 direct epsilon--delta proof，取 $\delta = \min\left( {1,\frac{\varepsilon}{5}} \right)$；在一般 $a$ 取 $\delta = \min\left( {1,\frac{\varepsilon}{2|a| + 1}} \right)$。 又用 $\left| {|x| - |a|} \right| \leq \left| {x - a} \right|$ 证明 $|x|$ everywhere ctn，旁注为： "here $\delta$ depend on $\varepsilon$ but not $a$".

It also notes that

$g(x) = \sin\left( \frac{1}{x} \right)$ for $x \neq 0$, while $g(0) = 0$

is continuous everywhere except at $0$, whereas

$h(x) = x\sin\left( \frac{1}{x} \right)$ for $x \neq 0$, while $h(0) = 0$

is continuous everywhere by squeeze. Dirichlet's function is discontinuous everywhere. Thomae's function

$T\left( \frac{m}{n} \right) = \frac{1}{n}$ for a rational $\frac{m}{n}$ in lowest terms, and $T(x) = 0$ for $x \in \mathbb{R} \smallsetminus \mathbb{Q}$

is continuous at every irrational and is a source of the questions "是否存在 $f:\mathbb{R}\rightarrow\mathbb{R}$ 使 $f$ ctn at $x$ iff $x \in \mathbb{Q}$?" and "is $T$ diffable anywhere?".

> **Definition: Discontinuities**
>
> $f$ is discontinuous at $a \in \text{dom}(f)$ if it is not continuous there. If both one-sided limits exist but differ, $f$ has a jump discontinuity; if $\lim_{x\rightarrow a}f(x)$ exists but differs from $f(a)$, it has a removable discontinuity; if a one-sided limit fails to exist by oscillation, it has an essential discontinuity; and if a one-sided limit is infinite, it has an infinite discontinuity.

The examples are $\frac{|x|}{x}$ for a jump, the function $1$ off $0$ and $0$ at $0$ for a removable discontinuity, $\sin\left( \frac{1}{x} \right)$ for essential/oscillating discontinuity, and $\frac{1}{x}$ (with a chosen value at $0$) for infinite discontinuity.

## Closure properties and uniform continuity

> **Theorem: Closure properties of continuous functions**
>
> If $f,g$ are continuous at $a$, then $f + g$, $f - g$, $fg$, $\frac{f}{g}$ where defined, and $cf$ for $c \in \mathbb{R}$ are continuous at $a$.

The domains recorded on the page are $A \cap B$ for $f + g$, $f - g$, and $fg$, and $\left\{ {x \in A \cap B:g(x) \neq 0} \right\}$ for $\frac{f}{g}$.

> **Theorem: Composition**
>
> If $f:A\rightarrow\mathbb{R}$ is continuous at $a$ and $g:B\rightarrow\mathbb{R}$ is continuous at $f(a) \in B$, then $g \circ f$ is continuous at $a$ and $\lim_{x\rightarrow a}g\left( {f(x)} \right) = g\left( {\lim_{x\rightarrow a}f(x)} \right)$.

源页明确说此 theorem 也有 variants，把 limit at $a$ 全部替换为 limit at $a^{+}$、$a^{-}$、$+ \infty$ 或 $- \infty$。Examples 是 $\lim_{x\rightarrow 0^{+}}\arctan\left( \frac{1}{x} \right) = \frac{\pi}{2}$ and $\lim_{\theta\rightarrow\frac{\pi}{2^{-}}}e^{- \tan\theta} = 0$.

Further source examples retain their proof choices:

- $x^{2}$ at $2$: $\left| {x^{2} - 4} \right| = \left| {x - 2} \right|\left| {x + 2} \right|$, choose $\delta = \min\left( {1,\frac{\varepsilon}{5}} \right)$;
- $|x|$: choose $\delta = \varepsilon$;
- $x^{2}$ at any $a$: choose $\delta = \min\left( {1,\frac{\varepsilon}{2|a| + 1}} \right)$;
- $x^{2}$ has a "longest $\delta$" at $a = 2$ of $\sqrt{4 + \varepsilon} - 2$;
- $x^{2}$ is uniformly continuous on $\left\lbrack {- c,c} \right\rbrack$ with $\delta = \frac{\varepsilon}{2c}$;
- $x\sin\left( \frac{1}{x} \right)$ with value $0$ at $0$ is continuous everywhere;
- $D$ is discontinuous everywhere; and
- $f(x) = x$ for $x \in \mathbb{Q}$, $f(x) = 0$ for $x \in \mathbb{R} \smallsetminus \mathbb{Q}$ is continuous at $0$ but discontinuous everywhere else.

> **Definition: Uniform continuity**
>
> Let $B \subseteq A \subseteq \mathbb{R}$ and $f:A\rightarrow\mathbb{R}$. Then $f$ is uniformly continuous on $B$ if, for every $\varepsilon > 0$, there is $\delta > 0$ such that for all $x,y \in B$, $\left| {x - y} \right| < \delta$ implies $\left| {f(x) - f(y)} \right| < \varepsilon$.

The source's quantifier comparison is retained: ordinary continuity has "for every point $a$" before the choice of $\delta$; uniform continuity chooses one $\delta$ for all points. 中文解释为：对任意 $\varepsilon$，总有一个距离 $\delta$ 使得在 $B$ 上距离足够近 的点，其 image 的距离也足够近；"uniformly ctn 的要求比 ctn 更严格".

> **Theorem: Basic uniform-continuity facts**
>
> Uniform continuity on $B$ implies continuity on $B$. A restriction of a uniformly continuous function is uniformly continuous.

The examples are $x\mapsto cx$ (choose $\delta = \frac{\varepsilon}{|c|}$), $x^{2}$ not uniformly continuous on $\mathbb{R}$ (take $\varepsilon = 1$ and a large $a = \frac{2}{\delta}$), and $x^{2}$ uniformly continuous on $\left\lbrack {- c,c} \right\rbrack$. The source observes that $\frac{1}{x}$ is uniformly continuous on $\left\lbrack {1,\infty} \right)$ but not on $\left( {0,1} \right\rbrack$ nor on $\left\lbrack {a,\infty} \right)$ for $a > 0$.

> **Theorem: Heine--Cantor**
>
> If $A \subseteq \mathbb{R}$ is closed and bounded (compact) and $f:A\rightarrow\mathbb{R}$ is continuous, then $f$ is uniformly continuous on $A$.

proof 假设 not uniformly continuous，固定 $\varepsilon > 0$，构造 $x_{n},y_{n} \in A$ 使 $\left| {x_{n} - y_{n}} \right| < \frac{1}{n}$ 但 $\left| {f\left( x_{n} \right) - f\left( y_{n} \right)} \right| \geq \varepsilon$。Bolzano--Weierstrass 给出 convergent subsequences $x_{n_{k}}\rightarrow l_{1}$、$y_{n_{k}}\rightarrow l_{2}$；distance condition 给出 $l_{1} = l_{2}$。closedness 保证 $l_{1} \in A$，continuity 使两条 image subsequences 都趋于 $f\left( l_{1} \right)$，矛盾。

The Chinese discussion explains why both hypotheses matter: $x^{2}$ on $\mathbb{R}$ is continuous and its domain closed but unbounded, so not uniformly continuous; $\sin\left( \frac{1}{x} \right)$ on $\left\lbrack {- 5,0} \right) \cup \left( {0,4} \right\rbrack$ is continuous on a bounded but nonclosed set and is not uniformly continuous. Positive examples are $\sqrt{x}$ on $\left\lbrack {0,1} \right\rbrack$, $\sin\left( \frac{1}{x} \right)$ on $\left\lbrack {a,b} \right\rbrack$ for $0 < a < b$, and $x\sin\left( \frac{1}{x} \right)$ with value $0$ at zero on $\left\lbrack {0,1} \right\rbrack$.

> **Theorem: Uniform continuity preserves Cauchy sequences**
>
> If $f:A\rightarrow\mathbb{R}$ is uniformly continuous and $\left( a_{n} \right)$ is Cauchy in $A$, then $\left( {f\left( a_{n} \right)} \right)$ is Cauchy.

The page's counterexample is $f(x) = \frac{1}{x}$ on $x > 0$: $\left( \frac{1}{n} \right)$ is Cauchy but $(n)$ is not, so $f$ is not uniformly continuous on any set containing $\left\{ {\frac{1}{n}:n \in \mathbb{N}} \right\}$.

> **Theorem: Extension criterion**
>
> Let $A \subseteq \mathbb{R}$ be bounded and $f:A\rightarrow\mathbb{R}$. Then $f$ is uniformly continuous if and only if there is a continuous $g:\text{cl}(A)\rightarrow\mathbb{R}$ whose restriction to $A$ equals $f$.

For the forward direction, if $a \in \text{cl}(A) \smallsetminus A$ and $a_{n} \in A$ tends to $a$, define $g(a) = \lim f\left( a_{n} \right)$; uniform continuity makes $\left( {f\left( a_{n} \right)} \right)$ Cauchy and the definition independent of the approximating sequence.

## Extreme and intermediate values

> **Theorem: Extreme Value Theorem**
>
> If nonempty $A \subseteq \mathbb{R}$ is closed and bounded and $f:A\rightarrow\mathbb{R}$ is continuous, then $f$ is bounded and there are $x_{0},y_{0} \in A$ such that $f\left( x_{0} \right) \leq f(x) \leq f\left( y_{0} \right)$ for every $x \in A$.

The proof sets $M = \sup\left\{ {f(x):x \in A} \right\}$. Choose $\left( x_{n} \right)$ in $A$ with $f\left( x_{n} \right)\rightarrow M$, take a convergent subsequence, use closedness to retain its limit $y_{0} \in A$, and use continuity to obtain $M = f\left( y_{0} \right)$. The notes summarize: "closed + bounded $A$ + ctn $f$，那么 extreme value 一定存在".

> **Theorem: Intermediate Value Theorem**
>
> If $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ is continuous and $l$ lies between $f(a)$ and $f(b)$, then some $c \in \left\lbrack {a,b} \right\rbrack$ satisfies $f(c) = l$.

Assume $f(a) < l < f(b)$ and set $S = \left\{ {x \in \left\lbrack {a,b} \right\rbrack:f(x) \leq l} \right\}$. Then $S$ is nonempty and bounded above; for $c = \sup S$, continuity and sequences approaching $c$ from both sides give $f(c) = l$. The source's Chinese explanation is that a continuous curve on an interval must "覆盖了 $\left\lbrack {f(a),f(b)} \right\rbrack$ 中的所有值".

The application is the fixed-point theorem: if $f:\left\lbrack {0,1} \right\rbrack\rightarrow\left\lbrack {0,1} \right\rbrack$ is continuous, then some $x_{0} \in \left\lbrack {0,1} \right\rbrack$ has $f\left( x_{0} \right) = x_{0}$. When the endpoint signs do not immediately give this, take $g(x) = x - f(x)$ and apply IVT.

> **Theorem: Continuous image of an interval**
>
> If $I \subseteq \mathbb{R}$ is an interval and $f:I\rightarrow\mathbb{R}$ is continuous, then $f\lbrack I\rbrack$ is an interval.

For $y_{1} < y_{2} \in f\lbrack I\rbrack$, choose preimages $x_{1},x_{2} \in I$ and apply IVT on the subinterval between them. If $I$ is a closed bounded interval, EVT gives $f\lbrack I\rbrack = \left\lbrack {m,M} \right\rbrack$, so the image is again a closed bounded interval.

## Page-complete proof and diagram ledger

### L09--Limit-of-Functions-I, pp. 1--3

The visible lecture framing is "Ch4 limit of functions", $A \subseteq \mathbb{R}$, $f:A\rightarrow\mathbb{R}$, with three equivalent styles: epsilon/delta, sequences, and open sets. A limit point is exactly $\left. \forall\varepsilon > 0,\exists x \in A:0 < \middle| x - c \middle| < \varepsilon \right.$, equivalently every open neighborhood meets $A \smallsetminus \left\{ c \right\}$. The sheet writes that a sequence's limit points are subsequential limits but the reverse can fail (constant-sequence example); it gives $\mathbb{N}$ no limit point, all reals as limit points of $\mathbb{Q}$, and $\left( {\left\{ 0 \right\} \cup \left( {1,2} \right) \cup \left( {2,3} \right)} \right)' = \left\lbrack {1,3} \right\rbrack$. It defines $\text{cl}(A) = A \cup A'$, isolated $a \in A \smallsetminus A'$, and discrete $A = A \smallsetminus A'$.

The three graph examples $x + 2$, $\frac{x^{2} - 4}{x - 2}$, and the latter assigned zero at $2$ have the same limit $4$ at $2$. The sequential proof forward combines $\left. |a_{n} - c \middle| < \delta \right.$ with the epsilon condition; backwards selects $a_{n} \in A$ with $\left. 0 < \middle| a_{n} - c \middle| < \frac{1}{n} \right.$ and $\left. |f\left( a_{n} \right) - l \middle| \geq \varepsilon \right.$. It explicitly records the diagnostics: one approaching sequence with images not tending to $l$ disproves $l$; divergent images prove DNE; two image limits that differ prove DNE.

The one-sided definition restricts $0 < x - c < \delta$, requiring $c$ a limit point from that side. The displayed examples are $|x\frac{|}{x}$ and $\frac{1}{x}$ DNE at zero. The sheet says there are five kinds of limits: $c,c^{+},c^{-}, + \infty, - \infty$. The limit laws include scalar, sum, product, quotient, order and squeeze. Its calculations are $\cos x \leq \sin\frac{x}{x} \leq 1$ near $0$, $\left. - \middle| x \middle| \leq x\sin\left( \frac{1}{x} \right) \leq \middle| x| \right.$, and $a_{n} = \frac{2}{n\pi}\rightarrow 0$ while $\sin\left( \frac{1}{a_{n}} \right)$ diverges.

### L10(1)--Limit-of-Functions-II, pp. 1--2

The sequence review graph distinguishes a sequence approaching $1$ with image limits $2$ and $0$ (so no limit) from a curve with a separately assigned isolated value at $1$ (nearby limit $2$). The open-neighborhood definition is

$\lim_{x\rightarrow c}f(x) = l\Rightarrow\forall\ \text{open nbh}\ V\ \text{of}l,\exists\ \text{open nbh}U\ \text{of}c:f\left\lbrack {\left( {A \cap U} \right) \smallsetminus \left\{ c \right\}} \right\rbrack \subseteq V.$

The convention gives $+ \infty, - \infty \in A'$ for bounded-above/below sets and neighborhoods $\left( {a, + \infty} \right)$, $\left( {- \infty,a} \right)$. The ordinary limit is equivalent to both matching one-sided limits; the proof takes $\delta = \min\left( {\delta_{1},\delta_{2}} \right)$. The finite zero forms are $\lim f = l$, $\lim\left( {f - l} \right) = 0$, and $\left. \lim \middle| f - l \middle| = 0 \right.$.

### L10(2)--Continuity-I, pp. 1--2

The source contrasts a limit at $c$ (requires $c \in \left( {\text{dom}\ f} \right)'$, not $c \in \text{dom}\ f$) with continuity at $a$ (requires $a \in \text{dom}\ f$, not a limit point). Thus every isolated domain point is continuous. Its four criteria are: continuity; isolated or limit $f(a)$; sequence criterion; and the open neighborhood inverse-image inclusion.

Visible epsilon proofs are $\left. |x^{2} - 4 \middle| \leq 5 \middle| x - 2| \right.$ with $\delta = \min\left( {1,\frac{\varepsilon}{5}} \right)$; $\left. |x^{2} - a^{2} \middle| \leq \middle| x - a \middle| \left( 2 \middle| a \middle| + 1 \right) \right.$ with $\delta = \min\left( {1,\frac{\varepsilon}{\left. 2 \middle| a \middle| + 1 \right.}} \right)$; and $\left. \| x \middle| - \middle| a\| \leq \middle| x - a| \right.$ with $\delta = \varepsilon$. It asks for the longest delta at $2$, recording $\sqrt{4 + \varepsilon} - 2$. The diagrams classify jump $|x\frac{|}{x}$, removable $1$ off zero and $0$ at zero, essential $\sin\left( \frac{1}{x} \right)$, and infinite $\frac{1}{x}$ with a zero value. It proves $x\sin\left( \frac{1}{x} \right)$ continuous at zero by $\left. - \middle| x \middle| \leq x\sin\left( \frac{1}{x} \right) \leq \middle| x| \right.$, says Dirichlet is discontinuous everywhere, and states the continuity properties of the rational/irrational indicator and Thomae's function exactly as in the source.

### L11(1)--Continuity-II, pp. 1--2

The closure-property domain ledger is: $\text{dom}\left( {f + g} \right) = \text{dom}\left( {f - g} \right) = \text{dom}\left( {fg} \right) = A \cap B$, $\text{dom}\left( \frac{f}{g} \right) = \left\{ {x \in A \cap B:g(x) \neq 0} \right\}$. The proof uses sequence continuity. For composition, $f:A\rightarrow\mathbb{R}$, $g:B\rightarrow\mathbb{R}$, $f(a) \in B$ gives $\lim_{x\rightarrow a}g\left( {f(x)} \right) = g\left( {\lim_{x\rightarrow a}f(x)} \right)$; the source's variants replace $a$ throughout by $a^{+},a^{-}, + \infty, - \infty$. Examples are $\lim_{x\rightarrow 0^{+}}\arctan\left( \frac{1}{x} \right) = \frac{\pi}{2}$ and $\lim_{\theta\rightarrow\frac{\pi}{2^{-}}}e^{- \tan\theta} = 0$. The topology proof uses $\left( {g \circ f} \right)^{- 1}\lbrack V\rbrack = f^{- 1}\left\lbrack {g^{- 1}\lbrack V\rbrack} \right\rbrack$.

### L11(2)--Uniform-Continuity, pp. 1--3

The quantifier contrast is $\forall a,\forall\varepsilon,\exists\delta$ for ordinary continuity versus $\forall\varepsilon,\exists\delta,\forall x,y$ for uniform continuity; the page states the latter delta does not depend on the position of $x,y$. Uniform continuity implies continuity and restrictions remain uniform. Examples: $cx$ uses $\delta = \frac{\varepsilon}{|}c|$; $x^{2}$ on $\mathbb{R}$ fails by taking epsilon $1$, $a = \frac{1}{\delta}$, and comparing $a,a + \frac{\delta}{2}$; $x^{2}$ on $\left\lbrack {- c,c} \right\rbrack$ uses $\delta = \frac{\varepsilon}{2c}$; $\frac{1}{x}$ is uniform on $\left\lbrack {1,\infty} \right)$ but not on $\left( {0,1} \right\rbrack$ or $\left\lbrack {a,\infty} \right)$ for $a > 0$.

Heine--Cantor's contradiction creates $\left. |x_{n} - y_{n} \middle| < \frac{1}{n} \right.$, $\left. |f\left( x_{n} \right) - f\left( y_{n} \right) \middle| \geq \varepsilon \right.$, takes convergent subsequences, uses equal limits from the distance condition, closedness to retain the limit in $A$, and continuity for the contradiction. It lists the source counterexamples $x^{2}$ on $\mathbb{R}$ and $\sin\left( \frac{1}{x} \right)$ on $\left\lbrack {- 5,0} \right) \cup \left( {0,4} \right\rbrack$, plus positive examples $\sqrt{x}$, $\sin\left( \frac{1}{x} \right)$ away from zero, and $x\sin\left( \frac{1}{x} \right)$ on $\left\lbrack {0,1} \right\rbrack$.

The Cauchy theorem follows by applying uniform delta to the Cauchy tail. For $\frac{1}{x}$, $\left( \frac{1}{n} \right)$ is Cauchy but $(n)$ is not, so no uniform continuity on a set containing $\left\{ {\frac{1}{n}:n \in \mathbb{N}} \right\}$. The extension theorem for bounded $A$ defines, for $a \in \text{cl}(A) \smallsetminus A$, $g(a) = \lim f\left( a_{n} \right)$ for any $a_{n} \in A$ tending to $a$; uniform continuity makes this well-defined. The reverse direction uses compact $\text{cl}(A)$ and Heine--Cantor.

### L12--EVT&IVT, pp. 1--2

EVT proves a maximum by $M = \sup\left\{ {f(x):x \in A} \right\}$, a sequence $f\left( x_{n} \right)\rightarrow M$, BW $x_{n_{k}}\rightarrow y_{0}$, closedness $y_{0} \in A$, and continuity $M = f\left( y_{0} \right)$; the minimum is dual. IVT takes $S = \left\{ {x \in \left\lbrack {a,b} \right\rbrack:f(x) \leq l} \right\}$, $c = \sup S$, $s_{n} \in S$ tending to $c$, and $t_{n} = \min\left( {c + \frac{1}{n},b} \right)$, then continuity yields $f(c) = l$. The fixed point proof uses $g(x) = x - f(x)$. For continuous $f:I\rightarrow\mathbb{R}$, $f\lbrack I\rbrack$ is an interval by applying IVT between preimages; for $\left\lbrack {a,b} \right\rbrack$, EVT plus IVT gives $\text{ran}(f) = \left\lbrack {m,M} \right\rbrack$.

# Differentiation

## Derivatives and rules (L13)

> **Definition: Derivative**
>
> Let $A \subset \mathbb{R}$, $f:A\rightarrow\mathbb{R}$, and $a \in A \cap A'$ (此处 $a$ 是 accumulation point，所以 $a$ lies in the domain of $f'$). Define the derivative of $f$ at $a$ by
>
> $$
> f^{'{(a)}} = \lim\limits_{h\rightarrow 0}\frac{f\left( {a + h} \right) - f(a)}{h}.
> $$
>
> If $x = a + h$, then $h = x - a$, hence equivalently
>
> $$
> f^{'{(a)}} = \lim\limits_{x\rightarrow a}\frac{f(x) - f(a)}{x - a}.
> $$
>
> 如果 $f^{'{(a)}}$ exists，则称 $f$ is differentiable at $a$. 把 $a$ 作为 variable 时，我们把 derivative 看作 function：
>
> $$
> f^{'{(x)}} = \lim\limits_{h\rightarrow 0}\frac{f\left( {x + h} \right) - f(x)}{h},\quad\operatorname{dom}\left( f' \right) = \left\{ {x \in \operatorname{dom}(f):f\ \text{is differentiable at}\ x} \right\}.
> $$
>
> 如果 $B \subset \operatorname{dom}(f)$ 且 $\forall x \in B$ 都有 $f$ differentiable at $x$， 则称 $f$ is differentiable on $B$.

> **Remark: Geometrical meaning and linear approximation**
>
> 我们称 derivative 的 geometrical meaning 为：the slope of the line tangent to the graph of $y = f(x)$ at point $\left( {a,f(a)} \right)$. 我们称
>
> $$
> L(x) = f(a) + f^{'{(a)}}\left( {x - a} \right)
> $$
>
> 为 the linear approximation of $f$ near $x = a$.
>
> L13 p.1 的两幅草图可由下列关系读出：左图把 $a$ 处的 curve 与其 tangent line 放在同一坐标轴上；右图标为 ctn, 但不 diffble''。
>
>   ------------------- ------------------------------------------------------------------------
>   tangent at $a$      $y = L(x) = f(a) + f^{'{(a)}}\left( {x - a} \right)$ and $L(a) = f(a)$
>   ctn, 但不 diffble   left/right slopes do not agree, so $f^{'{(a)}}$ DNE
>   ------------------- ------------------------------------------------------------------------

> **Theorem: Differentiability implies continuity**
>
> If $f$ is differentiable at $a$, then $f$ is continuous at $a$.

> **Proof**
>
> Suppose $f^{'{(a)}}$ exists, so $a \in \operatorname{dom}\left( f' \right)$. Then
>
> $$
> \lim\limits_{x\rightarrow a}f(x) = \lim\limits_{x\rightarrow a}\left( {f(a) + \frac{f(x) - f(a)}{x - a}\left( {x - a} \right)} \right) = f(a) + f^{'{(a)}}0 = f(a).
> $$
>
> Since $a \in \operatorname{dom}\left( f' \right)$, $\lim_{x\rightarrow a}f(x) = f(a)$ implies continuity. 因而 differentiability $\Rightarrow$ continuity，但反之不成立（例如尖点图形）。

> **Theorem: Linearity of the derivative**
>
> Suppose $f,g$ are differentiable at $a$, and $c \in \mathbb{R}$. Then $cf$ and $f + g$ are differentiable at $a$, and
>
> $$
> \left( {cf} \right)^{'{(a)}} = cf^{'{(a)}},\quad\left( {f + g} \right)^{'{(a)}} = f^{'{(a)}} + g^{'{(a)}}.
> $$
>
> 即 $\frac{d}{dx}$ is a linear operator.

> **Proof**
>
> $$
> \left( {cf} \right)^{'{(a)}} = \lim\limits_{h\rightarrow 0}\frac{cf\left( {a + h} \right) - cf(a)}{h} = c\lim\limits_{h\rightarrow 0}\frac{f\left( {a + h} \right) - f(a)}{h} = cf^{'{(a)}},
> $$
>
> and the source continues the second calculation line by line:
>
> $$
> \left( {f + g} \right)^{'{(a)}} = \lim\limits_{h\rightarrow 0}\frac{\left( {f + g} \right)\left( {a + h} \right) - \left( {f + g} \right)(a)}{h}\backslash = \lim\limits_{h\rightarrow 0}\frac{f\left( {a + h} \right) - f(a)}{h} + \lim\limits_{h\rightarrow 0}\frac{g\left( {a + h} \right) - g(a)}{h}\backslash = f^{'{(a)}} + g^{'{(a)}}.
> $$

> **Theorem: Product rule**
>
> 若 $f,g$ 在 $a$ 处 diffble，则 $fg$ 在 $a$ 处 diffble，且
>
> $$
> \left( {fg} \right)^{'{(a)}} = f^{'{(a)}}g(a) + f(a)g^{'{(a)}}.
> $$

> **Proof**
>
> $$
> \begin{matrix}
> \left( {fg} \right)^{'{(a)}} & {= \lim\limits_{h\rightarrow 0}\frac{f\left( {a + h} \right)g\left( {a + h} \right) - f(a)g(a)}{h}} \\
>  & {= \lim\limits_{h\rightarrow 0}\frac{\left( {f\left( {a + h} \right) - f(a)} \right)g\left( {a + h} \right) + f(a)\left( {g\left( {a + h} \right) - g(a)} \right)}{h}} \\
>  & {= f^{'{(a)}}\lim\limits_{h\rightarrow 0}g\left( {a + h} \right) + \lim\limits_{h\rightarrow 0}f(a)g^{'{(a)}}} \\
>  & {= f^{'{(a)}}g(a) + f(a)g^{'{(a)}}.}
> \end{matrix}
> $$

> **Theorem: Quotient rule**
>
> 若 $f,g$ 在 $a$ 处 diffble 且 $g(a) \neq 0$，则 $\frac{f}{g}$ 在 $a$ 处 diffble，且
>
> $$
> \left( \frac{f}{g} \right)^{'{(a)}} = \frac{f^{'{(a)}}g(a) - f(a)g^{'{(a)}}}{\left( {g(a)} \right)^{2}}.
> $$

> **Proof**
>
> PF similar to product rule.

记号为 $f^{'{(x)}} = \frac{d}{dx}(f)$，且 $\left. f^{'{(a)}} = \frac{d}{dx} \middle| {}_{x = a}(f) \right.$; likewise $f''(x) = d^{2}\frac{y}{dx^{2}}$, $f''(a)$, $f^{(q)}(x)$, $\ldots$.

> **Example: Polynomials and standard derivatives**
>
> If $p(x) = \sum_{k = 0}^{n}a_{k}x^{k}$ is a polynomial, then
>
> $$
> p^{'{(x)}} = \sum\limits_{k = 1}^{n}ka_{k}x^{k - 1}.
> $$
>
> The proof is by induction on $n$; in particular
>
> $$
> \frac{d}{dx}\left( x^{n} \right) = \frac{d}{dx}\left( {xx^{n}} \right) = x^{n} + x \cdot nx^{n - 1} = \left( {n + 1} \right)x^{n}.
> $$
>
> The lecture records the facts
>
> $$
> \forall p \in \mathbb{R},\quad\frac{d}{dx}\left( x^{p} \right) = px^{p - 1},\quad\frac{d}{dx}\left( a^{x} \right) = \left( {\ln a} \right)a^{x},
> $$
>
> especially $\frac{d}{dx}\left( e^{x} \right) = e^{x}$, and
>
> $$
> \frac{d}{dx}\left( {\sin x} \right) = \cos x,\quad\frac{d}{dx}\left( {\cos x} \right) = - \sin x.
> $$
>
> L13 p.2 还逐项写了以下 derivative-law exercises：
>
> $$
> (1)\quad\frac{d}{dx}\sqrt{x} = \lim\limits_{h\rightarrow 0}\frac{\sqrt{x + h} - \sqrt{x}}{h} = \lim\limits_{h\rightarrow 0}\frac{1}{\sqrt{x + h} + \sqrt{x}} = \frac{1}{2\sqrt{x}};
> $$
> $$
> (2)\quad f(x) = |x|\ \text{is differentiable everywhere except at}x = 0;
> $$
> $$
> (3)\quad\frac{d}{dx}\left( {e^{3x}\sin\left( x^{2} \right)} \right) = 3e^{3x}\sin\left( x^{2} \right) + 2xe^{3x}\cos\left( x^{2} \right);
> $$
> $$
> (4)\quad\lim\limits_{x\rightarrow 4}\frac{x^{\frac{3}{2}} - \sqrt{x} - 6}{x - 4} = f^{'{(4)}} = \frac{11}{4},\quad f(x) = x^{\frac{3}{2}} - \sqrt{x}.
> $$

> **Theorem: Chain rule**
>
> 如果 $f$ 在 $a$ 处 differentiable 且 $g$ 在 $f(a)$ 处 differentiable， 则 $g ○ f$ 在 $a$ 处 differentiable，且
>
> $$
> \left( {g ○ f} \right)^{'{(a)}} = g^{'{({f{(a)}})}}f^{'{(a)}}.
> $$

> **Proof**
>
> 设 $g$ 的辅助函数为
>
> $$
> \varphi(u) = \left\{ \begin{matrix}
> \frac{g(u) - g\left( {f(a)} \right)}{u - f(a)} & {u \neq f(a)} \\
> g^{'{({f{(a)}})}} & {u = f(a)}
> \end{matrix} \right.
> $$
>
> Thus $\varphi(u)\left( {u - f(a)} \right) = g(u) - g\left( {f(a)} \right)$ for all $u$ in the domain of $g$, and $\varphi$ is continuous at $f(a)$. Hence
>
> $$
> \begin{matrix}
> {f^{'{(a)}}g^{'{({f{(a)}})}}} & {= \lim\limits_{x\rightarrow a}\frac{f(x) - f(a)}{x - a}\lim\limits_{x\rightarrow a}\varphi\left( {f(x)} \right)} \\
>  & {= \lim\limits_{x\rightarrow a}\frac{g\left( {f(x)} \right) - g\left( {f(a)} \right)}{x - a} = \left( {g ○ f} \right)^{'{(a)}}.}
> \end{matrix}
> $$
>
> 这个证明的核心在于构造一个函数 $\varphi$，用来模拟用 tangent line 逼近 $g\left( {f(a)} \right)$ 附近的行为，并通过 $g$ 的 differentiability 说明 $\varphi$ 在 $g\left( {f(a)} \right)$ 的 continuity，从而在 limit 中使用 expansion。

> **Example: Derivative need not be continuous**
>
> Let
>
> $$
> f(x) = \left\{ \begin{matrix}
> {x\sin\left( \frac{1}{x} \right)} & {x \neq 0} \\
> 0 & {x = 0}
> \end{matrix} \right.,\quad g(x) = \left\{ \begin{matrix}
> {x^{2}\sin\left( \frac{1}{x} \right)} & {x \neq 0} \\
> 0 & {x = 0}
> \end{matrix} \right..
> $$
>
> We know $f,g$ are continuous everywhere. For $x \neq 0$,
>
> $$
> f^{'{(x)}} = \sin\left( \frac{1}{x} \right) - \left( \frac{1}{x} \right)\cos\left( \frac{1}{x} \right),\quad g^{'{(x)}} = 2x\sin\left( \frac{1}{x} \right) - \cos\left( \frac{1}{x} \right).
> $$
>
> At $0$, $f^{'{(0)}} = \lim_{x\rightarrow 0}\sin\left( \frac{1}{x} \right)$ DNE, while $g^{'{(0)}} = 0$; but $\lim_{x\rightarrow 0}g^{'{(x)}}$ DNE. 因而 derivatives 不连续。

> **Definition: $C^{n}$**
>
> Given $n \in \mathbb{N}$, the function $f \in C^{n}$ ($n$-times continuously differentiable) on an open set $U \subset \mathbb{R}$ if $f^{(n)}$ exists and is continuous on $U$.

## Extrema, MVT, and Darboux (L14)

> **Definition: Local extrema**
>
> Let $A \subset \mathbb{R}$, $f:A\rightarrow\mathbb{R}$, and $c \in A$. If there is $\delta > 0$ such that $f(x) \leq f(c)$ for all $x \in V_{\delta{(c)}} \cap \operatorname{dom}(f)$, then $c$ is a local maximum point of $f$, and $f(c)$ is a local maximum value of $f$. Dually define local minimum point/value; together these are local extreme point and local extrema.
>
> L14 p.1 的曲线标出了一个 local min、两个 local max（其中右侧极大值 高于左侧），以及随后的 local min；其可辨识信息是极值只比较 $c$ 的某个 neighborhood，而非整个 domain。用点位/不等式表表示为
>
>   ------------------------- ------------------------- -------------------------
>   left local min            interior local max        right local min
>   $f(c) \leq f(x)$ nearby   $f(c) \geq f(x)$ nearby   $f(c) \leq f(x)$ nearby
>   ------------------------- ------------------------- -------------------------
>
> .

> **Lemma: Key lemma**
>
> Let $A \subset \mathbb{R}$, $f:A\rightarrow\mathbb{R}$, $c \in A \cap A'$, and suppose $f$ is differentiable at $c$.
>
> \(i\) If $f^{'{(c)}} > 0$, then there is $\delta > 0$ such that, for all $x,y \in V_{\delta{(c)}} \cap A$, $x < c < y$ implies $f(x) < f(c) < f(y)$.
>
> \(ii\) Dually, if $f^{'{(c)}} < 0$, then there is $\delta > 0$ such that $x < c < y$ implies $f(x) > f(c) > f(y)$.

> **Proof**
>
> For (i), let $\varepsilon = \frac{f^{'{(c)}}}{2}$. Fix $\delta > 0$ such that
>
> $$
> \left| {\frac{f(x) - f(c)}{x - c} - f^{'{(c)}}} \right| < \varepsilon
> $$
>
> whenever $0 < \left| {x - c} \right| < \delta$. Thus
>
> $$
> 0 < \frac{f^{'{(c)}}}{2} < \frac{f(x) - f(c)}{x - c} < 3\frac{f^{'{(c)}}}{2}.
> $$
>
> If $x < c < y$, division by $x - c < 0$ gives $f(x) < f(c)$, while division by $y - c > 0$ gives $f(c) < f(y)$. (ii) is dual. 这两条 lemma 的结论也说明： 如果 $f^{'{(c)}} \neq 0$，则 $f$ 在 $c$ 的某个 open neighborhood 中严格 monotone。

> **Corollary: Fermat's theorem**
>
> Suppose $f$ is defined on an open neighborhood of $c$. 如果 $c$ 是 $f$ 的 一个 local extreme point 且 $f^{'{(c)}}$ 存在，则 $f^{'{(c)}} = 0$.

> **Proof**
>
> Directly follows from the key lemma: if $f^{'{(c)}} > 0$ or $f^{'{(c)}} < 0$, then $c$ cannot be a local extreme point.

> **Corollary: Rolle's theorem**
>
> If $f$ is continuous on $\left\lbrack {a,b} \right\rbrack$, differentiable on $\left( {a,b} \right)$, and $f(a) = f(b)$, then there is some $c \in \left( {a,b} \right)$ such that $f^{'{(c)}} = 0$.

> **Proof**
>
> By EVT, choose $x_{0},y_{0} \in \left\lbrack {a,b} \right\rbrack$ such that $f\left( x_{0} \right) \leq f(x) \leq f\left( y_{0} \right)$ for all $x \in \left\lbrack {a,b} \right\rbrack$. If neither is an endpoint, Fermat gives the result. More explicitly as on L14 p.1: if $f\left( x_{0} \right) < f(a)$, then $x_{0}$ is an interior local minimum and $f^{'{(x_{0})}} = 0$; if $f\left( y_{0} \right) > f(a)$, then $y_{0}$ is an interior local maximum and $f^{'{(y_{0})}} = 0$. If neither strict inequality holds, then $f(x) = f(a)$ for every $x \in \left\lbrack {a,b} \right\rbrack$, so $f$ is constant and $f^{'{(c)}} = 0$ for every $c \in \left( {a,b} \right)$.

> **Corollary: Mean Value Theorem**
>
> If $f$ is continuous on $\left\lbrack {a,b} \right\rbrack$ and differentiable on $\left( {a,b} \right)$, then there is $c \in \left( {a,b} \right)$ such that
>
> $$
> f^{'{(c)}} = \frac{f(b) - f(a)}{b - a}.
> $$

> **Proof**
>
> Let $g(x) = f(x) - \left( \frac{f(b) - f(a)}{b - a} \right)\left( {x - a} \right)$. Then $g$ is continuous on $\left\lbrack {a,b} \right\rbrack$, differentiable on $\left( {a,b} \right)$, and $g(a) = g(b)$. Rolle's theorem gives $g^{'{(c)}} = 0$, which rearranges to the displayed equality.
>
> The L14 p.1 secant/tangent diagram records the same parallel-slope relation:
>
>   -------------- ----------------------------------- -----------------------------
>   $a$            $c \in \left( {a,b} \right)$        $b$
>   $f(a)$         $f^{'{(c)}}$ is the tangent slope   $f(b)$
>   secant slope   =$f^{'{(c)}}$                       $\frac{f(b) - f(a)}{b - a}$
>   -------------- ----------------------------------- -----------------------------

> **Corollary: Zero derivative and monotonicity**
>
> 若 $f$ 在 $\left( {a,b} \right)$ 上 diffble 且每个 $x \in \left( {a,b} \right)$ 都有 $f^{'{(x)}} = 0$，则 $f$ 在 $\left( {a,b} \right)$ 上 constant。于是若 $f' = g'$ on $\left( {a,b} \right)$，则该处 $f = g + C$。interval $I$ 上的 function 在 $x < y$ 推出 $f(x) \leq f(y)$ 时称 increasing；$f(x) < f(y)$ 时称 strictly increasing；decreasing 对偶定义。 Weakly increasing or decreasing on $I$'' 与 monotone on $I$ 同义。

> **Proof**
>
> If $f$ were not constant, there would be $x \neq y$ with $f(x) \neq f(y)$; MVT would give $\frac{f(x) - f(y)}{x - y} \neq 0$, a contradiction. Apply this to $f - g$ for the second assertion.

> **Corollary: Increasing/decreasing test**
>
> If $f$ is differentiable on $\left( {a,b} \right)$, then $f^{'{(x)}} \geq 0$ for every $x \in \left( {a,b} \right)$ implies $f$ is increasing on $\left( {a,b} \right)$. If $f^{'{(x)}} > 0$ for all $x$, then $f$ is strictly increasing. Both statements have decreasing duals.
>
> Note: (i) is a weak statement, but (ii) has a strict conclusion. For $y = x^{3}$, $x < y$ implies $x^{3} < y^{3}$, though $f^{'{(0)}} = 0$.

> **Proof**
>
> For $x < y$, MVT gives a $c \in \left( {x,y} \right)$ with $\frac{f(y) - f(x)}{y - x} = f^{'{(c)}} \geq 0$.

> **Remark: First-derivative sign chart (L14 p.2)**
>
> The handwritten graph for the first derivative test is the sign transition below; reversing both signs gives the local-minimum version.
>
>   -------------------------------------- ----------- --------------------------------------
>   $\left( {c - \varepsilon,c} \right)$   $c$         $\left( {c,c + \varepsilon} \right)$
>   $f' > 0$                               local max   $f' < 0$
>   $f$ increasing                         $f(c)$      $f$ decreasing
>   -------------------------------------- ----------- --------------------------------------

> **Corollary: First derivative test**
>
> Let $c \in \mathbb{R}$ and suppose $f$ is continuous on $V_{\varepsilon{(c)}}$ for some $\varepsilon > 0$, and differentiable on $\left( {c - \varepsilon,c} \right)$ and $\left( {c,c + \varepsilon} \right)$. If $f' > 0$ on $\left( {c - \varepsilon,c} \right)$ and $f' < 0$ on $\left( {c,c + \varepsilon} \right)$, then $c$ is a local maximum of $f$; dually, the reversed signs give a local minimum.

> **Proof**
>
> For $x < c$, MVT gives a $t \in \left( {x,c} \right)$ with $\frac{f(x) - f(c)}{x - c} = f^{'{(t)}} > 0$, hence $f(x) < f(c)$. The same argument for $c < y$ gives $f(y) < f(c)$.

> **Theorem: Darboux's theorem**
>
> If $f$ is differentiable on $\left\lbrack {a,b} \right\rbrack$ and $f^{'{(a)}} < \ell < f^{'{(b)}}$, then there is $c \in \left( {a,b} \right)$ such that $f^{'{(c)}} = \ell$. Thus a differentiable function has every slope between $f^{'{(a)}}$ and $f^{'{(b)}}$: derivatives satisfy IVT even though they need not be continuous (no jump/infinite discontinuity).

> **Proof**
>
> WLOG let $g(x) = f(x) - \ell x$. Then $g^{'{(a)}} < 0 < g^{'{(b)}}$, and $g$ is continuous on $\left\lbrack {a,b} \right\rbrack$. EVT gives a minimum point $c$ of $g$. The endpoint derivative signs force $c \in \left( {a,b} \right)$, so Fermat gives $g^{'{(c)}} = 0$, hence $f^{'{(c)}} = \ell$.

## Functions on intervals, inverse functions, and L'Hôpital (L14(2))

Standing assumption: let $I \subset \mathbb{R}$ be a nondegenerate interval, and $f:I\rightarrow\mathbb{R}$ a function.

> **Theorem: Strictly increasing functions**
>
> If $f$ is strictly increasing, then:
>
> - $f$ is injective;
> - $f^{- 1}$ is also strictly increasing;
> - if $c \in I$ is not the right endpoint of $I$, then $\lim_{x\rightarrow c^{+}}f(x)$ exists;
> - if $c \in I$ is not the left endpoint of $I$, then $\lim_{x\rightarrow c^{-}}f(x)$ exists;
> - $f$ has at most countably many discontinuities, and they are all jumps;
> - if $f\lbrack I\rbrack$ is an interval, then $f$ is continuous.

> **Proof**
>
> For the right limit let $S = f\left\lbrack {I \cap \left( {c,\infty} \right)} \right\rbrack$, which is nonempty and bounded below by $f(c)$; write $L = \inf(S)$. Given $\varepsilon > 0$, fix $0 < \delta$ with $c + \delta \in I$ and $f\left( {c + \delta} \right) < L + \varepsilon$. Then $L \leq f(x) \leq f\left( {c + \delta} \right) < L + \varepsilon$ for $x \in \left( {c,c + \delta} \right)$, so $\lim_{x\rightarrow c^{+}}f(x) = L$. The left-limit proof is similar, and these imply that discontinuities are jumps. For the final claim, prove the contrapositive: at an interior jump with $\ell = \lim_{x\rightarrow c^{-}}f(x) < L = \lim_{x\rightarrow c^{+}}f(x)$, both $\left( {- \infty,\ell} \right\rbrack \cap f\lbrack I\rbrack$ and $\left\lbrack {L,\infty} \right) \cap f\lbrack I\rbrack$ are nonempty but $\left( {\ell,L} \right)$ is not contained in $f\lbrack I\rbrack$ because $\left( {\ell,L} \right) \cap f\lbrack I\rbrack \subset \left\{ {f(c)} \right\}$. The endpoint cases are similar. The remaining proofs are left as exercises. Remark: the dual also holds if $f$ is strictly decreasing.

> **Theorem: Continuous functions on intervals**
>
> If $f$ is continuous, then:
>
> - $f\lbrack I\rbrack$ is an interval;
> - if $I$ is closed and bounded, so is $f\lbrack I\rbrack$;
> - $f$ is strictly monotone iff $f$ is injective;
> - if $f$ is injective, then $f^{- 1}$ is also continuous.

> **Proof**
>
> The first two were proved previously. For the backward direction of (iii), if $f$ is not strictly monotone, WLOG find $x < y < z$ in $I$ with either $f(x) < f(y) > f(z)$ or $f(x) > f(y) < f(z)$. IVT then implies $f$ is not one-to-one. L14(2) p.2 visualizes these two alternatives by the following ordered-value charts, each forcing a repeated intermediate value:
>
>   ---------------------- ---------------------- -----------------------
>   $x < y < z$            $x < y < z$
>   $f(x) < f(y) > f(z)$   $f(x) > f(y) < f(z)$   not one-to-one by IVT
>   ---------------------- ---------------------- -----------------------
>
> Finally, injectivity makes $f$ strictly monotone, hence $f^{- 1}$ strictly monotone; since $I = f^{- 1}\left\lbrack {f\lbrack I\rbrack} \right\rbrack$ is an interval, the previous theorem makes $f^{- 1}$ continuous.

> **Corollary: Injective functions and inverses**
>
> If $f$ is injective, then $f$ is strictly increasing iff $f^{- 1}$ is strictly increasing; $f$ is strictly decreasing iff $f^{- 1}$ is strictly decreasing; and $f$ is continuous iff $f^{- 1}$ is continuous.
>
> Question: Could we add "$f$ is differentiable iff $f^{- 1}$ is differentiable"? Answer: not quite. $f(x) = x^{3}$ is injective and differentiable on $\left( {- 1,1} \right)$, but $f^{- 1}$ is not differentiable at $f(0) = 0$.

> **Theorem: Inverse Function Theorem**
>
> Suppose $f$ is continuous and injective on an open interval $I$, let $x_{0} \in I$, and suppose $f$ is differentiable at $x_{0}$ with $f^{'{(x_{0})}} \neq 0$. Then $f^{- 1}$ is differentiable at $y_{0} = f\left( x_{0} \right)$ and
>
> $$
> \left( f^{- 1} \right)^{'{(y_{0})}} = \frac{1}{f^{'{(x_{0})}}}.
> $$
>
> The p.3 inverse-function sketch has the paired coordinates
>
>   --------------------------------- --------------- ---------------------------------
>   $x_{0}$                           $f$             $y_{0} = f\left( x_{0} \right)$
>   $g\left( y_{0} \right) = x_{0}$   $g = f^{- 1}$   $y_{0}$
>   --------------------------------- --------------- ---------------------------------
>
> .

> **Proof**
>
> Write $g = f^{- 1}$. Since $f^{'{(x_{0})}} \neq 0$ and $f(x) \neq f\left( x_{0} \right)$ for $x \neq x_{0}$,
>
> $$
> \lim\limits_{x\rightarrow x_{0}}\frac{x - x_{0}}{f(x) - f\left( x_{0} \right)} = \frac{1}{f^{'{(x_{0})}}}.
> $$
>
> Fix $\delta_{0} > 0$ such that the difference between the displayed quotient and $\frac{1}{f^{'{(x_{0})}}}$ is less than $\varepsilon$ whenever $0 < \left| {x - x_{0}} \right| < \delta_{0}$. Continuity of $g$ at $y_{0}$ supplies $\delta_{1} > 0$ with $\left| {g(y) - g\left( y_{0} \right)} \right| < \delta_{0}$ whenever $\left| {y - y_{0}} \right| < \delta_{1}$. Substitution $x = g(y)$ is the displayed p.4 calculation: for $0 < \left| {y - y_{0}} \right| < \delta_{1}$,
>
> $$
> \left| {\frac{g(y) - g\left( y_{0} \right)}{f\left( {g(y)} \right) - f\left( {g\left( y_{0} \right)} \right)} - \frac{1}{f^{'{(x_{0})}}}} \right| < \varepsilon,
> $$
>
> and, since $f\left( {g(y)} \right) = y$ and $f\left( {g\left( y_{0} \right)} \right) = y_{0}$, this gives
>
> $$
> \left| {\frac{g(y) - g\left( y_{0} \right)}{y - y_{0}} - \frac{1}{f^{'{(x_{0})}}}} \right| < \varepsilon,
> $$
>
> whence the result. Consequently, if $f$ is differentiable and $f' \neq 0$ on an open interval $I$, then $f$ is injective on $I$, $f^{- 1}$ is differentiable on $f\lbrack I\rbrack$, and $\left( f^{- 1} \right)' = \frac{1}{f' ○ f^{- 1}}$. The final visible p.4 margin annotation is: "Prove? Fix? Skip? 6.1.9".

> **Example: Inverse derivative**
>
> Define the invertible differentiable function
>
> $$
> f(x) = \frac{e^{x}}{x^{2} + 1} + x^{3} + 2x
> $$
>
> on $\mathbb{R}$. Find $\left( f^{- 1} \right)^{'{(1)}}$. Since $f(0) = 1$ and
>
> $$
> f^{'{(x)}} = \frac{e^{x{({x^{2} + 1})}} - 2xe^{x}}{\left( {x^{2} + 1} \right)^{2}} + 3x^{2} + 2 = \frac{e^{{x{({x - 1})}}^{2}}}{\left( {x^{2} + 1} \right)^{2}} + 3x^{2} + 2,
> $$
> $$
> \left( f^{- 1} \right)^{'{(1)}} = \frac{1}{f^{'{({f^{- 1}{(1)}})}}} = \frac{1}{f^{'{(0)}}} = \frac{1}{3}.
> $$

## L'Hôpital's Rule

> **Lemma: Cauchy's Mean Value Theorem**
>
> Let $a < b$, and suppose $f,g:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ are continuous on $\left\lbrack {a,b} \right\rbrack$ and differentiable on $\left( {a,b} \right)$. Then there is $c \in \left( {a,b} \right)$ such that
>
> $$
> \left( {f(b) - f(a)} \right)g^{'{(c)}} = \left( {g(b) - g(a)} \right)f^{'{(c)}}.
> $$

> **Proof**
>
> Apply MVT to $h(x) = \left( {f(b) - f(a)} \right)g(x) - \left( {g(b) - g(a)} \right)f(x)$ on $\left\lbrack {a,b} \right\rbrack$.

> **Theorem: L'Hôpital's Rule**
>
> Let $a < b$, and let $f,g:\left( {a,b} \right)\rightarrow\mathbb{R}$ be differentiable functions with $g^{'{(x)}} \neq 0$ for all $x \in \left( {a,b} \right)$. Suppose $\lim_{x\rightarrow a^{+}}f(x) = \lim_{x\rightarrow a^{+}}g(x) = 0$. If $\lim_{x\rightarrow a^{+}}\frac{f^{'{(x)}}}{g^{'{(x)}}}$ exists and equals $L \in \mathbb{R}$, then $\lim_{x\rightarrow a^{+}}\frac{f(x)}{g(x)}$ exists and equals $L$.

> **Proof**
>
> Extend $f,g$ to $F,G:\left\lbrack {a,b} \right)\rightarrow\mathbb{R}$ by $F(a) = G(a) = 0$. Rolle's theorem on $G$ shows that not just $g'$ but $g$ itself is never $0$ on $\left( {a,b} \right)$. Let $\left( x_{n} \right)$ in $\left( {a,b} \right)$ tend to $a$. Cauchy's MVT supplies $y_{n} \in \left( {a,x_{n}} \right)$ with
>
> $$
> F^{'{(y_{n})}}\left( {G\left( x_{n} \right) - G(a)} \right) = G^{'{(y_{n})}}\left( {F\left( x_{n} \right) - F(a)} \right).
> $$
>
> Then $y_{n}\rightarrow a$ and $\frac{f\left( x_{n} \right)}{g\left( x_{n} \right)} = \frac{f^{'{(y_{n})}}}{g^{'{(y_{n})}}}$ for all $n$; hence the quotient tends to $L$. Since $\left( x_{n} \right)$ was arbitrary, the desired right-hand limit is $L$.
>
> Remark: the rule also holds for two-sided limits and limits at $\pm \infty$. It also holds for indeterminate limits of the form $\pm \frac{\infty}{\pm}\infty$, and can be adapted to $\infty - \infty$, $0 \cdot \infty$, $1^{\infty}$, $0^{0}$, and $\infty^{0}$ (see 6.3). **Skip the rest?**

> **Example: L'Hôpital examples**
>
> $$
> \lim\limits_{x\rightarrow 0}\sin\frac{x}{x} = \lim\limits_{x\rightarrow 0}\cos\frac{x}{1} = 1;\quad\forall a > 0,\lim\limits_{x\rightarrow\infty}\frac{\ln x}{x^{a}} = \lim\limits_{x\rightarrow\infty}\frac{1}{ax^{a}} = 0;
> $$
> $$
> \forall a > 0,\lim\limits_{x\rightarrow\infty}\frac{x^{a}}{e^{x}} = \lim\limits_{x\rightarrow\infty}\frac{ax^{a - 1}}{e^{x}} = \ldots = 0.
> $$

> **Corollary: No removable discontinuity for a derivative**
>
> Let $a \in \mathbb{R}$, let $I$ be an open interval containing $a$, and let $f:I\rightarrow\mathbb{R}$ be continuous and differentiable on $I \smallsetminus \left\{ a \right\}$. If $\lim_{x\rightarrow a}f^{'{(x)}}$ exists, then $f$ is differentiable at $a$ and $\lim_{x\rightarrow a}f^{'{(x)}} = f^{'{(a)}}$.

> **Proof**
>
> Let $F(x) = f(x) - f(a)$ and $G(x) = x - a$. Then $\lim_{x\rightarrow a}F(x) = \lim_{x\rightarrow a}G(x) = 0$ and $\lim_{x\rightarrow a}\frac{F^{'{(x)}}}{G^{'{(x)}}} = \lim_{x\rightarrow a}f^{'{(x)}}$ exists. The definition of derivative and L'Hôpital's rule give
>
> $$
> f^{'{(a)}} = \lim\limits_{x\rightarrow a}\frac{f(x) - f(a)}{x - a} = \lim\limits_{x\rightarrow a}\frac{F(x)}{G(x)} = \lim\limits_{x\rightarrow a}\frac{F^{'{(x)}}}{G^{'{(x)}}} = \lim\limits_{x\rightarrow a}f^{'{(x)}}.
> $$

> **Example: Final counterexample**
>
> Let $f(x) = x\sin\left( \frac{1}{x} \right)$ for $x \neq 0$, and $f(0) = 0$. From continuity at $0$ and differentiability everywhere except at $0$, we already know that $\lim_{x\rightarrow 0}f^{'{(x)}}$ cannot exist.

# Numerical series

> **Definition: Series**
>
> 若 $\left( a_{k} \right)_{k \in \ \mathbb{N}}$ 是 $\mathbb{R}$ 中的一个 sequence，记
>
> $$
> s_{n} = \sum\limits_{k = 1}^{n}a_{k}
> $$
>
> 为其 $n$th partial sum；$\left( s_{n} \right)$ 是 sequence of partial sums。用 $\sum_{k = 1}^{\infty}a_{k}$ 表示由 $\left( a_{k} \right)$ 确定的 infinite series。
>
> 若 $\lim_{n\rightarrow\infty}\sum_{k = 1}^{n}a_{k} = L$，则 series **converges**；否则 **diverges**。Informally，$\sum a_{k} < \infty$。Note： $\sum_{k = 1}^{\infty}a_{k}$ 代表一个 limit 而非 algebraic operation.

> **Example: Harmonic and geometric series**
>
> The harmonic series diverges to $+ \infty$:
>
> $$
> \sum\limits_{n = 1}^{\infty}\frac{1}{n} = 1 + \frac{1}{2} + \left( {\frac{1}{3} + \frac{1}{4}} \right) + \left( {\frac{1}{5} + \frac{1}{6} + \frac{1}{7} + \frac{1}{8}} \right) + \ldots \geq 1 + \frac{1}{2} + \frac{1}{2} + \ldots = \sum\limits_{n = 1}^{\infty}\frac{1}{2} = \infty.
> $$
>
> 给定 $a,r \in \mathbb{R}$ 和 $m \in \mathbb{Z}$，$\sum_{k = m}^{\infty}ar^{k}$ 是 geometric series。If $r \neq 1$，then
>
> $$
> \sum\limits_{k = m}^{n}ar^{k} = \frac{a\left( {r^{m} - r^{n + 1}} \right)}{1 - r},
> $$
>
> and therefore
>
> $$
> \sum\limits_{k = m}^{\infty}ar^{k} = \left\{ \begin{matrix}
> {a\frac{r^{m}}{1 - r}} & {|r| < 1} \\
> {\text{DNE}\ } & {|r| \geq 1}
> \end{matrix} \right..
> $$
>
> The source writes the finite calculation explicitly (for $m \leq n$):
>
> $$
> \left( {1 - r} \right)\sum\limits_{k = m}^{n}ar^{k} = a\left\lbrack {\left( {r^{m} + \ldots + r^{n}} \right) - \left( {r^{m + 1} + \ldots + r^{n + 1}} \right)} \right\rbrack,
> $$
>
> hence $\sum_{k = m}^{n}ar^{k} = \frac{a\left( {r^{m} - r^{n + 1}} \right)}{1 - r}$.

> **Definition: $p$-series**
>
> 给定 $p \in \mathbb{R}$，形如
>
> $$
> \sum\limits_{n = 1}^{\infty}\left( \frac{1}{n} \right)^{p}
> $$
>
> 的 series 称为 $p$-series。

> **Theorem: $p$-series criterion**
>
> A $p$-series converges iff $p > 1$.

> **Proof**
>
> If $p \leq 1$, then $n^{p} \leq n$, so $\frac{1}{n^{p}} \geq \frac{1}{n}$ and comparison with the harmonic series gives divergence. If $p > 1$,
>
> $$
> \sum\limits_{n = 1}^{\infty}\frac{1}{n^{p}} = 1 + \frac{1}{2^{p}} + \frac{1}{3^{p}} + \left( {\frac{1}{4^{p}} + \ldots + \frac{1}{7^{p}}} \right) + \left( {\frac{1}{8^{p}} + \ldots + \frac{1}{15^{p}}} \right) + \ldots
> $$
> $$
> \leq 1 + \frac{2}{2^{p}} + \frac{4}{4^{p}} + \frac{8}{8^{p}} + \ldots = \sum\limits_{j = 0}^{\infty}\left( \frac{1}{2^{p - 1}} \right)^{j} = \frac{1}{1 - \left( \frac{1}{2} \right)^{p - 1}} < \infty.
> $$
>
> The notes record $\sum\frac{1}{n^{2}} = \frac{\pi^{2}}{6}$, $\sum\frac{1}{n^{4}} = \frac{\pi^{4}}{90}$, and "$\sum\frac{1}{n^{3}}$: no nice formula".

> **Example: Telescoping and alternating harmonic series**
>
> $$
> \sum\limits_{n = 1}^{\infty}\left( {\frac{1}{n} - \frac{1}{n + 1}} \right) = \left( {1 - \frac{1}{2}} \right) + \left( {\frac{1}{2} - \frac{1}{3}} \right) + \ldots = \lim\limits_{n\rightarrow\infty}\left( {1 - \frac{1}{n + 1}} \right) = 1.
> $$
>
> For the alternating harmonic series,
>
> $$
> \sum\limits_{k = 1}^{\infty}\frac{\left( {- 1} \right)^{k + 1}}{k} = \left( {1 - \frac{1}{2}} \right) + \left( {\frac{1}{3} - \frac{1}{4}} \right) + \ldots.
> $$
>
> If $s_{n} = \frac{\sum_{k = 1}^{{n{({- 1})}}^{k + 1}}}{k}$, then $\left( s_{2n} \right)$ increases and $\left( s_{2n + 1} \right)$ decreases, so
>
> $$
> \sum\limits_{k = 1}^{\infty}\frac{\left( {- 1} \right)^{k + 1}}{k} = \sup\left\{ s_{2n} \right\} = \inf\left\{ s_{2n + 1} \right\} = \ln 2.
> $$

> **Theorem: Linearity of series**
>
> 设 $\sum a_{n}$ 和 $\sum b_{n}$ converge，且 $c \in \mathbb{R}$。Then
>
> $$
> \sum ca_{n} = c\sum a_{n},\quad\sum\left( {a_{n} + b_{n}} \right) = \sum a_{n} + \sum b_{n}.
> $$
>
> Note: $\sum a_{n}b_{n} \neq \left( {\sum a_{n}} \right)\left( {\sum b_{n}} \right)$.

> **Theorem: Cauchy criterion for convergence**
>
> 令 $\sum a_{k}$ 是 partial sums 为 $\left( s_{n} \right)$ 的 series。则 $\sum a_{k}$ converges iff $\left( s_{n} \right)$ is Cauchy，即对每个 $\varepsilon > 0$ 存在 $N \in \mathbb{N}$ such that
>
> $$
> \left| {s_{n} - s_{m}} \right| < \varepsilon\quad\text{whenever}\quad N \leq m \leq n.
> $$
>
> Equivalently, $\left| {\sum_{k = m + 1}^{n}a_{k}} \right| < \varepsilon$.

> **Proof**
>
> 课后。

> **Theorem: The $n$th-term test**
>
> If $\sum a_{n}$ converges, then $a_{n}\rightarrow 0$. Contrapositively useful: $\left( a_{n} \right)$ not tending to $0$ implies $\sum a_{n}$ diverges. （这是 convergence 的 necessary 而非 sufficient condition。）

> **Proof**
>
> $$
> \lim\limits_{k\rightarrow\infty}a_{k} = \lim\limits_{k\rightarrow\infty}\left( {s_{k} - s_{k - 1}} \right) = \lim\limits_{k\rightarrow\infty}s_{k} - \lim\limits_{k\rightarrow\infty}s_{k - 1} = 0.
> $$

> **Theorem: Comparison test**
>
> Let $\left( a_{n} \right)$ be a sequence of nonnegative numbers and let $\left( b_{n} \right)$ be any sequence.
>
> - If $\sum a_{n}$ converges and $\left| b_{n} \right| \leq a_{n}$ for all $n$, then $\sum b_{n}$ converges.
> - If $\sum a_{n} = \infty$ and $b_{n} \geq a_{n}$ for all $n$, then $\sum b_{n} = \infty$.
>
> The finite-tail form is also recorded: if $\sum b_{n}$ converges and $\left| b_{n} \right| \leq a_{n}$ for all $n \geq N$, then $\sum b_{n}$ converges; of course the limit is different.

> **Proof**
>
> Let $\left( s_{n} \right)$ and $\left( t_{n} \right)$ be the partial sums of $\sum a_{k}$ and $\sum b_{k}$. In the first case,
>
> $$
> \left| {t_{n} - t_{m}} \right| = \left| {\sum\limits_{k = m + 1}^{n}b_{k}} \right| \leq \sum\limits_{k = m + 1}^{n}\left| b_{k} \right| \leq \sum\limits_{k = m + 1}^{n}a_{k} = \left| {s_{n} - s_{m}} \right|.
> $$
>
> Thus the Cauchy criterion makes $\sum b_{k}$ converge. The second assertion is similar.

> **Example: Comparison and absolute convergence**
>
> $$
> \sum\limits_{n = 2}^{\infty}\frac{\sin(n)}{n^{2}\ln n}
> $$
>
> converges by comparison with $\sum\frac{1}{n^{2}}$, since for all sufficiently large $n$,
>
> $$
> \left| {\sin\frac{n}{n^{2}\ln n}} \right| < \frac{1}{n^{2}}.
> $$
>
> A series $\sum a_{k}$ **converges absolutely** if $\sum\left| a_{k} \right|$ converges. Absolute convergence is a stronger condition: if $\sum a_{k}$ converges absolutely, then $\sum a_{k}$ converges, because
>
> $$
> \left| {s_{n} - s_{m}} \right| = \left| {\sum\limits_{k = m + 1}^{n}a_{k}} \right| \leq \sum\limits_{k = m + 1}^{n}\left| a_{k} \right|.
> $$

> **Definition: Conditional convergence**
>
> 一个 convergent 但不 absolutely convergent 的 series 称为 conditionally convergent。alternating harmonic series $\frac{\sum_{k = 1}^{{\infty{({- 1})}}^{k + 1}}}{k}$ conditional convergence。

> **Remark: Disturbing fact: reordering**
>
> A conditionally convergent series can be made to converge to any number by "reordering" its terms. A reordered conditionally convergent series still has a limit, but it can be made to converge to any value. For example,
>
> $$
> \sum\frac{\left( {- 1} \right)^{k + 1}}{k} = 1 - \frac{1}{2} + \frac{1}{3} - \frac{1}{4} + \frac{1}{5} - \ldots
> $$
>
> can be reordered to converge to $\sqrt{2}$ by placing enough positive terms first and using negative terms as compensation after the partial sum exceeds $\sqrt{2}$.
>
> In contrast, absolutely convergent series are closed under reordering: if $\sum a_{k}$ converges absolutely, then for every bijection $f:\mathbb{N}\rightarrow\mathbb{N}$,
>
> $$
> \sum\limits_{k = 1}^{\infty}a_{f{(k)}} = \sum\limits_{k = 1}^{\infty}a_{k}.
> $$
>
> For nonnegative $a_{k}$, this follows because $\left( {\sum_{k = 1}^{n}a_{k}} \right)$ and $\left( {\sum_{k = 1}^{n}a_{f{(k)}}} \right)$ are increasing sequences with the same supremum. In the general case take
>
> $$
> b_{n} = \left\{ \begin{matrix}
> a_{n} & {a_{n} \geq 0} \\
> {0\ } & \text{otherwise}
> \end{matrix} \right.,\quad c_{n} = \left\{ \begin{matrix}
> \left| a_{n} \right| & {a_{n} < 0} \\
> {0\ } & \text{otherwise}
> \end{matrix} \right.,
> $$
>
> so $a_{n} = b_{n} - c_{n}$, and apply the nonnegative claim to $b_{n},c_{n}$.

> **Theorem: Root test**
>
> Let $\left( a_{n} \right)$ be a sequence in $\mathbb{R}$ and let $\rho = \operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}}$.
>
> - If $\rho < 1$, then $\sum a_{n}$ converges absolutely.
> - If $\left| a_{n} \right| \geq 1$ for infinitely many $n$ (which happens when $\rho > 1$), then $\sum a_{n}$ diverges.
>
> Note: $L = \operatorname{lim\, sup}a_{n}$ iff, for every $\varepsilon > 0$, there are only finitely many $n$ with $a_{n} > L + \varepsilon$, while there are infinitely many $n$ with $a_{n} > L - \varepsilon$.

> **Proof**
>
> Assume $\rho < 1$, fix $\rho < r < 1$, and choose $N$ such that $\left| a_{n} \right|^{\frac{1}{n}} \leq r$ for $n \geq N$. Then $\left| a_{n} \right| \leq r^{n}$ and comparison with $\sum r^{n}$ proves absolute convergence. If $\left| a_{n} \right| \geq 1$ infinitely often, then $a_{n}$ does not tend to $0$, so the $n$th-term test gives divergence.

> **Theorem: Ratio test**
>
> Let $\left( a_{n} \right)$ be a sequence of nonzero numbers.
>
> - If $\operatorname{lim\, sup}\left| \frac{a_{n + 1}}{a_{n}} \right| < 1$, then $\sum a_{n}$ converges absolutely.
> - If $\operatorname{lim\, inf}\left| \frac{a_{n + 1}}{a_{n}} \right| > 1$, then $\sum a_{n}$ diverges.
>
> This follows from the root test and the lecture's fact
>
> $$
> \operatorname{lim\, inf}\left| \frac{a_{n + 1}}{a_{n}} \right| \leq \operatorname{lim\, inf}\left| a_{n} \right|^{\frac{1}{n}} \leq \operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}} \leq \operatorname{lim\, sup}\left| \frac{a_{n + 1}}{a_{n}} \right|.
> $$

> **Remark: Root and ratio tests**
>
> root test implies ratio test；root test 通常比 ratio test 更强。Both are inconclusive when $\operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}} = 1$ or $\lim\left| \frac{a_{n + 1}}{a_{n}} \right| = 1$ (for example $a_{n} = \frac{1}{n}$, $b_{n} = \frac{1}{n^{2}}$). If either limit exists and is $r$, there is absolute convergence for $r < 1$ and divergence for $r > 1$. Whenever the root test is inconclusive, the ratio test is also inconclusive（反而不用再试）.

> **Theorem: Alternating Series Test**
>
> If $\left( a_{k} \right)$ is a decreasing sequence of positive numbers converging to $0$, then
>
> $$
> \sum\limits_{k = 1}^{{\infty{({- 1})}}^{k + 1}}a_{k}
> $$
>
> converges.

> **Proof**
>
> Let $s_{n} = \sum_{k = 1}^{{n{({- 1})}}^{k + 1}}a_{k}$. Then
>
> $$
> s_{2n} = \left( {a_{1} - a_{2}} \right) + \left( {a_{3} - a_{4}} \right) + \ldots + \left( {a_{2n - 1} - a_{2n}} \right)
> $$
>
> is increasing and bounded above by $a_{1}$, hence converges to $\ell$. Choose $N$ so that $\left| {s_{2n} - \ell} \right| < \frac{\varepsilon}{2}$ and $\left| a_{2n + 1} \right| < \frac{\varepsilon}{2}$ for $n \geq N$. Then
>
> $$
> \left| {s_{2n + 1} - \ell} \right| \leq \left| {s_{2n} - \ell} \right| + \left| a_{2n + 1} \right| < \varepsilon.
> $$
>
> Thus $s_{2n + 1}\rightarrow\ell$ as well, hence $s_{n}\rightarrow\ell$.

> **Theorem: Integral test**
>
> Let $f$ be a positive and decreasing function on $\left\lbrack {1,\infty} \right)$. Then
>
> $$
> \sum\limits_{k = 1}^{\infty}f(k)\ \text{converges}\quad\Leftrightarrow\quad\int_{1}^{\infty}f(x)\, dx
> $$
>
> converges, where
>
> $$
> \int_{1}^{\infty}f(x)\, dx = \lim\limits_{b\rightarrow\infty}\int_{1}^{b}f(x)\, dx.
> $$
>
> Note: 此时我们还没有严格定义 improper integral；integral test 的证明以后 再证，但其意义很直观，并由矩形比较
>
> $$
> f\left( {k + 1} \right) \leq \int_{k}^{k + 1}f(x)\, dx \leq f(k).
> $$
>
> L15 p.4 的紫色 rectangle sketch 就是这组不等式：一个宽度为 $1$ 的 interval $\left\lbrack {k,k + 1} \right\rbrack$ 上，decreasing curve 下的 area 介于两端点高的 rectangles 之间。其 native table reconstruction is
>
>   ----------------------------------- -------------------------------------------------------- -----------------
>   left rectangle                      curve area over $\left\lbrack {k,k + 1} \right\rbrack$   right rectangle
>   $f\left( {k + 1} \right) \cdot 1$   $\int_{k}^{k + 1}f(x)\, dx$                              $f(k) \cdot 1$
>   lower bound                         middle                                                   upper bound
>   ----------------------------------- -------------------------------------------------------- -----------------
>
> .

> **Remark: Numerical Series Summary**
>
> \(1\) Cauchy Criterion: $\sum a_{k}$ converges iff $\left( s_{n} \right)$ is Cauchy. (2) $n$th term test: $\left( a_{n} \right)$ not tending to $0$ implies divergence. (3) Comparison Test. (4) Root Test. (5) Ratio Test. (6) Alternating Series Test: positive decreasing $\left( a_{n} \right)$ converging to $0$ makes its alternating series converge. (7) Integral Test for positive decreasing $f$.
>
> Abs convergence $\Rightarrow$ convergence. Abs convergence is closed under reordering; conditionally convergent series are not.

# Riemann integration

## Antiderivatives and Riemann sums (L16)

> **Definition: Antiderivatives**
>
> A function $F$ 被称为 an antiderivative of $f$ on interval $I$，if $F^{'{(x)}} = f(x)$ for all $x \in I$。若 $F$ 是 $f$ 在 $I$ 上的 antdv，那么 对任意 $C \in \mathbb{R}$，$F(x) + C$ 都是在 $I$ 上的 antdv；且 $f$ 在 $I$ 上的任何 antdv 都是 $F(x) + C$ 的形式。

> **Example: The antiderivative problem**
>
> For $r \neq - 1$,
>
> $$
> \frac{d}{dx}\left( \frac{x^{r + 1}}{r + 1} \right) = x^{r}.
> $$
>
> Thus $\frac{x^{r + 1}}{r + 1}$ is an antiderivative of $x^{r}$ on $\mathbb{R}$. For example, $f(x) = 3x^{2} - 2x + 7$ has antiderivative $F(x) = x^{3} - x^{2} + 7x + C$; $g(x) = \sin\left( {2x} \right)$ has $G(x) = - \frac{\cos\left( {2x} \right)}{2} + C$; for $h(x) = \cos\left( x^{2} \right)$, the question $H(x) = ?$ is left as an illustration that antiderivatives need not have a familiar formula.
>
> The antiderivative problem：given a ctn function $f$ on interval $I$，find $F$ such that $F' = f$ on $I$。Informal 的分析是：当 $h$ 很小时， differentiability suggests $F\left( {a + h} \right) - F(a) \approx hf(a)$，即 graph 下的一条 narrow region 的 area approximately 为 $hf(a)$。

> **Remark: The idea "area so far"**
>
> 对 $t \geq 0$，令 $F(t)$ 为 $y = f(x)$ 下、$x = 0$ 到 $x = t$ 的 area。则对 $a > 0$ 与 small $h$，$F\left( {a + h} \right) - F(a) \approx hf(a)$，故 $\frac{F\left( {a + h} \right) - F(a)}{h} \approx f(a)$。但 area'' 需要 definition：1 使用 rectangle as basic notion；2 使用 rectangles 来 approximate complicated regions；3 使用 limit of such approximation 定义 area''。这就是最早的 Riemann Integral 的 basic idea。
>
> L16 p.1 的 shaded vertical strip is represented by the following native relation table (the strip runs from $a$ to $a + h$ beneath $y = f(x)$):
>
>   -------------------- ------------------------------------------------ ---------------------------------------
>   $0$                  $a$                                              $a + h$
>   area so far $F(a)$   narrow strip                                     area so far $F\left( {a + h} \right)$
>                        $F\left( {a + h} \right) - F(a) \approx hf(a)$
>   -------------------- ------------------------------------------------ ---------------------------------------

> **Definition: Def② 基础架构：partitions, mesh, and tags**
>
> $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ 是一个 function（不需要 ctn）。
>
> 1.  A partition $P$ of $\left\lbrack {a,b} \right\rbrack$ is a finite ordered set $P = \left( {x_{0},x_{1},\ldots,x_{n}} \right)$ where $a = x_{0} < x_{1} < \ldots < x_{n} = b$.
>
> 2.  $I_{k} = \left\lbrack {x_{k - 1},x_{k}} \right\rbrack$ is the $k$th subinterval of $\left\lbrack {a,b} \right\rbrack$.
>
> 3.  The norm (mesh) is
>
>     $$
>     \left\| P \right\| = \max\left\{ {\Delta x_{k}:1 \leq k \leq n} \right\},\quad\Delta x_{k} = x_{k} - x_{k - 1}.
>     $$
>
> 4.  A tagged partition $\cdot P$ is a partition $P = \left( {x_{0},\ldots,x_{n}} \right)$ together with a choice $t_{k} \in I_{k}$ for every $k$; $t_{k}$ is the tag.
>
> The numbered line on L16 p.2 is the partition picture $a = x_{0} < x_{1} < \ldots < x_{n} = b$; a representative finite rendering is
>
>   ------------- --------- --------- ---------- -------------
>   $a = x_{0}$   $x_{1}$   $x_{2}$   $\ldots$   $x_{n} = b$
>   $I_{1}$       $I_{2}$   $I_{3}$              $I_{n}$
>   ------------- --------- --------- ---------- -------------
>
> .

> **Definition: Riemann sum**
>
> 对 tagged partition $\cdot P$，$f$ 在 $\left\lbrack {a,b} \right\rbrack$ 上的 Riemann Sum 是
>
> $$
> S\left( {f, \cdot P} \right) = \sum\limits_{k = 1}^{n}f\left( t_{k} \right)\Delta x_{k}.
> $$
>
> tagged partition 就是把 $\left\lbrack {a,b} \right\rbrack$ 切分成 $n$ 个 subinterval，在每个 subinterval 上都取一点作为 tag；Riemann Sum 对每个 subinterval 都用 $f\left( t_{k} \right)\Delta x_{k}$ 近似面积。
>
> The colored rectangles in L16 p.2 assign one tag to each interval:
>
>   ------------------------------------- ------------------------------------- ---------- -------------------------------------
>   $I_{1}$                               $I_{2}$                               $\ldots$   $I_{n}$
>   $t_{1} \in I_{1}$                     $t_{2} \in I_{2}$                     $\ldots$   $t_{n} \in I_{n}$
>   $f\left( t_{1} \right)\Delta x_{1}$   $f\left( t_{2} \right)\Delta x_{2}$   $\ldots$   $f\left( t_{n} \right)\Delta x_{n}$
>   ------------------------------------- ------------------------------------- ---------- -------------------------------------
>
> .

> **Definition: Riemann integrability**
>
> 称 $f$ 在 $\left\lbrack {a,b} \right\rbrack$ 上 Riemann Integrable，若存在 $L \in \mathbb{R}$，使对任意 $\varepsilon > 0$，存在 $\delta > 0$ 满足
>
> $$
> \left| {S\left( {f, \cdot P} \right) - L} \right| < \varepsilon
> $$
>
> 对任何 $\left\| P \right\| < \delta$ 的 tagged partition $\cdot P$ 都成立。记
>
> $$
> L = \int_{a}^{b}f(x)\, dx = \int_{a}^{b}f
> $$
>
> 并称为 $f$ 在 $\left\lbrack {a,b} \right\rbrack$ 上的 Riemann integral。
>
> Riemann Integrable: 对于任意小的 $\varepsilon$，都存在 $\delta$ 使得对于任何 mesh 小于 $\delta$ 的 partition，都有其 Riemann Sum 和 $L$ 的距离小于 $\varepsilon$。我们发现这是一个 Cauchy 式的 Definition；直觉上（稍后将证明） mesh $\left\| P \right\|$ 越小，即 partition 越精细，Riemann Sum 就会越接近 area so far，因而这个定义很符合直觉。Informally, $\lim_{{\| P\|}\rightarrow 0}S\left( {f, \cdot P} \right) = L$.

> **Theorem: bounded 是 Riemann integrable 的必要条件**
>
> If $f$ is Riemann integrable on $\left\lbrack {a,b} \right\rbrack$，then $f$ is bounded on $\left\lbrack {a,b} \right\rbrack$。

> **Proof**
>
> Prove the contrapositive. Suppose $f$ is unbounded on $\left\lbrack {a,b} \right\rbrack$. Let $\varepsilon = 1$, choose any $\delta > 0$, and take any tagged partition $\cdot P$ with $\left\| P \right\| < \delta$. Fix $k$ such that $f$ is unbounded on $I_{k}$, then choose $s_{k} \in I_{k}$ with
>
> $$
> \left| {f\left( s_{k} \right) - f\left( t_{k} \right)} \right| > \frac{1}{\Delta x_{k}}.
> $$
>
> Replace only the $k$th tag of $\cdot P$ by $s_{k}$, producing $\cdot P'$. Then $\left| {S\left( {f, \cdot P} \right) - S\left( {f, \cdot P'} \right)} \right| > 1$. Thus no common limiting $L$ can satisfy the definition.

> **Remark: Two boundary examples**
>
> 一年级 calculus 常把 $\int_{0}^{1}\frac{1}{\sqrt{x}}\, dx$ 写作答案，但 $\frac{1}{\sqrt{x}}$ 因 unbounded 而不是 Riemann integrable；这实际是 improper integral，
>
> $$
> \int_{0}^{1}\frac{1}{\sqrt{x}}\, dx = \lim\limits_{a\rightarrow 0^{+}}\int_{a}^{1}\frac{1}{\sqrt{x}}\, dx.
> $$
>
> 还有 bounded 而 non-Riemann-integrable 的 functions：Dirichlet function
>
> $$
> D(x) = \left\{ \begin{matrix}
> 1 & {x \in \mathbb{Q}} \\
> 0 & {x \in \mathbb{R} \smallsetminus \mathbb{Q}}
> \end{matrix} \right.
> $$
>
> is bounded on $\left\lbrack {0,1} \right\rbrack$ but not Riemann integrable. It is Lebesgue integrable, with $\int_{0}^{1}D(x)\, dx = 0$, because $\mathbb{Q}$ has measure zero on $\left\lbrack {0,1} \right\rbrack$, while $\mathbb{R} \smallsetminus \mathbb{Q}$ has measure one. （之后再学 Lebesgue measure 和 Lebesgue integral。）

> **Definition: Special Riemann sums**
>
> 一个 regular partition 的所有 $\Delta x_{k}$ 都相同： $\Delta x_{k} = \left\| P \right\| = \frac{b - a}{n}$。对一个 partition，取 $t_{k} = x_{k}$ 得 right Riemann sum；取 $t_{k} = x_{k - 1}$ 得 left Riemann sum；取 $t_{k} = \frac{x_{k} + x_{k - 1}}{2}$ 得 midpoint Riemann sum。
>
> Combining the regular partition with the right Riemann sum gives
>
> $$
> S\left( {f, \cdot P} \right) = \sum\limits_{k = 1}^{n}f\left( {a + \frac{k\left( {b - a} \right)}{n}} \right)\frac{b - a}{n}.
> $$
>
> L16 p.3 displays the three choices with their tag positions:
>
>   ------------------- --------------------- ---------------------------------------
>   right Riemann sum   left Riemann sum      midpoint Riemann sum
>   $t_{k} = x_{k}$     $t_{k} = x_{k - 1}$   $t_{k} = \frac{x_{k - 1} + x_{k}}{2}$
>   ------------------- --------------------- ---------------------------------------
>
> .

> **Example: A right sum for $x^{2}$**
>
> Compute the right Riemann sum of $f(x) = x^{2}$ on $\left\lbrack {0,1} \right\rbrack$ using a regular partition with $n$ subintervals. Here
>
> $$
> x_{k} = \frac{k}{n},\quad\Delta x_{k} = \frac{1}{n},\quad t_{k} = \frac{k}{n}
> $$
>
> for $1 \leq k \leq n$, so
>
> $$
> S\left( {f, \cdot P_{n}} \right) = \sum\limits_{k = 1}^{{n{(\frac{k}{n})}}^{2}}\left( \frac{1}{n} \right) = \frac{1}{n^{3}}\sum\limits_{k = 1}^{n}k^{2} = \frac{2n^{3} + 3n^{2} + n}{6n^{3}}.
> $$
>
> Therefore $\lim_{n\rightarrow\infty}S\left( {f, \cdot P_{n}} \right) = \frac{1}{3}$. But this is only one kind of tags on one family of partitions; Riemann integrability must cover all tagged partitions. We return to this using Darboux sums.

> **Definition: Darboux sums and integral**
>
> Suppose $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ is bounded and $P = \left( {x_{0},\ldots,x_{n}} \right)$ is a partition. The upper and lower sums are
>
> $$
> U\left( {f,P} \right) = \sum\limits_{k = 1}^{n}\sup f\left\lbrack I_{k} \right\rbrack\Delta x_{k},\quad L\left( {f,P} \right) = \sum\limits_{k = 1}^{n}\inf f\left\lbrack I_{k} \right\rbrack\Delta x_{k}.
> $$
>
> The upper and lower Darboux integrals are
>
> $$
> U(f) = \inf\left\{ {U\left( {f,P} \right):P\ \text{partitions of}\ \left\lbrack {a,b} \right\rbrack} \right\},\quad L(f) = \sup\left\{ {L\left( {f,P} \right):P\ \text{partitions of}\ \left\lbrack {a,b} \right\rbrack} \right\}.
> $$
>
> Always $L(f) \leq U(f)$. We say $f$ is Darboux integrable on $\left\lbrack {a,b} \right\rbrack$ iff $U(f) = L(f)$. Upper Darboux integral 是所有 partitions 的 upper sum 的下确界； lower Darboux integral 是所有 partitions 的 lower sum 的上确界。
>
> Darboux sum 本身不是 Riemann sum，除非 $f$ continuous（此时 extrema 可取）； but for every tagged partition, $L\left( {f,P} \right) \leq S\left( {f, \cdot P} \right) \leq U\left( {f,P} \right)$.
>
> L16 p.4 contrasts the upper and lower rectangle pictures on one partition:
>
>   ------------------------------------------------------ -------------------------------- ------------------------------------------------------
>   rectangle height on $I_{k}$                            tag height                       rectangle height on $I_{k}$
>   $\inf f\left\lbrack I_{k} \right\rbrack$ (lower sum)   $f\left( t_{k} \right)$          $\sup f\left\lbrack I_{k} \right\rbrack$ (upper sum)
>   $L\left( {f,P} \right)$                                $S\left( {f, \cdot P} \right)$   $U\left( {f,P} \right)$
>   ------------------------------------------------------ -------------------------------- ------------------------------------------------------
>
> .

> **Theorem: Refinement lemma**
>
> Let $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ be bounded with $\left| {f(x)} \right| \leq B$ for all $x \in \left\lbrack {a,b} \right\rbrack$. Let $Q \supseteq P = \left( x_{k} \right)_{k = 0}^{n}$ be partitions of $\left\lbrack {a,b} \right\rbrack$, and put
>
> $$
> J = \left\{ {k:Q \cap \left( {x_{k - 1},x_{k}} \right) \neq \varnothing} \right\}.
> $$
>
> Then
>
> $$
> L\left( {f,P} \right) \leq L\left( {f,Q} \right),\quad\left| {L\left( {f,P} \right) - L\left( {f,Q} \right)} \right| \leq 2|J|B\left\| P \right\|,
> $$
>
> and dually
>
> $$
> U\left( {f,Q} \right) \leq U\left( {f,P} \right),\quad\left| {U\left( {f,Q} \right) - U\left( {f,P} \right)} \right| \leq 2|J|B\left\| P \right\|.
> $$

> **Proof**
>
> Fix $k \in J$, and let $x_{k - 1} = y_{0} < \ldots < y_{r} = x_{k}$ be the partition points of $Q$ in $I_{k}$. Then
>
> $$
> L\left( {f,Q \cap I_{k}} \right) = \sum\limits_{j = 1}^{r}\inf\limits_{\lbrack{y_{j - 1},y_{j}}\rbrack}f\Delta y_{j}
> $$
>
> whereas $\left( {\inf f\left\lbrack I_{k} \right\rbrack} \right)\Delta x_{k} = \sum_{j = 1}^{r}\inf f\left\lbrack I_{k} \right\rbrack\Delta y_{j}$. Each difference is at most $2B\Delta y_{j}$, hence
>
> $$
> 0 \leq L\left( {f,Q \cap I_{k}} \right) - \left( {\inf f\left\lbrack I_{k} \right\rbrack} \right)\Delta x_{k} \leq 2B\Delta x_{k} \leq 2B\left\| P \right\|.
> $$
>
> Sum over $k \in J$. The upper-sum statement is dual. Thus refinement makes lower sums bigger and upper sums smaller, and the difference depends on how many new points and how small the mesh is.

## Equivalence and basic properties (L17)

> **Theorem: Equivalent Riemann/Darboux criteria**
>
> For a bounded function $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$, the following are equivalent:
>
> 1.  $f$ is Riemann integrable on $\left\lbrack {a,b} \right\rbrack$.
> 2.  For every $\varepsilon > 0$, there is $\delta > 0$ such that every two tagged partitions $\cdot P, \cdot Q$ with $\left\| P \right\|,\left\| Q \right\| < \delta$ satisfy $\left| {S\left( {f, \cdot P} \right) - S\left( {f, \cdot Q} \right)} \right| < \varepsilon$.
> 3.  For every $\varepsilon > 0$, there is $\delta > 0$ such that every partition $P$ with $\left\| P \right\| < \delta$ satisfies $U\left( {f,P} \right) - L\left( {f,P} \right) < \varepsilon$.
> 4.  $f$ is Darboux integrable on $\left\lbrack {a,b} \right\rbrack$.
> 5.  For every $\varepsilon > 0$, there is a partition $P$ of $\left\lbrack {a,b} \right\rbrack$ such that $U\left( {f,P} \right) - L\left( {f,P} \right) < \varepsilon$.

> **Proof**
>
> **(1) =\> (2).** If all sufficiently fine Riemann sums are within $\frac{\varepsilon}{2}$ of $L$, their pairwise difference is below $\varepsilon$.
>
> **(2) =\> (3).** For a fixed fine partition choose, in every $I_{k}$, points $s_{k},t_{k}$ approaching $\inf f\left\lbrack I_{k} \right\rbrack$ and $\sup f\left\lbrack I_{k} \right\rbrack$ sufficiently closely:
>
> $$
> \left| {f\left( s_{k} \right) - \inf f\left\lbrack I_{k} \right\rbrack} \right| < \frac{\varepsilon}{4\left( {b - a} \right)},\quad\left| {f\left( t_{k} \right) - \sup f\left\lbrack I_{k} \right\rbrack} \right| < \frac{\varepsilon}{4\left( {b - a} \right)}.
> $$
>
> The associated tagged sums differ by less than $\frac{\varepsilon}{2}$, while their distances to $L\left( {f,P} \right)$ and $U\left( {f,P} \right)$ are each below $\frac{\varepsilon}{4}$; thus $U\left( {f,P} \right) - L\left( {f,P} \right) < \varepsilon$.
>
> **(3) =\> (4).** Since $L\left( {f,P} \right) \leq L(f) \leq U(f) \leq U\left( {f,P} \right)$ for every $P$, $\left| {L(f) - U(f)} \right| \leq U\left( {f,P} \right) - L\left( {f,P} \right) < \varepsilon$. Hence $L(f) = U(f)$.
>
> **(4) =\> (5).** Choose partitions $P,Q$ with $L(f) - \frac{\varepsilon}{2} < L\left( {f,P} \right)$ and $U\left( {f,Q} \right) < U(f) + \frac{\varepsilon}{2}$. For the common refinement $P \cup Q$,
>
> $$
> L(f) - \frac{\varepsilon}{2} < L\left( {f,P} \right) \leq L\left( {f,P \cup Q} \right) \leq U\left( {f,P \cup Q} \right) \leq U\left( {f,Q} \right) < U(f) + \frac{\varepsilon}{2},
> $$
>
> whence its upper-minus-lower sum is below $\varepsilon$.
>
> **(5) =\> (3).** Fix $P_{0}$ with $U\left( {f,P_{0}} \right) - L\left( {f,P_{0}} \right) < \frac{\varepsilon}{2}$. Let $\left| {f(x)} \right| \leq B$ and choose $\delta = \frac{\varepsilon}{8mB}$, where $m$ is the number of subintervals of $P_{0}$. For any $P$ with $\left\| P \right\| < \delta$, let $Q = P \cup P_{0}$. The refinement lemma bounds both changes by $2mB\delta \leq \frac{\varepsilon}{4}$. Together with $L\left( {f,P_{0}} \right) \leq L\left( {f,Q} \right) \leq U\left( {f,Q} \right) \leq U\left( {f,P_{0}} \right)$ this gives $U\left( {f,P} \right) - L\left( {f,P} \right) < \varepsilon$.

> **Example: $x^{2}$ and the Dirichlet function**
>
> For $f(x) = x^{2}$ on $\left\lbrack {0,1} \right\rbrack$ and the regular partition $P_{n}$ with $n$ intervals,
>
> $$
> U\left( {f,P_{n}} \right) = \sum\limits_{k = 1}^{{n{(\frac{k}{n})}}^{2}}\left( \frac{1}{n} \right) = \frac{2n^{3} + 3n^{2} + n}{6n^{3}},
> $$
> $$
> L\left( {f,P_{n}} \right) = \sum\limits_{k = 0}^{n - 1}\left( \frac{k}{n} \right)^{2}\left( \frac{1}{n} \right) = \frac{2n^{3} - 3n^{2} + n}{6n^{3}}.
> $$
>
> Both tend to $\frac{1}{3}$, so $x^{2}$ is Darboux and hence Riemann integrable, with $\int_{0}^{1}x^{2}\, dx = \frac{1}{3}$.
>
> For $D(x) = 1$ on $\mathbb{Q}$ and $0$ on $\mathbb{R} \smallsetminus \mathbb{Q}$, every subinterval contains rationals and irrationals, so every partition has $U\left( {D,P} \right) = 1$ and $L\left( {D,P} \right) = 0$. Therefore it is neither Darboux nor Riemann integrable, although it is Lebesgue integrable and $\int_{0}^{1}D(x)\, dx = 0$.

> **Theorem: Linearity of integration**
>
> If $f,g:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ are Riemann integrable and $c \in \mathbb{R}$, then $cf$ and $f + g$ are Riemann integrable and
>
> $$
> \int_{a}^{b}cf = c\int_{a}^{b}f,\quad\int_{a}^{b{({f + g})}} = \int_{a}^{b}f + \int_{a}^{b}g.
> $$

> **Proof**
>
> This follows from linearity of Riemann sums: $S\left( {cf, \cdot P} \right) = cS\left( {f, \cdot P} \right)$ and $S\left( {f + g, \cdot P} \right) = S\left( {f, \cdot P} \right) + S\left( {g, \cdot P} \right)$.

> **Theorem: Monotonicity of integration**
>
> If $f,g:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ are Riemann integrable and $f(x) \leq g(x)$ for all $x \in \left\lbrack {a,b} \right\rbrack$, then
>
> $$
> \int_{a}^{b}f \leq \int_{a}^{b}g.
> $$

> **Proof**
>
> For every partition $P$, $U\left( {f,P} \right) \leq U\left( {g,P} \right)$, hence $U(f) \leq U(g)$.

> **Theorem: Monotone functions are integrable**
>
> If $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ is monotone on $\left\lbrack {a,b} \right\rbrack$, then $f$ is Riemann integrable on $\left\lbrack {a,b} \right\rbrack$.

> **Proof**
>
> WLOG suppose $f$ is increasing. Given $\varepsilon > 0$, take any partition $P = \left( x_{k} \right)_{k = 0}^{n}$ with $\left\| P \right\| < \frac{\varepsilon}{f(b) - f(a)}$. Then
>
> $$
> U\left( {f,P} \right) - L\left( {f,P} \right) = \sum\limits_{k = 1}^{n{({\sup f{\lbrack I_{k}\rbrack} - \inf f{\lbrack I_{k}\rbrack}})}}\Delta x_{k} = \sum\limits_{k = 1}^{n{({f{(x_{k})} - f{(x_{k - 1})}})}}\Delta x_{k}
> $$
> $$
> \leq \sum\limits_{k = 1}^{n{({f{(x_{k})} - f{(x_{k - 1})}})}}\frac{\varepsilon}{f(b) - f(a)} = \varepsilon.
> $$

## Measure-zero criterion, FTC, and rules (L18)

> **Definition: Zero-measure set**
>
> $A \subset \mathbb{R}$ has measure zero if, for every $\varepsilon > 0$, there is a sequence of open intervals $\left( \left( {a_{k},b_{k}} \right) \right)_{k \in \ \mathbb{N}}$ such that
>
> $$
> A \subset \cup_{k \in \ \mathbb{N}}\left( {a_{k},b_{k}} \right),\quad\sum\limits_{k = 1}^{\infty{({b_{k} - a_{k}})}} < \varepsilon.
> $$
>
> 注：zero measure 的意义是这个集合的 length 是 $0$。它可以是无限甚至 uncountable 的，但能由一串很窄的开区间覆盖；例如 Cantor set， $|F| = c$, 但它是 zero measure。

> **Theorem: Lebesgue's characterization of integrability**
>
> A bounded function $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ is Riemann integrable iff the set of discontinuities of $f$ has measure zero. （$f$ 的非连续点是零测的。）

> **Remark: Consequences of the criterion**
>
> 任何 countable 的 $A \subset \mathbb{R}$ 都 has measure zero，因此任何只有 countably many discontinuities 的函数都是 Riemann integrable，例如 Thomae's function. Last time: monotone functions are Riemann integrable.

> **Lemma: Uniform-continuity oscillation estimate**
>
> Let $g:\left\lbrack {c,d} \right\rbrack\rightarrow\mathbb{R}$. Suppose there are $\varepsilon,\delta > 0$ such that $\left| {g(x) - g(y)} \right| < \varepsilon$ whenever $x,y \in \left\lbrack {c,d} \right\rbrack$ and $\left| {x - y} \right| \leq \delta$. Then $g$ is bounded, and
>
> $$
> \sup(g) - \inf(g) \leq \left( {\frac{d - c}{\delta} + 1} \right)\varepsilon.
> $$

> **Proof**
>
> Given $x < y$, choose least $n$ with $\frac{d - c}{\delta} \leq n$, so $n < 1 + \frac{d - c}{\delta}$, and set $z_{k} = x + \frac{k\left( {y - x} \right)}{n}$. Each increment is at most $\delta$, hence
>
> $$
> \left| {g(x) - g(y)} \right| \leq \sum\limits_{k = 1}^{n}\left| {g\left( z_{k} \right) - g\left( z_{k - 1} \right)} \right| < n\varepsilon < \left( {\frac{d - c}{\delta} + 1} \right)\varepsilon.
> $$
>
> Since $x,y$ are arbitrary, the claim follows.

> **Theorem: Composition theorem**
>
> Let $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ be integrable on $\left\lbrack {a,b} \right\rbrack$, and suppose $g:\mathbb{R}\rightarrow\mathbb{R}$ is continuous. Then $g ○ f$ is integrable on $\left\lbrack {a,b} \right\rbrack$.

> **Proof**
>
> Since $f$ is integrable it is bounded, so choose a closed bounded interval $I \supseteq f\left( \left\lbrack {a,b} \right\rbrack \right)$. Then $g$ is uniformly continuous on $I$. Given $\varepsilon > 0$, choose $\delta > 0$ so that
>
> $$
> \left| {x - y} \right| < \delta\Rightarrow\left| {g(x) - g(y)} \right| < \frac{\varepsilon}{2\left( {b - a} \right)}.
> $$
>
> Choose $P$ with $U\left( {f,P} \right) - L\left( {f,P} \right) < \delta\left( {b - a} \right)$. Apply the lemma on every $\left\lbrack {\inf f\left\lbrack I_{k} \right\rbrack,\sup f\left\lbrack I_{k} \right\rbrack} \right\rbrack$ to estimate its $g ○ f$ oscillation. Then
>
> $$
> U\left( {g ○ f,P} \right) - L\left( {g ○ f,P} \right) \leq \frac{\varepsilon}{2\delta\left( {b - a} \right)}\left( {U\left( {f,P} \right) - L\left( {f,P} \right)} \right) + \sum\limits_{k = 1}^{n}\frac{\varepsilon}{2\left( {b - a} \right)}\Delta x_{k} < \varepsilon.
> $$

> **Corollary: Continuous functions and products**
>
> Continuous functions are integrable: take $g(x) = x$ in the composition theorem. If $f$ and $g$ are integrable, then $fg$ is integrable, because
>
> $$
> fg = \frac{1}{2}\left( {\left( {f + g} \right)^{2} - f^{2} - g^{2}} \right)
> $$
>
> and $h(x) = x^{2}$ is continuous.

> **Theorem: Additional properties of the integral**
>
> If $f$ is integrable on $\left\lbrack {a,b} \right\rbrack$, then $|f|$ is integrable and
>
> $$
> \left| {\int_{a}^{b}f} \right| \leq \int_{a}^{b}|f|.
> $$
>
> If $a < c < b$, then $f$ is integrable on $\left\lbrack {a,b} \right\rbrack$ iff it is integrable on both $\left\lbrack {a,c} \right\rbrack$ and $\left\lbrack {c,b} \right\rbrack$, and
>
> $$
> \int_{a}^{b}f = \int_{a}^{c}f + \int_{c}^{b}f.
> $$
>
> More generally, the L18 p.2 restriction construction says: if $\left\lbrack {c,d} \right\rbrack \subset \left\lbrack {a,b} \right\rbrack$ and
>
> $$
> g(x) = \left\{ \begin{matrix}
> {f(x)} & {x \in \left\lbrack {c,d} \right\rbrack} \\
> 0 & {x \in \left\lbrack {a,b} \right\rbrack \smallsetminus \left\lbrack {c,d} \right\rbrack}
> \end{matrix} \right.,
> $$
>
> then $g = f\chi_{\lbrack{c,d}\rbrack}$, where
>
> $$
> \chi_{A{(x)}} = \left\{ \begin{matrix}
> 1 & {x \in A} \\
> 0 & {x \notin A}
> \end{matrix} \right.,
> $$
>
> is the characteristic function of $A \subset \mathbb{R}$, and
>
> $$
> \int_{c}^{d}f = \int_{a}^{b}g = \int_{a}^{b}f\chi_{\lbrack{c,d}\rbrack}.
> $$
>
> Altering $f$ at finitely many points does not change integrability or the integral. Equivalently, if $f$ is integrable and
>
> $$
> g(x) = f(x)\ \text{for all but finitely many}\ x \in \left\lbrack {a,b} \right\rbrack,
> $$
>
> then $g$ is integrable and $\int_{a}^{b}f = \int_{a}^{b}g$. The proof uses uniform continuity to make the changed finite-point contributions arbitrarily small.

## Fundamental Theorem of Calculus

> **Theorem: FTC I**
>
> Suppose $F:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ is continuous on $\left\lbrack {a,b} \right\rbrack$, differentiable on $\left( {a,b} \right)$, and $F'$ is Riemann integrable on $\left\lbrack {a,b} \right\rbrack$. Then
>
> $$
> \int_{a}^{b}F^{'{(x)}}\, dx = F(b) - F(a).
> $$
>
> Notation: $F(b) - F(a) = F(x)|_{a}^{b}$.

> **Proof**
>
> Given a partition $P = \left( x_{k} \right)_{k = 0}^{n}$ with $U\left( {F',P} \right) - L\left( {F',P} \right) < \varepsilon$, MVT supplies $t_{k} \in I_{k}$ with
>
> $$
> F^{'{(t_{k})}} = \frac{F\left( x_{k} \right) - F\left( x_{k - 1} \right)}{x_{k} - x_{k - 1}}.
> $$
>
> Thus
>
> $$
> F(b) - F(a) = \sum\limits_{k = 1}^{n{({F{(x_{k})} - F{(x_{k - 1})}})}} = \sum\limits_{k = 1}^{n}F^{'{(t_{k})}}\Delta x_{k} = S\left( {F', \cdot P} \right).
> $$
>
> Since $L\left( {F',P} \right) \leq S\left( {F', \cdot P} \right) \leq U\left( {F',P} \right)$, the difference between $\int_{a}^{b}F'$ and $F(b) - F(a)$ is below $\varepsilon$.

> **Theorem: FTC II**
>
> Let $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ be Riemann integrable and define
>
> $$
> F(x) = \int_{a}^{x}f(t)\, dt,\quad a \leq x \leq b.
> $$
>
> Then $F$ is uniformly continuous on $\left\lbrack {a,b} \right\rbrack$. If $f$ is continuous at $x_{0} \in \left( {a,b} \right)$, then $F$ is differentiable at $x_{0}$ and $F^{'{(x_{0})}} = f\left( x_{0} \right)$.

> **Proof**
>
> Fix $B$ with $\left| {f(x)} \right| \leq B$. If $0 < x - y < \delta = \frac{\varepsilon}{B}$, then
>
> $$
> \left| {F(x) - F(y)} \right| = \left| {\int_{y}^{x}f(t)\, dt} \right| \leq \int_{y}^{x}\left| {f(t)} \right|\, dt \leq B\left( {x - y} \right) < \varepsilon,
> $$
>
> so $F$ is uniformly continuous. At a continuity point $x_{0}$,
>
> $$
> \frac{F(x) - F\left( x_{0} \right)}{x - x_{0}} - f\left( x_{0} \right) = \frac{1}{x - x_{0}}\int_{x_{0}}^{x{({f{(t)} - f{(x_{0})}})}}\, dt.
> $$
>
> Given $\varepsilon > 0$, continuity gives $\delta > 0$ with $\left| {f(t) - f\left( x_{0} \right)} \right| < \varepsilon$ whenever $\left| {t - x_{0}} \right| < \delta$. Thus, for $x \in V_{\delta{(x_{0})}}$ and $x \neq x_{0}$,
>
> $$
> \left| {\frac{F(x) - F\left( x_{0} \right)}{x - x_{0}} - f\left( x_{0} \right)} \right| \leq \frac{1}{\left| {x - x_{0}} \right|}\left| {\int_{x_{0}}^{x{({f{(t)} - f{(x_{0})}})}}\, dt} \right| \leq \frac{1}{\left| {x - x_{0}} \right|}\int_{x_{0}}^{x}\varepsilon\, dt = \varepsilon.
> $$
>
> Therefore $F^{'{(x_{0})}} = f\left( x_{0} \right)$.
>
> Note: $f$ 在 $x_{0}$ 处 continuous 是 FTC II 中很重要的条件。

> **Example: FTC examples and caveats**
>
> $$
> g(x) = \int_{0}^{x}\cos\left( t^{2} \right)\, dt
> $$
>
> is an antiderivative of $f(x) = \cos x^{2}$ on $\mathbb{R}$ because $f$ is continuous. Also
>
> $$
> \frac{d}{dx}\int_{0}^{x}e^{t^{2}}\, dt = e^{x^{2}},
> $$
>
> though the integral generally cannot be written in elementary closed form. By the chain rule,
>
> $$
> \frac{d}{dx}\int_{0}^{x^{3}}\sin t\, dt = \sin\left( x^{3} \right) \cdot 3x^{2}.
> $$
>
> More generally,
>
> $$
> \frac{d}{dx}\int_{a}^{g{(x)}}f(t)\, dt = f\left( {g(x)} \right)g^{'{(x)}}
> $$
>
> if $f$ is Riemann integrable and continuous where needed.
>
> FTC says differentiation and integration can be inverse operations, but: (1) derivatives need not be integrable, for example $f(x) = x^{2}\sin\left( \frac{1}{x^{2}} \right)$ has an unbounded derivative; (2) indefinite integrals need not be antiderivatives (Thomae's function has no antiderivative), while an integral has constant zero.

> **Theorem: Integration by parts**
>
> If $u,v$ are continuous on $\left\lbrack {a,b} \right\rbrack$, differentiable on $\left( {a,b} \right)$, and $u',v'$ are integrable on $\left\lbrack {a,b} \right\rbrack$, then
>
> $$
> \int_{a}^{b}u(x)v^{'{(x)}}\, dx = u(x)v(x)|_{a}^{b} - \int_{a}^{b}u^{'{(x)}}v(x)\, dx.
> $$
>
> In the shorthand, $\int u\, dv = uv - \int v\, du$.

> **Proof**
>
> Differentiate $u(x)v(x)$: $\left( {uv} \right)' = u'v + uv'$, then integrate on $\left\lbrack {a,b} \right\rbrack$ and use FTC I.

> **Theorem: Change of variables**
>
> Suppose $u = f(x)$ is a continuously differentiable function on an open interval $J$, let $I$ be an open interval with $I \supseteq f\lbrack J\rbrack$, and let $g$ be continuous on $I$. Then for $a,b \in J$,
>
> $$
> \int_{a}^{b}g\left( {f(x)} \right)f^{'{(x)}}\, dx = \int_{f{(a)}}^{f{(b)}}g(u)\, du.
> $$

> **Proof**
>
> If $G' = g$, then $\left( {G ○ f} \right)' = g ○ f \cdot f'$, so FTC I gives the equality.

# Sequences and series of functions

## Sequences of functions (L19)

> **Definition: Pointwise convergence**
>
> 令 $\left( {f_{n}:A\rightarrow\mathbb{R}} \right)_{n \in \ \mathbb{N}}$ 是一个 seq. of functions（domains 都相同）。 称 $\left( f_{n} \right)$ 在 $A$ 上 pointwise converges to $f:A\rightarrow\mathbb{R}$，记作 $\left( f_{n} \right)\rightarrow f$ on $A$，if
>
> $$
> \lim\limits_{n\rightarrow\infty}f_{n{(x)}} = f(x)\quad\text{for all}\ x \in A.
> $$
>
> 等价地，
>
> $$
> \forall a \in A,\forall\varepsilon > 0,\exists N \in \mathbb{N}\text{such that}\ \forall n > N,\left| {f_{n{(a)}} - f(a)} \right| < \varepsilon.
> $$
>
> seq. of functions 的 pointwise convergence 即：对每一点 $x \in A$， $f_{n{(x)}}\rightarrow f(x)$。

> **Example: Pointwise limits can destroy everything**
>
> On $\left\lbrack {0,1} \right\rbrack$, let $f_{n{(x)}} = x^{n}$. Then
>
> $$
> f_{n{(x)}}\rightarrow f(x) = \left\{ \begin{matrix}
> 0 & {x \in \left\lbrack {0,1} \right)} \\
> 1 & {x = 1}
> \end{matrix} \right..
> $$
>
> Every $f_{n}$ is continuous and differentiable，但 $f$ is discontinuous。 因而 pointwise conv. 不 preserve continuity & differentiability。
>
> L19 p.1 draws the family $x,x^{2},x^{3},\ldots$ rising from $\left( {0,0} \right)$ to $\left( {1,1} \right)$, with the limiting graph equal to $0$ before the endpoint and $1$ at the endpoint. The graph information is equivalently captured by
>
>   ------------------------------------ ---------------------- --------------------------------------------------------
>   $x \in \left\lbrack {0,1} \right)$   $x = 1$                limit graph
>   $x^{n}\rightarrow 0$                 $x^{n}\rightarrow 1$   $f = 0$ on $\left\lbrack {0,1} \right)$ and $f(1) = 1$
>   ------------------------------------ ---------------------- --------------------------------------------------------
>
> .
>
> Write $\mathbb{Q} \cap \left\lbrack {0,1} \right\rbrack = \left\{ {q_{n}:n \in \mathbb{N}} \right\}$（$q_{n}$ 可以任意排序）。Let
>
> $$
> f_{n{(x)}} = \left\{ \begin{matrix}
> 1 & {x \in \left\{ {q_{1},\ldots,q_{n}} \right\}} \\
> {0\ } & \text{otherwise}
> \end{matrix} \right..
> $$
>
> Then $\left( f_{n} \right)\rightarrow D|_{\lbrack{0,1}\rbrack}$ (Dirichlet's function). Each $f_{n}$ is Riemann integrable, but $D|_{\lbrack{0,1}\rbrack}$ is not；因而 pointwise conv. 不 preserve integrability.
>
> On $\left\lbrack {0,2} \right\rbrack$, let
>
> $$
> f_{n{(x)}} = \left\{ \begin{matrix}
> {n^{2}x} & {0 \leq x \leq \frac{1}{n}} \\
> {2n - n^{2}x} & {\frac{1}{n} < x < \frac{2}{n}} \\
> 0 & {\frac{2}{n} \leq x}
> \end{matrix} \right.
> $$
>
> Each triangular spike has area $\left( \frac{1}{2} \right)\left( \frac{2}{n} \right)n = 1$, so $\int_{0}^{2}f_{n{(x)}}\, dx = 1$ for every $n$. Pointwise $f_{n}\rightarrow 0$, hence
>
> $$
> \lim\limits_{n\rightarrow\infty}\int_{0}^{2}f_{n{(x)}}\, dx = 1 \neq \int_{0}^{2}\lim\limits_{n\rightarrow\infty}f_{n{(x)}}\, dx = 0.
> $$
>
> 因而 pointwise convergence 不 preserve the limit of an integral。
>
> The p.1 spike picture has base $\left\lbrack {0,\frac{2}{n}} \right\rbrack$, apex $\left( {\frac{1}{n},n} \right)$, and area $1$:
>
>   ------------- --------------- ---------------
>   $0$           $\frac{1}{n}$   $\frac{2}{n}$
>   $f_{n} = 0$   $f_{n} = n$     $f_{n} = 0$
>   left edge     apex            right edge
>   ------------- --------------- ---------------
>
> .
>
> On $\mathbb{R}$, let $f_{n{(x)}} = \frac{\sin\left( {2\pi nx} \right)}{2\pi n}$. Then $f_{n}^{'{(x)}} = \cos\left( {2\pi nx} \right)$, $f_{n{(x)}}\rightarrow f(x) = 0$, yet $f_{n}^{'{(0)}} = 1$ for all $n$ while $f^{'{(0)}} = 0$. Thus
>
> $$
> \lim\limits_{n\rightarrow\infty}f_{n}^{'{(0)}} \neq f^{'{(0)}}:
> $$
>
> pointwise convergence 不 preserve the limit of a derivative。
>
> 因而 pointwise limit can destroy continuity, differentiability, and integrability；即使不 destroy，也不 reserve the value of an integral / derivative。pointwise convergence 是局部的逐点性质，不是整体性质： 在每个 $x \in A$，$f_{n{(x)}}\rightarrow f(x)$，最后的 $f$ 由每个 $x$ 的极限拼接而成。 若想让 convergence 更好地保留整体性质，就需要更强的定义。

> **Definition: Uniform convergence**
>
> 令 $\left( {f_{n}:A\rightarrow\mathbb{R}} \right)_{n \in \ \mathbb{N}}$ 是一个 seq. of functions。称 $\left( f_{n} \right)$ 在 $A$ 上 uniformly converges to $f:A\rightarrow\mathbb{R}$，if
>
> $$
> \forall\varepsilon > 0,\exists N \in \mathbb{N}\text{such that}\ \forall x \in A\ \text{and}\ n \geq N,\left| {f_{n{(x)}} - f(x)} \right| < \varepsilon.
> $$
>
> 两个 definitions 的 distinction 是：
>
> $$
> \text{pointwise}:\forall x \in A,\forall\varepsilon > 0,\exists N \in \mathbb{N}\text{such that}\ \left| {f_{n{(x)}} - f(x)} \right| < \varepsilon\ \text{whenever}n \geq N;
> $$
> $$
> \text{uniform}:\forall\varepsilon > 0,\exists N \in \mathbb{N}\text{such that}\ \forall x \in A,\left| {f_{n{(x)}} - f(x)} \right| < \varepsilon\ \text{whenever}n \geq N.
> $$
>
> pointwise 是逐点各自使用自己的 $\varepsilon$ bound；uniform 是一个 $\varepsilon$ bound 所有 $x \in A$ 共用，把 $A$ 中所有点作为整体联系起来。

> **Theorem: Uniform convergence and uniformly Cauchy**
>
> $\left( {f_{n}:A\rightarrow\mathbb{R}} \right)$ converges uniformly iff it is uniformly Cauchy on $A$, i.e. for every $\varepsilon > 0$ there is $N$ such that
>
> $$
> \left| {f_{n{(x)}} - f_{m{(x)}}} \right| < \varepsilon
> $$
>
> for all $x \in A$ and $m,n \geq N$.

> **Proof**
>
> If $f_{n}\rightarrow f$ uniformly, choose $N$ such that $\left| {f_{n{(x)}} - f(x)} \right| < \frac{\varepsilon}{2}$ for $x \in A,n \geq N$. Then
>
> $$
> \left| {f_{n{(x)}} - f_{m{(x)}}} \right| \leq \left| {f_{n{(x)}} - f(x)} \right| + \left| {f_{m{(x)}} - f(x)} \right| < \varepsilon.
> $$
>
> Conversely, uniformly Cauchy implies each scalar sequence $\left( f_{n{(x)}} \right)$ is Cauchy, so define $f(x) = \lim_{n\rightarrow\infty}f_{n{(x)}}$. Choose $N$ with $\left| {f_{n{(x)}} - f_{m{(x)}}} \right| < \frac{\varepsilon}{2}$ for all $x$ and $m,n \geq N$; taking $m\rightarrow\infty$ shows $\left| {f_{n{(x)}} - f(x)} \right| \leq \varepsilon$ for all $x,n \geq N$.

> **Theorem: A uniform limit of continuous functions is continuous**
>
> If $\left( {f_{n}:A\rightarrow\mathbb{R}} \right)\rightarrow f$ uniformly and $f_{n}$ is continuous at $a$ for every $n \in \mathbb{N}$, then $f$ is continuous at $a$. In symbols,
>
> $$
> \lim\limits_{x\rightarrow a}\lim\limits_{n\rightarrow\infty}f_{n{(x)}} = \lim\limits_{n\rightarrow\infty}\lim\limits_{x\rightarrow a}f_{n{(x)}}.
> $$

> **Proof**
>
> Let $\varepsilon > 0$. Uniform convergence supplies $N$ with $\left| {f_{N{(x)}} - f(x)} \right| < \frac{\varepsilon}{3}$ for all $x \in A$. By continuity of $f_{N}$ at $a$, choose $\delta > 0$ such that $\left| {f_{N{(x)}} - f_{N{(a)}}} \right| < \frac{\varepsilon}{3}$ if $\left| {x - a} \right| < \delta$. Then
>
> $$
> \left| {f(x) - f(a)} \right| \leq \left| {f(x) - f_{N{(x)}}} \right| + \left| {f_{N{(x)}} - f_{N{(a)}}} \right| + \left| {f_{N{(a)}} - f(a)} \right| < \varepsilon.
> $$

> **Theorem: Uniform limit of integrable functions is integrable**
>
> Suppose $\left( {f_{n}:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}} \right)\rightarrow f$ uniformly on $\left\lbrack {a,b} \right\rbrack$. If every $f_{n}$ is Riemann integrable, then $f$ is integrable and
>
> $$
> \int_{a}^{b}\lim\limits_{n\rightarrow\infty}f_{n} = \int_{a}^{b}f = \lim\limits_{n\rightarrow\infty}\int_{a}^{b}f_{n}.
> $$

> **Proof**
>
> Uniform convergence makes $\left( f_{n} \right)$ uniformly Cauchy, so fix $N$ with $\left| {f_{m{(x)}} - f_{n{(x)}}} \right| < \frac{\varepsilon}{b - a}$ for all $x \in \left\lbrack {a,b} \right\rbrack$ and $m,n \geq N$. Then
>
> $$
> \left| {\int_{a}^{b}f_{m} - \int_{a}^{b}f_{n}} \right| < \varepsilon,
> $$
>
> so $\left( {\int_{a}^{b}f_{n}} \right)$ is Cauchy and converges, say to $\ell$. Take $n$ sufficiently large so that $\left| {\int_{a}^{b}f_{n} - \ell} \right| < \frac{\varepsilon}{3}$, $\left| {f_{n{(x)}} - f(x)} \right| < \frac{\varepsilon}{3\left( {b - a} \right)}$ for all $x$, and a partition $P$ with $U\left( {f_{n},P} \right) - L\left( {f_{n},P} \right) < \frac{\varepsilon}{3}$. The uniform bound gives
>
> $$
> \left| {U\left( {f,P} \right) - U\left( {f_{n},P} \right)} \right| \leq \sum\limits_{k = 1}^{m{({\sup f{\lbrack I_{k}\rbrack} - \sup f_{n{\lbrack I_{k}\rbrack}}})}}\Delta x_{k} \leq \frac{\varepsilon}{3},
> $$
>
> and then $\left| {U\left( {f,P} \right) - \ell} \right| < \varepsilon$; likewise $\left| {L\left( {f,P} \right) - \ell} \right| < \varepsilon$. Since $\varepsilon$ is arbitrary, $\int_{a}^{b}f = \ell$.

> **Theorem: Uniform limit of a derivative sequence**
>
> Suppose $\left( {f_{n}:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}} \right)_{n \in \ \mathbb{N}}$ is a sequence of $C^{1}$ functions, $\left( f_{n} \right)\rightarrow f$ pointwise on $\left\lbrack {a,b} \right\rbrack$, and $\left( f_{n}' \right)$ converges uniformly on $\left\lbrack {a,b} \right\rbrack$. Then $f \in C^{1}$ and
>
> $$
> f' = \lim\limits_{n\rightarrow\infty}f_{n}'
> $$
>
> on $\left\lbrack {a,b} \right\rbrack$.

> **Proof**
>
> Write $g = \lim_{n\rightarrow\infty}f_{n}'$. Each $f_{n}'$ is continuous and integrable, so $g$ is continuous and integrable by the preceding theorems. For $x \in \left\lbrack {a,b} \right\rbrack$,
>
> $$
> \int_{a}^{x}g = \int_{a}^{x}\lim\limits_{n\rightarrow\infty}f_{n}' = \lim\limits_{n\rightarrow\infty}\int_{a}^{x}f_{n}' = \lim\limits_{n\rightarrow\infty}\left( {f_{n{(x)}} - f_{n{(a)}}} \right) = f(x) - f(a).
> $$
>
> FTC II now gives $f' = g$. The lecture notes that this theorem has many conditions and presents a stronger version.

> **Theorem: Stronger uniform-convergence derivative theorem**
>
> Let $\left( {f_{n}:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}} \right)_{n \in \ \mathbb{N}}$ with every $f_{n} \in C^{1}$. Suppose there is a point $x_{0} \in \left\lbrack {a,b} \right\rbrack$ such that $\left( f_{n{(x_{0})}} \right)$ converges, and $\left( f_{n}' \right)\rightarrow g$ uniformly. Then $\left( f_{n} \right)\rightarrow f$ uniformly for some $f \in C^{1}$, where $f' = g$.

> **Proof**
>
> Uniform convergence of the derivatives gives, for $m,n \geq N$,
>
> $$
> \left| {f_{n}^{'{(x)}} - f_{m}^{'{(x)}}} \right| < \frac{\varepsilon}{2\left( {b - a} \right)}
> $$
>
> for all $x$. Pointwise convergence at $x_{0}$ gives $\left| {f_{n{(x_{0})}} - f_{m{(x_{0})}}} \right| < \frac{\varepsilon}{2}$. Thus, for arbitrary $x$,
>
> $$
> \left| {f_{n{(x)}} - f_{m{(x)}}} \right| \leq \left| {f_{n{(x_{0})}} - f_{m{(x_{0})}}} \right| + \left| {\int_{x_{0}}^{x{({f_{n}^{'{(t)}} - f_{m}^{'{(t)}}})}}\, dt} \right| < \varepsilon.
> $$
>
> So $\left( f_{n} \right)$ is uniformly Cauchy, hence uniformly convergent. Letting limits in the displayed FTC identity gives
>
> $$
> f(x) = f\left( x_{0} \right) + \int_{x_{0}}^{x}g(t)\, dt,
> $$
>
> and FTC II yields $f' = g$.

> **Remark: Summary**
>
> 1.  A uniform limit of continuous $\left( f_{n} \right)$ is continuous.
> 2.  Under suitable conditions,
>
> $$
> \int_{a}^{b}\lim\limits_{n\rightarrow\infty}f_{n} = \lim\limits_{n\rightarrow\infty}\int_{a}^{b}f_{n},\quad\frac{d}{dx}\left( {\lim\limits_{n\rightarrow\infty}f_{n{(x)}}} \right) = \lim\limits_{n\rightarrow\infty}\frac{d}{dx}f_{n{(x)}}.
> $$
>
> Since differentiation and integration are very basic operations, the uniform-convergence hypotheses ensure the desired stability.

## Series of functions and power series (L20)

> **Definition: Series of functions**
>
> If $\left( {f_{k}:A\rightarrow\mathbb{R}} \right)_{k \in \ \mathbb{N}}$ is a sequence of functions, then $\left( {\sum_{k = 1}^{n}f_{k}} \right)_{n \in \ \mathbb{N}}$ is its sequence of partial sums. Write $\sum f_{k}$ or $\sum_{k = 1}^{\infty}f_{k}$ for the infinite series determined by $\left( f_{k} \right)$.
>
> On $B \subset A$, the following are definitions:
>
> 1.  $\sum f_{k}$ **converges** on $B$ iff, for every $x \in B$, $\lim_{n\rightarrow\infty}\sum_{k = 1}^{n}f_{k{(x)}}$ exists; equivalently there is $f:B\rightarrow\mathbb{R}$ with $\left( {\sum_{k = 1}^{n}f_{k}} \right)\rightarrow f$ pointwise.
> 2.  It converges **uniformly** on $B$ iff those partial sums converge uniformly to some $f:B\rightarrow\mathbb{R}$.
> 3.  It converges **absolutely** on $B$ iff $\sum_{k = 1}^{\infty}\left| f_{k{(x)}} \right|$ converges at every $x \in B$; equivalently $\sum\left| f_{k} \right|$ converges on $B$.

> **Theorem: Term-by-term operations for a function series**
>
> 1.  If every $f_{k}$ is continuous on $A$ and $\sum f_{k}\rightarrow S$ uniformly on $A$, then $S$ is continuous on $A$.
>
> 2.  If every $f_{k}$ is continuous on $\left\lbrack {a,b} \right\rbrack$ and $\sum f_{k}\rightarrow S$ uniformly on $\left\lbrack {a,b} \right\rbrack$, then $S$ is integrable and
>
>     $$
>     \int_{a}^{b}S = \sum\limits_{k = 1}^{\infty}\int_{a}^{b}f_{k}.
>     $$
>
> 3.  If every $f_{k} \in C^{1}$ on $\left\lbrack {a,b} \right\rbrack$, $\sum f_{k}\rightarrow S$ on $\left\lbrack {a,b} \right\rbrack$ (not necessarily uniformly), and $\sum f_{k}'$ converges uniformly on $\left\lbrack {a,b} \right\rbrack$, then $S \in C^{1}$ and $S' = \sum f_{k}'$.
>
> Stronger version of (3): if $f_{k} \in C^{1}$ on $\left\lbrack {a,b} \right\rbrack$, there exists $x_{0} \in \left\lbrack {a,b} \right\rbrack$ such that $\sum f_{k{(x_{0})}}$ converges, and $\sum f_{k}'$ converges uniformly on $\left\lbrack {a,b} \right\rbrack$, then $\sum f_{k}$ converges uniformly to some $S \in C^{1}$, and $S' = \sum f_{k}'$.

> **Proof**
>
> Since every partial sum is continuous, differentiable, and integrable as appropriate, apply the corresponding uniform-limit theorem to the sequence of partial sums $\left( {\sum_{k = 1}^{n}f_{k}} \right)_{n \in \ \mathbb{N}}$.

## Power series

> **Definition: Power series**
>
> For a sequence $\left( a_{n} \right)$ in $\mathbb{R}$, the power series centered at $c$ with coefficients $\left( a_{n} \right)$ is the series of functions
>
> $$
> \sum\limits_{n = 0}^{\infty}a_{n{({x - c})}}^{n}.
> $$
>
> The partial sums are polynomials. Custom: for $x \neq 0$, $0^{x} = 0$; and $x^{0} = 1$ for every $x$ (including $0^{0} = 1$).
>
> Note: the L20 pages use power series centered at $0$ in the displayed examples, but every result applies to a center $c$ by replacing $x$ with $x - c$.

> **Theorem: Cauchy-Hadamard theorem**
>
> Given a power series $\sum_{n = 0}^{\infty}a_{n}x^{n}$, let $\rho = \operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}}$. Then it converges absolutely when $|x|\rho < 1$ and diverges when $|x|\rho > 1$. Its radius of convergence is
>
> $$
> R = \frac{1}{\rho}.
> $$
>
> The set of all $x$ for which $\sum a_{n{({x - c})}}^{n}$ converges is an interval, called the interval of convergence.

> **Proof**
>
> If $|x|\operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}} < r < 1$, then for all but finitely many $n$, $|x|\left| a_{n} \right|^{\frac{1}{n}} \leq r$, so $\left| {a_{n}x^{n}} \right| \leq r^{n}$ and comparison applies. If $|x|\rho > r > 1$, then $\left| {a_{n}x^{n}} \right| > r^{n} > 1$ infinitely often, so the $n$th-term test gives divergence.

> **Remark: Endpoints and a ratio shortcut**
>
> Radius of convergence cannot imply interval of convergence: endpoints $c - R,c + R$ may or may not be included, so they must be checked separately. If $\lim_{n\rightarrow\infty}\left| \frac{a_{n + 1}}{a_{n}} \right| = \ell$ exists, then $\frac{1}{\ell}$ is the radius; this is often the best way to find $R$, but it is not more general than $\operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}}$.

> **Example: Power-series radii and intervals**
>
> 1.  For $\sum_{n = 0}^{\infty}\frac{x^{n}}{n!}$, $\left| \frac{a_{n + 1}}{a_{n}} \right| = \frac{1}{n + 1}\rightarrow 0$, hence $R = \infty$; it converges for all $x \in \mathbb{R}$, and in fact equals $e^{x}$ by Taylor.
>
> 2.  For $\sum_{n = 0}^{\infty}x^{n}$, $\rho = R = 1$; it diverges for $x = \pm 1$, so the interval is $\left( {- 1,1} \right)$, and
>
>     $$
>     \sum\limits_{n = 0}^{\infty}x^{n} = \frac{1}{1 - x}\quad\text{for}\ x \in \left( {- 1,1} \right).
>     $$
>
> 3.  The handwritten page writes $\sum_{n = 0}^{\infty}\left( \frac{1}{n} \right)x^{n}$. Its subsequent endpoint calculation treats the terms as the harmonic series from $n = 1$: $\rho = R = 1$; at $x = 1$ it diverges, and at $x = - 1$ it is alternating harmonic and converges. Thus the interval written is $\left\lbrack {- 1,1} \right)$.
>
> 4.  The handwritten page likewise writes $\sum_{n = 0}^{\infty}\left( \frac{1}{n^{2}} \right)x^{n}$; the subsequent endpoint sums begin at $n = 1$. Here $\rho = R = 1$ and both $\sum\frac{1}{n^{2}}$ and $\frac{{\sum\left( {- 1} \right)}^{n}}{n^{2}}$ converge, so the interval is $\left\lbrack {- 1,1} \right\rbrack$.
>
> 5.  For $\sum_{n = 0}^{\infty}n!x^{n}$, $\rho = \infty$, so $R = 0$ and it diverges for all $x \neq 0$.

> **Theorem: Weierstrass M-Test**
>
> Let $f_{k}:A\rightarrow\mathbb{R}$ be a sequence of functions, and let $\left( M_{k} \right)$ be a sequence in $\mathbb{R}$ such that
>
> $$
> \left| f_{k{(x)}} \right| \leq M_{k}
> $$
>
> for all $k \in \mathbb{N}$ and $x \in A$. If $\sum M_{k} < \infty$, then $\sum f_{k}$ converges uniformly and absolutely on $A$.

> **Proof**
>
> Let $g_{n{(x)}} = \sum_{k = 1}^{n}f_{k{(x)}}$. Since $\sum M_{k}$ satisfies Cauchy, choose $N$ so that $\left| {\sum_{k = m + 1}^{n}M_{k}} \right| < \varepsilon$ for $N \leq m \leq n$. Then for all $x \in A$,
>
> $$
> \left| {g_{n{(x)}} - g_{m{(x)}}} \right| = \left| {\sum\limits_{k = m + 1}^{n}f_{k{(x)}}} \right| \leq \sum\limits_{k = m + 1}^{n}\left| f_{k{(x)}} \right| \leq \sum\limits_{k = m + 1}^{n}M_{k} < \varepsilon.
> $$
>
> Thus $\left( g_{n} \right)$ is uniformly Cauchy and $\sum f_{k}$ converges uniformly; the same calculation gives uniform absolute convergence.

> **Corollary: Uniform convergence inside a radius**
>
> If $\sum a_{n}x^{n}$ has radius of convergence $R$, then for every $0 \leq K < R$, $\sum a_{n}x^{n}$ converges uniformly to a continuous function on $\left\lbrack {- K,K} \right\rbrack$. Indeed $\sum\left| a_{n} \right|K^{n} < \infty$ and $\left| {a_{n}x^{n}} \right| \leq \left| a_{n} \right|K^{n}$ on $\left\lbrack {- K,K} \right\rbrack$, so M-test applies.
>
> Consequently $f(x) = \sum a_{n}x^{n}$ is continuous on $\left( {- R,R} \right)$. However its convergence on the entire interval of convergence may not be uniform:
>
> $$
> \sum\limits_{n = 1}^{\infty}\left( {- 1} \right)^{n + 1}\frac{\left( {x - 1} \right)^{n}}{n}
> $$
>
> converges to $\ln x$ on $\left( {0,2} \right\rbrack$ as written in the source note, but the convergence is not uniform there (the graph marks the unbounded behavior at $x = 0$). Fact: a uniform limit of uniformly continuous functions is uniformly continuous.

> **Theorem: Abel's theorem**
>
> 1.  If a power series $\sum_{k = 1}^{\infty}a_{k}x^{k}$ converges at $x = x_{0}$, then it converges uniformly on $\left( {- \left| x_{0} \right|,\left| x_{0} \right|} \right)$. If it diverges at $x_{0}$, then it diverges on $\left( {- \infty, - \left| x_{0} \right|} \right) \cup \left( {\left| x_{0} \right|,\infty} \right)$.
> 2.  If a power series has radius of convergence $R$, then convergence at an endpoint of its radius implies convergence at every point between that endpoint and $0$; divergence at an endpoint implies divergence on the corresponding exterior ray.
>
> Note: the convergence of $\sum a_{n}x^{n}$ on its interval of convergence may not be uniform.

> **Proof**
>
> 提示一下，下边（略）。

> **Theorem: Term-by-term integration and differentiation of power series**
>
> Let $\sum_{n = 0}^{\infty}a_{n}x^{n}$ have radius of convergence $R > 0$ and let $f(x) = \sum_{n = 0}^{\infty}a_{n}x^{n}$ for $x \in \left( {- R,R} \right)$.
>
> 1.  For every $\left\lbrack {a,b} \right\rbrack \subset \left( {- R,R} \right)$, $f$ is integrable and
>
>     $$
>     \int_{a}^{b}f = \sum\limits_{n = 0}^{\infty}\int_{a}^{b}a_{n}x^{n}\, dx.
>     $$
>
> 2.  The power series $\sum_{n = 1}^{\infty}na_{n}x^{n - 1}$ has radius $R$, $f$ is differentiable on $\left( {- R,R} \right)$, and
>
>     $$
>     f^{'{(x)}} = \sum\limits_{n = 1}^{\infty}na_{n}x^{n - 1}.
>     $$

> **Proof**
>
> \(i\) follows from integrability of polynomials and uniform convergence of $\sum a_{n}x^{n}$ on $\left\lbrack {a,b} \right\rbrack$. For (ii), for $t \neq 0$,
>
> $$
> \operatorname{lim\, sup}\left| {\frac{n}{t}a_{n}} \right|^{\frac{1}{n}} = \left| \frac{1}{t} \right|\operatorname{lim\, sup}\left| {na_{n}} \right|^{\frac{1}{n}} = \left| \frac{1}{t} \right|\operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}},
> $$
>
> so the differentiated series has radius $R$; its uniform convergence on compact subintervals and the preceding derivative theorem prove the claim.

> **Example: Taylor series, calculus, and its caveat**
>
> If $f \in C^{\infty}$, try to approximate $f$ near $c$ with
>
> $$
> P_{n{(x)}} = \sum\limits_{k = 0}^{n}f^{(k)}\frac{c}{k!}\left( {x - c} \right)^{k},
> $$
>
> and define
>
> $$
> T(x) = \lim\limits_{n\rightarrow\infty}P_{n{(x)}} = \sum\limits_{k = 0}^{\infty}f^{(k)}\frac{c}{k!}\left( {x - c} \right)^{k},
> $$
>
> where the domain is the interval of convergence of $T$. The source records power series
>
> $$
> e^{x} = \sum\limits_{n = 0}^{\infty}\frac{x^{n}}{n!},\quad\sin x = \sum\limits_{n = 0}^{\infty}\left( {- 1} \right)^{n}\frac{x^{2n + 1}}{\left( {2n + 1} \right)!},\quad\cos x = \sum\limits_{n = 0}^{\infty}\left( {- 1} \right)^{n}\frac{x^{2n}}{\left( {2n} \right)!}.
> $$
>
> Thus $\frac{d}{dx}\left( {\sin x} \right) = \cos x$, $\frac{d}{dx}\left( {\cos x} \right) = - \sin x$, and $\frac{d}{dx}\left( e^{x} \right) = e^{x}$; $e^{\pi i} + 1 = 0$. Termwise integration yields
>
> $$
> \int\cos\left( x^{2} \right)\, dx = \sum\limits_{n = 0}^{\infty}\frac{\left( {- 1} \right)^{n}}{\left( {2n} \right)!\left( {4n + 1} \right)}x^{4n + 1}.
> $$
>
> Remark: The Taylor expansion of $f$ may not converge to $f$ at $x = a$ even if it converges at $x = a$. Let
>
> $$
> f(x) = \left\{ \begin{matrix}
> e^{- \frac{1}{x^{2}}} & {x \neq 0} \\
> 0 & {x = 0}
> \end{matrix} \right..
> $$
>
> Then $f \in C^{\infty}$ on $\mathbb{R}$ and $f^{(n)}(0) = 0$ for all $n \in \mathbb{N}$. Its Taylor series converges everywhere, but converges to $f$ itself only at $x = 0$. If $f \in C^{\infty}$ and $T(x)\rightarrow f$ pointwise for all $x$ lies in the domain of $T$, then $f$ is a real analytic function, i.e. $f \in C^{\omega}$ ($C^{\omega} \subset C^{\infty}$).

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

# Metric spaces and compactness

## Metric spaces, norms, and topology

> **Definition: Metric space**
>
> A metric on a set $X$ is a function $d:X \times X\rightarrow\mathbb{R}$ satisfying, for all $x,y,z \in X$: $d\left( {x,y} \right) = d\left( {y,x} \right)$ (symmetry), $d\left( {x,y} \right) \geq 0$ and $d\left( {x,y} \right) = 0$ iff $x = y$ (positivity), and $d\left( {x,y} \right) \leq d\left( {x,z} \right) + d\left( {z,y} \right)$ (triangle inequality). The pair $\left( {X,d} \right)$ is called a metric space.

> **Example: Metrics recorded in the lecture**
>
> On $\mathbb{R}$, $d\left( {x,y} \right) = \left| {x - y} \right|$, and also $d\left( {x,y} \right) = \left| {\int_{x}^{y}e^{- t}\, dt} \right|$. On $\mathbb{R}^{n}$ the notes use $d_{2}\left( {x,y} \right) = \sqrt{\sum_{i = 1}^{n}\left( {x_{i} - y_{i}} \right)^{2}}$, $d_{\sup}\left( {x,y} \right) = \max_{1 \leq i \leq n}\left| {x_{i} - y_{i}} \right|$, and $d_{1}\left( {x,y} \right) = \sum_{i = 1}^{n}\left| {x_{i} - y_{i}} \right|$. In $\mathbb{R}^{2}$, their unit balls are the circle, square, and diamond, labelled $\ell^{2}$ (Euclidean), supremum, and $\ell^{1}$ metrics.
>
> For $C\left( \left\lbrack {0,1} \right\rbrack \right)$, the lecture also writes $d\left( {f,g} \right) = \sup_{t \in {\lbrack{0,1}\rbrack}}\left| {f(t) - g(t)} \right|$ and $d\left( {f,g} \right) = \int_{0}^{1}\left| {f(t) - g(t)} \right|\, dt$.

> **Definition: Neighborhoods, open and closed sets**
>
> In a metric space $\left( {X,d} \right)$, the $\varepsilon$-neighborhood of $x_{0}$ is $B_{\varepsilon{(x_{0})}} = \left\{ x \in X\  \middle| \ d\left( {x,x_{0}} \right) < \varepsilon \right\}$. A set $\Omega \subseteq X$ is open when every $x_{0} \in \Omega$ has an $\varepsilon > 0$ with $B_{\varepsilon{(x_{0})}} \subseteq \Omega$. A set $C \subseteq X$ is closed iff $X\backslash C$ is open.

> **Lemma: Equivalent Euclidean and supremum topologies**
>
> A set $\Omega \subseteq \mathbb{R}^{n}$ is open for the Euclidean metric iff it is open for the supremum metric.

> **Proof**
>
> The norm comparison written in the notes is $\left\| x \right\|_{\sup} \leq \left\| x \right\|_{2} \leq \sqrt{n}\left\| x \right\|_{\sup}$. Hence $B_{\varepsilon}^{\sup{(x_{0})}} \subseteq B_{\varepsilon}^{2}\left( x_{0} \right) \subseteq B_{\frac{\varepsilon}{\sqrt{n}}}^{\sup{(x_{0})}}$, which transfers the ball criterion for openness in both directions.

> **Definition: Limit point and closure**
>
> If $E \subseteq X$, a point $p \in X$ is a limit point of $E$ when $B_{\varepsilon{(p)}} \cap \left( {E\backslash\left\{ p \right\}} \right) \neq \varnothing$ for every $\varepsilon > 0$. The closure is $\bar{E} = E \cup E'$. Thus $E = \left( {0,1} \right)$ has $\bar{E} = E' = \left\lbrack {0,1} \right\rbrack$, while $E = \left( {0,1} \right) \cup \left\{ 2 \right\}$ has $E' = \left\lbrack {0,1} \right\rbrack$ and $\bar{E} = \left\lbrack {0,1} \right\rbrack \cup \left\{ 2 \right\}$.

> **Lemma: Closure facts**
>
> For $E \subseteq X$, the set $\bar{E}$ is closed; $E = \bar{E}$ iff $E$ is closed; and if $E \subseteq F$ with $F$ closed, then $\bar{E} \subseteq F$. Thus the closure is the smallest closed set containing $E$.

> **Proof**
>
> If $q \notin \bar{E}$, then some $B_{\varepsilon{(q)}}$ misses $E$; consequently $X\backslash\bar{E}$ is open. If $E$ is closed, every point outside $E$ has such a ball, hence $E' \subseteq E$. Conversely, $E = \bar{E}$ is closed. The final assertion follows because a point of $F^{c}$ has a ball disjoint from $E$.

> **Lemma: Supremum in the closure**
>
> If $E \subseteq \mathbb{R}$ is nonempty and bounded above, then $\sup E \in \bar{E}$. In particular, if $E$ is closed, $\sup E \in E$; similarly a closed bounded-below set contains its infimum.

## Compactness in $\mathbb{R}^{n}$

> **Definition: Open cover and compactness**
>
> An open cover of $E \subseteq X$ is a family $\left\{ U_{\alpha} \right\}_{\alpha} \in I$ of open sets such that $E \subseteq \cup_{\alpha \in I}U_{\alpha}$. The set $E$ is compact if every open cover has a finite subcover. A set is bounded when it lies in some $B_{r{(x_{0})}}$.

> **Theorem: Elementary compactness consequences**
>
> Closed subsets of compact metric spaces are compact. A compact subset of a metric space is closed and bounded. A family of compact sets with every finite intersection nonempty has nonempty total intersection.

> **Proof**
>
> For the closed-subset result, adjoin $C^{c}$ to an open cover of a closed $C \subseteq K$ and discard it after taking a finite subcover of $K$. For closedness of a compact $K$, cover $K$ by the sets $\left\{ q\  \middle| \ d\left( {p,q} \right) > \frac{1}{n} \right\}_{n}$ for a fixed $p \notin K$; a finite subcover yields a ball about $p$ disjoint from $K$. For boundedness use the cover $\left\{ B_{n{(p)}} \right\}_{n \in \ \mathbb{N}}$. The finite-intersection assertion follows by applying compactness to the complementary open cover.

> **Theorem: Nested interval and box properties**
>
> If $I_{1} \supseteq I_{2} \supseteq \cdots$ is a nested sequence of closed, nonempty bounded intervals, then $\cap_{n}I_{n} \neq \varnothing$. Hence a nested sequence of closed boxes $B_{n} \subseteq \mathbb{R}^{d}$ has nonempty intersection.

> **Proof**
>
> Write $I_{n} = \left\lbrack {a_{n},b_{n}} \right\rbrack$. The increasing bounded sequence $\left( a_{n} \right)$ has a supremum $x$; then $a_{n} \leq x \leq b_{n}$ for every $n$. Apply this coordinatewise to $B_{n} = \left\lbrack {a_{1}^{n},b_{1}^{n}} \right\rbrack \times \cdots \times \left\lbrack {a_{d}^{n},b_{d}^{n}} \right\rbrack$.

> **Theorem: Closed boxes are compact**
>
> Every closed box in $\mathbb{R}^{n}$ is compact.

> **Proof**
>
> Suppose an open cover of a closed box $B_{0}$ has no finite subcover. Divide it into $2^{d}$ equal subboxes and choose one without a finite subcover; recursively obtain nested boxes $B_{n}$. The nested-box property gives a point $x \in \cap_{n}B_{n}$. Any cover member containing $x$ contains a small ball about $x$; for large $n$, $B_{n}$ lies in that ball, a contradiction.

> **Theorem: Heine-Borel**
>
> A subset of $\mathbb{R}^{d}$ is compact iff it is closed and bounded.

> **Proof**
>
> The forward implication was established above. If $E$ is closed and bounded, it lies in a closed box, which is compact; therefore $E$ is compact as a closed subset of a compact set.

> **Example: Why the Euclidean conclusion is special**
>
> Let $\ell^{\infty{(\mathbb{N})}}$ be the space of bounded sequences with the supremum metric and let $B = \left\{ a \in \ell^{\infty}\  \middle| \ d\left( {a,0} \right) \leq 1 \right\}$. The notes ask one to verify that $B$ is closed and bounded, and emphasize that it is **not** compact. Thus closed and bounded'' is not the general metric-space criterion.

## General metric spaces

> **Definition: Total boundedness and completeness**
>
> A subset $E$ of a metric space is totally bounded if for every $\varepsilon > 0$ there are $x_{1},\ldots,x_{N} \in E$ with $E \subseteq \cup_{i = 1}^{N}B_{\varepsilon{(x_{i})}}$. A set is complete if every Cauchy sequence in it converges to a point of it. It is sequentially compact if every sequence has a subsequence converging in the set.

> **Theorem: Metric compactness criteria**
>
> For $E \subseteq X$ in a metric space, the following are equivalent: $E$ is compact; $E$ is sequentially compact; $E$ is complete and totally bounded.

> **Proof**
>
> Sequential compactness implies total boundedness: otherwise choose points $p_{n}$ separated by a fixed $\varepsilon$, producing a sequence with no Cauchy, hence no convergent, subsequence. It also implies completeness because a convergent subsequence of a Cauchy sequence forces the entire sequence to converge to the same limit.
>
> Conversely, total boundedness lets one choose successively infinitely many terms of a given sequence in nested balls of radii $2^{-}k$; the selected subsequence is Cauchy and therefore converges by completeness.
>
> For the passage from sequential compactness to compactness, the notes prove the Lebesgue covering lemma: for every open cover of a sequentially compact set there is an $\varepsilon > 0$ such that each $p$ has $B_{\varepsilon{(p)}}$ contained in a cover member. If not, choose points $p_{n}$ for which no $B_{\frac{1}{n}}\left( p_{n} \right)$ fits; a convergent subsequence contradicts openness at its limit. A finite $\varepsilon$-ball cover then selects a finite subcover.

# Multivariable differentiation

## Continuity and differentiability

> **Definition: Continuity and uniform continuity**
>
> A map $f:X\rightarrow Y$ between metric spaces is continuous at $x_{0}$ if for every $\varepsilon > 0$ there is $\delta > 0$ such that $d_{X{({x,x_{0}})}} < \delta$ implies $d_{Y{({f{(x)},f{(x_{0})}})}} < \varepsilon$; equivalently, $f\left( B_{\delta{(x_{0})}} \right) \subseteq B_{\varepsilon{({f{(x_{0})}})}}$. It is uniformly continuous if $\delta$ can be chosen independently of $x_{0}$.

> **Theorem: Compact domain gives uniform continuity**
>
> If $f:X\rightarrow Y$ is continuous and $X$ is compact, then $f$ is uniformly continuous.

> **Proof**
>
> For each $x \in X$, continuity provides a ball $B_{\frac{\delta{(x)}}{2}}(x)$ mapped into $B_{\frac{\varepsilon}{2}}\left( {f(x)} \right)$. Take a finite subcover and put $\delta = \min_{i}\frac{\delta\left( x_{i} \right)}{2}$. If $d\left( {a_{1},a_{2}} \right) < \delta$, choose $i$ with $a_{1} \in B_{\frac{\delta{(x_{i})}}{2}}\left( x_{i} \right)$; then $d\left( {a_{2},x_{i}} \right) < \delta\left( x_{i} \right)$ and the triangle inequality gives $d\left( {f\left( a_{1} \right),f\left( a_{2} \right)} \right) < \varepsilon$.

> **Remark**
>
> The notes record that continuous functions map compact sets to compact sets, and that a continuous real-valued function on a compact set attains a maximum and a minimum. The example $f(x) = x^{2}:\mathbb{R}\rightarrow\mathbb{R}$ is not uniformly continuous.

> **Definition: Differentiability**
>
> Let $A \subseteq \mathbb{R}^{n}$ be open and $f:A\rightarrow\mathbb{R}^{m}$. The map $f$ is differentiable at $x_{0} \in A$ if there is a linear map $A_{0}:\mathbb{R}^{n}\rightarrow\mathbb{R}^{m}$ such that $\lim_{{\| h\|}\rightarrow 0}\frac{\left\| {f\left( {x_{0} + h} \right) - f\left( x_{0} \right) - A_{0}h} \right\|}{\left\| h \right\|} = 0$. The linear map is unique and is denoted $Df\left( x_{0} \right)$.

> **Proof**
>
> If $A_{1},A_{2}$ both satisfy the definition, then $\frac{\left\| {\left( {A_{1} - A_{2}} \right)h} \right\|}{\left\| h \right\|}$ is bounded by the two remainders and tends to zero. A nonzero matrix has a vector on which this quotient is nonzero, so $A_{1} = A_{2}$.

> **Remark**
>
> The Euclidean norm is used in the written definition, but the notes stress that any norm would give the same notion. $Df\left( x_{0} \right)$ is the best linear approximation to $h\mapsto f\left( {x_{0} + h} \right) - f\left( x_{0} \right)$, and the remainder is sublinear: $r_{x_{0}}(h) = f\left( {x_{0} + h} \right) - f\left( x_{0} \right) - Df\left( x_{0} \right)h = o\left( \left\| h \right\| \right)$.

> **Definition: Directional and partial derivatives**
>
> For $u \in \mathbb{R}^{n}$, the directional derivative, when it exists, is $\left. D_{u}f\left( x_{0} \right) = \lim_{t\rightarrow 0}\frac{f\left( {x_{0} + tu} \right) - f\left( x_{0} \right)}{t} = \left( {\frac{d}{d}t} \right) \middle| {}_{t = 0}\ f\left( {x_{0} + tu} \right) \right.$. The $j$th partial derivative is $\partial\frac{f}{\partial}x_{j}\left( x_{0} \right) = D_{e_{j}}f\left( x_{0} \right)$.

> **Theorem: Differentiability controls directional derivatives**
>
> If $f$ is differentiable at $x_{0}$, then every directional derivative exists and $D_{u}f\left( x_{0} \right) = Df\left( x_{0} \right)u$. In particular, $u\mapsto D_{u}f\left( x_{0} \right)$ is linear.

> **Proof**
>
> Substitute $h = tu$ into the differentiability remainder. For vector-valued $f = \left( {f_{1},\ldots,f_{m}} \right)$ this is componentwise.

> **Remark**
>
> Directional derivatives may exist without differentiability. Conversely, differentiability is a local approximation by a **linear** map, not merely a collection of one-dimensional limits. For $f\left( {x_{1},x_{2}} \right) = \sin\left( {x_{1}x_{2}} \right)$ and $u = \left( {1,0} \right)$, the notes compute $D_{u}f\left( {x_{1},x_{2}} \right) = x_{2}\cos\left( {x_{1}x_{2}} \right)$.

## Jacobians and the $C^{1}$ criterion

> **Theorem: Jacobian and components**
>
> Let $f = \left( {f_{1},\ldots,f_{m}} \right):A \subseteq \mathbb{R}^{n}\rightarrow\mathbb{R}^{m}$. If $f$ is differentiable at $x_{0}$, then $Df\left( x_{0} \right) = \begin{pmatrix}
> {\partial_{1}f_{1}\left( x_{0} \right)} & \ldots & {\partial_{n}f_{1}\left( x_{0} \right)} \\
> \ldots & \ldots & \ldots \\
> {\partial_{1}f_{m{(x_{0})}}} & \ldots & {\partial_{n}f_{m{(x_{0})}}}
> \end{pmatrix}$. Conversely, $f$ is differentiable iff each component is differentiable.

> **Proof**
>
> The $j$th column is $Df\left( x_{0} \right)e_{j} = D_{e_{j}}f\left( x_{0} \right)$, whose entries are $\partial\frac{f_{i}}{\partial}x_{j{(x_{0})}}$. The lecture's example is $F\left( {x,y} \right) = \left( {x^{2} + y^{2},xy,\sin y} \right)$, for which $DF\left( {x,y} \right) = \begin{pmatrix}
> {2x} & {2y} \\
> y & x \\
> 0 & {\cos y}
> \end{pmatrix}$ and $D_{1,2}F = D_{e_{1}}F + 2D_{e_{2}}F$.

> **Definition: $C^{r}$ and $C^{\infty}$**
>
> A function is $C^{r}$ if all partial derivatives of order at most $r$ exist and are continuous. It is $C^{\infty}$ if it is $C^{r}$ for every $r \in \mathbb{N}$. Higher derivatives are defined componentwise using multi-indices.

> **Theorem: Continuous partials imply differentiability**
>
> Let $f:A \subseteq \mathbb{R}^{n}\rightarrow\mathbb{R}^{m}$, with $A$ open. If all first partial derivatives exist in a neighborhood of $x_{0}$ and are continuous at $x_{0}$, then $f$ is differentiable at $x_{0}$. Thus every $C^{1}$ map is differentiable.

> **Proof**
>
> Reduce to a scalar component. With $h = \left( {h_{1},\ldots,h_{n}} \right)$ set $p_{0} = x_{0}$, $p_{i} = p_{i - 1} + h_{i}e_{i}$. Apply the one-variable mean value theorem to $\varphi_{i{(s)}} = f\left( {p_{i - 1} + se_{i}} \right)$ on $\left\lbrack {0,h_{i}} \right\rbrack$. For some points $q_{i}$ on the successive segments, $f\left( {x_{0} + h} \right) - f\left( x_{0} \right) = \sum_{i}\partial_{i}f\left( q_{i} \right)h_{i}$. Subtract $\sum_{i}\partial_{i}f\left( x_{0} \right)h_{i}$ and use $\left\| h \right\|_{1} \leq \sqrt{n}\left\| h \right\|$; continuity makes the remainder quotient tend to zero.

> **Remark**
>
> The converse is false: $x\mapsto x^{2}\sin\left( \frac{1}{x} \right)$ (with the value at zero) is differentiable but its derivative is not continuous. The handwritten notes emphasize that, unlike $f:\mathbb{R}\rightarrow\mathbb{R}$, the derivative of a general $f:\mathbb{R}^{n}\rightarrow\mathbb{R}^{m}$ takes values in a different function space.

## Higher derivatives and products

> **Theorem: 任意二阶 partial 可交换**
>
> Last time we proved: if $f \in C^{2}$, then $\partial^{2}\frac{f}{\partial x_{i}\partial x_{j}} = \partial^{2}\frac{f}{\partial x_{j}\partial x_{i}}$. （任意二阶 partial 可交换。）

> **Proof**
>
> In the scalar two-variable case, put $G\left( {h,k} \right) = f\left( {x_{1} + h,x_{2} + k} \right) - f\left( {x_{1} + h,x_{2}} \right) - f\left( {x_{1},x_{2} + k} \right) + f\left( {x_{1},x_{2}} \right)$. Applying the one-variable mean value theorem twice gives both $G\left( {h,k} \right) = hk\partial_{1}\partial_{2}f\left( {s_{0},t_{0}} \right)$ and $G\left( {h,k} \right) = hk\partial_{2}\partial_{1}f\left( {s_{0}',t_{0}'} \right)$, where the intermediate points tend to $\left( {x_{1},x_{2}} \right)$. Continuity of the second partials gives the result.

> **Theorem: Higher partial regularity**
>
> $f \in C^{k + 1}$ if and only if all partials of $f$ are in $C^{k}$.

> **Theorem: Corollary（因而）**
>
> 如果 $f:A \subseteq \mathbb{R}^{n}\rightarrow\mathbb{R}$ is $C^{r}$，then for every $2 \leq m \leq r$,
>
> $\partial^{m}\frac{f}{\partial x_{i_{1}}\partial x_{i_{2}}\cdots\partial x_{i_{m}}} = \partial^{m}\frac{f}{\partial x_{i_{\pi{(1)}}}\partial x_{i_{\pi{(2)}}}\cdots\partial x_{i_{\pi{(m)}}}}$
>
> for any permutation $\pi \in S_{m}$。（即 $f \in C^{r}$，$f$ 的 $r$-order 的 partial derivative 可以随意换顺序。）For example, if $f$ is $C^{3}$,
>
> $\partial^{3}\frac{f}{\partial x\partial y\partial z} = \partial^{3}\frac{f}{\partial x\partial z\partial y} = \partial^{3}\frac{f}{\partial z\partial x\partial y} = \cdots$.

> **Definition: 定义 multi-index notation**
>
> 一个 $n$-tuple $\alpha = \left( {\alpha_{1},\ldots,\alpha_{n}} \right)$ is a multi-index, s.t. each $\alpha_{i} \in \mathbb{Z}_{\geq 0}$. If $\alpha$ is a multi-index, define its degree (or order) by $|\alpha| = \sum_{i}\alpha_{i}$, and write $\alpha! = \prod_{i}\alpha_{i!}$（note: $0! = 1$）. For $x \in \mathbb{R}^{n}$, $x^{\alpha} = x_{1}^{\alpha_{1}}x_{2}^{\alpha_{2}}\cdots x_{n}^{\alpha_{n}}$; for $f:\mathbb{R}^{n}\rightarrow\mathbb{R}$, $\partial^{\alpha}f = \left( \frac{\partial}{\partial x_{1}} \right)^{\alpha_{1}}\cdots\left( \frac{\partial}{\partial x_{n}} \right)^{\alpha_{n}}f$。 每个运算符 $\frac{\partial}{\partial x_{i}}$ 只对 $x_{i}$ 求导，随后可按任意顺序排列。 For example, for $f:\mathbb{R}^{2}\rightarrow\mathbb{R}$, $\partial^{2,1}f = \left( \frac{\partial}{\partial x_{1}} \right)^{2}\left( \frac{\partial}{\partial x_{2}} \right)f = \partial^{3}\frac{f}{\partial x_{1}\partial x_{1}\partial x_{2}}$.

> **Theorem: Multinomial theorem**
>
> For $x \in \mathbb{R}^{n}$ and $k \in \mathbb{N}$, $\left( {x_{1} + \cdots + x_{n}} \right)^{k} = \sum_{{|\alpha|} = k}\frac{k!}{\alpha!}x^{\alpha}$.

> **Remark**
>
> $\frac{k!}{\alpha!}$ is the number of ways to divide a set of size $k$ into disjoint subsets of sizes $\alpha_{1},\ldots,\alpha_{n}$. There are $k!$ ways to order the set, and $\alpha! = \alpha_{1!}\alpha_{2!}\cdots\alpha_{n!}$ ways to get the same result.

> **Theorem: Higher-order product rule**
>
> If $f,g$ are $C^{|\alpha|}$, then $\partial^{\alpha{({fg})}} = \sum_{\beta + \gamma = \alpha}\frac{\alpha!}{\beta!\gamma!}\left( {\partial^{\beta}f} \right)\left( {\partial^{\gamma}g} \right)$.

> **Proof**
>
> The $|\alpha| = 1$ case is the usual product rule. For the induction step, write $\alpha = e_{i} + \alpha'$ and differentiate the induction formula for $\alpha'$; reindex the two sums to obtain the multinomial coefficient $\frac{\alpha!}{\beta!\gamma!}$.

## Chain rule and Taylor's theorem

> **Theorem: Chain rule**
>
> Let $f:A \subseteq \mathbb{R}^{n}\rightarrow B \subseteq \mathbb{R}^{m}$ and $g:B\rightarrow\mathbb{R}^{p}$, with $A,B$ open. If $f$ is differentiable at $x_{0}$ and $g$ is differentiable at $f\left( x_{0} \right)$, then $g \circ f$ is differentiable at $x_{0}$ and $D\left( {g \circ f} \right)\left( x_{0} \right) = Dg\left( {f\left( x_{0} \right)} \right)Df\left( x_{0} \right)$.

> **Proof**
>
> Recall first the one-dimensional statement: $\left( {\frac{d}{d}x} \right)\left( {g \circ f} \right)(x) = g'\left( {f(x)} \right)f'(x)$（if $g'\left( {f(x)} \right)$ and $f'(x)$ exist）；one can view these as $1 \times 1$ matrices. Now put $y_{0} = f\left( x_{0} \right)$ and, for $h$ small, define the remainder
>
> $R_{f{(h)}} = \frac{f\left( {x_{0} + h} \right) - f\left( x_{0} \right) - Df\left( x_{0} \right)h}{\left\| h \right\|}$.
>
> Since $f$ is differentiable, $\left\| R_{f{(h)}} \right\|\rightarrow 0$ as $\left\| h \right\|\rightarrow 0$. For $k$ small, likewise set
>
> $R_{g{(k)}} = \frac{g\left( {y_{0} + k} \right) - g\left( y_{0} \right) - Dg\left( y_{0} \right)k}{\left\| k \right\|}$,
>
> so $\left\| R_{g{(k)}} \right\|\rightarrow 0$ as $\left\| k \right\|\rightarrow 0$. Set $A = Dg\left( y_{0} \right)Df\left( x_{0} \right)$ and $k = Df\left( x_{0} \right)h + \left\| h \right\| R_{f{(h)}}$. Then $f\left( {x_{0} + h} \right) = y_{0} + k$, and
>
> $\left\| k \right\| \leq \left\| {Df\left( x_{0} \right)} \right\|\left\| h \right\| + \left\| h \right\|\left\| R_{f{(h)}} \right\|$.
>
> In particular $k\rightarrow 0$ as $h\rightarrow 0$. The composite remainder is
>
> $R_{g \circ f}(h) = \frac{g\left( {y_{0} + k} \right) - g\left( y_{0} \right) - Ah}{\left\| h \right\|}$ $= \frac{Dg\left( y_{0} \right)\left( {Df\left( x_{0} \right)h + \left\| h \right\| R_{f{(h)}}} \right) + \left\| k \right\| R_{g{(k)}} - Ah}{\left\| h \right\|}$ $= Dg\left( y_{0} \right)R_{f{(h)}} + \left( \frac{\left\| k \right\|}{\left\| h \right\|} \right)R_{g{(k)}}$.
>
> The displayed bound and the two remainder limits make this tend to zero, which proves the stated matrix formula.

> **Definition: Convex set**
>
> A set $G \subseteq \mathbb{R}^{n}$ is convex if $tx + \left( {1 - t} \right)y \in G$ for all $x,y \in G$ and $t \in \left\lbrack {0,1} \right\rbrack$.

> **Theorem: Taylor's theorem**
>
> Let $G \subseteq \mathbb{R}^{n}$ be open and convex, let $f:G\rightarrow\mathbb{R}$ be $C^{k + 1}$, and let $a,x \in G$. Then $f(x) = \sum_{{|\alpha|} \leq k}\frac{\partial^{\alpha}f(a)}{\alpha!}\left( {x - a} \right)^{\alpha} + R_{a,k}(x)$, where, for some $c$ on the line segment from $a$ to $x$, $R_{a,k}(x) = \sum_{{|\alpha|} = k + 1}\frac{\partial^{\alpha}f(c)}{\alpha!}\left( {x - a} \right)^{\alpha}$.

> **Proof**
>
> Put $\varphi(t) = f\left( {a + t\left( {x - a} \right)} \right)$. The one-variable Taylor theorem applied at $t = 0$ gives $f(x) = \varphi(1)$. Repeated chain rule and the multinomial theorem yield $\varphi^{p}(t) = \sum_{{|\alpha|} = p}\frac{p!}{\alpha!}\left( {x - a} \right)^{\alpha}\partial^{\alpha}f\left( {a + t\left( {x - a} \right)} \right)$, giving the displayed polynomial and remainder.

> **Example: A second-order Taylor polynomial**
>
> For $f\left( {x,y} \right) = \sin\left( {x^{2} + y} \right)$, the notes compute at $\left( {0,0} \right)$: $\partial^{1,0}f = 2x\cos\left( {x^{2} + y} \right)$, $\partial^{0,1}f = \cos\left( {x^{2} + y} \right)$, $\partial^{2,0}f = 2\cos\left( {x^{2} + y} \right) - 4x^{2}\sin\left( {x^{2} + y} \right)$, $\partial^{1,1}f = - 2x\sin\left( {x^{2} + y} \right)$, and $\partial^{0,2}f = - \sin\left( {x^{2} + y} \right)$. Thus its degree-two Taylor polynomial is $T\left( {x,y} \right) = y + x^{2}$.

# Inverse and implicit functions

## Local invertibility

> **Definition: Local inverse, homeomorphism, and diffeomorphism**
>
> For $f:A \subseteq \mathbb{R}^{n}\rightarrow\mathbb{R}^{n}$, say $f$ is locally invertible near $x_{0}$ when some $B_{\delta{(x_{0})}}$ is mapped bijectively onto an open set $\Omega \subseteq \mathbb{R}^{n}$. It is a local homeomorphism if this restriction and its inverse are continuous, a local diffeomorphism if both are differentiable, and a local $C^{r}$ diffeomorphism if both are $C^{r}$.

> **Remark**
>
> $x\mapsto x^{3}$ is locally invertible but not a local diffeomorphism near zero. A derivative that exists and is nonzero only at a point is not enough for local injectivity: the lecture sketches an oscillating graph tangent to $y = x$ as the counterexample. If $f'$ exists near $a$ and $f'(a) \neq 0$, however, continuity of $f'$ is not needed to obtain local injectivity in one variable.

> **Lemma: Quantitative invertibility of a matrix**
>
> If $E$ is an invertible $n \times n$ matrix, then for all $x,y \in \mathbb{R}^{n}$, $\left\| {Ex - Ey} \right\| \geq \frac{1}{\left\| E^{- 1} \right\|}\left\| {x - y} \right\|$.

> **Proof**
>
> Put $v = x - y$. Since $\left\| v \right\| = \left\| {E^{- 1}Ev} \right\| \leq \left\| E^{- 1} \right\|\left\| {Ev} \right\|$, rearrange to get the bound.

> **Lemma: Mean-value estimate**
>
> If $H:A \subseteq \mathbb{R}^{n}\rightarrow\mathbb{R}^{m}$ is $C^{1}$ and the segment from $x$ to $y$ is contained in $A$, then $\left\| {H(x) - H(y)} \right\| \leq \max_{t \in {\lbrack{0,1}\rbrack}}\left\| {DH\left( {x + t\left( {y - x} \right)} \right)} \right\|\left\| {x - y} \right\|$.

> **Proof**
>
> Apply the one-variable mean value theorem to each coordinate of $\varphi(t) = H\left( {x + t\left( {y - x} \right)} \right)$ and take the largest coordinate estimate.

> **Lemma: Nonsingular derivative gives a lower Lipschitz bound**
>
> Let $f:A \subseteq \mathbb{R}^{n}\rightarrow\mathbb{R}^{n}$ be $C^{1}$ and suppose $Df\left( x_{0} \right)$ is invertible. Then there are an open neighborhood $U$ of $x_{0}$ and $\alpha > 0$ such that $\left\| {f(x) - f(y)} \right\| \geq \alpha\left\| {x - y} \right\|$ for all $x,y \in U$.

> **Proof**
>
> Set $E = Df\left( x_{0} \right)$ and $H(x) = f(x) - Ex$. Since $DH\left( x_{0} \right) = 0$, continuity of $DH$ gives a small ball on which $\left\| {H(x) - H(y)} \right\| < \frac{1}{2\left\| E^{- 1} \right\|}\left\| {x - y} \right\|$. Combine the preceding two lemmas with $f(x) - f(y) = E\left( {x - y} \right) + H(x) - H(y)$ to obtain $\alpha = \frac{1}{2\left\| E^{- 1} \right\|}$.

> **Theorem: Inverse function theorem**
>
> Let $f:A \subseteq \mathbb{R}^{n}\rightarrow\mathbb{R}^{n}$ be $C^{r}$ ($r \geq 1$), with $A$ open and $x_{0} \in A$. If $Df\left( x_{0} \right)$ is nonsingular, then some open neighborhoods $U$ of $x_{0}$ and $V$ of $f\left( x_{0} \right)$ satisfy: $f:U\rightarrow V$ is bijective, its inverse $g:V\rightarrow U$ is $C^{r}$, and $Dg\left( {f(x)} \right) = \left( {Df(x)} \right)^{- 1}$ for $x \in U$.

> **Proof**
>
> The lower Lipschitz bound makes $f$ injective on a small $U$. It also shows that $f(U)$ is open: take a closed ball inside $U$, minimize $z\mapsto\left\| {f(z) - c} \right\|^{2}$ on it, and use the chain rule plus invertibility of the derivative to see that the minimizer for $c$ close to $f(x)$ is interior. Thus $V = f(U)$ is open and $g$ is continuous.
>
> For $y = f(x)$ and $h = g\left( {y + k} \right) - g(y)$, differentiability of $f$ gives $k - Df(x)h = r(h)$, where $\frac{\left\| {r(h)} \right\|}{\left\| h \right\|}\rightarrow 0$. The lower bound relates $\left\| h \right\|$ to $\left\| k \right\|$, giving $\frac{g\left( {y + k} \right) - g(y) - \left( {Df(x)} \right)^{- 1}k}{\left\| k \right\|}\rightarrow 0$. Hence $Dg(y) = \left( {Df(x)} \right)^{- 1}$. Cramer's rule expresses the inverse matrix as rational functions of the entries of $Df$; induction then upgrades $g$ to $C^{r}$.

> **Remark**
>
> $\det M = \sum_{\sigma \in S_{n}}\text{sgn}(\sigma)\prod_{i}M_{i,\sigma{(i)}}$ is continuous. Therefore $\det Df\left( x_{0} \right) \neq 0$ remains nonzero on a small neighborhood. The theorem says the functions $y_{i} = f_{i{({x_{1},\ldots,x_{n}})}}$ can be used as local coordinates in place of $x_{i}$.

> **Example: Polar and spherical coordinates**
>
> For $\left( {r,\theta} \right)\mapsto\left( {r\cos\theta,r\sin\theta} \right)$, $Df = \begin{pmatrix}
> {\cos\theta} & {- r\sin\theta} \\
> {\sin\theta} & {r\cos\theta}
> \end{pmatrix}$ and $\det Df = r$, so it is locally invertible for $r \neq 0$. For spherical coordinates $\left( {r,\varphi,\theta} \right)\mapsto\left( {r\sin\varphi\cos\theta,r\sin\varphi\sin\theta,r\cos\varphi} \right)$, the notes calculate $\det Df = r^{2}\sin\varphi$; it is nonzero away from $r = 0$ and the polar axis.

## Implicit functions

> **Theorem: Implicit differentiation**
>
> Let $f:A \subseteq \mathbb{R}^{k + n}\rightarrow\mathbb{R}^{n}$ be differentiable, with $\left( {x,y} \right) \in \mathbb{R}^{k} \times \mathbb{R}^{n}$. If a differentiable map $g:B \subseteq \mathbb{R}^{k}\rightarrow\mathbb{R}^{n}$ satisfies $f\left( {x,g(x)} \right) = 0$, then $\partial\frac{f}{\partial}x\left( {x,g(x)} \right) + \partial\frac{f}{\partial}y\left( {x,g(x)} \right)Dg(x) = 0$. If $\partial\frac{f}{\partial}y$ is invertible, then $Dg(x) = - \left( {\partial\frac{f}{\partial}y\left( {x,g(x)} \right)} \right)^{- 1}\partial\frac{f}{\partial}x\left( {x,g(x)} \right)$.

> **Proof**
>
> Apply the chain rule to $h(x) = \left( {x,g(x)} \right)$. Its derivative is the block matrix $Dh = \begin{pmatrix}
> I_{k} \\
> {Dg}
> \end{pmatrix}$, while $Df = \left( {\partial\frac{f}{\partial}x,\partial\frac{f}{\partial}y} \right)$.

> **Theorem: Implicit function theorem**
>
> Let $A \subseteq \mathbb{R}^{k} \times \mathbb{R}^{n}$ be open, let $f:A\rightarrow\mathbb{R}^{n}$ be $C^{r}$ ($r \geq 1$), and assume $\left( {a,b} \right) \in A$, $f\left( {a,b} \right) = 0$, and $\partial\frac{f}{\partial}y\left( {a,b} \right)$ is nonsingular. Then on a neighborhood of $a$ there is a unique $C^{r}$ function $g$ with $g(a) = b$ and $f\left( {x,g(x)} \right) = 0$. Its derivative is the implicit-differentiation formula above.

> **Proof**
>
> Define the auxiliary map $F\left( {x,y} \right) = \left( {x,f\left( {x,y} \right)} \right)$. Its derivative is block triangular: $DF = \begin{pmatrix}
> I_{k} & 0 \\
> {\partial\frac{f}{\partial}x} & {\partial\frac{f}{\partial}y}
> \end{pmatrix}$, hence $\det DF\left( {a,b} \right) = \det\left( {\partial\frac{f}{\partial}y\left( {a,b} \right)} \right) \neq 0$. The inverse function theorem gives a local inverse $G$. Since the first $k$ coordinates of $F$ are the identity, write $G\left( {x,z} \right) = \left( {x,h\left( {x,z} \right)} \right)$ and set $g(x) = h\left( {x,0} \right)$. This gives existence. For uniqueness, the notes let $S = \left\{ x\  \middle| \ g(x) = g'(x) \right\}$; it is nonempty, closed by continuity, and open by the local inverse, so connectedness of a sufficiently small ball implies $S = B$.

> **Remark**
>
> The theorem turns a level set $\left\{ {\left( {x,y} \right):f\left( {x,y} \right) = 0} \right\}$ locally into the graph of a function. In the linear case $f\left( {x,y} \right) = Ax + By$, invertibility of $B$ gives the familiar formula $y = - B^{- 1}Ax$.

> **Example: Level-set examples**
>
> The unit circle $f\left( {x,y} \right) = x^{2} + y^{2} - 1 = 0$ defines locally $y = \sqrt{1 - x^{2}}$ away from $\left( {1,0} \right)$ and $\left( {- 1,0} \right)$, exactly where $\partial\frac{f}{\partial}y = 2y$ is nonzero. Two $C^{1}$ surfaces $f = g = 0$ in $\mathbb{R}^{3}$ typically meet in a curve: if the $2 \times 2$ derivative with respect to $\left( {y,z} \right)$ has rank two, the implicit theorem solves $\left( {y,z} \right)$ in terms of $x$.

# Partitions and Lebesgue's characterization

## Partitions and Darboux sums

> **Definition: Box, partition, mesh**
>
> A box in $\mathbb{R}^{n}$ is $B = I_{1} \times \cdots \times I_{n}$, where the $I_{i}$ are intervals; here the notes use closed intervals, $B = \left\lbrack {a_{1},b_{1}} \right\rbrack \times \cdots \times \left\lbrack {a_{n},b_{n}} \right\rbrack$, with $v(B) = \prod_{i{({b_{i} - a_{i}})}}$. A partition of $\left\lbrack {a,b} \right\rbrack$ is a finite increasing sequence $a = x_{0} < x_{1} < \cdots < x_{k} = b$, with mesh $\left\| P \right\| = \max_{i{({x_{i} - x_{i - 1}})}}$.
>
> A partition $P = \left( {P_{1},\ldots,P_{n}} \right)$ of a box is an $n$-tuple of coordinate partitions. It decomposes $B$ into boxes $J_{1} \times \cdots \times J_{n}$ with pairwise disjoint interiors and mesh $\left\| P \right\| = \max_{1 \leq j \leq n}\left\| P_{j} \right\|$.

> **Definition: Lower and upper sums**
>
> Let $f:B\rightarrow\mathbb{R}$ be bounded and let the subboxes of $P$ be $B_{1},\ldots,B_{N}$. Set $m_{B_{i}}(f) = \inf_{B_{i}}f$ and $M_{B_{i}}(f) = \sup_{B_{i}}f$. The lower and upper sums are $L\left( {f,P} \right) = \sum_{i}m_{B_{i}}(f)v\left( B_{i} \right)$ and $U\left( {f,P} \right) = \sum_{i}M_{B_{i}}(f)v\left( B_{i} \right)$.

> **Definition: Refinement**
>
> A partition $Q$ is a refinement of $P$ if $P_{j} \subseteq Q_{j}$ for every coordinate. The common refinement of $P,P'$ is obtained by taking the union of the coordinate partition points.

> **Lemma: Monotonicity under refinement**
>
> If $Q$ refines $P$, then $L\left( {f,P} \right) \leq L\left( {f,Q} \right)$ and $U\left( {f,P} \right) \geq U\left( {f,Q} \right)$. Therefore for arbitrary partitions $P,P'$, $L\left( {f,P} \right) \leq U\left( {f,P'} \right)$.

> **Proof**
>
> It is enough to add one point to one coordinate partition. Each affected subbox splits into two smaller boxes, whose infima are at least the old infimum and whose volumes add to the old volume. Apply the same fact to $- f$ for upper sums, and use a common refinement.

> **Definition: Lower/upper integrals and Riemann integrability**
>
> Define $\int_{B}f\, dx = \sup_{P}L\left( {f,P} \right)$ and $\int_{B}\, f\, dx = \inf_{P}U\left( {f,P} \right)$. The function $f$ is Riemann integrable if these values agree; then their common value is written $\int_{B}f\, dx$.

> **Theorem: Riemann condition**
>
> A bounded $f:B\rightarrow\mathbb{R}$ is Riemann integrable iff, for every $\varepsilon > 0$, there is a partition $P$ with $U\left( {f,P} \right) - L\left( {f,P} \right) < \varepsilon$.

> **Proof**
>
> If the lower and upper integrals agree, choose $P_{1},P_{2}$ whose lower and upper sums are each within $\frac{\varepsilon}{2}$ of that number, and take a common refinement. The converse follows from $L\left( {f,P} \right) \leq \int_{B}f\, dx \leq \int_{B}\, f\, dx \leq U\left( {f,P} \right)$.

> **Example: A nonintegrable function**
>
> On $\left\lbrack {0,1} \right\rbrack^{2}$, take $f\left( {x,y} \right) = 0$ when $x,y$ are rationally dependent and $1$ otherwise. Every subbox meets both types of points, so every lower sum is $0$ and every upper sum is $1$. Hence $f$ is not Riemann integrable.

> **Lemma: Vector-space property**
>
> If $f,g \in R(B)$, then $f + g \in R(B)$. Consequently $R(B)$ is a vector space; all constant functions belong to it.

> **Proof**
>
> For each subbox $S$, $\inf_{S}f + \inf_{S}g \leq \inf_{S{({f + g})}}$ and $\sup_{S{({f + g})}} \leq \sup_{S}f + \sup_{S}g$. Choose partitions making the two Darboux gaps small and take their common refinement.

## The review sheet

> **Remark: Midterm review**
>
> The four-page review re-records the earlier core facts: boundedness, total boundedness, completeness, compactness, and sequential compactness satisfy $\text{sequentially compact}\Leftrightarrow\text{compact}\Leftrightarrow\text{complete and totally bounded}$ in metric spaces; in $\mathbb{R}^{n}$, compactness is equivalent to closed and bounded. It also restates differentiability, directional derivatives, the Jacobian, the $C^{1}$ criterion, mixed partials, multi-index notation, the chain rule, product rule, Taylor theorem, inverse function theorem, and implicit function theorem. For a linear map $\left( {x,y} \right)\mapsto Ax + By$, the implicit solution is $y = - B^{- 1}Ax$ when $B$ is invertible.

## Measure zero and the Lebesgue criterion

> **Definition: Measure zero**
>
> A set $A \subseteq \mathbb{R}^{n}$ has (Lebesgue) measure zero if, for every $\varepsilon > 0$, it can be covered by countably many boxes $B_{i}$ with $\sum_{i = 1}^{\infty}v\left( B_{i} \right) < \varepsilon$. It does not matter whether the covering boxes are open or closed; a countable union of measure-zero sets has measure zero.

> **Definition: Oscillation**
>
> For bounded $f:B\rightarrow\mathbb{R}$, put $\text{osc}_{\delta}f(x) = \sup_{x_{1},x_{2} \in B \cap B_{\delta{(x)}}}\left( {f\left( x_{1} \right) - f\left( x_{2} \right)} \right)$ and $\text{osc}\ f(x) = \inf_{\delta > 0}\text{osc}_{\delta}f(x)$. Then $f$ is continuous at $x$ iff $\text{osc}\ f(x) = 0$.

> **Remark**
>
> The notes ask one to verify $\text{osc}_{\delta}f(x) = \sup_{B \cap B_{\delta{(x)}}}f - \inf_{B \cap B_{\delta{(x)}}}f$ and that $\delta_{1} < \delta_{2}$ implies $\text{osc}_{\delta_{1}}f(x) \leq \text{osc}_{\delta_{2}}f(x)$. For the Dirichlet function ($1$ on rationals and $0$ on irrationals), the oscillation is $1$ everywhere.

> **Theorem: Lebesgue characterization of Riemann integrability**
>
> Let $B \subseteq \mathbb{R}^{n}$ be a box and $f:B\rightarrow\mathbb{R}$ be bounded. Let $D_{f} = \left\{ x\  \middle| \ f\ \text{is not continuous at}\ x \right\}$. Then $f$ is Riemann integrable iff $D_{f}$ has measure zero.

> **Proof**
>
> First suppose $D_{f}$ has measure zero. Let $|f| \leq M$ and cover $D_{f}$ by finitely many open boxes $B_{i}$ whose total volume is less than $\frac{\varepsilon}{4M}$. For each point outside their union, continuity supplies an open box on which the oscillation is less than $\frac{\varepsilon}{2v(B)}$. Compactness of $B$ gives a finite cover. Choose a partition whose subboxes lie in a chosen member of this finite cover. The boxes inside the first family contribute at most $2M\frac{\varepsilon}{4M}$ to the Darboux gap; the rest contribute at most $\frac{\varepsilon}{2}$. Hence the gap is below $\varepsilon$.
>
> Conversely define $D_{m} = \left\{ x \in B\  \middle| \ \text{osc}\ f(x) \geq \frac{1}{m} \right\}$. If a partition $P$ has $U\left( {f,P} \right) - L\left( {f,P} \right) < \frac{\varepsilon}{2m}$, then the subboxes of $P$ meeting $D_{m}$ in their interiors have total volume below $\frac{\varepsilon}{2}$, because each has oscillation at least $\frac{1}{m}$. The union of the subbox boundaries has measure zero and can be covered with total volume below $\frac{\varepsilon}{2}$. Thus $D_{m}$ has measure zero. Since $D_{f} = \cup_{m = 1}^{\infty}D_{m}$, so does $D_{f}$.

> **Example: Two familiar discontinuity sets**
>
> The Dirichlet function on $\left\lbrack {0,1} \right\rbrack$ has $D_{f} = \left\lbrack {0,1} \right\rbrack$ and is not integrable. The function that is $1$ on rational points whose fraction is in lowest terms and has bounded denominator, and $0$ elsewhere, has a countable discontinuity set and is Riemann integrable.

> **Theorem: Almost-everywhere zero and Fubini**
>
> If $f:B\rightarrow\mathbb{R}$ is Riemann integrable and $f = 0$ almost everywhere, then $\int_{B}f = 0$. If $f \geq 0$ and $\int_{B}f = 0$, then $f = 0$ almost everywhere. For boxes $A \subseteq \mathbb{R}^{k}$, $B \subseteq \mathbb{R}^{\ell}$, an integrable $f:A \times B\rightarrow\mathbb{R}$ satisfies Fubini's theorem: $\int_{A \times B}f = \int_{A}\left( {\int_{B}f\left( {x,y} \right)\, dy} \right)\, dx$.

> **Remark**
>
> Under Fubini's hypotheses, the inner integral exists almost everywhere; if it exists for every $x$, the iterated integral is defined everywhere. The review example with a vertical rational/irrational slice shows why almost everywhere'' is necessary.

# Integration and change of variables

## Fubini's theorem

> **Theorem: Fubini for bounded Riemann integrable functions**
>
> Let $A \subset \mathbb{R}^{m}$ and $B \subset \mathbb{R}^{n}$ be boxes, and let $f:A \times B\rightarrow\mathbb{R}$ be bounded and Riemann integrable. For $x \in A$, put
>
> $$
> I(x) = \int_{B}\, f\left( {x,y} \right)\, dy,\quad I(x) = \int_{B}\, f\left( {x,y} \right)\, dy.
> $$
>
> Then $I$ and $I$ are Riemann integrable on $A$ and
>
> $$
> \int_{A \times B}f\left( {x,y} \right)\, d\left( {x,y} \right) = \int_{A}I(x)\, dx = \int_{A}I(x)\, dx.
> $$
>
> Consequently, $x\mapsto\int_{B}f\left( {x,y} \right)\, dy$ is integrable and
>
> $$
> \int_{A \times B}f\left( {x,y} \right)\, d\left( {x,y} \right) = \int_{A}\left( {\int_{B}f\left( {x,y} \right)\, dy} \right)\, dx.
> $$

> **Proof**
>
> Let $P_{A}$ and $P_{B}$ be partitions of $A$ and $B$, and let $P = P_{A} \times P_{B}$. If $R = R_{A} \times R_{B}$ is a subbox of $P$ and $x_{0} \in R_{A}$, then
>
> $$
> m_{R{(f)}} \leq \inf\limits_{y \in R_{B}}f\left( {x_{0},y} \right) = m_{R_{B}}\left( {f\left( {x_{0}, \cdot} \right)} \right).
> $$
>
> Taking the infimum in $x_{0}$ and then multiplying by the volume of $R_{A}$ gives
>
> $$
> m_{R{(f)}}\ \text{vol}(R) \leq m_{R_{A}}(I)\ \text{vol}\left( R_{A} \right)\ \text{vol}\left( R_{B} \right).
> $$
>
> On summing over the boxes of $P_{A}$ and $P_{B}$,
>
> $$
> L\left( {f,P} \right) \leq L\left( {I,P_{A}} \right) \leq U\left( {I,P_{A}} \right) \leq U\left( {f,P} \right).
> $$
>
> The same argument with suprema gives
>
> $$
> L\left( {f,P} \right) \leq L\left( {I,P_{A}} \right) \leq U\left( {I,P_{A}} \right) \leq U\left( {f,P} \right).
> $$
>
> Refine the product partitions so that $U\left( {f,P} \right) - L\left( {f,P} \right)$ tends to zero. The displayed inequalities force the lower and upper integrals of both sectional functions to agree, and their common integrals equal $\int_{A \times B}f$.

## Integrals over bounded sets

> **Definition: Zero extension and integral over a bounded set**
>
> Let $S \subset \mathbb{R}^{n}$ be bounded and let $Q$ be a box containing $S$. For a bounded function $f:S\rightarrow\mathbb{R}$, define its zero extension to $Q$ by
>
> $$
> f_{S{(x)}} = \left\{ \begin{matrix}
> {f(x)} & \\
>  & {x \in S} \\
> {\backslash 0} & \\
>  & {x \notin S.}
> \end{matrix} \right..
> $$
>
> If $f_{S}$ is Riemann integrable on $Q$, define
>
> $$
> \int_{S}f = \int_{Q}f_{S}.
> $$

> **Lemma: Independence of the containing box**
>
> If $Q$ and $Q'$ are boxes containing $S$ and the zero extension is integrable on one of them, then it is integrable on the other, with the same integral.

> **Proof**
>
> Enclose $Q \cup Q'$ in a larger box $R$. The two extensions to $R$ differ only by functions which vanish off a set on which they already agree; partition $R$ along the faces of $Q$ and $Q'$. Additivity for the resulting subboxes shows that the new pieces outside the original containing box contribute $0$. Thus both definitions are the same integral over $R$.

> **Proposition: Elementary properties**
>
> Whenever the displayed integrals exist, the integral over a bounded set is linear, monotone, and satisfies
>
> $$
> \int_{S}\left( {\alpha f + \beta g} \right) = \alpha\int_{S}f + \beta\int_{S}g,\quad f \leq g\rightarrow\int_{S}f \leq \int_{S}g.
> $$
>
> It is also additive under a finite disjoint decomposition of $S$. More generally, for two bounded Jordan-measurable sets,
>
> $$
> \int_{S \cup T}f + \int_{S \cap T}f = \int_{S}f + \int_{T}f.
> $$
>
> In particular, if $S_{i}$ have pairwise intersections of Jordan measure zero, then $\int_{\cup_{i}S_{i}}f = \sum_{i}\int_{S_{i}}f$.

> **Theorem: Jordan-measurable sets**
>
> A bounded set $S \subset \mathbb{R}^{n}$ is Jordan measurable if and only if its boundary has measure zero:
>
> $$
> S \in \mathcal{J}\quad\Leftrightarrow\quad m\left( {\partial S} \right) = 0.
> $$
>
> In that event the constant function $1$ is integrable over $S$, and
>
> $$
> m_{J{(S)}} = \int_{S}1.
> $$

> **Remark**
>
> The lecture uses $\mathcal{J}$ for the class of Jordan-measurable bounded sets and $\mathcal{J}_{c}$ for compact Jordan-measurable sets. Thus integrals over arbitrary bounded sets are not silently assumed to exist: the zero extension must first be Riemann integrable.

## Extended integrals on open sets

> **Definition: Positive extended integral**
>
> Let $A \subset \mathbb{R}^{n}$ be open and let $f:A\rightarrow\mathbb{R}$ be continuous with $f \geq 0$. Its extended integral is
>
> $$
> \text{ext}(\int)_{A}f = \sup\limits_{D \subseteq A,D \in \mathcal{J}_{c}}\int_{D}f.
> $$
>
> This value is allowed to be $+ \infty$.

> **Definition: Signed extended integral**
>
> For a continuous $f:A\rightarrow\mathbb{R}$, set
>
> $$
> f^{+} = \max\left( {f,0} \right),\quad f^{-} = \max\left( {- f,0} \right),\quad f = f^{+} - f^{-},\quad|f| = f^{+} + f^{-}.
> $$
>
> If both $\text{ext}(\int)_{A}f^{+}$ and $\text{ext}(\int)_{A}f^{-}$ are finite, define
>
> $$
> \text{ext}(\int)_{A}f = \text{ext}(\int)_{A}f^{+} - \text{ext}(\int)_{A}f^{-}.
> $$

> **Lemma: Compact exhaustion**
>
> Every open set $A \subset \mathbb{R}^{n}$ has compact Jordan-measurable sets $C_{N}$ such that
>
> $$
> C_{N} \subset C_{N + 1}^{o},\quad C_{N} \subset A,\quad \cup_{N = 1}^{\infty}C_{N} = A.
> $$

> **Proof**
>
> Take compact sets $D_{N}$ increasing to $A$, for example by requiring a positive distance from $\partial A$ and a bound on the norm. Cover each $D_{N}$ by finitely many closed cubes whose interiors lie in $A$, and let $C_{N}$ be the finite union of the cubes selected up to stage $N$. Enlarging at each stage if necessary gives $C_{N} \subset C_{N + 1}^{o}$.

> **Theorem: Exhaustion criterion**
>
> For $f$ continuous on an open set $A$ and for any compact exhaustion $\left( C_{N} \right)$ as above,
>
> $$
> \text{ext}(\int)_{A}f\exists\quad\Leftrightarrow\quad\left( {\int_{C_{N}}|f|} \right)_{N = 1}^{\infty}\ \text{is bounded}.
> $$
>
> In that case,
>
> $$
> \text{ext}(\int)_{A}f = \lim\limits_{N\rightarrow\infty}\int_{C_{N}}f.
> $$

> **Proof**
>
> The integrals of $|f|$ over $C_{N}$ are increasing. If they are bounded, the positive and negative parts have finite suprema, so the signed extended integral exists and the asserted limit follows by subtracting the two monotone limits. Conversely, if the positive and negative extended integrals are finite, each $\int_{C_{N}}|f|$ is bounded by their sum.
>
> The point that the exhaustion computes the supremum is that every compact $D \subset A$ is contained in some $C_{N}$: the open sets $C_{N}^{o}$ cover $D$, so a finite subcover has a largest index. Hence $\int_{D}f^{+} \leq \int_{C_{N}}f^{+}$ for some $N$, and taking suprema gives the claim.

> **Theorem: Agreement on bounded open sets**
>
> If $A$ is bounded and open and $f$ is bounded and continuous on $A$, then the extended integral exists. If the zero extension makes the ordinary Riemann integral over $A$ meaningful, it agrees with the extended integral:
>
> $$
> \text{ext}(\int)_{A}f = \int_{A}f.
> $$

> **Remark**
>
> 对于 bounded open $A$，lecture notes 记录：extended integral must exist； 如果 ordinary integral 存在，则二者相等。

## Change of variables

> **Theorem: One-dimensional change of variables**
>
> Let $g:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ be $C^{1}$, and let $f$ be continuous on an interval containing $g\left( \left\lbrack {a,b} \right\rbrack \right)$. Then
>
> $$
> \int_{g{(a)}}^{g{(b)}}f(y)\, dy = \int_{a}^{b}f\left( {g(x)} \right)g'(x)\, dx.
> $$

> **Proof**
>
> Choose an antiderivative $F$ of $f$. The chain rule and the fundamental theorem of calculus give
>
> $$
> \int_{a}^{b}f\left( {g(x)} \right)g'(x)\, dx = \int_{a}^{b}\left( {F \circ g} \right)'(x)\, dx = F\left( {g(b)} \right) - F\left( {g(a)} \right).
> $$

> **Theorem: Change-of-variables theorem**
>
> Let $A,B \subset \mathbb{R}^{n}$ be open, let $g:A\rightarrow B$ be a $C^{1}$ diffeomorphism, and let $f:B\rightarrow\mathbb{R}$ be continuous. Then
>
> $$
> f\ \text{is integrable over}\ B\quad\Leftrightarrow\quad f\left( {g(x)} \right)\left| {\det Dg(x)} \right|\ \text{is integrable over}\ A,
> $$
>
> and, whenever either condition holds,
>
> $$
> \int_{B}f(y)\, dy = \int_{A}f\left( {g(x)} \right)\left| {\det Dg(x)} \right|\, dx.
> $$

> **Example: Polar coordinates**
>
> On the annular region
>
> $$
> B = \left\{ {\left( {x,y} \right):a^{2} < x^{2} + y^{2} < b^{2}} \right\},
> $$
>
> use $g\left( {r,\theta} \right) = \left( {r\cos\theta,r\sin\theta} \right)$ on $\left( {a,b} \right) \times \left( {0,2\pi} \right)$. Since
>
> $$
> \det Dg\left( {r,\theta} \right) = \det\begin{pmatrix}
> {\cos\theta} & {- r\sin\theta} \\
> {\sin\theta} & {r\cos\theta}
> \end{pmatrix} = r,
> $$
>
> the omitted radial cut has measure zero and
>
> $$
> \int_{B}f\left( {x,y} \right)\, dx\, dy = \int_{0}^{2\pi}\int_{a}^{b}f\left( {r\cos\theta,r\sin\theta} \right)r\, dr\, d\theta.
> $$

> **Example: Spherical coordinates**
>
> With
>
> $$
> g\left( {\rho,\varphi,\theta} \right) = \left( {\rho\sin\varphi\cos\theta,\rho\sin\varphi\sin\theta,\rho\cos\varphi} \right),
> $$
>
> one has $\left| {\det Dg} \right| = \rho^{2}\sin\varphi$. Thus, subject to the usual bounds on $\rho$, $\varphi$, and $\theta$ describing the region,
>
> $$
> \int_{B}f = \int\int\int f\left( {g\left( {\rho,\varphi,\theta} \right)} \right)\rho^{2}\sin\varphi\, d\rho\, d\varphi\, d\theta.
> $$

## Diffeomorphisms and null sets

> **Theorem: $C^{1}$ maps preserve sets of measure zero**
>
> If $g:A\rightarrow\mathbb{R}^{m}$ is $C^{1}$ on an open set $A \subset \mathbb{R}^{n}$ and $E \subset A$ has measure zero, then $g(E)$ has measure zero. In particular, if $m > n$, the image of every bounded set under a $C^{1}$ map $A \subset \mathbb{R}^{n}\rightarrow\mathbb{R}^{m}$ has measure zero.

> **Proof**
>
> First restrict to a closed cube $C \subset A$ on which $\left\| {Dg} \right\| \leq M$. By the mean-value estimate, a cube of side length $w$ in $C$ has image contained in a cube of side length at most $nMw$. Cover $E \cap C$ by cubes of total volume as small as desired; the corresponding image cubes have total volume at most $\left( {nM} \right)^{n}$ times that quantity. Hence $g\left( {E \cap C} \right)$ has measure zero. Exhaust $A$ by such closed cubes and take a countable union.

> **Proposition: Diffeomorphisms preserve interior and boundary**
>
> If $g:A\rightarrow B$ is a diffeomorphism of open sets and $D \subset A$, then
>
> $$
> g\left( D^{o} \right) = \left( {g(D)} \right)^{o},\quad g\left( {\partial D} \right) = \partial\left( {g(D)} \right).
> $$
>
> Hence $D$ is Jordan measurable if and only if $g(D)$ is Jordan measurable.

> **Remark**
>
> The notes contrast this with the rationals in an interval: they have Lebesgue measure zero but are not Jordan measurable, because their boundary is the whole interval.

## Primitive diffeomorphisms

> **Definition: Primitive diffeomorphism**
>
> A primitive diffeomorphism changes only one coordinate. For some $i$,
>
> $$
> h\left( {x_{1},\ldots,x_{n}} \right) = \left( {x_{1},\ldots,x_{i - 1},h_{i{(x)}},x_{i + 1},\ldots,x_{n}} \right).
> $$

> **Theorem: Local decomposition**
>
> Every local $C^{1}$ diffeomorphism can, after restricting to sufficiently small neighborhoods, be written as a finite composition of primitive diffeomorphisms.

> **Proof**
>
> The proof in the notes has three reductions. First, an invertible linear map is a product of elementary matrices: coordinate swaps, scalings, and additions of one coordinate to another. Each is primitive (a coordinate swap is factored into elementary operations when necessary). Translations are also primitive.
>
> Next assume $g(0) = 0$ and $Dg(0) = I$. Define
>
> $$
> h(x) = \left( {g_{1}(x),\ldots,g_{n - 1}(x),x_{n}} \right).
> $$
>
> Near $0$, $h$ is a diffeomorphism. The map $k = g \circ h^{- 1}$ fixes the first $n - 1$ coordinates, so $g = k \circ h$ is a product of primitive maps. Finally, translate the chosen point to $0$ and compose with $\left( {Dg(0)} \right)^{- 1}$ to reduce the general case to this one.

## Partitions of unity

> **Definition: A smooth bump on a box**
>
> Let
>
> $$
> \eta(t) = \left\{ \begin{matrix}
> {\exp\left( {- \frac{1}{t}} \right)} & \\
>  & {t > 0} \\
> {\backslash 0} & \\
>  & {t \leq 0.}
> \end{matrix} \right..
> $$
>
> Then $\eta$ is $C^{\infty}$, positive on $\left( {0,\infty} \right)$, and zero on $\left( {- \infty,0} \right\rbrack$. The product
>
> $$
> \psi(x) = \prod\limits_{j = 1}^{n}\eta\left( {x_{j} - a_{j}} \right)\eta\left( {b_{j} - x_{j}} \right)
> $$
>
> is $C^{\infty}$, positive on the interior of the closed box $Q = \prod_{j}\left\lbrack {a_{j},b_{j}} \right\rbrack$, and zero outside that interior.

> **Definition: Support and partition of unity**
>
> The support of a function is
>
> $$
> \text{supp}(\psi) = \bar{\left\{ {x:\psi(x)\neq 0} \right\}}.
> $$
>
> A partition of unity on an open set $A$, subordinate to an open cover $\left( U_{i} \right)$, is a locally finite family $\left( \varphi_{i} \right)$ of functions $A\rightarrow\left\lbrack {0,1} \right\rbrack$ such that
>
> $$
> \text{supp}\left( \varphi_{i} \right) \subset U_{i},\quad\sum\limits_{i}\varphi_{i{(x)}} = 1\quad\left( {x \in A} \right).
> $$

> **Theorem: Smooth partition of unity**
>
> Every open cover of an open subset $A \subset \mathbb{R}^{n}$ admits a locally finite smooth partition of unity $\left( \varphi_{i} \right)$ subordinate to that cover. Each $\varphi_{i}$ may be chosen with compact support contained in one member of the cover.

> **Proof**
>
> Choose a locally finite collection of closed cubes $S_{i}$ whose interiors cover $A$, with each $S_{i}$ contained in a member of the given cover. The compact-exhaustion construction supplies such cubes by covering successive compact annuli with finitely many cubes. Let $\psi_{i}$ be the smooth box bump positive on $S_{i}^{o}$ and supported in its containing cover member. Local finiteness makes
>
> $$
> \lambda(x) = \sum\limits_{i}\psi_{i{(x)}}
> $$
>
> a smooth, positive function. Then
>
> $$
> \varphi_{i{(x)}} = \frac{\psi_{i{(x)}}}{\lambda(x)}
> $$
>
> has the required support, local finiteness, and sum.

> **Theorem: Integration by a partition of unity**
>
> Let $f$ be continuous on an open set $A$, and let $\left( \varphi_{i} \right)$ be a smooth partition of unity with compact supports in $A$. Then
>
> $$
> \text{ext}(\int)_{A}f\ \text{exists}\quad\Leftrightarrow\quad\sum\limits_{i}\int_{A}\varphi_{i}f = \sum\limits_{i}\int_{\text{supp}{(\varphi_{i})}}\varphi_{i}f\ \text{converges},
> $$
>
> and in that case this series equals $\text{ext}(\int)_{A}f$.

> **Proof**
>
> For $f \geq 0$, finite partial sums satisfy $0 \leq \sum_{i \in F}\varphi_{i} \leq 1$. Their integrals increase to the extended integral by the compact support of each summand and local finiteness. Apply this statement separately to $f^{+}$ and $f^{-}$ to obtain the signed assertion.

> **Remark**
>
> Integration by POU assembles local integrals into a global one: "POU 的作用是把局部的积分拼成全局积分。"

# IBL: Baire category through Jordan measure

## 1A：证明 metric space 是 topological space

> **Definition: Open balls and the metric topology**
>
> In a metric space $\left( {X,d} \right)$, $U \subseteq X$ is open when every $x \in U$ has an $\varepsilon > 0$ with $B_{\varepsilon{(x)}} \subseteq U$. A sequence converges in this topology exactly when it satisfies the metric epsilon definition.

The source's 1A problem has five parts: prove that these open sets form a topology; compare topological and metric convergence; prove open balls open; prove closed balls closed; and give the discrete-metric counterexample above.

> **Solution: 1A：闭球不一定是开球的 closure**
>
> 考虑 discrete topology。此时 $B_{r{(x)}}$ 可以等于 $\left\{ x \right\}$，而在距离发生跳跃的 半径处，closed ball 可能更大，因此它不必等于 open ball 的 closure。

> **Theorem: Baire category theorem**
>
> If $\left( {X,d} \right)$ is complete and $\left( U_{n} \right)_{n = 1}^{\infty}$ are open dense subsets of $X$, then $\bigcap_{n = 1}^{\infty}U_{n}$ is dense in $X$.

> **Solution: 1B：Baire Category Thm 在不 complete MS 中的反例**
>
> 考虑 $\mathbb{Q}$ 的 usual metric。令 $\left\{ q_{n} \right\}$ 枚举所有既约分数；对于任意 $n \in \mathbb{N}$，取 $U_{n} = \mathbb{Q}\{ q_{n}\}$。每个 $U_{n}$ 都是 $\mathbb{Q}$ 中 dense and open set， 但是 $\bigcap_{n}U_{n} = \varnothing$。

## 1C：证明 Baire Category Thm

原 worksheet 接着要求用 nested balls 证明：从任意 ball 出发，选择 $x_{i + 1}$ 与 $0 < r_{i + 1} < \frac{r_{i}}{2}$，使得 $\bar{B_{r_{i+1}}\left( x_{i+1} \right)} \subseteq B_{r_{i}}\left( x_{i} \right) \cap U_{i + 1}$; prove $\left( x_{i} \right)$ 是 Cauchy，并识别其 limit。1D 再要求推出：每点都是 limit point 的 nonempty complete metric space 必为 uncountable。

## Why not measure every subset?

> **Definition: Middle-thirds Cantor set**
>
> Begin with $C = \left\lbrack {0,1} \right\rbrack$ and remove the middle third at each stage. The set $C = \bigcap_{n = 1}^{\infty}C_{n}$ is the middle-thirds Cantor set; $C_{n}$ is a union of $2^{n}$ closed intervals, each of length $3^{- n}$.

The migrated problems ask to show that $C$ is nonempty and compact, every point is a limit point, $C$ is uncountable by Baire category, and $C$ contains no interval. Its stage-$n$ total length is $\left( \frac{2}{3} \right)^{n}$, motivating a notion of measure beyond intervals.

> **Remark: 来源中文批注**
>
> Cantor set 是一个 compact 且 closed 的集合（甚至 perfect）；由于它在 $\mathbb{R}^{n}$ 中，它还是 complete metric space。它 uncountable，却不包含任何 open interval；来源同时标注其 Lebesgue measure 为 $0$。

> **Definition: Vitali-type obstruction**
>
> On $\left\lbrack {0,1} \right)$ define $x \sim y$ when $x - y \in \mathbb{Q}$. Choose one representative from each equivalence class, forming $N$. For $r \in \mathbb{Q} \cap \left\lbrack {0,1} \right)$, let $N_{r}$ be the translate of $N$ by $r$, taken modulo one.

> **Theorem: No translation-invariant countably additive measure on every subset**
>
> The sets $N_{r}$ are disjoint and their union is $\left\lbrack {0,1} \right)$. If a function on all subsets were countably additive, invariant under rigid motions, and normalized by $m\left( \left\lbrack {0,1} \right) \right) = 1$, then all $N_{r}$ would have a common measure. It would be either zero or positive, forcing the union's measure to be either zero or infinity --- a contradiction.

> **Solution: 来源中的中文归谬说明**
>
> 我们想测量 $\mathbb{R}^{n}$ 子集的「长度」，希望它对可数个 disjoint sets closed under addition，对通过 translate、rotation 或 reflection 得到的 congruent sets 取相同 measure，并且精准满足 $m\left( \left\lbrack {0,1} \right) \right) = 1$。但是把 $\left\lbrack {0,1} \right)$ 中相差 rational 的点分成 congruent classes（所有 rational 都进入同一类；不同的 irrational roots 与 transcendental numbers 会形成各自的 classes），并把 $\left\lbrack {0,1} \right)$ 的 rationals 放入 $R$、在每一类取一点组成 $N$。任取 $r \in R$，对 $N$ 作 circular translate 得到 $N_{r}$；每个 $N_{r}$ 的 measure 相同，且它们的 disjoint union 是 $\left\lbrack {0,1} \right)$。$m(N) = 0$ 与 $m(N) \neq 0$ 都导致矛盾。

The source explicitly notes that merely replacing countable additivity by finite additivity does not solve this problem: Banach--Tarski supplies a finite-piece obstruction in three dimensions. The conclusion is to measure a proper family of subsets rather than every subset of $\mathbb{R}^{d}$.

## Elementary and pixel measure

> **Definition: Boxes, elementary sets, and elementary measure**
>
> An interval is any of $\left\lbrack {a,b} \right\rbrack$, $\left\lbrack {a,b} \right)$, $\left( {a,b} \right\rbrack$, or $\left( {a,b} \right)$, with length $b - a$. A box is a Cartesian product of intervals; its volume is the product of their lengths. An elementary set is a finite union of boxes. After writing it as a finite disjoint union $\bigcup_{i}B_{i}$, define $m(E) = \sum_{i}\left| B_{i} \right|$.

The source's problem sequence establishes closure of elementary sets under union, intersection, difference, symmetric difference, and translation; it then asks for a disjoint-box decomposition and well-definedness of $m$. A lattice-counting route is recorded: scale the number of lattice points in $B \cap \left( \frac{1}{N} \right)\mathbb{Z}^{d}$ by $N^{- d}$ and pass to the limit.

It then asks for finite additivity on disjoint elementary sets, monotonicity, and finite subadditivity for arbitrary finite collections. The pixel-measure exercise is deliberately retained as a counterexample prompt, since the source does not supply a completed personal answer.

> **Theorem: Elementary-measure properties**
>
> For elementary sets, elementary measure is finitely additive on disjoint unions, monotone, and finitely subadditive.

> **Remark**
>
> The exploratory "pixel measure" The pixel measure is the limit of $N^{- d}$ times the number of lattice points in $E \cap \left( \frac{1}{N} \right)\mathbb{Z}^{d}$. It is not translation invariant whenever both displayed limits exist; the source asks for an explicit example.

## Jordan measure and Riemann integrability

> **Definition: Jordan inner and outer measure**
>
> For bounded $E \subseteq \mathbb{R}^{d}$, ${\underset{¯}{m}}_{J{(E)}} = \sup_{A \subseteq E,A\ \text{elementary}}m(A)$ and ${\bar{m}}_{J{(E)}} = \inf_{B \supseteq E,B\ \text{elementary}}m(B)$. The set is Jordan measurable when these agree.

> **Theorem: Jordan measurability criteria**
>
> A bounded set is Jordan measurable exactly when it can be sandwiched between elementary sets $A \subseteq E \subseteq B$ with $m\left( {BA} \right)$ arbitrarily small; equivalently, it can be approximated in Jordan outer measure by an elementary set. Its boundary has Jordan outer measure zero exactly when it is Jordan measurable.

The retained problem set establishes that elementary sets are Jordan measurable, then asks for closure under union, intersection, difference, and symmetric difference, as well as finite additivity, monotonicity, finite subadditivity, and translation invariance. It asks to prove that the graph of a continuous function on a closed box has Jordan measure zero and that the region below such a graph is Jordan measurable.

The next chapter asks to prove that open and closed balls are Jordan measurable with measure $c_{d}r^{d}$, to bound $c_{d}$, and to compare a bounded set with its closure and interior. It gives the boundary criterion above. Finally it defines lower and upper Darboux integrals through a partition $a = x_{0} < x_{1} < \ldots < x_{n} = b$ and asks to show that a bounded nonnegative $f$ is Riemann integrable exactly when its subgraph is Jordan measurable.

# IBL: Lebesgue outer measure

> **Definition: Lebesgue outer measure**
>
> For $E \subseteq \mathbb{R}^{d}$, $m^{\ast}(E) = \inf_{E \subseteq \bigcup_{j = 1}^{\infty}B_{j}}\sum_{j = 1}^{\infty}\left| B_{j} \right|$, where the cover is by boxes. This replaces the finite covers in Jordan outer measure by countable covers.

> **Theorem: Basic outer-measure facts**
>
> $m^{\ast}(\varnothing) = 0$; if $E \subseteq F$, then $m^{\ast}(E) \leq m^{\ast}(F)$; and $m^{\ast}\left( {\bigcup_{n}E_{n}} \right) \leq \sum_{n = 1}^{\infty}m^{\ast}\left( E_{n} \right)$.

对 monotonicity，来源的中文批注是「trivial. 每个 $F$ 的覆盖也覆盖了 $E$」； 这正是 $E \subseteq F$ 时外测度不增的覆盖论证。

来源对 countable subadditivity 的中文证明思路是：为序列中每个集合创造一个 可数覆盖，得到一个 double union；再用 $\frac{\varepsilon}{2^{n}}$ 控制每个集合的覆盖和 与它的 Lebesgue outer measure 的差距，从而把双累加变成单累加。

The IBL problems record that a Jordan-measurable set can be outer-approximated by an elementary set; $m^{\ast}(E) \leq {\bar{m}}_{J{(E)}}$; the defining covers may be restricted to open or closed boxes; and every countable set has outer measure zero. The proof sketch preserves the source's $\frac{\varepsilon}{2^{n}}$ allocation for the countable cover.

> **Remark: 来源中文批注**
>
> Jordan measurable 的意义是可以 outer-approximate by elementary set。关于 closed/open boxes 的定义限制，来源指出 boundary 的 Jordan measure 为 $0$， 可以在每个 open box 内用误差小于 $\frac{\varepsilon}{2^{n}}$ 的 closed boxes 覆盖；dually 亦然。对于 countable set，只需对每个点给出体积小于对应 $\frac{\varepsilon}{2^{n}}$ 的 box 覆盖，因此其 Lebesgue outer measure 总是 $0$；这也 说明 Lebesgue measure 比 Jordan measure 更好。

> **Definition: Lebesgue measurability --- course definition**
>
> A set $E \subseteq \mathbb{R}^{d}$ is Lebesgue measurable if for each $\varepsilon > 0$ there is an open $U \supseteq E$ with $m^{\ast}\left( {UE} \right) \leq \varepsilon$. Its Lebesgue measure is $m(E) = m^{\ast}(E)$.

> **Theorem: elementary set 的 Lebesgue measure 就是 elementary measure**
>
> If $E$ is elementary, then $m^{\ast}(E) = m(E)$, where the right side is elementary measure.

来源中的证明记录为：$m^{\ast}(E) \leq m(E)$ 显然；反向不等式则对任意 ctbl covering 取一个 disjoint cover。后一步的具体推导在来源中未完成，故这里不补造。

> **Theorem: dist\>0 的集合外测度 union additive；ctbl 个 almost disjoint boxes**
>
> If $\text{dist}\left( {E,F} \right) > 0$, then $m^{\ast}\left( {E \cup F} \right) = m^{\ast}(E) + m^{\ast}(F)$. If $E$ is a countable union of almost-disjoint boxes $B_{k}$, then $m^{\ast}(E) = \sum_{k}\left| B_{k} \right|$.

关于从 finite 到 countable 的过渡，来源的中文提示为：「extend finite to countable by continuing the seq using empty sets 即可得到。」

## Lebesgue measure 的大小处于 Jordan outer/inner measure 之间

来源把这一节保留为由 elementary measure 与 outer measure 比较得出的结论， 并单独要求构造 non-Jordan-measurable 的 bounded open set，以及证明 ctbl 个 almost disjoint boxes 的 outer-measure union additivity。

> **Example: example：non J-measurable 的 open set**
>
> Enumerate the rationals in $\left\lbrack {0,1} \right\rbrack$ and cover the $n$th rational by an open interval whose lengths form a summable sequence. The union can have arbitrarily small outer measure but dense complement structure that prevents Jordan measurability, exactly as posed in the source.

来源的 personal solution 只写到「我们首先 list 出 $\left\lbrack {0,1} \right\rbrack$ 之间的 ratioals， 称为 $\left( q_{n} \right)$。我们对于每个......」便中断；这里保留其不完整状态，而不把后续构造 误标为来源解答。

# IBL: regularity, measurability, and additivity

> **Theorem: $\mathbb{R}^{n}$ 中任意开集都是一个 ctbl union of almost disjoint boxes**
>
> Every open subset of $\mathbb{R}^{d}$ is a countable union of almost-disjoint boxes; the source gives a dyadic construction selecting boxes not already chosen at earlier scales.

The source's construction starts with unit grid boxes contained in an open set, then repeats at dyadic scales after removing boxes selected earlier. It asks to verify that their union is the original open set and that interiors do not overlap.

来源的中文批注说，这与在 $\mathbb{R}$ 上用 ctbl closed intervals 逼近任意 open interval 如出一辙；随后给出的 process 只是更 generalized 的算法。

> **Theorem: Outer regularity**
>
> For every $E \subseteq \mathbb{R}^{d}$, $m^{\ast}(E) = \inf_{E \subseteq U,U\ \text{open}}m^{\ast}(U)$.

> **Remark**
>
> The reverse inner approximation by open subsets is false in general; the source asks for a counterexample and foreshadows compact inner regularity.

## outer regularity 的 dual 并不正确

来源要求给出反例，说明不能用 contained open sets 的 outer measure supremum 来代替 outer regularity；正确的 inner regularity 要以 compact sets 逼近。

## Closure properties of measurable sets

> **Theorem: Null sets are measurable**
>
> Every set of outer measure zero is Lebesgue measurable.

> **Theorem: Countable unions, complements, and intersections**
>
> A countable union of Lebesgue measurable sets is measurable. Complements of measurable sets are measurable, and hence countable intersections are measurable.

来源的中文证明提示为：$\mathbb{N}^{2}$ 也是 ctbl 的。对每个 $E_{n}$ 都选取一个 open cover，最后的 double union 仍是 countable open cover；取任意 $\varepsilon$， 再用 $\frac{\varepsilon}{2^{n}}$ bound 每个 $E_{n}$ 与其 cover 的差距即可。

> **Theorem: Closed sets are measurable**
>
> Every closed subset of $\mathbb{R}^{d}$ is Lebesgue measurable. The recorded approach reduces to compact pieces and uses the almost-disjoint-box decomposition of an open complement.

The recorded proof plan writes an unbounded closed set as a countable union of closed bounded pieces, reduces to compact sets, and decomposes their open complements into almost-disjoint closed cubes.

## Approximation and regularity

> **Definition: Symmetric difference**
>
> $A \bigtriangleup B = \left( {AB} \right) \cup \left( {BA} \right)$. The source notes $A \bigtriangleup B \subseteq \left( {A \bigtriangleup C} \right) \cup \left( {C \bigtriangleup B} \right)$.

> **Remark: 来源中文批注**
>
> sym diff 越加入更多 set 越大；这正是 $A \bigtriangleup B \subseteq \left( {A \bigtriangleup C} \right) \cup \left( {C \bigtriangleup B} \right)$ 的直观来源。

> **Theorem: Approximation by open sets**
>
> $E$ is measurable if and only if for every $\varepsilon > 0$ there is an open $U$ with $m^{\ast}\left( {E \bigtriangleup U} \right) \leq \varepsilon$.

For the difficult direction, the IBL notes choose open $U_{n}$ with errors $\frac{\varepsilon}{2^{n + 67}}$, take their union, then cover the remaining null set by an open set of small outer measure. This preserves the original proof strategy without inventing its omitted final estimates.

来源的中文说明强调：和 9D 一样，当希望两个相近集合具有包含关系、但已知条件 又不能直接构造包含关系时，可以先用近似条件构造 measure 无限接近的序列，再经由 intersection 得到一个 measure $0$ set，最后通过交、并、补得到所需关系。它还 指出 ordinary set diff 的 measure 总小于等于 sym diff 的大小，以此估计 $m^{\ast}\left( {U \smallsetminus E} \right)$。

> **Theorem: Inner regularity**
>
> If $E$ is measurable, then $m^{\ast}(E) = \sup_{K}m^{\ast}(K)$ as $K$ ranges over compact subsets of $E$. The source also records the equivalent approximation by closed sets in symmetric difference.

> **Theorem: Countable additivity**
>
> For pairwise disjoint Lebesgue measurable sets $\left( E_{n} \right)$, $m\left( {\bigcup_{n = 1}^{\infty}E_{n}} \right) = \sum_{n = 1}^{\infty}m\left( E_{n} \right)$.

The explicit $\frac{\varepsilon}{2^{n}}$ exercise is retained: with $a_{n,m} = \frac{1}{nm}$, one must not interchange an infimum and an infinite sum without a valid argument.

# IBL: limits and Carathéodory's criterion

> **Theorem: Jordan measurable implies Lebesgue measurable**
>
> Every Jordan measurable subset of $\mathbb{R}^{n}$ is Lebesgue measurable. The source points to the zero-boundary characterization as the route to the proof.

> **Theorem: Continuity from below**
>
> For measurable $E_{1} \subseteq E_{2} \subseteq \ldots$, $m\left( {\bigcup_{k = 1}^{\infty}E_{k}} \right) = \lim_{k\rightarrow\infty}m\left( E_{k} \right)$.

The source suggests taking the disjoint increments $F_{k} = E_{k}\bigcup_{i = 1}^{k - 1}E_{i}$ and applying countable additivity.

> **Theorem: Continuity from above**
>
> For measurable $E_{1} \supseteq E_{2} \supseteq \ldots$, if some $E_{k}$ has finite measure, then $m\left( {\bigcap_{k = 1}^{\infty}E_{k}} \right) = \lim_{k\rightarrow\infty}m\left( E_{k} \right)$.

> **Remark**
>
> The finite-measure assumption in continuity from above is necessary; the source asks for a counterexample when it is dropped.

> **Theorem: Finite-measure approximation by elementary sets**
>
> A finite-measure set $E \subseteq \mathbb{R}^{n}$ is measurable exactly when it differs from an elementary set by a set of arbitrarily small outer measure.

> **Theorem: Carathéodory's criterion --- elementary test sets**
>
> A set $E \subseteq \mathbb{R}^{n}$ is measurable if and only if for every elementary set $A$, $m(A) = m^{\ast}\left( {A \cap E} \right) + m^{\ast}\left( {AE} \right)$.

The source remarks that some texts use this elementary-test identity as the definition of measurability. Its final linear-map problem asks for the precise Jacobian factor $\left| {\det T} \right|$, including singular linear maps.

> **Theorem: Linear change of measure**
>
> If $E \subseteq \mathbb{R}^{n}$ is measurable and $T:\mathbb{R}^{n}\rightarrow\mathbb{R}^{n}$ is linear, then $T(E)$ is measurable and $m\left( {T(E)} \right) = \left| {\det T} \right|m(E)$.

# HW 1

## Problem A

Suppose $\left( {X,d} \right)$ is a metric space. For $0 < \varepsilon < 1$, show that $d^{\varepsilon}$ is a metric on $X$. If $X = \left\lbrack {0,1} \right\rbrack$ has its usual metric, show that $X$ has "infinite length" using $\sum_{i = 1}^{n}d^{\varepsilon{({t_{i},t_{i - 1}})}}$.

**Proof.** Take $x,y,z \in X$. Positivity and symmetry are immediate: ${d\left( {x,y} \right)}^{\varepsilon} \geq 0$, with equality exactly when $x = y$, and ${d\left( {x,y} \right)}^{\varepsilon} = {d\left( {y,x} \right)}^{\varepsilon}$. Let $f(r) = r^{\varepsilon}$ for $r \geq 0$. Then $f'(r) = \varepsilon r^{\varepsilon - 1} \geq 0$ and $f^{''}(r) = \varepsilon\left( {\varepsilon - 1} \right)r^{\varepsilon - 2} \leq 0$, so $f$ is increasing and concave. Thus

$f\left( {d\left( {x,y} \right)} \right) + f\left( {d\left( {y,z} \right)} \right) \geq f\left( {d\left( {x,y} \right) + d\left( {y,z} \right)} \right) \geq f\left( {d\left( {x,z} \right)} \right)$.

Hence $d^{\varepsilon{({x,y})}} + d^{\varepsilon{({y,z})}} \geq d^{\varepsilon{({x,z})}}$, completing the metric axioms.

For the length claim, take an equally spaced partition into $n$ subintervals. Then $t_{i} - t_{i - 1} = \frac{1}{n}$ and

$\sum_{i = 1}^{n}d^{\varepsilon{({t_{i},t_{i - 1}})}} = {n\left( \frac{1}{n} \right)}^{\varepsilon} = n^{1 - \varepsilon}$.

Since $1 - \varepsilon > 0$, these sums are unbounded above, so for every $M \in {\mathbb{N}}$ some partition has sum greater than $M$.

## Bonus problem

If $X$ is $a \times b$, $Y$ is $b \times c$, ordinary multiplication takes $abc$ scalar multiplications. For

$A_{1}:5 \times 1,\quad A_{2}:1 \times 5,\quad A_{3}:5 \times 2,\quad A_{4}:2 \times 5,\quad A_{5}:5 \times 1,\quad A_{6}:1 \times 10$,

find the cheapest parenthesization. The submitted parenthesization is

$\left( {\left( {A_{1}\left( {A_{2}A_{3}} \right)} \right)\left( {A_{4}A_{5}} \right)} \right)A_{6}$.

Let $m\left( {i,j} \right)$ be the minimal cost for multiplying the matrix chain from $A_{i}$ through $A_{j}$. The recursion used was

$m\left( {i,j} \right) = \min_{i \leq k < j}\left( {m\left( {i,k} \right) + m\left( {k + 1,j} \right) + \text{row}\left( A_{i} \right)\ \text{col}\left( A_{k} \right)\ \text{col}\left( A_{j} \right)} \right)$.

The dynamic-programming calculations recorded on the page are

$m\left( {1,3} \right) = \min\left( {25 + 5 \ast 5 \ast 2,10 + 5 \ast 1 \ast 2} \right) = 20,$

$m\left( {2,4} \right) = \min\left( {25 + 50,10 + 10} \right) = 20,\quad m\left( {3,5} \right) = \min\left( {50 + 25,10 + 10} \right) = 20,$

$m\left( {4,6} \right) = \min\left( {10 + 20,50 + 100} \right) = 30,$

$m\left( {1,4} \right) = \min\left( {20 + 50,25 + 50 + 125,20 + 25} \right) = 45,$

$m\left( {2,5} \right) = 22,\quad m\left( {3,6} \right) = 70,\quad m\left( {1,5} \right) = 27,$

$m\left( {2,6} \right) = 32,\quad m\left( {1,6} \right) = 77.$

Thus the final answer costs $77$ scalar multiplications.

# HW 2

## Problem A

If $\| \cdot \|$ is a norm on a vector space $V$, then $d\left( {x,y} \right) = \| x - y\|$ is a metric. For $x,y,z \in V$, positivity gives $\| x - y\| \geq 0$, with equality iff $x = y$; homogeneity gives $\| y - x\| = \| - \left( {x - y} \right)\| = \| x - y\|$; and

$\| x - y\| = \|\left( {x - z} \right) + \left( {z - y} \right)\| \leq \| x - z\| + \| z - y\|.$

Thus a norm induces a metric.

## Problem B

For a linear $T:V_{1}\rightarrow V_{2}$, the operator norm is $\| T\| = \sup_{v \neq 0}\| Tv\frac{\|_{2}}{\|}v\|_{1} = \sup_{\| v\|_{1} = 1}\| Tv\|_{2}$. If $\| T\| = C < \infty$, then $\| Tv - Tw\|_{2} = \| T\left( {v - w} \right)\|_{2} \leq C\| v - w\|_{1}$, so $\delta = \frac{\varepsilon}{C}$ proves continuity. Conversely, continuity at $0$ gives $\delta > 0$ such that $\| Tv\|_{2} < 1$ for $\| v\|_{1} < \delta$. Applying this to $\left( \frac{\delta}{2} \right)w$ with $\| w\|_{1} = 1$ gives $\| Tw\|_{2} < \frac{2}{\delta}$. Hence $T$ is bounded.

## Problem C

An unbounded linear map is the derivative $T:C\left\lbrack {0,1} \right\rbrack\rightarrow{\mathbb{R}}$, with the sup norm on the domain. For $f_{n{(x)}} = \frac{\sin\left( {nx} \right)}{n}$, $\| f_{n}\|_{\infty} \leq \frac{1}{n}$, while $\| Tf_{n}\| = \|\cos\left( {nx} \right)\|_{\infty} = 1$. Therefore the ratios are at least $n$.

## Problem D

Take $T_{i} = \left( {\left( {1,i} \right),\left( {0,1} \right)} \right)$. Every $T_{i}$ is diagonalizable with eigenvalues $1,1$. For $v_{i} = \left( {1,i} \right)^{T}$, $\| T_{i}v_{i}\frac{\|_{2}}{\|}v_{i}\|_{2} = \frac{\sqrt{1 + 2i^{2}}}{\sqrt{1 + i^{2}}} > i$, so $\| T_{i}\|\rightarrow\infty$ although the eigenvalues are bounded.

## Problem E

If $S$ is totally bounded, for every $n$ choose a finite $\frac{1}{n}$-cover with centres $x_{i}^{n}$. The union of the centres is countable and dense: every $x \in S$ either occurs among them or is the limit of selected centres at distance $< \frac{1}{n}$. Hence $S$ is separable.

## Problem F

Let $X$ be countably many copies of $\left\lbrack {0,1} \right\rbrack$ with their left endpoints glued. Write points as $\left\lbrack \left( {i,x} \right) \right\rbrack$ and use $\left. d\left( {\left\lbrack \left( {i,x} \right) \right\rbrack,\left\lbrack \left( {j,y} \right) \right\rbrack} \right) = \middle| x \middle| + \middle| y| \right.$ if $i \neq j$, and $|x - y|$ if $i = j$. It is bounded. At radius $\frac{1}{2}$, a ball can cover at most one of the points from distinct far ends, since two such points have distance $2$. Thus infinitely many balls are needed and $X$ is not totally bounded.

## Problem G

For $Q \subset c_{0}$ with the sup metric, total boundedness is equivalent to boundedness plus: for every $\varepsilon > 0$, some $N$ has $\left. |x_{n} \middle| < \varepsilon \right.$ for every $x \in Q$ and $n \geq N$. A finite cover proves the tail condition by contradiction (choose increasingly far non-small entries and form a separated subsequence). Conversely, partition the first $N$ bounded coordinates into finitely many pieces of length $\frac{\varepsilon}{2}$ and combine this finite head cover with the $\frac{\varepsilon}{2}$ tail bound.

## Bonus problem

For a countable dense set $E = \left\{ p_{n} \right\}$ in $X$, define $f(x) = \left( {d\left( {x,p_{n}} \right) - d\left( {x_{0},p_{n}} \right)} \right)_{n \in {\mathbb{N}}}$. Triangle inequality makes this bounded and gives $\| f(x) - f(y)\|_{\infty} \leq d\left( {x,y} \right)$. Along a subsequence $p_{n_{j}}\rightarrow x$, the coordinate differences tend to $d\left( {x,y} \right)$, so equality holds. This is an isometric embedding into $\ell^{\infty{(N)}}$.

# HW 3

## Problem A

For a Lipschitz map $f:X\rightarrow Y$ with constant $C$, $d_{2}\left( {f(x),f(y)} \right) \leq Cd_{1}\left( {x,y} \right)$. Taking $\delta = \frac{\varepsilon}{C}$ proves uniform continuity. If $f_{n}$ have one common Lipschitz constant $C$ and converge uniformly to $f$, then $d\left( {f(x),f(y)} \right) \leq d\left( {f(x),f_{n{(x)}}} \right) + Cd\left( {x,y} \right) + d\left( {f_{n{(y)}},f(y)} \right)$. Letting the uniform error tend to zero proves that $f$ is also Lipschitz with constant $C$. Without a common constant this is false: on $\left( {0,\infty} \right)$, $f_{n{(x)}} = \sqrt{x + \frac{1}{n}}$ converge uniformly to $\sqrt{x}$, which is not Lipschitz near $0$.

## Problem B

If $X$ is connected and $f:X\rightarrow Y$ is continuous, then $f(X)$ is connected: a separation $f(X) = B_{1} \cup B_{2}$ pulls back to a separation of $X$. Consequently a continuous $f:X\rightarrow{\mathbb{R}}$ assumes every intermediate value between $\inf f$ and $\sup f$.

## Problem C

For a continuous bijection $f:X\rightarrow Y$ with $X$ compact, $f^{- 1}$ is continuous. A closed $B \subset X$ is compact, hence $f(B)$ is compact and closed in the metric space $Y$. Thus $f$ is a closed map. Compactness is necessary: $\left\lbrack {0,2\pi} \right)\rightarrow S^{1}$, $t\mapsto e^{it}$, is a continuous bijection whose inverse is discontinuous at $1$.

## Problem D

If $D_{v}f(p)$ exists, then $D_{cv}f(p) = cD_{v}f(p)$: for $c \neq 0$ substitute $h = ct$ in the defining limit, and $c = 0$ is immediate. For $f\left( {x,y} \right) = \sqrt{|xy|}$ at $\left( {0,0} \right)$, the derivatives in $\left( {1,0} \right)$ and $\left( {0,1} \right)$ are $0$, but that in $\left( {1,1} \right)$ does not exist because $|t\frac{|}{t}$ has unequal one-sided limits. For $f\left( {x,y} \right) = x\frac{y^{2}}{x^{2} + y^{2}}$ off the origin and $0$ at it, $D_{a,b}f\left( {0,0} \right) = 0$ when $\left( {a,b} \right) = 0$, and $D_{a,b}f\left( {0,0} \right) = a\frac{b^{2}}{a^{2} + b^{2}}$ otherwise. This formula is not linear in the direction, though polar coordinates show continuity at the origin.

## Problem E

The Baire Category Theorem was written as: in a complete metric space, every countable intersection of open dense subsets is dense.

## Problem F

Let $N \subset \left\lbrack {0,1} \right\rbrack$ select one element from each class modulo $\mathbb{Q}$. The translations $N_{r}$ form a disjoint decomposition of $\left\lbrack {0,1} \right\rbrack$. A countably additive, translation-invariant measure on every subset with $m\left( \left\lbrack {0,1} \right\rbrack \right) = 1$ would make all $N_{r}$ have the same measure; this gives either $0$ or infinity for the interval. Therefore the stipulated measure does not exist.

## Bonus problem

The Cantor set is uniformly disconnected by its middle-third gaps. The recorded equivalent ultrametric is the infimum of $\varepsilon$ for which an $\frac{\varepsilon}{d\left( {x,y} \right)}$-chain joins $x$ to $y$. Concatenating chains yields the ultrametric inequality. Conversely, if $\frac{d'}{C} \leq d \leq Cd'$ and $d'$ is ultrametric, the $\varepsilon = \frac{1}{2C}$ chain would force $d'\left( {x,y} \right) \leq d'\frac{x,y}{2}$, impossible for distinct points.

# HW 4

## Problem A

Let $F:{\mathbb{R}}^{n}\rightarrow{\mathbb{R}}^{m}$ satisfy $F\left( {tx} \right) = tF(x)$ for every $t > 0$ and suppose $F$ is differentiable at $0$. Put $r(h) = F(h) - F(0) - DF(0)h = F(h) - DF(0)h$. Homogeneity gives $r\left( {th} \right) = tr(h)$. If $r\left( h_{0} \right) \neq 0$, then $\| r\left( {th_{0}} \right)\frac{\|}{\|}th_{0}\| = \| r\left( h_{0} \right)\frac{\|}{\|}h_{0}\| > 0$ for every $t > 0$, contradicting differentiability as $t\rightarrow 0$. Hence $F(h) = DF(0)h$, so $F$ is linear.

## Problem B

For $f:A \subset {\mathbb{R}}^{n}\rightarrow{\mathbb{R}}^{m}$, if all partial derivatives exist and are bounded on the open set $A$, then $f$ is continuous. Write $x = x_{0} + h$ and pass from $x_{0}$ to $x$ one coordinate at a time: $p_{0} = x_{0}$, $p_{i} = p_{i - 1} + h_{i}e_{i}$. Applying the one-variable mean value theorem to $s\mapsto f_{i{({p_{i - 1} + se_{i}})}}$ gives $\left. |f_{i{(p_{i})}} - f_{i{(p_{i - 1})}} \middle| \leq M \middle| h_{i}| \right.$. Summing coordinate and target components yields $\| f(x) - f\left( x_{0} \right)\| \leq nM\| x - x_{0}\|$.

## Problem C

For $f\left( {r,\theta} \right) = \left( {r\cos\theta,r\sin\theta} \right)$, $Df = \left( {\left( {\cos\theta, - r\sin\theta} \right),\left( {\sin\theta,r\cos\theta} \right)} \right)$ and $\det Df = r$. On $S = \left\lbrack {1,2} \right\rbrack \times \left\lbrack {0,\frac{\pi}{2}} \right\rbrack$, $f(S)$ is the quarter-annulus $1 \leq x^{2} + y^{2} \leq 4$, $x,y \geq 0$. The inverse is $\left( {x,y} \right)\mapsto\left( {\sqrt{x^{2} + y^{2}},\arctan\left( \frac{y}{x} \right)} \right)$, continuous on this set. Its derivative is $Df^{- 1} = \frac{1}{r}\left( {\left( {\cos\theta,\sin\theta} \right),\left( {- \sin\theta,\cos\theta} \right)} \right)$ and $DfDf^{- 1} = I_{2}$.

## Problem D

Take $F\left( {x,y} \right) = \left( {x^{2}\frac{y}{x^{2} + y^{2}},x\frac{y^{2}}{x^{2} + y^{2}}} \right)$ away from $0$ and $F(0) = 0$. Every directional derivative at $0$ is $\left( {0,0} \right)$, yet along $\left( {x_{n},y_{n}} \right) = \left( {\frac{1}{n},\frac{1}{n}} \right)$ the quotient of $F\left( {x,y} \right)$ by $\sqrt{x^{2} + y^{2}}$ does not tend to $0$, so $F$ is not differentiable at the origin.

## Problem E

For $f(0) = 0$ and $f\left( {x,y} \right) = x\frac{y\left( {x^{2} - y^{2}} \right)}{x^{2} + y^{2}}$ off $0$, the first partials at $0$ are $0$. Off $0$, product and quotient rules give

$f_{x} = \frac{y\left( {x^{2} - y^{2}} \right)}{x^{2} + y^{2}} + 4x^{2}\frac{y^{3}}{\left( {x^{2} + y^{2}} \right)^{2}},$

$f_{y} = \frac{x\left( {x^{2} - y^{2}} \right)}{x^{2} + y^{2}} - 4x^{3}\frac{y^{2}}{\left( {x^{2} + y^{2}} \right)^{2}}.$

Both tend to $0$ at the origin (each term is bounded by a multiple of $|y|$ or $|x|$), so $f \in C^{1}\left( {\mathbb{R}}^{2} \right)$. The mixed partials are equal off $0$, while at $0$ direct difference quotients give $\partial_{x}\partial_{y}f(0) = \partial_{y}\partial_{x}f(0) = - 1$.

## Bonus problem

In an ultrametric space, $B_{r{(c)}}$ is closed: if $a$ lies outside it and $z \in B_{r{(a)}}$, then $d\left( {z,c} \right) \leq \max\left( {d\left( {z,a} \right),d\left( {a,c} \right)} \right)$ would otherwise contradict $d\left( {a,c} \right) \geq r$. Intersecting balls are nested: if $r \leq s$ and $a$ belongs to both $B_{r{(x)}}$ and $B_{s{(y)}}$, then $z \in B_{r{(x)}}$ satisfies $d\left( {z,y} \right) < s$, hence $B_{r{(x)}} \subset B_{s{(y)}}$. Thus every point of a ball is a centre.

For a connected weighted graph, define $d\left( {v,w} \right)$ as the least possible largest edge-weight along a path. Concatenating a best $v$-$z$ path and a best $z$-$w$ path yields $d\left( {v,w} \right) \leq \max\left( {d\left( {v,z} \right),d\left( {z,w} \right)} \right)$. Conversely, from a finite ultrametric space, join every pair with an edge weighted by its distance; the least maximum path weight is the original metric.

# HW 5

## Problem A

For $F:{\mathbb{R}}^{3}\rightarrow{\mathbb{R}}^{3}$,

$F\left( {x,y,z} \right) = \left( {\exp\left( {x^{2} + 2y^{2}} \right),\sin\left( {z^{2} - y^{2}} \right)\left( {x^{2} + 2z^{2}} \right),\left( {x^{2} + y^{2} + z^{2}} \right)^{9}} \right)$,

each component is a composition or product of smooth elementary functions, hence $F$ is differentiable. Factor $F = F_{2}oF_{1}$ with $F_{1}\left( {x,y,z} \right) = \left( {x,x^{2} + 2y^{2},x^{2} + 2z^{2}} \right)$ and $F_{2}\left( {a,b,c} \right) = \left( {\exp(a),b\sin(c),\left( {a + b} \right)^{9}} \right)$. The displayed $DF_{1}$ has third row equal to half the difference of the second and first rows, so $\det DF_{1} = 0$. Chain rule gives $\det DF = 0$.

## Problem B

If differentiable maps $F:A \subset {\mathbb{R}}^{n}\rightarrow B \subset {\mathbb{R}}^{m}$ and $G:B\rightarrow A$ are inverse, then $DG\left( {Fx} \right)DF(x) = I_{n}$ and $DF\left( {Gy} \right)DG(y) = I_{m}$. Both products being identities forces $n = m$ and $D{F(a)}^{- 1} = DG(b)$ when $F(a) = b$.

## Problem C

$f(x) = x^{3}$ is a differentiable homeomorphism of $\mathbb{R}$, but $f^{- 1}(x) = \sqrt[3]{x}$ is not differentiable at $0$.

## Problem D

If $F:{\mathbb{R}}^{2}\rightarrow{\mathbb{R}}$ is continuous at $0$ and the iterated limits exist, each equals $F\left( {0,0} \right)$. For example, define $F\left( {h,k} \right) = \frac{h^{2} - k^{2}}{h^{2} + k^{2}}$ away from $\left( {0,0} \right)$ and $0$ there. Then $\lim_{h\rightarrow 0}\lim_{k\rightarrow 0}F\left( {h,k} \right) = 1$ while the reversed order is $- 1$.

## Problem E

The number of four-variable monomials of degree at most $10$ is $\left( \frac{14}{4} \right) = 1001$ (the red working also sums $\sum_{k = 0}^{10}\left( \frac{k + 3}{3} \right)$).

## Problem F

If $A \subset {\mathbb{R}}^{n}$ is open and connected, $F:A\rightarrow{\mathbb{R}}^{m}$ is differentiable, and $DF = 0$ on $A$, then $F$ is locally constant: join nearby $x,y$ by coordinate segments inside a small ball and use the one-variable mean value theorem on each segment. The set $\{ x:F(x) = F(a)\}$ is both open and closed in $A$, hence is all of $A$.

## Problem G

Leibniz's formula was proved by induction:

The displayed Leibniz formula differentiates the product of $f_{1}$ through $f_{m}$: $\partial^{k{({f_{1}f_{2}})}} = \sum_{|\alpha| = k}\frac{k!}{\alpha!}\partial^{\alpha_{1}}f_{1}\partial^{\alpha_{2}}f_{2}$, with the same multi-index distribution among all factors.

Differentiating the $k$ case and grouping every new multi-index $\beta$ with $\left. |\beta \middle| = k + 1 \right.$ gives coefficient $\sum_{i}k!\frac{\beta_{i}}{\beta} \neq \frac{\left( {k + 1} \right)!}{\beta!}$.

## Problem H

Let $T_{k}$ be the degree-$k$ Taylor polynomial centered at $x_{0}$. For the backward direction, Taylor's theorem writes $T_{k{(x)}} - f(x)$ as a remainder whose terms have $\left. |\alpha \middle| = k + 1 \right.$; bounding each monomial by $\left\| x \right\|^{k + 1}$ gives the required little-$o$ statement.

For the forward direction, the submitted work writes $f(x) - P(x) = c_{1}x^{\alpha^{1}} + \ldots + c_{m}x^{\alpha^{m}}$ and seeks to show the quotient by $\left\| x \right\|^{k}$ does not tend to zero. In Case 1, $\sum_{i}c_{i} \neq 0$, it chooses $x_{n} = \left( {t_{n},\ldots,t_{n}} \right)$ with $t_{n} = \frac{1}{n}$ and obtains a nonzero constant quotient. Case 2, $\sum_{i}c_{i} = 0$, ends with "idk". A subsequent attempted route states that a nonzero homogeneous polynomial of degree $k$ is not $o\left( \left\| x \right\|^{k} \right)$, using $x_{n} = t_{n}x_{0}$; it then notes that a degree-$k$ polynomial need not be homogeneous.

## Problem I

For $F\left( {x,y} \right) = f\left( {x^{2} + y^{2}} \right)$, chain rule gives $F_{x} = 2xf'\left( {x^{2} + y^{2}} \right)$ and $F_{y} = 2yf'\left( {x^{2} + y^{2}} \right)$, hence $xF_{y} = yF_{x}$. For the displayed composition problem, write $\varphi = \varphi_{m}o\varphi_{n}$ and apply the chain rule. At $\left( {1,1,1} \right)$ with $f = x^{2} + yz$, $g = y^{3} + xy$, $h = e^{x}$, both the formula and direct computation give

$D\varphi\left( {1,1,1} \right) = \left( {\left( {2e^{2} + 2,4,2} \right),\left( {0,1,4} \right)} \right).$

## Problems J and K

For the specified $f:{\mathbb{R}}^{2}\rightarrow{\mathbb{R}}^{3}$ and $g:{\mathbb{R}}^{3}\rightarrow{\mathbb{R}}^{2}$, the chain-rule calculation records $D\left( {gof} \right)(0) = \left( {\left( {6,13} \right),\left( {6,2} \right)} \right)$. The third order Taylor polynomial of $e^{x + y^{2}}$ at $0$ is

$1 + x + \frac{x^{2}}{2} + y^{2} + xy^{2} + \frac{x^{3}}{6}$.

## Positive definite matrices

For a real symmetric matrix $A$, positive definiteness implies invertibility and $x^{T}Ax > 0$, so the angle of $Ax$ with $x$ is acute. Conversely, the acute-angle condition gives $x^{T}Ax > 0$. In an orthonormal eigenbasis, $x^{T}Ax = \sum\lambda_{i}c_{i}^{2}$, proving positive definiteness iff every eigenvalue is positive. Each leading principal minor inherits positive definiteness; the forward direction of Sylvester's criterion follows. The submitted converse attempt is marked "didn't work at all."

# HW 7

## Problem A

For differentiable $f:A \subset {\mathbb{R}}^{n}\rightarrow{\mathbb{R}}$ and unit $u$, $D_{u}f(x) = Df(x)u = \nabla f(x) \cdot u$. Cauchy-Schwarz gives $D_{u}f(x) \leq \| Df(x)\|$, with equality precisely for $u = D\frac{f(x)}{\|}Df(x)\|$. Also $D_{u}f(x) = 0$ iff $u$ is orthogonal to $Df(x)$.

## Problem B

Let $M = c^{- 1}(0)$, $f:U\rightarrow{\mathbb{R}}$, $c:U\rightarrow{\mathbb{R}}$ be $C^{1}$, $f|_{M}$ have a local minimum at $p$, and $Dc(p)$ be surjective. Reorder coordinates so $\partial\frac{c}{\partial}x_{n{(p)}} \neq 0$. By IFT, locally $M = \{\left( {x,g(x)} \right):x \in B_{e{(a)}}\}$. For $h(x) = f\left( {x,g(x)} \right)$, $Dh(a) = 0$. Differentiating $c\left( {x,g(x)} \right) = 0$ gives $g_{x_{i}} = - \frac{c_{x_{i}}}{c_{x_{n}}}$, hence $f_{x_{i}}(p) - f_{x_{n}}(p)c_{x_{i}}\frac{p}{c_{x_{n}}}(p) = 0$ for every $i$. Put $\lambda = f_{x_{n}}\frac{p}{c_{x_{n}}}(p)$; then $Df(p) = \lambda Dc(p)$.

## Problems C-D

The intuitive explanation says that at a constrained minimum the gradient of $f$ is normal to all allowed directions, while $Dc(p)$ is normal to $M$, so the two gradients are parallel. For $f\left( {x,y} \right) = 3x + y$ on $x^{2} + y^{2} = 1$, $Df = \left( {3,1} \right) = \lambda\left( {2x,2y} \right)$. The critical points are $\left( {\frac{3}{\sqrt{10}},\frac{1}{\sqrt{10}}} \right)$ and its negative; the minimum is $- \sqrt{10}$ at $\left( {- \frac{3}{\sqrt{10}}, - \frac{1}{\sqrt{10}}} \right)$.

## Problem E

For $c:U\rightarrow{\mathbb{R}}^{k}$ with full rank $Dc(p) = k$, the stated generalization is $Df(p) = \sum_{i = 1}^{k}\lambda_{i}Dc_{i{(p)}}$. Split variables as $\left( {x,y} \right)$ with a nonsingular $\partial\frac{c}{\partial}y$ block. IFT writes $M$ locally as $\left( {x,g(x)} \right)$. The identities $Dh(a) = 0$ and $D\left( {c\left( {x,g(x)} \right)} \right) = 0$ combine to give $Df(p) = \left( {\partial\frac{f}{\partial}y} \right)\left( {\partial\frac{c}{\partial}y} \right)^{- 1}Dc(p)$.

## Problem F

Positive definite symmetric matrices form an open subset of symmetric matrices. For $A > 0$, the quadratic form $x^{T}Ax$ has positive minimum $m$ on the compact unit sphere. If $\| A - B\| < m$, then $x^{T}Bx = x^{T}Ax + x^{T{({B - A})}}x \geq m - \| B - A\| > 0$ on the sphere, and hence for all nonzero $x$.

## Problem G

If $f \in C^{2}(A)$, $x_{0}$ is critical, and $H_{f{(x_{0})}}$ is positive definite, continuity of the Hessian makes $H_{f}$ positive definite near $x_{0}$. Taylor's formula along the segment gives $f(x) - f\left( x_{0} \right) = \frac{1}{2}\left( {x - x_{0}} \right)^{T}H_{f{(c)}}\left( {x - x_{0}} \right) > 0$ for nearby $x \neq x_{0}$; hence a strict local minimum.

## Problem H

For an invertible matrix $A$ with cofactor matrix $C$, the diagonal entry $\left( {AC^{T}} \right)_{ij}$ equals $\det A$ when $i = j$ by cofactor expansion. For $i \neq j$, replace row $j$ by row $i$ to obtain a matrix with determinant $0$ whose cofactor expansion is $\left( {AC^{T}} \right)_{ij}$. Thus $AC^{T} = \left( {\det A} \right)I$, so $A^{- 1} = \frac{C^{T}}{\det A}$.

## Problem I

For differentiable $f,g:\left( {a,b} \right)\rightarrow{\mathbb{R}}^{n}$, $\left( {f \cdot g} \right)(t) = \sum_{i}f_{i{(t)}}g_{i{(t)}}$, and differentiating term by term gives $\left( {f \cdot g} \right)' = f' \cdot g + f \cdot g'$.

## Bonus

The epigraph of $f$ is convex iff $H_{f{(x)}}$ is positive semidefinite everywhere. For the forward direction, restrict $f$ to $x + tv$; convexity gives its second derivative $v^{T}H_{f{(x)}}v \geq 0$. For the converse, the same one-variable restriction has nonnegative second derivative, hence is convex, and this is exactly the epigraph inequality.

# HW 8

## Problem A

Let $f:{\mathbb{R}}^{3}\rightarrow{\mathbb{R}}^{2}$ be $C^{1}$, $f\left( {1,2,3} \right) = 0$, and

$Df\left( {1,2,3} \right) = \left( {\left( {1,2,1} \right),\left( {1, - 1,1} \right)} \right).$

The minors are $\det\left( {\partial\frac{f}{\partial\left( {x,y} \right)}} \right) = - 3$, $\det\left( {\partial\frac{f}{\partial\left( {y,z} \right)}} \right) = 3$, and $\det\left( {\partial\frac{f}{\partial\left( {x,z} \right)}} \right) = 0$. Thus $\left( {x,y} \right)$ can be solved in terms of $z$ near $\left( {1,2,3} \right)$, and $\left( {y,z} \right)$ can be solved in terms of $x$; the IFT gives no conclusion for solving $\left( {x,z} \right)$ in terms of $y$.

## Problem B

If $g:B\rightarrow{\mathbb{R}}^{2}$ satisfies $f\left( {x,g(x)} \right) = 0$ and $g(1) = \left( {2,3} \right)$, differentiating gives $f_{x} + f_{y,z}Dg = 0$. Hence

$Dg(1) = - \left\lbrack {\partial\frac{f}{\partial\left( {y,z} \right)}\left( {1,2,3} \right)} \right\rbrack^{- 1}\partial\frac{f}{\partial}x\left( {1,2,3} \right)$

$= - \left( {\left( {2,1} \right),\left( {- 1,1} \right)} \right)^{- 1}\left( {1,1} \right)^{T} = \left( {0, - 1} \right)^{T}.$

# HW 9

## Problem A

Let $O_{n} = \{ x:\exists\delta > 0,\forall x_{1},x_{2} \in B_{\delta{(x)}},d\left( {f\left( x_{1} \right),f\left( x_{2} \right)} \right) < \frac{1}{n}\}$. The continuity set $C_{f}$ is the intersection of all $O_{n}$. If $f$ is continuous at $x_{0}$, choose a ball mapping into $B_{\frac{1}{2n}}\left( {f\left( x_{0} \right)} \right)$, and the triangle inequality gives $x_{0} \in O_{n}$. Conversely, choose $n$ with $\frac{1}{n} < \varepsilon$ and a ball supplied by $O_{n}$; then $f$ is continuous at $x_{0}$. Each $O_{n}$ is open: a witnessing ball at $x_{0}$ contains a smaller ball about every one of its points.

## Problem B

A bounded non-decreasing $f:\left\lbrack {a,b} \right\rbrack\rightarrow{\mathbb{R}}$ is Riemann integrable. For a rational $q$ between $m$ and $M$, let $D_{q} = \{ x:\lim_{t\rightarrow x -}f(t) \leq q \leq \lim_{t\rightarrow x +}f(t)\}$. Every discontinuity belongs to some $D_{q}$ by density of $\mathbb{Q}$. Each $D_{q}$ has at most one point, since $x_{1} < x_{2}$ in it would force values left/right incompatible with monotonicity. So the discontinuity set is countable and has measure zero.

## Problem C

For integrable $f,g:\left\lbrack {0,1} \right\rbrack\rightarrow{\mathbb{R}}$, $F\left( {x,y} \right) = f(x)g(y)$ is bounded. It is continuous at $\left( {x_{0},y_{0}} \right)$ whenever both factors are continuous at the corresponding coordinates; hence $D_{F} \subset \left( {D_{f} \times \left\lbrack {0,1} \right\rbrack} \right) \cup \left( {\left\lbrack {0,1} \right\rbrack \times D_{g}} \right)$. The product covers of measure-zero sets show $D_{F}$ has measure zero, so $F$ is integrable.

## Problem D

Define $f(x) = \frac{1}{q}$ if $x = \frac{p}{q} \in \left\lbrack {0,1} \right\rbrack$ in lowest terms and $0$ on irrationals. Given $\varepsilon > 0$, choose $N$ with $\frac{1}{N} < \frac{\varepsilon}{2}$, let $A_{N}$ be rationals with denominator at most $N$, and make a partition containing $A_{N}$ with mesh $< \frac{\varepsilon}{N^{2}}$. On subintervals missing $A_{N}$, the supremum is at most $\frac{1}{N}$; the other intervals have total length $< \frac{\varepsilon}{N^{2}}$. Thus $U\left( {f,P} \right) - L\left( {f,P} \right) < \varepsilon$. It is continuous at every irrational because its values along rationals with unbounded denominators tend to $0$; discontinuities are contained in the countable rationals.

## Problem E

If bounded $f:Q\rightarrow{\mathbb{R}}$ vanishes off a closed measure-zero $B$, cover $B$ by finitely many boxes of total volume $< \frac{\varepsilon}{2M}$ and choose a partition having these boxes as subboxes. On the remaining subboxes $f = 0$, so the difference of upper and lower sums is $< \varepsilon$. Hence $f$ is integrable.

## Problem F

For a countable closed-box cover $Q \subset \cup_{i}Q_{i}$, first enlarge to open boxes with volume increase $< \frac{\varepsilon}{2^{i}}$. Compactness gives a finite subcover. Successively subtract earlier boxes to make a disjoint measurable cover; additivity and monotonicity give $v(Q) \leq \sum_{i}v\left( Q_{i} \right) + \varepsilon$, and then let $\varepsilon\rightarrow 0$.

## Problem G

For $f:{\mathbb{R}}^{2}\rightarrow{\mathbb{R}}$, $f\left( {x_{0},y_{0}} \right) = 0$, $f_{y{({x_{0},y_{0}})}} \neq 0$, define $F\left( {x,y} \right) = \left( {x,f\left( {x,y} \right)} \right)$. Since $\det DF = f_{y} \neq 0$, IFT gives a local inverse $G = \left( {G_{1},G_{2}} \right)$ with $G_{1}$ the identity. Then $g(x) = G_{2}\left( {x,0} \right)$ is $C^{1}$ and $f\left( {x,g(x)} \right) = 0$.

## Bonus

For an open box $B = \prod_{i{({a_{i},b_{i}})}}$, choose smooth one-variable functions $\varphi_{i} > 0$ on $\left( {a_{i},b_{i}} \right)$ and zero outside; $\prod_{i}\varphi_{i{(x_{i})}}$ is smooth, positive on $B$, and zero outside. For an open $U$, use a countable ball cover and a locally finite smooth partition of unity $\varphi_{n}$ subordinate to it; $\sum_{n}\varphi_{n}$ is smooth, positive exactly on $U$. For Cantor $C$, apply this to the complement of $C^{2}$ in ${\mathbb{R}}^{2}$. Taking $h = 0$ on $C$ and $h > 0$ off $C$, the graphs of $y^{2}$ and $h(x)$ meet exactly at $C \times \{ 0\}$.

# HW 10

## Problem A

For integrable $f,g:B\rightarrow{\mathbb{R}}$, $M(x) = \max\left( {f(x),g(x)} \right)$ is integrable. At every point where both $f$ and $g$ are continuous, the maximum is continuous (use the two local $\varepsilon$ bounds). Thus $D_{M} \subset D_{f} \cup D_{g}$, which has measure zero.

## Problem B

If $f$ is integrable then $|f|$ is integrable: $\left. D_{|}f \middle| \subset D_{f} \right.$, since a fixed jump in $|f|$ gives, by reverse triangle inequality, a jump in $f$. For every partition $P$, $\left. |L\left( {f,P} \right) \middle| \leq U\left( |f \middle| ,P \right) \right.$, and taking infima yields the corresponding inequality between the integrals of $f$ and $|f|$.

## Problem C

Let $R = \left( {\left( {\cos\left( {\sqrt{2}\pi} \right),\sin\left( {\sqrt{2}\pi} \right)} \right),\left( {- \sin\left( {\sqrt{2}\pi} \right),\cos\left( {\sqrt{2}\pi} \right)} \right)} \right)$ and let $S$ be the rotation of the rational points in the unit square. It is dense because $R$ is a rotation. Two points of $S$ on one vertical (or horizontal) line must have equal preimages, since the relevant sine/cosine coefficient is irrational; hence each such line meets $S$ at most once. The characteristic function of $S$ is $0$ except possibly at one point on each coordinate line, so every one-variable slice is integrable; but density gives upper sum $1$ and lower sum $0$ for every two-dimensional partition.

## Problem D

For $f \in C^{2}(A)$ and closed box $Q = \left\lbrack {a_{1},b_{1}} \right\rbrack \times \left\lbrack {a_{2},b_{2}} \right\rbrack \subset A$, Fubini and FTC give both integrals of the mixed partials as $f\left( {b_{1},b_{2}} \right) - f\left( {a_{1},b_{2}} \right) - f\left( {b_{1},a_{2}} \right) + f\left( {a_{1},a_{2}} \right)$. On a small box about $\left( {a,b} \right)$, apply the integral mean-value theorem twice to their difference; the zero double integral forces equality of mixed partials at $\left( {a,b} \right)$.

## Problem E

Riemann integrability implies Darboux integrability because a fine partition has both tagged sums within $\frac{\varepsilon}{2}$ of the integral, so upper and lower sums are within $\varepsilon$. Conversely, for a Darboux integrable $f$, refine a near-optimal partition by any sufficiently fine partition. The boundary-strip lemma bounds total volume of new subboxes crossing old boundaries; lower and upper sums on the remaining subboxes stay close to the Darboux sums. Therefore every fine tagged sum is close to the common Darboux integral.

## Problems F-G and Bonus

For $g(x) = f\left( {Ax} \right)$, chain rule gives $Dg(0) = Df(0)A$ and differentiating once more yields $H_{g{(0)}} = A^{T}H_{f{(0)}}A$. The quadratic Taylor polynomial is $T_{2}(x) = f(0) + Df(0)x + \frac{1}{2}x^{T}H_{f{(0)}}x$. The bonus proof uses that the continuity set of a map is a $G_{\delta}$ set and Baire Category: $\mathbb{Q}$ is not $G_{\delta}$, so no function can be continuous exactly on $\mathbb{Q}$ and discontinuous on its complement.

# HW 12

## Problem A

Let $S$ be bounded, let $A$ be the interior of $S$, and let bounded $f:S\rightarrow{\mathbb{R}}$ be Riemann integrable on $S$. Since $D_{f|A} \subset D_{f}$, Lebesgue's criterion makes $f$ integrable on $A$. Also $\partial A \subset \partial S$. Split the complement of $A$ in $S$ into its isolated points, its non-isolated discontinuities, and its non-isolated continuity points. The first is countable; the second has measure zero; on the third, $f$ has limiting value $f\left( x_{0} \right)$ and the integral over the set is zero. Hence the integral over the complement is $0$, so the integrals over $A$ and $S$ agree. If $S$ is Jordan measurable, then $m\left( {\partial A} \right) \leq m\left( {\partial S} \right) = 0$, and $m(A) = m(S)$.

## Problem B

For $B_{a}^{n{(x)}}$, polar coordinates give its volume as $\Gamma_{n}a^{n}$. The spherical-coordinate Jacobian recorded is $r^{n - 1}\prod_{k = 1}^{n - 2}\sin^{k{(\theta_{k})}}$; integration produces the factor $\frac{a^{n}}{n}$. Translation has determinant one, giving the formula for all centres. $\Gamma_{1} = 2$ and $\Gamma_{2} = \pi$. Slicing the unit $n$-ball by one coordinate and using polar coordinates gives $\Gamma_{n} = \left( {2\frac{\pi}{n}} \right)\Gamma_{n - 2}$, hence $\Gamma_{2k} = \frac{\pi^{k}}{k!}$ and $\Gamma_{2k + 1} = 2^{k + 1}\frac{\pi^{k}}{\left( {2k + 1} \right)!!}$.

## Problem C

For $p = \left( {p',p_{n}} \right)$ with $p_{n} > 0$ and open Jordan measurable $A \subset {\mathbb{R}}^{n - 1}$, define $g:A \times \left( {0,1} \right)\rightarrow S$ by $g\left( {a',t} \right) = \left( {1 - t} \right)\left( {a',0} \right) + tp$. It is a $C^{1}$ diffeomorphism. Its derivative is upper triangular with determinant $\left( {1 - t} \right)^{n - 1}p_{n}$, so change of variables gives the volume of $S$ as $p_{n}$ times the volume of $A$ divided by $n$.

## Problem D

The ellipsoid $\left( \frac{\left( {x - u} \right)^{2}}{a^{2}} \right) + \left( \frac{\left( {y - v} \right)^{2}}{b^{2}} \right) + \left( \frac{\left( {z - w} \right)^{2}}{c^{2}} \right) < 1$ is the inverse image of the unit ball under $\left( {x,y,z} \right)\mapsto\left( {\frac{x - u}{a},\frac{y - v}{b},\frac{z - w}{c}} \right)$. The inverse has determinant $abc$, so its volume is $4\pi ab\frac{c}{3}$.

## Problem E

The solid between $z = x^{2} + 2y^{2}$ and $z = 2x + 6y + 1$ projects to $\left( {x - 1} \right)^{2} + 2\left( {y - \frac{3}{2}} \right)^{2} < \frac{13}{2}$. Translating then using the displayed elliptical polar substitution gives the recorded volume $169\sqrt{2}\frac{\pi}{16}$.

## Problem F

Integrating $\exp\left( {- x^{2} - y^{2}} \right)$ over larger and larger disks, polar coordinates give the two-dimensional Gaussian integral as $\pi$. Fubini over expanding squares makes this the square of the one-dimensional Gaussian integral, so the integral is $\sqrt{\pi}$.

## Problem G

$|x|^{e}$ is integrable over the unit ball iff $e > - n$: decompose the punctured ball into annuli and compare the radial series with $\sum_{i}i^{- {({n + e})}}$. It is integrable outside the closed unit ball iff $e\leftarrow n$, by the analogous tail series.

## Bonus

For $f:{\mathbb{R}}\rightarrow{\mathbb{R}}$ differentiable on compact $I$ with $\left. |f' \middle| \leq \delta \right.$, the mean value theorem gives $\left. |f(I) \middle| \leq \delta \middle| I| \right.$. If $f \in C^{1}({\mathbb{R}})$, write $A_{n} = \{ x \in \left\lbrack {- n,n} \right\rbrack:f'(x) = 0\}$. Uniform continuity of $f'$ lets finitely many short intervals cover $A_{n}$ so that $f\left( A_{n} \right)$ has arbitrarily small total length. Thus $m\left( {f\left( A_{n} \right)} \right) = 0$ and $m\left( {f\left( {\{ f' = 0\}} \right)} \right) = 0$.

# HW 13

## Problem A

The coordinate swap matrix factors as

$\left( {\left( {0,1} \right),\left( {1,0} \right)} \right) = \left( {\left( {- 1,0} \right),\left( {0,1} \right)} \right)\left( {\left( {1, - 1} \right),\left( {0,1} \right)} \right)\left( {\left( {1,0} \right),\left( {1,1} \right)} \right)\left( {\left( {1, - 1} \right),\left( {0,1} \right)} \right),$

each factor a primitive diffeomorphism on ${\mathbb{R}}^{2}$.

## Problem B

Let $\psi(x) = \exp\left( {- \frac{1}{1 - \left( \frac{x}{3.5} \right)^{2}}} \right)$ for $\left. |x \middle| < 3.5 \right.$ and $0$ otherwise. Put $\psi_{n{(x)}} = \psi\left( {x - n} \right)$ for odd $n$ and $\psi\left( {x + n} \right)$ for even $n$. The supports are the listed intervals $\left\lbrack {n - 3.4,n + 3.4} \right\rbrack$ or $\left\lbrack {- n - 3.4, - n + 3.4} \right\rbrack$; at any $x$ at most four are supported. Thus $\lambda = \sum_{n}\psi_{n}$ is smooth and positive. Setting $\varphi_{n} = \frac{\psi_{n}}{\lambda}$ gives $\sum_{n}\varphi_{n} = 1$ and a smooth partition of unity dominated by the open intervals of length $7$.

## Problem C

For $f(x) = e^{- \frac{1}{x}}$ when $x > 0$ and $0$ otherwise, $f^{n}(x) = P_{n{(\frac{1}{x})}}e^{- \frac{1}{x}}$ on $x > 0$, with $P_{n}$ polynomial. Inductively $f^{n}(0) = 0$: after $t = \frac{1}{x}$, a bound $\left. |Q_{n{(t)}} \middle| \leq C_{n}t^{2n} \right.$ makes the difference quotient tend to $0$. Thus $f \in C^{\infty{({\mathbb{R}})}}$.

## Problem D

If $f:{\mathbb{R}}^{n}\rightarrow{\mathbb{R}}^{m}$ is smooth and $n < m$, its image has measure zero by the cited class result. If it contained nonempty open $U$, it would contain a ball of positive Jordan and Lebesgue measure, contradicting monotonicity.

## Problem E

A local diffeomorphism $g$ with $g(0) = 0$, $Dg(0) = I$ is locally factored by choosing a coordinate $i$, setting $h(x) = \left( {g_{1}(x),\ldots,g_{i - 1}(x),x_{i},g_{i + 1}(x),\ldots,g_{n{(x)}}} \right)$, and correcting the $i$th coordinate in the target. IFT gives a local factorization into primitive diffeomorphisms. Induction freezes one coordinate at a time, giving a finite factorization into super-primitive diffeomorphisms; translations and elementary linear maps are also decomposed this way.

## Problem F

No injective smooth $f:{\mathbb{R}}^{2}\rightarrow{\mathbb{R}}$ exists. If all partials vanished everywhere, $f$ would be constant. Otherwise, say $f_{x{({a,b})}} \neq 0$; IFT writes the level set $f\left( {x,y} \right) = f\left( {a,b} \right)$ locally as $y = g(x)$, contradicting injectivity.

## Problem G

If $f:S\rightarrow{\mathbb{R}}$ is smooth at each $x \in S$, choose local smooth extensions $f_{x}:U_{x}\rightarrow{\mathbb{R}}$. A locally finite smooth partition of unity $\varphi_{n}$ subordinate to $\{ U_{x}\}$ gives $h_{n} = \varphi_{n}f_{x_{n}}$ on $U_{x_{n}}$ and $0$ elsewhere. The locally finite sum $g = \sum_{n}h_{n}$ is smooth and, at $x_{0} \in S$, equals $f\left( x_{0} \right)\sum_{n}\varphi_{n{(x_{0})}} = f\left( x_{0} \right)$.

## Problem H

If matrix $A$ has rank $k$, select $k$ independent columns and then $k$ independent rows among them to obtain a $k \times k$ minor with nonzero determinant. Any larger minor has rank at most $k$, so determinant zero. Hence rank is the maximum order of a nonzero minor.

# HW 14

## Problem A

For $a_{i} = \frac{1}{2^{2i + 2}}$, $b_{i} = \frac{1}{2^{2i + 1}}$, $I_{i} = \left\lbrack {a_{i},b_{i}} \right\rbrack$, and $M_{i} = 4^{i + 1}$, let $\varphi(t) = \exp\left( {- \frac{1}{1 - t^{2}}} \right)$ for $\left. |t \middle| < 1 \right.$ and $0$ otherwise. Define

$\psi_{i{(x)}} = M_{i}\varphi\left( {\frac{2x - \left( {a_{i} + b_{i}} \right)}{|}I_{i}|} \right).$

The $\psi_{i}$ are smooth with disjoint supports $I_{i}$. If $\lambda = \sum_{i}\psi_{i}$, then at the midpoint of $I_{i}$, $\psi_{i} = M_{i}\varphi(0) = M_{i}e^{- 1}\rightarrow\infty$ while the midpoints tend to $0$ and $\lambda(0) = 0$. Thus $\lambda$ is not continuous at $0$.

## Problem B

The change-of-variables theorem for linear diffeomorphisms and compactly supported continuous $f$ is proved by induction on the dimension, after decomposing a linear map into primitive linear diffeomorphisms. The $n = 1$ case is the one-variable substitution theorem. For a primitive map preserving the last coordinate, write $Q = D \times I$, restrict to $S = h^{- 1}(Q)$, extend $\left. \left( {foh} \right) \middle| \det Dh| \right.$ by $0$, and use Fubini. For each fixed $t$, the $\left( {n - 1} \right)$-dimensional induction hypothesis supplies the inner substitution formula, which Fubini integrates to the result.

## Problem C

The rank map on $M_{n,m}$ is lower semicontinuous. If matrix $A$ has rank $r > 0$, choose a nonzero $r \times r$ minor. Continuity of determinant supplies a Frobenius-norm ball about $A$ in which the same minor remains nonzero, so ranks are at least $r$. It need not be continuous: $A_{k} = \left( \frac{1}{k} \right)I_{n}\rightarrow 0$, but $A_{k}$ has rank $n$ while zero has rank $0$.

# HW 15

## Problem A

There is no injective smooth $f:{\mathbb{R}}^{n}\rightarrow{\mathbb{R}}^{m}$ for $n > m$. The proof first records the constant rank theorem: if $Df$ has constant rank $r$ near $x_{0}$, choose a nonsingular $r \times r$ minor and set $\varphi(x) = \left( {f_{1}(x),\ldots,f_{r{(x)}},x_{r + 1},\ldots,x_{n}} \right)$. IFT makes $\varphi$ a local diffeomorphism. In these coordinates $fo\varphi^{- 1}(v) = \left( {v_{1},\ldots,v_{r},g_{r + 1}(v),\ldots,g_{m{(v)}}} \right)$; the rank calculation makes the partial derivatives of the $g$ terms in the last variables zero. A target coordinate change then gives $\left( {v_{1},\ldots,v_{r},0,\ldots,0} \right)$.

For the claimed non-injectivity, lower semicontinuity and the finite set of possible ranks make rank locally constant on some neighbourhood. The normal form is not injective when $n > m$, and composing with local diffeomorphisms preserves this contradiction.

## Problem B

For continuous compactly supported $f,g:{\mathbb{R}}^{n}\rightarrow{\mathbb{R}}$, define convolution by $\left( {f \ast g} \right)(x)$ equal to the integral of $f\left( {x - y} \right)g(y)$ over ${\mathbb{R}}^{n}$. On a product box containing both supports, Fubini and the substitution $z = x - y$ give

the integral of $f \ast g$ equals the product of the integrals of $f$ and $g$.

The same substitution proves $f \ast g = g \ast f$. Applying Fubini twice shows

The iterated-integral calculation has integrand $f\left( {x - y - z} \right)g(z)h(y)$ and yields $\left( {\left( {f \ast g} \right) \ast h} \right)(x) = \left( {f \ast \left( {g \ast h} \right)} \right)(x)$,

so convolution is associative.

## Problem C

For $f\left( {x,y} \right) = 4x^{2} + 10y^{2}$ on $x^{2} + y^{2} \leq 4$, the only interior critical point is $\left( {0,0} \right)$, where $f = 0$. On the boundary, $f = 16 + 6y^{2}$, so the maximum is $40$ at $\left( {0,2} \right)$ and $\left( {0, - 2} \right)$. Thus the minimum is $0$ at $\left( {0,0} \right)$.

## Problem D

Of $f\left( {x,y} \right) = 3x_{1}y_{2} + 5x_{2}x_{3}$, $g\left( {x,y} \right) = x_{1}y_{2} + x_{2}y_{4} + 1$, and $h\left( {x,y} \right) = x_{1}y_{1} - 7x_{2}y_{3}$, only $h$ is a tensor: the first has a quadratic factor in $x$, and the second has a constant term. In the elementary dual basis,

$h = e^{1}o \times e^{1} - 7e^{2}o \times e^{3}.$

## Problem E

For a vector space $V$, $L^{k{(V)}}$ is a vector space under pointwise addition and scalar multiplication: the displayed verification checks linearity in each argument, the zero map, additive inverses, commutativity, associativity, and distributivity.

## Problem F

For the cycle taking $1$ to $2$ through $k$ and $k$ back to $1$, write it as $k - 1$ transpositions, so its sign is $\left( {- 1} \right)^{k - 1}$.

## Problem G

If $T:V\rightarrow W$ is linear and $f \in A^{k{(W)}}$, then $T^{\ast}f\left( {v_{1},\ldots,v_{k}} \right) = f\left( {Tv_{1},\ldots,Tv_{k}} \right)$ is multilinear. For a permutation $\sigma$, substituting the permuted arguments gives $T^{\ast}f\left( {v_{\sigma{(1)}},\ldots,v_{\sigma{(k)}}} \right)$ equal to the sign of $\sigma$ times $T^{\ast}f\left( {v_{1},\ldots,v_{k}} \right)$, so $T^{\ast}f \in A^{k{(V)}}$.

## Problem H

For the elementary alternating tensor $\varphi_{I}$ on ${\mathbb{R}}^{n}$, with $I = \left( {i_{1},\ldots,i_{k}} \right)$ and column matrix $X = \left\lbrack {x_{1}\ldots x_{k}} \right\rbrack$,

$\varphi_{I{({x_{1},\ldots,x_{k}})}}$ is the sum over permutations of the sign of $\sigma$ times the corresponding product of the selected coordinates, and equals $\det X_{I}$,

the determinant expansion of the submatrix whose rows are indexed by $I$.

## Bonus

The printed bonus gives the definition of a real analytic function, a binomial-series exercise, radius of convergence $\left. R = \frac{1}{\operatorname{lim\, sup}}\  \middle| c_{n}|^{\frac{1}{n}} \right.$, convergence properties, coefficient bounds, and differentiation of a power series. The source page contains no handwritten solution for these printed bonus parts.
