#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= distribution function 与 Lebesgue-Stieltjes measures
<distribution-function-与-lebesgue-stieltjes-measures>
== distribution function and Borel measures on $cal(B)\(bb(R)\)$ \[Fol 1.5\]
<distribution-function-and-borel-measures-on-mathcalbmathbbr-fol-1.5>
This lecture:
\1. distribution function 是 increasing 且 right continuous 的,
\2. 任意 increasing 且 right continuous 的函数可以作为 distribution function, 用它来构造它对应的 measure.

=== distribution function of a locally finite (i.e. regular) Borel measure
<distribution-function-of-a-locally-finite-i.e.-regular-borel-measure>
#definition(
  title: [#kn[distribution function of $mu$]],
)[
给定一个 #strong[locally finite (finite on all compact sets)] 的 #strong[Borel measure] on $bb(R)$ (即 $\(bb(R)\,cal(B)\(b R\)\,mu\)$), 我们定义:
$ F_mu\(x\):= {mu\(\(0\,x\]\)quad\,x gt.eq 0\
- mu\(\(x\,0\]\)#h(0em)\,x < 0 $
这个函数被称为 $mu$ 的 #strong[distribution function.]

]
#remark[
一个 #strong[locally finite (finite on all compact sets)] 的 Borel measure on $bb(R)^n$ 被称为一个 regular measure. \ 在 Ch 3 中, 我们将在讨论 $bb(R)^n$ 上 regular measure 对于 Lebesgue measure 的 derivative.

]
#proposition(
)[
容易发现: $F$ 是 $mu$ 的 distribution function, 当且仅当 $mu\(\(a\,b\]\)= F\(b\)- F\(a\)$, 任取这样的 interval.

]
这两个定义是等价的.

#theorem(
  title: [#kn[distribution function is increasing and right ctn]],
)[
对于 $bb(R)$ 上的任意 locally finite Borel measure $mu$, 其 distribution function $F_mu$ 都是 increasing 且 right continuous 的.
(right ctn:$ F_mu\(a\)= lim_(x arrow.r a^(+)) f\(x\) $

]
#proof[
increasing: trivially by monotonicity of measure. \ right continuous: follows from measure 的 ctnity. 正轴上: $mu\(\(0\,x + 1\/n\]\)$ 的 sequence 极限为 $mu\(0\,x\]\)$, by ctn from above; 负轴上, $mu\(\(x + 1\/n\,0\]\)$ 的 sequence 极限为 $mu\(\(x\,0\]\)$, by ctn from below. \

]
#remark[
#strong[Note: distribution function 是 right ctn 的, 但却未必是 left ctn 的.]
因为我们构造离散的 measure, 使得这个 distribution function 具有间断点. 这样导致了左不连续.
反例: 例如 atomic measure.

]
=== any increasing and right ctn function is a unique distribution function
<any-increasing-and-right-ctn-function-is-a-unique-distribution-function>
#definition(
  title: [#kn[h-interval]],
)[
我么定义形如 $\(a\,b\]$, $\(- oo\,b\]$ 的 $bb(R)$ 的子集, 以及 $diameter$, $bb(R)$, 为 h-intervals.

]
h-intervals 即#strong[所有的左开右闭区间.]

#figure(image("../assets/ch1-pics-1.png", width: 20.0%),
  caption: [
  ]
)

#lemma(
  title: [#kn[h-intervals form an algebra and generate borel set]],
)[
$ cal(A)_0 := { upright("finite (disjoint) unions of h-intervals") } $
是一个 algebra, 并且
$ < cal(A)_0 > = cal(B)\(bb(R)\) $

]
#proof[
trivial. follows from lec 2 的 generating set of borel set on $bb(R)$.

]
#theorem(
  title: [#kn[#strong[任意 increasing 且 right ctn 函数都是某个 regular Borel measure
的 distribution 函数]]],
)[
取 lemma 中的 $cal(A)_0$.
对于#strong[任意的 increasing 且 right ctn 的 $F : bb(R) arrow.r bb(R)$,] 我们 define $mu_0 : cal(A)_0 arrow.r\[0\,oo\]$, by:
$ mu_0\(union.big_(i = 1)^n\(a_i\,b_i\]\)= sum_(i = 1)^n\(F\(b_i\)- F\(a_i\)\) $ 并规定 $mu_0\(0\)= 0$, 以及 $F\(oo\)= lim_(x arrow.r oo) F\(x\)$ \ ,
#strong[Claim 1: $mu_0$ 是一个 $cal(A)_0$ 上的 $sigma$-finite premeasure.] \ #strong[Claim 2: (by Hahn-Kolmogrov) $mu_0$ extend to a locally finite Borel measure $mu_F$], 并且 $mu_F\(\(a\,b\]\)= F\(b\)- F\(a\)$ for any h-interval, i.e. $F$ 是 $mu_F$ 的 distribution function. \ Claim 3: #strong[$F$ 是 $mu_F$ 的唯一 distribution function up to constant term], in the sense that 任意其他的 such function $G$ 如果也是$mu_F$ 的 distribition function, 则必然有 $F - G$ 为 const.

]
#proof[
Claim1

+ well-definedness of $mu_0$: 对于两个结果一样的 union, finding common refinement 即可.

+ $mu_0\(diameter\)= 0$: 因为 $diameter$ 就是 $\(a\,a\]$.

+ finite additivity: trivial.

+ $sigma$-finiteness: each $mu_0\(\(n\,n + 1\]\)< oo$

+ #strong[ctbl additivity: nontrivial, 下面详细展开.]

Suppose $A_1\,A_2\,dots.h.c$ 是 seq of disjoint h-intervals in $cal(A)_0$. Let $A := union.sq.big_i A_i$. \ WTS: $mu_0\(A\)= sum_i mu_0\(A_i\)$. \ (1) WTS $mu_0\(A\)gt.eq sum_i mu_0\(A_i\)$
这个 direction easy. We define $B_n := union.sq.big_1^n A_i$, 由 finite additivity 得到: $mu_0\(B_n\)= sum_i^n mu_0\(A_i\)$, 从而
$ mu_0\(A\)= mu_0\(B_n\)+ mu_0\(A\\B_n\)gt.eq mu_0\(B_n\) $ for each $n$, 由于这是一个 numerical seq, 可以 conclude $mu_0\(A\)gt.eq sum_i mu_0\(A_i\)$.
(2) WTS $sum_i mu_0\(A_i\)gt.eq mu_0\(A\)$. \ 这个 direction 较难, 需要用到 $epsilon.alt\/2^n$ 的 argument. \ For simplicity, 我们只需要考虑 $A_i =\(a_i\,b_i\]$ 的 interval 形式, 其他形式 can trivially prove. 并且, 由于 $cal(A)_0$ 中任何一个元素至多只有 finite 个离散的 h-intervals, 我们 #strong[suffice to assume $A$ 是一个 h-interval.] \ 从而, 我们也可以 denote $A =\(a\,b\]$. \ Let $epsilon.alt > 0$. \ By $F$ 的 increasing 和 right ctn, 存在 $delta\,delta_i$ s.t.
$ F\(a + delta\)- F\(a\)lt.eq epsilon.alt $
同样地, 对于每个 $A_i$. 我们都可以找到 $delta_i$ 使得
$ F\(b_i + delta_i\)- F\(b_i\)lt.eq epsilon.alt / 2^i $
于是 $\(a_i\,b_i + delta_i\)_(i in bb(N))$ 就形成了一个 open covering for $\[a + delta\,b\]$. By cptness, 存在一个 finite subcovering $\(a_i\,b_i + delta_i\)_(1 lt.eq i lt.eq N)$. \ By relabelling, #strong[我们 suppose $A_i$ 是从左到右排序的. 于是每个 $b_i + delta_i$ 都处于下一个 $A_(i + 1)$ 之内.]

#figure(image("../assets/ch1-pics-image-20250130183842172.png", width: 20.0%),
  caption: [
  ]
)

从而:
$ mu_0\(A\) & lt.eq F\(b\)- F\(a + delta\)- epsilon.alt\
 & lt.eq F\(b_N + delta_N\)- F\(a_1\)+ epsilon.alt\
 & = F\(b_N + delta_N\)- F\(a_N\)+ sum_1^(N - 1)\(F\(a_(i + 1)\)- F\(a_i\)\)+ epsilon.alt\
 & lt.eq F\(b_N + delta_N\)- F\(a_N\)+ sum_1^(N - 1)\(F\(b_i + delta_i\)- F\(a_i\)\)+ epsilon.alt\
 & < sum_1^N\(F\(b_i\)- A\(a_i\)+ epsilon.alt / 2^i\)+ epsilon.alt\
 & < sum_1^oo mu_0\(A_i\)+ 2 epsilon.alt $
Claim 2, 3 都 directly follows from Hahn-Komogrov Thm.

]
#remark[
这一证明实则简单. 关键的步骤是 1. 简化问题为 union 成一个 h-interval; 2. 通过 cptness 取 finite covering；3. 对每个 $A_i$ 取一个 $epsilon.alt\/2^i$ 的小 cover, 最后可以被 $epsilon.alt$ bound.

]
#example(
)[
我们已经证明, 从任意的 increasing 且 right ctn 的函数都可以构造出一个以其为 distribution function 的 locally finite Borel measure on $bb(R)$, 因而我们简称这样的函数都叫做 distribution function. \ 以下为两个 distribution function 的例子: \ 1. Heaviside function $ H\(x\)= {1 #h(0em) #h(0em)\,x gt.eq 0\
0 #h(0em) #h(0em)\,x < 0 $
\2. 我们将 $bb(Q)$ 以某种形式列出: $bb(Q) = { q_1\,q_2\,dots.h.c }$
而后定义:
$ F\(x\):= sum_(i = 1)^oo 2^(- n) H\(x - r_n\)in\(0\,1\) $
这个函数通过有理数的次序给每个有理数赋了一个\"weight\", 并对于每个$x$, 把所有有理数分为 $> x$ 和 $lt.eq x$ 的两部分, 只把 $lt.eq x$ 的那部分有理数的权重算进 $F\(x\)$. 于是 $x$ 越大, 被算进 $F\(x\)$ 的有理数越多, $F\(x\)$ 就越大. (虽然每个有理数的权重是乱的). 这个函数在每一点上都 discrete. \ 这个过程可推广, 不取 $bb(Q)$ 而取任意的 countable sets in $bb(R)$ 作为参照.

]
本 lec 总结: 通过直接定义 distribution function 来得到的 measure, 实则就是不同于直接取 interval 长度, 我们隐性地给每个点一个 mass (类似概率密度), 从而把区间的长度中每一个点加上一个权重. 最后形成一个不一定均匀的 measure. 这个 distribution 的分布曲线决定了这个 measure.

== Lebesgue-Stieltjes measure \[Fol 1.5, finished\]
<lebesgue-stieltjes-measure-fol-1.5-finished>
给定一个 increasing 且 right ctn 的函数 $F$, 我们已经展示了用它作为 distribution function 来 induce 出一个 regular Borel measure $mu_F$ on $cal(B)\(bb(R)\)$. \ 在构造这个函数时, 我们使用的是用 premeasure $cal(A)_0$ (of all finite unions of h-intervals), 使用 Hahn-Kolmogrov 来 induce outer measure $mu_F^(*)$, 再把 restrict 它到 $< cal(A)_0 >$, 即 $cal(B)\(bb(R)\)$ 上, 获得的 measure. #strong[这一个 measure 是一个 Borel measure, 但是它并不 complete.] \ recall in lec 6: 我们其实可以 complete 这个 measure, 只需要在第二步, 用 premeasure $cal(A)_0$ induce 出 outer measure 后, 不要 restrict 它到 $cal(B)\(bb(R)\)$ 上, 而是 restrict 到取 $cal(M)_mu := { upright("all ") mu_F^(*) upright("-measurable set}")$ 上, 得到的就是 completion of $mu_F$, 即 $ \(bb(R)\,cal(M)_mu\,accent(mu_F, macron)\) $
其中, $cal(A)^(*)$ 是 $< cal(A)_0 >$ 即 $cal(B)\(bb(R)\)$ 的 proper super set. #strong[我们把这个 completed measure 叫做 Lebesgue Stieltjes measure associated with $F$, 并用 $mu_F$ 来指代它. (刚才, 我们把未完备的 measure 叫做 $mu_F$, 但现在我们不再使用这个 measure, 而是使用它的 completion, 并转而称它的 completion ($accent(mu_F, macron)$) 为 $mu_F$\.)]
$ upright(" Regular Borel measure ") arrow.r^(upright(" completion ")) upright(" LS measure ") $

#definition(
  title: [#kn[Lebesgue-Stieltjes measure associated with $F$]],
)[
给定一个 distribution function $F$, 我们使用它来定义 h-intervals 的 premeasure $mu_0$, 并把这个 premeasure induce 出的 outer measure $mu^(*)$ 限制在 $ cal(M)_mu := { upright("all ") mu^(*) upright("-measurable set}") $ 上, 由 Carathéodory Thm 得它是 complete 的. 称这个 complete 的 measure $ mu_F := mu^(*)\|_(cal(M)_mu) $ 为 #strong[Lebesgue Stieltjes measure associated with $F$.]

]
#remark[
根据定义, 对于任意 $E in cal(M)_mu$, 它的 LS measure 为:$ mu_F\(E\)= inf { sum_1^oo\(F\(b_i\)- F\(a_i\)\)divides E subset.eq union.big_1^oo\(a_i\,b_i\]} $

]
=== inner and outer regularity of LS measure
<inner-and-outer-regularity-of-ls-measure>
虽然我们使用 h-intervals 来 induce 了这个 measure, 但是实际上我们在表示 measure 时,可以用 open intervals 来代替 h-intervals:

#lemma(
  title: [#kn[open-interval covers for Lebesgue–Stieltjes measure]],
)[
固定一个 Lebesgue-Stieltjes measure associated with $F$, 任意 $E in cal(M)_mu$, 它的 measure 等于:$ mu_F\(E\)= inf { sum_1^oo\(F\(b_i\)- F\(a_i\)\)divides E subset.eq union.big_1^oo\(a_i\,b_i\)} $

]
#proof[
每个 open interval 都等于 a ctbl disjoint union of h-intervals, 从而是在这个被取 inf 集合内的; 所以只需要证明能取到这个 inf 即可.
Fix $epsilon.alt > 0$, 我们根据定义可以取到一个 seq $\(a_i\,b_i\]$ 使得它 measure sum $lt.eq mu\(E\)+ epsilon.alt\/2$, 而我们对于每个 $i$, 在 interval 的右边再取一个 $< epsilon.alt\/2^(i + 1)$ 的 $delta_i$, 就变成了一个 open interval, 并且最后距离这个 h-interval seq 的 measure sum 差距至多 $epsilon.alt\/2$. 从而得证.

]
#theorem(
  title: [#kn[#strong[outer regularity]]],
)[
对于一个 Lebesgue-Stieltjes measure associated with $F$, 任意 $E in cal(M)_mu$, 它的 measure 等于:
$ mu_F\(E\)= inf { mu_F\(U\)divides U upright(" open , and ") E subset.eq U } $

]
#proof[
Directly follows from lemma. 首先, by monotonicity, 一个包含 $E$ 的开集 $U$ 的 $mu_F$ 一定比 $E$ 的大. 并且, 对于任意的 $epsilon.alt > 0$, 都可以找到一个 open covering 使得 measure sum $< mu_F\(E\)+ epsilon.alt$, by def. \

]
#theorem(
  title: [#kn[#strong[inner regularity]]],
)[
对于一个 Lebesgue-Stieltjes measure associated with $F$, 任意 $E in cal(M)_mu$, 它的 measure 等于:
$ mu_F\(E\)= sup { mu_F\(K\)divides K upright(" compact , and ") K subset.eq E } $

]
#proof[
首先证明 $E$ bounded 的 case. 假设 $E$ bdd. \ 如果 $E$ closed, 则 $E$ cpt, trivially true. \ 如果 $E$ open, 那么 $E$ 的 bounadry 是 closed (cpt) 的, 从而 $partial E in cal(M)_mu$
我们 let $epsilon.alt > 0$. 我们对 $partial E$ 使用 outer regularity, 可以取一个 open set $U$ covering $partial E$, 并且使得 $mu_F\(U\)lt.eq mu_F\(E\)+ epsilon.alt$ \ 此时取 $K := E\\U$, 我们发现这是一个 approximating $E$ 的 compact set, 并且有:
$ E = K union.sq\(U inter E\) $
从而:

#figure(image("../assets/ch1-pics-image-20250131003019214.png", width: 40.0%),
  caption: [
  ]
)

而对于 unbounded 的 case, 直接由
$ E = union.sq.big_j\(E inter\(j\,j + 1\]\) $得到.

]
#remark[
outer / inner regularity 表示, $bb(R)$ 上一个 (LS-measurable set 的) LS measure 就等于它内部用 cpt set 逼近它的 measure limit; 以及等于它外部用 open set 逼近它的 measure limit. \ 这个性质也可以推广到 $bb(R)^n$ 上.

]
=== Lebesgue-Stieltjes measurable 的等价条件
<lebesgue-stieltjes-measurable-的等价条件>
#definition(
  title: [#kn[$G_delta\,F_sigma$ sets]],
)[
Topological space 中, 一个 #strong[coutable intersection of open sets 被称为一个 $G_delta$ set], 一个 #strong[countable union of closed sets 被称为一个 $F_sigma$ set].

]
#remark[
topological space 中, finite intersection of open sets 还是 open set, 但是 countable intersection 则未必; finite union of closed sets 还是 closed set, 但是 countable union 则未必. \ $G_delta$ sets 包括了所有的 open sets, 以及一部分扩充; $F_sigma$ sets 包括了所有的 closed sets, 以及一部分扩充.

]
#theorem(
  title: [#kn[Lebesgue-Stieltjes measurable 的等价条件]],
  id: "thm-03-distribution-function-lebesgue-stieltjes-measures-lebesgue-stieltjes-measurable",
)[
TFAE:

+ $ E in cal(M)_mu $

+ 存在一个 $G_delta$ set $V$ 以及一个 measure zero set $N_1$ ($mu_F\(N_1\)= 0$) 使得 $ E = V\\N_1 $

+ 存在一个 $F_sigma$ set $H$ 以及一个 measure zero set $N_2$ ($mu_F\(N_2\)= 0$) 使得 $ E = H union N_2 $

+ 存在一个 open set $U$ 使得对于任意的 $epsilon.alt > 0$, 都有 $ mu^(*)\(U\\E\)< epsilon.alt $

]
#proof[
由 (ii) 和 (iii) 推得 (i) 是 trivial 的. 这是因为 LS measure 是 complete measure, 任意 null set 都是 measurable 的.
由 (i) 推 (ii) 和 (iii): follows from outer 与 inner regularity. 假设 $E$ 是 LS-measurable 的, 我们直接取一个 inner seq of cpt subsets 以及一个 outer seq of open super sets, 使得
$ mu_F\(U_j\)- 1 / 2^i lt.eq mu_F\(E\)lt.eq mu_F\(K_j\)+ 1 / 2^i $
于是就得到: $V := inter.big_i U_i$, $H := union.big_i K_i$, 与 $E$ 的差集都是一个 null set. 并且它们分别为 $G_delta$ 和 $F_sigma$ sets.

]
#remark[
$sigma$-algebra 和 topology 各自只 closed under finite 的交和并, 而 $< cal(B)\(bb(R)\)>$ 则 closed under ctbl 交和并, 从而所有的 $G_delta$ 和 $F_sigma$ sets 都在其中. $cal(M)_mu$ 是一个比 $< cal(B)\(bb(R)\)>$ 更大的集合, 但是其实它其中的元素都可以用 $G_delta$ 和 $F_sigma$ sets, 即 $< cal(B)\(bb(R)\)>$ 中的集合来逼近. 这是合理的, 因为 completion 就是把一些 subnull sets 加入到了 $sigma$-algebra 里.

]
=== Lebesgue measure and its invariance properties
<lebesgue-measure-and-its-invariance-properties>
#definition(
  title: [#kn[Lebesgue measure]],
)[
Lebesgue measure 即 Lebesgue-Stieltjes measure associated with $F\(x\)= x$.
我们用 $m := mu_F$ 来表示它, 并用 $cal(L) := cal(M)_m$ 来表示所有的 Lebesgue measurable sets. \ 从而 $bb(R)$ 上的 Lebesgue measure space 表示为:
$ \(bb(R)\,cal(L)\,m\) $

]
#remark[
Lebesgue measure 是最 normal 的 Lebesgue-Stieltjes measure, 它 preserve intervals 的长度作为其 measure:
$ m\(\(a\,b\]\)= b - a $

]
#theorem(
  title: [#kn[$cal(L)$ preserves translation and scaling]],
)[
if $E in cal(L)$ $arrow.r.double$ $E + s\,r E in cal(L)$ $forall s\,r in bb(R)$. \ 并且, $m\(E + s\)= m\(E\)\,m\(r E\)=\|r\|m\(E\)$

]
#proof[
首先, 如果 $E in cal(B)\(bb(R)\)$, 那么 by hw 1, 我们证明了 $cal(B)\(bb(R)\)$ 是 closed under translation 和 scaling 的, 因而 $r E\,E + s in cal(B)\(bb(R)\)$. \ 我们 define on $cal(A)_0 :=$ ${ upright("finite union of h-intervals") }$:
$ m_s\(E\):= m\(E + s\) $
$ m^r\(E\):= m\(r E\) $
显然, 这两个函数 agree with $m\,\|r\|m$. #strong[由于 $m$ 是 $sigma$-finite 的, 从而 by Hahn-Kolmogrov, 它 uniquely extend to $cal(B)\(bb(R)\)$]. 因而, $m_s$ 在 $cal(B)\(bb(R)\)$ 上和 $m$ 相等, $m^r$ 在 $cal(B)\(bb(R)\)$ 上和 $\|r\|m$ 相等. 并且, 我们知道 #strong[$\(bb(R)\,cal(L)\,m\)$ 是 completion of $\(bb(R)\,cal(B)\(bb(R)\)\,m\)$], 因而 $m_s$ 也同样 complete to $m$ on $cal(L)$. (同理, $m^r$ 也同样 complete to $\|r\|m$ on $cal(L)$)

]
#remark[
我们只要证明两个 measure function 在 premeasure 上相等或称倍数关系, 就能证明它们在 induced (complete) measure 上相等. \ 此外, 有另一种证明方式. After we know $m_s$ 在 $cal(B)\(bb(R)\)$ 上和 $m$ 相等, $m^r$ 在 $cal(B)\(bb(R)\)$ 上和 $\|r\|m$ 相等, 我们由 @thm-03-distribution-function-lebesgue-stieltjes-measures-lebesgue-stieltjes-measurable Lebesgue-Stieltjes measurable 的等价条件 可知: $cal(L)$ 上的集合一定是一个 Borel set 并上一个 null set, 由于 null set 的 measure 在经过 translation 和 scaling 后仍然是 0, 同样得证.

]
