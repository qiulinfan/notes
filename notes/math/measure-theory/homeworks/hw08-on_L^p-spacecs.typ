#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 8: on $L^p$ spacecs (50/50)]
<homework-8-on-lp-spacecs-5050>
#emph[Some of the following questions will be graded. Do them, and do hand them in].

#heading(level: 2, numbering: none)[一个 Barely in $L^1$ 的函数]
<一个-barely-in-l1-的函数>
Find a function $f in L^1\(bb(R)^2025\)$ such that $f in.not L^p\(U\)$ for any $p > 1$ and any nonempty open subset $U subset bb(R)^2025$. #emph[Hint]: see HW5(g).

#solution[
Recall Hw 5(g):For $alpha in\(0\,1\)$, define $g_alpha : bb(R) arrow.r bb(R)$ by $g_alpha\(x\)=\(1 - alpha\)x^(- alpha)$ for $0 < x < 1$ and $g_alpha\(x\)= 0$ otherwise. Let $\(x_n\)_n$ be an enumeration of the rational numbers, and define $f : bb(R) arrow.r\[0\,oo\]$ by $ f\(x\)= sum_(n = 1)^oo 2^(- n) g_(1 - n^(- n))\(x - x_n\) $
We have proved $f$ has the following properties:

- $f$ is Lebesgue integrable and $integral_(bb(R))\|f\|#h(0em) d m = integral_(bb(R)) f #h(0em) d m < oo$\;

- $integral_I f^p #h(0em) d m = oo quad upright("for all ") p > 1\,upright("for all open interval ") I$

Now we continuing this definition of $f$, and further define:$ F : bb(R)^2025 & arrow.r bb(R)\
\(x_1\,dots.h.c\,x_2025\) & mapsto product_(j = 1)^2025 f\(x_j\) $
#strong[Claim 1:] $F in L^1\(bb(R)^2025\)$. \ To prove this, we just need this lemma.

#lemma(
  title: [\(Folland 2.5 exercise 51)],
)[
If $f$ is $cal(M)$-measurable, $g$ is $cal(N)$-measurable, then $f g$ is $\(cal(M) times.o cal(N)\)$-measurable. \ Particularly, if $f in L^1\(mu\)$, $g in L^1\(nu\)$, then $f g in L^1\(mu times nu\)$ and $ integral f g #h(0em) d\(mu times nu\)= \( f #h(0em) d mu \) \( g #h(0em) d nu \) $

]
It seems like we have not proved this yet so here let's prove it.

#proof[
of Lemma: Define $ h : = f g $
Note $ p :\(u\,v\)mapsto u v $
from $bb(C)^2 arrow.r bb(C)$ is a product of two coordinate maps, thus is measurable since coordinate map is measurable, and product of two measurable functions is measurable. \ And $ pi :\(x\,y\)mapsto\(f\(x\)\,g\(y\)\) $ from $X times Y arrow.r bb(C)^2$ is $\(cal(M) times.o cal(N)\,bb(C)^2\)$-measurable, since for any measurable rectangle $B_1 times B_2 in bb(C)^2$, we have $ pi^(- 1)\(B_1 times B_2\)= f^(- 1)\(B_1\)times g^(- 1)\(B_2\)in cal(A) times.o cal(B) quad upright("as a measurable rect") $
Thus $h = pi compose p$ is $\(cal(M) times.o cal(N)\)$-measurable, as a #strong[composition of two measurable functions.] \ To show the second statement, it suffices to assume $f\,g$ takes positive real values, since otherwise we can decompose $f\,g$ into their real and imaginary parts, and for each part decompose them into positive part minus negative part. \ Take two seq of simple functions approximating $f\,g$ respectively from below, say: $ s_n\(x\):= sum_(k = 1)^K a_k thin chi_(A_k)\(x\)\,quad t_n\(y\)= sum_(ell = 1)^L b_l thin chi_(B_l)\(y\) $
their product on $X times Y$ is $ s_n\(x\)thin t_n\(y\)= sum_(k = 1)^K sum_(l = 1)^L a_k thin b_l chi_(A_k times B_l)\(x\,y\) $
By definition of the product measure $mu times nu$, we have
$ \(mu times nu\)\( A_k times B_l \) = mu\(A_k\)thin nu\(B_l\) $
Hence $ integral_(X times Y) s_n\(x\)thin t_n\(y\)thin d\(mu times nu\) & = sum_(k\,l) a_k thin b_l thin mu\(A_k\)thin nu\(B_l\)\
 & = \( sum_k a_k thin mu\(A_k\)\) thin \( sum_l b_l thin nu\(B_l\)\)\
 & = \( integral_X s_n thin d mu \) \( integral_Y t_n thin d nu \) $
Since $s_n\(x\)arrow.tr f\(x\)$ and $t_n\(y\)arrow.tr g\(y\)$, we also have $s_n t_n arrow.tr f g$, thus by #strong[MCT] we have: $ lim_n integral_X s_n thin d mu = integral_X f\,quad lim_n integral_Y t_n thin d nu = integral_Y g $ and $ lim_n integral_(X times Y) s_n\(x\)thin t_n\(y\)thin d\(mu times nu\)= integral_(X times Y) f g #h(0em) d\(mu times nu\) $
Then, since the right side are two finite positive reals, we have: $ integral_(X times Y) f\(x\)thin g\(y\)thin d\(mu times nu\)= \( integral_X f thin d mu \) thin \( integral_Y g thin d nu \) < oo $
Thus $h = f g in L^1\(mu times nu\)$

]
After proving the Lemma, we can extend it to the product of any finite number of functions. Applying it, we get $ F in L^1\(bb(R)^2025\) $
Then, we take arbitrary open set $U subset bb(R)^2025$ and arbitrary $p > 1$, and fix it. \ Claim 2: $F in.not L^p\(U\)$.
Sine $U$ is open in $bb(R)^2025$, it must contain an open ball, thus must contain an open box (e.g., the one internally connected in the open ball), say $I_1 times dots.h.c times I_2025$. \ Suppose for contradiction that $F in L^p\(U\)$. \ Then by monotonicity of integration: $ integral_(I_1 times dots.h.c times I_2025)\|F\|^p thin d\(x_1\,dots.h\,x_2025\)lt.eq integral_U\|F\|^p thin d\(x_1\,dots.h\,x_2025\)< oo $
Then by Fubini's Thm we have:
$ integral_(I_1 times dots.h.c times I_2025) product_(j = 1)^2025\|f\(x_j\)\|^p thin d\(x_1\,dots.h\,x_2025\)= product_(j = 1)^2025 integral_(I_j)\|f\(x_j\)\|^p thin d x_j < oo $
Since for each $I_j$, we in hw 5 proved that: $ integral_(I_j)\|f\(x_j\)\|^p#h(0em) d x_j = oo $
This contradicts with what we got. Thus we must have $F in.not L^p\(U\)$. \ This finishes the proof.

]
#heading(level: 2, numbering: none)[$L^p$ norm version of LDT]
<lp-norm-version-of-ldt>
Let $1 lt.eq p < oo$. Suppose that $f in L^p\(bb(R)\)$.
Prove that $ lim_(r arrow.r 0) frac(1, 2 r) integral_(x - r)^(x + r)\|f\(y\)- f\(x\)\|^p#h(0em) d y = 0 $
for a.e. $x$. \ (Hint: Follow the proof of the Lebegue Differentiation Theorem when $p = 1$, i.e. approximate $f$ by $g in C_c\(bb(R)\)$ satisfying $parallel f - g parallel_p < epsilon.alt$. At some point, use Minkowski's inequality; note that we have $\|a + b\|lt.eq\|a\|+\|b\|$, but we don't have $\|a + b\|^p lt.eq\|a\|^p+\|b\|^p$ for $p > 1$\.)

#proof[
#strong[Claim 1: The statement is true for $f in C_c^0\(bb(R)^n\)$]. \ Proof of Claim 1:Let $f in C_c^0\(bb(R)\)$, then it is uniformly continuous on any compact set, thus uniformly continuous on an open ball, since its closure is compact. \ Therefore, let $epsilon.alt > 0$, then there exists $delta > 0$ such that $ \|y - x\|< delta arrow.r.double.long\|f\(y\)- f\(x\)\|< epsilon.alt $
Thus
$ \|f\(y\)- f\(x\)\|^p< epsilon.alt^p quad upright("whenever ") quad\|y - x\|< delta $
Now fix $x in bb(R)$, and take $r < delta$. Then,
$ frac(1, 2 r) integral_(x - r)^(x + r)\|f\(y\)- f\(x\)\|^p thin d y < frac(1, 2 r) integral_(x - r)^(x + r) epsilon.alt^p thin d y = epsilon.alt^p $
Since this holds for all $r < delta$, we get: $ limsup_(r arrow.r 0) frac(1, 2 r) integral_(x - r)^(x + r)\|f\(y\)- f\(x\)\|^p thin d y lt.eq epsilon.alt^p $
Since $epsilon.alt > 0$ was arbitrary, this proves claim 1:
$ lim_(r arrow.r 0) frac(1, 2 r) integral_(x - r)^(x + r)\|f\(y\)- f\(x\)\|^p thin d y = 0 $
Next we will prove the general case. \ #strong[Step 1: Translate the problem into proving the measure of disqualified points is zero, for which we can use arbitrary error bound.] \ Define for each $x in bb(R)\,r > 0$:
$ Q\(x\,r\): = integral_(x - r)^(x + r)\|f\(y\)- f\(x\)\|^p#h(0em) d y = parallel f chi_(B_r\(x\)) - f\(x\)chi_(B_r\(x\)) parallel_p^p $
And then we define for each $x in bb(R)$:
$ Q\(x\): = limsup_(r arrow.r 0 +) frac(Q\(x\,r\)^(1\/p), \(2 r\)^(1\/p)) $
Then what we want to show is just: $ m\({ x : Q\(x\)> 0 }\)= 0 $
which is equivalent to show: $ m\({ x : Q\(x\)gt.eq alpha }\)= 0 quad upright("for all ") alpha > 0 $
Fix $alpha > 0$. It suffices to show: for any $epsilon.alt > 0$, we have: $ m\({ x : Q\(x\)gt.eq alpha }\)< epsilon.alt $
Now fix $epsilon.alt > 0$. Take $g in C_c^0\(bb(R)\)$ s.t. $parallel f - g parallel_p < epsilon.alt$. This can be done, by the density of $C_c^0\(bb(R)\)$ in $L^p\(m\)$. \ #strong[Step 2: Bound the $lim_(r arrow.r 0) frac(1, 2 r) integral_(x - r)^(x + r)\|f\(y\)- f\(x\)\|^p#h(0em) d y$ by $epsilon.alt$-controllable expressions, using Minkowski's ineq; thus bound the measure of disqualified points by two $epsilon.alt$-controllable sets] \ Define for each $x in bb(R)\,r > 0$:
$ Q\(x\,r\): = integral_(x - r)^(x + r)\|f\(y\)- f\(x\)\|^p#h(0em) d y = parallel f chi_(B_r\(x\)) - f\(x\)chi_(B_r\(x\)) parallel_p^p $
This is nonnegative. And since $\|f - f\(x\)\|$ is measurable and $L^p$ (since $\|f\|$ is $L^p$), $\|f - f\(x\)\|^p$ is $L^1$, and thus, recall we proved in lecture that $Q\(x\,r\)$ is jointly continuous in $r$ and $x$. \ By triangular ineq $ Q\(x\,r\)^(1\/p)lt.eq \( integral_(x - r)^(x + r) \(\|f\(y\)- g\(y\)\|+\|g\(y\)- g\(x\)\|+\|g\(x\)- f\(x\)\|\)^p #h(0em) d y \)^(1\/p) $
Then by Minkowski's ineq:
$ Q\(x\,r\)^(1\/p) & lt.eq parallel f chi_(B_r\(x\)) - g chi_(B_r\(x\)) parallel_p + parallel g chi_(B_r\(x\)) - g\(x\)chi_(B_r\(x\)) parallel_p + parallel g\(x\)chi_(B_r\(x\)) - f\(x\)chi_(B_r\(x\)) parallel_p $
Thus $ limsup_(r arrow.r 0 +) frac(Q\(x\,r\)^(1\/p), \(2 r\)^(1\/p)) & lt.eq limsup_(r arrow.r 0 +) frac(parallel f chi_B - g chi_B parallel_p, \(2 r\)^(1\/p)) + limsup_(r arrow.r 0 +) frac(parallel g chi_B - g\(x\)chi_B parallel_p, \(2 r\)^(1\/p)) + limsup_(r arrow.r 0 +) frac(parallel g\(x\)chi_B - f\(x\)chi_B parallel_p, \(2 r\)^(1\/p))\
 & = limsup_(r arrow.r 0 +) frac(parallel f chi_B - g chi_B parallel_p, \(2 r\)^(1\/p)) + limsup_(r arrow.r 0 +) frac(parallel g\(x\)chi_B - f\(x\)chi_B parallel_p, \(2 r\)^(1\/p)) $
Since we already proved the middle one of the three norms is zero, as continuous funciton with cpt supp. \ Step 2: Reduce the statement to
For simplication of notation, we also define for each $x in bb(R)$: $ M_1\(x\):= limsup_(r arrow.r 0 +) frac(parallel f chi_(B_r\(x\)) - g chi_(B_r\(x\)) parallel_p, \(2 r\)^(1\/p))\,quad M_2\(x\): = limsup_(r arrow.r 0 +) frac(parallel g\(x\)chi_(B_r\(x\)) - f\(x\)chi_(B_r\(x\)) parallel_p, \(2 r\)^(1\/p)) $
By the ineq we obtained, we have:
$ { x : Q\(x\)gt.eq alpha } subset { x : M_1\(x\)gt.eq alpha / 2 } union { x : M_2\(x\)gt.eq alpha / 2 } $
Since if we have both $M_1\(x\)< alpha / 2$ and $M_2\(x\)< alpha / 2$, we cannot have $Q\(x\)gt.eq alpha$. \ Thus $ m { x : Q\(x\)gt.eq alpha } lt.eq m { x : M_1\(x\)gt.eq alpha / 2 } + m { x : M_2\(x\)gt.eq alpha / 2 } $
#strong[Step 3: Bound $m { x : M_1\(x\)gt.eq alpha / 2 }$ using HL max Thm.] \ Note $ frac(parallel f chi_B - g chi_B parallel_p, \(2 r\)^(1\/p)) = \( frac(1, 2 r) integral\|f chi_B - g chi_B\|^p\)^(1 / p) $
And we can express it as HL max function of $ sup_r frac(1, 2 r) integral\|f chi_B - g chi_B\|^p= H\(f chi_B - g chi_B\)^p\(x\) $
We want $ m { x : \( H\(f chi_B - g chi_B\)^p\(x\)\)^(1\/p) > alpha / 2 } = m { x : H\(f chi_B - g chi_B\)^p\(x\)>\(alpha / 2\)^p} $

And by HL max Thm: $ m { x : H\(f chi_B - g chi_B\)^p\(x\)>\(alpha / 2\)^p} lt.eq frac(2^p 3^n, alpha^p) integral\(\|f - g\|chi_B\)^p lt.eq frac(2^p 3^n, alpha^p) integral\|f - g\|^p lt.eq frac(2^p 3^n, alpha^p) epsilon.alt^p $
#strong[Step 4: Bound $m { x : M_2\(x\)gt.eq alpha / 2 }$ using Markov's ineq.] \ Notice that $M_2\(x\)$ is independent with $r$:$ frac(parallel g\(x\)chi_(B_r\(x\)) - f\(x\)chi_(B_r\(x\)) parallel_p, \(2 r\)^(1\/p)) = frac(\(\(f\(x\)- g\(x\)\)^p thin 2 r \)^(1\/p), \(2 r\)^(1\/p)) =\(f\(x\)- g\(x\)\)^p $
Thus $ m { x : M_2\(x\)gt.eq alpha / 2 } = m { x :\(f\(x\)- g\(x\)\)^p gt.eq alpha / 2 } $
Therefore by Markov's ineq: $ m { x : M_2\(x\)gt.eq alpha / 2 } = m { x :\(f\(x\)- g\(x\)\)^p gt.eq alpha / 2 } lt.eq 2 / alpha integral\(f\(x\)- g\(x\)\)^p= 2 / alpha epsilon.alt^p $
Put it all together we have: $ m { x : Q\(x\)gt.eq alpha } lt.eq \( frac(2^p 3^n, alpha^p) + 2 / alpha \) epsilon.alt^p $
Since $epsilon.alt$ is arbitrary, we finally proved that $ m { x : Q\(x\)gt.eq alpha } = 0 quad upright("for any ") alpha $
finishing the proof.

]
#heading(level: 2, numbering: none)[#strong[generalization of Hölder]: bootstrapped Hölder]
<generalization-of-hölder-bootstrapped-hölder>
Prove the following generalization of Hölder's inequality. Let
$0 < s < oo$ and $0 < p_1\,dots.h\,p_n < oo$ be such that
$ 1 / p_1 + 1 / p_2 + dots.h + 1 / p_n = 1 / s\; $
then
$ parallel f_1 f_2 dots.h.c f_n parallel_s lt.eq parallel f_1 parallel_(p_1) parallel f_2 parallel_(p_2) dots.h.c parallel f_n parallel_(p_n) . $

#proof[
We prove by induction, applying Hölder's inequality each time. \ base case: If $n = 1$ then the result is Hölder's inequality, as proved. \ Inductive step: Suppose the inequality holds for all $s\,p_1\,dots.h.c\,p_(n - 1)$ such that the equality holds, then we assume there are $n$ positive reals $p_1\,dots.h.c\,p_n$ and some $s > 0$ s.t. $ 1 / p_1 + 1 / p_2 + dots.h + 1 / p_n = 1 / s $
WTS the ineq also hold. \ We set: $ 1 / r := 1 / p_1 + 1 / p_2 + dots.h.c + 1 / p_(n - 1) $
Then we have $ 1 / r + 1 / p_n #h(0em) = #h(0em) 1 / s $
By the induction hypothesis applying to the $n - 1$ functions $f_1\,dots.h\,f_(n - 1)$, we have
$ parallel f_1 f_2 dots.h.c f_(n - 1) parallel_r lt.eq parallel f_1 parallel_(p_1) thin parallel f_2 parallel_(p_2) thin dots.h.c thin parallel f_(n - 1) parallel_(p_(n - 1)) $
Now we define: $ g\(x\):= f_1\(x\)f_2\(x\)dots.h.c f_(n - 1)\(x\)\,quad h\(x\)= : f_n\(x\) $
Applying the classical Hölder inequality with conjugate exponents $r$ and $p_n$, we have:
$ parallel g h parallel_s = parallel f_1 f_2 dots.h.c f_(n - 1) dot.op f_n parallel_s lt.eq parallel f_1 f_2 dots.h.c f_(n - 1) parallel_r dot.op parallel f_n parallel_(p_n) . $
Putting it all together, we obtain:
$ parallel g h parallel_s = parallel f_1 f_2 dots.h.c f_(n - 1) dot.op f_n parallel_s & lt.eq\|f_1 f_2 dots.h.c f_(n - 1) parallel_r thin parallel f_n parallel_(p_n)\
 & lt.eq \( parallel f_1 parallel_(p_1) dots.h.c parallel f_(n - 1) parallel_(p_(n - 1)) \) thin parallel f_n parallel_(p_n)\
 & = parallel f_1 parallel_(p_1) dots.h.c parallel f_n parallel_(p_n) $This completes the inductive step, and thus the proof of the generalized Hölder inequality.

]
#heading(level: 2, numbering: none)[Translated a function by $t$: $f^t arrow.r f$ in $L^p$ ($1 lt.eq p < oo$), but not in $L^oo$]
<translated-a-function-by-t-ft-to-f-in-lp-1leq-p-infty-but-not-in-linfty>
For any measurable function $f : bb(R) arrow.r bb(R)$, set $ f^y\(x\):= f\(x - y\)\,quad x in bb(R) $

- Suppose that $f$ is continuous with compact support. Prove that $lim_(y arrow.r 0) parallel f^y - f parallel_oo = 0$.

- Suppose that $f in L^p\(bb(R)\)$ for some $p in\[1\,oo\)$. Prove that $lim_(y arrow.r 0) parallel f^y - f parallel_p = 0$.

- Prove by example that~(ii) is false for $p = oo$.

#proof[
#strong[of (a):] \ Suppose $f$ is continuous with compact support $K subset bb(R)$, then it is uniformly continuous. \ Let $epsilon.alt > 0$ and fix it. By uniform continuity, there exists $delta > 0$ such that $ \| x - z \| < delta arrow.r.double.long\|f\(x\)- f\(z\)\|< epsilon.alt $
For given $y$, we have: $ parallel f^y - f parallel_oo = upright("ess") sup_(x in bb(R)) \| f^y\(x\)- f\(x\)\| lt.eq sup_(x in bb(R)) \| f^y\(x\)- f\(x\)\| = sup_(x in bb(R)) \| f\(x - y\)- f\(x\)\| $
Then for $\|y\|< delta$: for any $x$, $\|x - y - x\|=\|y\|< delta$. Thus by uniform continuity, must have
$\| f\(x - y\)- f\(x\)\| < epsilon.alt$. Thus we got: $ parallel f^y - f parallel_oo lt.eq epsilon.alt quad forall\|y\|< delta $
Since $epsilon.alt$ is arbitrary, this proves that
$ lim_(y arrow.r 0) parallel f^y - f parallel_oo = 0 $

]
#proof[
#strong[of (b):] \ Since $C_c\(bb(R)\)$ is dense in $L^p\(bb(R)\)$ for $1 lt.eq p < oo$, we can take a seq of continuous functions with compact support, say $\(phi_n\)$, s.t. $phi_n arrow.r f$ in $L^p$. \ Then for each $y in bb(R)$, we can define $ phi_n^y\(x\):= phi_n\(x - y\) $
From (a) we have, for each $n$: $ lim_(y arrow.r 0) parallel phi_n^y - phi_n parallel_oo = 0 $
Note that since each $phi_n$ have compact $K$ whose measure is finite, we have: $ parallel phi_n^y - phi_n parallel_p = integral\|phi_n^y - phi_n\|^p#h(0em) d m lt.eq integral sup_x\|phi_n^y - phi_n\|^p#h(0em) d m = parallel phi_n^y - phi_n parallel_oo^p m\(K\) $
Thus, $ lim_(y arrow.r 0) parallel phi_n^y - phi_n parallel_oo = 0 arrow.r.double.long lim_(y arrow.r 0) parallel phi_n^y - phi_n parallel_p = 0 $
Also, by translation invariance of Lebesgue measure, for each $y$ we have: $ parallel f^y - phi_n^y parallel_p = parallel f - phi_n parallel_p $
Therefore for each $y$, we can bound
$ parallel f^y - f parallel_p & lt.eq parallel f^y - phi_n^y parallel_p + parallel phi_n^y - phi_n parallel_p + parallel phi_n - f parallel_p\
 & med = 2 parallel phi_n - f parallel_p + parallel phi_n^y - phi_n parallel_p $
The construction of bound has finished. Now Let $epsilon.alt > 0$ and fix it. We first choose $n$ large enough so that $ \|phi_n - f parallel_p < epsilon.alt / 3 $
and for the fixed $n$, we choose $delta$ s.t. for all $\|y\|< delta$ we have $ parallel phi_n^y - phi_n parallel_p < epsilon.alt / 3 $
Then we have: $ parallel f^y - f parallel_p lt.eq epsilon.alt quad forall\|y\|< delta $
Since $epsilon.alt$ is arbitrary, this proves that $ lim_(y arrow.r 0) parallel f^y - f parallel_p = 0 $

]
#proof[
#strong[of (c):] \

We consider
$ f\(x\):= chi_(\(0\,1\)) $
We have $ parallel f parallel_oo = 1 $
and the sup is taken on $x in\(0\,1\)$. \ Then for any $y$, we have: We have
$ \| f^y\(x\)- f\(x\)\| = \| chi_(\(0\,1\))\(x - y\)- chi_(\(0\,1\))\(x\)\| = \| chi_(\(y\,y + 1\))\(x\)- chi_(\(0\,1\))\(x\)\| $
Thus for all $y > 0$, on the open set $\(1\,y + 1\)$ which has positive measure, we have $\| f^y\(x\)- f\(x\)\| = 1$\; \ For all $y < 0$, on the open set $\(y\,0\)$ which has positive measure, we have $\| f^y\(x\)- f\(x\)\| = 1$\;
Thus the function $parallel f^y - f parallel_oo$ with respect to $y$ actually has a jump discontinuity at $0$, since it is $0$ at $y = 1$ and $1$ elsewhere. \ This serves as an counterexample that we do not necessarily have $lim_(y arrow.r 0) parallel f^y - f parallel_oo = 0$.

]
#remark[
这里可以体现 $L^oo$ convergence 的严格性, 从本质上比其他 $L^p$ convergence 都要高一级别.

]
#heading(level: 2, numbering: none)[Criterion for $L^p$-convergence: a.e. conv $+$ 积分值 conv]
<criterion-for-lp-convergence-a.e.-conv-积分值-conv>
Suppose that $1 lt.eq p < oo$ and that $f_n\,f in L^p$ for some measure space $\(X\,cal(A)\,mu\)$.
Prove that if $f_n arrow.r f$ a.e. and $parallel f_n parallel_p arrow.r parallel f parallel_p$, then $parallel f_n - f parallel_p arrow.r 0$. Is the converse true?
#emph[Hint]: revisit the "#strong[Generalized DCT]" problem on HW5.

#proof[
Recall we have proved

#theorem(
  title: [#kn[Generalized DCT]],
)[
Let $\(X\,cal(A)\,mu\)$ be a measure space, and $f_n\,g_n\,f\,g in L^1$, $n in bb(N)$. This is the varying-dominator extension of #ref[dominated-convergence-theorem]. \ Suppose that

- $lim_(n arrow.r oo) f_n\(x\)= f\(x\)$ and $lim_(n arrow.r oo) g_n\(x\)= g\(x\)$ for a.e. $x$\;

- $\|f_n\(x\)\|lt.eq g_n\(x\)$ a.e. for every $n in bb(N)$\;

- $g_n : X arrow.r\[0\,oo\]$ and $lim_(n arrow.r oo) integral g_n #h(0em) d mu = integral g #h(0em) d mu$.

Then we have: $ lim_(n arrow.r oo) integral f_n #h(0em) d mu = integral f #h(0em) d mu $

]
which is the case $p = 1$. Now we prove the general case with the help of the case $p = 1$. We notice that $f_n arrow.r f$ in $L^p$, is just to prove the function $\|f_n - f\|^p arrow.r 0$ in $L^1$, that's how we can use the generalized DCT. \ Assume the hypothesis.
Since $x^p$ is convex for $p gt.eq 1$, we have for any $x\,y$: $ \( frac(x + y, 2) \)^p lt.eq frac(x^p + y^p, 2) $
Thus $ \(x + y\)^p lt.eq 2^(p - 1)\(x^p + y^p\) $
Therefore for each $n$ and almost every $x$, we have: $ \|f_n\(x\)- f\(x\)\|^p lt.eq\(\|f_n\(x\)\|+\|f\(x\)\|\)^p lt.eq 2^(thin p - 1) \(\|f_n\(x\)\|^p+\|f\(x\)\|^p\) $
Hence $ \|f_n - f\|^p lt.eq 2^(thin p - 1) \(\|f_n\|^p+\|f\|^p\) $
We define for each $n$: $ g_n := 2^(thin p - 1) \(\|f_n\|^p+\|f\|^p\) $
Since $f_n arrow.r f$ a.e., we have $\|f_n\|^p arrow.r\|f\|^p$ a.e. Thus $ g_n\(x\)#h(0em) = #h(0em) 2^(p - 1) \(\|f_n\(x\)\|^p+\|f\(x\)\|^p\) arrow.r^(n arrow.r oo) 2^(p - 1) \(\|f\(x\)\|^p+\|f\(x\)\|^p\) = 2^p thin\|f\(x\)\|^p= : g\(x\) $Note that $ integral g_n thin d mu = 2^(p - 1) thin \( parallel f_n parallel_p^p + parallel f parallel_p^p \) $
Since $lr(bar.v.double f_n bar.v.double)_p arrow.r lr(bar.v.double f bar.v.double)_p\,$ we have $ lim_(n arrow.r oo) integral g_n thin d mu = 2^(p - 1) thin \( parallel f parallel_p^p + parallel f parallel_p^p \) = 2^p thin parallel f parallel_p^p = integral g thin d mu $
Now we have #strong[\(1)] $g_n arrow.r g$, #strong[\(2)] $integral g_n arrow.r integral g$, and #strong[\(3)] $g_n$ is an upper bound for $\|f_n - f\|^p$. Then we can apply generalized DCT to the function seq $\|f_n - f\|^p$:
$ lim_(n arrow.r oo) parallel f_n - f parallel_p^p = lim_(n arrow.r oo) integral \| f_n\(x\)- f\(x\)\|^p thin d mu = integral 0 thin d mu = 0 $
Thus
$ lim_(n arrow.r oo) parallel f_n - f parallel_p = 0^(1\/p) = 0 $
This finishes the proof that $f_n arrow.r f$ in $L^p$.

]
#solution[
The converse does not hold. \ We recall the typewriter function on $\[0\,1\]$:
$ f_(n\,k)\(x\)= cases(delim: "{", 1\, & x in [frac(n - 1, 2^k) \, n / 2^k], 0\, & upright("otherwise")) $
We index over $k in bb(N)$, and for each $k$ we index over $n = 1$ to $2^k$. That is, for given $k$, $f_n$ is the indicator function of the $n$-th dyadic interval. \ Then $ parallel f_n parallel_p = (integral_(\[0\,1\]) \| f_n \( x \) \|^p d x)^(1\/p) = (upright("length of the dyadic interval"))^(1\/p) lt.eq 2^(- k\/p) $
Therefore, since each $f_n$ has support of shrinking length, we get:
$ parallel f_(n\,k) parallel_p arrow.r 0 quad upright("as ") k arrow.r oo $
but for each $x$, $f_(n\,k)\(x\)= 1$ for infinitely many $\(n\,k\)$. so $f_n\(x\)$ does not converge to 0 for any $x in\[0\,1\]$.

]
#emph[Nur für Verrückte]

\(It's #strong[really] not necessary to attempt these problems. Do not, under any circumstances, hand them in!)

+ Prove that the category of measurable spaces (see HW1) admits finite products, and that the product of $\(X\,cal(A)\)$ and $\(Y\,cal(B)\)$ equals $\(X times Y\,cal(A) times.o cal(B)\)$.

+ Now consider the category of measure spaces (see HW2). Consider two
  measure spaces $\(X_i\,cal(A)_i\,mu_i\)$, $i = 1\,2$, and set $X = X_1 times X_2$, $cal(A) = cal(A)_1 times.o cal(A)_2$, and $mu = mu_1 times mu_2$.

  - Prove that the projection maps $X arrow.r X_i$ are measurable, and that they are measure preserving iff $mu_j\(X_j\)= 1$ for $j = 1\,2$. Thus $\(X\,cal(A)\,mu\)$ is #emph[not] the categorical product of $\(X_i\,cal(A)_i\,mu_i\)$ in general.

  - Prove that even if $mu_i\(X_i\)= 1$, the measure space $\(X\,cal(A)\,mu\)$ is #emph[not] the categorical product of $\(X_i\,cal(A)_i\,mu_i\)$ in general.
    #emph[Hint]: consider the case when the $X_i$ consist of two elements, for example $X_i = { frak(o)_i\,frak(v)_i }$.
