---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: MATH 451
date: 2026
description: Single-variable mathematical analysis notes migrated from the selected lectures and historical homework artefacts.
keywords:
- real analysis
- metric spaces
- Riemann integration
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/mathematical-analysis/chapters/01-real-number-system.typ"
subtitle: Single-variable analysis --- migrated working notes
title: Mathematical Analysis
---
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

