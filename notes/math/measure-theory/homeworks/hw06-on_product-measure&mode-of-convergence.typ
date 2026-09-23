#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 6: on product measure and mode of convergence (49/50)]
<homework-6-on-product-measure-and-mode-of-convergence-4950>
#emph[Some of the following questions will be graded. Do them, and do hand them in].

#heading(level: 2, numbering: none)[Order of integration: $integral_0^oo integral_x^oo e^(- y^2\/2) #h(0em) d y #h(0em) d x = 1$]
<order-of-integration-int_0inftyint_xinfty-e-y22d-y-d-x1>
Use Tonelli's Theorem and 1-variable calculus to give a rigorous proof for the equality
$ integral_0^oo integral_x^oo e^(- y^2\/2) #h(0em) d y #h(0em) d x = 1 $

#proof[
Define $ f\(x\,y\):= cases(delim: "{", e^(- y^2\/2)\, & upright("if ") 0 lt.eq x lt.eq y\,, 0\, & upright("otherwise") .) $ Then we have $ integral_0^oo integral_x^oo e^(- y^2\/2) #h(0em) d y #h(0em) d x = integral \[ integral f\(x\,y\)#h(0em) d m\(y\)\] #h(0em) d m\(x\) $
Since $f\(x\,y\)= e^(- y^2\/2)$ is #strong[nonnegative] and #strong[continuous], it is measurable and thus in $L^(+)\(X times Y\)$, where $X = Y =\(bb(R)\,cal(L)\,m\)$ is $sigma$-finite. \ Thus we can apply Tonelli's theorem: $ integral \[ integral f\(x\,y\)#h(0em) d m\(y\)\] #h(0em) d m\(x\) & = integral f #h(0em) d\(m\(x\)times m\(y\)\)\
 & = integral \[ integral f\(x\,y\)#h(0em) d m\(x\)\] #h(0em) d m\(y\)\
 & = integral \[ integral f\(x\,y\)#h(0em) d m\(x\)\] #h(0em) d m\(y\)\
 & = integral \[ integral e^(- y^2\/2) #h(0em) d m\(x\)\] #h(0em) d m\(y\) $Where$ integral e^(- y^2\/2) #h(0em) d m\(x\)= integral_(\[0\,y\]) e^(- y^2\/2) #h(0em) d x = y e^(- y^2\/2) $
Thus $ integral \[ integral f\(x\,y\)#h(0em) d m\(y\)\] #h(0em) d m\(x\) & = integral \[ integral e^(- y^2\/2) #h(0em) d m\(x\)\] #h(0em) d m\(y\)\
 & = integral y e^(- y^2\/2) #h(0em) d m\(y\)\
 & = integral_(\[0\,oo\)) y e^(- y^2\/2) #h(0em) d y $
Make the substitution $t = y^2 / 2$, then we have
$ integral_0^oo y thin e^(- y^2\/2) thin d y = integral_0^oo e^(- t) thin d t = \[ - e^(- t) \]_0^oo = 1 $
This finishes the proof that $ integral_0^oo integral_x^oo e^(- y^2\/2) #h(0em) d y #h(0em) d x = 1 $

]
#heading(level: 2, numbering: none)[integration of a function $=$ Area under the curve]
<integration-of-a-function-area-under-the-curve>
Let $\(X\,cal(A)\,mu\)$ be a $sigma$-finite measure space, and let $f in L^(+)\(X\)$. Consider the subset $G_f subset X times\[0\,oo\)$ consisting of all points $\(x\,y\)$ with $y < f\(x\)$.

- Prove that $G_f$ is $cal(A) times.o cal(B)_(bb(R))$-measurable.

- Prove that $\(mu times.o m\)\(G_f\)= integral f #h(0em) d mu$.

#remark[
这个 $G_f$ 即为 $f : X arrow.r bb(R)$ 的 graph 下的 area,

]
#proof[
#strong[of 2(a):] \ $ y < f\(x\)quad arrow.l.r.double quad exists thin q in bb(Q)\,#h(0em) y < q < f\(x\) $
Hence
$ G_f = union.big_(q in bb(Q)\,thin q > 0) \( { x : f\(x\)> q } times { y : y < q } \) $
Since ${ x : f\(x\)> q } in cal(A)$ (by the measurability of $f$) and ${ y : y < q } in cal(B)_(bb(R))$, each set in the union is a measurable rectangle, thus measurable in the product measurable space $X times bb(R)$. Since a countable union of measurable sets is measurable in the product $sigma$-algebra,
We have $ G_f in cal(A) times.o cal(B)_(bb(R)) $

]
#proof[
#strong[of 2(b)]: \ Since $f gt.eq 0$, and $sigma$-finiteness of $X$ is assumed, $sigma$-finiteness of $Y$ is known, \ we can apply Tonelli's theorem to compute:
$ \(mu times.o m\)\(G_f\) & = integral_(X times\[0\,oo\)) chi_(G_f)\(x\,y\)thin d\(mu times.o m\)\
 & = integral_X \[ integral_(\[0\,oo\)) chi_(G_f)\(x\,y\)thin d m\(y\)\] #h(0em) d mu\(x\) $
By definition of $G_f$, $chi_(G_f)\(x\,y\)= 1$ if and only if $y < f\(x\)$, and $0$ otherwise. Hence, for each fixed $x$,
$ integral_(\[0\,oo\)) chi_(G_f)\(x\,y\)thin d m\(y\)= integral_(\[0\,oo\)) chi_({ y < f\(x\)}) thin d m\(y\)= cases(delim: "{", f\(x\)\, & upright("if ") f\(x\)< oo\,, oo\, & upright("if ") f\(x\)= oo) $
Therefore
$ integral_(\[0\,oo\)) chi_(G_f)\(x\,y\)thin d m\(y\)= f\(x\)#h(0em) #h(0em) a . e . $
Applying Tonelli's theorem again yields
$ \(mu times.o m\)\(G_f\)= integral_X \[ integral_(\[0\,oo\)) chi_(G_f)\(x\,y\)thin d m\(y\)\] #h(0em) d mu\(x\)= integral_X f\(x\)thin d mu\(x\) $
Thus we conclude that
$ \(mu times.o m\)\(G_f\)= integral_X f thin d mu $

]
#heading(level: 2, numbering: none)[Oscillations: $f_n\(x\)=\(sin\(pi n x\)\)^n arrow.r f = 0$ in measure]
<oscillations-f_nxsinpi-n-xn-to-f-0-in-measure>
Consider the sequence $f_n\(x\)=\(sin\(pi n x\)\)^n$, $n = 1\,2\,dots.h$, on the interval $\[0\,1\]$. Prove that there exists a set $E subset\[0\,1\]$ such that $m\(E^c\)lt.eq 2^(- 597)$ and a sequence $1 lt.eq n_1 < n_2 < dots.h$ such that $\|f_(n_j)\(x\)\|lt.eq j^(- 597)$ for all $x in E$ and all $j gt.eq 1$. #emph[Hint]: use E. Consider convergence in measure

#proof[
#strong[Claim 1: It suffices to show that $f_n$ converges in measure.] \ Proof of Claim 1: Suppose $f_n$ converges in measure to $f = 0$, then by Folland 2.30, there exists a subseq $\(f_(n_k)\)arrow.r^(k arrow.r oo) f = 0$ a.e. \.And since $\[0\,1\]$ has #strong[finite measure] $1$, #strong[by Egoroff's Theorem], for any $epsilon.alt > 0$ there exists $E subset\[0\,1\]$ s.t. $mu\(E^c\)< epsilon.alt$ and $\(f_(n_k)\)arrow.r^(k arrow.r oo) f = 0$ #strong[uniformly] on $E$. \ Then we take $epsilon.alt : = 2^(- 597)$and coresponding $E$. \ And for each $j in bb(N)$, we let $delta_j = j^(- 597)$. By the uniform convergence property of $\(f_(n_k)\)$, we can take $N_j$ s.t. $\|f_(n_k)\(x\)\|< delta_j$ for all $x in E$ whenever $n_k gt.eq N_j$. \ Therefore, $E$ and the sequence $\(f_(N_j)\)$ satisfty the requirements in the context. \ This shows that, #strong[as long as we can show $\(f_n\)$ converges in measure] to $f = 0$, the statement is proved. \ \ Let $f_n\(x\): = sin\(n pi x\)^n$ for $n in bb(N)$. \ #strong[Claim 2:] $f_n$ #strong[converges in measure.] \ Proof of Claim 2: The idea is that the exponent $n$ makes the sequence converge faster than the linear growth of $n x$ that shortens a period and messes up the sin values. \ Fix $epsilon.alt > 0$. (WLOG $epsilon.alt < 1$\.) WTS: $ m\({ x :\|sin\(n pi x\)gt.eq epsilon.alt^(1\/n) }\)arrow.r 0 quad upright(" as ") n arrow.r oo $
We know that $sin\(n pi x\)= 1$ iff $x = frac(2 k - 1, 2 n)$ for some $k = 0\,dots.h.c\,2 n - 1$.
Consider $x in\[0\,frac(1, 2 n)\)$, let $\|sin\(n pi x_0\)\|: = epsilon.alt^(1\/n)$. \ Denote $ delta_n := \| frac(1, 2 n) - x_0 \| $
Then we can express the measure as: $ m\({ x :\|sin\(n pi x\)gt.eq epsilon.alt^(1\/n) }\)= 2 n delta_n $
Notice that by the monotonicity of arcsin function, we can solve for $x_0$ as:$ x_0 = frac(1, n pi) arcsin\(epsilon.alt^(1 / n)\) $
Thus $ delta_n = frac(1, 2 n) = frac(1, n pi) arcsin\(epsilon.alt^(1 / n)\) $
Thus $ lim_(n arrow.r oo) m\({ x :\|sin\(n pi x\)gt.eq epsilon.alt^(1\/n) }\) & = lim_(n arrow.r oo) 2 n delta_n\
 & = 1 - lim_(n arrow.r oo) 2 / pi arcsin\(epsilon.alt^(1 / n)\)\
 & = 1 - 2 / pi dot.op pi / 2\
 & = 0 $
Since $epsilon.alt$ is arbitrary, this finishes the proof that $f_n arrow.r f = 0$ in measure. \ Thus combining Claim 1, the whole statement is proved.

]
#heading(level: 2, numbering: none)[Indicator functions 是 $L^(+)$ 的一个 closed subset]
<indicator-functions-是-l-的一个-closed-subset>
Let $\(X\,cal(A)\,mu\)$ be any measure space. Let $M subset L^(+)$ be the set of indicator functions $chi_E$, where $E in cal(A)$ and $mu\(E\)< oo$. Prove that $M$ is a closed subset of $L^1$. In other words, prove that $M subset L^1$, and that if $f_n in M$, $f in L^1$, and $integral\|f_n - f\|arrow.r 0$, then $f in M$.

#proof[
Let $\(f_n := chi_(E_n)\)_(n in bb(N))$ be a seq of indicator functions in $L^(+)$ s.t. $integral\|f_n - f\|arrow.r 0$ for some $f in L^1$. \ Define for all $k in bb(N)$ $ A_k := { x :\|f\(x\)\|> 1 / k\,\|f\(x\)- 1\|> 1 / k } $
Fix one $k in bb(N)$, bt monotonicity of integration in $L^1$, we have
$ integral\|f - chi_(E_n)\|gt.eq integral_(A_k)\|f - chi_(E_n)\|gt.eq integral_(A_k) 1 / k gt.eq frac(mu\(A_k\), k) $
Thus $ mu\(A_k\)lt.eq k integral\|f - chi_(E_n)\| $
Since $chi_(E_n) arrow.r f$ in $L^1$, it follows that $mu\(A_k\)= 0$. \ Since $A_k$ is arbitrary, by ctbl sub additivity, $ mu\(union.big_(k = 1)^oo A_k\)lt.eq sum_(k = 1)^oo mu\(A_k\)= 0 $
Define $ A := { x : f\(x\)eq.not 0\,1 } $
By the definition of $A_k$, we have the equality: $ A = union.big_(k = 1)^oo A_k $
Thus $mu\(A\)= 0$, which means that $f\(x\)in { 0\,1 }$ a.e., showing that $f$ is a.e. an indicator function, in the same equivalence class of some indicator function in $L^1$, thus we have $f in M subset L^1$. This finishes the proof that $M$ is a closed subset of $L^1$.

]
#heading(level: 2, numbering: none)[a complete metric space of measurable functions (other then $L^1\(mu\)$) ]
<a-complete-metric-space-of-measurable-functions-other-then-l1mu>
Suppose that $\(X\,cal(A)\,mu\)$ is a measure space such that $mu\(X\)< oo$. Set $chi\(t\)= frac(t, 1 + t)$ for $t gt.eq 0$. \ Given measurable functions $f\,g : X arrow.r bb(C)$, set$ rho\(f\,g\):= integral chi\(\|f - g\|\)#h(0em) d mu $

- Prove that $rho$ induces a metric, also denoted $rho$, on the space $ L := { f : X arrow.r bb(C) med upright("measurable") }\/#h(-1em) #h(-1em) tilde.op\, $
  where $f tilde.op g$ iff $f = g$ a.e. #emph[Hint]: prove that $chi\(s + t\)lt.eq chi\(s\)+ chi\(t\)$ for $s\,t gt.eq 0$.

- Prove that if $f_n\,f in L$, then $rho\(f_n\,f\)arrow.r 0$ iff $f_n arrow.r f$ in measure.

- Prove that $\(L\,rho\)$ is a complete metric space.

#remark[
#strong[对于任何 measure $mu$, $L^1\(mu\)$ 都是一个 complete metric space (因为它是 Banach space)]\; 这里, 我们略微修改了 $L^1\(mu\)$ 的 metric, 嵌套了一个函数, 但是它#strong[仍然是一个 complete metric space.]

]
#proof[
#strong[of 5(a):]
$chi\(t\)= frac(t, 1 + t) = 1 - frac(1, 1 + t)$ is an increasing function on $t gt.eq 0$. \ #strong[Claim: for all $s\,t gt.eq 0$, we have $chi\(s\)+ chi\(t\)lt.eq chi\(s + t\)$.] \ #strong[Proof of claim:] \ Let $s\,t gt.eq 0$, we have
$ chi\(s\)+ chi\(t\)= frac(s, 1 + s) #h(0em) + #h(0em) frac(t, 1 + t) = frac(s\(1 + t\)+ t\(1 + s\), \(1 + s\)\(1 + t\)) = frac(s + s t + t + t s, \(1 + s\)\(1 + t\)) = frac(s + t + 2 s t, \(1 + s\)\(1 + t\)) $
while
$ chi\(s + t\)= frac(s + t, 1 + s + t) $
Note
$ \(s + t\)\(1 + s\)\(1 + t\)=\(s + t\)\(1 + s + t + s t\) & = s + t + s^2 + 2 s t + t^2 + s^2 t + s t^2\
\(s + t + 2 s t\)\(1 + s + t\) & = s + t + s^2 + 4 s t + t^2 + 2 s^2 t + 2 s t^2 $
We have: $ \(s + t\)\(1 + s\)\(1 + t\)lt.eq\(s + t + 2 s t\)\(1 + s + t\) $
Since $\(1 + s + t\)$ and $\(1 + s\)\(1 + t\)$ are positive, we can rearrange the ineq to be $ frac(s + t, 1 + s + t) lt.eq frac(s + t + 2 s t, \(1 + s\)\(1 + t\)) $ which is exactly $ chi\(s\)+ chi\(t\)lt.eq chi\(s + t\) $
as needed. \ \ First, $rho$ is a well-defined function on the quotient set, since if $f tilde.op g$ and $f' tilde.op g'$ then $\|f - g\|=\|f' - g'\|$ a.e. Consequently,
$ chi \(\|f - g\|\) #h(0em) = #h(0em) chi \(\|f' - g'\|\) quad upright("a.e.") $and hence $ integral_X chi \(\|f - g\|\) thin d mu = integral_X chi \(\|f' - g'\|\) thin d mu $
Now we prove that $rho$ is a metric:

- #strong[Nonnegativity]: $rho\(f\,g\)gt.eq 0$ is immediate since $chi\(dot.op\)gt.eq 0$ and $mu$ is a measure; and since $chi\(h\)= 0$ iff $h = 0$ a.e., we have $rho\(f\,g\)= 0$ iff $f = g$ a.e., that is, $f = g in L^1\(mu\)$

- #strong[Symmetry]: $rho\(f\,g\)= rho\(g\,f\)$ follows immediately from $chi\(\|f - g\|\)= chi\(\|g - f\|\)$.

- #strong[Triangle inequality]: For any three functions $f\,g\,h$, we have pointwise $ \|f\(x\)- h\(x\)\|#h(0em) lt.eq #h(0em)\|f\(x\)- g\(x\)\|+\|g\(x\)- h\(x\)\|. $
  Then applying the subadditivity of $chi$ proved above, we have: $ chi \(\|f\(x\)- h\(x\)\|\) lt.eq chi \(\|f\(x\)- g\(x\)\|+\|g\(x\)- h\(x\)\|\) lt.eq chi \(\|f\(x\)- g\(x\)\|\) + chi \(\|g\(x\)- h\(x\)\|\) $
  Integrating both sides over $X$ gives $ rho\(f\,h\)= integral_X chi \(\|f - h\|\) thin d mu lt.eq integral_X chi \(\|f - g\|\) thin d mu + integral_X chi \(\|g - h\|\) thin d mu = rho\(f\,g\)+ rho\(g\,h\) $

Therefore, $rho$ is a metric on $L #h(0em) = #h(0em) { f : X arrow.r bb(C) upright(" measurable") }\/#h(-1em) #h(-1em) tilde.op$ as desired.

]
#proof[
#strong[of 5(b)]: \ #strong[Claim 1: $rho\(f_n\,f\)arrow.r 0$ $arrow.r.double.long$ $f_n arrow.r f$ in measure] \ Suppose $rho\(f_n\,f\)arrow.r 0$. Let $epsilon.alt > 0$. \ Since $chi\(t\)= frac(t, 1 + t)$ is #strong[strictly increasing] in $t$: $ \|f_n - f\|> epsilon.alt arrow.l.r.double chi \(\|f_n - f\|\) #h(0em) > #h(0em) chi\(epsilon.alt\)#h(0em) = #h(0em) frac(epsilon.alt, 1 + epsilon.alt) $
Hence $ {\|f_n - f\|> epsilon.alt } = { chi\(\|f_n - f\|\)> frac(epsilon.alt, 1 + epsilon.alt) } $
Since the function is nonnegative, by Chebyshev:$ mu\({\|f_n - f\|> epsilon.alt }\)= mu \( { chi\(\|f_n - f\|\)> frac(epsilon.alt, 1 + epsilon.alt) } \) lt.eq frac(1, thin frac(epsilon.alt, 1 + epsilon.alt) thin) integral chi \(\|f_n - f\|\) thin d mu = frac(rho\(f_n\,f\), chi\(epsilon.alt\)) $
By assumption, $rho\(f_n\,f\)arrow.r 0$, thus $ mu \( {\|f_n - f\|> epsilon.alt } \) lt.eq frac(rho\(f_n\,f\), chi\(epsilon.alt\)) arrow.r #h(0em) 0 $
Since $epsilon.alt$ is arbitrary, it proves that $f_n arrow.r f$ in measure. \ \ #strong[Claim 2: $f_n arrow.r f$ in measure $arrow.r.double.long$ $rho\(f_n\,f\)arrow.r 0$] \ Now assume $f_n arrow.r f$ in measure. \ Let $delta > 0$. \ Observe that for any $epsilon.alt > 0$:

- $\|f_n - f\|lt.eq epsilon.alt arrow.r.double.long frac(\|f_n - f\|, 1 +\|f_n - f\|) lt.eq frac(epsilon.alt, 1 + epsilon.alt)$.

- $\|f_n - f\|gt.eq epsilon.alt arrow.r.double.long frac(\|f_n - f\|, 1 +\|f_n - f\|) lt.eq 1$

Hence by choosing any arbitrary $epsilon.alt$, we can bound the integral by: $ 0 lt.eq integral_X frac(\|f_n - f\|, 1 +\|f_n - f\|) thin d mu lt.eq integral_({\|f_n - f\|lt.eq epsilon.alt }) frac(epsilon.alt, 1 + epsilon.alt) thin d mu + integral_({\|f_n - f\|> epsilon.alt }) 1 thin d mu $
For the first term:
$ integral_({\|f_n - f\|lt.eq epsilon.alt }) frac(epsilon.alt, 1 + epsilon.alt) thin d mu = frac(epsilon.alt, 1 + epsilon.alt) #h(0em) mu \( {\|f_n - f\|lt.eq epsilon.alt } \) lt.eq frac(epsilon.alt, 1 + epsilon.alt) #h(0em) mu\(X\) $
Because $mu\(X\)$ is finite, we can choose $epsilon.alt$ s.t. $frac(epsilon.alt, 1 + epsilon.alt) mu\(X\)< delta\/2$. \ Once $epsilon.alt$ is fixed, by convergence in measure there exists $N$ such that for all $n gt.eq N$,
$ mu \( {\|f_n - f\|> epsilon.alt } \) < delta\/2 $
Then for any $n gt.eq N$, we have:
$ rho\(f_n\,f\)= integral_X chi\(\|f_n - f\|\)thin d mu lt.eq mu\(X\)thin frac(epsilon.alt, 1 + epsilon.alt) + mu \( {\|f_n - f\|> epsilon.alt } \) < delta $
Hence $ rho\(f_n\,f\)arrow.r^(n arrow.r oo) 0 $

]
#proof[
#strong[of 5(c):] \ Suppose $\(f_n\)$ is a Cauchy seq in $\(L\,rho\)$, i.e. for any $epsilon.alt > 0$, exists some $N > 0$ s.t. $rho\(f_m\,f_n\)< epsilon.alt$ whenever $n\,m gt.eq N$. \ WTS: $\(f_n\)$ converges, i.e. $rho\(f_n\,f\)arrow.r 0$. \ By (b) we know #strong[it suffices to show that $f_n arrow.r f$ in measure]. \ And by Folland 2.30, #strong[STS: $\(f_n\)$ is Cachy in measure]. \ Let $epsilon.alt > 0$. Let $delta > 0$. \ by Chebyshev:$ mu\({\|f_n - f_m\|> epsilon.alt }\)= mu \( { chi\(\|f_n - f_m\|\)> frac(epsilon.alt, 1 + epsilon.alt) } \) lt.eq frac(1, thin frac(epsilon.alt, 1 + epsilon.alt) thin) integral chi \(\|f_n - f_m\|\) thin d mu = frac(rho\(f_n\,f_m\), chi\(epsilon.alt\)) $
So since $\(f_n\)$ is a Cauchy, there exists $N > 0$ s.t. $rho\(f_n\,f_m\)< chi\(epsilon.alt\)delta$ whenever $n\,m gt.eq N$, thus $mu\({\|f_n - f_m\|> epsilon.alt }\)lt.eq delta$ whenever $m\,n gt.eq N$. \ This proves that $\(f_n\)$ is Cachy in measure, thus $f_n arrow.r f$ in measure, and thus $\(f_n\)$ converges, showing that every Cachy seq converges in $\(L\,rho\)$. Therefore $\(L\,rho\)$ is a complete metric space.

]
Nur für Verrückte (Only for nuts).

\(It's #strong[really] not necessary to attempt these problems. Do not, under any circumstances, hand them in!)

+ Prove that the category of measurable spaces (see HW1) admits finite products, and that the product of $\(X\,cal(A)\)$ and $\(Y\,cal(B)\)$ equals $\(X times Y\,cal(A) times.o cal(B)\)$.

+ Now consider the category of measure spaces (see HW2). Consider two
  measure spaces $\(X_i\,cal(A)_i\,mu_i\)$, $i = 1\,2$, and set $X = X_1 times X_2$, $cal(A) = cal(A)_1 times.o cal(A)_2$, and $mu = mu_1 times mu_2$.

  - Prove that the projection maps $X arrow.r X_i$ are measurable, and that they are measure preserving iff $mu_j\(X_j\)= 1$ for $j = 1\,2$. Thus $\(X\,cal(A)\,mu\)$ is #emph[not] the categorical product of $\(X_i\,cal(A)_i\,mu_i\)$ in general.

  - Prove that even if $mu_i\(X_i\)= 1$, the measure space $\(X\,cal(A)\,mu\)$ is #emph[not] the categorical product of $\(X_i\,cal(A)_i\,mu_i\)$ in general.
    #emph[Hint]: consider the case when the $X_i$ consist of two elements, for example $X_i = { frak(o)_i\,frak(v)_i }$.
