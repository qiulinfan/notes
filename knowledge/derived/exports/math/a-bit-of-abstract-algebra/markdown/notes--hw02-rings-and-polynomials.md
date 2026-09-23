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
source: "notes/math/modern-algebra/homeworks/hw02-rings-and-polynomials.typ"
subtitle: Integers, rings, groups, quotients, and a glimpse of elliptic curves
title: (A Bit of) Abstract Algebra
---
# Homework 2: Congruence Classes and Functions (35/40) {#homework-02}

Source: 'Homework/412-Hw-2-graded.pdf' (33 PDF pages). The source interleaves Canvas grading and navigation pages with the handwritten submission. Source trails identify all transcribed pages; navigation-only and empty-shell pages are recorded in the migration receipt.

## Grading record and feedback

**Source trail:** PDF p. 1.

The graded total is 35/40. Question scores are 8/10, 10/10, 10/10, and 7/10. The substantive comments are retained verbatim:

- Question 1: "I didn't really understand anything, try to always point out what you are accomplishing with each step."
- Question 4: "This is somewhat philosophically unsatisfactory for then, there may be an empty eq. class. And all that follows would be inaccurate. I'm just going to subtract one point for it, but remember to think of eq. classes as partitions first."
- Question 4: "To define Z/nZ you need the equivalence relation you are trying to show exists as of this form. The logic is somewhat circular."

A separate one-character Question 2 comment reads "n".

## Question 1: simultaneous congruences

**Source trail:** PDF pp. 3-4, 6, 8, 10, and 11 (prompt and handwritten answer).

The system is $x \equiv a$ modulo $m$ and $x \equiv b$ modulo $n$, where $\gcd\left( {m,n} \right) = 1$.

For part (a), assuming $rm + sn = 1$, the response takes

$$
x = asn + brm.
$$

Modulo $m$, it rewrites $asn$ as $a\left( {1 - rm} \right) = a - arm$, while $brm$ is divisible by $m$, so $x \equiv a$. Similarly, modulo $n$, it rewrites $brm$ as $b\left( {1 - sn} \right) = b - bsn$, while $asn$ is divisible by $n$, giving $x \equiv b$. It therefore states that this $x$ solves the system.

For part (b), $\gcd\left( {m,n} \right) = 1$ and Bézout give integers $r,s$ with $rm + sn = 1$. Part (a) then supplies $x = asn + brm$ for every choice of $a,b$.

For part (c), fix a solution $x_{1}$ and take an arbitrary $x \in \left\lbrack x_{1} \right\rbrack_{mn}$. The answer writes $x = x_{1} + kmn$ for some integer $k$. Consequently $x \equiv x_{1} \equiv a$ modulo $m$ and $x \equiv x_{1} \equiv b$ modulo $n$, so every element of the class is a solution.

For part (d), it lets $x_{1} = a + gm = b + fn$ and an arbitrary solution $x = a + pm = b + qn$. Hence both $m$ and $n$ divide $x - x_{1}$. The response invokes the Fundamental Theorem of Arithmetic and the relative primality of $m,n$ to conclude that $mn$ divides $x - x_{1}$, so $x \in \left\lbrack x_{1} \right\rbrack_{mn}$. Together with part (c), this proves that the set of solutions is exactly $\left\lbrack x_{1} \right\rbrack_{mn}$.

For part (e), the Euclidean algorithm in the answer is

$$
169 = 2 \cdot 72 + 25,72 = 2 \cdot 25 + 22,25 = 22 + 3,
$$
$$
22 = 7 \cdot 3 + 1,3 = 3 \cdot 1 + 0.
$$

Back-substitution gives

$$
1 = 54 \cdot 72 - 23 \cdot 169.
$$

For the system $x \equiv 11$ modulo $72$ and $x \equiv 30$ modulo $169$, it takes

$$
x_{1} = 30 \cdot 54 \cdot 72 - 11 \cdot 23 \cdot 169 = 73883.
$$

The response checks $x_{1} = 11 - 594 \cdot 72$, hence $x_{1} \equiv 11$ modulo $72$, and states similarly that $x_{1} \equiv 30$ modulo $169$. Its full answer is

$$
\lbrack 73883\rbrack_{12168}.
$$

## Question 2: maps between congruence classes

**Source trail:** PDF pp. 11, 13, 15, and 17 (prompt and handwritten answer).

For part (a), the proposed map ${\mathbb{Z}}_{3}\rightarrow{\mathbb{Z}}_{6}$, $\lbrack a\rbrack_{3}\rightarrow\lbrack a\rbrack_{6}$, is declared not well-defined. The counterexample is $a = 1$, $b = 4$: $\lbrack a\rbrack_{3} = \lbrack b\rbrack_{3}$, but $\lbrack 1\rbrack_{6}$ and $\lbrack 4\rbrack_{6}$ are distinct.

For part (b), the map ${\mathbb{Z}}_{6}\rightarrow{\mathbb{Z}}_{3}$, $\lbrack a\rbrack_{6}\rightarrow\lbrack a\rbrack_{3}$, is declared well-defined. If $\lbrack a\rbrack_{6} = \lbrack b\rbrack_{6}$, then $b = a + 6k = a + 3\left( {2k} \right)$, so $b \equiv a$ modulo $3$ and $\lbrack b\rbrack_{3} = \lbrack a\rbrack_{3}$.

For part (c), assume $n$ divides $m$ and write $m = np$. If $\lbrack a\rbrack_{m} = \lbrack b\rbrack_{m}$, then $b = a + mk = a + n\left( {pk} \right)$ for some integer $k$. Thus $b \equiv a$ modulo $n$, proving that $\lbrack a\rbrack_{m}\rightarrow\lbrack a\rbrack_{n}$ is well-defined.

For part (d), assume $n$ does not divide $m$. The two source representatives $\lbrack a\rbrack_{m}$ and $\left\lbrack {a + m} \right\rbrack_{m}$ are the same class. If their targets in ${\mathbb{Z}}_{n}$ were equal, then $a + m = a + kn$ for some integer $k$, so $n$ would divide $m$, a contradiction. The response concludes that the rule is not well-defined.

## Question 3: solutions of a congruence-class equation

**Source trail:** PDF pp. 19-21, 23, 25, and 27-28 (prompt and handwritten answer).

Let $d = \gcd\left( {a,n} \right)$ and consider $\lbrack a\rbrack_{n}y = \lbrack b\rbrack_{n}$.

For part (a), the proof is by contraposition. If $y = \lbrack r\rbrack_{n}$ is a solution, then $\left\lbrack {ar} \right\rbrack_{n} = \lbrack b\rbrack_{n}$, hence $ar = b + pn$ for some integer $p$. Thus

$$
b = ar - pn
$$

is an integer linear combination of $a,n$. The answer invokes the description of all such combinations as the multiples of $\gcd\left( {a,n} \right)$, and obtains $d$ dividing $b$. Hence if $d$ does not divide $b$, there is no solution.

For part (b), with $b = 0$, it first takes $x = k\frac{n}{d}$ and computes

$$
ax = k \cdot \left( \frac{a}{d} \right) \cdot n,
$$

so $\lbrack a\rbrack_{n}\lbrack x\rbrack_{n} = \lbrack 0\rbrack_{n}$. Conversely, if $\lbrack x\rbrack_{n}$ is a solution, then $ax = pn$. After division by $d$,

$$
\left( \frac{a}{d} \right)x = p \cdot \left( \frac{n}{d} \right).
$$

The response proves $\gcd\left( {\frac{a}{d},\frac{n}{d}} \right) = 1$ by contradiction: a common divisor greater than $1$ would make a common divisor of $a,n$ greater than $d$. It then applies the Fundamental Theorem of Arithmetic to conclude that $\frac{n}{d}$ divides $x$. Thus the displayed solution set is

$$
\left\{ {\left\lbrack {k\frac{n}{d}} \right\rbrack_{n}:k \in {\mathbb{Z}}} \right\} = \left\{ {\lbrack 0\rbrack_{n},\left\lbrack \frac{n}{d} \right\rbrack_{n},\left\lbrack {2\frac{n}{d}} \right\rbrack_{n},\ldots,\left\lbrack {\left( {d - 1} \right)\frac{n}{d}} \right\rbrack_{n}} \right\}.
$$

For part (c), Bézout gives $ra + sn = d$. Since $d - ra = sn$, the response writes $\lbrack d\rbrack_{n} = \left\lbrack {ra} \right\rbrack_{n}$. If $b = kd$, then

$$
\lbrack a\rbrack_{n}\left\lbrack {r\frac{b}{d}} \right\rbrack_{n} = \lbrack a\rbrack_{n}\left\lbrack {rk} \right\rbrack_{n} = \left\lbrack {ra} \right\rbrack_{n}\lbrack k\rbrack_{n} = \lbrack d\rbrack_{n}\lbrack k\rbrack_{n} = \lbrack b\rbrack_{n}.
$$

Thus $\left\lbrack {r\frac{b}{d}} \right\rbrack_{n}$ is a solution.

For part (d), fix a solution $y_{1} = \left\lbrack r_{1} \right\rbrack_{n}$. If $y = \lbrack r\rbrack_{n}$ is another solution, then $ar = b + pn$ and $ar_{1} = b + p_{1}n$, so

$$
a \cdot \left( {r - r_{1}} \right) = \left( {p - p_{1}} \right) \cdot n.
$$

Thus $z = y - y_{1}$ solves $\lbrack a\rbrack_{n}z = \lbrack 0\rbrack_{n}$. Conversely, if $z = y - y_{1}$ solves the zero equation, the response uses distributivity in congruence classes to add $\lbrack a\rbrack_{n}y_{1} = \lbrack b\rbrack_{n}$ and obtain $\lbrack a\rbrack_{n}y = \lbrack b\rbrack_{n}$. Therefore the number of solutions to the original equation is the same as for the zero equation, namely exactly $d$.

## Question 4: equivalence relations induced by functions

**Source trail:** PDF pp. 28, 30-31, and 33 (prompt and handwritten answer).

For part (a), let $x,y,z \in X$. Since $f(x) = f(x)$, the relation defined by $f(x) = f\left( x' \right)$ is reflexive. If $x \sim y$, then $f(x) = f(y)$ and therefore $f(y) = f(x)$, proving symmetry. If $x \sim y$ and $y \sim z$, then $f(x) = f(y) = f(z)$, proving transitivity. The response concludes that it is an equivalence relation.

For part (b), it defines the class indexed by an image value as

$$
\lbrack y\rbrack = \left\{ {x \in X:f(x) = y} \right\}
$$

and the set of all such classes as

$$
X_{f} = \left\{ {\lbrack y\rbrack:y \in \Im(f)} \right\}.
$$

It then defines $\varphi:X_{f}\rightarrow\Im(f)$ by $\lbrack y\rbrack\rightarrow y$. The answer argues that every member of $\lbrack y\rbrack$ has image $y$, so the map is well-defined; it argues injectivity by contradiction from unequal classes allegedly mapping to the same image; and it proves surjectivity because every $y \in \Im(f)$ is $f(x)$ for some $x \in X$, whose class maps to $y$. It concludes that $\varphi$ is bijective.

For part (c), it takes

$$
f:{\mathbb{Z}}\rightarrow{\mathbb{Z}}_{n},q\quad x\rightarrow\lbrack x\rbrack_{n}.
$$

Then $f(x) = f\left( x' \right)$ exactly when $x \equiv x'$ modulo $n$, so congruence modulo a fixed $n$ is the preceding function-induced relation. The response concludes that this gives a partition of $\mathbb{Z}$ whose equivalence classes are

$$
\lbrack 0\rbrack_{n},\lbrack 1\rbrack_{n},\ldots,\left\lbrack {n - 1} \right\rbrack_{n}.
$$

