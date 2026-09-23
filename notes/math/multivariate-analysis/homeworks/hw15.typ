#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Source: Homework/395-hw-15.pdf pp.1-3 (personal work).
= HW 15

== Problem A

There is no injective smooth $f:RR^n->RR^m$ for $n>m$. The proof first records the constant rank theorem: if $D f$ has constant rank $r$ near $x_0$, choose a nonsingular $r times r$ minor and set $phi(x)=(f_1(x),...,f_r(x),x_(r+1),...,x_n)$. IFT makes $phi$ a local diffeomorphism. In these coordinates $f o phi^(-1)(v)=(v_1,...,v_r,g_(r+1)(v),...,g_m(v))$; the rank calculation makes the partial derivatives of the $g$ terms in the last variables zero. A target coordinate change then gives $(v_1,...,v_r,0,...,0)$.

For the claimed non-injectivity, lower semicontinuity and the finite set of possible ranks make rank locally constant on some neighbourhood. The normal form is not injective when $n>m$, and composing with local diffeomorphisms preserves this contradiction.

== Problem B

For continuous compactly supported $f,g:RR^n->RR$, define convolution by $(f*g)(x)$ equal to the integral of $f(x-y)g(y)$ over $RR^n$. On a product box containing both supports, Fubini and the substitution $z=x-y$ give

the integral of $f*g$ equals the product of the integrals of $f$ and $g$.

The same substitution proves $f*g=g*f$. Applying Fubini twice shows

The iterated-integral calculation has integrand $f(x-y-z)g(z)h(y)$ and yields $((f*g)*h)(x)=(f*(g*h))(x)$,

so convolution is associative.

== Problem C

For $f(x,y)=4x^2+10y^2$ on $x^2+y^2<=4$, the only interior critical point is $(0,0)$, where $f=0$. On the boundary, $f=16+6y^2$, so the maximum is $40$ at $(0,2)$ and $(0,-2)$. Thus the minimum is $0$ at $(0,0)$.

== Problem D

Of $f(x,y)=3x_1y_2+5x_2x_3$, $g(x,y)=x_1y_2+x_2y_4+1$, and $h(x,y)=x_1y_1-7x_2y_3$, only $h$ is a tensor: the first has a quadratic factor in $x$, and the second has a constant term. In the elementary dual basis,

$h=e^1 \otimes e^1-7e^2 \otimes e^3.$

== Problem E

For a vector space $V$, $L^k(V)$ is a vector space under pointwise addition and scalar multiplication: the displayed verification checks linearity in each argument, the zero map, additive inverses, commutativity, associativity, and distributivity.

== Problem F

For the cycle taking $1$ to $2$ through $k$ and $k$ back to $1$, write it as $k-1$ transpositions, so its sign is $(-1)^(k-1)$.

== Problem G

If $T:V->W$ is linear and $f in A^k(W)$, then $T^*f(v_1,...,v_k)=f(T v_1,...,T v_k)$ is multilinear. For a permutation $sigma$, substituting the permuted arguments gives $T^*f(v_(sigma(1)),...,v_(sigma(k)))$ equal to the sign of $sigma$ times $T^*f(v_1,...,v_k)$, so $T^*f in A^k(V)$.

== Problem H

For the elementary alternating tensor $phi_I$ on $RR^n$, with $I=(i_1,...,i_k)$ and column matrix $X=[x_1 ... x_k]$,

$phi_I(x_1,...,x_k)$ is the sum over permutations of the sign of $sigma$ times the corresponding product of the selected coordinates, and equals $op("det") X_I$,

the determinant expansion of the submatrix whose rows are indexed by $I$.

== Bonus

The printed bonus gives the definition of a real analytic function, a binomial-series exercise, radius of convergence $R=1/limsup |c_n|^(1/n)$, convergence properties, coefficient bounds, and differentiation of a power series. The source page contains no handwritten solution for these printed bonus parts.

// TODO(source: 395-hw-15.pdf p.3, Bonus): only the printed questions are present; there is no handwritten solution to transcribe.
