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
source: "notes/math/modern-algebra/homeworks/hw06-quotient-groups.typ"
subtitle: Typst-first mathematics notes
title: Modern Algebra
---
# Homework 6: prime and maximal ideals

*Personal finished homework transcription from 412-Hw-6-finished.pdf.*

## 1. Prime ideals

Recall: an ideal $P \neq R$ in a commutative ring $R$ is *prime* if $ab \in P$ implies $a \in P$ or $b \in P$.

\(a\) Prove that $P$ is prime if and only if $\frac{R}{P}$ is a domain.

\(b\) Use the first isomorphism theorem to show that the ideals $(x)$ and $\left( {2,x} \right)$ in ${\mathbb{Z}}\lbrack x\rbrack$ are prime ideals.

\(c\) Show that the ideal $\left( {4,x} \right)$ in ${\mathbb{Z}}\lbrack x\rbrack$ is not prime.

\(d\) Show that the ideal $\left( {2,\sqrt{10}} \right)$ in ${\mathbb{Z}}\left\lbrack \sqrt{10} \right\rbrack = \left\{ a + b\sqrt{10}\  \middle| \ a,b \in {\mathbb{Z}} \right\} \subset {\mathbb{R}}$ is prime.

\(e\) Is the ideal $(2)$ in ${\mathbb{Z}}\lbrack i\rbrack$ a prime ideal?

**Hint:** For the first one, consider the homomorphism ${\mathbb{Z}}\lbrack x\rbrack\rightarrow{\mathbb{Z}}$, "evaluate at zero."

**(a)** First we prove: if $P$ is prime, then $\frac{R}{P}$ is a domain.

Pf. Assume $P$ is prime. Let $a + P,b + P$ be two arbitrary elements in $\frac{R}{P}$ with

$$
\left( {a + P} \right)\left( {b + P} \right) = 0_{R} + P.
$$

Note that $0_{R} + P$ is the additive identity in $\frac{R}{P}$. Thus $ab + P = 0_{R} + P$, so $ab = ab - 0_{R} \in P$ by definition. Since $P$ is prime, $a = 0_{R}$ or $b = 0_{R}$. Thus $a + P = 0_{R} + P$ or $b + P = 0_{R} + P$, i.e. $a + P = 0_{\frac{R}{P}}$ or $b + P = 0_{\frac{R}{P}}$. So $\left( {a + P} \right)\left( {b + P} \right) = 0_{\frac{R}{P}}$ implies one factor is zero; $\frac{R}{P}$ is a domain.

Then we prove: if $\frac{R}{P}$ is a domain, then $P$ is prime.

Pf. Assume $\frac{R}{P}$ is a domain. Let $a,b \in R$ be arbitrary with $ab \in P$. So $ab - 0_{R} \in P$, whence

$$
ab + P = 0_{R} + P,\quad\left( {a + P} \right)\left( {b + P} \right) = 0_{\frac{R}{P}}.
$$

Since $\frac{R}{P}$ is a domain, $a + P = 0_{\frac{R}{P}}$ or $b + P = 0_{\frac{R}{P}}$; so $a - 0_{R} \in P$ or $b - 0_{R} \in P$, that is, $a \in P$ or $b \in P$. Therefore $P$ is prime. By (1), (2), we can conclude that $P$ is prime iff $\frac{R}{P}$ is a domain.

**(b)** Consider $\varphi:{\mathbb{Z}}\lbrack x\rbrack\rightarrow{\mathbb{Z}}$, sending $f(x)\mapsto f(0)$. Note that $\varphi$ is a homomorphism, and

$$
\ker(\varphi) = \left\{ ax\  \middle| \ a \in {\mathbb{Z}} \right\} = (x).
$$

Since $\forall z \in {\mathbb{Z}}$, $z \in {\mathbb{Z}}\lbrack x\rbrack$, so $\varphi(z) = z$, $\varphi$ is surjective. By the first isomorphism theorem,

$$
\frac{{\mathbb{Z}}\lbrack x\rbrack}{x} \cong {\mathbb{Z}}.
$$

Since $\mathbb{Z}$ is a domain, $\frac{{\mathbb{Z}}\lbrack x\rbrack}{x}$ is a domain since isomorphism preserves domain. Then by (a), $(x)$ is a prime ideal.

For $\left( {2,x} \right)$, consider the function $\psi:{\mathbb{Z}}\lbrack x\rbrack\rightarrow{\mathbb{Z}}_{2}$ defined by $f(x)\mapsto\left\lbrack {f(0)} \right\rbrack_{2}$. We can show this is a homomorphism. Let

$$
a = a_{0} + a_{1}x + \ldots + a_{n}x^{n},\quad b = b_{0} + b_{1}x + \ldots + b_{m}x^{m} \in {\mathbb{Z}}\lbrack x\rbrack
$$

be arbitrary. Then

$$
\psi\left( {a + b} \right) = \left\lbrack {a_{0} + b_{0}} \right\rbrack_{2} = \psi(a) + \psi(b),
$$
$$
\psi\left( {ab} \right) = \left\lbrack {a_{0}b_{0} + 0 + 0 + \ldots} \right\rbrack_{2} = \left\lbrack {a_{0}b_{0}} \right\rbrack_{2} = \psi(a)\psi(b),
$$

and $\psi(0) = 0_{{\mathbb{Z}}_{2}}$. Also, $\psi$ is surjective: $\psi(0) = \lbrack 0\rbrack_{2}$ and $\psi(1) = \lbrack 1\rbrack_{2}$. By the first isomorphism theorem,

$$
\frac{{\mathbb{Z}}\lbrack x\rbrack}{\ker}\psi \cong {\mathbb{Z}}_{2}.
$$

Since ${\mathbb{Z}}_{2}$ is a domain (since $2$ is prime), $\frac{{\mathbb{Z}}\lbrack x\rbrack}{\ker}\psi$ is a domain, so by (a), $\ker\psi$ is a prime ideal. Since

$$
\ker\psi = \left\{ kx + 2y\  \middle| \ k,y \in {\mathbb{Z}} \right\} = \left( {2,x} \right),
$$

$\left( {2,x} \right)$ is a prime ideal.

**(c)** Counterexample: consider $a = b = 2$. $2 \notin \left( {4,x} \right)$, but $2 \cdot 2 = 4 \in \left( {4,x} \right)$. Thus there are $a,b \notin P$ but $ab \in P$, showing $P$ is not prime.

**(d)** Let $x = a + b\sqrt{10}$, $y = c + d\sqrt{10}$ ($a,b,c,d \in {\mathbb{Z}}$) be arbitrary elements of ${\mathbb{Z}}\left\lbrack \sqrt{10} \right\rbrack$. Assume $xy \in \left( {2,\sqrt{10}} \right)$. So

$$
xy = 2m + \sqrt{10}n
$$

for some integers $m,n \in {\mathbb{Z}}$. Hence

$$
ac + 10bd = 2m,\quad bc + ad = n.
$$

Assume $a,c$ are both odd for contradiction. Then $ac$ is odd. Since $10bd$ is even, $ac + 10bd$ is odd, contradicting $ac + 10bd = 2m$. So at least one of $a,c$ is even. Without loss of generality, let $a$ be even, so $a = 2k$ for some $k \in {\mathbb{Z}}$. Therefore $x = 2k + b\sqrt{10} \in \left( {2,\sqrt{10}} \right)$. So $xy \in \left( {2,\sqrt{10}} \right)$ implies at least one of $x,y \in \left( {2,\sqrt{10}} \right)$. Thus $\left( {2,\sqrt{10}} \right)$ is a prime ideal in ${\mathbb{Z}}\left\lbrack \sqrt{10} \right\rbrack$.

**(e)** It is not a prime ideal. Counterexample: consider $x = y = 1 + i$. Then

$$
xy = 1 + 2i + i^{2} = 2i \in (2),
$$

but $\left( {xy} \right) \notin (2)$ according to the handwritten source. Therefore it is not a prime ideal.

[**Source note (PDF p. 2).** The displayed product gives $xy = 2i$, which is itself in $(2)$, while the next handwritten line says "but $\left( {xy} \right) \notin (2)$." The original inconsistency is explicitly retained.]{style="display: inline-block"}

## 2. Maximal ideals

We say that a proper ideal $I$ in a ring $R$ is *maximal* if whenever $I \subseteq J$ for some ideal $J$, we have $J = R$. For the next problems, assume $R$ is a commutative ring and $I$ is an ideal of $R$.

\(a\) Prove that if $I$ is a maximal ideal and $a \notin I$, then $a + I$ is a unit in $\frac{R}{I}$.

\(b\) Prove that $I$ is a maximal ideal if and only if $\frac{R}{I}$ is a field.

\(c\) Use the First Isomorphism Theorem to show that the non-principal ideal $\left( {2,x} \right)$ in ${\mathbb{Z}}\lbrack x\rbrack$ is a maximal ideal.

\(d\) Show that the ideal $\left( {4,x} \right)$ in ${\mathbb{Z}}\lbrack x\rbrack$ is not maximal.

\(e\) Show that the ideal $\left( {2,\sqrt{10}} \right)$ in ${\mathbb{Z}}\left\lbrack \sqrt{10} \right\rbrack$ is maximal.

\(f\) Show that $I = \{ a + bi:3 \mid a$ and $3 \mid b\}$ is a maximal ideal in ${\mathbb{Z}}\lbrack i\rbrack$.

**Hint:** Consider the homomorphism $f:{\mathbb{Z}}\lbrack x\rbrack\rightarrow{\mathbb{Z}}_{2}$ given by $f(x)\mapsto\left\lbrack {f(0)} \right\rbrack_{2}$. For $r + si \notin I$, then $3 \nmid r$ or $3 \nmid s$. Show that $3$ does not divide $r^{2} + s^{2} = \left( {r + si} \right)\left( {r - si} \right)$. Then show that an ideal containing $r + si$ and $I$ also contains $1$.

**(a)** Pf. We can construct a new ideal of $R$ by

$$
J = \left( {I,a} \right) = \left\{ i + ak\  \middle| \ i \in I,k \in R \right\}.
$$

We can prove this is an ideal:

\(1\) Let $x = i_{1} + ak_{1}$, $y = i_{2} + ak_{2}$ be arbitrary elements in $J$. Then

$$
x + y = \left( {i_{1} + i_{2}} \right) + a\left( {k_{1} + k_{2}} \right).
$$

Since $i_{1} + i_{2} \in I$, $x + y \in J$.

\(2\) Let $x = i + ak$ be an arbitrary element in $J$ and $r$ be an arbitrary element in $R$. Then

$$
rx = ri + r\left( {ak} \right) = ri + \left( {rk} \right)a.
$$

Since $ri \in I$, $k,r \in R$, $rx \in J$.

\(3\) $0 \in J$. So $J$ is an ideal of $R$. Note that $a \in J$. Since $I$ is a maximal ideal, $J = R$.

Thus for every $r \in R$, $r = i + ak$ for some $i \in I$ and $k \in R$. Consider $1 \in R$. $1 = i + ak$ for some $i \in I$. Thus $ak = 1 - i$. So

$$
ak + I = 1_{R} - i + I.
$$

Since $i \in I$, $- i + I = 0_{R} + I$. Thus

$$
\left( {a + I} \right)\left( {k + I} \right) = 1_{R} + I.
$$

Therefore $a + I$ is a unit in $\frac{R}{I}$.

**(b)** First we prove: if $I$ is a maximal ideal, then $\frac{R}{I}$ is a field. This proof is almost finished by (a). Since

$$
\frac{R}{I} = \left\{ a + I\  \middle| \ a \in R \right\},
$$
$$
a + I = 0_{\frac{R}{I}}iffa \in I.
$$

For all $a \notin I$, $a + I$ is a unit by (a). Thus every nonzero element in $\frac{R}{I}$ is a unit, so $\frac{R}{I}$ is a field.

Then we prove: if $\frac{R}{I}$ is a field, then $I$ is a maximal ideal. Assume $\frac{R}{I}$ is a field. Let $J$ be an ideal of $R$ such that $I \subseteq J \subseteq R$. Since $\frac{J}{I} \neq \varnothing$, let $a \in \frac{J}{I}$ be arbitrary. Since $\frac{R}{I}$ is a field, there exists $b + I \in \frac{R}{I}$ such that

$$
\left( {a + I} \right)\left( {b + I} \right) = 1_{R} + I.
$$

So $ab - 1_{R} \in I \subseteq J$. Since $J$ is an ideal, $ab \in J$, so $1_{R} \in J$. Therefore, for every $r \in R$, $1_{R} \cdot r = r \in J$ by the definition of ideal, hence $R \subseteq J$. Since $J \subseteq R$, $R = J$. Thus whenever $J \supseteq I$ is an ideal, $J = R$, and $I$ is maximal. By (1), (2), $I$ is maximal iff $\frac{R}{I}$ is a field.

**(c)** Consider $\psi:{\mathbb{Z}}\lbrack x\rbrack\rightarrow{\mathbb{Z}}_{2}$ defined by $f(x)\mapsto\left\lbrack {f(0)} \right\rbrack_{2}$. The calculation in 1(b) shows this is a homomorphism and it is surjective: $\psi(0) = \lbrack 0\rbrack_{2}$, $\psi(1) = \lbrack 1\rbrack_{2}$. By the First Isomorphism Theorem,

$$
\frac{{\mathbb{Z}}\lbrack x\rbrack}{\ker}\psi \cong {\mathbb{Z}}_{2}.
$$

Since ${\mathbb{Z}}_{2}$ is a field ($\lbrack 1\rbrack_{\{{\mathbb{Z}}_{2}\}}$ is its only nonzero element), $\frac{{\mathbb{Z}}\lbrack x\rbrack}{\ker}\psi$ is a field. So $\ker\psi = \left( {2,x} \right)$ is a maximal ideal.

**(d)** $\left( {2,x} \right) \neq {\mathbb{Z}}\lbrack x\rbrack$ is an ideal of ${\mathbb{Z}}\lbrack x\rbrack$. Note that

$$
\left( {2,x} \right) = \left\{ 2a + xb\  \middle| \ a,b \in {\mathbb{Z}}\lbrack x\rbrack \right\},
$$
$$
\left( {4,x} \right) = \left\{ 4a + xb\  \middle| \ a,b \in {\mathbb{Z}}\lbrack x\rbrack \right\} = \left\{ 2\left( {2a} \right) + xb\  \middle| \ a,b \in {\mathbb{Z}}\lbrack x\rbrack \right\} = \left\{ 2c + xb\  \middle| \ b \in {\mathbb{Z}},c = 2a,a \in {\mathbb{Z}}\lbrack x\rbrack \right\}.
$$

So $\left( {4,x} \right) \subsetneq \left( {2,x} \right)$. Therefore $\left( {4,x} \right)$ is not a maximal ideal in ${\mathbb{Z}}\lbrack x\rbrack$.

**(e)** Consider the quotient ring $\frac{{\mathbb{Z}}\left\lbrack \sqrt{10} \right\rbrack}{2,\sqrt{10}}$. Let $a + b\sqrt{10} + I$ be an arbitrary element in it. Since $b\sqrt{10} \in I$,

$$
a + b\sqrt{10} + I = a + I.
$$

Since $\forall k \in {\mathbb{Z}}$, $2k \in I$, denote the remainder when $a$ is divided by $2$ as $r$, so $r = 1$ or $2$ according to the source. Then $a + I = r + I$. Thus

$$
\frac{{\mathbb{Z}}\left\lbrack \sqrt{10} \right\rbrack}{2,\sqrt{10}} = \left\{ {1 + I,0 + I} \right\},
$$

which has only two elements. This is a field since it is a commutative ring and the only nonzero element has a multiplicative inverse which is itself: $\left( {1 + I} \right)$. Then $\forall a \in {\mathbb{Z}}\lbrack i\rbrack$, $a \in J$, so ${\mathbb{Z}}\lbrack i\rbrack \subseteq J$. Therefore the only ideal $J$ such that $I \subseteq J$ is $J = {\mathbb{Z}}\lbrack i\rbrack$. So $I$ is a maximal ideal.

[**Source note (PDF p. 3).** The quotient calculation concerns ${\mathbb{Z}}\left\lbrack \sqrt{10} \right\rbrack$, but its conclusion briefly says $\forall a \in {\mathbb{Z}}\lbrack i\rbrack$ and ${\mathbb{Z}}\lbrack i\rbrack \subseteq J$. This source-level ring mismatch is retained.]{style="display: inline-block"}

**(f)** Let $J$ be an ideal such that $I \subseteq J \subseteq {\mathbb{Z}}\lbrack i\rbrack$. So there exist some $r + si \in {\mathbb{Z}}\lbrack i\rbrack$ such that either $3 \nmid r$ or $3 \nmid s$, or both. Since $J$ is an ideal,

$$
\left( {r + si} \right)\left( {r - si} \right) = r^{2} + s^{2} \in J.
$$

Since either $3 \nmid r$ or $3 \nmid s$, $r \equiv a\operatorname{mod}3$, $s \equiv b\operatorname{mod}3$, where $a,b = 0$ or $1$ or $2$ and at least one of $a,b$ is not $0$. Thus

$$
r^{2} + s^{2} \equiv a^{2} + b^{2}\operatorname{mod}3 \equiv 1\operatorname{mod}3
$$

or $2\operatorname{mod}3.$

So $3 \nmid r^{2} + s^{2}$; $\gcd\left( {r^{2} + s^{2},3} \right) = 1$. By Bézout, $xr^{2} + sy + 3y = 1$ for some $x,y \in {\mathbb{Z}}$ according to the handwritten line. Since $J$ is an ideal, $xr^{2} + s^{2} \in J$, and since $I \subseteq J$, $3y \in J$, so $xr\left( {r^{2} + s^{2}} \right) + 3y \in J$. Thus $1 \in J$. Hence $J = {\mathbb{Z}}\lbrack i\rbrack$, so $I$ is a maximal ideal.

[**Source note (PDF pp. 3-4).** The Bézout combination is handwritten as $xr^{2} + sy + 3y = 1$ and later as $xr\left( {r^{2} + s^{2}} \right) + 3y$; these factors differ visibly. They are transcribed rather than silently corrected.]{style="display: inline-block"}

## 3. Polynomial rings in many variables

Let $R_{n} = {\mathbb{Q}}\left\lbrack {x_{1},x_{2},\ldots,x_{n}} \right\rbrack$ be a polynomial ring in variables $x_{1},x_{2},\ldots,x_{n}$; that is, it contains all polynomials in finite terms that involve these variables.

\(a\) Let $f_{1},f_{2},\ldots,f_{k}$ be polynomials in $R_{n}$. Prove that

$$
\left\langle {f_{1},f_{2},\ldots,f_{k}} \right\rangle = \left\{ g_{1}f_{1} + g_{2}f_{2} + \ldots + g_{k}f_{k}\  \middle| \ g_{1},g_{2},\ldots,g_{k} \in R_{n} \right\}
$$

is an ideal of $R_{n}$.

\(b\) Consider the ring homomorphism

$$
\varphi:R_{4}\rightarrow{\mathbb{Q}}\left\lbrack {t_{1},t_{2}} \right\rbrack,\quad\varphi\left( x_{1} \right) = t_{1}^{3},\quad\varphi\left( x_{2} \right) = t_{1}^{2}t_{2},\quad\varphi\left( x_{3} \right) = t_{1}t_{2}^{2},\quad\varphi\left( x_{4} \right) = t_{2}^{3}.
$$

\(c\) Explain why the above description fully determines $\varphi(f)$ for each polynomial $f \in R_{4}$.

\(d\) It is given to you that $\ker(\varphi) = \left\langle {f_{1},f_{2},f_{3}} \right\rangle$ for some polynomials $f_{1},f_{2},f_{3} \in R_{4}$. Find $f_{1},f_{2},f_{3}$. Hint: part (e).

\(e\) Let $h_{1},h_{2},h_{3}$ be the $2 \times 2$ minors of the matrix $M = \begin{pmatrix}
x_{1} & x_{2} & x_{3} \\
x_{2} & x_{3} & x_{4}
\end{pmatrix}$. Consider the ideal $I = \left\langle {h_{1},h_{2},h_{3}} \right\rangle$. Show that $I$ does not change if one applies elementary row operations to the matrix $M$.

\(f\) Take the ideal $J = \left\langle {x_{1}x_{4} - x_{2}x_{3}} \right\rangle$ in $R_{4}$. Express $J$ as kernel of some ring homomorphism. You know such a homomorphism exists by WSH 10. You do not need to prove that the proposed homomorphism has $J$ as its kernel.

\(g\) Prove that the ideal $J$ is not a maximal ideal.

**(a)** Select arbitrary

$$
x = g_{1}f_{1} + g_{2}f_{2} + \ldots + g_{k}f_{k},\quad y = h_{1}f_{1} + h_{2}f_{2} + \ldots + h_{k}f_{k} \in \left\langle {f_{1},f_{2},\ldots,f_{k}} \right\rangle,
$$

where $g_{1},\ldots,g_{k},h_{1},\ldots,h_{k} \in R_{n}$. Then

$$
x + y = \left( {g_{1} + h_{1}} \right)f_{1} + \ldots + \left( {g_{k} + h_{k}} \right)f_{k}.
$$

Since $g_{i} + h_{i} \in R_{n}$, $x + y \in \left\langle {f_{1},\ldots,f_{k}} \right\rangle$.

Select arbitrary $x = g_{1}f_{1} + \ldots + g_{k}f_{k} \in \left\langle {f_{1},\ldots,f_{k}} \right\rangle$ and $h \in R_{n}$. Then

$$
xh = \left( {hg_{1}} \right)f_{1} + \left( {hg_{2}} \right)f_{2} + \ldots + \left( {hg_{k}} \right)f_{k} \in \left\langle {f_{1},\ldots,f_{k}} \right\rangle.
$$

Also $0 = 0f_{1} + 0f_{2} + \ldots + 0f_{k} \in \left\langle {f_{1},\ldots,f_{k}} \right\rangle$. By (1), (2), (3), $\left\langle {f_{1},\ldots,f_{k}} \right\rangle$ is an ideal in $R_{n}$.

**(c)** For all $c \in R_{4}$, $\varphi(c) = c\varphi\left( 1_{\{ R_{4}\}} \right) = c\varphi\left( 1_{\{ R_{4}\}} \right) = c$; the source labels this "constant." For an arbitrary element $f \in R_{4}$,

$$
\begin{matrix}
f & {= a_{0} + a_{1}x_{1} + a_{2}x_{1}^{2} + \ldots + a_{i}x_{1}^{i}} \\
 & {+ b_{0} + b_{1}x_{2} + b_{2}x_{2}^{2} + \ldots + b_{j}x_{2}^{j}} \\
 & {+ c_{0} + c_{1}x_{3} + \ldots + c_{m}x_{3}^{m}} \\
 & {+ d_{0} + d_{1}x_{4} + \ldots + d_{n}x_{4}^{n}.}
\end{matrix}
$$

Thus

$$
\begin{matrix}
{\varphi(f)} & {= \left( {a_{0} + b_{0} + c_{0} + d_{0}} \right) + a_{1}\varphi\left( x_{1} \right) + \ldots + a_{i}\varphi\left( x_{1}^{i} \right)} \\
 & {+ b_{1}\varphi\left( x_{2} \right) + \ldots + b_{j}\varphi\left( x_{2}^{j} \right)} \\
 & {+ \ldots + d_{n}\varphi\left( x_{4}^{n} \right).}
\end{matrix}
$$

Since a homomorphism preserves addition and multiplication, each term is either constant or some constant multiplied by some multiple of a power of $\varphi\left( x_{1} \right),\ldots,\varphi\left( x_{4} \right)$. Hence $\varphi(f)$ is fully determined for each $f \in R_{4}$.

**(d)** Consider

$$
f_{1} = x_{1}x_{3} - x_{2}^{2},\quad f_{2} = x_{2}x_{4} - x_{3}^{2},\quad f_{3} = x_{1}x_{4} - x_{2}x_{3}.
$$

Then $\varphi\left( f_{1} \right) = \varphi\left( f_{2} \right) = \varphi\left( f_{3} \right) = 0$. For arbitrary

$$
a = g_{1}f_{1} + g_{2}f_{2} + g_{3}f_{3} \in \left\langle {f_{1},f_{2},f_{3}} \right\rangle,
$$
$$
\varphi(a) = \varphi\left( g_{1} \right) \cdot 0 + \varphi\left( g_{2} \right) \cdot 0 + \varphi\left( g_{3} \right) \cdot 0 = 0.
$$

So the source identifies $\ker\varphi = \left\langle {x_{1}x_{3} - x_{2}^{2},x_{2}x_{4} - x_{3}^{2},x_{1}x_{4} - x_{2}x_{3}} \right\rangle$.

**(e)**

$$
h_{1} = \det\left( \begin{pmatrix}
x_{1} & x_{2} \\
x_{2} & x_{3}
\end{pmatrix} \right) = x_{1}x_{3} - x_{2}^{2},
$$
$$
h_{2} = \det\left( \begin{pmatrix}
x_{2} & x_{3} \\
x_{3} & x_{4}
\end{pmatrix} \right) = x_{2}x_{4} - x_{3}^{2},
$$
$$
h_{3} = \det\left( \begin{pmatrix}
x_{1} & x_{3} \\
x_{2} & x_{4}
\end{pmatrix} \right) = x_{1}x_{4} - x_{2}x_{3}.
$$

Thus

$$
I = \left\langle {h_{1},h_{2},h_{3}} \right\rangle = \left\{ g_{1}\left( {x_{1}x_{3} - x_{2}^{2}} \right) + g_{2}\left( {x_{2}x_{4} - x_{3}^{2}} \right) + g_{3}\left( {x_{1}x_{4} - x_{2}x_{3}} \right)\  \middle| \ g_{1},g_{2},g_{3} \in R_{4} \right\}.
$$

\(1\) Swapping the two rows does not change $I$. By swapping the rows,

$$
h_{1'} = x_{2}^{2} - x_{1}x_{3},\quad h_{2'} = x_{3}^{2} - x_{2}x_{4},\quad h_{3'} = x_{2}x_{3} - x_{1}x_{4}.
$$

So

$$
I' = \left\{ g_{1}\left( {x_{1}x_{3} - x_{2}^{2}} \right) - g_{2}\left( {x_{2}x_{4} - x_{3}^{2}} \right) - g_{3}\left( {x_{1}x_{4} - x_{2}x_{3}} \right)\  \middle| \ g_{1},g_{2},g_{3} \in R_{4} \right\}.
$$

Since $g_{1}, - g_{2}, - g_{3} \in I$ according to the handwritten line, $I' = I$.

\(2\) Multiplying a row by a nonzero constant does not change $I$. WLOG assume we multiply row one by $a \in {\mathbb{Q}}$, $a \neq 0$. Then

$$
h_{1'} = a\left( {x_{1}x_{3} - x_{2}^{2}} \right),\quad h_{2'} = a\left( {x_{2}x_{4} - x_{3}^{2}} \right),\quad h_{3'} = a\left( {x_{1}x_{4} - x_{2}x_{3}} \right).
$$

So $I' = I$ since $a \neq 0\Rightarrow\left( {\frac{1}{a} \in {\mathbb{Q}}iffa \in {\mathbb{Q}}} \right)$, hence $\frac{1}{a} \in R_{4}$ iff $a \in R_{4}$, and multiplying generators by $a$ and $\frac{1}{a}$ gives both containments.

\(3\) Adding some nonzero multiple of a row to another does not change $I$. WLOG add a multiple of the second row to the first:

$$
\begin{pmatrix}
{x_{1} + bx_{2}} & {x_{2} + bx_{3}} & {x_{3} + bx_{4}} \\
x_{2} & x_{3} & x_{4}
\end{pmatrix},\quad b \neq 0 \in R.
$$

Then $h_{1'} = x_{1}x_{3} - x_{2}^{2} = h_{1}$, $h_{2'} = x_{2}x_{4} - x_{3}^{2} = h_{2}$, and $h_{3'} = x_{2}x_{3} - x_{1}x_{4} = - h_{3}$. Therefore $I' = I$. By (1), (2), (3), $I$ does not change if one applies elementary row operations to $M$.

[**Source note (PDF p. 4).** In the row-swap argument, the source says "$g_{1}, - g_{2}, - g_{3} \in I$," although those are coefficient polynomials. It is retained verbatim in substance.]{style="display: inline-block"}

**(f)** Consider $\varphi:R_{4}\rightarrow{\mathbb{Q}}\left\lbrack {x_{2},x_{3}} \right\rbrack$ defined by

$$
\varphi\left( x_{1} \right) = x_{2},\quad\varphi\left( x_{2} \right) = x_{2},\quad\varphi\left( x_{3} \right) = x_{3},\quad\varphi\left( x_{4} \right) = x_{3}.
$$

For the same reason as in (c), $\varphi$ is determined by (1). Then

$$
J = \left\langle {x_{1}x_{4} - x_{2}x_{3}} \right\rangle = \left\{ g\left( {x_{1}x_{4} - x_{2}x_{3}} \right)\  \middle| \ g \in R_{4} \right\}
$$

is $\ker\varphi$ because $x_{1}x_{4} - x_{2}x_{3} = 0$. This homomorphism is well-defined, "easy to see" because (1) $\varphi(1) = 1$, (2) $\varphi$ preserves addition in $R_{4}$, and (3) $\varphi$ preserves multiplication in $R_{4}$, as seen from the polynomial addition and multiplication operations.

**(g)** Consider $K = \left\langle {x_{4},x_{2}} \right\rangle$ as an ideal of $R_{4}$. So $x_{1}x_{4} - x_{2}x_{3} \in K$. Select arbitrary $g \in R_{4}$; by property of ideal, $g\left( {x_{1}x_{4} - x_{2}x_{3}} \right) \in K$. Thus every element of $J$ is in $K$, so $J \subseteq K$.

But $x_{4} + x_{2} \in K$ while $x_{4} + x_{2} \notin J$. Also $x_{1} + x_{3} \in R_{4}$ but $x_{1} + x_{3} \notin K$, so $K \neq R_{4}$. Thus $J \neq K \subsetneq R_{4}$, and by definition $J$ is not a maximal ideal.

