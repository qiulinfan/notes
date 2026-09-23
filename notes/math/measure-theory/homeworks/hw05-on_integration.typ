#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 5: on integration(50/50)]
<homework-5-on-integration5050>
#emph[None of the following questions will be graded. Do them, but do not hand them in].

#heading(level: 2, numbering: none)[Dirac measure: $integral f #h(0em) d delta_(x_0) = f\(x_0\)$]
<dirac-measure-int-f-ddelta_x_0-fx_0>
Let $\(X\,cal(A)\)$ be a measurable space, and $x_0 in X$ a point.
Let $delta_(x_0)$ be the Dirac measure at $x_0$, i.e. for $E in cal(A)$, $delta_(x_0)\(E\)= 1$ if $x_0 in E$ and $delta_(x_0)\(E\)= 0$ if $x_0 in.not E$.
Show that every measurable function $f : X arrow.r bb(R)$ is integrable and
$ integral f #h(0em) d delta_(x_0) = f\(x_0\) $
#emph[Remark]: what is often called a Dirac delta function is actually this Dirac measure.

#heading(level: 2, numbering: none)[measure space 的 extension 保留 measurable function 的可测性和积分]
<measure-space-的-extension-保留-measurable-function-的可测性和积分>
Let $\(X\,cal(A)\,mu\)$ and $\(X\,cal(B)\,nu\)$ be measure spaces on the same set $X$. Suppose that $\(X\,cal(B)\,nu\)$ is an extension of $\(X\,cal(A)\,mu\)$.

- Show that if a function $f$ on $X$ is $cal(A)$-measurable, then it is $cal(B)$-measurable.

- Show that if a function $f$ on $X$ is $cal(A)$-measurable and $f in L^1\(cal(A)\,mu\)$, then $f in L^1\(cal(B)\,nu\)$ and $integral f #h(0em) d mu = integral f #h(0em) d nu$.

#heading(level: 2, numbering: none)[almost everywhere defined measurable function]
<almost-everywhere-defined-measurable-function>
Carefully think through the notion of an "almost everywhere defined" measurable (or integrable) function.
How can we deduce the "almost everywhere" versions of the main convergence theorems (MCT, FL, DCT) from their "everywhere" counterparts?
Propositions 2.11 and 2.12 in~\[Folland\] are useful here (these appeared on HW4).

#heading(level: 2, numbering: none)[new measure from old: $nu\(A\):= integral_A f #h(0em) d mu arrow.r.double.long integral g #h(0em) d nu = integral g f #h(0em) d mu$]
<new-measure-from-old-nuaint_a-f-dmu-impliesint-g-d-nu-int-gf-dmu>
Let $\(X\,cal(A)\,mu\)$ be a measure space. Let $f : X arrow.r\[0\,oo\]$ be an $cal(A)$-measurable function.
Define $nu : cal(A) arrow.r\[0\,oo\]$ by $nu\(A\)= integral_A f #h(0em) d mu = integral f chi_A #h(0em) d mu$ for $A in cal(A)$.

- Prove that $nu$ is a measure on $\(X\,cal(A)\)$.

- Prove that $integral g #h(0em) d nu = integral g f #h(0em) d mu$ for every $cal(A)$-measurable function $g : X arrow.r\[0\,oo\]$.
  #emph[Hint]: Start with the case when $g = chi_E$\; then treat the case when $g$ is a simple function; finally consider the case when $g$ is a general nonnegative function.

- Now consider the case $\(X\,cal(A)\,mu\)=\(bb(R)\,cal(B)\(bb(R)\)\,m\)$, where $m$ is Lebesgue measure.
  Each nonnegative function $f : bb(R) arrow.r\[0\,oo\]$ induces a Borel measure $nu_f\(A\)= integral_A f #h(0em) d m$ by (a).

  - Which functions $f$ induce a locally finite Borel measure? In that case, what is the distribution function for $nu_f$?

  - Do all locally finite Borel measures arise from some $f$?

  - Can you interpret (b) as a change of variables formula?

#heading(level: 2, numbering: none)[Truncations in $L^1$: 通过 $integral f_n$ 或者 $integral_(X_n) f$ 的极限 (bounded function / subset) 得到 $integral_X f$]
<truncations-in-l1-通过-int-f_n-或者-int_x_n-f-的极限-bounded-function-subset-得到-int_x-f>
Let $\(X\,cal(A)\,mu\)$ be a measure space and $f : X arrow.r bb(C)$ an integrable function.

- \(Horizontal truncation) Suppose that $X = union.big_(n = 1)^oo X_n$ for some $X_1 subset X_2 subset dots.h.c$
  with $X_n in cal(A)$. Prove that
  $ integral_X f thin d mu = lim_(n arrow.r oo) integral_(X_n) f thin d mu $

- \(Vertical truncation) Prove that
  $ integral f thin d mu = lim_(n arrow.r oo) integral f chi_({\|f\|lt.eq n }) #h(0em) d mu $

#emph[Remark]: a similar question for nonnegative measurable functions appeared in HW4.

#heading(level: 2, numbering: none)[$L^1$-convergence from dominated convergence]
<l1-convergence-from-dominated-convergence>
Let $\(X\,cal(A)\,mu\)$ be a measure space, and $f_n\,f$, measurable functions on $X$, $n in bb(N)$.
Suppose that $f_n arrow.r f$ a.e.~and there is an integrable nonnegative function $g$ such that $\|f_n\(x\)\|lt.eq g\(x\)$ a.e.~for all $n$. Prove that
$f_n arrow.r f$ in $L^1$, i.e.~$ lim_(n arrow.r oo) integral\|f_n - f\|= 0 . $
#emph[Hint]: use DCT.

#heading(level: 2, numbering: none)[Lebesgue integrals and affine transformations]
<lebesgue-integrals-and-affine-transformations>
Let $f$ be a Lebesgue integrable function on $bb(R)$.
Prove that
$ integral f\(r x + s\)#h(0em) d m\(x\)= frac(1, \|r\|) integral f\(x\)#h(0em) d m\(x\) $
for all real numbers $r\,s$ with $r eq.not 0$.

#emph[Hint]: approximate using simple functions $f$.

#heading(level: 2, numbering: none)[even moments of Gaussian distribution]
<even-moments-of-gaussian-distribution>
Using Multivariable Calculus (and the fact that Riemann integrals coincide with Lebesgue integrals) one can show that
$ 1 / sqrt(2 pi) integral_(- oo)^oo e^(- t x^2 / 2) #h(0em) d x = 1 / sqrt(t) $
for every $t > 0$.
Prove, by (justified!) differentiating with respect to $t$, that
$ 1 / sqrt(2 pi) integral_(- oo)^oo x^(2 n) e^(- x^2 / 2) =\(2 n - 1\)! ! := frac(\(2 n\)!, 2^n n !) $
for $n in bb(N)$.

#emph[Remark]: here the integrals are as defined in this course.
#emph[Remark]: in probability theory, these are the even moments of the standard normal distribution.

#heading(level: 2, numbering: none)[Generalized DCT]
<generalized-dct>
Let $\(X\,cal(A)\,mu\)$ be a measure space, and $f_n\,g_n\,f\,g in L^1$, $n in bb(N)$. Suppose that

- $lim_(n arrow.r oo) f_n\(x\)= f\(x\)$ and $lim_(n arrow.r oo) g_n\(x\)= g\(x\)$ for a.e. $x$\;

- $\|f_n\(x\)\|lt.eq g_n\(x\)$ a.e. for every $n in bb(N)$\;

- $g_n : X arrow.r\[0\,oo\]$ and $lim_(n arrow.r oo) integral g_n #h(0em) d mu = integral g #h(0em) d mu$.

Prove that
$ lim_(n arrow.r oo) integral f_n #h(0em) d mu = integral f #h(0em) d mu . $
#emph[Hint]: Follow the proof of the DCT, based on FL.

#heading(level: 2, numbering: none)[Criterion for $L^1$-convergence]
<criterion-for-l1-convergence>
Let $\(X\,cal(A)\,mu\)$ be a measure space.
Let $f_n\,f$ be integrable functions on $X$, $n in bb(N)$.
Suppose that $lim_(n arrow.r oo) f_n\(x\)= f\(x\)$ a.e. Prove that $ lim_(n arrow.r oo) integral\|f_n - f\|#h(0em) d mu = 0 quad upright("iff") quad lim_(n arrow.r oo) integral\|f_n\|#h(0em) d mu = integral\|f\|#h(0em) d mu $
#emph[Hint]: use the generalized DCT.

#emph[Some of the following questions will be graded. Do them, and do hand them in].

#heading(level: 2, numbering: none)[Formal equivalence between MCT and FL]
<formal-equivalence-between-mct-and-fl>
Let $\(X\,cal(A)\,mu\)$ be a measure space and $L^(+) = L^(+)\(X\,cal(A)\)$ the space of measurable functions $f : X arrow.r\[0\,oo\]$. \ Let $I : L^(+) arrow.r\[0\,oo\]$ be a function that is increasing in the sense that $f lt.eq g$ implies $I\(f\)lt.eq I\(g\)$. Prove that the following properties are equivalent:

- $I$ is continuous along increasing sequences: if $f_n in L^(+)$, and $f_n lt.eq f_(n + 1)$ for $n in bb(N)$, then $lim I\(f_n\)= I\(lim f_n\)$.

- if $f_n in L^(+)$, $n in bb(N)$, then $liminf_n I\(f_n\)gt.eq I\(liminf_n f_n\)$.

- $I$ is lower semicontinuous: if $f_n\,f in L^(+)$, and $lim_n f_n = f$, then
  $I\(f\)lt.eq liminf_n I\(f_n\)$.

Here $lim_n f_n = f$ means that $lim_n f_n\(x\)= f\(x\)$ for all $x in X$, and similarly for $liminf f_n$.
#emph[Remark]: the equivalence between~(a) and~(b) shows that #strong[the Monotone Convergence Theorem and Fatou's Lemma are equivalent.]

#proof[
#strong[of ($bold("a") arrow.r.double.long bold("b")$):] \ Suppose $I$ is continuous along increasing sequences. WTS: $ liminf_n I\(f_n\)#h(0em) gt.eq #h(0em) I #h(-1em) \( liminf_n f_n \) $for any sequence $\(f_n\)$ in $L^(+)$. \ Define for each $k in bb(N)$ $ g_k #h(0em) := #h(0em) inf_(n gt.eq k) thin f_n $ Then for all $k in bb(N)$, $g_k$ is a measurable function. Also notice that by definition, ${ g_k }$ is an increasing sequence, and $ lim_(k arrow.r oo) g_k\(x\)#h(0em) = #h(0em) liminf_(n arrow.r oo) f_n\(x\) $
for each $x in X$. \ Applying $\(bold("a")\)$ to $g_k$: since $g_k arrow.t lim_k g_k$, we get $ lim_(k arrow.r oo) I\(g_k\)#h(0em) = #h(0em) I \( lim_(k arrow.r oo) g_k \) #h(0em) = #h(0em) I \( liminf_(n arrow.r oo) f_n \) $
By def of $g_k$, we have: $ g_k #h(0em) lt.eq #h(0em) f_n quad upright("for all ") n gt.eq k $
Since $g_k lt.eq f_n$ implies $I\(g_k\)lt.eq I\(f_n\)$, we also have: $ I\(g_k\)#h(0em) lt.eq #h(0em) inf_(n gt.eq k) thin I\(f_n\) $
Taking the limit as $k arrow.r oo$, we get
$ lim_(k arrow.r oo) I\(g_k\)#h(0em) lt.eq #h(0em) lim_(k arrow.r oo) inf_(n gt.eq k) thin I\(f_n\)#h(0em) = #h(0em) liminf_(n arrow.r oo) I\(f_n\) $
Combining (5.1) and (5.2), we obtain: $ I\(liminf_n f_n\)#h(0em) = #h(0em) lim_k I\(g_k\)#h(0em) lt.eq #h(0em) liminf_n I\(f_n\). $ which is exactly what we want. \ \

]
#proof[
\($bold("b") arrow.r.double.long bold("c")$): We now assume $\(bold("b")\)$ and prove that $I$ is lower semicontinuous, i.e. WTS: $ f_n arrow.r f quad upright("pointwisely") quad arrow.r.double quad I\(f\)#h(0em) lt.eq #h(0em) liminf_n I\(f_n\). $
Given $f_n arrow.r f$ pointwise, we have
$ f\(x\)#h(0em) = #h(0em) lim_n f_n\(x\)#h(0em) = #h(0em) liminf_n f_n\(x\)quad forall x $
Hence for the sequence ${ f_n }$, the pointwise limit of $f_n$ is exactly $liminf_n f_n$. $\(bold("b")\)$ gives:
$ lim_n f_n\(x\)= liminf_n I\(f_n\)#h(0em) gt.eq #h(0em) I\(liminf_n f_n\)= I\(f\) $
This is precisely the definition of lower semicontinuity, proving $\(bold("b")\)arrow.r.double.long\(bold("c")\)$. \ \

]
#proof[
of ($bold("c") arrow.r.double.long bold("a")$): \ Assume $I$ is lower semi-continuous, i.e. If $f_n arrow.r f$ pointwise, then $ I\(f\)#h(0em) lt.eq #h(0em) liminf_n I\(f_n\) $ Let $\(f_n\)$ be a sequence in $L^(+)$ such that $f_n arrow.t f$, i.e. $ f_1 lt.eq f_2 lt.eq dots.h.c quad upright("and") quad lim_(n arrow.r oo) f_n\(x\)#h(0em) = #h(0em) f\(x\)quad upright("ptwisely for all ") x $
WTS (a): $lim_n I\(f_n\)= I\(f\)$. \ Since $f_n$ is an increasing seq, $f_n lt.eq f$ for each $n$, and since $I$ is monotone, we have $ I\(f_n\)#h(0em) lt.eq #h(0em) I\(f\)quad forall n $
Hence $ limsup_n I\(f_n\)#h(0em) lt.eq #h(0em) I\(f\) $
And by $upright(bold(\(c\)))$, since $f_n arrow.r f$ pointwisely, we have $ I\(f\)lt.eq liminf_n I\(f_n\) $
Combining (1) and (2), we get
$ liminf_n I\(f_n\)gt.eq I\(f\)gt.eq limsup_n I\(f_n\) $
This we also has $liminf_n I\(f_n\)lt.eq limsup_n I\(f_n\)$, this shows that $lim_n I\(f_n\)$ exists and equals $I\(f\)$. This is exactly the statement of (a). Thus $upright(bold(\(c\))) arrow.r.double.long upright(bold(\(a\)))$. \ \

]
Here we finished the proof that the three properties are equivalent. In particular, the equivalence of (a), (b) shows the equivalence of Fatou's Lemma and MCT.

#heading(level: 2, numbering: none)[Convergence on subsets]
<convergence-on-subsets>
Let $\(X\,cal(A)\,mu\)$ be a measure space. Let $f_n : X arrow.r\[0\,oo\]$ be a measurable function for each $n in bb(N)$.
Suppose that there is a function $f : X arrow.r\[0\,oo\]$ such that
$ lim_(n arrow.r oo) f_n\(x\)= f\(x\)upright(" for every ") x in X upright(" and ") lim_(n arrow.r oo) integral f_n = integral f $

- Assume that $integral f < oo$. Show that $lim_(n arrow.r oo) integral_E f_n = integral_E f$ for every $E in cal(A)$.
  #emph[Hint]: Use Fatou twice.
  It may be useful to note that even though $liminf\(alpha_n + beta_n\)gt.eq liminf alpha_n + liminf beta_n$ in general, if $lim alpha_n$ exists, then $liminf\(alpha_n + beta_n\)= lim alpha_n + liminf beta_n$ for sequences of extended real numbers $alpha_n\,beta_n$.

- Find an example of $f_n : bb(R) arrow.r\[0\,oo\]$ on the measure space $\(bb(R)\,cal(B)\(bb(R)\)\,m\)$ showing that (a) does not necessarily hold if $integral f = oo$.

#proof[
#strong[of (a):] \ By Fatou's Lemma, since $f_n arrow.r f$ pointwise and all $f_n$ are nonnegative,
$ liminf_(n arrow.r oo) integral_E f_n = liminf_(n arrow.r oo) integral f_n chi_E gt.eq integral f chi_E = integral_E f $
For the same reason, $ liminf_(n arrow.r oo) integral_(E^c) f_n thin gt.eq thin integral_(E^c) f $
Since $ integral f #h(0em) d mu = integral_X f #h(0em) d mu = integral_E f #h(0em) d mu + integral_(E^c) f #h(0em) d mu $, we have: $ integral f #h(0em) d mu - integral_E f #h(0em) d mu & = integral_(E^c) f #h(0em) d mu\
 & lt.eq liminf_n integral_(E^c) f_n #h(0em) d mu\
 & = liminf_n\(integral f_n #h(0em) d mu - integral_E f_n #h(0em) d mu\)\
 & = lim_(n arrow.r oo) integral f_n #h(0em) d mu + liminf_n\(- integral_E f_n #h(0em) d mu\)\
 & = lim_(n arrow.r oo) integral f_n #h(0em) d mu - limsup_n integral_E f_n #h(0em) d mu\
 & = integral f #h(0em) d mu - limsup_n integral_E f_n #h(0em) d mu $
Rearranging the terms, gives: $ integral_E f gt.eq limsup_n integral_E f_n #h(0em) d mu $
Combining with the statement given by Fatou's Lemma: $ liminf_(n arrow.r oo) integral_E f_n gt.eq integral_E f $
We then have:
$ liminf_(n arrow.r oo) integral_E f_n = integral_E f gt.eq limsup_n integral_E f_n $
Since also by definition of limsup and liminf we have: $ liminf_(n arrow.r oo) integral_E f_n lt.eq limsup_(n arrow.r oo) integral_E f_n $
We have: $ liminf_(n arrow.r oo) integral_E f_n = limsup_(n arrow.r oo) integral_E f_n = lim_(n arrow.r oo) integral_E f_n = integral_E f $
This completes the proof.

]
#solution[
#strong[of (b):]
Define for each $n in bb(N)$ $ f_n\(x\):= chi_(\[n\,n + 1\]) + chi_(\(- oo\,0\]) $
Then we have: $ integral f_n\(x\)= 1 + oo = oo $
for each $n$. So $ lim_(n arrow.r oo) integral f_n\(x\)= oo $
And the pointwise limit of $f_n$ is $ f\(x\): = lim_(n arrow.r oo) f_n\(x\)= chi_(\(- oo\,0\]) $
So the integral of $f$ is also: $ integral lim_(n arrow.r oo) f_n\(x\)= integral f\(x\)= oo $
But consider the subset $E =\[0\,oo\)$, we have: $ integral_E f_n = integral chi_(\[n\,n + 1\]) = 1 quad upright("for all ") n $
So $ lim_(n arrow.r oo) integral_E f_n = 1 $while $ integral_E f = 0 eq.not lim_(n arrow.r oo) integral_E f_n $
This completes the counterexample.

]
#heading(level: 2, numbering: none)[Some integrals]
<some-integrals>
Use the DCT to evaluate the following limits:

- $ med lim_(n arrow.r oo) integral_0^oo frac(n sin (x / n), x\(1 + x^2\)) #h(0em) d x $

- $ lim_(n arrow.r oo) integral_0^n x^m (1 - x / n)^n #h(0em) d x\, $
  where $m$ is a non-negative integer. (The integrals are Lebesgue integrals.)

#solution[
#strong[of (a):] \ Define $ f_n := {frac(n sin (x / n), x\(1 + x^2\))\,quad x > 0\
0\,quad x lt.eq 0 $
Recall that for all $x in bb(R)$, we have: $ \|sin\(x\)\|lt.eq\|x\| $
So for all $n$, and for all $x > 0$, we have: $ \|f_n\(x\)\|= \| frac(n sin (x / n), x\(1 + x^2\)) \| = frac(n sin (x / n), x\(1 + x^2\)) lt.eq frac(n x / n, x\(1 + x^2\)) = frac(1, 1 + x^2) $
So by taking: $ g\(x\):= {frac(1, 1 + x^2)\,quad x > 0\
0\,quad x lt.eq 0 $
We have: $ g\(x\)gt.eq\|f_n\(x\)\|quad forall x in bb(R)\,forall n $
Since $g$ is continuous a.e. (except on $x = 0$), it is a measurable function. And it is Riemann integrable. We can do Riemann integration of $g$: $ integral_0^oo frac(1, 1 + x^2) thin d x #h(0em) = #h(0em) [arctan \( x \)]_0^oo #h(0em) = #h(0em) pi / 2 < oo $
Also, for each $x > 0$, since $ lim_(n arrow.r oo) frac(sin\(x / n\), x / n) = 1 $
We have for each $x > 0$: $ lim_(n arrow.r oo) f_n\(x\)= frac(1, 1 + x^2) lim_(n arrow.r oo) frac(sin\(x / n\), x / n) = frac(1, 1 + x^2) $
Thus the pointwise limit of $f_n$ is: $ f\(x\):= lim_(n arrow.r oo) f_n\(x\)= {frac(1, 1 + x^2)\,quad x > 0\
0\,quad x lt.eq 0 $
(Notice it coincides with the $g$ that we chose as bound.) We also have:
$ integral_0^oo f\(x\)#h(0em) d x = pi / 2 $
Then by DCT,
$ lim_(n arrow.r oo) integral_0^oo frac(n sin (x / n), x\(1 + x^2\)) #h(0em) d x = lim_(n arrow.r oo) integral_0^oo f_n\(x\)#h(0em) d x = integral_0^oo lim_(n arrow.r oo) f_n\(x\)#h(0em) d x = integral_0^oo f\(x\)#h(0em) d x = pi / 2 $
This finishes the calculation.

]
#solution[
#strong[of (b):] \ Define for each $n in bb(N)$ $ f_n\(x\)= x^m (1 - x / n)^n quad upright("for") quad 0 lt.eq x lt.eq n $
and $f_n\(x\)= 0$ for $x > n$. \ Then the integral we wish to evaluate can be written as $ lim_(n arrow.r oo) integral_0^n x^m (1 - x / n)^n thin d x = lim_(n arrow.r oo) integral_0^oo f_n\(x\)thin d x $
We first evaluate the ptwise limit function $f := lim_(n arrow.r oo) f_n\(x\)$. \ For $x = 0$: $ f_n\(0\)#h(0em) = #h(0em) 0^m (1 - 0 / n)^n = 0^m dot.op 1 = 0^m e^(- x) quad forall n $
For $0 < x < oo$: $ f_n\(x\)#h(0em) = #h(0em) x^m (1 - x / n)^n $
for all large enough $n$. \ Recall the standard limit $lim_(n arrow.r oo) (1 - x / n)^n = e^(- x)$, hence $ f\(x\):= lim_(n arrow.r oo) f_n\(x\)= lim_(n arrow.r oo) x^m (1 - x / n)^n = x^m e^(- x) $
Thus $ f\(x\)= {0\,quad x < 0\
x^m e^(- x)\,quad x gt.eq 0 $
Now we determine the dominating function $g$. \ Consider the same function as $f$:
$ g\(x\):= {0\,quad x < 0\
x^m e^(- x)\,quad x gt.eq 0 $
We now prove this same function $g$ works. \ Let $n in bb(N)$. \ It is sure that for $x > n$, $g\(x\)gt.eq\|f_n\(x\)\|$ since $f_n\(x\)= 0$. \ So consider $x in\[0\,n\]$. \ Recall the inequality: $ ln\(1 - t\)lt.eq - t quad forall t in\[0\,1\] $
Thus we have:
$ (1 - x / n)^n lt.eq e^(- x / n n) = e^(- x) $
Therefore,
$ 0 #h(0em) lt.eq #h(0em) x^m (1 - x / n)^n #h(0em) lt.eq #h(0em) x^m e^(- x) quad upright("for all ") 0 lt.eq x lt.eq n $
Thus in all cases,
$ \|f_n\(x\)\|= f_n\(x\)lt.eq x^m e^(- x) = g\(x\) $
Recall:
$ integral_0^oo x^m e^(- x) thin d x = Gamma\(m + 1\)= m ! $
is #strong[finite] for all nonnegative integers $m$. Thus $g$ is #strong[integrable]. Then #strong[$g$ is indeed a dominating function for $\(f_n\)$.] \ Applying the DCT, we exchange the limit and the integral:
$ lim_(n arrow.r oo) integral_0^oo f_n\(x\)thin d x = integral_0^oo lim_(n arrow.r oo) f_n\(x\)thin d x = integral_0^oo x^m e^(- x) thin d x $ thus
$ lim_(n arrow.r oo) integral_0^n x^m (1 - x / n)^n thin d x = integral_0^oo x^m e^(- x) thin d x = Gamma\(m + 1\)= m ! $ This finishes the evalutation of this integral.

]
#heading(level: 2, numbering: none)[Continuity of translations]
<continuity-of-translations>
Let $f in L^1\(bb(R)\,cal(L)\,m\)$. For $x in bb(R)$, set $f_s\(x\)= f\(x - s\)$.
Prove that $s mapsto f_s$ is a continuous map from $bb(R)$ to $L^1$. In other words, prove that if $t in bb(R)$, then
$ lim_(s arrow.r t) integral\|f_s - f_t\|#h(0em) d m = 0 $
#emph[Hint]: approximate $f$.

#proof[
We write: $ \|\|f - g\|\|_1:= integral\|f - g\|#h(0em) d m $ for $f\,g in L^1\(bb(R)\,cal(L)\,m\)$.
Let $epsilon.alt > 0$. \ Recall that $C_c\(bb(R)\)$ is dense in $L^1\(bb(R)\)$. So there exists a function $g in C_c\(bb(R)\)$ such that
$ parallel f - g parallel_1 < epsilon.alt / 3 $ Since $g$ is continuous and compactly supported, it is #strong[uniformly continuous]. Denote $K := "supp"\(g\)$.
There exists $delta > 0$ such that for all $x in bb(R)$,
$ \|s - t\|< delta arrow.r.double.long\|g\(x - s\)- g\(x - t\)\|< frac(epsilon.alt, 3 dot.op m\(K\)) $
Integrating the difference over this support gives:
$ parallel g_s - g_t parallel_1 lt.eq frac(epsilon.alt, 3 dot.op m\(K\)) dot.op m\(K\)= epsilon.alt / 3 $
Recall that $L^1\(bb(R)\,cal(L)\,m\)$ is a normed vector space with $\|\|dot.op\|\|_1$ as the norm. So by the triangle inequality of a norm, we have:
$ parallel f_s - f_t parallel_1 lt.eq parallel f_s - g_s parallel_1 + parallel g_s - g_t parallel_1 + parallel g_t - f_t parallel_1 $
By the translation invariance of Lebesgue measure, we have:
$ parallel f_s - g_s parallel_1 = parallel f - g parallel_1 < epsilon.alt / 3 quad upright("and") quad parallel g_t - f_t parallel_1 = parallel g - f parallel_1 < epsilon.alt / 3 $By choosing $delta$ such that $parallel g_s - g_t parallel_1 < epsilon.alt / 3$, we get
$ parallel f_s - f_t parallel_1 < epsilon.alt / 3 + epsilon.alt / 3 + epsilon.alt / 3 = epsilon.alt $
Since $epsilon.alt$ is arbitrary, this proves that for any $t in bb(R)$, $ lim_(s arrow.r t) integral\|f_s - f_t\|thin d m =\|\|f_s - f_t\|\|_1= 0 $finishing the proof of continuity of the map $s mapsto f_s$.

]
#heading(level: 2, numbering: none)[An interesting integrable function]
<an-interesting-integrable-function>
For $alpha in\(0\,1\)$, define $g_alpha : bb(R) arrow.r bb(R)$ by $g_alpha\(x\)=\(1 - alpha\)x^(- alpha)$ for $0 < x < 1$ and $g_alpha\(x\)= 0$ otherwise. Let $\(x_n\)_n$ be an enumeration of the rational numbers, and define $f : bb(R) arrow.r\[0\,oo\]$ by
$ f\(x\)= sum_(n = 1)^oo 2^(- n) g_(1 - n^(- n))\(x - x_n\) $
Prove that $f$ has the following properties:

- $f$ is Borel (and hence Lebesgue) measurable;

- $f$ is Lebesgue integrable, that is $integral_(bb(R)) f #h(0em) d m < oo$\;

- there exist uncountably many $x in bb(R)$ such that $f\(x\)< oo$\;

- $f$ is discontinuous at every point $x in bb(R)$ where $f\(x\)< oo$\;

- $f$ is unbounded on any nonempty open interval $I =\(a\,b\)$, that is $sup_I f = oo$\;

- the statements in~(d) and~(e) remain true even if we redefine $f$ on a set of (Lebesgue) measure zero.

- $integral_I f^p #h(0em) d m = oo$ for all $p > 1$ and all intervals $I =\(a\,b\)$.

#proof[
#strong[of (a):] \ We define $ alpha_n : = 1 - n^(- n) $ and $ h_n\(x\):= 2^(- n) g_(alpha_n)\(x - x_n\) $ and $ f_k\(x\):= sum_(n = 1)^k 2^(- n) g_(alpha_n)\(x - x_n\)= sum_(n = 1)^k h_n\(x\) $ to simplify the expression. \ Then we have: $ f\(x\)= lim_(k arrow.r oo) f_k\(x\) $
Notice that, since each $g_(alpha_n)$ is nonnegative, $f_k\(x\)$ is a #strong[increasing] sequence of functions, so for any $x in bb(R)$, $lim_(k arrow.r oo) f_k\(x\)$ exists in $accent(bb(R), macron)$. This shows the well-definedness of $f = lim_(k arrow.r oo) f_k$. \ Now we #strong[claim: each $h_n\(x\)$ is Borel measurable.] \ By translate invariance and scaling invariance of Borel measurability, to prove the claim, it #strong[suffices to prove that each $g_alpha$ is Borel measurable for any $alpha in\(0\,1\)$]. \

#figure(image("../assets/hw5-image-20250214195825512.png", width: 30.0%),
  caption: [
  ]
)

If $a < 0$, we have: $ g_alpha^(- 1)\(\(a\,oo\)\)= bb(R) $
if $0 lt.eq a lt.eq 1 - alpha$, then we have $ g_alpha^(- 1)\(\(a\,oo\)\)=\(0\,1\) $
if $a > 1 - alpha$, then we have $ g_alpha^(- 1)\(\(a\,oo\)\)=\(0\,\(frac(1 - alpha, a)\)^(1\/alpha)\) $
This proves that $g_alpha$ is Borel measurable for any $alpha in\(0\,1\)$. \ Thus each $f_k$ being a #strong[finite sum of Borel measurable functions], is Borel measurable. \ Then $f$ as #strong[the limit of Borel measurable function sequence] $\(f_k\)$, is Borel measurable. \ \

]
#proof[
#strong[of (b):] \ We define: $ h_n\(x\):= 2^(- n) g_(alpha_n)\(x - x_n\) $ in order to simplify the expression. \ By translation invariance of Lebesgue measure, we have for any $alpha_n$, : $ integral_(bb(R)) g_(alpha_n)\(x - x_n\)thin d m = integral_(bb(R)) g_(alpha_n)\(x\)thin d m_t =\(1 - alpha\)dot.op frac(1 - 0, 1 - alpha) = 1 $
So by homogeneity of integral, $ integral_(bb(R)) h_n\(x\)#h(0em) d m = integral_(bb(R)) 2^(- n) g_(alpha_n)\(x - x_n\)thin d m = 2^(- n) integral_(bb(R)) g_(alpha_n)\(x - x_n\)thin d m = 1 / 2^n $
Thus we have: $ sum_(n = 1)^oo integral_(bb(R))\|h_n\(x\)\|= sum_(n = 1)^oo integral_(bb(R)) h_n\(x\)= frac(1\/2, 1 - 1\/2) = 1 < oo $ by sum of geometric series.
Since this sum of integral of the sequence is finite, we can apply #strong[theorem 2.25 on Folland, to exachange the order of limit and integral], and have: $ integral_(bb(R)) sum_(n = 1)^oo h_n\(x\)= sum_(n = 1)^oo integral_(bb(R)) h_n\(x\)= 1 $
Hence,
$ integral_(bb(R)) f thin d m = integral_(bb(R)) sum_(n = 1)^oo h_n\(x\)d m = sum_(n = 1)^oo integral_(bb(R)) h_n\(x\)d m = 1 $
So $integral_(bb(R)) f < oo$. This proves $f in L^1\(bb(R)\)$. \ \

]
#proof[
#strong[of (c):]

#lemma(
)[
For $f in L^(+)\(mu\)$, if $f\(x\)= + oo$ on a set $S$ where $mu\(S\)> 0$, then $integral f = oo$

]
Proof for Lemma: trivially follows from definition. We can pick make a sequence of simple functions $\(phi.alt_n\)$, setting $phi.alt_n\|_S= n$ (doable since $f\|_S= { oo }$) then we have: $ integral phi.alt_n #h(0em) d mu gt.eq integral n chi_S = n $
So the limit of integral of this simple function sequence is $oo$. \ \ Then (c) follows from the lemma: suppose for contradiction that there exist only countably many $x in bb(R)$ such that $f\(x\)< oo$, we denote this this by $C$, then on $bb(R)\\C$ which has positive measure (since $C$ has measure 0), $f\(x\)= oo$. So by lemma, $integral f = oo$, contradicting with the fact that $integral f = 1$ proven in (b). So there exist uncountably many $x in bb(R)$ such that $f\(x\)< oo$. \ \

]
#proof[
#strong[of (e):]
Fix an interval $I$. By the density of rational numbers in any interval, there exists some rational $x_N in I$. Note that though $g_(alpha_N)\(x_N\)= 0$, $g_(alpha_N)\(x\)$ can be arbitrarily large near $x_N$. \ Fix $M > 0$. \ It suffices to pick some $x$ s.t.
$ 2^(- N) g_(alpha_N)\(x - x_N\)= frac(1 - alpha_N, 2^N)\(x - x_N\)^(- alpha_N)> M $
So by taking any$ x in\(x_N\,x_N +\(frac(2^N M, 1 - alpha_N)\)^(alpha_N)\)inter I $
then it is done. \ Since we already have $2^(- N) g_(alpha_N)\(x - x_N\)> M$, we have $ f\(x\)> 2^(- N) g_(alpha_N)\(x - x_N\)> M $
Since $M$ is arbitrary, this proves that the value of $f$ on $I$ can be unboundedly large, finishing the proof that $ sup_I f = oo $

]
#proof[
#strong[of (d):]
Notice that we first proved (e) and then let's prove (d) using the conclusion of (e). \ Let $x in bb(R)$ s.t. $f\(x\)< oo$. \ Suppose $f$ is continuous at $x$, then by definition, there exists an open neighborhood $B_delta\(x\)=\(x - delta\,x + delta\)$ s.t. $\|f\(y\)- f\(x\)\|< 1 / 83$ for all $y in B_delta\(x\)$. \ But since the neighborhood is an interval, we have:$ sup_(\(x - delta\,x + delta\)) f = oo $ by (e). This two facts contradicts. So by contradiction we have proved that $f$ is discontinuous at $x$. \ So we can conclude that $f$ is discontinuous at any point $x$ s.t. $f\(x\)< oo$. \ \

]
#proof[
#strong[of (f):]
Let $I$ be an interval. \ Suppose we have redefined $f$ on a measure $0$ set. We pick a rational $x_N in I$ (It does not matter whether the new $f$ is defined there.) \ For arbitrary $M > 0$, we can still always find an $x$ s.t. $x in\(x_N\,x_N +\(frac(2^N M, 1 - alpha_N)\)^(alpha_N)\)inter I$ that #strong[keeps its original $f\(x\)$], which guarantees that $f\(x\)> M$, implying $sup_I f = oo$. This is because, if not so, then it means that we have modified the whole interval $\(x_N\,x_N +\(frac(2^N M, 1 - alpha_N)\)^(alpha_N)\)inter I$, #strong[which is not a measure zero set], #strong[conflicting with the statement] \"redefining $f$ on a measure zero set\".
So (e) must still hold true. \ For (d), we apply the same trick as original, getting an open interval around $x$ s.t. $\|f\(y\)- f\(x\)\|< 1 / 83$ for all $y in B_delta\(x\)=\(x - delta\,x + delta\)$. And by the restated (d), even if we modified a set of measure zero on $\(x - delta\,x + delta\)$, we still reaches the the same conclusion that $sup_(\(x - delta\,x + delta\)) f = oo$, thus causing the same contradiction. \ This finishes the proof. \ \

]
#proof[
#strong[of (g):]
WTS: $integral_I f^p thin d m = oo$ for all $p > 1$ and every interval $I$
#strong[Claim: for each $n$, $g_(alpha_n)^p$ #emph[fails] to be in $L^1$ when $p > 1$, i.e its integral is $oo$.]
Fix $p > 1$. \ Since by translation invariance of Lebesgue integral,:
$ integral_(bb(R)) \( 2^(- n) g_(alpha_n)\(x - x_n\)\)^p thin d m #h(0em) = #h(0em) 2^(- n p) integral_(bb(R)) g_(alpha_n)\(x\)^p thin d m $
where
$ g_(alpha_n)\(t\)^p#h(0em) = #h(0em) \( n^(- n) t^(- thin alpha_n) \)^p #h(0em) = #h(0em) n^(- n p) thin t^(- thin p alpha_n) #h(0em) = #h(0em) n^(- n p) thin t^(- thin p thin\(1 - n^(- n)\)) $
Since $p > 1$, there eixst $N$ such that for all $N gt.eq n$, the exponent $- p\(1 - n^(- n)\)$ is less than $- 1$, causing $integral_0^1 t^(- p + p thin n^(- n)) thin d t = + oo$ for sufficiently large $n$. Multiplying by the constant $n^(- n p)$ does not remove the infinity. \ Hence for large enough $n$, each individual summand has an infinite integral, then by monotonicity of integral, $ f^p\(x\)=\(sum_n 2^(- n) g_(alpha_n)\(x - x_n\)\)^p gt.eq 2^(- N) g_(alpha_N)^p\(x - x_N\) $also has an infinite integral, finishing the proof. \ \

]
#emph[Nur für Verrückte]

\(It's #strong[really] not necessary to attempt these problems. Do not, under any circumstances, hand them in!)

+ Make an accurate sketch of the graph of the function in the last problem.
