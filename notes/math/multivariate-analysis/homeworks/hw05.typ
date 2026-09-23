#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Source: Homework/395-hw-05.pdf pp.1-5 (personal work).
= HW 5

== Problem A

For $F:RR^3->RR^3$,

$F(x,y,z)=(exp(x^2+2y^2),sin(z^2-y^2)(x^2+2z^2),(x^2+y^2+z^2)^9)$,

each component is a composition or product of smooth elementary functions, hence $F$ is differentiable. Factor $F=F_2 o F_1$ with $F_1(x,y,z)=(x,x^2+2y^2,x^2+2z^2)$ and $F_2(a,b,c)=(exp(a),b sin(c),(a+b)^9)$. The displayed $D F_1$ has third row equal to half the difference of the second and first rows, so $op("det") D F_1=0$. Chain rule gives $op("det") D F=0$.

== Problem B

If differentiable maps $F:A subset RR^n->B subset RR^m$ and $G:B->A$ are inverse, then $D G(F x) D F(x)=I_n$ and $D F(G y) D G(y)=I_m$. Both products being identities forces $n=m$ and $D F(a)^(-1)=D G(b)$ when $F(a)=b$.

== Problem C

$f(x)=x^3$ is a differentiable homeomorphism of $RR$, but $f^(-1)(x)=root(3,x)$ is not differentiable at $0$.

== Problem D

If $F:RR^2->RR$ is continuous at $0$ and the iterated limits exist, each equals $F(0,0)$. For example, define $F(h,k)=(h^2-k^2)/(h^2+k^2)$ away from $(0,0)$ and $0$ there. Then $lim_(h->0)lim_(k->0)F(h,k)=1$ while the reversed order is $-1$.

== Problem E

The number of four-variable monomials of degree at most $10$ is $binom(14,4)=1001$ (the red working also sums $sum_(k=0)^10 binom(k+3,3)$).

== Problem F

If $A subset RR^n$ is open and connected, $F:A->RR^m$ is differentiable, and $D F=0$ on $A$, then $F$ is locally constant: join nearby $x,y$ by coordinate segments inside a small ball and use the one-variable mean value theorem on each segment. The set $\{x:F(x)=F(a)\}$ is both open and closed in $A$, hence is all of $A$.

== Problem G

Leibniz's formula was proved by induction:

The displayed Leibniz formula differentiates the product of $f_1$ through $f_m$: $partial^k(f_1 f_2)=sum_(|alpha|=k) k!/alpha! partial^(alpha_1)f_1 partial^(alpha_2)f_2$, with the same multi-index distribution among all factors.

Differentiating the $k$ case and grouping every new multi-index $beta$ with $|beta|=k+1$ gives coefficient $sum_i k! beta_i/beta!=(k+1)!/beta!$.

== Problem H

Let $T_k$ be the degree-$k$ Taylor polynomial centered at $x_0$. For the backward direction, Taylor's theorem writes $T_k(x)-f(x)$ as a remainder whose terms have $|alpha|=k+1$; bounding each monomial by $norm(x)^(k+1)$ gives the required little-$o$ statement.

For the forward direction, the submitted work writes $f(x)-P(x)=c_1x^(alpha^(1))+...+c_m x^(alpha^(m))$ and seeks to show the quotient by $norm(x)^k$ does not tend to zero. In Case 1, $sum_i c_i != 0$, it chooses $x_n=(t_n,...,t_n)$ with $t_n=1/n$ and obtains a nonzero constant quotient. Case 2, $sum_i c_i=0$, ends with “idk”. A subsequent attempted route states that a nonzero homogeneous polynomial of degree $k$ is not $o(norm(x)^k)$, using $x_n=t_n x_0$; it then notes that a degree-$k$ polynomial need not be homogeneous.

// TODO(source: 395-hw-05.pdf p.3, Problem H, forward direction Case 2): the handwritten work ends “idk”; no completed argument is present.

== Problem I

For $F(x,y)=f(x^2+y^2)$, chain rule gives $F_x=2x f'(x^2+y^2)$ and $F_y=2y f'(x^2+y^2)$, hence $x F_y=y F_x$. For the displayed composition problem, write $phi=phi_m o phi_n$ and apply the chain rule. At $(1,1,1)$ with $f=x^2+y z$, $g=y^3+x y$, $h=e^x$, both the formula and direct computation give

$D phi(1,1,1)=((2e^2+2,4,2),(0,1,4)).$

== Problems J and K

For the specified $f:RR^2->RR^3$ and $g:RR^3->RR^2$, the chain-rule calculation records $D(g o f)(0)=((6,13),(6,2))$. The third order Taylor polynomial of $e^(x+y^2)$ at $0$ is

$1+x+x^2/2+y^2+x y^2+x^3/6$.

== Positive definite matrices

For a real symmetric matrix $A$, positive definiteness implies invertibility and $x^T A x>0$, so the angle of $A x$ with $x$ is acute. Conversely, the acute-angle condition gives $x^T A x>0$. In an orthonormal eigenbasis, $x^T A x=sum lambda_i c_i^2$, proving positive definiteness iff every eigenvalue is positive. Each leading principal minor inherits positive definiteness; the forward direction of Sylvester's criterion follows. The submitted converse attempt is marked “didn't work at all.”

// TODO(source: 395-hw-05.pdf p.5, Positive definite matrices, Sylvester criterion converse): the handwritten attempt is explicitly marked “didn't work at all”; no completed proof is present.
