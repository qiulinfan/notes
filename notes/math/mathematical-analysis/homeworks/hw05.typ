#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let intersect = math.inter
#let dom = math.op("dom")

// Personal authority: Homework/451-hw-5.pdf pp.1–15.
// Checking-only sources: 451-hw-5-raw.pdf pp.1–2; 451-hw-sol-all.pdf pp.17–20.
= Homework 5: uniform continuity and differentiation

#remark(title: [Authority label])[
  This is a transcription of personal work in `451-hw-5.pdf`. The raw
  assignment and sample solutions are retained only as checking aids for
  problem numbering and symbols.
]

#remark(title: [原稿红字旁注])[
  - hw5① 在 $[0,infinity)$ 上的 ctn function，只要在某个 $[a,infinity)$ 上 uni. ctn，一定整体上 uni. ctn。（闭方向上的 uni. ctn 不推出整体的 uni. ctn。）
  - hw5② ctn function $f$ 如果在集合个 limit pt. $a$ 附近 uni. ctn，则可以将 ctnly 延伸到 $dom(f) union {a}$，且 $g(a)=lim_(x -> a)f(x)$；后注：``修正这段不行''。
  - hw5③ 两个 uni. ctn. 函数的 composition 仍是 uni. ctn. 的。
  - hw5④ 若 $f(a)=g(a)$ 且 $f'(x)<=g'(x)$ for all $x>=a$，则 $f(x)<=g(x)$ for all $x>=a$。
  - hw5⑤ $f$ 在闭区间上 diffble，则一定 bounded；而 $f'$ 则未必 bounded。$f$ 在开区间上 diffble 且 $f'$ bounded $=> f$ 一定 bounded。
  - hw5⑥ $f'(x)>=0$ iff $f$ weakly ↑；$f'(x)>0 => f$ strictly ↑（←）。
]

== Problem 1

*Suppose $(U_i:i in I)$ is a family of nonempty open sets in $bR$ such that
$U_i intersect U_j=emptyset$ whenever $i!=j$. Prove that $I$ is countable.*

#proof[
  Let $i in I$ be arbitrary, and let $x in U_i$. By definition there is
  $epsilon>0$ with $V_epsilon(x) subset U_i$. By density of $bQ$ in $bR$,
  choose $q in bQ$ with $q in V_epsilon(x) subset U_i$. Define
  $f:I -> bQ$ by sending each $i$ to a rational number in $U_i$. Since the
  $U_i$ are pairwise disjoint, $f$ is injective. Hence $I subset bQ$ in the
  sense of an injection, so $I$ is countable.
]

== Problem 2

*Determine whether each continuous function is uniformly continuous on the
given interval: (a) $x^3$ on $[0,1]$; (b) $x^3$ on $(0,1)$; (c) $x^3$ on
$bR$; (d) $1/x^3$ on $(0,1]$.*

=== (a)

$x^3$ is uniformly continuous because it is continuous on $bR$ and $[0,1]$
is closed and bounded.

=== (b)

Let $epsilon>0$ and take $delta=epsilon/3$. If $x,y in (0,1)$ and
$abs(x-y)<delta$, then
$
  abs(x^3-y^3)=abs(x-y)abs(x^2+x y+y^2)<(epsilon/3) dot 3=epsilon.
$
Thus $x^3$ is uniformly continuous on $(0,1)$.

=== (c)

It is not uniformly continuous. Take $epsilon=1$. Let $delta>0$ be
arbitrary and take $x=sqrt(epsilon/delta)$, $y=x+delta/3$. Then
$
  (x+delta/3)^3-x^3
  = (delta/3)((x+delta/3)^2+(x+delta/3)x+x^2)
  > delta x^2 = epsilon.
$

=== (d)

It is not uniformly continuous. Take $epsilon=1$. Given $delta>0$, take
$x=min(1-delta/3,sqrt(epsilon/delta))$ and $y=x+delta/3$. The source records
the computation
$
  abs(1/x^3-1/(x+delta/3)^3)
  = ((x+delta/3)^3-x^3)/(x^3(x+delta/3)^3),
$
and uses the preceding lower bound while $x^3(x+delta/3)^3<=1$ to obtain a
quantity greater than $epsilon$.

== Problem 3

*Prove that if there is $a>0$ such that a continuous
$f:[0,infinity)->bR$ is uniformly continuous on $[a,infinity)$, then $f$ is
uniformly continuous.*

#proof[
  Suppose $f$ is continuous and uniformly continuous on $[a,infinity)$.
  Since $[0,a]$ is closed, $f$ is uniformly continuous there. Let
  $epsilon>0$. Take $delta_1>0$ for $[0,a]$ and $delta_2>0$ for
  $[a,infinity)$, each giving $abs(f(x)-f(y))<epsilon/2$. Set
  $delta=min(delta_1,delta_2)$.

  Let $x,y in [0,infinity)$ with $abs(x-y)<delta$. If both points are in
  $[0,a]$, use $delta_1$; if both are in $[a,infinity)$, use $delta_2$. In
  the remaining case, assume $x in[0,a]$ and $y in[a,infinity)$. Then
  $abs(x-a)=a-x<delta$ and $abs(y-a)=y-a<delta$, so
  $
    abs(f(x)-f(y)) <= abs(f(x)-f(a))+abs(f(a)-f(y))<epsilon.
  $
  Thus $f$ is uniformly continuous.
]

== Problem 4

*Let $A subset bR$, let $f:A -> bR$ be continuous, and suppose
$a in A' without A$. Suppose further that $f$ is uniformly continuous on
$V_epsilon(a) intersect A$ for some $epsilon>0$. (a) Prove that any two
sequences $(a_n)$ and $(b_n)$ in $A$ converging to $a$ have the same
$f$-limit. (b) Prove that $f$ extends continuously to $A union {a}$.*

=== (a)

#proof[
  Assume the hypotheses and write $lim f(a_n)=L$. Let $epsilon_2>0$.
  Since $a_n,b_n -> a$, there is $N_1$ such that
  $a_n,b_n in V_epsilon(a) intersect A$ whenever $n>=N_1$. Uniform continuity
  gives $delta>0$ with $abs(f(b_n)-f(a_n))<epsilon_2/2$ whenever
  $abs(a_n-b_n)<delta$. Since $a_n-b_n -> 0$, this holds beyond some $N_2$.
  Also choose $N_3$ with $abs(f(a_n)-L)<epsilon_2/2$ for $n>=N_3$.
  For $N=max(N_1,N_2,N_3)$ and $n>=N$,
  $
    abs(f(b_n)-f(a_n))
    <= abs(f(b_n)-f(a_n))+abs(f(a_n)-L)<epsilon_2.
  $
  Therefore $lim f(a_n)=lim f(b_n)$.
]

=== (b)

Define
$
  g(x)=f(x) " for " x in A,
  quad g(a)=lim_(x -> a)f(x).
$
Then $g bar.v A=f$. Since $a in A'$ and $dom(g)=A union {a}$,
$a in (dom(g))'$. The preceding part gives
$lim_(x -> a)g(x)=lim_(x -> a)f(x)=g(a)$, so $g$ is continuous at $a$.
It is already continuous on $A$, and hence is continuous on its domain.

== Problem 5

*Show that a composition of uniformly continuous functions is uniformly
continuous: if $f:A -> bR$ and $g:B -> bR$ are uniformly continuous and
$"range"(f) subset B$, then $g compose f$ is uniformly continuous.*

#proof[
  Let $epsilon>0$. Take $delta_1>0$ such that
  $abs(g(a)-g(b))<epsilon$ when $abs(a-b)<delta_1$, for $a,b in B$. Take
  $delta_2>0$ such that $abs(f(x)-f(y))<delta_1$ when
  $abs(x-y)<delta_2$, for $x,y in A$. Then $abs(x-y)<delta_2$ implies
  $
    abs(g(f(x))-g(f(y)))<epsilon.
  $
]

== Problem 6

*Find the derivatives from the definition: (a) $y=1/x$; (b) $y=x^3$.*

=== (a)

$
  f'(x)=lim_(h -> 0) ((1/(x+h)-1/x)/h)
  =lim_(h -> 0)(-1/(x(x+h)))=-1/x^2.
$

=== (b)

$
  f'(x)=lim_(h -> 0)(((x+h)^3-x^3)/h)
  =lim_(h -> 0)(3x^2+3x h+h^2)=3x^2.
$

== Problem 7

*Define $f:bR -> bR$ by $f(x)=x^2$ for $x in bQ$ and $f(x)=x^3$ for
$x in bR without bQ$. Find all points where $f$ is continuous and differentiable
(no justification needed).*

The personal answer: $f$ is continuous only at $x=0$, and differentiable only
at $x=0$.

== Problem 8

*Show that if $abs(f(x)-f(y))<=(x-y)^2$ for all $x,y in bR$, then
$f:bR -> bR$ is constant.*

#proof[
  Fix $y in bR$ and let $x in bR$ be arbitrary. Consider
  $g(x)=(f(x)-f(y))/(x-y)$. The hypothesis yields
  $0<=abs(g(x))<=abs(x-y)$. By the squeeze theorem,
  $lim_(x -> y)g(x)=0$, and the source concludes $f(x)-f(y)=0$. Since $y$
  is arbitrary, $f$ is constant.
]

== Problem 9

*If $f$ and $g$ are differentiable on $bR$, $f(0)=g(0)$, and
$f'(x)<=g'(x)$ for all $x in bR$, prove $f(x)<=g(x)$ for all $x>=0$.*

#proof[
  Let $h(x)=f(x)-g(x)$. Then $h'(x)=f'(x)-g'(x)<=0$, so $h$ is decreasing
  on $bR$. Since $h(0)=0$, for $x>=0$ we have $h(x)<=0$. Thus
  $f(x)<=g(x)$.
]

== Problem 10

*Let $a<b$. Decide each assertion: (a) differentiable
$f:[a,b]->bR$ is bounded; (b) such $f'$ is bounded; (c) differentiable,
bounded $f:(a,b)->bR$ has bounded $f'$; (d) differentiable $f:(a,b)->bR$
with bounded $f'$ is bounded.*

=== (a)

True. A differentiable function is continuous, so the extreme value theorem on
the closed, bounded interval gives $x_0,y_0 in[a,b]$ with
$f(x_0)<=f(x)<=f(y_0)$ for all $x$. Hence the function is bounded.

=== (b)

False. The source gives
$f(x)=x^2 sin(1/x^2)$ for $x!=0$ and $f(0)=0$ on $[-1,1]$. It records
$f'(0)=lim_(x -> 0)x sin(1/x^2)=0$, while for $x!=0$,
$
  f'(x)=2x sin(1/x^2)-2 cos(1/x^2)/x,
$
which is unbounded near $0$.

=== (c)

False, by restricting the same counterexample to $(-1,1)$.

=== (d)

True. Suppose $abs(f'(x))<=M$ on $(a,b)$. Choose $a<m<n<b$; then $f$ is
differentiable on $[m,n]$, so the extreme value theorem gives a point
$k in[m,n]$ controlling $f$ there. For arbitrary $x in(a,b)$, the mean value
theorem gives a point between $x$ and $k$ with
$f(x)-f(k)<=M(x-k)$. Thus
$
  M(a-k)+f(k)<=f(x)<=M(b-k)+f(k),
$
so $f$ is bounded.

== Problem 11

*For differentiable $f:(a,b)->bR$, decide the converses of: (a) $f'>=0$
implies $f$ increasing; (b) $f'>0$ implies $f$ strictly increasing.*

=== (a)

#proof[
  The converse is true. Assume $f$ is increasing and let $x in(a,b)$. If
  $f'(x)<0$, take $epsilon=-f'(x)/2$. The derivative definition gives a
  $delta>0$ such that for $0<h<delta$,
  $
    3f'(x)/2 < (f(x+h)-f(x))/h < -f'(x)/2 < 0.
  $
  But $h>0$ and $f$ increasing imply $(f(x+h)-f(x))/h>=0$, a contradiction.
  Hence $f'(x)>=0$.
]

=== (b)

The converse is false: $f(x)=x^3$ is strictly increasing on $[0,1]$, but
$f'(0)=0$.

== Problem 12

*Let $f:bR -> bR$ be differentiable. Prove that if $lim_(x -> infinity)f(x)$
and $lim_(x -> infinity)f'(x)$ both exist, then $lim_(x -> infinity)f'(x)=0$.*

#proof[
  Assume the hypotheses and, for a contradiction, suppose
  $lim_(x -> infinity)f'(x)=M!=0$. Write $lim_(x -> infinity)f(x)=L$.
  Let $0<epsilon<M$. Choose $N_1,N_2$ so that $abs(f(x)-L)<epsilon$ for
  $x>=N_1$ and $abs(f'(x)-M)<epsilon$ for $x>=N_2$. For
  $N=max(N_1,N_2)$, $L-epsilon<f(N)<L+epsilon$ and
  $f'(x)>M-epsilon$ for $x>=N$.

  Take $x=N+2epsilon/(M-epsilon)$. By the mean value theorem, some
  $c in(N,x)$ has
  $
    f'(c)=(f(x)-f(N))/(x-N)>M-epsilon.
  $
  Hence $f(x)-f(N)>2epsilon$, so $f(x)>L+epsilon$, contradicting the choice
  of $N_1$. Thus the derivative limit is $0$.
]

== Problem 13

*Let $f:bR -> bR$ be differentiable at $a$. (a) If $f'(a)>0$, prove that
there is $delta>0$ such that $f(x)>f(a)$ for $x in(a,a+delta)$. (b) Decide
whether this implies $f$ is strictly increasing on $(a,a+delta)$.*

=== (a)

#proof[
  Let $epsilon=f'(a)/2$. By differentiability there is $delta>0$ such that
  $
    abs((f(x)-f(a))/(x-a)-f'(a))<epsilon
  $
  for $x in(a,a+delta)$. Hence
  $(f(x)-f(a))/(x-a)>f'(a)/2>0$, and, since $x-a>0$, $f(x)>f(a)$.
]

=== (b)

The personal answer is true. Use the same $delta$ and let
$a<x_1<x_2<a+delta$. By the mean value theorem,
$
  (f(x_2)-f(x_1))/(x_2-x_1)=f'(c)
$
for some $c in(x_1,x_2)$. By (a), $f'(c)>0$, so $f(x_2)>f(x_1)$ and $f$ is
strictly increasing on $(a,a+delta)$.

== Optional challenge problems 14–15

The source has only the printed prompts and no handwritten response:

- *(14)* For increasing $(a_n)$ and decreasing $(b_n)$ with $a_m<b_n$, decide
  whether $intersect_(n in bN)(a_n,b_n)$ must be nonempty, given that
  $intersect_(n in bN)[a_n,b_n]!=emptyset$.
- *(15)* Decide whether an open $U subset bR$ can contain $bQ$ while
  $bR without U$ is uncountable.

// TODO(source: 451-hw-5.pdf p.15, optional problems 14–15): no personal
// handwritten solution appears in the source.
