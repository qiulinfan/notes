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
source: "notes/math/modern-algebra/homeworks/hw08-rings-and-ideals.typ"
subtitle: Typst-first mathematics notes
title: Modern Algebra
---
# Homework 8

## 1. Automorphisms

An isomorphism from a group $G$ to itself is called an *automorphism*. Let $\operatorname{Aut}(G)$ denote the set of automorphisms of a group $G$.

\(a\) Let $f:G_{1}\rightarrow G_{2}$ and $g:G_{2}\rightarrow G_{3}$ be group homomorphisms. Prove that $g ○ f:G_{1}\rightarrow G_{3}$ is a group homomorphism.

\(b\) Let $f:G\rightarrow H$ be a group isomorphism. Prove that the inverse function $f^{- 1}:H\rightarrow G$ is also a group isomorphism.

\(c\) Prove that $\operatorname{Aut}(G)$ is a group with operation given by composition.

\(d\) Prove that $\operatorname{Aut}({\mathbb{Z}}) \approx {\mathbb{Z}}_{2}$.

\(e\) Prove that $\operatorname{Aut}\left( {{\mathbb{Z}}_{2} \times {\mathbb{Z}}_{2}} \right) \approx S_{3}$.

### (a)

For $a,b \in G_{1}$,

$$
\begin{matrix}
{\left( {g ○ f} \right)\left( {a \star_{1}b} \right)} & {= g\left( {f(a) \star_{2}f(b)} \right)\ } & & {\text{since}\ f\ \text{is a group homomorphism}} \\
 & {= g\left( {f(a)} \right) \star_{3}g\left( {f(b)} \right)\ } & & {\text{since}\ g\ \text{is a group homomorphism}} \\
 & {= \left( {g ○ f} \right)(a) \star_{3}\left( {g ○ f} \right)(b).} & &
\end{matrix}
$$

So $g ○ f$ is a group homomorphism.

### (b)

Select arbitrary $A,B \in H$. Since $f$ is surjective, there are $a,b \in G$ such that $f\left( {a \star_{G}b} \right) = A \star_{H}B$, $f^{- 1}(B) = b$, and $f^{- 1}(A) = a$. Hence

$$
f^{- 1}\left( {A \star_{H}B} \right) = a \star_{G}b = f^{- 1}(B) \star_{G}f^{- 1}(A).
$$

Therefore $f^{- 1}$ is a group homomorphism. And $f^{- 1}$ is an isomorphism since $f$ and $f^{- 1}$ are bijective.

### (c)

1.  The operation is associative.

For $f,g \in \operatorname{Aut}(G)$, part (a) shows that $f ○ g$ is a homomorphism, and it is an isomorphism since a composition of bijective functions is bijective.

1.  There is an identity element: the identity map $e:G\rightarrow G$ sending $g$ to $g$.

For every $f \in \operatorname{Aut}(G)$, $f ○ e = e ○ f = f$.

1.  Every element has an inverse, proved by part (b).

For every $f \in \operatorname{Aut}(G)$, $f^{- 1} \in \operatorname{Aut}(G)$ and

$$
f ○ f^{- 1} = f^{- 1} ○ f = e,
$$

so $f^{- 1}$ is its inverse in $\operatorname{Aut}(G)$.

### (d)

There are two elements in $\operatorname{Aut}\left( {\mathbb{Z}}_{2} \right)$: $\left( {0,1} \right)$ and $(0)$. There are two elements in ${\mathbb{Z}}_{2}$: $0,1$. So

$$
\left| {\operatorname{Aut}\left( {\mathbb{Z}}_{2} \right)} \right| = \left| {\mathbb{Z}}_{2} \right| = 2.
$$

Since all groups of order $2$ are isomorphic,

$$
\operatorname{Aut}\left( {\mathbb{Z}}_{2} \right) \approx {\mathbb{Z}}_{2}.
$$

### (e)

$$
{\mathbb{Z}}_{2} \times {\mathbb{Z}}_{2} = \left\{ {,\left( {0,0} \right)\text{,}\left( {0,1} \right)\text{,}\left( {1,0} \right)\text{,}\left( {1,1} \right),} \right\}.
$$

There are three non-identity elements: $\left( {0,1} \right),\left( {1,0} \right),\left( {1,1} \right)$. Denote them by $A,B,C$, respectively. Any isomorphism $f:{\mathbb{Z}}_{2} \times {\mathbb{Z}}_{2}\rightarrow{\mathbb{Z}}_{2} \times {\mathbb{Z}}_{2}$ is a homomorphism and hence $f\left( \left( {0,0} \right) \right) = \left( {0,0} \right)$. Thus elements of $\operatorname{Aut}\left( {{\mathbb{Z}}_{2} \times {\mathbb{Z}}_{2}} \right)$ are ways to rearrange $A,B,C$, which by definition is $S_{3}$.

To build an isomorphism $\varphi:S_{3}\rightarrow\operatorname{Aut}\left( {{\mathbb{Z}}_{2} \times {\mathbb{Z}}_{2}} \right)$, send

$$
\begin{matrix}
(1) & {\mapsto(A)} & \left( {1,2} \right) & {\mapsto\left( {A,B} \right)} & \left( {1,3} \right) & {\mapsto\left( {A,C} \right)} \\
\left( {2,3} \right) & {\mapsto\left( {B,C} \right)} & \left( {1,2,3} \right) & {\mapsto\left( {A,B,C} \right)} & \left( {1,3,2} \right) & {\mapsto\left( {A,C,B} \right).}
\end{matrix}
$$

## 2. Centers of groups

Let $G$ be a group. The *center* of $G$ is $Z(G) = \left\{ ,g \in G\  \middle| \ gh = hg\ \text{for all}\ h \in G, \right\}$.

1.  Prove that $Z(G)$ is an abelian subgroup of $G$.
2.  Compute the center of $D_{4}$.
3.  Compute the center of $S_{3}$.
4.  Compute the center of $\operatorname{GL}_{2}({\mathbb{R}})$.

### 1.

**Proof.**

1.  $e \in Z(G)$, since for every $h \in G$, $eh = he$.

2.  $Z(G)$ is closed under the operation of $G$. Take $x,y \in Z(G)$. For every $g \in G$, $xg = gx$ and $yg = gy$. Thus

$$
xyg = x\left( {yg} \right) = x\left( {gy} \right) = gxy.
$$

Therefore $xy \in Z(G)$.

1.  $Z(G)$ is closed under inverse. Take $g \in Z(G)$. For arbitrary $x \in G$, $gx = xg$. Multiplying by $g^{- 1}$ on the left gives $x = g^{- 1}xg$; multiplying on the right gives $xg^{- 1} = g^{- 1}x$. Thus $g^{- 1} \in Z(G)$.

2.  $Z(G)$ is commutative: for $x,y \in Z(G)$, $xy = yx$ by definition.

By 1, 2, 3, and 4, $Z(G)$ is an abelian subgroup of $G$.

### 2.

$$
D_{4} = \left\{ {,r_{0}\text{,}r_{90}\text{,}r_{180}\text{,}r_{270}\text{,}f_{1}\text{,}f_{2}\text{,}f_{3}\text{,}f_{4},} \right\},
$$

where $r$ is clockwise and $f_{1},f_{2},f_{3},f_{4}$ denote reflections across the vertical, horizontal, and two diagonal axes, respectively. $r_{0} \in Z\left( D_{4} \right)$ since it is the identity, and $r_{180} \in Z\left( D_{4} \right)$ through calculation. But

$$
r_{90}f_{1} \neq f_{1}r_{90},\quad r_{90}f_{2} \neq f_{2}r_{90},\quad f_{3}r_{90} \neq r_{90}f_{3},\quad f_{4}r_{90} \neq r_{90}f_{4}.
$$

So

$$
Z\left( D_{4} \right) = \left\{ {,r_{0}\text{,}r_{180},} \right\}.
$$

### 3.

$$
S_{3} = \left\{ {,(1)\text{,}\left( {1,2} \right)\text{,}\left( {1,3} \right)\text{,}\left( {2,3} \right)\text{,}\left( {1,2,3} \right)\text{,}\left( {1,3,2} \right),} \right\}.
$$

$(1) \in Z\left( S_{3} \right)$ since it is the identity. Also,

$$
\left( {1,2} \right)\left( {2,3} \right) \neq \left( {2,3} \right)\left( {1,2} \right),\quad\left( {1,2,3} \right)\left( {1,3} \right) \neq \left( {1,3} \right)\left( {1,2,3} \right),\quad\left( {1,2,3} \right)\left( {1,3} \right) \neq \left( {1,3} \right)\left( {1,2,3} \right).
$$

So $Z\left( S_{3} \right) = \left\{ {,(1),} \right\}$.

### 4.

Let $\begin{pmatrix}
m & n \\
p & q
\end{pmatrix} \in Z\left( {\operatorname{GL}_{2}({\mathbb{R}})} \right)$. For arbitrary $a,b,c,d \in {\mathbb{R}}$,

$$
\begin{pmatrix}
a & b \\
c & d
\end{pmatrix}\begin{pmatrix}
m & n \\
p & q
\end{pmatrix} = \begin{pmatrix}
{am + bp} & {an + bq} \\
{cm + dp} & {cn + dq}
\end{pmatrix}
$$

and

$$
\begin{pmatrix}
m & n \\
p & q
\end{pmatrix}\begin{pmatrix}
a & b \\
c & d
\end{pmatrix} = \begin{pmatrix}
{am + cn} & {bm + dn} \\
{ap + cq} & {bp + dq}
\end{pmatrix}.
$$

Thus $bp = cn$, hence $p = n = 0$; $an + bq = bm + dn$, hence $q = m$; and $cm + dp = ap + cq$, which is always true. So

$$
Z\left( {\operatorname{GL}_{2}({\mathbb{R}})} \right) = \left\{ ,k\begin{pmatrix}
1 & 0 \\
0 & 1
\end{pmatrix}\  \middle| \ k \in {\mathbb{R}}^{\times}, \right\}.
$$

## 3. Generating $S_{n}$ and $A_{n}$

Consider the symmetric group $S_{n}$, with $n \geq 3$. The goal is to prove that $S_{n}$ can be generated by only two elements.

\(a\) Let $\tau \in S_{n}$ be a permutation, and $\left( {a,b} \right)$ a transposition. Show that $\tau\left( {a,b} \right)\tau^{- 1} = \left( {\tau(a),\tau(b)} \right)$.

\(b\) Show that $\left( {i,j} \right) = \left( {1,i} \right)\left( {1,j} \right)\left( {1,i} \right)$. Conclude that every element of $S_{n}$ is the product of transpositions of the form $\left( {1,i} \right)$.

\(c\) Let $\sigma$ be the $\left( {n - 1} \right)$-cycle $\left( {2,3\cdots n} \right)$. Show that $\left( {1,i} \right) = \sigma^{i - 2}\left( {1,2} \right)\left( \sigma^{- 1} \right)^{i - 2}$ for all $i = 2,\ldots,n$. Conclude that $S_{n} = \left\langle {\left( {1,2} \right)\text{,}\left( {2,3\cdots n} \right)} \right\rangle$.

### (a)

$$
\tau^{- 1} = \begin{pmatrix}
{\tau(1)} & {\tau(2)} & \ldots & {\tau(a)} & \ldots & {\tau(b)} & \ldots & {\tau(n)} \\
1 & 2 & \ldots & a & \ldots & b & \ldots & n
\end{pmatrix}.
$$

Therefore

$$
\left( {a,b} \right)\tau^{- 1} = \begin{pmatrix}
{\tau(1)} & {\tau(2)} & \ldots & {\tau(a)} & \ldots & {\tau(b)} & \ldots & {\tau(n)} \\
1 & 2 & \ldots & b & \ldots & a & \ldots & n
\end{pmatrix},
$$

and

$$
\tau ○ \left( {a,b} \right) ○ \tau^{- 1} = \begin{pmatrix}
{\tau(1)} & {\tau(2)} & \ldots & {\tau(a)} & \ldots & {\tau(n)} & & \\
{\tau(1)} & {\tau(2)} & \ldots & {\tau(b)} & \ldots & {\tau(a)} & \ldots & {\tau(n)}
\end{pmatrix} = \left( {\tau(a),\tau(b)} \right).
$$

### (b)

$$
\begin{matrix}
\left( {i,j} \right) & {= \begin{pmatrix}
1 & 2 & \ldots & i & \ldots & j & \ldots & n \\
1 & 2 & \ldots & j & \ldots & i & \ldots & n
\end{pmatrix}} \\
 & {= \left( {1,j} \right)\left( {1,i} \right)} \\
 & {= \begin{pmatrix}
1 & 2 & \ldots & i & \ldots & j & \ldots & n \\
1 & 2 & \ldots & j & \ldots & i & \ldots & n
\end{pmatrix}} \\
 & {= \left( {1,i} \right)\left( {1,j} \right)\left( {1,i} \right) = \left( {i,j} \right).}
\end{matrix}
$$

Conclusion: every element of $S_{n}$ is the product of transpositions of the form $\left( {1,i} \right)$.

### (c)

$$
\sigma = \begin{pmatrix}
1 & 2 & 3 & \ldots & {n - 1} & n \\
1 & 3 & 4 & \ldots & n & 1
\end{pmatrix}
$$

and

$$
\sigma^{i - 2} = \begin{pmatrix}
1 & 2 & 3 & \ldots & {n - 1} & n \\
1 & i & {i + 1} & \ldots & {i - 1} & {i - 2}
\end{pmatrix}.
$$

By (a),

$$
\sigma^{i - 2}\left( {1,2} \right)\left( \sigma^{- 1} \right)^{i - 2} = \left( {\sigma^{i - 2}(1),\sigma^{i - 2}(2)} \right) = \left( {1,i} \right).
$$

Therefore $S_{n} = \left\langle {\left( {1,2} \right)\text{,}\sigma} \right\rangle$, since by Theorem 7.26 each $s \in S_{n}$ is a product of transpositions and every transposition $\left( {i,j} \right)$ is a product of transpositions of the form $\left( {1,i} \right)$.

Consider the alternating group $A_{n}$, the subgroup of $S_{n}$ consisting of all even permutations of $S_{n}$, for $n \geq 3$. Let $i,j,k,l \in \left\{ {,1\text{,}2\text{,}\ldots\text{,}n,} \right\}$, with $i \neq j$ and $k \neq l$.

\(a\) Suppose that $\left( {i,j} \right)$ and $\left( {k,l} \right)$ are not disjoint cycles. Show that $\left( {i,j} \right)\left( {k,l} \right)$ is either the identity or a 3-cycle.

\(b\) Suppose that $\left( {i,j} \right)$ and $\left( {k,l} \right)$ are disjoint cycles. Show that $\left( {i,j} \right)\left( {k,l} \right)$ is the product of two 3-cycles.

\(c\) Prove that $A_{n}$ is generated by the set of all 3-cycles of $S_{n}$.

### (a)

Case 1: each of $k,l$ equals one of $i,j$. Then $\left( {i,j} \right) = \left( {k,l} \right)$; since $\left| \left( {i,j} \right) \right| = 2$,

$$
\left( {i,j} \right)\left( {k,l} \right) = (1).
$$

Case 2: only one of $k,l$ equals one of $i,j$. Without loss of generality, $i = k$. Then

$$
\left( {i,j} \right)\left( {k,l} \right) = \left( {i,j} \right)\left( {i,l} \right) = \left( {l,i} \right)\left( {i,j} \right) = \left( {l,i,j} \right),
$$

which is a 3-cycle. Therefore $\left( {i,j} \right)\left( {k,l} \right)$ is either the identity or a 3-cycle.

### (b)

$$
\begin{matrix}
{\left( {i,j} \right)\left( {k,l} \right)} & {= \begin{pmatrix}
1 & 2 & \ldots & i & \ldots & j & \ldots & k & \ldots & l & \ldots & n \\
1 & 2 & \ldots & j & \ldots & i & \ldots & l & \ldots & k & \ldots & n
\end{pmatrix}} \\
 & {= \left( {i,j} \right)\left( {i,k} \right)\left( {j,k} \right)\left( {j,l} \right)} \\
 & {= \left( {i,j,k} \right)\left( {j,k,l} \right).}
\end{matrix}
$$

So $\left( {i,j} \right)\left( {k,l} \right)$ is the product of two 3-cycles.

### (c)

For $a \in A_{n}$, write $a = a_{1}a_{2}\cdots a_{2k}$, where the $a_{i}$ are transpositions. Then

$$
a = \prod\limits_{i = 1}^{k}a_{i}a_{i + 1}.
$$

By (a) and (b), each $a_{i}a_{i + 1}$ is $(1)$ or a 3-cycle, or a product of 3-cycles. Note that

$$
(1) = \left( {1,2} \right)\left( {2,1} \right) = \left( {1,2} \right)\left( {2,3} \right)\left( {3,2} \right)\left( {2,1} \right) = \left( {1,2,3} \right)\left( {3,2,1} \right)
$$

is also a product of two 3-cycles. Therefore $A_{n}$ is generated by the set of all 3-cycles of $S_{n}$.

