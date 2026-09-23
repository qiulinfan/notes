#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let intersect = math.inter
#let cl = math.op("cl")

// Personal authority: Homework/451-hw-4.pdf pp.1–15.
// Checking-only sources: 451-hw-4-raw.pdf pp.1–2; 451-hw-sol-all.pdf pp.13–16.
= Homework 4: limits and closure

#remark(title: [Authority label])[
  This transcription follows the personal handwritten work in
  `451-hw-4.pdf`. The raw assignment and sample solutions are used only to
  check problem numbering and notation; they are not substituted for personal
  work.
]

#remark(title: [原稿红字旁注])[
  - hw4① $lim(a_(n+1)-a_n)=0$ 未必有 $(a_n)$ conv.；反例：$a_n=sqrt(n)$。
  - hw4③ $forall A subset bR$，都有 $A'$、$cl(A)$ 为 closed 的，且 $cl(A)$ 为最小的含 $A$ 闭集。
  - hw4④ composition limit law 需搞清楚 upper/lower limit。
  - hw4⑤ $limsup abs(a_n)^(1/n) <= limsup abs(a_(n+1)/a_n)$。
  - hw4⑦ 如果 $A subset bR$ 不是 closed，那么 $A$ 上存在 unbounded ctn function。
]

== Problem 1

*Do Challenge Problem (14) from HW 2: if $(a_n)$ is a sequence in $bR$ and
$lim_(n -> infinity) (a_(n+1) - a_n) = 0$, must $(a_n)$ converge? Justify
your answer.*

No. A counterexample is $a_n = sqrt(n)$. Then
$
  lim_(n -> infinity) (a_(n+1) - a_n)
  = lim_(n -> infinity) (sqrt(n+1) - sqrt(n))
  = lim_(n -> infinity) 1 / (sqrt(n+1) + sqrt(n)) = 0,
$
but $lim_(n -> infinity) a_n = lim_(n -> infinity) sqrt(n) = infinity$.

== Problem 2

*Let $(a_n)$ be a sequence in $bR$, and let $S subset bR$ be its set of real
subsequential limits. Prove that $S$ is closed.*

#proof[
  Let $c in S'$ be arbitrary. We show $c in S$: that is, there is a
  subsequence of $(a_n)$ converging to $c$.

  Let $m in bN$. Since $c in S'$, $V_(1/(2m))(c) intersect S without {c} != emptyset$.
  Choose $x in V_(1/(2m))(c) intersect S without {c}$. Then $x in S$ and
  $abs(x-c) <= 1/(2m)$, so there is a subsequence $(a_(n_k))$ of $(a_n)$ such
  that $a_(n_k) -> x$ as $k -> infinity$, where $(n_k)$ is monotonically
  increasing. Hence there is $K_m in bN$ such that, for all $k >= K_m$,
  $abs(a_(n_k)-x) <= 1/(2m)$.

  Construct $(b_m)$ recursively. For $m=1$, choose $a_(n_k)$ as $b_m$. If
  $m>1$ and $b_(m-1)=a_(n_(k_0))$, take $k=max(K_m,k_0)+1$ and choose
  $a_(n_k)$ as $b_m$. Then
  $
    abs(b_m-c) <= abs(b_m-x)+abs(x-c) <= 1/m.
  $
  Thus $(b_m)$ is a subsequence of $(a_n)$, because every term is a term of
  $(a_n)$ with increasing index. For $epsilon>0$, choose $n in bN$ with
  $epsilon>1/n$, and take $N=n+1$. Then
  $abs(b_m-c) <= 1/(m+1)<epsilon$ for every $m>=N$. Thus $b_m -> c$.

  We have proved $c$ is a subsequential limit of $(a_n)$. Since $c$ was
  arbitrary, $S' subset S$, so $S$ is closed.
]

== Problem 3

*Given $A subset bR$, write $A'$ for the set of all limit points of $A$ and
define $cl(A)=A union A'$. (a) Prove that $A'$ is closed. (b) Prove that
$cl(A)$ is closed. (c) Prove that $cl(A)$ is the smallest closed set
containing $A$.*

=== (a)

#proof[
  Let $c in (A')^c$. Then $c$ is not a limit point of $A$, so for some
  $epsilon>0$,
  $
    V_epsilon(c) intersect A without {c} = emptyset.
  $
  Let $x in V_(epsilon/2)(c)$ be arbitrary. Since $abs(x-c)<epsilon/2$,
  $V_(abs(x-c))(x) intersect A=emptyset$. Thus $x in.not A'$, which implies
  $x in (A')^c$. Hence $V_(epsilon/2)(c) subset (A')^c$. Since $c$ is
  arbitrary, $(A')^c$ is open, and so $A'$ is closed.
]

=== (b)

#proof[
  Let $c in (cl(A))^c$. Then $c in.not A$ and $c in.not A'$. Fix
  $epsilon>0$ such that $V_(epsilon/2)(c) intersect A without {c}=emptyset$.
  Since $c in.not A$, also $V_(epsilon/2)(c) intersect A=emptyset$. If
  $x in V_(epsilon/2)(c)$, then $x in.not A$ and
  $V_(epsilon/2)(x) subset V_epsilon(c)$, so
  $V_(epsilon/2)(x) intersect A=emptyset$ and $x in.not A'$. Therefore
  $V_(epsilon/2)(c) subset (cl(A))^c$. Thus $(cl(A))^c$ is open, and
  $cl(A)$ is closed.
]

=== (c)

#proof[
  Let $F$ be a closed set with $A subset F$. Let $a in A'$ be arbitrary and
  let $(a_n)$ be a sequence in $A$ converging to $a$. Since $A subset F$ and
  $F$ is closed, $a=lim a_n in F$. Thus $A' subset F$, so
  $cl(A)=A' union A subset F$. Since $F$ was arbitrary, this proves that
  $cl(A)$ is the smallest closed set containing $A$.
]

== Problem 4

* (a) Prove explicitly using the $epsilon/delta$ definition that
$lim_(x -> 2) x^3=8$. (b) Given $epsilon>0$, find the largest $delta>0$
such that $abs(x^3-8)<epsilon$ whenever $abs(x-2)<delta$. (c) Prove
explicitly using the $epsilon/delta$ definition that $lim_(x -> 4) sqrt(x)=2$.
(d) Given $epsilon>0$, find the largest $delta>0$ such that
$abs(sqrt(x)-2)<epsilon$ whenever $abs(x-4)<delta$.*

=== (a)

#proof[
  Let $epsilon>0$. Since
  $
    abs(x^3-8)=abs(x-2) abs(x^2+2x+4),
  $
  and, for $1<x<3$, $abs(x^2+2x+4)=(x+1)^2+3 in [3,19]$, take
  $delta=min(1,epsilon/19)$. If $0<abs(x-2)<delta$, then
  $
    abs(x^3-8)<delta dot 19<epsilon.
  $
  Hence $lim_(x -> 2)x^3=8$.
]

=== (b)

For $epsilon>0$ we want $(2-delta)^3 >= 8-epsilon$ and
$(2+delta)^3 <= 8+epsilon$. Thus
$
  delta <= 2-root(3, 8-epsilon)
  quad"and"quad
  delta <= root(3, 8+epsilon)-2.
$
The personal calculation records the largest value as
$delta=root(3, 8+epsilon)-2$.

=== (c)

#proof[
  Let $epsilon>0$. Since
  $
    abs(sqrt(x)-2) = abs(x-4)/(abs(sqrt(x)+2))
  $
  and $abs(sqrt(x)+2)>=2$, take $delta=epsilon$. If
  $0<abs(x-4)<delta$, then
  $
    abs(sqrt(x)-2) < delta/2 <= delta < epsilon.
  $
  Hence $lim_(x -> 4)sqrt(x)=2$.
]

=== (d)

For $epsilon>0$ we want $sqrt(4+delta)<=2+epsilon$ and
$sqrt(4-delta)>=2-epsilon$. Thus
$
  delta <= (2+epsilon)^2-4
  quad"and"quad
  delta <= (2-epsilon)^2-4.
$
The personal calculation records the largest value as
$delta=(2+epsilon)^2-4$.

== Problem 5

*Let $A subset bR$, let $f:A -> bR$, suppose $a in bR$ is a limit point of
$A intersect (a,infinity)$, and suppose $lim_(x -> a^+)f(x)=infinity$. Let
$g:(c,infinity)->bR$ and suppose $lim_(x -> infinity)g(x)=L in bR$. Prove
that $lim_(x -> a^+)(g compose f)(x)=L$.*

#proof[
  Let $epsilon>0$. There is $N in bR$ such that
  $abs(g(x)-L)<epsilon$ whenever $x>=N$. Also, since
  $lim_(x -> a^+)f(x)=infinity$, there is $delta>0$ such that
  $f(x)>=N$ whenever $0<x-a<delta$. Therefore, if $a<x<a+delta$, then
  $abs(g(f(x))-L)<epsilon$. Hence
  $lim_(x -> a^+)(g compose f)(x)=L$.
]

== Problem 6

*Let $f,g:bR -> bR$, let $a in bR$, and suppose $lim_(x -> a)f(x)=b$ and
$lim_(x -> b)g(x)=L$. Show by example that $L$ need not be the limit of
$g compose f$ as $x -> a$.*

Consider $f(x)=0$ if $x!=1$, and $f(1)=1$. Also, let $g(0)=2$ and
$g(x)=0$ if $x!=0$. Then $lim_(x -> 1)f(x)=0$ and
$L=lim_(x -> 0)g(x)=0$, but $g(f(x))=2$ if $x!=1$ and $g(f(1))=0$.
Hence $lim_(x -> 1)g(f(x))=2 != 0$.

== Problem 7

*Prove that for any sequence $(a_n)$ of nonzero real numbers,
$limsup abs(a_n)^(1/n) <= limsup abs(a_(n+1)/a_n)$.*

#proof[
  Let $L>limsup abs(a_(n+1)/a_n)$ be arbitrary. Then there is $N in bN$
  such that $abs(a_(n+1)/a_n)<L$ whenever $n>=N$. For $n>=N$,
  $
    abs(a_n) = abs(a_n/a_(n-1)) dot abs(a_(n-1)/a_(n-2)) dots
      abs(a_(N+1)/a_N) dot abs(a_N) < L^(n-N) abs(a_N).
  $
  Hence
  $
    abs(a_n)^(1/n) < L^((n-N)/n) abs(a_N)^(1/n)
    = L root(n, L^(-N)abs(a_N)).
  $
  The final factor tends to $1$, and hence
  $limsup abs(a_n)^(1/n) <= L$. Since this holds for every
  $L>limsup abs(a_(n+1)/a_n)$, the required inequality follows.
]

== Problem 8

*Let $A subset bR$, suppose $a in A intersect A'$, and let $f:A -> bR$.
Prove that if $f(a)>0$ and $f$ is continuous at $a$, then there is
$epsilon>0$ such that $f$ is positive and bounded on $A intersect V_epsilon(a)$.*

#proof[
  Since $f$ is continuous at $a$, there is $epsilon>0$ such that
  $abs(f(a)-f(x))<f(a)$ whenever $abs(a-x)<epsilon$ and $x in A$. Thus
  $0<f(x)<2f(a)$ whenever $x in V_epsilon(a) intersect A$. Therefore $f$ is
  positive and bounded on $A intersect V_epsilon(a)$.
]

== Problem 9

*Suppose $f,g:bR -> bR$ are continuous. Prove that if $f(x)=g(x)$ for all
$x in bQ$, then $f=g$.*

#proof[
  Let $a in bR without bQ$ be arbitrary, and let $epsilon>0$. By continuity of
  $f$, there is $delta>0$ such that $abs(f(x)-f(a))<epsilon/2$ whenever
  $x in V_delta(a)$. By density of $bQ$ in $bR$, choose
  $q in bQ intersect V_delta(a)$. Then $abs(f(a)-f(q))<epsilon/2$;
  similarly, $abs(g(q)-g(a))<epsilon/2$. Since $q in bQ$,
  $f(q)=g(q)$, and so
  $
    abs(f(a)-g(a)) <= abs(f(a)-f(q))+abs(f(q)-g(a))<epsilon.
  $
  Thus $f(a)=g(a)$. Since $a$ was arbitrary, $f=g$ on
  $bQ union (bR without bQ)=bR$.
]

== Problem 10

*Prove that if $A subset bR$ is not closed, then there is an unbounded
continuous function $f:A -> bR$.*

#proof[
  Since $A$ is not closed, choose $c in A'$ with $c in.not A$. Define
  $f:A -> bR$ by $f(x)=1/abs(x-c)$. This is well defined, and is continuous
  as a composition of the continuous rational function $1/(x-c)$ and the
  absolute-value function.

  Let $m in bN$. Since $c in A'$, there is $x in A$ with
  $0<abs(x-c)<1/m$. Thus $f(x)>m$. Hence $f$ is unbounded.
]

== Problem 11

*Using only the definitions of continuity and open set, prove that for any
$f:bR -> bR$, $f$ is continuous if and only if $f^(-1)[V]$ is open for every
open set $V subset bR$.*

#proof[
  Suppose $f$ is continuous and let $V subset bR$ be open. If
  $x in f^(-1)[V]$, then $f(x) in V$, so there is $epsilon>0$ with
  $V_epsilon(f(x)) subset V$. By continuity, there is $delta>0$ such that
  $abs(f(x)-f(y))<epsilon$ whenever $abs(x-y)<delta$. Thus
  $V_delta(x) subset f^(-1)[V]$, proving $f^(-1)[V]$ open.

  Conversely, suppose $f^(-1)[V]$ is open for every open $V subset bR$.
  Let $x in bR$ and $epsilon>0$, and take
  $V={y in bR: abs(f(x)-y)<epsilon}=V_epsilon(f(x))$. Then $f^(-1)[V]$ is
  open and contains $x$, so some $V_delta(x)$ lies in $f^(-1)[V]$. Therefore
  $abs(f(a)-f(x))<epsilon$ whenever $abs(x-a)<delta$. Thus $f$ is continuous
  at $x$, and hence continuous.
]

== Problems 12–14

The source records these printed problems but no handwritten response:

- *(12)* If $A subset bR$ is closed and $f:A -> bR$ is continuous, prove
  there is a continuous $g:bR -> bR$ with $g bar.v A=f$.
- *(13)* For pairwise disjoint nonempty open sets $(U_i)_(i in I)$ in $bR$,
  prove $I$ is countable.
- *(14a)* Prove an open subset of $bR$ is a union of countably many open
  intervals; *(14b)* decide whether the intervals can be chosen with rational
  endpoints.

// TODO(source: 451-hw-4.pdf p.13, problems 12–14; pp.14–15): the personal
// submission contains no handwritten solution for these printed problems.
