#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Visual source migration: 395-lec13-Partition.pdf pp. 1-2;
// 395-lec14-midreview.pdf pp. 1-4; 395-lec15-Lebesgue-Characterization.pdf pp. 1-2;
// 395-lec16-Lebesgue-Characterization-II.pdf pp. 1-2.
= Partitions and Lebesgue's characterization

== Partitions and Darboux sums

#definition(title: [Box, partition, mesh])[
  A box in $bR^n$ is $B=I_1 times dots.c times I_n$, where the $I_i$ are
  intervals; here the notes use closed intervals,
  $B=[a_1,b_1] times dots.c times [a_n,b_n]$, with
  $v(B)=product_i(b_i-a_i)$.  A partition of $[a,b]$ is a finite increasing
  sequence $a=x_0<x_1<dots.c<x_k=b$, with mesh
  $norm(P)=max_i(x_i-x_(i-1))$.

  A partition $P=(P_1,dots,P_n)$ of a box is an $n$-tuple of coordinate
  partitions.  It decomposes $B$ into boxes $J_1 times dots.c times J_n$ with
  pairwise disjoint interiors and mesh
  $norm(P)=max_(1<=j<=n) norm(P_j)$.
]

#definition(title: [Lower and upper sums])[
  Let $f:B->bR$ be bounded and let the subboxes of $P$ be
  $B_1,dots,B_N$.  Set $m_(B_i)(f)=inf_(B_i) f$ and
  $M_(B_i)(f)=sup_(B_i) f$.  The lower and upper sums are
  $L(f,P)=sum_i m_(B_i)(f)v(B_i)$ and
  $U(f,P)=sum_i M_(B_i)(f)v(B_i)$.
]

#definition(title: [Refinement])[
  A partition $Q$ is a refinement of $P$ if $P_j subset.eq Q_j$ for every
  coordinate.  The common refinement of $P,P'$ is obtained by taking the union
  of the coordinate partition points.
]

#lemma(title: [Monotonicity under refinement])[
  If $Q$ refines $P$, then $L(f,P)<=L(f,Q)$ and $U(f,P)>=U(f,Q)$.  Therefore
  for arbitrary partitions $P,P'$,
  $L(f,P)<=U(f,P')$.
]

#proof[
  It is enough to add one point to one coordinate partition.  Each affected
  subbox splits into two smaller boxes, whose infima are at least the old
  infimum and whose volumes add to the old volume.  Apply the same fact to
  $-f$ for upper sums, and use a common refinement.
]

#definition(title: [Lower/upper integrals and #kn[Riemann integrability in R^n]])[
  Define
  $integral_B f dif x = sup_(P) L(f,P)$ and
  $overline(integral)_B f dif x = inf_(P) U(f,P)$.
  The function $f$ is Riemann integrable if these values agree; then their
  common value is written $integral_B f dif x$.
]

#theorem(title: [Riemann condition])[
  A bounded $f:B->bR$ is Riemann integrable iff, for every $epsilon>0$, there
  is a partition $P$ with $U(f,P)-L(f,P)<epsilon$.
]

#proof[
  If the lower and upper integrals agree, choose $P_1,P_2$ whose lower and
  upper sums are each within $epsilon/2$ of that number, and take a common
  refinement.  The converse follows from
  $L(f,P)<=integral_B f dif x<=overline(integral)_B f dif x<=U(f,P)$.
]

#example(title: [A nonintegrable function])[
  On $[0,1]^2$, take $f(x,y)=0$ when $x,y$ are rationally dependent and $1$
  otherwise.  Every subbox meets both types of points, so every lower sum is
  $0$ and every upper sum is $1$.  Hence $f$ is not Riemann integrable.
]

#lemma(title: [Vector-space property])[
  If $f,g in R(B)$, then $f+g in R(B)$.  Consequently $R(B)$ is a vector space;
  all constant functions belong to it.
]

#proof[
  For each subbox $S$,
  $inf_S f+inf_S g<=inf_S(f+g)$ and
  $sup_S(f+g)<=sup_S f+sup_S g$.  Choose partitions making the two Darboux gaps
  small and take their common refinement.
]

== The review sheet

#remark(title: [Midterm review])[
  The four-page review re-records the earlier core facts: boundedness, total
  boundedness, completeness, compactness, and sequential compactness satisfy
  $text("sequentially compact") arrow.l.r.double text("compact") arrow.l.r.double text("complete and totally bounded")$
  in metric spaces; in $bR^n$, compactness is equivalent to closed and bounded.
  It also restates differentiability, directional derivatives, the Jacobian,
  the $C^1$ criterion, mixed partials, multi-index notation, the chain rule,
  product rule, Taylor theorem, inverse function theorem, and implicit function
  theorem.  For a linear map $(x,y) mapsto A x+B y$, the implicit solution is
  $y=-B^(-1) A x$ when $B$ is invertible.
]

== Measure zero and the Lebesgue criterion

#definition(title: [Measure zero])[
  A set $A subset.eq bR^n$ has (Lebesgue) measure zero if, for every
  $epsilon>0$, it can be covered by countably many boxes $B_i$ with
  $sum_(i=1)^infinity v(B_i)<epsilon$.  It does not matter whether the covering
  boxes are open or closed; a countable union of measure-zero sets has measure
  zero.
]

#definition(title: [Oscillation])[
  For bounded $f:B->bR$, put
  $upright("osc")_delta f(x)=sup_(x_1,x_2 in B inter B_delta(x))
  (f(x_1)-f(x_2))$ and
  $upright("osc") f(x)=inf_(delta>0) upright("osc")_delta f(x)$.  Then $f$ is continuous at $x$ iff
  $upright("osc") f(x)=0$.
]

#remark[
  The notes ask one to verify
  $upright("osc")_delta f(x)=sup_(B inter B_delta(x)) f-inf_(B inter B_delta(x)) f$
  and that $delta_1<delta_2$ implies
  $upright("osc")_(delta_1)f(x)<=upright("osc")_(delta_2)f(x)$.  For the Dirichlet function
  ($1$ on rationals and $0$ on irrationals), the oscillation is $1$ everywhere.
]

#theorem(title: [Lebesgue characterization of Riemann integrability])[
  Let $B subset.eq bR^n$ be a box and $f:B->bR$ be bounded.  Let
  $D_f={x | f text(" is not continuous at ") x}$.  Then
  $f$ is Riemann integrable iff $D_f$ has measure zero.
]

#proof[
  First suppose $D_f$ has measure zero.  Let $abs(f)<=M$ and cover $D_f$ by
  finitely many open boxes $B_i$ whose total volume is less than
  $epsilon/(4M)$.  For each point outside their union, continuity supplies an
  open box on which the oscillation is less than
  $epsilon/(2v(B))$.  Compactness of $B$ gives a finite cover.  Choose a
  partition whose subboxes lie in a chosen member of this finite cover.  The
  boxes inside the first family contribute at most $2M epsilon/(4M)$ to the
  Darboux gap; the rest contribute at most $epsilon/2$.  Hence the gap is below
  $epsilon$.

  Conversely define $D_m={x in B | upright("osc") f(x)>=1/m}$.  If a partition $P$ has
  $U(f,P)-L(f,P)<epsilon/(2m)$, then the subboxes of $P$ meeting $D_m$ in their
  interiors have total volume below $epsilon/2$, because each has oscillation
  at least $1/m$.  The union of the subbox boundaries has measure zero and can
  be covered with total volume below $epsilon/2$.  Thus $D_m$ has measure zero.
  Since $D_f=union_(m=1)^infinity D_m$, so does $D_f$.
]

#example(title: [Two familiar discontinuity sets])[
  The Dirichlet function on $[0,1]$ has $D_f=[0,1]$ and is not integrable.
  The function that is $1$ on rational points whose fraction is in lowest terms
  and has bounded denominator, and $0$ elsewhere, has a countable
  discontinuity set and is Riemann integrable.
]

#theorem(title: [Almost-everywhere zero and Fubini])[
  If $f:B->bR$ is Riemann integrable and $f=0$ almost everywhere, then
  $integral_B f=0$.  If $f>=0$ and $integral_B f=0$, then $f=0$ almost
  everywhere.  For boxes $A subset.eq bR^k$, $B subset.eq bR^ell$, an
  integrable $f:A times B->bR$ satisfies Fubini's theorem:
  $integral_(A times B) f=integral_A (integral_B f(x,y) dif y) dif x$.
]

#remark[
  Under Fubini's hypotheses, the inner integral exists almost everywhere; if it
  exists for every $x$, the iterated integral is defined everywhere.  The review
  example with a vertical rational/irrational slice shows why ``almost
  everywhere'' is necessary.
]
