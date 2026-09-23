#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let intersect = math.inter

// Personal authority: Homework/451-hw-7.pdf pp.1–15.
// Checking-only sources: 451-hw-7-raw.pdf pp.1–2; 451-hw-sol-all.pdf pp.24–26.
= Homework 7: integration and convergence

#remark(title: [Authority label])[
  This is a transcription of the handwritten personal submission in
  `451-hw-7.pdf`. The raw assignment and solution collection are checking-only
  reference material; they supply no substituted proof text.
]

#remark(title: [原稿红字旁注])[
  - hw7①（积分中值定理）如果 $f(x)$ ctn on $[a,b]$，则有 $c in[a,b]$ s.t. $f(c)=1/(b-a) integral_a^b f(x) dif x$。
  - hw7② 若 $f$ 在 $[a,b]$ 上非负且 ctn，只要有一点 $f(x)>0$ 则 $integral_a^b f>0$。
  - hw7③ 在 $[a,b]$ 上 intble 的 $f$ 一定有一点 $c in[a,b]$ 使得 $integral_a^c f=integral_c^b f$。
  - hw7⑤ 即使 $f_n -> f$ 中每个 $f$ 都 uni. ctn，整体 convergence 的行为也未必 uniform。
  - hw7⑥ 若 $(f_n in C^1)$ 的 $(f_n')$ uni. conv.，且 $(f_n)$ 在一点 conv.，$=> (f_n)$ uni. conv.
  - hw7⑦ 任何一个 closed interval 上的 ctn function $f$ 都可以用一个 step function seq. $(f_n)$ 来逼近（欲证 step $(f_n)->f$ unily.）。
]

== Problem 1

*Prove that if $f$ is continuous on $[a,b]$, there is $c in[a,b]$ such that
$f(c)=1/(b-a) integral_a^b f(x) dif x$.*

#proof[
  By the extreme value theorem, there are $x_1,x_2 in[a,b]$ with
  $f(x_1)<=f(x)<=f(x_2)$ for all $x in[a,b]$. Since $f$ is continuous, it is
  integrable, and monotonicity gives
  $
    integral_a^b f(x_1) dif x <= integral_a^b f(x) dif x
    <= integral_a^b f(x_2) dif x.
  $
  Hence
  $
    f(x_1)<=1/(b-a) integral_a^b f(x) dif x<=f(x_2).
  $
  By continuity of $f$ between $x_1$ and $x_2$ and the intermediate value
  theorem, there is $c in[x_1,x_2]$ with the required equality.
]

== Problem 2

* (a) Let $f:[a,b]->bR$ be nonnegative and continuous. Prove that if
$f(x)>0$ for some $x in[a,b]$, then $integral_a^b f>0$. (b) Let continuous
$f,g:[a,b]->bR$ have $f(x)<=g(x)$ for all $x$. Prove that equal integrals
imply $f=g$.*

=== (a)

#proof[
  Let $x_0 in[a,b]$ satisfy $f(x_0)>0$. By continuity, there is
  $epsilon>0$ such that $f(x)>0$ for all
  $x in V_epsilon(x_0) intersect[a,b]$ (by HW 4, problem 8). This set is an
  interval; fix a closed interval $[c,d]$ inside it. Then $f$ is integrable
  on $[c,d]$, and by problem 1,
  $
    integral_c^d f=(d-c)f(x_1)>0
  $
  for some $x_1 in[c,d]$. Since $f>=0$ on $[a,b]$,
  $
    integral_a^b f=integral_a^c f+integral_c^d f+integral_d^b f>0.
  $
]

=== (b)

#proof[
  Suppose the integrals are equal but $f!=g$. The function $g-f$ is
  nonnegative and continuous. Since $f<=g$ everywhere and $f!=g$, there is
  $c in[a,b]$ with $f(c)<g(c)$. Part (a) gives
  $integral_a^b(g-f)>0$, that is, $integral_a^b g>integral_a^b f$, a
  contradiction. Therefore $f=g$.
]

== Problem 3

* (a) If $f$ is integrable on $[a,b]$, prove there is $c in[a,b]$ with
$integral_a^c f=integral_c^b f$. (b) Give an example showing $c$ need not be
in $(a,b)$.*

=== (a)

#proof[
  By the fundamental theorem of calculus,
  $F(x)=integral_a^x f(y) dif y$ is continuous on $[a,b]$. Since
  $
    0=F(a)<(F(a)+F(b))/2<F(b)=integral_a^b f,
  $
  the intermediate value theorem gives $c in[a,b]$ with
  $F(c)=(F(a)+F(b))/2$. Therefore
  $
    integral_a^c f=integral_c^b f=1/2 integral_a^b f.
  $
]

=== (b)

Take $a=0$, $b=2pi$, and $f(x)=sin(x)$. It is continuous and integrable on
$[a,b]$, and $c=a$ gives
$integral_a^c f=integral_c^b f=0$.

== Problem 4

*Compute: (a) $lim_(x -> 0)1/x integral_0^x e^(t^2) dif t$;
(b) $lim_(h -> 0)integral_3^(3+h)e^(t^2) dif t$.*

=== (a)

Since $e^(t^2)$ is continuous at $0$, the fundamental theorem gives
$F(x)=integral_0^x e^(t^2) dif t$ differentiable at $0$. Thus
$
  lim_(x -> 0) (integral_0^x e^(t^2) dif t)/x
  =lim_(x -> 0)(F(x)-F(0))/(x-0)=F'(0)=e^(0^2)=1.
$

=== (b)

The submission rewrites
$
  lim_(h -> 0)integral_3^(3+h)e^(t^2) dif t
  =lim_(h -> 0)((integral_3^(3+h)e^(t^2) dif t-0)/(h-0) dot h).
$
The derivative factor tends to $e^(3^2)$ by the fundamental theorem and
$h -> 0$, so the limit is $e^9 dot 0=0$.

== Problem 5

*For $x>=0$ and $n in bN$, let $f_n(x)=x^n/(1+x^n)$. (a) Find the pointwise
limit. (b) Prove uniform convergence on $[0,b]$ for $0<b<1$. (c) Decide
uniform convergence on $[0,1]$.*

=== (a)

The source computes
$
  f(x)=lim_(n -> infinity)f_n(x)=cases(delim: "{",
    0 & text("if") x in[0,1),
    1/2 & text("if") x=1,
    1 & text("if") x>1
  ).
$
Indeed, $x^n -> 0$ for $x in[0,1)$, $x^n=1$ at $x=1$, and
$1/(1+x^n)->0$ for $x>1$.

=== (b)

#proof[
  Let $0<b<1$ and $epsilon>0$. For $0<=x<=b$, $x^n<=b^n$, and hence
  $1/(1+x^n)>=1/(1+b^n)$. Since $1/(1+b^n)->1$, choose $N$ with
  $abs(1/(1+b^n)-1)<epsilon$ for $n>=N$. Then
  $
    abs(1/(1+x^n)-1)<1-1/(1+x^n)
    <=1-1/(1+b^n)<epsilon
  $
  for all $x in[0,b]$. Thus $f_n$ converges uniformly on $[0,b]$.
]

=== (c)

The sequence does not converge uniformly to $f$ on $[0,1]$. Take
$epsilon=1/4$ and let $n in bN$ be arbitrary. Since
$lim_(x -> 1^-)f_n(x)=1/2$, there is $delta>0$ such that
$f_n(x) in(1/4,3/4)$ whenever $1>x>1-delta$. Take $x_0 in(1-delta,1)$.
Then $f(x_0)=0$ and $abs(f_n(x_0)-f(x_0))=f_n(x_0)>1/4$.

== Problem 6

*If $(f_n)$ is a sequence of uniformly continuous functions on $(a,b)$ and
$f_n -> f$ uniformly, prove that $f$ is uniformly continuous.*

#proof[
  Let $epsilon>0$. Choose $N$ such that
  $abs(f_N(x)-f(x))<epsilon/3$ for all $x in(a,b)$. Since $f_N$ is uniformly
  continuous, choose $delta>0$ with
  $abs(f_N(x)-f_N(y))<epsilon/3$ whenever $abs(x-y)<delta$. Then
  $
    abs(f(x)-f(y))
    <=abs(f_N(x)-f(x))+abs(f_N(x)-f_N(y))+abs(f_N(y)-f(y))<epsilon.
  $
]

== Problem 7

*Give a sequence of continuous $f_n:[0,1]->bR$ converging pointwise but not
uniformly to a continuous limit.*

Take
$
  f_n(x)=cases(delim: "{",
    n^2x & text("if") 0<=x<=1/n,
    2n-n^2x & text("if") 1/n<x<2/n,
    0 & text("if") 2/n<=x
  ).
$
Then $f_n -> f=0$ pointwise on $[0,1]$. But with $epsilon=1$, for arbitrary
$n$ choose $x=1/n$; then $f_n(x)=n>=1$, so the convergence is not uniform.

== Problem 8

*Let $(f_n)$ be a sequence of $C^1$ functions on $[0,1]$ such that
$(f_n')$ converges uniformly. Prove that if $(f_n(a))$ converges for some
$a in[0,1]$, then $(f_n(x))$ converges for all $x in[0,1]$.*

#proof[
  Let $epsilon>0$. The source chooses $N$ so that, for $m,n>=N$,
  $
    abs(f_m'(x)-f_n'(x))<epsilon/(2(b-a))
  $
  for all $x in[0,1]$, and $abs(f_m(a)-f_n(a))<epsilon/2$. For an arbitrary
  $x in[0,1]$, the fundamental theorem gives
  $
    abs(f_m(x)-f_n(x))
    <=abs(f_m(a)-f_n(a))
      +abs(integral_a^x(f_m'(t)-f_n'(t)) dif t)
    <epsilon/2+epsilon/(2(b-a))abs(x-a)<epsilon.
  $
  Thus $(f_n)$ is uniformly Cauchy and hence converges uniformly on $[0,1]$.
]

== Problem 9

*A step function on $[a,b]$ is constant on every open part of a finite
partition. Prove that every continuous $f:[a,b]->bR$ is the uniform limit of
step functions $f_n$ satisfying $f_n(x)<=f(x)$.*

#proof[
  For $n in bN$, let $P_n={x_0,x_1,dots,x_n}$ where
  $x_k=a+k(b-a)/n$, and define
  $
    f_n(x)=inf_(y in[x_(k-1),x_k]) f(y)
  $
  when $x in[x_(k-1),x_k]$. Then $f_n(x)<=f(x)$.

  Let $epsilon>0$. Uniform continuity of $f$ gives $delta>0$ such that
  $abs(f(x)-f(y))<epsilon$ if $abs(x-y)<delta$. Choose $N$ with
  $(b-a)/N<delta$. For $n>=N$ and $x in[a,b]$, take the partition interval
  containing $x$. The extreme value theorem gives $x_0$ in it with
  $f_n(x)=f(x_0)$; then
  $
    abs(f_n(x)-f(x))=abs(f(x_0)-f(x))<epsilon.
  $
  Thus $f_n -> f$ uniformly.
]

== Problem 10

*Suppose $sum c_n x^n$ is a power series with
$lim abs(c_(n+1)/c_n)=L>0$. Prove convergence for $x in(-R,R)$ and divergence
for $x in bR \ [-R,R]$, where $R=1/L$.*

#proof[
  If $-R<x<R=1/L$, then
  $abs(x) lim abs(c_(n+1)/c_n)<1$, so
  $
    lim abs((c_(n+1) x^(n+1))/(c_n x^n))<1.
  $
  The ratio test gives absolute convergence. Likewise, when $abs(x)>R$, this
  quotient limit is greater than $1$, so the series diverges by the ratio
  test.
]

== Problem 11

*Find radii and exact intervals of convergence: (a) $sum n^2x^n$;
(b) $sum (2^n/n^2)x^n$; (c) $sum (2^n/n!)x^n$.*

=== (a)

$lim abs((n+1)^2/n^2)=1$, so the radius is $1$. At $x=1$,
$sum n^2$ diverges; at $x=-1$,
$sum(-1)^n n^2=sum_(k=1)^infinity(2k-(2k-1))=sum 4k-1$ diverges. Thus the
interval is $(-1,1)$.

=== (b)

$
  lim abs((2^(n+1)/(n+1)^2)/(2^n/n^2))=2,
$
so the radius is $1/2$. At $x=1/2$, the series is $sum 1/n^2$, and at
$x=-1/2$ it is $sum(-1)^n/n^2$; both converge. The interval is
$[-1/2,1/2]$.

=== (c)

$
  lim abs((2^(n+1)/(n+1)!)/(2^n/n!))=lim 2/(n+1)=0.
$
The radius is infinity and the interval is $bR$.

== Problem 12

*Define $f:bR -> bR$ by $f(x)=e^(-1/x^2)$ for $x!=0$ and $f(0)=0$.
(a) Show by induction that $f^(n)(x)=p(1/x)f(x)$ for $x!=0$, with $p$ a
polynomial. (b) Show $lim_(x -> 0)p(1/x)f(x)=0$ for every polynomial $p$.
(c) Show $f^(n)(0)$ exists and equals $0$. (d) Give the stated $C^infinity$
example.*

=== (a)

#proof[
  The base case is
  $
    f'(x)=(e^(-1/x^2))(2x^(-3))=2(1/x)^3f(x).
  $
  For the induction step, suppose $f^(n)(x)=p(1/x)f(x)$, where
  $p(1/x)=sum_(k=1)^q c_k(1/x)^k$. Then
  $
    f^(n+1)(x)=f(x)p'(1/x)+f(x)sum_(k=1)^q -q c_k(1/x)^(k+1),
  $
  the product of $f(x)$ and another polynomial in $1/x$.
]

=== (b)

Let $p(1/x)=sum_(k=1)^q c_k(1/x)^k$. The source applies L'Hopital's rule,
$k$ times, term-by-term to
$c_k e^(-1/x^2)/x^k$ and obtains $0$. Thus
$lim_(x -> 0)p(1/x)f(x)=sum 0=0$.

=== (c)

#proof[
  Induct on $n$. For $n=1$,
  $
    f'(0)=lim_(x -> 0)(f(x)-f(0))/(x-0)=lim_(x -> 0)f(x)/x=0
  $
  by part (b). If $f^(n)(0)=0$, then
  $
    f^(n+1)(0)=lim_(x -> 0)(f^(n)(x)-f^(n)(0))/(x-0)
    =lim_(x -> 0)(1/x)p(1/x)f(x)=0
  $
  for some polynomial $p$, again by part (b).
]

=== (d)

The source gives
$g(x)=e^(-1/x^2)$ for $x!=0$ and $g(0)=0$.

== Problems 13–14

The final two printed problems have no personal handwritten response.

- *(13a)* The piecewise $f_n:(-1,1)->bR$ made of $-x-2^(-n-1)$,
  $2^(n-1)x^2$, and $x-2^(-n-1)$ is to be shown differentiable and
  uniformly convergent to $abs(x)$; *(13b)* $g_n(x)=sin(n x)/n$ is to be used
  to show that uniform convergence need not commute with derivatives.
- *(14)* Enumerate $bQ={q_n:n in bN}$, set
  $f_n(x)=4^(-n)sin(1/(x-q_n))$ on $bR \ {q_n}$, and prove convergence and
  continuity on the irrational domain while limits fail at rational points.

// TODO(source: 451-hw-7.pdf p.14, problem 13; p.15, problem 14): the source
// contains printed prompts only and no handwritten solution.
