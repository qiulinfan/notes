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
source: "notes/math/modern-algebra/homeworks/hw05-group-actions-and-homomorphisms.typ"
subtitle: Integers, rings, groups, quotients, and a glimpse of elliptic curves
title: (A Bit of) Abstract Algebra
---
# Homework 5: matrix ideals, rational subrings, and polynomial quotients

*Personal finished homework transcription from 412-Hw-5-finished.pdf.*

## 1. The ring $M_{2}({\mathbb{R}})$

Consider the ring $M_{2}({\mathbb{R}})$.

\(a\) Take any nonzero $2 \times 2$ matrix $A$. Show that by multiplying $A$ on the left by matrices of the form

$$
\begin{pmatrix}
1 & a \\
0 & 1
\end{pmatrix},\quad\begin{pmatrix}
1 & 0 \\
b & 1
\end{pmatrix},\quad\begin{pmatrix}
c & 0 \\
0 & 1
\end{pmatrix},\quad\begin{pmatrix}
1 & 0 \\
0 & c
\end{pmatrix},\quad\begin{pmatrix}
0 & 1 \\
1 & 0
\end{pmatrix},
$$

we can do any elementary row operation to $A$.

\(b\) State a way of interpreting column operations using matrix multiplication.

\(c\) Prove that the only ideals in $M_{2}({\mathbb{R}})$ are $\left\{ 0 \right\}$ and $M_{2}({\mathbb{R}})$.

**(a)** Let $A$ be an arbitrary matrix in $M_{2}({\mathbb{R}})$. Then

$$
A = \begin{pmatrix}
w & x \\
y & z
\end{pmatrix}
$$

for some $w,x,y,z \in {\mathbb{R}}$.

\(1\)

$$
\begin{pmatrix}
1 & a \\
0 & 1
\end{pmatrix}A = \begin{pmatrix}
{w + ay} & {x + az} \\
y & z
\end{pmatrix}.
$$

It is equivalent to adding some multiple of the second row to the first row.

\(2\)

$$
\begin{pmatrix}
1 & 0 \\
b & 1
\end{pmatrix}A = \begin{pmatrix}
w & x \\
{y + bw} & {z + bx}
\end{pmatrix}.
$$

It is equivalent to adding some multiple of the first row to the second row.

\(3\)

$$
\begin{pmatrix}
c & 0 \\
0 & 1
\end{pmatrix}A = \begin{pmatrix}
{cw} & {cx} \\
y & z
\end{pmatrix}.
$$

It is equivalent to multiplying the first row by some scalar $c$.

\(4\)

$$
\begin{pmatrix}
1 & 0 \\
0 & c
\end{pmatrix}A = \begin{pmatrix}
w & x \\
{cy} & {cz}
\end{pmatrix}.
$$

It is equivalent to multiplying the second row by some scalar $c$.

\(5\)

$$
\begin{pmatrix}
0 & 1 \\
1 & 0
\end{pmatrix}A = \begin{pmatrix}
y & z \\
w & x
\end{pmatrix}.
$$

It is equivalent to swapping the order of the two rows.

By (1), (2), (3), (4), (5), we have shown that through multiplying $A$ on the left by matrices of the five forms, we can do all five elementary row operations to $A$ respectively.

**(b)** Column operations are just multiplying $A$ on the right by the same five matrices in (a). For example,

$$
A\begin{pmatrix}
1 & a \\
0 & 1
\end{pmatrix} = \begin{pmatrix}
w & {x + aw} \\
y & {z + ay}
\end{pmatrix},
$$

which adds some multiple of the first column to the second.

**(c)** Pf. We have known that any ring has $\left\{ 0 \right\}$ as an ideal. Now we prove that any ideal of $M_{2}({\mathbb{R}})$, if it is not $\left\{ 0 \right\}$, then must be $M_{2}({\mathbb{R}})$ itself.

Let $I$ be an ideal of $M_{2}({\mathbb{R}})$. Assume $I \neq \left\{ 0 \right\}$, so there exists some other element $A \neq 0 \in I$. Let

$$
A = \begin{pmatrix}
a & b \\
c & d
\end{pmatrix}.
$$

Since $A \neq 0$, at least one of its entries is not $0$. Without loss of generality, assume $a \neq 0$. By definition of ideal,

$$
\begin{pmatrix}
a^{- 1} & 0 \\
0 & 0
\end{pmatrix}\begin{pmatrix}
a & b \\
c & d
\end{pmatrix} = \begin{pmatrix}
1 & 0 \\
0 & 0
\end{pmatrix} \in I.
$$

Then

$$
\begin{pmatrix}
a & 0 \\
0 & 0
\end{pmatrix}\begin{pmatrix}
1 & 0 \\
0 & 0
\end{pmatrix} = \begin{pmatrix}
1 & 0 \\
0 & 0
\end{pmatrix} \in I.
$$

Also,

$$
\begin{pmatrix}
0 & 1 \\
1 & 0
\end{pmatrix}\begin{pmatrix}
1 & 0 \\
0 & 0
\end{pmatrix} \in I,\quad\begin{pmatrix}
1 & 0 \\
0 & 0
\end{pmatrix}\begin{pmatrix}
0 & 1 \\
1 & 0
\end{pmatrix} \in I,
$$

so the four matrix units are in $I$. By the displayed products,

$$
\begin{pmatrix}
1 & 0 \\
0 & 0
\end{pmatrix} + \begin{pmatrix}
0 & 0 \\
0 & 1
\end{pmatrix} = \begin{pmatrix}
1 & 0 \\
0 & 1
\end{pmatrix} \in I.
$$

No matter which entry we assume is nonzero, we can always get this result since the property of ideal preserves elementary operations, so we can always operate to leave only one nonzero entry and then get $\begin{pmatrix}
1 & 0 \\
0 & 0
\end{pmatrix}$ by elementary operations. Since this identity matrix is in $I$, let $K \in M_{2}({\mathbb{R}})$ be arbitrary. Then $KI = K \in I$, so $M_{2}({\mathbb{R}}) \subseteq I$. Since $I \subseteq M_{2}({\mathbb{R}})$, $I = M_{2}({\mathbb{R}})$ if $I \neq \left\{ 0 \right\}$. Therefore the only ideals are $\left\{ 0 \right\}$ and $M_{2}({\mathbb{R}})$.

## 2. Odd denominators

Let $S_{o}dd \subset {\mathbb{Q}}$ be the subset of rational numbers with odd denominators (when expressed in lowest terms).

\(a\) Show that $S_{o}dd$ is a subring of $\mathbb{Q}$.

\(b\) Let $I \subseteq S_{o}dd$ be the subset of rational numbers with even numerator (when expressed in lowest terms). Prove that $I$ is an ideal of $S_{o}dd$.

\(c\) Define a ring homomorphism $\varphi:S_{o}dd\rightarrow{\mathbb{Z}}_{2}$. What is the kernel?

**(a)** (1) $1_{\mathbb{Q}} = \frac{1}{1} \in S_{o}dd$, and $0_{\mathbb{Q}} = \frac{0}{1} \in S_{o}dd$.

\(2\) Let $a,b$ be arbitrary elements of $S_{o}dd$. Then $a = \frac{p}{q}$, $b = \frac{m}{n}$ for some $p,q,m,n \in {\mathbb{Z}}$. By definition of rational numbers, since $a,b \in S_{o}dd$, $q,n$ are odd. So

$$
a + b = \frac{pn + mq}{qn} \in S_{o}dd
$$

since $qn$ is odd; and $ab = p\frac{m}{qn} \in S_{o}dd$ for the same reason.

\(3\) Let $a \in S_{o}dd$ be arbitrary. Then $a = \frac{p}{q}$ for $p,q \in {\mathbb{Z}}$ where $q$ is odd. So $- a = - \frac{p}{q} \in S_{o}dd$. Since (1), (2), (3), by theorem 3.2, $S_{o}dd$ is a subring of $\mathbb{Q}$.

**(b)** Let $a,b$ be two elements of $I$. Then $a = \frac{p}{q}$, $b = \frac{m}{n}$ for some $p,q,m,n \in {\mathbb{Z}}$, where $p,m$ are even and $q,n$ are odd. So

$$
a + b = \frac{pn + mq}{qn}.
$$

Since $p,m$ are even, $pn + mq$ is even; since $q,n$ are odd, $qn$ is odd. So $a + b \in I$.

Let $x \in S_{o}dd$ be arbitrary, so $x = \frac{s}{t}$ for some integer $s,t$ where $t \neq 0$ is odd. Then

$$
ax = p\frac{a}{tq}.
$$

Since $t,q$ are odd, $tq$ is odd; and since $p$ is even, $ps$ is even. Therefore $ax,xa \in I$. Nonemptiness is guaranteed by $\frac{2}{1} \in I$. So by definition, $I$ is an ideal of $S_{o}dd$.

[**Source note (PDF p. 6).** The handwritten multiplication line reads $ax = p\frac{a}{tq}$ after setting $a = \frac{p}{q}$ and $x = \frac{s}{t}$; the intended numerator appears to be $ps$, but the source is retained.]{style="display: inline-block"}

**(c)** Define $\varphi:S_{o}dd\rightarrow{\mathbb{Z}}_{2}$ by mapping all elements in $S_{o}dd$ with even numerator to $\lbrack 0\rbrack_{2}$, and all elements in $S_{o}dd$ with odd numerator to $\lbrack 1\rbrack_{2}$:

$$
\frac{p}{q}\mapsto\lbrack p\rbrack_{2}.
$$

\(1\) $\varphi(0) = \lbrack 0\rbrack_{2}$.

\(2\) $\varphi(1) = \varphi\left( \frac{1}{1} \right) = \lbrack 1\rbrack_{2}$.

\(3\) Let $a,b \in S_{o}dd$ be arbitrary. Let $a = \frac{p}{q}$, $b = \frac{m}{n}$ for $p,q,m,n \in {\mathbb{Z}}$, with $q,n$ odd and nonzero. Then

$$
\varphi(a)\varphi(b) = \lbrack p\rbrack_{2}\lbrack m\rbrack_{2} = \left\lbrack {pm} \right\rbrack_{2} = \varphi\left( {ab} \right),
$$
$$
\varphi(a) + \varphi(b) = \lbrack p\rbrack_{2} + \lbrack m\rbrack_{2} = \left\lbrack {p + m} \right\rbrack_{2} = \varphi\left( {a + b} \right).
$$

Therefore by (1), (2), (3), $\varphi$ is a homomorphism, and

$\ker(\varphi)$ is the set of elements $a \in S_{\text{odd}}$ with $\varphi(a) = \lbrack 0\rbrack_{2}$; equivalently, it is the set of fractions $\frac{p}{q} \in S_{\text{odd}}$ whose numerator $p$ is even. Thus $\ker(\varphi) = I$.

## 3. Congruence classes of polynomials

Let $F$ be a field and let $f \in F\lbrack x\rbrack$. Two polynomials $g,h \in F\lbrack x\rbrack$ are congruent modulo $f$ if $f \mid \left( {g - h} \right)$. We write $g \equiv h\operatorname{mod}f$. The set of all polynomials congruent to $g$ modulo $f$ is written $\lbrack g\rbrack_{f}$. For this problem, fix a polynomial $f \in F\lbrack x\rbrack$ of degree $d > 0$.

\(a\) Prove that every congruence class $\lbrack g\rbrack_{f}$ contains a unique polynomial in $S = \{ h(x) \in F\lbrack x\rbrack:h(x) = 0$ or $\deg h(x) < d\}$.

\(b\) How many distinct congruence classes are there for ${\mathbb{Z}}_{2}\lbrack x\rbrack$ modulo $x^{3} + x$?

\(c\) How many distinct congruence classes are there for ${\mathbb{Z}}_{3}\lbrack x\rbrack$ modulo $x^{2} + x$?

**(a)** Let $\lbrack g\rbrack_{f}$ be an arbitrary congruence class modulo $f$. Let $k(x)$ be an element in it and fix it. Guaranteed by the division algorithm, there exist some $q(x),r(x) \in F\lbrack x\rbrack$ such that

$$
k(x) = q(x)f(x) + r(x),
$$

where $\deg\left( {r(x)} \right) = 0$ or $\deg\left( {r(x)} \right) < \deg\left( {f(x)} \right) = d$. So $k(x) - r(x) = q(x)f(x)$, hence $f(x) \mid \left( {k(x) - r(x)} \right)$ and $r(x) \in \lbrack g\rbrack_{f}$. So we have proved the existence of such polynomial in $S$.

Now show uniqueness. Fix $r(x)$. Let $h(x)$ be an arbitrary element in $\lbrack g\rbrack_{f}$, so $r(x) \equiv h(x)\operatorname{mod}f$. Then

$$
h(x) = r(x) + m(x)f(x)
$$

for some $m(x) \in F\lbrack x\rbrack$. If $m(x) = 0$, then $h(x) = r(x)$; they are the same element. If $m(x) \neq 0$, then $\deg h(x) \geq \deg f(x)$. Therefore the $r(x) \in S$ is unique.

**(b), (c)** By (a), every congruence class $\lbrack g\rbrack_{f}$ contains a unique polynomial in $\left. S = \{ h(x)\  \middle| \deg h(x) = 0 \right.$ or $\deg h(x) < \deg f(x)\}$, and every element of this set is a unique congruence class modulo $f$. So we only need the number of polynomials that have smaller degree than $f(x)$.

For $x^{3} + x$ in ${\mathbb{Z}}_{2}\lbrack x\rbrack$, $2^{3} = 8$ (degrees $0,1,2$). For $x^{2} + x$ in ${\mathbb{Z}}_{3}\lbrack x\rbrack$, $3^{2} = 9$ (degrees $0,1$).

## 4. Subrings of $\mathbb{Q}$

What are the subrings of $\mathbb{Q}$? We have $\mathbb{Z}$, $\mathbb{Q}$, and, according to the previous problem, the subring $S$ of rational numbers with odd denominators.

\(a\) Prove that ${\mathbb{Z}}\left\lbrack \frac{1}{2} \right\rbrack$ - the set of fractions $\frac{a}{2^{m}}$ with $a,m \in {\mathbb{Z}}$ and $m \geq 0$ - is a subring of $\mathbb{Q}$.

\(b\) Let $R \subset {\mathbb{Q}}$ be a subring. Define

Define $\Pi(R)$ to be the set of positive primes $p$ such that $\frac{1}{p} \in R$.

(the set of positive primes). Compute $\Pi({\mathbb{Z}})$, $\Pi({\mathbb{Q}})$, $\Pi\left( {{\mathbb{Z}}\left\lbrack \frac{1}{2} \right\rbrack} \right)$, $\Pi\left( {S_{o}dd} \right)$ (no proof needed).

\(c\) (Tricky!) Given a set of the positive prime numbers $\Gamma \subset P$, define a subring denoted ${\mathbb{Z}}\left\lbrack \frac{1}{\Gamma} \right\rbrack$ such that $\Pi\left( {{\mathbb{Z}}\left\lbrack \frac{1}{\Gamma} \right\rbrack} \right) = \Gamma$.

\(d\) (This is also hard!) Prove that two subrings $R_{1},R_{2} \subset {\mathbb{Q}}$ are equal iff $\Pi\left( R_{1} \right) = \Pi\left( R_{2} \right)$. Conclude that the subrings of $\mathbb{Q}$ are in bijection with the subsets of the positive prime numbers!

**(a)** (1) $1_{\mathbb{Q}} = \frac{1}{2^{0}} \in {\mathbb{Z}}\left\lbrack \frac{1}{2} \right\rbrack$ and $0_{\mathbb{Q}} = \frac{0}{2^{0}} \in {\mathbb{Z}}\left\lbrack \frac{1}{2} \right\rbrack$.

\(2\) Let $x,y$ be arbitrary elements in ${\mathbb{Z}}\left\lbrack \frac{1}{2} \right\rbrack$. Then $x = \frac{a_{1}}{2^{m_{1}}}$, $y = \frac{a_{2}}{2^{m_{2}}}$ for some $a_{1},a_{2},m_{1},m_{2} \in {\mathbb{Z}}$ with $m_{1},m_{2} \geq 0$. Thus

$$
x + y = \frac{a_{1}2^{m_{2}} + a_{2}2^{m_{1}}}{2^{m_{1} + m_{2}}} \in {\mathbb{Z}}\left\lbrack \frac{1}{2} \right\rbrack,
$$
$$
xy = \frac{a_{1}a_{2}}{2^{m_{1} + m_{2}}} \in {\mathbb{Z}}\left\lbrack \frac{1}{2} \right\rbrack.
$$

\(3\) Let $z \in {\mathbb{Z}}\left\lbrack \frac{1}{2} \right\rbrack$. Then $z = \frac{a}{2^{m}}$ for some $m,a \in {\mathbb{Z}}$ with $m \geq 0$. Then $- z = - \frac{a}{2^{m}} \in {\mathbb{Z}}\left\lbrack \frac{1}{2} \right\rbrack$. Since (1), (2), (3), ${\mathbb{Z}}\left\lbrack \frac{1}{2} \right\rbrack$ is a subring of $\mathbb{Q}$ by theorem 3.2.

**(b)**

For $\mathbb{Z}$, $\Pi({\mathbb{Z}}) = \varnothing$.

For $\mathbb{Q}$, $\Pi({\mathbb{Q}})$ is the set of all positive primes.

For ${\mathbb{Z}}\left\lbrack \frac{1}{2} \right\rbrack$, $\Pi\left( {{\mathbb{Z}}\left\lbrack \frac{1}{2} \right\rbrack} \right) = \left\{ 2 \right\}$, because $\frac{1}{p} = \frac{a}{2^{m}}$ for some $a,m \in {\mathbb{Z}},m \geq 0$ only for $p = 2$,

since all other primes are not multiples of $2$.

For $S_{\text{odd}}$, $\Pi\left( S_{\text{odd}} \right)$ is the set of all positive primes except $2$,

since every prime is odd except $2$.

**(c)** We want to define ${\mathbb{Z}}\left\lbrack \frac{1}{\Gamma} \right\rbrack$ such that

the positive primes $p$ satisfying $\frac{1}{p} \in {\mathbb{Z}}\left\lbrack \frac{1}{\Gamma} \right\rbrack$ are exactly the elements of $\Gamma$.

We can define

$$
{\mathbb{Z}}\left\lbrack \frac{1}{\Gamma} \right\rbrack = \left\{ \frac{a}{p_{1}p_{2}\ldots p_{s}}\  \middle| \ a,s \in {\mathbb{Z}},p_{1},p_{2},\ldots,p_{s} \in \Gamma \right\}.
$$

The source then checks (1) $\Pi\left( {{\mathbb{Z}}\left\lbrack \frac{1}{\Gamma} \right\rbrack} \right) = \Gamma$ and (2) ${\mathbb{Z}}\left\lbrack \frac{1}{\Gamma} \right\rbrack$ is a subring of $\mathbb{Q}$:

For $p \in \Gamma$, take $a = 1$ and $p = p$ in the denominator, so $p \in \Pi\left( {{\mathbb{Z}}\left\lbrack \frac{1}{\Gamma} \right\rbrack} \right)$. Conversely, for $q \in \Pi\left( {{\mathbb{Z}}\left\lbrack \frac{1}{\Gamma} \right\rbrack} \right)$, $\frac{1}{q} = \frac{a}{p_{1}p_{2}\ldots p_{s}}$ for some $a \in {\mathbb{Z}}$ and $p_{i} \in \Gamma$. By FTA, $a = q_{1}q_{2}\ldots q_{t}$ for primes $q_{i}$ and $aq = p_{1}\ldots p_{s}$. Since $q$ is prime, $q$ is one of the primes among $p_{1},\ldots,p_{s}$. So $q \in \Gamma$.

Also $1 = \frac{1}{1}$ and $0 = \frac{0}{1}$ lie in ${\mathbb{Z}}\left\lbrack \frac{1}{\Gamma} \right\rbrack$. If $x = \frac{a}{p_{1}\ldots p_{s}}$ and $y = \frac{b}{q_{1}\ldots q_{t}}$, then

$$
x + y = \frac{a\left( {q_{1}\ldots q_{t}} \right) + b\left( {p_{1}\ldots p_{s}} \right)}{p_{1}\ldots p_{s}q_{1}\ldots q_{t}} \in {\mathbb{Z}}\left\lbrack \frac{1}{\Gamma} \right\rbrack,
$$
$$
xy = a\frac{b}{p_{1}\ldots p_{s}q_{1}\ldots q_{t}} \in {\mathbb{Z}}\left\lbrack \frac{1}{\Gamma} \right\rbrack,\quad - x = - \frac{a}{p_{1}\ldots p_{s}} \in {\mathbb{Z}}\left\lbrack \frac{1}{\Gamma} \right\rbrack.
$$

So ${\mathbb{Z}}\left\lbrack \frac{1}{\Gamma} \right\rbrack$ is a subring of $\mathbb{Q}$.

**(d)** Let $R_{1},R_{2} \subset {\mathbb{Q}}$ be subrings. Let

Here $\Pi\left( R_{1} \right)$ and $\Pi\left( R_{2} \right)$ are respectively the positive primes whose reciprocals lie in $R_{1}$ and $R_{2}$.

[**Source note (PDF pp. 16-17).** The final argument writes $p = \frac{n}{d}$ "for some $m,n \in {\mathbb{Z}}$" and applies FTA as $d = p_{1}\ldots p_{s}$ without exponent notation; these visible shorthand forms are retained.]{style="display: inline-block"}

First, if $R_{1} = R_{2}$, then clearly $\Pi\left( R_{2} \right) = \Pi\left( R_{1} \right)$. To finish the iff proof, assume $\Pi\left( R_{2} \right) = \Pi\left( R_{1} \right)$. Let $p$ be an arbitrary element of $R_{1}$. Since $R_{1} \subset {\mathbb{Q}}$, $p = \frac{n}{d}$ for some $m,n \in {\mathbb{Z}}$ where $d \neq 0$ and $\gcd\left( {n,d} \right) = 1$. Since $1 \in R_{1}$, by definition of subring $1 + 1 + \ldots + 1 \in R_{1}$, so recursively ${\mathbb{Z}} \subset R_{1}$.

Since $\gcd\left( {n,d} \right) = 1$, by Bézout there are $x,y \in {\mathbb{Z}}$ such that $xn + yd = 1$. Thus

$$
x\frac{n}{d} + y = \frac{1}{d}.
$$

Since $\frac{n}{d} \in R_{1}$ and $x,y \in {\mathbb{Z}} \subset R_{1}$, $\frac{1}{d} \in R_{1}$. By FTA, $d = p_{1}p_{2}\ldots p_{s}$ for some primes $p_{i}$, so $\frac{1}{d} = \frac{1}{p_{1}p_{2}\ldots p_{s}} \in R_{1}$. Since the $p_{i}$ are in $R_{1}$ by property of $\Pi$, their reciprocals lie in both rings; therefore $\frac{1}{d} \in R_{2}$. Since ${\mathbb{Z}} \subset R_{2}$, $\frac{n}{d} \in R_{2}$. So $R_{1} \subseteq R_{2}$. Similarly, we get $R_{2} \subseteq R_{1}$ by exactly the same steps. So $R_{1} = R_{2}$.

Therefore $\Pi\left( R_{1} \right) = \Pi\left( R_{2} \right)$ iff $R_{1} = R_{2}$, and the subrings of $\mathbb{Q}$ are in bijection with the subsets of the positive prime numbers.

