#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

== Homework 4 - submitted work

=== Exercise 28 - inverse of a linear transformation

For

$T mat(x_1; x_2; x_3; x_4) =
mat(22, 13, 8, 3; -16, -3, -2, -2; 8, 9, 7, 2; 5, 4, 3, 1)
mat(x_1; x_2; x_3; x_4),$

the standard matrix is

$A = mat(22, 13, 8, 3; -16, -3, -2, -2; 8, 9, 7, 2; 5, 4, 3, 1).$

The submitted elimination of $(A | I_4)$ ends at

$mat(I_4, |, mat(1, -2, 9, -25; -2, 5, -22, 60;
4, -9, 41, -112; -9, 17, -80, 222)).$

Thus

$A^(-1) = mat(1, -2, 9, -25; -2, 5, -22, 60;
4, -9, 41, -112; -9, 17, -80, 222),$

and $T^(-1)(x) = A^(-1) x$ for all $x in bR^4$.

=== Exercise 30 - invertibility

Let $A = mat(0, 1, b; -1, 0, c; -b, -c, 0)$.  By Theorem 2.4.3,
$A$ is invertible exactly when $"rref"(A) = I_3$.  Row reduction gives

$mat(0, 1, b; -1, 0, c; -b, -c, 0) arrow.r
mat(1, 0, -c; 0, 1, b; 0, 0, 0).$

Therefore $A$ is not invertible, regardless of the values of $b,c$.

=== Exercise 42 - permutation matrices

By elementary transformations that change row order, any permutation matrix
can be transformed into $I_n$.  Hence its rref is $I_n$, so it is
invertible by Theorem 2.4.3.  If $A$ is an arbitrary permutation matrix,
then

$"rref"(A | I_n) = (I_n | B)$

and $B$ is the inverse of $A$.  Since the calculation only changes row
order, every row of $B$ is chosen from $I_n$ without repetition.  Thus
$B$ is again a permutation matrix.

=== Exercise 6 - kernel

For $A = mat(1, 1, 1; 1, 2, 3)$, the submitted row reduction is

$mat(1, 1, 1, |, 0; 1, 2, 3, |, 0)
arrow.r mat(1, 0, -1, |, 0; 0, 1, 2, |, 0).$

Hence

$mat(x_1; x_2; x_3) = mat(t; -2t; t) = t mat(1; -2; 1), quad t in bR,$

so $"ker"(A) = "span"(mat(1; -2; 1))$.

=== Exercise 14 - image

For $A = mat(1, 2, 3; 1, 2, 3; 1, 2, 3)$,

$T(x) = A x = mat(1; 1; 1) x_1 + mat(2; 2; 2) x_2 +
mat(3; 3; 3) x_3 = mat(1; 1; 1)(x_1 + 2x_2 + 3x_3).$

Therefore $"im"(A) = "span"(mat(1; 1; 1))$.

== Part B

=== Problem 1 - nilpotent transformations

Let $T:bR^n arrow bR^n$ have standard matrix $A$.

==== (a)

We prove by induction on $k$ that the standard matrix of $T^k$ is $A^k$.
For $k=1$, $T(x)=A x=A^1 x$.  Assume $T^n(x)=A^n x$.  Using the composition
rule and associativity,

$T^(n+1)(x) = T(T^n(x)) = T(A^n x) = A(A^n x) = A^(n+1) x.$

Thus the statement holds for all $k$.

==== (b)

Assume that $T$ is nilpotent.  Then, for some positive integer $k$,
$T^k(x)=0$ for all $x in bR^n$.  By part (a), $A^k x=0$ for all $x$.
Suppose, for contradiction, that $A$ is invertible.  Then $A^k$ is
invertible, with inverse $(A^(-1) dot A^(-1) dot dots dot A^(-1))$ ($k$
factors).  Thus $"rank"(A^k)=n$, its rref is $I_n$, and the augmented
system $(A^k | 0)$ cannot have a solution for every right-hand side as
required.  This contradicts $A^k x=0$ for all $x$.  Therefore $A$ is not
invertible.

==== (c)

If $k=1$, then $T=0$, hence $A=0$ and $A-I_n=-I_n$ is invertible.  For
$k >= 2$, set

$B = I_n + A + A^2 + dots + A^(k-1).$

Then

$(I_n-A)B = I_n-A^k = I_n$

and, similarly, $B(I_n-A)=I_n$.  Thus $I_n-A$ is invertible, and so is
$A-I_n=-(I_n-A)$.

=== Problem 2 - the vector space $cal(F)(S,V)$

For $f,g,h in cal(F)(S,V)$ and $x in S$, pointwise addition gives the
vector-space axioms:

$
(f+g)(x) in V,
quad (f+g)(x)+h(x)=f(x)+(g(x)+h(x)),
quad f(x)+g(x)=g(x)+f(x),
$

and the function $p(x)=0_V$ is an additive identity.  For each $f$, the
function $n(x)=-f(x)$ is its additive inverse.  For scalars $alpha,beta$,

$
alpha(f+g)(x)=alpha f(x)+alpha g(x),
quad (alpha+beta)f(x)=alpha f(x)+beta f(x),
$

$alpha(beta f(x))=(alpha beta)f(x), quad 1f(x)=f(x).$

All expressions are defined in $V$, so $cal(F)(S,V)$ is a vector space.

The element $0_(cal(F)(S,V))$ is the function $x mapsto 0_V$, whereas
$0_V$ is an element of $V$; they are different elements although the
function value is always $0_V$.

$cal(F)(V,S)$ is not necessarily a vector space.  For example, take
$S={1,2}$ with $1+2=3$, which is not in $S$.  The constant functions $f(v)=1$ and
$g(v)=2$ lie in $cal(F)(V,S)$, but $f+g$ would have value $3$, hence is not
a function into $S$.

Finally,

$cal(P) subset cal(F)(bR,bR), quad cal(P)_n subset cal(F)(bR,bR),
quad C^infinity subset cal(F)(bR,bR),$

where $cal(P)$ is the set of all real polynomial functions,
$cal(P)_n$ those of degree at most $n$, and $C^infinity$ the infinitely
differentiable real functions.

=== Problem 3 - polynomial transformation

Let $T(p)(t)=p'(t)+p(0)$.

==== (a)

For $p_1,p_2 in cal(P)$,

$T(p_1+p_2)=(p_1+p_2)'(t)+(p_1+p_2)(0)=T(p_1)+T(p_2),$

and for $k in bR$,

$T(k p)(t)=k p'(t)+k p(0)=k T(p)(t).$

Thus $T$ is linear.

==== (b)

$T_n:cal(P)_n arrow cal(P)_n$ is not surjective: $p(t)=t^n$ is in the
target, but no element of $cal(P)_n$ maps to it because differentiation
lowers the degree by one.  It is not injective: for

$p_1(t)=1+2t+t^2, quad p_2(t)=2+t+t^2,$

we have $T_n(p_1)=3+2t=T_n(p_2)$ although $p_1 != p_2$.

==== (c)

$T$ is not injective by the same counterexample.  It is surjective: if

$p(t)=k+a_1 t+a_2 t^2+dots+a_m t^m,$

take

$q(t)=k t + 1/2 a_1 t^2 + 1/3 a_2 t^3 + dots + 1/(m+1) a_m t^(m+1).$

Then $q'(t)+q(0)=p(t)$.

=== Problem 4 - left multiplication

For $L_A:bR^(n times n) arrow bR^(n times n)$, $L_A(B)=A B$:

==== (a)

For $B,C in bR^(n times n)$ and $k in bR$,

$L_A(B+C)=A(B+C)=A B+A C=L_A(B)+L_A(C),$

$L_A(k B)=A(k B)=k A B=k L_A(B).$

So $L_A$ is linear.

==== (b)

If $A$ is invertible and $L_A(B_1)=L_A(B_2)$, multiplication by $A^(-1)$
gives $B_1=B_2$, so $L_A$ is injective and hence invertible.  Conversely,
if $L_A$ is invertible, it is surjective.  Thus some $C$ satisfies
$L_A(C)=I_n$, so $A C=I_n$ and $A$ is invertible.

==== (c)

If $L_A=L_B$, then evaluating both maps at $I_n$ gives
$A=L_A(I_n)=L_B(I_n)=B$.  Hence $A mapsto L_A$ is injective.

==== (d)

The map $L:bR^(n times n) arrow cal(F)$ is not surjective.  The constant
function $f(C)=I_n$ is in $cal(F)$, but if $L(A)=f$, then $A C=I_n$ for all
$C$.  Taking $C=0_(n times n)$ is impossible.

=== Problem 5 - rotations and projection

For $T="Rot"_(-80 degree) compose "Proj"_y compose "Rot"_(35 degree)$:

==== (a)

$"Rot"_(35 degree)$ has image $bR^2$.  Projection onto the $y$-axis has
image the $y$-axis, and rotation clockwise by $80 degree$ sends this to a
line $80 degree$ clockwise from the $y$-axis.  Thus the angle between
$"im"(T)$ and the $x$-axis is $90 degree-80 degree=10 degree$.

==== (b)

The final rotation does not affect the kernel.  Projection kills exactly
the $x$-axis, and undoing the initial $35 degree$ counter-clockwise rotation
gives a kernel line $35 degree$ counter-clockwise from the $x$-axis.

==== (c)

For $T_(phi,theta)="Rot"_phi compose "Proj"_y compose "Rot"_theta$,
the image is a line $-phi$ from the $y$-axis and the kernel is a line
$theta$ from the $x$-axis.  They agree when

$phi = pi/2 - theta + k pi,$

equivalently $theta-phi=pi/2+k pi$ for $k in ZZ$.
