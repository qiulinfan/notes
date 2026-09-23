#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= Radon-Nikodym theorem
<radon-nikodym-theorem>
== Radon-Nikodym Theorem \[Fol 3.2\]
<radon-nikodym-theorem-fol-3.2>
以下是两个 instructive 的 questions: \ Question 1: Given 三个 s.m. on
$ mu = m + sum_(j = 1)^oo c_j delta_(x_j) + mu_(C a n t o r) $
on $\(bb(R)\,cal(B)\(bb(R)\)\)$, 我们可否从 $mu$ 中 recover 其中一个 measure, without 另外两个 measure?
$ mu_(C a n t o r) =\(?\)mu $

Question 2: 给定一个任意的 p.m. $mu$, 以及一个任意的 s.m. $nu$ on $\(X\,cal(A)\)$, \ 如何判断是否存在一个 $f in L^1\(mu\)$, 使得 $ nu\(E\)= integral_E f thin d mu $
以及, 如果存在, 如何找到这样的一个 $f$?

===  absolutely continuous: $nu lt.double mu$
<absolutely-continuous-nu-ll-mu>
#definition(
  title: [#kn[absolute continuity of signed measures]],
)[
给定 p.m. $mu$ 和 #ref[signed measure] $nu$ on $\(X\,cal(A)\)$, 我们称 $nu$ is absolutely continuous w.r.t. $mu$, 如果 $ forall E in cal(A)\,quad mu\(E\)= 0 arrow.r.double.long nu\(E\)= 0 $
即: $nu$ 的 null sets 包含了 $mu$ 的所有 null sets. ($nu$ 拥有比 $mu$ 严格更多的 null sets) \ 写作 $ nu lt.double mu $

]
#figure(image("../assets/ch3-pics-absctn.png", width: 50.0%),
  caption: [
    mutually singular and absolutely continuous
  ]
)
#label("mutually singular and absolutely continuous")

#ref[mutually singular] 的记号 #strong[$nu tack.t mu$ 表示的是 $nu$ 和 $mu$ 出现变化的区域完全不同], 而 #strong[$nu lt.double mu$ 表示的是 $nu$ 出现变化的区域完全包括在 $mu$ 出现变化的区域里] (因为 $mu$ 不变化的区域被包括在 $nu$ 不变化的区域里).

#example(
)[
$f in L^1\(mu\)$, $nu\(E\): = integral_E f thin d mu$, 由积分定义出的 s.m., 总是满足 $ nu lt.double mu $

]
#example(
)[
$ nu_1 : = m\,quad nu_2 := sum_(j = 1)^oo c_j delta_(x_j)\,quad nu_3 : = mu_(C a n t o r) $
这三个 measure 有 $ nu_i ≪̸ nu_j quad forall i eq.not j $
它们是 mutually singular 的. 对于其中任意两个 $nu_i\,nu_j$, 本身已经存在一个划分使得 $nu_i$ 在 $E$ 上是 null 的而 $nu_j$ 在 $E^c$ 上是 null 的. 那么如果 $nu_i lt.double nu_j$, 则说明 $nu_i$ 在 $E^c$ 上也是 null 的, 那么 $nu_i$ 在整个 $X$ 上都是 null 的, 说明 $nu_i$ 是一个 trivial measure. \ 显然, 这里三个 measure 都不是 trivial measure, 因而它们之间没有 abs ctn 的关系.

]
#proposition(
  title: [#kn[absolutely continuous 的性质]],
)[
- 对 #ref[total variation measure], $ \|nu\|lt.double mu arrow.l.r.double nu^(+) lt.double mu upright(" and ") nu^(-) lt.double mu $\(容易证明)

- $ nu perp mu upright(" and ") nu lt.double mu arrow.r.double.long nu = 0 $\(刚才已经证明)

]
我们可以把 absolutely ctn 的概念从一个 s.m. wrt 一个 p.m. 扩展到一个 s.m. wrt 一个 s.m., by taking 后面这个 s.m. 的 total variation measure: $ upright("say ") nu lt.double mu\,upright(" if ") nu lt.double\|mu\| $
但是 Folland 表示我们之后并不需要用到这个更 general 的定义. 所以不用在意它.

=== $nu lt.double mu$ 的等价条件
<nu-ll-mu-的等价条件>
question: 为什么这个定义要叫做 absolutely continuous, 它和 continuous 这个词到底有什么关系. 下面这个 theorem 说明了这一点.

#theorem(
  title: [#kn[why it is called \"absolutely continuous\"]],
)[
令 $nu$ 为一个 #strong[finite s.m.], $mu$ 为一个 #strong[p.m.] on $\(X\,cal(A)\)$. \ Claim: $ nu lt.double mu arrow.l.r.double forall thin epsilon.alt > 0\,thin exists thin delta > 0 #h(0em) upright("s.t.") #h(0em)\|nu\(E\)\|< epsilon.alt upright(" whenever ") mu\(E\)< delta $

]
#remark[
类比: $f\(x\)$ is #strong[uniform ctn function] of $x$: 对于任意 $epsilon.alt$ 都存在 $delta$ 使得 $\|f\(y\)- f\(x\)\|< epsilon.alt$ whenever $\|x - y\|< delta$. \ 而 finite s.m. 的 absolutely ctn $nu lt.double mu$ 也是一个连续性表达: 我们以 measure $mu$ 作为集合大小的度量基准, #strong[对于任意集合, 对其进行很小的调整改变其 $mu$-大小 (比如去掉/并上一个 $mu$-小集合), $nu$ 的值的改变相对于这个 $mu$-大小调整是连续的. (可以更改这个$mu$-大小调整尺度, 使得 $nu$ 的值的改变任意小)] \ 我们经过思考可以发现, 这和我们之前说的 #strong[\"$nu lt.double mu$ 表示的是 $nu$ 出现变化的区域完全包括在 $mu$ 出现变化的区域里\" 是一致的], 因为这即说明对于 finite $nu$ 受到 $mu$ 的可控制性 (不存在失控的区域): 既然只有在 $mu$ 的 variation 区域才出现 variation, 那么取它们相对 variation 的最大比例, 那么总是可以通过 $mu$, 把 $nu$ 的 variation 控制在这个 variation 比例之上.

]
#proof[
\(i) to (ii): 我们使用反证, 利用 #strong[limsup]. \ Assume (i), 并 suppose for contradiction that (ii) 不成立. \ 那么存在 $epsilon.alt > 0$ s.t. 对于任意 $n in bb(N)$, 都存在一个 seq $E_n in cal(A)$ s.t. $mu\(E_n\)lt.eq 1 / 2^n$, $nu\(E_n\)gt.eq epsilon.alt$ for each $n$. \ Set $ E : = limsup_n E_n = inter.big_(n = 1)^oo union.big_(k = n)^oo E_k $
我们标记后面的每个集合为: $ F_n : = union.big_(k = n)^oo E_k $
于是 $ mu\(F_n\)lt.eq sum_(k = n)^oo 1 / 2^k = 1 / 2^n $
从而得到, $ mu\(E\)= 0 $
而由于 $nu\(F_n\)gt.eq epsilon.alt$ for each $n$, we have $ nu\(E\)gt.eq epsilon.alt $这与 $nu lt.double mu$ contradict. 从而得证: $nu lt.double mu arrow.r.double.long delta$-$epsilon.alt$ argument. \ 而 $delta$-$epsilon.alt$ argument $arrow.r.double.long$ $nu lt.double mu$ 是 trivial 的.

]
=== RN derivative and RN Thm
<rn-derivative-and-rn-thm>
=== RN derivative: (if exist) express how $nu$ can be induced from $mu$
<rn-derivative-if-exist-express-how-nu-can-be-induced-from-mu>
#definition(
  title: [#kn[Radon-Nikodym derivative]],
)[
对于 ${upright("p.m. ") mu\
upright("s.m. ") nu$ on $\(X\,cal(A)\)$, 如果存在一个 $cal(A)$-measurable $f$, 使得 $nu$ 为 the #strong[signed measure $nu$ induced by $mu$ and $f$:] $ nu\(E\)= integral_E f thin d mu\,quad forall E in cal(A) $
则称 #strong[$f$ is the Radon-Nikodym Derivative of $nu$ w.r.t. $mu$.] 写作 $ f = frac(d nu, d mu) $或者 $ d nu = f d mu $

]
Radon-Nikodym derivative $f$ 刻画的是#strong[在每一点 $x in X$ 上, signed 测度 $nu$ 相对于测度 $mu$ 的变化速率.] \ We sometimes call $nu$ #strong[the signed measure $f thin d mu$.] \

#example(
)[
取 LS measure $mu_F$ on $\(bb(R)\,cal(B)\(bb(R)\)\)$, with $F = e^(2 x)$. \ 那么: $ mu_F\(\(a\,b\)\)= e^(2 b) - e^(2 a) = integral_a^b 2 e^(2 x) thin d x $
我们可以 check: $ mu_F\(E\)= integral_E 2 e^(2 x) thin d x\,quad forall E in cal(B)\(bb(R)\) $
因而 $ frac(d mu_F, d m) = 2 e^(2 x) = F'\(x\) $

]
#proposition(
)[
任取 measure $mu$, 以及 extended $mu$-integrable function $f$, 那么the #strong[signed measure $nu$ induced by $mu$ and $f$] 即 $nu\(E\): = integral_E f thin d mu$ 一定有: $ nu lt.double mu $

]
#proof[
trivial.

]
Question: 我们如何判断这个 RN derivative 是否存在呢? Radon Nikodym Theorem 正是这个问题的答案.

=== RN Thm: $sigma$-finite $nu lt.double mu arrow.l.r.double$ 存在 RN derivative
<rn-thm-sigma-finite-nu-ll-mu-iff-存在-rn-derivative>
#theorem(
  title: [#kn[Radon-Nikodym Theorem]],
)[
对于 #ref[$sigma$-finite measure] ${upright("p.m. ") mu\
upright("s.m. ") nu$ on $\(X\,cal(A)\)$, $ nu lt.double mu arrow.l.r.double exists upright(" ext. ") mu upright("-intble ") f = frac(d nu, d mu) $
并且这个 RN derivative #strong[$f$ 是 #strong[unique 的, in $mu$-a.e. sense.]] (即在 $mu$ 的一个 null set 之外唯一).

]
Radon Nikodym Theorem 表示, 对于 $sigma$-finite 的 $nu$ 和 $mu$, RN derivative 存在(并且一定唯一)当且仅当 $nu lt.double mu$. 即对于任意两个 abs ctn 的 measure, 只要它们 $sigma$-finite, 就可以用一个具体的函数 $f$ 来表达它们之间的关系. \ 要证明 RN Theorem, 我们还需要一些 Lemma.

#lemma(
)[
如果 $nu\,mu$ 都是 #strong[finite positive] measure on $\(X\,cal(A)\)$ 并且 $mu ⟂̸ nu$, 那么一定存在 $epsilon.alt > 0$ 以及 $E in cal(A)$ with $mu\(E\)> 0$ s.t. $ nu gt.eq epsilon.alt mu quad upright("on ") E $

]
#proof[
We look at $nu - 1 / n mu$ for each $n in bb(N)$. 它们都是 finite signed measure for sure. \ 考虑 #ref[Hahn Decomposition Theorem] 给出的 $P_n union.sq N_n$ for each $n$. 并 set: $ P : = union.big_n P_n\,quad N : = inter.big_n N_n = P^c $
于是: $N$ 对于任意 $n$, 都是 $nu - 1 / n mu$ 的 negative set. \ 这说明: $ forall n\,thin thin 0 lt.eq nu\(N\)lt.eq 1 / n mu\(N\) $
因而一定有: $ nu\(N\)= 0 $
(这是显然的, 因为 $N$ intersect 了所有的 $nu - 1 / n mu$ 的负集, 在 $n$ 大的时候这个 diff measure 基本等于 $nu$, 而 $nu$ 本身是 positive 的, 那么显然 $nu\(N\)= 0$\.) \ Case 1: 如果 $mu\(P\)= 0$, 那么 $mu tack.t nu$. \ Case 2: Otherwise then 存在某个 $mu\(P_n\)> 0$, 说明 $P_n$ 是 $nu - 1 / n mu$ 的 positive set, 因而在 $P_n$ 上, $nu gt.eq 1 / n mu$.

]
这个 Lemma 表明, 对于两个 positive measures, 它们要么 mutually singular, 要么一定存在某个 nontrivial 的集合上, 一个能够以一定比例 bound 另外一个. \ 这是因为, 只要这两个 positive measures 不是 mutually singular 的 (说明它们有共同的存在变化的区域), 那么 note that positive measure 随着集合增大一定是增大的, 因而直觉上肯定存在某个子集, 使得其上, 它们其中一个能够以一定比例 bound 另外一个. \ 现在我们证明 RN Thm:

#proof[
#strong[of RN Thm:] \ #strong[Step 1: 首先确认 uniqueness, if exist.] \ 首先我们 assume $nu\,mu$ 都是 finite p.m. \ 我们先 verity #strong[uniqueness]: 假设 $ d nu = f_1 thin d mu = f_2 thin d mu\,quad f_i upright(" ext. ") mu upright("-intble") $
那么令 $g : = f_1 - f_2$, 有$ integral_E g thin d mu = 0 quad forall E in cal(A) $所以 $g = 0$ a.e. \ This shows the uniqueness. \ 然后我们 verity #strong[existence]: \ 我们考虑 $ cal(F) : = { f in L^(+)\(mu\): integral_E f thin d mu lt.eq nu\(E\)\,#h(0em) forall E in cal(A) } $
We can define partial order on $cal(F)$: 称 $f_1 lt.eq f_2$ if $f_1\(x\)gt.eq f_2\(x\)$ for a.e. $x$. \ 显然 $f = 0$ 是 $cal(F)$ 中最小的元素.
Idea: 我们想要得到 $cal(F)$ 中最大的元素 $f_(m a x)$, 看看是否能取到总是有 $ integral_E f_(m a x) d mu = nu\(E\) $#strong[Step 2: Claim] $f_1\,f_2 in cal(F) arrow.r.double.long f := max { f_1\,f_2 } in cal(F)$ \ Proof of Claim: for fixed $f_1\,f_2$, 考虑 $A : = { f_1 > f_2 }$. 任取 $E in cal(A)$, 有: $ integral_E f thin d mu = integral_(E inter A) f_1 thin d mu + integral_(E inter A^c) f_2 thin d mu lt.eq nu\(E inter A\)+ nu\(E inter A^c\)= nu\(E\) $
Claim proved. \ #strong[Step 3: 构造出 potential RN derivative: 最大的元素 $f in cal(F)$]
现在我们 set $ a : = sup { integral f thin d mu divides f in cal(F) } $
显然有: $ 1 lt.eq a lt.eq nu\(X\) $ pick $g_n in cal(F)$ s.t. $integral g_n thin d mu arrow.tr a$, 并且 set$ f_n : = max { g_1\,dots.h.c\,g_n } $for each $n$. \ 显然有: $ f_n lt.eq f_(n + 1)\,quad integral f_n thin d mu arrow.tr a $ 并且根据我们的 claim, 所有 $f_n in cal(F)$. \ 根据可测函数的性质, $ exists f : = lim_n f_n in L^(+)\(mu\)\,upright(" and ") in L^1\(mu\)upright(" (since ") mu upright(" finite)") $并且根据 #ref[monotone convergence theorem]（MCT）, $ integral f thin d mu = lim_(n arrow.r oo) integral f_n thin d mu = a $
并且, 对于任意 $E$ measurable, 根据 MCT 也有 $ integral_E f thin d mu = lim_(n arrow.r oo) integral_E f_n thin d mu lt.eq nu\(E\) $我们 set: $ nu'\(E\): = integral_E f thin d mu $
#strong[Step 4: 证明 $nu' = nu$.] \ Proof: 首先我们知道 by def $nu' lt.eq nu$. \ Set: $ tilde(nu) : = nu - nu' gt.eq 0 $By our assumption $nu lt.double mu$, 从而也有 $tilde(nu) lt.double mu$. \ 因而只需要证明 $tilde(nu) tack.t mu$, 就可以得到 $tilde(nu) = 0$, 从而证明出 $nu' = nu$. \ 这个时候 Lemma 就起了作用: \ Suppose for contradictin that $tilde(nu) ⟂̸ mu$, 那么 by lemma, 由于 $tilde(nu)$ 是一个 finite positive measure, $mu$ 也是一个 finite positive measure, 则存在 $epsilon.alt > 0$ 和 nontrivial measurable $E$, 使得 $tilde(nu) gt.eq epsilon.alt mu$ on $E$. \ 于是: $ g : = f + epsilon.alt chi_E in cal(F) $
而 $integral f thin d mu = a$, 因而 $ integral g thin d mu > a $这和 $g in cal(F)$ 冲突 (否则它的积分一定小于等于 $a$). \ #strong[从而, $mu\,nu$ 是 finite p.m. 的情况得证.] \ #strong[Step 5: 推广至 $nu$ finite s.m., $mu$ finite p.m. 的情况.] \ 由 #ref[Jordan decomposition theorem] 写出 $nu^(+)\,nu^(-)$, 再直接 Apply Step 1 即得证. \ #strong[Step 6: 推广至 $nu\,mu$ $sigma$-finite 的情况.] \ Proof: By $sigma$-finite 的定义, 我们可以 decompose $ X = union.sq.big_(n = 1)^oo X_n $
那么 by finite case, $nu\|_(X_n)$, $mu\|_(X_n)$ is finite for each $n$. \ 因而 $ f_n : = frac(d\(nu\|_(X_n)\), d\(mu\|_(X_n)\)) thin thin exists quad upright(" for each ") n $
于是, take $ f : = sum_(n = 1)^oo upright(bold(1))_(X_n) f_n $即可得证. \ #strong[Note: 这里的 $f$ 是 ext $mu$-intble 的, 即: $f^(+)\,f^(-)$ 至少有一个是 ext $mu$-intble 的. 这 follows from $nu$ 作为一个 signed measure 的定义: $nu$ 至多 admit $+ oo\,- oo$ 中的一个. \ Specially, 如果 $nu$ 是一个 positive measure, 那么 $f$ 一定也是非负的, 从而 $f^(-) = 0$.]

]
#remark[
在 RN Thm 的 proof 中, 我们的大体思路就是: 首先, 肯定要 reduce to 我们熟悉的 finite positive measure 的情况; 其次, 我们使用一个 trick: 取一个能够逐步逼近 RN derivative $frac(d nu, d mu)$ 的空间$ cal(F) : = { f in L^(+)\(mu\): integral_E f thin d mu lt.eq nu\(E\)\,#h(0em) forall E in cal(A) } $并猜想其最大的元素就是 $frac(d nu, d mu)$, 然后证明它们确实相等, by proving 它们的差是一个 zero measure.

]
下一个 lecture: 我们将 upgrade RN Thm to 一个更加 general 的 version: Lebesgue Radon Nikodym Thm.

== Lebesgue-Radon-Nikodym Theorem \[Fol 3.2, finished; 3.3, finished\]
<lebesgue-radon-nikodym-theorem-fol-3.2-finished-3.3-finished>
recall Radon-Nikodym Theorem: $ {mu #h(0em) sigma upright("-finite p.m.")\
nu #h(0em) sigma upright("-finite s.m.")\
nu lt.double mu arrow.r.double.long {exists ! #h(0em) upright("extended ") mu upright("-integrable") #h(0em) f : X arrow.r bb(R)\
d nu = f d mu $
我们称 $f$ 为 Radon-Nikodym Derivative:$ nu\(E\)= integral_E f #h(0em) d mu $

#example(
)[
Application: conditional expectation. \ $ \(X\,cal(A)\,mu\):= \(\[0\,1\)\,cal(B)\(\[0\,1\)\)\,m \) $
$f :\[0\,1\)arrow.r bb(R)$ Borel measurable. \ Define: $ B : = { diameter\,\[0\,1 / 2\)\,\[1 / 2\,1\)\,X } $
$f$ 并非一定是 $B$-measurable 的.

]
=== LRNT: 任意 $sigma$-finite $nu\,mu$, 可将 $nu$ 拆解成 $lambda tack.t mu$ 和 $rho lt.double mu$
<lrnt-任意-sigma-finite-numu-可将-nu-拆解成-lambda-bot-mu-和-rho-ll-mu>
#theorem(
  title: [#kn[Lebesgue-Radon-Nikodym Theorem]],
)[
如果 ${mu #h(0em) sigma upright("-finite p.m.")\
nu #h(0em) sigma upright("-finite s.m.")$ on $\(X\,cal(A)\)$, 那么存在唯一的 decomposition $ nu = lambda + rho $where $lambda\,rho$ 是 $sigma$-finite 的 signed measure s.t. ${lambda tack.t mu\
rho lt.double mu$. \ (于是, by RNT, 存在 $mu$-unique 的 extended $mu$-integrable $f : X arrow.r bb(R)$ s.t. $d rho = f thin d mu$ ).

]
Sktech of proof of LRN theorem:
Assume for simplicity that $mu\,nu$ 是 finite p.m. \ Like last time, look at $ cal(F) : = { f in L^(+) : integral_E f thin d mu lt.eq nu\(E\)#h(0em) #h(0em) forall E in cal(A) }\/tilde.op $
Saw: $cal(F)$ 有 max element $f$. \ Define $rho$ by $d rho = f thin d mu$. \ Set: $ lambda : = nu - rho $
Want: $lambda tack.t mu$. \ Prove by contradiction: 如果 $lambda ⟂̸ mu$, 那么Lemma 2 告诉我们: 存在 $epsilon.alt > 0$ 和 positive measure 的 $E in cal(A)$ 使得: $ lambda gt.eq epsilon.alt mu $
on $E$. \ Set $ g : = f + epsilon.alt chi_E $
则 $ integral_F g thin d mu = integral_(F inter E)\(f + epsilon.alt\)thin d mu thin + thin integral_(F inter E^c) f thin d mu $
因而 $ rho\(F inter E\)+ epsilon.alt mu\(F inter E\)+ rho\(F inter E^c\) & = rho\(F\)+ epsilon.alt mu\(F inter E\)\
 & lt.eq nu\(F\)- epsilon.alt mu\(F\)+ epsilon.alt mu\(F inter E\)\
 & lt.eq nu\(F\) $
因而 $g in cal(F)$ 且 $g > f$. \ 从而得证 $lambda tack.t mu$. 从而 existence proved. \ Uniqueness part: Suppose we have $ nu = lambda_1 + rho_1 = lambda_2 + rho_2 $
where $lambda_i tack.t mu$, $rho_i lt.double mu$.
那么 $ lambda_1 - lambda_2 = rho_2 - rho_1 $
我们知道, $lambda_1 - lambda_2$ 和 $rho_2 - rho_1$ 也是 signed measures. 并且,
$ \(lambda_1 - lambda_2\)tack.t mu\,quad\(rho_2 - rho_1\)lt.double mu $
By Lemma 1: $ lambda_1 - lambda_2 = rho_2 - rho_1 = 0 $

Properties of the RN derivative:
(P91 in Folland)
$ frac(d\(nu_1 + nu_2\), d mu) = frac(d nu_1, d mu) + frac(d nu_2, d mu) $
$ nu lt.double mu\,mu lt.double mu arrow.r.double.long frac(d nu, d mu) frac(d mu, d nu) = 1 $
$mu$-a.e. = $nu$-a.e.

=== complex measure 以及 complex version of LRNT
<complex-measure-以及-complex-version-of-lrnt>
#definition(
  title: [#kn[complex measure]],
)[
一个 complex measure on a measurable space $\(X\,cal(A)\)$ 是一个 map $nu : cal(A) arrow.r bb(C)$ satisfying $nu\(diameter\)= 0$ 以及 ctbl disjoint additivity.

]
#example(
)[
simple complex measures:

$X = { 1\,2\,dots.h.c\,n }$
$nu$ p/s/c measure on $X$. \ Since $X = { 1\,2\,dots.h\,n }$, a complex measure $nu$ is just a function
$ nu_0 : X arrow.r bb(C)\,quad upright("i.e., ") nu_0 =\(nu_1\,dots.h\,nu_n\)in bb(C)^n . $而 $ nu\(E\)= sum_(x in E) nu_0\(x\) $

$nu$ positive: $in bb(R)_(+)^n$
$nu$ signed: $in bb(R)^n$

For discrete spaces, the total variation measure is defined pointwise:

$ \|nu\|\(i\):=\|nu_i\|\,quad upright("for each ") i = 1\,dots.h\,n . $

So the total variation measure $\|nu\|$ is just the vector of magnitudes:
$ \|nu\|=\(\|nu_1\|\,\|nu_2\|\,dots.h\,\|nu_n\|\). $

What is $frac(d nu, d\|nu\|)$?

Since this is a finite discrete setting, the Radon-Nikodym derivative is computed \*\*pointwise\*\*:
$ (frac(d nu, d\|nu\|))\(i\)= cases(delim: "{", frac(nu_i, \|nu_i\|) & upright("if ") nu_i eq.not 0\,, 0 & upright("if ") nu_i = 0 .) $

So the result is a function $f : X arrow.r bb(C)$, given by:

$ f\(i\)= cases(delim: "{", frac(nu_i, \|nu_i\|) & upright("if ") nu_i eq.not 0\,, 0 & upright("if ") nu_i = 0 .) $

$ f := frac(d nu, d\|nu\|) = (frac(nu_1, \|nu_1\|) \, frac(nu_2, \|nu_2\|) \, dots.h \, frac(nu_n, \|nu_n\|))\,quad upright("with the convention ") 0 / 0 := 0 . $

This derivative is a function that lives on the unit circle in $bb(C)$ (except at zero), and it satisfies:
$ \|f\(i\)\|= 1 quad upright("whenever ") nu_i eq.not 0 . $

]
