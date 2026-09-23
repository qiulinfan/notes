#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let ar = x => x
#let bC = math.bb("C")

= Complex eigenvalues

== WS 26, p. 1: complex roots and real $2 times 2$ matrices

P5(b). Let $z=a+b i$ and $w=c+d i$. Then
$
z+w=(a+c)+(b+d)i,
$
$
$z w=(a c-b d)+(b c+a d)i$,
$
$
"conjugate"(z) "conjugate"(w)=(a-b i)(c-d i)
=a c-b d-(b c+a d)i="conjugate"(z w).
$

(c) Fact: $lambda$ is a root of $f(x)$ iff $ar(lambda)$ is a root when the
coefficients of $f(x)$ are real. If
$lambda^n+a_(n-1)lambda^(n-1)+dots+a_0=0$, then
$
sum_k a_k ar(lambda)^k
="conjugate"(sum_k a_k lambda^k)=0.
$

For
$
A=mat(a,-b;b,a) in bR^(2 times 2),
$
$
chi_A(lambda)=(a-lambda)^2+b^2,
quad
chi_A(lambda)=0 arrow.r lambda=a plus.minus b i.
$

(b) Factor $A$ into a scalar matrix $r I_2$ and a rotation matrix $R_theta$:
$
A=sqrt(a^2+b^2)mat(cos(theta),-sin(theta);sin(theta),cos(theta)),
$
where
$
cos(theta)=a/sqrt(a^2+b^2),
quad
sin(theta)=b/sqrt(a^2+b^2),
quad
theta=arctan(b/a).
$

(c) Diagonalization over $bC$:
$
D=mat(a+b i,0;0,a-b i).
$
For $lambda_1=a+b i$,
$
"det"(A-lambda_1 I_2)="det"(mat(-b i,-b;b,-b i)),
$
so $mat(i;1)$ is a basis for $E_(lambda_1)$; similarly
$mat(-i;1)$ is a basis for $E_(lambda_2)$. Hence
$
D=S^(-1) A S
=mat(i,-i;1,1)^(-1) A mat(i,-i;1,1),
$
and
$
A=mat(i,-i;1,1)mat(a+b i,0;0,a-b i)mat(i,-i;1,1)^(-1).
$

P9: 任何有一对 complex eigenvalue $a plus.minus b i$ 的
$A in bR^(2 times 2)$ 都 similar to
$mat(a,-b;b,a)$（一个 scaling matrix）. 因为 $A$ diagonalizable:
$D=mat(a+b i,0;0,a-b i)$，而 $D$ 又 similar to $mat(a,-b;b,a)$ by P8.
