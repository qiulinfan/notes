#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let intersect = math.inter

// Personal authority: Homework/451-hw-6.pdf pp.1–16.
// Checking-only sources: 451-hw-6-raw.pdf pp.1–2; 451-hw-sol-all.pdf pp.21–23.
= Homework 6: sequences, series, and integrability

#remark(title: [Authority label])[
  This transcription follows the handwritten personal submission. The raw PDF
  and the solution collection are reference-only aids for problem numbering
  and symbols; they do not provide any body prose or proof here.
]

#remark(title: [原稿红字旁注])[
  - hw6① 如果 $(a_n)->A>0$，$(b_n)$ is bounded，那么 $limsup(a_n b_n)=A limsup(b_n)$。
  - hw6② 如果 $f$ 是 $(n+1)$-times diffble，且 $f^((n+1))(x)=0$，那么 $f$ 为一个 degree $<=n$ 的 polynomial。
  - hw6⑤ $2/(pi x)<=sin x<=x$ for all $0<=x<=pi/2$。
  - hw6⑦ 如果 $f$ intble，而 $g$ 只有 finitely many 个 pt 上和 $f$ 不一样，那么 $g$ 也 intble，且 $integral_a^b f=integral_a^b g$（但不推荐用 infinitely many 个 pt.）。
  - hw6⑧ 如果 $integral_a^b f=integral_a^b g$，那么一定有 $x_0 in[a,b]$ s.t. $f(x_0)=g(x_0)$。
]

== Problem 1

*Let $(a_n)$ and $(b_n)$ be bounded sequences in $bR$, with
$lim a_n=A>0$. Show that $limsup(a_n b_n)=A limsup(b_n)$.*

#proof[
  Let $E$ denote the set of subsequential limits of $(a_n b_n)$, so
  $limsup(a_n b_n)=max E$. Write $limsup b_n=b$.

  *Claim 1.* $A b$ is an upper bound for $E$. Let $(a_(n_k)b_(n_k))$ be an
  arbitrary convergent subsequence. The source calculates
  $
    lim_(k -> infinity)a_(n_k)b_(n_k)
    <= (lim_(k -> infinity)a_(n_k))(limsup_(k -> infinity)b_(n_k))
    =(lim a_n)(limsup b_n)=A b.
  $
  Thus $A b$ is an upper bound for $E$.

  *Claim 2.* $A b in E$. Choose a subsequence $(b_(n_m))$ with
  $b_(n_m)->b$. Then
  $lim a_(n_m)b_(n_m)=(lim a_(n_m))(lim b_(n_m))=A b$, so $A b in E$.
  The two claims give $A b=max E=limsup(a_n b_n)$.
]

== Problem 2

* (a) For each $n in bN$, find the $n$th derivative of $y=x^n$ and prove
the claim by induction. (b) For $n in bN$, define
$f_n(x)=x^n$ for $x>=0$ and $f_n(x)=-x^n$ for $x<0$. Show $f_(n+1)$ is
$n$-times differentiable but not $(n+1)$-times differentiable.*

=== (a)

#proof[
  The $n$th derivative of $y=x^n$ is $n!$. For $n=1$,
  $d/(d x)(x)=1=1!$. Assuming the statement for $n$,
  $
    d^(n+1)/(d x^(n+1))(x^(n+1))
    =d^n/(d x^n)(x^n+(n)x^n)
    =(n+1)d^n/(d x^n)(x^n)=(n+1)n!=(n+1)!.
  $
  This proves the formula by induction.
]

=== (b)

For each $n$, the source writes
$
  f_(n+1)(x)=cases(delim: "{", x^(n+1) & text("if") x>=0,
  -x^(n+1) & text("if") x<0).
$
It is $n$-times differentiable away from $0$, with
$f_(n+1)^(n)(x)=(n+1)!x$ for $x>0$ and $-(n+1)!x$ for $x<0$. At $0$,
$
  lim_(x -> 0^+)(f_(n+1)^(n-1)(x)-f_(n+1)^(n-1)(0))/x
  =lim_(x -> 0^+) ((n+1)!x^2/2)/x=0,
$
and the matching left-hand calculation is also $0$, so
$f_(n+1)^(n)(0)=0$. But the right derivative quotient of $f_(n+1)^(n)$ at
$0$ is $(n+1)!/2>0$ while the left quotient is $-(n+1)!/2<0$. Therefore the
next derivative does not exist.

== Problem 3

*Prove by induction: for all $n>=0$, if $f:bR -> bR$ is
$(n+1)$-times differentiable and $f^(n+1)(x)=0$ for all $x$, then $f$ is a
polynomial of degree at most $n$.*

#proof[
  The personal proof uses induction on $n$. For $n=0$, differentiability
  gives continuity and $f'(x)=0$, hence $f(x)=c$ for some $c in bR$, a
  polynomial of degree $0$.

  Assume the statement for $n$. For $n+1$, $f'$ is $n$-times differentiable
  and $(f')^(n)(x)=0$. Hence
  $f'(x)=sum_(k=1)^n t_k x^k$ for some real coefficients $t_k$. Thus
  $
    f(x)=sum_(k=1)^n (t_k/(k+1))x^(k+1)
  $
  for all $x$, a polynomial of degree at most $n+1$.
]

== Problem 4

*Show that $sum_(n=2)^infinity 1/(n ln n)$ diverges, but
$sum_(n=2)^infinity 1/(n(ln n)^(1+epsilon))$ converges for every
$epsilon>0$.*

#proof[
  By the integral test, the second series converges iff
  $integral_2^infinity 1/(x(ln x)^(1+epsilon)) dif x$ converges. With
  $u=ln x$, this is
  $
    integral_(ln 2)^infinity u^(-1-epsilon) dif u.
  $
  For $epsilon=0$, it equals
  $lim_(u -> infinity)(ln u-ln(ln 2))=infinity$, proving divergence of the
  first series. For $epsilon>0$, it equals
  $lim_(u -> infinity)(-u^(-epsilon)/epsilon)-(-(ln 2)^(-epsilon)/epsilon)$,
  which the submission records as $(ln 2)/epsilon$, hence convergent.
]

== Problem 5

*Show that $sum (-1)^n/n^(1+1/n)$ converges conditionally.*

#proof[
  *Claim 1.* The series converges. The personal work records, for every
  $n in bN$, $1+1/n<1+1/sqrt(n)$ and hence
  $1/n^(1+1/n)<1/n^(1+1/sqrt(n))$. It concludes the positive terms are
  decreasing and have limit $0$, so the alternating series test applies.

  *Claim 2.* The absolute-value series diverges. The work states the limit
  comparison test: for positive $(a_n),(b_n)$ with
  $lim a_n/b_n=c>0$, the two series converge or diverge together. Its proof
  takes $epsilon=c/2$ to get
  $(c-epsilon)b_n<a_n<(c+epsilon)b_n$, hence
  $(c/2)b_n<a_n<(3c/2)b_n$ beyond a finite tail. For the present series,
  $
    lim_(n -> infinity) (1/n^(1+1/n))/(1/n)
    =lim_(n -> infinity)n^(1/n)=1.
  $
  Thus $sum 1/n^(1+1/n)$ diverges with the harmonic series. The original
  alternating series therefore converges conditionally.
]

== Problem 6

*Give a positive sequence $(a_n)$ converging to zero such that
$sum_(n=1)^infinity(-1)^n a_n$ diverges.*

The example is
$a_n=1/n$ for even $n$ and $a_n=1/(2n+2)$ for odd $n$. Both the even and odd
subsequences tend to $0$, so $a_n -> 0$. The work groups terms as
$
  sum_(n=1)^infinity (-1)^n a_n
  =sum_(k=1)^infinity(a_(2k)-a_(2k-1))
  =sum_(k=1)^infinity(1/(2k)-1/(4k))
  =1/4 sum_(k=1)^infinity 1/k,
$
which diverges.

== Problem 7

*Determine whether each series converges: (a) $sum n!/e^n$;
(b) $sum(-1)^n e^(1/n)$; (c) $sum sin(1/n)$;
(d) $sum(cos(pi n))ln(1+1/n)$; (e) $sum e^(n^2)/n!$.*

=== (a)

With $a_n=n!/e^n$,
$lim a_(n+1)/a_n=lim(n+1)/e>1$, so the ratio test gives divergence.

=== (b)

With $a_n=(-1)^n e^(1/n)$, $limsup a_n=1$ and $liminf a_n=-1$. The terms do
not have a limit, so the series diverges by the nth-term test.

=== (c)

For $0<=x<=pi/2$, the source uses
$2x/pi<=sin x<=x$. Thus $sin(1/n)>=2/(pi n)$, and comparison with the
harmonic series gives divergence.

=== (d)

Let $a_n=ln(1+1/n)$. Then
$sum(cos(pi n))ln(1+1/n)=sum(-1)^n a_n$. The work notes $a_n>0$,
$a_n -> 0$, and $a_n$ is decreasing because $ln(1+1/m)<ln(1+1/n)$ when
$m>n$. Thus the alternating series converges.

=== (e)

Let $a_n=e^(n^2)/n!$. The quotient
$a_(n+1)/a_n=e^(2n+1)/(n+1)$ is unbounded above, so the ratio test gives
divergence.

== Problem 8

*If $sum a_k^2$ and $sum b_k^2$ converge, prove that $sum a_k b_k$ converges
absolutely.*

#proof[
  Write $sum abs(a_k)^2=L_1$ and $sum abs(b_k)^2=L_2$. Cauchy--Schwarz gives
  $
    (sum_(k=1)^n abs(a_k)abs(b_k))^2
    <=(sum_(k=1)^n abs(a_k)^2)(sum_(k=1)^n abs(b_k)^2)
  $
  for every $n$. Thus the partial sums of $sum abs(a_k)abs(b_k)$ are bounded
  above by $sqrt(L_1L_2)$ and below by $0$, and they are increasing. Hence
  $sum abs(a_k b_k)$ converges, so $sum a_k b_k$ converges absolutely.
]

== Problem 9

*Show that if $f$ is integrable on $[a,b]$, then it is integrable on every
subinterval $[c,d] subset [a,b]$.*

#proof[
  Suppose, for a contradiction, that $f$ is not integrable on $[c,d]$.
  Since $f$ is integrable on $[a,b]$, there is $delta>0$ such that every
  tagged partition $P,Q$ of mesh less than $delta$ has
  $abs(S(f,P)-S(f,Q))<epsilon$. Nonintegrability on $[c,d]$ gives tagged
  partitions $P_0,Q_0$ there with meshes below $delta$ but
  $abs(S(f,P_0)-S(f,Q_0))>=epsilon$.

  Refine both partitions to $[a,b]$ by adding regular extra points with the
  same tags. The resulting $P,Q$ have mesh below $delta$, while their sum
  difference is exactly the displayed difference over $[c,d]$, a
  contradiction. Thus $[c,d]$ is integrable.
]

== Problem 10

*If $f$ is integrable on $[a,b]$, show that for every infinite
$S subset[a,b]$ there is $g:[a,b]->bR$ equal to $f$ off $S$ but not
integrable.*

#proof[
  Let $S$ be infinite. As a bounded infinite set it is not discrete, so
  choose $a in S'$ such that every $V_epsilon(a) intersect S without {a}$ is
  nonempty. Define
  $
    g(x)=f(x) " for " x in[a,b] without S,
    quad g(x)=1/(x-a) " for " x in S.
  $
  Given an arbitrary $M$, take $epsilon=1/M$, choose
  $x in V_epsilon(a) intersect S without {a}$, and obtain $g(x)=1/(x-a)>M$.
  Thus $g$ is unbounded above and hence not Riemann integrable.
]

== Problem 11

*Show directly that if a bounded $f:[a,b]->bR$ is continuous everywhere
except possibly at $c in(a,b)$, then $f$ is integrable.*

#proof[
  Take $B>0$ with $-B<=f(x)<=B$. Let $epsilon>0$. Uniform continuity on
  $[a,c)$ and $(c,b]$ gives $delta_1,delta_2>0$ such that their oscillations
  are less than $epsilon/(6(c-a))$ and $epsilon/(6(b-c))$, respectively.
  Set $delta=min(delta_1,delta_2,epsilon/(6B))$. For a partition of mesh less
  than $delta$, let $c in I_(k_0)$. On all earlier intervals, taking a
  midpoint gives total upper-minus-lower contribution below $epsilon/3$; the
  same reasoning gives below $epsilon/3$ for intervals after $I_(k_0)$; and
  on $I_(k_0)$ the oscillation is at most $2B$, giving contribution below
  $epsilon/3$. Hence $U(f,P)-L(f,P)<epsilon$, and $f$ is integrable.
]

== Problem 12

*Suppose $f$ and $g$ are continuous on $[a,b]$ and
$integral_a^b f(x) dif x=integral_a^b g(x) dif x$. Prove that some
$x_0 in(a,b)$ satisfies $f(x_0)=g(x_0)$.*

#proof[
  Assume the hypothesis. If $f(x)>g(x)$ for every $x$, then the source states
  $U(f,P)>U(g,P)$ on every subinterval and hence
  $integral_a^b f=U(f)>U(g)=integral_a^b g$, a contradiction. Therefore some
  $k_1 in[a,b]$ has $f(k_1)<=g(k_1)$. By the same reasoning, some $k_2$ has
  $f(k_2)>=g(k_2)$. If neither is equality, $h=f-g$ is continuous and has
  opposite signs at $k_1,k_2$. The intermediate value theorem gives an
  $x_0$ between them with $h(x_0)=0$.
]

== Optional challenge problem 13

The source records the printed definition
$f_n(x)=0$ on $V_n$, $f_n(x)=2^(-n)$ on $bQ without V_n$, and
$f_n(x)=-2^(-n)$ on $(bR without bQ) without V_n$, followed by
$f(x)=sum_(n=1)^infinity f_n(x)$, and asks to prove $f$ is continuous at
$a$ iff $a in intersect_(n in bN)V_n$.

// TODO(source: 451-hw-6.pdf p.16, optional problem 13): no personal
// handwritten solution appears in the source.
