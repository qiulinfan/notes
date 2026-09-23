---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/mathematical-analysis/chapters/01-real-number-system.typ"
kgd_source_format: "typst"
kgd_source_sha256: "198c52b4b4c18c954996144266652041d68b7ebd516fdc4b1cd32a051e6102fb"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let bC = math.bb("C")

// Source: lectures/L01-Real-Num-System-I.pdf p.1.
= The real-number system

== Set notation and the construction of $bN$

源页题记：「此课将使用以下 symbols」。

#definition(title: [Power set and indexed families])[
  The power set of $X$ is
  $cal(P)(X) = {A: A subset.eq X}$. 若 $I$ 是一个 set，且对每个 $i in I$，
  $A_i$ 是一个 set，则 $ {A_i: i in I}$ 是一个 *indexed family of sets*。
]

For such a family,

$ union.big_(i in I) A_i = {x: x in A_i upright(" for some ") i in I} $

and

$ inter.big_(i in I) A_i = {x: x in A_i upright(" for all ") i in I}. $

The relative complement is
$A without B = {x in A: x in.not B}$.  The source places these next to the
inclusion chain

$ bN subset.eq bZ subset.eq bQ subset.eq bR subset.eq bC. $

It annotates this chain with “given by God” below $bN$ and “algebraically
closed” below $bC$.  The structural discussion distinguishes three
approaches to fundamental issues:

- naïve approach;
- axiomatic approach; and
- constructive approach (set theory, 582).

constructive approach 从
$0 = emptyset$, $1 = {0} = {emptyset}$,
$2 = {0,1} = {emptyset,{emptyset}}$, and
$3 = {0,1,2}$ 构造 $bN$。本课程中 $0 in.not bN$。

#definition(title: [Inductive subset of $bR$])[
  A set $I subset.eq bR$ is *inductive* if:

  - $0 in I$; and
  - for every $x in bR$, $x in I$ implies $x+1 in I$.

  Then
  $bN = inter.big {I subset.eq bR: I upright(" is inductive")}$
  is the smallest inductive subset of $bR$; hence
  $bN = {1,2,3,dots}$ under the course convention.
]

#definition(title: [Definitions by induction])[
  For $a in bR$ and $n in bN$, integer powers are fixed by
  $a^0 = 1$ and $a^n = a^(n-1) a$.  The factorial is fixed by
  $0! = 1$ and $(n+1)! = (n+1)n!$.

  The handout also records summation and product notation:
  $sum_(k=1)^(n+1) a_k = sum_(k=1)^n a_k + a_(n+1)$ and
  $product_(k=1)^(n+1) a_k =
  (product_(k=1)^n a_k) a_(n+1)$.
]

The recalled identities are

- $sum_(k=1)^n k = n(n+1)/2$;
- $sum_(k=1)^n k^2 = n(n+1)(2n+1)/6$;
- $sum_(k=0)^n r^k = (1-r^(n+1))/(1-r)$ for $r != 1$;
- $binom(n,k) = binom(n-1,k)+binom(n-1,k-1)$; and
- $(a+b)^n = sum_(k=0)^n binom(n,k)a^(n-k)b^k$.

The source labels the last formula “Binomial Thm”.

== Ordered fields and completeness

$bR$ 是一个 ordered field：其 order 是 transitive、irreflexive 和
trichotomous。它满足 completeness axiom：每个非空且 bounded above 的
$bR$ 的 subset 在 $bR$ 中都有 supremum。这是 $bR$ 的 ``geometric'' closure，
区别于 $bC$ 的 algebraic closure。

// Source: lectures/L02-Real-Num-System-II.pdf p.1.

#theorem(title: [The unique #kn[Complete ordered field]])[
  $bR$ is the unique complete ordered field.  Also,
  $bN$ is the intersection of all inductive subsets of $bR$.
]

源页以混排写道：$bN$ 有 $+$ 和 $times$，但没有 $+^(-1)$；$bZ$ 有
$+^(-1)$，但没有 $times^(-1)$；$(bQ,+,times,<)$ 才满足 ordered-field axioms。
随后标出 $bQ$ 的 ``algebraic deficiency''：有 rational coefficients 的
polynomial equation 却没有 rational root。例子是 $x^2-2=0$，旁注为
``Pythagoras: $sqrt(2)$ is irrational''。

#theorem(title: [Rational roots theorem])[
  Let
  $f(x) = sum_(k=0)^n a_k x^k$ with $a_k in bZ$ and $a_0 a_n != 0$.
  If $r=p/q$ is a root, where $p,q in bZ$ are coprime and $q != 0$, then
  $p | a_0$ and $q | a_n$.
]

Indeed, multiplying
$0=f(p/q)=sum_(k=0)^n a_k(p/q)^k$ by $q^n$ yields

$a_0 q^n = -sum_(k=1)^n a_k p^k q^(n-k)$

and, symmetrically,

$a_n p^n = -sum_(k=0)^(n-1) a_k p^k q^(n-k)$.

Thus $p | a_0 q^n$ and $q | a_n p^n$; coprimality and the Fundamental
Theorem of Arithmetic give $p | a_0$ and $q | a_n$.  For $f(x)=x^2-2$,
the only possible rational roots would be in $ {-2,-1,1,2}$, and none is a
root.

#definition(title: [Algebraic and transcendental numbers])[
  A complex number $z$ is *algebraic* if it is a root of a polynomial with
  coefficients in $bQ$; otherwise $z$ is *transcendental*.
]

The examples in the source are
$sqrt(2)$ (a root of $x^2-2$),
$sqrt(2+root(3,4))$ (a root of $x^6-6x^4+12x^2-12$),
$i=sqrt(-1)$ (a root of $x^2+1$), and every $q in bQ$
(a root of $x-q$).  The annotation is “$pi$ and $e$ are transcendental
(hard to prove)”.  The set of all algebraic numbers is denoted
$accent(bQ, macron)$, the algebraic closure of $bQ$, and is a field.

#definition(title: [Algebraically closed field])[
  A field $F$ is algebraically closed if every polynomial of degree $n$ with
  coefficients in $F$ has $n$ roots in $F$, counting multiplicities.
]

Thus $accent(bQ, macron)$ is algebraically closed, and the Fundamental
Theorem of Algebra says that $bC$ is algebraically closed. 源页旁注以原来的
混排对照 ``algebraically closed'' 与 ``geometric deficiency (R.F. order
theory)''：$accent(bQ, macron)$ 有一部分 real numbers 和一部分 non-real
numbers，但缺少 $bR$ 的 order-theoretic completeness。

== Bounds, extrema, and intervals

// Source: lectures/L02-Real-Num-System-II.pdf p.2.

#definition(title: [Upper/lower bounds and extrema])[
  Let $X$ have a linear relation $<=$, and let $A subset.eq X$.
  A point $b in X$ is an *upper bound* of $A$ when
  $a <= b$ for every $a in A$; then $A$ is bounded above in $X$.
  Lower bounds and bounded below are defined dually.

  If $b in A$ is an upper bound, then $b = max A$, the largest element of
  $A$.  If $b$ is an upper bound and every upper bound $u$ satisfies
  $u >= b$, then $b=sup A$, the least upper bound (supremum).
  Dually one has $min A$ and $inf A$ (infimum).
]

The notes emphasize that $A$ may have no $max/min$ in $X$ and may have no
$sup/inf$ in $X$.  If a maximum exists, it is unique: if
$a,b=max A$, then $a<=b$ and $b<=a$, so $a=b$.

#definition(title: [Bounded set and interval])[
  $A subset.eq X$ is *bounded in $X$* if it is both bounded above and bounded
  below.  An interval $I subset.eq X$ is a set such that whenever
  $x,y in I$ and $x<=z<=y$, then $z in I$.
]

For a linear order,
$[a,b] = {x in X: a<=x<=b}$ and
$(a,b] = {x in X: a<x<=b}$; similarly for the other endpoint choices.
The convention on the page is
$[a,infinity)={x in X:x>=a}$,
$sup emptyset=-infinity$, and $inf emptyset=+infinity$.
The latter two are explicitly “not in $bR$”.

Examples from the page:

- every finite $A subset.eq bR$ is bounded and has a maximum and minimum;
- $bN$, $bZ$, and $bQ$ are not bounded above in $bR$;
- $bN$ is bounded below in $bR$, with $inf bN=1$ and its lower bounds
  $(-infinity,1]$;
- $inf(0,1)=inf[0,1]=0$ and $sup(0,1)=sup[0,1]=1$;
- $min(0,1)$ does not exist, while $min[0,1]=0$;
- for $A={1/n:n in bN}$, $inf A=0$, $sup A=max A=1$, and $min A$ does
  not exist.

If $x$ is an upper bound of $A$ in $X$, every $y>=x$ in $X$ is an upper
bound; lower bounds satisfy the dual statement.  If $A$ has a maximum,
then $sup A=max A$.

#theorem(title: [Completeness axiom and its dual])[
  Every nonempty $A subset.eq bR$ that is bounded above has
  $sup A in bR$.  Equivalently, every nonempty $A subset.eq bR$ bounded
  below has $inf A in bR$.
]

For the dual statement, let $L$ be the set of all lower bounds of $A$.
Then $sup L in bR$, and $inf A=sup L$.  Equivalently, with
$-A={-a:a in A}$, a nonempty set bounded below has
$inf A=-sup(-A)$.

源页称此为 ``LUB property''，并写道 ``geometrically complete ordered set
需要 LUB property''；从这个意义上 complete ordered field 就是 $bR$。In particular,
$A={r in bQ:r^2<2}$ has $sup A=sqrt(2)$ outside $bQ$; this exhibits the
geometric deficiency of both $bQ$ and $accent(bQ,macron)$.

== Page-complete lecture record

The following preserves the remaining readable working, labels, and native
schematics from the two source pages. It is intentionally kept in the
source's Chinese--English mixed language.

=== L01--Real--Num--System--I, p. 1

The sheet begins Instructor: Scott Schneider and records the four symbols
power set, indexed family, indexed union, indexed intersection, and relative
complement. Its number-system relationship is reconstructed as a native
table; the labels given by god, ordered field, field, and algebraically
closed occur at these positions.

#align(center)[
  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 5pt,
    stroke: 0.5pt,
    [$bN$], [$subset.eq$], [$bZ$], [$subset.eq$], [$bQ$],
    table.cell(colspan: 5)[$subset.eq bR subset.eq bC$],
    table.cell(colspan: 5)[$bN$: given by god; $bR$: ordered field; $bQ,bR,bC$: field; $bC$: algebraically closed]
  )
]

It explicitly gives

$cal(P)(X)={A : A subset.eq X}, quad
union.big_(i in I) A_i={x : x in A_i upright(" for some ") i in I},$

$inter.big_(i in I) A_i={x : x in A_i upright(" for all ") i in I}, quad
A without B={x in A : x in.not B}.$

If $I$ is a set and, for every $i in I$, $A_i$ is a set, then
$ {A_i : i in I}$ is an *indexed family of sets*. The three approaches are
The three approaches are (1) naive approach; (2) axiomatic approach; and
(3) constructive approach (set theory, 582). Under Using constructive
approach to build $bN$, it
lists

$0=emptyset, quad 1={0}={emptyset}, quad
2={0,1}={emptyset,{emptyset}}, quad
3={0,1,2}={emptyset,{emptyset,{emptyset}}}, dots.$

In this class, $0 in.not bN$. The inductive definition reads

$I subset.eq bR upright(" is inductive") =>
0 in I upright(" and ") (forall x in bR)(x in I => x+1 in I),$

$bN=inter.big {I : I upright(" is an inductive subset of ") bR}
quad upright("(smallest inductive subset)"),$

followed by Then $bN={1,2,3,dots}$. The recalled secondary-school
formulas are, in the source order,

$sum_(k=1)^n k=n(n+1)/2, quad
sum_(k=1)^n k^2=n(n+1)(2n+1)/6,$

$sum_(k=0)^n r^k=(1-r^(n+1))/(1-r), quad
binom(n,k)=binom(n-1,k)+binom(n-1,k-1),$

and, for all $a,b in bR$,
$(a+b)^n=sum_(k=0)^n binom(n,k)a^(n-k)b^k$ (Binomial Thm.).
The induction definitions also state, for $a in bR$,

$a^0=1, quad a^n=a^(n-1)a; quad 0!=1, quad (n+1)!=(n+1)n!,$

$sum_(k=1)^1 a_k=product_(k=1)^1 a_k=a_1,$

$sum_(k=1)^(n+1)a_k=sum_(k=1)^n a_k+a_(n+1), quad
product_(k=1)^(n+1)a_k=(product_(k=1)^n a_k)a_(n+1).$

The last lower-right note says that $bR$ has the linear relation $<$,
marked (1) transitive, irreflexive; (2) trichotomy, and the completeness
axiom $forall S subset.eq bR$, $S!=emptyset$, $sup S in bR$.

=== L02--Real--Num--System--II, p. 1

The top note is $bR$ is the unique complete ordered field
(所有 complete ordered field 都同构 $bR$), and again $bN$ is the
intersection of all inductive subsets of $bR$. The deficiency table is
retained in source order:

#table(
  columns: (auto, 1fr),
  inset: 5pt,
  stroke: 0.5pt,
  [$bN$], [没有 $+^(-1)$, $times^(-1)$],
  [$bZ$], [没有 $times^(-1)$],
  [$(bQ,+,times,<)$], [satisfies Axiom 1--14, so $bQ$ is an ordered field],
  [$bQ$], [algebraic deficiency: rational-coefficient algebraic equations can have no rational roots]
)

For $f(x)=x^2-2$, the page writes $r=p/q$, $p|-2$, $q|1$, hence
$r in {-2,-1,1,2}$, and says these are not roots. Its complete calculation is

$f(p/q)=sum_(k=0)^n a_k(p/q)^k=0,$

$sum_(k=0)^n a_k p^k q^(n-k)=0,$

$a_0 q^n=-sum_(k=1)^n a_k p^k q^(n-k)
=p(-sum_(k=1)^n a_k p^(k-1) q^(n-k)) in bZ,$

$a_n p^n=q(-sum_(k=0)^(n-1) a_k p^k q^(n-k-1)) in bZ.$

By FTA and $(p,q)=1$, this yields $p|a_0$ and $q|a_n$. The algebraic-number
examples are: $sqrt(2)$ is a root of $x^2-2$;
$sqrt(2+root(3,4))$ is a root of $x^6-6x^4+12x^2-12$;
$i=sqrt(-1)$ is a root of $x^2+1$; and every $q in bQ$ is algebraic since it
is a root of $x-q=0$. $pi$ and $e$ are transcendental (hard to prove).
The set of all algebraic numbers is $accent(bQ,macron)$, which is a field,
called the algebraic closure of $bQ$.

An algebraically closed field is stated as: every polynomial of degree
$n$ with coeffs in $F$ has $n$ roots in $F$ (counting multiplicities).
Thus $accent(bQ,macron)$ is algebraically closed; by FTA, $bC$ is
algebraically closed. $accent(bQ,macron)$ has some irrational and some
non-real numbers, but still has geometric deficiency (see order theory).
The reminder is: an irreflexive, transitive partial order ($<= $) that also
has trichotomy is a linear order ($<$).

=== L02--Real--Num--System--II, p. 2

For bounds, the sheet requires $A subset.eq X$, $b in X$, and a linear
relation on $X$:

$b upright(" is an upper bound of ") A => (forall a in A) a<=b,$

$b=max A => b in A upright(" and ") b upright(" is an upper bound"),$

$b=sup A => b upright(" is an upper bound and ")
(forall u upright(" upper bound of ") A) u>=b.$

Similarly we have lower bound, bounded below, $min A$, infimum
$(inf A)$. Its proof of uniqueness is $a,b=max A => a<=b, b<=a => a=b$.
An interval is

$I subset.eq X upright(" is an interval") =>
x,y in I, x<z<y => z in I.$

It records $[a,b]={x in X:a<=x<=b}$ and
$(a,b]={x in X:a<x<=b}$, then the convention
$[a,infinity)={x in X:x>=a}$,
$sup emptyset=-infinity$, $inf emptyset=+infinity$ (They are not in
$bR$). The listed examples are:

- Every finite $A subset.eq bR$ is bounded and has $max,min$.
- $bN,bZ,bQ$ are not bounded above in $bR$.
- $bN$ is bounded below in $bR$, $inf bN=1$, and all lower bounds of $bN$
  in $bR$ are $(-infinity,1]$.
- $inf(0,1)=inf[0,1]=0$, $sup(0,1)=sup[0,1]=1$,
  $min(0,1)$ and $max(0,1)$ DNE, while $min[0,1]=0$, $max[0,1]=1$.
- For $A={1/n:n in bN}$, $min A$ DNE, $inf A=0$, $max A=sup A=1$.

If $x$ is a UB of $A$ in $X$, every $y>=x$ in $X$ is a UB (LB similarly);
if $A$ has a maximum then $max A=sup A$. The LUB property is: if
$A subset.eq X$ is not empty, then $sup A in X$; an ordered set with it is
geometrically complete, and an ordered field with it is a complete ordered
field. The handwritten example is

$A={r in bQ:r^2<2} => sup A=sqrt(2) in.not bQ,$

and it closes: $bQ$ and $accent(bQ,macron)$ have geometric deficiency,
whereas $bR$ is a complete ordered field (but has algebraic deficiency).
