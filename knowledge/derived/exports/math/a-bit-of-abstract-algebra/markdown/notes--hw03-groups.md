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
source: "notes/math/modern-algebra/homeworks/hw03-groups.typ"
subtitle: Integers, rings, groups, quotients, and a glimpse of elliptic curves
title: (A Bit of) Abstract Algebra
---
# Homework 3: rings, nilpotents, and homomorphisms

*Personal finished homework transcription from 412-Hw-3-finished.pdf.*

## 1. Subsets of $Fun\left( {{\mathbb{R}},{\mathbb{R}}} \right)$

Let $R = Fun\left( {{\mathbb{R}},{\mathbb{R}}} \right)$ be the ring in exercise D2 of the "Ring Basics" adventure sheet. $0_{R}$ and $1_{R}$ are the constant functions zero and one. Show which of the following subsets of $R$ are subrings of $R$. If they are not subrings, show whether they are rings (with a different multiplicative identity than $1_{R}$, but endowed with the same operations as in $R$) or not.

\(a\) The set $C$ of constant functions.

\(b\) The set $S$ of those functions $f$ such that $f(q) = 0$ for any $q \in {\mathbb{Q}}$.

\(c\) The set $T$ consisting of $0_{R}$, together with those functions with no zeros, or only a finite number of zeros. (A zero of a function $f \in R$ is an element $x \in {\mathbb{R}}$ such that $f(x) = 0$.)

**(a)** $C$ is a subring of $R$.

**Pf.** Since $0_{R}$ is $f(x) = 0$ and $1_{R}$ is $f(x) = 1$, $0_{R},1_{R} \in C$. Let $f,g$ be two elements in $C$, and suppose $f(x) = a$, $g(x) = b$ for some $a,b \in {\mathbb{R}}$. Then

$$
\left( {f + g} \right)(x) = a + b = f(x) + g(x),
$$

so $C$ is closed under addition. Also,

$$
fg(x) = ab = f(x)g(x),
$$

so $C$ is closed under multiplication. Since $- f(x) = - a$ is also a constant function, $- f \in C$, so $C$ is closed under additive inverse. Since $C \subset R$ and $R$ is a ring, by worksheet 3 it suffices to show these four facts. So $C$ is a subring of $R$.

**(b)** $S$ is not a subring of $R$. Since $1_{R}$, the constant function $f(x) = 1$, is not in $S$ (for $x \in {\mathbb{Q}}$, $f(x) \neq 0$), $S$ violates the definition of subring. And $S$ is not even a ring because it does not have a multiplicative identity.

To show this, assume there is a function $f \in S$ such that for all $g \in S$, $fg = gf = g$. Take $g(x) = 2$. Then, for any $x \in {\mathbb{R}}$, $2f(x) = 2$, so $f(x) = 1$, which is not in $S$. Thus $S$ does not have a multiplicative identity; therefore it is not a ring.

**(c)** $T$ is not a subring of $R$, and not a ring. Consider $f$ defined by $f(x) = 1$ for $x \geq 0$ and $f(x) = x$ for $x < 0$; and $g$ defined by $g(x) = - 1$ for $x \geq 0$ and $g(x) = x$ for $x < 0$.

So $f(x)$ and $g(x)$ both only contain one zero point; therefore $f(x),g(x) \in T$. But

Then $\left( {f + g} \right)(x) = 0$ for $x \geq 0$ and $\left( {f + g} \right)(x) = 2x$ for $x < 0$.

contains infinitely many "zeros." Thus $f(x) + g(x) \notin T$. Therefore $T$ is not closed under addition, so $T$ is not a ring and definitely not a subring of $R$.

## 2. Nilpotents and units

An element $x$ in a ring $R$ is said to be *nilpotent* if $x^{m} = 0_{R}$ for some positive integer $m$. Generalizing the definition on page 40 of our text, a *unit* $u$ in a ring $R$ is an element with a multiplicative inverse, meaning there exists $s \in R$ such that $su = us = 1_{R}$.

\(a\) Prove that if $x \in R$ is nilpotent (and $R$ is not the zero ring), then $x$ cannot be a unit.

\(b\) Prove that if $x \in R$ is nilpotent, then $\left( {1_{R} - x} \right)$ is a unit. (Hint: One approach to showing something is a unit is to write down its inverse. In this case, it could help to recall geometric series from Calculus.)

\(c\) Describe all the nilpotent elements in ${\mathbb{Z}}_{n}$ in terms of their prime factorization.

**(a)** Let $R$ be a ring which is not the zero ring ($0_{R}$ and $1_{R}$ are different elements). Assume $x \in R$ is nilpotent. Then for some $m \in {\mathbb{Z}}$, $x^{m} = 0_{R}$. Let $m$ be the smallest positive integer such that $x^{m} = 0_{R}$.

Case 1: $m \geq 2$. Assume for sake of contradiction that $x$ is a unit. Then for some $y \in R$, $xy = yx = 1_{R}$. Multiply both sides by $x^{m - 1}$:

$$
x^{m - 1}xy = x^{m - 1}yx
$$
$$
\Rightarrow\left( x^{m} \right)y = x^{m - 1}\left( {yx} \right)
$$
$$
\Rightarrow 0_{R}y = x^{m - 1}1_{R}
$$
$$
\Rightarrow 0_{R} = x^{m - 1}.
$$

This violates the assumption that $m$ is the smallest integer such that $x^{m} = 0_{R}$.

Case 2: $m = 1$. Then $x = 0_{R}$, so $x$ cannot be a unit, since $0_{R} \neq 1_{R}$ and for every $y \in R$, $xy = 0_{R}y = 0_{R} \neq 1_{R}$. This contradicts that $x$ is a unit. Since every case causes a contradiction, we have proved that if $x \in R$ is nilpotent, then $x$ is not a unit.

**(b)** Let $x \in R$ be nilpotent, and let $m$ be the smallest positive integer such that $x^{m} = 0_{R}$.

Case 1: $m = 1$. Then $x = 0_{R}$. Consider $1_{R}$; then

$$
1_{R{({1_{R} - x})}} = 1_{R} - 1_{R}x = \left( {1_{R} - x} \right)1_{R} = 1_{R},
$$

so $1_{R} - x$ is a unit.

Case 2: $m \geq 2$. Consider

$$
y = 1_{R} + x + x^{2} + \ldots + x^{m - 1}.
$$

Then

$$
\left( {1_{R} - x} \right)y = 1_{R} + x + x^{2} + \ldots + x^{m - 1} - x - x^{2} - \ldots - x^{m - 1} - x^{m} = 1_{R} - x^{m} = 1_{R} - 0_{R} = 1_{R}.
$$

Similarly, $y\left( {1_{R} - x} \right) = 1_{R}$. So $1_{R} - x$ is a unit. Therefore we have proved the statement.

**(c)** By FTA,

$$
n = p_{1}^{a_{1}}p_{2}^{a_{2}}\ldots p_{k}^{a_{k}}
$$

for primes $p_{1},\ldots,p_{k}$ and their multiplicities $a_{1},\ldots,a_{k}$. For any nilpotent $x$ of ${\mathbb{Z}}_{n}$,

$$
x^{\alpha} \equiv 0\operatorname{mod}n
$$

for some $\alpha \in {\mathbb{Z}}$. Thus $x^{\alpha} = \beta n = \beta p_{1}^{a_{1}}p_{2}^{a_{2}}\ldots p_{k}^{a_{k}}$ for some $\beta \in {\mathbb{Z}}$. Therefore $\left( {p_{1}p_{2}\ldots p_{k}} \right) \mid x^{\alpha}$, so $x$ contains all prime factors $p_{1},\ldots,p_{k}$. Under $\alpha = \max\left( {a_{1},a_{2},\ldots,a_{k}} \right)$, $x^{\alpha}$ contains $\left( {p_{1}\ldots p_{k}} \right)^{a_{i}}$ as factor. Therefore, as long as $x$ contains all prime factors of $n$, $x$ is nilpotent.

Note that $x$ also must contain all prime factors: if some prime $p_{i} \mid n$ but $p_{i} \nmid x$, then $x$ is not nilpotent. This is obvious since if $p_{i} \nmid x$, there is no $\alpha \in {\mathbb{Z}}$ such that $x^{\alpha}$ has the factor $p_{i}^{a_{i}}$ of $n$. So the set of nilpotents of ${\mathbb{Z}}_{n}$ is just the set of multiples of all different prime factors of $n$:

the set of classes $\lbrack x\rbrack_{n}$ for which $x = tp_{1}\ldots p_{k}$, $t \in {\mathbb{Z}}$, and $p_{1},\ldots,p_{k}$ are all different prime factors of $n$.

## 3. Zerodivisors

An element $r \neq 0$ in a commutative ring $R$ is said to be a *zerodivisor* if there exists a nonzero element $s \in R$ such that $rs = 0$.

\(a\) Given a nonzero element $r \in R$, prove that $r$ is not a zerodivisor if and only if the map $R\rightarrow R$ given by multiplication by $r$, meaning the map $s\mapsto rs$, is injective.

\(b\) Describe all the zerodivisors in ${\mathbb{Z}}_{n}$ in terms of the prime factorization of $n$ or their greatest common divisor with $n$.

**(a)** Denote the map by $f(s) = rs$.

\(1\) Assume $r$ is not a zerodivisor. Assume $f\left( s_{1} \right) = f\left( s_{2} \right)$, so $rs_{1} = rs_{2}$. Thus $r\left( {s_{1} - s_{2}} \right) = 0_{R}$. Since $r$ is not a zerodivisor, there is no nonzero element $s$ such that $rs = 0_{R}$. So $s_{1} - s_{2}$ can only be $0_{R}$, hence $s_{1} = s_{2}$. Therefore $f\left( s_{1} \right) = f\left( s_{2} \right)$ implies $s_{1} = s_{2}$; the function is injective.

\(2\) Assume $f$ is injective. Assume for contradiction that $r$ is a zerodivisor. Then for some $s \in R$ with $s \neq 0_{R}$, $sr = 0_{R}$. So $f(s) = 0_{R}$, and since $f\left( 0_{R} \right) = r0_{R} = 0_{R}$, $f(s) = f\left( 0_{R} \right)$ while $s \neq 0_{R}$, contradicting that $f$ is injective. Hence $r$ is not a zerodivisor. Since (1) and (2), we have proved the iff statement.

**(b)** Let $\lbrack r\rbrack_{n}$ be a zerodivisor in ${\mathbb{Z}}_{n}$. It means there exists $\lbrack s\rbrack_{n} \in {\mathbb{Z}}_{n}$ such that $\lbrack r\rbrack_{{n{\lbrack s\rbrack}}_{n}} = \lbrack 0\rbrack_{n}$, which is not $\lbrack 0\rbrack_{n}$. Thus $rs = kn$ for some $s,k \in {\mathbb{Z}}$ with $n \nmid s$.

\(1\) If $\gcd\left( {r,n} \right) = 1$, then $r,n$ have no common prime factor. To satisfy $rs = kn$, $s$ must contain all prime factors of $n$; this means $n \mid s$. So the circumstance is impossible.

\(2\) If $\gcd\left( {r,n} \right) > 1$, then $r,n$ have at least some common factor $p$. By FTA, $n = p_{1}\left( {q_{1}\ldots q_{d}} \right)$ for some primes $q_{1},\ldots,q_{d}$. Consider $s = q_{1}\ldots q_{d}$; then $rs = kn$ for some $k \in {\mathbb{Z}}$, so $\lbrack s\rbrack_{n}$ is a solution to $\lbrack r\rbrack_{{n{\lbrack s\rbrack}}_{n}} = \lbrack 0\rbrack_{n}$. Here $s = q_{1}\ldots q_{d} < n$, so $n \nmid s$, satisfying the requirement that $\lbrack s\rbrack_{n} \neq \lbrack 0\rbrack_{n}$.

Therefore the set of all zerodivisors of ${\mathbb{Z}}_{n}$ is

$$
\left\{ \lbrack r\rbrack_{n}\  \middle| \gcd\left( {r,n} \right) > 1 \right\}.
$$

[**Source note (PDF p. 8).** The handwritten construction in (2) asserts $rs = kn$ after taking $s = q_{1}\ldots q_{d}$, without recording the prime-exponent condition needed for that equality. It is transcribed above as written.]{style="display: inline-block"}

## 4. Ring homomorphisms

For two rings $R$ and $S$ a function $\varphi:R\rightarrow S$ is a ring homomorphism if $\varphi\left( 1_{R} \right) = 1_{S}$, and for all $x,y \in R$,

$$
\varphi\left( {x +_{R}y} \right) = \varphi(x) +_{S}\varphi(y),\quad\varphi\left( {x \times_{R}y} \right) = \varphi(x) \times_{S}\varphi(y).
$$

\(a\) Let $R$ be any ring (recalling how our class convention differs from that of the book!). Prove that there exists a unique ring homomorphism ${\mathbb{Z}}\rightarrow R$.

\(b\) Let $n > 1$ be an integer. Prove that there does not exist a ring homomorphism ${\mathbb{Z}}_{n}\rightarrow{\mathbb{Z}}$.

\(c\) Suppose $R$ and $S$ are two rings, and $f:R\rightarrow S$ is a ring isomorphism; in particular, $f$ is a bijection and so has an inverse function $g:S\rightarrow R$. Prove that $g$ is also a ring homomorphism.

\(d\) Prove: If $f:R\rightarrow S$ is a ring homomorphism, then $f$ is injective if and only if $\ker f = \left\{ 0_{R} \right\}$.

**(a)** Consider $\varphi:{\mathbb{Z}}\rightarrow R$, $n\mapsto n \cdot 1_{R}$. Thus $\varphi\left( 1_{\mathbb{Z}} \right) = 1_{R}$. Let $x,y$ be arbitrary elements in $\mathbb{Z}$. Then

$$
\varphi\left( {x + y} \right) = \left( {x + y} \right)1_{R} = x1_{R} + y1_{R} = \varphi(x) + \varphi(y),
$$
$$
\varphi\left( {xy} \right) = \left( {xy} \right)1_{R} = \left( {x1_{R}} \right)\left( {y1_{R}} \right) = \varphi(x)\varphi(y).
$$

So $\varphi$ is a homomorphism. Assume $f$ is any homomorphism from $\mathbb{Z}$ to $R$. Then $f(1) = \varphi(1) = 1_{R}$, and by theorem 3-10 on textbook, $f\left( {- 1} \right) = - f(1) = - \varphi(1) = - 1_{R}$ and $f(0) = \varphi(0) = 0_{R}$.

Let $n$ be an arbitrary positive integer that is not $1$. By definition of homomorphism,

$$
f(n) = f\left( {1 + 1 + \ldots + 1} \right) = f(1) + f(1) + \ldots + f(1) = nf(1) = n \cdot 1_{R} = \varphi(n).
$$

Similarly, for any negative integer $m$ that is not $- 1$,

$$
f(m) = f\left( {\left( {- 1} \right) + \left( {- 1} \right) + \ldots + \left( {- 1} \right)} \right) = f\left( {- 1} \right) + \ldots + f\left( {- 1} \right) = - mf\left( {- 1} \right) = m \cdot 1_{R} = \varphi(m).
$$

Therefore for any $n \in {\mathbb{Z}}$, $\varphi(n) = f(n)$, so $\varphi = f$. Therefore the homomorphism is unique.

**(b)** Assume for sake of contradiction that $\varphi$ is a homomorphism from ${\mathbb{Z}}_{n}$ to $\mathbb{Z}$. By definition, $\varphi\left( \lbrack 0\rbrack_{n} \right) = 0$ and $\varphi\left( \lbrack 1\rbrack_{n} \right) = 1$. So

$$
\varphi\left( {\lbrack 1\rbrack_{n} + \lbrack 1\rbrack_{n}} \right) = \varphi\left( \lbrack 1\rbrack_{n} \right) + \varphi\left( \lbrack 1\rbrack_{n} \right) = 2.
$$

Repeat process (1) by $n$ times. Then

$$
\varphi\left( {\lbrack 1\rbrack_{n} + \ldots + \lbrack 1\rbrack_{n}} \right) = n,
$$

so $\varphi\left( \lbrack n\rbrack_{n} \right) = n$. Since $\lbrack n\rbrack_{n} = \lbrack 0\rbrack_{n}$, $\varphi\left( \lbrack n\rbrack_{n} \right) = n$ contradicts $\varphi\left( \lbrack 0\rbrack_{n} \right) = 0$, violating the definition of homomorphism as a function. Therefore such homomorphism does not exist.

**(c)** $f:R\rightarrow S$ is a ring isomorphism. Since $f$ is bijective, let $s_{1},s_{2}$ be arbitrary elements in $S$. There exist unique elements $r_{1},r_{2} \in R$ such that $f\left( r_{1} \right) = s_{1}$, $f\left( r_{2} \right) = s_{2}$. Then

$$
f^{- 1}\left( {s_{1} + s_{2}} \right) = f^{- 1}\left( {f\left( r_{1} \right) + f\left( r_{2} \right)} \right) = f^{- 1}\left( {f\left( {r_{1} + r_{2}} \right)} \right) = r_{1} + r_{2} = f^{- 1}\left( s_{1} \right) + f^{- 1}\left( s_{2} \right),
$$

so $g$ is closed under addition. Also,

$$
g\left( {s_{1},s_{2}} \right) = f^{- 1}\left( {s_{1},s_{2}} \right) = f^{- 1}\left( {f\left( r_{1} \right)f\left( r_{2} \right)} \right) = f^{- 1}\left( {f\left( {r_{1}r_{2}} \right)} \right) = r_{1}r_{2} = f^{- 1}\left( s_{1} \right)f^{- 1}\left( s_{2} \right) = g\left( s_{1} \right)g\left( s_{2} \right),
$$

so $g$ is closed under multiplication. Also, since $f$ is a homomorphism, $f\left( 1_{R} \right) = 1_{S}$. Since $f$ is bijective and has inverse, $1_{R} = f^{- 1}\left( 1_{S} \right) = g\left( 1_{S} \right)$. By (1), (2), (3), $g$ is also a ring homomorphism.

**Source note (PDF pp. 11-12).** The handwritten multiplication line uses $g\left( {s_{1},s_{2}} \right)$ and then $f^{- 1}\left( {s_{1},s_{2}} \right)$; the source's notation is retained although the surrounding computation uses multiplication.

**(d)** First prove: if $f$ is injective, then $\ker(f) = \left\{ 0_{R} \right\}$. Since $f\left( 0_{R} \right) = 0_{S}$ by $f$ being a homomorphism, $0_{R} \in \ker(f)$. Let $r \in \ker(f)$, so $f(r) = 0_{S} = f\left( 0_{R} \right)$. Since $f$ is injective, $f(r) = f\left( 0_{R} \right)$ implies $r = 0_{R}$. So any element in $\ker(f)$ can only be $0_{R}$, and $\ker(f) = \left\{ 0_{R} \right\}$.

Next prove: if $\ker(f) = \left\{ 0_{R} \right\}$ then $f$ is injective. Let $s_{1} = f\left( r_{1} \right)$, $s_{2} = f\left( r_{2} \right)$ and $s_{1} = s_{2}$ (that is, $f\left( r_{1} \right) = f\left( r_{2} \right)$). Then $f\left( r_{1} \right) - f\left( r_{2} \right) = 0_{S}$. Since $f$ is a homomorphism, $f\left( r_{1} \right) - f\left( r_{2} \right) = f\left( {r_{1} - r_{2}} \right) = 0_{S}$.

So $\left( {r_{1} - r_{2}} \right) \in \ker(f)$. Since $\ker(f) = \left\{ 0_{R} \right\}$, $r_{1} - r_{2} = 0_{R}$, hence $r_{1} = r_{2}$. Therefore $f$ is injective if $\ker(f) = \left\{ 0_{R} \right\}$.

