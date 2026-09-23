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
source: "notes/math/modern-algebra/chapters/03-rings-and-homomorphisms.typ"
subtitle: Integers, rings, groups, quotients, and a glimpse of elliptic curves
title: (A Bit of) Abstract Algebra
---
# Rings and homomorphisms

This chapter transcribes 'WorkSheets/412-WS7-Ring-Mywork.pdf', p. 1; '412-WS8-Mywork.pdf', pp. 1--2; and the ring-homomorphism portion of '412-WS9-Mywork.pdf', p. 1.

## Ring structure

**Source transcription --- WS7, p. 1.** An operation on a set $S$ is a function $f:S \times S\rightarrow S$. A ring is a set $R$ with two operations $+$'' and $\times$'' such that, for all $a,b,c \in R$:

1.  $\left( {R, +} \right)$ is an abelian group: closure, associativity, commutativity, $0_{R}$, and additive inverses;
2.  multiplication has closure and associativity;
3.  there is $1_{R}$ such that $1_{R}a = a1_{R} = a$ (有幺元的环即为环'' in the handwritten note); and
4.  $\left( {a + b} \right)c = ac + bc$ and $a\left( {b + c} \right) = ab + ac$.

The source then proves $0 \times x = 0$: from $0 \times x = \left( {0 + 0} \right) \times x = 0 \times x + 0 \times x$, let $y$ be the additive inverse of $0 \times x$, add $y$ to both sides, and obtain $0 = 0 \times x$.

**Source transcription --- WS7, p. 1, D(1).** To show a nonempty subset $S$ of a ring $R$ is a subring, the worksheet lists: $1_{R},0_{R} \in S$; $S$ is closed under $+$ and $\times$; and $S$ is closed under additive inverse. It notes that the inherited $+$ is commutative and associative and $\times$ distributes over it, while $1_{R},0_{R}$ serve as the identities; 所以只要证明 $1_{R},0_{R} \in S$ 且对 closure 即可.''

**Source transcription --- WS7, p. 1, D(2).** The set $\text{Fun}\left( {R,R} \right)$ of all functions from $R$ to itself, with pointwise operations

$$
\left( {f + g} \right)(x) = f(x) + g(x),\quad\left( {fg} \right)(x) = f(x)g(x),
$$

is recorded as a ring. The source asks whether there are other subrings: ① 它自己；② 一个 smallest subring: 至少 include $1_{R},0_{R}$. 因而 all elements of $S$: $n \cdot 1_{R} = 1_{R} + \ldots + 1_{R}$, $n \in \mathbb{Z}$.'' It concludes that $\left\{ {n \cdot 1_{R}:n \in \mathbb{Z}} \right\}$ is a subring and is the smallest subring.

## Ring homomorphisms

**Source transcription --- WS8, p. 1, A.** The page lists seven maps and their status:

1.  the inclusion $\varphi:\mathbb{Z}\rightarrow\mathbb{Q}$, $z\mapsto\frac{z}{1}$, is a hom but not an isomorphism (for example $\frac{2}{3}$ is not $\varphi(z)$);
2.  the doubling map $\varphi:\mathbb{Z}\rightarrow\mathbb{Z}$, $z\mapsto 2z$, is not a hom because $1\mapsto 2$ and it does not preserve $1_{\mathbb{Z}}$;
3.  the residue map $\varphi:\mathbb{Z}\rightarrow\mathbb{Z}_{N}$, $z\mapsto\lbrack z\rbrack_{N}$, is a hom by modular arithmetic, is surjective, but is not an isomorphism because it is not one-to-one;
4.  the evaluation at $0$′' map $\varphi:\mathbb{R}\lbrack X\rbrack\rightarrow\mathbb{R}$, $f(X)\mapsto f(0)$, is a hom: the page writes $\text{eval}\left( {f(X) + g(X)} \right) = \text{eval}\left( {f(X)} \right) + \text{eval}\left( {g(X)} \right)$ and similarly for products;
5.  $\varphi:\mathbb{R}\lbrack X\rbrack\rightarrow\mathbb{R}\lbrack X\rbrack$, $f(X)\mapsto f'(X)$, is not a hom because $1\mapsto 0$;
6.  $\varphi:\mathbb{R}\rightarrow M_{2}\left( \mathbb{R} \right)$, $\lambda\mapsto\begin{pmatrix}
    \lambda & 0 \\
    0 & \lambda
    \end{pmatrix}$, is a hom, with the addition and product of diagonal matrices written out; and
7.  $\varphi:M_{2}\left( \mathbb{Z} \right)\rightarrow\mathbb{R}$, $A\mapsto\det(A)$, is not a hom, as a displayed pair of matrices shows $\det\left( {A + B} \right) \neq \det(A) + \det(B)$.

> **Definition: Ring homomorphism**
>
> A map $\varphi:R\rightarrow S$ is a ring homomorphism when $\varphi\left( {x + y} \right) = \varphi(x) + \varphi(y)$ and $\varphi\left( {xy} \right) = \varphi(x)\varphi(y)$.

**Source transcription --- WS8, p. 1, B(1)--(3).** Every hom preserves $0_{R}$: from $0_{S} + 0_{S} = 0_{S}$ one gets $\varphi\left( 0_{S} \right) = \varphi\left( {0_{S} + 0_{S}} \right) = \varphi\left( 0_{S} \right) + \varphi\left( 0_{S} \right)$ and cancels an additive inverse. It preserves additive inverse because $\varphi(x) + \varphi\left( {- x} \right) = \varphi\left( 0_{S} \right) = 0_{T}$, hence $- \varphi(x) = \varphi\left( {- x} \right)$. It preserves units: if $uu^{- 1} = 1_{S}$, then $\varphi(u)\varphi\left( u^{- 1} \right) = \varphi\left( 1_{S} \right) = 1_{T}$, so $\varphi(u)$ and $\varphi\left( u^{- 1} \right)$ are units.

The same page gives the kernel definition and an example:

$$
\ker\psi = \left\{ {\left( {0_{R},s} \right):s \in S} \right\}
$$

for $\psi:R \times S\rightarrow R$, $\left( {r,s} \right)\mapsto r$. It also writes the informal summary isomorphism preserves 基本 everything（而 hom 只需要 surjective 也 preserve 所有的单位元）'', followed by the counter-cue 不是所有 field, domain ...''.

**Source transcription --- WS8, pp. 1--2, C--E.** A homomorphism kernel is nonempty because $\varphi\left( 0_{S} \right) = 0_{R}$; in particular $0_{S} \in \ker\varphi$. The source proves

$$
\varphi\ \text{injective}\ \text{if and only if}\ker\varphi = \left\{ 0_{S} \right\}.
$$

If $\varphi$ is injective and $x \in \ker\varphi$, then $\varphi(x) = \varphi\left( 0_{S} \right)$, so $x = 0_{S}$. Conversely, if $\ker\varphi = \left\{ 0_{S} \right\}$ and $\varphi(x) = \varphi(y)$, then $\varphi(x) + \left( {- \varphi(y)} \right) = 0_{R} = \varphi\left( {x + \left( {- y} \right)} \right)$, hence $x - y \in \ker\varphi$, $x = y$.

The Chinese/English note continues: 如何都有一个 unique 的从 $\mathbb{Z}$ 到 $R$ 之间的 hom $\psi:\mathbb{Z}\rightarrow R$，这个 hom 叫做 canonical ring homomorphism.'' If such a $\psi$ exists, $\psi(1) = 1_{R}$ and $\psi(0) = 0_{R}$; for $n \geq 1$, $\psi(n) = \psi\left( {1 + \ldots + 1} \right) = n \cdot 1_{R}$, while for $n \leq - 1$, $\psi(n) = - n \cdot 1_{R}$. Thus the possible map is unique, and this calculation also verifies it is a hom: $\psi\left( {n + m} \right) = \psi(n) + \psi(m)$ and $\psi\left( {nm} \right) = \psi(n)\psi(m)$.

## Domains and fields

**Source transcription --- WS8, p. 2, D--E.** The worksheet proves that $0_{R} = 1_{R}$ if and only if $R = \left\{ 0_{R} \right\}$: for $r \in R$, $r = r1_{R} = r0_{R} = 0_{R}$. It then records Thm 3.8: every field 一定 domain'': if $a,b \in F$, $ab = 0$, and $a \neq 0$, multiply by $a^{- 1}$ to get $b = 0_{F}$. The red Chinese explanation adds: 任何自乘的去，$+$ 中的所有非 0 元不能乘起就 0；因为 $F$ 上 $+ - \times$ 是 well-defined，如果有元被中 $+ - \times$ 就失去唯一性了.''

A subring of a domain is a domain (去除了不必要了，本来所有非 0 元不能乘 到 0，$+ \times$ 也肯定一样''). For $S \subset R$, the inclusion map $\varphi:S\rightarrow R$ is a ring hom exactly when $S$ is a subring of $R$; the source explains that the issue is the map is the inclusion and therefore one must retain the same $0,1, + , \times$.

