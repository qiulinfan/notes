---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/multivariate-analysis/chapters/01-metric-spaces-and-compactness.typ"
kgd_source_format: "typst"
kgd_source_sha256: "40866e0afa06fc9a17780397c1abc767d576191f04bdd7dd05fd0754d845dffe"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Visual source migration: 395-lec01-Metric-Spaces.pdf pp. 1-2;
// 395-lec02-Compactness.pdf pp. 1-2; 395-lec03-cplt&ttl-bdd.pdf pp. 1-2.
= Metric spaces and compactness

== Metric spaces, norms, and topology

#definition(title: [Metric space])[
  A metric on a set $X$ is a function $d: X times X -> bR$ satisfying, for all
  $x,y,z in X$: $d(x,y) = d(y,x)$ (symmetry), $d(x,y) >= 0$ and
  $d(x,y)=0$ iff $x=y$ (positivity), and
  $d(x,y) <= d(x,z)+d(z,y)$ (triangle inequality).  The pair $(X,d)$ is
  called a metric space.
]

#example(title: [Metrics recorded in the lecture])[
  On $bR$, $d(x,y)=abs(x-y)$, and also
  $d(x,y)=abs(integral_x^y e^(-t) dif t)$.  On $bR^n$ the notes use
  $d_2(x,y)=sqrt(sum_(i=1)^n (x_i-y_i)^2)$,
  $d_(sup)(x,y)=max_(1<=i<=n) abs(x_i-y_i)$, and
  $d_1(x,y)=sum_(i=1)^n abs(x_i-y_i)$.  In $bR^2$, their unit balls are the
  circle, square, and diamond, labelled $ell^2$ (Euclidean), supremum, and
  $ell^1$ metrics.

  For $C([0,1])$, the lecture also writes
  $d(f,g)=sup_(t in [0,1]) abs(f(t)-g(t))$ and
  $d(f,g)=integral_0^1 abs(f(t)-g(t)) dif t$.
]

#definition(title: [Neighborhoods, open and closed sets])[
  In a metric space $(X,d)$, the $epsilon$-neighborhood of $x_0$ is
  $B_epsilon(x_0) = {x in X | d(x,x_0)<epsilon}$.  A set
  $Omega subset.eq X$ is open when every $x_0 in Omega$ has an
  $epsilon>0$ with $B_epsilon(x_0) subset.eq Omega$.  A set $C subset.eq X$
  is closed iff $X \\ C$ is open.
]

#lemma(title: [Equivalent Euclidean and supremum topologies])[
  A set $Omega subset.eq bR^n$ is open for the Euclidean metric iff it is open
  for the supremum metric.
]

#proof[
  The norm comparison written in the notes is
  $norm(x)_sup <= norm(x)_2 <= sqrt(n) norm(x)_sup$.  Hence
  $B_epsilon^sup(x_0) subset.eq B_epsilon^2(x_0)
  subset.eq B_(epsilon/sqrt(n))^sup(x_0)$, which transfers the ball criterion
  for openness in both directions.
]

#definition(title: [Limit point and closure])[
  If $E subset.eq X$, a point $p in X$ is a limit point of $E$ when
  $B_epsilon(p) inter (E \\ {p}) != emptyset$ for every $epsilon>0$.
  The closure is $accent(E, macron)=E union E'$.  Thus
  $E=(0,1)$ has $accent(E, macron)=E'=[0,1]$, while
  $E=(0,1) union {2}$ has $E'=[0,1]$ and
  $accent(E, macron)=[0,1] union {2}$.
]

#lemma(title: [Closure facts])[
  For $E subset.eq X$, the set $accent(E, macron)$ is closed;
  $E=accent(E, macron)$ iff $E$ is closed; and if $E subset.eq F$ with $F$
  closed, then $accent(E, macron) subset.eq F$.  Thus the closure is the
  smallest closed set containing $E$.
]

#proof[
  If $q in.not accent(E, macron)$, then some $B_epsilon(q)$ misses $E$;
  consequently $X \\ accent(E, macron)$ is open.  If $E$ is closed, every
  point outside $E$ has such a ball, hence $E' subset.eq E$.  Conversely,
  $E=accent(E, macron)$ is closed.  The final assertion follows because a
  point of $F^c$ has a ball disjoint from $E$.
]

#lemma(title: [Supremum in the closure])[
  If $E subset.eq bR$ is nonempty and bounded above, then $sup E in
  accent(E, macron)$.  In particular, if $E$ is closed, $sup E in E$;
  similarly a closed bounded-below set contains its infimum.
]

== Compactness in $bR^n$

#definition(title: [Open cover and #kn[Compactness]])[
  An open cover of $E subset.eq X$ is a family ${U_alpha}_alpha in I$ of open
  sets such that $E subset.eq union_(alpha in I) U_alpha$.  The set $E$ is
  compact if every open cover has a finite subcover.  A set is bounded when it
  lies in some $B_r(x_0)$.
]

#theorem(title: [Elementary compactness consequences])[
  Closed subsets of compact metric spaces are compact.  A compact subset of a
  metric space is closed and bounded.  A family of compact sets with every
  finite intersection nonempty has nonempty total intersection.
]

#proof[
  For the closed-subset result, adjoin $C^c$ to an open cover of a closed
  $C subset.eq K$ and discard it after taking a finite subcover of $K$.
  For closedness of a compact $K$, cover $K$ by the sets
  ${q | d(p,q)>1/n}_n$ for a fixed $p in.not K$; a finite subcover yields a
  ball about $p$ disjoint from $K$.  For boundedness use the cover
  ${B_n(p)}_(n in bN)$.  The finite-intersection assertion follows by applying
  compactness to the complementary open cover.
]

#theorem(title: [Nested interval and box properties])[
  If $I_1 supset.eq I_2 supset.eq dots.c$ is a nested sequence of closed,
  nonempty bounded intervals, then $inter_n I_n != emptyset$.  Hence a nested
  sequence of closed boxes $B_n subset.eq bR^d$ has nonempty intersection.
]

#proof[
  Write $I_n=[a_n,b_n]$.  The increasing bounded sequence $(a_n)$ has a
  supremum $x$; then $a_n<=x<=b_n$ for every $n$.  Apply this coordinatewise
  to $B_n=[a_1^(n),b_1^(n)] times dots.c times [a_d^(n),b_d^(n)]$.
]

#theorem(title: [Closed boxes are compact])[
  Every closed box in $bR^n$ is compact.
]

#proof[
  Suppose an open cover of a closed box $B_0$ has no finite subcover.  Divide
  it into $2^d$ equal subboxes and choose one without a finite subcover;
  recursively obtain nested boxes $B_n$.  The nested-box property gives a
  point $x in inter_n B_n$.  Any cover member containing $x$ contains a small
  ball about $x$; for large $n$, $B_n$ lies in that ball, a contradiction.
]

#theorem(title: [Heine-Borel])[
  A subset of $bR^d$ is compact iff it is closed and bounded.
]

#proof[
  The forward implication was established above.  If $E$ is closed and
  bounded, it lies in a closed box, which is compact; therefore $E$ is compact
  as a closed subset of a compact set.
]

#example(title: [Why the Euclidean conclusion is special])[
  Let $ell^infinity(bN)$ be the space of bounded sequences with the supremum
  metric and let $B={a in ell^infinity | d(a,0)<=1}$.  The notes ask one to
  verify that $B$ is closed and bounded, and emphasize that it is *not*
  compact.  Thus ``closed and bounded'' is not the general metric-space
  criterion.
]

== General metric spaces

#definition(title: [Total boundedness and completeness])[
  A subset $E$ of a metric space is totally bounded if for every $epsilon>0$
  there are $x_1,dots,x_N in E$ with
  $E subset.eq union_(i=1)^N B_epsilon(x_i)$.  A set is complete if every
  Cauchy sequence in it converges to a point of it.  It is sequentially compact
  if every sequence has a subsequence converging in the set.
]

#theorem(title: [Metric compactness criteria])[
  For $E subset.eq X$ in a metric space, the following are equivalent:
  $E$ is compact; $E$ is sequentially compact; $E$ is complete and totally
  bounded.
]

#proof[
  Sequential compactness implies total boundedness: otherwise choose points
  $p_n$ separated by a fixed $epsilon$, producing a sequence with no Cauchy,
  hence no convergent, subsequence.  It also implies completeness because a
  convergent subsequence of a Cauchy sequence forces the entire sequence to
  converge to the same limit.

  Conversely, total boundedness lets one choose successively infinitely many
  terms of a given sequence in nested balls of radii $2^-k$; the selected
  subsequence is Cauchy and therefore converges by completeness.

  For the passage from sequential compactness to compactness, the notes prove
  the Lebesgue covering lemma: for every open cover of a sequentially compact
  set there is an $epsilon>0$ such that each $p$ has
  $B_epsilon(p)$ contained in a cover member.  If not, choose points $p_n$ for
  which no $B_(1/n)(p_n)$ fits; a convergent subsequence contradicts openness
  at its limit.  A finite $epsilon$-ball cover then selects a finite subcover.
]
