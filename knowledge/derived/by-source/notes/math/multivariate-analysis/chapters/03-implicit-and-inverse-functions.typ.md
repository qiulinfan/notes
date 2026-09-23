---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/multivariate-analysis/chapters/03-implicit-and-inverse-functions.typ"
kgd_source_format: "typst"
kgd_source_sha256: "147eaa1f3ed40774788d13b24a65b1aef592c5521467a8bbd3de808c6dd7efed"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Visual source migration: 395-lec09-IFT1.pdf pp. 1-2;
// 395-lec10-IFT2.pdf pp. 1-2; 395-lec11-Implicit-Differentiation.pdf pp. 1-2;
// 395-lec12-Implicit-Function-Thm.pdf pp. 1-2.
= Inverse and implicit functions

== Local invertibility

#definition(title: [Local inverse, homeomorphism, and diffeomorphism])[
  For $f:A subset.eq bR^n->bR^n$, say $f$ is locally invertible near $x_0$
  when some $B_delta(x_0)$ is mapped bijectively onto an open set
  $Omega subset.eq bR^n$.  It is a local homeomorphism if this restriction and
  its inverse are continuous, a local diffeomorphism if both are differentiable,
  and a local $C^r$ diffeomorphism if both are $C^r$.
]

#remark[
  $x mapsto x^3$ is locally invertible but not a local diffeomorphism near
  zero.  A derivative that exists and is nonzero only at a point is not enough
  for local injectivity: the lecture sketches an oscillating graph tangent to
  $y=x$ as the counterexample.  If $f'$ exists near $a$ and $f'(a)!=0$, however,
  continuity of $f'$ is not needed to obtain local injectivity in one variable.
]

#lemma(title: [Quantitative invertibility of a matrix])[
  If $E$ is an invertible $n times n$ matrix, then for all $x,y in bR^n$,
  $norm(E x-E y) >= 1/norm(E^(-1)) norm(x-y)$.
]

#proof[
  Put $v=x-y$.  Since $norm(v)=norm(E^(-1)E v)<=norm(E^(-1))norm(E v)$,
  rearrange to get the bound.
]

#lemma(title: [Mean-value estimate])[
  If $H:A subset.eq bR^n->bR^m$ is $C^1$ and the segment from $x$ to $y$ is
  contained in $A$, then
  $norm(H(x)-H(y)) <= max_(t in [0,1]) norm(D H(x+t(y-x))) norm(x-y)$.
]

#proof[
  Apply the one-variable mean value theorem to each coordinate of
  $phi(t)=H(x+t(y-x))$ and take the largest coordinate estimate.
]

#lemma(title: [Nonsingular derivative gives a lower Lipschitz bound])[
  Let $f:A subset.eq bR^n->bR^n$ be $C^1$ and suppose $D f(x_0)$ is
  invertible.  Then there are an open neighborhood $U$ of $x_0$ and
  $alpha>0$ such that
  $norm(f(x)-f(y)) >= alpha norm(x-y)$ for all $x,y in U$.
]

#proof[
  Set $E=D f(x_0)$ and $H(x)=f(x)-E x$.  Since $D H(x_0)=0$, continuity of
  $D H$ gives a small ball on which
  $norm(H(x)-H(y)) < 1/(2norm(E^(-1))) norm(x-y)$.  Combine the preceding two
  lemmas with $f(x)-f(y)=E(x-y)+H(x)-H(y)$ to obtain
  $alpha=1/(2norm(E^(-1)))$.
]

#theorem(title: [#kn[Inverse function theorem]])[
  Let $f:A subset.eq bR^n->bR^n$ be $C^r$ ($r>=1$), with $A$ open and
  $x_0 in A$.  If $D f(x_0)$ is nonsingular, then some open neighborhoods
  $U$ of $x_0$ and $V$ of $f(x_0)$ satisfy: $f:U->V$ is bijective, its inverse
  $g:V->U$ is $C^r$, and
  $D g(f(x))=(D f(x))^(-1)$ for $x in U$.
]

#proof[
  The lower Lipschitz bound makes $f$ injective on a small $U$.  It also shows
  that $f(U)$ is open: take a closed ball inside $U$, minimize
  $z mapsto norm(f(z)-c)^2$ on it, and use the chain rule plus invertibility of
  the derivative to see that the minimizer for $c$ close to $f(x)$ is interior.
  Thus $V=f(U)$ is open and $g$ is continuous.

  For $y=f(x)$ and $h=g(y+k)-g(y)$, differentiability of $f$ gives
  $k-D f(x)h=r(h)$, where $norm(r(h))/norm(h)->0$.  The lower bound relates
  $norm(h)$ to $norm(k)$, giving
  $(g(y+k)-g(y)-(D f(x))^(-1)k)/norm(k)->0$.  Hence $D g(y)=(D f(x))^(-1)$.
  Cramer's rule expresses the inverse matrix as rational functions of the
  entries of $D f$; induction then upgrades $g$ to $C^r$.
]

#remark[
  $det M=sum_(sigma in S_n) upright("sgn")(sigma) product_i M_(i,sigma(i))$ is continuous.
  Therefore $det D f(x_0)!=0$ remains nonzero on a small neighborhood.  The
  theorem says the functions $y_i=f_i(x_1,dots,x_n)$ can be used as local
  coordinates in place of $x_i$.
]

#example(title: [Polar and spherical coordinates])[
  For $(r,theta) mapsto (r cos theta,r sin theta)$,
  $D f=mat(cos theta,-r sin theta; sin theta,r cos theta)$ and
  $det D f=r$, so it is locally invertible for $r!=0$.  For spherical coordinates
  $(r,phi,theta) mapsto (r sin phi cos theta,r sin phi sin theta,r cos phi)$,
  the notes calculate $det D f=r^2 sin phi$; it is nonzero away from $r=0$ and
  the polar axis.
]

== Implicit functions

#theorem(title: [Implicit differentiation])[
  Let $f:A subset.eq bR^(k+n)->bR^n$ be differentiable, with
  $(x,y) in bR^k times bR^n$.  If a differentiable map $g:B subset.eq bR^k->bR^n$
  satisfies $f(x,g(x))=0$, then
  $partial f/partial x (x,g(x)) + partial f/partial y (x,g(x)) D g(x)=0$.
  If $partial f/partial y$ is invertible, then
  $D g(x)=-(partial f/partial y(x,g(x)))^(-1) partial f/partial x(x,g(x))$.
]

#proof[
  Apply the chain rule to $h(x)=(x,g(x))$.  Its derivative is the block matrix
  $D h=mat(I_k; D g)$, while
  $D f=(partial f/partial x,partial f/partial y)$.
]

#theorem(title: [Implicit function theorem])[
  Let $A subset.eq bR^k times bR^n$ be open, let $f:A->bR^n$ be $C^r$
  ($r>=1$), and assume $(a,b) in A$, $f(a,b)=0$, and
  $partial f/partial y(a,b)$ is nonsingular.  Then on a neighborhood of $a$
  there is a unique $C^r$ function $g$ with $g(a)=b$ and
  $f(x,g(x))=0$.  Its derivative is the implicit-differentiation formula above.
]

#proof[
  Define the auxiliary map $F(x,y)=(x,f(x,y))$.  Its derivative is block
  triangular:
  $D F=mat(I_k,0; partial f/partial x,partial f/partial y)$, hence
  $det D F(a,b)=det(partial f/partial y(a,b))!=0$.  The inverse function theorem
  gives a local inverse $G$.  Since the first $k$ coordinates of $F$ are the
  identity, write $G(x,z)=(x,h(x,z))$ and set $g(x)=h(x,0)$.  This gives
  existence.  For uniqueness, the notes let
  $S={x | g(x)=g'(x)}$; it is nonempty, closed by continuity, and open by the
  local inverse, so connectedness of a sufficiently small ball implies $S=B$.
]

#remark[
  The theorem turns a level set ${(x,y):f(x,y)=0}$ locally into the graph of
  a function.  In the linear case $f(x,y)=A x+B y$, invertibility of $B$ gives
  the familiar formula $y=-B^(-1) A x$.
]

#example(title: [Level-set examples])[
  The unit circle $f(x,y)=x^2+y^2-1=0$ defines locally
  $y=sqrt(1-x^2)$ away from $(1,0)$ and $(-1,0)$, exactly where
  $partial f/partial y=2y$ is nonzero.  Two $C^1$ surfaces
  $f=g=0$ in $bR^3$ typically meet in a curve: if the $2 times 2$ derivative
  with respect to $(y,z)$ has rank two, the implicit theorem solves $(y,z)$
  in terms of $x$.
]
