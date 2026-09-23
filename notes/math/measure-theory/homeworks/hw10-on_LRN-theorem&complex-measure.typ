#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 10: on LRN Theorem and complex measure (40/40)]
<homework-10-on-lrn-theorem-and-complex-measure-4040>
\(Note: For this homework I applied for an one-day extension since I met with some emergent problem with my bank and rent payment.)

#heading(level: 2, numbering: none)[complex measure 的 total variation 的 formulas]
<complex-measure-的-total-variation-的-formulas>
Let $nu$ be a complex measure on a measurable space $\(X\,cal(A)\)$. Prove that, for any $E in cal(A)$: $ \|nu\|\(E\) & = sup { sum_(j = 1)^n\|nu\(E_j\)\|divides n in bb(N)\,E_1 dots.h E_n med upright("disjoint")\,med E = union.big_(j = 1)^n E_j }\
 & = sup { sum_(j = 1)^oo\|nu\(E_j\)\|divides E_1\,E_2\,dots.h upright("disjoint")\,med E = union.big_(j = 1)^oo E_j }\
 & = sup { \| integral_E f thin d nu \| divides f : X arrow.r bb(C) med upright("measurable")\,\|f\|lt.eq 1 } . $

#proof[
Take some positive measure $mu$ s.t. $nu lt.double mu$ (e.g. $mu : =\|Re nu\|+\|Im nu\|$), then by RN Thm there exists $mu$-unique RN derivative $f$, and $\|nu\|$ can be defined by $ d\|nu\|: =\|f\|thin d mu $
Now we denote: $ mu_1\(E\) & := sup { sum_(j = 1)^n\|nu\(E_j\)\|divides n in bb(N)\,E_1 dots.h E_n med upright("disjoint")\,med E = union.big_(j = 1)^n E_j }\
mu_2\(E\) & := sup { sum_(j = 1)^oo\|nu\(E_j\)\|divides E_1\,E_2\,dots.h upright("disjoint")\,med E = union.big_(j = 1)^oo E_j }\
mu_3\(E\) & := sup { \| integral_E f thin d nu \| divides f : X arrow.r bb(C) med upright("measurable")\,\|f\|lt.eq 1 } . $
We will prove the equality by showing that $mu_1 lt.eq mu_2 lt.eq\|nu\|\(E\)lt.eq mu_3 lt.eq mu_1$. \ #strong[Claim 1: $mu_1 lt.eq mu_2$.] \ Proof: This is trivial since for each finite disjoint segmentation $E = union.sq.big_(j = 1)^n E_j$ of $E$ can be made into a countable segmentation of $E$, by taking all $E_N = diameter$ for $N gt.eq n + 1$. So every value included in ${ sum_(j = 1)^n\|nu\(E_j\)\|divides E = union.sq.big_(j = 1)^n E_j }$ is also in ${ sum_(j = 1)^oo\|nu\(E_j\)\|divides E = union.sq.big_(j = 1)^oo E_j }$. Thus taking $sup$, we have the ineq. \ #strong[Claim 2: $mu_2 lt.eq\|nu\|lt.eq mu_3$.] \ Since $nu lt.double\|nu\|$ (Folland prop 3.13), by complex RN Thm we have have $ f := frac(d nu, d\|nu\|) in L^1\(\|nu\|\) $
Notice that #strong[$f$ have absolute value $1$, $\|nu\|$-a.e.] (Folland prop 3.13) \ Suppose $E = union.sq_1^oo E_j$, we have:
$ sum_(j = 1)^oo lr(|nu (E_j)|) & lt.eq sum_(j = 1)^oo\|nu\|(E_j) quad & upright("by property of total variation measure")\
 & =\|nu\|\(E\)= integral_E 1 thin d\|nu\|quad & upright("by ctbl disjoint additivity ")\
 & = integral_E\|f\|^2d\|nu\|= integral_E macron(f) f d\|nu\|quad & upright("since ") f upright(" have absolute value ") 1 upright(" ") nu upright("-a.e.")\
 & = integral_E macron(f) frac(d nu, d\|nu\|) d\|nu\| $
To confirm this equal to $integral macron(f) thin d nu$, we extend Folland prop 3.9 to the complex case.

#proposition(
)[
For complex measure $nu$ and $sigma$-finite positive measure $mu$ s.t. $nu lt.double mu$, if $g in L^1\(nu\)$, then $ g \( frac(d nu, d mu) \) in L^1\(mu\)\,quad integral g thin d nu = integral g \( frac(d nu, d mu) \) d mu $

]
And the proof just follows from the finite signed-measure case, applied both to im part and re part.
$ integral g thin d nu & = integral g thin d\(Re nu\)+ i integral g thin d\(Im nu\)\
 & = integral g \( frac(d\(Re nu\), d mu) \) thin d mu + i integral g \( frac(d\(Im nu\), d mu) \) thin d mu\
 & = integral g \( Re frac(d nu, d mu) + i Im frac(d nu, d mu) \) thin d mu\
 & = integral g \( frac(d nu, d mu) \) d mu $
Now we back to Claim 2, since $f\,macron(f) in L^1\(nu\)$, we have:
$ sum_(j = 1)^oo\|nu (E_j)\| & lt.eq\|nu\|\(E\)\
 & = integral_E macron(f) frac(d nu, d\|nu\|) d\|nu\|\
 & = integral_E macron(f) thin d nu\
 & lt.eq lr(|integral_E macron(f) d nu|) $
Since $\|macron(f)\|lt.eq 1$ (in $nu$-a.e. sense), this shows that every element in ${ sum_(j = 1)^oo\|nu\(E_j\)\|divides E = union.sq.big_(j = 1)^oo E_j }$ is less then or equal to $\|nu\|\(E\)\|$, and $\|nu\|\(E\)\|$ is less then some element in ${ \| integral_E f thin d nu \| divides upright("measurable ")\|f\|lt.eq 1 }$, proves that $mu_2 lt.eq\|nu\|lt.eq mu_3$. \ #strong[Claim 3: $mu_3 lt.eq mu_1$.] \ For arbitrary simple function $phi.alt := sum_1^n c_k chi_(E_k)$ where $lr(|c_k|) lt.eq 1$ for all $k\,E_i$ s are disjoint and $union.big_(i = 1)^n E_i = E$. We have$ lr(|integral_E phi.alt d nu|) & lt.eq sum_(k = 1)^n lr(|c_k integral_(E_k) chi_(E_k) d nu|)\
 & = sum_(k = 1)^n lr(|c_k|) lr(|nu (E_k)|)\
 & lt.eq sum_(k = 1)^n lr(|nu (E_k)|)\
 & lt.eq mu_1\(E\) $
Now we consider the general case: any measurable $f$. \ Fix arbitrary measurable $f$ s.t. $\|f\|lt.eq 1$, since it is measurable, we can choose seq of simple functions $\(phi.alt_n\)_1^oo$ that approximate $f$ pointwisely from below. \ $ lim_(n arrow.r oo) phi.alt_n = f $with $ 0 lt.eq\|phi.alt_1\|lt.eq\|phi.alt_2\|lt.eq dots.h.c lt.eq\|f\| $
Then $\|f\|$ as a dominating function for $\(\|phi.alt_n\|\)_n$, #strong[by DCT] we obtain: $ integral_E f thin d\(Re nu\)= lim_(n arrow.r oo) integral_E phi.alt_n thin d\(Re nu\) $
and $ integral_E f thin d\(Im nu\)= lim_(n arrow.r oo) integral_E phi.alt_n thin d\(Im nu\) $
Thus
$ integral_E f thin d nu & = integral_E f thin d\(Re nu\)+ i integral_E f thin d\(Im nu\)\
 & = lim_(n arrow.r oo) \( integral_E phi.alt_n thin d\(Re nu\)+ i integral_E phi.alt_n thin d\(Im nu\)\)\
 & = lim_(n arrow.r oo) integral_E phi.alt_n d nu $
Since for each $phi.alt_n$, we have $0 lt.eq\|phi.alt_n\(x\)\|lt.eq\|f\(x\)\|lt.eq 1$ for a.e. $x in E$, we can apply the ineq we obtained that $ lr(|integral_E phi.alt_n thin d nu|) lt.eq mu_1\(E\) $ for each $n$. Thus taking limit we get: $ lr(|integral_E f thin d nu|) lt.eq mu_1\(E\) $
Taking supremum over $f$, proves that $mu_3\(E\)lt.eq mu_1\(E\)$. \ Thus since we have shown $mu_1 lt.eq mu_2 lt.eq\|nu\|lt.eq mu_3 lt.eq mu_1$, every inequality above is an equality, i.e.$ mu_1 = mu_2 = mu_3 =\|nu\| $finishing the proof.

]
#heading(level: 2, numbering: none)[complex measure 与其 total variation measure 之间的关系: 整体即可决定局部]
<complex-measure-与其-total-variation-measure-之间的关系-整体即可决定局部>
Let $nu$ be a complex measure on a measurable space $\(X\,cal(A)\)$.

=== $nu\(X\)=\|nu\|\(X\)arrow.l.r.double nu =\|nu\|arrow.l.r.double nu upright(" positive")$
<nuxnux-iff-nu-nu-iff-nu-text-positive>
- $nu\(X\)=\|nu\|\(X\)$\;

- $nu$ is a (finite) positive measure;

- $nu =\|nu\|$.

#proof[
#strong[\(ii) $arrow.r.double.long$ (iii):] If $nu$ is positive then $nu^(-) = 0$, so $nu =\|nu\|= nu^(+)$. \ #strong[\(iii) $arrow.r.double.long$ (i):] Trivially true by taking $E = X$. \ #strong[\(i) $arrow.r.double.long$ (ii):] Take some positive measure $mu$ s.t. $nu lt.double mu$ (e.g. $mu : =\|Re nu\|+\|Im nu\|$), then by RN Thm there exists $mu$-unique RN derivative $f$, and $\|nu\|$ can be defined by $ d\|nu\|: =\|f\|thin d mu $
Then by def $ integral f thin d mu = integral\|f\|thin d mu\,quad i . e . quad integral Re f thin d mu + i integral Im f thin d mu = integral\|f\|thin d mu $
Since the right hand side is real, we have:$ integral\(\|f\|- Re f\)thin d mu = 0 $
Note that, $\|f\|- Re f$ is always nonnegative, so this implies that $Re f =\|f\|#h(0em) mu upright("-a.e.")$ \ Thus $Im f = 0 #h(0em) mu upright("-a.e.")$, so $f =\|f\|$ is real and positive $mu$-a.e.
Thus $ nu\(E\)= integral_E f thin d mu in bb(R)_(+)\,quad forall E in cal(A) $
finishing the proof that $nu$ is a positive measure.

]
=== $\|nu\(X\)\|=\|nu\|\(X\)arrow.l.r.double nu = lambda\|nu\|$ for some $\|lambda\|= 1$
<nuxnux-iff-nulambdanu-for-some-lambda-1>
Prove that the following two conditions are equivalent:

- $\|nu\(X\)\|=\|nu\|\(X\)$\;

- there exists a complex number $lambda$ with $\|lambda\|= 1$ such that $nu = lambda\|nu\|$.

#proof[
#strong[\(i) $arrow.r.double.long$ (ii):] Since $nu lt.double\|nu\|$, by complex RN Thm we have RN derivative $ h := frac(d nu, d\|nu\|) in L^1\(\|nu\|\) $
Notice that #strong[$h$ have absolute value $1$, $\|nu\|$-a.e.] \ Then by def of RN derivative we have $ nu\(X\)= integral_X h d\|nu\| $
Thus
$ \|nu\(X\)\|= lr(|integral_X h d \| nu \||) lt.eq integral_X\|h\|d\|nu\|= integral_X 1 d\|nu\|=\|nu\|\(X\) $
Since we have $\|nu\(X\)\|=\|nu\|\(X\)$, it implie that: $ lr(|integral_X h d \| nu \||) = integral_X\|h\|d\|nu\| $
#strong[Claim: $h$ is constant $\|nu\|$-a.e.] \ We first prove a lemma:

#lemma(
)[
Let $mu$ be a finite positive measure. \ For measurable function $f : X arrow.r bb(C)$, if $\|f\|= k$ a.e. for some nonzero constant $k$ and $ \| integral f thin d mu \| = integral\|f\|thin d mu $
then $f$ must be a.e. constant.

]
Proof of Lemma:
Set:$ c := frac(integral f d mu, lr(|integral f d mu|)) $Then $\|c\|= 1$, and we consider:
$ integral f d mu = c lr(|integral f d mu|) = c integral\|f\|d mu $
Define $g\(x\):= macron(c) f\(x\)$, so:
$ integral g thin d mu = macron(c) integral f thin d mu = macron(c) c integral\|f\|thin d mu = integral\|f\|thin d mu $
Notice $integral\|f\|thin d mu in bb(R)_(+)$ and $ integral g thin d mu = integral Re g thin d mu + i integral Im g thin d mu in bb(C) $Thus $ integral Re g thin d mu = integral\|g\|thin d mu = integral\|f\|thin d mu arrow.r.double.long integral\(Re g -\|g\|\)thin d mu = 0 $
Since by def:$ 0 lt.eq Re g lt.eq\|g\| $
We must have$ Re g =\|g\|quad a . e . $
This proves that $g$ is a.e. real. And also since $\|g\|=\|f\|= k$ a.e., #strong[$g$ is then constant $k$ a.e.] \ Therefore, #strong[$f$ is constant $k / macron(c)$ a.e.] \ \ Now we go back to the proof of the original statement. By our Lemma we get: $ h = lr(|integral h thin d mu|) / accent(integral h thin d mu, macron) quad upright("constant for ")\|nu\|upright("-a.e. ") x $
Therefore, $ nu = lr(|integral h thin d mu|) / accent(integral h thin d mu, macron)\|nu\| $
This finishes the proof of (i) $arrow.r.double.long$ (ii). \ #strong[\(ii) $arrow.r.double.long$\(i):] This direction is trivial. Since $nu = lambda\|nu\|$, we have $ \|nu\(X\)\|=\|lambda\|\|nu\|\(X\)= 1\|nu\|\(X\)=\|nu\|\(X\) $

]
==  complex measures on $\(X\,cal(A)\)$ 组成一个 complex Banach space
<complex-measures-on-xmathcala-组成一个-complex-banach-space>
Let $\(X\,cal(A)\)$ be a measurable space. Prove that the set $cal(M)$ of complex measures on $\(X\,cal(A)\)$ is a complex Banach space, with norm given by $parallel nu parallel :=\|nu\|\(X\)$.

#proof[
#strong[Claim 1: $cal(M)$ is a complex vector space], with addition operation defined by the addition of two complex measures, and scalar multiplication defined by scaling a complex measure by a complex number. \ Proof of Claim 1:
For $nu\,mu in cal(M)$, and $alpha in bb(C)$, define:

- $\(nu + mu\)\(E\):= nu\(E\)+ mu\(E\)$ for all $E in cal(A)$

- $\(alpha nu\)\(E\):= alpha dot.op nu\(E\)$ for all $E in cal(A)$.

Then: $\(nu + mu\)\(diameter\)= 0 + 0 = 0\,\(alpha nu\)\(diameter\)= alpha 0 = 0$. \ Also, $nu + mu$ and $alpha nu$ are both countably additive, since sum and scalar multiples preserve this property: for $E = union.sq.big_(j = 1)^oo E_j$ with each $E_j in cal(A)$, we have: $ \(nu + mu\)\(union.sq.big_(j = 1)^oo E_j\)= nu\(union.sq.big_(j = 1)^oo E_j\)+ mu\(union.sq.big_(j = 1)^oo E_j\)= nu\(E\)+ nu\(E\)=\(nu + mu\)\(E\) $and $ \(alpha nu\)\(union.sq.big_(j = 1)^oo E_j\)= alpha dot.op nu\(union.sq.big_(j = 1)^oo E_j\)= alpha nu\(E\) $So they are also complex measures, showing that $cal(M)$ is closed under addition and scalar multiplication, thus a complex vector space. \ #strong[Claim 2: total variation $parallel nu parallel : =\|nu\(X\)\|$ defines a norm on $cal(M)$.] \ Proof of Claim 2:
To verify this is a norm, we check the norm requirements:

- #strong[Nonnegative]: $parallel nu parallel gt.eq 0$, and $parallel nu parallel = 0 arrow.l.r.double nu = 0$ \ Proof: $parallel nu parallel gt.eq 0$ follows from that $\|nu\|$ is a p.m. \ Since we know $nu lt.double\|nu\|$, if $\|nu\|\(X\)= 0$ then $X$ is a null set of $\|nu\|$, and thus is a null set for $nu$, so $nu = 0$\; \ Conversely, if $nu = 0$ then $ parallel nu parallel :=\|nu\|\(X\)= sup { sum_(j = 1)^n\|nu\(E_j\)\|: X = union.sq.big_(j = 1)^n E_j } = sup { 0 } = 0 $finishing the proof that $parallel nu parallel = 0 arrow.l.r.double nu = 0$

- #strong[Homogeneity]: $parallel alpha nu parallel =\|alpha\|dot.op parallel nu parallel$ \ Proof: $ parallel alpha nu parallel :=\|alpha nu\|\(X\) & = sup { sum_(j = 1)^n\|alpha nu\(E_j\)\|: X = union.sq.big_(j = 1)^n E_j }\
   & =\|alpha\|sup { sum_(j = 1)^n\|nu\(E_j\)\|: X = union.sq.big_(j = 1)^n E_j }\
   & =\|alpha\|\|nu\|\(X\)=\|alpha\|parallel nu parallel $

- #strong[Triangle inequality]: $parallel nu + mu parallel lt.eq parallel nu parallel + parallel mu parallel$ \ Proof:
  $ \|nu + kappa\|\(X\) & = sup {sum_(i = 1)^n \| \( nu + kappa \) \( E_i \) \| : X = union.sq.big_(i = 1)^N E_i}\
   & lt.eq sup {sum_(i = 1)^n \( \| nu \( E_i \) \| + \| kappa \( E_i \) \| \) : X = union.sq.big_(i = 1)^N E_i} quad & upright("by tri ineq in ") bb(R)\
   & = sup {sum_(i = 1)^n \| nu \( E_i \) \| + sum_(i = 1)^n \| kappa \( E_i \) \| : X = union.sq.big_(i = 1)^N E_i}\
   & lt.eq sup {sum_(i = 1)^n \| nu \( E_i \) \| : X = union.sq.big_(i = 1)^N E_i} + sup {sum_(i = 1)^n \| kappa \( E_i \) \| : X = union.sq.big_(i = 1)^N E_i}\
   & =\|nu\|\(X\)+\|kappa\|\(X\) $

Here we have finished the proof of $\(cal(M)\,parallel dot.op parallel\)$ being a normed $bb(C)$-vector space. \ #strong[Claim 3: $\(cal(M)\,parallel dot.op parallel\)$ is complete (thus Banach space)] \ Proof:
Let $\(nu_n\)$ be a Cauchy sequence in $cal(M)$. We have
$ \|nu_n\(B\)- nu_m\(B\)\|=\|\(nu_n - nu_m\)\(B\)\|lt.eq\|\(nu_n - nu_m\)\(X\)\|= parallel nu_n - nu_m parallel quad upright("for all ") B in cal(A) $
In particular, $\(nu_n\(B\)\)_n$ is a Cauchy sequence for all $B in cal(A)$. For each $B in cal(A)$, this is a Cauchy seq in $bb(C)$, thus converges. So we can get: $ nu\(B\):= lim_n nu_n\(B\) $
as the pointwise limit (by a point we mean a set). \ #strong[Claim 3.1: $nu in cal(M)$]. \ Since for all $n$, $nu_n\(diameter\)= 0$, we have:
$ nu\(diameter\):= lim_n nu_n\(diameter\)= 0 $
For a countable disjoint union of measurable sets $E = union.sq.big_(i = 1)^oo E_i$, $ nu\(E\)= lim_n nu_n\(E\)= lim_n sum_i nu_n\(E_i\) $We know by property of total variation measure that for each $n$ we have: $ sum_i\|nu_n\(E_i\)\|<\|nu_n\|\(X\)= parallel nu_n parallel < M $for some uniform bound $M$ for each $n$, since $parallel nu_n parallel$ is a Cauchy seq in $bb(C)$. Thus we can exchange the order of taking limit and sum. Then we get: $ nu\(E\)= lim_n nu_n\(E\)= lim_n sum_i nu_n\(E_i\)= sum_i lim_n nu_n\(E_i\)= sum_i nu\(E_i\) $
verifying the countable disjoint additivity. \ And notice, as we have mentioned, for each measurable set $E in cal(A)$, since $\(nu_n\(E\)\)_n$ is a Cauchy sequence in $bb(C)$#strong[, it is bounded], verifying that $nu$ #strong[is a valid complex measure.] \ #strong[Claim 3.2: $nu_n arrow.r nu$ in $parallel dot.op parallel$.] \ Fix $epsilon.alt > 0$. \ By Cauchy in $parallel dot.op parallel$, there exists $N in bb(N)$ s.t. for all $m\,n gt.eq N$
, we have $ parallel nu_m - nu_n parallel =\|nu_m - nu_n\|\(X\)< epsilon.alt $Fix $n gt.eq N$, and consider the sequence $nu_m$. Then $nu_m arrow.r nu$ pointwise implies #strong[$nu_n - nu_m arrow.r nu_n - nu$ pointwise.] Thus
$ ∥nu_n - nu∥ =\|nu_n - nu\|\(X\)lt.eq liminf_(m arrow.r oo)\|nu_n - nu_m\|\(X\)< epsilon.alt $
Since $epsilon.alt > 0$ is arbitrary, this shows that, $∥nu_n - nu∥ arrow.r 0$ as $n arrow.r oo$, proving the convergence is in norm. \ Now we conclude that $\(cal(M)\,parallel dot.op parallel\)$ is a Banach space.

]
#heading(level: 2, numbering: none)[Positivity]
<positivity>
Let $nu_1$, $nu_2$ be complex measures on a measurable space $\(X\,cal(A)\)$ such that $parallel nu_1 + nu_2 parallel = parallel nu_1 parallel + parallel nu_2 parallel$. Is it true that there exists a nonzero constant $a in bb(C)$ such that $a nu_1$ and $a nu_2$ are both positive measures?

#solution[
No, not necessarily.

]
#proof[
Consider $X : = { m\,n }$ \ Define $nu_1\,nu_2$ by atoms: $ nu_1\({ m }\)= nu_2\({ m }\)= 1\,quad nu_1\({ n }\)= nu_2\({ n }\)= - 1 $ Then $ parallel nu_1 + nu_2 parallel = parallel 2 nu_1 parallel =\|2 nu_1\|\(X\)= 4 = parallel nu_1 parallel + parallel nu_2 parallel $
But there is no nonzero constant $a in bb(C)$ such that $a nu_1$ and $a nu_2$ are both positive measures. \ This is because for any nonzero constant $a$ scaled on $nu_1$: #strong[if $a$ real, then it either flip, or preserve the sign of $nu_1\({ m }\)$ and $nu_1\({ n }\)$, where there is always one positive number and one negative number between them; if $a$ complex, then make the two numbers complex.] \ In both case, $nu_1$ cannot become a positive measure. And since $nu_2$ is defined the same as $nu_1$, same for it.
Therefore it can never become positive measure by scaling a nonzero constant.

]
#heading(level: 2, numbering: none)[Averaging: Conditional Expectation]
<averaging-conditional-expectation>
Let $\(X\,cal(A)\,mu\)$ be a finite measure space (i.e.~a measure space such that $mu\(X\)< oo$). Let $cal(B) subset cal(A)$ be a sub-$sigma$-algebra, and set $nu := mu\|_(cal(B))$. Thus $\(X\,cal(B)\,nu\)$ is also a finite measure space.

- Prove that if $f : X arrow.r bb(C)$ is $cal(B)$-measurable, then $f$ is $cal(A)$-measurable. Is the converse true?

- Suppose that $f in L^1\(mu\)$. Prove that there exists a $cal(B)$-measurable function $g in L^1\(nu\)$ such that $integral_E f thin d mu = integral_E g thin d nu$ for all $E in cal(B)$. Also prove that any two such functions $g$ must agree outside a set of $nu$-measure zero.

- Construct $g$ explicitly in the case when $X = { 1\,2\,3\,4 }$, $cal(A) = cal(P)\(X\)$, $mu\({ i }\)= 1\/4$ for $i in X$, and $cal(B) = { nothing\,{ 1\,2 }\,{ 3\,4 }\,X }$.
  Thus, given the four complex numbers $f\(i\)$, $1 lt.eq i lt.eq 4$, you should find the four complex numbers $g\(i\)$, $1 lt.eq i lt.eq 4$.

#emph[Hint]: use the Radon--Nikodym Theorem.
#emph[Remark]: if $mu$ is a probability measure, then we can view $g$ as the conditional expectation of (the random variable) $f$ with respect to the $sigma$-algebra $cal(B)$.

#proof[
#strong[of (a):]
Suppose $f : X arrow.r bb(C)$ is $cal(B)$-measurable, then for any Borel set $B subset bb(C)$, $f^(- 1)\(B\)in cal(B) subset cal(A)$, so $f$ is $cal(A)$ -measurable. \ The converse is not true. \ Consider $X = { 0\,1\,2\,3 }\,A := cal(P)\(X\)\,cal(B) := { diameter\,X }$. \ Consider $f : x mapsto x$ from $X$ to $bb(R)$. \ $f$ is $cal(A)$-measurable since $cal(A)$ is the power set, containing all subsets of $X$. \ But $f^(- 1)\({ 0 }\)= { 0 } in.not cal(B)$. Thus $f$ is not $cal(B)$-measurable.

]
#proof[
#strong[of (b):]
Let $nu := mu\|_(cal(B))$, and define a signed measure on $cal(B)$ by:
$ thin lambda\(E\):= integral_E f d mu\,quad E in cal(B) $
Then $lambda lt.double nu$, since $nu\(E\)= mu\(E\)= 0 arrow.r.double.long lambda\(E\)= 0$. \ By Radon-Nikodym Thm, there exists a $cal(B)$-measurable function $g in L^1\(nu\)$ such that
$ lambda\(E\)= integral_E g thin d nu quad upright(" for all ") E in cal(B) $
Then $ integral_E f thin d mu = integral_E g thin d nu\,quad forall E in cal(B) $
Suppose $g_1\,g_2$ are both such functions, then
$ integral_E (g_1 - g_2) d nu = 0 quad forall E in cal(B) $
Define $ G^(+) : = { g_1 - g_2 > 0 }\,G^(-) : = { g_1 - g_2 < 0 } $ These two sets are in $cal(B)$ since $g_1\,g_2$ are $cal(B)$-measurable.
Then we have: $ integral_(G^(+))\(g_1 - g_2\)thin d nu = integral_(G^(-))\(g_1 - g_2\)thin d nu = 0 $
Since on $G^(+)$ we have $g_1 - g_2 > 0$, $ integral_(G^(+))\(g_1 - g_2\)thin d nu = 0 arrow.r.double.long integral_(G^(+))\|g_1 - g_2\|thin d nu = 0 arrow.r.double.long g_1 = g_2 thin thin nu upright("-a.e. on ") G^(+) arrow.r.double.long nu\(G^(+)\)= 0 $
Similarly, since on $G^(-)$ we have $g_1 - g_2 < 0$, $ integral_(G^(-))\(g_1 - g_2\)thin d nu = 0 arrow.r.double.long - integral_(G^(-))\|g_1 - g_2\|thin d nu = 0 arrow.r.double.long g_1 = g_2 thin thin nu upright("-a.e. on ") G^(+) arrow.r.double.long nu\(G^(-)\)= 0 $
Thus $ nu { g_1 eq.not g_2 } = nu\(G^(+)\)+ nu\(G^(-)\)= 0 $
This finishes the proof.

]
#solution[
#strong[of (c):]
Given:

- $X = { 1\,2\,3\,4 }$

- $cal(A) = cal(P)\(X\)$

- $mu\({ i }\)= 1\/4$ for each $i$

- $cal(B) = { nothing\,{ 1\,2 }\,{ 3\,4 }\,X }$

Suppose we have: $f : X arrow.r bb(C)$, so $f\(i\)in bb(C)$ for $i = 1\,2\,3\,4$. We want to find: $g\(i\)in bb(C)\,i = 1\,2\,3\,4$, such that $g$ is $cal(B)$-measurable and $ integral_E f thin d mu = integral_E g thin d nu quad upright(" for all ") E in cal(B) $
Notice that $cal(B) = { nothing\,{ 1\,2 }\,{ 3\,4 }\,X }$, we must set $g\(1\)= g\(2\)$ and $g\(3\)= g\(4\)$, this is because, suppose if we set $g\(1\)eq.not g\(2\)$, then it will happen that $ 1 in g^(- 1)\(g\(1\)\)in.rev.not 2 $
No set in $cal(B)$ satisfy this condition, thus $g^(- 1)\(g\(1\)\)in.not cal(B)$, contradicts that $g$ is $cal(B)$-measurable. \ Thus we set $ g\(1\)= g\(2\)= a\,quad g\(3\)= g\(4\)= b $We have: $ integral_({ 1\,2 }) g thin d nu = integral_({ 1\,2 }) f thin d nu = f\(1\)mu\({ 1 }\)+ f\(2\)mu\({ 2 }\)= frac(f\(1\)+ f\(2\), 4) $and $ integral_({ 3\,4 }) g thin d nu = integral_({ 1\,2 }) f thin d nu = f\(3\)mu\({ 3 }\)+ f\(4\)mu\({ 4 }\)= frac(f\(3\)+ f\(4\), 4) $
while on the other hand $ integral_({ 1\,2 }) g thin d nu = frac(g\(1\)+ g\(2\), 4) = a / 2\,quad integral_({ 3\,4 }) g thin d nu = frac(g\(3\)+ g\(4\), 4) = b / 2 $
Thus $g$ is defined by: $ g\(1\)= g\(2\)= frac(f\(1\)+ f\(2\), 2)\,quad g\(3\)= g\(4\)= frac(f\(3\)+ f\(4\), 2) $
Thus what $g$ expressses: is the conditonal expectation of $f$ on ${ 1\,2 }\,{ 3\,4 }$. \ (Therefore it can be generalized: given any sub $sigma$-algebra $cal(B) subset cal(A)$, there exists a $mu\|_(cal(B))$-unique $cal(B)$ measurable function $g in L^1\(mu\|_(cal(B))\)$, that is the conditional expectation
$ g = bb(E)\[f divides cal(B)\] $
s.t. for $B in cal(B)$, $ integral_B f d mu = integral_B bb(E)\[f divides cal(B)\]thin d mu $
it gives the average of $f$ on sets in $cal(B)$\.)

]
#emph[Nur für Verrückte]

\(It's #strong[really] not necessary to attempt these problems. Do not, under any circumstances, hand them in!)
To any measure space $\(X\,cal(A)\)$ we can associate a new measure space $\(Y\,cal(B)\)$, where $Y$ is the Banach space of complex measures on $\(X\,cal(A)\)$, and $cal(B)$ is the Borel $sigma$-algebra on $Y$.

- Does this operation define a functor from the category of measurable spaces to itself. Is this functor (if well defined) full? Is it faithful? Is it essentially surjective?

- Does the operation above admit any nontrivial fixed points (up to isomorphism)?
