#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

== Homework 8 — submitted work

= Part A

The assigned book exercises are 5.1: 45; 5.2: 14, 26; 5.3: 36; and
5.4: 26, 32.

== 5.1 Exercise 45

For $A=mat(3,5,11;5,9,20;11,20,49)$ and
$V="span"(arrow(v_2),arrow(v_3))$, put
$"proj"_V(arrow(v_1))=c_2arrow(v_2)+c_3arrow(v_3)$.  Orthogonality gives

$9c_2+20c_3=5, quad 20c_2+49c_3=11,$

so $c_2=25/41$, $c_3=-1/41$, and

$"proj"_V(arrow(v_1))=25/41arrow(v_2)-1/41arrow(v_3).$

== 5.2 Exercise 14

For $mat(1;7;1;7),mat(0;7;2;7),mat(1;8;1;6)$, the submitted
Gram--Schmidt calculation gives

$u_1=1/10 mat(1;7;1;7), quad
u_2=1/sqrt(2)mat(-1;0;1;0), quad
u_3=1/sqrt(2)mat(0;1;0;-1).$

It states that $(u_1,u_2,u_3)$ is the orthonormal basis.

== 5.2 Exercise 26

For $m_1=mat(2;3;0;6)$ and $m_2=mat(4;4;2;13)$,

$u_1=1/7 mat(2;3;0;6), quad u_2=1/3 mat(0;-2;2;1),$

and

$Q=mat(2/7,0;3/7,-2/3;0,2/3;6/7,1/3), quad
R=mat(7,14;0,3).$

== 5.3 Exercise 36

For $mat(2/3,1/sqrt(2),a;2/3,-1/sqrt(2),b;1/3,0,c)$, the roles must be
orthonormal.  The page solves

$4/9-1/2+a b=0, quad 2/9+a c=0, quad 2/9+b c=0,$

giving $a=b=sqrt(2)/6$ and $c=-2sqrt(2)/3$.

== 5.4 Exercise 26

For $A=mat(1,2,3;4,5,6;7,8,9)$, $b=mat(1;0;0)$, the normal equation is

$mat(66,78,90;78,93,108;90,108,126)x=mat(1;2;3).$

Its reduced echelon form is

$mat(1,0,-1,7/6;0,1,2,1;0,0,0,0),$

so

$x^*=mat(-7/6+t;1-2t;t)=mat(-7/6;1;0)+t mat(1;-2;1).$

== 5.4 Exercise 32

For $(0,27),(1,0),(2,0),(3,0)$, let $f(x)=c_0+c_1x+c_2x^2$, with

$A=mat(1,0,0;1,1,1;1,2,4;1,3,9), quad b=mat(27;0;0;0).$

The source gives

$mat(4,6,14;6,14,36;14,36,98)x=mat(27;0;0),$

$x^*=mat(513/20;-567/20;21/4),$

and

$f^*(x)=513/20-567/20x+21/4x^2=25.65-28.35x+6.25x^2.$

= Part B

== Problem 1

For $pi(v)=sum_(i=1)^d frac(v dot v_i, v_i dot v_i)v_i$:

=== (a)

If $v_i dot v_j=0$ for $i != j$, then
$(v_1/norm(v_1),dots,v_d/norm(v_d))$ is an orthonormal basis.  Writing
$u_i=v_i/norm(v_i)$,

$pi(v)=sum_(i=1)^d frac(v dot v_i, norm(v_i)^2)v_i
=sum_(i=1)^d(v dot u_i)u_i,$

so $pi$ is the orthogonal projection onto $W$.

=== (b)

If the basis is not perpendicular, some $v_i dot v_j=a != 0$.  While
$"proj"_W(v_i)=v_i$,

$pi(v_i)=v_i+dots+frac(a, norm(v_j)^2)v_j+dots != v_i$

by linear independence.  Thus $pi$ is not $"proj"_W$.

== Problem 2

For the set $O_n$ of orthogonal matrices:

- (a) False. $I_n in O_n$, but $I_n+I_n$ is not orthogonal; the page gives
  $(I_n+I_n)^T(I_n+I_n)=mat(2,0;0,2)$, whereas its inverse is
  $mat(1/2,0;0,1/2)$.
- (b) True. The composition of the orthogonal maps represented by $A,B$ has
  standard matrix $A B$, so $A B in O_n$.
- (c) True by the same composition argument for $A^2$.
- (d) True. If $A^2$ were orthogonal but $A$ were not, with
  $norm(T_A(x))=a norm(x)$ and $a != 1$, then
  $norm(T_A compose T_A(x))=a^2norm(x) != norm(x)$, a contradiction.
- (e) True. $A in O_n$ gives $A^T=A^(-1)$; $A^2=I_n$ gives
  $A=A^(-1)=A^T$, so $A$ is symmetric.

== Problem 3

For an orthonormal basis $cal(B)$,

$v=v_1 b_1+...+v_r b_r, quad w=w_1 b_1+...+w_r b_r,$

and the calculation on the page is

$v dot w=sum_(i=1)^r v_i w_i=[v]_cal(B) dot [w]_cal(B).$

For two orthonormal bases $cal(B),cal(C)$,
$S_(cal(C)->cal(B))$ has $(i,j)$ entry $c_j dot b_i$ and
$S_(cal(B)->cal(C))$ has transpose entry $b_i dot c_j$.  Hence

$S_(cal(C)->cal(B))=S_(cal(B)->cal(C))^T=S_(cal(B)->cal(C))^(-1),$

so $S_(cal(B)->cal(C))$ is orthogonal.

== Problem 4

The submitted answers are:

- (a) True. $("ker" A)^perp="im" A^T$, from
  $"ker"(A^T)=("im" A)^perp$ and double orthogonal complement.
- (b) True. $"ker" A="ker"(A^T A)$, then rank-nullity gives
  $"rank" A="rank"(A^T A)$.
- (c) True. $"ker"(A^T)=("im" A)^perp$ and rank-nullity yield
  $"rank" A="rank"(A^T)$.
- (d) True. With (b), (c), and $(A^T)^T=A$,
  $"rank"(A^T A)="rank"(A A^T)$.
- (e) False. $"dim"("ker" A)=m-"rank" A$ but
  $"dim"("ker" A A^T)=n-"rank" A$; if $n != m$ they cannot be equal.

== Problem 5

=== (a)

For $X={x_1,dots,x_r}$, $Y={y_1,dots,y_s}$ and $X perp Y$,

$x=sum a_i x_i, quad y=sum b_j y_j$

implies $x dot y=0$, because every $x_i dot y_j=0$.  Thus
$"span" X perp "span" Y$.

=== (b)

For a relation

$sum a_i x_i+sum b_j y_j=0,$

if coefficients on both sides are nonzero then the equal nonzero vectors
would belong to $"span" X inter "span" Y$.  But (a) and WS 16 give this
intersection as $0$.  Hence all coefficients vanish and $X union Y$ is
linearly independent.

=== (c)

A pairwise orthogonal set with fewer than $n+1$ members is not maximal:
append $0$, use Gram--Schmidt, and add a new unit vector.  A set with more
than $n+1$ members would make $Y union {0}$ linearly independent in $bR^n$,
which is impossible.  Therefore a maximal pairwise orthogonal set has
exactly $n+1$ elements.

== Problem 6

=== (a)

The source applies Gram--Schmidt to full-rank $A$ to obtain an orthonormal
basis, reverses the chosen basis, and uses a QR
factorization.  It then sets

It takes the orthonormal basis matrix and the transpose of the upper factor,
obtaining the stated QL factorization.  The resulting lower factor is
triangular with positive diagonal.

=== (b)

The finished submission stops after the construction for (a); no visible
proof for part (b) appears in the source PDF.
