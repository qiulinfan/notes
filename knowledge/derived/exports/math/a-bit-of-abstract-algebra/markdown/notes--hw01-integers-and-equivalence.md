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
source: "notes/math/modern-algebra/homeworks/hw01-integers-and-equivalence.typ"
subtitle: Integers, rings, groups, quotients, and a glimpse of elliptic curves
title: (A Bit of) Abstract Algebra
---
# Homework 1: Integers and Equivalence Relations (49/50) {#homework-01}

Source: 'Homework/412-Hw-1-graded.pdf' (30 PDF pages). Canvas grading and navigation pages are interleaved with the submitted handwritten pages. The source trails below identify every page with transcribed work; navigation-only pages are recorded in the migration receipt rather than copied as note content.

## Question 1: square and cubic integers

**Source trail:** PDF pp. 6 and 8 (handwritten answer); p. 1 (10/10 grading).

For the square claim, the answer begins, "We prove by cases." It invokes Corollary 2.5 to split the integers into $3k$, $3k + 1$, and $3k + 2$. For an arbitrary $a$ it records:

- if $a = 3k$, then $a^{2} = 9k^{2} = 3\left( {3k^{2}} \right)$;
- if $a = 3k + 1$, then $a^{2} = \left( {3k + 1} \right)^{2} = 3\left( {3k^{2} + 2k} \right) + 1$;
- if $a = 3k + 2$, it writes $a^{2} = \left( {3k + 2} \right)^{2} = 3\left( {3k^{2} + 4k} \right) + 1$.

The conclusion underneath is that the three cases cover all integers and none gives remainder $2$ upon division by $3$.

For the cubic claim, the answer again uses the same three cases:

- $a^{3} = 27m^{3} = 9\left( {3m^{3}} \right)$, so it takes $k = 3m^{3}$;
- $a^{3} = 27m^{3} + 27m^{2} + 9m + 1 = 9\left( {3m^{3} + 3m^{2} + m} \right) + 1$;
- $a^{3} = 27m^{3} + 54m^{2} + 36m + 8 = 9\left( {3m^{3} + 6m^{2} + 4m + 1} \right) - 1$.

Thus it concludes that a cubic integer has form $9k$, $9k + 1$, or $9k - 1$. On the first cubic line, the handwriting says $a^{2} = 9k$ after a calculation for $a^{3}$; it is retained as a source-writing slip rather than silently treated as a new assertion.

## Question 2: least common multiples

**Source trail:** PDF pp. 10 and 12 (handwritten answer); p. 2 (10/10 grading).

For part (a), the response lets $a,b$ be arbitrary positive integers and defines the set of positive common multiples

$$
S = \left\{ {s \in {\mathbb{Z}}^{+}:a \mid s \land b \mid s} \right\}.
$$

It observes that $ab \in S$, hence $S$ is nonempty and is a subset of the positive integers. The well-ordering principle supplies a smallest element, which it identifies as the least common multiple of $a$ and $b$.

For part (b), with $d = \gcd\left( {a,b} \right)$, the handwritten calculation is

$$
a = dp,b = dq,ab = dpq,m = pq,dm = ab.
$$

This is transcribed as written: the displayed factorization omits a factor of $d$ if both preceding equalities are read literally. The written construction targets an integer $m$ satisfying $dm = ab$.

For part (c), it starts from $dm = ab$ and $a = dp$, then writes

$$
dm = dpb,m = pb,
$$

and, similarly, $m = qa$. It concludes that both $a$ and $b$ divide $m$.

For part (d), let $M$ be an arbitrary common multiple, so $M = sa = kb$ for integers $s,k$. Bézout is written as

$$
\gcd\left( {a,b} \right) = ra + sb.
$$

With $m = a\frac{b}{\gcd\left( {a,b} \right)}$, the response calculates

$$
\frac{M}{m} = \left( \frac{ra + sb}{ab} \right)kb = rk + \frac{ksb}{a} = rk + s^{2}.
$$

The substitution $kb = sa$ makes the last expression integral, so $m$ divides $M$. Together with the preceding divisibility calculation, it concludes that $m$ is the least common multiple.

## Question 3: greatest common divisors under an integral matrix

**Source trail:** PDF pp. 14 and 16 (handwritten answer); p. 2 (10/10 grading, with feedback).

Let $A = \begin{pmatrix}
a & b \\
c & d
\end{pmatrix}$ and write its inverse as $A^{- 1}$. The proof notes that both $\det A$ and $\det A^{- 1} = \frac{1}{\det A}$ are integers. It concludes that $\det A$ is $1$ or $- 1$, and writes

$$
A^{- 1} = \left( \frac{1}{\det A} \right)\begin{pmatrix}
d & {- b} \\
{- c} & a
\end{pmatrix}.
$$

It applies this to the column vector with entries $ax + by$ and $cx + dy$, obtaining $\pm \left( {x,y} \right)^{T}$. In particular,

$$
x = \pm \left( {d\left( {ax + by} \right) - b\left( {cx + dy} \right)} \right)
$$

and

$$
y = \pm \left( {- c\left( {ax + by} \right) + a\left( {cx + dy} \right)} \right).
$$

Thus $x$ and $y$ are integer linear combinations of $ax + by$ and $cx + dy$; conversely those two expressions are integer linear combinations of $x,y$. The response phrases the two divisibility comparisons as mutual greatest-common-divisor inequalities and concludes

$$
\gcd\left( {x,y} \right) = \gcd\left( {ax + by,cx + dy} \right).
$$

**Grader feedback (PDF p. 2):** "avoid the gcd notation."

## Question 4: prime multiplicities and irrational roots

**Source trail:** PDF pp. 16, 18, 20, and 22 (handwritten answer); p. 3 (9/10 grading and feedback).

The answer labels the two assertions "1" and "2." For the first direction of the equivalence in part (1), it writes $n = \beta^{d}$, factors

$$
\beta = q_{1}^{a_{1}}q_{2}^{a_{2}}\ldots q_{m}^{a_{m}},
$$

and argues for a prime $p = q_{i}$ that $p^{a_{i}d}$ divides $n$; hence the multiplicity is divisible by $d$. For the converse it writes

$$
n = p_{1}^{a_{1}}p_{2}^{a_{2}}\ldots p_{m}^{a_{m}}
$$

and, from $a_{i} = k_{i}d$, obtains

$$
n = \left( {p_{1}^{k_{1}}p_{2}^{k_{2}}\ldots p_{m}^{k_{m}}} \right)^{d}.
$$

This is the stated proof that $n$ is a $d$-th power exactly when all its prime multiplicities are divisible by $d$.

For part (2), it argues by contradiction. Assume $n$ is not a $d$-th power but

$$
\sqrt[d]{n} = \frac{p}{q}
$$

with $p,q \in {\mathbb{Z}}$, $q \neq 0$, and $\gcd\left( {p,q} \right) = 1$. It writes $nq^{d} = p^{d}$ and factors $p$ and $q$ by the Fundamental Theorem of Arithmetic. Since their prime factors are disjoint, it concludes that each prime factor of $n$ has multiplicity $d$, so $n$ is a $d$-th power, a contradiction.

**Grader feedback (PDF p. 3):** "You forgot the powers on the primes." A second comment says, "Again, if you had written out the powers, you would have gotten that q = 1, and be done with it all."

## Question 5: equivalence relations and classes

**Source trail:** PDF pp. 26, 28, and 30 (handwritten answer); p. 4 (10/10 grading).

For part (a), take arbitrary column vectors $\left( {x,y} \right)^{T}$ and $\left( {w,z} \right)^{T}$ with $x - y = w - z$. The response checks reflexivity from $x - y = x - y$, symmetry by reversing the equality, and transitivity by setting $w - z = \alpha - \beta$ and chaining $x - y = w - z = \alpha - \beta$. It concludes that this relation on ${\mathbb{R}}^{2}$ is an equivalence relation.

For part (b), it supplies the transitivity counterexample

$$
a = 1,b = 0,c = - 1.
$$

Then $ab = 0$ and $bc = 0$, so $a \sim b$ and $b \sim c$, while $ac = - 1 < 0$, so $a$ is not related to $c$. Thus the relation $a \sim b$ when $ab \geq 0$ is not an equivalence relation.

For part (c), if $a \in X$, reflexivity gives $a \sim a$, so

$$
a \in \left\{ {x \in X:x \sim a} \right\} = \lbrack a\rbrack.
$$

Therefore every equivalence class is nonempty.

For part (d), assume the intersection of $\lbrack a\rbrack$ and $\lbrack b\rbrack$ is nonempty and choose $x$ in both classes. For arbitrary $m \in \lbrack a\rbrack$, the response uses $m \sim a$, $x \sim a$, symmetry, and transitivity to obtain $m \sim x$ and hence $m \in \lbrack b\rbrack$. Reversing the argument for arbitrary $n \in \lbrack b\rbrack$ gives $\lbrack a\rbrack = \lbrack b\rbrack$. Therefore two classes are either disjoint or equal.

For part (e), every $x \in X$ has $x \sim x$, so $\lbrack x\rbrack$ is a nonempty class in the set $S$ of all classes and $x$ belongs to that class. The handwritten conclusion is that $X$ is the disjoint union of the classes $Y$ with $Y \in S$. Using part (d), the response identifies the union as disjoint, concluding that the equivalence classes partition $X$.

