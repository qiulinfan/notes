#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Source: Homework/395-hw-12.pdf pp.1-5 (personal work).
= HW 12

== Problem A

Let $S$ be bounded, let $A$ be the interior of $S$, and let bounded $f:S->RR$ be Riemann integrable on $S$. Since $D_(f|A) subset D_f$, Lebesgue's criterion makes $f$ integrable on $A$. Also $partial A subset partial S$. Split the complement of $A$ in $S$ into its isolated points, its non-isolated discontinuities, and its non-isolated continuity points. The first is countable; the second has measure zero; on the third, $f$ has limiting value $f(x_0)$ and the integral over the set is zero. Hence the integral over the complement is $0$, so the integrals over $A$ and $S$ agree. If $S$ is Jordan measurable, then $m(partial A)<=m(partial S)=0$, and $m(A)=m(S)$.

== Problem B

For $B_a^n(x)$, polar coordinates give its volume as $Gamma_n a^n$. The spherical-coordinate Jacobian recorded is $r^(n-1)product_(k=1)^(n-2)sin^k(theta_k)$; integration produces the factor $a^n/n$. Translation has determinant one, giving the formula for all centres. $Gamma_1=2$ and $Gamma_2=pi$. Slicing the unit $n$-ball by one coordinate and using polar coordinates gives $Gamma_n=(2pi/n)Gamma_(n-2)$, hence $Gamma_(2k)=pi^k/k!$ and $Gamma_(2k+1)=2^(k+1)pi^k/(2k+1)!!$.

== Problem C

For $p=(p',p_n)$ with $p_n>0$ and open Jordan measurable $A subset RR^(n-1)$, define $g:A times (0,1)->S$ by $g(a',t)=(1-t)(a',0)+t p$. It is a $C^1$ diffeomorphism. Its derivative is upper triangular with determinant $(1-t)^(n-1)p_n$, so change of variables gives the volume of $S$ as $p_n$ times the volume of $A$ divided by $n$.

== Problem D

The ellipsoid $((x-u)^2/a^2)+((y-v)^2/b^2)+((z-w)^2/c^2)<1$ is the inverse image of the unit ball under $(x,y,z) mapsto ((x-u)/a,(y-v)/b,(z-w)/c)$. The inverse has determinant $a b c$, so its volume is $4pi a b c/3$.

== Problem E

The solid between $z=x^2+2y^2$ and $z=2x+6y+1$ projects to $(x-1)^2+2(y-3/2)^2<13/2$. Translating then using the displayed elliptical polar substitution gives the recorded volume $169sqrt(2)pi/16$.

== Problem F

Integrating $exp(-x^2-y^2)$ over larger and larger disks, polar coordinates give the two-dimensional Gaussian integral as $pi$. Fubini over expanding squares makes this the square of the one-dimensional Gaussian integral, so the integral is $sqrt(pi)$.

== Problem G

$|x|^e$ is integrable over the unit ball iff $e>-n$: decompose the punctured ball into annuli and compare the radial series with $sum_i i^(-(n+e))$. It is integrable outside the closed unit ball iff $e<-n$, by the analogous tail series.

== Bonus

For $f:RR->RR$ differentiable on compact $I$ with $|f'|<=delta$, the mean value theorem gives $|f(I)|<=delta|I|$. If $f in C^1(RR)$, write $A_n=\{x in[-n,n]:f'(x)=0\}$. Uniform continuity of $f'$ lets finitely many short intervals cover $A_n$ so that $f(A_n)$ has arbitrarily small total length. Thus $m(f(A_n))=0$ and $m(f(\{f'=0\}))=0$.
