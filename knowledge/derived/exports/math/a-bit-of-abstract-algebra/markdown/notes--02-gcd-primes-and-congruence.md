---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: Abstract Algebra Collection
date: 2026
description: A personal collection of introductory abstract algebra notes and worked problems.
keywords:
- abstract algebra
- rings
- groups
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/modern-algebra/chapters/02-gcd-primes-and-congruence.typ"
subtitle: Integers, rings, groups, quotients, and a glimpse of elliptic curves
title: (A Bit of) Abstract Algebra
---
# Gcd, primes, and congruence

This chapter transcribes 'WorkSheets/412-WS3-Mywork.pdf', pp. 1--2; '412-WS4-Mywork.pdf', pp. 1--2; and '412-WS5-Mywork.pdf', pp. 1--2.

## Prime factorization

**Source transcription --- WS3, p. 1, Pf of Thm 1′'.** The sheet states

$$
p \in \mathbb{Z}\text{except}\ \left\{ {0, \pm 1} \right\}\ \text{is prime}\ \text{if and only if}\ \left( p\  \middle| \ bc\Rightarrow p\  \middle| \ b\ \text{or}\ p\  \middle| \ c \right).
$$

For the forward implication, write $b = kp$ when $\left. p\  \middle| \ b \right.$. Since $p$ is prime, the source notes that $\gcd\left( {p,b} \right)$ can only be $1$ or $\pm p$; $\gcd\left( {p,b} \right) = 1$ gives $\left. p\  \middle| \ c \right.$ by the preceding corollary, while $\gcd\left( {p,b} \right) = p$ gives $\left. p\  \middle| \ b \right.$ by definition. The Chinese margin explanation is: 这一段实际很好想: $p$ is prime =\> say $p = kd$, $d \in \mathbb{Z}$ composite, 就会使 $\left. p\  \middle| \ bc \right.$ 但 $p$ 不可能整除 $b$ 或 $c$，可以是整除 $b$ 的某一个 连结的因数，因此 $\left. p\  \middle| \ p \right.$，而它不可能整除自己的 factor.''

For the converse the source uses the contrapositive: if $p$ is not prime, there are $b,c \in \mathbb{Z}$ with $\left. p\  \middle| \ bc \right.$, but $p$ does not divide either $b$ or $c$. It then writes $p = kd$, with $k \neq \pm 1$ and $k \neq p$, so $p$ is composite; because $p$ is not a unit and $\left. |p \middle| > 1 \right.$, this gives the required nontrivial factors.

> **Theorem: Euclid's lemma**
>
> If $p$ is prime and $\left. p\  \middle| \ ab \right.$, then $\left. p\  \middle| \ a \right.$ or $\left. p\  \middle| \ b \right.$.

**Source transcription --- WS3, p. 1, Pf of Corollary 1′'.** If $p \in \mathbb{Z}$ is prime and $\left. p\  \middle| \ \left( {a_{1}\ldots a_{n}} \right) \right.$, then $\left. p\  \middle| \ a_{i} \right.$ for some $i$. The source says that this is the same simple argument as the two-factor case: treat $a_{1}\ldots a_{n - 1}$ as one factor and repeat the argument, that is, use induction.

**Source transcription --- WS3, p. 1, Pf of Thm 2 (FTA), Part I: Existence''.** Consider

$$
S = \left\{ {s > 1:s \in \mathbb{Z},s\ \text{is not product of primes}} \right\}.
$$

The sheet proves: (4) every element of $S$ is composite (a prime cannot lie in $S$, since $p = p$ is a trivial factorization); (5) if $a,b > 1$ and $ab \in S$, then $a \in S$ or $b \in S$ (the contrapositive is written); and (6) $S$ is empty. Indeed, if $S$ were nonempty, let $s$ be its minimum by well-ordering. By (4), $s = ab$ with $a,b > 1$; by (5), one of $a,b$ is in $S$ and is smaller than $s$, a contradiction. Thus every nonzero nonunit admits a prime factorization.

**Source transcription --- WS3, p. 2, Pf of Thm 2 FTA, Part II: Uniqueness''.** Suppose

$$
n = p_{1}\ldots p_{s} = q_{1}\ldots q_{t}
$$

are two factorizations into primes. Since $\left. p_{1}\  \middle| \ \left( {q_{1}\ldots q_{t}} \right) \right.$, Euclid's lemma makes $p_{1}$ divide one $q_{i}$; as $q_{i}$ is prime, $p_{1} = \pm q_{i}$. Eliminating associated prime factors on both sides and repeating, if $s < t$ then the remaining equality would say $1 = q_{s + 1}\ldots q_{t}$, impossible because each $q_{i}$ is prime. Hence $s = t$, and after reordering every $p_{i} = q_{i}$ up to associates.

**Source transcription --- WS3, p. 2, GCD Exercise''.** If

$$
a = \pm p_{1}^{a_{1}}\ldots p_{n}^{a_{n}},\quad b = \pm p_{1}^{b_{1}}\ldots p_{n}^{b_{n}},
$$

with $0 \leq c_{i} \leq \min\left( {a_{i},b_{i}} \right)$, then every common divisor has the form $d = \pm p_{1}^{c_{1}}\ldots p_{n}^{c_{n}}$. Thus

$$
\gcd\left( {a,b} \right) = \prod\limits_{i = 1}^{n}p_{i}^{\min{({a_{i},b_{i}})}}.
$$

## Congruence modulo $N$

**Source transcription --- WS4, p. 1.** Congruence 的概念是对 equality relation 的 generalization.'' For $a,b \in \mathbb{Z}$,

$$
a = b\ \text{if and only if}\ a - b = 0,\quad a \equiv b\left( {\operatorname{mod}N} \right)\ \text{if and only if}\ a - b = Nk\ \text{for some}\ k \in \mathbb{Z},
$$

that is, $\left. N\  \middle| \ \left( {a - b} \right) \right.$. The source explicitly compares the three equality axioms---reflexive, symmetric, transitive---with their congruence counterparts, then defines the congruent class $\lbrack a\rbrack_{N}$ and lists

$$
\lbrack 0\rbrack_{3} = \left\{ {\ldots, - 3,0,3,\ldots} \right\},\quad\lbrack 1\rbrack_{3} = \left\{ {\ldots, - 2,1,4,7,10,\ldots} \right\},\quad\lbrack 2\rbrack_{3} = \left\{ {\ldots, - 1,2,5,8,11,\ldots} \right\}.
$$

For classes the worksheet proves 相等或者是 disjoint.'' If $x \in \lbrack a\rbrack_{N} \cap \lbrack b\rbrack_{N}$, then $x \equiv a\left( {\operatorname{mod}N} \right)$ and $x \equiv b\left( {\operatorname{mod}N} \right)$, hence $a \equiv b\left( {\operatorname{mod}N} \right)$. Any $y{\in \lbrack a\rbrack}_{N}$ is then congruent to $b$ by transitivity, so $\lbrack a\rbrack_{N} \subset \lbrack b\rbrack_{N}$; similarly the reverse inclusion holds. It also records $\lbrack a\rbrack_{10} \subset \lbrack a\rbrack_{N}$ when $N$ divides $10$.

The source asks whether $\lbrack a\rbrack_{7}\mapsto$ round down $a$ to 最近的 $10$ 的倍数'' is a function and concludes: 其实不是.'' For example, with $x = \lbrack 0\rbrack_{7} = \left\{ {\ldots, - 14, - 7,0,7,14,\ldots} \right\}$, the representatives map to different multiples of $10$, so one class would have multiple images. In contrast, $\lbrack a\rbrack_{7}\mapsto\left\lbrack {- a} \right\rbrack_{7}$ is a function: replacing one representative by another congruent representative preserves the resulting class.

**Source transcription --- WS4, pp. 1--2, well-defined operations.** The worksheet defines

$$
\lbrack a\rbrack_{N} + \lbrack b\rbrack_{N} = \left\lbrack {a + b} \right\rbrack_{N},\quad\lbrack a\rbrack_{N}\lbrack b\rbrack_{N} = \left\lbrack {ab} \right\rbrack_{N}.
$$

For multiplication, if $x = a + ka$ and $y = b + lb$ are written as source representatives, then the calculation is retained in its displayed form:

$$
xy = ab + kab + lab + klab = \left( {1 + k + l + kl} \right)ab,
$$

so $ab$ is congruent to $xy$. It says: $\mathbb{Z}_{N}$ 具有除了 $x^{- 1}$ 外所有 field 的性质（A/M/D 易证）.'' It then proves that if $\gcd\left( {a,N} \right) = 1$, then $\lbrack a\rbrack_{N}x = \lbrack 1\rbrack_{N}$ has a solution: Bézout gives $ar + Ns = 1$, hence $\lbrack a\rbrack_{{N{\lbrack r\rbrack}}_{N}} = \lbrack 1\rbrack_{N}$.

The source proves uniqueness of the solution to $\lbrack a\rbrack_{N}x = \lbrack 1\rbrack_{N}$ under the coprime condition: if $\lbrack a\rbrack_{{N{\lbrack x_{1}\rbrack}}_{N}} = \lbrack a\rbrack_{{N{\lbrack x_{2}\rbrack}}_{N}}$, then $\lbrack a\rbrack_{{N{\lbrack{x_{1} - x_{2}}\rbrack}}_{N}} = \lbrack 0\rbrack_{N}$; since $\lbrack a\rbrack_{N}$ is a unit, $\left\lbrack {x_{1} - x_{2}} \right\rbrack_{N} = \lbrack 0\rbrack_{N}$, hence $\left\lbrack x_{1} \right\rbrack_{N} = \left\lbrack x_{2} \right\rbrack_{N}$. It continues that every $\lbrack a\rbrack_{N}x = \lbrack b\rbrack_{N}$ then has a unique solution by multiplying the solution of $\lbrack a\rbrack_{{N{\lbrack r\rbrack}}_{N}} = \lbrack 1\rbrack_{N}$ by $\lbrack b\rbrack_{N}$.

## Linear combinations modulo $N$

**Source transcription --- WS5, pp. 1--2.** The source proves

$$
\left\{ {ra + sn:r,s \in \mathbb{Z}} \right\} = \left\{ {k\gcd\left( {a,n} \right):k \in \mathbb{Z}} \right\}.
$$

For $Q = \left\{ {k\gcd\left( {a,n} \right):k \in \mathbb{Z}} \right\}$ and $P = \left\{ {ra + sn:r,s \in \mathbb{Z}} \right\}$, Bézout gives $\gcd\left( {a,n} \right) = au + nv$, hence every $k\gcd\left( {a,n} \right) = a\left( {ku} \right) + n\left( {kv} \right)$ lies in $P$. Conversely, $\gcd\left( {a,n} \right)$ divides both $a$ and $n$, so it divides every $ra + sn$ and that expression lies in $Q$.

Thus $\lbrack a\rbrack_{N{\lbrack x\rbrack}} = \lbrack b\rbrack_{N}$ has a solution exactly when $\left. \gcd\left( {a,N} \right)\  \middle| \ b \right.$. The sheet writes the example

$$
\lbrack 9\rbrack_{12}x = \lbrack 3\rbrack_{12},
$$

whose solutions are $\lbrack 3\rbrack,\lbrack 7\rbrack,\lbrack 11\rbrack$ because $3 = \gcd\left( {9,12} \right)$ divides $3$ and the solutions differ by $\frac{12}{3} = 4$. The source's question 有多少 sol?'' is answered: if $d = \gcd\left( {a,N} \right)$, the distinct solutions are separated by $\frac{N}{d}$; hence there are $d$ solution classes.

