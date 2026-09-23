#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Visual transcription: L16 pp.1-4; L17 pp.1-3; L18 pp.1-3.
= Riemann integration

== Antiderivatives and Riemann sums (L16)

#definition(title: [Antiderivatives])[
  A function $F$ 被称为 an antiderivative of $f$ on interval $I$，if
  $F^prime(x)=f(x)$ for all $x in I$。若 $F$ 是 $f$ 在 $I$ 上的 antdv，那么
  对任意 $C in bR$，$F(x)+C$ 都是在 $I$ 上的 antdv；且 $f$ 在 $I$ 上的任何
  antdv 都是 $F(x)+C$ 的形式。
]

#example(title: [The antiderivative problem])[
  For $r!=-1$,
  $
    dif/(dif x)(x^(r+1)/(r+1))=x^r.
  $
  Thus $x^(r+1)/(r+1)$ is an antiderivative of $x^r$ on $bR$. For example,
  $f(x)=3x^2-2x+7$ has antiderivative $F(x)=x^3-x^2+7x+C$;
  $g(x)=sin(2x)$ has $G(x)=-cos(2x)/2+C$; for
  $h(x)=cos(x^2)$, the question $H(x)=?$ is left as an illustration that
  antiderivatives need not have a familiar formula.

  The antiderivative problem：given a ctn function $f$ on interval $I$，find
  $F$ such that $F^prime=f$ on $I$。Informal 的分析是：当 $h$ 很小时，
  differentiability suggests $F(a+h)-F(a) approx h f(a)$，即 graph 下的一条
  narrow region 的 area approximately 为 $h f(a)$。
]

#remark(title: [The idea “area so far”])[
  对 $t>=0$，令 $F(t)$ 为 $y=f(x)$ 下、$x=0$ 到 $x=t$ 的 area。则对 $a>0$
  与 small $h$，$F(a+h)-F(a) approx h f(a)$，故
  $(F(a+h)-F(a))/h approx f(a)$。但 ``area'' 需要 definition：1 使用
  rectangle as basic notion；2 使用 rectangles 来 approximate complicated
  regions；3 使用 limit of such approximation 定义 ``area''。这就是最早的
  Riemann Integral 的 basic idea。

  L16 p.1 的 shaded vertical strip is represented by the following native
  relation table (the strip runs from $a$ to $a+h$ beneath $y=f(x)$):
  #table(
    columns: (1fr, 1fr, 1fr),
    stroke: 0.6pt + palette.border,
    inset: 4pt,
    [$0$], [$a$], [$a+h$],
    [area so far $F(a)$], [narrow strip], [area so far $F(a+h)$],
    [], [$F(a+h)-F(a) approx h f(a)$], []
  )
]

#definition(title: [Def② 基础架构：partitions, mesh, and tags])[
  $f:[a,b]->bR$ 是一个 function（不需要 ctn）。

  1. A partition $P$ of $[a,b]$ is a finite ordered set
     $P=(x_0,x_1,dots,x_n)$ where $a=x_0<x_1<dots<x_n=b$.
  2. $I_k=[x_(k-1),x_k]$ is the $k$th subinterval of $[a,b]$.
  3. The norm (mesh) is
     $
       norm(P)=max{Delta x_k:1<=k<=n}, quad Delta x_k=x_k-x_(k-1).
     $
  4. A tagged partition $dot P$ is a partition $P=(x_0,dots,x_n)$ together
     with a choice $t_k in I_k$ for every $k$; $t_k$ is the tag.

  The numbered line on L16 p.2 is the partition picture
  $a=x_0<x_1<...<x_n=b$; a representative finite rendering is
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    stroke: (bottom: 0.8pt + palette.ink),
    inset: (x: 5pt, y: 3pt),
    [$a=x_0$], [$x_1$], [$x_2$], [$...$], [$x_n=b$],
    [$I_1$], [$I_2$], [$I_3$], [], [$I_n$]
  ).
]

#definition(title: [Riemann sum])[
  对 tagged partition $dot P$，$f$ 在 $[a,b]$ 上的 Riemann Sum 是
  $
    S(f,dot P)=sum_(k=1)^n f(t_k) Delta x_k.
  $
  tagged partition 就是把 $[a,b]$ 切分成 $n$ 个 subinterval，在每个
  subinterval 上都取一点作为 tag；Riemann Sum 对每个 subinterval 都用
  $f(t_k) Delta x_k$ 近似面积。

  The colored rectangles in L16 p.2 assign one tag to each interval:
  #table(
    columns: (1fr, 1fr, 1fr, 1fr),
    stroke: 0.6pt + palette.border,
    inset: 4pt,
    [$I_1$], [$I_2$], [$dots$], [$I_n$],
    [$t_1 in I_1$], [$t_2 in I_2$], [$dots$], [$t_n in I_n$],
    [$f(t_1)Delta x_1$], [$f(t_2)Delta x_2$], [$dots$], [$f(t_n)Delta x_n$]
  ).
]

#definition(title: [#kn[Riemann integrability]])[
  称 $f$ 在 $[a,b]$ 上 Riemann Integrable，若存在 $L in bR$，使对任意
  $epsilon>0$，存在 $delta>0$ 满足
  $
    abs(S(f,dot P)-L)<epsilon
  $
  对任何 $norm(P)<delta$ 的 tagged partition $dot P$ 都成立。记
  $
    L=integral_a^b f(x) dif x=integral_a^b f
  $
  并称为 $f$ 在 $[a,b]$ 上的 Riemann integral。

  Riemann Integrable: 对于任意小的 $epsilon$，都存在 $delta$ 使得对于任何
  mesh 小于 $delta$ 的 partition，都有其 Riemann Sum 和 $L$ 的距离小于
  $epsilon$。我们发现这是一个 Cauchy 式的 Definition；直觉上（稍后将证明）
  mesh $norm(P)$ 越小，即 partition 越精细，Riemann Sum 就会越接近 area so
  far，因而这个定义很符合直觉。Informally,
  $lim_(norm(P)->0)S(f,dot P)=L$.
]

#theorem(title: [bounded 是 Riemann integrable 的必要条件])[
  If $f$ is Riemann integrable on $[a,b]$，then $f$ is bounded on $[a,b]$。
]
#proof[
  Prove the contrapositive. Suppose $f$ is unbounded on $[a,b]$. Let
  $epsilon=1$, choose any $delta>0$, and take any tagged partition $dot P$
  with $norm(P)<delta$. Fix $k$ such that $f$ is unbounded on $I_k$, then choose
  $s_k in I_k$ with
  $
    abs(f(s_k)-f(t_k))>1/(Delta x_k).
  $
  Replace only the $k$th tag of $dot P$ by $s_k$, producing $dot P^prime$.
  Then $abs(S(f,dot P)-S(f,dot P^prime))>1$. Thus no common limiting $L$ can
  satisfy the definition.
]

#remark(title: [Two boundary examples])[
  一年级 calculus 常把 $integral_0^1 1/sqrt(x) dif x$ 写作答案，但
  $1/sqrt(x)$ 因 unbounded 而不是 Riemann integrable；这实际是 improper
  integral，
  $
    integral_0^1 1/sqrt(x) dif x=lim_(a -> 0^+)integral_a^1 1/sqrt(x) dif x.
  $
  还有 bounded 而 non-Riemann-integrable 的 functions：Dirichlet function
  $
    D(x)=cases(delim: "{", 1 & x in bQ, 0 & x in bR ∖ bQ)
  $
  is bounded on $[0,1]$ but not Riemann integrable. It is Lebesgue integrable,
  with $integral_0^1 D(x) dif x=0$, because $bQ$ has measure zero on $[0,1]$,
  while $bR ∖ bQ$ has measure one. （之后再学 Lebesgue measure 和
  Lebesgue integral。）
]

#definition(title: [Special Riemann sums])[
  一个 regular partition 的所有 $Delta x_k$ 都相同：
  $Delta x_k=norm(P)=(b-a)/n$。对一个 partition，取 $t_k=x_k$ 得 right
  Riemann sum；取 $t_k=x_(k-1)$ 得 left Riemann sum；取
  $t_k=(x_k+x_(k-1))/2$ 得 midpoint Riemann sum。

  Combining the regular partition with the right Riemann sum gives
  $
    S(f,dot P)=sum_(k=1)^n f(a+k(b-a)/n)(b-a)/n.
  $

  L16 p.3 displays the three choices with their tag positions:
  #table(
    columns: (1fr, 1fr, 1fr),
    stroke: 0.6pt + palette.border,
    inset: 4pt,
    [right Riemann sum], [left Riemann sum], [midpoint Riemann sum],
    [$t_k=x_k$], [$t_k=x_(k-1)$], [$t_k=(x_(k-1)+x_k)/2$]
  ).
]

#example(title: [A right sum for $x^2$])[
  Compute the right Riemann sum of $f(x)=x^2$ on $[0,1]$ using a regular
  partition with $n$ subintervals. Here
  $
    x_k=k/n, quad Delta x_k=1/n, quad t_k=k/n
  $
  for $1<=k<=n$, so
  $
  S(f,dot P_n)=sum_(k=1)^n(k/n)^2(1/n)
    =1/n^3 sum_(k=1)^n k^2=(2n^3+3n^2+n)/(6n^3).
  $
  Therefore $lim_(n -> infinity)S(f,dot P_n)=1/3$. But this is only one kind
  of tags on one family of partitions; Riemann integrability must cover all
  tagged partitions. We return to this using Darboux sums.
]

#definition(title: [Darboux sums and integral])[
  Suppose $f:[a,b]->bR$ is bounded and $P=(x_0,dots,x_n)$ is a partition.
  The upper and lower sums are
  $
  U(f,P)=sum_(k=1)^n sup f[I_k] Delta x_k,
  quad
  L(f,P)=sum_(k=1)^n inf f[I_k] Delta x_k.
  $
  The upper and lower Darboux integrals are
  $
  U(f)=inf{U(f,P):P text(" partitions of ") [a,b]},
  quad
  L(f)=sup{L(f,P):P text(" partitions of ") [a,b]}.
  $
  Always $L(f)<=U(f)$. We say $f$ is Darboux integrable on $[a,b]$ iff
  $U(f)=L(f)$. Upper Darboux integral 是所有 partitions 的 upper sum 的下确界；
  lower Darboux integral 是所有 partitions 的 lower sum 的上确界。

  Darboux sum 本身不是 Riemann sum，除非 $f$ continuous（此时 extrema 可取）；
  but for every tagged partition, $L(f,P)<=S(f,dot P)<=U(f,P)$.

  L16 p.4 contrasts the upper and lower rectangle pictures on one partition:
  #table(
    columns: (1fr, 1fr, 1fr),
    stroke: 0.6pt + palette.border,
    inset: 4pt,
    [rectangle height on $I_k$], [tag height], [rectangle height on $I_k$],
    [$inf f[I_k]$ (lower sum)], [$f(t_k)$], [$sup f[I_k]$ (upper sum)],
    [$L(f,P)$], [$S(f,dot P)$], [$U(f,P)$]
  ).
]

#theorem(title: [Refinement lemma])[
  Let $f:[a,b]->bR$ be bounded with $abs(f(x))<=B$ for all $x in[a,b]$. Let
  $Q ⊇ P=(x_k)_(k=0)^n$ be partitions of $[a,b]$, and put
  $
    J={k: Q inter (x_(k-1),x_k) != emptyset}.
  $
  Then
  $
  L(f,P)<=L(f,Q), quad abs(L(f,P)-L(f,Q))<=2 abs(J) B norm(P),
  $
  and dually
  $
  U(f,Q)<=U(f,P), quad abs(U(f,Q)-U(f,P))<=2 abs(J) B norm(P).
  $
]
#proof[
  Fix $k in J$, and let $x_(k-1)=y_0<dots<y_r=x_k$ be the partition points
  of $Q$ in $I_k$. Then
  $
  L(f,Q inter I_k)=sum_(j=1)^r inf_( [y_(j-1),y_j] ) f Delta y_j
  $
  whereas $(inf f[I_k])Delta x_k=sum_(j=1)^r inf f[I_k] Delta y_j$. Each
  difference is at most $2B Delta y_j$, hence
  $
    0<=L(f,Q inter I_k)-(inf f[I_k])Delta x_k<=2B Delta x_k<=2B norm(P).
  $
  Sum over $k in J$. The upper-sum statement is dual. Thus refinement makes
  lower sums bigger and upper sums smaller, and the difference depends on how
  many new points and how small the mesh is.
]

== Equivalence and basic properties (L17)

#theorem(title: [Equivalent Riemann/Darboux criteria])[
  For a bounded function $f:[a,b]->bR$, the following are equivalent:

  1. $f$ is Riemann integrable on $[a,b]$.
  2. For every $epsilon>0$, there is $delta>0$ such that every two tagged
     partitions $dot P,dot Q$ with $norm(P),norm(Q)<delta$ satisfy
     $abs(S(f,dot P)-S(f,dot Q))<epsilon$.
  3. For every $epsilon>0$, there is $delta>0$ such that every partition $P$
     with $norm(P)<delta$ satisfies $U(f,P)-L(f,P)<epsilon$.
  4. $f$ is Darboux integrable on $[a,b]$.
  5. For every $epsilon>0$, there is a partition $P$ of $[a,b]$ such that
     $U(f,P)-L(f,P)<epsilon$.
]
#proof[
  *(1) => (2).* If all sufficiently fine Riemann sums are within
  $epsilon/2$ of $L$, their pairwise difference is below $epsilon$.

  *(2) => (3).* For a fixed fine partition choose, in every $I_k$, points
  $s_k,t_k$ approaching $inf f[I_k]$ and $sup f[I_k]$ sufficiently closely:
  $
    abs(f(s_k)-inf f[I_k])<epsilon/(4(b-a)),
    quad abs(f(t_k)-sup f[I_k])<epsilon/(4(b-a)).
  $
  The associated tagged sums differ by less than $epsilon/2$, while their
  distances to $L(f,P)$ and $U(f,P)$ are each below $epsilon/4$; thus
  $U(f,P)-L(f,P)<epsilon$.

  *(3) => (4).* Since $L(f,P)<=L(f)<=U(f)<=U(f,P)$ for every $P$,
  $abs(L(f)-U(f))<=U(f,P)-L(f,P)<epsilon$. Hence $L(f)=U(f)$.

  *(4) => (5).* Choose partitions $P,Q$ with
  $L(f)-epsilon/2<L(f,P)$ and $U(f,Q)<U(f)+epsilon/2$. For the common
  refinement $P union Q$,
  $
  L(f)-epsilon/2<L(f,P)<=L(f,P union Q)<=U(f,P union Q)
    <=U(f,Q)<U(f)+epsilon/2,
  $
  whence its upper-minus-lower sum is below $epsilon$.

  *(5) => (3).* Fix $P_0$ with $U(f,P_0)-L(f,P_0)<epsilon/2$. Let
  $abs(f(x))<=B$ and choose $delta=epsilon/(8m B)$, where $m$ is the number
  of subintervals of $P_0$. For any $P$ with $norm(P)<delta$, let
  $Q=P union P_0$. The refinement lemma bounds both changes by
  $2m B delta<=epsilon/4$. Together with
  $L(f,P_0)<=L(f,Q)<=U(f,Q)<=U(f,P_0)$ this gives
  $U(f,P)-L(f,P)<epsilon$.
]

#example(title: [$x^2$ and the Dirichlet function])[
  For $f(x)=x^2$ on $[0,1]$ and the regular partition $P_n$ with $n$ intervals,
  $
  U(f,P_n)=sum_(k=1)^n(k/n)^2(1/n)=(2n^3+3n^2+n)/(6n^3),
  $
  $
  L(f,P_n)=sum_(k=0)^(n-1)(k/n)^2(1/n)
    =(2n^3-3n^2+n)/(6n^3).
  $
  Both tend to $1/3$, so $x^2$ is Darboux and hence Riemann integrable, with
  $integral_0^1x^2 dif x=1/3$.

  For $D(x)=1$ on $bQ$ and $0$ on $bR ∖ bQ$, every subinterval contains
  rationals and irrationals, so every partition has $U(D,P)=1$ and $L(D,P)=0$.
  Therefore it is neither Darboux nor Riemann integrable, although it is
  Lebesgue integrable and $integral_0^1D(x) dif x=0$.
]

#theorem(title: [Linearity of integration])[
  If $f,g:[a,b]->bR$ are Riemann integrable and $c in bR$, then $c f$ and
  $f+g$ are Riemann integrable and
  $
    integral_a^b c f=c integral_a^b f,
    quad integral_a^b(f+g)=integral_a^b f+integral_a^b g.
  $
]
#proof[This follows from linearity of Riemann sums:
$S(c f,dot P)=c S(f,dot P)$ and $S(f+g,dot P)=S(f,dot P)+S(g,dot P)$.]

#theorem(title: [Monotonicity of integration])[
  If $f,g:[a,b]->bR$ are Riemann integrable and $f(x)<=g(x)$ for all
  $x in[a,b]$, then
  $
    integral_a^b f<=integral_a^b g.
  $
]
#proof[For every partition $P$, $U(f,P)<=U(g,P)$, hence $U(f)<=U(g)$.]

#theorem(title: [Monotone functions are integrable])[
  If $f:[a,b]->bR$ is monotone on $[a,b]$, then $f$ is Riemann integrable on
  $[a,b]$.
]
#proof[
  WLOG suppose $f$ is increasing. Given $epsilon>0$, take any partition
  $P=(x_k)_(k=0)^n$ with $norm(P)<epsilon/(f(b)-f(a))$. Then
  $
  U(f,P)-L(f,P)
  =sum_(k=1)^n(sup f[I_k]-inf f[I_k])Delta x_k
  =sum_(k=1)^n(f(x_k)-f(x_(k-1)))Delta x_k
  $
  $
  <=sum_(k=1)^n(f(x_k)-f(x_(k-1)))epsilon/(f(b)-f(a))
  =epsilon.
  $
]

== Measure-zero criterion, FTC, and rules (L18)

#definition(title: [Zero-measure set])[
  $A subset bR$ has measure zero if, for every $epsilon>0$, there is a
  sequence of open intervals $((a_k,b_k))_(k in bN)$ such that
  $
    A subset union_(k in bN)(a_k,b_k),
    quad sum_(k=1)^infinity(b_k-a_k)<epsilon.
  $
  注：zero measure 的意义是这个集合的 length 是 $0$。它可以是无限甚至
  uncountable 的，但能由一串很窄的开区间覆盖；例如 Cantor set，
  $abs(F)=c$, 但它是 zero measure。
]

#theorem(title: [Lebesgue's characterization of integrability])[
  A bounded function $f:[a,b]->bR$ is Riemann integrable iff the set of
  discontinuities of $f$ has measure zero. （$f$ 的非连续点是零测的。）
]

#remark(title: [Consequences of the criterion])[
  任何 countable 的 $A subset bR$ 都 has measure zero，因此任何只有
  countably many discontinuities 的函数都是 Riemann integrable，例如
  Thomae's function. Last time: monotone functions are Riemann integrable.
]

#lemma(title: [Uniform-continuity oscillation estimate])[
  Let $g:[c,d]->bR$. Suppose there are $epsilon,delta>0$ such that
  $abs(g(x)-g(y))<epsilon$ whenever $x,y in[c,d]$ and $abs(x-y)<=delta$.
  Then $g$ is bounded, and
  $
    sup(g)-inf(g)<=((d-c)/delta+1)epsilon.
  $
]
#proof[
  Given $x<y$, choose least $n$ with $(d-c)/delta<=n$, so
  $n<1+(d-c)/delta$, and set $z_k=x+k(y-x)/n$. Each increment is at most
  $delta$, hence
  $
  abs(g(x)-g(y))<=sum_(k=1)^n abs(g(z_k)-g(z_(k-1)))
    <n epsilon<((d-c)/delta+1)epsilon.
  $
  Since $x,y$ are arbitrary, the claim follows.
]

#theorem(title: [Composition theorem])[
  Let $f:[a,b]->bR$ be integrable on $[a,b]$, and suppose $g:bR->bR$ is
  continuous. Then $g circle f$ is integrable on $[a,b]$.
]
#proof[
  Since $f$ is integrable it is bounded, so choose a closed bounded interval
  $I ⊇ f([a,b])$. Then $g$ is uniformly continuous on $I$. Given
  $epsilon>0$, choose $delta>0$ so that
  $
    abs(x-y)<delta => abs(g(x)-g(y))<epsilon/(2(b-a)).
  $
  Choose $P$ with $U(f,P)-L(f,P)<delta(b-a)$. Apply the lemma on every
  $[inf f[I_k],sup f[I_k]]$ to estimate its $g circle f$ oscillation. Then
  $
  U(g circle f,P)-L(g circle f,P)
  <=epsilon/(2delta(b-a))(U(f,P)-L(f,P))
    +sum_(k=1)^n epsilon/(2(b-a))Delta x_k<epsilon.
  $
]

#corollary(title: [Continuous functions and products])[
  Continuous functions are integrable: take $g(x)=x$ in the composition
  theorem. If $f$ and $g$ are integrable, then $f g$ is integrable, because
  $
    f g=1/2((f+g)^2-f^2-g^2)
  $
  and $h(x)=x^2$ is continuous.
]

#theorem(title: [Additional properties of the integral])[
  If $f$ is integrable on $[a,b]$, then $abs(f)$ is integrable and
  $
    abs(integral_a^b f)<=integral_a^b abs(f).
  $
  If $a<c<b$, then $f$ is integrable on $[a,b]$ iff it is integrable on both
  $[a,c]$ and $[c,b]$, and
  $
    integral_a^b f=integral_a^c f+integral_c^b f.
  $
  More generally, the L18 p.2 restriction construction says: if
  $[c,d] subset [a,b]$ and
  $
    g(x)=cases(delim: "{", f(x) & x in[c,d], 0 & x in[a,b]∖[c,d]),
  $
  then $g=f chi_([c,d])$, where
  $
    chi_A(x)=cases(delim: "{", 1 & x in A, 0 & x ∉ A),
  $
  is the characteristic function of $A subset bR$, and
  $
    integral_c^d f=integral_a^b g=integral_a^b f chi_([c,d]).
  $
  Altering $f$ at finitely many points does not change integrability or the
  integral. Equivalently, if $f$ is integrable and
  $
    g(x)=f(x) text(" for all but finitely many ") x in[a,b],
  $
  then $g$ is integrable and $integral_a^b f=integral_a^b g$. The proof uses
  uniform continuity to make the changed finite-point contributions arbitrarily
  small.
]

== Fundamental Theorem of Calculus

#theorem(title: [FTC I])[
  Suppose $F:[a,b]->bR$ is continuous on $[a,b]$, differentiable on $(a,b)$,
  and $F^prime$ is Riemann integrable on $[a,b]$. Then
  $
    integral_a^b F^prime(x) dif x=F(b)-F(a).
  $
  Notation: $F(b)-F(a)=F(x)|_a^b$.
]
#proof[
  Given a partition $P=(x_k)_(k=0)^n$ with
  $U(F^prime,P)-L(F^prime,P)<epsilon$, MVT supplies $t_k in I_k$ with
  $
  F^prime(t_k)=(F(x_k)-F(x_(k-1)))/(x_k-x_(k-1)).
  $
  Thus
  $
  F(b)-F(a)=sum_(k=1)^n(F(x_k)-F(x_(k-1)))
    =sum_(k=1)^n F^prime(t_k)Delta x_k=S(F^prime,dot P).
  $
  Since $L(F^prime,P)<=S(F^prime,dot P)<=U(F^prime,P)$, the difference between
  $integral_a^b F^prime$ and $F(b)-F(a)$ is below $epsilon$.
]

#theorem(title: [FTC II])[
  Let $f:[a,b]->bR$ be Riemann integrable and define
  $
    F(x)=integral_a^x f(t) dif t, quad a<=x<=b.
  $
  Then $F$ is uniformly continuous on $[a,b]$. If $f$ is continuous at
  $x_0 in(a,b)$, then $F$ is differentiable at $x_0$ and $F^prime(x_0)=f(x_0)$.
]
#proof[
  Fix $B$ with $abs(f(x))<=B$. If $0<x-y<delta=epsilon/B$, then
  $
  abs(F(x)-F(y))=abs(integral_y^x f(t) dif t)
    <=integral_y^x abs(f(t))dif t<=B(x-y)<epsilon,
  $
  so $F$ is uniformly continuous. At a continuity point $x_0$,
  $
  (F(x)-F(x_0))/(x-x_0)-f(x_0)
  =1/(x-x_0)integral_(x_0)^x(f(t)-f(x_0))dif t.
  $
  Given $epsilon>0$, continuity gives $delta>0$ with
  $abs(f(t)-f(x_0))<epsilon$ whenever $abs(t-x_0)<delta$. Thus, for
  $x in V_delta(x_0)$ and $x!=x_0$,
  $
  abs((F(x)-F(x_0))/(x-x_0)-f(x_0))
  <=1/abs(x-x_0) abs(integral_(x_0)^x(f(t)-f(x_0))dif t)
  <=1/abs(x-x_0) integral_(x_0)^x epsilon dif t=epsilon.
  $
  Therefore $F^prime(x_0)=f(x_0)$.

  Note: $f$ 在 $x_0$ 处 continuous 是 FTC II 中很重要的条件。
]

#example(title: [FTC examples and caveats])[
  $
  g(x)=integral_0^x cos(t^2)dif t
  $
  is an antiderivative of $f(x)=cos x^2$ on $bR$ because $f$ is continuous.
  Also
  $
  dif/(dif x)integral_0^x e^(t^2)dif t=e^(x^2),
  $
  though the integral generally cannot be written in elementary closed form.
  By the chain rule,
  $
    dif/(dif x)integral_0^(x^3)sin t dif t=sin(x^3)⋅3x^2.
  $
  More generally,
  $
    dif/(dif x)integral_a^(g(x)) f(t)dif t=f(g(x))g^prime(x)
  $
  if $f$ is Riemann integrable and continuous where needed.

  FTC says differentiation and integration can be inverse operations, but:
  (1) derivatives need not be integrable, for example
  $f(x)=x^2sin(1/x^2)$ has an unbounded derivative; (2) indefinite integrals
  need not be antiderivatives (Thomae's function has no antiderivative), while
  an integral has constant zero.
]

#theorem(title: [Integration by parts])[
  If $u,v$ are continuous on $[a,b]$, differentiable on $(a,b)$, and
  $u^prime,v^prime$ are integrable on $[a,b]$, then
  $
    integral_a^b u(x)v^prime(x)dif x
    =u(x)v(x)|_a^b-integral_a^b u^prime(x)v(x)dif x.
  $
  In the shorthand, $integral u dif v=u v-integral v dif u$.
]
#proof[
  Differentiate $u(x)v(x)$:
  $(u v)^prime=u^prime v+u v^prime$, then integrate on $[a,b]$ and use FTC I.
]

#theorem(title: [Change of variables])[
  Suppose $u=f(x)$ is a continuously differentiable function on an open
  interval $J$, let $I$ be an open interval with $I ⊇ f[J]$, and let
  $g$ be continuous on $I$. Then for $a,b in J$,
  $
    integral_a^b g(f(x))f^prime(x)dif x=integral_(f(a))^(f(b))g(u)dif u.
  $
]
#proof[
  If $G^prime=g$, then $(G circle f)^prime=g circle f ⋅ f^prime$, so FTC I
  gives the equality.
]
