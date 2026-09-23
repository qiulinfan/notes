#import "../../toolchain/math-aliases.typ": *

#let Set(..args) = $lr(brace.l, #args.pos().join(", "), brace.r)$
#let bracket(..args) = $⟨#args.pos().join(", ")⟩$
#let pmat(..args) = math.mat(..args, delim: "(")
#let to = math.arrow.r
#let approx = math.approx
#let Aut = math.op("Aut")
#let GL = math.op("GL")
#let cdots = math.dots.c
#let align(..args) = args.pos().join()

= Homework 8

== 1. Automorphisms

An isomorphism from a group $G$ to itself is called an _automorphism_. Let $Aut(G)$ denote the set of automorphisms of a group $G$.

(a) Let $f:G_1 to G_2$ and $g:G_2 to G_3$ be group homomorphisms. Prove that $g circle f:G_1 to G_3$ is a group homomorphism.

(b) Let $f:G to H$ be a group isomorphism. Prove that the inverse function $f^(-1):H to G$ is also a group isomorphism.

(c) Prove that $Aut(G)$ is a group with operation given by composition.

(d) Prove that $Aut(bb(Z)) approx bb(Z)_2$.

(e) Prove that $Aut(bb(Z)_2 times bb(Z)_2) approx S_3$.

=== (a)

For $a,b in G_1$,

$
align(
  (g circle f)(a star_1 b)
    &=g(f(a) star_2 f(b)) && "since " f " is a group homomorphism" \
    &=g(f(a)) star_3 g(f(b)) && "since " g " is a group homomorphism" \
    &=(g circle f)(a) star_3 (g circle f)(b).
)
$

So $g circle f$ is a group homomorphism.

=== (b)

Select arbitrary $A,B in H$. Since $f$ is surjective, there are $a,b in G$ such that $f(a star_G b)=A star_H B$, $f^(-1)(B)=b$, and $f^(-1)(A)=a$. Hence

$
f^(-1)(A star_H B)=a star_G b=f^(-1)(B) star_G f^(-1)(A).
$

Therefore $f^(-1)$ is a group homomorphism. And $f^(-1)$ is an isomorphism since $f$ and $f^(-1)$ are bijective.

=== (c)

1. The operation is associative.

For $f,g in Aut(G)$, part (a) shows that $f circle g$ is a homomorphism, and it is an isomorphism since a composition of bijective functions is bijective.

2. There is an identity element: the identity map $e:G to G$ sending $g$ to $g$.

For every $f in Aut(G)$, $f circle e=e circle f=f$.

3. Every element has an inverse, proved by part (b).

For every $f in Aut(G)$, $f^(-1) in Aut(G)$ and

$
f circle f^(-1)=f^(-1) circle f=e,
$

so $f^(-1)$ is its inverse in $Aut(G)$.

=== (d)

There are two elements in $Aut(bb(Z)_2)$: $(0,1)$ and $(0)$. There are two elements in $bb(Z)_2$: $0,1$. So

$
abs(Aut(bb(Z)_2))=abs(bb(Z)_2)=2.
$

Since all groups of order $2$ are isomorphic,

$
Aut(bb(Z)_2) approx bb(Z)_2.
$

=== (e)

$
bb(Z)_2 times bb(Z)_2 = Set((0,0),(0,1),(1,0),(1,1)).
$

There are three non-identity elements: $(0,1),(1,0),(1,1)$. Denote them by $A,B,C$, respectively. Any isomorphism $f:bb(Z)_2 times bb(Z)_2 to bb(Z)_2 times bb(Z)_2$ is a homomorphism and hence $f((0,0))=(0,0)$. Thus elements of $Aut(bb(Z)_2 times bb(Z)_2)$ are ways to rearrange $A,B,C$, which by definition is $S_3$.

To build an isomorphism $phi:S_3 to Aut(bb(Z)_2 times bb(Z)_2)$, send

$
align(
  (1)& mapsto (A), & (1,2)& mapsto (A,B), & (1,3)& mapsto (A,C), \
  (2,3)& mapsto (B,C), & (1,2,3)& mapsto (A,B,C), & (1,3,2)& mapsto (A,C,B).
)
$

== 2. Centers of groups

Let $G$ be a group. The _center_ of $G$ is $Z(G)=Set(g in G | g h=h g " for all " h in G)$.

1. Prove that $Z(G)$ is an abelian subgroup of $G$.
2. Compute the center of $D_4$.
3. Compute the center of $S_3$.
4. Compute the center of $GL_2(bb(R))$.

=== 1.

*Proof.*

1. $e in Z(G)$, since for every $h in G$, $e h=h e$.

2. $Z(G)$ is closed under the operation of $G$. Take $x,y in Z(G)$. For every $g in G$, $x g=g x$ and $y g=g y$. Thus

$
x y g=x(y g)=x(g y)=g x y.
$

Therefore $x y in Z(G)$.

3. $Z(G)$ is closed under inverse. Take $g in Z(G)$. For arbitrary $x in G$, $g x=x g$. Multiplying by $g^(-1)$ on the left gives $x=g^(-1) x g$; multiplying on the right gives $x g^(-1)=g^(-1) x$. Thus $g^(-1) in Z(G)$.

4. $Z(G)$ is commutative: for $x,y in Z(G)$, $x y=y x$ by definition.

By 1, 2, 3, and 4, $Z(G)$ is an abelian subgroup of $G$.

=== 2.

$
D_4=Set(r_0,r_90,r_180,r_270,f_1,f_2,f_3,f_4),
$

where $r$ is clockwise and $f_1,f_2,f_3,f_4$ denote reflections across the vertical, horizontal, and two diagonal axes, respectively. $r_0 in Z(D_4)$ since it is the identity, and $r_180 in Z(D_4)$ through calculation. But

$
r_90 f_1 != f_1 r_90,
quad r_90 f_2 != f_2 r_90,
quad f_3 r_90 != r_90 f_3,
quad f_4 r_90 != r_90 f_4.
$

So

$
Z(D_4)=Set(r_0,r_180).
$

=== 3.

$
S_3=Set((1),(1,2),(1,3),(2,3),(1,2,3),(1,3,2)).
$

$(1) in Z(S_3)$ since it is the identity. Also,

$
(1,2)(2,3)!=(2,3)(1,2),
quad (1,2,3)(1,3)!=(1,3)(1,2,3),
quad (1,2,3)(1,3)!=(1,3)(1,2,3).
$

So $Z(S_3)=Set((1))$.

=== 4.

Let $mat(m,n;p,q) in Z(GL_2(bb(R)))$. For arbitrary $a,b,c,d in bb(R)$,

$
mat(a,b;c,d) mat(m,n;p,q)=mat(a m+b p,a n+b q;c m+d p,c n+d q)
$

and

$
mat(m,n;p,q) mat(a,b;c,d)=mat(a m+c n,b m+d n;a p+c q,b p+d q).
$

Thus $b p=c n$, hence $p=n=0$; $a n+b q=b m+d n$, hence $q=m$; and $c m+d p=a p+c q$, which is always true. So

$
Z(GL_2(bb(R)))=Set(k mat(1,0;0,1) | k in bb(R)^times).
$

== 3. Generating $S_n$ and $A_n$

Consider the symmetric group $S_n$, with $n>=3$. The goal is to prove that $S_n$ can be generated by only two elements.

(a) Let $tau in S_n$ be a permutation, and $(a,b)$ a transposition. Show that $tau(a,b)tau^(-1)=(tau(a),tau(b))$.

(b) Show that $(i,j)=(1,i)(1,j)(1,i)$. Conclude that every element of $S_n$ is the product of transpositions of the form $(1,i)$.

(c) Let $sigma$ be the $(n-1)$-cycle $(2,3 cdots n)$. Show that $(1,i)=sigma^(i-2)(1,2)(sigma^(-1))^(i-2)$ for all $i=2,...,n$. Conclude that $S_n=bracket((1,2),(2,3 cdots n))$.

=== (a)

$
tau^(-1)=pmat(tau(1),tau(2),dots,tau(a),dots,tau(b),dots,tau(n);1,2,dots,a,dots,b,dots,n).
$

Therefore

$
(a,b)tau^(-1)=pmat(tau(1),tau(2),dots,tau(a),dots,tau(b),dots,tau(n);1,2,dots,b,dots,a,dots,n),
$

and

$
tau circle (a,b) circle tau^(-1)=pmat(tau(1),tau(2),dots,tau(a),dots,tau(n);tau(1),tau(2),dots,tau(b),dots,tau(a),dots,tau(n))=(tau(a),tau(b)).
$

=== (b)

$
align(
  (i,j)&=pmat(1,2,dots,i,dots,j,dots,n;1,2,dots,j,dots,i,dots,n) \
  &=(1,j)(1,i) \
  &=pmat(1,2,dots,i,dots,j,dots,n;1,2,dots,j,dots,i,dots,n) \
  &=(1,i)(1,j)(1,i)=(i,j).
)
$

Conclusion: every element of $S_n$ is the product of transpositions of the form $(1,i)$.

=== (c)

$
sigma=pmat(1,2,3,dots,n-1,n;1,3,4,dots,n,1)
$

and

$
sigma^(i-2)=pmat(1,2,3,dots,n-1,n;1,i,i+1,dots,i-1,i-2).
$

By (a),

$
sigma^(i-2)(1,2)(sigma^(-1))^(i-2)=(sigma^(i-2)(1),sigma^(i-2)(2))=(1,i).
$

Therefore $S_n=bracket((1,2),sigma)$, since by Theorem 7.26 each $s in S_n$ is a product of transpositions and every transposition $(i,j)$ is a product of transpositions of the form $(1,i)$.

Consider the alternating group $A_n$, the subgroup of $S_n$ consisting of all even permutations of $S_n$, for $n>=3$. Let $i,j,k,l in Set(1,2,...,n)$, with $i!=j$ and $k!=l$.

(a) Suppose that $(i,j)$ and $(k,l)$ are not disjoint cycles. Show that $(i,j)(k,l)$ is either the identity or a 3-cycle.

(b) Suppose that $(i,j)$ and $(k,l)$ are disjoint cycles. Show that $(i,j)(k,l)$ is the product of two 3-cycles.

(c) Prove that $A_n$ is generated by the set of all 3-cycles of $S_n$.

=== (a)

Case 1: each of $k,l$ equals one of $i,j$. Then $(i,j)=(k,l)$; since $abs((i,j))=2$,

$
(i,j)(k,l)=(1).
$

Case 2: only one of $k,l$ equals one of $i,j$. Without loss of generality, $i=k$. Then

$
(i,j)(k,l)=(i,j)(i,l)=(l,i)(i,j)=(l,i,j),
$

which is a 3-cycle. Therefore $(i,j)(k,l)$ is either the identity or a 3-cycle.

=== (b)

$
align(
  (i,j)(k,l)
    &=pmat(1,2,dots,i,dots,j,dots,k,dots,l,dots,n;1,2,dots,j,dots,i,dots,l,dots,k,dots,n) \
    &=(i,j)(i,k)(j,k)(j,l) \
    &=(i,j,k)(j,k,l).
)
$

So $(i,j)(k,l)$ is the product of two 3-cycles.

=== (c)

For $a in A_n$, write $a=a_1a_2 cdots a_(2k)$, where the $a_i$ are transpositions. Then

$
a=product_(i=1)^k a_i a_(i+1).
$

By (a) and (b), each $a_i a_(i+1)$ is $(1)$ or a 3-cycle, or a product of 3-cycles. Note that

$
(1)=(1,2)(2,1)=(1,2)(2,3)(3,2)(2,1)=(1,2,3)(3,2,1)
$

is also a product of two 3-cycles. Therefore $A_n$ is generated by the set of all 3-cycles of $S_n$.
