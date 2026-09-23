#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= measurable functions and integration on $L^(+)\(mu\)$
<measurable-functions-and-integration-on-lmu>
== measurable function \[Fol 2.1\]
<measurable-function-fol-2.1>
=== general measurable function
<general-measurable-function>
#definition(
  title: [#kn[$\(cal(M)\,cal(N)\)$-measurable function]],
)[
Let #ref[measurable-space-and-measure-space] $\(X\,cal(M)\)$, $\(Y\,cal(N)\)$ be measurable spaces, 如果 $f : X arrow.r Y$ 满足: $ B in cal(N) arrow.r.double.long f^(- 1)\(B\)in cal(M) $, 则称 $f$ 为一个 $\(cal(M)\,cal(N)\)$-measurable function.

]
从一个 measurable space 到另一个 measurable space 的 function 被称为 measurable 的条件是: 被映射到可测集的集合只能是可测集.

这个定义和 topological space 上 continuous 的定义: 被映射到开集的只能是开集, 形式是完全一样的. 并且我们知道, topological space 和 measure space 也有很多相似之处. 因而连续性和可测性有一定的关系.

函数的可测性的定义是 with respect to 它们所在可测空间选定的 $sigma$-algebra 的, 就像 topologica spaces 之间函数的连续性的定义是 with respect to 它们所在的 topological spaces 选定的 topology.

这两个定义都表示的是: 性质不好的集合不会被映射到性质良好的集合. (但是性质良好的集合有可能被映射到性质不好的集合.)

#proposition(
  title: [#kn[composition preserves measurability]],
)[
如果 $f$ 是 $\(cal(A)\,cal(B)\)$-measurable 的, $g$ 是 $\(cal(B)\,cal(C)\)$-measurable 的, 那么 $g compose f$ 是 $\(cal(A)\,cal(C)\)$-measurable 的.

]
#proof[
Trivial.

]
#lemma(
)[
Let $\(X\,cal(M)\)$, $\(Y\,cal(N)\)$ be measurable spaces, 如果 $cal(N) = < epsilon >$ for some $epsilon subset.eq Y$, 那么

$f : X arrow.r Y$ $\(cal(M)\,cal(N)\)$-measurable $arrow.l.r.double$ $f^(- 1)\(E\)in cal(M) quad forall E subset.eq epsilon$

]
#proof[
foward direction: trivial. \ backward direction: Let
$ D : = { E subset.eq Y divides f^(- 1)\(E\)in cal(M) } $
容易证明: $D supset.eq epsilon$, 并且 $D$ 是一个 $sigma$-algebra. \ 因而 $D supset.eq < epsilon > = cal(N)$

]
#remark[
如果我们知道 $cal(N)$ 是由某个子集生成出来的, 那么对于映射到这个 measurable space 的函数, 只要保证这个子集中的每个集合的 preimage 都是可测集就可以了, 可以 reduce 判断 $f$ measurable 的条件.

同样类比 topological space, 如果 $Y$ 的 topology 存在一个 basis, 那么判断 $f : X arrow.r Y$ 连续, 只需要判断这个 basis 的 preimage 都是 open 的就好了.

]
#proposition(
)[
对于 topological space $X\,Y$, let $f : X arrow.r Y$

$f$ continuous $arrow.r.double.long$$f$ 是 $\(cal(B)\(X\)\,cal(B)\(Y\)\)$ measurable 的.

]
#remark[
topological spaces 之间, 连续函数一定是在它们的 Borel algebra 之间 measurable 的.

]
=== real and complex-valued measurable function
<real-and-complex-valued-measurable-function>
#definition(
  title: [#kn[\(real-valued) measurable functions]],
)[
Let $\(X\,cal(A)\)$ be a measurable space,
对于 $f : X arrow.r accent(bb(R), macron)$ 如果它是 $\(cal(A)\,cal(B)\(accent(bb(R), macron)\)\)$-measurable 的, 我们直接简称它是 $cal(A)$-measurable 的, 或者简称为 measurable 的.

]
#remark[
实际上, 使用无穷作为值, 就是把#strong[原本不在定义域上的无穷跳跃点放到了定义域上], 些情况下, 仅仅是一种方便的记号，但它们通常不会被视为真正的值.

但是等价地, 我们为了便利一般都会使用 extended real number system 来进行分析, 把这些无穷间断当作无穷的值来进行分析.

这样做法的合理性是, 对于#strong[零测集大小多个这样的无穷间断点], 在 Lebesgue 积分体系下这一行为#strong[并不会影响函数的 integrability 以及 integral 的值], 因而我们可以这么做. 这一点之后并不会造成困扰, 因为我们在之后定义可积空间时, 会避开有超过零测集大小多个无穷间断点的函数, 以及无法定义的行为.

我们容易验证:
$ cal(B)\(accent(bb(R), macron)\)= { E subset.eq accent(bb(R), macron) divides E inter bb(R) in cal(B)\(bb(R)\)} $

以及, $cal(B)\(accent(bb(R), macron)\)$ 的 generating set 可以是所有的 $\(a\,oo\]$ 集合或者 $\[- oo\,a\)$ 集合#strong[.] 所以#strong[一个 map to $accent(bb(R), macron)$ 的函数是可测的, 当且仅当任意 $\(a\,oo\]$ 的 preimage 都可测]. \

]
#definition(
  title: [#kn[\(complex-valued) measurable functions]],
)[
如果 $f : X arrow.r bb(C)$ 满足: $"Re" f\,"Im" f$ 都是 (real-valued) $X$-measurable 的, 那么也称 $f$ 是 $X$-measurable 的, 或者直接说是 measurable 的.

]
#remark[
任意 complex function $f$ 都可以写为
$ f = "Re" f + i "Im" f $
这个定义其实等价于 $f$ 是 $\(cal(M)\,cal(B)\(bb(C)\)\)$-measurable 的, 因为这个 statment 等价于 $"Re" f$, $"Im" f$ 都是 (real-valued) $X$-measuable 的, 这是因为 $ cal(B)\(bb(C)\)equiv cal(B)\(bb(R)^2\)= cal(B)\(bb(R)\)times.o cal(B)\(bb(R)\) $

]
#definition(
  title: [#kn[Lebesgue measurable functions, Borel measurable functions]],
)[
Naturally, 如果 $f : bb(R) arrow.r bb(C)$ 是一个 $frak(L)$-measurable 的函数, 那么我们称 $f$ 是 #strong[Lebesgue measurable] 的.

同样地, 如果它是一个 $cal(B)\(bb(R)\)$-measurable 的函数, 称 $f$ 是 #strong[Borel measurable] 的.

]
#proposition(
)[
在任何 $cal(M)$-measurable function $f$ 前 compose 一个 Borel measurable 的 function, 结果仍然是 $cal(M)$-measurable 的, follows from composition preserves measurability.

]
#proof[
Follows from def.

]
#example(
)[
$f^2$, $- 3 f$, $frac(1, \|f\|)$ ($f eq.not 0$) 都仍然是 $cal(M)$-measuble 的.

]
=== arithmetic and sequential preservation of measurable functions
<arithmetic-and-sequential-preservation-of-measurable-functions>
#proposition(
  title: [#kn[addition and multiplication preserve measurability]],
)[
如果 $f\,g$ 是 $cal(M)$-measurable function, 那么 $f + g\,f g$ 也是.

]
#proof[
Suffices to assume $f\,g$ is (extended) real-valued. Complex case follows trivially.

Suppose $f\,g$ 是 $cal(M)$-measurable 的, 我们想要证明: $f + g$ 是 $cal(M)$-measurable 的, suffices to show: $\(f + g\)^(- 1)\(a\,oo\]in cal(M)$ for any $a in bb(R)$.

我们 notice:
$ { x in X divides f\(x\)+ g\(x\)> a } = union.big_(r in bb(Q)) { x divides f\(x\)> r } inter { x divides g\(x\)> a - r } $
于是 finishes the proof.

对于 $f g$, 我们发现有
$ f g = 1 / 2\(\(f + g\)^2- f^2 - g^2\) $
于是也 finishes the proof, following 前一个 proposition.

]
#lemma(
  title: [#kn[sequential behavior of real-valued measurable function]],
)[
如果 ${ f_n : X arrow.r accent(bb(R), macron) }_(n in bb(N))$ 是一个 seq of $cal(M)$-measurable functions, 那么

- $ g_1\(x\): = sup_j f_j\(x\) $

- $ g_2\(x\): = inf_j f_j\(x\) $

- $ g_3\(x\): = limsup_(j arrow.r oo) f_j\(x\) $

- $ g_4\(x\): = liminf_(j arrow.r oo) f_j\(x\) $

都是 $cal(M)$-measurable 的.

]
#proof[
$ g_1\(x\)= sup_(j in bb(N)) f_j\(x\). $
由上确界的定义：
$ g_1\(x\)> a arrow.l.r.double exists j in bb(N)\,upright(" such that ") f_j\(x\)> a . $
因此，
$ { x divides g_1\(x\)> a } = union.big_(j in bb(N)) { x divides f_j\(x\)> a } . $
因而:
$ g_1^(- 1)\(\(a\,oo\]\)= union.big_1^oo f_j^(- 1)\(\(a\,oo\]\) $

由于 $f_j$ 可测，集合 ${ x divides f_j\(x\)> a }$ 是 $cal(M)$-measurable ，而可测集合的可数并仍然是可测的，因此 $g_1$ 可测。

inf: dually.

limsup: 等于 inf of sup ($k gt.eq n$)

liminf: 等于 sup of inf ($k gt.eq n$)

]
#remark[
从这个 proof 里笔者发现了这个惊人的事情。居然有
$ \(s u p_j f_j\)^(- 1)\(\(a\,oo\]\)= union.big_1^oo f_j^(- 1)\(\(a\,oo\]\) $
但是仔细想想也是合理的. 因为 function seq 的 sup 函数能够 map 到的值大的元素肯定比其中任何一个 function $f_n$ 更多. 并且其中存在一个 limit 关系.

以及得出了一个很重要的结论: #strong[可测函数的 seq 的各种极限仍然是可测函数.]

]
#corollary(
)[
如果 ${ f_n : X arrow.r accent(bb(R), macron) }_(n in bb(N))$ 是一个 seq of $cal(M)$-measurable functions, 且在任意 $x$ 处极限都存在, 那么
$ f\(x\):= lim_(j arrow.r oo) f_j\(x\) $
是 $cal(M)$-measurable 的.

]
#proof[
directly follows from lemma. 因为 $x$ 处极限如果存在, 那么 $sup_f f_j\(x\)= inf_j f_j\(x\)$

]
#corollary(
)[
$f\,g$ $cal(M)$-measurable $arrow.r.double.long$ $max\(f\,g\)\,min\(f\,g\)$$cal(M)$- measurable

]
#proof[
two element sequence, 剩余的用空集, 于是 follows form above.

]
#remark[
于是我们知道, 当我们把 $f$ 拆分成 $f^(+) := max\(f\,0\)$, $f^(-) := max\(- f\,0\)$, 我们有

#strong[$f$ $cal(M)$-measurable $arrow.r.double.long$ $f^(+)\,f^(-)$ $cal(M)$-measurable]

并且由于 $f = f^(+) - f^(-)$, 反向也成立. 并且 $\|f\|= f^(+) + f^(-)$, 因而有:

#strong[$f$ $cal(M)$-measurable $arrow.l.r.double$ $f^(+)\,f^(-)$ $cal(M)$-measurable] #strong[$arrow.l.r.double$ $\|f\|$ $cal(M)$-measurable]

]
== simple function and integration of nonnegative functions \[Fol 2.1, finished; 2.2\]
<simple-function-and-integration-of-nonnegative-functions-fol-2.1-finished-2.2>
=== indicator and simple function
<indicator-and-simple-function>
#definition(
  title: [#kn[characteristic (indicator) function]],
)[
Given $E subset.eq X$, 我们定义:
$ chi_E\(x\):= {1 quad\,x in E\
0 quad\,x in.not E $

]
#lemma(
)[
如果 $\(X\,cal(M)\)$ 是一个 measurable space, 那么一个 indicator function

#strong[$chi_E$ on $X$ 是 measurable 的 $arrow.l.r.double$ $E in cal(M)$]

]
indicator function measurable 当且仅当它 indicate 的集合是 measurable 的.

#definition(
  title: [#kn[simple function]],
)[
一个 simple function on measurable space $\(X\,cal(A)\)$ 是一个 $cal(A)$-measurable function $phi.alt : X arrow.r bb(C)$, taking only finitely many values.

即: $phi.alt\(X\)= { c_1\,dots.h.c\,c_k }$

]
#proposition(
  title: [#kn[使用 #strong[a sum of indicator functions of measurable sets] 来定义
simple function]],
)[
对于 simple function $phi.alt : X arrow.r bb(C)$ s.t. $phi.alt\(X\)= { c_1\,dots.h.c\,c_n }$, 我们也可以定义它为: $ phi.alt\(x\)= sum_(j = 1)^n c_j chi_(E_j) $
其中, $E_j = phi.alt^(- 1)\({ c_j }\)$.
我们称之为: the #strong[standard representation of simple $phi.alt$.]

]
这是因为, 单点集在 $cal(B)\(bb(C)\)$ 上是 measurable 的, #strong[由于 $phi.alt$ measurable, 我们得到 $E_j in cal(M)$.]

#remark[
对于 simple function $ phi.alt\(x\)= sum_(j = 1)^n c_j chi_(E_j) $ 一定有 $ union.sq.big_(j = 1)^n E_j = X $其中通常有一个 $E_j$ 上 $phi.alt$ 的值是 0.

]
#lemma(
)[
如果 $phi.alt\,psi : X arrow.r bb(C)$ 是 simple functions, 那么

- $phi.alt + psi$

- $phi.alt psi$

- $\|phi.alt\|$

- $k phi.alt$ $forall k in bb(C)$

都是 simple functions.

特别地, 如果 $phi.alt\,psi : X arrow.r bb(R)$, 那么 $max\(phi.alt\,psi\)\,min\(phi.alt\,psi\)$ 也是 simple functions.

]
#proof[
trivial.

]
=== measurable function is a limit of simple functions
<measurable-function-is-a-limit-of-simple-functions>
#theorem(
  title: [#kn[approximating a nonneg measurable function by simple function]],
  id: "thm-04-measurable-functions-and-integration-on-l-mu-approximating-a-nonneg-measurable-function-by-simple-function",
)[
任意的 measurable $f : X arrow.r\[0\,oo\]$ 都是 #strong[pointwise limit] of an #strong[increasing sequence of simple functions] ${ phi.alt_n : X arrow.r\[0\,oo\]}_(n in bb(N))$.

]
#proof[
这个构造看起来有点复杂但是其实非常直观.

对于 $n in bb(N)$, 我们都 index $0 lt.eq k lt.eq 2^(2 n) - 1$

然后对每个 $k$ 取:
$ E_n^k := f^(- 1)\(\(k / 2^n\,frac(k + 1, 2^(n + 1))\]\) $
以及:
$ F_n := f^(- 1)\(\(2^n\,oo\]\) $

即, 我们把 $\(0\,2^n\]$ 这一部分值域切成了 $2^(2 n)$ 份, 再把 $\(2^n\,oo\]$ 这一部分值域单独列成一份.

这 $2^(2 n) + 1$ 份值域的切片, 我们对每一份所对应的 function graph, 都取它对应的 Preimage 上的 indicator function 乘以 $k / 2^n$, 这段值域的最小值的 constant 函数, 于是一定会得到一个 well approximation:

$ phi.alt_n := sum_(k = 0)^(2^(2 n) - 1) k k / 2^n chi_(E_n^k) + 2^n chi_(F_n) $
易得, $ phi.alt_n lt.eq phi.alt_(n + 1) lt.eq f $
for all $n$. 并且#strong[在 $X\\F_n = { x divides f\(x\)lt.eq 2^n }$ 上我们有]:

$ 0 lt.eq f - phi.alt_n lt.eq 1 / 2^n $

随着 $n$ 增大, 最终这个近似会覆盖整个 image, (除非具有非零测数量的无穷间断点, 那样的话最后结果也是无穷), 并且值域的划分越来越精细, 最后会得到:

- #strong[$phi.alt_n arrow.r f$ pointwisely]

- #strong[在 $f$ bounded 的定义域 ${ x divides f\(x\)< oo }$ 上, $phi.alt_n arrow.r f$ uniformly.]

#figure(image("../assets/ch2-pics-simple.png", width: 60.0%),
  caption: [
  ]
)

]
#remark[
我们在构造 simple function 的时候这样用到 measurability:
这里的每个 $phi.alt_n$ 是 simple function, 是由于 $f$ measurable, 以至于每个 #strong[$E_n^k\,F_n$ 作为 interval 的 preimage, 都是 measurable sets.]

]
#corollary(
  title: [#kn[simple approximation of complex measurable functions]],
)[
对于任意的 measurable $f : X arrow.r bb(C)$, 都存在 a seq of simple functions $ 0 lt.eq\|phi.alt_1\|lt.eq\|phi.alt_2\|lt.eq dots.h.c lt.eq\|f\| $ 使得

- #strong[$phi.alt_n arrow.r f$ pointwisely]

- #strong[$phi.alt_n arrow.r f$ uniformly on ${ x divides\|f\(x\)\|< oo }$]

]
#proof[
我们可以把 $f$ 拆为 $"Im" f\,"Re" f$, 然后再把它们分别拆为 $"Im" f^(+) - "Im" f^(-)$, 以及 $"Re" f^(+) - "Re" f^(-)$. 得到四个 real-valued nonng functions.

]
=== integration of non-neg functions
<integration-of-non-neg-functions>
#definition(
  title: [#kn[$L^(+)$ space and integration on it]],
)[
给定一个 measure space $\(X\,cal(M)\,mu\)$
我们定义: $ L^(+)\(mu\):= { bold("measurable functions ") f : X arrow.r\[0\,oo\]} $
对于所有的 #strong[simple functions $phi.alt = sum_(j = 1)^n a_j chi_(E_j) in L^(+)\(mu\)$], 即所有非负的 simple functions, 我们定义 #strong[the integral of $phi.alt$ with respect to $mu$] by:
$ integral phi.alt d mu #h(0em)\(= integral_X phi.alt d mu\):= sum_(i = 1)^n a_j mu\(E_j\) $
对于任意的 $f in L^(+)\(mu\)$, 我们定义 #strong[the integral of $f$ with respect to $mu$] by:
$ integral f d mu #h(0em)\(= integral_X f d mu\):= sup { integral phi.alt d mu divides 0 lt.eq phi.alt lt.eq f\,phi.alt upright(" simple") } $

]
#remark[
因而对于 general 的非负可测函数, 我们通过 @thm-04-measurable-functions-and-integration-on-l-mu-approximating-a-nonneg-measurable-function-by-simple-function 得知, 我们可以用 simple function 来近似它. 从而, 我们使用 simple function 的积分的极限来定义 general measurable function 的积分.

而 simple function 的积分, 即等于它下方的面积. 因而我们发现, 这个积分的定义和 $bb(R)^n arrow.r bb(R)$ 上 Rieamnn 积分有很大的相似之处, 不同在于一个竖切定义域一个横切值域.

之后我们也会证明, 在 $bb(R)^n arrow.r bb(R)$ 上, 所有 Riemann 可积的函数也 Lebesgue 可积, 并且得到的结果相同.

这一积分的定义是对 Riemann 积分的推广.

]
#remark[
measure theory 中的积分理论是把从 $bb(R)^n$ 出发的函数 推广到了从抽象的测度空间出发的函数; 而还有其他的积分理论, 比如微分形式上的积分则是把实值函数的积分推广到了 oriented smooth manifolds 上, 不仅可以积分 scalars 还可以积分向量场. 这些积分理论的共同点是对 $bb(R)^n arrow.r bb(R)$ 上的函数的积分是 coincide 的.

笔者感觉积分理论就是在一个抽象空间上，通过一个抽象的密度函数(被积函数) 以及体积指标(measure function), 得到一个抽象质量。由于这个理念本身是从 $bb(R)^n$ 上 generalize 的，因而各种不同的积分理论在 $bb(R)^n$ 上的积分总是 coincide 的

]
#definition(
  title: [#kn[integration on a subset]],
)[
对非负 #strong[simple functions $phi.alt = sum_(j = 1)^n a_j chi_(E_j) in L^(+)\(mu\)$], 我们定义 #strong[the integral of $phi.alt$ on $A in cal(M)$ with respect to $mu$] by:
$ integral_A phi.alt #h(0em) d mu := integral phi.alt chi_A #h(0em) d mu $
对于 general 的 $f in L^(+)\(mu\)$, 我们也从而定义:
$ integral_A f d mu := sup { integral_A phi.alt d mu divides 0 lt.eq phi.alt lt.eq f\,phi.alt upright(" simple") } $

]
#remark[
$ integral_A phi.alt #h(0em) d mu := integral phi.alt chi_A #h(0em) d mu = sum_j a_j chi_(A inter E_j) $

]
#proposition(
  title: [#kn[integral of simple functions 的性质]],
)[
Let $phi.alt\,psi$ be simple functions in $L^(+)\(mu\)$, 有:

- #strong[homogeneity:] 对于任意非负 $c$, 有 $integral c phi.alt = c integral phi.alt$

- #strong[linearity:] $integral\(phi.alt + psi\)= integral phi.alt + integral psi$

- #strong[monotonicity:] $phi.alt lt.eq psi arrow.r.double.long integral phi.alt lt.eq integral psi$

- #strong[induced measure]: $A mapsto integral_A phi.alt #h(0em) d mu$ 是一个 $cal(M)$ 上的 measure.

]
#proof[
#strong[homogeneity] trivial .

#strong[linearity:] Let $ phi.alt = sum_(i = 1)^n a_i chi_(E_i) quad\,psi = sum_(j = 1)^n b_j chi_(F_j) $ 则有: $ E_j = union.sq.big_k\(E_j inter F_k\)quad\,F_k = union.sq.big_j\(E_j inter F_k\) $ for each $j\,k$. 从而有 $ integral phi.alt + integral psi = sum_(j\,k)\(a_j + b_k\)mu\(E_j inter F_k\) $

#strong[Monotonicity]: trivial.

induced measure: 只需要证明 countable additivity, 于是我们让 $A$ be the union of a disjoint seq in $cal(M)\,有 :$$ integral_A phi.alt = sum_j a_j mu\(A inter E_j\)= sum_(j\,k) a_j mu\(A_k inter E_j\)= sum_k integral_(A_k) phi.alt $

]
#remark[
本身, 我们已经基于一个 measure 作为 \"体积密度\", 来定义一个 simple function 按照这个体积密度得到的积分, 而它在每个可测集上的积分又可以定义另一个 measure;

这个 measure 表示 \"某个集合和 $E_1\,dots.h.c\,E_n$ 的交集在这个体积密度以及 simple function 放缩下有多大\".

]
那么对于 general 的 $f in L^(+)\(mu\)$, 有刚才的四条性质成立吗? #strong[显然, monotonicity 和 homogeinity 是成立的], 但是我们会发现, 很难证明
$ integral f #h(0em) d mu + integral g #h(0em) d mu = integral\(f + g\)#h(0em) d mu $
$lt.eq$ 是容易证明的, 但是 $gt.eq$ 有点困难. 为了证明 $gt.eq$ 这个方向, 我们需要下面这个重要定理:

=== MCT
<mct>
#theorem(
  title: [#kn[monotone convergence theorem]],
)[
Let ${ f_n }_(n in bb(N))$ be a seq in $L^(+)\(mu\)$, 并且有 $f_n lt.eq f_(n + 1)$ for each $n$. \ 我们 define:$ f := lim_n f_n #h(0em) #h(0em)\(= sup_n f_n\) $, 则一定有 $ integral f = lim_(n arrow.r oo) integral f_n $

]
#proof[
首先 Note 几个事情:
\1. 这个极限函数 #strong[$f$ 是 well-defined 的] (可能 $oo$), by #strong[numerical sequence 的 monotone bounded convergence theorem].

\2. 同样地, 由于 $integral f_n lt.eq integral f_(n + 1) lt.eq integral f$, 这个 #strong[$lim integral f_n$ 也是存在的].

\3. 并且, $f$ 也是一个可测函数, 因为 by 上个 lecture 的定理: #strong[可测函数序列的极限也是可测函数.]

现在进行证明:
By monotonicity of integral, $ lim integral f_n lt.eq integral f $

是 natural 的. 因而只需要证明另一方向.

By def, $integral f = sup { integral phi.alt divides phi.alt lt.eq f }$ where $phi.alt$ is simple.
因而 it #strong[suffices to show: 对于任意 simple $phi.alt lt.eq f$, 都有 $lim integral f_n gt.eq integral phi.alt$.]

我们 fix 一个 $0 lt.eq phi.alt lt.eq f$. WTS: $ lim_n integral f_n gt.eq integral phi.alt $

要证明 $lim integral f_n gt.eq integral phi.alt$, 我们再把它转化成证明: $ forall alpha in\(0\,1\)#h(0em) #h(0em) lim_n integral f_n gt.eq alpha integral phi.alt $
我们取 $ E_n := { x divides f_n\(x\)gt.eq alpha phi.alt } = f^(- 1)\(\[alpha phi.alt\,oo\]\)in cal(M) $

容易发现, $E_n subset.eq E_(n + 1)$ for each $n$. 并且 Claim: $union.big_n E_n = X$. (这就是为什么要做取 $alpha$ 这个意义不明的行为) 这是因为 $alpha < 1$, 并且 $f_n$ converge pointwisely to $f$, by measurable function 的 limit behavior. #strong[而由于 simple function $phi.alt$ 是 bounded 的, 从而 $f_n$ 会 uniformly 向上接近(以至于超过) $phi.alt$. 取 $alpha$ 是为了保证, 一定存在一个 $n$ 使得 $E_n = X$]

于是我们有:
$ integral f_n gt.eq integral f_n chi_(E_n) gt.eq integral alpha phi.alt chi_(E_n) = alpha integral_(E_n) phi.alt $

我们此处又可以用到一条冷门的性质: #strong[由于 $E mapsto integral_E phi.alt$ 是一个 measure on $\(X\,cal(A)\)$, by continuous from below, 有:]
$ lim_n integral_(E_n) phi.alt = integral phi.alt $
从而有$ lim_n integral f_n gt.eq alpha integral phi.alt $ finishing the proof.

]
#remark[
这是一个非常重要的定理. 它表示了#strong[非负可测函数的极限的积分等于积分的极限, 可以把取极限和积分这两个操作进行换序.]

]
以下为一个应用 MCT 得到的结论.

#example(
)[
取 $ \(bb(N)\,cal(P)\(bb(N)\)\,mu_(c o u n t i n g)\) $
于是$ L^(+)\(mu\)= { f : bb(N) arrow.r\[0\,oo\]} $
是所有的从自然数到 reals 的函数. (因为我们取了 power set 作为 $sigma$-algebra)

注意到任何一个这样的函数都可以被 $ phi.alt_n := sum_(j = 1)^n f\(j\)mu\({ j }\)= sum_(j = 1)^n f\(j\) $ 来逼近. 从而 $ integral f = sum_(j = 1)^oo f\(j\)in\[0\,oo\] $
如果取一个从下逼近 $f$ 的可测函数序列 ${ f_n }_(n in bb(N))$, 那么 by MCT, 我们总有:
$ sum_1^oo f_n\(j\)arrow.tr sum_1^oo f\(j\) $

]
=== \(countable) linearity of integral
<countable-linearity-of-integral>
#corollary(
)[
$ f\,g in L^(+)\(mu\)quad arrow.r.double quad integral\(f + g\)= integral f + integral g $

]
#proof[
使用 approximation by simple functions 以及 MCT.
取 $ phi.alt_n arrow.tr f\,quad psi_n arrow.tr g $, 从而 $ phi.alt_n + psi_n arrow.tr f + g $, 从而我们有 $ integral\(f + g\)=^(M C T) lim_n integral\(phi.alt_n + psi_n\) $
从而由 simple function 的 Linearity 得到:$ integral\(f + g\)= lim_n integral phi.alt_n + lim_n integral psi_n $
并且由于 $ integral phi.alt_n arrow.tr integral f\,integral psi_n arrow.tr integral g $
我们得到:
$ integral\(f + g\)gt.eq integral f + integral g $
另一方向 trivial.

]
#remark[
由此可见,

#strong[$f mapsto integral f$ 是 $bb(R)$-linear 的映射.]

]
=== Tonelli for sum and integrals
<tonelli-for-sum-and-integrals>
#corollary(
  title: [#kn[Tonelli for sum and integrals]],
)[
for ${ f_i }_(i in bb(N))$ in $L^(+)\(mu\)$, 有:
$ integral sum_(i = 1)^oo f_i = sum_(i = 1)^oo integral f_i $

]
#proof[
Apply MCT to
$ g_n = sum_(i = 1)^n f_i $ 可得证.

]
#remark[
这是 linearity of integral 的 countable version. \ 由此可见 MCT 的用处很大.

]
== properties of integration on $L^(+)\(mu\)$ \[Fol 2.2, finished\]
<properties-of-integration-on-lmu-fol-2.2-finished>
=== Fatou's Lemma
<fatous-lemma>
#theorem(
  title: [#kn[Fatou's Lemma]],
)[
令 $\(f_n\)$ be a seq of functions in $L^(+)\(mu\)$, then $ liminf_n integral f_n gt.eq integral liminf_n f_n $

]
#proof[
Set $ g_n := inf_(m gt.eq n) f_n $于是 $ g_n arrow.tr liminf_n f_n $
于是 #strong[by MCT], we have: $ lim_n integral g_n = integral lim_n g_n = integral liminf_n f_n $
By def, 我们有 $g_n lt.eq f_n #h(0em) #h(0em) forall n$, 于是 by monotonicity, $integral g_n lt.eq integral f_n$. 因而 $ liminf_n integral f_n gt.eq liminf_n integral g_n = lim_n integral g_n = integral liminf_n f_n $

]
#remark[
对于 increasing 的从而有 limit 的可测 $\(f_n\)$, 我们可以使用 MCT.

但是对于任意的可测 $\(f_n\)$, 我们无法使用 MCT, 不过有弱化的版本 Fatou's Lemma. 它表示#strong[下极限的积分 小于等于 积分的下极限].

这是一个符合直觉的事情, 因为取函数的 pointwise 极限是一个很容易极端的事情.

积分的极限是一个 numerical seq 的极限, 比较 robust. 而函数的逐点极限是一个比较不稳定的事情, #strong[在对函数逐点极限的过程中, 它的 \"质量\" 会存在一个比较大的损失, 因为其中可能包含了 uncountably many 个点的函数值的逐点极限的累积, 而积分的极限只是单个点的逐点极限. 因而大小关系很显然.]

]
#example(
)[
取 $\(bb(R)\,frak(L)\,m\)$, 考虑 $L^(+)\(m\)$ 上的函数, 即非负 Lebesgue 可测函数.

下面有几个非常经典的 Fatou's Lemma 的例子:

. #strong[escape to hat]: $ f_n = chi_(\(n\,n + 1\)) $
$f_n$ 在 $bb(R)$ 上平移

. #strong[escape to width]: $ f_n = 1 / n chi_(\(0\,n\)) $
$f_n$逐渐变得平坦

. #strong[escape to height]: $ f_n = n chi_(\(0\,1 / n\)) $
$f_n$ 逐渐变成一根针.

这三个例子中都有 $f_n arrow.r 0$ pointwisely. 因而 $ integral lim f_n = 0 $, 而 $ lim integral f_n = 1 $, 因为对于所有 $f_n$ 都有 $integral f_n = 1$

]
=== Chebyshev's inequality with corollaries
<chebyshevs-inequality-with-corollaries>
#lemma(
  title: [#kn[Chebyshev's inequality]],
)[
对于 measure space $\(X\,cal(M)\,mu\)$, #ref[markov-inequality] 在本处以非负函数的 measure-space 形式使用：如果 $f in L^(+)\(mu\)$ 并且 $c > 0$, 那么
$ mu { f gt.eq c } lt.eq 1 / c integral f $

]
#proof[
Let $E := mu { f gt.eq c }$
$ integral f gt.eq integral f chi_E gt.eq integral c chi_E = c integral chi_E = c mu\(E\) $

]
#remark[
一个可测集的测度, 就等于 constant 1 在它上面的积分, by definition.

这是一个简单而常用的结论.

]
#proposition(
  title: [#kn[非负函数积分为 0 等价于几乎处处为 0]],
)[
令 $f in L^(+)\(mu\)$, 有:

$integral f = 0$ $arrow.l.r.double$ $f = 0$ a.e. (即只在一个零测集上非 0)

]
#proof[
forward direction: directly follows from Chebyshev: set $A_n := { f gt.eq 1 / n }$, 对于任意 $n$ 都有 $mu\(A_n\)lt.eq n integral f = 0$. 从而 by ctn from below, $> 0$ 处构成零测集.

backward direction: 对于 simple function, trivial by 积分的定义; 对于 general $f$, 通过 limit 得到 (它下方的所有 simple functions 也 a.e. 为 0 从而积分为 0).

]
#corollary(
  title: [几乎处处相等的非负函数积分相等],
)[
Let $f\,g in L^(+)\(mu\)$ 且 $f = g$ a.e., 则有 $ integral f = integral g $

]
#proof[
Set $D : = { x divides f\(x\)eq.not g\(x\)}$, 则 $mu\(D\)= 0$ by def
$ integral f = integral_D f + integral_(D^c) f = 0 + integral_(D^c) g = integral g $

]
#corollary(
  title: [#kn[liminf version of MCT]],
)[
suppose $\(f_n\)_(n in bb(N))$ 是一个 seq of functions in $L^(+)\(mu\)$, 且 $f_n arrow.r f in L^(+)\(mu\)$, 则:
$ liminf_n integral f_n gt.eq integral f $

]
#proof[
这是一个条件稍微弱化的 MCT: 把 $f_n arrow.tr f$ 的条件改成了 $f_n arrow.r f$ a.e., 得到的结论也稍弱化. \ #strong[modify $f_n$ and $f$ on a null set] (thus without chaning the integral) 后, follows directly from #strong[Fatou's lemma],

]
#theorem(
  title: [#kn[积分收敛 $arrow.r.double.long$ 发散点集零测, 以及 support $sigma$-finite]],
)[
如果 $f in L^(+)\(mu\)$ 且 $\|integral f\|< oo$, 则有: $ mu\({ x in X divides f\(x\)= oo }\)= 0 $ 并且 $ { x divides f\(x\)> 0 } $ is #strong[$sigma$-finite]

]
#proof[
直接 follows from Chebyshev. 取 $ A_t := { x divides f\(x\)gt.eq t } $ for $t > 0$.

于是: $ { x in X divides f\(x\)= oo } = inter.big_(n = 1)^oo A_n $
By Chebyshev, each $A_n$ 都有: $mu\(A_n\)lt.eq 1 / n integral t$, 从而 by continuous from above 可得这个交集的 measure 为 0.

又有:$ { x in X divides f\(x\)> 0 } = union.big_(n = 1)^oo A_(1 / n) $
其中, each set has measure $lt.eq n integral f lt.eq oo$. By def, 这个集合 $sigma$-finite.

]
