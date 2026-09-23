#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= the dual of $L^p$ spaces
<the-dual-of-lp-spaces>
== the dual of $L^p$-I \[Fol 6.2\]
<the-dual-of-lp-i-fol-6.2>
对应: Folland 5.1, 6.2. \ (原本这是在 lec 25 的位置讲的, 但是当时由于没有 Radon-Nikodym Thm, 没有足够的工具去完成 $ \(L^p\)^(*)= L^q $
的证明 (差了一个 proof surjectivity of the isometry $g arrow.r ell_g$). 因而我把它放在这里, 衔接下面几个 lectures, 完成 6.2 这一节. \ 我们首先练习一个 example of Hölder's ineq 来回忆一下: \ recall Hölder's ineq: for $1 lt.eq p\,q lt.eq oo\,#h(0em) 1 / p + 1 / q = 1 arrow.r.double.long$ $ \|\|f g\|\|_1 lt.eq\|\|f\|\|_p\|\|g\|\|_q $

#example(
)[
Prove:$ f in L^3\(\[- 1\,1\]\,m\)arrow.r.double.long integral_(- 1)^1 frac(\|f\(x\)\|, sqrt(\|x\|)) thin d x < oo $

]
#proof[
Apply Hölder's: 既然 $f in L^3$, 那么我们就拉满, take $p = 3$, correspondingly $q = 3\/2$:$ integral_(- 1)^1 frac(\|f\(x\)\|, sqrt(\|x\|)) thin d x & lt.eq \( integral_(- 1)^1\|f\(x\)\|^3 thin d x \)^(1 / 3) \( integral_(- 1)^1 frac(1, \|x\|^(3 / 4)) thin d x \)^(2 / 3) $ both integrals evaluate $< oo$

]

=== intro to dual space
<intro-to-dual-space>
这里只讨论 $bb(K) := bb(R)$ or $bb(C)$. \ recall, 对于一个 $bb(K)$-vector space $V$, 一个 linear functional of $V$ 就是一个 linear function $ f : V arrow.r bb(K) $
对于作为 NVS 的 $V$, 我们还可以定义一个 linear functional 的 boundedness.

#definition(
  title: [#kn[bounded linear functional]],
)[
Let $V$ be a $bb(K)$-NVS, $f : V arrow.r bb(K)$ be a linear functional. \ 我们称 $f$ bounded, if exist $C > 0$ s.t. $ \|f\(v\)\|lt.eq C\|\|v\|\|\,quad forall thin v in V $

]
#remark[
注意, #strong[linear functional 的 boundedness 和它作为函数的 boundedness 是不一样的概念.] \ 作为函数的 boundedness 表示函数值的有界性, 而#strong[作为 linear map 的 boundedness (此处) 表示它的作用效果的 boundedness, 不会把一个 vector 放大太多倍.]

]
#proposition(
  title: [#kn[linear functional bounded $arrow.l.r.double$ ctn at $0$]],
)[
if $f : V arrow.r bb(K)$ is a linear functional, TFAE:

- $f$ bounded

- $f$ continuous

- $f$ continuous at $0 in V$

]
#proof[
\(ii) to (iii): trivial. \ (i) to (ii): 假设 $f$ bounded, 那么可以 pick $C$ s.t. $\|f\(v\)\|lt.eq C\|\|v\|\|$. \ Pick $v_0 in V\,epsilon.alt > 0$. Set $delta := epsilon.alt / C$. Then
$ \|\|v - v_0\|\|< delta arrow.r.double.long\|f\(v\)- f\(v_0\)\|=\|f\(v - v_0\)\|lt.eq C\|\|v - v_0\|\|< epsilon.alt $
从而 ctn. \ (iii) to (i): $exists delta > 0$ s.t. $\|\|v\|\|lt.eq delta arrow.r.double.long\|f\(v\)\|lt.eq 1$. \ 于是 $forall v in V\\{ 0 }$, 都有 $ \|f\(v\)\|= frac(\| f\(v dot.op frac(delta, \|\|v\|\|)\)\|, frac(delta, \|\|v\|\|)) lt.eq frac(delta, \|\|v\|\|) $ taking $C = 1 / delta$, 得到 boundedness.

]
#remark[
这个 proposition 看起来很神奇, 把一个整体性质和局部性质等价了, 但是我们知道 linear map 就是局部决定整体的, by its def. \ recall in 395: 实际上这个性质应该对所有的 linear map 都成立, 不只是 linear functionals. \ 通常我们认为 linear map 总是 ctn 的, 但是其实它 ctn iff bounded, unbounded 的时候就不 ctn. \ 以及: #strong[linear map between finite dim spaces 总是 bounded 的, 从而总是 ctn 的]. 不过这里我们要讨论的就是 infinite dim spaces. 比如 $L^p$.

]
#definition(
  title: [#kn[dual space]],
)[
If $V$ is a NVS, 我们定义它的 #strong[dual space] as: $ V^(*) := { upright("bounded linear functionals ") #h(0em) f : V arrow.r bb(K) } $

]
#definition(
  title: [#kn[norm of dual space: 即 #strong[dual norm]]],
)[
Given $f in V^(*)$, set $ \|\|f\|\|_(*): = sup_(v in V\\{ 0 }) frac(\|f\(v\)\|, \|\|v\|\|) = sup_(\|\|v\|\|= 1)\|f\(v\)\| $
where $parallel v parallel$ 表示的是 $V$ 上使用的 norm. 这个 norm 被称为 dual norm.

]
这个形式是我们在各种地方见过非常多次的 #strong[] operator norm, 只不过这里, 指定一个 NVS, 对于其 dual space 上的 linear functional, 它是固定的, 不需要指定 $v$ 和 $f\(v\)$使用哪个 norm, 因为 $f\(v\)$ 就是标量, 而 $v$ from 原 NVS, 已经指定好 norm.

#remark[
从定义中我们可知, 对于任意的 $v in V$, $f in V^(*)$, 都有: $ \|f\(v\)\|lt.eq parallel f parallel_(*)\|v\| $

]
=== $V^(*)$ being a Banach space
<v-being-a-banach-space>
#theorem(
  title: [#kn[dual space is always Banach]],
)[
对于#strong[任意的 NVS] $V$: $V^(*)$ 都是一个 Banach space. (not assuming $V$ Banach).

]
#proof[
First we can confirm $V^(*)$ is a VS, 因为它由 linear functions of the same size 组成. \ #strong[Claim 1: $V^(*)$ 是一个 NVS.] \ 因为任取 $v in V\,lambda in bb(K)$ 都有 $\|f\(lambda v\)\|=\|lambda\|dot.op\|f\(v\)\|$, 从而
$ f in V^(*)\,lambda in bb(K) arrow.r.double.long\|\|lambda f\|\|_(*)=\|lambda\|dot.op\|\|f\|\|_(*) $以及 $ f\,g in V^(*)\,v in V arrow.r.double.long\|\(f + g\)\(v\)\|=\|f\(v\)+ g\(v\)\|lt.eq\|f\(v\)\|+\|g\(v\)\| $因而
$ f\,g in V^(*) arrow.r.double.long parallel f + g parallel_(*) lt.eq parallel f parallel_(*) + parallel g parallel_(*) $
下面我们 verify $V^(*)$ Banach. \ #strong[Claim 2: 一个 Cauchy seq in $V^(*)$ 一定 pointwise converge to some $f$.] \ Pick $\(f_n\)_1^oo$, 一个 Cauchy seq in $V^(*)$. Let $epsilon.alt < 0$, 存在 $N$ 使得对于任意 $m\,n gt.eq N$ 都有 $parallel f_n - f_m parallel_(*) < epsilon.alt$, 我们简写为: $ parallel f_n - f_m parallel_(*) arrow.r 0 $
因而对于任意 $v in V$, we have $ \|f_n\(v\)- f_m\(v\)\|lt.eq parallel f_n - f_m parallel_(*)\|\|v\|\|arrow.r 0 $
并且我们知道 #strong[$bb(K)$ 是 complete 的], 因而 $f_n\(v\)$ converges in $bb(K)$ to some element, declared to be $f\(v\)$. \ 即 #strong[$f_n arrow.r f$ pointwisely]:$ lim_(n arrow.r oo) f_n\(v\)= f\(v\) $
(这是自然的, 因为如果 linear function $f - g$ 的 operator norm 是 $0$, 那么说明它们毫无差别, 否则一定有某个地方 $f\,g$ 的 image 不一样, 使得这个 norm 不是 $0$\.) \ #strong[Claim 3: $f$ 是 linear 的, 并且 bounded (从而 ctn), 即 $f in V^(*)$.] \ linearity: 由于每个 $f_n$ 都是 linear 的, $ f_n\(x + alpha y\)= f_n\(x\)+ alpha f_n\(y\) $
因而 $ f\(x + alpha y\)= lim_(n arrow.r oo) f_n\(x + alpha y\)= lim_(n arrow.r oo) \( f_n\(x\)+ alpha f_n\(y\)\) = lim_(n arrow.r oo) f_n\(x\)+ alpha lim_(n arrow.r oo) f_n\(y\)= f\(x\)+ alpha f\(y\) $
因此 $f$ 是线性的. \ #strong[\(Note: 这里证明了 linear map 的 pointwise 极限一定也是 linear map.)] \ Boundedness:
Note a standard fact from metric spaces: #strong[every Cauchy sequence is bounded.] \ 因而 $f_n$ 是一个 bounded seq, 即存在 $M > 0$ such that $parallel f_n parallel lt.eq M$ for all $n$. Then $ \|f\(x\)\|= \| lim_(n arrow.r oo) f_n\(x\)\| lt.eq lim_(n arrow.r oo)\|f_n\(x\)\|lt.eq lim_(n arrow.r oo) parallel f_n parallel_(*) parallel x parallel lt.eq M thin parallel x parallel $
Hence $f$ is bounded (continuous), and $parallel f parallel_(*) lt.eq M$.
#strong[Claim 4: $parallel f_n - f parallel_(*) arrow.r 0$, proving $V^(*)$ 是 Banach 的.]
WTS: $ parallel f_n - f parallel = sup_(parallel x parallel = 1)\|\(f_n - f\)\(x\)\|arrow.r 0 $
\/\/TO BE DONE.

]
Actually 这个 Theorem 有更 general 的形式:

#theorem(
)[
对于任意 nvm $V$ 和 Banach $W$, $cal(L)\(V\,W\)$ 一定是 Banach 的.

]
Proof 见 Folland 5.4.

=== $\(L^p\)^(*)= L^q$, $1 / p + 1 / q = 1$
<lp-lq-frac1p-frac1q-1>
#theorem(
  title: [#kn[对于互为 conjugate exponent 的 $p\,q$, $L^p$ 是 $L^q$ 的 dual space]],
)[
#ref[l-p-spaces] 给出这里的 $L^p$ 与 $L^q$ 空间。 \ For $1 < p\,q < oo$ with $1 / p + 1 / q = 1$, we have: $ \(L^p\)^(*)= L^q $
In particular the Hilbert space: $ \(L^2\)^(*)= L^2 $

]
#proof[
Define map $ L^q & arrow.r\(L^p\)^(*)\
g & mapsto diameter_g $
where $ diameter_g\(f\):= integral f g\,quad f in L^p $
It is well-defined by Hölder: $ f in L^p\,g in L^q arrow.r.double.long f g in L^1 $
and $ \|\|f g\|\|_1= integral\|f g\|lt.eq\|\|f\|\|_p\|\|g\|\|_q $
Easy: $ diameter_g\(f_1 + f_2\)= diameter_g\(f_1\)+ diameter_g\(f_2\) $
Also $ \|diameter_g\(f\)\|= \| integral f g \| lt.eq integral\|f g\|lt.eq\|\|f\|\|_p dot.op\|\|g\|\|_q $
Thus $ diameter_g in\(L^p\)^(*)med $

]
== the dual of $L^p$-II \[Fol 6.2\]
<the-dual-of-lp-ii-fol-6.2>
== the dual of $L^p$-III \[Fol 6.2, finished\]
<the-dual-of-lp-iii-fol-6.2-finished>
