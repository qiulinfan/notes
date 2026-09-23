#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

== Homework 1 — submitted work

#note[Visual transcription of the personal finished submission. Source: `217-Hw-1-finished.pdf`; page references below are PDF pages.]

=== Source p. 1 — Exercise 20

Find the values of $k$ for which the system has infinitely many solutions, no solution, or one solution:

$mat(1,1,-1;1,2,1;1,1,k^2-5)x=mat(2;3;k)$.

The submitted row reduction is $mat(1,1,-1,2;1,2,1,3;1,1,k^2-5,k) arrow mat(1,1,-1,2;0,1,2,1;0,0,k^2-4,k-2) arrow mat(1,0,-3,1;0,1,2,1;0,0,k^2-4,k-2)$. For infinitely many solutions, the final row must be zero, so $k^2-4=0$ and $k-2=0$. Thus $k=2$.

=== Source p. 2 — Exercise 20; Exercise 32 begins

For no solution, $k^2-4=0$ while $k-2 != 0$, hence $k=-2$. For one solution, $k != -2$ and $k != 2$, namely $(-infinity,-2) union (-2,2) union (2,infinity)$.

Exercise 32 asks for a polynomial of degree at most two, $f(t)=a+b t+c t^2$, passing through $(1,p)$, $(2,q)$, and $(3,r)$. The submitted equations are $a+b+c=p$, $a+2b+4c=q$, and $a+3b+9c=r$.

=== Source p. 3 — Exercise 32

The augmented matrix is reduced as $mat(1,1,1,p;1,2,4,q;1,3,9,r) arrow mat(1,1,1,p;0,1,3,q-p;0,2,8,r-p)$, giving $a=3p-3q+r$, $b=-5p/2+4q-3r/2$, and $c=p/2-q+r/2$. Therefore a polynomial exists for all choices of $p$, $q$, and $r$.

=== Source p. 4 — Exercise 34

Find a polynomial of degree at most two which passes through $(1,1)$ and $(2,0)$ and satisfies $integral_1^2 f(t) dif t=-1$. The submitted system is $a+b+c=1$, $a+2b+4c=0$, and $a+3b/2+7c/3=-1$, with its augmented matrix set up for row reduction.

=== Source p. 5 — Exercise 34; Exercise 44

The reduction for Exercise 34 ends at $mat(1,0,0,20;0,1,0,-28;0,0,1,9)$, so the submitted answer is $f(t)=20-28t+9t^2$.

For Exercise 44, the line through $(1,1,1)$ and $(3,5,0)$ has direction $mat(2;4;-1)$. The submitted vector equation is $mat(x;y;z)=mat(1;1;1)+t mat(2;4;-1)$, or $x=1+2t$, $y=1+4t$, $z=1-t$, for arbitrary $t$. Its equations are $2x-y=-3$ and $x+2z=3$.

=== Source p. 6 — Exercise 12

The homogeneous augmented matrix recorded is $mat(2,0,-3,0,7,7,0;-2,1,6,0,-6,-12,0;0,1,-3,0,1,5,0;0,-2,0,1,1,1,0;2,1,-3,0,8,7,0)$. The first displayed operation divides the first row by $2$ before continuing the row reduction.

=== Source p. 7 — Exercise 12

The submitted reduction clears the first column, then the second column. Its displayed intermediate rows include $mat(1,0,-3/2,0,7/2,7/2,0;0,1,-3,0,1,5,0;0,-2,0,1,1,1,0;0,1,0,0,1,0,0)$, followed by clearing the remaining pivot columns.

=== Source p. 8 — Exercise 12

The final reduced matrix is $mat(1,0,0,0,7/2,1,0;0,1,0,0,1,0,0;0,0,1,0,0,-5/3,0;0,0,0,1,3,1,0;0,0,0,0,0,0,0)$. Setting $x_5=t$ and $x_6=r$, the submission gives $mat(x_1;x_2;x_3;x_4;x_5;x_6)=mat(7t/2+r;-t;5r/3;-3t-r;t;r)=t mat(7/2;-1;0;-3;1;0)+r mat(1;0;5/3;-1;0;1)$.

=== Source p. 9 — Exercise 36

For a vector $p$ perpendicular to $mat(1;3;-1)$, let $p=mat(a;b;c)$. The condition is $a+3b-c=0$. Setting $b=t$ and $c=r$ gives $p=mat(-3t+r;t;r)$, where $t$ and $r$ are arbitrary real numbers.

=== Source p. 10 — Exercise 44

For the traffic-flow diagram, the submitted equations are $300+x=400+y$, $300+w=320+x$, $150+120=w+z$, and $y+z+100=250$. They are rearranged as $x-y=100$, $w-x=20$, $w+z=270$, and $y+z=150$.

=== Source p. 11 — Exercise 44

The submitted row reduction reaches $mat(1,0,0,1,270;0,1,0,1,250;0,0,1,1,150;0,0,0,0,0)$. The free variable is recorded as $z=t$.

=== Source p. 12 — Exercise 44

The submitted solution is $mat(w;x;y;z)=mat(270-t;250-t;150-t;t)$. Nonnegativity gives $0 <= t <= 150$. The recorded flow ranges are $w in [120,270]$, $x in [100,250]$, $y in [0,150]$, and $z in [0,150]$.

=== Source p. 13 — Problem 1(a)--(c)

(a) True: “2 is even” and “3 is odd” are true, hence their disjunction is true.

(b) True: $217=7 times 31$, so the conclusion is true; an if--then statement is true regardless of the truth value of its hypothesis.

(c) False: the derivative claim is true, but the submitted work states that $tan(pi/6)=sqrt(3)$ is false; thus the biconditional is false.

=== Source p. 14 — Problem 1(d)--(e); Problem 2(a)

(d) True: the premise “there are infinitely many even primes” is false, since the only even prime is $2$, so the implication is true.

(e) True: each right triangle has two acute angles and every positive real number has a positive cube root; the implication is true.

For Problem 2(a), the table in the submission says that a proof proves nothing for a universal statement and that an existential statement is true; a counterexample proves a universal statement false and proves nothing for an existential statement.

=== Source p. 15 — Problem 2(b)--(d)

(b) True: every prime integer is either even or odd.

(c) False: $2$ is a prime which is even, so not every prime is odd; $3$ is a prime which is odd, so not every prime is even. Hence the asserted “or” is false.

(d) False: the submitted contradiction uses $x=n-1$ to refute the stated universal claim.

=== Source p. 16 — Problem 2(e)--(g)

(e) True: the submitted argument chooses the integer immediately above $x$, so there is an integer $n>x$. [TODO(217-Hw-1-finished.pdf, p. 16): one handwritten bracket symbol in the displayed floor/ceiling argument is not visually unambiguous.]

(f) True: every square is a rectangle.

(g) False: $4$ has two square roots, $2$ and $-2$, which disproves the uniqueness statement.

=== Source p. 17 — Problem 3

The submitted negations are:

- (a) 2 is not even and 3 is not odd.
- (b) the Riemann hypothesis is true and 217 is prime.
- (c) the derivative is not $2x$ or $tan(pi/6) != sqrt(3)$.
- (d) there are infinitely many even primes, and 10 is not even or $10^10$ is not odd.
- (e) every right triangle in $RR^2$ has two acute angles, and some real number has no positive cube root.
- (f) $forall n in NN$ there exists $x in RR$ with $x >= n$.
- (g) all squares are not rectangles.

=== Source p. 18 — Problem 4

The submitted converses and contrapositives are:

- (a) Converse: “If something exists, it can think.” Contrapositive: “If something does not exist, it cannot think.”
- (b) Converse: “If $p^2$ is irrational, then $p$ is irrational.” Contrapositive: “If $p^2$ is not rational, then $p$ is not rational.”
- (c) Converse: “If $n^2+1$ is prime, then $n$ is a natural number greater than 2 such that its Collatz sequence does not reach 1.” The contraposition is also written in terms of $n^2+1$ not being prime and the alternatives concerning $n$ and its Collatz sequence.

=== Source p. 19 — Problem 5

(a1) The set is all odd natural numbers. (a2) The graph is the right half of the unit circle centred at the origin, including the boundary.

(b1) The submitted set notation is `{(x,y,z) in RR^3 : x^2+y^2+z^2=1}`. (b2) The submitted set notation is `{sqrt(2)n : n in ZZ}`.

(c) The submitted truth values are: $sqrt(2) in RR$ true; $sqrt(2) subset RR$ false; `{sqrt(2)} in RR` false; `{sqrt(2)} subset RR` true; $emptyset in RR$ false; $emptyset subset RR$ true; $emptyset in emptyset$ false; and $emptyset subset emptyset$ true.

=== Source p. 20 — Problem 6(a)

The submitted lists are `1/2 NN = {1/2,1,3/2,2,5/2,3,...}`, `1/3 NN = {1/3,2/3,1,4/3,5/3,2,...}`, and `3NN = {3,6,9,12,15,18,...}`. It records `1/2 NN intersect 1/3 NN = NN`, and writes the union beginning `{1/3,1/2,2/3,1,4/3,3/2,...}`. It also gives `1/2 NN without 1/3 NN = {1/2,3/2,5/2,7/2,9/2,11/2,...}` and `(3NN)^c = NN without 3NN = {1,2,4,5,7,8,10,...}`.

=== Source p. 21 — Problem 6(b)

The claimed least $n$ is $6$. For $x in 1/2 NN union 1/3 NN$, the submission writes $x=(3m+2p)/6$ (with one of $m,p$ allowed to be zero), proving inclusion in $1/6 NN$. It then rules out $n=1,3,5$ because $1/2$ is not in $1/n NN$, and $n=2,4$ because $1/3$ is not in $1/n NN$.

=== Source p. 22 — Problem 7

Let $F(x,t)$ mean “you can fool $x$ at time $t$.” The submitted formalization of the recreational statement is $(exists t forall x F(x,t)) and (exists x forall t F(x,t)) and not(forall t forall x F(x,t))$.

=== Source p. 23 — Problem 7

Applying De Morgan's law, the submitted negation is $(forall t exists x not F(x,t)) or (forall x exists t not F(x,t)) or (forall t forall x F(x,t))$.

The accompanying English reads: “for all time there are some people you cannot fool, or for some time you can fool no people in the world, or for all time you can fool all people. (You can at least achieve one of three things).”
