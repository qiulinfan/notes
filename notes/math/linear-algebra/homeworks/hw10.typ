#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

== Homework 10 — submitted work

= Part A

The assigned exercises are 6.1: 20, 54; 6.2: 42, 50; 6.3: 14; and
7.1: 12, 18, 42.

== 6.1 Exercise 20

By the row operations shown in the submission, the determinant of the
given $k times k$ matrix reduces to

$det(A)=1$

for every $k$.

== 6.1 Exercise 54

The answer uses positivity to conclude that the determinant of the displayed
$5 times 5$ matrix is positive, and records

$det(A)=1000.$

== 6.2 Exercise 42

For a QR factorization $A=Q R$, the submission writes

$det(A^T A)=det(R^T Q^T Q R)=det(R)^2,$

so the determinant is positive.

== 6.2 Exercise 50

For the matrix whose $(i,j)$ entry is $min(i,j)$, repeated determinant
reduction gives

$det(A)=1.$

== 6.3 Exercise 14

The parallelepiped volume is found from the determinant.  Since the
displayed vectors are linearly dependent, the result is

$"volume"=0.$

== 7.1 Exercise 12

For

$A=mat(2,0;3,4),$

the characteristic equation gives eigenvalues $2$ and $4$.  The corresponding
eigenvector directions in the work are

$lambda=2: mat(-2/3;1), quad lambda=4: mat(0;1).$

Thus it diagonalizes to $D=mat(2,0;0,4)$.

== 7.1 Exercise 18

For reflection in a plane, the plane is the $1$-eigenspace and has dimension
two; its normal direction is the $-1$-eigenspace.  With an eigenbasis, the
submitted diagonal form is

$mat(1,0,0;0,1,0;0,0,-1).$

== 7.1 Exercise 42

The matrices in $V$ are written as

$mat(a,b,0;0,c,0;0,d,e).$

The five matrix units in positions $(1,1),(1,2),(2,2),(3,2),(3,3)$ form the
submitted basis, so

$dim(V)=5.$

= Part B

== Problem 1

The proof shows that an alternating bilinear form $F$ is antisymmetric:

$F(u+v,u+v)=0=F(u,v)+F(v,u).$

Conversely, antisymmetry gives $F(u,u)=0$.  Since $F(e_1,e_2)=1$, bilinearity
then identifies the form with the determinant:

$F(mat(a;b),mat(c;d))=a d-b c.$

== Problem 2

Let $M=mat(a,b;c,d)$ and let $T(A)=A M$.  The submission verifies linearity.
In the ordered basis

$cal(E)=(E_11,E_12,E_21,E_22),$

it computes

$[T]_cal(E)=mat(a,c,0,0;b,d,0,0;0,0,a,c;0,0,b,d).$

The determinant calculation is

$det([T]_cal(E))=(a d-b c)^2,$

which agrees with the determinant in any other basis.  Finally, for

$M=mat(2,1;0,2),$

the only eigenvalue is $2$, with an eigenspace of dimension $2<4$ for the
induced map; therefore the submitted conclusion is that $T$ is not
diagonalizable.

== Problem 3

The construction defines $z$ by the determinant/cross-product functional in
$RR^4$.  For the standard choice $u=e_1$, $v=e_2$, $w=e_3$, the work finds

$z=-e_4.$

It proves that $z=0$ exactly when $u,v,w$ are linearly dependent, that $z$
is orthogonal to each of $u,v,w$, and that

$det(z,u,v,w)=norm(z)^2.$

== Problem 4

The response uses the characteristic polynomial to find eigenvalues, and
uses similarity to preserve the polynomial.  It then applies the displayed
eigenvector criterion to decide diagonalizability.

== Problem 5

For a $2 times 2$ matrix satisfying $A^2=I$, the submission separates the
$+1$ and $-1$ eigenvector cases and obtains a diagonal form.  The final
argument extends this to every dimension by decomposing an arbitrary vector
as

$v=1/2(v+A v)+1/2(v-A v),$

where the two summands lie in the $1$- and $-1$-eigenspaces respectively.
Thus $A$ is diagonalizable.
