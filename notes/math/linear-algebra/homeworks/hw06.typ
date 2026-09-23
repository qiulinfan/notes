#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

== Homework 6 - submitted work

=== Exercise 50 - hexagonal coordinates

For the basis $cal(B)=(v,w)$ in the hexagonal tiling,

$[arrow("OP")]_cal(B)=[2v+w]_cal(B)=mat(2;1),$

$[arrow("OQ")]_cal(B)=[v+2w]_cal(B)=mat(1;2).$

The point with $[arrow("OR")]_cal(B)=mat(3;2)$ is the center of a tile.
Further,

$mat(17;13)=8mat(2;1)+mat(1;2)+mat(0;3).$

Moving by the first two summands means moving in parallel to $arrow("OQ")$ and $arrow("OP")$
by whole tile lengths, which does not change whether a point is a vertex or
center.  Since $mat(0;3)$ is a vertex, $mat(17;13)$ is a vertex.

=== Exercise 70 - upper triangular coordinate matrix

There is no basis $cal(B)=(v_1,v_2)$ of $bR^2$ whose $cal(B)$-matrix for

$T(x)=mat(0,-1;1,0)x$

is upper triangular.  Suppose, for a contradiction, that

$[T]_cal(B)=mat(a,b;0,c).$

Then the generalized key theorem gives

$mat(0,-1;1,0) v_1=a v_1.$

Writing $v_1=mat(x;y)$ yields

$-y=a x, quad x=a y, quad (a-1)x=(-a-1)y.$

Thus $x=y=0$, since $a-1$ and $-a-1$ cannot both vanish.  This is
impossible because $0$ cannot be a basis vector.

=== Exercise 58 - the solutions of $f''=-f$

==== (a)

For $g in V$, $g''=-g$.  Let

$f(x)=g(x)^2+g'(x)^2.$

Then

$f'(x)=2g(x)g'(x)+2g'(x)g''(x)=2g(x)g'(x)-2g(x)g'(x)=0,$

so $f$ is constant.

==== (b)

If $g(0)=g'(0)=0$, the constant from part (a) is
$k=g(0)^2+g'(0)^2=0$.  Therefore $g(x)^2+g'(x)^2=0$ for all $x$, and
$g(x)=g'(x)=0$ for all $x$.

==== (c)

$V$ is a vector space; moreover, $(sin x)''=-sin x$ and
$(cos x)''=-cos x$.  Hence for $f in V$,

$g(x)=f(x)-f(0)cos x-f'(0)sin x$

is in $V$.  We have $g(0)=0$ and

$g'(x)=f'(x)+f(0)sin x-f'(0)cos x, quad g'(0)=0.$

Part (b) gives $g=0$, so

$f(x)=f(0)cos x+f'(0)sin x.$

Thus $(cos x,sin x)$ spans $V$.

=== Exercise 46 - multiplication by $t-1$

For $T(f(t))=(t-1)f(t)$,

$T(f+g)=(t-1)(f+g)=T(f)+T(g),$

$T(k f)=(t-1) k f=k T(f).$

Thus $T$ is linear.  It is not an isomorphism because it is not surjective:
a nonzero constant target polynomial cannot be $(t-1)f(t)$ for a polynomial
$f$.

=== Exercise 68 - isomorphism condition

For $M=mat(a,b;c,d)$,

$T(M)=mat(5a,b;5c,d)-mat(2a,2b;k c,k d)
=mat(3a,-b;(5-k)c,(1-k)d).$

The source and target have equal dimension, so $T$ is an isomorphism exactly
when it is injective, equivalently when $"ker"(T)={0}$.  This holds for
$k != 1,5$.  For $k=1$ or $k=5$, the kernel has dimension $1$, so $T$ is
not an isomorphism.

== Part B

=== Problem 1 - coefficient map

Let $T:bR^n arrow V$ be defined by

$T(mat(c_1;dots.v;c_n))=c_1 v_1+dots+c_n v_n.$

==== (a)

For coefficient columns $a=(a_i)$ and $c=(c_i)$,

$T(a+c)=sum (a_i+c_i)v_i=T(a)+T(c),$

and $T(k a)=sum k a_i v_i=k T(a)$.  Hence $T$ is linear.

==== (b)

If $T$ is injective and $c_1 v_1+dots+c_n v_n=0$, then

$T(mat(c_1;dots.v;c_n))=T(mat(0;dots.v;0)),$

so $c_i=0$ for every $i$.  The list is linearly independent.  Conversely,
if $(v_1,dots,v_n)$ is linearly independent and $T(a)=T(b)$, then

$(a_1-b_1)v_1+dots+(a_n-b_n)v_n=0.$

Thus $a_i=b_i$ for all $i$, and $T$ is injective.

==== (c)

If $T$ is surjective, every $v in V$ equals
$T(mat(a_1;dots.v;a_n))=a_1 v_1+dots+a_n v_n$, so the list spans $V$.
Conversely, if it spans $V$, each $v in V$ has this form and is in the
image of $T$.  Therefore $T$ is surjective.

==== (d)

An isomorphism is injective and surjective, so by (b) and (c) its list is
linearly independent and spans $V$: it is an ordered basis.  Conversely, an
ordered basis gives both properties, so the linear map $T$ is a bijection
and hence an isomorphism.

=== Problem 2 - coordinate matrices for symmetrization

Let $T(A)=1/2(A+A^T)$ for $A=mat(a,b;c,d)$.

==== (a)

$T(A)=mat(a,(b+c)/2;(b+c)/2,d).$

With $[A]_cal(E)=mat(a;b;c;d)$, the $cal(E)$-matrix is

$[T]_cal(E)=mat(1,0,0,0;0,1/2,1/2,0;0,1/2,1/2,0;0,0,0,1).$

==== (b)

For $cal(C)=(mat(0,1;1,0),mat(1,0;0,0),mat(0,0;0,1),mat(0,1;-1,0))$,

$[T]_cal(C)=mat(1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,0).$

==== (c)

Solving $[T]_cal(E)mat(a;b;c;d)=0$ gives

$"ker"([T]_cal(E))={r mat(0;-1;1;0) | r in bR}.$

==== (d)

The corresponding subspace of $bR^(2 times 2)$ is

${r mat(0,-1;1,0) | r in bR},$

with basis $mat(0,-1;1,0)$.

==== (e)

Solving $[T]_cal(C)mat(a;b;c;d)=0$ gives

$"ker"([T]_cal(C))={r mat(0;0;0;1) | r in bR}.$

==== (f) and (g)

The coordinate isomorphism sends

$mat(x;y;z;w) mapsto mat(y,x+w;x-w,z).$

Hence the image of the $cal(C)$-coordinate kernel is

${r mat(0,1;-1,0) | r in bR},$

the same subspace as in part (d).  Both are $"ker"(T)$.

==== (h)

Using $cal(C)$-coordinates, the image is spanned by the first three
coordinate vectors.  A basis is therefore

$(mat(0,1;1,0), mat(1,0;0,0), mat(0,0;0,1)).$

=== Problem 3 - a trigonometric vector space

Let

$f_1=1, quad f_2=sin(2x), quad f_3=cos(2x),
quad f_4=sin^2(x), quad f_5=cos^2(x), quad f_6=sin x cos x,$

and $V="Span"(f_1,dots,f_6)$, $cal(B)=(f_1,f_2,f_4)$.

==== (a)

For $f=a_1+a_2sin(2x)+a_3cos(2x)+a_4sin^2(x)+a_5cos^2(x)+a_6sin x cos x$,
the identities $cos(2x)=1-2sin^2(x)$, $cos^2(x)=1-sin^2(x)$, and
$sin x cos x=1/2sin(2x)$ give

$f=(a_1+a_3+a_5)+(a_2+1/2a_6)sin(2x)+(a_4-2a_3-a_5)sin^2(x).$

So $(f_1,f_2,f_4)$ spans $V$.  If
$b_1+b_2sin(2x)+b_4sin^2(x)=0$, evaluate at $x=pi$, $x=pi/2$, and
$x=pi/4$ to get $b_1=b_4=b_2=0$.  Thus $cal(B)$ is an ordered basis.

==== (b)

$
[f_1]_cal(B)=mat(1;0;0), quad [f_2]_cal(B)=mat(0;1;0),
quad [f_3]_cal(B)=mat(1;0;-2),
$

$
[f_4]_cal(B)=mat(0;0;1), quad [f_5]_cal(B)=mat(1;0;-1),
quad [f_6]_cal(B)=mat(0;1/2;0).
$

==== (c)

For $f=a_1+a_2sin(2x)+a_3sin^2(x)$,

$f'=2a_2cos(2x)+a_3sin(2x)
=2a_2+a_3sin(2x)-4a_2sin^2(x) in V.$

Thus $V$ is closed under differentiation.

==== (d)

$T(f)=f'+2f$ has

$[T(f)]_cal(B)=mat(2a_1+2a_2; 2a_2+a_3; -4a_2+2a_3),$

so

$[T]_cal(B)=mat(2,2,0;0,2,1;0,-4,2).$

==== (e)

Row reduction of $([T]_cal(B)|I_3)$ gives

$[T]_cal(B)^(-1)=mat(1/2,-1/4,1/8;0,1/4,-1/8;0,1/2,1/4).$

Therefore

$T^(-1)(a_1+a_2sin(2x)+a_3sin^2(x))
=(1/2a_1-1/4a_2+1/8a_3)+(1/4a_2-1/8a_3)sin(2x)
+(1/2a_2+1/4a_3)sin^2(x).$

==== (f)

The coordinate vector of $4+8sin^2(x)$ is $mat(4;0;8)$.  Applying the
inverse matrix gives $mat(3;-1;2)$, so

$f(x)=3-sin(2x)+2sin^2(x).$

=== Problem 4 - products of vector spaces

==== (a)

If $0_X$ and $0_Y$ are the zero vectors of $X$ and $Y$, the zero vector of
$X times Y$ is $(0_X,0_Y)$.

==== (b)

Let $(x_1,dots,x_m)$ be a basis of $X$ and $(y_1,dots,y_n)$ a basis of
$Y$.  For $(a,b) in X times Y$, write

$a=sum a_i x_i, quad b=sum b_j y_j.$

Then

$(a,b)=sum a_i(x_i,0_Y)+sum b_j(0_X,y_j),$

so the listed vectors span.  If their linear combination is $(0_X,0_Y)$,
then $sum a_i x_i=0_X$ and $sum b_j y_j=0_Y$.  Independence of the two bases
forces all coefficients to vanish.  Therefore

$( (x_1,0_Y),dots,(x_m,0_Y),(0_X,y_1),dots,(0_X,y_n) )$

is a basis of $X times Y$.

==== (c)

The basis in (b) has $m+n$ vectors, so

$"dim"(X times Y)="dim"(X)+"dim"(Y).$

=== Problem 5 - sum and intersection

Let $T:X times Y arrow X+Y$ be $T(x,y)=x+y$.

==== (a)

$T((x_1,y_1)+(x_2,y_2))=x_1+x_2+y_1+y_2=T(x_1,y_1)+T(x_2,y_2)$,
and $T(k(x,y))=k T(x,y)$, so $T$ is linear.  Each $z in X+Y$ has the form
$z=x+y=T(x,y)$, so $T$ is surjective.

==== (b)

If $x+y=0$, then $x=-y$, so it belongs to both $X$ and $Y$.  Hence

$"ker"(T)={(a,-a) | a in X inter Y}.$

The map $T_1:"ker"(T) arrow X inter Y$, $(a,-a) mapsto a$, is linear,
injective, and surjective; hence it is an isomorphism.

==== (c)

Since $"ker"(T)$ is isomorphic to $X inter Y$ and $T$ is surjective,
rank-nullity with part 4(c) gives

$"dim"(X+Y)+"dim"(X inter Y)="dim"(X)+"dim"(Y).$

==== (d)

For three-dimensional subspaces of $bR^5$, $X inter Y={0}$ would give
$"dim"(X+Y)=6$, contradicting $"dim"(X+Y)<=5$.  Thus it is impossible.
In $bR^6$ it is possible; for example,

$X={mat(a;b;c;0;0;0) | a,b,c in bR}, quad
Y={mat(0;0;0;x;y;z) | x,y,z in bR}.$

Then $X+Y=bR^6$ and $X inter Y={0}$.
