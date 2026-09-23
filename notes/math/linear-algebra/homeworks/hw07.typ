#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

== Homework 7 — submitted work

= Part A

== 4.3 Exercise 14

For $T(M)=mat(1,1;2,2)M$ relative to
$cal(B)=(mat(1,0;-1,0),mat(0,1;0,-1),mat(1,0;2,0),mat(0,1;0,2))$,
the submission forms $[T]_cal(B)$ from $[T(b_i)]_cal(B)$.  It finds

$T(b_1)=T(b_2)=mat(0,0;0,0), quad
T(b_3)=mat(3,0;6,0), quad T(b_4)=mat(0,3;0,6),$

so

$[T]_cal(B)=mat(0,0,0,0;0,0,0,0;0,0,3,0;0,0,0,3)
mapsto mat(0,0,1,0;0,0,0,1;0,0,0,0;0,0,0,0).$

Hence

$["ker" T]_M="span"(mat(1;0;0;0),mat(0;1;0;0)),$

$["im" T]_M="span"(mat(0;0;1;0),mat(0;0;0;1)).$

A basis for the kernel is
$(mat(1,0;-1,0),mat(0,1;0,-1))$; a basis for the image is
$(mat(1,0;2,0),mat(0,1;0,2))$; and $"rank"(T)=2$.

== 4.3 Exercise 28

For $T(f(t))=f(2t-1)$ and $cal(B)=(1,t-1,(t-1)^2)$,

$[T]_cal(B)=([1]_cal(B) [2t-2]_cal(B) [4(t-1)^2]_cal(B))
=mat(1,0,0;0,2,0;0,0,4).$

This has full rank, so $T$ is invertible, is an isomorphism, and
$"rank"(T)=3$.

== 4.3 Exercise 60

In $2x_1+x_2-2x_3=0$ let

$cal(A)=(mat(1;2;2),mat(2;-2;1)), quad
cal(B)=(mat(1;2;2),mat(3;0;3)).$

The submitted change-of-basis matrices are

$S_(cal(B)->cal(A))=mat(1,1;0,1), quad
S_(cal(A)->cal(B))=mat(1,-1;0,1),$

and $[arrow(a_1) arrow(a_2)]=S_(cal(B)->cal(A))[arrow(b_1) arrow(b_2)]$.

== 5.1 Exercise 6

For $u=mat(1;-1;2;-2)$ and $v=mat(2;3;4;5)$,

$cos theta=frac(u dot v, norm(u)norm(v))=frac(-3, sqrt(540))
=frac(-1, 2sqrt(15)).$

Thus $theta=arccos(-sqrt(15)/30) approx 1.7$ rad (approximately
97.4 degrees).

== 5.1 Exercise 17

For $W="span"(mat(1;2;3;4),mat(5;6;7;8))$, the equations for
$x=mat(x_1;x_2;x_3;x_4) in W^perp$ reduce as

$mat(1,2,3,4;5,6,7,8) mapsto mat(1,0,-1,-2;0,1,2,3).$

Thus $x_1=x_3+2x_4$, $x_2=-2x_3-3x_4$, and

$W^perp={r mat(1;-2;1;0)+s mat(2;-3;0;1) | r,s in bR}.$

== 5.1 Exercise 26

With $u_1=1/7 mat(2;3;6)$ and $u_2=1/7 mat(3;-6;2)$,

$"proj"_W(x)=(u_1 dot x)u_1+(u_2 dot x)u_2$

$=(2+3+6)mat(2;3;6)+(3-6+2)mat(3;-6;2)=mat(19;35;64).$

= Part B

== Problem 1

For ordered bases $A,B,C$, writing $C=(c_1,c_2,dots,c_n)$ and taking
$f in W$,

$[f]_A=S_(C->A)[f]_C=S_(B->A)[f]_B, quad [f]_B=S_(C->B)[f]_C.$

So

$S_(C->A)[f]_C=(S_(B->A)S_(C->B))[f]_C.$

Taking $[f]_C=e_i$ makes corresponding columns equal; therefore

$S_(C->A)=S_(B->A)S_(C->B).$

Consequently,

$S_(C->A)S_(B->C)S_(A->B)
=S_(B->A)S_(C->B)S_(B->C)S_(A->B)
=S_(B->A) I_n S_(A->B)=I_n.$

== Problem 2

For $f_1=sin(2x)$, $f_2=cos(2x)$, $f_3=e^(3x)$ and
$cal(B)=(f_1,f_2,f_3)$,

$[D(f_1)]_cal(B)=mat(0;2;0), quad [D(f_2)]_cal(B)=mat(-2;0;0),
quad [D(f_3)]_cal(B)=mat(0;0;3),$

so $[D]_cal(B)=mat(0,-2,0;2,0,0;0,0,3)$.

The submitted interpretation is that it rotates every vector in $bR^2$
counterclockwise by $pi/2$, stretches the $x,y$ coordinates to twice their
length, and the $z$ coordinate to three times its length.

== Problem 3

Let $B=[T]_cal(B)$ and $C=[T]_cal(C)$.  By the change-of-basis theorem,
$C=S^(-1) B S$, where $S=S_(C->B)$.  The submission proves by induction that

$B^k=S^(-1) C^k S$

for each integer $k >= 1$.  The inductive step is

$B^(k+1)=B^k B=(S^(-1) C^k S)(S^(-1) C S)=S^(-1) C^(k+1) S.$

Thus $B^k$ and $C^k$ are similar.

For the false kernel claim, it takes

$A=mat(1,0,0;0,1,0;0,0,0),$

$cal(E)=(mat(1;0;0),mat(0;1;0),mat(0;0;1)),$

$cal(B)=(mat(0;1;0),mat(1;0;0),mat(0;0;1)).$

It records

$[A]_cal(E)=A, quad [A]_cal(B)=mat(1,0,0;0,0,0;0,1,1),$

but

$"ker"([A]_cal(E))={r mat(0;0;1) | r in bR},$

$"ker"([A]_cal(B))={r mat(0;1;-1) | r in bR}.$

For equal nullities, rank-nullity gives

$"dim"("ker" B)=n-"rank"(B), quad "dim"("ker" C)=n-"rank"(C).$

The page proves $"rank"(M N) <= "rank"(N)$ from
$"ker" N subset.eq "ker"(M N)$, the analogous bound for $M$ by transposition,
and equality $"rank"(M N)="rank"(N)$ when $M$ is invertible.  Since
$B=S^(-1) C S$, $"rank"(B)="rank"(C)$, so the kernel dimensions agree.

== Problem 4

For $T:U -> W$, bases $cal(B)=(u_1,dots,u_k)$ and
$cal(C)=(w_1,dots,w_d)$, define

$T'([u]_cal(B))=[w]_cal(C) quad "whenever" quad T(u)=w.$

The source diagram verifies

$T' compose L_cal(B)(u)=T'([u]_cal(B))=[w]_cal(C)=L_cal(C) compose T(u),$

hence $T' compose L_cal(B)=L_cal(C) compose T$.  Thus

$[T(u)]_cal(C)=[T]_(cal(B),cal(C))[u]_cal(B).$

For $u=a_1 u_1+...+a_k u_k$,

$[T(u)]_cal(C)=a_1[T(u_1)]_cal(C)+...+a_k[T(u_k)]_cal(C),$

and therefore

$[T]_(cal(B),cal(C))=([T(u_1)]_cal(C) [T(u_2)]_cal(C) dots [T(u_k)]_cal(C)).$

== Problem 5

For $f_1=sin x$, $f_2=cos x$, $f_3=e^x$:

$T(f_1)=x-x^3/6, quad T(f_2)=1-x^2/2,$

$T(f_3)=1+x+x^2/2+x^3/6.$

The source chooses $cal(C)=(1,x,x^2/2,x^3/6)$.  For
$cal(B)=(f_1+f_2,f_1-f_2,f_3+f_1)$ it computes

$[T(f_1+f_2)]_cal(C)=mat(1;1;-1;-1),$

$[T(f_1-f_2)]_cal(C)=mat(-1;1;1;-1),$

$[T(f_3+f_1)]_cal(C)=mat(1;2;1;0),$

so

$[T]_(cal(B),cal(C))=mat(1,-1,1;1,1,2;-1,1,1;-1,-1,0).$

== Problem 6

Let $A=mat(-6,-30;-30,19)$ and $V="span"(mat(3;2))$.  For
$v=a mat(3;2)$,

$A v=a mat(-78;-52)=-26a mat(3;2) in V.$

$V^perp={r mat(-2;3) | r in bR}$, and

$A mat(-2r;3r)=r mat(-78;117)=-39r mat(-2;3) in V^perp.$

With $cal(B)=(mat(-2;3),mat(3;2))$,

$[T]_cal(B)=mat(26,0;0,-39), quad
[T^(10)]_cal(B)=mat(26^(10),0;0,39^(10)).$

The source uses

$S_(cal(B)->cal(E))=mat(-2,3;3,2), quad
S_(cal(B)->cal(E))^(-1)=mat(2/13,-3/13;-3/13,-2/13)$

to obtain

$[T^(10)]_cal(E)=mat((4 dot 26^(10)+9 dot 39^(10))/13,(-6 dot 26^(10)+6 dot 39^(10))/13;(-6 dot 26^(10)+6 dot 39^(10))/13,(9 dot 26^(10)+4 dot 39^(10))/13).$
