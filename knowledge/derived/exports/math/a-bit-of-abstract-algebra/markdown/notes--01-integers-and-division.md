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
source: "notes/math/modern-algebra/chapters/01-integers-and-division.typ"
subtitle: Integers, rings, groups, quotients, and a glimpse of elliptic curves
title: (A Bit of) Abstract Algebra
---
# Integers and division

This chapter transcribes the handwritten work in 'WorkSheets/412-WS1-Mywork.pdf', pp. 1--2, and the integer-linear-combination work in 'WorkSheets/412-WS2-Mywork.pdf', p. 1. English source wording remains English and Chinese source annotations remain Chinese.

## Divisibility and the division algorithm

**Source transcription --- WS1, p. 1, Part I, Warm Up''.**

The source gives the following main outline of the proof of the Division Algorithm Theorem:

1.  **Existence:** $\exists q,r \in \mathbb{Z}$ such that $n = qd + r$ with $0 \leq r < d$.
2.  **Uniqueness:** if another expression $n = q'd + r'$ has $0 \leq r' < d$, then $r' = r$ and $q' = q$.

It also records the divisibility calculation: if $a,b,c \in \mathbb{Z}$, $\left. a\  \middle| \ b \right.$, and $\left. b\  \middle| \ c \right.$, write $b = as$ and $c = bt$. Then $c = \left( {st} \right)a$, with $s,t \in \mathbb{Z}$, hence $st \in \mathbb{Z}$ and $\left. a\  \middle| \ c \right.$.

> **Theorem: Division algorithm**
>
> For $n,d \in \mathbb{Z}$ with $d > 0$, there are unique $q,r \in \mathbb{Z}$ such that
>
> $$
> n = qd + r\quad \land \quad 0 \leq r < d.
> $$

> **Proof**
>
> **Source transcription --- WS1, p. 1, Part 2(D), Division Thm: Existence''.** Let
>
> $$
> S = \left\{ {n - dx:x \in \mathbb{Z},n - dx \geq 0} \right\}.
> $$
>
> The worksheet proves first that $S$ is nonempty. Choose $\left. x = - \middle| n| \right.$; since $d \geq 1$ and $\left. |n \middle| \geq 0 \right.$, $\left. d \middle| n \middle| \geq \middle| n \middle| \geq - n \right.$, and therefore $\left. n + d \middle| n \middle| \geq 0 \right.$. It next writes: Since $n - dx \geq 0$ and $n - dx \in \mathbb{Z}$, \[the set\] has a minimal element which is $\geq 0$.'' Let $r$ be that smallest element of $S$.
>
> To prove $r < d$, the source assumes for contradiction that $r \geq d$, writes $r = d + k$ for some $k \geq 0$ in $\mathbb{Z}$, and uses $r = n - dx$ to obtain
>
> $$
> k = n - d\left( {x + 1} \right) \geq 0.
> $$
>
> Thus $k \in S$, while $k < r$, contradicting that $r$ is the smallest element of $S$. Hence $r < d$. Since $r = n - dx$ for some $x \in \mathbb{Z}$, put $q = x$ to get $n = qd + r$, $0 \leq r < d$.
>
> **Source transcription --- WS1, pp. 1--2, Part 2(E), Division Algorithm: Uniqueness''.** Suppose
>
> $$
> n = qd + r = q'd + r',\quad q,r,q',r' \in \mathbb{Z},\quad 0 \leq r,r' < d.
> $$
>
> Then $d\left( {q' - q} \right) = r - r'$, so $\left. d\  \middle| \ \left( {r - r'} \right) \right.$. Moreover $0 \leq r,r' < d$ gives $- d < r - r' < d$ and therefore $\left. |r - r' \middle| < d \right.$. The source continues:
>
> $$
> \left. |d\left( {q - q'} \right) \middle| < d\quad\Rightarrow\quad \middle| q - q' \middle| < 1. \right.
> $$
>
> Because $q,q' \in \mathbb{Z}$, $q = q'$. Consequently $d\left( {q - q'} \right) = 0$, so $r - r' = 0$ and $r = r'$. The concluding handwritten summary is: 我们总结 prove uniqueness 的办法: assume two solutions then prove they are equal.''

## Linear combinations, gcd, and Bézout

**Source transcription --- WS2, p. 1, 自主部份, Pf of Thm 2′'.** Define

$$
S = \left\{ {am + bn:m,n \in \mathbb{Z}} \right\},
$$

i.e. $S$ 为 $a,b$ 的所有 linear combination.'' The worksheet wants to show:

1.  there is $t \in S$ with $\left. t\  \middle| \ a \right.$ and $\left. t\  \middle| \ b \right.$;
2.  for every $c$ with $\left. c\  \middle| \ a \right.$ and $\left. c\  \middle| \ b \right.$, one has $c \leq t$.

Let $t$ be the smallest positive element of $S$ (神奇，这里是直接过一个 定理来想到 $\left( {a,b} \right)$ 是 $S$ 的 smallest positive elem''). By well-ordering, $t$ exists, and $t = ua + vb$ for some $u,v \in \mathbb{Z}$. Divide $a$ by $t$:

$$
a = tq + r,\quad 0 \leq r < t.
$$

Since $r = a - tq = a - \left( {ua + vb} \right)q = a\left( {1 - uq} \right) + b\left( {- vq} \right)$, it is also a linear combination of $a,b$, hence $r \in S$. Minimality forces $r = 0$, so $a = tq$ and $\left. t\  \middle| \ a \right.$; similarly $\left. t\  \middle| \ b \right.$.'' If $\left. c\  \middle| \ a \right.$ and $\left. c\  \middle| \ b \right.$, write $a = ck$, $b = cs$. Then $t = ua + vb = c\left( {uk + vs} \right)$, so $\left. c\  \middle| \ t \right.$ and $\left. c \leq \middle| t \middle| = t \right.$.

> **Theorem: Bézout identity and the gcd**
>
> Let $a,b$ not both be $0$. There exist $u,v \in \mathbb{Z}$ such that
>
> $$
> \gcd\left( {a,b} \right) = au + bv.
> $$
>
> Moreover every common divisor of $a$ and $b$ divides $\gcd\left( {a,b} \right)$.

> **Proof**
>
> The preceding source calculation supplies the proof: the least positive $t = ua + vb$ divides both $a,b$, and every common divisor of $a,b$ divides $t$. Thus $t = \gcd\left( {a,b} \right)$.

**Source transcription --- WS2, p. 1, Pf of Corollary 1.3′'.** The sheet records: if $a,b = 1$, then by Theorem 2 there are $u,v \in \mathbb{Z}$ with $au + bv = 1$. If $\left. a\  \middle| \ c \right.$, write $c = bk$ (as written in the source); then $au + bv = c$ is used to conclude $\left. a\  \middle| \ c \right.$. The adjacent Chinese note says: 这个证明的意思是: 如果 $a$ 是 $b,c$ 的因子, 但 $a$ 和 $b$ 互质, 那 $a$ 肯定就是 $c$ 的因子（直观可见）.''

## Euclidean algorithm

**Source transcription --- WS2, p. 1, Worksheet 部分, Pf of Thm 5: Euclidean Algorithm''.** For $a,b \in \mathbb{Z}$, let $d = \gcd\left( {a,b} \right)$ and divide

$$
a = bq + r.
$$

The source proves both directions of $\gcd\left( {a,b} \right) = \gcd\left( {b,r} \right)$. If $\left. d\  \middle| \ b \right.$ and $\left. d\  \middle| \ r \right.$, then $\left. d\  \middle| \ \left( {bq + r} \right) = a \right.$; hence every common divisor of $b,r$ is one of $a,b$, and $\gcd\left( {b,r} \right) \leq \gcd\left( {a,b} \right)$. Conversely, if $\left. d\  \middle| \ a \right.$ and $\left. d\  \middle| \ b \right.$, then $b = dk_{1}$ and $a = dk_{2}$ for some integers, so $r = a - bq = d\left( {k_{2} - k_{1}q} \right)$; the same argument gives $\gcd\left( {b,r} \right) \geq \gcd\left( {a,b} \right)$. Therefore $\gcd\left( {b,r} \right) = \gcd\left( {a,b} \right)$.

The Chinese explanation on the page is retained: Worksheet 则介绍了 Euclidean Algorithm（辗转相除）这种方法则证明；当我们知道 $\left( {a,b} \right) = \left( {b,a\operatorname{mod}b} \right)$ 时，最后会到某时 $u,v$ 使 $u\operatorname{mod}v = 0$，那么下一步 $v\operatorname{mod}0 = v$，$\left( {u,0} \right) = v$，这个 $v$ 就是一连下来最后的 $\left( {a,b} \right)$ 了。'' Each division has the form $c = dq + r$; at the last nonzero remainder one back-substitutes to obtain the promised linear combination.

**Worked source calculations --- WS2, p. 1.**

$$
524 = 148 \times 3 + 80,\quad 148 = 80 \times 1 + 68,\quad 80 = 68 \times 1 + 12,\quad 68 = 12 \times 5 + 8,\quad 12 = 8 \times 1 + 4,\quad 8 = 4 \times 2 + 0.
$$

Thus $\gcd\left( {524,148} \right) = 4$, and the page back-substitutes

$$
\begin{matrix}
4 & {= 12 - 8} \\
 & {= 12 - \left( {68 - 12 \times 5} \right)} \\
 & {= - 68 + 6 \times 12} \\
 & {= - 68 + 6\left( {80 - 68} \right)} \\
 & {= - 7 \times 68 + 6 \times 80} \\
 & {= - 7\left( {148 - 80} \right) + 6 \times 80} \\
 & {= - 7 \times 148 + 13 \times 80} \\
 & {= 13 \times 524 - 46 \times 148.}
\end{matrix}
$$

The second calculation is

$$
1103 = 456 \times 2 + 91,\quad 456 = 91 \times 5 + 1,\quad 91 = 1 \times 91 + 0,
$$

so $\gcd\left( {1103,456} \right) = 1$ and

$$
1 = 456 - 91 \times 5 = 456 - \left( {1103 - 2 \times 456} \right) \times 5 = - 5 \times 1103 + 11 \times 456.
$$

