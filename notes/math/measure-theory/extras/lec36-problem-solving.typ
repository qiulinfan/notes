#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= Problem solving
<problem-solving>
Recall: Given mspace $\(X\,cal(A)\,mu\)$ 以及 $f : X arrow.r bb(C)$ mble, 我们可以 define distribution function: $ lambda_f :\(0\,oo\)arrow.r\[0\,oo\] $
by $ lambda_f\(alpha\)= mu\({ \|f\|> alpha }\) $
Chebyshevs ineq: $ lambda_f\(alpha\)lt.eq \( frac(parallel f parallel_p, alpha) \)^p $for $0 < p < oo$. \ Today: Problem Solving

#proposition(
)[
对于任意 $0 < p < oo$, 我们有: $ integral_X\|f\|^p thin d mu = integral_0^oo p alpha^(p - 1) lambda_f\(alpha\)thin d alpha $

]
左边是 integral on $X$, 右边是 integral on $bb(R)$.

#proof[
Sketch:
Step 1: $f$ simple $arrow.r.double.long$ $\|f\|$ simple. \

]
Write $ \|f\|= sum_(j = 1)^N c_j chi_(A_j) $where $A_j$ disjoint, $c_1 > c_2 > dots.h.c > c_N > 0$
This implies: $ integral\|f\|^p thin d mu = sum_(j = 1)^N c_j^p r_j\,quad r_j = mu\(A_j\) $
Then
$ lambda_f\(alpha\)= cases(delim: "{", sum_(j = 1)^N r_j\, & 0 < alpha < c_N, sum_(j = 1)^(n - 1) r_j\, & c_n lt.eq alpha < c_(n - 1)\,2 lt.eq n lt.eq N, 0\, & alpha gt.eq c_1) $
从而
$ integral_0^oo p alpha^(p - 1) lambda_f\(alpha\)d alpha & =\(sum_(j = 1)^N r_j\)integral_0^(c_N) p alpha^(p - 1) d alpha + sum_(n = 2)^N\(sum_(j = 1)^(n - 1) r_j\)integral_(c_n)^(c_(n - 1)) p alpha^(p - 1) thin d alpha\
 & = $

Step 2: $f$ general. \ Use: $exists$ simple functions $g_n gt.eq 0$ s.t. $g_n arrow.tr\|f\|$. \ MCT $arrow.r.double.long$ $ integral_X\|f\|^p thin d mu = lim_(n arrow.r oo) integral_X g_n^p thin d mu $
Also, $ lambda_(g_n) arrow.tr^(upright("CFB")) lambda_f quad upright("pointwisely on")\(0\,oo\) $
从而 MCT $arrow.r.double.long$ $ lim_(n arrow.r oo) integral_0^oo p alpha^(p - 1) lambda_(g_n)\(alpha\)thin d alpha arrow.r integral_0^oo p alpha^(p - 1) lambda_f\(alpha\)thin d alpha $
$lambda_f\(alpha\)= mu\({\|f\|> alpha }\)$, 以及 ${\|f\|> alpha } = union.big_1^oo { g_n > alpha }$ increasing union.

#example(
)[
Let $f :\[0\,1\]arrow.r bb(R)$ be abs ctn. Suppose $f\(0\)= 0$ 以及 $f^1 in L^2\(\[0\,1\]\)$. \ Show that the limit $ lim_(x arrow.r 0^(+)) x^(- 1\/2) f\(x\) $exists, 并 compute it. \ What could the limit be? Must be $0$. \

]
#solution[
Use FTOC, can recover $f$ from $f'$. \ $ f\(x\)= f\(0\)+ integral_0^x f'\(t\)thin d t\,quad 0 lt.eq x lt.eq 1 $
使用 Hölder with $p = q = 2$ (Cauchy-Swartz): $ \|f\(x\)\|lt.eq integral_0^x\|f'\(t\)\|thin d t = integral_0^x\|f'\(t\)\|1 thin d t lt.eq \( integral_0^x\|f'\(t\)\|^2\)^(1 / 2) x^(1 / 2) $
从而 $ x^(- 1\/2)\|f\(x\)\|lt.eq integral_0^x\|f'\(t\)\|^2 thin d t $
Use fact: $g = L^1\(X\,cal(A)\,mu\)arrow.r.double.long forall epsilon.alt > 0\,exists delta > 0$ s.t. for all $mu\(E\)< delta$ we have $integral_E\|g\|thin d mu < epsilon.alt$. \ (Proof of this fact: use approx by simple functions 可得). \ 然后 use approx by simple functions, apply to $g =\|f'\|^2$, $mu = m$, $E =\[0\,x\]$, 于是得到 $ integral_0^x\|f'\(t\)\|^2d t arrow.r^(x arrow.r 0) 0 $

]

#example(
)[
Let $f : bb(R)^n arrow.r bb(R)$ be a function. \ Assume: 对于 $forall epsilon.alt > 0$, 都存在 Lebesgue mble functions $g\,h in L^1\(m\)$ s.t. $ g\(x\)lt.eq f\(x\)lt.eq h\(x\)quad forall x in bb(R)^n $并且 $ integral_(bb(R)^n)\(h - g\)thin d m < epsilon.alt $
Prove that: $f$ 也是 Lebesgue mble 的, 并且 $f in L^1\(m\)$. \

]
#proof[
By assumption: Given $k in bb(N)$, 存在 $g_k\,h_k in L^1\(bb(R)^n\)$ s.t. $ g_k lt.eq f lt.eq h_k\,quad integral\(h_k - g_k\)< 1 / k $
Idea: $f = limsup g_k = liminf h_k$ ? \ 我们应该 try to prove: for a.e. $x$ 都有 $0 lt.eq h_k\(x\)- g_k\(x\)arrow.r 0$. \ Use Fatou's Lemma: $ integral liminf_(k arrow.r oo)\(h_k - g_k\)lt.eq liminf_(k arrow.r oo) integral\(h_k - g_k\)= 0 $而 $h_k - g_k gt.eq 0$, 因而 This means: $ liminf_(k arrow.r oo)\(h_k - g_k\)= 0 quad upright("for a.e. ") x $
且我们知道$ liminf_(k arrow.r oo)\(h_k - f\)lt.eq liminf_(k arrow.r oo)\(h_k - g_k\)= 0 quad upright("for a.e. ") x $
从而 $ f\(x\)= liminf_(k arrow.r oo) h_k\(x\)quad upright("for a.e. ") x $
This proves that, $f$ is Lebesgue measurable.

]

#example(
)[
Prove that: $ lim_(n arrow.r oo) integral_E sin\(n x\)thin d x = 0 $for every bounded Borel set $E subset bb(R)$. \

]
#proof[
Step 1: $E =\(a\,b\)$ 是一个 interval. \ $ integral_E sin\(n x\)thin d x & = \[ - 1 / n cos\(n x\)\]_a^b $
从而 $ \| integral_E sin\(n x\)thin d x \| lt.eq 2 / n arrow.r^(n arrow.r oo) 0 $
Step 2: $E$ 是一个 finite union of disjoint open intervals. \ Same as Step 1. \ Step 3: General Case. \ Fix $epsilon.alt > 0$. \ Then by outer regularity: 存在 some $U$ 为 finite disjoint union of open intervals, 使得 $ m\(U Delta E\)< epsilon.alt $
从而 $ \| integral_E f_n = integral_U f_n \| < \| integral_(U Delta E) f_n \| lt.eq m\(U Delta E\)< epsilon.alt $因而$ \| integral_E f_n \| < \| integral_U f_n \| + epsilon.alt $for all $n$. 并且 By step 2: $ limsup_(n arrow.r oo) \| integral_U f_n \| + epsilon.alt = 0 + epsilon.alt $
因而 $ limsup_(n arrow.r oo) \| integral_E f_n \| lt.eq epsilon.alt $
Since $epsilon.alt$ arbitrary, 得证.

]

#example(
)[
Let $E subset bb(R)$ be a Borel set, with $m\(E\)> 0$. \ Set $f : bb(R) arrow.r bb(R)$ be mble, nonneg, 并且 $integral f > 0$. \ Prove that: 存在 $t in bb(R)$ s.t. $ integral_(E + t) f > 0 $

]
#proof[
#strong[Claim 1: STS to assume $f$ simple.] \ Proof of Claim 1: 对于 $f$, can find seq of simple functions $0 lt.eq f_n lt.eq f$, s.t. $f_n arrow.tr f$. \ By MCT,

]
