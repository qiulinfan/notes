#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= $L_p$ space and inequalities
<l_p-space-and-inequalities>
== Banach Space and $L_p$ space \[Fol 5.1; 6.1\]
<banach-space-and-l_p-space-fol-5.1-6.1>
对应 Folland 5.1(1), 6.1(1).

=== norm and completeness
<norm-and-completeness>
Recall:

#definition(
  title: [#kn[semi-norm, norm]],
)[
一个#strong[semi norm] 是一个函数 $\|\|dot.op\|\|: V arrow.r\[0\,oo\)$ starting from a vector space $V$. 其满足 (1): tri eq 和 (2): homogeneity. \ 如果一个 semi-norm 满足 (3): $\|\|v\|\|= 0$ iff $v = 0$, 则称它为一个 #strong[norm].

]
#definition(
  title: [#kn[Banach space]],
)[
一个 normed vector space $\(V\,\|\|dot.op\|\|\)$ 的 induced metric space 如果是 complete 的, 它就被称为一个 #strong[Banach space]. \

]
#remark[
Cauchy 指的是对于任意 $epsilon.alt$, 都存在 $N$ 使得对于任意 $n\,m gt.eq N$ 都有 $ parallel v_n - v_m parallel < epsilon.alt $
而 convergent 指的是存在一个极限 $v$, 使得对于任意 $epsilon.alt$, 都存在 $N$ 使得对于任意 $n gt.eq N$ 都有 $ parallel v_n - v parallel lt.eq epsilon.alt $
By tri ineq 容易证明: 在 genral normed VS 中, convergent imply Cauchy, 反之未必. convergent 是更强的条件. (interestingly, convergence in measure 却不 imply Cauchy in measure)

]
#example(
)[
$bb(R)^n\,bb(C)^n$ with Euclidean norm is a Banach space. \ $C^0\(\[0\,1\]\)$: space of ctn functions on $\[0\,1\]$ equipped with $sup$ norm #strong[is Banach]. $ \|\|f - g\|\|:= sup_(x in\[0\,1\])\|f\(x\)- g\(x\)\| $
$C_c^0\(bb(R)\)$: space of ctn functions with cpt supp on $bb(R)$ equipped with $sup$ norm #strong[is not Banach]! 这是因为, 一个有 cpt supp 的 function seq 的极限未必有 cpt supp. 比如 $\(chi_(\[- n\,n\])\)_(n in bb(N))$.

]
#lemma(
)[
A metric space $\(X\,rho\)$ is #strong[complete] iff #strong[every Cauchy seq has a subseq that converges.]

]
#proof[
Trivial. \ $arrow.r.double.long$: Clear. \ $arrow.l.double.long$: subseq conv dist bound + Cauchy dist bound can bound the whole tail with arbitrary $epsilon.alt$.

]
这个 statement, 直接把 complete 的定义从每个 Cauchy seq 都收敛, 优化为每个 Cauchy seq 都有一个收敛 subseq.

=== every Cachy seq conv (complete) $arrow.l.r.double$ every abs conv series convs
<every-cachy-seq-conv-complete-iff-every-abs-conv-series-convs>
#definition(
  title: [#kn[series: convergence 和 absolute convergence]],
)[
对于一个 normed VS $\(V\,\|\|dot.op\|\|\)$ 中的 seq $\(v_n\)$, 我们称 $sum_(n = 1)^oo v_n$ #strong[converges], 如果存在 $v in V$ s.t. $ lim_(N arrow.r oo) sum_(n = 1)^N v_n = v $
即 $ lim_(N arrow.r oo) parallel v - sum_(n = 1)^N v_n parallel = 0 $
我们称 $sum_(n = 1)^oo v_n$ #strong[absolutely converges], 如果 $ sum_(n = 1)^oo\|\|v_n\|\|< oo $
即这个 series 对应的 norm series converges to some real number.

]
#theorem(
  title: [#kn[another criterion for Banach space]],
  id: "thm-09-l-p-space-and-inequalities-another-criterion-for-banach-space",
)[
A normed VS $\(V\,\|\|dot.op\|\|\)$ is a Banach space iff every absolutely convergent series converges.

]
#proof[
"$arrow.r.double.long$\": 如果 $\(V\,\|\|dot.op\|\|\)$ is a Banach space, Suppose $sum_(n = 1)^oo\|\|v_n\|\|< oo$, 取部分和序列 $ S_N := sum_(n = 1)^N v_n $有 $ parallel S_m - S_n parallel = parallel sum_(k = n + 1)^m v_k parallel lt.eq sum_(k = n + 1)^m parallel v_k parallel $
For large enough $m\,n$ 这个 bound 可以无限小, 因而 $\(S_N\)$ is Cauchy.
"$arrow.l.double.long$\": 如果 $\(V\,\|\|dot.op\|\|\)$ 中 every absolutely convergent series converges. \ Suppose $\(v_n\)$ is Cauchy. WTS it converges. \ By Cauchy, 存在 subseq, say labeled $n_1 < n_2 < dots.h.c$, s.t. $\|\|v_m - v_n\|\|< 1 / 3^j$for all $m\,n gt.eq n_j$
Then $ sum_(j = 1)^oo\|\|v_(n_(j + 1)) - v_(n_j)\|\|< oo $
Let $\(y_j\)$ be s.t. $y_1 = v_(n_1)$, $y_j = v_(n_(j + 1)) - v_(n_j)$, then $ sum_(j = 1)^oo parallel y_j parallel lt.eq parallel y_1 parallel + sum_j 1 / 2^j = parallel y_1 parallel + 1 < oo $
并且有: $ v_(n_j) = sum_(k = 1)^j y_k $由于 $sum_(j = 1)^oo parallel y_j parallel < oo$, by our assumption 得到, 这个极限 $lim_(j arrow.r oo) v_(n_j) = sum_(k = 1)^oo y_k$ 是存在的.

]
#remark[
这个证明中也有一个简略但是有用的结论: 任意 normed VS 中, #strong[一个 series absolutely convergent 可以推出它的部分和 seq 是 Cauchy 的. (反向则未必成立).] \ 整个 imply 关系的示意图:
$ sum_(k = 1)^oo parallel x_k parallel < oo arrow.r.double.long S_N upright(" Cauchy") & arrow.r.double.long^(upright("if Banach")) S_N upright(" converges") arrow.l.r.double sum_(k = 1)^oo x_k upright(" converges") arrow.r.double.long\(x_k\)arrow.r 0\
 & arrow.l.double.long^(upright("always")) $
(这个图直观说明了为什么 Banach 和 \"every abs conv seq conv\" 是等价的. 因为这只是#strong[在 Cauchy imply conv 的前后套了两个必然发生的 implication 关系]而已. 但有时候, 这个关系反而更加好证明.) \ #strong[\(注意, partial sum seq Cauchy 并不 imply 原 series absolutely converge!])

]
=== 任何 finite dim normed VS 一定 Banach, infinite dim 则不一定 Banach
<任何-finite-dim-normed-vs-一定-banach-infinite-dim-则不一定-banach>
#remark[
Note, 我们知道在 $bb(R)^n$, $bb(C)^n$ 上, abs conv 一定 imply con; 但是在 general (infinite dimension) 的 normed VS 上, #strong[absolutely converge 并不 imply converge.] \ 1. As is known to all, $bb(R)^n\,bb(C)^n$ 上 Euclidean norm 的 induced metric 就是 Euclidean metric, making it complete metric space, 从而是 Banach space. \ 2. recall in elementary functional analysis:

#definition(
)[
我们称两个 norms $parallel dot.op parallel_a\,parallel dot.op parallel_b$ on a vector space 是 equivalent, 如果存在常数 $C_1\,C_2 > 0$ 使得对于任意 $x$ 都有 $ C_1 parallel x parallel_a lt.eq parallel x parallel_b lt.eq C_2 parallel x parallel_a $
这一定义即 topologically equivalent. 因为 equivalent norms define #strong[equivalent metric, 从而 same topology.]

]
以及这个经典的定理:

#theorem(
)[
finite dimensional vector space $X$ 上, 所有 norms 都 equivalent.

]
这里先不证明. \ 利用这个定理, 我们发现 #strong[$bb(R)^n\,bb(C)^n$ 上采用任何 norm 都是 Banach space.] \ 3. 我们 recall: 任何 finite dim $bb(R)$-vector space 或者 $bb(C)$-vector space 都 isomorphic to some $bb(R)^n$, $bb(C)^n$. 因而
利用这 theorem, 我们得到: #strong[任何 finite dim normed VS 都是 complete metric space (Banach space), regardless of choice of norm.] \ 然而 #strong[infinite dim normed VS 则未必一定 Banach.] \ 一个常见的反例: $ V = bb(R)\[x\] $
所有的 polynomials with real coeffs. 考虑这一 norm: $ parallel p parallel_oo = sup_(x in\[0\,1\])\|p\(x\)\| $
$bb(R)\[x\]$ 是无限维的, 因为多项式的次数可以任意提高. \ $\(bb(R)\[x\]\,parallel p parallel_sup\)$ 不是 complete 的, 其 completion 是 Banach 空间 $C\[0\,1\]$, 所有在 $\[0\,1\]$ 上的连续函数, with the same $sup$ norm. \

]
下面我们将介绍一类 infinite dimension 但是 Banach 的 normed VS: $L^p$ spaces.

=== $L^p$ spaces
<lp-spaces>
#definition(
  title: [#kn[$L_p$ spaces]],
)[
Consider $p in\(0\,oo\)$. \ Let $\(X\,cal(A)\,mu\)$ 为一个 measure space. \ Define for $f : X arrow.r bb(R)$ measurable: $ \|\|f\|\|_p: = \( integral\|f\|^p#h(0em) d mu \)^(1 / p) #h(0em) #h(0em) in\[0\,oo\] $
Define $ L^p\(mu\): = { f :\|\|f\|\|_p< oo }\/tilde.op $ where $f tilde.op g$ if $f = g$ a.e.

]
固定一个 measure space $\(X\,cal(A)\,mu\)$, 我们将用 $L_p$ 来简易指代 $L^p\(mu\)$. \

#remark[
注意, 我们容易发现:if $0 < p < oo$ and $f$ measurable, TFAE：

- $f in L^p$

- $\|f\|in L^p$

- $\|f\|^p in L^1$

]
#example(
)[
$\(X\,cal(A)\,mu\):=\(bb(R)\,cal(L)\,m\)$, $ f\(x\): = 1 / x^alpha chi_(\(0\,1\))\,#h(0em) #h(0em) f in L^p\(m\)arrow.l.r.double alpha p < 1 $ $ f\(x\): = 1 / x^alpha chi_(\(1\,oo\))\,#h(0em) #h(0em) f in L^p\(m\)arrow.l.r.double alpha p > 1 $
$\(X\,cal(A)\,mu\):=\(bb(N)\,cal(P)\(bb(N)\)\,mu_(c o u n t i n g)\)$, $ L^p\(mu_(c o u n t i n g)\)= {\(a_n\)_(n in bb(N)): sum_(n = 1)^oo\|a_n\|^p< oo } $

]
#lemma(
  title: [#kn[$L_p$ space is a vector space]],
)[
$L_p$ space is a $bb(C)$-vector space.

]
#proof[
Suppose $f\,g in L^p$. \ 由于 $ \|f + g\|^p lt.eq\(\|f\|+\|g\|\)^p lt.eq\(2 max {\|f\|\,\|g\|}\)^p lt.eq 2^p\(\|f\|^p+\|g\|^p\) $
于是 by linearity of integral, 得到:
$ f\,g in L^p arrow.r.double.long f + g in L^p $
(Note: $p > 1$ 时也可以 by $\|x\|^p$ 这一函数的 convexity 得到这个 bound, 但是这个方法只有效于 $p > 1$)

]
但是 #strong[Question 1:] #strong[Is $L_p$ a normed VS? 即, $parallel dot.op parallel_p$ 总是一个 valid norm 吗?]
A: #strong[True for $p in\[1\,oo\)$, false for $p in\(0\,1\)$.]
Homogeneity 和 $parallel f parallel_p = 0$ iff $f = 0$ (a.e.) 是显然的, 但是我们发现, tri ineq 没有显然的证明. \ Next lecture, we will show the Minkowski's ineq, 即 $L^p$ space 上的三角不等式:
$ \|\|f + g\|\|_p lt.eq\|\|f\|\|_p+\|\|g\|\|_p $
但是这个不等式只 hold for $p in\[1\,oo\)$, 并且 fail otherwise. \ (因而对于 $L^p$ space 的研究, 我们将 #strong[focus on $p in\[1\,oo\)$ 的情况.]) \ #strong[Question 2: Is $L^p$ space, $p in\[1\,oo\)$, Banach? Answer: Yes.] \ 我们也将在 next lecture 证明它.

== inequilities on $L^p$ spaces \[Fol 6.1\]
<inequilities-on-lp-spaces-fol-6.1>
对应 Folland 6.1(2). \ 我们将证明 Hölder's ineq 以及它的 corollary Minkowski's ineq, 从而证明: $L^p$ 是一个 normed VS, 并且是一个 Banach space (这里 $1 lt.eq p < oo$, 但是 later we will also prove $L^oo$ 也是 Banach space). \ 这两个不等式非常重要.

=== Hölder's ineq
<hölders-ineq>
#theorem(
  title: [#kn[Hölder's ineq]],
)[
Consider conjugate pair: $p\,q in\[1\,oo\)$ s.t. $ 1 / p + 1 / q = 1 $
则对于任意两个 measurable function $f\,g : X arrow.r bb(C)$, 一定有: $ parallel f g parallel_1 lt.eq parallel f parallel_p dot.op parallel g parallel_q $特别地, 如果 $f in L^p\(mu\)$, $g in L^q\(mu\)$, 则 $f g in L^1\(mu\)$, 并且 equality holds iff $ parallel g parallel_q^q\|f\|^p= parallel f parallel_p^p\|g\|^q quad mu upright("-a.e.") $

]
#remark[
For $\(p\,q\)=\(2\,2\)$, this is #strong[Cauchy-Swartz ineq]: $ parallel f g parallel_1 lt.eq parallel f parallel_2 dot.op parallel g parallel_2 $
即: $ \( integral f thin accent(g, macron) \) lt.eq integral\|f g\|lt.eq sqrt(\( integral\|f\|^2\) \( integral\|g\|^2\)) $

]
#proof[
Trivial Case 1: 如果 $parallel f parallel_p = 0$ (或者$parallel g parallel_q = 0$ ), then $f$ is zero $mu$-almost everywhere, and the product $f g$ is zero $mu$-almost everywhere, 于是两边都是 $0$, ineq trivially true. \ Trivial Case 2: 如果 $parallel f parallel_p = oo$ or $parallel g parallel_q = oo$, 则右边 infinite, ineq trivially true.
因而我们只需要考虑 $parallel f parallel_p$ and $parallel g parallel_q$ are in $\(0\,oo\)$ 的情况就好了. \ Main case: 我们需要一个 Lemma:

#lemma(
  title: [#kn[Young's inequality for products]],
)[
Whenever $p\,q in\(1\,oo\)$ with $1 / p + 1 / q = 1$, 都有
$ a b lt.eq a^p / p + b^q / q\,quad forall a\,b gt.eq 0 $
where equality is achieved if and only if $a^p = b^q$. \ 另一个等价形式是: $ a^lambda b^(1 - lambda) lt.eq lambda a +\(1 - lambda\)b\,quad forall a\,b gt.eq 0 $

]
#proof[
#strong[of Lemma:] \ $b = 0$ 则 trivial case. 因而 setting $t : = a / b$, reduced to show: $ t^lambda lt.eq lambda t +\(1 - lambda\) $
with eq iff $t = 1$. 这是显然的, 因为 by Calculus, $t^lambda - lambda t$ 是 strictly increasing for $t < 1$, strictly decreasing for $t > 1$ 的, max 在 $t = 1$, 正好是 $1 - lambda$.

]
使用 Young's inequality for products 得到:
$ frac(\|f\(x\)\|, parallel f parallel_p) frac(\|g\(x\)\|, parallel g parallel_q) lt.eq frac(\|f\(x\)\|^p, p parallel f parallel_p^p) + frac(\|g\(x\)\|^q, q parallel g parallel_q^q)\,quad x in X $

Integrating both sides gives
$ frac(parallel f g parallel_1, parallel f parallel_p parallel g parallel_q) lt.eq frac(parallel f parallel_p^p, p parallel f parallel_p^p) + frac(parallel g parallel_q^q, q parallel g parallel_q^q) = 1 / p + 1 / q = 1\, $
which proves the claim. \ Integration 的 equality holds iff point equality holds a.e., 并且, by Young's inequality for products, 上面的 equality holds iff $ parallel g parallel_q^q\|f\|^p= parallel f parallel_p^p\|g\|^q quad mu upright("-a.e.") $

]
#remark[
\1. 显然, 根据我们的证明过程可知: #strong[Hölder's ineq also holds on any measurable subset $S subset X$]: $ integral_S\|f g\|lt.eq \( integral_S\|f\|^p\)^(1 / p) \( integral_S\|g\|^q\)^(1 / q) $
\2. 这里的满足 $1 / p + 1 / q = 1$ 的 $p\,q$ 我们称之为: #strong[Hölder conjugate], 并称它们互为对方的 #strong[conjugate exponent]. \ 3. 左边实际上是两个正值函数的 inner product, 相当于把一个投影到另一个上; \ 几何直观: Hölder's ineq 在退化为 Cauchy-Swartz 时表示, 两个函数/向量的内积一定小于等于长度积; 而 Hölder's ineq 更广义: 表示它们的内积一定小于它们取任意相互 conjugate 的 norm 长度的积.
并且 sooner 我们会学到: 对作为 Hölder conjugates 的 $p\,q$, $L^p$ 和 $L^q$ 互为 dual space, 从而 Hölder ineq 表示的是就是 norm 与其 dual norm 之间的 maximal inner product 控制关系.

]
#remark[
Hölder's ineq 有一个 generalization:
对于任意 $0 < s < oo$ and $0 < p_1\,dots.h\,p_n < oo$ such that
$ 1 / p_1 + 1 / p_2 + dots.h + 1 / p_n = 1 / s\; $
都有
$ parallel f_1 f_2 dots.h.c f_n parallel_s lt.eq parallel f_1 parallel_(p_1) parallel f_2 parallel_(p_2) dots.h.c parallel f_n parallel_(p_n) . $

This generalization will be proved in hw8.

]
=== Minkowski's ineq: tri ineq on $L^p$, 确认 $parallel dot.op parallel_p$-norm 是 $L^p$ 上的 valid norm
<minkowskis-ineq-tri-ineq-on-lp-确认-cdot_p-norm-是-lp-上的-valid-norm>
Minkowski's ineq 即 $L^p$ space 上的 tri ineq.

#corollary(
  title: [#kn[Minkowski inequality]],
)[
对于任意 $1 lt.eq p < oo$, 都有: $ parallel f + g parallel lt.eq parallel f parallel_p + parallel g parallel_p $

]
#proof[
显然, 对于任意 $x$ 都有: $ \|f + g\|^p lt.eq \(\|f\|+\|g\|\)\|f + g\|^(p - 1) $
因而: $ integral\|f + g\|^p & lt.eq integral\|f\|dot.op\|f + g\|^(p - 1)#h(0em) + #h(0em) integral\|g\|dot.op\|f + g\|^(p - 1) $
我们定义 $ h\(x\):=\|f\(x\)+ g\(x\)\|^(p - 1) $于是 $ integral\|f + g\|^p & lt.eq integral\|f h\|+ integral\|g h\|\
 & lt.eq parallel f parallel_p parallel h parallel_q + parallel g parallel_p parallel h parallel_q\
 & = \( parallel f parallel_p + parallel g parallel_p \) \( integral\|f + g\|^(\(p - 1\)q)\)^(1\/q) $
其中 $q$ 是 $p$ 的 Hölder conjugate. 这里的 punchline is actually: 由于 $ q : = frac(p, p - 1) $ actually, $ \(p - 1\)q = p $
因而:
$ integral\|f + g\|^p & lt.eq \( parallel f parallel_p + parallel g parallel_p \) \( integral\|f + g\|^(\(p - 1\)q)\)^(1\/q)\
 & = \( parallel f parallel_p + parallel g parallel_p \) \( integral\|f + g\|^p\)^(1\/q)\
 & = \( parallel f parallel_p + parallel g parallel_p \) \( integral\|f + g\|^p\)^(1 - 1\/p) $
两边同时除以 $\( integral\|f + g\|^p\)^(1 - 1\/p)$ 得到: $ \( integral\|f + g\|^p\)^(1\/p) = : parallel f + g parallel_p lt.eq parallel f parallel_p + parallel g parallel_p $
从而得证.

]
#remark[
这里的技巧是: 把一个 $p$ 次方的函数拆成一个 $1$ 次方的函数和一个 $p - 1$ 次方的函数, 并且使用Hölder, 这样就得到了一个 1 次的函数的 $p$-norm 和另一个 $p - 1$ 次的函数的 $q$ norm, 但是注意 $q\(p - 1\)= p$, 因而这个函数就变成了 $ \( integral\|phi.alt\|^p\)^(1\/q) $的形式. 并且注意到: $ frac(integral\|phi.alt\|^p, \( integral\|phi.alt\|^p\)^(1\/q)) = \( integral\|phi.alt\|^p\)^(1\/p) = parallel phi.alt parallel_p $

]
#remark[
Minkowski 不等式证明的是 $1 lt.eq p < oo$ 时的 $p$-norm 的三角不等式. 但是对于 $0 < p < 1$, 它并不成立. 因为这个时候 $p - 1 < 0$, 我们刚才的证明不作效. \ 直观的证明: 在 $p gt.eq 1$ 的时候, $\|x\|^p$ 是一个 strictly convex 的函数; 而在 $0 < p < 1$ 的时候, $\|x\|^p$ 则是一个 strictly concave 的函数. \ 因而我们运用 strictly concave 的性质: $ \|a + b\|^p>\|a\|^p+\|b\|^p $
再由积分可得到反例. (比如取 indicator function 进行积分)

]
=== properties of $L^p$ spaces ($1 lt.eq p < oo$)
<properties-of-lp-spaces-1leq-p-infty>
=== $L^p$ ($1 lt.eq p < oo$) is Banach
<lp-1leq-p-infty-is-banach>
#theorem(
  title: [#kn[$L^p$ space ($1 lt.eq p < oo$) is Banach]],
)[
$L^p$ ($1 lt.eq p < oo$) is Banach.

]
#proof[
By last lec 的定理: 一个 NVS 是 Banach 的等价条件是任意 abs conv series 都 conv. 因而我们证明这一点即可. \ Suppose $f_n in L^p$ for each $n$, 并且这个 series abs conv, 即: $ B := sum_(k = 1)^oo parallel f_k parallel_p < oo $
我们 define: $ g\(x\): = sum_(k = 1)^oo f_k\(x\)\,quad g_n\(x\): = sum_(k = 1)^n f_k\(x\) $
我们 WTS: $ lim_(n arrow.r oo) g_n = g $
in $p$-norm induced metric sense, 即, for some $f in L^p$, 有 $ lim_(n arrow.r oo) parallel g - g_n parallel_p = 0 $
我们 Set: $ G_n := sum_(k = 1)^n\|f_k\|\,quad G := sum_(k = 1)^oo\|f_k\| $
这个函数以及函数列的定义是为了使用 DCT, 作 donimating function 用. \ By measurable function 的 limit behavior, 有 $ G_n\,G in L^(+) $
并且 $ parallel G_n parallel_p lt.eq sum_(k = 1)^n parallel f_k parallel_p lt.eq B $
由于 $G_n arrow.tr G$, by MCT 有 $ integral G^p = lim_(n arrow.r oo) integral G_n^p lt.eq B^p < oo $ 由于 $G in L^p$, 有 $ G\(x\)< oo quad a . e . $ 于是: $ g\(x\): = sum_(k = 1)^oo f_k\(x\)< oo quad a . e . $
又 $\|g_n\|\,\|g\|lt.eq G\,g_n arrow.r g$, 可得到: $ \|g_n - g\|^p lt.eq 2^p G^p in L^1 $ 因而 by DCT 可以得到: $ lim_n integral\|g_n - g\|^p= 0 $
从而$ lim_(n arrow.r oo) parallel g - g_n parallel_p = \( lim_n integral\|g_n - g\|^p\)^(1\/p) = 0 $

]
#remark[
\1. 我们说一个 function seq converge to 一个 function 指的是 in the sense of distance, 而这里就是 metric induced by norm, 即#strong[它们的差的 $L_p$ norm converge to $0$.] \ 2. 注意, 我们 recall: $f_k arrow.r f$ a.e. 并不说明 $f_k arrow.r f$ in $L^1$, 因为每个点 converge 的速度不一样. 当然, 对 $L^p$ 也同理. \ 3. #strong[虽然 a.e. convergence 不能推出 $L^p$ convergence, 但是配合 DCT, 则可以推出.] #strong[DCT 是我们证明 $L^p$ convergence 的关键.] \ 4. 要证明 $ lim_(n arrow.r oo) parallel g - g_n parallel_p = 0 $完全可以忽略积分外的 $1\/p$ 次方. 其实只需要证明 $ lim_n integral\|g_n - g\|^p= 0 $ 就可以了. 证明 $L^p$ convergence, 比起 $L^1$ convergence 略困难的地方就是被积函数变得更大了.

]
=== Criterion for $L^p$ convergence: 逐点 a.e. conv $+$ $L^p$ 积分值 conv
<criterion-for-lp-convergence-逐点-a.e.-conv-lp-积分值-conv>
我们刚才 mention: DCT 对于 function seq $L^p$ convergence 的证明有很大作用. 这里我们就提供一个 DCT 推出的 $L^p$ convergence 的判断准则:

#theorem(
  title: [#kn[Criterion for $L^p$ convergence]],
)[
if $f_n arrow.r f$ a.e. and $parallel f_n parallel_p arrow.r parallel f parallel_p$, then $parallel f_n - f parallel_p arrow.r 0$.

]
即 $ upright("a.e. conv ") + L^p upright(" norm conv") arrow.r.double.long L^p c o n v $
但是 converse 并不成立. 反例是 typewriter function.

#proof[
In Hw 8.

]
=== dense subsets of $L^p$, and specially $L^p\(bb(R)\,m\)$
<dense-subsets-of-lp-and-specially-lpmathbbrm>
#proposition(
)[
对于任意 $1 lt.eq p < oo$, the set of ${$simple functions$}$, is dense in $L^p$. \ 即: $ { f : X arrow.r bb(C) divides f = sum_1^n a_j chi_(E_j)\,mu\(E_j\)< oo } $是 $L^p$ 的 dense subset.

]
#remark[
我们已经 proved this for $L^1$, 而其实这个 density 推广至 $L^p$ 也成立.

]
#proof[
对 $f$ 使用 simple function seq 逼近, 使用 $2^p\|f\|^p$ 作为 dominating function of $\|f_k - f\|^p$\; 而后使用 DCT 得证.

]
#theorem(
  title: [#kn[$C_c^0\(bb(R)^n\)$ is dense in $L^p\(bb(R)\,m\)$ for $1 lt.eq p < oo$]],
)[
$C_c^0\(bb(R)^n\)$ is dense in $L^p\(bb(R)\,m\)$ for $1 lt.eq p < oo$

]
#proof[
exercise. Similar to the proof for $L^1$, 只需要使用加入 $p$ power 的 function 作为 dominating function 即可.

]
== $L^oo$ space, and relationship between $L^p$ spaces ($0 lt.eq p lt.eq oo$) \[Fol 6.1, finished\]
<linfty-space-and-relationship-between-lp-spaces-0leq-p-leq-infty-fol-6.1-finished>
对应 Folland 6.1(3), finishing 6.1. \ 我们已经完成了对 $1 lt.eq p < oo$ 的 $L^p$ space 的构建. 现在, 我们来构建最后一块拼图: $L^oo$ space.

=== $L^oo$ space
<linfty-space>
我们考虑这个启发式的例子: $ X := { 1\,2\,dots.h.c\,n }\,quad cal(A) := cal(P)\(X\)\,quad mu = mu_(c o u n t i n g) $
于是: $ L^p\(mu\)= {\(a_1\,dots.h.c\,a_n\): parallel\(a_1\,dots.h.c\,a_n\)parallel_p = \( sum\|a_i\|^p\)^(1\/p) < oo } = bb(C)^n $
我们发现: $ parallel\(a_1\,dots.h.c\,a_n\)parallel_p arrow.r max_j\|a_j\|quad upright("as") quad p arrow.r oo $
因为 $p$ 取得越大, 最大的 entry 的 contribution 占比就越突出. \ 对于这样的 $L^p$ space, 我们可以定义 $sup$ norm, 定义为最大的 entry. \ 即便 $X$ 是 countable 的, 这个定义也可以定义为 $sup_j\|a_j\|$, make sense. \ 那么如果我们想要给任意的 measure space 定义 sup norm 呢? 我们可以考虑 $ parallel f parallel_oo : = sup_(x in X)\|f\(x\)\|#h(0em) ? $
实际上我们有更好的定义方式:

#definition(
  title: [#kn[essential supremum]],
)[
$ parallel f parallel_oo : = inf { a gt.eq 0 : mu { x :\|f\(x\)\|> a } = 0 } $
也可以写作: $ upright("ess") sup_(x in X)\|f\(x\)\| $

]
#remark[
essential sup 是一个比较容易搞错的定义. \ 一个 function 的 essential supremum 即: 这个 function 几乎处处的 sup. \ 它 $lt.eq sup f$ , 因为它允许在零测集上存在一些点的函数值大于它. \ 这是合理的, 因为积分可以不考虑零测集. \

]
#remark[
对于零测集只有空集的 measure space 上的函数, 比如 对于 $ell^oo\(bb(N)\)$ 上的函数, 其 essentail supermum 即 supermum. \ 对于$ sup_(x in X)\|f\(x\)\| $我们也有一个称呼, 称其为 #strong[uniform norm]. 即: $ parallel f parallel_u := sup_(x in X)\|f\(x\)\| $

]
#definition(
  title: [#kn[$L^oo$ space]],
)[
$ L^oo\(mu\): = { f : X arrow.r bb(C) upright(" measurable") : parallel f parallel_oo < oo }\/tilde.op $
where $tilde.op$ 表示 a.e. 相等的函数的 equiv class.

]
#remark[
注意: #strong[$f in L^oo\(mu\)$, 并不等价于 $f$ a.e. bounded!] \ 实则 recall: $f$ a.e. #strong[bounded 是 $f in L^p\(mu\)$ for any $1 lt.eq p lt.eq oo$ 的必要条件], 否则, 函数积分不可能 $< oo$, 函数 $p$ 次方的积分更加不可能 $< oo$. \ $f in L^oo\(mu\)$ 是一个很严格的条件, 当然严格强于 $f$ a.e. bounded. \ 比方说: #strong[$f = 1 / x$, 只有在 $0$ 这一个点上 $f$ 是 unbounded 的, 但是它的 essential supermum 仍然是 $oo$], 因为不可能通过去掉一个 measure $0$ set 来使它 bounded. \ 无法找到一个 $M$, 使得 $f$ 在几乎处处都小于 $M$. 你只能控制, $f$ 在 $\(0\,1\/M\)$ 上小于 $M$, 这个集合的测度随 $M$ 增大越来越小, 但是永远都是正测度.
(同样这个函数也不属于任何 $L^p\(m\)$\.) \ 一个函数 essential supermum $< oo$, 即 $in L^oo$, 则必须要它 unbounded 的这个行为是可以忽略不计的, 不能是明显的. 比如它在 $bb(Q)$ 上 unbounded. 如果是在一个点上连续 blow up, 那么它就不可能 $in L^oo$. 类似于这里的 $f = 1 / x$. \

]
#remark[
我们在本节课还会证明, 如果 measure space $X$ has finite measure, 那么有 $ L^oo\(X\)subset dots.h.c subset L^p\(X\)subset dots.h.c subset L^q\(X\)subset dots.h.c subset L^1\(X\) $
for 任意的 $p gt.eq q$. \ 这表明的是, 在一定要求下, $L^oo$ 是要求最严格的 space.

]
下面是一个比较典型的例子:

=== $ell^oo$ space
<ellinfty-space>
#definition(
  title: [#kn[$ell^oo$]],
)[
$ ell^oo : = {\(a_j\)_1^oo: parallel\(a_j\)parallel_oo : = sup_j\|a_j\|< oo } $

]
#example(
)[
$ f = x chi_(bb(Q)) in L^oo\(m\) $with $ parallel f parallel_oo = 0 $
因为整个 $bb(Q)$ 都是零测的.

]
#remark[
$ell^oo$ 其实就是: $ X : = bb(N)\,quad cal(A) : = cal(P)\(X\)\,quad mu = mu_(c o u n t i n g) $的 measure space 上的 $L^oo\(mu\)$. $ ell^oo = L^oo\(bb(N)\,cal(P)\(bb(N)\)\,mu_(c o u n t i n g)\) $
一个 seq 就是一个从 $bb(N)$ to $bb(C)$ 的函数, 把每个 entry map to 一个 complex number. \ #strong[而对于 counting measure 作为 measure 的 measure space 上, 唯一的零测集就是空集], 因为哪怕只取一个元素, 这个子集的测度也是 1. \ 比如, 我们只取三个 entry $1\,2\,8$, 看 ${\|a_n\|}_1^oo\\{\|a_1\|\,\|a_2\|\,\|a_3\|\)}$ 中的 $sup$ value, 也不符合 essential supremum 的定义. \ 因而我们发现, #strong[对于 唯一的零测集就是空集 的 measure space, for example, 任何以 counting measure 作为 measure 的 measure space, 其 essential sup norm 就是普通的 sup value norm.] \ 比如 $ bb(C)^1\,bb(C)^2\,bb(C)^3\,dots.h.c\,ell^oo $

]
=== $L^oo$ 的基本性质: as a NVS; Hölder's ineq on it; dense subsets
<linfty-的基本性质-as-a-nvs-hölders-ineq-on-it-dense-subsets>
#lemma(
)[
如果 $f in L^oo\(mu\)$ 则:

- 一定有 $\|f\(x\)\|lt.eq parallel f parallel_oo$ for a.e. $x$.

- 存在一个 bounded 函数 $g$, 使得 $f = g$ a.e.

]
#proof[
显然.

]
#remark[
是否有在某个零测集上 unbounded 但是却 $L^oo$ 的函数? 答案是肯定的:$ f\(x\)= cases(delim: "{", 1 / x\, & x in bb(Q) inter\(0\,1\], 0\, & upright("otherwise")) $
有 $parallel f parallel_oo = 0$.

]
#theorem(
)[
- $ parallel f g parallel_oo lt.eq parallel f parallel_1 parallel g parallel_oo $
  可以把它看作 #strong[Hölder 的一部分特殊情况], 因为可以看作 $ 1 / 1 + 1 / oo = 1 $ 从而补充完整了 Hölder ineq for $1 lt.eq p\,q lt.eq oo$

- $L^oo$ 是一个 #strong[normed vector space], equipped with $parallel dot.op parallel_oo$

- simple functions are dense in $L^oo$

]
#proof[
容易证明.

]
#remark[
注意, $L^oo$ 和 $L^p$ 有一个出入点是: #strong[$C_c^0\(bb(R)^n\)$ 并不是 $L^oo\(bb(R)^n\,m\)$ 上的 dense subspace!] \

]
=== $L^oo$-convergence 作为 (finite measure space 下) 最强的 $L^p$ convergence: 等价于 uni. conv a.e.
<linfty-convergence-作为-finite-measure-space-下-最强的-lp-convergence-等价于-uni.-conv-a.e.>
#theorem(
  title: [#kn[convergence in $L^oo$ $arrow.l.r.double$uniform convergence a.e.]],
)[
$ f_n arrow.r f #h(0em) upright(" in ") L^oo arrow.l.r.double upright("exists null set ") E subset X #h(0em) s . t . f_n arrow.r f upright(" uniformly on ") E^c $
(注意, 这#strong[不是 conv almost uniformly], 而是一个比 almost uniformly #strong[更强]的条件: #strong[conv uniformly almost everywhere], 因为 almost uniformly 只要求对于任意的 $epsilon.alt$, 都存在一个 measure 小于 $epsilon.alt$ 的 $E$, 使得在 $E^c$ 上 uni conv 即可.)

]
#remark[
这一条 convergence 十分惊人. 因为#strong[对于普通的 $L^p$ space, converge in $L^p$ 和 a.e. convergence 并没有任何的互推关系]\; 但是对于 $L^oo$ convergence, 我们却可以把它#strong[等价于 uniform convergence almost everywhere], which is 一个#strong[比 a.u convergence 更强, 比 a.e. convergence 更强的逐点 convergence]. 可以看出 $L^oo$ convergence 是比任何 $L^p$ convergence 都要强一个层次的收敛性质. \ 这一点

]
#proof[
⇐: Suppose $f_n arrow.r f$ uni. a.e; WTS: $f_n arrow.r f$ in $L^oo$
$f_n arrow.r f$ uni. a.e 即: 存在零测集 $E subset X$, $f_n arrow.r f$ on $E^c$. \ Let $epsilon.alt > 0$. \ $f_n arrow.r f$ uni. a.e 表明, 存在 $N$ 使得 for all $n gt.eq N$ 有 $ forall x in E^c\,quad\|f_n\(x\)- f\(x\)\|< epsilon.alt $
by def, exactly is: $ parallel f_n - f parallel_(L^oo) = "ess sup"_(x in X)\|f_n\(x\)- f\(x\)\|lt.eq epsilon.alt $
This shows that $parallel f_n - f parallel_(L^oo) arrow.r 0$, 即 $f_n arrow.r f$ in $L^oo$. \ ⇐: Suppose $f_n arrow.r f$ in $L^oo$\; WTS: $f_n arrow.r f$ uni. a.e.Denote: $ epsilon.alt_n := parallel f_n - f parallel_(L^oo) $
By assumption, $epsilon.alt_n arrow.r 0$. Define for each $n$:
$ A_n := { x in X :\|f_n\(x\)- f\(x\)\|> epsilon.alt_n } $
By def $parallel f_n - f parallel_(L^oo) = upright("ess sup")_x\|f_n\(x\)- f\(x\)\|lt.eq epsilon.alt_n$, 于是 $mu\(A_n\)= 0$
那么令: $ E := union.big_(n = 1)^oo A_n $by subadditivity of measure 有 $mu\(E\)= 0$.
于是对于任意 $epsilon.alt_n$, 都有
$ \|f_n\(x\)- f\(x\)\|lt.eq epsilon.alt_n arrow.r 0\,quad upright("for all ") x in E^c $
由于 $epsilon.alt_n arrow.r 0$, showing that outside $E$, 有 $parallel f_n - f parallel_(L^oo) arrow.r 0$.

]
#remark[
这两个 convergence 直觉上是自然相等的. \ 但是这并不能够说明 $L^oo\(mu\)upright("-convergence")$ 就是强于任何 $L^p\(mu\)upright("-convergence")$ 的. 因为即便是 uniform 的 ptwise conv 也无法推出 $L^p$ conv. \ 特殊情况是, 如果整个 base space $X$ 是 finite measure 的, 则可以推出$ L^oo\(mu\)upright("-convergence") arrow.r.double.long L^p\(mu\)upright("-convergence") arrow.r.double.long L^q\(mu\)upright("-convergence") arrow.r.double.long dots.h.c $
whenever $p > q$. (可证明) \ 但是对于无限测度空间, 这种推论未必成立.

]
=== $L^oo$ as Banach space
<linfty-as-banach-space>
#theorem(
  title: [#kn[$L^p$ ($1 lt.eq p lt.eq oo$) is Banach]],
)[
For any measure space $\(X\,cal(A)\,mu\)$, $L^p\(mu\)$ is Banach for all $1 lt.eq p lt.eq oo$

]
#proof[
我们已经 proved 了 $1 lt.eq p < oo$ 的 case, 现在 prove $p = oo$ 的 case. \ By @thm-09-l-p-space-and-inequalities-another-criterion-for-banach-space, 我们知道 STS: every abs conv series conv in $L^oo$. \ 我们 suppose $f_k in L^oo$ 有 $ sum_(k = 1)^oo parallel f_k parallel_oo < oo $
WTS: $sum_(k = 1)^oo f_k$ converges. \ Set: $ E_k := { x :\|f_k\(x\)\|> parallel f_k\|\|_oo} $
于是有 $ mu\(E_k\)= 0 quad upright("for each ") k $
因而 setting $ E : = union.big_(k = 1)^oo E_k $有 $ mu\(E\)= 0 $
note: $ x in E^c arrow.r.double.long sum_(k = 1)^oo\|f_k\(x\)\|lt.eq sum_(k = 1)^oo parallel f_k parallel_oo < oo $
从而, $ g : = sum_(k = 1)^oo f_k $在 $E^c$ 上是 well-defined 的, 且 bounded by $sum_(k = 1)^oo parallel f_k parallel_oo$. \ 对于 $x in E$, 我们可以随便设置值, 比如 $pi$, 然后 define $g\(x\)= pi$ on $x in E$. 然后对于 each $n$, 我们 set: $ g_n\(x\): = {sum_(k = 1)^n f_k\(x\)\,quad x in E^c\
1 / pi\,quad x in E $ 从而
$ parallel g_n - g parallel_oo lt.eq sup_(x in E^c)\|g_n\(x\)- g\(x\)\| & lt.eq sup_(x in E^c)\|sum_(n + 1)^oo f_k\(x\)\|\
 & lt.eq sup_(x in E^c) sum_(n + 1)^oo\|f_k\(x\)\|\
 & lt.eq sum_(n + 1)^oo parallel f_k parallel_oo arrow.r 0\
 $

]
#remark[
My reflection: 不 Banach 的 normed vector space 是什么样子的呢? 即, 这个 space 中存在某些 series, 其对应的 norm series absolutely conv 但是它却不 converge to 一个元素呢? \ 我们考虑空间 $c_00$，它是所有 finite supp 的 seq 组成的空间:
$ c_00 := { x =\(x_1\,x_2\,dots.h\)in bb(R)^(bb(N)) divides upright("only finite ") x_i eq.not 0 } $
with $ell^1$ norm: $ parallel x parallel = sum_(i = 1)^oo\|x_i\| $
$c_00$ 是一个 normed vector space, 但不是 Banach space, 它的完备化是 $ell^1$.
我们考虑 series, with: $ x_n = e_n\/2^n $
其中 $e_n =\(0\,dots.h\,0\,1\,0\,dots.h\)$, 第 $n$ 个位置是 1, 其余是 $0$, 是这个 NVS 的 standard basis. \ 显然每个 $x_n in c_00$，并且： $ parallel x_n parallel = 1 / 2^n quad arrow.r.double quad sum_(n = 1)^oo parallel x_n parallel = sum_(n = 1)^oo 1 / 2^n = 1 $这是一个 absolutely convergent series, 但其和
$ sum_(n = 1)^oo x_n = (1 / 2 \, 1 / 4 \, 1 / 8 \, dots.h) in.not c_00 $
$L^p$ space 的 Banach 性表示了其#strong[极限存在的稳定性]. recall, Banach 即 complete NVS, 而 #strong[complete 是比 closed 更强的条件]. \ 因而#strong[任何一个 $L^p$ 函数列, 如果 Cauchy / converge in $L^p$ norm, 那么它的极限一定在 $L^p$ 里.]

]
=== relationship between $L^p$ spaces
<relationship-between-lp-spaces>
=== $L^m\(mu\)subset L^n\(mu\)\,0 < n lt.eq m lt.eq oo$, for measure finite space)
<lmmu-subset-lnmu-0-nleq-mleq-infty-for-measure-finite-space>
刚才我们已经 state 了, 但还没有证明:

#theorem(
  title: [#kn[inclusion relation between $L^p$ spaces (when base space is finite
measure)]],
)[
如果 measure space $X$ has finite measure, 那么有 $ L^oo\(X\)subset dots.h.c subset L^m\(X\)subset dots.h.c subset L^n\(X\)subset dots.h.c $
for 任意的 $m gt.eq n$.

]
这是我们首次把 $p < 1$ 也 include 进我们的讨论.

这个 statement 即: 对于 from finite measure space to $bb(C)$ 的 function $f$, 它的 $parallel f parallel_m < oo$ 是比 $parallel f parallel_n < oo$ 更强的条件. \ 尤其, 除去 $L^oo$ 的情况, 它更直接的意思是: 对于 $0 < n lt.eq m < oo$ 而言, $f$ 的绝对值的 $m$ 次方的积分 $< oo$ 是比 $f$ 的绝对值的 $n$ 次方的积分 $< oo$ 要更强的条件.

这其实是一件比较直观的事情. 因为对于 $\|f\|gt.eq 1$ 的部分,
$ integral_(\|f\|gt.eq 1)\|f\|^(l a r g e)gt.eq integral_(\|f\|gt.eq 1)\|f\|^(s m a l l) $
而对于 $\|f\|< 1$ 的部分,$ integral_(\|f\|< 1)\|f\|^(l a r g e)lt.eq integral_(\|f\|< 1)\|f\|^(s m a l l) $
然而#strong[由于整个 space 的 measure 是 finite 的, $\|f\|< 1$ 的部分并不影响]. 因为 $ integral_(\|f\|< 1)\|f\|^(l a r g e)lt.eq integral_(\|f\|< 1)\|f\|^(s m a l l)lt.eq integral_(\|f\|< 1) 1 lt.eq mu\(X\) $
因而, 对于 $mu\(X\)< oo$ 的情况, 显然有 $parallel f parallel_(l a r g e) < oo$ 是比 $parallel f parallel_(s m a l l) < oo$ 更强的条件. \ #strong[\(实际上, 如果只有 measure finite 的 $x$ 上 $\|f\(x\)\|< 1$, 那么即便 $mu\(X\)= oo$, $parallel f parallel_(l a r g e) < oo$ 也是比 $parallel f parallel_(s m a l l) < oo$ 更强的条件; 而如果有 measure infinite 的 $x$ 上 $\|f\(x\)\|< 1$, 那么有可能 $parallel f parallel_(l a r g e) < oo$ 是比 $parallel f parallel_(s m a l l) < oo$ 更弱的条件)] \ My point: 虽然说 $\|f\(x\)\|^(l a r g e)$ 比起 $\|f\(x\)\|^(s m a l l)$ 是更大还是更小取决于 $\|f\(x\)\|$ 是否 $gt.eq 1$ or $< 1$, 但是 $gt.eq 1$ 的值是可以 unbounded 的, 而 $< 1$ 的值再怎么通过小次方变得更大, 也超不过 $1$. 因而 $\|f\(x\)\|gt.eq 1$ 的部分通常更能函数积分值的有限性, 除非在一个 measure infinite 的集合上 $\|f\(x\)\|< 1$.

这里有一个更加严格的证明:

#proof[
首先, 对于 $m = oo$ 的 case, 如果 $f in L^m = L^oo$, 那么取任意 $1 lt.eq n < oo$ 都有: $ integral\|f\|^n lt.eq integral parallel f parallel_oo^n = parallel f parallel_oo^n mu\(X\)< oo $
其次, 对于正常的 $m < oo$ 的 case, 我们使用 Hölder:
如果 $f in L^m$, 那么对于任意 $n < m$, 我们可以构造出 Hölder conjugate $m / n$ 和 $frac(m, m - n)$,从而:
$ integral\|f\|^n & = integral\|f\|^n dot.op 1\
 & lt.eq \( integral\(\|f\|^n\)^(m / n)\)^(n / m) \( integral 1^(frac(m, m - n)) \)^(frac(m - n, m))\
 & = parallel f parallel_m^n mu\(X\)^(frac(m - n, m))< oo $
从而 $ parallel f parallel_m < oo arrow.r.double.long parallel f parallel_n < oo $
这一 proof 利用 Hölder conjuate, 通过构造包含 $m / n$ 的 Hölder conjugate, 把 $integral\|f\|^n$ 改成了 $parallel f parallel_m$ 的 expression.

]
以下是一个经典的例子:

#example(
)[
考虑 #strong[measure finite 的 measure space $\(0\,1\)$]: 通过经典的 Calculus 我们知道:
$ f\(x\)= 1 / x^m in L^p\(0\,1\)quad upright(" for all ") p < 1 / m $
但是对于任意的 $m$, 都有: $ f\(x\)= 1 / x^m in.not L^p\(0\,1\) $
而我们再看一个 #strong[measure infinite 的 measure space $\(1\,oo\)$ 上的反例], 采用同一个函数:
$ f\(x\)= 1 / x^m\,quad x in\(1\,oo\) $
这个时候, $p$ 越大, $integral\|f\|^p= parallel f parallel_p^p$ 反而越小, 通过经典的 Calculus 我们知道:我们知道
而对于 $ f\(x\)= 1 / x^m in L^p\(1\,oo\)quad upright("for all ") p > 1 / m $并且 $f in L^oo\(1\,oo\)$, 因为 $parallel f parallel_oo = 1$. \ 这个空间上的这个函数正对应了我们刚才讨论的, 如果有 infinite measure 数量的 $x$ 上 $\|f\(x\)\|< 1$, 那么很可能 $parallel f parallel_(l a r g e) < oo$ 是比 $parallel f parallel_(s m a l l) < oo$ 更弱的条件

]
=== control arbitrary $parallel f parallel_m$ 和 $parallel f parallel_n$ 的大小比例, in measure finite space
<control-arbitrary-f-_m-和-f-_n-的大小比例-in-measure-finite-space>
#remark[
刚才我们的推导中, $ integral\|f\|^n lt.eq parallel f parallel_m^n mu\(X\)^(frac(m - n, m))< oo $
两边开 $p$ 方, 可以得到一个不等式:

#theorem(
)[
对于 measure finite space $X$, 对于任意的 $0 < n lt.eq m lt.eq oo$, 有: $ parallel f parallel_n lt.eq parallel f parallel_m thin mu\(X\)^(1 / n - 1 / m) $

]
这也是一个有用的不等式. 它在 measure finite space 上, 对于任意的可测函数, 控制了两个任意的 function $p$-norm (虽然 for $p < 1$ 不能严格地称为 norm) 之间的大小关系。

]
=== $\(L^n inter L^r\)subset L^m subset\(L^n + L^r\)$, 对任意 $0 < n < m < r lt.eq oo$
<lncap-lr-subset-lm-subset-ln-lr-对任意-0-n-m-r-leq-infty>
#proposition(
)[
对于 measurable $f : X arrow.r bb(C)$, $ t mapsto parallel f parallel_(1 / t) $is #strong[log-convex]. \ equivalently 即: 对于任意的 $0 < n < m < r lt.eq oo$, 都有 $ parallel f parallel_m lt.eq parallel f parallel_n^lambda dot.op parallel f parallel_r^(1 - lambda) $
where $ lambda := frac(1 / m - 1 / r, 1 / n - 1 / r) in\(0\,1\)\,quad i . e . \( 1 / m \) = lambda \( 1 / n \) +\(1 - lambda\)\( 1 / r \) $

]
#remark[
log convex 即: 这个函数的 $log$ 函数是 convex 的. 即对于任意 $x\,y$, 以及 $\[x\,y\]$ 上的任意一点, 即 $lambda x +\(1 - lambda\)y$ for some $lambda in\[0\,1\]$, 都有: $ log f\(lambda x +\(1 - lambda\)y\)lt.eq lambda log f\(x\)+\(1 - lambda\)log f\(y\) $ 即: $ f\(lambda x +\(1 - lambda\)y\)lt.eq f\(x\)^lambda f\(y\)^(1 - lambda) $
例如: $e^x\,e^(x^2)\,x^x$ 都是 log-convex 的. convex 函数的几何意义是 #strong[\"函数值小于等于两端的线性插值\"], 中点值 $lt.eq$两端值的#strong[算术平均], 而 log-convex 函数的几何意义是: , 中点值 $lt.eq$两端值的#strong[几何平均]. \ 这里, 两端点是 $1 / r < 1 / n$, 而中间的取点则是 $1 / m$. log convexity 性质表明: $ parallel f parallel_m lt.eq parallel f parallel_n^lambda dot.op parallel f parallel_r^(1 - lambda) $

]
#proof[
For $r = oo$, then $lambda = n / m$. \ Since $ \|f\|^m=\|f\|^n dot.op\|f\|^(m - n)lt.eq\|f\|^n dot.op parallel f parallel_oo^(m - n) quad a . e . $
可以得到 $ integral\|f\|^m lt.eq \( integral\|f\|^n\) dot.op parallel f parallel_oo^(m - n) = parallel f\|\|_n^n dot.op parallel f parallel_oo^(m - n) $
从而 Taking $q$th root 得到结果:$ parallel f parallel_m lt.eq parallel f parallel_n^(n\/m) parallel f parallel_oo^(1 - n\/m) $
For $r < oo$: 我们采用 conjugate exponents: $ frac(n, lambda m)\,frac(r, \(1 - lambda\)m) $
这是因为: $ \( 1 / m \) = lambda \( 1 / n \) +\(1 - lambda\)\( 1 / r \) arrow.r.double.long 1 = lambda \( m / n \) +\(1 - lambda\)\( m / r \) $
从而 Applying Hölder: $ integral\|f\|^m & = integral\|f\|^(lambda m)\|f\|^(\(1 - lambda\)m)\
 & lt.eq \( integral\|f\|^n\)^(frac(lambda m, n)) \( integral\|f\|^r\)^(frac(\(1 - lambda\)m, r))\
 & = parallel f parallel_n^(lambda m) dot.op parallel f parallel_r^(\(1 - r\)m) $
Taking $q$ th root 得到结果.

]
#remark[
Hölder's ineq 仍然是这里重要的一步. 我们这里需要利用 convexity 表述中的 \"point on a line segment\" 条件来构造一个 conjugate.

]
#remark[
此处我们可以由这个 proposition 直接得到一个推论: ~

#corollary(
)[
对于任意的 $0 < n < m < r lt.eq oo$, 都有 $ \(L^n inter L^r\)subset L^m $

]
]
#example(
)[
令 $A$ 为任意集合, $0 lt.eq p < q lt.eq oo$, 有: $ parallel f parallel_q lt.eq parallel f parallel_p quad upright("and thus") quad ell^p\(A\)subset ell^q\(A\) $
这是因为 $ parallel f parallel_oo^p = sup_alpha\|f\(alpha\)\|^p lt.eq sum_alpha\|f\(alpha\)\|^p= parallel f parallel_p^p $
于是 for $q eq.not oo$ case $ parallel f parallel_q lt.eq parallel f parallel_p^lambda parallel f parallel_oo^(1 - lambda) lt.eq parallel f parallel_p $
(另一 case, trivial.) \ 我们发现 $ell^p$ 空间, $p$ 越小要求反而越严格. \ 这是因为 $ell^p$ 空间中一个函数就是一个 seq, 其 $p$-norm 就是各项的 $p$ 次方和, 再开 $p$ 次方根. \ 对于一个 seq, 如果它的累和 series 收敛, 它的各项肯定是 #strong[eventually 收敛的], 那么这些除了有限项外的这些项的绝对值都是 $< 1$ 的, 那么 #strong[$p$ 越大, 它们 $p$ 次方和只会越小]. 这正对应了我们之前说的 #strong[\"$\|f\(x\)\|< 1$ 的点主导函数\" 的情况.] \ \

]
相对于这个inclusion 关系, 我们还有另外一个 inclusion 关系:

#proposition(
  title: [#kn[每个 $L^m$ 函数都是一个 $L^n$ 函数和一个 $L^r$ 函数的和
($0 < n < m < r lt.eq oo$)]],
)[
对于任意的 $0 < n < m < r lt.eq oo$, 都有 $ L^m subset\(L^n + L^r\) $

]
这个 inclusion 关系有一种调和的感觉在里面. 它 roughly mean 给定一个函数, 它可以拆成一个更加容易积的函数和一个更加不容易积的函数, 并且我们很大程度上可以控制这两个函数的可积性. \ 但其实很简单, 就是用我们之前的 $\|f\(x\)\|< 1$ 和 $gt.eq 1$ 的点作为区分, 把函数的定义域分成两部分. 如果 $\|f\|$ 的 m 次方是可积的, 那么更小的 $n$ 次方, 对于 $\|f\(x\)\|gt.eq 1$ 的部分肯定也是可积的; 更大的 $r$ 次方, 对于 $\|f\(x\)\|< 1$ 的部分肯定也是可积的;

#proof[
Suppose $f in L^m$. Let $ E := { x :\|f\(x\)\|> 1 } $
let $ g : = f chi_E\,quad h := f chi_(E^c) $
于是 $g in L^n$ for all $0 < n lt.eq m$, $h in L^r$ for all $r gt.eq m$ and $r = oo$.

]
