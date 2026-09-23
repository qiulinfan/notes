#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= signed measure and Jordan decomposition
<signed-measure-and-jordan-decomposition>
== signed measure \[Fol 3.1\]
<signed-measure-fol-3.1>
=== remainder: 当前 Folland 进度
<remainder-当前-folland-进度>
我们目前 finish 了 Folland 的 #strong[Ch1, Ch2, 6.1 的全部, 3.4 的大部分,] \ 其实在这个 lec 前还有一个 lec 讲了 Folland 5.1, 6.2 的一部分, 在这里我去掉了这个 lec, 把它放在了 3.1-3.3 结束之后. 这是因为由于目前没有证明 Radon-Nikodym Thm, 没有足够的工具去完成 $ \(L^p\)^(*)= L^q $
的证明 (差了一个 proof surjectivity of the isometry $g arrow.r ell_g$). 不清楚老师为什么要把它放在这里讲. \ 现在我们将回到 Ch3 的 signed measure and differentiation between measures 的 theory, 在#strong[接下来的 a few lectures 中 finish 掉 Ch3.] \ 在 finish 掉 Ch3 后, 我们将掌握足够的知识继续推进 $L^p$ space 的理论, 从而 finish 完 6.2, 然后完成 6.3, 6.4 的一部分, 以及 a bit Hilbert space theory 和 Fourier Analysis. \ #strong[What will not be covered]: Ch4 on point set topology (assume we have learned part of it, and the rest is not needed to be learned systematically) 以及剩余的泛函分析内容 (should be covered in functional analysis course next semester).

=== signed measure
<signed-measure>
Motivation: 我们都知道, 对于 nonnegative measurable $f$ 即 $f in L^(+)$, $ nu\(E\): = integral_E f #h(0em) d mu $
通过 integration of the function with respect to some measure $mu$ 定义出了另一个 measure $nu$. \ But what about $f in L^1$?

#definition(
  title: [#kn[signed measure]],
)[
一个 signed measure on a measurable space $\(X\,cal(A)\)$ 是一个 function $nu : cal(A) arrow.r\[- oo\,oo\)$ 或者 $nu : cal(A) arrow.r\(- oo\,oo\]$, #strong[和普通 meausre 一样满足 $nu\(diameter\)= 0$ 以及 ctbl disjoint additivity]. \ Note: signed measure 只 admit $+ oo$ 和 $- oo$ 中的一个值 (#strong[不可以同时存在两个集合 $nu\(A\)= oo$, $nu\(B\)= - oo$])

]
#remark[
所有的 measure 都是 signed measure. 为了强调普通的 measures 和 signed measures 的区别, 我们也称#strong[普通的 measure 为 positive measure]. \ signed measure 实则是偏向一边的, 要么偏向 positive 要么偏向 negatve, 在取值上并不对称. 因为一旦有 $nu\(A\)= oo$ 就不能有 signed measure 为 $- oo$ 的集合, 反之亦然. 另一边只是一个调节, 作为一个有限的补偿项.

]
#example(
)[
容易验证:

#proposition(
)[
对于 positive measure $mu_1\,mu_2$, 如果其中有至少一个是 finite 的, 那么 $ nu : = mu_1 - mu_2 $ 是一个 signed measure.

]
This follows from ctbl disjoint additivity. (两个 ctbl sum 加起来)

]
#example(
)[
#proposition(
)[
对于 measurable function $f$, 如果 $f^(+)$ 和 $f^(-)$ 中至少有一个是 $L^1$ 的 (这个条件弱于 $f in L^1$, 被称为 $f$ is extended $mu$-integrable), 那么 $ nu\(E\)= integral_E f #h(0em) d mu $就是一个 well-defined 的 signed measure.

]
This follows from that (1) 对于 $f in L^(+)$, $nu\(E\): = integral_E f #h(0em) d mu$ 定义了一个 measure; (2) 上一个 proposition.

]
=== signed measure 的 CFB, CFA
<signed-measure-的-cfb-cfa>
#proposition(
  title: [#kn[continuity from below and above for signed measures]],
)[
给定 signed measure $nu$, 对于 increasing seq $E_j$, 有 $ nu\(union.big_(j = 1)^oo E_j\)= lim_(j arrow.r oo) nu\(E_j\) $
对于 decreasing seq $F_j$, 有: $ nu\(inter.big_(j = 1)^oo F_j\)= lim_(j arrow.r oo) nu\(F_j\) $

]
#proof[
和 positive measure 的 CFB, CFA 一致.

]
=== positive / negative / null set
<positive-negative-null-set>
Elementary fact: 对于 signed measure 而言, $ A subset B ⇏ nu\(A\)lt.eq nu\(B\) $
但是

#lemma(
)[
对于 signed measure $nu$, 和 measurable $A subset B$,
$ nu\(A\)= oo arrow.r.double.long nu\(B\)= oo $以及同理 $ nu\(A\)= - oo arrow.r.double.long nu\(B\)= - oo $

]
#proof[
这是因为 $ B = A union.sq\(B\\A\) $
由于我们对于 signed measure, 只允许 $oo$,$- oo$ 中的一种情况, 因而不论 $nu\(B\\A\)$ 的 measure 也同向无穷或者有穷, 都能够推出 $B$ 的 measure 也同向无穷.

]
#remark[
这个性质表示了 signed measure 的稳定性: #strong[一旦一个集合有无穷的 measure, 它外面的任何 superset 一定也有同向的无穷 measure].

]
#definition(
  title: [#kn[positive set, negative set, null set]],
)[
给定 signed measure $nu$, 对于 $E in cal(A)$, 我们称 $E$ 是一个 #strong[postive se]t, 如果对于对于任意的 $F subset E$, 都有 $ nu\(F\)gt.eq 0 $ #strong[negative set] 和 #strong[null set] 同理. \ Note: For signed measure, #strong[一个集合的 signed measure 为 $0$ 并不代表它的任何子集的 measure 也是 $0$], 它可以是两个正负 measure 相抵的集合的 union. 因而我们要这样额外定义 null set.

]
#remark[
null set 既是 positive set, 又是 negative set.

]
#lemma(
  title: [#kn[measurable subset preserves sign]],
)[
measurable subset of a measurable set $F subset E$ preserves the sign of $E$. \ 即: $E$ 是一个 positive / null / negative $arrow.r.double.long$任意 $F subset E$ 是一个 positive / null / negative.

]
#proof[
By def, 可以 by contradiction 得到.

]
#lemma(
  title: [#kn[positive, negative, null set 内的局部性质和普通的 measure space 一样]],
)[
如果 $E$ 是一个 #strong[positive set] for signed measure $nu$, 那么 $ F subset E arrow.r.double.long nu\(F\)lt.eq nu\(E\) $
通过上一个 lemma, $E$ 的任何子集也有这个性质. 因而 #strong[$E$ 局部是一个普通的 measure space]. \ 同理, 如果 $E$ 是一个 #strong[negative set], 那么 $ F subset E arrow.r.double.long nu\(F\)gt.eq nu\(E\) $
因而 $E$ 局部也等价于是一个普通的 measure space, 只不过所有集合的 measure 加上了一个负号.

]
#remark[
positive, negative, null set 就是这个 signed measure space 中的 \"#strong[纯净部分]\", 在这个部分里, 这个 subspace 相当于一个普通的 measure space.

]
#figure(image("../assets/ch3-pics-draw-2943173.png", width: 40.0%),
  caption: [
  ]
)

#lemma(
)[
Countable union of positive / negative / null sets 仍然是 positive / negative / null sets.

]
#proof[
Follows from Def. 任何一个 $E$ 的子集都可分解成这个 $E_1\,E_2\,dots.h.c$ 中的某些集合的子集的 at most ctbl disjoint union, whose measure add up to remain positive / negative / null measure.

]
Question:
给定 signed measure $nu$, 它是否一定能被 decompose into 两个 positive measure 的 difference? $ nu = nu^(+) - nu^(-) ? $
Turns out that: there exists a canonical way to do this. #strong[这个分解存在且是唯一的], 并且#strong[正的部分和负的部分是不相交的 (不存在一个集合既有非 $0$ 的 positive measure 又有非 $0$ 的 negative measure)]. 我们称这个 signed measure decomposition 为 #strong[Jordan decomposition]. \ 我们下节课会证明 Jordan decomposition. 这节课我们先证明一个得到 Jordan decomposition 的关键步骤: #strong[Hahn Decomposition]. \ Hahn Decomposition Theorem 表示: #strong[任意一个 signed measure 都把整个空间 $X$ 划分为两个 a.e. 不相交的 positive set $P$ 和 negative set $N$.] \ 这个结果是非常有用的. 因为我们知道, 在一个 positive / negative / null set 内部, 我们可以把它看作成一个普通的 measure space. 因而, Hahn Decomposition Theorem 说明了任意一个 signed measure 都把整个空间 $X$ 划分成两个普通的 measure space, 其中一个的符号和 measure 运算颠倒为负. 这就基本 state 了 Jordan decomposition 的内容.

=== Hahn Decomposition
<hahn-decomposition>
#theorem(
  title: [#kn[Hahn Decomposition Theorem]],
)[
对于任意 measurable space $\(X\,cal(A)\)$ 上的任意 signed measure $nu$, 都存在一个 positive set $P$ 和一个 negative set $N$ s.t. $ P inter N = diameter $
并且 $ P union.sq N = X $
即$X$ 被 $nu$ 划分为一个 positive measure space 和一个 negative measure space. \ 并且, #strong[这个 decomposition 是唯一的, in $nu$-a.e. sense]: 即, 如果 $P'\,N'$ 是 another pair of such decomposition, 必然有: $ P Delta P' = N Delta N' quad upright("is null set") $

]
#figure(image("../assets/ch3-pics-Screenshot 2025-03-25 at 19.47.55.png", width: 28.0%),
  caption: [
  ]
)

#proof[
Uniqueness 是 just be definition 的, 因为#strong[除了 $P\,N$ 内部的 null sets 可以随意交给对方之外, 其他子集都是严格的 positive set 和 negative set, 不可能有第二个 decomposition]. 因而 STS existence. \ WLOG 考虑 $nu$ 不 admit $oo$ (至多 admit $- oo$). This makes sense 因为 otherwise we can consider $- nu$. \ Set: $ m : = sup { nu\(E\): E in cal(A) upright(" positive set") } $
Pick seq of positive sets $\(cal(P)_j\)$ in $cal(A)$ s.t. $ nu\(P_j\)arrow.tr m $
(这是 doable 的因为在 positive sets 的部分等于一个正常的 measure space, 并且这里 finite measure.)
并 set $ P := union.big_(j = 1)^oo P_j $从而 $P$ 也是 positive 的并且 $ nu\(P\)= m < oo $
Set: $ N : = P^c $
只要 show $N$ 是一个 negative set, 就得证了. \ 我们 argue by contradiction. \ 假设 $N$ 不是 negative set, 那么存在 $A subset N$ s.t. $nu\(A\)> 0$. \ Pick $n_1 in bb(N)$ the smallest number 使得存在 $A_1 subset N$ s.t. $ nu\(A_1\)gt.eq 1 / n_1 $
Note #strong[$A_1$ 不可能是 positive set], 否则 $P union A_1$ 将是一个 positive set 并且 $nu\(P union A_1\)> m$, contradicting with $m$ being the sup of measure among positive sets. \ 因而 $A_1$ 中, 必须存在 negative measure 的 set. 我们再 pick $n_2 in bb(N)$, the smallest number 使得存在 $B_2 subset N$ s.t. $ nu\(B_2\)lt.eq - 1 / n_2 $
即: $ - frac(1, n_2 - 1) lt.eq nu\(B_2\)lt.eq - 1 / n_2 $

并 Set $ A_2 : = A_1\\B_2 $从而: $ nu\(A_2\)gt.eq nu\(A_1\)+ 1 / n_2 $
我们 recursively 做这件事, 得到 positive measure 的 seq $\(A_n\)$ s.t. $ N supset A_1 supset A_2 supset dots.h.c $
$ {nu\(A_j\)gt.eq nu\(A_(j - 1)\)+ 1 / n_j\
upright("for any ") E subset A_j\,nu\(E\)< nu\(A_j\)+ frac(1, n_(j + 1) - 1) $
notice: $A_j$ 这个 seq 的 measure 是递增的. 我们取 $ A : = inter.big_(j = 1)^oo A_j $
于是 $ nu\(A\)= lim_(j arrow.r oo) nu\(A_j\)gt.eq sum_(j = 1)^oo 1 / n_j $
因为 $A$ 有 positive measure, 这个 measure 一定有限, 从而这个 series 收敛, 因而有: $ n_j arrow.r oo quad upright("as ") quad j arrow.r oo $
和之前同理, $A$ 不能是 positive set, 所以存在 $B subset A$ 使得 $nu\(B\)< 0$. \ Set $ A' := A\\B $于是 $ nu\(A'\)> nu\(A\)+ 1 / n\,quad upright("for some ") n gt.eq 1 $
由于 $n_j arrow.r oo$, for some $j > 1$ 有 $n < n_j$. 我们取这个 $j$ 并 fix it. 由于 $nu\(A\)$ 比任何 $nu\(A_j\)$ 都大, 可以得到$ nu\(A'\)> nu\(A\)+ 1 / n gt.eq nu\(A_j\)+ 1 / n quad upright("for all ") j gt.eq 1 $
这说明, #strong[$A'$ 是从 $A_j$ 中去掉了一个至少有 $1 / n$ 的负测度的集合得到的.] \ 但是, recall how we picked $n_j$: $n_j$ 是 #strong[the smallest number] 使得存在 $B subset A_j$ s.t. $nu\(B\)lt.eq - 1 / n_2$, 和这里 $n < n_j$ 矛盾. 从而得证.

]
#remark[
这个 proof 的归谬点很难想到. \ 前面的逻辑很明确: 如果 $N$ 不是一个纯负集合, 那么里面就可以找到一个正测度子集. 由于这个正测度子集 by def 不可能是纯正集合, 我们可以在里面找到一个负测度集合, 把它去掉, 但是剩下来的部分仍然不可能是纯正集合 (测度甚至变得更大了), 于是我们可以每次都在剩下来的 $A_j$ 上再去掉一部分 $B_(j + 1)$, inductively 执行这个行为, 通过这个行为的极限得到一个最大的正测度集合 $A$, by assumption 这个正测度是有限的. \ 然后是比较难的归谬点: 直觉可能是: 我们希望 $A$ 是纯正的, 从而和 $m$ 的假设矛盾, 不过其实我们无法得到这点. 但是, 我们可以从另一个的角度来得到矛盾: #strong[每次去掉的负测度集合是越来越小且可控的, 但是由于最后得到的正测度最大的极限 $A$ 仍然不是纯正的, 所以它还可以再去掉一个超过 $- 1 / n$ 的负测度集, 而这个时候不论 $n$ 多大, 总有某个 $n_j > n$, 而当时已经选择了最小的 $n_j$ 作为 bound], 但是这里得到的却是: 有一个更小的 $n$ 可以选择, 表明了矛盾.

#figure(image("../assets/ch3-pics-Screenshot 2025-03-25 at 21.21.13.png", width: 45.0%),
  caption: [
  ]
)

]
== Jordan decomposition \[Fol 3.1, finished\]
<jordan-decomposition-fol-3.1-finished>
对于任意的 signed measure $nu$, 我们已经通过 Hahn-Decomposition 证明了它一定把集合分为一个 positive set $P$ 和一个 negative set $N$, 并且 unique in $nu$-a.e. sense. \

#example(
)[
Consider mble space $\(bb(N)\,cal(P)\(bb(N)\)\)$, 考虑由$ nu\({ n }\)= n - 3 $
和 countable subadditivity 生成的 signed measure. 从而: $ P = { 1\,2\,3 }\,quad N = bb(N)\\P $
也可以把 $3$ 划分进 $N$, 因为 ${ 3 }\,diameter$ 是这里唯一的 null set.

]
=== mutually singular s.m.
<mutually-singular-s.m.>
#definition(
  title: [#kn[mutually singular]],
)[
我们称两个 signed measure $nu_1\,nu_2$ on $\(X\,cal(A)\)$ 是 mutually singular 的, 如果 $X = E_1 union.sq E_2$, 其中 $E_i$ 是 $nu_i$ 的 null set. \ 简单而言就是: 这两个 measure 可以把

live on disjoint sets, 在对方 live on 的部分总是 null 的.

]
#figure(image("../assets/ch3-pics-singular.png", width: 24.0%),
  caption: [
  ]
)

#remark[
Note: Mutually Singular 并不要求对于任意一个集合, 这两个s.m. 至多有一个不为 $0$ (否则考虑全集 $X$); mutually singular 要求的是：#strong[存在一个分割 of $X$, 使得这两个 s.m. 各在一边是 null 的], 从而在这两个子集上, $nu_1 + nu_2$ 这个 s.m. 就等于 $nu_1$ 和 $nu_2$. \ 我们知道, (positive) measure 比普通的函数更加复杂, 因为一旦在某个集合上有值, 它在这个集合的所有超集上都有更大的值, 因而不可能 \"两个 measure positive 的地方完全不同\". 但是 mutually singular 代表的是: #strong[这两个 measure 出现变化的区域完全不同.]

]
#example(
)[
\1. 把所有 measurable set map to $0$ 的 trivial measure 和任意 s.m. 都 mutually singular. \ 2. 再比如: $ \(X\,cal(A)\)=\(bb(R)\,cal(B)\(bb(R)\)\) $
我们选择 Lebesgue measure as $nu_1$, discrete measure as $nu_2$, Cantor measure as $nu_3$. $ nu_1 : = m\,quad nu_2 := sum_(j = 1)^oo c_j delta_(x_j)\,quad nu_3 : = mu_(C a n t o r) $
我们发现: 这三个 measure 中的任意两个都是 mutually singular 的. \ 因为 discrete measure 支持的集合 ${ x_j }_1^oo$ 是 countable 的, $m\({ x_j }_1^oo\)= 0$\; 而对于 $\({ x_j }_1^oo\)^c$, 这个集合是 discrete measure 的 null set, 因为它并不包含指定的 seq 中的任何元素, showing that $ m tack.t sum_(j = 1)^oo c_j delta_(x_j) $
同理, recall Cantor set 的 Lebesgue meausre 为 $0$, 从而可以用 $C$ 和 $bb(R)\\C$ 的分割来说明 $ mu_(C a n t o r) tack.t m $
并且同理, 由于 Cantor measure 没有 atom, 即其中任何一个单点集的 Cantor measure 都是 $0$, 从而仍然可以采用 ${ x_j }_1^oo$ 和 $\({ x_j }_1^oo\)^c$ 的分割来说明: $ mu_(C a n t o r) tack.t sum_(j = 1)^oo c_j delta_(x_j) $

]
=== Jordan Decomposition Thm
<jordan-decomposition-thm>
现在, 我们对于 $E in cal(A)$ set $ nu^(+)\(E\): = nu\(E inter P\)gt.eq 0 $
以及 $ nu^(-)\(E\): = nu\(E inter N\)gt.eq 0 $

#lemma(
)[
对于 s.m. $nu$, 我们通过 Hahn Decomposition 得到 $P union.sq N = X$. \ Now let $ {nu^(+)\(E\): = nu\(E inter P\)gt.eq 0\
nu^(-)\(E\): = nu\(E inter N\)gt.eq 0 $
Then:

- $nu^(+)\,nu^(-)$ 是 $\(X\,cal(A)\)$ 上的 positive measure

- $nu^(+)\,nu^(-)$ 中#strong[至少有一个是 finite measure] (对应了 $nu$ admit 的是 $oo$ 还是 $- oo$)

- $ nu = nu^(+) - nu^(-) $

- $ nu^(+) tack.t thin nu^(-) $

]
#proof[
\1. 显然, $nu^(+)\,nu^(-)$ 都是 positive 函数, 并且由于 $ \( union.sq.big_(j = 1)^oo E_j \) inter P = union.sq.big_(j = 1)^oo\(E_j inter P\) $
(同理 for intersecting $N$), 它们满足 countable disjoint additivity, 因而是 $\(X\,cal(A)\)$ 上的 #strong[positive measure]. \ 2. By signed measure 的定义, $nu^(+)$ 和 $nu^(-)$ 必须有一个 finite. 因而 otherwise, 如果存在某个集合上这两个 measure 都 infinite measure 则 not well-defined (contracting well-definedness of $nu$); 如果不存在这样的集合则 $nu$ admit both $oo$ and $- oo$ (contradicting that $nu$ 只 admit 至多一个无穷). \ ~

\3. $ nu = nu^(+) - nu^(-) $ 是直接 by Hahn Decomposition 的. 因为任何一个 measurable set $E$ 都可以拆分成 $ \(E inter P\)union.sq\(E inter N\) $
\4. Directly follows from Hahn Decomposition.

]
#remark[
我们可以 compare $ nu = nu^(+) - nu^(-) $ 的分解 for $nu : cal(A) arrow.r accent(bb(R), macron)$ , with $ f = f^(+) - f^(-) $ 的分解 for $f : X arrow.r accent(bb(R), macron)$.

我们发现其实它们的形式是相同的, 只不过 measure 作用在集合作为元素上. \ $f^plus.minus$ is defined by: $ f^plus.minus : = max { plus.minus f\,0 } gt.eq 0 $and characterized by: $ { f^(+) eq.not 0 } union { f^(-) eq.not 0 } = diameter $
而 $nu^plus.minus$ is defined by:$ {nu^(+)\(E\): = nu\(E inter P\)gt.eq 0\
nu^(-)\(E\): = nu\(E inter N\)gt.eq 0 $
and characterized by: $ nu^(+) tack.t thin nu^(-) $

]
下面我们证明 Jordan decomposition:

#theorem(
  title: [#kn[Jordan decomposition theorem]],
)[
对于任意 s.m. $nu$ on $\(X\,cal(A)\)$, 都存在唯一的 positive measure $nu^(+)$, $nu^(-)$ s.t.

- $nu^(+)\,nu^(-)$ 是 $\(X\,cal(A)\)$ 上的 positive measure

- $nu^(+)\,nu^(-)$ 中#strong[至少有一个是 finite measure] (对应了 $nu$ admit 的是 $oo$ 还是 $- oo$)

- $ nu = nu^(+) - nu^(-) $

- $ nu^(+) tack.t thin nu^(-) $

]
#proof[
Existence 就是前一个 lemma 一模一样. 我们知道, Jordan decomposition 的测度分割来自于 Hahn decomposition 的全集分割. \ STS Uniqueness: \ 我们令 $nu = nu^(+) - nu^(-)$ 为通过 Hahn Decomposition 得到的 Jordan decomposition, 其中 $nu^(+) tack.t nu^(-)$ 分别 supported on $P$ 和 $N$. \ Suppose $nu = mu^(+) - mu^(-)$ 是另一个 decomposition s.t. $mu^(+) tack.t thin mu^(-)$. 于是存在 $E\,F in cal(A)$ s.t. $ E union.sq F = X\,quad mu^(+)\(E\)= mu^(-)\(F\)= 0 $
我们发现: $X = E union.sq F$ 是另一个 Hahn Decomposition of $nu$. 因而 $ P Delta E = N Delta F quad upright("is ") nu upright("-null") $
从而对于任意 $A in cal(A)$, $ mu^(+)\(A\)= mu^(+)\(A inter E\)= nu\(A inter E\)= nu\(A inter P\)= nu^(+)\(A\) $
因而 $ mu^(+) = nu^(+) $以及同理, $nu^(-) = mu^(-)$. 得证.

]
=== total variation measure
<total-variation-measure>
#definition(
  title: [#kn[total variation measure]],
)[
$ \|nu\|: = nu^(+) + nu^(-) $

]
Totcal variation measure 和原 s.m. 的关系, 可以类比一个函数的绝对值函数和它自身的关系, 因为 $ f = f^(+) - f^(-)\,quad\|f\|= f^(+) + f^(-) $
但是这里, 这个 $\|dot.op\|$ 符号和绝对值的 $\|dot.op\|$ 符号的意义并不一致: #strong[这个 $\|nu\|$ 并不是 $nu$ 的绝对值函数]. 在 positive, negative, null sets 上, $\|nu\|$ 确实是 $nu$ 的绝对值函数, 但是#strong[在内部既有 positive measure 的部分, 又有 negative measure 的部分的集合, 它的 total variation measure 是要比它的原 s.m. 的绝对值更大的.] 因而它才被叫做原 s.m. 的 total variation measure, 表示某个集合内部, 原 s.m. 从正到负的#strong[最大变差].

#lemma(
)[
$\|nu\|$ 是 $\(X\,cal(A)\)$ 上的 positive measure. \ 并且 $\|nu\|$ finite iff $nu^(+)$ 和 $nu^(-)$ 都 finite. \ (Then we define: 我们称 $nu$ 是 finite 的, if $\|nu\|$ finite p.m.)

]
#proof[
trivial.

]
=== integration w.r.t. s.m.
<integration-w.r.t.-s.m.>
#definition(
  title: [#kn[integration w.r.t. signed measure]],
)[
对于 signed measure $nu$, 我们 set: $ L^1\(nu\): = L^1\(\|nu\|\)= L^1\(nu^(+)\)inter L^1\(nu^(-)\) $
且对于每个 $f in L^1\(nu\)$, 我们 set: $ integral f thin d nu : = integral f thin d nu^(+) - integral f thin d nu^(-) $

]
#proposition(
)[
我们知道, 对于任意 p.m. $mu$ on $\(X\,cal(A)\)$ 以及 $f in L^1\(mu\)$, $ nu\(E\): = integral_E f thin d mu $
定义了 $\(X\,cal(A)\)$ 上的一个 s.m. \ 而通过积分定义出来的 s.m., 对于任意一个 $E in cal(A)$, 有: $ nu^plus.minus\(E\)= integral_E f^plus.minus thin d mu $从而 $ \|nu\|\(E\)= integral_E\|f\|thin d mu $

]
#proof[
这是因为我们容易验证, by the procedure of Hahn decomp, $ x in P arrow.l.r.double f\(x\)gt.eq 0 $
因而 $ nu^(+)\(E\)= integral_(E inter { f gt.eq 0 }) f thin d mu = integral_E f^(+) thin d mu $

]
We will learn that: 这个 $f$ 正是 $nu$ w.r.t. $mu$ 的 Radon-Nikodym derivative, 从而 $f\(x\)$ 表示在某个元素处, $nu$ 相对于 $mu$ 的变化趋势. 而 total variation measure of $nu$ 正是把所有的元素上的这个变化趋势都取正 (即取总变化量, 不管方向) 得到的.

#lemma(
  title: [#ref[total variation measure]],
)[
令 $nu$ be a s.m. on $\(X\,cal(A)\)$, $E in cal(A)$, 则

- $ \|nu\(E\)\|lt.eq\|nu\|\(E\) $

- $ E upright(" null w.r.t. ") nu arrow.l.r.double\|nu\|\(E\)= 0 arrow.l.r.double nu^(+)\(E\)= nu^(-)\(E\)= 0 $

- 如果 $kappa$ 是 $\(X\,cal(A)\)$ 上的另一个 s.m., 则 $ kappa tack.t thin nu arrow.l.r.double kappa tack.t thin\|nu\|arrow.l.r.double kappa tack.t thin nu^(+) upright(" and ") kappa tack.t thin nu^(-) $

]
#proof[
By def 易得.

]
#heading(level: 5, numbering: none)[这两节课的总结]
<这两节课的总结>
- 我们定义了 signed measure;

- 我们发现一个 signed measure 如果不计较 null sets, 一定可以唯一地被分解成一个全 positive set 和一个全 negative set;

- 并且通过这个对 $X$ 的二分, 我们也得到了对原 s.m. $nu$ 的二分 $nu = nu^(+) - nu^(-)$, 这个分解也是唯一的

- 我们定义了 total varation measure of a s.m., $\|nu\|: = nu^(+) + nu^(-)$.

- 我们定义了什么样的函数对于一个 s.m. $nu$ 是可积的: 对于 $nu^(+)$, $nu^(-)$ 都可积即可. 从而 general 的积分: $ integral f thin d nu & : = integral f thin d nu^(+) - integral f thin d nu^(-)\
   & = \( integral Re f thin d nu^(+) + i integral Im f thin d nu^(+) \) - \( integral Re f thin d nu^(-) + i integral Im f thin d nu^(-) \)\
   & = \( \( integral Re f^(+) thin d nu^(+) - integral Re f^(-) thin d nu^(+) \) + i \( integral Im f^(+) thin d nu^(+) - integral Im f^(-) thin d nu^(+) \) \)\
   & quad - \( \( integral Re f^(+) thin d nu^(-) - integral Re f^(-) thin d nu^(-) \) + i \( integral Im f^(+) thin d nu^(-) - integral Im f^(-) thin d nu^(-) \) \) $
  这一个式子里包含了八个小积分. 我们目前学到的就是这么多. 如果引入 complex measure 的话,
