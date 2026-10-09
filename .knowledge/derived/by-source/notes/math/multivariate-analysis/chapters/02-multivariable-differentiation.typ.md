---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/multivariate-analysis/chapters/02-multivariable-differentiation.typ"
kgd_source_format: "typst"
kgd_source_sha256: "16d73f6cc679df2ed99afa216cfe39f4dac66e120281d14b2c864e72b8222818"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Visual source migration: 395-lec04-Differentiation.pdf pp. 1-3;
// 395-lec05-C1-class.pdf pp. 1-3; 395-lec06-Mixed-Partials.pdf p. 1;
// 395-lec07-Chain-Rule&Multinomial-Thm.pdf pp. 1-2;
// 395-lec08-Product-Thm&Taylor-Thm.pdf pp. 1-2.
= Multivariable differentiation

== Continuity and differentiability

#definition(title: [Continuity and uniform continuity])[
  A map $f:X->Y$ between metric spaces is continuous at $x_0$ if for every
  $epsilon>0$ there is $delta>0$ such that
  $d_X(x,x_0)<delta$ implies $d_Y(f(x),f(x_0))<epsilon$; equivalently,
  $f(B_delta(x_0)) subset.eq B_epsilon(f(x_0))$.  It is uniformly continuous
  if $delta$ can be chosen independently of $x_0$.
]

#theorem(title: [Compact domain gives uniform continuity])[
  If $f:X->Y$ is continuous and $X$ is compact, then $f$ is uniformly
  continuous.
]

#proof[
  For each $x in X$, continuity provides a ball
  $B_(delta(x)/2)(x)$ mapped into $B_(epsilon/2)(f(x))$.  Take a finite
  subcover and put $delta=min_i delta(x_i)/2$.  If $d(a_1,a_2)<delta$, choose
  $i$ with $a_1 in B_(delta(x_i)/2)(x_i)$; then
  $d(a_2,x_i)<delta(x_i)$ and the triangle inequality gives
  $d(f(a_1),f(a_2))<epsilon$.
]

#remark[
  The notes record that continuous functions map compact sets to compact sets,
  and that a continuous real-valued function on a compact set attains a maximum
  and a minimum.  The example $f(x)=x^2:bR->bR$ is not uniformly continuous.
]

#definition(title: [#kn[Differentiability]])[
  Let $A subset.eq bR^n$ be open and $f:A->bR^m$.  The map $f$ is
  differentiable at $x_0 in A$ if there is a linear map
  $A_0:bR^n->bR^m$ such that
  $lim_(norm(h)->0) norm(f(x_0+h)-f(x_0)-A_0 h)/norm(h)=0$.
  The linear map is unique and is denoted $D f(x_0)$.
]

#proof[
  If $A_1,A_2$ both satisfy the definition, then
  $norm((A_1-A_2)h)/norm(h)$ is bounded by the two remainders and tends to
  zero.  A nonzero matrix has a vector on which this quotient is nonzero, so
  $A_1=A_2$.
]

#remark[
  The Euclidean norm is used in the written definition, but the notes stress
  that any norm would give the same notion.  $D f(x_0)$ is the best linear
  approximation to $h mapsto f(x_0+h)-f(x_0)$, and the remainder is
  sublinear: $r_(x_0)(h)=f(x_0+h)-f(x_0)-D f(x_0)h=o(norm(h))$.
]

#definition(title: [Directional and partial derivatives])[
  For $u in bR^n$, the directional derivative, when it exists, is
  $D_u f(x_0)=lim_(t->0) (f(x_0+t u)-f(x_0))/t
  = (dif/dif t)|_(t=0) f(x_0+t u)$.  The $j$th partial derivative is
  $partial f/partial x_j (x_0)=D_(e_j)f(x_0)$.
]

#theorem(title: [Differentiability controls directional derivatives])[
  If $f$ is differentiable at $x_0$, then every directional derivative exists
  and $D_u f(x_0)=D f(x_0)u$.  In particular, $u mapsto D_u f(x_0)$ is linear.
]

#proof[
  Substitute $h=t u$ into the differentiability remainder.  For vector-valued
  $f=(f_1,dots,f_m)$ this is componentwise.
]

#remark[
  Directional derivatives may exist without differentiability.  Conversely,
  differentiability is a local approximation by a *linear* map, not merely a
  collection of one-dimensional limits.  For
  $f(x_1,x_2)=sin(x_1x_2)$ and $u=(1,0)$, the notes compute
  $D_u f(x_1,x_2)=x_2 cos(x_1x_2)$.
]

== Jacobians and the $C^1$ criterion

#theorem(title: [Jacobian and components])[
  Let $f=(f_1,dots,f_m):A subset.eq bR^n->bR^m$.  If $f$ is differentiable at
  $x_0$, then
  $D f(x_0) = mat(partial_1 f_1(x_0), dots, partial_n f_1(x_0);
                 dots, dots, dots;
                 partial_1 f_m(x_0), dots, partial_n f_m(x_0))$.
  Conversely, $f$ is differentiable iff each component is differentiable.
]

#proof[
  The $j$th column is $D f(x_0)e_j=D_(e_j)f(x_0)$, whose entries are
  $partial f_i/partial x_j(x_0)$.  The lecture's example is
  $F(x,y)=(x^2+y^2,x y,sin y)$, for which
  $D F(x,y)=mat(2x,2y; y,x; 0,cos y)$ and
  $D_(1,2)F=D_(e_1)F+2D_(e_2)F$.
]

#definition(title: [$C^r$ and $C^infinity$])[
  A function is $C^r$ if all partial derivatives of order at most $r$ exist
  and are continuous.  It is $C^infinity$ if it is $C^r$ for every
  $r in bN$.  Higher derivatives are defined componentwise using multi-indices.
]

#theorem(title: [Continuous partials imply differentiability])[
  Let $f:A subset.eq bR^n->bR^m$, with $A$ open.  If all first partial
  derivatives exist in a neighborhood of $x_0$ and are continuous at $x_0$,
  then $f$ is differentiable at $x_0$.  Thus every $C^1$ map is
  differentiable.
]

#proof[
  Reduce to a scalar component.  With $h=(h_1,dots,h_n)$ set
  $p_0=x_0$, $p_i=p_(i-1)+h_i e_i$.  Apply the one-variable mean value theorem
  to $phi_i(s)=f(p_(i-1)+s e_i)$ on $[0,h_i]$.  For some points $q_i$ on the
  successive segments,
  $f(x_0+h)-f(x_0)=sum_i partial_i f(q_i)h_i$.
  Subtract $sum_i partial_i f(x_0)h_i$ and use $norm(h)_1<=sqrt(n)norm(h)$;
  continuity makes the remainder quotient tend to zero.
]

#remark[
  The converse is false: $x mapsto x^2 sin(1/x)$ (with the value at zero)
  is differentiable but its derivative is not continuous.  The handwritten
  notes emphasize that, unlike $f:bR->bR$, the derivative of a general
  $f:bR^n->bR^m$ takes values in a different function space.
]

== Higher derivatives and products

#theorem(title: [任意二阶 partial 可交换])[
  Last time we proved: if $f in C^2$, then
  $partial^2 f/(partial x_i partial x_j)=partial^2 f/(partial x_j partial x_i)$.
  （任意二阶 partial 可交换。）
]

#proof[
  In the scalar two-variable case, put
  $G(h,k)=f(x_1+h,x_2+k)-f(x_1+h,x_2)-f(x_1,x_2+k)+f(x_1,x_2)$.
  Applying the one-variable mean value theorem twice gives both
  $G(h,k)=h k partial_1 partial_2 f(s_0,t_0)$ and
  $G(h,k)=h k partial_2 partial_1 f(s'_0,t'_0)$, where the intermediate points
  tend to $(x_1,x_2)$.  Continuity of the second partials gives the result.
]

#theorem(title: [Higher partial regularity])[
  $f in C^(k+1)$ if and only if all partials of $f$ are in $C^k$.
]

#theorem(title: [Corollary（因而）])[
  如果 $f:A subset.eq bR^n->bR$ is $C^r$，then for every $2<=m<=r$,

  $partial^m f/(partial x_(i_1) partial x_(i_2) dots.c partial x_(i_m))
  = partial^m f/(partial x_(i_(pi(1))) partial x_(i_(pi(2))) dots.c partial x_(i_(pi(m))))$

  for any permutation $pi in S_m$。（即 $f in C^r$，$f$ 的 $r$-order 的
  partial derivative 可以随意换顺序。）For example, if $f$ is $C^3$,

  $partial^3 f/(partial x partial y partial z)
  = partial^3 f/(partial x partial z partial y)
  = partial^3 f/(partial z partial x partial y)=dots.c$.
]

#definition(title: [定义 multi-index notation])[
  一个 $n$-tuple $alpha=(alpha_1,dots,alpha_n)$ is a multi-index, s.t. each
  $alpha_i in bZ_(>=0)$. If $alpha$ is a multi-index, define its degree (or
  order) by $abs(alpha)=sum_i alpha_i$, and write
  $alpha! = product_i alpha_i!$（note: $0! = 1$）. For $x in bR^n$,
  $x^alpha=x_1^(alpha_1)x_2^(alpha_2)dots.c x_n^(alpha_n)$; for
  $f:bR^n->bR$,
  $partial^alpha f=(partial/(partial x_1))^(alpha_1)dots.c
  (partial/(partial x_n))^(alpha_n)f$。
  每个运算符 $partial/(partial x_i)$ 只对 $x_i$ 求导，随后可按任意顺序排列。
  For example, for $f:bR^2->bR$,
  $partial^(2,1)f=(partial/(partial x_1))^2(partial/(partial x_2))f
  =partial^3 f/(partial x_1 partial x_1 partial x_2)$.
]

#theorem(title: [Multinomial theorem])[
  For $x in bR^n$ and $k in bN$,
  $(x_1+dots.c+x_n)^k=sum_(abs(alpha)=k) k!/alpha! x^alpha$.
]

#remark[
  $k!/alpha!$ is the number of ways to divide a set of size $k$ into disjoint
  subsets of sizes $alpha_1,dots,alpha_n$. There are $k!$ ways to order the
  set, and $alpha! = alpha_1!alpha_2!dots.c alpha_n!$ ways to get the same
  result.
]

#theorem(title: [Higher-order product rule])[
  If $f,g$ are $C^(abs(alpha))$, then
  $partial^alpha(f g)=sum_(beta+gamma=alpha) alpha!/(beta! gamma!)
  (partial^beta f)(partial^gamma g)$.
]

#proof[
  The $abs(alpha)=1$ case is the usual product rule.  For the induction step,
  write $alpha=e_i+alpha'$ and differentiate the induction formula for
  $alpha'$; reindex the two sums to obtain the multinomial coefficient
  $alpha!/(beta!gamma!)$.
]

== Chain rule and Taylor's theorem

#theorem(title: [Chain rule])[
  Let $f:A subset.eq bR^n->B subset.eq bR^m$ and $g:B->bR^p$, with $A,B$
  open.  If $f$ is differentiable at $x_0$ and $g$ is differentiable at
  $f(x_0)$, then $g compose f$ is differentiable at $x_0$ and
  $D(g compose f)(x_0)=D g(f(x_0)) D f(x_0)$.
]

#proof[
  Recall first the one-dimensional statement:
  $(dif/dif x)(g compose f)(x)=g'(f(x)) f'(x)$（if $g'(f(x))$ and $f'(x)$
  exist）；one can view these as $1 times 1$ matrices. Now put
  $y_0=f(x_0)$ and, for $h$ small, define the remainder

  $R_f(h)=(f(x_0+h)-f(x_0)-D f(x_0)h)/norm(h)$.

  Since $f$ is differentiable, $norm(R_f(h))->0$ as $norm(h)->0$. For $k$
  small, likewise set

  $R_g(k)=(g(y_0+k)-g(y_0)-D g(y_0)k)/norm(k)$,

  so $norm(R_g(k))->0$ as $norm(k)->0$. Set
  $A=D g(y_0) D f(x_0)$ and
  $k=D f(x_0)h+norm(h)R_f(h)$. Then $f(x_0+h)=y_0+k$, and

  $norm(k)<=norm(D f(x_0))norm(h)+norm(h)norm(R_f(h))$.

  In particular $k->0$ as $h->0$. The composite remainder is

  $R_(g compose f)(h)=(g(y_0+k)-g(y_0)-A h)/norm(h)$
  $= (D g(y_0)(D f(x_0)h+norm(h)R_f(h))+norm(k)R_g(k)-A h)/norm(h)$
  $=D g(y_0)R_f(h)+(norm(k)/norm(h))R_g(k)$.

  The displayed bound and the two remainder limits make this tend to zero,
  which proves the stated matrix formula.
]

#definition(title: [Convex set])[
  A set $G subset.eq bR^n$ is convex if $t x+(1-t)y in G$ for all
  $x,y in G$ and $t in [0,1]$.
]

#theorem(title: [Taylor's theorem])[
  Let $G subset.eq bR^n$ be open and convex, let $f:G->bR$ be $C^(k+1)$,
  and let $a,x in G$.  Then
  $f(x)=sum_(abs(alpha)<=k) (partial^alpha f(a))/alpha! (x-a)^alpha + R_(a,k)(x)$,
  where, for some $c$ on the line segment from $a$ to $x$,
  $R_(a,k)(x)=sum_(abs(alpha)=k+1) (partial^alpha f(c))/alpha! (x-a)^alpha$.
]

#proof[
  Put $phi(t)=f(a+t(x-a))$.  The one-variable Taylor theorem applied at
  $t=0$ gives $f(x)=phi(1)$.  Repeated chain rule and the multinomial theorem
  yield $phi^(p)(t)=sum_(abs(alpha)=p) p!/alpha! (x-a)^alpha
  partial^alpha f(a+t(x-a))$, giving the displayed polynomial and remainder.
]

#example(title: [A second-order Taylor polynomial])[
  For $f(x,y)=sin(x^2+y)$, the notes compute at $(0,0)$:
  $partial^(1,0)f=2x cos(x^2+y)$, $partial^(0,1)f=cos(x^2+y)$,
  $partial^(2,0)f=2 cos(x^2+y)-4x^2 sin(x^2+y)$,
  $partial^(1,1)f=-2x sin(x^2+y)$, and $partial^(0,2)f=-sin(x^2+y)$.
  Thus its degree-two Taylor polynomial is $T(x,y)=y+x^2$.
]
