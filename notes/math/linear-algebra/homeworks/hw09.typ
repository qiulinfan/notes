#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

== Homework 9 — submitted work

= Part A

The assigned exercises are 5.4: 27, 31; and 5.5: 15, 23, 32(a--d).

== 5.4 Exercise 27

The work observes that $S^perp$ means the least-squares error is
orthogonal to $S$.  Thus, for the displayed vector, the least-squares
solution is unchanged:

$x^=mat(7;11).$

== 5.4 Exercise 31

For the three points $(0,3),(1,3),(1,6)$, the line of best fit uses

$A=mat(1,0;1,1;1,1), quad b=mat(3;3;6).$

The normal equations recorded in the submission are

$mat(3,2;2,2)mat(c_0;c_1)=mat(12;9),$

and solving them gives $c_0=3$ and $c_1=3/2$.  Hence the submitted line is

$f(x)=3+3x/2.$

== 5.5 Exercise 15

For the bilinear expression in the exercise, symmetry requires $b=c$.
The submitted positive-definiteness test yields the additional condition

$d>b^2.$

== 5.5 Exercise 23

With

$angle(f,g)=1/2(f(0)g(0)+f(1)g(1)),$

the answer verifies the inner-product properties and gives the orthonormal
basis

$1, quad 2x-1.$

== 5.5 Exercise 32

For the weighted integral inner product

$angle(f,g)=1/2 integral_(-1)^1 f(t)g(t) dif t,$

the computation in the submitted pages records

when $n+m$ is even, and

$angle(t^n,t^m)=1/(n+m+1)$

when $n+m$ is odd.  Also $norm(t^n)=sqrt(1/(2n+1))$.  Applying Gram--Schmidt, it writes

$g_0=1, quad g_1=sqrt(3)t, quad
g_2=sqrt(5/2)(3t^2-1),$

$g_3=1/sqrt(4/175)(t^3-3/5t).$

The associated polynomial sequence is recorded as

$1, quad t, quad (3t^2-1)/2, quad (5t^3-3t)/2.$

= Part B

== Problem 1

The submitted solution finds the plane of best fit for the three displayed
points by writing its normal-equation system.  Its computed coefficient
vector is

$mat(7/3;1;-8/3),$

which is also plotted on the graph in the original submission.

== Problem 2

=== (a)

For (i), the proposed expression is not an inner product: the work uses

$f(x)=x^2-4x+3,$

which is nonzero while $f(1)=f(3)=0$.  For (ii), it verifies the
nonnegativity and definiteness of the sum-of-squares evaluation expression,
and concludes that it is an inner product.

=== (b)

For (i), the weighted integral with weight $x$ fails positive definiteness;
the submission gives $f(x)=sin(x)$ as the counterexample.  For (ii), the
weight $x^2$ gives the required symmetric, bilinear, positive-definite
inner product.

== Problem 3

Let

$angle(f,g)=integral_(-pi/2)^(pi/2) f(x)g(x)sin^2(x) dif x.$

=== (a)

The work finds $angle(1,x)=0$ and $norm(1)=sqrt(pi/2)$, then evaluates the
remaining displayed polynomial inner products to prepare Gram--Schmidt.

=== (b)

The submitted orthonormalized functions are recorded approximately as

$u_1=2/sqrt(pi), quad u_2=0.974x, quad
u_3=(x^2-4.435)/15.8376.$

=== (c)

For $f(x)=e^x$, the work records

$"proj"_W(f)=1.7521u_1+0.2492u_2-8.1697u_3$

and, after expansion,

$"proj"_W(f) approx 3.3472+0.0236x-0.5142x^2.$

// TODO (217-Hw-9-finished.pdf, pp. 12--14): Part B Problem 3(d--e) is
// assigned/visible as prompt context, but no submitted response for it is
// visible in the finished-PDF pages.
