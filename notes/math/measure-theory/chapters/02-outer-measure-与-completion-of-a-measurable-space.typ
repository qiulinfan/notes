#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= outer measure 与 completion of a measurable space
<outer-measure-与-completion-of-a-measurable-space>
== complete measure space and outer measure \[Fol 1.3, finished; 1.4\]
<complete-measure-space-and-outer-measure-fol-1.3-finished-1.4>
#definition(
  title: [#kn[null set], #kn[subnull set], #kn[almost everywhere]],
)[
对于 #ref[measure space] $\(X\,cal(M)\,mu\)$, 其中 $mu$ 是相应的 #ref[measure],

+ 我们称 $A in cal(M)$ 为一个 #strong[null set], 如果 $mu\(A\)= 0$\;

+ 我们称 $B subset.eq X$ 为一个 #strong[subnull set], 如果存在某个 null set $A$ containing it.

+ 我们称一个 statement about $X$ 是 #strong[almost everywhere (a.e.)] 的, 如果这个 statement 除了在某个 null set 上之外, 在 $X$ 上处处成立.

]
#definition(
  title: [#kn[complete measure space]],
)[
我们称 $\(X\,cal(M)\,mu\)$ 是一个 complete measure space, 如果它其中的任意 subnull set 都是 null set. (即它 measurable)

]
#remark[
我们知道, 根据 measure 的 monotonicity, subnull set 的 measure, 如果存在, 一定是 $lt.eq$ 它所在的 null set 的, 即一定 $= 0$. 所以 complete measure space 的实际意思是： 这个 measure space 里, 任意 null set 的所有子集都是 measurable 的, 即所有足够小的集合都在这个 $sigma$-algebra 里.

]
#example(
)[
一个 not complete 的 measure space 的例子:
$ X = { 1\,2 }\,cal(M) = nothing\,X\,mu\(forall\)= 0 . $
这个例子中, ${ 1 }\,{ 2 }$ 这两个集合不是 measurable 的, 但是却是 nullset (全集) 的子集.

]
#theorem(
  title: [#kn[every measure space can be completed]],
)[
Suppose $\(X\,cal(M)\,mu\)$ is a measure space. \ Let
$ cal(N) := { upright("all null sets in ") cal(M) } $
Claim:
$ accent(M, macron) := { E union F divides E in cal(M)\,F subset.eq N upright(" for some ") N in cal(N) } $
is a $sigma$-algebra, 并且在 $accent(cal(M), macron)$ 上存在一个 unique 的 extension $accent(mu, macron)$ of $mu$.

]
#proof[
这一部分的 proof 以及 remark 在 hw2. 这里, $accent(M, macron)$ 称为 #strong[completion of $cal(M)$ with respect to $mu$], 以及 $accent(mu, macron)$ 称为 #strong[completion of $mu$.]

]
=== outer measure
<outer-measure>
#definition(
  title: [#kn[outer measure]],
)[
An outer measure on $X$ is a function $mu^(*) : cal(P)\(X\)arrow.r\[0\,oo\)$ such that

+ $mu\(diameter\)= 0$

+ monotone ($A subset B arrow.r.double.long mu^(*)\(A\)lt.eq mu^(*)\(B\)$)

+ countable subadditive ($mu^(*)\(union.big_(i = 1)^oo E_i\)lt.eq sum_(i = 1)^oo mu^(*)\(E_i\)$)

]
#remark[
我们对比 measure 和 outer measure 的定义:
measure 的条件比 outer measure 强在:

+ measure 是定义在一个严格的 $sigma$-algebra 上的, 而 outer measure 则是定义在整个幂集上的.

+ measure 要求 disjoint countable additivity, outer measure 并不要求

]
在这两个条件的缩减下, 我们规定 outer measure 具有 monotonicity 和 countable subadditivity. 注意: measure 本身也有这个性质, 这是 measure 的 countable additivity 的推论. \ outer measure 的意义在于, 我们的 measure 只定义在 $sigma$-algebra 上, 而我们想要给每个子集都赋予一个近似于测度的东西.

=== induce outer measure out of a \"elementary length function\"
<induce-outer-measure-out-of-a-elementary-length-function>
#theorem(
  title: [#kn[construct outer measure out of an \"elementary length function\"]],
  id: "thm-02-outer-measure-completion-of-a-measurable-space-construct-outer-measure-out-of-an-elementary-length-function",
)[
另 $cal(E) subset.eq cal(P)\(X\)$ 为一个包含 $diameter\,X$ 的集合, 并定义 $rho : cal(E) arrow.r\[0\,oo\)$ 为一个满足 $rho\(diameter\)= 0$ 的函数, 则
$ mu^(*)\(A\)= inf { sum_(i = 1)^oo rho\(E_i\)divides E_i in cal(E) upright(" for each i and ") A subset.eq union.big_(i = 1)^oo E_i } $
is an outer measure.

]
#proof[

+ 取所有 $E_j = diameter$, 得到 $mu^(*)\(diameter\)= 0$

+ monotonicity 显然, 因为如果 $A subset.eq B$, 那么 $A$ 取 inf 的这个集合是包含于 $B$ 的, 因而取到的 inf 是小于等于的.

+ 证明 ctbl subadditivity, 我们使用经典的 $epsilon.alt\/2^i$ argument. 这个 statement 直观上是显然的, 因为对一个 seq of sets, 每一个里面都有一个 seq of covering, 那么这个 seq of seq of covering 总体也是这个 seq union 的一个 covering. 不过我们不能这么说, 因为这里有一个 inf 操作的换序. 所以我们令 $epsilon.alt > 0$, 对于每个 $A_i$ 的 covering $\(E_(i\,k)\)_(k in bb(N))$, 我们令 $sum_k rho\(E_(i\,k)\)lt.eq mu^(*)\(A_i\)+ epsilon.alt\/2^i$, 最后可以得到 $mu^(*)\(union.big_i A_i\)lt.eq sum_i mu^(*)\(A_i\)$. 由于 $epsilon.alt$ arbitrary, 得证.

]
#example(
)[
我们取 $cal(E)$ 为 $bb(R)$ 上所有的 intervals, 并取 $rho$ 为 interval 的 length, 就得到了一个外测度. (也就是 Lebesgue outer measure)

]
== $mu^(*)$-measurability and Carathéodory's Theorem \[Fol 1.4\]
<mu-measurability-and-carathéodorys-theorem-fol-1.4>
=== $mu^(*)$-measurable
<mu-measurable>
#definition(
  title: [#kn[$mu^(*)$-measurable]],
)[
Given outer measure $mu^(*)$, 我们称 $A subset.eq X$ 是 $mu^(*)$-measurable 的, if:
$ mu^(*)\(E\)= mu^(*)\(E inter A\)+ mu^(*)\(E inter A^c\) $

]
#remark[
countable subadditivity 蕴含的信息是: 如果我们把一个集合 divide 成几部分, #strong[其 outer measure 有可能 increase.] 而 $mu^(*)$-measurable 的含义是: 任何一个其他集合, 分割为和 $E$ 重合以及和 $E$ 的两部分之后, 其 measure 都不会增大. \ #strong[Note:] #strong[by subaddivity, must have $mu^(*)\(E\)lt.eq mu^(*)\(E inter A\)+ mu^(*)\(E inter A^c\)$], 而 $mu^(*)$-measurable 的集合, 则有 equality 总是成立. \ 同时注意: 这个行为对于 complement 是对称的.

]
#remark[
outer measure 是对于整个 power set 中每一个集合都赋予的, 并且其性质 ctbl subadditivity 严格弱于 countable additivity.
我们自然想到: 是否有一个 power set 的子集, 其不仅是一个 $sigma$-algebra, 并且其上满足 countable additivity? 如果存在, 那么我们就从 outer measure induce 出了 measure. \ 再加上之前的用随意的 length function 来 induce outer measure 的方法, 我们就可以通过一个随意的 length function $arrow.r$ outer measre $arrow.r$ measure. (eg: 从 box length induce 出 Legesgue outer measure, 再 induce 出 Lebesgue measure). \ 而实际上这个想法是正确的. 只要把 $mu^(*)$ 的范围限制在所有 $mu^(*)$-measurable sets 上, 就形成了 $sigma$-algebra, 并且其 restriction 是一个 measure, 甚至是一个 complete measure.

]
=== Carathéodory's Theorem
<carathéodorys-theorem>
#theorem(
  title: [#kn[Carathéodory theorem]],
  id: "thm-02-outer-measure-completion-of-a-measurable-space-theorem-003",
)[
对于任意的 outer measure $mu^(*)$,
$ cal(M) := { upright("all ") mu^(*) upright("-measurable sets") } $#strong[is a #ref[$sigma$-algebra]]. \ 并且, $mu^(*)\|_(cal(M))$ #strong[is a complete measure.]

]
#proof[
我们首先证明这个 $cal(M)$ 是一个 $sigma$-algebra

+ $diameter in cal(M)$ by def.

+ $cal(M)$ closed under complement, by def of $mu^(*)$-measurablity. (它对于 complement 是对称的.)

+ 为证明 $cal(M)$ closed under countable union, 我们首先 prove it for two sets.
  假设 $A\,B in cal(M)$, 且 disjoint.
  Let $E subset.eq X$.
  我们已知
  $ mu^(*)\(E\)= mu^(*)\(E inter A\)+ mu^(*)\(E inter A^c\) $
  #strong[我们 WTS: $mu^(*)\(E\)= mu^(*)\(E inter\(A union B\)\)+ mu^(*)\(E inter\(A union B\)^c\)$] \ 我们对于 $E inter A$, $E inter A^c$ 可以得到: $ mu^(*)\(E inter A\)= mu^(*)\(E inter A inter B\)+ mu^(*)\(E inter A inter B^c\) $

$ mu^(*)\(E inter A^c\)= mu^(*)\(E inter A inter B\)+ mu^(*)\(E inter A^c inter B^c\) $

By $A union B =\(A\\B\)union.sq\(A inter B\)union.sq\(B\\A\)$, 可以得到:
$ mu^(*)\(E inter\(A union B\)\)gt.eq mu^(*)\(E inter A inter B\)+ mu^(*)\(E inter A inter B^c\)+ mu^(*)\(E inter A^c inter B\) $
结合以上四个 equations 可以得到
$ mu^(*)\(E\)gt.eq mu^(*)\(E inter\(A union B\)\)+ mu^(*)\(E inter\(A union B^c\)\) $
又 $lt.eq$ by countable subadditivity 成立, 我们得证 closed under two union (从而 inductively closed under any finite union, $cal(M)$ 因而是一个 algebra). \

#remark[
\(Note: 这里我会想: 证明了这个 statement for any union of two sets 不就是证明了它对 any union 都成立吗? 实则不然, 因为 set union 的从属关系并不是可以从对任意 $n$ 成立推广到对无穷成立, 因为这里的无穷是一个真实存在的 sequence, 而我们可以从\"任意 $n$ 成立推广到对无穷成立\" 的是比较数值大小, 因为 infinite series sum 的定义就是 limit, 而 set union 并没有 limit. 所以这里不能够直接得证.) \ \

]
\(Continuing the proof:)
现在我们再把这个 closed under finite union 推广到 closed under countable union, 以映证 $cal(M)$ 是一个 $sigma$-algebra. 注意到 #strong[STS (suffices to show): $cal(M)$ closed under countable disjoint union]. 因为任意不 disjoint 的两个集合都可以拆分成三个 disjoint 的集合. \ 我们令 $\(A_i\)$ 为一个 $cal(M)$ 中的 disjoint sequence, 并定义 $B_n := union.big_(i = 1)^n A_i$, 我们由上一步的结论知道, $B_n in cal(M)$ for all $n$.
Define $B := union.big_(i = 1)^oo A_i$, Let $E subset.eq X$, WTS: $mu^(*)\(E\)= mu^(*)\(E inter B\)+ mu^(*)\(E inter B^c\)$. \ 考虑 $mu^(*)\(E inter B_n\)= mu^(*)\(E inter B_n inter A_n\)+ mu^(*)\(E inter B_n inter A_n^c\)= mu^(*)\(E inter A_n\)+ mu^(*)\(E inter B_(n - 1)\)$, 因为 inductively 可得到:
$ mu^(*)\(E inter B_n\)= sum_(i = 1)^n mu^(*)\(E inter A_i\) $
从而：
$ mu^(*)\(E\)= mu^(*)\(E inter B_n\)+ mu^(*)\(E inter B_n^c\)gt.eq sum_(i = 1)^n mu^(*)\(E inter A_i\)+ mu^(*)\(E inter B^c\) $
by monotonicity ($mu^(*)\(E inter B_n^c\)gt.eq mu^(*)\(E inter B^c\)$), 这里是一个 infinite sum, 并且 true for every $n$, 因而可以推广到 infinity, 得到
$ mu^(*)\(E\)gt.eq sum_(i = 1)^oo mu^(*)\(E inter A_i\)+ mu^(*)\(E inter B^c\)gt.eq mu^(*)\(union.big_(i = 1)^oo\(E inter A_i\)\)+ mu^(*)\(E inter B^c\)= mu^(*)\(E inter B\)+ mu^(*)\(E inter B^c\)gt.eq mu^(*)\(E\) $

]
#strong[This finishes the proof of $cal(M)$ being a $sigma$-algebra.] 我们同时发现, $mu^(*)\|_(cal(M))$ 是一个 #strong[complete measure] on $cal(M)$ 是一个 trivial fact after the proof, 因为 taking $B = E$, 可以得到
$ mu^(*)\(B\)= sum_(i = 1)^oo mu^(*)\(A_i\) $
并且 by monotonicity, 对于任意的 $mu^(*)\(A\)= 0$, 任取 $E subset.eq X$, 都有
$ mu^(*)\(E\)lt.eq mu^(*)\(E inter A\)+ mu^(*)\(E inter A^c\)= mu^(*)\(E inter A^c\)lt.eq mu^(*)\(E\) $
因而
$ mu^(*)\(E\)= mu^(*)\(E inter A\)+ mu^(*)\(E inter A^c\) $
得到 $A in cal(M)$. 从而得证这是一个 complete measure. \

#remark[
证明 Carathéodory's Theorem 的 punchline 在于: 我们令 $\(A_i\)in cal(M)$ be a sequence, $B_n$ be its partial union for $n$ terms, 可以得到$ mu^(*)\(E inter B_n\)= mu^(*)\(E inter B_n inter A_n\)+ mu^(*)\(E inter B_n inter A_n^c\)= mu^(*)\(E inter A_n\)+ mu^(*)\(E inter B_(n - 1)\) $, 因为 inductively 可得到:
$ mu^(*)\(E inter B_n\)= sum_(i = 1)^n mu^(*)\(E inter A_i\) $
这个 statement 对于 $cal(M)$ 是 $sigma$-algebra 以及 $mu^(*)\|_(cal(M))$ 是 measure 的证明都很重要. 我们在 outer measure 的定义中, 只声明了 countable subadditivity, 而我们需要证明的是 countable diskjoint additivity, 也就是需要把不等式变成一个等式. \ 为此我们看到 $mu^(*)$-measurable 的定义 (Carathéodory condition) 中的等号, 并从中找到这个等式关系: #strong[通过 disjoint set sequence 上 inductively 对于前一项使用 Carathéodory condition, 得到 disjoint additivity.] (笔者的感觉是 Carathéodory condition 的直观看似不明显, 但是如果把一个 disjoint union 自身作为 $E$, 并把自身的某项作为 $A$, 就非常明显, 表示的是 disjoint measure sum 就是 measure of disjoint union.)

]
== premeasure and Hahn-Kolmogrov extension Theorem \[Fol 1.4, finished\]
<premeasure-and-hahn-kolmogrov-extension-theorem-fol-1.4-finished>
我们发现: 有些子集簇上的 \"length\" 很明显, 并且也符合 measure 的定义, 但是这个子集簇却并不构成一个 $sigma$-algebra. 比如:

#example(
)[
${ upright("all half-open, half-closed intervals") } subset.eq bb(R)$ 上, 以 interval 的 length 作为 measure, 很显然符合 measure function 的定义, 但是 ${ upright("all half-open, half-closed intervals") } subset.eq bb(R)$ 并不是一个 $sigma$-algebra, 因为它可以通过 ctbl union 出 open interval, 并不在这个子集簇中. 不过, 这是一个 algebra. \

]
因此, 我们想要一个方法来 #strong[extend a \"measure\" function on an algebra, to a measure on a $sigma$-algebra.]

#definition(
  title: [#kn[premeasure]],
)[
给定 $cal(P)\(X\)$ 上的一个 #ref[algebra of sets] $cal(A)_0$, 我们称 $mu_0 : cal(A)_0 arrow.r\[0\,+ oo\]$ 为一个 premeasure, if

+ $mu_0\(diameter\)= 0$

+ $mu_0$ ctbl disjoint additive in $cal(A)_0$

]
#remark[
premeasure 就是定义在 algebra instead of $sigma$-algebra 上的 measure. 显然, 通过和 measure 相同的方式可证明, premeasure 在 $cal(A)_0$ 上是 #strong[monotone 以及 ctbl subadditive 的.]

]
=== induce outer measure out of a premeasure: preserving $mu_0$ on $cal(A)_0$
<induce-outer-measure-out-of-a-premeasure-preserving-mu_0-on-mathcala_0>
#proposition(
  title: [#kn[premeasure extension via induced outer measure]],
  id: "prop-02-outer-measure-completion-of-a-measurable-space-proposition-001",
)[
Any premeasure can induce an outer measure:
$ mu^(*)\(E\)= inf { sum_(i = 1)^oo mu_0\(A_i\)divides A_i in cal(A)_0\,E subset.eq union.big_(i = 1)^oo A_i } $
并且, we have:
$ mu^(*)\|_(cal(A)_0)= mu_0 $
并且 #strong[every set in $cal(A)_0$ is $mu^(*)$-measurable.]

]
#proof[
#strong[这个 outer measure 的 construction directly follows from] @thm-02-outer-measure-completion-of-a-measurable-space-construct-outer-measure-out-of-an-elementary-length-function. \ #strong[Proof that $mu^(*)$ restricted to $cal(A)_0$ is $mu_0$]: 令 $E in cal(A)_0$, 假设 $E subset.eq union.big_(i = 1)^oo A_i$, 我们令 $B_n := E inter\(A_n\\ union.big_(i = 1)^(n - 1) A_i\)$, 即把 covering intersecting $E$ 变成 disjoint covering $\(B_n\)$, 从而由 $mu_0$ 的 ctbl disjoint additivity 可得, 这一个新 covering 的 measure sum $sum_(i = 1)^oo mu_0\(B_i\):= mu_0\(E\)$. 并且由于 $cal(A)_0$ 是一个 algebra, 这些 $B_n$ 也在 $cal(A)_0$ 里面, 从而它满足 monotonicty, then $mu_0\(E\)= sum_(i = 1)^oo mu_0\(B_i\)lt.eq sum_(i = 1)^oo mu_0\(A_i\)$ \ #strong[Proof that every set in $cal(A)_0$ is $mu^(*)$-measurable]: Fix $A in cal(A)_0$, 我们取任意 $E subset.eq X$.
Let $epsilon.alt > 0$, by def of the outer measure, 存在一个 seq ${ B_i }_(i = 1)^oo subset.eq cal(A)_0$, 使得 $E subset.eq union.big_(i = 1)^oo B_i$ 并且 $sum_(i = 1)^oo mu_0\(B_i\)lt.eq mu^(*)\(E\)+ epsilon.alt$. 有 disjoint additivity of $mu_0$ 可得, $sum_(i = 1)^oo mu_0\(B_i\)= sum_(i = 1)^oo mu_0\(B_i inter A\)+ sum_(i = 1)^oo mu_0\(B_i inter A^c\)$. 从而 $mu^(*)\(E\)gt.eq mu^(*)\(E inter A\)+ mu^(*)\(E inter A^c\)$, 得证. (实际上这是个 trivial argument, 通过$epsilon.alt$ argument 来严格证明.)

]
#remark[
这一 simple proposition 表明的是, $mu_0$ induce 出的 outer measure 在 $cal(A)_0$ 上 #strong[presearve $mu_0$ 的 measure 与 measurability.]

]
=== Hahn-Kolmogrov Theorem
<hahn-kolmogrov-theorem>
#definition(
  title: [#kn[$sigma$-finite measure]],
)[
Let $\(X\,cal(M)\,mu\)$ be a measure space. \ 如果 $mu\(X\)< oo$, 则称 $mu$ 是 finite 的. \ 如果存在一个 sequence $\(E_i\)$ in $cal(M)$ 使得 $union.big_i E_i = X$ 并且每个 $mu\(E_i\)< oo$, 则称 $mu$ 是 $sigma$-finite 的.

]
#remark[
一个 finite measure 说明 $cal(M)$ 中的所有集合的 measure 都 finite.

]
#theorem(
  title: [#kn[Hahn–Kolmogorov theorem]],
)[
给定一个 premeasure $mu_0$ on algebra $cal(M)_0$ of $X$, 以及其 induced outer measure $mu *$, 我们令
按 #ref[$sigma$-algebra generated by a subset] 的定义,
$ cal(M) := < cal(M)_0 > $
表示 $sigma$-algebra generated by the algebra $cal(M)_0$. \ 并令
$ mu := mu^(*)\|_(cal(M)) $
then we have:

+ $\(X\,cal(M)_0\,mu_0\)$ extends to $\(X\,cal(M)\,mu\)$ \ 即: $mu\|_(cal(M)_0)= mu_0$

+ $mu\|_(cal(M))$ 是 #strong[the largest extension of $mu_0$ to $cal(M)$] (即: 对于任意其他的 $cal(M)$ 上的 measure $nu$ that extends $mu_0$ to $cal(M)$, 都有 $nu\(E\)lt.eq mu\(E\)$ for all $E in cal(M)$); \ 并且 #strong[if $mu_0$ is $sigma$-finite], 则 $mu$ 是 #strong[the unique extension] of $mu_0$ to $cal(M)$.

]
#proof[
#strong[Proof of $\(X\,cal(A)_0\,mu_0\)$ extends to $\(X\,cal(M)\,mu\)$:] \ 这个 Statement directly follows from @thm-02-outer-measure-completion-of-a-measurable-space-theorem-003\(Carathéodory's Theorem) 以及上一个 proposition @prop-02-outer-measure-completion-of-a-measurable-space-proposition-001. \ . 我们首先用 $mu_0$ induce 出 $mu^(*)$, 再 restrict $mu^(*)$ to $cal(M)^(*) := { upright("all ") mu^(*) upright("-measurable sets") }$, 得到一个 $sigma$-algebra $cal(M)^(*)$. \ 注意此时: 由上一个 proposition @prop-02-outer-measure-completion-of-a-measurable-space-proposition-001 可得 $cal(M)_0$ 中所有集合都是 $mu^(*)$-measurable 的, thus $M_0 subset.eq cal(M)^(*)$, 由于 $cal(M)^(*)$ 是一个 $sigma$-algebra, 由 @lem-01-sigma-algebra-measure-inclusion-properties-of-generated-sigma-algebra 可得: $cal(M) := < cal(M)_0 > subset.eq cal(M)^(*)$. \ . 由 Carathéodory's Theorem 可以得到: $mu^(*)\|_(cal(M)^(*))$ 是一个 measure, 从而 $mu := mu^(*)\|_(cal(M))$ 也是一个 measure(等于把 $mu^(*)\|_(cal(M)^(*))$ 限制在了一个更小的 sub-$sigma$-algebra 上). \ #strong[\(Note: this is a trivial fact that if $M^(*)$ is a $sigma$-algebra and $M subset M^(*)$is also a $sigma$-algebra, then $mu\|_M$ is a measure if given that $mu$ is a $sigma$-algebra on $M^(*)$)] \ \ #strong[Proof of $mu$ being the largest extension of $mu_0$ to $cal(M)$:]
假设 $nu$ 是一个 $cal(M)$ 上的 $sigma$-algebra s.t. $nu\|_(cal(M)_0)= mu_0$. \ Let $E subset.eq cal(M)$. (WTS: $nu\(E\)lt.eq mu\(E\)$, 即$nu\(E\)lt.eq mu^(*)\(E\)$ \.) \ 由外测度 $mu^(*)$ 的定义, 对于任意 $epsilon.alt > 0$, 存在一列集合 ${ A_i }_(i = 1)^oo subset cal(A)_0$ 满足
$ E subset union.big_(i = 1)^oo A_i quad upright("且") quad sum_(i = 1)^oo mu_0\(A_i\)lt.eq mu^(*)\(E\)+ epsilon.alt . $
由于 $nu$ 在 $cal(A)_0$ 上和 $mu_0$ 一致，即
$ nu\(A_i\)= mu_0\(A_i\)quad forall i\, $
因此，
$ sum_(i = 1)^oo nu\(A_i\)= sum_(i = 1)^oo mu_0\(A_i\)lt.eq mu^(*)\(E\)+ epsilon.alt $
利用 $nu$ 的 additivity 和 monotoncity 得
$ nu\(E\)lt.eq nu \( union.big_(i = 1)^oo A_i \) lt.eq sum_(i = 1)^oo nu\(A_i\)= sum_(i = 1)^oo mu_0\(A_i\)lt.eq mu^(*)\(E\)+ epsilon.alt $

由于 $epsilon.alt$ arbitrary, 得到
$ nu\(E\)lt.eq mu^(*)\(E\) $

\(证明思路: 在 $cal(M)$ 上 $mu$ 就等于 $mu_0$ induce 的外测度, 对于其他的 extended measure, 其作用在一个集合上的测度一定小于等于任意的 $cal(M)_0$ covering 的 premeasure 和, 而我们可以通过控制这个 covering 的测度和与它的外测度的差距(since inf), 从而使得这个测度小于等它的外测度加一个无限小的 $epsilon.alt$, 从而得证.) \ \ #strong[Proof of $mu$ being the unique extension of $mu_0$ to $cal(M)$, provided that $mu_0$ is $sigma$-finite]: \ (recall $mu_0$ is $sigma$-finite 即 $mu_0\(X\)< oo$) It remains to show that $nu\(E\)gt.eq mu^(*)\(E\)$.

Continuing 上一个 proof, we have:
$ mu^(*)\(E\)lt.eq mu^(*)\(union.big_(i = 1)^oo A_i\)= nu\(union.big_(i = 1)^oo A_i\)= nu\(E\)+ nu\(union.big_(i = 1)^oo A_i\\E\) $
$ lt.eq nu\(E\)+ mu^(*)\(union.big_(i = 1)^oo A_i\\E\) $
我们只要 controling $mu^(*)\(union.big_(i = 1)^oo A_i\\E\)= mu^(*)\(union.big_(i = 1)^oo A_i\)- mu^(*)\(E\)= epsilon.alt$ 逼近 0, 即可得到反向的不等式关系. \ (证明思路: 我们证明了 $nu\(E\)lt.eq mu^(*)\(E\)$ 之后, 注意到 covering set 和 $E$ 之间的差集的 $nu$-measure 自然也小于等于这个差集的 $mu^(*)$-measure, which can approximate 0.) \ \

]
#remark[
. 我们首先容易定义 $X$ 上的一个 algebra $cal(M)_0$ 和一个 algebra 上的 premeasure $mu_0$\; \ \ . 然后用 inf of covering sum 来 induce 出一个 $cal(P)\(X\)$ 上的 outer measure $mu^(*)$, 而后我们限制 $mu^(*)$ 到 $mu^(*)\|_(cal(M)^(*))$ (where $cal(M)^(*)$ 表示所有的 $mu^(*)$-measurable sets), by Carathéodory's theorem 这就 induce 出了一个 complete measure. \ \ . 我们可以再取 $cal(M)^(*)$ 的一个 sub $sigma$-algebra $cal(M) := < cal(M)_0 >$, 限制在这个集合上的 $mu^(*)\|_(cal(M))$ 自然也是一个 measure, 并且是 $cal(M)_0$ extend 到 $cal(M)$ 上的 lartest measure. By Hahn-Kolmogrov Thm, 这个 measure 如果是 $sigma$-finite 的则是 $cal(M)_0$ extend 到 $cal(M)$ 上的 unique measure. \ (Notice: #strong[自然地, $\(X\,cal(M)^(*)\,mu^(*)\|_(cal(M)^(*))\)$ 是 $\(X\,cal(M)\,mu^(*)\|_(cal(M))\)$ 的一个 completion.])

]
