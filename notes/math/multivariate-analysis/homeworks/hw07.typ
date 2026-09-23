#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Source: Homework/395-hw-07.pdf pp.1-4 (personal work).
= HW 7

== Problem A

For differentiable $f:A subset RR^n->RR$ and unit $u$, $D_u f(x)=D f(x)u=nabla f(x) dot u$. Cauchy-Schwarz gives $D_u f(x)<=||D f(x)||$, with equality precisely for $u=D f(x)/||D f(x)||$. Also $D_u f(x)=0$ iff $u$ is orthogonal to $D f(x)$.

== Problem B

Let $M=c^(-1)(0)$, $f:U->RR$, $c:U->RR$ be $C^1$, $f|_M$ have a local minimum at $p$, and $D c(p)$ be surjective. Reorder coordinates so $partial c/partial x_n(p)!=0$. By IFT, locally $M=\{(x,g(x)):x in B_e(a)\}$. For $h(x)=f(x,g(x))$, $D h(a)=0$. Differentiating $c(x,g(x))=0$ gives $g_(x_i)=-c_(x_i)/c_(x_n)$, hence $f_(x_i)(p)-f_(x_n)(p)c_(x_i)(p)/c_(x_n)(p)=0$ for every $i$. Put $lambda=f_(x_n)(p)/c_(x_n)(p)$; then $D f(p)=lambda D c(p)$.

== Problems C-D

The intuitive explanation says that at a constrained minimum the gradient of $f$ is normal to all allowed directions, while $D c(p)$ is normal to $M$, so the two gradients are parallel. For $f(x,y)=3x+y$ on $x^2+y^2=1$, $D f=(3,1)=lambda(2x,2y)$. The critical points are $(3/sqrt(10),1/sqrt(10))$ and its negative; the minimum is $-sqrt(10)$ at $(-3/sqrt(10),-1/sqrt(10))$.

== Problem E

For $c:U->RR^k$ with full rank $D c(p)=k$, the stated generalization is $D f(p)=sum_(i=1)^k lambda_i D c_i(p)$. Split variables as $(x,y)$ with a nonsingular $partial c/partial y$ block. IFT writes $M$ locally as $(x,g(x))$. The identities $D h(a)=0$ and $D(c(x,g(x)))=0$ combine to give $D f(p)=(partial f/partial y)(partial c/partial y)^(-1)D c(p)$.

== Problem F

Positive definite symmetric matrices form an open subset of symmetric matrices. For $A>0$, the quadratic form $x^T A x$ has positive minimum $m$ on the compact unit sphere. If $||A-B||<m$, then $x^T B x=x^T A x+x^T(B-A)x>=m-||B-A||>0$ on the sphere, and hence for all nonzero $x$.

== Problem G

If $f in C^2(A)$, $x_0$ is critical, and $H_f(x_0)$ is positive definite, continuity of the Hessian makes $H_f$ positive definite near $x_0$. Taylor's formula along the segment gives $f(x)-f(x_0)=1/2 (x-x_0)^T H_f(c)(x-x_0)>0$ for nearby $x!=x_0$; hence a strict local minimum.

== Problem H

For an invertible matrix $A$ with cofactor matrix $C$, the diagonal entry $(A C^T)_(i j)$ equals $op("det") A$ when $i=j$ by cofactor expansion. For $i!=j$, replace row $j$ by row $i$ to obtain a matrix with determinant $0$ whose cofactor expansion is $(A C^T)_(i j)$. Thus $A C^T=(op("det") A)I$, so $A^(-1)=C^T/(op("det") A)$.

== Problem I

For differentiable $f,g:(a,b)->RR^n$, $(f dot g)(t)=sum_i f_i(t)g_i(t)$, and differentiating term by term gives $(f dot g)'=f' dot g+f dot g'$.

== Bonus

The epigraph of $f$ is convex iff $H_f(x)$ is positive semidefinite everywhere. For the forward direction, restrict $f$ to $x+t v$; convexity gives its second derivative $v^T H_f(x)v>=0$. For the converse, the same one-variable restriction has nonnegative second derivative, hence is convex, and this is exactly the epigraph inequality.
