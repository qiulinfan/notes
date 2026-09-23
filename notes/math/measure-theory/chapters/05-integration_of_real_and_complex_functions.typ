#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= integration of real and complex functions
<integration-of-real-and-complex-functions>
== integration of real and complex functions-I \[Fol 2.3\]
<integration-of-real-and-complex-functions-i-fol-2.3>
我们目前只定义了 non-negative $accent(bb(R), macron)$-valued measurable function 的积分, 而我们想要完整地定义: $accent(bb(R), macron)$-valued measurable function 的积分 $integral f in accent(bb(R), macron)$, 以及 $bb(C)$-valued measurable function 的积分 $integral f in bb(C)$.

recall: 对于任意 $accent(bb(R), macron)$-valued $f$, $ f = f^(+) - f^(-) $

#strong[因而我们希望 define:]$ integral f = integral f^(+) - integral f^(-) $
但是其中有一个 undefined 的问题: 我们要避免 $oo - oo$ 这一类的问题. 因而我们无法对所有的可测函数进行积分, 而是定义 \"integrable\" 的可测函数.

#lemma(
)[
$ {integral f^(+) < oo\
integral f^(-) < oo arrow.l.r.double integral\|f\|< oo $

]
#proof[
trivial.

]
正负部分都可控, 肯定是当且仅当绝对值函数可控.

我们接下来将定义可积函数的空间是: 所有绝对值积分非无穷的函数. (怎么和预期不一样...这样的话这个空间在积分运算下的值域就是 $bb(R)$ 而不是 $accent(bb(R), macron)$ 了. 我期待的是为了避免无穷之间相减的 undefined behavior 只需要正负部分有一个积分非无穷就行了. 但是我们要求的是都不是无穷. 不过既然这么定义了肯定有其道理.)

=== $tilde(L)\(X\,mu\,bb(C)\)$ and $L^1\(X\,mu\,bb(C)$)
<tildelx-mu-mathbbc-and-l1x-mu-mathbbc>
#definition(
  title: [#kn[real-valued integrable function]],
)[
Given measure space $\(X\,cal(M)\,mu\)$, #strong[measurable $f : X arrow.r accent(bb(R), macron)$ 被称为 integrable] 的, 如果它满足 $ integral\|f\|< oo $ 并定义其 integral 为: $ integral f = integral f^(+) - integral f^(-) $

]
#definition(
  title: [#kn[complex-valued integrable function]],
)[
Further, 我们定义 #strong[measurable $f : X arrow.r bb(C)$ 是 integrable 的], 如果它同样满足: $ integral\|f\|< oo $
#strong[注意到这个条件等价于 $"Re" f\,"Im" f$ integrable, 因为]
$ \|f\|lt.eq\|"Re" f\|+\|"Im" f\|lt.eq 2\|f\| $
我们定义其 integral 为: $ integral f = integral "Re" f + i integral "Im" f $

]
#remark[
所以说, #strong[实值函数的积分要计算两个, 复值函数的积分要计算四个]. (好麻烦.)

]
#proposition(
)[
所有的 real-valued integrable functions 构成一个 $bb(R)$-vector space, 并且 integral 是一个 linear functional on it.

所有的 complex-valued integrable functions 构成一个 $bb(C)$-vector space, 并且 integral 是一个 linear functional on it.

]
#proof[
trivial.

]
下面我们可以定义这个 vector space 并在上面进行一定研究. 此处为一个 temporary 的记号:

#definition(
  title: [#kn[$tilde(L)\(X\,mu\,bb(R)\)$ 以及$tilde(L)\(X\,mu\,bb(C)\)$ space]],
)[
给定 measure space $\(X\,cal(M)\,mu\)$
我们定义 $ tilde(L)\(X\,mu\,bb(R)\):= { upright("all (extended) real-valued integrable functions on ") X } $ 以及 $ tilde(L)\(X\,mu\,bb(C)\):= { upright("all complex-valued integrable functions on ") X } $

]
#remark[
这基本接近我们最终的可积空间的定义了. 只需要再 quotient 掉所有的 a.e. 相等的函数就可以. 在此之间, 我们首先在这临时的空间上证明一些结论.

#strong[我们基本不使用 $tilde(L)\(X\,mu\,bb(R)\)$, 因为它是 $tilde(L)\(X\,mu\,bb(C)\)$ 的 subspace, 而且大部分结论基本都在更 general 的 $tilde(L)\(X\,mu\,bb(C)\)$ 上成立.]

]
#remark[
这个 $bb(C)$-vector space 的 dimension 是多少呢: \ 如果 $X$ 是一个 finite set, 那么 $tilde(L)\(X\,mu\,bb(C)\)$ 的 dimension 是 $\|X\|$, 因为 $e_i : x_j mapsto delta_(i j)$ 是一个 basis; 同样的, 如果 $X$ countable, 那么 $tilde(L)\(X\,mu\,bb(C)\)$ 的 dimension 也是 countably infinite 的; 如果 $X$ uncountable, 那么 $tilde(L)\(X\,mu\,bb(C)\)$ 的 dimension 也是 uncountable 的. \ 比如, $tilde(L)\(bb(R)^n\,mu\,bb(C)\)$ 的 dimension 就是 uncountable 的.

]
#proposition(
)[
$tilde(L)\(X\,mu\,bb(C)\)$ 上, $f mapsto integral f$ 为一个 linear functional.

]
因为积分是 linear 的, as we have proved.

#proposition(
)[
$ f in tilde(L)\(X\,mu\,bb(C)\)arrow.r.double.long\|integral f\|lt.eq integral\|f\| $

]
#proof[
For real-valued case, $ \| integral f \| = \| integral f^(+) - integral f^(-) \| lt.eq \| integral f^(+) \| + \| integral f^(-) \| = integral f^(+) + integral f^(-) = integral\|f\| $
For complex-valued case,
Set $ alpha = frac(integral f, \|integral f\|) $
于是有 $alpha in bb(C)$ 且 $\|alpha\|= 1$. #strong[Note: 一个绝对值为 1 的 complex number 的倒数是它的 conjuate.] \ 因而:
$ \| integral f \| = accent(alpha, macron) integral f = integral accent(alpha, macron) f in bb(R) $
从而 $ \| integral f \| = integral accent(alpha, macron) f = integral "Re"\(accent(alpha, macron) f\)lt.eq integral\|"Re"\(accent(alpha, macron) f\)\|lt.eq integral\|accent(alpha, macron) f\|= integral\|f\| $

]
#definition(
  title: [#kn[integral restricted to a measurable set]],
)[
if $f in tilde(L)\(X\,mu\,bb(C)\)$, $E in cal(A)$ ($mu$ 的 $sigma$-algebra), 我们 define: $ integral_E f thin d mu := integral f chi_E thin d mu $

]
#remark[
容易验证, restricted to a measurable set 的积分也是 linear 且 monotone 的.

]
#proposition(
  title: [可积函数几乎处处相等的等价条件],
)[
if $f\,g in tilde(L)\(X\,mu\,bb(C)\)$, 则 TFAE:

- $f = g$ a.e.

- $integral\|f - g\|= 0$

- $integral_E f = integral_E g$ for all $E in cal(A)$

]
#proof[
$\(i\)arrow.l.r.double\(i i\)$: by last time proposition. \ $\(i i\)arrow.r.double.long\(i i i\)$: 因为 $ \| integral_E f - integral_E g \| = \| integral\(f - g_(\)) chi_E \| lt.eq integral\|f - g\|chi_E lt.eq integral\|f - g\|= 0 $
$\(i i i\)arrow.r.double.long\(i i\)$: 令 $u := Re\(f - g\)$, $v := Im\(f - g\)$, 则 $ integral\|f - g\|= integral u^(+) + integral u^(-) + i integral v^(+) + i integral v^(-) $
#strong[这四个积分都是正值.] 容易发现如果 $u^(+)$ 在一个 positive measure set $E$ 上非 0, 那么 $integral_E u^(+) > 0$ , 那么 $integral\|f - g\|> 0$. (其他三个积分同理.)

]
#remark[
$integral\|f - g\|= 0$ 是一个比 $integral f - g = 0$ 更强的条件. $integral f - g = 0$ 可以是非零集有交错并且正负抵消, 而 $integral\|f - g\|= 0$ 则表示 a.e. 相等.

]
#remark[
有这个定理得: #strong[我们可以 integrate $f : X arrow.r bb(C)$ a.e. defined]. \ 即: $ f : E^c arrow.r bb(C) quad\,quad mu\(E\)= 0 $
其中的一种情况是: $ f : X arrow.r accent(bb(R), macron) quad s . t . quad\|f\|< oo #h(0em) #h(0em) med a . e . $

]
并且我们发现, a.e. 相等的两个可积函数 $f\,g in tilde(L)\(X\,mu\,bb(C)\)$ 在任意可测集上的积分都相等. 于是这两个函数在 $tilde(L)\(X\,mu\,bb(C)\)$ 中的表现是相等的. 因而我们可以把 a.e. 相等的这种关系 quotient 掉, 简化这个空间:

#definition(
  title: [#kn[$L^1\(mu\)$ space]],
)[
我们定义 $L^1\(X\,mu\,bb(C)\)$, 或简称为 $L^1\(mu\)$, 为:$ tilde(L)\(X\,mu\,bb(C)\)\/tilde.op $
其中 $tilde.op$ 表示一个 equivalent class: $f tilde.op g$ if $f = g$ a.e. (等价于 $integral\|f - g\|= 0$)

]
$L^1\(mu\)$ 中的每个函数之间彼此至少都在一个正测度集上相互不同. 这减去了分析上考虑几乎处处相等的集合的顾虑, 对于处处相等的函数, 我们认为它们在 $L^1\(mu\)$ 上直接相等. 并且, 我们有: $ f mapsto integral f $
在 $L^1\(mu\)$ 上是一个 well-defined function.

=== DCT
<dct>
#lemma(
)[
令 $\(f_n\)$ 为 a seq of #strong[a.e. defined measurable functions] on $X$\., s.t. $ f\(x\):= lim_(n arrow.r oo) f_n\(x\) $ #strong[exists a.e.] \ Claim: #strong[$f$ is measurable.]

]
#remark[
Measurability is well preserved by taking limit, 并且更改一个零测集上函数的 definedness 不会改变这个 behavior. (这是一个很宽的条件了)

]
#theorem(
  title: [#kn[dominated convergence theorem]],
)[
Let $\(f_n\)$ be a seq of functions in $L^1\(mu\)$, s.t.

- $f_n arrow.r f$ a.e.

- 存在 $g in L^1\(mu\)$ s.t. $\|f_n\|lt.eq g$ a.e. for all $n$.

Claim: $f in L^1\(mu\)$ 并且 $ integral f = lim_n integral f_n $

]
#proof[
首先由于 $f_n arrow.r f$ a.e., by lemma 可以得到 $f$ 是 measurable 的. \ 并且 $ \|f_n\|lt.eq\|g\|upright(" a.e. ") arrow.r.double.long\|f\|lt.eq\|g\|upright(" a.e.") $ 于是 $ integral\|f\|lt.eq integral\|g\|< oo $ 即 $f in L^1$. (从而 $\|f\|$ 至多在一个 measure zero set 上无穷). \ 并且 $g\(x\)plus.minus f_n\(x\)gt.eq 0$ a.e. 这一点很重要, 因为从而我们可以对 $g + f_n$, $g - f_n$ 使用 #ref[fatou-lemma]:
$ integral g + integral f = integral\(g + f\) & = integral\(g + lim_(n arrow.r oo) f_n\)\
 & = integral lim_(n arrow.r oo)\(g + f_n\)\
 & lt.eq^(upright("by Fatou")) liminf_n integral\(g + f_n\)\
 & = integral g + liminf_n integral f_n $从而 (由于 $integral g < oo$)$ integral f lt.eq liminf_n integral f_n $
以及 similarly get: $ integral g - integral f lt.eq^(upright("by Fatou")) liminf_n integral\(g - f_n\)= integral g - limsup_n integral f_n $
从而: $ integral f gt.eq limsup_n integral f_n $
(这里注意, negate 一个 numerical seq 后 liminf 变 limsup. 由此可见 Fatou'e Lemma 其实是很强大的, 只需要对 $integral g + integral f$ 和 $integral g - integral f$ 各用一次就可以得到: )$ integral f = lim_(n arrow.r oo) integral f_n $

]
#remark[
DCT 是 MCT 在 $L^1$ 上的推广. MCT 只作用于非负的可测函数, 并且要求序列递增. 而 DCT 则作用于更加广泛的情况. \ DCT 增加的要求是存在一个 $L^1$ 的 (a.e.) bound function, 以及极限 a.e. 存在于 extened $bb(R)$. 这两个要求都是合理的, 一个控制了函数的上下浮动程度, 一个控制了序列的收敛性. \ 而进一步, 我们可以把 \"存在 $g in L^1$ s.t. $\|f_n\|lt.eq\|g\|$ a.e. for all $n$\.\" 这一 条件放宽到 : 存在一个 seq $\(g_n\)$ 以及 $g$ in $L^1$, 使得

- $\|f_n\|lt.eq g_n$

- $g_n arrow.r g$ a.e.

- $integral g_n arrow.r integral g$

Proof 在 hw 5.

]
#example(
)[
Suppose $u :\[0\,1\]arrow.r\[0\,1\]$ is Lebesgue measurable. \ 考虑这一 seq of function: $\(u^n\)$. \ 容易发现 $u^n arrow.r chi_({ u = 1 })$ p.w.
我们可以用 $g = 1$ 作为 bound function. 从而得到: $ integral f = lim_(n arrow.r oo) integral f_n = integral_({ u = 1 }) 1 = m\({ mu = 1 }\) $

]
#example(
)[
compute $ I = lim_(n arrow.r oo) integral_(\[0\,1\]) frac(1 + n x^2, \(1 + x^2\)^n) $
令 $f_n\(x\): = frac(1 + n x^2, \(1 + x^2\)^n)$, 有: $f_n\(x\)arrow.r 0$ as $n arrow.r oo$ for $x in\(0\,1\]$\; \ 并且考虑 $g = 1$, 作为 bound. \ 因而有 $I = 0$

]
== integration of real and complex functions-II \[Fol 2.3\]
<integration-of-real-and-complex-functions-ii-fol-2.3>
=== corollaries of DCT
<corollaries-of-dct>
以下为 DCT 的 corollaries:

=== Fubini for series and integral
<fubini-for-series-and-integral>
#corollary(
  title: [#kn[Fubini for series and integral]],
)[
对于 $L^1\(mu\)$ 中的 sequence $\(f_n\)$, 如果 $sum_(n = 1)^oo integral\|f_n\|< oo$, 则 $ sum_(n = 1)^oo f_n arrow.r^(a . e .) F in L^1\(mu\)#h(0em) #h(0em) $ 并且 $ integral sum_(n = 1)^oo f_n = integral F = sum_(n = 1)^oo integral f_n $

]
#proof[
Recall #strong[Tonelli for sum and integrals]: 对于 ${ f_n }_(n in bb(N))$ in $L^(+)\(mu\)$, 有:
$ integral sum_(n = 1)^oo f_n = sum_(n = 1)^oo integral f_n $
(又是经典 Fubini 补充 Tonelli) 这个定理是 Tonelli for sum and integrals 在 $L^1$ 上的推广. \ 我们 set $ F_n : = sum_(i = 1)^n f_j quad G := sum_(n = 1)^oo\|f_n\| $
By Tonelli for sum and integrals, 有: $ integral G = integral sum_(n = 1)^oo\|f_n\|= sum_(n = 1)^oo integral\|f_n\| $
由条件知道, $integral G < oo$, 因而 $G in L^1\(mu\)$.
所以 $G$ 可以作为 $F_n$ 的 DCT bound: $ integral\|F\|lt.eq integral G = sum_(n = 1)^oo integral\|f_n\| $ 因而 by DCT:: $ integral F = lim_(n arrow.r oo) sum_(i = 1)^n integral f_i = sum_(n = 1)^oo integral f_n $

]
#remark[
Fubini's for sum and integrals : 对于一个 seq of 可积函数, #strong[如果它们的绝对积分和收敛, 那么它们的 infinite sum 函数也是可积的], 并且可以交换积分和极限次序. \ 其实显然. 因为绝对积分和肯定 by tri ineq 是大于等于和的积分的, 绝对积分和能作为一个 bound function.

]
=== a function that is measurable in one var and ctn/diffble in another
<a-function-that-is-measurable-in-one-var-and-ctndiffble-in-another>
#corollary(
)[
令 $\(X\,cal(A)\,mu\)$ be a measure space. \ 如果 $f : X times\[a\,b\]arrow.r bb(C)$ 满足 $f\(dot.op\,t\)in L^1\(mu\)$ for all $t in\[a\,b\]$, 令 $ F\(t\):= integral f\(x\,t\)#h(0em) d mu\(x\) $ 则有:

+ 如果 $t mapsto f\(x\,t\)$ 对于任意 $x$ 都连续, 并且存在一个 $g in L^1\(mu\)$ 使得 $\|f\(t\,x\)\|lt.eq g\(x\)$ for all $t\,x$, 那么 #strong[$F$ 也是 ctn 的.]

+ 如果 $frac(partial f, partial t)\(x\,t\)$ 对于任意 $x\,t$ 都存在, 并且存在一个 $g in L^1\(mu\)$ 使得 $\|frac(partial f, partial t)\(x\,t\)\|lt.eq g\(x\)$ for all $t\,x$, 那么 #strong[$F$ 是 differentiable 的], 并且 $ F'\(t\)= integral frac(partial f, partial t)\(x\,t\)#h(0em) d mu\(x\) $

]
#proof[
这一证明并不困难. \ For part(1), STS: $t_n arrow.r t arrow.r.double.long F\(t_n\)arrow.r F\(t\)$ \ Apply DCT with $f_n\(x\)= f\(x\,t_n\)$, $f\(x\)= f\(x\,t\)$. \ For part(2), Suppose $t_n arrow.r t$. \ Apply DCT to $ h_n\(x\):= frac(f\(x\,t_n\)- f\(x\,t\), t_n - t) $
由可导得连续得 $x mapsto frac(partial f, partial t)\(x\,t\)$ measurable. \ 并且 #strong[by MVT,] $ \|h_n\(x\)\|lt.eq sup_(t in\[a\,b\]) \| frac(partial f, partial t)\(x\,t\)\| lt.eq g\(x\) $
从而我们也用 $g$ bound 住了 $h_n\(x\)$. #strong[Apply DCT:] $ F'\(t\)= lim_(n arrow.r oo) frac(F\(t_n\)- F\(t\), t_n - t) = lim_(n arrow.r oo) integral frac(f\(x\,t_n\)- f\(x\,t\), t_n - t) = lim_(n arrow.r oo) integral h_n = integral frac(partial f, partial t)\(x\,t\)#h(0em) d mu\(x\) $

]
#remark[
由 DCT, 我们不仅可以交换积分和求极限的次序, 还可以在足够的条件下交换多变量的求导和积分的次序. 这一点是值得注意的, 因为 #strong[DCT 描述的 sequential behavior 可以应用到证明函数 continuous 和 derivative 存在], 使用 sequential definition. \ 如: 如果一个多变量函数对于 $x$ 是 measurable 的, 并且满足对于 $t$ 的 partial derivative 处处符合 DCT 条件. 那么我们可以#strong[调换它对于 $x$ 积分和对于 $t$ 求导的顺序]. \ 看起来很雾但是我们看一个例子 (此为一个反例):

]
#example(
)[
是否有: $ frac(partial, partial t) integral_(bb(R)_(> 0)) e^(- t x) #h(0em) d m\(x\)=^(? ? ?) integral_(bb(R)_(> 0)) - x e^(- t x) #h(0em) d m\(x\)= - 1 / t^2 $
Here $ f\(t\,x\)= e^(- t x)\,quad t > 0\,x > 0 $ 因而 $ \| frac(partial, partial t) f\(t\,x\)\| = x e^(- t x)\,quad t > 0\,x > 0 $
尝试找到它的 dominating $g\(x\)$: 这个函数在 $t arrow.r 0$ 处的上极限是 $g\(x\,t\)= x$, 但是这个 $g$ 却不是一个 $L^1$ 函数 (在半轴上积分为 $oo$). 从而它不可以这么交换积分和求导顺序. 但是如果把 $t$ 的范围限制在 $t gt.eq a in bb(R)_(+)$ 而不是 $t > 0$, 我们就可以交换这个积分和求导顺序, 因为此时可以设定 $ g\(x\,t\)= x e^(- a x) $

]
=== $L^1$ as a Banach space
<l1-as-a-banach-space>
#theorem(
  title: [#kn[$L^1\(mu\)$ 以 integral w.r.t. $mu$ 作为 norm 是一个 normed VS]],
)[
在 $L^1\(mu\)$ 上, 我们 set $ \|\|f\|\|:= integral\|f\| $
则 $\(L^1\(mu\)\,\|\|dot.op\|\|\)$ 为一个 #strong[normed $bb(C)$-vector space. 即, 这是一个 well-defined norm.]

]
#proof[
recall norm 的定义, 需要符合:

- Homogeneity: $ \|\|a f\|\|=\|a\|dot.op\|\|f\|\| $

- triangle ineq: $ \|\|f + g\|\|lt.eq\|\|f\|\|+\|\|g\|\| $

- nonnegativity: $ \|\|f\|\|gt.eq 0\,quad = upright(" iff ") f = 0 in L^1 upright(" (i.e. ") f\(x\)= 0 upright(" a.e.)") $

前两条是积分的 linearity 的下位推论. 后一条 by def.

]
#corollary(
  title: [#kn[$\(L^1\(mu\)\,\|\|dot.op\|\|\)$ 是一个 Banach space]],
)[
$\(L^1\(mu\)\,\|\|dot.op\|\|\)$ 的 induced metric space 是 complete 的. 即, every Cauchy seq converges. \ (#strong[从而这是一个 Banach space]. )

]
#proof[
取一个 Cauchy seq $\(f_n\)$ in $L^1$. \ 这里有一个值得 recall 的 proposition:

#proposition(
)[
在一个 metric space 中, 一个 Cauchy seq converges 当且仅当它存在一个 convergent 的 subsequence.

]
证明很简单. 对于任意的 $epsilon.alt$, 可以取 $max\(N\,M\)$, 其中 N 为使得这个子序列所有元素距离 $x_(*) < epsilon.alt\/2$ 的下标，M 为使得主序列所有元素两两之间距离 $< epsilon.alt\/2$ 的下标. \ 因而我们#strong[只需要证明存在一个 subseq $\(f_(n_j)\)$ s.t. $f_(n_j) arrow.r^(j arrow.r oo) f in L^1$ 即可.] \ 已知 Cauchy, WTS: $f_n$ 收敛且极限在 $L^1$ 中. 我们直觉: 用 Cachy 条件构造 $1\/epsilon.alt^2$ argument. \ 我们 pick 子下标 $\(n_j\)_(j in bb(N))$ 使得对于每个 $j$ 都有 $ m\,n gt.eq n_j arrow.r.double.long\|\|f_m - f_n\|\|_1 lt.eq 1 / 2^j $
并 set $ g_j := f_(n_j) - f_(n_(j - 1))\,quad g_1 = f_(n_1) $则有 $ sum_(j = 1)^oo integral\|g_j\|lt.eq 1 < oo $
从而 #strong[by Fubini's Thm for series and seqs,] 存在:
$ f : = lim_(j arrow.r oo) sum_(i = 1)^j g_j = lim_(j arrow.r oo) f_(n_j) in L^1 #h(0em) #h(0em) exists a . e . $
同时有 $ integral\|f - f_(n_j)\|lt.eq sum_(j + 1)^oo integral\|g_j\|lt.eq 1 / 2^j arrow.r^(j arrow.r oo) 0 $

]
#remark[
这里就发现了 Fubini for series and seq 的用处: 把求和与积分的换序从有限推广到无限求和上, 以绝对积分和有限为条件. 因而, #strong[绝对积分和有限的 seq 是性质强大的.] \ 而我们可以运用这一点来发掘 function seq 的性质, 比如这里#strong[把一个 function seq 通过构造前后项差的方式, induce 出一个绝对积分和有限的 seq, 从而用这个 seq 的积分和反向证明原 seq 的性质].

]
=== density of simple function of $L^1\(mu\)$
<density-of-simple-function-of-l1mu>
#theorem(
  title: [#kn[density of simple functions in $L^1\(mu\)$]],
)[
令 $\(X\,cal(A)\,mu\)$ 为一个 measure space, 令 $f in L^1\(mu\)$, \ 对于任意 $epsilon.alt > 0$, 都存在 simple $phi.alt : X arrow.r bb(C)$ in $L^1\(mu\)$, 使得 $ integral\|f - phi.alt\|< epsilon.alt $

]
#proof[
这是显然的, by 积分的定义. 我么首先把 $f$ divide 为 $ f = u + i v\,quad u = u^(+) - u^(-)\,quad v = v^(+) - v^(-) $
而后对这四个非负函数 $u^(+)\,u^(-)\,v^(+)\,v^(-)$分别使用 simple function seq approximation, 再使用 DCT:
$ integral lim phi.alt_n = integral u^(+) = lim integral phi.alt_n $
比方说 $\(phi.alt_n\)$ 为从下逼近 $u^(+)$ 的 simple function seq, 那么 $u^(+)$ 是它的 dominating function, 同时也是极限. 那么对于任意的 $epsilon.alt > 0$ 都存在一个 $n$ 使得 $ \|\|u^(+) - phi.alt_n\|\|_1 lt.eq integral u^(+) - integral phi.alt_n < epsilon.alt $

]
尤其是这一特殊情况:

=== density of step functions in $L^1\(m\)$
<density-of-step-functions-in-l1m>
#theorem(
  title: [#kn[LS measure space 的 $L^1$ space 上的 density of step functions]],
)[
考虑 $\(bb(R)\,cal(L)\,m_s\)$ where $m_s$ 为一个 Lebesgue-Stieljes measure on $bb(R)$, let $f in L^1\(mu\)$, \ 对于任意 $epsilon.alt > 0$, 都存在 step function $phi.alt = sum_(j = 1)^N c_j chi_(I_j)$, 使得 $ integral\(f - phi.alt\)< epsilon.alt $ where each $I_j$ 都是 open intervals.

]
#proof[
和 general case 相似. 利用 the fact that 任意一个 Lebesgue mble function 都可以用 step function 来 approximate.

]
== integration of real and complex functions-III \[Fol 2.3, finished\]
<integration-of-real-and-complex-functions-iii-fol-2.3-finished>
=== another dense subspace of $L^1\(m_s\)$: $C_c\(bb(R)\)$
<another-dense-subspace-of-l1m_s-c_c-mathbbr>
上一节课我们知道了: 所有的 simple functions 在 $L^1\(mu\)$ 中构成了一个 dense subspace. 尤其是特殊情况: 对于 $\(bb(R)\,cal(L)\,m_s\)$, #strong[所有的 step functions 构成了一个 dense subspace of $L^1\(m_s\)$.]

今天我们先介绍另一个特殊情况 $\(bb(R)\,cal(L)\,m_s\)$ 的 $L^1\(m_s\)$ 的 #strong[另一个 dense subspace: 所有的 cpt supported continuous function.]

也就是说, #strong[任意的 Lebesgue intble function 都可以用 ctn function with compact supp 来近似.] 一个可积函数可以是 supp 非常怪异的以及非常 unctn 的, 但是却可以用 ctn and cpt supp functions 来逼近, in $L^1$ sense. 当然这是一种弱逼近. 函数可以差异很大.

#definition(
  title: [#kn[$C_c\(X\)$]],
)[
令 $X$ be a metric space, 我们定义:
$ C_c\(X\):= { upright("all ctn functions ") f : X arrow.r bb(C) upright(" with cpt supp") } $

]
#theorem(
  title: [#kn[$C_c\(X\)subset L^1\(mu\)$ 是一个 dense linear subspace]],
)[
$C_c\(bb(R)\)subset L^1\(mu_m\)$ 为一个 dense linear subspace.

]
#proof[
对于 $f in L^1\(m_s\)$, let $epsilon.alt > 0$\.我们首先 pick 一个 step function 来approximate $f$: $ phi.alt = sum_(j = 1)^n c_j chi_(I_j)\,quad s . t .\|\|f - phi.alt\|\|_1< epsilon.alt / 2 $
空出来的 $epsilon.alt / 2$, 我们使用 ctn and cpt supp function $f_j$对每个 $chi_(I_j)$ 进行逼近, by:

#figure(image("../assets/ch2-pics-image-20250219092808932.png", width: 60.0%),
  caption: [
  ]
)

从而 $\|\|sum_j f_j - phi.alt\|\|< epsilon.alt / 2$, 因此 $\|\|sum_j f_j - f\|\|< epsilon.alt / 2$ by tri ineq. 得证.

]
=== Riemann v.s. Lebesgue integral
<riemann-v.s.-lebesgue-integral>
我们已经完成了一个任意的 measure space 上的 Lebesgue 积分的定义, 以及可积空间的定义. \ Recall: Riemann integral 是对于 $bb(R)^n arrow.r bb(R)$ 的函数定义的, 经典定义为 $bb(R) arrow.r bb(R)$ 的函数. \ 现在我们比较对于 $bb(R) arrow.r bb(R)$ 的函数的 Riemann 和 Lebesgue 积分. 我们将会得出结论: #strong[Riemann 积分是 Lebesgue 积分的特殊情况, 即, Riemann 可积的函数一定也 Lebesgue 可积, 并且积分值相同]. (对于 $bb(R)^n arrow.r bb(R)$ 的函数也一样, 之后将展开.) \ Recall Riemann integral 的定义:

#definition(
)[
对于 $f :\[a\,b\]arrow.r bb(R)$ bdd, 一个 #strong[partition] $cal(P) = { t_j }_(j = 0)^n$ on $\[a\,b\]$ 满足 $ a = t_0 < t_1 < dots.h.c < t_n = b $
Define: $ S_(cal(P))\(f\): = sum_(j = 1)^n sup_(\[t_(j - 1)\,t_j\]) f\(t_j - t_(j - 1)\) $$ s_(cal(P))\(f\): = sum_(j = 1)^n inf_(\[t_(j - 1)\,t_j\]) f\(t_j - t_(j - 1)\) $
Define over all possible partition on $\[a\,b\]$: #strong[lower integral] and #strong[upper integral]$ accent(I, macron)\(f\): = inf_(cal(P) upright(" partition")) S_(cal(P))\(f\) $$ attach(limits(I), b: macron)\(f\): = sup_(cal(P) upright(" partition")) s_(cal(P))\(f\) $
注意到, 对于任意的 $f$, 总是有 $ attach(limits(I), b: macron)\(f\)lt.eq accent(I, macron)\(f\) $
我们称 $f$ 是 #strong[Riemann integrable] 的, if $ attach(limits(I), b: macron)\(f\)= accent(I, macron)\(f\):= I\(f\) $
这个 $I\(f\)$ 称为 $f$ 在 $\[a\,b\]$ 上的 Riemann integral.

]
=== Riemann intble $arrow.r.double.long$ Lebesgue intble
<riemann-intble-implies-lebesgue-intble>
#theorem(
  title: [#kn[Riemann integral 是 Lebesgue integral 的特殊情况]],
)[
$ f upright(" Riemann integrable") arrow.r.double.long {f in L^1\(\[a\,b\]\,cal(L) . m\)\
I\(f\)= integral_(\[a\,b\]) f #h(0em) d m $

]
#proof[
for (a): 对于给定 partition $cal(P)$, 我们 set: $ G_(cal(P)) : = sum_j M_j chi_(\[t_(j - 1)\,t_j\])\,quad g_(cal(P)) : = sum_j m_j chi_(\[t_(j - 1)\,t_j\]) $
从而有: $ S_(cal(P))\(f\)= integral G_(cal(P)) #h(0em) d m\,quad s_(cal(P))\(f\)= integral g_(cal(P)) #h(0em) d m $
我们知道, refinement 能增加 $s_(cal(P))$, 减小 $S_(cal(P))$ 从而增加逼近精度, 这一点在 Lebesgue integral 中更加明显: $ cal(P) subset cal(P)' & arrow.r.double.long g_(cal(P)) lt.eq g_(cal(P')) lt.eq f lt.eq G_(cal(P)') lt.eq G_(cal(P))\
 & arrow.r.double.long s_(cal(P)) lt.eq s_(cal(P)') lt.eq I\(f\)lt.eq S_(cal(P')) lt.eq S_(cal(P)) $
由于$f$ Riem integrable, #strong[存在一个 seq of partitions $\(cal(P)_n\)$ 使得 $cal(P_n) subset cal(P)_(n + 1)$, $\|\|cal(P)\|\|arrow.r 0$ (mesh), 并且] $ s_(cal(P_n))\,S_(cal(P_n)) arrow.r^(n arrow.r oo) I\(f\) $
因而 settiing $ g : = lim_(n arrow.r oo) g_(cal(P)_n) $ 为一个 increasing limit; $ G : = lim_(n arrow.r oo) G_(cal(P)_n) $ 为一个 decreasing limit; 由 mble seq 的 limit behvior 得 $g\,G in L^1\(m\)$ 且 $g lt.eq f lt.eq G$
并且 by DCT: $ integral g #h(0em) d m = lim_n integral g_(cal(P)_n) = I\(f\) $$ integral G #h(0em) d m = lim_n integral G_(cal(P)_n) = I\(f\) $
从而 $ g lt.eq f lt.eq G\,quad upright("and ") integral\(G - g\)#h(0em) d m = 0 $因而 $ g = G #h(0em) #h(0em) a . e . #h(0em) #h(0em)\(arrow.r.double.long = f #h(0em) #h(0em) a . e .\) $
因而 $ I\(f\)= integral f #h(0em) d m $
(由于 $m$ complete, $f$ 是 Lebesgue mble 的.)

]
#remark[
整体 intuitive. 对定义域的切分是对值域的切分的特殊情况.

]
=== Lebesgue's criterion for Riemann integrability
<lebesgues-criterion-for-riemann-integrability>
#theorem(
  title: [#kn[Lebesgue's characterization of Riemann integrability]],
)[
定义 $ D_f = { x upright(" where ") f upright(" is not ctn at") } $
则有 $ f upright(" Riemann intble ") arrow.l.r.double m\(D_f\)= 0 $

]
#proof[
在 395 中已经证明一次. 这里再回顾一次. \ Backward direction: trivial. \ Forward direction: assume $f upright(" Riemann intble ")$. \ 对于 $f :\[a\,b\]arrow.r bb(R)$, 我们 define: $ H\(x\):= lim_(delta arrow.r 0) sup_(\|y - x\|lt.eq delta) f\(y\)\,quad h\(x\):= lim_(delta arrow.r 0) inf_(\|y - x\|lt.eq delta) f\(y\) $
即 $f$ 在 $x$ 处的上下极限. 从而: $ f upright(" ctn at ") x arrow.l.r.double lim_(y arrow.r x) f\(y\)= f\(x\)arrow.l.r.double H\(x\)= h\(x\) $因而要证明 $m\(D_f\)= 0$, STS: $H\(x\)= h\(x\)$ a.e. \ To prove this: 见 395.

]
== modes of convergence \[Fol 2.4, finished\]
<modes-of-convergence-fol-2.4-finished>
=== convergence family
<convergence-family>
对于 $f_n\,f : X arrow.r bb(C)$, 我们目前有 4 种不同的 convergence. \ 2 #strong[general ones]:

- #strong[pointwise convergence]: 字面意思.

- #strong[uniform convergence] (on a subset): 对于任意 error bound $epsilon.alt$, 存在同一个序号 $N$ 可以 $epsilon.alt$-bound 住这个集合里所有的 $x$ 的函数值和 limit 函数值的 error.

2 #strong[in a measure space]:

- #strong[a.e. convergence]: ptwise convergence for a.e. $x$, 即 outside a null $E$.

- #strong[convergence in $L^1$]: $integral\|f_n - f\|arrow.r 0$

我们 recall trivial relation: $ upright("uni. conv") arrow.r.double.long upright("ptwise. conv") arrow.r.double.long upright("conv. a.e.") $
但是我们不清楚 $L^1$-convergence 和它们之间的关系. \ 我们看以下的 examples:

=== examples showing a.e. ptwise conv 和 $L^1$ conv 不能互推
<examples-showing-a.e.-ptwise-conv-和-l1-conv-不能互推>
#example(
)[
on $\(bb(R)\,frak(L)\,m\)$, 以下 $\(f_n\)$:

- #strong[escape to width] $ f_n = 1 / n chi_(\(0\,n\)) $
  $f_n arrow.r 0$ #strong[uniformly 但 $↛ 0$ in $L^1$]

- #strong[escape to hat]: $ f_n = chi_(\(n\,n + 1\)) $
  $f_n arrow.r 0$ #strong[ptwisely] 但并不 uniformly, 并且 #strong[$↛ 0$ in $L^1$]

- #strong[escape to height]: $ f_n = n chi_(\[0\,1 / n\)) $
  $f_n arrow.r 0$ #strong[a.e., 但是并不 ptwisely,] 当然也并不 uniformly, 并且$↛ 0$ in $L^1$

- #strong[typewriter]: 我们把区间$\[0\,1\]$划分成$2^k$个等长子区间, 对于 $1 lt.eq n lt.eq 2^k$ 令 $f_(k\,n)\(x\)$ 交替取 1, 其他取 0.
  $ f_(n\,k)\(x\)= cases(delim: "{", 1\, & x in [frac(n - 1, 2^k) \, n / 2^k], 0\, & upright("otherwise")) $
  即, for given $k$, $f_n$ is the indicator function of the $n$-th dyadic interval. $ parallel f_(n\,k) parallel_1 = 1 / 2^k arrow.r 0 $ 因而 $f_(n\,k) arrow.r 0$ in $L^1$, 但是 $forall x in\[0\,1\]$, $f_(n\,k)\(x\)↛ 0$ ptwisely. (也不 a.e.)
  (这个例子, 在推广至 $L^p$ 空间的时候, 也有 $parallel f_(n\,k) parallel_p arrow.r 0$, 也可以说明 #strong[$L^p$ convergence 并不能推导 a.e. convergence, 除了 $L^oo$ 的例外]\.)

]
在这些例子中, 我们发现, $L^1$-convergence 和 uniform, ptwise, a.e. 这三个 modes of covergence 都互不推导. 对于 uniform convergence 和 ptwise convergence, 这是很合理的, 因为可以函数越来越宽和扁使得积分不变但是却 uni conv; 也可以函数积分收敛但是在一个零测集上反复跳跃. \ 并且我们进一步发现, 就算是 a.e. 收敛, 也和 $L^1$ 收敛没有互推关系. 比如 ex (3), 这个函数只在 $0$ 处不收敛至 0, 但是整体的积分却是 const 1. \ 我们 recall: 两个函数 a.e. 相等, 等价于它们的 $L^1$ distance 为 0. 但是#strong[它们作为函数列极限行为, 并不相干]. \ 关于 $L^1$-convergence 和 uniform, ptwise, a.e. convergence 的关系我们已经讨论完了. \ 接下来我们将关于 $L^1$-convergence 这一条线, 引入一些新的 convergence modes, 在更大的 convergence family 中讨论这些 convergence 的关系.

=== 3 new modes of convergence: fast $L^1$-conv, conv measure and subseq a.e. conv
<new-modes-of-convergence-fast-l1-conv-conv-measure-and-subseq-a.e.-conv>
#definition(
  title: [#kn[modes of convergence for measurable functions]],
)[
对于 $f_n\,f : X arrow.r bb(C)$, 我们定义以下三种 convergence:

- #strong[fast $L^1$-convergence]: if $ sum_(n = 1)^oo integral\|f_n - f\|< oo $

- #strong[convergence in measure]: if $ mu\(x :\|f_n\(x\)- f\(x\)\|> epsilon.alt\)arrow.r^(n arrow.r oo) 0 $

- #strong[subseq a.e. convergence]: if 存在一个 subseq $\(f_(n_j)\)$ 使得 $ f_(n_j) arrow.r^(j arrow.r oo) f #h(0em) #h(0em) #h(0em) a . e . $

]
显然, #strong[fast $L^1$-convergence $arrow.r.double.long$ $L^1$-convergence;] \ 我们接下来将说明, #strong[fast $L^1$-convergence 也 $arrow.r.double.long$ a.e. convergence] (于是它同时作为 a.e. convergence 和 $L^1$-convergence 的上位收敛, 作为这两条线路的上位交汇.) \ 而我们也将说明: #strong[$L^1$-convergence 和 a.e. convergence 都 $arrow.r.double.long$ subseq a.e. convergence, 作为这两条线路的下位交汇.] \ 以及, $L^1$-convergence $arrow.r.double.long$ convergence in measure. \ \

#remark[
对于 convergence in measure, 还有一个可提及的定义是 #strong[Cachy in measure]: 对于任意 $epsilon.alt > 0$, $ mu\(x :\|f_n\(x\)- f_m\(x\)\|> epsilon.alt\)arrow.r^(n\,m arrow.r oo) 0 $
我们可以证明 (Folland 2.30)$ upright("Cauchy in measure") arrow.r.double.long upright("convergent in measure") $
但是反向并不成立. examples 中, #strong[escape to width, escape to hat 以及 typewritter 是 convergent to $0$ in measure 的, 但不 Cauchy in measure;] \ 这里和我们在 metric space 上 distance function 的定义中的 \"convergent\" 和 \"Cauchy\" 是不同的, #strong[在 以 distance 为收敛条件的意义上, convergent 是比 Cauchy 更强的性质.]

]
以下的标记将在之后几个定理的证明中用到:
我们现在 define:
$ B_(n\,k) := { x in X :\|f_n\(x\)- f\(x\)\|lt.eq 1 / k } $
这个集合表示#strong[对第 $n$th term, error 控制在 $1 / k$ 以内的点.] \ 从而我们可以用交并的形式来表示 ptwise 收敛点的集合:
$ { x divides f_n\(x\)arrow.r f\(x\)} = inter.big_(k = 1)^oo union.big_(N = 1)^oo inter.big_(n gt.eq N) B_(n\,k) $
Recall Chebyshev:
$ g in L^1 arrow.r.double.long mu\({\|g\|gt.eq c }\)lt.eq 1 / c integral\|g\| $

#proposition(
  title: [#kn[#strong[fast $L^1$-conv $arrow.r.double.long$ a.e. conv.]]],
)[
$ sum_(j = 1)^oo integral\|f_n - f\|< oo arrow.r.double.long f_n arrow.r f #h(0em) a . e . $

]
#proof[
我们取$ { x divides f_n\(x\)arrow.r f\(x\)} = inter.big_(k = 1)^oo union.big_(N = 1)^oo inter.big_(n gt.eq N) B_(n\,k) $ 的 complement
$ E := union.big_(k = 1)^oo inter.big_(N = 1)^oo union.big_(n gt.eq N) B_(n\,k)^c = { f_n ↛ f } $#strong[By Cheb, for each $n\,k$ we have:]$ mu\(B_(n\,k)^c\)lt.eq k integral\|f_n - f\| $
因而由 fast $L^1$-convergence 的条件可得 $ forall k forall N\,quad mu\(union.big_(n gt.eq N) B_(n\,k)^c\)lt.eq k sum_(n = N)^oo integral\|f_n - f\|quad\(arrow.r 0 upright(" as ") N arrow.r oo\) $因而 by ctn from above, $ mu\(inter.big_(N = 1)^oo union.big_(n gt.eq N) B_(n\,k)^c\)= 0 $
因而
$ mu\(E\)= 0 $

]
#remark[
我们知道, $L^1$-convergence 和 a.e. convergence 互不能推, 因为这一个是逐点的性质, 一个是整体的性质. 但是 $L^1$-convergence 作为一个整体的性质又不够强大 (它允许用函数的纵深来换取宽度, 从而在收敛的情况下保持积分不变.). 然而, fast $L^1$-convergence 则是一个足够强大的整体性质. 因而它可以 imply a.e. convergence.

]
#corollary(
  title: [#kn[$L^1$-convergence ($arrow.r.double.long$conv. in measure)
$arrow.r.double.long$ subseq a.e. conv.]],
)[
if $f_n arrow.r f$ in $L^1$, then there exists subseq $\(f_(n_j)\)_(j in bb(N))$ s.t. $f_(n_j) arrow.r f$ a.e. \ (即 #strong[$L^1$ convergence implies subseq a.e. convergence])

]
#proof[
注意: #strong[对于 $L^1$-convergent 的 seq, 我们可以 pick 出一个 fast $L^1$-convergent 的 subseq.] \ Pick $\(n_j\)_(j in bb(N))$ s.t.
$ integral\|f_(n_j) - f\|lt.eq 1 / j^n $
Then $ sum_(j = 1)^oo integral\|f_(n_j) - f\|< oo $
由刚才的 prop 得, $f_(n_j) arrow.r f$ a.e.

]
=== a.u. conv.(并非 uni. conv. a.e.) 和 Egoroff's Theorem
<a.u.-conv.并非-uni.-conv.-a.e.-和-egoroffs-theorem>
#definition(
)[
我们称 $f_n arrow.r f$ almost uniformly (a.u.), 如果 $forall epsilon > 0$, 都存在 $E subset.eq A$ s.t. $mu\(E\)< epsilon$ 并且 $f_n arrow.r f$ uniformly on $E^C$

]
#remark[
和 a.e. convergence 的定义不同, #strong[a.u. convergence 并不能保证在一个零测集外都 uniform convergence, 但是它仍然 imply a.e. convergence.] \ 也有更强的一种 convergence: #strong[uniform convergence a.e.], 表示在一个零测集外都 uniform convergence, 其强度在 uni. conv. 和 a.u. conv. 中间. 但在这里, 对于我们即将介绍的 Egoroff's Theorem 而言不需要这么强的 convergence. \ 我们将在 $L^p$ space 的部分讨论 uniform convergence a.e. 这个 convergence mode, 并表示它等价于 $L^oo$ convergence.

]
#theorem(
  title: [#kn[Egoroff's Theorem]],
)[
如果 $mu$ 是个 finite measure ($mu\(X\)< oo$), 那么
$ f_n arrow.r f #h(0em) #h(0em) a . e . #h(0em) #h(0em) arrow.l.r.double f_n arrow.r f #h(0em) #h(0em) a . u . $

]
#proof[
a.u. $arrow.r.double.long$ a.e.: DIY (显然) \ a.e. $arrow.r.double.long$ a.u.: Fix $epsilon > 0$, 我们有 $ f_n arrow.r f #h(0em) #h(0em) a . e . #h(0em) #h(0em) arrow.l.r.double #h(0em) #h(0em) mu\(union.big_(k = 1)^oo inter.big_(N = 1)^oo union.big_(n gt.eq N) B_(n\,k)^c\)= 0 $
因而 $ forall k\,#h(0em) #h(0em) mu\(union.big_(k = 1)^oo inter.big_(N = 1)^oo union.big_(n gt.eq N) B_(n\,k)^c\)= 0 $
By Ctn from Above: $ forall k\,#h(0em) #h(0em) lim_(N arrow.r oo) mu\(union.big_(n gt.eq N) B_(n\,k)\)= 0 $
Then: $ forall k\,#h(0em) #h(0em) exists N_k #h(0em) #h(0em) s . t . #h(0em) #h(0em) mu\(union.big_(n gt.eq N) B_(n\,k)\)< epsilon / 2^k $
Set$ E := union.big_(K = 1)^oo union.big_(n gt.eq N_k) B_(n\,k)^c $
Then we have: $ {mu\(E\)< sum_1^oo epsilon / 2^k = epsilon\
f_n arrow.r f #h(0em) #h(0em) upright("unif. on ") E^c = inter.big_(k = 1)^oo inter.big_(n gt.eq N_k) B_(n\,k) $

]
#remark[
在 Prob Theory 中很有用, 因为 prob space 是 finite measure space.

]
#example(
)[
$mu = oo$ 时的反例: 考虑 escape to hat function $f_n := chi_(\(n\,n + 1\))$ on $\(bb(R)\,frak(L)\,m\)$. \ $f_n arrow.r 0$ a.e. 但是并不 a.u., 因为 $mu\(X\)= oo$.

]
#theorem(
  title: [#kn[Lusin's Theorem]],
)[
If $f :\[a\,b\]arrow.r bb(C)$ 是 Leb. mble 的, 那么 $forall epsilon > 0$, 都存在 compact $K subset.eq\[a\,b\]$ s.t. $m\(K^c\)< epsilon$ 并且 $f\|_K$ ctn.

]
#proof[
这里我们 restrict $\(bb(R)\,frak(L)\,m\)$ to $\[a\,b\]$, 得到这个 subspace 是一个 finite ($= b - a$) 的 measure space.
我们知道 $C_c\(\[a\,b\]\)subset.eq L^1\(m\)$ 是 dense subset. \ First assume $f$ bounded, then $f in L^1\(m\)$, $integral\|f\|< oo$. \ Then: $ exists\(f_n\)subset.eq C_c\(\[a\,b\]\)#h(0em) #h(0em) s . t . #h(0em) #h(0em) f_n arrow.r f upright(" in ") L^1 $
Pass to subseq: $\(f_(n_j)\)arrow.r f$ a.e. \ Then by #strong[Egorov]: $ exists F subset.eq\[a\,b\]upright(" mble ") s . t . #h(0em) #h(0em) mu\(F\)< epsilon / 2 $
并且 $\(f_(n_j)\)arrow.r f$ uniformly on $F^c$. \ By inner regu: 存在 $K subset.eq\[a\,b\]$ cpt s.t. $K subset.eq F^c$ 并且 $m\(F^c\\K\)< epsilon / 2$, #strong[从而 $m\(K^c\)< epsilon$ 并且 $f_n$ conv unif. on $K$, so $f$ ctn on $K$.]

]
#remark[
这个定理的证明中展示了 subseq a.e. convergence 的用处. \ 我们可以从一个 $L^1$-convergent 的 seq 中 \"蒸馏\" 出一个 a.e. convergent 的 subseq, conv to 同一个函数. \ 并且如果把空间限制在 measure finite 的 subset 上, 还能获取到一个 a.u. convergent 的 seq. \ a.u. convergent 的作用很大, 比如可以保留函数在一个比较大的空间上的 ctn 性质. \ 因而 #strong[subseq convergent 的性质可以 as good as convergent, a.u. 的性质可以 as good as uniform.]

]
=== summary: convergence mode relations
<summary-convergence-mode-relations>
#figure(image("../assets/ch2-pics-image-20250225185214948.png", width: 85.0%),
  caption: [
  ]
)

一条线是函数值方面的收敛, 一条线是测度和积分方面的收敛, 第一次交汇是 fast $L^1$ conv, 汇聚在 subseq a.e. conv. \ #strong[subseq a.e. conv. 是最弱的 convergence, 这里所有的 convergence 都可以推到它.] \ 这里可能还有其他的 convergence 关系. 但是我们不关心. 因为不太会用到它们的关系.

#remark[
那我们不禁想要问: 如果没有 fast $L^1$ convergence, 但是还是想 show $L^1$ convergence, 怎么办呢? 这个常用的 convergence 难道只能从定义来证明吗? \ 有以下两个方法:

- DCT. DCT 就是专门为了证明 $L^1$ convergence 定制的. \ DCT 表明: $ f_n arrow.r f #h(0em) upright("a.e.") + upright(" dominating function ") arrow.r.double.long f_n arrow.r f #h(0em) upright("in ") L^1 $

- 如果作为底的 measure space 是 finite measure 的, 那么 uniform conv. a.e. (which is equiv to $L^oo$ conv.) 可以推出 $L^1$ convergence. (以及任意的 $L^p$ convergence).

]
