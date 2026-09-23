---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/mathematical-analysis/chapters/03-sequences-and-topology.typ"
kgd_source_format: "typst"
kgd_source_sha256: "3516330eb8533aff49c984a1afa8e5c571a2ce7642440b553dc023116ce7f0a8"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let bC = math.bb("C")

= Sequences and metric topology

== Sequences and elementary limits

// Source: lectures/L05-Seq&Limit.pdf p.1.

#definition(title: [Sequence])[
  一个 sequence 是一个 function，其 domain 为某个 $n_0 in bZ$ 的
  $ {n in bZ:n>=n_0}$；其 values 称为 terms。For $s:bN->bR$，write
  $s_n$、$(s_n)_(n in bN)$，or $(s_n)_1^infinity$。
]

源页强调 ``order matters in seq.!!''。其 examples 是 constant
sequence $(0,0,0,dots)$、harmonic sequence $(1/n)_(n in bN)$、
$(2^(-n))_(n in bN union {0})$, the Fibonacci sequence
$s_1=s_2=1$, $s_(n+2)=s_(n+1)+s_n$, $((-1)^n)_(n in bN)$, decimal
approximations to $pi$, and $(1+1/n)^n$.

#definition(title: [Convergence in $bR$])[
  A sequence $(s_n)$ converges to $l in bR$ if, for every $epsilon>0$,
  there is $N in bN$ such that $abs(s_n-l)<epsilon$ whenever $n>=N$.
  Write $lim_(n->infinity)s_n=l$ or $s_n->l$.
]

不存在 $l in bR$ 使其 converges 的 sequence 称为 divergent。源页还定义：对每个
$M in bR$ 都 eventually $s_n>M$ 时 $s_n->+infinity$；$s_n->-infinity$ 对偶。
其 examples 是：

- a constant sequence converges to its constant;
- $1/n->0$ by the Archimedean property;
- $2^(-n)->0$;
- Fibonacci terms diverge to $+infinity$;
- $(-1)^n$ does not converge;
- decimal approximations converge to $pi$; and
- $(1+1/n)^n->e$ (the definition of $e$ appears later).

#theorem(title: [Every real is a rational-sequence limit])[
  For every $r in bR$, there is a sequence $(q_n)$ in $bQ$ such that
  $q_n->r$.
]

Use density to choose $q_n in bQ$ with $r<q_n<r+1/n$.

#theorem(title: [Uniqueness of limit])[
  If $s_n->l_1$ and $s_n->l_2$, then $l_1=l_2$.
]

Given $epsilon>0$, choose $N=max(N_1,N_2)$ so that both
$abs(s_n-l_i)<epsilon/2$ after $N$.  Then
$abs(l_1-l_2)<=abs(l_1-s_n)+abs(s_n-l_2)<epsilon$.

// Source: lectures/L05-Seq&Limit.pdf p.2.

#theorem(title: [Basic limits])[
  For $p>0$, $n^p->+infinity$; for $p<0$, $n^p->0$.
  If $r>1$, then $r^n->+infinity$; if $abs(r)<1$, then $r^n->0$.
  Also $s_n->0$ if and only if $abs(s_n)->0$, and
  $s_n->1$ if and only if $abs(s_n-1)->0$.
]

For $r=1+a>1$, Bernoulli gives $r^n>1+n a$; for $0<r<1$, write
$r=1/(1+a)$ and compare with $1/(1+n a)$.  The handwritten note says that
the $-1<r<0$ case uses an earlier fact.  The source also proves
$c^(1/n)->1$ for $c>0$ and $n^(1/n)->1$, citing Rudin 3.20 for the latter.

#theorem(title: [Subsequences preserve convergence])[
  $(s_n)$ converges to $l$ if and only if every subsequence converges to
  $l$.  A tail $(s_(n+k))_(n in bN)$ has the same limit.
]

源页写道 convergent sequence 与其 tail ``可以看成没有任何本质区别''。

// Source: lectures/L05-Seq&Limit.pdf p.3.

The rendered page is blank except for its page frame; it contains no
mathematical text to transcribe.

== Limit laws, boundedness, and $limsup/liminf$

// Source: lectures/L06-Limit-II.pdf p.1.

#theorem(title: [Limit laws])[
  If $s_n->s$ and $t_n->t$, then

  - $s_n+t_n->s+t$ (and likewise for subtraction);
  - $c s_n->c s$ for every $c in bR$;
  - $s_n t_n->s t$; and
  - if no $s_n$ is zero and $s!=0$, then $1/s_n->1/s$.
]

对于 product，展开
$s_n t_n-s t=(s_n-s)(t_n-t)+s(t_n-t)+t(s_n-s)$ and use
$sqrt(epsilon)$ bounds.  For reciprocals, first use convergence to obtain
$abs(s_n)>=abs(s)/2$ eventually, then
$abs(1/s_n-1/s)<=2 abs(s_n-s)/abs(s)^2$.
The source annotates these two preliminary bounds as “bound ①” and
“bound ②”.

Further laws recorded on the page are: convergent $(a_n)$ implies
$(abs(a_n))$ converges; for $k in bN$,
$lim a_n^k=(lim a_n)^k$; and for $k in bN$,
$lim a_n^(1/k)=(lim a_n)^(1/k)$ provided $a_n>=0$.
It defines real exponentiation for $x>0$ by
$x^r=sup {y in bR:y>=0 upright(" and ") y^n<=x^m}$ when $r=m/n$.

#theorem(title: [Vector sequences])[
  A sequence $(vec(x)_n)$ in $bR^k$, with components
  $vec(x)_n=(a_(1,n),dots,a_(k,n))$, converges to
  $vec(a)=(a_1,dots,a_k)$ if and only if
  $a_(i,n)->a_i$ for every $i$.
]

正向使用
$abs(a_(i,n)-a_i)<=norm(vec(x)_n-vec(a))$; for the reverse direction,
make each coordinate error smaller than $epsilon/sqrt(k)$.
Vector sum, dot product, and scalar multiplication obey the same limit
laws as real sequences.

#definition(title: [Bounded function and bounded sequence])[
  A function $f:X->bR$ is bounded when its range is bounded.  In particular
  a sequence is bounded if all of its terms lie between two real bounds.
]

#theorem(title: [Convergent sequences are bounded])[
  Every convergent sequence of real numbers is bounded.
]

若 $a_n->l$，取一个 tail 使 $abs(a_n-l)<1$，再分别 bound finitely many
earlier terms。直接应用 limit laws 给出 rational function
$(a_m n^m+dots+a_0)/(b_k n^k+dots+b_0)$: it is $a_m/b_k$ when $m=k$,
it is either $+infinity$ or $-infinity$ when $m>k$,
with the sign determined by $a_m/b_k$.

// Source: lectures/L06-Limit-II.pdf p.2.

#theorem(title: [Limits involving $+infinity$ and $-infinity$])[
  If $a_n->+infinity$ and $b_n->l>0$, then $a_n b_n->+infinity$;
  for $l<0$ the product tends to $-infinity$.  The signs reverse when
  $a_n->-infinity$.  If $a_n$ tends to either infinite endpoint and $b_n$ converges,
  then $a_n+b_n$ has the same infinite limit.
]

The exercise records, for a positive real sequence:
$a_n->+infinity$ if and only if $1/a_n->0$; the negative version gives
$a_n->-infinity$ if and only if $1/a_n->0$.

#definition(title: [Monotone sequence])[
  $(a_n)$ is increasing if $a_n<=a_(n+1)$ for every $n$, decreasing if
  $a_n>=a_(n+1)$, and monotone if it is either.
]

#theorem(title: [Monotone convergence theorem])[
  Every bounded monotone real sequence converges.  If $(a_n)$ is bounded
  and increasing, then $a_n->sup {a_n:n in bN}$; if decreasing, its limit
  is the corresponding infimum.
]

源页说明 ``increasing seq. 必定 bounded below；decreasing seq. 必定 bounded
above''。证明令
$l=sup {a_n}$ and takes a term with $l-epsilon<a_N<=a_n<=l$.

// Source: lectures/L06-Limit-II.pdf pp.3–4.

#definition(title: [$limsup$ and $liminf$])[
  For a bounded sequence set
  $u_n=sup {a_k:k>=n}$ and $v_n=inf {a_k:k>=n}$.
  Then $(u_n)$ is decreasing and $(v_n)$ increasing, and

  $limsup a_n=lim_(n->infinity)u_n$,
  $liminf a_n=lim_(n->infinity)v_n$.
]

The notes display

$inf {a_k:k in bN}<=liminf a_n<=limsup a_n<=sup {a_k:k in bN}$.

直观地，$limsup$ 是 ``the largest number that can get arbitrarily close to,
for infinitely often''。$l$ 是 $limsup a_n$ 当且仅当对每个 $epsilon>0$，有
infinitely many $n$ 使 $a_n>l-epsilon$，且只有 finitely many $n$ 使
$a_n>l+epsilon$。定义也经由 $+infinity$ 和 $-infinity$ 延伸至 unbounded
sequences。

#theorem(title: [Convergence via upper and lower limits])[
  If $a_n->l$, then $liminf a_n=limsup a_n=l$.  Conversely, if
  $liminf a_n=limsup a_n=l in bR$, then $a_n->l$.
]

Examples include
$liminf(-1)^n=-1$, $limsup(-1)^n=1$,
$liminf((-1)^n+1/n)=-1$, and
$limsup(sin n)=1$, $liminf(sin n)=-1$.
If $a_n<=b_n$ eventually, then
$limsup a_n<=limsup b_n$ and $liminf a_n<=liminf b_n$.
The page proves the squeeze theorem and the ratio-test corollary:
for positive $a_n$, if $lim(a_(n+1)/a_n)=l<1$, then $a_n->0$.

== Cauchy sequences, subsequences, and completeness

// Source: lectures/L07-Cauchy-seq.pdf pp.1–3.

#definition(title: [#kn[Cauchy sequence]])[
  A real sequence $(a_n)$ is Cauchy if for every $epsilon>0$ there is
  $N in bN$ such that $abs(a_m-a_n)<epsilon$ whenever $m,n>=N$.
]

#theorem(title: [Cauchy criterion in $bR$])[
  A sequence in $bR$ converges if and only if it is Cauchy.
]

Every Cauchy sequence is bounded: use the Cauchy condition with
$epsilon=1$ for a tail and bound the finitely many initial terms.  The
converse first proves $liminf a_n=limsup a_n$ from pairwise closeness.

#definition(title: [Complete metric space])[
  A metric space $(X,d)$ is complete if every Cauchy sequence in $X$
  converges to a point of $X$.
]

源页写 $bR$ 和 $bC$ complete，而 $bQ$ 不 complete。一个 example 定义
$s_0=a$、$s_1=b$，and
$s_(n+2)=(s_n+s_(n+1))/2$ for $a<b$; it has
$abs(s_(n+2)-s_(n+1))=(b-a)/2^(n+1)$ and is Cauchy.

#definition(title: [Contractive sequence])[
  $(a_n)$ is contractive if some $c in (0,1)$ satisfies
  $abs(a_(n+2)-a_(n+1))<=c abs(a_(n+1)-a_n)$ for every $n$.
]

Every contractive real sequence is Cauchy, hence convergent.  The source
uses the geometric bound
$abs(s_m-s_n)<=sum_(k=n)^(m-1) (b-a)/2^k <= (b-a)/2^(n-1)$.
It also solves $a_1=1$, $a_(n+1)=sqrt(2+a_n)$: a bounded increasing
sequence converges to the positive root $2$.  The decreasing sequence
$(1+1/n)^(n+1)$ defines
$e=lim_(n->infinity)(1+1/n)^n$.

// Source: lectures/L08(1)-subseqs.pdf pp.1–2.

#definition(title: [Subsequence and subsequential limit])[
  If $s:bN->bR$ and $g:bN->bN$ is strictly increasing, then
  $s compose g=(s_(n_k))_(k in bN)$, $n_k=g(k)$, is a subsequence.
  A subsequential limit is the limit of a subsequence.
]

对 $s_n=(-1)^n$，even subsequence converges to $1$ 而 full sequence
diverges。$(1/n)$ 的每个 subsequence 都 converges to $0$，且每个 tail 是一个
subsequence。

#theorem(title: [Monotone subsequence theorem])[
  Every real sequence has a monotone subsequence.
]

A term is dominant if it is at least every later term.  If infinitely many
dominant terms occur, they form a decreasing subsequence; otherwise,
after the final dominant term one recursively chooses later, strictly larger
terms to obtain an increasing subsequence.

#theorem(title: [Bolzano--Weierstrass])[
  Every bounded real sequence has a convergent subsequence.
]

Apply the monotone subsequence theorem and monotone convergence.  For a
bounded sequence $S$ of values, the set of subsequential limits is nonempty;
if $lim a_n=l$, it is $ {l}$; and
$limsup a_n=max S$, $liminf a_n=min S$.  The source adds that these claims
extend to unbounded sequences using $+infinity$ and $-infinity$.

== Topology in metric spaces

// Source: lectures/L08(2)-topology-in-metric-space.pdf pp.1–3.

#definition(title: [Open neighborhood, open/closed set])[
  In $(X,d)$, the open neighborhood of $x_0$ of radius $epsilon$ is
  $V_epsilon(x_0)={x in X:d(x,x_0)<epsilon}$.
  A set $U subset.eq X$ is open if every $x in U$ has an $epsilon>0$ with
  $V_epsilon(x) subset.eq U$.  A set $F subset.eq X$ is closed if
  $X without F$ is open.
]

The examples say $emptyset$ and $X$ are both open and closed in $X$, while
$bR$ is closed but not open in $bC$.  Common metrics are
$abs(x-y)$ on $bR$, Euclidean distance and taxi-cab distance on $bR^n$, and
$d(a+b i,c+d i)=sqrt((a-c)^2+(b-d)^2)$ on $bC$.

#definition(title: [Interior, limit point, isolated point, closure])[
  $p in E subset.eq X$ is an interior point if some neighborhood of $p$ lies
  in $E$; $upright("int")(E)$ is the set of all such points.

  $p in X$ is a limit point of $E$ if every neighborhood of $p$ contains a
  point of $E without {p}$.  An element of $E$ which is not a limit point is
  isolated.  The closure is $upright("cl")(E)=E union E'$ where $E'$ is the set of
  limit points.
]

The Chinese note says interior membership is necessary but not sufficient
for being an interior point; isolated points are not necessarily interior
points.  A set is open exactly when $upright("int")(U)=U$.  A discrete set is
$A=A without A'$; it has no limit points, only isolated points.

#theorem(title: [Sequential and closure characterizations])[
  $F subset.eq X$ is closed if and only if every convergent sequence in
  $F$ has its limit in $F$.  Equivalently, $F$ contains all its limit points.
  Also $upright("cl")(E)$ is closed and is the smallest closed subset of $X$
  containing $E$.
]

In $bR$, every open neighborhood is exactly an open interval, every nonempty
open $U subset.eq bR$ contains $(a,b)$ around each of its points, closed
intervals are closed, finite sets are closed, and every open set is a
countable union of open intervals.  The generalized Bolzano--Weierstrass
theorem recorded here is: every bounded sequence in a complete metric space
has a convergent subsequence.  In particular $bR^n$ and $bC$ are complete,
but $bQ$ is not.

== Page-complete lecture record

=== L05--Seq&Limit, pp. 1--3

Besides the definitions above, the source writes the divergent negation
$forall l in bR, exists epsilon>0, forall N in bN, exists n>=N:
|s_n-l|>=epsilon$, and $s_n->+infinity$ as
$forall M in bR, exists N in bN, n>=N=>s_n>M$ (dually for $-infinity$).
It gives the decimal sequence $(3,3.1,3.14,3.141,3.1415,dots)$ for $pi$,
the Fibonacci recurrence $s_1=s_2=1$, $s_(n+2)=s_(n+1)+s_n$, and the
proof of uniqueness: for $N=max(N_1,N_2)$,
$|l_1-l_2|<=|l_1-s_n|+|s_n-l_2|<epsilon$.
For every $r in bR$, choose $q_n in bQ$ with $r<q_n<r+1/n$.

For $p>0$, $N=M^(1/p)+1$ proves $n^p->+infinity$; for $p<0$,
$N=(1/epsilon)^(-1/p)+1$ proves $n^p->0$. If $r=1+a>1$,
$(1+a)^n>=1+n a$; if $0<r<1$, write $r=1/(1+a)$ and use
$0<r^n<=1/(1+n a)<epsilon$. The $-1<r<0$ case is annotated as an earlier
fact. For $c>0$, $x_n=c^(1/n)-1$ obeys $0<x_n<=(c-1)/n$; for
$n^(1/n)-1=x_n$, $n=(1+x_n)^n>=binom(n,2)x_n^2$, so $x_n->0$
(Rudin 3.20). L05 p. 3 is visually blank.

=== L06--Limit--II, pp. 1--4

The worked epsilon proof is
$| (3n+1)/(4n-1)-3/4 |=7/(4(4n-1))<epsilon$ once
$n>7/(16epsilon)+1/4$. The product-law proof expands
$s_n t_n-s t=(s_n-s)(t_n-t)+s(t_n-t)+t(s_n-s)$; the reciprocal proof uses
eventually $|s_n|>|s|/2$ and
$|1/s_n-1/s|<2|s_n-s|/|s|^2$. The source additionally gives
$lim(a_n^k)=(lim a_n)^k$,
$lim(a_n^(1/k))=(lim a_n)^(1/k)$ for nonnegative terms, and
$x^(1/n)=sup{y in bR:y>=0 upright(" and ") y^n<=x}$.

For vector sequences, coordinatewise convergence is equivalent to
Euclidean convergence: $|alpha_(i,n)-alpha_i|<=norm(vec(x)_n-vec(x))$
one way, and coordinate errors $<epsilon/sqrt(k)$ the other. The rational
function rule is $a_m/b_k$ for equal degrees, $0$ for numerator degree
smaller, and signed infinity for larger degree. A convergent sequence's
explicit bounds are
$M_1=min(l-1,min{a_k:k<N})$, $M_2=max(l+1,max{a_k:k<N})$.

The infinity multiplication table has the usual signs
$(+)(+)=+$, $(+)(-)=-$, $(-)(+)=-$, $(-)(-)=+$; if one sequence tends to
either infinity and the other converges, their sum tends to that infinity.
For positive $a_n$, $a_n->+infinity$ exactly when $1/a_n->0$ (negative dual).
The monotone proof is: bounded increasing $(a_n)$ has $l=sup{a_n}$ and
$l-epsilon<a_N<=a_n<=l$ for $n>=N$; the decreasing dual tends to infimum.

Put $u_n=sup{a_k:k>=n}$, $l_n=inf{a_k:k>=n}$; $(u_n)$ is decreasing,
$(l_n)$ increasing, and limsup/liminf are their limits. The native
tail schematic is

#align(center)[
  #table(columns: (auto, 1fr, auto), inset: 5pt, stroke: 0.5pt,
    [$a_1,a_2,dots,a_n$], [tail $a_n,a_(n+1),dots$], [$u_n=sup$],
    table.cell(colspan: 3)[$l_n=inf$; $l_n<=a_n<=u_n$])
]

It gives the "infinitely often" limsup criterion and examples
$liminf(-1)^n=-1$, $limsup(-1)^n=1$,
$liminf((-1)^n+1/n)=-1$, $limsup((-1)^n+1/n)=1$,
$liminf(sin n)=-1$, $limsup(sin n)=1$. It proves convergence iff limsup
equals liminf, including the $+infinity$ extension. The comparisons,
squeeze theorem, and ratio corollary are all shown with their tail bounds:
positive $a_n$ and $lim(a_(n+1)/a_n)<1$ give $a_n->0$; homework records the
$>1$ divergence case.

=== L07--Cauchy-seq, pp. 1--3

The source warns $a_n$ convergent implies
$|a_n-a_(n+1)|->0$, but not conversely. The Cauchy boundedness proof takes
epsilon $1$ about $a_N$, then bounds the initial finite set. For the reverse
Cauchy criterion, pairwise closeness gives

$a_N-epsilon/2<=inf{a_m:m>=N}<=liminf a_n
<=limsup a_n<=sup{a_m:m>=N}<=a_N+epsilon/2,$

so upper and lower limits are equal. Complete metric space means every Cauchy
sequence converges; the source explicitly gives the complex metric
$d(a+b i,c+d i)=sqrt((a-c)^2+(b-d)^2)$.

The averaging example is $s_0=a$, $s_1=b$,
$s_(n+2)=(s_n+s_(n+1))/2$, with
$|s_(n+2)-s_(n+1)|=(b-a)/2^(n+1)$ and

$|s_m-s_n|<=sum_(k=m)^(n-1)(b-a)/2^k<=(b-a)/2^(m-1).$

A contractive sequence has
$|a_(n+2)-a_(n+1)|<=c|a_(n+1)-a_n|$, $0<c<1$, and is Cauchy
(Rudin 3.8). $a_1=1$, $a_(n+1)=sqrt(2+a_n)$ is bounded increasing and
limits to $2$. For the same averaging recursion with $0<a<b$, the source
derives $d_n=-d_(n-1)/2$ and limit $2b/3+a/3$. It proves
$(1+1/n)^(n+1)$ weakly decreasing and $>1$, then defines
$e=lim(1+1/n)^n=lim(1+1/n)^(n+1)$.

=== L08(1)--subseqs, pp. 1--2

A subsequence is $s compose g$ for strictly increasing $g:bN->bN$.
Examples: $(-1)^n$ has $g(n)=2n$ and constant subsequence $1$;
$sin(n pi/2)$ has subsequential limits $0,1,-1$. The forward proof for
subsequences uses $n_k>=k$. A dominant term has $s_n>=s_m$ for all later
$m$; infinitely many dominant terms form a decreasing subsequence,
otherwise the recursive choice of later larger terms gives a strictly
increasing one. Thus BW holds. It names $(sin k)$ as an example.

For bounded $(s_n)$, the set $S$ of subsequential limits is nonempty,
$lim s_n=l=>S={l}$, $limsup s_n=max S$, $liminf s_n=min S$. The proof
chooses $n_k$ with both $|sup{s_j:j>=n_k}-l|<1/k$ and
$|s_(n_k)-l|<2/k$, and rules out $M>l$ by a tail supremum. It explicitly
extends this to unbounded sequences:
$n^((-1)^n)$ has $S={0,+infinity}$, limsup $+infinity$, liminf $0$.

=== L08(2)--topology-in-metric-space, pp. 1--3

The source's visible native neighborhood pictures are the circle
$V_epsilon(x_0)$ in $bR^2$ and interval $(x_0-epsilon,x_0+epsilon)$ in
$bR$. It defines $upright("int")(E) subset.eq E$, and says membership is necessary but
not sufficient for being interior; isolated points need not be interior.
It defines $E'$, $upright("cl")(E)=E union E'$, isolated $p in E without E'$, and discrete
$A=A without A'$.

The sequential closed-set proof is complete: if $F$ is closed, an open
neighborhood of any $l in X without F$ eventually contains any sequence tending to
$l$, so it cannot lie in $F$. If not closed, choose
$a_n in (x_0-1/n,x_0+1/n) inter F$ for a point $x_0 in X without F$ whose every
neighborhood meets $F$; then $a_n->x_0$. It also proves a limit point has
infinitely many nearby points by using the minimum positive distance to a
hypothetical finite list. In $bR$, every open set is a countable union of
open intervals. General convergence, boundedness by
$exists M>0, forall x,y, d(x,y)<=M$, and generalized BW are stated; the
page concludes $bR^n,bC$ complete and $bQ$ not complete.
