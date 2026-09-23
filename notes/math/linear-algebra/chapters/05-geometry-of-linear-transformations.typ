#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *


= Geometry of linear transformations

== WS 5, p. 1: examples, scaling, and projection

在 2-1 我们知道 $mat(0,-1;1,0)$ 是 $bR^2$ 中 counter clockwise 转 $90$ 度的
linear transformation。现在再看几个：
$
A=mat(2,0;0,2), quad B=mat(1,0;0,0), quad C=mat(-1,0;0,1),
$
$
D=mat(0,1;-1,0), quad E=mat(1,0.2;0,1), quad F=mat(1,-1;1,1).
$

The source diagrams apply them to $(1,2)$ and $(1,-1)$:

- $A$: 放大一倍, sending them to $(2,4)$ and $(-2,-2)$.
- $B$: orthogonal projection onto $x$-axis, sending both to $(1,0)$.
- $C$: reflection about $y$-axis.
- $D$: clockwise 转 $90$ degrees, sending them to $(-2,-1)$ and $(1,-1)$.
- $E$: 向右 shear, sending them to $(1.4,2)$ and $(0.8,-1)$.
- $F$: counterclockwise shift + 放大 $sqrt(2)$ 倍, sending them to
  $(-1,3)$ and $(2,0)$.

#theorem(title: [Scalings])[
$mat(k,0;0,k)$ defines a scaling by $k$, since
$mat(k,0;0,k)mat(x_1;x_2)=mat(k x_1;k x_2)=k mat(x_1;x_2)=k  x$.
]

#definition(title: [#kn[Orthogonal projection]])[
Consider a line $L$ in coordinate plane, 经过 $(0,0)$. 任何
$ x in bR^2$ 都可以写成 $ x= x^parallel+ x^perp$, where
$ x^parallel || L$ and $ x^perp perp L$. The transformation
$T( x)= x^parallel$ is the orthogonal projection of $ x$ onto
$L$, denoted $"proj"_L( x)$.

随意取 $ w || L$,
$"proj"_L( x)=( x dot  w)/( w dot  w)  w$.
特别地，如果 $ w$ 是 unit vector
$ u=mat(u_1;u_2) || L$, then
$"proj"_L( x)=( x dot  u)  u$. 这一个 transformation 是 linear
的；with matrix
$P=mat(u_1^2,u_1u_2;u_1u_2,u_2^2)$.
]

#definition(title: [Reflection])[
Consider a line $L$ in coordinate plane, 过 $(0,0)$, and write
$ x= x^parallel+ x^perp$. Then
$T( x)= x^parallel- x^perp$ is reflection of $ x$ about
$L$, denoted $"ref"_L( x)$. 由 Definition 2.2.1,
$"ref"_L( x)= x^parallel-( x- x^parallel)
=2"proj"_L( x)- x=(2P-I_2) x$.
]

The matrix of $T$ has form $mat(a,b;b,-a)$ where $a^2+b^2=1$:
$S=2P-I_2=mat(2u_1^2-1,2u_1u_2;2u_1u_2,2u_2^2-1)
=mat(u_1^2-u_2^2,2u_1u_2;2u_1u_2,u_2^2-u_1^2)$.

== WS 5, p. 2: rotations and shearing

#theorem(title: [Rotations])[
$T( x)=A  x$ is a counterclockwise rotation in $bR^2$ (rotate by
$theta$) iff
$A=mat(cos(theta),-sin(theta);sin(theta),cos(theta))
=mat(a,-b;b,a)$, where $a^2+b^2=1$.
]

For a nonzero vector $ x$, write its coordinate in polar form
$(r cos(phi),r sin(phi))$. Rotation gives
$ x'=(r cos(phi+theta),r sin(phi+theta))$, so
$x_1'=x cos(theta)-y sin(theta)$ and
$y'=x sin(theta)+y cos(theta)$, which gives the displayed matrix.

#theorem(title: [Rotations combined with a scaling])[
将 $ v in bR^2$ counterclockwise rotate $theta$ 并放大至 $r$ 倍. Let
$T(a,b)=mat(r cos(theta);r sin(theta))$. Then
$T( x)=A  x$,
$A=mat(a,-b;b,a)=r mat(cos(theta),-sin(theta);sin(theta),cos(theta))$.
]

== 5. Shearing

Vertical shear:
$
T(mat(x_1;x_2))=mat(x_1;k x_1+x_2)=mat(1,0;k,1)mat(x_1;x_2).
$
Horizontal shear:
$
T(mat(x_1;x_2))=mat(x_1+k x_2;x_2)=mat(1,k;0,1)mat(x_1;x_2).
$

#theorem(title: [Horizontal and vertical shearing])[
Horizontal shearing of slope $k x_2$ has matrix $mat(1,k;0,1)$;
vertical shearing of slope $k x_1$ has matrix $mat(1,0;k,1)$.
]

The source's concluding table records:

- Scaling by $k$: $k I_2=mat(k,0;0,k)$.
- Orthogonal projection onto line $L$: $mat(u_1^2,u_1u_2;u_1u_2,u_2^2)$,
  for $ u || L$ and $norm( u)=1$.
- Reflection about line $L$: $mat(2u_1^2-1,2u_1u_2;2u_1u_2,2u_2^2-1)$.
- Rotation through angle $theta$ (逆时针):
  $mat(cos(theta),-sin(theta);sin(theta),cos(theta))$.
- Rotation through $theta$ with scaling by $r$:
  $r mat(cos(theta),-sin(theta);sin(theta),cos(theta))$.
- Shear: horizontal $mat(1,k;0,1)$; vertical $mat(1,0;k,1)$.
