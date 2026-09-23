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
source: "notes/math/modern-algebra/homeworks/hw09-quotient-rings.typ"
subtitle: Typst-first mathematics notes
title: Modern Algebra
---
# Homework 9

## 1. Prime-order groups

\(a\) Prove Fermat's Little Theorem: if $p$ is prime and $\left. p! \middle| \ a \right.$, then $a^{p - 1} \equiv 1\ \text{mod}\ p$.

\(b\) If $G$ is a group of prime order $p$, then $G$ is cyclic.

\(c\) A nontrivial group $G$ has no nontrivial proper subgroups if and only if $G$ is finite and of order $p$ where $p$ is prime.

### (a)

**Claim 1.** If $p$ is prime, then $a^{p} \equiv a\ \text{mod}\ p$.

**Proof.** Take arbitrary prime $p$. We prove it by induction on $a$.

**Basic step.** $1^{p} = 1$, so $1^{p} \equiv 1\ \text{mod}\ p$.

**Inductive step.** Assume $a^{p} \equiv a\ \text{mod}\ p$. We show that $\left( {a + 1} \right)^{p} \equiv \left( {a + 1} \right)\ \text{mod}\ p$. By the binomial theorem,

$$
\begin{matrix}
\left( {a + 1} \right)^{p} & {= \sum\limits_{k = 0}^{p}\left( \frac{p}{k} \right)a^{k}} \\
 & {= \sum\limits_{k = 0}^{p}\frac{p!}{k!\left( {p - k} \right)!}a^{k}} \\
 & {= \sum\limits_{k = 1}^{p - 1}\frac{p!}{k!\left( {p - k} \right)!}a^{k} + 1 + a^{p}.}
\end{matrix}
$$

For every $1 \leq k \leq p - 1$, $p - k \leq p - 1$ and $p - k \geq 1$, so $p$ divides every term with denominator $k!\left( {p - k} \right)!$: since $p$ is prime, $\left. p! \middle| \ k!\left( {p - k} \right)! \right.$, otherwise $p$ must divide one of the factors in that product, which contradicts the bounds. Therefore

$$
\frac{\left( {p - 1} \right)!}{k!\left( {p - k} \right)!}
$$

is still an integer, and

$$
\left( {a + 1} \right)^{p} = p\left( {\sum\limits_{k = 1}^{p - 1}\frac{\left( {p - 1} \right)!}{k!\left( {p - k} \right)!}a^{k}} \right) + 1 + a^{p}.
$$

Thus $p$ divides $\left( {a + 1} \right)^{p} - \left( {a^{p} + 1} \right)$, and therefore

$$
\left( {a + 1} \right)^{p} \equiv a^{p} + 1 \equiv a + 1\ \text{mod}\ p.
$$

This proves Claim 1.

**Claim 2.** Following Claim 1, if $\left. p! \middle| \ a \right.$, then $a^{p - 1} \equiv 1\ \text{mod}\ p$.

**Proof.** Let $p$ be an arbitrary prime and take arbitrary $a \in {\mathbb{Z}}^{+}$ with $\left. p! \middle| \ a \right.$. By Claim 1,

$$
a^{p} \equiv a\ \text{mod}\ p,
$$

so $\left. p\  \middle| \ a\left( {a^{p - 1} - 1} \right) \right.$. Since $p$ is prime, either $\left. p\  \middle| \ a \right.$ or $\left. p\  \middle| \ a^{p - 1} - 1 \right.$. Since $\left. p! \middle| \ a \right.$, we get

$$
a^{p - 1} \equiv 1\ \text{mod}\ p.
$$

Combining Claims 1 and 2 proves Fermat's Little Theorem.

### (b)

**Proof.** Assume $|G|$ is prime, so $|G| \geq 2$ and there is a non-identity element in $G$. Select arbitrary non-identity $a \in G$. Then $\left| \left\langle a \right\rangle \right| \geq 2$, since $a \land a^{2} \in \left\langle a \right\rangle$ (with $a \neq e$, otherwise $aa^{- 1} = a^{- 1}a$ would give $a = e$). By Lagrange's Theorem,

$$
|G| = \left| \left\langle a \right\rangle \right| \cdot \text{index of}\ \left\langle a \right\rangle\ \text{in}\ G.
$$

Since $|G|$ is prime and $\left| \left\langle a \right\rangle \right| \geq 2$, we have $\left| \left\langle a \right\rangle \right| = |G|$, which means $\left\langle a \right\rangle = G$. Hence $G$ is cyclic.

### (c)

First we prove the backward direction. Assume $|G|$ is finite and prime. Then for every subgroup $K \leq G$, Lagrange's Theorem gives $\left. |K|\  \middle| \ |G| \right.$. Since $|G|$ is prime, $|K| = 1$ or $|G|$, so $K$ is either trivial or $G$ itself. Therefore $G$ has no nontrivial subgroups.

For the forward direction, assume $G$ has no nontrivial proper subgroup. Case 1: $G$ has finite composite order. Then $|G| = mn$ for some prime $m$ and $n \geq 2$. By Theorem 8.6, for every $x \in G$, $x^{|G|} = e$. Pick $x \neq e$. If $x^{m} = e$, then $\left\langle x \right\rangle$ has order at most $m < |G|$ and is nontrivial, a contradiction. If $x^{m} \neq e$, then $\left\langle x^{m} \right\rangle$ has order at most $n < |G|$ and is nontrivial, another contradiction.

Case 2: $G$ has infinite order. Select arbitrary non-identity $g \in G$ and consider $\left\langle g \right\rangle$. If $g \in \left\langle g^{2} \right\rangle$, then $g = \left( g^{2} \right)^{n} = g^{2n}$ for some integer $n$, so $g^{2n - 1} = e$ and $\left| \left\langle g \right\rangle \right| \leq 2n - 1$; this is a nontrivial proper subgroup of $G$, a contradiction. If $g! \in \left\langle g^{2} \right\rangle$, then $\left\langle g^{2} \right\rangle$ is itself a nontrivial proper subgroup of $G$, again a contradiction. Thus the group cannot be infinite. It must have prime order.

## 2. Left and right cosets

For each of the following parts, $K$ is a subgroup of the group $G$. Write down every element of every distinct right coset and every distinct left coset.

\(a\) $K = \left\{ {,r_{0}\text{,}r_{90}\text{,}r_{180}\text{,}r_{270},} \right\}$ and $G = D_{4}$, with reflections $s_{v},s_{h},s_{\text{NW}},s_{\text{NE}}$.

\(b\) $K = \left\{ {,e\text{,}\left( {1,2} \right),} \right\}$ and $G = S_{3}$.

\(c\) $K = \left\langle \begin{pmatrix}
0 & 1 \\
1 & 0
\end{pmatrix} \right\rangle$ and $G = \operatorname{GL}_{2}\left( {\mathbb{Z}}_{2} \right)$, whose elements are

$$
\left\{ {,I = \begin{pmatrix}
1 & 0 \\
0 & 1
\end{pmatrix}\text{,}a = \begin{pmatrix}
0 & 1 \\
1 & 0
\end{pmatrix}\text{,}b = \begin{pmatrix}
1 & 1 \\
1 & 0
\end{pmatrix}\text{,}c = \begin{pmatrix}
1 & 1 \\
0 & 1
\end{pmatrix}\text{,}d = \begin{pmatrix}
1 & 0 \\
1 & 1
\end{pmatrix}\text{,}f = \begin{pmatrix}
0 & 1 \\
1 & 1
\end{pmatrix},} \right\}.
$$

\(d\) $K = \left\langle 5 \right\rangle$ and $G = {\mathbb{Z}}_{12}^{\times}$.

### (a)

There are two left/right cosets.

**Left cosets:**

1.  $r_{0}K = r_{90}K = r_{180}K = r_{270}K = K$.

2.  $s_{v}K = \left\{ {,s_{v}\text{,}s_{h}\text{,}s_{\text{NW}}\text{,}s_{\text{NE}},} \right\} = s_{h}K = s_{\text{NW}}K = s_{\text{NE}}K$.

**Right cosets:**

1.  $Kr_{0} = Kr_{90} = Kr_{180} = Kr_{270} = K$.

2.  $Ks_{v} = Ks_{h} = Ks_{\text{NW}} = Ks_{\text{NE}} = \left\{ {,s_{v}\text{,}s_{h}\text{,}s_{\text{NW}}\text{,}s_{\text{NE}},} \right\}$.

### (b)

$$
G = S_{3} = \left\{ {,e\text{,}\left( {1,2} \right)\text{,}\left( {1,3} \right)\text{,}\left( {2,3} \right)\text{,}\left( {1,2,3} \right)\text{,}\left( {1,3,2} \right),} \right\}.
$$

There are three left/right cosets.

**Left cosets:**

1.  $\left( {1,3} \right)K = \left\{ {,\left( {1,3} \right)\text{,}\left( {1,2,3} \right),} \right\}$.
2.  $\left( {2,3} \right)K = \left\{ {,\left( {2,3} \right)\text{,}\left( {1,3,2} \right),} \right\}$.
3.  $K$ itself.

**Right cosets:**

1.  $K\left( {1,3} \right) = \left\{ {,\left( {1,3} \right)\text{,}\left( {1,3,2} \right),} \right\}$.
2.  $K\left( {2,3} \right) = \left\{ {,\left( {2,3} \right)\text{,}\left( {1,2,3} \right),} \right\}$.
3.  $K$ itself.

### (c)

$K = \left\{ {,a\text{,}I,} \right\}$. There are three left/right cosets.

**Left cosets:**

1.  $aK = IK = K = \left\{ {,a\text{,}I,} \right\}$.
2.  $fK = \left\{ {,f\text{,}d,} \right\} = dK$.
3.  $bK = \left\{ {,c\text{,}b,} \right\} = cK$.

**Right cosets:**

1.  $Ka = KI = K = \left\{ {,a\text{,}I,} \right\}$.
2.  $Kf = \left\{ {,c\text{,}f,} \right\} = Kc$.
3.  $Kd = \left\{ {,b\text{,}d,} \right\} = Kb$.

### (d)

$$
G = \left\{ {,1\text{,}5\text{,}7\text{,}11,} \right\},\quad K = \left\langle 5 \right\rangle = \left\{ {,5\text{,}1,} \right\}.
$$

There are two left/right cosets.

**Left cosets:** $K = \left\{ {,5\text{,}1,} \right\}$ and $7K = \left\{ {,11\text{,}7,} \right\}$.

**Right cosets:** $K = \left\{ {,5\text{,}1,} \right\}$ and $K7 = \left\{ {,11\text{,}7,} \right\}$.

## 3. Conjugacy classes

Any group $G$ acts on itself by conjugation: $g \cdot h = ghg^{- 1}$. The orbits of this action are called *conjugacy classes*.

1.  Show $h \in Z(G)$ if and only if $h$ is a fixed point of the conjugation action.
2.  Show a subgroup $H$ of $G$ is normal if and only if it is a disjoint union of conjugacy classes.
3.  Describe the partition of $S_{5}$ into its conjugacy classes.
4.  Show that the only nontrivial normal subgroup of $S_{5}$ is $A_{5}$.

### 1.

**Forward direction.** Assume $h$ is a fixed point of the conjugation action. Then for every $g \in G$, $ghg^{- 1} = h$. Multiply by $g$ on both sides to get $gh = hg$, so $h \in Z(G)$.

**Backward direction.** Assume $h \in Z(G)$. Then for every $g \in G$, $gh = hg$, so $ghg^{- 1} = hgg^{- 1} = h$. Hence $h$ is a fixed point of the conjugation action. Thus $h$ is a fixed point of the conjugation action if and only if $h \in Z(G)$.

### 2.

**Forward direction.** Assume $H$ is a disjoint union of conjugacy classes, i.e.

$$
H = \cup_{j = 1}^{n}\left\{ ,gh_{j}g^{- 1}\  \middle| \ g \in G, \right\}
$$

for some $h_{1},h_{2},\ldots,h_{n} \in G$. Select arbitrary $g \in G$ and fix it. Take arbitrary $x \in H$; then $x \in O\left( h_{i} \right)$ for some $h_{i}$, so $gxg^{- 1} = g \cdot x \in O\left( h_{i} \right) \subset H$. Thus $g^{- 1}xg \in H$ and, for every $g \in G$, $gHg^{- 1} \subset H$. By Theorem 8.11, $H$ is a normal subgroup of $G$.

**Backward direction.** Assume $H$ is normal. Take arbitrary $g \in G$. By Theorem 8.11, $gHg^{- 1} \subset H$, so for every $h \in H$, $ghg^{- 1} \in H$. Since $g$ is arbitrary, $O(h) \subset H$ for every $h \in H$. Therefore $H$ is a union of conjugacy classes. Since orbits are either disjoint or identical, it is a disjoint union of conjugacy classes.

### 3.

The conjugacy classes in $S_{5}$ are:

$$
\begin{matrix}
{O(e)} & {= \left\{ {,e,} \right\}\ } & & {\text{order}\ 1} \\
{O\left( \left( {1,2} \right) \right)} & {= \left\{ {,\text{all 2-cycles},} \right\}\ } & & {\text{order}\ \left( \frac{5}{2} \right) = 10} \\
{O\left( \left( {1,2,3} \right) \right)} & {= \left\{ {,\text{all 3-cycles},} \right\}\ } & & {\text{order}\ \left( \frac{5}{3} \right) \times 2 = 20} \\
{O\left( \left( {1,2,3,4} \right) \right)} & {= \left\{ {,\text{all 4-cycles},} \right\}\ } & & {\text{order}\ \left( \frac{5}{4} \right) \times 3 \neq 30} \\
{O\left( \left( {1,2,3,4,5} \right) \right)} & {= \left\{ {,\text{all 5-cycles},} \right\}\ } & & {\text{order}\ 4 \neq 24} \\
{O\left( {\left( {1,2} \right)\left( {3,4} \right)} \right)} & {= \left\{ {,\text{all two disjoint transpositions},} \right\}\ } & & {\text{order}\ \left( \frac{1}{2} \right)\left( \frac{5}{2} \right)\left( \frac{3}{2} \right) = 15} \\
{O\left( {\left( {1,2} \right)\left( {3,4,5} \right)} \right)} & {= \left\{ {,\text{all 2+3-disjoint cycles},} \right\}\ } & & {\text{order}\ \left( \frac{5}{3} \right) \times 2 = 20.}
\end{matrix}
$$

These union to $S_{5}$, with orders summing to $120$.

### 4.

Let $K$ be a nontrivial normal subgroup of $S_{5}$. First $e \in K$ by the definition of subgroup. By part 2, $K$ is a disjoint union of conjugacy classes, so $\left\{ {,e,} \right\}$ is one of the conjugacy classes that form $K$. By Lagrange's Theorem, $\left. |K|\  \middle| \ \left| S_{5} \right| = 120 \right.$.

Since $K \neq \left\{ {,e,} \right\}$, more conjugacy classes must be in the disjoint union. Since $\left| \left\{ {,e,} \right\} \right| = 1$ and the class of all 5-cycles has order $24$, the all-5-cycles class must be one of the conjugacy classes; otherwise $|K|$ cannot divide $120$. Now $|K| \geq 25$. Thus $|K|$ can only be $30,40,$ or $60$ to divide $120$, and all two-disjoint transpositions of order $15$ must be one of the classes.

There are three possibilities:

1.  $K = \left\{ {,e,} \right\} \cup \left\{ {,\text{all 5-cycles},} \right\} \cup \left\{ {,\text{all two disjoint transpositions},} \right\}$.
2.  The preceding union together with $\left\{ {,\text{all 3-cycles},} \right\}$.
3.  The preceding union together with $\left\{ {,\text{all 2+3-disjoint cycles},} \right\}$.

A normal subgroup must be closed under operation and inverse. For case 1,

$$
\left( {3,4} \right)\left( {1,2} \right)\left( {1,2,3,4,5} \right) = \left( {2,4,5} \right)! \in K,
$$

so it is not a subgroup. For case 3,

$$
\left( {3,4} \right)\left( {1,2,3} \right)\left( {1,2,3,4,5} \right) = \left( {1,4,5,2} \right)! \in K,
$$

so it is not a subgroup. Therefore only case 2 can be a subgroup. Its elements are even, so it is $A_{5}$. Thus $K$ is the only nontrivial normal subgroup of $S_{5}$.

## 4. A group whose order is divisible by $p$

Let $p$ be a prime, and $G$ a finite group with $\left. p\  \middle| \ |G| \right.$. Consider

$$
X = \left\{ ,\left( {g_{1},\ldots,g_{p}} \right) \in G \times \ldots \times G\  \middle| \ g_{1}g_{2}\cdots g_{p} = e, \right\},
$$

where there are $p$ copies of $G$. The group ${\mathbb{Z}}_{p}$ acts on $X$ by rotating elements:

$$
i_{p} \cdot \left( {g_{1},\ldots,g_{p}} \right) = \left( {g_{1 + i},\ldots,g_{p},g_{1},\ldots,g_{i}} \right).
$$

1.  Show $X$ has $|G|^{p - 1}$ elements, so $\left. p\  \middle| \ |X| \right.$.
2.  Show the orbits of the action either have $1$ or $p$ elements, and the orbits of order $1$ are either $\left( {e,e,\ldots,e} \right)$ or of the form $\left( {g,g,\ldots,g} \right)$ with $|g| = p$.
3.  Show that $G$ contains an element of order $p$.

### 1.

For any choice of $\left( {g_{1},g_{2},\ldots,g_{p - 1}} \right)$, by existence and uniqueness of inverses there is a fixed $g_{p}$ such that $g_{1}g_{2}\cdots g_{p} = e$. Therefore there are $|G|^{p - 1}$ choices of $g_{1},\ldots,g_{p - 1}$ and

$$
|X| = |G|^{p - 1} = |G||G|^{p - 2},
$$

so $\left. p\  \middle| \ |X| \right.$.

### 2.

For $x \in X$, the Orbit-Stabilizer Theorem gives

$$
\left| {\operatorname{Orbit}(x)} \right| \cdot \left| {\operatorname{Stab}(x)} \right| = \left| {\mathbb{Z}}_{p} \right| = p.
$$

Consider $x = \left( {g,g,g,\ldots,g} \right)$ for some $g \in G$. For every $y \in {\mathbb{Z}}_{p}$, $y \cdot x = x$, so $\operatorname{Stab}(x) = {\mathbb{Z}}_{p}$; therefore $\left| {\operatorname{Stab}(x)} \right| = p$ and $\left| {\operatorname{Orbit}(x)} \right| = 1$. In this case either $g = e$ or $|g| = p$, because $\left( {g,g,\ldots,g} \right) \in X$ means $g^{p} = e$. Thus either $g = e$ or $|g| = p$; $|g|$ cannot be less than $p$, since otherwise $g^{p} = g^{{|g|}a} = e$ for some $a \in {\mathbb{Z}}$ would contradict that $p$ is prime.

Otherwise, in $x = \left( {g_{1},g_{2},\ldots,g_{p}} \right)$ at least some $g_{i},g_{j}$ are different. Only when $y = 0_{p}$ does $y \cdot x = x$, so $\operatorname{Stab}(x) = \left\{ {,0_{p},} \right\}$ and $\left| {\operatorname{Orbit}(x)} \right| = p$. Therefore the orbits of the action of ${\mathbb{Z}}_{p}$ on $X$ either have $1$ or $p$ elements, and the orbits of order $1$ are either $\left( {e,e,\ldots,e} \right)$ or $\left( {g,g,\ldots,g} \right)$ with $|g| = p$.

### 3.

Every element of $X$ belongs to exactly one orbit. From part 2,

$$
|X| = mp = np
$$

for some $m \in {\mathbb{Z}}$ after reducing the $p$-element orbits. Since $\left. p\  \middle| \ |X| \right.$, there must be an element $\left( {g,g,\ldots,g} \right) \in X$ distinct from $\left( {e,e,\ldots,e} \right)$ such that $|g| = p$. Therefore there must exist $g \in G$ such that $|g| = p$.

## Source notes

The handwritten proof for Problem 1(a) states the induction as "on $a$" after introducing a prime $p$; the typeset version retains that stated induction. In Problem 4(3), the source uses the notation $|X| = mp - np$ while reducing orbit counts; it is transcribed as written.

