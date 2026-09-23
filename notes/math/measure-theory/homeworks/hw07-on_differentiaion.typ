#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 7: on differentiaion (50/50)]
<homework-7-on-differentiaion-5050>
#emph[None of the following questions will be graded. Do them, but do not hand them in].

#heading(level: 2, numbering: none)[Completion of $\(X times Y\,cal(A) times.o cal(B)\,mu times nu\)$ = Completion of $\(X times Y\,macron(cal(A)) times.o macron(cal(B))\,macron(mu) times macron(nu)\)$]
<completion-of-xtimes-y-mathcalaotimes-mathcalb-mutimes-nu-completion-of-xtimes-y-barmathcalaotimes-barmathcalb-barmutimes-barnu>
Let $\(X\,cal(A)\,mu\)$ and $\(Y\,cal(B)\,nu\)$ be measure spaces. Let $\(X\,macron(cal(A))\,macron(mu)\)$ and $\(Y\,macron(cal(B))\,macron(nu)\)$ be their completions, respectively.
Then, the completion of $\(X times Y\,cal(A) times.o cal(B)\,mu times nu\)$ is same as the completion of $\(X times Y\,macron(cal(A)) times.o macron(cal(B))\,macron(mu) times macron(nu)\)$.

#heading(level: 2, numbering: none)[Modified HL maximal inequality ($gt.eq$ instead of $>$)]
<modified-hl-maximal-inequality-geq-instead-of>
Prove that there is a constant $C_n > 0$ that only depends on $n$ such that for every $f in L^1\(bb(R)^n\)$ and $alpha > 0$,
$ m\({ x in bb(R)^n divides H f\(x\)gt.eq alpha }\)lt.eq C_n / alpha integral_(bb(R)^n)\|f\(x\)\|#h(0em) d x $
(Remark: We had $H f\(x\)> alpha$ for the HL maximal inequality. Here we have $H f\(x\)gt.eq alpha$\.)

#heading(level: 2, numbering: none)[density of a mble set at a point: $D_E\(x\)= 1$ for a.e. $x in E$, $0$ for a.e. $x in E^c$]
<density-of-a-mble-set-at-a-point-d_ex1-for-a.e.-xin-e-0-for-a.e.-xin-ec>
For a Lebesgue measurable subset $E$ of $bb(R)^n$, the #emph[density of $E$ at $x$] is defined as
$ D_E\(x\)= lim_(r arrow.r 0) frac(m\(E inter B\(x\,r\)\), m\(B\(x\,r\)) $
provided that the limit exists.
Prove that $D_E\(x\)= 1$ for a.e. $x in E$ and $D_E\(x\)= 0$ for a.e. $x in E^c$.
#emph[Hint]: ask Lebesgue.

#emph[Some of the following questions will be graded. Do them, and do hand them in].

#heading(level: 2, numbering: none)[An identity: $integral_0^oo e^(- 2 s x) frac(sin^2 x, x) #h(0em) d x = 1 / 4 log\(1 + s^(- 2)\)$]
<an-identity-int_0infty-e-2sxfracsin2xxd-xfrac14log1s-2>
Prove that $integral_0^oo e^(- 2 s x) frac(sin^2 x, x) #h(0em) d x = 1 / 4 log\(1 + s^(- 2)\)$ for $s > 0$ by integrating the function $e^(- 2 s x) sin\(2 x y\)$ with respect to $x$ and $y$ over suitable regions.

#proof[
For fixed $x > 0$, by FTC we have: $ sin^2\(x\)= integral_0^x sin\(2 t\)thin d t $
We do change of variable $t = x y$. This is a valid diffeomorphism mapping $y in\(0\,1\)$ to $t in\(0\,x\)$. \ Then by change of variable theorem we have: $ integral_(\(0\,x\)) sin\(2 t\)thin d t = integral_(\(0\,1\)) x sin\(2 x y\)thin d y $Thus $ frac(sin^2 x, x) = integral_0^1 sin\(2 x y\)thin d y $
Then we get: $ integral_0^oo e^(- 2 s x) frac(sin^2 x, x) #h(0em) d x = integral_0^oo e^(- 2 s x) \[ integral_0^1 sin\(2 x y\)thin d y \] #h(0em) d x $
Consider the function $ f\(x\,y\):= e^(- 2 s x) sin\(2 x y\)\,quad\(x\,y\)in\(0\,oo\)times\(0\,1\) $
$f$ is a composition of continuous functions, thus continuous. Note that it is also in $L^1\(\(0\,oo\)times\(0\,1\)\)$ since $\|f\(x\,y\)\|$ is bounded by $g\(x\,y\):= e^(- 2 s x)$, which is $L^1$ on the same domain (its integral is $frac(1, 2 s)$), then by DCT, $f in L^1\(\(0\,oo\)times\(0\,1\)\)$. \ Thus we can apply Fubini's theorem to switch the order of integration: $ integral_0^oo e^(- 2 s x) \[ integral_0^1 sin\(2 x y\)thin d y \] #h(0em) d x & = integral_(\(0\,oo\)times\(0\,1\)) e^(- 2 s x) thin sin\(2 x y\)thin d\(x times y\)\
 & = integral_0^1 \( integral_0^oo e^(- 2 s x) sin\(2 x y\)thin d x \) d y $
Recall back in Calculus we use integration by part to get: $ integral_0^oo e^(- a x) thin sin\(b x\)thin d x = frac(b, a^2 + b^2) $
for $a > 0$. In our case, $a = 2 s$ and $b = 2 y$.
Thus $ integral_0^oo e^(- 2 s x) thin sin\(2 x y\)thin d x = frac(2 y, \(2 s\)^2+\(2 y\)^2) = frac(y, 2 thin\(s^2 + y^2\)) $
Therefore we here get $ integral_0^oo e^(- 2 s x) frac(sin^2 x, x) #h(0em) d x & = integral_0^1 \( integral_0^oo e^(- 2 s x) sin\(2 x y\)thin d x \) d y\
 & = integral_0^1 frac(y, 2 thin\(s^2 + y^2\)) thin d y\
 & = 1 / 2 integral_0^1 frac(y, s^2 + y^2) thin d y $
By Calculus we have (by chain rule): $ integral_0^1 frac(y, s^2 + y^2) thin d y = \[ 1 / 2 log \( s^2 + y^2 \) \]_0^1 = 1 / 2 log \( frac(s^2 + 1, s^2) \) = 1 / 2 log \( 1 + 1 / s^2 \) $
Thus we conclude:
$ integral_0^oo e^(- 2 s x) frac(sin^2 x, x) #h(0em) d x & = 1 / 2 integral_0^1 frac(y, s^2 + y^2) thin d y\
 & = 1 / 2 dot.op 1 / 2 log \( 1 + 1 / s^2 \)\
 & = 1 / 4 log \( 1 + 1 / s^2 \) $
as desired.

]
#heading(level: 2, numbering: none)[$E in cal(A) times.o cal(A) arrow.r.double.long$diagonal of $E in cal(A)$]
<einmathcalaotimesmathcala-impliesdiagonal-of-e-in-mathcala>
- Prove that if $E in cal(A) times.o cal(A)$, then $ { x in X :\(x\,x\)in E } in cal(A) $

- Using this fact, find an example of a subset $E subset bb(R) times bb(R)$ such that $E_x in cal(L)\(bb(R)\)$ for all $x in bb(R)$ and $E^y in cal(L)\(bb(R)\)$ for all $y in bb(R)$, but $E in.not cal(L)\(bb(R)\)times.o cal(L)\(bb(R)\)$.
  #emph[Hint]: ask Vitali.

#proof[
#strong[of (a):] \ We consider the map: $ phi.alt : X & arrow.r X times X\
x & mapsto\(x\,x\) $
Then it suffices to show that $phi.alt$ is $\(cal(A)\,cal(A) times.o cal(A)\)$-measurable. Since if so, then for each $E in cal(A) times.o cal(A)$, $phi.alt^(- 1)\(E\)= { x in X :\(x\,x\)in E } in cal(A)$, which is exactly what we want. \ Let $A times B in cal(A) times.o cal(A)$ be a measurable rectangle, we discover that:
$ phi.alt^(- 1)\(A times B\)= { x in X : x in A\,x in B } = A inter B in cal(A) $

#figure(image("../assets/hw7-image-20250314182209267.png", width: 30.0%),
  caption: [
  ]
)

We first prove a lemma:

#lemma(
)[
Suppose $f : X arrow.r Y times Z$ is a function from a measurable space $\(X\,cal(A)\)$ to a product measure space $\(Y times Z\,cal(B)_1 times.o cal(B)_2\)$. \ Claim: If $f^(- 1)\(B_1 times B_2\)in cal(A)$ for each measurable rectangle $B_1 times B_2 in cal(B)_1 times.o cal(B)_2$, then $f$ is an $\(cal(A)\,cal(B)_1 times.o cal(B)_2\)$-measurable function.

]
#proof[
#strong[of Lemma:] \ Since $f^(- 1)\(B times C\)in cal(A)$ for each measurable rectangle $B_1 times B_2 in cal(B)_1 times.o cal(B)_2$, the preimage of any countable disjoint unions of measurable rectangles, is also in $cal(A)$, since $cal(A)$ is an $sigma$-algebra. \ We want to show: $f^(- 1)\(E\)in cal(A)$ for any $E in cal(B)_1 times.o cal(B)_2$. It is equivalent to show that $ cal(B)_1 times.o cal(B)_2 subset cal(C) : = { E in Y times Z : phi.alt^(- 1)\(E\)in cal(A) } $
Note that, it suffices to show that: $cal(C)$ is an $sigma$-algebra. This is because we have shown $ { upright("all disjoint unions of measurable rectangles in ") Y times Z } subset cal(C) $, and this is an algebra generating $cal(B)_1 times.o cal(B)_2$. Thus, if $cal(C)$ is an $sigma$-algebra, we must have $cal(B)_1 times.o cal(B)_2 subset cal(C)$. \ And since ${ upright("all disjoint unions of measurable rectangles in ") Y times Z }$ is an algebra, it suffices to show that $cal(C)$ is a monotone class, by the monotone class lemma. \ Suppose $E_1 subset.eq E_2 subset.eq dots.h.c$ with each $E_n in cal(C)$, i.e. $phi.alt^(- 1)\(E_n\)in cal(A)$.
Since ${ E_n }$ is increasing, we hve
$ phi.alt^(- 1)\(E_1\)#h(0em) subset.eq #h(0em) phi.alt^(- 1)\(E_2\)#h(0em) subset.eq #h(0em) dots.h.c #h(0em) subset.eq #h(0em) phi.alt^(- 1)\(E_n\)#h(0em) subset.eq #h(0em) dots.h.c $
Since $cal(A)$ is an $sigma$-algebra, we have $ phi.alt^(- 1) \( union.big_(n = 1)^oo E_n \) = union.big_(n = 1)^oo phi.alt^(- 1)\(E_n\)in cal(A) $Thus $ union.big_(n = 1)^oo E_n #h(0em) in #h(0em) cal(C) $
This is dually true for decreasing intersection, #strong[finishing the proof that $cal(C)$ is a monotone class thus $sigma$-algebra,] #strong[thus proving the lemma.] \

]
After we proved the Lemma, we return to the original statement, concluding that $phi.alt$ is $\(cal(A)\,cal(A) times.o cal(A)\)$-measurable, thus finishing the proof: if $E in cal(A) times.o cal(A)$, then $ { x in X :\(x\,x\)in E } in cal(A) $

]
#solution[
#strong[of (b):] \ Take a Vitali set $V subset bb(R)$, and consider:
$ E := {\(x\,y\)in bb(R)^2 : x eq.not y } #h(0em) union #h(0em) {\(x\,x\): x in V } . $

#figure(image("../assets/hw7-image-20250314185531013.png", width: 30.0%),
  caption: [
  ]
)

Then for any fixed $x in bb(R)$, we have: $ E_x = { y :\(x\,y\)in E } = cases(delim: "{", bb(R)\, & x in V, bb(R)\\{ x }\, & x in.not V) $
And for any fixed $y in bb(R)$, we have: $ E^y = { x :\(x\,y\)in E } = cases(delim: "{", bb(R)\, & y in V, bb(R)\\{ y }\, & y in.not V) $Thus $E_x in cal(L)\(bb(R)\)$ for all $x in bb(R)$ and $E^y in cal(L)\(bb(R)\)$ for all $y in bb(R)$. \ However, we have $E in.not cal(L)\(bb(R)\)times.o cal(L)\(bb(R)\)$, since by (a) we have proved that if $E in cal(L)\(bb(R)\)times.o cal(L)\(bb(R)\)$, then $ V = { x in bb(R) :\(x\,x\)in E } in cal(L)\(bb(R)\) $
But it contradicts with the fact that $V$ is not Lebesgue measurable. \ Thus $E$ satisfies our requirements. \ (This happends since, as shown in class, the product measure space of two complete measure space is not necesarily complete. Here, the diagonal is a null set in $bb(R)^2$ and thus our Vitali portion is a subnull set, but $cal(L)\(bb(R)\)times.o cal(L)\(bb(R)\)$ is not complete (its completion is $cal(L)\(bb(R)^2\)$\.)

]
#heading(level: 2, numbering: none)[Too dense: $m\(E inter I\)lt.eq alpha m\(I\)$ for all $I$ $arrow.r.double.long m\(E\)= 0$ for mble $E$]
<too-dense-mecap-ile-alpha-mi-for-all-i-implies-me0-for-mble-e>
Prove that if $E subset cal(L)\(bb(R)\)$ is a Lebesgue measurable subset such that $ m\(E inter I\)lt.eq 0.123 m\(I\) $
for all open intervals $I subset cal(L)\(bb(R)\)$, then $m\(E\)= 0$.

#proof[
Since $E$ is Lebesgue measurable, $m\(E\)= m^(*)\(E\)$. \ Let $epsilon.alt > 0$. \ Then by definition of outer mesure, we can pick open intervals seq ${ I_k }_(k = 1)^oo$ covering $E$ s.t. $ m\(E\)> sum_(k = 1)^oo m\(I_k\)- epsilon.alt $ Since $E subset union.big_k I_k$, we have $ E & =\(union.big_k I_k\)inter E\
 & = union.big_k\(I_k inter E\)\
 $
Thus $ m\(E\)= m\(union.big_k\(I_k inter E\)\) & lt.eq sum_k m\(I_k inter E\)quad upright("by ctbl subadditivity ")\
 & lt.eq 0.123 sum_k thin m\(I_k\)quad upright("by our requirement") $
Thus we have:
$ sum_k m\(I_k\)- epsilon.alt & < 0.123 sum_k m\(I_k\)\
0.877 sum_k m\(I_k\) & < epsilon.alt\
sum_k m\(I_k\) & < epsilon.alt / 0.877 $
Thus $ m\(E\)lt.eq sum_k m\(I_k\)< epsilon.alt / 0.877 $
Since $epsilon.alt > 0$ is arbitrary, this proves that $ m\(E\)= 0 $

]
#heading(level: 2, numbering: none)[给定任意 $0 < alpha < 1$, prescribe 出一个在 $0$ 处 density 为 $alpha\/2$ 的集合]
<给定任意-0alpha-1-prescribe-出一个在-0-处-density-为-alpha2-的集合>
Let $0 < alpha < 1$.
Find an example of a Lebesgue measurable subset $E$ of $\[0\,oo\)subset cal(L)\(bb(R)\)$ whose density at $0$ is $alpha\/2$.
#emph[Hint]: Consider $E = union.big_(n = 1)^oo I_n$. where $I_n =\(x_n\,x_n + delta_n\)$ are disjoint small intervals accumulating at $0$.

#proof[
Consider take $ E := union.big_(n = 1)^oo \( 1 / n\,1 / n + frac(alpha, n\(n - 1\)) \) $ as the union of a countable sequence of intervals drawing near $0$. \ Notice: There intervals are #strong[mutually disjoint], since $ frac(1, n - 1) - 1 / n = frac(1, n\(n - 1\)) > frac(alpha, n\(n - 1\)) $
we thus have for $n gt.eq 2$, $ 1 / n + frac(alpha, n\(n - 1\)) < frac(1, n - 1) $
We use $x_n : = 1 / n$\; $I_n := \( x_n\,thin x_n + delta_n \)$ to denote each component interval; $J_n : =\(x_n\,x_(n - 1)\)$ to denote the open interval where $I_n$ is located at; and $delta_n := frac(alpha, n\(n - 1\))$ to denote the length of each interval. Note that for each $n$, $ delta_n = alpha\(frac(1, n - 1) - 1 / n\)= alpha\(x_(n - 1) - x_n\)= alpha J_n $

#figure(image("../assets/hw7-image-20250314233130795.png", width: 40.0%),
  caption: [
  ]
)

Now we show that this set has Lebesgue density $alpha / 2$ at $0$ below. \ Let $r > 0$ (WLOG $r < 1$), then we have $ frac(1, n + 1) < r #h(0em) lt.eq #h(0em) 1 / n quad upright(" for some ") n in bb(N) $
Then for each $k gt.eq n + 2$, we have $1 / k < frac(1, n + 1) < r$. Hence $I_k$ is #strong[entirely contained] in $\(0\,r\)$:
$ union.big_(k = n + 2)^oo I_k subset.eq E inter\(- r\,r\) $
We know that by telescoping, $ sum_(k = n + 2)^oo frac(1, k\(k - 1\)) = (frac(1, n + 1) - frac(1, n + 2)) + (frac(1, n + 2) - frac(1, n + 3)) + dots.h.c = frac(1, n + 1) $
Multiplying this by $alpha / 2$ gives: $ sum_(k = n + 2)^oo frac(alpha, k\(k - 1\)) = frac(alpha, n + 1) $
Thus by monotonicity of measure: $ m \( E inter\(- r\,r\)\) gt.eq frac(alpha, n + 1) $
And for each $k lt.eq n$, $I_k$ exceeds $\(0\,r\)$ on the right, thus we get dually: $ m \( E inter\(- r\,r\)\) lt.eq frac(alpha, n - 1) $ And we have: $ frac(2, n + 1) lt.eq m\(- r\,r\)lt.eq 2 / n $since $frac(1, n + 1) lt.eq r lt.eq 1 / n$. \ Therefore we get: $ frac(alpha, n + 1) / 2 / n lt.eq frac(m \( E inter\(- r\,r\)\), m\(\(- r\,r\)\)) lt.eq frac(alpha, n - 1) / frac(2, n + 1) $
Further simplify: $ frac(n, n + 1) dot.op alpha / 2 lt.eq frac(m \( E inter\(- r\,r\)\), m\(\(- r\,r\)\)) lt.eq frac(n + 1, n - 1) dot.op alpha / 2 $
As $r arrow.r 0^(+)$, we must have $n arrow.r oo$, and we know $ lim_(n arrow.r oo) frac(n, n + 1) dot.op alpha / 2 = lim_(n arrow.r oo) frac(n + 1, n - 1) dot.op alpha / 2 = alpha / 2 $
Thus by #strong[Squeeze Theorem], we have: $ lim_(r arrow.r 0^(+)) frac(m \( E inter\(- r\,r\)\), m\(\(- r\,r\)\)) = alpha / 2 $
Hence by def, $E$ indeed has Lebesgue density $alpha\/2$ at $0$. \ (My note: The key point here is that, the harmonic seq shrinks very slowly in proportion as $n$ grows, $J_n$ almost have same length as $J_(n + 1)$ for large $n$, thus $m\(J_n\)\/m\(union_(k > N) J_k\)= 0$ as we knows, so that whether $r$ lies in $I_n$ or $J_n\\I_n$ does not quite matter. \ On the other hand, the counterexample in class, using the geometric sequence as build block of $J_n$, fails since the length of $J_n$ is too much compared to $union_(k gt.eq n) J_k$, actually $m\(J_n\)= m\(union_(k > n) J_k\)$, thus whether $r$ lies in $I_n$ or $J_n\\I_n$ makes a lot difference, making the density at $0$ undefined.)

]
#heading(level: 2, numbering: none)[Seqs of complex numbers: $ell^1 subset.neq inter.big_(1 < p < oo) ell^p$ and $union.big_(1 < p < oo) ell^p subset.neq ell^oo$]
<seqs-of-complex-numbers-ell1subsetneqbigcap_1pinftyellp-and-bigcup_1pinftyellpsubsetneqellinfty>
- Prove that $ell^1 subset.neq inter.big_(1 < p < oo) ell^p$.

- Prove that $union.big_(1 < p < oo) ell^p subset.neq ell^oo$.

#proof[
#strong[of (a):] \ We first want to show: for any $1 < p < oo$, we have: $ ell^1 subset.eq ell^p $
Fix $p > 1$. \ Let $\(x_n\)in ell^1$. By definition,
$ sum_(n = 1)^oo\|x_n\|< oo $
We need to show that $sum_(n = 1)^oo\|x_n\|^p< oo$. \ #strong[Claim: There are at most finitely many $n in bb(N)$ s.t. $\|x_n\|gt.eq 1$]. \ Proof of Claim: Suppose for contradiction that there are inifinitely many $n in bb(N)$ s.t. $\|x_n\|gt.eq 1$, say, all terms in the subseqence ${ x_(n_j) }_(j = 1)^oo$ has $\|x_(n_j)\|gt.eq 1$. Then $ sum_(n = 1)^oo\|x_n\|gt.eq sum_(j = 1)^oo\|x_(n_j)\|gt.eq sum_(j = 1)^oo 1 = oo $which contradicts with $\(x_n\)in ell^1$. \ Thus, suppose only on the finite terms ${ x_(n_j) }_(j = 1)^N$ we have $\|x_(n_j)\|gt.eq 1$ (WLOG $N gt.eq 1$). Then
$ sum_(n = 1)^oo\|x_n\|= sum_(j = 1)^N\|x_(n_j)\|+ sum_(n eq.not n_j upright(" for any ") j)\|x_n\| $
Since for $n$ s.t. n $eq.not n_j upright(" for any subseq index ") j$, we have $\|x_n\|< 1$, for these indexes we have: $ \|x_n\|^p<\|x_n\|quad upright("for any ") p > 1 $ Thus we have $ sum_(n eq.not n_j upright(" for any ") j)\|x_n\|^p< sum_(n eq.not n_j upright(" for any ") j)\|x_n\|< oo $
And also, $ sum_(j = 1)^N\|x_(n_j)\|^p< oo quad upright(" since only have finite terms") $
Thus $ sum_(n = 1)^oo\|x_n\|^p= sum_(j = 1)^N\|x_(n_j)\|^p+ sum_(n eq.not n_j upright(" for any ") j)\|x_n\|^p< oo $
Thus $ ell^1 subset.eq ell^p $
Since $p > 1$ is arbitrary, this proves that
$ ell^1 subset.eq inter.big_(1 < p < oo) ell^p $
To show the strictness of the inclusion, we consider the #strong[harmonic series] $sum_(n = 1)^oo 1 / n$. We know that it diverges and for any $p > 1$, the #strong[$p$-series] $sum_(n = 1)^oo 1 / n^p$ (absolutely for sure) converges, thus $\( 1 / n \) in.not ell^1$ but $\( 1 / n \) in ell^p$ for every $p > 1$, showing that $ ell^1 eq.not inter.big_(1 < p < oo) ell^p $This finishes the proof that
$ ell^1 subset.neq inter.big_(1 < p < oo) ell^p $

]
#proof[
#strong[of (b):] \ Fix $p > 1$. \ Suppose sequence $\(x_n\)$ belongs $ell^p$, then $ sum_(n = 1)^oo\|x_n\|^p< oo $
This implies that $x_n arrow.r 0$ as $n arrow.r oo$, because if it did not, there would be infinitely many terms where $\|x_n\|$ is bounded away from zero, leading to divergence of the sum. \ Suppose for contradiction that $ sup_n\|x_n\|= oo $Then there are infinitely many terms $n$ s.t. $\|x_n\|> 1$, since otherwise, exists some $N$ s.t. all $\|x_n\|lt.eq 1$ for $n gt.eq N$, then $sup\|x_n\|lt.eq max\(1\,max_(1 lt.eq n lt.eq N - 1)\|x_n\|\)< oo$. \ Suppose for the subseq ${ x_(n_j) }_(j = 1)^oo$ we have $\|x_(n_j)\|> 1$. Thus $ sum_(n = 1)^oo\|x_n\|^p gt.eq sum_(j = 1)^oo\|x_(n_j)\|^p> sum_(j = 1)^oo 1^p = oo $which contradicts with $sum_(n = 1)^oo\|x_n\|^p< oo$. Therefore we have: $ sup_n\|x_n\|< oo $
This shows that $ ell^p subset.eq ell^oo $ Since $p > 1$ is arbitrary, this proves that $ union.big_(1 < p < oo) ell^p subset.eq ell^oo $Now we show the inclusion is strict. Consider the sequence $x_n = 1$ for all $n$. Clearly, $\(x_n\)in ell^oo$ because it is bounded. However, $x_n in.not ell^p$ for any $p > 1$:
$ sum_(n = 1)^oo\|1\|^p= sum_(n = 1)^oo 1 = oo $
This shows $ union.big_(1 < p < oo) ell^p eq.not ell^oo $Thus we have $ union.big_(1 < p < oo) ell^p subset.neq ell^oo $

]
#emph[Nur für Verrückte]

\(It's #strong[really] not necessary to attempt these problems. Do not, under any circumstances, hand them in!)

#heading(level: 2, numbering: none)[Prescribing a Lebesgue density, Season 2]
<prescribing-a-lebesgue-density-season-2>
Let $0 < alpha < 1$ and $n gt.eq 1$.
Find an example of a Lebesgue measurable subset $E$ of $cal(L)\(bb(R)\)^n$ whose density at $0$ is $alpha$.
#emph[Hint]: think spherically.
