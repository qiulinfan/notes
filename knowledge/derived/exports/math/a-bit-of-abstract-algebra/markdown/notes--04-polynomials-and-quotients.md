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
source: "notes/math/modern-algebra/chapters/04-polynomials-and-quotients.typ"
subtitle: Integers, rings, groups, quotients, and a glimpse of elliptic curves
title: (A Bit of) Abstract Algebra
---
# Polynomials and quotient rings {#polynomials-and-quotients}

This chapter transcribes the polynomial and quotient material in 'WorkSheets/412-WS9-Mywork.pdf', p. 2 and 'WorkSheets/412-WS10-Mywork.pdf', pp. 1--3.

## Domains, polynomial units, and division

**Source transcription --- WS9, p. 2.** The worksheet records: if $R$ is a domain, then $R\lbrack X\rbrack$ is a domain. Its explanation is that the degree of the product of two nonzero polynomials is the sum of their degrees, so the product cannot be zero. It then notes that the units of $R\lbrack X\rbrack$ are exactly the units of $R$; a nonconstant polynomial cannot have a polynomial inverse. It gives the special example that in $\mathbb{Z}_{p{\lbrack X\rbrack}}$, the units are the nonzero elements of $\mathbb{Z}_{p}$, because $\mathbb{Z}_{p}$ is a field.

**Source transcription --- WS10, p. 1, Part 1(A).** Long division gives

$$
X^{5} + X^{3} + X^{2} + 1 = \left( {X^{2} + 1} \right)\left( {X^{3} + 1} \right) + 0.
$$

The page labels the quotient $q = X^{3} + 1$ and remainder $r = 0$. Its red note states: Division algorithm 只能在 field 上有用，因为只有 field 上才对 division 有 well-definedness.'' It then records the failure over $\mathbb{Z}\lbrack X\rbrack$: when $\deg f < \deg g$, a putative quotient can be $q(X) = \frac{1}{2}X + \frac{1}{2}$, which is not in $\mathbb{Z}\lbrack X\rbrack$, so the source's division-algorithm hypothesis fails.

> **Theorem: Polynomial division**
>
> For $f,g \in F\lbrack X\rbrack$ with $g \neq 0$, there are unique $q,r \in F\lbrack X\rbrack$ such that
>
> $$
> f = qg + r\quad \land \quad\left( {r = 0 \vee \deg r < \deg g} \right).
> $$

**Source transcription --- WS10, p. 1, C(1).** Fix $f \in F\lbrack X\rbrack$. Divide $f$ by $X - \lambda$:

$$
f(X) = g(X)\left( {X - \lambda} \right) + r(X),\quad\deg r < \deg\left( {X - \lambda} \right) = 1.
$$

Thus $r$ is constant. Substituting $X = \lambda$ gives $f(\lambda) = r$. The source calls this the Pf of Remainder Thm'' and writes $f(\lambda)$ 是 $\left( {X - \lambda} \right)$ 的 remainder.''

**Source transcription --- WS10, p. 1, C(2).** The factor theorem is recorded in both directions:

$$
\left. \left( {X - \lambda} \right) \middle| f(X)\ \text{if and only if}\ f(\lambda) = 0. \right.
$$

If $f(\lambda) = 0$, division gives $f = q\left( {X - \lambda} \right) + 0$; conversely, substitute $\lambda$ in a multiple of $X - \lambda$.

## Factorisation and irreducibility

**Source transcription --- WS10, p. 1, B.** For the polynomial gcd exercises,

$$
2X^{2} - 10X + 12 = 2\left( {X - 3} \right)\left( {X - 2} \right),\quad X^{2} - 3X - 2 = X^{1}\left( {X - 3} \right),
$$

so the source writes $\gcd = X - 3$. It also records in $\mathbb{Z}_{2}\lbrack X\rbrack$:

$$
\left( {X^{2} + 1} \right)\left( {X^{3} + X^{2}} \right) = X^{2}\left( {X^{2} + 1} \right)\left( {X + 1} \right),
$$

then identifies $X^{2}\left( {X^{2} + 1} \right)$ as the gcd. The handwritten explanation says: official def: 一直有定义的 ring 下使只要是 subring，且 $1$ 和 $0$ 也在 （事 $X$ 的 multiplication 是 well-defined 的）$0_{R} = \lbrack 0\rbrack_{2} = 0_{T}$.''

For the Bézout prompt the source writes that there must be $f,g \in \mathbb{Q}\lbrack X\rbrack$ with

$f\left( {2X^{2} - 10X + 12} \right) + g\left( {X^{2} - 3X + 2} \right) = \gcd\left( {f,g} \right) = X - 3.$

It also notes that $1,2,3,4$ are the only units of $\mathbb{Z}_{5}\lbrack X\rbrack$ (plug in 就好'') and factors

$$
X^{5} - X = X\left( {X^{4} - 1} \right) = X\left( {X - 1} \right)\left( {X + 1} \right)\left( {X - 2} \right)\left( {X - 3} \right)
$$

in $\mathbb{Z}_{5}\lbrack X\rbrack$ by checking roots $0,1,2,3,4$.

**Source transcription --- WS10, pp. 1--2, D.** If $f \in F\lbrack X\rbrack$ has degree $2$ or $3$, then $f$ is irreducible iff it has no root. The forward implication uses the factor theorem: irreducibility forbids a factor $X - \lambda$ and so forbids $f(\lambda) = 0$. Conversely, if $f = gh$ is nontrivial, degrees add in a field/domain. For degree $2$ or $3$, one factor must have degree $1$; writing that factor as $aX + b$ yields the root $- \frac{b}{a}$.

The source then factors $X^{4} - 1$ in $\mathbb{Z}_{2}\lbrack X\rbrack$. It explicitly says that one must check whether $X^{2} + 1$ is irreducible; by the degree-$2$ criterion it has no root in $\mathbb{Z}_{2}$, so

$$
X^{4} - 1 = X\left( {X^{2} - 1} \right) = X\left( {X^{2} - 1} \right)\left( {X^{2} + 1} \right) = X\left( {X - 1} \right)\left( {X + 1} \right)\left( {X^{2} + 1} \right)
$$

is the recorded factorization.

## Congruence modulo a polynomial and quotient rings

**Source transcription --- WS10, p. 2, Part 3.** For $g,h \in F\lbrack X\rbrack$ define

$$
\left. g \equiv h\left( {\operatorname{mod}f} \right)\ \text{if and only if}\ f\  \middle| \ \left( {g - h} \right). \right.
$$

The source calls $\lbrack g\rbrack_{f}$ the collection of all polynomials congruent to $g$ modulo $f$ and writes

$$
\lbrack g\rbrack_{f} = \left\{ {g + tf:t \in F\lbrack X\rbrack} \right\}.
$$

It explicitly notes: 这里有证锣了，我们易证'' that congruence modulo $f$ is an equivalence relation, $h \in \lbrack g\rbrack_{f}\Rightarrow\lbrack g\rbrack_{f} = \lbrack h\rbrack_{f}$, and distinct congruence classes are disjoint.

**Source transcription --- WS10, p. 2, F.** Every class $\lbrack g\rbrack_{f}$ has a unique $h(X) \in F\lbrack X\rbrack$ with $\deg h < \deg f$. Existence is by division. For uniqueness, if $m = r + kf$ with $r$ the remainder, then $k = 1$ would make the degree of $m$ equal to $\deg f > \deg r$, while $k = - 1$ gives the same degree obstruction; no other degree can make two different low-degree representatives congruent.

**Source transcription --- WS10, p. 3, G.** Let $f \in F\lbrack X\rbrack$ have positive degree and put

$R = \left\{ {\lbrack g\rbrack_{f}:g \in F\lbrack X\rbrack} \right\}.$

The source defines $\lbrack g\rbrack_{f} + \lbrack h\rbrack_{f} = \left\lbrack {g + h} \right\rbrack_{f}$, $\lbrack g\rbrack_{{f{\lbrack h\rbrack}}_{f}} = \left\lbrack {gh} \right\rbrack_{f}$, $0_{R} = \lbrack 0\rbrack_{f}$, and $1_{R} = \lbrack 1\rbrack_{f}$, marking the operations well-defined'' and calling $R$ a ring. For the example

$R = \left\{ {\lbrack g\rbrack_{X^{2}}:g \in \mathbb{Z}_{2}\lbrack X\rbrack} \right\}$,

the page maps the four classes to $\mathbb{Z}_{2} \times \mathbb{Z}_{2}$: $\lbrack 0\rbrack$ to $\left( {0,0} \right)$, $\lbrack 1\rbrack$ to $\left( {1,1} \right)$, $\lbrack X\rbrack$ to $\left( {0,1} \right)$, and $\left\lbrack {1 + X} \right\rbrack$ to $\left( {1,0} \right)$, and labels the map isomorphic to $\mathbb{Z}_{2} \times \mathbb{Z}_{2}$′'.

