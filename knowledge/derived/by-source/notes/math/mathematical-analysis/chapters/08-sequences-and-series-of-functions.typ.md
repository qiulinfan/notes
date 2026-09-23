---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/mathematical-analysis/chapters/08-sequences-and-series-of-functions.typ"
kgd_source_format: "typst"
kgd_source_sha256: "c1da524ffebdbd1662245ad8150028fbc8ad83f8ef3410787138f87c0bad833d"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Visual transcription: L19-Seq-of-functions.pdf pp.1-3;
// L20-Series-of-functions.pdf pp.1-4.
= Sequences and series of functions

== Sequences of functions (L19)

#definition(title: [Pointwise convergence])[
  令 $(f_n:A -> bR)_(n in bN)$ 是一个 seq. of functions（domains 都相同）。
  称 $(f_n)$ 在 $A$ 上 pointwise converges to $f:A -> bR$，记作
  $(f_n)->f$ on $A$，if
  $
    lim_(n -> infinity)f_n(x)=f(x) quad text("for all") x in A.
  $
  等价地，
  $
    forall a in A, forall epsilon>0, exists N in bN text(" such that ")
    forall n>N, abs(f_n(a)-f(a))<epsilon.
  $
  seq. of functions 的 pointwise convergence 即：对每一点 $x in A$，
  $f_n(x)->f(x)$。
]

#example(title: [Pointwise limits can destroy everything])[
  On $[0,1]$, let $f_n(x)=x^n$. Then
  $
    f_n(x)->f(x)=cases(delim: "{", 0 & x in[0,1), 1 & x=1).
  $
  Every $f_n$ is continuous and differentiable，但 $f$ is discontinuous。
  因而 pointwise conv. 不 preserve continuity & differentiability。

  L19 p.1 draws the family $x,x^2,x^3,dots$ rising from $(0,0)$ to $(1,1)$,
  with the limiting graph equal to $0$ before the endpoint and $1$ at the
  endpoint. The graph information is equivalently captured by
  #table(
    columns: (1fr, 1fr, 1fr),
    stroke: 0.6pt + palette.border,
    inset: 4pt,
    [$x in[0,1)$], [$x=1$], [limit graph],
    [$x^n -> 0$], [$x^n -> 1$], [$f=0$ on $[0,1)$ and $f(1)=1$]
  ).

  Write $bQ inter [0,1]={q_n:n in bN}$（$q_n$ 可以任意排序）。Let
  $
    f_n(x)=cases(delim: "{", 1 & x in{q_1,dots,q_n}, 0 & text("otherwise")).
  $
  Then $(f_n)->D|_[0,1]$ (Dirichlet's function). Each $f_n$ is Riemann
  integrable, but $D|_[0,1]$ is not；因而 pointwise conv. 不 preserve
  integrability.

  On $[0,2]$, let
  $
  f_n(x)=cases(delim: "{",
    n^2x & 0<=x<=1/n,
    2n-n^2x & 1/n<x<2/n,
    0 & 2/n<=x
  )
  $
  Each triangular spike has area $(1/2)(2/n) n=1$, so
  $integral_0^2 f_n(x)dif x=1$ for every $n$. Pointwise $f_n->0$, hence
  $
    lim_(n -> infinity)integral_0^2 f_n(x)dif x=1
    !=integral_0^2 lim_(n -> infinity)f_n(x)dif x=0.
  $
  因而 pointwise convergence 不 preserve the limit of an integral。

  The p.1 spike picture has base $[0,2/n]$, apex $(1/n,n)$, and area $1$:
  #table(
    columns: (1fr, 1fr, 1fr),
    stroke: 0.6pt + palette.border,
    inset: 4pt,
    [$0$], [$1/n$], [$2/n$],
    [$f_n=0$], [$f_n=n$], [$f_n=0$],
    [left edge], [apex], [right edge]
  ).

  On $bR$, let $f_n(x)=sin(2pi n x)/(2pi n)$. Then
  $f_n^prime(x)=cos(2pi n x)$, $f_n(x)->f(x)=0$, yet
  $f_n^prime(0)=1$ for all $n$ while $f^prime(0)=0$. Thus
  $
    lim_(n -> infinity)f_n^prime(0)!=f^prime(0):
  $
  pointwise convergence 不 preserve the limit of a derivative。

  因而 pointwise limit can destroy continuity, differentiability, and
  integrability；即使不 destroy，也不 reserve the value of an integral /
  derivative。pointwise convergence 是局部的逐点性质，不是整体性质：
  在每个 $x in A$，$f_n(x)->f(x)$，最后的 $f$ 由每个 $x$ 的极限拼接而成。
  若想让 convergence 更好地保留整体性质，就需要更强的定义。
]

#definition(title: [#kn[Uniform convergence]])[
  令 $(f_n:A -> bR)_(n in bN)$ 是一个 seq. of functions。称 $(f_n)$ 在 $A$
  上 uniformly converges to $f:A -> bR$，if
  $
  forall epsilon>0, exists N in bN text(" such that ")
  forall x in A text(" and ") n>=N, abs(f_n(x)-f(x))<epsilon.
  $

  两个 definitions 的 distinction 是：
  $
  text("pointwise"): forall x in A, forall epsilon>0, exists N in bN
  text(" such that ") abs(f_n(x)-f(x))<epsilon text(" whenever ")n>=N;
  $
  $
  text("uniform"): forall epsilon>0, exists N in bN text(" such that ")
  forall x in A, abs(f_n(x)-f(x))<epsilon text(" whenever ")n>=N.
  $
  pointwise 是逐点各自使用自己的 $epsilon$ bound；uniform 是一个 $epsilon$
  bound 所有 $x in A$ 共用，把 $A$ 中所有点作为整体联系起来。
]

#theorem(title: [Uniform convergence and uniformly Cauchy])[
  $(f_n:A -> bR)$ converges uniformly iff it is uniformly Cauchy on $A$, i.e.
  for every $epsilon>0$ there is $N$ such that
  $
    abs(f_n(x)-f_m(x))<epsilon
  $
  for all $x in A$ and $m,n>=N$.
]
#proof[
  If $f_n->f$ uniformly, choose $N$ such that
  $abs(f_n(x)-f(x))<epsilon/2$ for $x in A,n>=N$. Then
  $
    abs(f_n(x)-f_m(x))
    <=abs(f_n(x)-f(x))+abs(f_m(x)-f(x))<epsilon.
  $
  Conversely, uniformly Cauchy implies each scalar sequence $(f_n(x))$ is
  Cauchy, so define $f(x)=lim_(n -> infinity)f_n(x)$. Choose $N$ with
  $abs(f_n(x)-f_m(x))<epsilon/2$ for all $x$ and $m,n>=N$; taking
  $m->infinity$ shows $abs(f_n(x)-f(x))<=epsilon$ for all $x,n>=N$.
]

#theorem(title: [A uniform limit of continuous functions is continuous])[
  If $(f_n:A -> bR)->f$ uniformly and $f_n$ is continuous at $a$ for every
  $n in bN$, then $f$ is continuous at $a$. In symbols,
  $
    lim_(x -> a)lim_(n -> infinity)f_n(x)
    =lim_(n -> infinity)lim_(x -> a)f_n(x).
  $
]
#proof[
  Let $epsilon>0$. Uniform convergence supplies $N$ with
  $abs(f_N(x)-f(x))<epsilon/3$ for all $x in A$. By continuity of $f_N$ at $a$,
  choose $delta>0$ such that $abs(f_N(x)-f_N(a))<epsilon/3$ if
  $abs(x-a)<delta$. Then
  $
  abs(f(x)-f(a))
  <=abs(f(x)-f_N(x))+abs(f_N(x)-f_N(a))+abs(f_N(a)-f(a))<epsilon.
  $
]

#theorem(title: [Uniform limit of integrable functions is integrable])[
  Suppose $(f_n:[a,b]->bR)->f$ uniformly on $[a,b]$. If every $f_n$ is
  Riemann integrable, then $f$ is integrable and
  $
    integral_a^b lim_(n -> infinity)f_n
    =integral_a^b f
    =lim_(n -> infinity)integral_a^b f_n.
  $
]
#proof[
  Uniform convergence makes $(f_n)$ uniformly Cauchy, so fix $N$ with
  $abs(f_m(x)-f_n(x))<epsilon/(b-a)$ for all $x in[a,b]$ and $m,n>=N$. Then
  $
    abs(integral_a^b f_m-integral_a^b f_n)<epsilon,
  $
  so $(integral_a^b f_n)$ is Cauchy and converges, say to $ell$. Take $n$
  sufficiently large so that $abs(integral_a^b f_n-ell)<epsilon/3$,
  $abs(f_n(x)-f(x))<epsilon/(3(b-a))$ for all $x$, and a partition $P$ with
  $U(f_n,P)-L(f_n,P)<epsilon/3$. The uniform bound gives
  $
  abs(U(f,P)-U(f_n,P))
  <=sum_(k=1)^m(sup f[I_k]-sup f_n[I_k])Delta x_k
  <=epsilon/3,
  $
  and then $abs(U(f,P)-ell)<epsilon$; likewise
  $abs(L(f,P)-ell)<epsilon$. Since $epsilon$ is arbitrary, $integral_a^b f=ell$.
]

#theorem(title: [Uniform limit of a derivative sequence])[
  Suppose $(f_n:[a,b]->bR)_(n in bN)$ is a sequence of $C^1$ functions,
  $(f_n)->f$ pointwise on $[a,b]$, and $(f_n^prime)$ converges uniformly on
  $[a,b]$. Then $f in C^1$ and
  $
    f^prime=lim_(n -> infinity)f_n^prime
  $
  on $[a,b]$.
]
#proof[
  Write $g=lim_(n -> infinity)f_n^prime$. Each $f_n^prime$ is continuous and
  integrable, so $g$ is continuous and integrable by the preceding theorems.
  For $x in[a,b]$,
  $
  integral_a^x g
  =integral_a^x lim_(n -> infinity)f_n^prime
  =lim_(n -> infinity)integral_a^x f_n^prime
  =lim_(n -> infinity)(f_n(x)-f_n(a))
  =f(x)-f(a).
  $
  FTC II now gives $f^prime=g$. The lecture notes that this theorem has many
  conditions and presents a stronger version.
]

#theorem(title: [Stronger uniform-convergence derivative theorem])[
  Let $(f_n:[a,b]->bR)_(n in bN)$ with every $f_n in C^1$. Suppose there is a
  point $x_0 in[a,b]$ such that $(f_n(x_0))$ converges, and
  $(f_n^prime)->g$ uniformly. Then $(f_n)->f$ uniformly for some $f in C^1$,
  where $f^prime=g$.
]
#proof[
  Uniform convergence of the derivatives gives, for $m,n>=N$,
  $
    abs(f_n^prime(x)-f_m^prime(x))<epsilon/(2(b-a))
  $
  for all $x$. Pointwise convergence at $x_0$ gives
  $abs(f_n(x_0)-f_m(x_0))<epsilon/2$. Thus, for arbitrary $x$,
  $
  abs(f_n(x)-f_m(x))
  <=abs(f_n(x_0)-f_m(x_0))
    +abs(integral_(x_0)^x(f_n^prime(t)-f_m^prime(t))dif t)
  <epsilon.
  $
  So $(f_n)$ is uniformly Cauchy, hence uniformly convergent. Letting limits
  in the displayed FTC identity gives
  $
    f(x)=f(x_0)+integral_(x_0)^x g(t)dif t,
  $
  and FTC II yields $f^prime=g$.
]

#remark(title: [Summary])[
  1. A uniform limit of continuous $(f_n)$ is continuous.
  2. Under suitable conditions,
  $
  integral_a^b lim_(n -> infinity)f_n=lim_(n -> infinity)integral_a^b f_n,
  quad
  dif/(dif x)(lim_(n -> infinity)f_n(x))
    =lim_(n -> infinity)dif/(dif x)f_n(x).
  $
  Since differentiation and integration are very basic operations, the
  uniform-convergence hypotheses ensure the desired stability.
]

== Series of functions and power series (L20)

#definition(title: [Series of functions])[
  If $(f_k:A -> bR)_(k in bN)$ is a sequence of functions, then
  $(sum_(k=1)^n f_k)_(n in bN)$ is its sequence of partial sums. Write
  $sum f_k$ or $sum_(k=1)^infinity f_k$ for the infinite series determined by
  $(f_k)$.

  On $B subset A$, the following are definitions:

  1. $sum f_k$ *converges* on $B$ iff, for every $x in B$,
     $lim_(n -> infinity)sum_(k=1)^n f_k(x)$ exists; equivalently there is
     $f:B -> bR$ with $(sum_(k=1)^n f_k)->f$ pointwise.
  2. It converges *uniformly* on $B$ iff those partial sums converge uniformly
     to some $f:B -> bR$.
  3. It converges *absolutely* on $B$ iff $sum_(k=1)^infinity abs(f_k(x))$
     converges at every $x in B$; equivalently $sum abs(f_k)$ converges on $B$.
]

#theorem(title: [Term-by-term operations for a function series])[
  1. If every $f_k$ is continuous on $A$ and $sum f_k->S$ uniformly on $A$,
     then $S$ is continuous on $A$.
  2. If every $f_k$ is continuous on $[a,b]$ and $sum f_k->S$ uniformly on
     $[a,b]$, then $S$ is integrable and
     $
       integral_a^b S= sum_(k=1)^infinity integral_a^b f_k.
     $
  3. If every $f_k in C^1$ on $[a,b]$, $sum f_k->S$ on $[a,b]$ (not
     necessarily uniformly), and $sum f_k^prime$ converges uniformly on
     $[a,b]$, then $S in C^1$ and $S^prime=sum f_k^prime$.

  Stronger version of (3): if $f_k in C^1$ on $[a,b]$, there exists
  $x_0 in[a,b]$ such that $sum f_k(x_0)$ converges, and $sum f_k^prime$
  converges uniformly on $[a,b]$, then $sum f_k$ converges uniformly to some
  $S in C^1$, and $S^prime=sum f_k^prime$.
]
#proof[
  Since every partial sum is continuous, differentiable, and integrable as
  appropriate, apply the corresponding uniform-limit theorem to the sequence
  of partial sums $(sum_(k=1)^n f_k)_(n in bN)$.
]

== Power series

#definition(title: [Power series])[
  For a sequence $(a_n)$ in $bR$, the power series centered at $c$ with
  coefficients $(a_n)$ is the series of functions
  $
    sum_(n=0)^infinity a_n(x-c)^n.
  $
  The partial sums are polynomials. Custom: for $x!=0$, $0^x=0$; and
  $x^0=1$ for every $x$ (including $0^0=1$).

  Note: the L20 pages use power series centered at $0$ in the displayed
  examples, but every result applies to a center $c$ by replacing $x$ with
  $x-c$.
]

#theorem(title: [Cauchy-Hadamard theorem])[
  Given a power series $sum_(n=0)^infinity a_n x^n$, let
  $rho=limsup abs(a_n)^(1/n)$. Then it converges absolutely when
  $abs(x)rho<1$ and diverges when $abs(x)rho>1$. Its radius of convergence is
  $
    R=1/rho.
  $
  The set of all $x$ for which $sum a_n(x-c)^n$ converges is an interval,
  called the interval of convergence.
]
#proof[
  If $abs(x)limsup abs(a_n)^(1/n)<r<1$, then for all but finitely many $n$,
  $abs(x)abs(a_n)^(1/n)<=r$, so $abs(a_n x^n)<=r^n$ and comparison applies.
  If $abs(x)rho>r>1$, then $abs(a_n x^n)>r^n>1$ infinitely often, so the
  $n$th-term test gives divergence.
]

#remark(title: [Endpoints and a ratio shortcut])[
  Radius of convergence cannot imply interval of convergence: endpoints
  $c-R,c+R$ may or may not be included, so they must be checked separately.
  If $lim_(n -> infinity)abs(a_(n+1)/a_n)=ell$ exists, then $1/ell$ is the
  radius; this is often the best way to find $R$, but it is not more general
  than $limsup abs(a_n)^(1/n)$.
]

#example(title: [Power-series radii and intervals])[
  1. For $sum_(n=0)^infinity x^n/n!$,
     $abs(a_(n+1)/a_n)=1/(n+1)->0$, hence $R=infinity$; it converges for all
     $x in bR$, and in fact equals $e^x$ by Taylor.
  2. For $sum_(n=0)^infinity x^n$, $rho=R=1$; it diverges for $x=±1$,
     so the interval is $(-1,1)$, and
     $
       sum_(n=0)^infinity x^n=1/(1-x) quad text("for") x in(-1,1).
     $
  3. The handwritten page writes $sum_(n=0)^infinity (1/n)x^n$. Its subsequent
     endpoint calculation treats the terms as the harmonic series from
     $n=1$: $rho=R=1$; at $x=1$ it diverges, and at $x=-1$ it is alternating
     harmonic and converges. Thus the interval written is $[-1,1)$.
  4. The handwritten page likewise writes $sum_(n=0)^infinity (1/n^2)x^n$;
     the subsequent endpoint sums begin at $n=1$. Here $rho=R=1$ and both
     $sum 1/n^2$ and $sum(-1)^n/n^2$ converge, so the interval is $[-1,1]$.
  5. For $sum_(n=0)^infinity n!x^n$, $rho=infinity$, so $R=0$ and it
     diverges for all $x!=0$.
]

#theorem(title: [Weierstrass M-Test])[
  Let $f_k:A -> bR$ be a sequence of functions, and let $(M_k)$ be a sequence
  in $bR$ such that
  $
    abs(f_k(x))<=M_k
  $
  for all $k in bN$ and $x in A$. If $sum M_k<infinity$, then $sum f_k$
  converges uniformly and absolutely on $A$.
]
#proof[
  Let $g_n(x)=sum_(k=1)^n f_k(x)$. Since $sum M_k$ satisfies Cauchy, choose
  $N$ so that $abs(sum_(k=m+1)^n M_k)<epsilon$ for $N<=m<=n$. Then for all
  $x in A$,
  $
  abs(g_n(x)-g_m(x))
  =abs(sum_(k=m+1)^n f_k(x))
  <=sum_(k=m+1)^n abs(f_k(x))
  <=sum_(k=m+1)^n M_k<epsilon.
  $
  Thus $(g_n)$ is uniformly Cauchy and $sum f_k$ converges uniformly; the
  same calculation gives uniform absolute convergence.
]

#corollary(title: [Uniform convergence inside a radius])[
  If $sum a_n x^n$ has radius of convergence $R$, then for every $0<=K<R$,
  $sum a_n x^n$ converges uniformly to a continuous function on $[-K,K]$.
  Indeed $sum abs(a_n)K^n<infinity$ and
  $abs(a_n x^n)<=abs(a_n)K^n$ on $[-K,K]$, so M-test applies.

  Consequently $f(x)=sum a_n x^n$ is continuous on $(-R,R)$. However its
  convergence on the entire interval of convergence may not be uniform:
  $
    sum_(n=1)^infinity (-1)^(n+1)(x-1)^n/n
  $
  converges to $ln x$ on $(0,2]$ as written in the source note, but the
  convergence is not uniform there (the graph marks the unbounded behavior at
  $x=0$). Fact: a uniform limit of uniformly continuous functions is uniformly
  continuous.
]

#theorem(title: [Abel's theorem])[
  1. If a power series $sum_(k=1)^infinity a_k x^k$ converges at $x=x_0$,
     then it converges uniformly on $(-abs(x_0),abs(x_0))$. If it diverges at
     $x_0$, then it diverges on
     $(-infinity,-abs(x_0)) union (abs(x_0),infinity)$.
  2. If a power series has radius of convergence $R$, then convergence at an
     endpoint of its radius implies convergence at every point between that
     endpoint and $0$; divergence at an endpoint implies divergence on the
     corresponding exterior ray.

  Note: the convergence of $sum a_n x^n$ on its interval of convergence may not
  be uniform.
]
#proof[提示一下，下边（略）。]

#theorem(title: [Term-by-term integration and differentiation of power series])[
  Let $sum_(n=0)^infinity a_n x^n$ have radius of convergence $R>0$ and let
  $f(x)=sum_(n=0)^infinity a_n x^n$ for $x in(-R,R)$.

  1. For every $[a,b] subset (-R,R)$, $f$ is integrable and
     $
       integral_a^b f=sum_(n=0)^infinity integral_a^b a_n x^n dif x.
     $
  2. The power series $sum_(n=1)^infinity n a_n x^(n-1)$ has radius $R$, $f$ is
     differentiable on $(-R,R)$, and
     $
       f^prime(x)=sum_(n=1)^infinity n a_n x^(n-1).
     $
]
#proof[
  (i) follows from integrability of polynomials and uniform convergence of
  $sum a_n x^n$ on $[a,b]$. For (ii), for $t!=0$,
  $
    limsup abs(n/t a_n)^(1/n)
      =abs(1/t)limsup abs(n a_n)^(1/n)
      =abs(1/t)limsup abs(a_n)^(1/n),
  $
  so the differentiated series has radius $R$; its uniform convergence on
  compact subintervals and the preceding derivative theorem prove the claim.
]

#example(title: [Taylor series, calculus, and its caveat])[
  If $f in C^infinity$, try to approximate $f$ near $c$ with
  $
    P_n(x)=sum_(k=0)^n f^((k))(c)/k! (x-c)^k,
  $
  and define
  $
    T(x)=lim_(n -> infinity)P_n(x)
      =sum_(k=0)^infinity f^((k))(c)/k!(x-c)^k,
  $
  where the domain is the interval of convergence of $T$. The source records
  power series
  $
    e^x=sum_(n=0)^infinity x^n/n!,
    quad sin x=sum_(n=0)^infinity (-1)^n x^(2n+1)/(2n+1)!,
    quad cos x=sum_(n=0)^infinity (-1)^n x^(2n)/(2n)!.
  $
  Thus $dif/(dif x)(sin x)=cos x$, $dif/(dif x)(cos x)=-sin x$, and
  $dif/(dif x)(e^x)=e^x$; $e^(pi i)+1=0$. Termwise integration yields
  $
    integral cos(x^2)dif x
    =sum_(n=0)^infinity (-1)^n/((2n)!(4n+1)) x^(4n+1).
  $

  Remark: The Taylor expansion of $f$ may not converge to $f$ at $x=a$ even if
  it converges at $x=a$. Let
  $
    f(x)=cases(delim: "{", e^(-1/x^2) & x!=0, 0 & x=0).
  $
  Then $f in C^infinity$ on $bR$ and $f^((n))(0)=0$ for all $n in bN$.
  Its Taylor series converges everywhere, but converges to $f$ itself only at
  $x=0$. If $f in C^infinity$ and $T(x)->f$ pointwise for all
  $x$ lies in the domain of $T$, then $f$ is a real analytic function, i.e. $f in C^omega$
  ($C^omega subset C^infinity$).
]
