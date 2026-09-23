#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Visual transcription source:
// 395-lec17-Integral-over-Bdd-sets.pdf pp. 1–2; 395-lec18-Extended-Integral-I.pdf pp. 1–2;
// 395-lec19-Extended-Integral-II.pdf pp. 1–2; 395-lec20-Change-of-Variable-Thm.pdf pp. 1–2;
// 395-lec21-topological-properties-of-diffeo(CoV1).pdf pp. 1–2;
// 395-lec22-diffeo-decomposition(COV2).pdf pp. 1–2;
// 395-lec23-Partition-of-Unity(COV3).pdf pp. 1–2.
= Integration and change of variables

== Fubini's theorem

#theorem(title: [Fubini for bounded Riemann integrable functions])[
  Let $A subset bR^m$ and $B subset bR^n$ be boxes, and let
  $f : A times B -> bR$ be bounded and Riemann integrable.  For
  $x in A$, put
  $
    underline(I)(x) = underline(integral)_B f(x,y) dif y,
    quad
    overline(I)(x) = overline(integral)_B f(x,y) dif y.
  $
  Then $underline(I)$ and $overline(I)$ are Riemann integrable on $A$ and
  $
    integral_(A times B) f(x,y) dif(x,y)
      = integral_A underline(I)(x) dif x
      = integral_A overline(I)(x) dif x.
  $
  Consequently, $x mapsto integral_B f(x,y) dif y$ is integrable and
  $
    integral_(A times B) f(x,y) dif(x,y)
      = integral_A (integral_B f(x,y) dif y) dif x.
  $
]

#proof[
  Let $P_A$ and $P_B$ be partitions of $A$ and $B$, and let
  $P = P_A times P_B$.  If $R = R_A times R_B$ is a subbox of $P$ and
  $x_0 in R_A$, then
  $
    m_R(f) <= inf_(y in R_B) f(x_0,y) = m_(R_B)(f(x_0, dot)).
  $
  Taking the infimum in $x_0$ and then multiplying by the volume of $R_A$
  gives
  $
    m_R(f) upright("vol")(R)
      <= m_(R_A)(underline(I)) upright("vol")(R_A)
         upright("vol")(R_B).
  $
  On summing over the boxes of $P_A$ and $P_B$,
  $
    L(f,P) <= L(underline(I),P_A)
      <= U(underline(I),P_A) <= U(f,P).
  $
  The same argument with suprema gives
  $
    L(f,P) <= L(overline(I),P_A)
      <= U(overline(I),P_A) <= U(f,P).
  $
  Refine the product partitions so that
  $U(f,P) - L(f,P)$ tends to zero.  The displayed inequalities force the
  lower and upper integrals of both sectional functions to agree, and their
  common integrals equal $integral_(A times B) f$.
]

== Integrals over bounded sets

#definition(title: [Zero extension and integral over a bounded set])[
  Let $S subset bR^n$ be bounded and let $Q$ be a box containing $S$.
  For a bounded function $f:S -> bR$, define its zero extension to $Q$ by
  $
    f_S(x) = cases(
      f(x), & x in S, \\
      0, & x in.not S.
    ).
  $
  If $f_S$ is Riemann integrable on $Q$, define
  $
    integral_S f = integral_Q f_S.
  $
]

#lemma(title: [Independence of the containing box])[
  If $Q$ and $Q'$ are boxes containing $S$ and the zero extension is
  integrable on one of them, then it is integrable on the other, with the
  same integral.
]

#proof[
  Enclose $Q union Q'$ in a larger box $R$.  The two extensions to $R$
  differ only by functions which vanish off a set on which they already agree;
  partition $R$ along the faces of $Q$ and $Q'$.  Additivity for the resulting
  subboxes shows that the new pieces outside the original containing box
  contribute $0$.  Thus both definitions are the same integral over $R$.
]

#proposition(title: [Elementary properties])[
  Whenever the displayed integrals exist, the integral over a bounded set is
  linear, monotone, and satisfies
  $
    integral_S (alpha f + beta g)
      = alpha integral_S f + beta integral_S g,
    quad
    f <= g arrow.r integral_S f <= integral_S g.
  $
  It is also additive under a finite disjoint decomposition of $S$.  More
  generally, for two bounded Jordan-measurable sets,
  $
    integral_(S union T) f + integral_(S inter T) f
      = integral_S f + integral_T f.
  $
  In particular, if $S_i$ have pairwise intersections of Jordan measure zero,
  then $integral_(union_i S_i) f = sum_i integral_(S_i) f$.
]

#theorem(title: [Jordan-measurable sets])[
  A bounded set $S subset bR^n$ is Jordan measurable if and only if its
  boundary has measure zero:
  $
    S in cal(J) quad arrow.l.r.double quad m(partial S) = 0.
  $
  In that event the constant function $1$ is integrable over $S$, and
  $
    m_J(S) = integral_S 1.
  $
]

#remark[
  The lecture uses $cal(J)$ for the class of Jordan-measurable bounded sets
  and $cal(J)_c$ for compact Jordan-measurable sets.  Thus integrals over
  arbitrary bounded sets are not silently assumed to exist: the zero extension
  must first be Riemann integrable.
]

== Extended integrals on open sets

#definition(title: [Positive extended integral])[
  Let $A subset bR^n$ be open and let $f:A -> bR$ be continuous with
  $f >= 0$.  Its extended integral is
  $
    upright("ext")(integral)_A f
      = sup_(D subset.eq A, D in cal(J)_c) integral_D f.
  $
  This value is allowed to be $+infinity$.
]

#definition(title: [Signed extended integral])[
  For a continuous $f:A -> bR$, set
  $
    f^+ = max(f,0), quad f^- = max(-f,0), quad
    f = f^+ - f^-, quad abs(f) = f^+ + f^-.
  $
  If both $upright("ext")(integral)_A f^+$ and $upright("ext")(integral)_A f^-$ are finite, define
  $
    upright("ext")(integral)_A f
      = upright("ext")(integral)_A f^+ - upright("ext")(integral)_A f^-.
  $
]

#lemma(title: [Compact exhaustion])[
  Every open set $A subset bR^n$ has compact Jordan-measurable sets
  $C_N$ such that
  $
    C_N subset C_(N+1)^o, quad C_N subset A, quad
    union_(N=1)^infinity C_N = A.
  $
]

#proof[
  Take compact sets $D_N$ increasing to $A$, for example by requiring a
  positive distance from $partial A$ and a bound on the norm.  Cover each
  $D_N$ by finitely many closed cubes whose interiors lie in $A$, and let
  $C_N$ be the finite union of the cubes selected up to stage $N$.  Enlarging
  at each stage if necessary gives $C_N subset C_(N+1)^o$.
]

#theorem(title: [Exhaustion criterion])[
  For $f$ continuous on an open set $A$ and for any compact exhaustion
  $(C_N)$ as above,
  $
    upright("ext")(integral)_A f exists
    quad arrow.l.r.double quad
    (integral_(C_N) abs(f))_(N=1)^infinity
    text(" is bounded").
  $
  In that case,
  $
    upright("ext")(integral)_A f = lim_(N -> infinity) integral_(C_N) f.
  $
]

#proof[
  The integrals of $abs(f)$ over $C_N$ are increasing.  If they are bounded,
  the positive and negative parts have finite suprema, so the signed extended
  integral exists and the asserted limit follows by subtracting the two
  monotone limits.  Conversely, if the positive and negative extended
  integrals are finite, each $integral_(C_N) abs(f)$ is bounded by their sum.

  The point that the exhaustion computes the supremum is that every compact
  $D subset A$ is contained in some $C_N$: the open sets $C_N^o$ cover $D$,
  so a finite subcover has a largest index.  Hence
  $integral_D f^+ <= integral_(C_N) f^+$ for some $N$, and taking suprema
  gives the claim.
]

#theorem(title: [Agreement on bounded open sets])[
  If $A$ is bounded and open and $f$ is bounded and continuous on $A$, then
  the extended integral exists.  If the zero extension makes the ordinary
  Riemann integral over $A$ meaningful, it agrees with the extended integral:
  $
    upright("ext")(integral)_A f = integral_A f.
  $
]

#remark[
  对于 bounded open $A$，lecture notes 记录：extended integral must exist；
  如果 ordinary integral 存在，则二者相等。
]

== Change of variables

#theorem(title: [One-dimensional change of variables])[
  Let $g:[a,b] -> bR$ be $C^1$, and let $f$ be continuous on an interval
  containing $g([a,b])$.  Then
  $
    integral_(g(a))^(g(b)) f(y) dif y
      = integral_a^b f(g(x)) g'(x) dif x.
  $
]

#proof[
  Choose an antiderivative $F$ of $f$.  The chain rule and the fundamental
  theorem of calculus give
  $
    integral_a^b f(g(x))g'(x) dif x
      = integral_a^b (F compose g)'(x) dif x
      = F(g(b))-F(g(a)).
  $
]

#theorem(title: [#kn[Change-of-variables theorem]])[
  Let $A,B subset bR^n$ be open, let $g:A -> B$ be a $C^1$
  diffeomorphism, and let $f:B -> bR$ be continuous.  Then
  $
    f text(" is integrable over ") B
    quad arrow.l.r.double quad
    f(g(x)) abs(det D g(x)) text(" is integrable over ") A,
  $
  and, whenever either condition holds,
  $
    integral_B f(y) dif y
      = integral_A f(g(x)) abs(det D g(x)) dif x.
  $
]

#example(title: [Polar coordinates])[
  On the annular region
  $
    B = { (x,y) : a^2 < x^2+y^2 < b^2 },
  $
  use $g(r,theta)=(r cos theta,r sin theta)$ on
  $(a,b) times (0,2 pi)$.  Since
  $
    det D g(r,theta)
      = det mat(cos theta, -r sin theta; sin theta, r cos theta) = r,
  $
  the omitted radial cut has measure zero and
  $
    integral_B f(x,y) dif x dif y
      = integral_0^(2 pi) integral_a^b
          f(r cos theta,r sin theta) r dif r dif theta.
  $
]

#example(title: [Spherical coordinates])[
  With
  $
    g(rho,phi,theta)
      = (rho sin phi cos theta, rho sin phi sin theta, rho cos phi),
  $
  one has $abs(det D g)=rho^2 sin phi$.  Thus, subject to the usual bounds
  on $rho$, $phi$, and $theta$ describing the region,
  $
    integral_B f
      = integral integral integral
          f(g(rho,phi,theta)) rho^2 sin phi
          dif rho dif phi dif theta.
  $
]

== Diffeomorphisms and null sets

#theorem(title: [$C^1$ maps preserve sets of measure zero])[
  If $g:A -> bR^m$ is $C^1$ on an open set $A subset bR^n$ and
  $E subset A$ has measure zero, then $g(E)$ has measure zero.  In
  particular, if $m>n$, the image of every bounded set under a $C^1$ map
  $A subset bR^n -> bR^m$ has measure zero.
]

#proof[
  First restrict to a closed cube $C subset A$ on which
  $norm(D g) <= M$.  By the mean-value estimate, a cube of side length $w$
  in $C$ has image contained in a cube of side length at most $n M w$.
  Cover $E inter C$ by cubes of total volume as small as desired; the
  corresponding image cubes have total volume at most $(n M)^n$ times that
  quantity.  Hence $g(E inter C)$ has measure zero.  Exhaust $A$ by such
  closed cubes and take a countable union.
]

#proposition(title: [Diffeomorphisms preserve interior and boundary])[
  If $g:A -> B$ is a diffeomorphism of open sets and $D subset A$, then
  $
    g(D^o) = (g(D))^o, quad
    g(partial D) = partial(g(D)).
  $
  Hence $D$ is Jordan measurable if and only if $g(D)$ is Jordan
  measurable.
]

#remark[
  The notes contrast this with the rationals in an interval: they have
  Lebesgue measure zero but are not Jordan measurable, because their boundary
  is the whole interval.
]

== Primitive diffeomorphisms

#definition(title: [Primitive diffeomorphism])[
  A primitive diffeomorphism changes only one coordinate.  For some $i$,
  $
    h(x_1,dots,x_n)
      = (x_1,dots,x_(i-1),h_i(x),x_(i+1),dots,x_n).
  $
]

#theorem(title: [Local decomposition])[
  Every local $C^1$ diffeomorphism can, after restricting to sufficiently
  small neighborhoods, be written as a finite composition of primitive
  diffeomorphisms.
]

#proof[
  The proof in the notes has three reductions.  First, an invertible linear
  map is a product of elementary matrices: coordinate swaps, scalings, and
  additions of one coordinate to another.  Each is primitive (a coordinate
  swap is factored into elementary operations when necessary).  Translations
  are also primitive.

  Next assume $g(0)=0$ and $D g(0)=I$.  Define
  $
    h(x)=(g_1(x),dots,g_(n-1)(x),x_n).
  $
  Near $0$, $h$ is a diffeomorphism.  The map
  $k=g compose h^(-1)$ fixes the first $n-1$ coordinates, so $g=k compose h$
  is a product of primitive maps.  Finally, translate the chosen point to
  $0$ and compose with $(D g(0))^(-1)$ to reduce the general case to this one.
]

== Partitions of unity

#definition(title: [A smooth bump on a box])[
  Let
  $
    eta(t) = cases(
      exp(-1/t), & t>0, \\
      0, & t<=0.
    ).
  $
  Then $eta$ is $C^infinity$, positive on $(0,infinity)$, and zero on
  $(-infinity,0]$.  The product
  $
    psi(x) = product_(j=1)^n eta(x_j-a_j) eta(b_j-x_j)
  $
  is $C^infinity$, positive on the interior of the closed box
  $Q=product_j [a_j,b_j]$, and zero outside that interior.
]

#definition(title: [Support and partition of unity])[
  The support of a function is
  $
    upright("supp")(psi) = accent({x : psi(x) != 0}, macron).
  $
  A partition of unity on an open set $A$, subordinate to an open cover
  $(U_i)$, is a locally finite family $(phi_i)$ of functions
  $A -> [0,1]$ such that
  $
    upright("supp")(phi_i) subset U_i, quad
    sum_i phi_i(x)=1 quad (x in A).
  $
]

#theorem(title: [Smooth partition of unity])[
  Every open cover of an open subset $A subset bR^n$ admits a locally finite
  smooth partition of unity $(phi_i)$ subordinate to that cover.  Each
  $phi_i$ may be chosen with compact support contained in one member of the
  cover.
]

#proof[
  Choose a locally finite collection of closed cubes $S_i$ whose interiors
  cover $A$, with each $S_i$ contained in a member of the given cover.  The
  compact-exhaustion construction supplies such cubes by covering successive
  compact annuli with finitely many cubes.  Let $psi_i$ be the smooth box bump
  positive on $S_i^o$ and supported in its containing cover member.  Local
  finiteness makes
  $
    lambda(x) = sum_i psi_i(x)
  $
  a smooth, positive function.  Then
  $
    phi_i(x) = frac(psi_i(x),lambda(x))
  $
  has the required support, local finiteness, and sum.
]

#theorem(title: [Integration by a partition of unity])[
  Let $f$ be continuous on an open set $A$, and let $(phi_i)$ be a smooth
  partition of unity with compact supports in $A$.  Then
  $
    upright("ext")(integral)_A f text(" exists")
    quad arrow.l.r.double quad
    sum_i integral_A phi_i f
      = sum_i integral_(upright("supp")(phi_i)) phi_i f
    text(" converges"),
  $
  and in that case this series equals $upright("ext")(integral)_A f$.
]

#proof[
  For $f>=0$, finite partial sums satisfy
  $0 <= sum_(i in F) phi_i <= 1$.  Their integrals increase to the extended
  integral by the compact support of each summand and local finiteness.
  Apply this statement separately to $f^+$ and $f^-$ to obtain the signed
  assertion.
]

#remark[
  Integration by POU assembles local integrals into a global one:
  “POU 的作用是把局部的积分拼成全局积分。”
]
