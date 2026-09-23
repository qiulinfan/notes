#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= Use FTC and Tonelli for series
<use-ftc-and-tonelli-for-series>
Let $g_k\,k = 1\,2\,dots.h$, be a sequence of functions that are absolutely continuous on the interval $\[a\,b\]$. Suppose that there is a $c in\[a\,b\]$, such that the series $sum_(k = 1)^oo g_k\(c\)$ is convergent, and

$ sum_(k = 1)^oo integral_a^b lr(|g'_k \( x \)|) d x < oo $

\(a) Show that $sum_(k = 1)^oo g_k\(x\)$ is convergent for all $x in\[a\,b\]$.
(b) Let $f\(x\)= sum_(k = 1)^oo g_k\(x\)$. Show that $f$ is absolutely continuous on $\[a\,b\]$ and

$ f'\(x\)= sum_(k = 1)^oo g'_k\(x\)quad upright(" for almost every ") in\[a\,b\] $
 
 
 
 
 
 
 
 
 

= Use FTC and Holder
<use-ftc-and-holder>
Let $f :\[0\,1\]arrow.r R$ be absolutely continuous, satisfy $f\(0\)= 0$ and $f' in L^2\(\[0\,1\]\)$. Show that

$ lim_(x arrow.r 0 +) x^(- 1\/2) f\(x\) $
exists and determine the value of this limit.
 
 
 
 
 
 
 
 
 

= Use density of compactly supported continuous functions in a suitable space
<use-density-of-compactly-supported-continuous-functions-in-a-suitable-space>
Let $f$ be a real Lebesgue measurable function on the interval $\[0\,1\]$ such that $parallel f parallel_oo < oo$. Show that for any $epsilon\,delta > 0$, there is a continuous function $g$ on $\[0\,1\]$ such that $m { x in\[0\,1\]:\|f\(x\)- g\(x\)\|> epsilon } < delta$.
 
 
 
 
 
 
 
 
 

= Use one of the convergence theorems
<use-one-of-the-convergence-theorems>
Let A be a sequence of measurable subsets of $\[0\,1\]$ such that $inf m (A_n) > 0$, where $m$ stands for the Lebesgue measure.
(a) Prove that there exists $x in\[0\,1\]$ which belongs to infinitely many of the sets $A_n$.
(b) Does there necessarily exist a point which belongs to any of the sets $A_n$, except finitely many?  
 
 
 
 
 
 
 
 

= How can we recover E from its indicator function
<how-can-we-recover-e-from-its-indicator-function>
Let $E subset bb(R)^1$. Show that the characteristic function $chi_E\(x\)$ is the limit of a sequence of continuous functions if and only if $E$ is both $F_sigma$ and $G_delta$\. 
 
 
 
 
 
 
 
 

= be an artisan
<be-an-artisan>
Let $f :\[0\,1\]arrow.r bb(R)$ be a positive function of bounded variation.
(a) Show that if $inf\(f\)> 0$, then the function $g\(x\)= 1\/f\(x\)$ is also of bounded variation on $\[0\,1\]$.
(b) Give an example of a positive function $f :\[0\,1\]arrow.r bb(R)$ of bounded variation such that $g\(x\)= 1\/f\(x\)$ is integrable but not of bounded variation. 
 
 
 
 
 
 
 
 

= Use a suitable theorem allowing you to differentiate $exp\(g\)$ under the integral sign
<use-a-suitable-theorem-allowing-you-to-differentiate-exp-g-under-the-integral-sign>
Let $f$ be a real Lebesgue measurable function on the interval $\[0\,1\]$ such that $parallel f parallel_oo < oo$. For $alpha in bb(R)$ define a function $g\(alpha\)$ by

$ g\(alpha\)= log [integral_0^1 exp \[ alpha f \( x \) \] d x] $ 
 
 
 
 
 
 
 
 

\(a) Prove that the function $g\(dot.op\)$ is twice continuously differentiable and that $g^('')\(alpha\)gt.eq 0$ for all $alpha in bb(R)$, i.e. the function $g\(dot.op\)$ is convex.
(b) Prove that if $f$ is a non-constant function, i.e. $m { x in\[0\,1\]:\|f\(x\)- c\|eq.not 0 } > 0$ for all constants $c in bb(R)$, then $g^('')\(alpha\)> 0\,alpha in bb(R)$\. 
 
 
 
 
 
 
 
 

= Use DCT
<use-dct>
Let $ f in L_1\(\[0\,1\]\,d x\) $
Find: $ lim_(n arrow.r oo) 1 / n integral_0^1 log (1 + e^(n f\(x\))) d x $ 
 
 
 
 
 
 
 
 

= Use Egoroff and Hölder
<use-egoroff-and-hölder>
Let ${f_n}$ be a sequence of functions in $L^p (bb(R)^n)\,1 < p < oo$, which converge almost everywhere to a function $f in L^p (bb(R)^n)$, and suppose that there is a constant $M$ such that $∥f_n∥_p lt.eq M$ for all $n$. Show that for every $g in L^q (bb(R)^n)\,q$ the conjugate of $p$, $ integral f g = lim_(n arrow.r oo) integral f_n g $
Is the statement true for $p = 1$ ?
(Hint: you may want to use Egorov's Theorem.) 
 
 
 
 
 
 
 
 

= Read up on HL
<read-up-on-hl>
Let $f\(dot.op\)$ be a locally integrable function on $bb(R)^n$ and $M f$ the corresponding Hardy-Littlewood maximal function

$ M f\(x\)= sup_(R > 0) frac(1, \|B\(x\,R\)\|) integral_(B\(x\,R\))\|f\(y\)\|d y\,quad x in bb(R)^n $

where $B\(x\,R\)$ denotes the ball centered at $x$ with radius $R$.
a) Show that if $f$ is integrable on $bb(R)^n$ then $sup_(lambda > 0) lambda m {x in bb(R)^n : \| f \( x \) \| > lambda} < oo$.
b) Let $f$ be the function

$ f\(x\)= cases(delim: "{", 1 & upright(" if ")\|x\|< 1, 0 & upright(" if ")\|x\|gt.eq 1) $
Show that $M f$ is not integrable on $bb(R)^n$, but $sup_(lambda > 0) lambda m {x in bb(R)^n : M f \( x \) > lambda} <$ $oo$\. 
 
 
 
 
 
 
 
 

= Use density of such functions g somewhere, and then Hölder.
<use-density-of-such-functions-g-somewhere-and-then-hölder.>
Fix $1 < p < oo$. Let $f in L^p\(E\)$, where $E$ is a measurable subset of $bb(R)^d$. Assume that

$ integral_E f\(x\)g\(x\)d x = 0 $

for all compactly supported continuous functions $g : bb(R)^d arrow.r bb(R)$. Is $f\(x\)= 0$ for almost every $x$ in $E$ ? If your answer is positive, prove it. Otherwise, given a counterexample. 
 
 
 
 
 
 
 
 

= Fubini and Tonelli
<fubini-and-tonelli>
Suppose that $f\(x\)\,x > 0$, is a real valued Lebesgue measurable square integrable function.
(a) Prove that for any $alpha > 0$, the inequality $2\|f\(z\)\|\|f\(y\)\|lt.eq alpha f\(z\)^2+ f\(y\)^2\/alpha$ holds for all $z\,y\,alpha > 0$.
(b) Express the double integral

$ integral_0^oo integral_0^oo frac(\|f\(z\)\|\|f\(y\)\|, y + z) d z d y $

as an integral over the region ${ 0 < z < y < oo }$.
(c) Show using your work from (a) and (b) that $\|f\(z\)\|\|f\(y\)\|\/\(y + z\)\,y\,z > 0$, is integrable and

$ integral_0^oo integral_0^oo frac(\|f\(z\)\|\|f\(y\)\|, y + z) d z d y lt.eq 4 integral_0^oo f\(x\)^2d x $

Hint: Use the inequality in (a) with $alpha =\(z\/y\)^(1\/2)$\. 
 
 
 
 
 
 
 
 

= Try a very nice function f first
<try-a-very-nice-function-f-first>
Let ${f_n \( x \)}$ be a sequence of continuous, strictly positive functions on $bb(R)$ which converges uniformly to the function $f\(x\)$. Suppose that all the functions ${f_n}\,f$ are integrable. Is

$ lim_(n arrow.r oo) integral f_n\(x\)d x = integral f\(x\)d x $
Justify your answer. 
 
 
 
 
 
 
 
 

= Use Lebesgue. Can you get the same equality for more sets E?
<use-lebesgue.-can-you-get-the-same-equality-for-more-sets-e>
Let $f in L_1\(\[0\,1\]\,d x\)$ be a function such that $integral_E f\(x\)d x = 0$ for any measurable set $E subset\[0\,1\]$ of Lebesgue measure \.99. Prove that $f = 0$ a.e. 
 
 
 
 
 
 
 
 

= Lebesgue
<lebesgue>
Let $f in L^2\(I\)$, for any finite interval $I subset bb(R)$. Assume that

$ integral_(- a)^a\|t\|\|f\(x + t\)\|d t gt.eq 2 / sqrt(3) a^2 $

for all $a > 0$ and $x in bb(R)$. Show that $\|f\(x\)\|gt.eq 1$ for a.e. $x in bb(R)$\. 
 
 
 
 
 
 
 
 

= Integration can be a trick to prove that a nonnegative function can't be identically zero.
<integration-can-be-a-trick-to-prove-that-a-nonnegative-function-cant-be-identically-zero.>
Let $f$ and $g$ be nonnegative functions in $L^1\(bb(R)\)$. Suppose that each function is positive on some set of positive measure. (However, there need not be a single set of positive measure where both functions are positive.) Prove that the convolution
$ h\(x\)= integral_(- oo)^oo f\(x - t\)g\(t\)d t $
is positive on some set of positive measure. 
 
 
 
 
 
 
 
 

= Check what happens on some set ${ f < c }$ with $c <\|\|f\|\|_oo$
<check-what-happens-on-some-set-fc-with-cf_infty>
Let $E$ be a measurable subset of $bb(R)$ such that $m\(E\)< oo$. Let $f in L^oo\(E\)$ with $parallel f parallel_oo > 0$. Show that $ lim_(n arrow.r oo) frac(parallel f parallel_(n + 1)^(n + 1), parallel f parallel_n^n) = parallel f parallel_oo $
Here $parallel f parallel_n := parallel f parallel_(L^n\(E\))\,parallel f parallel_(n + 1) := parallel f parallel_(L^(n + 1)\(E\))$\. 
 
 
 
 
 
 
 
 

= Use distribution functions
<use-distribution-functions>
Let $f : bb(R) arrow.r bb(R)$ be a measurable function which has the property that
$ m\(\|f\|> alpha\)lt.eq frac(1, 1 + alpha^3) quad upright(" for ") alpha > 0 $
(a) Show that $\|f\|^p$ is integrable for $p < 3$.
(b) Give an example of a function satisfying the above for which $\|f\|^3$ is not integrable. 
 
 
 
 
 
 
 
 
