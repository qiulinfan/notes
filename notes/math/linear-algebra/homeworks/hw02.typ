#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

== Homework 2 — submitted work

#note[Visual transcription of the personal finished submission. Source: `217-Hw-2-finished.pdf`; page references below are PDF pages.]

=== Source p. 1 — Exercise 26

Let $A$ be a $4 times 3$ matrix and assume $A x=b$ has a unique solution. The submission records $"rank"(A)="rank"(A|b)=3$. For $A x=c$, it begins the two RREF cases.

=== Source p. 2 — Exercise 26; Exercise 34 begins

If $[A:c]$ reduces to a form with three pivots, it has one solution. If it has a row $mat(0,0,0,epsilon)$ with $epsilon != 0$, it has no solution. By Theorem 1.3.1, infinitely many solutions cannot occur because there is no free variable.

Exercise 34 introduces the standard coordinate vectors $e_1,e_2,e_3$.

=== Source p. 3 — Exercise 34

For $A=mat(a,b,c;d,e,f;g,h,k)$, the submitted work writes

$A e_1=mat(a;d;g)=v_1$, $A e_2=mat(b;e;h)=v_2$, and $A e_3=mat(c;f;k)=v_3$.

For a matrix $B$ with columns $v_1,v_2,v_3$, it likewise records $B e_i=v_i$.

=== Source p. 4 — Exercise 48(a)--(b)

(a) If $x_h$ solves $A x=0$ and $x_1$ solves $A x=b$, then
$A(x_1+x_h)=A x_1+A x_h=b+0=b$.

(b) If $x_1$ and $x_2$ solve $A x=b$, then
$A(x_2-x_1)=A x_2-A x_1=b-b=0$; hence $x_2-x_1$ is a homogeneous solution.

=== Source p. 5 — Exercise 48(c)

The drawing places the homogeneous solutions on a line through the origin and the particular solution $x_1$ off that line. The submitted answer is the parallel affine line $x_1+x_h$.

=== Source p. 6 — Exercise 48(c)

The geometric explanation concludes: all solutions form the line parallel to the homogeneous-solution line through the head of $x_1$, with its tail at $0$.

=== Source p. 7 — Exercise 6

For $T:RR^2 arrow RR^3$,

$T mat(x_1;x_2)=x_1 mat(1;2;3)+x_2 mat(4;5;6)$.

The submitted standard matrix is $mat(1,4;2,5;3,6)$, and the work verifies linearity by the definition cited on Worksheet 4.

=== Source p. 8 — Exercise 38; Exercise 44 begins

For Exercise 38,

$T mat(2;-1)=2v_1-v_2$.

The submitted sketch shows this vector combination. Exercise 44 begins with $T(x)$ equal to the cross product of $v$ and $x$.

=== Source p. 9 — Exercise 44

With $v=mat(v_1;v_2;v_3)$ and $x=mat(x_1;x_2;x_3)$, the work expands

$v times x=mat(v_2 x_3-v_3 x_2;v_3 x_1-v_1 x_3;v_1 x_2-v_2 x_1)
=mat(0,-v_3,v_2;v_3,0,-v_1;-v_2,v_1,0) x$.

Thus the submitted matrix for $T$ is $mat(0,-v_3,v_2;v_3,0,-v_1;-v_2,v_1,0)$; the work also verifies addition and scalar multiplication.

=== Source p. 10 — Exercise 46

For $A=mat(a,b;c,d)$ and $B=mat(p,q;r,s)$, $T(x)=B(A x)$. The submitted column computation gives

$T(e_1)=mat(a p+c q;a r+c s)$ and $T(e_2)=mat(b p+d q;b r+d s)$.

Hence the matrix is $mat(a p+c q,b p+d q;a r+c s,b r+d s)$.

=== Source p. 11 — Part B, Problem 1(a)--(b)

(a) $f:[0,4] arrow [0,18]$, $f(x)=x^2+2$, is injective but not surjective. A counterexample to surjectivity is $y=0$. For injectivity, $a^2+2=b^2+2$ implies $a=plus-or-minus b$, and nonnegativity gives $a=b$.

(b) $g:RR arrow RR$, $g(x)=2x-5$, is bijective. Surjectivity uses $x=(y+5)/2$, and $2x_1-5=2x_2-5$ gives injectivity.

=== Source p. 12 — Part B, Problem 1(c)--(d)

(c) $h:RR^2 arrow RR$, $h(x,y)=2x^2+5y^2$, is neither injective nor surjective: $h(1,2)=h(-1,-2)=22$, and no negative number is in its image.

(d) $q:NN arrow NN$ sends odd $n$ to $n$ and even $n$ to $n/2$. It is surjective but not injective: $q(1)=q(2)=1$; for a target $y$, choose $x=y$ when $y$ is odd and $x=2y$ when $y$ is even.

=== Source p. 13 — Part B, Problem 2(a)--(b)

The submitted truth values are (a) false, (b) true, (c) false, (d) false, (e) true.

For (a), take $f:[-2,2] arrow [0,4]$, $f(x)=x^2$, $A=[-2,-1]$, and $B=[1,2]$. Then `A intersect B = emptyset` but $4$ belongs to both images. The proof of (b) begins by contradiction.

=== Source p. 14 — Part B, Problem 2(b)--(c)

For (b), if $A$ and $B$ had a common $a$, then $f(a)$ would lie in both $f[A]$ and $f[B]$, contradicting their disjointness.

For (c), the same squaring map with $A=[0,2]$ gives $f^-1[f[A]]=[-2,2] != A$.

=== Source p. 15 — Part B, Problem 2(d)--(e)

For (d), using the same $f$ and $A=[0,2]$, the submission gets
$f[X without A]=f[-2,0]=[0,4]$, whereas $Y without f[A]=emptyset$.

For (e), it begins the two inclusions for a bijection $f$.

=== Source p. 16 — Part B, Problem 2(e)

If `m in f[A intersect B]`, then $m=f(x)$ for some `x in A intersect B`, so `m in f[A] intersect f[B]`. Conversely, $m=f(x)=f(y)$ with $x in A$ and $y in B$; injectivity gives $x=y$, thus `m in f[A intersect B]`.

=== Source p. 17 — Part B, Problem 3(a)

Assume $f(c x)=c f(x)$. The submission first records $f(0)=0$ and $f(-x)=-f(x)$. If $x+y=0$, additivity follows. Otherwise, writing $c=x+y$ and applying the assumption to $x/(x+y)$ and $y/(x+y)$ gives

$(x+y)f(x+y)=(x+y)(f(x)+f(y))$,

then division yields $f(x+y)=f(x)+f(y)$.

=== Source p. 18 — Part B, Problem 3(b)

The submitted example is $f(x)=norm(x)$. It records $f(c x)=c f(x)$, but says it is not additive: with $x=mat(1;2)$ and $y=mat(2;2)$, the displayed norm values give $f(x+y) != f(x)+f(y)$.

=== Source p. 19 — Part B, Problem 4(a)--(b)

For an additive $f$, $f(0)=f(0)+f(0)$, hence $f(0)=0$; also $f(-x)=-f(x)$.

=== Source p. 20 — Part B, Problem 4(c)--(d) begins

The induction for $f(n x)=n f(x)$ has base case $n=1$ and the inductive step

$f((n+1)x)=f(n x+x)=f(n x)+f(x)=(n+1)f(x)$.

Part (d), for negative integers, begins on this page.

=== Source p. 21 — Part B, Problem 4(d); recreational part (e)

The work completes the negative-integer case using $f(-x)=-f(x)$. For the recreational rational case it concludes that $f(q x)=q f(x)$ for rational $q$, using numerator/denominator multiplication and the preceding integer cases.
