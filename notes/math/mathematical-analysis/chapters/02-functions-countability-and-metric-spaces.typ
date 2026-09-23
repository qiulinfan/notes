#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let bC = math.bb("C")

= Functions, countability, and metric spaces

== Archimedean facts and metric spaces

// Source: lectures/L03-Archimedean-property&Metric-Space.pdf p.1.

源页问 ``一个 field 既 algebraically closed 又 geometrically closed''。
答案是 $bC$：``both algebraically and geometrically closed (topologically)''；
但 $bC$ 不是 ordered field。作业旁注是 ``impossible to define linear order on
$bC$''。尽管 $bR$ 的 completeness axiom 用 order 表述，后面会从 Cauchy
sequences 得到一个不依赖 order 的版本。

#theorem(title: [Useful supremum test])[
  Let $A subset.eq bR$ and $l in bR$.  Then $l=sup A$ if and only if
  $l$ is an upper bound of $A$ and, for every $epsilon>0$, there exists
  $a in A$ with $l-epsilon<a<=l$.
]

The Chinese explanation is: “只要下移一点点，就会超进去”.
For a set bounded below, if $L$ is its set of lower bounds, then
$inf A=sup L$; equivalently, $inf A=-sup(-A)$.

#theorem(title: [Copies of $bN$, $bZ$, and $bQ$])[
  Every ordered field $F$ contains copies of $bN$, $bZ$, and $bQ$:
  $1_F$, $2_F=1_F+1_F$, and so on give $bN$; additive inverses give
  $bZ$; and $p_F/q_F$ gives $bQ$.
]

#theorem(title: [Archimedean properties])[
  In an Archimedean ordered field $F$:

  - for every $x in F$, there is $n in bN$ with $x<n$;
  - for every $x>0$ in $F$, there is $n in bN$ with $1/n<x$;
  - for every $x in F$, there is $n in bZ$ with $n-1<=x<=n$;
  - equivalently, for $x,y>0$ in $F$, there is $n in bN$ with $n y>x$.
]

这些 characterizations 给出 $bQ$ 的 density：

$forall x<y in F, exists r in bQ: x<r<y.$

取 $n$ 使 $n(y-x)>2$，再取 $m in bZ$ 使 $n x<m<n y$，于是
$x<m/n<y$。所以任意两个 reals 之间有 infinitely many rational points。
源页还写 ``$bR without bQ$ is also dense in $bR$ (hw)''。

// Source: lectures/L03-Archimedean-property&Metric-Space.pdf p.2.

#theorem(title: [$bR$ is Archimedean])[
  $bR$ is an Archimedean ordered field.
]

若 $bN$ 有 upper bound，令 $s=sup bN$。则 $s-1$ 不是 upper bound，故某个
$n in bN$ 满足 $s-1<n$。于是 $s<n+1$，但 $n+1 in bN$，矛盾。源页给出
$bR(x)$（rational functions）和 $p$-adic fields $bQ_p$ 作为 non-Archimedean
examples，并写道：
“there is a consistent and rigorous way to do calculus with infinitesimals
(non-standard analysis)”.

#definition(title: [Absolute value])[
  For $a,b in bR$,
  $-abs(a)<=a<=abs(a)$, $abs(a)=sqrt(a^2)$,
  $abs(a b)=abs(a)abs(b)$, and
  $abs(a+b)<=abs(a)+abs(b)$.
  Consequently $abs(abs(a)-abs(b))<=abs(a-b)$.
]

The proof of the triangle inequality squares both sides:
$(a+b)^2<=a^2+2abs(a)abs(b)+b^2=(abs(a)+abs(b))^2$.
The extended form is
$abs(sum_(i=1)^n a_i)<=sum_(i=1)^n abs(a_i)$.

#definition(title: [Metric and #kn[Metric space]])[
  A metric on $X$ is a map $d:X times X -> bR$ such that, for all
  $a,b,c in X$:

  - $d(a,b)>=0$, with equality if and only if $a=b$;
  - $d(a,b)=d(b,a)$; and
  - $d(a,c)<=d(a,b)+d(b,c)$.

  The pair $(X,d)$ is a metric space.
]

// Source: lectures/L03-Archimedean-property&Metric-Space.pdf p.3.

#theorem(title: [Euclidean metric])[
  For every $k in bN$, $bR^k$ is a metric space under
  $d(vec(x),vec(y))=norm(vec(x)-vec(y))$, where
  $vec(x) dot vec(y)=sum_(i=1)^k x_i y_i$ and
  $norm(vec(x))=sqrt(vec(x)dot vec(x))$.
]

Cauchy--Schwarz,
$abs(vec(x)dot vec(y))<=norm(vec(x))norm(vec(y))$, follows by expanding
$norm(lambda vec(x)-vec(y))^2>=0$ and taking
$lambda=(vec(x)dot vec(y))/norm(vec(x))^2$ when $vec(x)!=0$.
The metric triangle inequality then follows from
$vec(x)-vec(y)=(vec(x)-vec(z))+(vec(z)-vec(y))$.

== Functions

// Source: lectures/L04(1)-Function&Countability.pdf p.1.

The lecture begins with

$[a,b] = inter.big_(n in bN) (a-1/n,b+1/n)$

and

$(a,b) = union.big_(n in bN) [a+1/n,b-1/n]$.

It records
$inf(A union B)=min(inf A,inf B)$,
$sup(A union B)=max(sup A,sup B)$,
$sup(c A)=c sup A$ for $c>0$,
$sup(-A)=-inf A$, and $sup(A+B)=sup A+sup B$.
The warning is $sup(A B) != sup A sup B$ in general.

#definition(title: [Function, domain, codomain, image])[
  一个 function $f:X -> Y$ 是 $f subset.eq X times Y$ 的 subset，且对每个
  $x in X$，恰有一个 $y in Y$ 满足 $(x,y) in f$。
  Write $upright("dom")(f)=X$, $upright("cod")(f)=Y$, and
  $im(f)=upright("ran")(f)={f(x):x in X} subset.eq Y$.

  For $A subset.eq X$ and $B subset.eq Y$,
  $f[A]={f(a) in Y:a in A}$ and
  $f^(-1)[B]={x in X:f(x) in B}$.
]

源页 examples 为 $x mapsto x^2$ on $bR$、$x mapsto 1/x$ on
$bR without {0}$、the supremum function from $cal(P)(bR)$ to
$bR union {+infinity,-infinity}$, the harmonic function $n mapsto 1/n$, and Dirichlet's function
$D(x)=1$ for $x in bQ$ and $D(x)=0$ for $x in bR without bQ$.

// Source: lectures/L04(2)-Handout-Function.pdf pp.1–4.

The handout “More Joy of Sets” retains its English terminology: “map” and
“mapping” are synonyms for function; domain/source and codomain/target space
are $upright("dom")(f)$ and $upright("cod")(f)$; an input variable is independent and an output
variable dependent.  The pointwise notation is $x mapsto f(x)$.

For image and inverse image:

- $f[f^(-1)[C]] subset.eq C$ and $f^(-1)[f[A]] supset.eq A$;
- $f[A union B]=f[A] union f[B]$;
- $f[A inter B] subset.eq f[A] inter f[B]$;
- $f[A without B] supset.eq f[A] without f[B]$;
- inverse images preserve union, intersection, and difference exactly.

The identity is $id_X:X->X$, $id_X(x)=x$.  Composition is
$(g compose f)(x)=g(f(x))$ and is associative.

#definition(title: [Inverse, injection, surjection, bijection])[
  An inverse of $f:X->Y$ is $g:Y->X$ with
  $g compose f=id_X$ and $f compose g=id_Y$.  A function is injective if
  $x!=x'$ implies $f(x)!=f(x')$, surjective if each $y in Y$ has a
  preimage, and bijective if it is both.
]

#theorem(title: [Invertibility criterion])[
  A function is invertible if and only if it is bijective.
]

If $f:X->Y$ and $g:Y->Z$, composition preserves injectivity, surjectivity,
and bijectivity; if $g compose f$ is injective, $f$ is injective, and if it
is surjective, $g$ is surjective.  The source's graph remark is that
horizontal lines meet an injective real graph at most once and a surjective
one at least once.

The restriction of $f:X->Y$ to $A subset.eq X$ is the map $A->Y$ which
agrees with $f$ on $A$.  Thus $x mapsto x^2$ on $bR$ is neither injective nor surjective, its
restriction to $[0,infinity)$ is injective, and
$[0,infinity)->[0,infinity)$, $x mapsto x^2$, is bijective.

list 记住 order 和 repetition：
$(N,A,S,A)!=(N,A,S)$ and $(N,A,S)!=(N,S,A)$.  An $n$-tuple is
$(x_1,dots,x_n)$.  The Cartesian product is
$X times Y={(x,y):x in X upright(" and ") y in Y}$, while
$bR^n$ is both a Cartesian product and a vector space.  The graph is
$upright("graph")(f)={(x,y) in X times Y:f(x)=y}$, and the rigorous ordered-pair
encoding is $(x,y)={{x},{x,y}}$.

== Cardinality and countability

// Source: lectures/L04(1)-Function&Countability.pdf pp.2–3.

#definition(title: [Cardinality and countability])[
  $X$ is finite if $|X|=n$ for some $n in bN$, and infinite if an injection
  $bN->X$ exists.  Write $X<=Y$ for an injection $X->Y$, and $X approx Y$
  for a bijection.

  $X$ is countably infinite if $X approx bN$; it is countable if
  $X<=bN$.
]

The example $bN approx bZ$ maps an odd $n$ to $(n-1)/2$ and an even $n$ to
$-n/2$; it is bijective.

#theorem(title: [Cantor--Schröder--Bernstein])[
  If $X<=Y$ and $Y<=X$, then $X approx Y$.
]

#theorem(title: [Cantor diagonal arguments])[
  $bQ$ is countable, $bR$ is uncountable, and every set $X$ satisfies
  $|cal(P)(X)|>|X|$.
]

Rationals are diagonally enumerated as pairs $(m,n) in bZ times bZ$,
$n!=0$.  If $f:bN->[0,1]$ were surjective, choose decimal
$0.d_1d_2dots$ whose $n$th digit differs from the $n$th digit of $f(n)$;
it is not in the range.  More generally, for $f:X->cal(P)(X)$,
$D={x in X:x in.not f(x)}$ cannot equal $f(x_0)$ for any $x_0$.
The page notes $bC approx bR^2$ and calls the assertion that no cardinality
lies strictly between $bN$ and $bR$ the continuum hypothesis.

// Source: lectures/L04(3)-Handout-Countability.pdf pp.1–2.

#theorem(title: [Countable products and unions])[
  If $A_1,dots,A_n$ are countable, then
  $A_1 times dots times A_n$ is countable.  If $I$ is countable and every
  $A_i$ is countable, then $union.big_(i in I) A_i$ is countable.
]

For the product, injections $f_i:A_i->bN$ yield

$f(a_1,dots,a_n)=product_(i=1)^n p_i^(f_i(a_i)),$

an injection by unique prime factorization.  For the union, take a
surjection $f:bN->I$, surjections $f_n:bN->A_(f(n))$, and a surjection
$h:bN->bN times bN$ with $h(n)=(n_1,n_2)$; then
$g(n)=f_(n_1)(n_2)$ is surjective onto the union.

最后，$(a,b)$ 包含 uncountably many irrational numbers：若其 irrational part
countable，与 $(a,b) inter bQ$ 的 union 会使 $(a,b)$ countable。手写结论为
$accent(bQ,macron)$ is countable，so there are uncountably many
transcendental numbers。

== Page-complete lecture record

=== L03--Archimedean-property&Metric-Space, p. 1

The review first says $accent(bQ,macron)$ is algebraically closed and $bR$
is geometrically closed, but $accent(bQ,macron)!=bR$ and
$bR!=accent(bQ,macron)$. The written question is "can we find a
both-closed field?" Answer: yes, $bC$; "$bC$ is both algebraically and
geometrically closed (topologically)". However, "$bC$ is not an ordered
field" and the homework is "impossible to define linear order on $bC$".
The note asks how $bC$ can be geometrically complete if the completeness
axiom for $bR$ is based on order; answer: define an order-free axiom with
Cauchy sequences (next week).

The dual completeness statement is written and proved twice:

$A subset.eq bR, A!=emptyset, A upright(" bounded below") => exists inf A in bR.$

First let $L$ be the set of all lower bounds of $A$; completeness gives $sup L in bR$,
and the goal is $sup L=inf A$. Second define
$-A={-a:a in A}$; then $-A!=emptyset$ and, since $A$ is bounded below,
$-A$ is bounded above, and $inf A=-sup(-A)$.

The useful supremum fact is stated as

$l=sup A => l upright(" is a UB of ") A upright(" and ")
(forall epsilon>0)(exists a in A)(l-epsilon<a<=l).$

The source's number-line schematic is equivalently rendered by

#align(center)[
  $arrow.l.long quad l-epsilon quad upright("(") arrow.r.long l upright("|") arrow.r.long$
]

and its Chinese explanation is "只要下移一点点，就会超进去".
It also records the "wrong" Newton/Leibniz definition
$epsilon>0$ is infinitesimal exactly when $(forall n in bN) epsilon<=1/n$,
then asks "这边 infinitesimal 吗?" The answer depends on the definition of
$bR$; according to axioms 1--15, "NO!", and the present proof uses the
Archimedean property of $bR$.

For every ordered field $F$, the page constructs its copies of $bN,bZ,bQ$:
$1_F$, $2_F=1_F+1_F$, $3_F=1_F+1_F+1_F,dots$; then
$0_F-1_F,-2_F=0_F-1_F-1_F,dots$; and finally
$(p/q)_F=p_F/q_F$. The Archimedean properties are listed exactly as

$forall x in F, exists n in bN: x<n;$

$forall x>0 in F, exists n in bN: 1/n<x;$

$forall x in F, exists n in bZ: n-1<=x<n;$

$forall x,y>0 in F, exists n in bN: n y>x.$

=== L03--Archimedean-property&Metric-Space, p. 2

The page observes that (4) implies (1) by taking $y=1$, while (1) implies
(4): given $x,y>0$, choose $n>x/y$. It states density in the mixed wording
"$bQ$ 在 $F$ 中稠密性：$forall x<y in F, exists r in bQ$ s.t.
$x<r<y$". The complete working is

$x<y => y-x>0;$
choose $n in bN$ with $n(y-x)>2$; by the integer property choose
$m in bZ$ with $n x<m<n y$; hence $x<m/n<y$.

The native number-line schematic on the sheet has the rational point
between the endpoints:

#align(center)[
  $x quad arrow.r.long quad m/n quad arrow.r.long quad y$
]

The conclusion is "there are infinitely many rational pts between $x,y$";
also "$bR without bQ$ is also dense in $bR$ (hw)". It contrasts $bR$ and $bQ$ as
Archimedean with non-Archimedean ordered fields, giving
$bR(x)$ (all real functions) and $p$-adic fields $bQ_p$. The full proof
of "$bR$ is an Archimedean ordered field" is: suppose
$exists x in bR$ such that no $n in bN$ has $x<n$. Then $x$ is a UB of
$bN$, so $sup bN in bR$. Since $sup bN-1$ is not a UB, some $n in bN$
satisfies $sup bN-1<n$, hence $sup bN<n+1$, contradicting
$n+1 in bN$. The source then says, "尽管 infinitesimal 在 real line 上不存在,
there is a consistent and rigorous way to do calculus with infinitesimals
(non-standard analysis)."

The absolute-value list is

$-|a|<=a<=|a|, quad |a|=sqrt(a^2), quad |a b|=|a||b|,$

$|a+b|<=|a|+|b|, quad |a-b|>=||a|-|b||.$

For the triangle inequality it writes

$|a+b|^2=(a+b)^2=a^2+2 a b+b^2
<=a^2+2|a||b|+b^2=(|a|+|b|)^2,$

then $|a+b|<=|a|+|b|$. The extension is

$forall a_1,dots,a_n in bR, quad
|sum_(i=1)^n a_i|<=sum_(i=1)^n|a_i|.$

A metric is a function $d:X times X->bR$ with
(i) $d(a,b)>=0$ and $d(a,b)=0 => a=b$, (ii) $d(a,b)=d(b,a)$, and
(iii) $d(a,c)<=d(a,b)+d(b,c)$. If it satisfies the triangular property,
$d$ is a metric and $X$ is a metric space; hence absolute value makes
$bR$ a metric space.

=== L03--Archimedean-property&Metric-Space, p. 3

For $k in bN$, the source writes

$bR^k={vec(x)=(x_1,x_2,dots,x_k):x_i in bR, 1<=i<=k},$

$vec(x) dot vec(y)=sum_(i=1)^k x_i y_i, quad
norm(vec(x))=sqrt(vec(x)dot vec(x)),$

and $d(vec(x),vec(y))=norm(vec(x)-vec(y))$. The proofs of positivity and
symmetry are explicitly
$sqrt(sum_(i=1)^k(x_i-y_i)^2)>0$ if $vec(x)!=vec(y)$ (and $=0$ exactly when equal),
and
$sqrt(sum_(i=1)^k(x_i-y_i)^2)=sqrt(sum_(i=1)^k(y_i-x_i)^2)$.

For Cauchy--Schwarz, $(lambda vec(x)-vec(y))^2>=0$ gives

$lambda^2 norm(vec(x))^2-2lambda vec(x)dot vec(y)+norm(vec(y))^2>=0.$

Take $lambda=(vec(x)dot vec(y))/norm(vec(x))^2$ when $vec(x)!=0$, giving

$(vec(x)dot vec(y))^2/norm(vec(x))^2<=norm(vec(y))^2,$

hence $norm(vec(x))norm(vec(y))>=vec(x)dot vec(y)$. For the triangle
inequality, let $vec(a)=vec(x)-vec(y)$,
$vec(b)=vec(x)-vec(z)$, $vec(c)=vec(z)-vec(y)$, so $vec(a)=vec(b)+vec(c)$;
then

$(norm(vec(b))+norm(vec(c)))^2
=norm(vec(b))^2+2norm(vec(b))norm(vec(c))+norm(vec(c))^2$

$>=norm(vec(b))^2+2vec(b)dot vec(c)+norm(vec(c))^2
=norm(vec(b)+vec(c))^2=norm(vec(x)-vec(y))^2.$

=== L04(1)--Function&Countability, pp. 1--3

The review uses the two native interval relationships

$[a,b]=inter.big_(n in bN)(a-1/n,b+1/n), quad
(a,b)=union.big_(n in bN)[a+1/n,b-1/n]$

and the Archimedean test:
in any ordered field, $(forall epsilon>0, |a-b|<epsilon)=>a=b$; in an
Archimedean ordered field it suffices that
$(forall n in bN, |a-b|<1/n)=>a=b$. It then lists
$inf A<=sup A$, $inf(A union B)=min(inf A,inf B)$,
$sup(A union B)=max(sup A,sup B)$, $sup(c A)=c sup A$ for $c>0$,
$sup(-A)=-inf A$, $sup(A+B)=sup A+sup B$, and
$sup(A B)!=sup(A)sup(B)$.

The "blobs and arrows" function diagram is rebuilt natively:

#align(center)[
  #table(columns: (1fr, auto, 1fr), inset: 7pt, stroke: none,
    [#align(center)[
      #box(stroke: 0.7pt, radius: 45%)[ $x$ ]
      #linebreak()
      $X=upright("dom")(f)$
    ]],
    [$f arrow.r$],
    [#align(center)[
      #box(stroke: 0.7pt, radius: 45%)[ $f(x)$ ]
      #linebreak()
      $Y=upright("cod")(f)$
    ]])
]

Its exact definition is $f:X->Y$, $f subset.eq X times Y$, and
$(forall x in X)(exists! y in Y)$ such that $(x,y) in f$; it calls
$X=upright("dom")(f)$, $Y=upright("cod")(f)$, and
$im(f)=upright("ran")(f)={f(x):x in X} subset.eq upright("cod")(f)$. It gives
$f[A]={f(x) in upright("cod")(f):x in A}$ and
$f^(-1)[B]={x in upright("dom")(f):f(x) in B}$. The explicit examples are the
squaring function, reciprocal function
$bR without {0}->bR without {0}$, supremum function
$cal(P)(bR)->bR union {+infinity,-infinity}$, harmonic function
$bN->bR$, $h(n)=1/n$, and Dirichlet's function
$D(x)=0$ for $x in bR without bQ$, $D(x)=1$ for $x in bQ$.

Its two-level function sketch is retained natively:

#align(center)[
  #block(width: 150pt, height: 90pt, clip: true)[
    #place(top + left, dx: 24pt, dy: 16pt)[#rotate(90deg)[#line(length: 62pt)]]
    #place(top + left, dx: 24pt, dy: 47pt)[#line(length: 101pt)]
    #place(top + left, dx: 119pt, dy: 42pt)[$arrow.r$]
    #place(top + left, dx: 19pt, dy: 8pt)[$arrow.t$]
    #place(top + left, dx: 136pt, dy: 40pt)[$x$]
    #place(top + left, dx: 12pt, dy: 3pt)[$y$]
    #place(top + left, dx: 24pt, dy: 19pt)[$1$]
    #place(top + left, dx: 24pt, dy: 56pt)[$0$]
    #place(top + left, dx: 48pt, dy: 23pt)[#text(fill: luma(55%))[#sym.dash #sym.dash #sym.dash #sym.dash #sym.dash]]
    #place(top + left, dx: 48pt, dy: 48pt)[#text(fill: luma(55%))[#sym.dash #sym.dash #sym.dash #sym.dash #sym.dash]]
  ]
]

For cardinality, "finite" means $exists n in bN$ such that $X$ has $n$
elements, denoted $|X|=n$; "infinite" means an injection $bN->X$.
$X<=Y$ means an injection and $X approx Y$ a bijection. The homework
remark is $X<=Y$ iff there is an injection $X->Y$, not merely a surjection
$Y->X$. The $bN approx bZ$ bijection is
$f(n)=(n-1)/2$ for odd $n$ and $f(n)=n/2$ for even $n$, with table
$1 mapsto 0$, $2 mapsto 1$, $3 mapsto -1$, $4 mapsto 2$, $5 mapsto -2$,
$6 mapsto 3$, dots. "Countably infinite" means $X approx bN$; "countable"
means $X<=bN$, equivalently a surjection $bN->X$.

#align(center)[
  #table(columns: (auto, auto, auto, auto, auto, auto, auto), inset: 4pt, stroke: 0.5pt,
    [$n$], [$1$], [$2$], [$3$], [$4$], [$5$], [$6$],
    [$f(n)$], [$0$], [$1$], [$-1$], [$2$], [$-2$], [$3$])
]

The lattice diagram for $bQ$ is retained natively. View $m/n$ as
$(m,n) in bZ times bZ$, $n!=0$, and enumerate the lattice
by increasingly large finite squares, omitting repetitions; this yields a
surjection $bN->bQ$. Cantor's proof writes any proposed
$f:bN->[0,1]$ as $f(n)=0.n_1n_2n_3dots$, chooses
$x=0.d_1d_2d_3dots$ with $d_n!=n$th digit of $f(n)$, and concludes
$x!=f(n)$ for every $n$, so $[0,1]$ and $bR$ are uncountable.

#align(center)[
  #block(width: 165pt, height: 118pt, clip: true)[
    #place(top + left, dx: 40pt, dy: 17pt)[#rotate(90deg)[#line(length: 82pt)]]
    #place(top + left, dx: 28pt, dy: 59pt)[#line(length: 116pt)]
    #place(top + left, dx: 138pt, dy: 54pt)[$arrow.r$]
    #place(top + left, dx: 77pt, dy: 9pt)[$arrow.t$]
    #place(top + left, dx: 148pt, dy: 52pt)[$x$]
    #place(top + left, dx: 70pt, dy: 4pt)[$y$]
    #place(top + left, dx: 52pt, dy: 32pt)[#rect(width: 61pt, height: 52pt, stroke: 0.8pt + rgb("#2b78b8"))]
    #place(top + left, dx: 64pt, dy: 44pt)[#rect(width: 37pt, height: 28pt, stroke: 0.8pt + rgb("#2b78b8"))]
    #place(top + left, dx: 48pt, dy: 28pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 64pt, dy: 28pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 80pt, dy: 28pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 96pt, dy: 28pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 112pt, dy: 28pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 48pt, dy: 44pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 64pt, dy: 44pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 80pt, dy: 44pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 96pt, dy: 44pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 112pt, dy: 44pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 48pt, dy: 60pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 64pt, dy: 60pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 80pt, dy: 60pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 96pt, dy: 60pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 112pt, dy: 60pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 48pt, dy: 76pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 64pt, dy: 76pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 80pt, dy: 76pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 96pt, dy: 76pt)[#circle(radius: 1.4pt, fill: black)]
    #place(top + left, dx: 112pt, dy: 76pt)[#circle(radius: 1.4pt, fill: black)]
  ]
]

The power-set proof defines, for $f:X->cal(P)(X)$,

$D={x in X:x in.not f(x)} in cal(P)(X).$

If $D=f(x_0)$, then $x_0 in D$ iff $x_0 in.not D$, a contradiction.
The page then asks whether there are cardinalities larger than $bR$ and
answers $bC approx bR^2$ (though $bC!=bR$); whether there are cardinalities
strictly between $bN$ and $bR$ remains unknown, and the assertion that there
are none is the continuum hypothesis. The final theorem says finite products
of countable sets are countable and, for countable $I$, a family
$ {A_i:i in I}$ of countable sets has countable union; the final application
is that $(a,b)$ has uncountably many irrationals and
$accent(bQ,macron)$ is countable, hence there are uncountably many
transcendental numbers.

=== L04(2)--Handout--Function, pp. 1--4

"More Joy of Sets" says it continues the basic-set-theory summary from
"The Joy of Sets", with special emphasis on FUNCTIONS. It explains that a
function from $X$ to $Y$ assigns each $x in X$ a unique $y in Y$; $f:X->Y$ is
read "$f$ maps $X$ to $Y$". Map/mapping are synonyms for function; $X$ is
domain/source and $Y$ codomain/target space. The pointwise arrow is
$x mapsto f(x)$; a rule's input variable is independent and output variable
dependent. A footnote says $(x)f$ might have been better notation for a
left-to-right reader, but mathematical convention writes $f(x)$.

The image is $im(f)={f(x):x in X}$; for subsets,
$f[A]={f(a) in Y:a in A}$ and
$f^(-1)[B]={x in X:f(x) in B}$. The complete displayed list is

$f[f^(-1)[C]] subset.eq C; quad f^(-1)[f[A]] supset.eq A;$

$f[A union B]=f[A] union f[B]; quad
f[A inter B] subset.eq f[A] inter f[B];$

$f[A without B] supset.eq f[A] without f[B];$

$f^(-1)[C union D]=f^(-1)[C] union f^(-1)[D];$

$f^(-1)[C inter D]=f^(-1)[C] inter f^(-1)[D]; quad
f^(-1)[C without D]=f^(-1)[C] without f^(-1)[D].$

The identity example is $id_X:X->X$, $id_X(x)=x$. It gives the power-set
example $cal(P):V->V$, $cal(P)(X)={Y:Y subset.eq X}$, then composition:
if $f:X->Y$, $g:Y->Z$, $(g compose f)(x)=g(f(x))$, and
$h compose(g compose f)=(h compose g)compose f$. Composition is read
backwards: "$g compose f$ means first apply $f$, then apply $g$".

An inverse $g:Y->X$ satisfies $g compose f=id_X$ and $f compose g=id_Y$;
if it exists it is unique and is denoted $f^(-1)$. Definitions are
injective ($x!=x'$ implies $f(x)!=f(x')$), surjective
($(forall y in Y)(exists x in X)y=f(x)$), and bijective (both);
the theorem is "for any function $f$, $f$ is invertible iff $f$ is
bijective". The sheet adds: equal functions require the same domain and
codomain; $f$ restricted to $A subset.eq X$ is
$g:A->Y$, $g(x)=f(x)$, written $f|A$ or $upright("res")_A f$; a function
$X->im(f)$ with the same rule is surjective. For real graphs, injective
means every horizontal line meets at most once; surjective means every
horizontal line meets at least once. The squaring function example and its
$[0,infinity)$ restriction have the same statements as above.

A list is a finite ordered set: $(N,A,S,A)!=(N,A,S)$ and
$(N,A,S)!=(N,S,A)$; order and repetition matter. A list of length $n$ is
$L=(x_1,dots,x_n)=(x_k:1<=k<=n)$; equal lists have the same length and
entries in the same order. A sequence is an infinite ordered set ordered
like $bN$. Cartesian products are

$X times Y={(x,y):x in X upright(" and ") y in Y},$

$X_1 times dots times X_n={(x_1,dots,x_n):x_k in X_k
upright(" for each ")1<=k<=n},$

with $bR^2=bR times bR={(a,b):a,b in bR}$ and generally $bR^n$ the set of
$n$-tuples. It gives
$upright("graph")(exp)={(x,y) in bR^2:e^x=y}$ and the familiar increasing exponential
sketch through $(0,1)$; generally
$upright("graph")(f)={(x,y) in X times Y:f(x)=y}$. The rigorous definition is then
repeated: a function is its graph, and $(x,y)={{x},{x,y}}$; this has
$(a,b)=(c,d) => a=c$ and $b=d$.

=== L04(3)--Handout--Countability, pp. 1--2

The Cantor--Schröder--Bernstein proof is reproduced in full. Given injective
$f:X->Y$ and $g:Y->X$, define
$phi:cal(P)(X)->cal(P)(X)$ by

$phi(A)=X without (g[Y without f[A]]).$

Put $A_0=emptyset$, $A_(n+1)=phi(A_n)$, and
$A=union.big_n A_n$. Define

$h(x)=f(x)$ for $x in A$, while $h(x)=g^(-1)(x)$ for $x in X without A$.

Using De Morgan and preservation of unions/intersections by forward images
of injective functions,

$phi(A)=X without g[Y without f[union.big_n A_n]]$

$=X without g[inter.big_n(Y without f[A_n])
=union.big_n(X without g[Y without f[A_n]])$

$=union.big_n phi(A_n)=union.big_n A_(n+1)=A.$

Thus $X without A=g[Y without f[A]]$, which makes $h$ bijective.

For countable products, injections $f_i:A_i->bN$ produce

$f(a_1,dots,a_n)=product_(i=1)^n p_i^(f_i(a_i)),$

where $p_i$ is the $i$th prime; FTA makes it injective. For countable
unions, take a surjection $f:bN->I$, for each $n$ a surjection
$f_n:bN->A_(f(n))$, and a surjection
$h:bN->bN times bN$, $h(n)=(n_1,n_2)$. Then
$g(n)=f_(n_1)(n_2)$ is surjective onto $union.big_(i in I)A_i$.
