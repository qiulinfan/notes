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
source: "notes/math/modern-algebra/homeworks/hw04-subgroups-and-cosets.typ"
subtitle: Typst-first mathematics notes
title: Modern Algebra
---
# Homework 4: characteristics, linear maps, and quotient examples

*Personal finished homework transcription from 412-Hw-4-finished.pdf.*

## 1. Characteristics of rings

\(a\) If $f:R\rightarrow S$ is a homomorphism of rings, show for any $r \in R$ and $n \in {\mathbb{Z}}$, $f\left( {nr} \right) = nf(r)$.

\(b\) Prove that isomorphic rings have the same characteristic.

\(c\) If $f:R\rightarrow S$ is a homomorphism of rings, must $R$ and $S$ have the same characteristic?

**(a)**

Pf. Case 1: $n \in {\mathbb{Z}}^{+}$. Then

$$
f\left( {nr} \right) = f\left( {r + r + \ldots + r} \right) = f(r) + f(r) + \ldots + f(r) = nf(r),
$$

where each repeated sum has $n$ terms, since addition is closed under ring homomorphism.

Case 2: $n = 0$. Then

$$
f\left( {nr} \right) = f\left( {0 \cdot r} \right) = f\left( 0_{R} \right) = 0_{S} = 0f(r) = nf(r),
$$

since a homomorphism preserves the additive identity.

Case 3: $n \in {\mathbb{Z}}^{-}$. Then

$$
f\left( {nr} \right) = f\left( {\left( {- r} \right) + \left( {- r} \right) + \ldots + \left( {- r} \right)} \right) = f\left( {- r} \right) + \ldots + f\left( {- r} \right) = - nf\left( {- r} \right) = nf(r).
$$

Since the three cases cover all circumstances, we have proved the statement.

**(b)** Let $R,S$ be two arbitrary isomorphic rings and $\varphi$ be an isomorphism from $R$ to $S$. Let $n$ be the characteristic of $R$. So for every $a \in R$, $na = 0_{R}$. Since by (a),

$$
\varphi\left( {na} \right) = n\varphi(a),
$$

and $\varphi\left( 0_{R} \right) = 0_{S}$, we have $n\varphi(a) = 0_{S}$. Thus for any element $a$ in $R$, $n\varphi(a) = 0_{S}$. Since $\varphi$ is an isomorphism, for any element $s \in S$ there is some $r$ such that $\varphi(r) = s$, and $n\varphi(r) = 0_{S}$. So for every $s \in S$, $ns = 0_{S}$. Therefore $n$ is also the characteristic of $S$.

**(c)** $R$ and $S$ do not necessarily have the same characteristic. When we deduced that for all $a \in R$, $n\varphi(a) = 0_{S}$, we needed the surjectivity of $\varphi$ to ensure every element $s \in S$ is covered. Otherwise we can have $s \in S$ such that it is not covered, so that $ns \neq 0_{S}$ and $n$ is not the positive characteristic of $S$.

For a counterexample, take $R = {\mathbb{Z}}_{5}$, $S = \left\{ 0 \right\}$. The characteristic of $R$ is $5$ and the characteristic of $S$ is $0$, but $\varphi:R\rightarrow S$, sending $z\mapsto 0$, is also a ring homomorphism.

## 2. Linear transformations

Let $V$ be a vector space. Recall that a function $T:V\rightarrow V$ is a *linear transformation* if for all $v,w \in V$ and all $\lambda \in {\mathbb{R}}$, $T\left( {v + w} \right) = T(v) + T(w)$ and $T\left( {\lambda v} \right) = \lambda T(v)$.

\(a\) Show that the set of linear transformations from $V$ to $V$, with usual addition and composition of functions as multiplication, forms a ring.

\(b\) Consider the vector space ${\mathbb{R}}\lbrack x\rbrack$ and let $L\left( {{\mathbb{R}}\lbrack x\rbrack} \right)$ be the ring of linear transformations of ${\mathbb{R}}\lbrack x\rbrack$ as defined in the previous part. Consider $\frac{d}{dx} \in L\left( {{\mathbb{R}}\lbrack x\rbrack} \right)$. Show that there is an element $F \in L\left( {{\mathbb{R}}\lbrack x\rbrack} \right)$ such that $\left( \frac{d}{dx} \right)F = 1_{\{{L{({{\mathbb{R}}{\lbrack x\rbrack}})}}\}}$, but there is no element $G \in L\left( {{\mathbb{R}}\lbrack x\rbrack} \right)$ such that $G\left( \frac{d}{dx} \right) = 1_{\{{L{({{\mathbb{R}}{\lbrack x\rbrack}})}}\}}$.

**(a)** Denote the set of linear transformations from $V$ to $V$ as $L(V)$. Let $T_{1},T_{2},T_{3}$ be arbitrary transformations in $L(V)$.

\(1\) For every $v \in V$, $\left( {T_{1} + T_{2}} \right)(v) = T_{1}(v) + T_{2}(v)$ is also a linear transformation whose standard matrix is the sum of the standard matrices of $T_{1},T_{2}$. So $\left( {T_{1},T_{2}} \right) \in L(V)$, and $L(V)$ is closed under addition.

\(2\) For every $v \in V$,

$$
\left( {T_{1} + T_{2}} \right)(v) = T_{1}(v) + T_{2}(v) = T_{2}(v) + T_{1}(v) = \left( {T_{2} + T_{1}} \right)(v).
$$

So addition in $L(V)$ is commutative.

\(3\) For every $v \in V$,

$$
\left( {\left( {T_{1} + T_{2}} \right) + T_{3}} \right)(v) = T_{1}(v) + \left( {T_{2}(v) + T_{3}(v)} \right) = \left( {T_{1} + \left( {T_{2} + T_{3}} \right)} \right)(v),
$$

so addition in $L(V)$ is associative.

\(4\) Consider $T_{0}(v) = 0_{V}$ for all $v \in V$. Then $\left( {T_{1} + T_{0}} \right)(v) = \left( {T_{0} + T_{1}} \right)(v) = T_{1}(v)$, so $L(V)$ has an additive identity.

\(5\) For any $T \in L(V)$, consider $T'(v) = - T(v)$, which is also a linear transformation. Then $T(v) + T'(v) = 0$ for all $v \in V$, so every element in $L(V)$ has an additive inverse.

\(6\) For every $v \in V$, $\left( {T_{1} \circ T_{2}} \right)(v) = T_{1}\left( {T_{2}(v)} \right)$ is also a linear transformation whose standard matrix is the product of the standard matrices of $T_{1}$ and $T_{2}$. So $\left( {T_{1} \circ T_{2}} \right)(v) \in L(V)$, and $L(V)$ is closed under multiplication.

\(7\) For every $v \in V$,

$$
\left( {T_{1} \circ T_{2}} \right) \circ T_{3}(v) = \left( {T_{1} \circ T_{2}} \right)\left( {T_{3}(v)} \right) = T_{1}\left( {T_{2}\left( {T_{3}(v)} \right)} \right) = T_{1} \circ \left( {T_{2} \circ T_{3}(v)} \right),
$$

by associativity of linear transformations. So $L(V)$ is associative under multiplication.

\(8\) Consider $T_{e{(v)}} = v$. For every $v \in V$,

$$
T_{1} \circ T_{e{(v)}} = T_{1}\left( T_{e{(v)}} \right) = T_{1}(v),
$$
$$
T_{e} \circ T_{1}(v) = T_{e{({T_{1}{(v)}})}} = T_{1}(v).
$$

So $T_{e}$ is a multiplicative identity for $L(V)$. By (1)--(8), $L(V)$ is a ring under the stated addition and multiplication.

**(b)** (1) Choose $F \in L\left( {{\mathbb{R}}\lbrack x\rbrack} \right)$ such that

$$
\left( \frac{d}{dx} \right)F = 1_{\{{L{({{\mathbb{R}}{\lbrack x\rbrack}})}}\}}.
$$

Consider $F:{\mathbb{R}}\lbrack x\rbrack\rightarrow{\mathbb{R}}\lbrack x\rbrack$ defined by

$$
F\left( {p(x)} \right) = \int_{0}^{x}p(t)\, dt.
$$

By the fundamental theorem of Calculus,

$$
\left( \frac{d}{dx} \right)F\left( {p(x)} \right) = p(x).
$$

We have shown in (a) that $1_{\{{L{(V)}}\}} = T_{e}:V\rightarrow V$, so $\left( \frac{d}{dx} \right)F = 1_{\{{L{({{\mathbb{R}}{\lbrack x\rbrack}})}}\}}$. This shows the existence of $F$ by example.

\(2\) Now prove $G$ (left inverse of $\frac{d}{dx}$) does not exist. Assume for sake of contradiction that there exists $G \in L\left( {{\mathbb{R}}\lbrack x\rbrack} \right)$ such that

$$
G\left( {\left( \frac{d}{dx} \right)\left( {p(x)} \right)} \right) = p(x)
$$

for all $p(x) \in {\mathbb{R}}\lbrack x\rbrack$. Consider $g(x) = c$, so $\left( \frac{d}{dx} \right)g(x) = 0$, and $h(x) = d \neq c$, so $\left( \frac{d}{dx} \right)h(x) = 0$. Then

$$
G\left( {\left( \frac{d}{dx} \right)g(x)} \right) = c\Rightarrow G(0) = c,
$$
$$
G\left( {\left( \frac{d}{dx} \right)h(x)} \right) = d\Rightarrow G(0) = d.
$$

This violates the definition of $G$ as a function. So the contradiction proves that such $G$ does not exist.

## 3. Quadratic extensions

Let $d$ be an integer.

\(a\) Prove that ${\mathbb{Z}}\left\lbrack \sqrt{d} \right\rbrack = \left\{ a + b\sqrt{d}\  \middle| \ a,b \in {\mathbb{Z}} \right\}$ is an integral domain.

\(b\) Show that ${\mathbb{Z}}_{7}\left\lbrack \sqrt{3} \right\rbrack = \left\{ a + b\sqrt{3}\  \middle| \ a,b \in {\mathbb{Z}}_{7} \right\}$ is a field.

\(c\) Now assume $d$ is also positive and $p$ is a prime. Determine a necessary and sufficient condition for ${\mathbb{Z}}_{p{\lbrack\sqrt{d}\rbrack}}$ to be a field.

**(a)** First we prove this is a commutative ring. Let $x,y,z \in {\mathbb{Z}}\left\lbrack \sqrt{d} \right\rbrack$ be arbitrary. Write

$$
x = a_{1} + b_{1}\sqrt{d},\quad y = a_{2} + b_{2}\sqrt{d},\quad z = a_{3} + b_{3}\sqrt{d}
$$

for some $a_{1},a_{2},a_{3},b_{1},b_{2},b_{3} \in {\mathbb{Z}}$. Then

$$
x + y = \left( {a_{1} + a_{2}} \right) + \left( {b_{1} + b_{2}} \right)\sqrt{d} \in {\mathbb{Z}}\left\lbrack \sqrt{d} \right\rbrack,
$$
$$
\left( {x + y} \right) + z = \left( {a_{1} + a_{2} + a_{3}} \right) + \left( {b_{1} + b_{2} + b_{3}} \right)\sqrt{d} = x + \left( {y + z} \right),
$$
$$
x + y = y + x,\quad x + 0 = 0 + x,\quad - a_{1} - b_{1}\sqrt{d} \in {\mathbb{Z}}\left\lbrack \sqrt{d} \right\rbrack.
$$

Thus there is closure under $+$, associative and commutative $+$, an additive identity, and additive inverses. Also,

$$
xy = \left( {a_{1} + b_{1}\sqrt{d}} \right)\left( {a_{2} + b_{2}\sqrt{d}} \right) = \left( {a_{1}a_{2} + b_{1}b_{2}d} \right) + \left( {a_{1}b_{2} + a_{2}b_{1}} \right)\sqrt{d} \in {\mathbb{Z}}\left\lbrack \sqrt{d} \right\rbrack,
$$

and $yx = xy$. Expanding $\left( {xy} \right)z$ and $x\left( {yz} \right)$ gives

$$
a_{1}a_{2}a_{3} + b_{1}b_{2}a_{3}d + a_{1}b_{2}b_{3}d + b_{1}a_{2}b_{3}d + \left( {a_{1}b_{2}a_{3} + b_{1}a_{2}a_{3} + a_{1}a_{2}b_{3} + b_{1}b_{2}b_{3}d} \right)\sqrt{d},
$$

so multiplication is associative. Finally, $1x = x1 = x$, and direct expansion gives $x\left( {y + z} \right) = xy + xz$. By 1--9, ${\mathbb{Z}}\left\lbrack \sqrt{d} \right\rbrack$ is a commutative ring.

Now show it is an integral domain. Let $x = a + b\sqrt{d}$ and $y = m + n\sqrt{d}$ be nonzero elements, so at least one of $a,b$ and at least one of $m,n$ is not $0$. Then

$$
xy = yx = am + bnd + \left( {an + bm} \right)\sqrt{d}.
$$

Consider the four situations where one of $a,b$ and one of $m,n$ are zero. If $a = 0,n = 0$, then $bm \neq 0$; if $a = 0,m = 0$, then $bnd \neq 0$; if $b = 0,n = 0$, then $am \neq 0$; and if $b = 0,m = 0$, then $an \neq 0$. So $xy \neq 0$. Thus ${\mathbb{Z}}\left\lbrack \sqrt{d} \right\rbrack$ is an integral domain.

**(b)** Exactly the same as (a), except in modular arithmetic we can prove ${\mathbb{Z}}_{7}\left\lbrack \sqrt{3} \right\rbrack$ is a commutative ring. Now prove it is a field by proving any nonzero element has a multiplicative inverse. Let $x = a + b\sqrt{3} \in {\mathbb{Z}}_{7}\left\lbrack \sqrt{3} \right\rbrack$ be nonzero, so $a,b$ are not both $0$. Let $y = m + n\sqrt{3}$, where $m,n \in {\mathbb{Z}}_{7}$. Assume $xy = \lbrack 1\rbrack_{7}$. We solve

$$
am + 3bn = \lbrack 1\rbrack_{7},\quad an + bm = \lbrack 0\rbrack_{7}.
$$

Since ${\mathbb{Z}}_{7}$ is a field, $a^{\{{- 1}\}}$ always exists when $a \neq 0$. If $a \neq 0$, choose $n = - ba^{\{{- 1}\}}m$; then $an + bm = 0$, and the first equation becomes

$$
am = \lbrack 1\rbrack_{7} + 3b^{2}a^{\{{- 1}\}}m.
$$

Since ${\mathbb{Z}}_{7}$ is a field this always has a solution: $am = \lbrack 1\rbrack_{7}$ has a solution for $m = \lbrack 1\rbrack_{7}$, and $\lbrack 1\rbrack_{7} + 3b^{2}a^{\{{- 1}\}}m$ is some multiple of $\lbrack 1\rbrack_{7}$. Let $m = \lbrack 1\rbrack_{7}$ denote the solution; then $m = \ldots$ gives the solution to (1).

Case 2: assume $b \neq 0$. Same as case 1: $m = - b^{\{{- 1}\}}an$ is a solution of (2), and then we can always find a solution to (1), since $3bn = \lbrack 1\rbrack_{7} + b^{2}a^{\{{- 1}\}}n$ always has a solution which is a multiple of $\left( {3b} \right) \cdot n = \lbrack 1\rbrack_{7}$, guaranteed by ${\mathbb{Z}}_{7}$ as a field. Therefore the system always has a solution. So any nonzero element in ${\mathbb{Z}}_{7}\left\lbrack \sqrt{3} \right\rbrack$ has a multiplicative inverse; since it is a commutative ring, it is a field.

[**Source note (PDF pp. 10-11).** The handwritten argument for (b) introduces divisions by $a$ in a case that also discusses the $b \neq 0$ alternative, and uses several abbreviated equalities. The visible calculation is retained rather than silently repaired.]{style="display: inline-block"}

**(c)** The condition is that $d^{2}$ is not congruent to $0$ modulo $p$.

Like in (b), we must solve $\left( {d^{2}b} \right)n = \lbrack 1\rbrack_{p}$ when $a + b\sqrt{d}$ is a nonzero element in ${\mathbb{Z}}_{p{\lbrack\sqrt{d}\rbrack}}$. If $d^{2} = 0\operatorname{mod}p$, the equation $\lbrack 0\rbrack n = \lbrack 1\rbrack_{p}$ has no solution. Thus $d^{2} \neq 0\operatorname{mod}p$ is necessary. If $d^{2} \neq 0\operatorname{mod}p$, we can always solve the equation like in (b), so any element in ${\mathbb{Z}}_{p{\lbrack\sqrt{d}\rbrack}}$ always has a multiplicative inverse. Thus $d^{2} \neq p\operatorname{mod}p$ is sufficient. Therefore it is sufficient and necessary.

[**Source note (PDF p. 12).** The final sufficient-condition line reads "$d^{2} \neq p\left( {\operatorname{mod}p} \right)$," while the preceding displayed condition reads $d^{2} \neq 0\left( {\operatorname{mod}p} \right)$. Both visible forms are retained; the source does not reconcile them.]{style="display: inline-block"}

## 4. Zerodivisors in a polynomial ring

Let $R$ be a commutative ring in which $a^{2} = 0$ only if $a = 0$. Show that if $q(x) \in R\lbrack x\rbrack$ is a zerodivisor in $R\lbrack x\rbrack$, then if

$$
q(x) = a_{0}x^{n} + a_{1}x^{n - 1} + \ldots + a_{n},
$$

there is an element $b \neq 0$ in $R$ such that $ba_{0} = ba_{1} = \ldots = ba_{n} = 0$.

**Proof.** Assume $q(x) = a_{0}x^{n} + a_{1}x^{n - 1} + \ldots + a_{n}$ is a zerodivisor in $R\lbrack x\rbrack$. So at least one of $a_{0},a_{1},\ldots,a_{n}$ is nonzero and there exists

$$
p(x) = b_{0}x^{m} + b_{1}x^{m - 1} + \ldots + b_{m} \neq 0
$$

such that $q(x)p(x) = 0$. Thus

$$
a_{0}b_{0}x^{m + n} + \left( {a_{1}b_{0} + a_{0}b_{1}} \right)x^{m + n - 1} + \left( {a_{0}b_{2} + a_{1}b_{1} + a_{2}b_{0}} \right)x^{m + n - 2} + \ldots + a_{n}b_{m} = 0.
$$

Therefore $a_{0}b_{0} = 0$, so $b_{0}$ is a zerodivisor in $R$. Note that $b_{0} \neq 0$, since this is the term with highest degree of $p(x)$ by our assumption. Since $b_{0}^{2} \neq 0$ (for if $b_{0} \in R$, $a^{2} = 0$ iff $a = 0$), recursively $b_{0}^{2k} \neq 0$ for $k \in {\mathbb{Z}}$. Therefore all even powers of $b_{0}$ are nonzero.

Let $b_{0}^{2k + 1}$ be an arbitrary odd multiple of $b_{0}$. Assume it is $0$ for contradiction. Then

$$
b_{0}^{2k + 2} = b_{0}^{2k + 1} \cdot b_{0} = 0_{R}b_{0} = 0_{R},
$$

which contradicts $b_{0}^{2k} \neq 0_{R}$. So $b_{0}^{2k + 1} \neq 0$. Hence any multiple of $b_{0}$ is nonzero.

By the coefficient equation, $a_{1}b_{0} + a_{0}b_{1} = 0$, so $b_{0}\left( {a_{1}b_{0} + a_{0}b_{1}} \right) = 0$ and $b_{0}^{2}a_{1} = 0$. Likewise $a_{0}b_{2} + a_{1}b_{1} + a_{2}b_{0} = 0$ implies $b_{0}^{3}a_{2} = 0$. The pattern is

$$
b_{0}^{k}a_{k} = 0
$$

for $0 \leq k \leq n$. Multiply both sides by $b_{0}^{k}$ to get $b_{0}^{k + 1}a_{k} = 0$.

The source proves this by induction on the power of $x$. Base case $k = 0$: $b_{0}a_{0} = 0$. Inductive step: assume $b_{0}a_{0} = 0,b_{0}^{2}a_{1} = 0,\ldots,b_{0}^{k}a_{k - 1} = 0$. Since the term with $x^{k}$ is $\sum_{i + j = k;i \leq n;j \leq m}a_{i}b_{j} = 0$, multiplying by $b_{0}^{k}$ gives $b_{0}^{k + 1}a_{k} = 0$. Thus for every $0 \leq i \leq n$, $b_{0}^{n + 1}a_{i} = 0$. Combining that $b_{0}^{n + 1}$ is nonzero with this result finishes the proof: $b = b_{0}^{n + 1}$ is the required element.

