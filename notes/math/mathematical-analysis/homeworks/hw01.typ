#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let intersect = math.inter
#let bC = math.bb("C")

// Personal authority: Homework/451-Hw-1.pdf pp.1–18.
// Checking-only sources: 451-hw-1-raw.pdf pp.1–2; 451-hw-sol-all.pdf pp.1–4.
= Homework 1: sets, order, and induction

#remark(title: [Authority label])[
  This is a visual transcription of *personal work* in `451-Hw-1.pdf`.
  `451-hw-1-raw.pdf` and `451-hw-sol-all.pdf` are checking-only material: they
  were used to identify the assignment and check notation, never as the body
  of the submitted solutions below.
]

== Problem 1 — set identities

For each statement about sets, either prove the statement if it is true for all
sets, or give a counterexample using specific sets if it is false.

- (a) $(A union B) without C subset.eq A union (B without C)$.
- (b) $(A union B) without C supset.eq A union (B without C)$.
- (c) $A without (B union C) = (A without B) union (A without C)$.
- (d) $A subset.eq B$ if and only if $A intersect B=A$.

#solution(title: [(a) Proof])[
  Assume $x in (A union B) without C$. So $(x in A$ or $x in B)$, and
  $x in.not C$. Hence $(x in A$ but $x in.not C)$ or $(x in B$ but $x in.not C)$.
  This contains $x in A$ or $(x in B$ but $x in.not C)$, so
  $x in A union (B without C)$. Therefore
  $(A union B) without C subset.eq A union (B without C)$.
]

#solution(title: [(b) Counterexample])[
  Let $A={1,2,3,4,5}$, $B={1,2,3}$, and $C={1,2,3,4,5}$. Then
  $5 in A$, hence $5 in A union (B without C)$, but
  $5 in.not (A union B) without C$. Thus
  $(A union B) without C != A union (B without C)$.
]

#solution(title: [(c) Counterexample])[
  Let $A={1,2,3,4,5}$, $B={1,2,3,4,5}$, and $C={1,2,3}$. Then
  $4 in A without C$, so $4 in (A without B) union (A without C)$, but
  $4 in.not A without (B union C)$. Thus
  $A without (B union C) != (A without B) union (A without C)$.
]

#solution(title: [(d) Proof])[
  Assume $A subset.eq B$. If $x in A$, then $x in B$. Take $x in A intersect B$;
  then $x in A$. Conversely, take $x in A$; then $x in B$, so $x in A intersect B$.
  Therefore $A subset.eq A intersect B$ and $A intersect B subset.eq A$, hence
  $A=A intersect B$.

  Assume $A=A intersect B$. Fix $a in A$. Then $a in A intersect B$, so
  $a in A$ and $a in B$. Thus $A subset.eq B$. This proves
  $A=A intersect B$ if and only if $A subset.eq B$.
]

== Problem 2 — multiples

For each $n in bN$, let $A_n={n k:k in bN}$.

#solution(title: [(a)])[
  $A_2={2k:k in bN}$ and $A_3={3k:k in bN}$. Thus
  $x in A_2 intersect A_3$ if and only if $2|x$ and $3|x$ (and $x in bN$),
  if and only if $6|x$ (and $x in bN$). So $A_2 intersect A_3={6k:k in bN}$.
]

#solution(title: [(b)])[
  $union_(n=2)^infinity A_n={x in bN:2|x$ or $3|x$ or $dots}$
  $={x in bN:x >= 2}$.

  $inter_(n=2)^infinity A_n={x in bN:2|x$ and $3|x$ and $dots}$
  $={x in bN:x$ has all natural numbers that are at least $2$ as factors$}=emptyset$.
]

== Problem 3 — sum of odd integers

Guess a formula for $1+3+dots.h+(2n-1)$, then prove it by induction.

#solution(title: [(a)])[
  $1+3+dots.h+(2n-1)=1+(2n-1)+(3+2(n+1)-1)+dots.h$.
  There are $n/2 dot.op 2n$ terms in this pairing, so the formula is $n^2$.
]

#solution(title: [(b) Proof by induction on $n$])[
  Base case: $n=1$, and $sum_(k=1)^1(2k-1)=1=1^2$.

  Inductive step: assume, for $n=k$, that $sum_(k=1)^n(2k-1)=k^2$.
  Then, for $n=k+1$,
  $
    sum_(k=1)^(k+1)(2k-1)
    = sum_(k=1)^k(2k-1)+2(k+1)-1
    = k^2+2k+1=(k+1)^2.
  $
  This finishes the proof that for all $n in bN$,
  $sum_(k=1)^n(2k-1)=k^2$.
]

== Problem 4 — $2^n>n^2$

Determine for which integers $2^n>n^2$ is true, and prove the claim by
induction.

#solution[
  The submitted claim is: $n=0$ or $n >= 5$.

  Case 1: $n=0$. Then $2^n=1$ and $n^2=0$, hence $2^n>n^2$.

  Case 2: $n >= 5$. The proof is by induction on $n$. Base case:
  $n=5$, $2^n=32$ and $n^2=25$, so $2^n>n^2$.

  Inductive step: assume for $n=k$ (where $k in bN$ and $k >= 5$) that
  $2^k>k^2$. Then $2^(k+1)=2 dot.op 2^k=2^(k+1)$ and
  $(k+1)^2=k^2+2k+1$. Note that
  $k^2-(2k+1)=(k-2)k-1$. Since $k >= 5$, $k-2 >= 3$, so
  $(k-2)k-1 >=14>0$. Therefore $k^2>2k+1$, and
  $
    2^(k+1)=2^k+2^k>k^2+k^2>k^2+2k+1=(k+1)^2.
  $
  This finishes the proof that for all integer $n >= 5$, $2^n>n^2$.
]

== Problem 5 — boundedness, supremum, and infimum

For each listed subset of $bR$, state whether it is bounded above and below,
and its supremum and infimum when they exist. The submitted one-line answers
are retained below.

- (a) $bN$: bounded below but not above; $inf=1$.
- (b) $[0,1]$: bounded below and above; $inf=0$, $sup=1$.
- (c) ${2,7}$: bounded below and above; $inf=2$, $sup=7$.
- (d) ${pi,e}$: bounded below and above; $inf=e$, $sup=pi$.
- (e) ${1/n:n in bN}$: bounded below and above; $inf=0$, $sup=1$.
- (f) ${0}$: bounded below and above; $inf=sup=0$.
- (g) $[0,1] union [2,3]$: bounded below and above; $inf=0$, $sup=3$.
- (h) $union_(n=1)^infinity[2n,2n+1]$: bounded below but not above; $inf=2$.
- (i) $inter_(n=1)^infinity[-1/n,1+1/n]$: bounded below and above; $inf=0$, $sup=1$.
- (j) ${1-1/(3n):n in bN}$: bounded below and above; $inf=2/3$, $sup=1$.
- (k) ${n+(-1)^n/n:n in bN}$: bounded below but not above; $inf=0$.
- (l) ${r in bQ:r<2}$: bounded above but not below; $sup=2$.
- (m) ${r in bQ:r^2<4}$: bounded below and above; $inf=-2$, $sup=2$.
- (n) ${r in bQ:r^2<2}$: bounded below and above; $inf=-sqrt(2)$, $sup=sqrt(2)$.
- (o) ${x in bR:x<0}$: bounded above but not below; $sup=0$.
- (p) ${1,pi/3,pi^2,10}$: bounded below and above; $inf=1$, $sup=10$.
- (q) ${0,1,2,4,8,16}$: bounded below and above; $inf=0$, $sup=16$.
- (r) $inter_(n=1)^infinity(1-1/n,1+1/n)$: bounded below and above; $inf=sup=1$.
- (s) ${1/n:n in bN$ and $n$ is prime$}$: bounded below and above; $inf=0$, $sup=1/2$.
- (t) ${x in bR:x^3<8}$: bounded above but not below; $sup=2$.
- (u) ${x^2:x in bR}$: bounded below but not above; $inf=0$.
- (v) ${cos(n pi/3):n in bN}$: bounded below and above; $inf=-1$, $sup=1$.
- (w) $union_(n=1)^infinity{k/n:k in bN}$: bounded below but not above; $inf=0$.
- (x) $inter_(n=1)^infinity{k/n:k in bN}$: bounded below but not above; $inf=1$.

== Problem 6 — no ordered-field order on $bC$

#note(title: [原稿红字])[hw 1 ①：$bC$ 上不可能 define linear relation；P：$bC$ 无法成为 ordered field。]

Assume for contradiction that a linear relation $<$ is defined on $bC$ such
that Axioms 13--14 hold: if $x<y$ then $z+x<z+y$, and if $x<y$ and $z>0$
then $x z<y z$.

Case 1: define $i>0$. By Axiom 14, multiplying both sides by $i>0$ gives
$i dot.op i>0 dot.op i$, hence $-1>0$. Multiplying both sides by $-1>0$ gives
$1>0$. By Axiom 13, $-1+1>0+1$, so $0>1$. This contradicts the definition of
$-1$ that $-1+1=0$.

Case 2: define $i=0$. Then $i^2=-1=0$ by Axiom 4, so
$1=-(-1)=0$, contradicting Axiom 5.

Case 3: define $i<0$. Then $i=-a$ for some $a in bC$ with $a>0$. Thus
$i^2=(-a)(-a)=(-1)(-1)a^2=a^2>0$, so $-1>0$ (by Axiom 5 and Axiom 14).
The same result as in Case 1 contradicts the definition of $-1$.

Since in all cases the assumption of a linear order contradicts the properties
of $bC$, it is impossible to define a linear relation on $bC$ such that Axioms
13--14 hold.

== Problem 7 — order and supremum

#note(title: [原稿红字])[hw 1 ②：判定 $sup A$ 的方法：满足任意 $epsilon>0$，都存在 $a in A$ 在 $L-epsilon$ 和 $L$ 之间。]

=== (a)

Let $a,b in bR$. If $a <= c$ for every $c>b$, then $a <= b$.

#proof[
  Suppose $a>b$ for contradiction. By density of $bQ$ in $bR$, there exists
  $q in bQ$ such that $a>q>b$. By the given condition, $a <= q$, which
  contradicts $a>q$. Hence $a <= b$.
]

=== (b)

Let $A subset.eq bR$ and let $L in bR$ be an upper bound of $A$. Show that
$L=sup A$ if and only if, for every $epsilon>0$, there is $a in A$ such that
$L-epsilon<a<=L$.

#proof[
  One direction: assume $L=sup A$. Suppose for contradiction that, for some
  $epsilon>0$, there is no $a in A$ such that $L-epsilon<a<=L$. Since
  $L=sup A$, no $a in A$ satisfies $a>L$. Combining the two statements,
  no $a in A$ satisfies $a>L-epsilon$. Thus $L-epsilon$ is an upper bound of
  $A$, contradicting the definition of supremum since $L-epsilon<L$.

  The other direction: assume that for every $epsilon>0$ there is $a in A$
  with $L-epsilon<a<=L$. Let $M$ be an arbitrary upper bound of $A$. If
  $M<L$, then there is $a in A$ with $M<a<=L$, contradicting that $M$ is an
  upper bound. Therefore $M>=L$. Since $M$ is arbitrary, $L=sup A$.
]

== Problem 8 — bounded sets

Let $S$ and $T$ be nonempty bounded subsets of $bR$.

#note(title: [原稿红字])[hw 1 ③：$sup(S union T)=max{sup S,sup T}$。]

=== (a)

#proof[
  Take arbitrary $s in S$. By the definitions of upper and lower bounds,
  $inf S<=s$ and $sup S>=s$. Hence $inf S<=sup S$ by transitivity of the
  linear order and equivalence relation.
]

=== (b)

If $S subset.eq T$, the submitted order is
$inf T<=inf S<=sup S<=sup T$.

#proof[
  Part (a) gives $inf S<=sup S$. It remains to prove $inf T<=inf S$ and
  $sup S<=sup T$. Let $s in S$; since $S subset.eq T$, $s in T$. Thus every
  upper bound of $T$ is also an upper bound of $S$, and every lower bound of
  $T$ is also a lower bound of $S$. Therefore the lower bounds of $T$ are
  included in the lower bounds of $S$, while the upper bounds of $T$ are
  included in the upper bounds of $S$. Hence $inf S>=inf T$ and $sup T<=sup S$.
]

=== (c)

#proof[
  First claim: $max(sup S,sup T)$ is an upper bound of $S union T$. Let $x$ be
  an arbitrary element of $S union T$. If $x in S$, then $x<=sup S$, so
  $x<=max(sup S,sup T)$. If $x in T$, then $x<=sup T$, so again
  $x<=max(sup S,sup T)$. Hence $max(sup S,sup T)$ is an upper bound of
  $S union T$.

  Let $b$ be an arbitrary upper bound of $S union T$. Then $b$ is an upper
  bound of both $S$ and $T$. Suppose $b<max(sup S,sup T)$. Without loss of
  generality suppose $b<sup S$. Then $b$ is not an upper bound of $S$, a
  contradiction. Therefore $b>=max(sup S,sup T)$, which proves
  $sup(S union T)=max(sup S,sup T)$.
]

== Problem 9 — supremum of a sum set

Let $A$ and $B$ be nonempty bounded subsets of $bR$, and let
$A+B={a+b:a in A$ and $b in B}$. Prove $sup(A+B)=sup A+sup B$.

#proof[
  First claim: $sup A+sup B$ is an upper bound of $A+B$. Let $a+b$ be an
  arbitrary element of $A+B$ ($a in A$, $b in B$). Then $sup A>a$ and
  $sup B>b$, hence $sup A+sup B>a+sup B>a+b$. Thus
  $sup(A+B)<=sup A+sup B$.

  Now show $sup A+sup B<=sup(A+B)$. Assume for contradiction that
  $sup(A+B)<sup A+sup B$. Then, for some $epsilon>0$,
  $sup(A+B)=sup A+sup B-epsilon=(sup A-epsilon/2)+(sup B-epsilon/2)$.
  By definition of supremum, $sup A-epsilon/2$ is not an upper bound of $A$,
  so there is $a_0 in A$ with $a_0>sup A-epsilon/2$. Similarly, there is
  $b_0 in B$ with $b_0>sup B-epsilon/2$. Therefore $a_0+b_0 in A+B$ but
  $a_0+b_0>sup(A+B)$, a contradiction. Thus $sup A+sup B<=sup(A+B)$.
]

== Problem 10 — density of irrationals

Prove that $bR without bQ$ is dense in $bR$.

#proof[
  Take arbitrary $a,b in bR$ with $a<b$. Then $b=a+epsilon$ for some
  $epsilon in bR$ with $epsilon>0$. By the Archimedean property of $bR$, there
  exists $n in bN$ such that $n>1/epsilon$, so $epsilon>1/n$. Consider
  $epsilon'=1/(n sqrt(2))=1/n dot.op sqrt(2)/2$, which is irrational since
  $1/n in bQ$ and $sqrt(2)/2$ is irrational. Also $epsilon'<epsilon$, since
  $sqrt(2)/2<1$; by Axiom 14,
  $1/n dot.op sqrt(2)/2<1/n dot.op 1=1/n$. Therefore
  $a<a+epsilon'<a+epsilon=b$. Hence $bR without bQ$ is dense in $bR$.
]

== Problem 11 — discrete sets

A set $A subset.eq bR$ is discrete if for every $a in A$ there is
$epsilon>0$ such that $V_epsilon(a) intersect A={a}$, where
$V_epsilon(a)=(a-epsilon,a+epsilon)$.

#note(title: [原稿红字])[hw 1 ④：任意 finite $A subset.eq bR$ 一定 discrete。]

=== (a)

#proof[
  Let $A subset.eq bR$ be an arbitrary finite set and let $a in A$ be
  arbitrary. Consider $B={|a-x|:x in A}$. This is finite since $A$ is finite,
  so $B$ has a smallest element. Let $epsilon=min(B)$. Then
  $V_epsilon(a)=(a-epsilon,a+epsilon)$, where $epsilon$ is the distance of
  $a$ from its nearest element in $A$. Thus $V_epsilon(a) intersect A={a}$.
  Since $a$ is arbitrary, $A$ is discrete.
]

=== (b)

#solution(title: [False — counterexample])[
  Consider $A={1/n:n in bN}$. This is a discrete set: for any $1/n in A$,
  consider $epsilon=1/n-1/(n+1)$. Then
  $V_epsilon(1/n)=(1/(n+1),2/n-1/(n+1))$, so
  $V_epsilon(1/n) intersect A={1/n}$. But no uniform $epsilon$ exists. If it
  did, then $1/n-1/(n+1)>epsilon$ for all $n in bN$, so
  $epsilon<1/(n(n+1))$ for all $n in bN$, which contradicts the Archimedean
  property of $bR$.
]

#pagebreak()

== Problem 12 — optional challenge problem

For $A,B subset.eq bR$, let $A B={a b:a in A$ and $b in B}$. The submitted
answer, without a proof, is

$sup(A B)=max{inf A dot.op inf B, inf A dot.op sup B, sup A dot.op inf B, sup A dot.op sup B}$.

// TODO(source: 451-Hw-1.pdf, p.18): the page is blank in the personal PDF;
// no additional personal work follows the written Problem 12 answer on p.17.
