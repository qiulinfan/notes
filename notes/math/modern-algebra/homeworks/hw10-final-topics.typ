#import "../../toolchain/math-aliases.typ": *

#let Set(..args) = $lr(brace.l, #args.pos().join(", "), brace.r)$
#let bracket(..args) = $⟨#args.pos().join(", ")⟩$
#let pmat(..args) = math.mat(..args, delim: "(")
#let to = math.arrow.r
#let approx = math.approx
#let intersect = math.inter
#let normal = math.triangle.l
#let ker = math.op("ker")
#let cdots = math.dots.c
#let align(..args) = args.pos().join()

= Homework 10

== 1. Products of normal subgroups

Let $G$ be a group and let $N$ and $K$ be normal subgroups of $G$.

(a) Show that $N intersect K normal K$.

(b) Prove that $N K=Set(n k | n in N, k in K)$ is a normal subgroup of $G$.

(c) Prove that $N normal N K$.

(d) Prove that the function $f:K to N K/N$ given by $f(k)=N k$ is a surjective homomorphism with kernel $K intersect N$.

(e) Prove that $K/(N intersect K) approx N K/N$.

=== (a)

*Proof.* Take arbitrary $g in K$ and $h in N intersect K$. Since $N normal G$, $g h g^(-1) in N$, and since $g in K$ and $K normal G$, $g h g^(-1) in K$. Hence $g h g^(-1) in N intersect K$. Therefore for every $g in K$,

$
g(N intersect K)g^(-1) subset N intersect K.
$

By Theorem 8.11, $N intersect K normal K$.

=== (b)

Take arbitrary $g in G$ and $h in N K$. Then $h=n k$ for some $n in N$ and $k in K$. Thus

$
g h g^(-1)=g n k g^(-1)=(g n g^(-1))(g k g^(-1)).
$

Since $K,N$ are normal, $g N=N g$ and $g K=K g$, so $g n=n' g$ for some $n' in N$ and $k g^(-1)=g^(-1) k'$ for some $k' in K$. Consequently

$
g h g^(-1)=(g n)(k g^(-1))=n'(g g^(-1))k'=n' k' in N K.
$

Therefore for every $g in G$, $g N K g^(-1) subset N K$. Hence $N K normal G$.

=== (c)

Take arbitrary $n in N$ and $h in N K$. Then $h=n_2 k$ for some $n_2 in N$ and $k in K$. Hence

$
h n h^(-1)=n_2 k n(n_2 k)^(-1)=n_2 k n k^(-1)n_2^(-1).
$

Since $N normal G$, $k N=N k$, so $k n=n' k$ for some $n' in N$ and $n_2 n'=n'' n_2$ for some $n'' in N$. Therefore

$
h n h^(-1)=n''(n_2 k k^(-1)n_2^(-1))=n'' in N.
$

So for every $h in N K$, $h N h^(-1) subset N$. Therefore $N normal N K$.

=== (d)

Since $N normal N K$, $N K/N$ is a well-defined quotient group. For $f:K to N K/N$ given by $k mapsto N k$, let $h$ be an arbitrary element of $N K/N$. Then $h=N(n k)$ for some $n k in N K$, where $n in N$ and $k in K$. By definition,

$
N(n k)=Set(n^* n k | n^* in N)=Set((n^* n) k | n^* in N)=Set(n^* k | n^* in N)=N k.
$

Thus $f(k)=N k=N(n k)=h$, so $f$ is surjective.

Since the identity of $N K/N$ is $N$,

$
f(k)=N k=N ⇔ k in N.
$

As $k in K$ for sure, $ker(f)=N intersect K$.

=== (e)

By the First Isomorphism Theorem,

$
K/ker(f) approx N K/N,
$

and since $ker(f)=N intersect K$,

$
K/(N intersect K) approx N K/N.
$

== 2. Quotients of familiar groups

In the following problem, it may help to use the First Isomorphism Theorem.

(a) Prove that $bb(C)/bb(Z) approx bb(C)^times$ (hint: consider the function $e^(2 pi i z)$).

(b) Prove that $bb(R)/bb(Z) approx S^1$.

(c) Prove that the subset

$
N=Set(e,(1,2)(3,4),(1,3)(2,4),(1,4)(2,3)) subset A_4
$

is a normal subgroup. What familiar group is $A_4/N$ isomorphic to?

=== (a)

*Proof.* Consider the function $f:bb(C) to bb(C)^times$ sending $z$ to $e^(2 pi i z)$.

1. $f$ is a group homomorphism. For $z_1,z_2 in bb(C)$,

$
f(z_1+z_2)=e^(2 pi i(z_1+z_2))=e^(2 pi i z_1)e^(2 pi i z_2)=f(z_1)f(z_2).
$

2. $f$ is surjective. Since every $z' in bb(C)^times$ is a nonzero complex number, $z'=k e^(2 pi i r)$ for some $r in bb(R)$ and $k in bb(R)^+$ by Euler's formula. Let $z=r-i ln k$. Then

$
f(z)=e^(2 pi i(r-i ln k))=z'.
$

3. Note that $f(z)=e_(bb(C)^times)$ if and only if $z in bb(Z)$, so $ker(f)=bb(Z)$.

By the First Isomorphism Theorem,

$
bb(C)/bb(Z) approx bb(C)^times.
$

=== (b)

Still consider the map $f:bb(R) to S^1$ sending

$
r mapsto e^(2 pi i r).
$

1. $f$ is a group homomorphism. For $r_1,r_2 in bb(R)$,

$
f(r_1+r_2)=e^(2 pi i(r_1+r_2))=e^(2 pi i r_1)e^(2 pi i r_2)=f(r_1)f(r_2).
$

2. $f$ is surjective, since for every $s in S^1$, $s=e^(2 pi i r)$ for some $r in bb(R)$.

3. $f(r)=e_(S^1)=1$ if and only if $r in bb(Z)$, because for $r in bb(Z)$,

$
e^(2 pi i r)=cos(2 pi r)+i sin(2 pi r)=cos(2 pi r)=1.
$

So $ker(f)=bb(Z)$. By the First Isomorphism Theorem,

$
bb(R)/bb(Z) approx S^1.
$

=== (c)

First, the subset $N$ is a subgroup of $A_4$: $e in N$, and

$
e^2=e,
quad ((1,2)(3,4))^2=e,
quad ((1,3)(2,4))^2=e,
quad ((1,4)(2,3))^2=e,
$

so $A_4$ is closed under inverse as written in the source.

Then we show $N normal A_4$. Let $sigma in A_4$ be an arbitrary permutation and $t in N$ an arbitrary element. Write

$
t=(sigma(a),sigma(b))(sigma(c),sigma(d))
$

for $a,b,c,d$ respectively representing a unique number in $Set(1,2,3,4)$. Then

$
sigma^(-1)t sigma=pmat(a,b,c,d;sigma(a),sigma(b),sigma(c),sigma(d)) pmat(sigma(b),sigma(a),sigma(d),sigma(c);b,a,d,c)=pmat(a,b,c,d;b,a,d,c).
$

Thus $sigma^(-1)t sigma=(a,b)(c,d) in N$. Therefore for every $sigma in A_4$, $sigma N sigma^(-1) subset N$. By Theorem 8.11, $N normal A_4$.

By Lagrange's Theorem,

$
abs(A_4/N)=abs(A_4)/abs(N)=12/4=3.
$

So $A_4/N approx bb(Z)_3$, since every finite group of order $3$ is isomorphic to $bb(Z)_3$.

== 3. Groups of order $p^2$

Let $p$ be a prime number. The goal of this problem is to prove that any group $G$ of order $p^2$ is abelian.

(a) Let $G$ act on itself by the conjugacy action defined in the previous problem set. Prove that $h in Z(G)$ if and only if the orbit (the conjugacy class) of $h$ has exactly one element.

(b) Use the Class Equation to deduce that $p$ divides $abs(Z(G))$. Thus there are two possibilities: $abs(Z(G))=p$ or $abs(G)$; in the latter case $G$ is abelian.

(c) Suppose that $abs(Z(G))=p$ and let $g in G$ with $g !in Z(G)$. Define $bracket(Z(G),g)$ to be the group generated by $g$ and every element of $Z(G)$. Show that $bracket(Z(G),g)$ is abelian.

(d) Under the same assumptions, show that $bracket(Z(G),g)=G$.

(e) Deduce in one line that $G$ is abelian.

(f) Give an example of a group with $p^3$ elements that is not abelian.

(g) Use the Class Equation to conclude that any $p$-group $H$ satisfies $p | abs(Z(H))$.

=== (a)

*Proof.*

$
O(h)=Set(g^(-1) h g | g in G).
$

Assume $h in Z(G)$. Then for every $g in G$, $g h=h g$, hence

$
O(h)=Set(g h g^(-1) | g in G)=Set(h).
$

Thus $abs(O(h))=1$. Conversely, assume $abs(O(h))=1$. Then for every $g in G$, $g^(-1) h g=h$, since $h in O(h)$, giving $h g=g h$. Hence $h in Z(G)$. Therefore $abs(O(h))=1$ if and only if $h in Z(G)$.

=== (b)

Let $g_1,...,g_n$ be representatives of the distinct conjugacy classes of $G$ not contained in $Z(G)$. The Class Equation is

$
abs(G)=abs(Z(G))+sum_(i=1)^n " the orbit size of " g_i.
$

Since $p$ is prime and $abs(G)=p^2$, every subgroup of $G$ can only have size $1,p,$ or $p^2$. For each $i$, $C_G(g_i)$ is a subgroup of $G$ with more than one element, so $abs(C_G(g_i))=p$ or $p^2$. Hence

$
p | sum_(i=1)^n " the orbit size of " g_i,
$

and $p | abs(Z(G))$. Thus either $abs(Z(G))=p$ or $abs(Z(G))=p^2=abs(G)$.

=== (c)

Let

$
z_1^(n_1)z_2^(n_2) cdots g^(n_j) in bracket(Z(G),g),
$

and let

$
g_1^(m_1)g_2^(m_2) cdots g_i^(m_i)g^m
$

be two arbitrary elements. Then

$
align(
 &(z_1^(n_1)z_2^(n_2) cdots g^(n_j))(g_1^(m_1)g_2^(m_2) cdots g_i^(m_i)g^m) \
 &= (g_1^(m_1)z_1^(n_1)z_2^(n_2) cdots g^(n_j))(g_2^(m_2)cdots g_i^(m_i)g^m) \
 & quad= dots \
 &= (g_1^(m_1)g_2^(m_2)cdots g_i^(m_i)g^m)(z_1^(n_1)z_2^(n_2)cdots g^(n_j)).
)
$

Since every element of $Z(G)$ commutes with each other and $g$, $bracket(Z(G),g)$ is abelian.

=== (d)

Every subgroup of $G$ can only have order $1,p,$ or $p^2$. Since

$
abs(bracket(Z(G),g))>=abs(Z(G))+1=p+1,
$

we have $abs(bracket(Z(G),g))=p^2=abs(G)$. So $bracket(Z(G),g)=G$.

=== (e)

Since $bracket(Z(G),g)=G$ by (d) and $bracket(Z(G),g)$ is abelian by (c), $G$ is abelian.

=== (f)

$abs(D_4)=8=2^3$, but $D_4$ is not abelian.

=== (g)

Let $H$ be a $p$-group, so $abs(H)=p^k$ for some prime $p$ and $k in bb(Z)^+$. By the Class Equation,

$
abs(H)=abs(Z(H))+sum_(i=1)^n " the orbit size of " g_i.
$

Every subgroup of $H$ can only have size $1,p,p^2,...,p^k$. For each $i$, $C_H(g_i)$ is a subgroup of $H$ with more than one element, so $abs(O(g_i))=p,p^2,...,p^k$. Thus

$
p | sum_(i=1)^n " the orbit size of " g_i,
$

and hence $p | abs(Z(H))$.

== 4. Finite abelian groups

*Theorem 9.7: Fundamental Structure Theorem for Finite Abelian Groups.* Let $G$ be a finite abelian group. Then $G$ is isomorphic to a group of the form

$
bb(Z)_(p_1^(a_1)) times bb(Z)_(p_2^(a_2)) times bb(Z)_(p_3^(a_3)) times dots times bb(Z)_(p_n^(a_n)),
$

where $p_1,p_2,...,p_n$ are (not necessarily distinct) prime numbers. Moreover, the product is unique, up to re-ordering the factors.

(a) Suppose $G$ is abelian and has order $8$. Use the Structure Theorem to show that, up to isomorphism, $G$ must be isomorphic to one of three possible groups, each a product of cyclic groups of prime-power order.

(b) Determine the number of abelian groups of order $18$, up to isomorphism.

(c) For $p$ prime, how many isomorphism types of abelian groups of order $p^4$?

(d) If an abelian group of order $100$ has no element of order $4$, prove that $G$ contains a Klein 4-group.

=== (a)

Since the prime factorization of $8=2^3$ and $G$ is abelian with $abs(G)=8$, the Structure Theorem gives

$
G approx bb(Z)_2 times bb(Z)_2 times bb(Z)_2,
quad "or "
G approx bb(Z)_(2^2) times bb(Z)_2,
quad "or "
G approx bb(Z)_(2^3).
$

=== (b)

$18=3^2 times 2$. The possible isomorphism types are

$
bb(Z)_9 times bb(Z)_2,
quad bb(Z)_3 times bb(Z)_3 times bb(Z)_2.
$

There are two possible isomorphism types.

=== (c)

There are five isomorphism types:

$
align(
  p times p times p times p &: bb(Z)_p times bb(Z)_p times bb(Z)_p times bb(Z)_p, \
  (p times p times p) times p &: bb(Z)_(p^2) times bb(Z)_p times bb(Z)_p, \
  (p times p^2) times p &: bb(Z)_(p^3) times bb(Z)_p, \
  (p times p times p times p) &: bb(Z)_(p^4), \
  (p times p) times (p times p) &: bb(Z)_(p^2) times bb(Z)_(p^2).
)
$

=== (d)

The prime factorization of $100$ is $100=2^2 times 5^2$. Since $G$ is abelian and $abs(G)=100$,

$
G approx bb(Z)_2 times bb(Z)_(5^2),
quad "or "
bb(Z)_2 times bb(Z)_2 times bb(Z)_(5^2),
quad "or "
bb(Z)_2 times bb(Z)_2 times bb(Z)_5 times bb(Z)_5.
$

The first is impossible since $(1_4,0_25)$ is an order-$4$ element in it. Therefore

$
G approx bb(Z)_2 times bb(Z)_2 times bb(Z)_5
quad "or "
G approx bb(Z)_2 times bb(Z)_2 times bb(Z)_5 times bb(Z)_5.
$

For the first, $bb(Z)_2 times bb(Z)_2 times 0_25$ is a subgroup which is a Klein 4-group. For the second, $bb(Z)_2 times bb(Z)_2 times 0_5 times 0_5$ is a subgroup which is a Klein 4-group.

== Source notes

The handwritten argument in Problem 2(c) labels closure under inverse immediately after listing the elements of $N$; this was retained. In Problem 4(d), the source’s product notation mixes $ℚ_5$ and $ℚ_5^2$ factors; the typeset form preserves the listed group decompositions and the stated Klein-four subgroups.
