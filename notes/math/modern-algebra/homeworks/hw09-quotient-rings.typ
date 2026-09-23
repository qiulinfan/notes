#import "../../toolchain/math-aliases.typ": *

#let Set(..args) = $lr(brace.l, #args.pos().join(", "), brace.r)$
#let bracket(..args) = $⟨#args.pos().join(", ")⟩$
#let pmat(..args) = math.mat(..args, delim: "(")
#let GL = math.op("GL")
#let Orbit = math.op("Orbit")
#let Stab = math.op("Stab")
#let NW = math.upright("NW")
#let NE = math.upright("NE")
#let align(..args) = args.pos().join()

= Homework 9

== 1. Prime-order groups

(a) Prove Fermat's Little Theorem: if $p$ is prime and $p !| a$, then $a^(p-1) equiv 1 " mod " p$.

(b) If $G$ is a group of prime order $p$, then $G$ is cyclic.

(c) A nontrivial group $G$ has no nontrivial proper subgroups if and only if $G$ is finite and of order $p$ where $p$ is prime.

=== (a)

*Claim 1.* If $p$ is prime, then $a^p equiv a " mod " p$.

*Proof.* Take arbitrary prime $p$. We prove it by induction on $a$.

*Basic step.* $1^p=1$, so $1^p equiv 1 " mod " p$.

*Inductive step.* Assume $a^p equiv a " mod " p$. We show that $(a+1)^p equiv (a+1) " mod " p$. By the binomial theorem,

$
align(
  (a+1)^p
    &=sum_(k=0)^p binom(p,k)a^k \
    &=sum_(k=0)^p (p!)/(k!(p-k)!)a^k \
    &=sum_(k=1)^(p-1) (p!)/(k!(p-k)!)a^k+1+a^p.
)
$

For every $1<=k<=p-1$, $p-k<=p-1$ and $p-k>=1$, so $p$ divides every term with denominator $k!(p-k)!$: since $p$ is prime, $p !| k!(p-k)!$, otherwise $p$ must divide one of the factors in that product, which contradicts the bounds. Therefore

$
(p-1)!/(k!(p-k)!)
$

is still an integer, and

$
(a+1)^p=p(sum_(k=1)^(p-1) (p-1)!/(k!(p-k)!)a^k)+1+a^p.
$

Thus $p$ divides $(a+1)^p-(a^p+1)$, and therefore

$
(a+1)^p equiv a^p+1 equiv a+1 " mod " p.
$

This proves Claim 1.

*Claim 2.* Following Claim 1, if $p !| a$, then $a^(p-1) equiv 1 " mod " p$.

*Proof.* Let $p$ be an arbitrary prime and take arbitrary $a in bb(Z)^+$ with $p !| a$. By Claim 1,

$
a^p equiv a " mod " p,
$

so $p | a(a^(p-1)-1)$. Since $p$ is prime, either $p | a$ or $p | a^(p-1)-1$. Since $p !| a$, we get

$
a^(p-1) equiv 1 " mod " p.
$

Combining Claims 1 and 2 proves Fermat's Little Theorem.

=== (b)

*Proof.* Assume $abs(G)$ is prime, so $abs(G)>=2$ and there is a non-identity element in $G$. Select arbitrary non-identity $a in G$. Then $abs(bracket(a))>=2$, since $a and a^2 in bracket(a)$ (with $a!=e$, otherwise $a a^(-1)=a^(-1)a$ would give $a=e$). By Lagrange's Theorem,

$
abs(G)=abs(bracket(a)) dot " index of " bracket(a) " in " G.
$

Since $abs(G)$ is prime and $abs(bracket(a))>=2$, we have $abs(bracket(a))=abs(G)$, which means $bracket(a)=G$. Hence $G$ is cyclic.

=== (c)

First we prove the backward direction. Assume $abs(G)$ is finite and prime. Then for every subgroup $K<=G$, Lagrange's Theorem gives $abs(K) | abs(G)$. Since $abs(G)$ is prime, $abs(K)=1$ or $abs(G)$, so $K$ is either trivial or $G$ itself. Therefore $G$ has no nontrivial subgroups.

For the forward direction, assume $G$ has no nontrivial proper subgroup. Case 1: $G$ has finite composite order. Then $abs(G)=m n$ for some prime $m$ and $n>=2$. By Theorem 8.6, for every $x in G$, $x^abs(G)=e$. Pick $x!=e$. If $x^m=e$, then $bracket(x)$ has order at most $m<abs(G)$ and is nontrivial, a contradiction. If $x^m!=e$, then $bracket(x^m)$ has order at most $n<abs(G)$ and is nontrivial, another contradiction.

Case 2: $G$ has infinite order. Select arbitrary non-identity $g in G$ and consider $bracket(g)$. If $g in bracket(g^2)$, then $g=(g^2)^n=g^(2n)$ for some integer $n$, so $g^(2n-1)=e$ and $abs(bracket(g))<=2n-1$; this is a nontrivial proper subgroup of $G$, a contradiction. If $g !in bracket(g^2)$, then $bracket(g^2)$ is itself a nontrivial proper subgroup of $G$, again a contradiction. Thus the group cannot be infinite. It must have prime order.

== 2. Left and right cosets

For each of the following parts, $K$ is a subgroup of the group $G$. Write down every element of every distinct right coset and every distinct left coset.

(a) $K=Set(r_0,r_90,r_180,r_270)$ and $G=D_4$, with reflections $s_v,s_h,s_(NW),s_(NE)$.

(b) $K=Set(e,(1,2))$ and $G=S_3$.

(c) $K=bracket(mat(0,1;1,0))$ and $G=GL_2(bb(Z)_2)$, whose elements are

$
Set(
I=mat(1,0;0,1),
a=mat(0,1;1,0),
b=mat(1,1;1,0),
c=mat(1,1;0,1),
d=mat(1,0;1,1),
f=mat(0,1;1,1)
).
$

(d) $K=bracket(5)$ and $G=bb(Z)_(12)^times$.

=== (a)

There are two left/right cosets.

*Left cosets:*

1. $r_0K=r_90K=r_180K=r_270K=K$.

2. $s_v K=Set(s_v,s_h,s_(NW),s_(NE))=s_h K=s_(NW) K=s_(NE) K$.

*Right cosets:*

1. $K r_0=K r_90=K r_180=K r_270=K$.

2. $K s_v=K s_h=K s_(NW)=K s_(NE)=Set(s_v,s_h,s_(NW),s_(NE))$.

=== (b)

$
G=S_3=Set(e,(1,2),(1,3),(2,3),(1,2,3),(1,3,2)).
$

There are three left/right cosets.

*Left cosets:*

1. $(1,3)K=Set((1,3),(1,2,3))$.
2. $(2,3)K=Set((2,3),(1,3,2))$.
3. $K$ itself.

*Right cosets:*

1. $K(1,3)=Set((1,3),(1,3,2))$.
2. $K(2,3)=Set((2,3),(1,2,3))$.
3. $K$ itself.

=== (c)

$K=Set(a,I)$. There are three left/right cosets.

*Left cosets:*

1. $a K=I K=K=Set(a,I)$.
2. $f K=Set(f,d)=d K$.
3. $b K=Set(c,b)=c K$.

*Right cosets:*

1. $K a=K I=K=Set(a,I)$.
2. $K f=Set(c,f)=K c$.
3. $K d=Set(b,d)=K b$.

=== (d)

$
G=Set(1,5,7,11),
quad K=bracket(5)=Set(5,1).
$

There are two left/right cosets.

*Left cosets:* $K=Set(5,1)$ and $7 K=Set(11,7)$.

*Right cosets:* $K=Set(5,1)$ and $K 7=Set(11,7)$.

== 3. Conjugacy classes

Any group $G$ acts on itself by conjugation: $g dot h=g h g^(-1)$. The orbits of this action are called _conjugacy classes_.

1. Show $h in Z(G)$ if and only if $h$ is a fixed point of the conjugation action.
2. Show a subgroup $H$ of $G$ is normal if and only if it is a disjoint union of conjugacy classes.
3. Describe the partition of $S_5$ into its conjugacy classes.
4. Show that the only nontrivial normal subgroup of $S_5$ is $A_5$.

=== 1.

*Forward direction.* Assume $h$ is a fixed point of the conjugation action. Then for every $g in G$, $g h g^(-1)=h$. Multiply by $g$ on both sides to get $g h=h g$, so $h in Z(G)$.

*Backward direction.* Assume $h in Z(G)$. Then for every $g in G$, $g h=h g$, so $g h g^(-1)=h g g^(-1)=h$. Hence $h$ is a fixed point of the conjugation action. Thus $h$ is a fixed point of the conjugation action if and only if $h in Z(G)$.

=== 2.

*Forward direction.* Assume $H$ is a disjoint union of conjugacy classes, i.e.

$
H=union_(j=1)^n Set(g h_j g^(-1) | g in G)
$

for some $h_1,h_2,...,h_n in G$. Select arbitrary $g in G$ and fix it. Take arbitrary $x in H$; then $x in O(h_i)$ for some $h_i$, so $g x g^(-1)=g dot x in O(h_i) subset H$. Thus $g^(-1) x g in H$ and, for every $g in G$, $g H g^(-1) subset H$. By Theorem 8.11, $H$ is a normal subgroup of $G$.

*Backward direction.* Assume $H$ is normal. Take arbitrary $g in G$. By Theorem 8.11, $g H g^(-1) subset H$, so for every $h in H$, $g h g^(-1) in H$. Since $g$ is arbitrary, $O(h) subset H$ for every $h in H$. Therefore $H$ is a union of conjugacy classes. Since orbits are either disjoint or identical, it is a disjoint union of conjugacy classes.

=== 3.

The conjugacy classes in $S_5$ are:

$
align(
O(e)&=Set(e), && "order " 1, \
O((1,2))&=Set("all 2-cycles"), && "order " binom(5,2)=10, \
O((1,2,3))&=Set("all 3-cycles"), && "order " binom(5,3) times 2=20, \
O((1,2,3,4))&=Set("all 4-cycles"), && "order " binom(5,4) times 3!=30, \
O((1,2,3,4,5))&=Set("all 5-cycles"), && "order " 4!=24, \
O((1,2)(3,4))&=Set("all two disjoint transpositions"), && "order " (1/2)binom(5,2)binom(3,2)=15, \
O((1,2)(3,4,5))&=Set("all 2+3-disjoint cycles"), && "order " binom(5,3) times 2=20.
)
$

These union to $S_5$, with orders summing to $120$.

=== 4.

Let $K$ be a nontrivial normal subgroup of $S_5$. First $e in K$ by the definition of subgroup. By part 2, $K$ is a disjoint union of conjugacy classes, so $Set(e)$ is one of the conjugacy classes that form $K$. By Lagrange's Theorem, $abs(K) | abs(S_5)=120$.

Since $K!=Set(e)$, more conjugacy classes must be in the disjoint union. Since $abs(Set(e))=1$ and the class of all 5-cycles has order $24$, the all-5-cycles class must be one of the conjugacy classes; otherwise $abs(K)$ cannot divide $120$. Now $abs(K)>=25$. Thus $abs(K)$ can only be $30,40,$ or $60$ to divide $120$, and all two-disjoint transpositions of order $15$ must be one of the classes.

There are three possibilities:

1. $K=Set(e) union Set("all 5-cycles") union Set("all two disjoint transpositions")$.
2. The preceding union together with $Set("all 3-cycles")$.
3. The preceding union together with $Set("all 2+3-disjoint cycles")$.

A normal subgroup must be closed under operation and inverse. For case 1,

$
(3,4)(1,2)(1,2,3,4,5)=(2,4,5) !in K,
$

so it is not a subgroup. For case 3,

$
(3,4)(1,2,3)(1,2,3,4,5)=(1,4,5,2) !in K,
$

so it is not a subgroup. Therefore only case 2 can be a subgroup. Its elements are even, so it is $A_5$. Thus $K$ is the only nontrivial normal subgroup of $S_5$.

== 4. A group whose order is divisible by $p$

Let $p$ be a prime, and $G$ a finite group with $p | abs(G)$. Consider

$
X=Set((g_1,...,g_p) in G times dots times G | g_1 g_2 dots.c g_p=e),
$

where there are $p$ copies of $G$. The group $bb(Z)_p$ acts on $X$ by rotating elements:

$
i_p dot (g_1,...,g_p)=(g_(1+i),...,g_p,g_1,...,g_i).
$

1. Show $X$ has $abs(G)^(p-1)$ elements, so $p | abs(X)$.
2. Show the orbits of the action either have $1$ or $p$ elements, and the orbits of order $1$ are either $(e,e,...,e)$ or of the form $(g,g,...,g)$ with $abs(g)=p$.
3. Show that $G$ contains an element of order $p$.

=== 1.

For any choice of $(g_1,g_2,...,g_(p-1))$, by existence and uniqueness of inverses there is a fixed $g_p$ such that $g_1 g_2 dots.c g_p=e$. Therefore there are $abs(G)^(p-1)$ choices of $g_1,...,g_(p-1)$ and

$
abs(X)=abs(G)^(p-1)=abs(G)abs(G)^(p-2),
$

so $p | abs(X)$.

=== 2.

For $x in X$, the Orbit-Stabilizer Theorem gives

$
abs(Orbit(x)) dot abs(Stab(x))=abs(bb(Z)_p)=p.
$

Consider $x=(g,g,g,...,g)$ for some $g in G$. For every $y in bb(Z)_p$, $y dot x=x$, so $Stab(x)=bb(Z)_p$; therefore $abs(Stab(x))=p$ and $abs(Orbit(x))=1$. In this case either $g=e$ or $abs(g)=p$, because $(g,g,...,g) in X$ means $g^p=e$. Thus either $g=e$ or $abs(g)=p$; $abs(g)$ cannot be less than $p$, since otherwise $g^p=g^(abs(g)a)=e$ for some $a in bb(Z)$ would contradict that $p$ is prime.

Otherwise, in $x=(g_1,g_2,...,g_p)$ at least some $g_i,g_j$ are different. Only when $y=0_p$ does $y dot x=x$, so $Stab(x)=Set(0_p)$ and $abs(Orbit(x))=p$. Therefore the orbits of the action of $bb(Z)_p$ on $X$ either have $1$ or $p$ elements, and the orbits of order $1$ are either $(e,e,...,e)$ or $(g,g,...,g)$ with $abs(g)=p$.

=== 3.

Every element of $X$ belongs to exactly one orbit. From part 2,

$
abs(X)=m p=n p
$

for some $m in bb(Z)$ after reducing the $p$-element orbits. Since $p | abs(X)$, there must be an element $(g,g,...,g) in X$ distinct from $(e,e,...,e)$ such that $abs(g)=p$. Therefore there must exist $g in G$ such that $abs(g)=p$.

== Source notes

The handwritten proof for Problem 1(a) states the induction as “on $a$” after introducing a prime $p$; the typeset version retains that stated induction. In Problem 4(3), the source uses the notation $abs(X)=m p-n p$ while reducing orbit counts; it is transcribed as written.
