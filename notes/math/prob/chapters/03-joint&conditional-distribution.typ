#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *
#import "../diagrams/probability-diagrams.typ": *

= joint and conditional distributions
<joint-and-conditional-distributions>
== random vector and joint distributions
<random-vector-and-joint-distributions>
=== random vector
<random-vector>
#definition(
  title: [#kn[random vector]],
)[
对于 prob space $\(Omega\,cal(F)\,P\)$,
一个 function $upright(bold(X)) : Omega arrow.r bb(R)^n$ 如果是一个
$\(cal(F)\,cal(B)\(bb(R)^n\)\)$-measurable function
(即 #ref[$\(cal(M)\,cal(N)\)$-measurable function] 在这两个 measurable spaces 上的情形), 则
称它为一个 $n$-dimensional #ref[random variable], 或者 $n$-dimensional random vector.

通常我们将 random vector 写成分量形式
$ upright(bold(X))\(omega\)=\(X_1\(omega\)\,X_2\(omega\)\,dots.h\,X_n\(omega\)\)^T $

]
random vector 相当于在一个 prob space 上, 考虑多个重新分配 mass 的方法, 并把它们并列起来.

#proposition(
  title: [#kn[由 $n$ 个 random variable 构成的 vector 是一个 random vector]],
)[
令 $X_1\,X_2\,dots.h.c\,X_n$
是定义在#strong[同一个 prob space] $\(Omega\,cal(F)\,bb(P)\)$
上的 $n$ 个 random variables. 则函数 $upright(bold(X)) : Omega arrow.r bb(R)^n$ defined by
$ omega mapsto\(X_1\(omega\)\,X_2\(omega\)\,dots.h.c\,X_n\(omega\)\)^T $
是一个 random vector.

]
#proof[
我们在 measure theory 中证明过: 对于任意的 finite seq of Borel measureable functions
$\(f_i : Omega arrow.r bb(R)\)_(i = 1)^k$, 其各作为一个维度组成的函数
$f =\(f_1\,dots.h.c\,f_k\)$ 也是一个 Borel measurable function (from $Omega$ 到 $bb(R)^k$).

]
#proposition(
  title: [#kn[一个 random vector 的每个分量都是一个 random variable]],
)[
令 $upright(bold(X)) =\(X_1\,X_2\,dots.h.c\,X_n\)^T$ 是一个 random vector.
则对于任意 $i$, $X_i$ 都是一个 random variable.

]
#proof[
对于 $upright(bold(X)) : Omega arrow.r bb(R)^n$ 是 $\(cal(F)\,cal(B)\(bb(R)^n\)\)$-measurable,
我们可以将第 $i$ 个分量 $X_i$ 看作是 composition of two maps:
$ X_i = pi_i compose upright(bold(X)) $
其中 $pi_i : bb(R)^n arrow.r bb(R)$ projection map $pi_i\(x_1\,dots.h\,x_n\)= x_i$. \ 由于 projection map $pi_i$ 是一个 Borel measurable function, 我们可以得出: $X_i = pi_i\(upright(bold(X))\)$ 也是
一个 Borel measurable function, 也就是一个 random variable.

]
#remark[
上两条 propositions 说明了一个事情: random vectors 和其分量 random variables 完全相互决定.

- #strong[random variables 组合起来一定是一个 random vector.]

- #strong[random vector 拆开每个分量一定是 random variable.]

因而, 研究一个 random vector 也就相当于研究分量 random variables 之间的关系.

这一章节我们会从 random vector 的性质
(比如 #strong[joint distribution 和 marginal distribution, conditional distribution])
出发, 研究分量 random variables 之间的关系.

\(但是注意: 前提是这些 random variables 必须定义在同一个 prob space 上. 也就是, 它们的 base
probability measure 一定相同. 如果我们考虑不同 prob space 上的 random variables 的话,
那它们没有一个公共的 base probability measure, 很难说它们之间有什么关系.
这种情况下, 我们需要 coupling: 构造一个新的 prob space (说白了就是 product space),
让这两个 random variables 都有一个新 version. 这一问题我们之后再讨论.)

]
=== joint distribution
<joint-distribution>
#definition(
  title: [#kn[joint distribution] and #kn[joint cdf]],
)[
令 $X_1\,dots.h.c\,X_n$ 为 RV from the same prob space.
即 $upright(bold(X)) :=\(X_1\,dots.h.c\,X_n\)$
是一个 random vector.
下面的两个对象分别将 #ref[probability distribution] 和
#ref[distribution function (也称 #strong[cumulative distribution function, cdf])] 推广到 random vector.

我们称 $bb(P)^(upright(bold(X))) : bb(R)^n arrow.r bb(R)$ defined by
$ bb(P)^(upright(bold(X)))\(B\)= bb(P)\(upright(bold(X))^(- 1)\(B\)\)\,quad forall B in cal(B)\(bb(R)^n\) $
为 $X_1\,dots.h.c\,X_n$ 的 #strong[joint distribution].

而我们称 $F_(upright(bold(X))) = F_(X_1\,dots.h.c\,X_n) : bb(R)^n arrow.r bb(R)$ defined by
$ F_(upright(bold(X)))\(x_1\,dots.h.c\,x_n\)= bb(P)\(X_1 lt.eq x_1\,dots.h.c\,X_n lt.eq x_n\) $
(即 $bb(P)^(upright(bold(X)))$ restricted to the set of rectangles
${\(- oo\,x_1\]times dots.h.c times\(- oo\,x_n\]:\(x_1\,dots.h.c\,x_n\)in bb(R)^n }$)
为它们的 #strong[joint distribution function (或称 joint cdf)].

]
joint distribution 的定义已经包括了如何从多个 random variables 的 distributions
得到一个 joint distribution.
而, 我们也可以从一个 joint distribution 的 limit behavior
得到每个 random variable 分量的 distributions, 称之为 marginal distribution:

#definition(
  title: [#kn[marginal distribution]],
)[
令 $upright(bold(X)) =\(X_1\,dots.h.c\,X_n\)^T$ 是一个 random vector.
则对于任意 $i$, $X_i$ 的 distribution $bb(P)^(X_i)$
被称为 $upright(bold(X))$ 的第 $i$ 个分量的 #strong[marginal distribution].

]
我们以 $bb(R)^2$ 为例. 得出的结论可以推广到 $bb(R)^n$.

#proposition(
  title: [#kn[通过 joint distribution 的极限得到 marginal distribution]],
)[
令 $upright(bold(X)) =\(X_1\,X_2\)^T$ 是一个 random vector.
则对于任意 $x in bb(R)$, 有
$ bb(P)\(X_1 lt.eq x\)= lim_(y arrow.r oo) F_(upright(bold(X)))\(x\,y\) $
$X_2$ 的 marginal distribution 也可以通过同样的方法得到.

此外, joint distribution 有其他明显的 limit behaviors:

- $ lim_(x arrow.r - oo) F\(x\,y\)= lim_(y arrow.r - oo) F\(x\,y\)= 0 $

- $F_(upright(bold(X)))$ 对于每个维度都是 increasing 且 right-continuous 的.

- $ bb(P)\(X lt.eq x\,Y lt.eq y\)= lim_(z arrow.t y) F\(x\,z\)= lim_(z arrow.t x) F\(z\,y\)= lim_(z_1 arrow.t x\,z_2 arrow.t y) F\(z_1\,z_2\) $

- $ bb(P)\(x_1 lt.eq X lt.eq x_2\,y_1 lt.eq Y lt.eq y_2\)= F\(x_2\,y_2\)- F\(x_1\,y_2\)= F\(x_2\,y_1\)+ F\(x_1\,y_1\) $

]
#remark[
最后一条: 右边相当于
$ bb(P)\(x_1 < X < x_2\,Y < y_2\)- bb(P)\(x_1 < X < x_2\,Y < y_1\) $
因而成立.

]
discrete random vector 很容易处理. 我们可以直接定义 joint pmf.
而 continuous random vector 需要展开讨论. 接下来我们讲单独讨论
continuous random vector 的 joint distribution.

=== condinuous joint cdf 与 joint pdf
<condinuous-joint-cdf-与-joint-pdf>
recall:
#ref[continuous random variable] $X$ 的
cdf 是 absolutely continuous 的. 这个条件也等价于, 存在一个函数 $f_X : bb(R) arrow.r\[0\,oo\)$
使得 $ F_X\(x\)= integral_(- oo)^x f_X\(t\)thin d t $

这个定义可以 generalize 到 random vector 上.

#definition(
  title: [#kn[continuous random vector] 和 #kn[continuous joint cdf]],
)[
对于 random vector $upright(bold(X)) =\(X_1\,dots.h.c\,X_n\)^T$
如果 $bb(P)^(upright(bold(X))) lt.double lambda^n$,
即它满足 #ref[absolute continuity of signed measures] 中的绝对连续性条件,
即存在一个函数 $f_(upright(bold(X))) : bb(R)^n arrow.r\[0\,oo\)$ 使得对于任意 Borel set $B subset.eq bb(R)^n$, 有
$ bb(P)^(upright(bold(X)))\(B\)= integral_B f_(upright(bold(X)))\(x_1\,dots.h.c\,x_n\)thin d lambda^n\(x_1\,dots.h.c\,x_n\) $
则称 $upright(bold(X))$ 是一个 #strong[continuous random vector].

注意: 由于是在 $bb(R)^n$ 上, 这等价于存在一个函数 $f_(upright(bold(X))) : bb(R)^n arrow.r\[0\,oo\)$ 使得对于任意 $x_1\,dots.h.c\,x_n$, 有
$ F_(upright(bold(X)))\(x_1\,dots.h.c\,x_n\)= integral_(- oo)^(x_1) dots.h.c integral_(- oo)^(x_n) f_(upright(bold(X)))\(t_1\,dots.h.c\,t_n\)thin d t_n dots.h.c d t_1 $

]
#remark[
这个函数 $f_(upright(bold(X)))$
就是 continuous random vector $upright(bold(X))$
的 #strong[joint probability density function (joint pdf).]
它是 #ref[probability density function (pdf)] 在 random vector 上的对应概念.
它是 joint distribution measure $bb(P)^(upright(bold(X)))$
对于 Lebesgue measure $lambda^n$ 的 #ref[Radon-Nikodym derivative]: $ frac(d bb(P)^(upright(bold(X))), d lambda^n) = f_(upright(bold(X))) $

]
#remark[
我们已经知道, 只要存在导数 $f_(upright(bold(X)))$ 可以对于任意 $upright(bold(x)) in bb(R)^n$
还原出 joint cdf $F_(upright(bold(X)))$ 的值, 那么 $f_(upright(bold(X)))$ 就是 joint pdf,
这个 random vector 就是一个 continuous random vector.

那么这个还原积分的计算可以任意换序吗?

显然是可以的. 因为 recall #ref[Fubini's Theorem]: 只要 $f$ 绝对可积, 即
$integral_(bb(R)^n)\|f\|thin d lambda^n < oo$,
那么对于任意的 permutation $sigma$ of ${ 1\,2\,dots.h.c\,n }$, 我们都可以将积分的顺序换成
$ integral_(- oo)^(x_(sigma\(1\))) dots.h.c integral_(- oo)^(x_(sigma\(n\))) f\(t_1\,dots.h.c\,t_n\)thin d t_(sigma\(n\)) dots.h.c d t_(sigma\(1\)) $
而我们知道, $f$ 一定是非负的, 而且积分一定是 1, 因而可以任意换序积分.

这就很舒服. 这也给出了 margin distribution 的计算方法:
只要对 joint pdf $f_(upright(bold(X)))$ 在其他维度上积分掉就行了.

]
#remark[
注意: #strong[多个 continuous random variables 的 joint distribution
不一定是 continuous 的.]
反例: 考虑 random vector $upright(bold(X)) =\(X\,X\)^T$ where $X tilde.op upright("Uniform")\(0\,1\)$
则 $bb(P)\(\(X\,X\)in { y = x }\)= 1$. 而注意, ${ y = x }$ 在 $bb(R)^2$ 中的 Lebesgue measure 为 0,
而 absolute continuity 要求: 对于一个零测集, 其 $bb(P)^(upright(bold(X)))$ 测度也必须是 0 (这是 $bb(P)^(upright(bold(X))) lt.double lambda^n$ 的标准定义),
因而 joint distribution 不是 continuous 的.

]
#proposition(
  title: [#kn[joint pdf 和 joint cdf 的性质]],
)[
令 $upright(bold(X)) =\(X_1\,dots.h.c\,X_n\)^T$ 是一个 continuous random vector,
则它的 joint pdf $f_(upright(bold(X)))$ 和 joint cdf $F_(upright(bold(X)))$ 有以下性质:

- $f_(upright(bold(X))) gt.eq 0$ a.e. 并且 $integral_(bb(R)^n) f_(upright(bold(X))) thin d lambda^n = 1$.

- \(如果一个集合 $A$ 有一个零测维度, 那么 $bb(P)^(upright(bold(X)))\(A\)= 0$)
  $ bb(P)\(X_1 = x_1\,x_2 lt.eq X_2 lt.eq x'_2 dots.h.c\,x_n lt.eq X_n lt.eq x'_n\)= 0 $

- 每个 $X_i$ 的 marginal distribution 也是 (absolutely) continuous 的,
  并且 $ f_(X_i)\(x\)= integral_(bb(R)^(n - 1)) f_(upright(bold(X)))\(t_1\,dots.h.c\,t_(i - 1)\,x\,t_(i + 1)\,dots.h.c\,t_n\)thin d t_1 dots.h.c d t_(i - 1) d t_(i + 1) dots.h.c d t_n $
  例如, $ f_X\(x\)= integral_(- oo)^oo f_(upright(bold(X)))\(x\,y\)thin d y $

- 对每个 $x_1\,dots.h.c\,x_n in bb(R)$, 都可以通过偏导数从 joint cdf 得到
  joint pdf (这个偏导数一定 (a.e.) 存在):
  $ f_(upright(bold(X)))\(x_1\,dots.h.c\,x_n\)= frac(partial^n, partial x_1 dots.h.c partial x_n) F_(upright(bold(X)))\(x_1\,dots.h.c\,x_n\) $
  并且 by Fubini's theorem 可以 (a.e.) 任意换序:
  $ frac(partial^n, partial x_(sigma\(1\)) dots.h partial x_(sigma\(n\))) F_(upright(bold(X))) =^(a . e .) f_(upright(bold(X))) $

]
#proof[

- 由于 $f_(upright(bold(X)))$ 是 $bb(P)^(upright(bold(X)))$ 对于 $lambda^n$ 的 Radon-Nikodym derivative,
  因为任何 Borel 集 $B$ 都有 $P^(upright(bold(X)))\(B\)gt.eq 0$,
  假设存在一个集合 $A in cal(B)\(bb(R)^n\)$
  使得在其上 $f_(upright(bold(X))) < 0$ 且 $lambda^n\(A\)> 0$,
  那么根据积分定义$ bb(P)^(upright(bold(X)))\(A\)= integral_A f_(upright(bold(X))) thin d lambda^n < 0 $
  因而反证得 $f_(upright(bold(X))) gt.eq 0$ a.e.

  并且 $ integral_(bb(R)^n) f_(upright(bold(X))) thin d lambda^n = bb(P)^(upright(bold(X)))\(bb(R)^n\)= 1 $

- natural.

- 即 marginal distribution 的定义在 continuous case 中的展开

- by Fubini's theorem, 以及 joint cdf 的定义.

]
#example(
)[
考虑
$ f_(X\,Y)\(x\,y\)= cases(delim: "{", c e^(- x) e^(- 2 y)\, & upright(" if ") x\,y > 0, 0\, & upright(" otherwise ")) $
Find $c$ 使得这是一个合法的 joint pdf,
并且计算 $X$ 和 $Y$ 的 marginal pdfs, 以及 $bb(P)\(X > 1\,Y < 1\)$.

]
#solution[
我们需要
$ c (integral_0^oo e^(- x) d x) (integral_0^oo e^(- 2 y) d y) = 1 $
evaluate 这两个积分:
$ integral_0^oo e^(- x) d x = [- e^(- x)]_0^oo = 1\, $
$ integral_0^oo e^(- 2 y) d y = [- 1 / 2 e^(- 2 y)]_0^oo = 1 / 2 $
因为 $c$ 必须为 2.

计算 $X$ 的 marginal pdf:
$ f_X\(x\)= integral_0^oo 2 e^(- x) e^(- 2 y) d y = 2 e^(- x) [- 1 / 2 e^(- 2 y)]_0^oo = e^(- x) $
然后计算 $Y$ 的 marginal pdf:
$ f_Y\(y\)= integral_0^oo 2 e^(- x) e^(- 2 y) d x = 2 e^(- 2 y) [- e^(- x)]_0^oo = 2 e^(- 2 y) $
最后计算 $bb(P)\(X > 1\,Y < 1\)$:
$ bb(P)\(X > 1\,Y < 1\)= integral_1^oo integral_0^1 2 e^(- x) e^(- 2 y) d y d x = (integral_1^oo e^(- x) d x) (integral_0^1 2 e^(- 2 y) d y) $
这两个定积分分别为:
$ integral_1^oo e^(- x) d x = [- e^(- x)]_1^oo = e^(- 1)\, $
$ integral_0^1 2 e^(- 2 y) d y = [- e^(- 2 y)]_0^1 = 1 - e^(- 2) $
因而$ bb(P)\(X > 1\,Y < 1\)= e^(- 1)\(1 - e^(- 2)\)= e^(- 1) - e^(- 3) $

]

#theorem(
)[
对于 continuous random vector $upright(bold(X)) =\(X_1\,dots.h.c\,X_n\)^T$,
取任意 Borel measurable function $g : bb(R)^n arrow.r bb(R)$,
则 $g\(upright(bold(X))\)$ 是一个 random variable, 并且如果 $bb(E)\[\|g\(upright(bold(X))\)\|\]< oo$, 则
, 则
$ bb(E)\[g\(upright(bold(X))\)\]= integral_(bb(R)^n) g\(upright(bold(x))\)f_(upright(bold(X)))\(upright(bold(x))\)thin d lambda^n\(upright(bold(x))\) $

]
#example(
)[
Let $\(X\,Y\)$ be a two-dimensional random variable with joint density function
$ f_(X\,Y)\(x\,y\)= cases(delim: "{", 1\, & 0 < y / 2 < x < 1, 0\, & upright(" otherwise ")) $

- 求 marginal density $f_Y$

- 计算概率 $bb(P)\(X = 1\/2\)$ 和 $bb(P)\(X + Y lt.eq 3\/2\)$

]
#solution[
- 对固定 $y$ 需要满足 $0 < y < 2 x$ 且 $x < 1$, 等价于 $x > y\/2$ 且 $x < 1$. 因而 $0 < y < 2$
  $ f_Y\(y\)= integral_(- oo)^oo f_(X\,Y)\(x\,y\)d x = integral_(y\/2)^1 1 d x = 1 - y / 2\,quad 0 < y < 2 $
  否则 $f_Y\(y\)= 0$.

- 由于 $X$ 是一个 continuous random variable, $bb(P)\(X = 1\/2\)= 0$.

  $bb(P)\(X + Y lt.eq 3\/2\)$ 略微难算一点:
  满足条件的区域为 ${\(x\,y\): 0 < y / 2 < x < 1\,y lt.eq 3\/2 - x }$,
  $ 0 < y < min\(2 x\,3\/2 - x\) $

  比较两条上界直线: $2 x = 3\/2 - x arrow.r.double x = 1\/2$
  当 $0 < x < 1\/2$, 有 $2 x < 3\/2 - x$, 所以上界是 $2 x$\; 当 $1\/2 < x < 1$, 上界是 $3\/2 - x$.

  所以概率等于面积积分：
  $ bb(P)\(X + Y lt.eq 3\/2\)= integral_0^(1\/2) integral_0^(2 x) 1 d y d x + integral_(1\/2)^1 integral_0^(3\/2 - x) 1 d y d x $

  计算：
  $ integral_0^(1\/2) 2 x d x = [x^2]_0^(1\/2) = 1 / 4\
  integral_(1\/2)^1 (3 / 2 - x) d x = [3 / 2 x - x^2 / 2]_(1\/2)^1 = 1 - 5 / 8 = 3 / 8 $

  合并得
  $ bb(P)\(X + Y lt.eq 3\/2\)= 1 / 4 + 3 / 8 = 5 / 8 $

  也可以通过画图来做. 我们画出 support set 的图:

  #diagram(
    prob-03-joint-conditional-distribution-diagram-01,
    id: "fig-prob-03-joint-conditional-distribution-diagram-01",
    caption: [联合分布 support 中满足 $X+Y <= 3/2$ 的积分区域],
    alt: "The shaded portion of the support lies below x+y=3/2, split at x=1/2.",
  )
  在这个图上对联合函数积分即可.

]

== independence of two random variables
<independence-of-two-random-variables>
=== independence of two random variables 的三种等价定义
<independence-of-two-random-variables-的三种等价定义>
#definition(
  title: [#kn[independence via product distribution
of marginal distributions]],
)[
两个 random variables $X\,Y : Omega arrow.r bb(R)$ 被称为 independent 的,
如果对于任意的 Borel sets $A\,B subset.eq bb(R)$, 都有
$ bb(P)\(X in A\,Y in B\)= bb(P)\(X in A\)dot.op bb(P)\(Y in B\) $
注意这个定义等价于 for all points $\(x\,y\)in bb(R)^2$,
$ F_(X\,Y)\(x\,y\)= F_X\(x\)F_Y\(y\) $
即#strong[它们的 joint distribution 是它们 marginal distributions 的 product.]

]
对于 discrete 和 continuous random variables 而言, 这还意味着 independence 等价于:

- joint pmf 是 marginal pmfs 的 product, for discrete case.

- joint pdf 是 marginal pdfs 的 product, for continuous case.

这里离散情形沿用 #ref[discrete random variable] 的定义.
详细而言:

#theorem(
  title: [#kn[independence via joint-density factorization
marginal densities]],
)[
令 $X\,Y$ 是两个 random variables.

- 如果 $X\,Y$ 是 discrete random variables,
  则它们 independent 的条件等价于对于任意 $x\,y$, 都有
  $ p_(X\,Y)\(x\,y\)= p_X\(x\)dot.op p_Y\(y\) $

- 如果 $X\,Y$ 是 continuous random variables, 则它们 independent 的条件等价于对于任意 $x\,y$, 都有
  $ f_(X\,Y)\(x\,y\)= f_X\(x\)dot.op f_Y\(y\) $

]
#proof[
discrete case: 显然可得.

continuous case:

- $F_(X\,Y)\(x\,y\)= F_X\(x\)F_Y\(y\)arrow.r.double.long f_(X\,Y)\(x\,y\)= f_X\(x\)dot.op f_Y\(y\)$: 取偏导数即可.

- $f_(X\,Y)\(x\,y\)= f_X\(x\)dot.op f_Y\(y\)arrow.r.double.long F_(X\,Y)\(x\,y\)= F_X\(x\)F_Y\(y\)$: 积分即可.

]
因而对于 independent 的两个
random variables, 固定 $X = x_0$, 那么联合密度函数
$f_(X\,Y)\(x_0\,y\)$ 就是 $Y$ 的边际密度函数 $f_Y\(y\)$ 乘上
一个常数 $f_X\(x_0\)$. \

#remark[
Recall #ref[independence of events] 的定义:
$ bb(P)\(A inter B\)= bb(P)\(A\)dot.op bb(P)\(B\) $
也等价于对于任意的 Borel sets $A\,B$ where $bb(P)\(B\)> 0$, 都有
$ bb(P)\(A divides B\)= bb(P)\(A\) $
即: 一个事件发生与否都不会对另一个事件发生的概率产生任何影响.

而再看到两个 random variables independence 的定义是:
$ bb(P)\(X in A\,Y in B\)= bb(P)\(X in A\)dot.op bb(P)\(Y in B\) $
这个定义也当然等价于:

#proposition(
  title: [#kn[independence via conditional distribution:
marginal distribution]],
)[
两个 random variables $X\,Y$ 是 independent 的, iff: 对于任意的 Borel sets $A\,B$,
如果$bb(P)\(Y in B\)> 0$, 则
$ bb(P)\(X in A divides Y in B\)= bb(P)\(X in A\) $
即: #strong[$X$ 的 conditional distribution,
不论给定 $Y$ 的任何信息, 都等于 $X$ 的 marginal distribution.]

]
所以它实际上意义是: #strong[知道一个 random variable 的任何信息, 对于另外一个都没有任何帮助.]

因而#strong[它们的 joint distribution 可以分解成 marginal distributions 的 product]. \

]
#remark[
Furthermore: 我们不难发现一件事情, 可以#strong[在 independence
of two events 和 independence of two random variables 之间建立一个桥梁:]

#proposition(
  title: [#kn[independence via generated sigma-algebras]],
)[
令 $X\,Y$ 是两个 random variables.
则 $X\,Y$ 是 independent 的 iff:
$X$ 和 $Y$ 按 #ref[$sigma$-algebra generated by a random variable (measurable function)]
分别生成的 $sigma\(X\)$ 和
$sigma\(Y\)$ 中分别任取一个事件, 这两个事件都是 independent 的. 即:
$ forall A in sigma\(X\)\,forall B in sigma\(Y\)\,quad bb(P)\(A inter B\)= bb(P)\(A\)dot.op bb(P)\(B\) $

]
这严格说明了: #strong[两个 random variables 之间的 independence,
本质上是它们各自蕴含的 information
(由 generated sigma-algebra 严格刻画) 的完全不相关]:
对 $X$ 的观测对于
预测 $Y$ 的任何行为都不提供任何帮助, 反之亦然. \

]
以上就是 independence of two random variables 的定义, 以及其
information geometric intuition.

下面我们讲 independence between two random variables, generalize
到 mutual independence among 任意的 family of random variables.

=== mutual independence of a family of random variables: 强于 pairwise independence
<mutual-independence-of-a-family-of-random-variables-强于-pairwise-independence>
我们定义了两个 random variables 的 independence,
但是这个定义可以推广到多个 (甚至 uncountably many) random variables 上.

#definition(
  title: [#kn[#strong[mutual independence] of multiple random variables]],
)[
令 ${ X_i : i in I }$ 是一个 random variables 的 family,
其中 $I$ 是一个 index set.
则如果对于任意的 finite subset $J subset.eq I$,
以及对于任意的 Borel sets ${ A_j : j in J }$, 都有
$ bb(P)\(X_j in A_j\,forall j in J\)= product_(j in J) bb(P)\(X_j in A_j\) $
则称这个 family of random variables 是 independent 的.

]
注意: #strong[joint mass $&$ density 的 factorization 也可以推广到多个 random variables 上.]
有一件事情值得说明:
这里定义的是#strong[mutual independence], 也就是说, 对于任意的 finite subset $J$,
它们的 joint distribution 都 factorizes into product of marginal distributions.

而#strong[两两 independent 的 random variables family 不一定是 mutual independent 的.]
即: 如果对于任意的 $i eq.not j$, $X_i$ 和 $X_j$ 是 independent 的,
并不意味着对于任意的 finite subset $J$, ${ X_j : j in J }$ 是 independent 的.

举个例子:

#example(
  title: [pairwise independence does NOT imply mutual independence],
)[
假设我们抛掷两枚公平的硬币.
令 $X\,Y$ 是两个 independent 的 random variables,
且都服从 uniform distribution on ${ - 1\,1 }$. 即:
$ bb(P)\(X = 1\)= bb(P)\(X = - 1\)= 1 / 2\,quad bb(P)\(Y = 1\)= bb(P)\(Y = - 1\)= 1 / 2 $
现在, 我们定义第三个 random variable $Z$ 为前两者的 product:
$ Z = X dot.op Y $
容易验证: $X\,Y\,Z$ 两两 independent, 但不 mutual independent.
因为如果只是知道 $X$ 的值, 那么我们对于 $Z$ 的值完全没有信息
(因为有一个完全随机的 $Y$ 没有任何已知信息); 同样,
如果只是知道 $Y$ 的值, 那么我们对于 $Z$ 的值也完全没有信息;

但是, 如果我们同时知道 $X$
和 $Y$ 的值, 那么 $Z$ 的值就完全确定了.

这说明 #strong[pairwise independence 只能保证局部的信息解耦,
而 mutual independence 则保证了在这个 family of random variables 之间的全局信息解耦.]

]
=== independent $arrow.r.double.long$ uncorrelated
<independent-implies-uncorrelated>
Independence 的概念会让我们回忆起另外一个刻画两个 random variables
之间关系的概念: covariance, 它丈量了#strong[两个 random variables 之间的线性关系].

#ref[covariance] 的定义:
$ "Cov"\(X\,Y\):= bb(E)\[\(X - bb(E)\[X\]\)\(Y - bb(E)\[Y\]\)\]= bb(E)\[X Y\]- bb(E)\[X\]bb(E)\[Y\] $

我们称 covariance 为 0 的两个 random variables 为 #kn[uncorrelated random variables].
我们容易发现: #strong[independence 是一个比 uncorrelated 更强的概念:]

#proposition(
  title: [#kn[independent 严格强于 uncorrelated]],
)[
令 $X\,Y$ 是两个 random variables.
则 $X\,Y$ 是 independent 的 $arrow.r.double.long$ $"Cov"\(X\,Y\)= 0$.
但是 $"Cov"\(X\,Y\)= 0$ 不一定 $arrow.r.double.long$ $X\,Y$ 是 independent 的.

]
#proof[

- independence $arrow.r.double.long$ covariance 是 0, 因为 independence 显然 imply$E\[X Y\]= E\[X\]E\[Y\]$,
  从而 covariance 的定义式中 $E\[X Y\]- E\[X\]E\[Y\]= 0$.

- 有一个经典反例: 考虑 $X$ 是任意按原点对称的分布, 比如一个 standard normal distribution; 而定义 $Y = X^2$,
  此时 $ upright("Cov")\(X\,X^2\)= E\[X dot.op X^2\]- E\[X\]E\[X^2\]= E\[X^3\]- E\[X\]E\[X^2\] $
  由于 $X$ 的分布是关于原点对称的, $E\[X^3\]= 0$ 且 $E\[X\]= 0$, 因而 covariance 是 0.
  但是 $X$ 和 $Y$ 显然不是 independent 的.

]
#remark[
本质上, independence 是一种最强的全局信息不相关性.
而 covariance 只度量 linear relationship.
试想: 如果这两个随机变量之间的关系是这样的呢?

#diagram(
  prob-03-joint-conditional-distribution-diagram-02,
  id: "fig-prob-03-joint-conditional-distribution-diagram-02",
  caption: [圆周关系说明零协方差不蕴含独立性],
  alt: "Points constrained to a circle have zero covariance but remain dependent.",
)
那么它们的 covariance 是 0, 但是它们显然不是 independent 的. 所以 covariance
忽略了很多非线性的关系, 而 independence 则完全捕捉了所有的关系. \

]
刚才说到, 两个 random variables 的 independence 显然 imply
$bb(E)\[X Y\]= bb(E)\[X\]bb(E)\[Y\]$.
而 BTW: 这个性质其实#strong[可以 generalize 到任意
finite number of independent random variables 的 product 上, 并且
我们可以在这些 random variables 上任意地施加 Borel measurable functions],
只要保证这些函数的 expectation 是 finite 的,

#theorem(
  title: [#kn[independence $arrow.r.double.long$ expectation is closed under product]],
)[
令 ${ X_i : i in I }$ 是一个 independent 的 random variables 的 family,
则对于任意的 finite subset $J subset.eq I$, 以及对于任意的 Borel measurable functions ${ g_j : j in J }$,
如果 $bb(E)\[\|g_j\(X_j\)\|\]< oo$ for all $j in J$, 则
$ bb(E) [product_(j in J) g_j \( X_j \)] = product_(j in J) bb(E)\[g_j\(X_j\)\] $
特别地, 取每个 $g_j\(x\)= x$, 则
$ bb(E) [product_(j in J) X_j] = product_(j in J) bb(E)\[X_j\] $

]
#proof[
令 $J = { 1\,2\,dots.h\,n }$.
由于 $X_1\,dots.h\,X_n$ 是 independent 的, 它们的 joint distribution
$mu_(upright(bold(X)))$ 是其 marginal distributions $mu_(X_j)$ 的 product measure: $ mu_(upright(bold(X))) = mu_(X_1) times mu_(X_2) times dots.h times mu_(X_n) $
根据 Change of Variables Formula,
$ bb(E) [product_(j = 1)^n g_j \( X_j \)] = integral_(bb(R)^n) (product_(j = 1)^n g_j \( x_j \)) thin d mu_(upright(bold(X)))\(x_1\,dots.h\,x_n\)= integral_(bb(R)) dots.h integral_(bb(R)) (product_(j = 1)^n g_j \( x_j \)) thin d mu_(X_1)\(x_1\)dots.h d mu_(X_n)\(x_n\) $
由于被积函数 $product g_j\(x_j\)$ 是变量分离的, 根据 Fubini's Theorem 可以把积分分解成多个积分的 product:
$ = (integral_(bb(R)) g_1 \( x_1 \) thin d mu_(X_1) \( x_1 \)) times dots.h times (integral_(bb(R)) g_n \( x_n \) thin d mu_(X_n) \( x_n \)) $
其中每一项都是$bb(E)\[g_j\(X_j\)\]$.

]
#remark[
recall: expectation is a linear operator (因而 linearity 是 regardless of independence).
但是它不一定是一个 multiplicative operator.

而这里我们说, #strong[如果 random variables 是 independent 的, 那么 expectation 就是一个 multiplicative operator.]

]
实际上: 当这些 Borel measurable functions ${ g_j : j in J }$
全都 bounded 时, 这个定理其实反向也是成立的:

#theorem(
)[
令 ${ X_i : i in I }$ 是一个family of random variables.
如果对于任意的 finite subset $J subset.eq I$, 以及任意的
bounded Borel measurable functions ${ g_j : j in J }$, 都有
$ bb(E) [product_(j in J) g_j \( X_j \)] = product_(j in J) bb(E)\[g_j\(X_j\)\] $
则这个 family of random variables 是 independent 的.

]
#proof[
不妨特取 indicator functions.
对于任意的 Borel sets $A\,B subset.eq bb(R)$,
令 $f\(x\)= I_A\(x\)$, $g\(y\)= I_B\(y\)$.
代入等式得到:$ bb(E)\[I_A\(X\)dot.op I_B\(Y\)\]= bb(E)\[I_A\(X\)\]dot.op bb(E)\[I_B\(Y\)\] $
注意到 $I_A\(X\)dot.op I_B\(Y\)= I_({ X in A\,Y in B })$. 根
据 expectation of indicator function 等于 probability,
我们立刻得到:$ bb(P)\(X in A\,Y in B\)= bb(P)\(X in A\)dot.op bb(P)\(Y in B\) $

]
注意: #strong[$g\(x\)= x$ 并不是 bounded 的 function, 因而 uncorrelation $⟹̸$ independence.] \ OK. 以上是 pretty much general properties of independence.
最后我们看一下, 对于 discrete 和 continuous random variables 而言,
independence 的 characterization 具体长什么样子.

=== discrete RV independence 的 characterization
<discrete-rv-independence-的-characterization>
#remark[
关于两个 discrete random variables $X\,Y$ 是否 independent 的判断,
还有一个直观的方法.

#proposition(
  title: [#kn[discrete RV independence 的 characterization]],
)[
两个 discrete random variables $X\,Y$
是 independent 的 iff 它们的 joint pmf as a matrix
有 rank 1(每行每列都互为倍数).

]
#proof[
note: 一个矩阵 $M$ 的 rank 等于 1 iff 它可以被分解为两个向量的 outer product
:$ M = upright(bold(u)) upright(bold(v))^top $~where $upright(bold(u))$ 和 $upright(bold(v))$ 是非零列向量.

\($arrow.r.double.long$): 如果 independent,
那么对于所有 $i\,j$,
joint probability $p_(i j) = bb(P)\(X = x_i\,Y = y_j\)$
满足:$ p_(i j) = bb(P)\(X = x_i\)dot.op bb(P)\(Y = y_j\) $
如果我们定义向量 $upright(bold(p))_X =\[p_X\(x_1\)\,p_X\(x_2\)\,dots.h\]^top$
和 $upright(bold(p))_Y =\[p_Y\(y_1\)\,p_Y\(y_2\)\,dots.h\]^top$,
那么整个联合分布矩阵 $P$ 就可以写成:$ P = upright(bold(p))_X upright(bold(p))_Y^top $
这正是 Rank 1 矩阵的标准形式.

\($arrow.l.double.long$)
如果 $P$ 的 rank 为 1,
那么存在向量 $upright(bold(u))$ 和 $upright(bold(v))$
使得 $p_(i j) = u_i v_j$\.由于 $sum_(i\,j) p_(i j) = 1$,
我们可以归一化这两个向量, 使得 $sum u_i = 1$
且 $sum v_j = 1$\.此时, $u_i$ 恰好就是 $X$ 的 marginal PMF,
$v_j$ 恰好就是 $Y$ 的 marginal PMF. 因此满足 $p_(i j) = p_i dot.op p_j$, 即两个变量独立.

]
#example(
)[
$ P = X without Y & 0 & 1 & upright("Marginal ") bb(P)\(X\)\
0 & 0.4 & 0.1 & 0.5\
1 & 0.4 & 0.1 & 0.5\
upright("Marginal ") bb(P)\(Y\) & 0.8 & 0.2 & 1.0 $
这里的 $X\,Y$ 就是 independent 的 random variables.

]
]
=== continuous RV independence 的 geometric intuition
<continuous-rv-independence-的-geometric-intuition>
对于 independent continuous random variables $X\,Y$, 它的 characterization
我们已经知道了: 即 joint pdf factorizes into marginal pdfs.
这一个 characterization 的 geometric intuition 是:

- joint pdf 的 support set 一定是一个矩形 (不一定 bounded)

- joint pdf 的#strong[每个维度上的任意截面的形状都是一样的] (因为固定 $x$, 则 $y$ 方向的性质只由 $f_Y$ 决定.)

  即: 固定 $x$, $y$-distribution 的横截面永远长得像 $f_Y$, 只是乘上了一个常数 $f_X\(x\)$ 而已. 同样的, 固定 $y$, $x$ 分布的横截面永远长得像 $f_X$, 只是乘上了一个常数 $f_Y\(y\)$ 而已.

#diagram(
  prob-03-joint-conditional-distribution-diagram-03,
  id: "fig-prob-03-joint-conditional-distribution-diagram-03",
  caption: [独立连续随机变量的矩形 support 与等形横截面],
  alt: "A rectangular joint support whose vertical cross-sections share one shape at different scales.",
)
== conditional distribution function and density
<conditional-distribution-function-and-density>
=== conditional distribution and its distribution function
<conditional-distribution-and-its-distribution-function>
#definition(
  title: [#kn[conditional distribution]],
)[
给定 random variables $X\,Y : Omega arrow.r bb(R)$,
其中下面极限里的条件概率按 #ref[conditional probability] 理解.
我们定义 the conditional distribution of $X$ given $Y = y$
为 the probability measure $bb(P)^(X\|Y = y)$:
$ bb(P)^(X\|Y = y)\(A\):= lim_(h arrow.r 0^(+)) bb(P)\(X in A divides y lt.eq Y lt.eq y + h\)\,quad forall A in cal(B)\(bb(R)\) $
并将 function $F_(X\|Y = y) : bb(R) arrow.r bb(R)$ defined by $F_(X\|Y = y)\(x\):= bb(P)^(X\|Y = y)\(\(- oo\,x\]\)$:
$ F_(X\|Y)\(x\|y\):= lim_(h arrow.r 0^(+)) bb(P)\(X lt.eq x divides y lt.eq Y lt.eq y + h\) $
称为 the conditional distribution function of $X$ given $Y = y$.

]
#remark[
注意: 每个取值 $y$ 都对应一个 conditional distribution measure $bb(P)^(X\|Y = y)$
和一个 conditional distribution function $F_(X\|Y = y)$.
因此, conditional distribution 和 conditional distribution function 都是一个 family of measures/functions,
而不是一个 measure/function.

也就是说, 一个 random variable 可以 induce 出另一个 random variable 的可能 uncountably many 个 conditional distribution.

]
#remark[
如果 $X\,Y$ 是两个 discrete random variables, 那么它们的 conditional distribution 就很简单了.
$ bb(P)^(X\|Y = y)\({ x }\)= frac(bb(P)\(X = x\,Y = y\), bb(P)\(Y = y\)) $
以及
$ F_(X\|Y = y)\(x\)= sum_(t lt.eq x) frac(bb(P)\(X = t\,Y = y\), bb(P)\(Y = y\)) $

其他情况稍复杂一些. 但是我们可以确定的是:

]
=== conditional density for random variables jointly continuous
<conditional-density-for-random-variables-jointly-continuous>
#theorem(
  title: [#kn[jointly continuous RVs 之间所有 defined 处总有 conditional density]],
  id: "thm-03-joint-conditional-distribution-jointly-continuous-rvs-defined-conditional-density",
)[
令 $upright(bold(X)) =\(X\,Y\)^T$ 是一个 continuous random vector,
则对于任意 $y$ 使得 $f_Y\(y\)> 0$, 都有 conditional distribution of $X$ given $Y = y$ 的 pdf:
$ f_(X\|Y)\(x\|y\):= frac(f_(X\,Y)\(x\,y\), f_Y\(y\)) $
即: $forall x in bb(R)$ 有: $ F_(X\|Y)\(x\|y\)= integral_(- oo)^x frac(f_(X\,Y)\(t\,y\), f_Y\(y\)) thin d t $

]
#proof[
注意: $\(X\,Y\)^T$ 是 continuous random vector $arrow.r.double.long$ $Y$ 是一个 continuous random variable. 因而
因而 $f_Y\(y\)$ 是 well-defined 的. (反过来不成立)
取 $y$ s.t. $f_Y\(y\)> 0$.

则
$ bb(P)^(X divides Y = y)\(A\) & = lim_(h arrow.r 0^(+)) bb(P)\(X in A divides y lt.eq Y lt.eq y + h\)\
 & = lim_(h arrow.r 0^(+)) frac(bb(P)\(X lt.eq x\,y lt.eq Y lt.eq y + h\), bb(P)\(y lt.eq Y lt.eq y + h\)) = lim_(h arrow.r 0^(+)) frac(F_(X\,Y)\(x\,y + h\)- F_(X\,Y)\(x\,y\), F_Y\(y + h\)- F_Y\(y\))\
 & = frac(partial_y F_(X\,Y)\(x\,y\), f_Y\(y\)) = integral_(- oo)^x frac(f_(X\,Y)\(s\,y\), f_Y\(y\)) d s $
因而, $f_(X\|Y)\(x\|y\):= frac(f_(X\,Y)\(x\,y\), f_Y\(y\))$ 是 $F_(X\|Y = y)$ 的 pdf.

]
#remark[
为了保证 continuous random vector 下分量之间的 conditional distribution 总是 (a.e.) 拥有 pdf 的, 我们可以
给 not well-defined 处下定义: 如果 $f_Y\(y\)= 0$, 就直接 set $f_(X\|Y)\(x\|y\)= 0$ for all $x$.

在这个定义下: continuous random vector 下分量之间的 conditional distribution 也总是 continuous 的.

]
=== Law of Total Probability for continuous random vector
<law-of-total-probability-for-continuous-random-vector>
#theorem(
)[
令 $upright(bold(X)) =\(X\,Y\)^T$ 是一个 continuous random vector,
则对于任意 $A in cal(B)\(bb(R)\)$,
$ bb(P)\(\(X\,Y\)in A\)= integral_(- oo)^(+ oo) bb(P)\(\(X\,y\)in A divides Y = y\)f_Y\(y\)d y $

]
#proof[
注意: $ bb(P) (Y in {y in bb(R) : f_Y \( y \) = 0}) = 0 $
即, ${Y in f_Y^(- 1) \( { 0 } \)}$ 是一个 null set. (不是说 $f_Y\(y\)= 0$ 的 $y$ 是 null set,
意思是说 $Y$ 落在这些 $y$ 上的事件是 null set.)

因而 compute:
$ bb(P)\(X in\(- oo\,x\]\,Y lt.eq y\) & = bb(P) (X in \( - oo \, x \] \, { Y lt.eq y } inter {Y in.not f_Y^(- 1) \( { 0 } \)}) = integral_(\(- oo\,y\]inter f_Y^(- 1) ({ 0 }^c)) integral_(- oo)^oo f_(X\,Y)\(s\,t\)d s d t\
 & = integral_(\(- oo\,y\]inter f_Y^(- 1)\(\(0\,+ oo\)\)) (integral_(- oo)^x frac(f_(X\,Y)\(s\,t\), f_Y\(t\)) d s) f_Y\(t\)d t\
 & = integral_(\(- oo\,y\]inter f_Y^(- 1)\(\(0\,+ oo\)\)) bb(P)\(X lt.eq x divides Y = t\)f_Y\(t\)d t\
 & = integral_(\(- oo\,y\]inter f_Y^(- 1)\(\(0\,+ oo\)\)) bb(P)\(X lt.eq x divides Y = t\)f_Y\(t\)d t + integral_(\(- oo\,y\]inter f_Y^(- 1)\({ 0 }\)) bb(P)\(X lt.eq x divides Y = t\)f_Y\
 & = integral_(\(- oo\,y\]) bb(P)\(X lt.eq x divides Y = t\)f_Y\(t\)d t\
 & = integral_(- oo)^y bb(P)\(X lt.eq x divides Y = t\)f_Y\(t\)d t $

]
#remark[
recall 最普通的全概率公式: 把样本空间 partition 成几个 disjoint 的事件 $B_1\,dots.h.c\,B_n$,
则任意事件$A$ 等于它在每个 $B_i$ 上的 conditional probability 的和:
$ bb(P)\(A\)= sum_(i = 1)^n bb(P)\(A inter B_i\)= sum_(i = 1)^n bb(P)\(A divides B_i\)bb(P)\(B_i\) $
这很容易理解. 而这里的 law of total probability for continuous random vector 就是这个公式在 continuous case 的推广:

由于在每一点 $y$ 上, $\(X\,Y\)in A$ 的概率都有一个 conditional distribution $\(X\,Y\)in A\|Y = y$, 因而
$\(X\,Y\)in A$ 的概率就等于这个 conditional distribution 在所有 $y$ 上的加权和, 权重就是 $Y$ 的 pdf $f_Y\(y\)$.
因而才有 $ bb(P)\(\(X\,Y\)in A\)= integral_(- oo)^(+ oo) bb(P)\(\(X\,y\)in A divides Y = y\)f_Y\(y\)d y $

]
#example(
)[
考虑 random vector $upright(bold(X)) =\(X\,Y\)^T$ with joint pdf
$ f_(X\,Y)\(x\,y\)= cases(delim: "{", 4 x y\, & upright(" if ") 0 lt.eq x lt.eq 1\,0 lt.eq y lt.eq 1, 0\, & upright(" otherwise ")) $
计算: $f_X\,f_Y\,f_(X\|Y)\,f_(Y\|X)$.

]
#solution[
首先计算 margianl pdfs:
$ f_X\(x\)= integral_(- oo)^(+ oo) f_(X\,Y)\(x\,y\)d y = integral_0^1 4 x y d y = 2 x\,upright(" for ") 0 lt.eq x lt.eq 1 $
and
$ f_Y\(y\)= integral_(- oo)^(+ oo) f_(X\,Y)\(x\,y\)d x = integral_0^1 4 x y d x = 2 y\,upright(" for ") 0 lt.eq y lt.eq 1 $
由于这是一个 continuous random vector, 因而根据#ref(label("thm-03-joint-conditional-distribution-jointly-continuous-rvs-defined-conditional-density")) 可以得到:
$ f_(X divides Y)\(x divides y\)= cases(delim: "{", frac(f_(X\,Y)\(x\,y\), f_Y\(y\)) = frac(4 x y, 2 y) = 2 x\, & upright(" if ") x in\[0\,1\]\,, 0\, & upright(" otherwise. ")) $
同理计算出
$ f_(Y divides X)\(y divides x\)= cases(delim: "{", frac(f_(X\,Y)\(x\,y\), f_X\(x\)) = frac(4 x y, 2 x) = 2 y\, & upright(" if ") y in\[0\,1\]\,, 0\, & upright(" otherwise. ")) $

]

== conditional expectation
<conditional-expectation>
#definition(
  title: [#kn[conditional expectation]],
  id: "def-03-joint-conditional-distribution-conditional-expectation",
)[
令 $X\,Y : Omega arrow.r bb(R)$ 为 RVs.
这里沿用 #ref[expectation and variance of random variable] 中 expectation 的积分定义.
对于 $y in bb(R)$ where $F_(X\|Y) = bb(P)^(X\|Y = y)\(X lt.eq x\)$ is defined
(这个条件对于 discrete 是筛选掉 $bb(P)\(y\)= 0$ 的点, 对于 continuous 这是为了筛选掉 $f_Y = 0$ 的点),
我们定义 conditional expectation:
$ bb(E)\[X\|Y = y\]:= integral_(- oo)^oo x thin d bb(P)^(X\|Y = y)\(x\) $
特别地, 如果$\(X\,Y\)$ 是一个 discrete random vector, 则它即是:
$ bb(E)\[X\|Y = y\]= sum_x x bb(P)\(X\|Y\)\(x\|y\)= sum_x x bb(P)\(X = x\|Y = y\) $
而如果 $\(X\,Y\)$ 是一个 (absolutely) continuous random vector, 则它即是:
$ bb(E)\[X\|Y = y\]= integral_(- oo)^oo x f_(X\|Y)\(x\|y\)thin d x $

]
#remark[
注意: conditional expectation 对于给定的 $y$ 是一个值;
而它也整体是一个 function of $y$, 同时也是 function from the sample space $Omega$
(更准确而言是 ${ omega in Omega : f_Y\(Y\(omega\)\)> 0 }$, 但是去掉的
这个集合的测度为零, 所以不用管, a.e. define 即可).

对于 $omega in Omega$, $ bb(E)\[X\|Y\]: omega mapsto bb(E)\[X\|Y = Y\(omega\)\] $
Notice: 这个函数是一个 random variable.
同理, 我们可以构造 conditional expectation
given multiple random variables $bb(E)\[X\|Y_1\,dots.h.c\,Y_n\]$. 但是暂时不谈论这个.

]
#proposition(
  title: [#kn[independence 下 conditional distribution 不变],
  #kn[independence 下 conditional density 不变] 和
  #kn[independence 下 conditional expectation 不变]],
)[
如果 $X\,Y$ 是 independent 的, 那么在任意 defined $y$ 上,
$ F_(X\|Y = y) = F_X\,quad f_(X\|Y = y) = f_X\, $
以及 $ quad bb(E)\[X\|Y\]= bb(E)\[X\] $

]
#example(
)[
#strong[\(constant random variable 的 conditional expectation)]

令 $X := b$ 为一个 constant random variable.
$Y$ 为一个 (absolutely) continuous random variable.
compute: $bb(E)\[X\|Y\]$ when $f_Y\(y\)> 0$.

]
#solution[
$ F_(X\,Y)\(x\,y\)= bb(P)\(X lt.eq x\,Y lt.eq y\)= {F_Y\(y\)\, & upright(" if ") x lt.eq b\,\
0\, & upright(" if ") x > b = F_X \( x \) dot.op F_Y \( y \) $
因而它们 independent (当然,,)
因而 $ bb(E)\[X\|Y\]= bb(E)\[X\]= b $

]
为什么我们要提及这个很呆的例子
因为我们要说一个很呆但是要说一下的事情:

#proposition(
)[
conditional expectation 满足 linear property.
即任取 $a\,b in bb(R)$, $ bb(E)\[a X + b\|Y\]= a bb(E)\[X\|Y\]+ b $

]

#example(
)[
\(computation exercise)
令 $X\,Y$ 为 RVs with joint pdf $ f_(X\,Y)\(x\,y\)= cases(delim: "{", 1 / y e^(- x / y) e^(- y)\, & x > 0\,y > 0, 0\, & upright("otherwise")) $
计算: $bb(E)\[X\|Y = y\]$.

]
#solution[
根据 #ref(label("thm-03-joint-conditional-distribution-jointly-continuous-rvs-defined-conditional-density")) 和
@def-03-joint-conditional-distribution-conditional-expectation, 我们就是要做两件事情: 一个是计算 $f_Y$, 然后
根据 $f_Y$ 和 $f_(X\,Y)$ 计算出 $f_(X\|Y)$,
最后根据 $f_(X\|Y)$ 积分计算出 $bb(E)\[X\|Y\]$.

那么 $ f_Y\(y\)= integral_(- oo)^(+ oo) f_(X\,Y)\(x\,y\)d x = e^(- y) integral_0^(+ oo) 1 / y e^(- x\/y) d x = e^(- y)\,y > 0 $
我们发现 $Y tilde.op upright("Exp")\(1\)$. 然后对于 $y > 0$, $ f_(X divides Y)\(x divides y\)= frac(f_(X\,Y)\(x\,y\), f_Y\(y\)) = 1 / y e^(- x\/y) $
因而 $X\|Y = y tilde.op upright("Exp")\(1\/y\)$.
最后, $ bb(E)\[X divides Y = y\]= integral_(- oo)^(+ oo) x f_(X divides Y)\(x divides y\)d x = 1 / y integral_0^(+ oo) x e^(- x\/y) d x = y $
而对于 $y lt.eq 0$, 因为 $f_Y\(y\)= 0$, $bb(E)\[X divides Y = y\]$ is not defined.

]

\/\/TODO: 如果 $X$ 是 continous 的, 而 $Y$ 是 discrete 的,
那么我们怎么 define conditional distribution, 以及 expectation 呢?
这个时候我们就需要用到
之前说的 generated $sigma$-algebra 的概念了.

== law of total expectation
<law-of-total-expectation>
#theorem(
  title: [#kn[law of total expectation]],
)[
令 $X\,Y : Omega arrow.r bb(R)$ 为 RVs, 我们知道它们的 conditional expectation $bb(E)\[X\|Y\]$ 也是一个 $Omega arrow.r bb(R)$ 的 RV.

如果 $bb(E)\[\|bb(E)\[X\|Y\]\|\]< oo$, 则
$ bb(E)\[X\]= bb(E)\[bb(E)\[X\|Y\]\] $

]
#proof[
对于更加严格的 conditional expectation 的定义而言
(as an orthogonal projection from $L^2\(Omega\,cal(F)\,bb(P)\)$
onto the subspace of $Y$-measurable functions), 这个定理是 trivial 的, 直接 follow from def.
这个定义在 indicator function 上也包含 #ref[Kolmogorov definition of conditional probability] 的情形.
在该定义中, $bb(E)\[X\|Y\]$ 被定义为一个 $sigma\(Y\)$-measurable function $Z$,
使得对于任意 $A in sigma\(Y\)$, 都有 $ integral_A Z thin d bb(P) = integral_A X thin d bb(P) $
那么取 $A = Omega$, 自然得到.

而我们目前的定义下, 要证明它则要对于 discrete 和 continuous 两种情况分别计算证明.
(recall Lebesgue Decomposition Theorem:
任意 measure 都可以被分解成一个 discrete 的部分和一个 continuous 的部分以及一个
可以忽略的 singular 的部分. 因而证明了 discrete 和 continuous 两种情况即可.)

For discrete case:
$ bb(E)\[bb(E)\[X divides Y\]\] & = bb(E)_omega\[bb(E)\[X divides Y = Y\(omega\)\]\]= bb(E)_omega [sum_x x bb(P) \( X = x divides Y = Y \( omega \) \)]\
 & = sum_x x bb(E)_omega\[bb(P)\(X = x divides Y = Y\(omega\)\)\]\
 & = sum_x x sum_y bb(P)\(X = x divides Y = y\)dot.op bb(P)\(Y = y\)\
 & = sum_x x sum_y bb(P)\(X = x\,Y = y\)\
 & = sum_x x bb(P)\(X = x\)= bb(E)\[X\] $

For continuous case:
$ bb(E)\[bb(E)\[X divides Y\]\] & = bb(E)_omega [integral_(- oo)^(+ oo) x f_(X divides Y) \( x divides Y \( omega \) \) d x] = integral_(- oo)^(+ oo) x bb(E)_omega [f_(X divides Y) \( x divides Y \( omega \) \)] d x\
 & = integral_(- oo)^(+ oo) x integral_(- oo)^(+ oo) f_(X divides Y)\(x divides y\)f_Y\(y\)d y d x\
 & = integral_(- oo)^(+ oo) integral_(- oo)^(+ oo) x f_(X\,Y)\(x\,y\)d x d y\
 & = integral_(- oo)^(+ oo) x integral_(- oo)^(+ oo) f_(X\,Y)\(x\,y\)d x d x\
 & = integral_(- oo)^(+ oo) x f_X\(x\)d x = bb(E)\[X\] $

]
#example(
)[
\(#strong[fair coin toss])
我们投掷一枚 fair coin.
$X_1$: 直到 HH 出现钱, 投掷的次数;

$X_2$: 直到 HT 出现钱, 投掷的次数.

问题: 计算 $bb(E)\[X_1\]$ 和 $bb(E)\[X_2\]$.

]
#solution[
We condition on 第一次 toss $Y_1$, 以及第二次 toss $Y_2$.

$ bb(E) [X_1] & = bb(E) [bb(E) [X_1 divides Y_1]] = 1 / 2 bb(E) [X_1 divides Y_1 = H] + 1 / 2 bb(E) [X_1 divides Y_1 = T]\
 & = 1 / 2 (1 / 2 bb(E) [X divides Y_1 = H \, Y_2 = H] + 1 / 2 bb(E) [X divides Y_1 = H \, Y_2 = T]) + 1 / 2 (1 + bb(E) [X_1])\
 & = 1 / 2 (2 / 2 + 1 / 2 (bb(E) [X_1] + 2)) + 1 / 2 (1 + bb(E) [X_1]) . $
解出 $bb(E)\[X_1\]= 6$.
同理, 可以解出 $bb(E)\[X_2\]= 4$.

]

#example(
)[
一只鸡在一段时间内下 $N$ 个蛋, 其中 $N tilde.op upright("Pois")\(lambda\)$.
每只蛋孵化成小鸡的概率为 $p$, 互相独立.
令 $K$ 表示孵化成小鸡的蛋的数量, 计算 $K\|N\,bb(E)\[K\]$, 以及
$K$ 的 distribution.

]
#solution[
由题意得 $ bb(P)\(K = k\|N = n\)= binom(n, k) p^k\(1 - p\)^(n - k) $
因此, $K\|N = n tilde.op upright("Bin")\(n\,p\)$ 因而 $bb(E)\[K\|N = n\]= n p$.
由 law of total expectation,
$ bb(E)\[K\]= bb(E)\[bb(E)\[K\|N\]\]= bb(E)\[N\]dot.op p = lambda $
然后由 law of total probability,
$ bb(P)\(K = k\) & = sum_(n = k)^(+ oo) bb(P)\(K = k\,N = n\)= sum_(n = k)^(+ oo) bb(P)\(K = k\|N = n\)dot.op bb(P)\(N = n\)\
 & = sum_(n = k)^(+ oo) binom(n, k) p^k\(1 - p\)^(n - k)dot.op frac(lambda^n e^(- lambda), n !)\
 & = sum_(n = k)^(+ oo) frac(n !, k !\(n - k\)!) p^k\(1 - p\)^(n - k)dot.op frac(lambda^n e^(- lambda), n !)\
 & = sum_(n = k)^(+ oo) frac(lambda^n e^(- lambda), k !\(n - k\)!) p^k\(1 - p\)^(n - k)\
 & = sum_(n = k)^(+ oo) frac(\(lambda p\)^k\(lambda\(1 - p\)\)^(n - k)e^(- lambda), k !\(n - k\)!)\
 & = frac(\(lambda p\)^k e^(- lambda), k !) sum_(n = k)^(+ oo) frac(\(lambda\(1 - p\)\)^(n - k), \(n - k\)!)\
 & = frac(\(lambda p\)^k e^(- lambda), k !) sum_(m = 0)^(+ oo) frac(\(lambda\(1 - p\)\)^m, m !)\
 & = frac(\(lambda p\)^k e^(- lambda), k !) dot.op e^(lambda\(1 - p\)) = frac(\(lambda p\)^k e^(- lambda p), k !) $
因而 $K tilde.op upright("Pois")\(lambda p\)$.

]

#example(
)[
令 $\(X\,Y\)$ 为一对 continuous RVs with joint pdf:
$ f_(X\,Y)\(x\,y\)= 2 e^(-\(x + 2 y\)) upright(bold(1))_({ x > 0\,y > 0 }) $
首先, verify $f_(X\,Y)$ is a valid joint pdf, 然后计算
$bb(E)\[X\|Y = y\]$ 和 $bb(E)\[X\]$.

]
#solution[
$ integral_0^oo integral_0^oo 2 e^(-\(x + 2 y\)) d x d y = integral_0^oo 2 e^(- 2 y) (integral_0^oo e^(- x) d x) d y = integral_0^oo 2 e^(- 2 y) d y = 1 $
verify 很简单. 然后我们首先计算 density of $Y$:
$ f_Y\(y\)= integral_0^oo 2 e^(-\(x + 2 y\)) d x = 2 e^(- 2 y)\,quad y > 0 $
然后计算 conditional density of $X$ given $Y = y$:
$ f_(X divides Y)\(x divides y\)= frac(f_(X\,Y)\(x\,y\), f_Y\(y\)) = e^(- x)\,quad x > 0 $
因而 by @def-03-joint-conditional-distribution-conditional-expectation, $ bb(E)\[X divides Y = y\]= integral_0^oo x e^(- x) d x = 1 $
然后 by law of total expectation, $ bb(E)\[X\]= bb(E)\[bb(E)\[X\|Y\]\]= bb(E)\[1\]= 1 $ since $bb(E)\[X\|Y\]$ is a constant function.

]
