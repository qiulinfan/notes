---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: MATH 412
date: 2026
description: Modern Algebra notes migrated from the explicitly selected personal historical sources.
keywords:
- Modern Algebra
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/modern-algebra/homeworks/hw10-final-topics.typ"
subtitle: Typst-first mathematics notes
title: Modern Algebra
---
# Homework 10

## 1. Products of normal subgroups

Let $G$ be a group and let $N$ and $K$ be normal subgroups of $G$.

\(a\) Show that $N \cap K \lhd K$.

\(b\) Prove that $NK = \left\{ ,nk\  \middle| \ n \in N\text{,}k \in K, \right\}$ is a normal subgroup of $G$.

\(c\) Prove that $N \lhd NK$.

\(d\) Prove that the function $f:K\rightarrow N\frac{K}{N}$ given by $f(k) = Nk$ is a surjective homomorphism with kernel $K \cap N$.

\(e\) Prove that $\frac{K}{N \cap K} \approx N\frac{K}{N}$.

### (a)

**Proof.** Take arbitrary $g \in K$ and $h \in N \cap K$. Since $N \lhd G$, $ghg^{- 1} \in N$, and since $g \in K$ and $K \lhd G$, $ghg^{- 1} \in K$. Hence $ghg^{- 1} \in N \cap K$. Therefore for every $g \in K$,

$$
g\left( {N \cap K} \right)g^{- 1} \subset N \cap K.
$$

By Theorem 8.11, $N \cap K \lhd K$.

### (b)

Take arbitrary $g \in G$ and $h \in NK$. Then $h = nk$ for some $n \in N$ and $k \in K$. Thus

$$
ghg^{- 1} = gnkg^{- 1} = \left( {gng^{- 1}} \right)\left( {gkg^{- 1}} \right).
$$

Since $K,N$ are normal, $gN = Ng$ and $gK = Kg$, so $gn = n'g$ for some $n' \in N$ and $kg^{- 1} = g^{- 1}k'$ for some $k' \in K$. Consequently

$$
ghg^{- 1} = \left( {gn} \right)\left( {kg^{- 1}} \right) = n'\left( {gg^{- 1}} \right)k' = n'k' \in NK.
$$

Therefore for every $g \in G$, $gNKg^{- 1} \subset NK$. Hence $NK \lhd G$.

### (c)

Take arbitrary $n \in N$ and $h \in NK$. Then $h = n_{2}k$ for some $n_{2} \in N$ and $k \in K$. Hence

$$
hnh^{- 1} = n_{2}k{n\left( {n_{2}k} \right)}^{- 1} = n_{2}knk^{- 1}n_{2}^{- 1}.
$$

Since $N \lhd G$, $kN = Nk$, so $kn = n'k$ for some $n' \in N$ and $n_{2}n' = n^{''}n_{2}$ for some $n^{''} \in N$. Therefore

$$
hnh^{- 1} = n^{''}\left( {n_{2}kk^{- 1}n_{2}^{- 1}} \right) = n^{''} \in N.
$$

So for every $h \in NK$, $hNh^{- 1} \subset N$. Therefore $N \lhd NK$.

### (d)

Since $N \lhd NK$, $N\frac{K}{N}$ is a well-defined quotient group. For $f:K\rightarrow N\frac{K}{N}$ given by $k\mapsto Nk$, let $h$ be an arbitrary element of $N\frac{K}{N}$. Then $h = N\left( {nk} \right)$ for some $nk \in NK$, where $n \in N$ and $k \in K$. By definition,

$$
N\left( {nk} \right) = \left\{ ,n^{\ast}nk\  \middle| \ n^{\ast} \in N, \right\} = \left\{ ,\left( {n^{\ast}n} \right)k\  \middle| \ n^{\ast} \in N, \right\} = \left\{ ,n^{\ast}k\  \middle| \ n^{\ast} \in N, \right\} = Nk.
$$

Thus $f(k) = Nk = N\left( {nk} \right) = h$, so $f$ is surjective.

Since the identity of $N\frac{K}{N}$ is $N$,

$$
f(k) = Nk = N\Leftrightarrow k \in N.
$$

As $k \in K$ for sure, $\ker(f) = N \cap K$.

### (e)

By the First Isomorphism Theorem,

$$
\frac{K}{\ker(f)} \approx N\frac{K}{N},
$$

and since $\ker(f) = N \cap K$,

$$
\frac{K}{N \cap K} \approx N\frac{K}{N}.
$$

## 2. Quotients of familiar groups

In the following problem, it may help to use the First Isomorphism Theorem.

\(a\) Prove that $\frac{\mathbb{C}}{\mathbb{Z}} \approx {\mathbb{C}}^{\times}$ (hint: consider the function $e^{2\pi iz}$).

\(b\) Prove that $\frac{\mathbb{R}}{\mathbb{Z}} \approx S^{1}$.

\(c\) Prove that the subset

$$
N = \left\{ {,e\text{,}\left( {1,2} \right)\left( {3,4} \right)\text{,}\left( {1,3} \right)\left( {2,4} \right)\text{,}\left( {1,4} \right)\left( {2,3} \right),} \right\} \subset A_{4}
$$

is a normal subgroup. What familiar group is $\frac{A_{4}}{N}$ isomorphic to?

### (a)

**Proof.** Consider the function $f:{\mathbb{C}}\rightarrow{\mathbb{C}}^{\times}$ sending $z$ to $e^{2\pi iz}$.

1.  $f$ is a group homomorphism. For $z_{1},z_{2} \in {\mathbb{C}}$,

$$
f\left( {z_{1} + z_{2}} \right) = e^{2\pi i{({z_{1} + z_{2}})}} = e^{2\pi iz_{1}}e^{2\pi iz_{2}} = f\left( z_{1} \right)f\left( z_{2} \right).
$$

1.  $f$ is surjective. Since every $z' \in {\mathbb{C}}^{\times}$ is a nonzero complex number, $z' = ke^{2\pi ir}$ for some $r \in {\mathbb{R}}$ and $k \in {\mathbb{R}}^{+}$ by Euler's formula. Let $z = r - i\ln k$. Then

$$
f(z) = e^{2\pi i{({r - i\ln k})}} = z'.
$$

1.  Note that $f(z) = e_{{\mathbb{C}}^{\times}}$ if and only if $z \in {\mathbb{Z}}$, so $\ker(f) = {\mathbb{Z}}$.

By the First Isomorphism Theorem,

$$
\frac{\mathbb{C}}{\mathbb{Z}} \approx {\mathbb{C}}^{\times}.
$$

### (b)

Still consider the map $f:{\mathbb{R}}\rightarrow S^{1}$ sending

$$
r\mapsto e^{2\pi ir}.
$$

1.  $f$ is a group homomorphism. For $r_{1},r_{2} \in {\mathbb{R}}$,

$$
f\left( {r_{1} + r_{2}} \right) = e^{2\pi i{({r_{1} + r_{2}})}} = e^{2\pi ir_{1}}e^{2\pi ir_{2}} = f\left( r_{1} \right)f\left( r_{2} \right).
$$

1.  $f$ is surjective, since for every $s \in S^{1}$, $s = e^{2\pi ir}$ for some $r \in {\mathbb{R}}$.

2.  $f(r) = e_{S^{1}} = 1$ if and only if $r \in {\mathbb{Z}}$, because for $r \in {\mathbb{Z}}$,

$$
e^{2\pi ir} = \cos\left( {2\pi r} \right) + i\sin\left( {2\pi r} \right) = \cos\left( {2\pi r} \right) = 1.
$$

So $\ker(f) = {\mathbb{Z}}$. By the First Isomorphism Theorem,

$$
\frac{\mathbb{R}}{\mathbb{Z}} \approx S^{1}.
$$

### (c)

First, the subset $N$ is a subgroup of $A_{4}$: $e \in N$, and

$$
e^{2} = e,\quad\left( {\left( {1,2} \right)\left( {3,4} \right)} \right)^{2} = e,\quad\left( {\left( {1,3} \right)\left( {2,4} \right)} \right)^{2} = e,\quad\left( {\left( {1,4} \right)\left( {2,3} \right)} \right)^{2} = e,
$$

so $A_{4}$ is closed under inverse as written in the source.

Then we show $N \lhd A_{4}$. Let $\sigma \in A_{4}$ be an arbitrary permutation and $t \in N$ an arbitrary element. Write

$$
t = \left( {\sigma(a),\sigma(b)} \right)\left( {\sigma(c),\sigma(d)} \right)
$$

for $a,b,c,d$ respectively representing a unique number in $\left\{ {,1\text{,}2\text{,}3\text{,}4,} \right\}$. Then

$$
\sigma^{- 1}t\sigma = \begin{pmatrix}
a & b & c & d \\
{\sigma(a)} & {\sigma(b)} & {\sigma(c)} & {\sigma(d)}
\end{pmatrix}\begin{pmatrix}
{\sigma(b)} & {\sigma(a)} & {\sigma(d)} & {\sigma(c)} \\
b & a & d & c
\end{pmatrix} = \begin{pmatrix}
a & b & c & d \\
b & a & d & c
\end{pmatrix}.
$$

Thus $\sigma^{- 1}t\sigma = \left( {a,b} \right)\left( {c,d} \right) \in N$. Therefore for every $\sigma \in A_{4}$, $\sigma N\sigma^{- 1} \subset N$. By Theorem 8.11, $N \lhd A_{4}$.

By Lagrange's Theorem,

$$
\left| \frac{A_{4}}{N} \right| = \frac{\left| A_{4} \right|}{|N|} = \frac{12}{4} = 3.
$$

So $\frac{A_{4}}{N} \approx {\mathbb{Z}}_{3}$, since every finite group of order $3$ is isomorphic to ${\mathbb{Z}}_{3}$.

## 3. Groups of order $p^{2}$

Let $p$ be a prime number. The goal of this problem is to prove that any group $G$ of order $p^{2}$ is abelian.

\(a\) Let $G$ act on itself by the conjugacy action defined in the previous problem set. Prove that $h \in Z(G)$ if and only if the orbit (the conjugacy class) of $h$ has exactly one element.

\(b\) Use the Class Equation to deduce that $p$ divides $\left| {Z(G)} \right|$. Thus there are two possibilities: $\left| {Z(G)} \right| = p$ or $|G|$; in the latter case $G$ is abelian.

\(c\) Suppose that $\left| {Z(G)} \right| = p$ and let $g \in G$ with $g! \in Z(G)$. Define $\left\langle {Z(G)\text{,}g} \right\rangle$ to be the group generated by $g$ and every element of $Z(G)$. Show that $\left\langle {Z(G)\text{,}g} \right\rangle$ is abelian.

\(d\) Under the same assumptions, show that $\left\langle {Z(G)\text{,}g} \right\rangle = G$.

\(e\) Deduce in one line that $G$ is abelian.

\(f\) Give an example of a group with $p^{3}$ elements that is not abelian.

\(g\) Use the Class Equation to conclude that any $p$-group $H$ satisfies $\left. p\  \middle| \ \left| {Z(H)} \right| \right.$.

### (a)

**Proof.**

$$
O(h) = \left\{ ,g^{- 1}hg\  \middle| \ g \in G, \right\}.
$$

Assume $h \in Z(G)$. Then for every $g \in G$, $gh = hg$, hence

$$
O(h) = \left\{ ,ghg^{- 1}\  \middle| \ g \in G, \right\} = \left\{ {,h,} \right\}.
$$

Thus $\left| {O(h)} \right| = 1$. Conversely, assume $\left| {O(h)} \right| = 1$. Then for every $g \in G$, $g^{- 1}hg = h$, since $h \in O(h)$, giving $hg = gh$. Hence $h \in Z(G)$. Therefore $\left| {O(h)} \right| = 1$ if and only if $h \in Z(G)$.

### (b)

Let $g_{1},\ldots,g_{n}$ be representatives of the distinct conjugacy classes of $G$ not contained in $Z(G)$. The Class Equation is

$$
|G| = \left| {Z(G)} \right| + \sum\limits_{i = 1}^{n}\text{the orbit size of}\ g_{i}.
$$

Since $p$ is prime and $|G| = p^{2}$, every subgroup of $G$ can only have size $1,p,$ or $p^{2}$. For each $i$, $C_{G{(g_{i})}}$ is a subgroup of $G$ with more than one element, so $\left| C_{G{(g_{i})}} \right| = p$ or $p^{2}$. Hence

$$
\left. p\  \middle| \sum\limits_{i = 1}^{n}\text{the orbit size of}\ g_{i}, \right.
$$

and $\left. p\  \middle| \ \left| {Z(G)} \right| \right.$. Thus either $\left| {Z(G)} \right| = p$ or $\left| {Z(G)} \right| = p^{2} = |G|$.

### (c)

Let

$$
z_{1}^{n_{1}}z_{2}^{n_{2}}\cdots g^{n_{j}} \in \left\langle {Z(G)\text{,}g} \right\rangle,
$$

and let

$$
g_{1}^{m_{1}}g_{2}^{m_{2}}\cdots g_{i}^{m_{i}}g^{m}
$$

be two arbitrary elements. Then

$$
\begin{matrix}
 & {\left( {z_{1}^{n_{1}}z_{2}^{n_{2}}\cdots g^{n_{j}}} \right)\left( {g_{1}^{m_{1}}g_{2}^{m_{2}}\cdots g_{i}^{m_{i}}g^{m}} \right)} \\
 & {= \left( {g_{1}^{m_{1}}z_{1}^{n_{1}}z_{2}^{n_{2}}\cdots g^{n_{j}}} \right)\left( {g_{2}^{m_{2}}\cdots g_{i}^{m_{i}}g^{m}} \right)} \\
 & {\quad = \ldots} \\
 & {= \left( {g_{1}^{m_{1}}g_{2}^{m_{2}}\cdots g_{i}^{m_{i}}g^{m}} \right)\left( {z_{1}^{n_{1}}z_{2}^{n_{2}}\cdots g^{n_{j}}} \right).}
\end{matrix}
$$

Since every element of $Z(G)$ commutes with each other and $g$, $\left\langle {Z(G)\text{,}g} \right\rangle$ is abelian.

### (d)

Every subgroup of $G$ can only have order $1,p,$ or $p^{2}$. Since

$$
\left| \left\langle {Z(G)\text{,}g} \right\rangle \right| \geq \left| {Z(G)} \right| + 1 = p + 1,
$$

we have $\left| \left\langle {Z(G)\text{,}g} \right\rangle \right| = p^{2} = |G|$. So $\left\langle {Z(G)\text{,}g} \right\rangle = G$.

### (e)

Since $\left\langle {Z(G)\text{,}g} \right\rangle = G$ by (d) and $\left\langle {Z(G)\text{,}g} \right\rangle$ is abelian by (c), $G$ is abelian.

### (f)

$\left| D_{4} \right| = 8 = 2^{3}$, but $D_{4}$ is not abelian.

### (g)

Let $H$ be a $p$-group, so $|H| = p^{k}$ for some prime $p$ and $k \in {\mathbb{Z}}^{+}$. By the Class Equation,

$$
|H| = \left| {Z(H)} \right| + \sum\limits_{i = 1}^{n}\text{the orbit size of}\ g_{i}.
$$

Every subgroup of $H$ can only have size $1,p,p^{2},\ldots,p^{k}$. For each $i$, $C_{H{(g_{i})}}$ is a subgroup of $H$ with more than one element, so $\left| {O\left( g_{i} \right)} \right| = p,p^{2},\ldots,p^{k}$. Thus

$$
\left. p\  \middle| \sum\limits_{i = 1}^{n}\text{the orbit size of}\ g_{i}, \right.
$$

and hence $\left. p\  \middle| \ \left| {Z(H)} \right| \right.$.

## 4. Finite abelian groups

**Theorem 9.7: Fundamental Structure Theorem for Finite Abelian Groups.** Let $G$ be a finite abelian group. Then $G$ is isomorphic to a group of the form

$$
{\mathbb{Z}}_{p_{1}^{a_{1}}} \times {\mathbb{Z}}_{p_{2}^{a_{2}}} \times {\mathbb{Z}}_{p_{3}^{a_{3}}} \times \ldots \times {\mathbb{Z}}_{p_{n}^{a_{n}}},
$$

where $p_{1},p_{2},\ldots,p_{n}$ are (not necessarily distinct) prime numbers. Moreover, the product is unique, up to re-ordering the factors.

\(a\) Suppose $G$ is abelian and has order $8$. Use the Structure Theorem to show that, up to isomorphism, $G$ must be isomorphic to one of three possible groups, each a product of cyclic groups of prime-power order.

\(b\) Determine the number of abelian groups of order $18$, up to isomorphism.

\(c\) For $p$ prime, how many isomorphism types of abelian groups of order $p^{4}$?

\(d\) If an abelian group of order $100$ has no element of order $4$, prove that $G$ contains a Klein 4-group.

### (a)

Since the prime factorization of $8 = 2^{3}$ and $G$ is abelian with $|G| = 8$, the Structure Theorem gives

$$
G \approx {\mathbb{Z}}_{2} \times {\mathbb{Z}}_{2} \times {\mathbb{Z}}_{2},\quad\text{or}\ G \approx {\mathbb{Z}}_{2^{2}} \times {\mathbb{Z}}_{2},\quad\text{or}\ G \approx {\mathbb{Z}}_{2^{3}}.
$$

### (b)

$18 = 3^{2} \times 2$. The possible isomorphism types are

$$
{\mathbb{Z}}_{9} \times {\mathbb{Z}}_{2},\quad{\mathbb{Z}}_{3} \times {\mathbb{Z}}_{3} \times {\mathbb{Z}}_{2}.
$$

There are two possible isomorphism types.

### (c)

There are five isomorphism types:

$$
\begin{matrix}
{p \times p \times p \times p} & {:{\mathbb{Z}}_{p} \times {\mathbb{Z}}_{p} \times {\mathbb{Z}}_{p} \times {\mathbb{Z}}_{p}} \\
{\left( {p \times p \times p} \right) \times p} & {:{\mathbb{Z}}_{p^{2}} \times {\mathbb{Z}}_{p} \times {\mathbb{Z}}_{p}} \\
{\left( {p \times p^{2}} \right) \times p} & {:{\mathbb{Z}}_{p^{3}} \times {\mathbb{Z}}_{p}} \\
\left( {p \times p \times p \times p} \right) & {:{\mathbb{Z}}_{p^{4}}} \\
{\left( {p \times p} \right) \times \left( {p \times p} \right)} & {:{\mathbb{Z}}_{p^{2}} \times {\mathbb{Z}}_{p^{2}}.}
\end{matrix}
$$

### (d)

The prime factorization of $100$ is $100 = 2^{2} \times 5^{2}$. Since $G$ is abelian and $|G| = 100$,

$$
G \approx {\mathbb{Z}}_{2} \times {\mathbb{Z}}_{5^{2}},\quad\text{or}\ {\mathbb{Z}}_{2} \times {\mathbb{Z}}_{2} \times {\mathbb{Z}}_{5^{2}},\quad\text{or}\ {\mathbb{Z}}_{2} \times {\mathbb{Z}}_{2} \times {\mathbb{Z}}_{5} \times {\mathbb{Z}}_{5}.
$$

The first is impossible since $\left( {1_{4},0_{25}} \right)$ is an order-$4$ element in it. Therefore

$$
G \approx {\mathbb{Z}}_{2} \times {\mathbb{Z}}_{2} \times {\mathbb{Z}}_{5}\quad\text{or}\ G \approx {\mathbb{Z}}_{2} \times {\mathbb{Z}}_{2} \times {\mathbb{Z}}_{5} \times {\mathbb{Z}}_{5}.
$$

For the first, ${\mathbb{Z}}_{2} \times {\mathbb{Z}}_{2} \times 0_{25}$ is a subgroup which is a Klein 4-group. For the second, ${\mathbb{Z}}_{2} \times {\mathbb{Z}}_{2} \times 0_{5} \times 0_{5}$ is a subgroup which is a Klein 4-group.

## Source notes

The handwritten argument in Problem 2(c) labels closure under inverse immediately after listing the elements of $N$; this was retained. In Problem 4(d), the source's product notation mixes ${\mathbb{Q}}_{5}$ and ${\mathbb{Q}}_{5}^{2}$ factors; the typeset form preserves the listed group decompositions and the stated Klein-four subgroups.
