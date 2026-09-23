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
source: "notes/math/modern-algebra/chapters/06-normal-subgroups-and-isomorphisms.typ"
subtitle: Integers, rings, groups, quotients, and a glimpse of elliptic curves
title: (A Bit of) Abstract Algebra
---
# Normal subgroups and isomorphisms

This chapter is a source-language transcription of 'WorkSheets/412-WS24-Mywork.pdf', pp. 1--3. The page divisions below are part of the provenance: no theorem statement or proof cue is supplied from the reference-only PDFs.

## Kernels, quotients, and the first isomorphism theorem

**Source transcription --- WS24, p. 1, Thm 8.16.** If $f:G\rightarrow H$ is a group hom, then $\ker f$ is a subgroup of $G$. The handwritten proof first observes that for $a,b \in \ker f$, $f(a) = e_{H} = f(b)$ and hence $f\left( {ab} \right) = f(a)f(b) = e_{H}$, so $ab \in \ker f$. It then checks subgroup closure in the form: for $g \in G$ and $k \in \ker f$,

$$
f\left( {g^{- 1}kg} \right) = {f(g)}^{- 1}f(k)f(g) = {f(g)}^{- 1}e_{H}f(g) = e_{H},
$$

so $g^{- 1}kg \in \ker f$. (The original Chinese line says 首先，group hom 的 ker 一定是 subgroup of $G$'' and then 然后我们证明 $\ker f \lhd G$''.)

**Source transcription --- WS24, p. 1, Thm 8.17 and 8.18.**

$\ker f = \left\{ e_{G} \right\}$ iff $f$ is injective.

The sheet marks this as 已证过千遍.'' If $N \lhd G$, then $\pi:G\rightarrow\frac{G}{N}$ is a surjective group hom and $\ker\pi = N$. It explicitly checks $\pi\left( {g_{1}g_{2}} \right) = g_{1}g_{2}N = \left( {g_{1}N} \right)\left( {g_{2}N} \right)$, writes that every coset is $Na$ for some $a \in G$ and therefore is hit by $\pi$, and notes $\pi(a) = Ne = N$ iff $a \in N$.

**Source transcription --- WS24, p. 1, Lemma 8.19.** For a group hom $f:G\rightarrow H$ with $\ker f = K$,

$$
f(a) = f(b)\ \text{if and only if}\ Ka = Kb.
$$

The source's forward implication is $f\left( {ab^{- 1}} \right) = e_{H}$, hence $ab^{- 1} \in K$ and $a \equiv b\left( {\operatorname{mod}K} \right)$; for the converse, $Ka = Kb$ gives $ab^{- 1} \in K$, then $f\left( {ab^{- 1}} \right) = e_{H}$ and, using $f(a) = f(b)$ (the page annotates the equivalence with the reverse-multiplying calculation).

> **Theorem: First isomorphism theorem**
>
> If $f:G\rightarrow H$ is a surjective group homomorphism, then
>
> $$
> \frac{G}{\ker}f \sim = H.
> $$

> **Proof**
>
> **Source transcription --- WS24, p. 1, Thm 8.20.** Consider $\psi:\frac{G}{\ker}f\rightarrow H$, sending $Ka\mapsto f(a)$. It is well-defined because $Ka = Kb\Rightarrow ab^{- 1} \in K\Rightarrow f(a) = f(b)$. It is injective by the preceding lemma, and it is surjective because every $x \in H$ is $f(g)$ for some $g \in G$ when $f$ is surjective. The source calls this 第一同构定理'' and annotates the displayed conclusion with the exceptional hypothesis that $f$ must be surjective.

**Source transcription --- WS24, p. 1, Thm 8.21.** If $N \lhd G$, $K$ is a subgroup of $G$, and $N \subset K$, then $\frac{K}{N}$ is a subgroup of $\frac{G}{N}$. The proof starts with $gN \in \frac{G}{N}$ and $kN \in \frac{K}{N}$; normality gives $g^{- 1}kg \in K$, hence $\left( {Ng} \right)^{({- 1}\}}\left( {Nk} \right)\left( {Ng} \right)$ (as written on the page) lies in $\frac{K}{N}$. The source adds the Chinese reminder: 而如果 $K \lhd G$，则结论 更强: $\frac{K}{N} \lhd \frac{G}{N}$；但如果结论是包含 $G$ 本身，和第七条类似.''

## Second and third isomorphism theorems

**Source transcription --- WS24, p. 2, Thm 8.22 (Third Isomorphism Theorem).** If $N \lhd G$, $K \lhd G$, and $N \subset K$, then

$$
\frac{K}{N} \lhd \frac{G}{N}\quad \land \quad\frac{\frac{G}{N}}{\frac{K}{N}} \sim = \frac{G}{K}.
$$

The source begins the normality check with $\left( {Ng} \right)^{({- 1}\}}\left( {Nk} \right)\left( {Ng} \right) = N\left( {g^{- 1}kg} \right)$ and, because $K$ is normal in $G$, $g^{({- 1}\}}kg \in K$. For the quotient isomorphism it considers $\pi:\frac{G}{N}\rightarrow\frac{G}{K}$, $Na\mapsto Ka$, calling it an easy group hom and surjective. The ker note says: 即所有 $a \in K$ 中等类的 $N$-cosets'', so $\ker\pi = \frac{K}{N}$, and the first isomorphism theorem yields the result.

**Source transcription --- WS24, p. 2, Second Isomorphism Theorem (group), Diamond Thm''.** Let $G$ be a group, $S$ a subgroup of $G$, and $N \lhd G$. Then:

1.  $SN$ is a subgroup of $G$;
2.  $N \lhd SN$;
3.  $S \cap N \lhd S$; and
4.  $\frac{SN}{N} \sim = \frac{S}{S \cap N}$.

The source draws the diamond $G$ over $SN$, with $S$ and $N$ below and $S \cap N$ at the base. It defines $\psi:S\rightarrow S\frac{N}{N}$ by $s\mapsto sN$; its kernel is $\left\{ {s \in S\ \text{and}\ s \in N} \right\} = S \cap N$, so the first isomorphism theorem proves $\frac{S}{S \cap N} \sim = S\frac{N}{N}$.

**Source transcription --- WS24, p. 2, Fourth Isomorphism Theorem (group), Lattice Thm''.** With $N \lhd G$, let $\mathcal{G}$ be all subgroups of $G$ containing $N$ and $\mathcal{N}$ all subgroups of $\frac{G}{N}$. The source states $\mathcal{G} \sim = \mathcal{N}$ by $A\mapsto\frac{A}{N}$ and gives the correspondence cues 所有 $\frac{G}{N}$ 的 subgroup $T = \left\{ \frac{H}{N} \right\}$ for some $H < G$'' and, for a subgroup $T < \frac{G}{N}$, choose $H = \left\{ {a \in G:Na \in T} \right\}$, then prove $H < G$ and $\frac{H}{N} = T$.

**Source transcription --- WS24, p. 2, ring analogues.** 类比地 ring 也有四个 isomorphic thms.'' The page records the First Isomorphism Theorem for rings: if $\varphi:R\rightarrow S$ is a ring hom, then $\ker\varphi$ is a subring and an ideal, $\operatorname{im}\varphi$ is a subring, and $\operatorname{im}\varphi \sim = \frac{R}{\ker}\varphi$ (the page annotates the surjective case 虽然不说，但如果 $\varphi$ surj，那么 $\frac{R}{\ker}\varphi \sim = S$''). The Second Isomorphism Theorem for rings: if $S$ is a subring of $R$ and $I$ an ideal of $R$, then $S + I = \left\{ {s + i:s \in S,i \in I} \right\}$ is a subring, $S \cap I$ is an ideal of $R$, and $\frac{S + I}{I} \sim = \frac{S}{S \cap I}$.

## Fourth isomorphism theorem, simple groups, and finite abelian groups

**Source transcription --- WS24, p. 3, Third and Fourth Isomorphism Theorems (ring).** If $R$ is a ring and $I$ an ideal of $R$, the source lists:

1.  for a subring $A$ of $R$, $A + I$ is a subring of $R$;
2.  every subring of $\frac{R}{I}$ is $\frac{A}{I}$ for a subring $A$ of $R$;
3.  if $J$ is an ideal of $R$ containing $I$, then $\frac{J}{I}$ is an ideal of $\frac{R}{I}$;
4.  every ideal of $\frac{R}{I}$ is $\frac{J}{I}$ for an ideal $J$ of $R$; and
5.  $\frac{R}{I}$ is isomorphic to $\frac{R}{J}$ when $\frac{J}{I}$ is the intervening ideal.

The page's Fourth Isomorphism Theorem for rings is phrased: if $I$ is an ideal of $R$, define $\mathcal{G}$ as all subrings of $R$ containing $I$ and $\mathcal{N}$ as all subrings of $\frac{R}{I}$; then $\mathcal{G} \sim = \mathcal{N}$ under $A\mapsto\frac{A}{I}$.

**Source transcription --- WS24, p. 3.** Corollary 8.23 says: if $N$ is normal in $G$, $K$ is a subgroup of $G$, and $K$ contains $N$, then $K \lhd G$ iff $\frac{K}{N} \lhd \frac{G}{N}$. The proof uses the Third Isomorphism Theorem in one direction and, in the other, for $g \in G$, $k \in K$, writes $\left( {Ng} \right)^{({- 1}\}}\left( {Nk} \right)\left( {Ng} \right) = Nk'$ for some $k' \in K$, hence $g^{({- 1}\}}kg = Nt$ for $t \in K$; since $N \subset K$, this lies in $K$.

The definition is retained verbatim in meaning: A group $G$ is simple iff 它有且只有 $\left\{ e_{G} \right\}$ 和 $G$ 自己这两个 normal subgroup.'' The sheet states $G$ 为 simple abelian group iff $G \sim = \mathbb{Z}_{p}$ for some prime $p$.'' It finishes with the Fundamental Structure Theorem for finite Abelian groups:

$$
G \sim = \mathbb{Z}_{p_{1}^{a_{1}}} \times \mathbb{Z}_{p_{2}^{a_{2}}} \times \ldots \times \mathbb{Z}_{p_{n}^{a_{n}}},
$$

where $p_{1},\ldots,p_{n}$ are prime numbers (可以重复''), and the isomorphism is unique up to reordering.

