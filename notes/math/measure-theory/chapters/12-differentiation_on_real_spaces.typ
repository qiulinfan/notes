#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= differentiation on real spaces
<differentiation-on-real-spaces>
== differentiation of regular Borel measures on $bb(R)^n$ \[Fol 3.4, finished\]
<differentiation-of-regular-borel-measures-on-mathbbrn-fol-3.4-finished>
#definition(
  title: [#kn[regular Borel measure]],
)[
一个 Borel measure $nu$ on $bb(R)^n$ 被称为 regular 的, if $nu$ is locally finite (finite on every compact set).

]
#theorem(
  title: [#kn[regular Borel measure: 蕴含了 regularity]],
)[
一个 regular Borel measure $nu$ on $bb(R)^n$ 一定满足:

+ outer regularity: $ nu\(E\)= inf { nu\(U\)divides E subset U upright(" open") } $

+ inner regularity: $ nu\(E\)= inf { nu\(U\)divides E subset U upright(" open") } $

]
#remark[
这里不证明这两个性质. 因为目前的知识不够. \ regular $arrow.r.double.long$ outer regularity: Hard, 其推导需要 Ch7
regular 和 inner regularity $arrow.r.double.long$ outer regularity: 这个简单, same as proof of Thm 1.18 on Folland.

]
#example(
)[
任何 LS measure on $bb(R)$ (restrict to Borel sets) 都是 regular measure.
#ref[lebesgue-measure] $m$ on $bb(R)^n$ (restrict to Borel sets) 是 regular measure.

]
当然, 这个概念也可以推广至 signed/coplex measure 上.

#definition(
  title: [#kn[regular signed/complex measure]],
)[
一个 signed/complex measure $nu$ on $bb(R)^n$ 被称为 regular measure, if $\|nu\|$ is regular 的.

]
#lemma(
)[
如果 $f in L_(l o c)^1\(bb(R)^n\)$, 则 $f thin d m$ 是一个 regular measure.
如果 $f : bb(R)^n arrow.r bb(R)$ 是 extended-integrable 的, 则 $ f in L_(l o c)^1\(m\)arrow.l.r.double f thin d m upright(" is a regular measure") $

]
#proof[
Folland p99. 这显然, 因为 $f$ locally integrable 就说明 $f thin d m$ 是 locally finite 的.

]
#lemma(
)[
如果 $rho\,lambda$ 是 signed/complex measure 并且 $rho tack.t lambda$, 那么 $ rho\,lambda upright(" are regular measures") arrow.l.r.double rho + lambda upright(" is a regular measure") $

]
#proof[
在 hw 10 中. \ Note: STS it for positive measure, 这是因为对于 regular signed / complex measure 而言, $ lambda perp rho quad arrow.l.r.double quad exists A in cal(A) #h(0em) upright(" s.t. ") #h(0em)\|lambda\|\(A^c\)= 0 upright(" and ")\|rho\|\(A\)= 0 quad arrow.l.r.double quad\|lambda\|perp\|rho\| $
并且从而 $ nu = lambda + rho\,lambda perp rho arrow.r.double.long\|nu\|=\|lambda + rho\|=\|lambda\|+\|rho\| $
这一命题的证明也在 hw 10 中, \

]
=== LDT meets LRNT: 任何 regular Borel measure $nu$ on $bb(R)^n$ 对于 $m$ 的 RN-derivative $=$ relative density
<ldt-meets-lrnt-任何-regular-borel-measure-nu-on-mathbbrn-对于-m-的-rn-derivative-relative-density>
#theorem(
  title: [#kn[LDT meets LRNT: computing RN derivative on $bb(R)^n$]],
)[
Let $nu$ be a regular Borel measure on $bb(R)^n$, with LRN decomposition $ nu = lambda + rho\,quad d rho = f thin d m\,quad lambda tack.t m $即$ d nu = d lambda + f thin d m $
那么: 对于 $m$-a.e. $x in bb(R)^n$, 都有: $ lim_(r arrow.r 0) frac(nu\(B\(x\,r\)\), m\(B\(x\,r\)\)) = f\(x\) $

]
#remark[
Also true with $B\(x\,r\)$ replaced with shrinking $E_r$. \ 这一 Thm 一句话概括即: #strong[如果 $nu$ 是一个 regular measure, 那么几乎处处, 我们都可以用这一点上的 density of $nu$ over $m$ 来获得它对 $m$ 的 RN derivative $f$.]

]
#proof[
由 $nu = lambda + rho$ 得到:
$ frac(nu\(B\(x\,r\)\), m\(B\(x\,r\)\)) = frac(lambda\(B\(x\,r\)\), m\(B\(x\,r\)\)) + frac(rho\(B\(x\,r\)\), m\(B\(x\,r\)\)) $
#strong[By LDT, 我们有:] $ lim_(r arrow.r 0) frac(rho\(B\(x\,r\)\), m\(B\(x\,r\)\)) = f\(x\)\,quad upright(" for ") m upright("-a.e. ") x upright(". ") $
于是, 原命题即转化为 WTS: $ lim_(r arrow.r 0) frac(lambda\(B\(x\,r\)\), m\(B\(x\,r\)\)) = 0\,quad upright(" for ") m upright("-a.e. ") x upright(". ") $
(Notice: 这里 $0$ 也就是 $d lambda\/d m$, 因为两个 mutually singular 的 measure，其 RN derivative = $0$ a.e.). \ By lemma: 因为 $nu$ regular, 且 $lambda perp rho$ ,可以推出: $lambda\,rho$ 也是 regular 的. \ WLOG 我们可以 suppose $lambda$ 是 positive measure, 因为 $lambda perp m arrow.l.r.double\|lambda\|perp m$, 并且$\|lambda\(E\)\|lt.eq\|lambda\|\(E\)$ for any $E$. 因而 $lambda$ 是 positive measure 的情况中这个极限为 $0$ 也自然推广到 complex measure 上. \ 注意: 由于 $lambda perp m$, 我们可以选取 Borel set $A$ such that $ lambda\(A\)= 0\,quad m\(A^c\)= 0 $从而: 只需要证明 $lim_(r arrow.r 0) frac(lambda\(B\(x\,r\)\), m\(B\(x\,r\)\)) = 0$ for a.e. $x in A$ 就可以了, 因为 $A^c$ 本身也是 $m$ 的 null set. \ 我们 set: $ F_k : = { x in A : lim_(r arrow.r 0) frac(lambda\(B\(x\,r\)\), m\(B\(x\,r\)\)) gt.eq 1 / k } $
从而 STS: 对于任意 $k$, $m\(F_k\)= 0$. \ 我们 Fix 一个 $k$, by $lambda$ 的 inner regularity, STS: 对于任意的 cpt $K subset F_k$ compact, 都有 $m\(K\)= 0$. \ 于是我们 fix 一个 compact set $K subset F_k$, 并 fix $epsilon.alt > 0$, STS: $m\(K\)< epsilon.alt$. \ By $lambda$ 的 outer regularity, 存在 $U_epsilon.alt supset A$ open 使得 $ lambda\(U_epsilon.alt\)< frac(epsilon.alt, 3^n k) $
By $F_k$ 的定义, 对于任意的 $x in F_k$, 都存在某个 $r_x > 0$ 使得 $ nu\(B\(x\,r_x\)\)> 1 / k m\(B\(x\,r_x\)\) $
Since $ K subset union.big_(x in K) B\(x\,r_x\) $从而 by finite open covering thm, 一定存在某个 finite set $K'$ 使得 $ K subset union.big_(x in K') B\(x\,r_x\) $
我们 recall VItali covering lemma: For given collection of balls ${ B_j subset bb(R)^n }_(j = 1)^k$, 存在 #strong[disjoint] subcollection ${ B_(j_1)\,dots.h.c\,B_(j_m) }$ 使得$ union.big_(j = 1)^k B_j subset union.big_(i = 1)^m\(3 B_(j_i)\) $
代入这里, 得到: 存在 $K'' subset K'$ s.t. for all $x in K''$, $B\(x\,r_x\)$ 都是 disjoint 的, with $ K subset union.big_(x in K'') 3 B\(x\,r_x\) $
于是 $ m\(K\) & lt.eq sum_(x in K'') m\(3 B\(x\,r_x\)\)\
 & = 3^n sum_(x in K'') m\(B\(x\,r_x\)\)\
 & lt.eq 3^n k sum_(x in K'') lambda\(B\(x\,r_x\)\)\
 & lt.eq 3^n k lambda\(U_epsilon.alt\)lt.eq epsilon.alt $
Since $epsilon.alt$ 任意, $m\(K\)= 0$. \ Since $K$ 任意, $m\(F_k\)= 0$. \ Since $k$ 任意, $ m \( { x in A : lim_(r arrow.r 0) frac(lambda\(B\(x\,r\)\), m\(B\(x\,r\)\)) > 0 } \) = 0 $
从而得证.

]
#remark[
这实际上是一件比较自然的事情. 因为 $lambda perp m$, 那么存在一个划分: 使得某边 $lambda$ null, $m$ 具有全测度. 在这一边几乎每一点上, $lambda$ 相对于 $m$ 的密度理应为 $0$\; 而另一边, $m$ 是零测度的; 从而整体, 在至多一个 $m$ 的 null set 外, $lambda$ 相对于 $m$ 的密度为 $0$. \ 在这个证明中, 我们巧妙地同时运用了 inner 和 outer regularity 来简化要证明的结论, 最后 reduce to finite open covering 并自然地使用 VItali covering lemma 来 bound measure. 属于比较好看的证明.

]
=== Differentiation on $bb(R)$
<differentiation-on-mathbbr>
=== ${ upright("positive regular Borel measures on ") bb(R) } tilde.eq { upright("distribution functions ") F : bb(R) arrow.r bb(R) }$
<textpositive-regular-borel-measures-on-mathbbr-simeq-textdistribution-functions-fmathbbrtomathbbr>
Recall that:
#strong[每个 distribution function (非严格 increasing, right ctn function) 都对应了唯一的一个 regular Borel measures $mu_F$ on $bb(R)$, 反之亦然.] \ 给定一个 regular Borel measures $mu_F$,
$ F_mu\(x\):= {mu\(\(0\,x\]\)quad\,x gt.eq 0\
- mu\(\(x\,0\]\)#h(0em)\,x < 0 $
为它的 unique distribution function. 即 $mu\(\(a\,b\]\)= F\(b\)- F\(a\)$, for all h-intervals. \ 而给定对于 distribution function $F$, 我们 define $mu_0$ by:
$ mu_0\(union.big_(i = 1)^n\(a_i\,b_i\]\)= sum_(i = 1)^n\(F\(b_i\)- F\(a_i\)\) $
然后 #strong[by Hahn-Kolmogrov, extend to a regular Borel measure $mu_F$], 使得 $mu_F\(\(a\,b\]\)= F\(b\)- F\(a\)$ for any h-interval, i.e. $F$ 是 $mu_F$ 的 distribution function, 并且 unique in the sense that 任意其他的 such function $G$ 如果也是$mu_F$ 的 distribition function, 则必然有 $F - G$ 为 const.
从而 $ mu_F arrow.l.r F $
之间构成了一个 measures 和 functions 的空间的 bijection.

distribution function 和 regular measure 之间的对应关系, 关键用处在于什么呢?
我们 recall 刚刚才证明的定理, 不过使用一个更 general 的 version (can easily be extended from what we proved):

#theorem(
  title: [#kn[slightly more general version of LRNT meets LDT]],
)[
Let $nu$ be a regular Borel measure on $bb(R)^n$, with LRN decomposition $ nu = lambda + rho\,quad d rho = f thin d m\,quad lambda tack.t m $那么: 对于 $m$-a.e. $x in bb(R)^n$, 取任意 nicely shrinking ${ E_r }$ to $x$, 都有: $ lim_(r arrow.r 0) frac(nu\(E_r\), m\(E_r\)) = f\(x\) $

]
因而如果我们有一个 $bb(R)$ 上的 regualr measure $mu_G$, 那么考虑 $E_r : =\(x\,x + r\]$, 我们有:
$ frac(mu_G\(E_r\), m\(E_r\)) = frac(G\(x + r\)- G\(x\), r) $
从而我们发现 for a.e. $x$, 都有: $ lim_(r arrow.r 0) frac(mu_G\(E_r\), m\(E_r\)) = G'\(x\) $
我们可以得到: 这#strong[个 regualr measure $mu_G$ 相对于 $m$ 的 LRN derivative, 就等于它的 distribution function 的 derivative!]
甚至, 我们可以由此判断: #strong[如果 $G : bb(R) arrow.r bb(R)$ 是一个 distribution function (increasing, right ctn), 那么它的 derivative 一定是 a.e. 存在的!] Since $mu_G$ regular $arrow.r.double.long$ $G$ locally intble $arrow.r.double.long$ by LDT, 这个 density limit 是 a.e. 存在的. \ 至此, 我们发现了 Monotone Differentiation Theorem. \

=== Monotone Differentiation Theorem
<monotone-differentiation-theorem>
#theorem(
  title: [#kn[Monotone Differentiation Theorem]],
)[
令 $F : bb(R) arrow.r bb(R)$ 为一个 increasing (nondecreasing) function, set: $ G\(x\): = F\(x +\) $即 $F$ 的右极限函数. (note: $G$ 一定是 #strong[increasing] 且 #strong[right ctn] 的, 因而是一个 distribution function) \ 则有:

- $D_F := { x : F upright(" disctn at ") x }$ 是至多 ctbl 的 (从而一定 zero measure)

- $F\,G$ 都 differentaitble $m$-a.e., 并且 $ F' = G' upright(" a.e.") $

]
#proof[
#strong[of (a):] STS that, 对于任意 $m\,n in bb(N)$, $ Z_(m\,n) : = { x in\[- m\,m\]: F\(x +\)- F\(x -\)gt.eq 1 / n } $是一个 finite set. 从而 $D_F = union.big_(m\,n) Z_(m\,n)$ 是 at most ctbl 的. \ 而 $Z_(m\,n)$ 确实是 finite 的, 因为 $F\(- m\)- F\(m\)$ 是 bounded 的, 所以 $Z_(m\,n)$ 一定是 finite 的. (至多经历 $F\(- m\)- F\(m\)\/\(1\/n\)$ 个这样的点). \

]
#proof[
#strong[of (b):]
首先我们知道, $G$ right ctn + increasing $arrow.r.double.long mu_G$ 是一个 LS (thus regular when restricted to Borel sets) measure on $bb(R)$. \ Apply LDT to $mu_G$, take $E_r : =\(x\,x + r\]$ as the shrinking family to $x$. \ 于是
$ frac(mu_G\(E_r\), m\(E_r\)) = frac(G\(x + r\)- G\(x\), r) $
由 LDT $arrow.r.double.long$ 上式的 limit exist for a.e. $x$ ( $mu_G$ w.r.t. $m$ 的 RN derivative), 它就是 $G'$, 且 $G'$ a.e. 存在, 等于其 induce 的 LS measure 的 RN derivaive. \ 现在 remains to show: $F$ 的 derivative 也 a.e. 存在, 并且和 $G$ 的相等. 我们 set: $ H : = G - F $
从而 STS: $H'$ a.e. 存在且为 $0$. \ 首先, $H > 0$ 并且 $H eq.not 0$ 只有可能在 discontinuous points (which is at most ctbl)上. We set: $ mu : = sum_(x in D_F) H\(x\)delta_x $
从而对于任意区间 $I$, $ mu\(I\)= sum_(x in D_F inter I) H\(x\) $
由于 $F\,G$ locally intble, #strong[这个 $mu$ 是一个 regular Borel measure]. \ 并且, 这个 $mu$ 的 null set 为 $D_f^c$, 而 $D_f$, as we have proved, is at most ctbl, 因而是 $m$ 的 null set. 从而得到: $ mu perp m $于是 $ frac(d mu, d m) = 0 quad a . e $
从而由 LDT 得: $ frac(mu\(\(x - r\,x + r\)\), 2 r) arrow.r^(r arrow.r 0) 0 quad a . e . $
因而对于任意的 $h > 0$, $ \| frac(H\(x + h\)- H\(x\), h) \| lt.eq frac(H\(x + h\)+ H\(x\), \|h\|) lt.eq frac(mu\(\(x - 2\|h\|\,x + 2\|h\|\)\), 4\|h\|) arrow.r^(h arrow.r 0) 0 $
finishing the proof.

]
#remark[
#strong[As conclusion: $bb(R)$ 上的任意 increasing 函数 $F$, 其 right limit induce 的 LS measure 对于 $m$ 的 RN derivative, 就等于它的 derivative a.e.]

]
== functions of bounded variation: $F in B V$ \[Fol 3.5\]
<functions-of-bounded-variation-fin-bv-fol-3.5>
上一节课我们证明了 Monotone Differentiation Theorem: 它表明的是, 任何 $bb(R) arrow.r bb(R)$ 的 non-decreasing function 都是 differentiable a.e. 的. \ 我们知道一个函数在一整个区间上 differentiable 其实是一个比价严格的条件, 但是 differentiable a.e. 的条件就略好达到一些. \ Question: 如果一个函数在 $\[a\,b\]$ 上 differentiable a.e., 那么 in a.e. sense, 可以在 $\[a\,b\]$ 上定义它的 derivative $F'$. 那么, 是否一定有 $ F\(b\)- F\(a\)= integral_a^b F'\(x\)thin d x $呢? 答案肯定是不一定的. 以下是三个反例: 1. Heaviside function; 2. Cantor function; 3.$F'\(x\)= 0$ a.e., but not $0$ on a null set. \ 这也很显然: 因为单点的值是无法控制的. 我们只能控制 in sense of a.e. , 因而有 outlier 的 $a\,b$ 是很正常的. \ 我们之后将 revisit 这一问题, 给出这个等式成立的 condition.

接下来我们将

=== total variation function $T_F$ of a function $F$
<total-variation-function-t_f-of-a-function-f>
#definition(
  title: [#kn[total variation function]],
)[
给定一个 function $F : bb(R) arrow.r bb(C)$, 我们定义它的 total variation function $T_F$ 为:$ T_F : bb(R) & arrow.r\[0\,oo\]\
x & mapsto sup { sum_(j = 1)^n\|F\(x_j\)- F\(x_(j + 1)\)\|: - oo < x_0 < dots.h.c < x_n = x } $

]
#remark[
Total variation 是一个很形象的定义. $T_F\(x\)$ 表示的是 $F$ 从 $- oo$ 到当前 $x$ 的这段定义域上, 总的变化量. 它 count into 所有的变化, 包括离散的和连续的, 正方向的和负方向的. \

#figure(image("../assets/ch3-pics-Screenshot 2025-04-10 at 15.39.23.png", width: 50.0%),
  caption: [
  ]
)

]
#lemma(
)[
对于任意的 $F : bb(R) arrow.r bb(C)$, $T_F$ 都是 increasing 的; 并且对于任意 $a < b$, 有: $ T_F\(b\)= T_F\(a\)+ T_F\(a\;b\) $
where $ T_F\(a\;b\)= sup { sum_(j = 1)^n\|F\(x_j\)- F\(x_(j + 1)\)\|: b = x_0 < dots.h.c < x_n = a } $
表示 $F$ 的定义域限制在 $\[a\,b\]$ 上的 total variation.

]
#proof[
显然, 由于 total variation 是 increasing 的, #strong[我们总是可以 greedyly 选择 partition]. 对于一个 partition, 总是可以插入一个中间点把它分成两半, 而这两半的 sub partition 的 total variation 的和 $gt.eq$ 原先的 partition 的 total variation.

]
=== space of functions of bounded variation: $B V$ 的基本性质
<space-of-functions-of-bounded-variation-bv-的基本性质>
#definition(
  title: [#kn[function of bounded variation]],
)[
如果 $T_F\(oo\)< oo$, 我们称 $F : bb(R) arrow.r bb(C)$ is #strong[of bounded variation] 的, 写作 $F in B V$.

]
#definition(
  title: [#kn[function of bounded variation on an interval]],
)[
如果 $T_F\(a\;b\)< oo$, 我们称 $F : bb(R) arrow.r bb(C)$ is #strong[of bounded variation] on $\[a\,b\]$, 写成 $F in B V\(\[a\,b\]\)$.

]
首先显然, $F in B V$ 可以 reduce to real-valued 的情况来讨论.

#proposition(
)[
$ F in B V arrow.l.r.double Re f in B V upright(" and ") Im f in B V $

]
=== $B V$ as a vector space
<bv-as-a-vector-space>
#lemma(
  title: [#kn[$B V$ 是一个 complex vector space]],
)[
如果 $F\,G in B V$, 那么对于任意的 $a\,b in bb(C)$, we have $ T_(a F + b G) lt.eq\|a\|T_F +\|b\|T_G $
从而$ a F + b G in B V $

]
#proof[
易得. 显然, 函数的 total variation 是线性可加的.

]
=== $F in B V$ 的 $T_F$ 的 limit behavior
<fin-bv-的-t_f-的-limit-behavior>
我们知道，$F in B V$ if $T_F\(oo\)< oo$. 而关于 $T_F\(- oo\)$, 同样有强结论:

#proposition(
)[
$ F in B V arrow.r.double.long T_F\(- oo\)= 0 $

]
#proof[
Let $epsilon.alt > 0$. \ 从而对于任意的 $x in bb(R)$, since $F in B V$ 那么 $T_F$ bounded, $T_F\(x\)$ 是一个 real number. \ 因而我们可以找到一组 partition points $x_0 < dots.h.c < x_n$ 使得 $ sum_1^n\|F\(x_j\)- F\(x_(j - 1)\)\|gt.eq T_F\(x\)- epsilon.alt $从而 $ T_F\(x\)- T_F\(x_0\)gt.eq T_F\(x\)- epsilon.alt $从而 $ T_F\(y\)lt.eq epsilon.alt\,quad forall y lt.eq x_0 $
Since $epsilon.alt > 0$ arbitrary, 这证明了 $T_F\(- oo\)= 0$

]
#remark[
$F$ bounded variation 的必要条件是它在 $x arrow.r oo$ 时, 截止 $x$ 处的 variation $arrow.r 0$.

]
#lemma(
  title: [#kn[$F in B V$ right ctn $arrow.r.double.long T_F$ right ctn]],
)[
$F in B V$ right ctn $arrow.r.double.long T_F$ 也 right ctn

]
#proof[
Let $x in bb(R)\,epsilon.alt > 0$. \ Let $ alpha : = T_F\(x +\)- T_F\(x\) $WTS: $alpha = 0$. \ By right ctnity of $F$ 和 $T_F$ increasing, 我们可以选择 $delta > 0$, 同时满足: $\|F\(x + h\)- F\(x\)\|< epsilon.alt$, $T_F\(x + h\)- T_F\(x +\)< epsilon.alt$ whenever $0 < h < delta$. \ Fix 一个满足 $0 < h < delta$ 的 $h$. 其后的证明见 Folland 104.

]
=== 属于 $B V\,B V\(I\)$ 的函数
<属于-bvbvi-的函数>
#lemma(
  title: [#kn[哪些函数一定 $B V$ or $B V\(I\)$]],
)[
+ 如果 $F : bb(R) arrow.r bb(R)$ bounded 且 increasing, 那么 $F in B V$ 且 $T_F\(x\)= F\(x\)- F\(- oo\)$. \

+ 如果 $F : bb(R) arrow.r bb(R)$ 是 Lipschitz countinuous 的, 那么$F in B V\(I\)$ for 任意的 cpt interval $I$

+ 如果 $F : bb(R) arrow.r bb(R)$ 是 differentiable 且 $F'$ bounded 的, 那么 $F in B V\(I\)$ for 任意的 cpt interval $I$

]
#proof[
\(1) trivial. \ (2) by def: 考虑 Lipschitz const $M$, 则 $T_F\(a\;b\)lt.eq M\(b - a\)$. \ (3): 这是 (2) 的推论, 因为 recall: by MCT 可得: $F : bb(R) arrow.r bb(R)$ 是 differentiable 且 $F'$ bounded $arrow.r.double.long F$ Lipstchiz ctn.

]
#proposition(
)[
以下是一些经典的函数的 variational behavior:

+ $f\(x\)= sin\(x\)$: 属于 $B V\(I\)$ for 任意 cpt $I$, 但不属于 $B V$.

+ $f\(x\)= x sin 1 / x\,f\(0\)= 0$: #strong[属于$B V\(I\)$ iff $0 in.not I$.]

+ $f\(x\)= x^2 sin 1 / x^2\,f\(0\)= 0$: #strong[属于$B V\(I\)$ iff $0 in.not I$.]

]
#proof[
\(1) 显然;
(2),(3) 见 HW 11. 其实它们基本相同.
($arrow.r.double.long$): if $0 in.not I$ then $F in B V\(I\)$. 是简单的, we differentiate $F\(x\)= x sin\(1\/x\)$ for $x eq.not 0$:
$ F'\(x\)= frac(d, d x) (x dot.op sin (1 / x)) = sin (1 / x) + x dot.op cos (1 / x) dot.op (- 1 / x^2) = sin (1 / x) - 1 / x cos (1 / x) $
在不含 $0$ 的区间上, 它是 bounded 的. 于是 by lemma 得证. \ ($arrow.l.double.long$): if $F in B V\(I\)$ then $0 in.not I$. This is equiv to: if $0 in I$ then $F in.not B V\(I\)$. \ Suppose $0 in I =\[a\,b\]$ then $a lt.eq 0$ and $b gt.eq 0$, one of which is strict. WLOG we suppose $b > 0$. \ 我们的 idea 是 harmonic series. 考虑
$ y_n := frac(1, n pi + pi\/2) arrow.r 0^(+) $
we have:
$ F (y_n) = y_n sin (1 / y_n) = frac(1, n pi + pi\/2) dot.op sin\(n pi + pi\/2\) $For odd $n$, $F\(y_n\)= frac(- 1, n pi + pi\/2)$, for even $n$, $F\(y_n\)= frac(1, n pi + pi\/2)$. Since $b > 0$, for some $N_0$ we have $y_(N_0) < b$. Then we consider the partition: pick $N in bb(N)$, and use $x_0 = 0\,x_1 = y_(N_0 + N - 1)\,x_2 = y_(N_0 + N - 2)\,dots.h.c\,x_N = y_(N_0)\,x_(N + 1) = b$ as the partition points of $\[0\,b\]$. \ Then we have $ sum_(n = 1)^(N + 1)\|F\(x_n\)- F\(x_(n - 1)\)\|gt.eq sum_(n = N_0)^(N_0 - 2 + N) frac(1, pi n + pi\/2) + frac(1, pi\(n + 1\)+ pi\/2) gt.eq 2 sum_(n = N_0)^(N_0 - 2 + N) frac(1, pi n + pi\/2) $
As $N arrow.r oo$, this sum $sum_(n = 1)^(N + 2)\|F\(x_j\)- F\(x_(j - 1)\)\|arrow.r oo$, by the harmonic series.

]
=== Jordan decomposition for $f in B V$: $f = 1 / 2\(T_F + F\)- 1 / 2\(T_F - F\)$
<jordan-decomposition-for-fin-bv-f-frac12t_ff---frac12t_f-f>
#lemma(
)[
如果 real-valued $F in B V$, 那么 $T_F + F\,T_F - F$ 都是 increasing 的.

]
#remark[
$T_F + F$ 即: $F$ increasing 的地方加倍 increasing, $F$ decreasing 的地方 const; \ $T_F - F$ 即: $F$ decreasing 的地方反向加倍 increasing, $F$ increasing 的地方 const;

#figure(image("../assets/ch3-pics-Screenshot 2025-04-10 at 15.39.58.png", width: 50.0%),
  caption: [
  ]
)

]
#proof[
任取 $x < y$. \ Let $epsilon.alt > 0$. \ Can find $x_0 < x_1 < dots.h.c < x_N = x$, s.t. $ sum_1^N\|F\(x_j\)- F\(x_(j - 1)\)\|gt.eq T_F\(x\)- epsilon.alt $ 从而
$ T_F\(y\) & gt.eq sum_1^N\|F\(x_j\)- F\(x_(j - 1)\)\|+\|F\(y\)- F\(x\)\|\
 & gt.eq T_F\(x\)- epsilon.alt +\|F\(y\)- F\(x\)\| $
由于 $epsilon.alt > 0$ 任意, 可以得到: $ T_F\(y\)- T_F\(x\)gt.eq\|F\(y\)- F\(x\)\| $
因而: $ \(T_F\(y\)- F\(y\)\)-\(T_F\(x\)- F\(x\)\)gt.eq\|F\(y\)- F\(x\)\|-\(F\(y\)- F\(x\)\)gt.eq 0 $

]
#theorem(
  title: [#kn[Jordan decomposition for $F in B V$]],
)[
对于 $F : bb(R) arrow.r bb(R)$ (注意是 real-valued): $ F in B V arrow.l.r.double F upright(" 等于两个 bounded increasing functions 的差") $ Specially, $ F in B V arrow.l.r.double T_F plus.minus F upright(" bounded") $
因而 for $F in B V$, 我们总是可以把它写作 $ F = 1 / 2\(T_F + F\)- 1 / 2\(T_F - F\) $
where we call it as the #strong[Jordan decomposition] of $F in B V$. 其中, $1 / 2\(T_F + F\)$ 被称为 $F$ 的 #strong[positive variation]\; $1 / 2\(T_F - F\)$ 被称为 $F$ 的 #strong[negative variation].

]
#proof[
显然, $F in B V arrow.r.double.long F$ bdd, 因为$ \|F\(y\)- F\(x\)\|lt.eq T_F\(oo\)- T_F\(- oo\) $
For $F in B V$, we have $T_F\(oo\)< oo\,#h(0em) T_F\(- oo\)= 0$. \ 又 $F in B V arrow.r.double.long T_F$ bdd by def, 我们得到: $ F in B V arrow.r.double.long T_F plus.minus F upright(" bounded") $而反向 trivial (bounded function 的差仍然 bounded).

]
#remark[
我们可以通过 $F$ 和 $0$ 的 min, max 取到它的正负部分, 把它按正负部分分解成 $ F = F^(+) - F^(-) $
而这里, Jordan decomposition 则是按照它正负方向上的 variation 来分: $ F = 1 / 2\(T_F + F\)- 1 / 2\(T_F - F\) $
$F$ 的 #strong[positive variation], #strong[negative variation] 和 total variation 一样也是很形象.

#figure(image("../assets/ch3-pics-Screenshot 2025-04-19 at 02.30.17.png", width: 50.0%),
  caption: [
    positive/negative variation
  ]
)
#label("fig:positive/negative variation")

我们把 $ F_(+) : = 1 / 2 T_F + F\,quad F_(-) : = 1 / 2 T_F - F $
(这和正负部分的拆分的记号差别在正负号的上下.)

]
=== corollaries of Jordan decomposition
<corollaries-of-jordan-decomposition>
#corollary(
)[
Let $F in B V$. By Jordan decomposition, $F$ 等于两个 bounded increasing functions 的差.从而我们 #strong[by MDT 得]:

- $F\(x +\)\,F\(x -\)$ 存在 for all $x$\; $F\(plus.minus oo\)$ 也存在.

- $D_F = { x : F upright(" disctn at ") x }$ 是 at most ctbl 的.

- 定义 $G\(x\): = F\(x +\)$, 则 $F\,G$ 都 a.e. differentiable 且 $F' = G'$ $m$-a.e.

]
这里最重要的是: $ F in B V arrow.r.double.long F upright(" a.e. differentiable") $

==  $N B V #h(0em) & #h(0em) A C$ 空间, 以及其上的 FTC for Lebesgue integral \[Fol 3.5, finished\]
<nbv-ac-空间-以及其上的-ftc-for-lebesgue-integral-fol-3.5-finished>
=== $N B V$ 及其性质
<nbv-及其性质>
#definition(
  title: [#kn[NBV]],
)[
For $F : bb(R) arrow.r bb(C)$, 我们定义: $F in N B V$, if $F in B V$ 且 $F$ right ctn, $F\(- oo\)= 0$.

]
#remark[
这个要求中 $F\(- oo\)= 0$ 这一条并不要紧, 因为我们知道 for $F in B V$, $F\(- oo\)= c$ for some const $c$ 是一定的 (因为 $T_F\(- oo\)= 0$), 因而 right ctn 的 $F in B V$ 减去一个常数一定是 $N B V$ 的.
$F in N B V$ 的

]
#proposition(
)[
$N B V subset B V$ 是一个 linear subspace.

]
#remark[
我们容易发现$ F in B V arrow.l.r.double T_F in B V arrow.l.r.double F_(+)\,F_(-) in B V $
又因为, $T_F\(- oo\)= 0$ 对于 $F in B V$ 总是成立, 且我们知道 $F$ right ctn $arrow.r.double.long T_F$ right ctn; 于是: $ F in B V upright(" and right ctn") arrow.r.double.long T_F in N B V arrow.r.double.long F_(+)\,F_(-) in N B V $

]
我们已经知道:
$ { upright("positive regular Borel measures on ") bb(R) } tilde.eq { upright("distribution functions ") F : bb(R) arrow.r bb(R) } $
Notice: 这一点 is achieved by
$ F_mu\(x\):= {mu\(\(0\,x\]\)quad\,x gt.eq 0\
- mu\(\(x\,0\]\)#h(0em)\,x < 0 $
等同于: $ mu_F\(\(a\,b\]\)= F\(b\)- F\(a\) $注意: positive regular Borel measure 和 distribution functions 都有一个共同点: 它们在 bounded set 上是 bounded 的, 但是整体可以 unbounded. \ 而现在我们证明:

=== ${ upright("complex Borel measures on ") bb(R) } tilde.eq N B V$
<textcomplex-borel-measures-on-mathbbr-simeq-nbv>
注意: 一个 complex Borel measure 和一个 $F in N B V$ 都是 finite 的.

#theorem(
  title: [#kn[${ upright("complex Borel measures on ") bb(R) } tilde.eq N B V$]],
)[
+ 对于 $bb(R)$ 上的 complex measure $mu$, defining $ F\(x\): = mu\(\(- oo\,x\]\) $ 则有: $ F in N B V $

+ 对于 $F in N B V$, 一定存在某个 unique complex measure $mu_F$ on $bb(R)$, 使得 $ mu\(\(- oo\,x\]\)= F\(x\)quad forall x $

]
#proof[
\(1): 当 $mu$ 是 positive 的情况下, 是显然的. complex 的情况就是 re/im 部分分别叠加即可. \ (2): 同样, WLOG 我们可以假设 $F$ 是 real-valued 的. \ $F in N B V arrow.r.double.long F = F_(+) - F_(-)$, 这两个都是 bounded increasing functions 且 NBV, 从而存在两个 finite signed measure 满足: $ mu_plus.minus\(\(- oo\,x\]\)= F_plus.minus\(x\)- F_plus.minus\(- oo\) $ 再定义 $ mu : = mu_(+) - mu_(-) $ 即可

]
#remark[
这里其实和 positive regular measure 关联 distribution function 的 way:
$ F_mu\(x\):= {mu\(\(0\,x\]\)quad\,x gt.eq 0\
- mu\(\(x\,0\]\)#h(0em)\,x < 0 $
是等价的, 只不过#strong[差了一个常数 $mu\(\(- oo\,0\]\)$] 而已. \ 之所以我们这里可以直接定义 $ F\(x\): = mu\(\(- oo\,x\]\) $是因为, #strong[对于 complex measure (thus finite) 而言, 这个常数 $mu\(\(- oo\,0\]\)$ 一定是 finite 的. 但是对于 regular positive regular measure 而言, 这个常数可能是无穷] (且很可能). 因而对于 regular positive regular measure 我们采用这种迂回的定义方式来避开无穷值, 但是对于 complex measure 我们可以直接爽快地定义$ F\(x\): = mu\(\(- oo\,x\]\) $

]
#theorem(
  title: [#kn[$mu_F$ 的 total variation measure $=$ $mu_(T_F)$]],
)[
对于任意的 $F in N B V$, 我们有: $ \|mu_F\|= mu_(T_F) $ Specially when $F$ 是 real-valued 情况下, 那么 $mu_F$ 是一个 finite positive measure, 且有 $ mu_plus.minus = mu_(F_plus.minus) $

]
Now: Given $F in N B V$ with associated c.m. $mu_F$, 什么时候 $mu_F perp m$, 什么时候 $mu_F lt.double m$?

#theorem(
  title: [#kn[characterization of $mu_F perp m$ 和 $mu_F lt.double m$, for
$F in N B V$]],
)[
对于 $F in N B V$, 我们已经知道: $F'$ $m$-a.e. 存在, 且 $F' in L^1\(m\)$. \ Now we claim, 有: $ mu_F perp m arrow.l.r.double F' = 0 quad m upright("-a.e.") $以及 $ mu_F lt.double m arrow.l.r.double F\(x\)= integral_(- oo)^x F'\(t\)thin d t quad forall x $

]
#proof[
Let $x in bb(R)$. Applying LDT and LRNT, with $E_r : =\(x\,x + r\]$: $ lim_(r arrow.r 0) frac(mu_F\(E_r\), m\(E_r\)) = lim_(r arrow.r 0) frac(F\(x + r\)- F\(x\), r) = F' $
因而 $F'$ 就是这个 RN derivative. 对于 $ mu_F = lambda + rho $
where $lambda perp m\,rho lt.double m$, 我们有: $ F\(x\): = mu_F\(\(- oo\,x\]\)= lambda\(\(- oo\,x\]\)+ rho\(\(- oo\,x\]\) $
我们知道, $mu_F perp m arrow.l.r.double rho = 0$, 从而 by LDT meets LRNT, we know that $ F' = 0 thin thin a . e . $
而 $mu_F lt.double m arrow.l.r.double lambda = 0$, 从而直接 : $ F\(x\): = rho\(\(- oo\,x\]\)= F' d m\(\(- oo\,x\]\)= integral_(- oo)^x F'\(t\)thin d t $

]
=== $A C$ 及其性质
<ac-及其性质>
#definition(
  title: [#kn[absolutely continuous function]],
)[
我们定义 $F : bb(R) arrow.r bb(C)$ 是 absolutely ctn 的, if 对于任意 $epsilon.alt > 0$ 都存在 $delta > 0$ 使得对于任意的 disjoint intervals $\(a_1\,b_1\)\,dots.h.c\,\(a_N\,b_N\)$, 都有: $ sum_1^N\|F\(b_j\)- F\(a_j\)\|< epsilon.alt quad upright("whenever") quad sum_1^N\|b_j - a_j\|< delta $

]
#remark[
absolutely continuous 是比 uniformly continuous 严格更强的条件: 我们只考虑 $N = 1$ 而非任意正整数时这个 def 就 reduce 为 uniform ctn. \ absolutely continuous 表示了一种更强的控制性: 选取任意一些地方的变化足够小的 $x$, 其引发的 $y$ 的变化一定可控. ($y$ 的变化的可控性完全由 $x$ 的变化量决定, 不由 $x$ 的位置决定) \ 这一看就和 measure 有关系.

]
#definition(
  title: [#kn[absolutely continuous function on a cpt interval]],
)[
我们定义 $F : I arrow.r bb(C)$ 是 absolutely ctn 的, if 对于任意 $epsilon.alt > 0$ 都存在 $delta > 0$ 使得对于任意的 disjoint intervals $\(a_1\,b_1\)\,dots.h.c\,\(a_N\,b_N\)subset I$, 都有: $ sum_1^N\|F\(b_j\)- F\(a_j\)\|< epsilon.alt quad upright("whenever") quad sum_1^N\|b_j - a_j\|< delta $

]
#lemma(
  title: [#kn[$F in N B V$ abs ctn $arrow.l.r.double$ $mu_F lt.double m$]],
)[
对于 $F in N B V$, $ F in A C arrow.l.r.double mu_F lt.double m $

]
#proof[
我们 recall, abs ctn 除了 \"$m$ 的 nullsets 也一定是 $mu_F$ 的 null sets\" 之外, 还有另一个 characterization: $mu_F lt.double m$ 当且仅当对于任意 $epsilon.alt > 0$ 都存在 $delta > 0$ 使得 $m\(E\)< delta arrow.r.double.long\|mu_F\(E\)\|< epsilon.alt$. \ 显然, 这个 characterization 和这里的命题有关. 我们发现, $mu_F lt.double m arrow.r.double.long F in A C$ 直接 naturally follows from 这个 form. Let $epsilon.alt > 0$, 存在 $delta$ 使得 $m\(E\)< delta arrow.r.double.long\|mu_F\(E\)\|< epsilon.alt$. 那么考虑 $E = union.sq.big_1^N\(a_j\,b_j\)$ with $m\(E\)< delta$, 直接有$ \|mu_F\(E\)\|= sum_1^N\|F\(b_j\)- F\(a_j\)\|< epsilon.alt $
从而得证. \ 而反向, 我们考虑 $m\(E\)= 0$, 并利用 outer regularity 取一个逼近它的 open set (每个是 union of finite disjoint open intervals) seq, 逼近 $E$, with $m\(U_1\)< delta$. 由 $F in A C$ 可以得到 $ mu_F\(U_j\)lt.eq mu_F\(U_1\)< epsilon.alt $ for all $j$, 从而 $mu_F\(E\)lt.eq epsilon.alt$. 从而得证, since $epsilon.alt$ arbitrary.

]
=== FTC for Lebesgue integral on $bb(R)$: requires $N B V + A C$
<ftc-for-lebesgue-integral-on-mathbbr-requires-nbv-ac>
#corollary(
)[
如果 $f in L^1\(m\)$, 那么 $ F\(x\): = integral_(- oo)^x f\(t\)thin d t in N B V inter A C\,quad f = F' quad a . e . $
Conversely, 如果 $F in N B V inter A C$, 那么 $ F' in L^1\(m\)\,quad F\(x\)= integral_(- oo)^x F'\(t\)thin d t $

]
#remark[
forward 方向即: $f in L^1\(m\)$ 则它的累积函数 $integral_(- oo)^x f\(t\)thin d t$ 具有良好的连续性和变差有界性, 从而满足 FTC: a.e. 有 $ frac(d, d x) \( F\(x\):= integral_(- oo)^x f\(t\)thin d t \) = f\(x\) $
并且 for $F\(x\): = integral_(- oo)^x f\(t\)thin d t$, 这个函数是 $N B V inter A C$ 的. 这可以推出: $ F\(x\)- F\(y\)= integral_y^x f\(t\)thin d t $

backward 方向即: 如果 $F$ 具有良好的连续性和变差有界性, 那么它的导数满足: $ F\(x\)= integral_(- oo)^x F'\(t\)thin d t $
简而言之: #strong[FTC-I for Lebesgue integral 在整个 $bb(R)$ 上都成立当且仅当 $F in N B V inter A C$.]

]
=== FTC for Lebesgue integral on a cpt interval: 只需要 $A C$
<ftc-for-lebesgue-integral-on-a-cpt-interval-只需要-ac>
比起刚才的 FTC-I, FTC-II 的条件要宽松很多, 只需要 $F$ 在它需要被用到的 compact interval 上 AC 即可以. 这是因为, 我们不需要用到 NBV 只需要 BV, 并且在 cpt interval 上, AC 本身就可以推出 BV.

#lemma(
)[
如果 $F in A C\(\[a\,b\]\)$, 那么 $F in B V\(\[a\,b\]\)$. \ 即 $ A C\(\[a\,b\]\)subset B V\(\[a\,b\]\) $

]
#proof[
这是显然的. 我们看到 $F in A C\(\[a\,b\]\)$ 的定义: on $\[a\,b\]$ we have: $ sum_1^N\|F\(b_j\)- F\(a_j\)\|< epsilon.alt quad upright("whenever") quad sum_1^N\|b_j - a_j\|< delta $
我们不妨考虑 $epsilon.alt = 1$, 然后可以划分 $\[a\,b\]$ into 一个个总长度为 $delta / 2$ 的由 disjoint intervals 构成的块 (补空缺没事), 从而 Bound 住这个划分上的 variation by parition $sum_1^(N_0)\|F\(b_j\)- F\(a_j\)\|$. 而我们发现: 这个时候我们不论怎么 fine 这个划分, 每个块的总长度总归是不变的, 从而仍然可以使用原先的 bound. \ 我们 recall: for total variation, partition 的选取是 greddy 的. 从而这就足以得证.

]
#remark[
这里没有仔细证明, 但是理解这个 idea 即可. 这表现了 locally, $A C$ 是一个比 $B V$ 更强的条件, 因为 total variation 就是 sup of variations over 所有划分, 而 #strong[$A C$ 的定义正好就是: 无视划分的方法, 只要这个集合的总长度小于 $delta$, 它上面的 variation by partition 就要小于 $epsilon.alt$.]

]
#theorem(
  title: [#kn[FTC-II for Lebesgue integral on a cpt interval]],
)[
TFAE:

- $F in A C\[a\,b\]$

- $F$ 是 diffble a.e. on $\[a\,b\]$ 的, 且 $F' in L^1\(\[a\,b\]\,m\)$, 且 $ F\(x\)- F\(a\)= integral_a^x F'\(t\)thin d t $#strong[for all $x in\[a\,b\]$].

]
#proof[
首先, $F in A C\[a\,b\]arrow.r.double.long F in B V\[a\,b\]arrow.r.double.long F$ diffble a.e. on $\[a\,b\]$. \ Notice that: 这里我们只考虑 $F\|_(\[a\,b\])$, 于是我们可以将其他部分的值都设为 smooth 的, 并 normalize it: 把 $F\(x\):= 0$ for $x < a$, $F\(x\): = b$ for $x > b$. \ 又 $F in A C arrow.r.double.long F$ right ctn for sure, 我们 then have: $F in N B V$, 从而

]
=== characterization for Lipschitz ctn
<characterization-for-lipschitz-ctn>
#theorem(
  title: [#kn[characterization for Lipschitz ctn]],
)[
对于 $F : bb(R) arrow.r bb(C)$, we have: $ F upright(" Lipschitz ctn with const ") M arrow.l.r.double F in A C upright(" and ")\|F'\(x\)\|lt.eq M upright(" a.e.") $

]
#proof[
见 HW 12.

]
从而我们得到: ctnity 条件的递推关系: $ upright(" Lipschitz ctn ") arrow.r.double.long upright(" abs ctn ") arrow.r.double.long upright(" uniformly ctn ") arrow.r.double.long upright(" ctn ") $
关于连续函数的可导性: Lipschitz ctn 可以推得 a.e. diffble $+$ bounded derivative; abs ctn 可以推得 a.e. diffble 且在 cpt interval 上 derivative $L^1$\; 而往后的 uniform ctn 则不蕴含可导性条件.

而关于和可导性紧密相关的变差性质:
abs ctn 在 bounded interval 上是比 BV, NBV 更强的条件, 而在 $bb(R)$ 上则并不是.

在 $bb(R)$ 上, NBV + AC 的函数可运用 FTC. 而在 bounded area 上 AC 的函数就可以运用 FTC.
