#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *
#import "../diagrams/probability-diagrams.typ": *

= Central Limit Theorem
<central-limit-theorem>
== convergence in distribution
<convergence-in-distribution>
#definition(
  title: [#kn[convergence in distribution]],
)[
这里的分布采用 #ref[probability distribution] 的定义。我们称一个 seq of random variables ${ X_n }$
converge in distribution to a random variable $X$,
写作 $X_n arrow.r^d X$,
如果 $X$ 的
分布函数 $F_X$ 下所有
右连续的 $x$ (即 $F_X\(x\)= F_X\(x -\)$ ), 都有 $ lim_(n arrow.r oo) F_(X_n)\(x\)= F_X\(x\) $

]
#remark[
Convergence in distribution 的意思就是:
随着 $n$ 越来越大, $X_n$ 的分布是否越来越接近 $X$ 的分布.
这是一个非常弱的收敛概念,
因为它甚至#strong[不要求 $X_n$ 和 $X$ 在同一个概率空间上定义,]
也不要求 $X_n$ 和 $X$ 之间有任何关系. 只需要
分布函数收敛即可.

并且 notice: 并不要求对所有点 $x$ 都有 $F_(X_n)\(x\)arrow.r F_X\(x\)$,
而是只要求对 $X$ 的分布函数 $F_X$ 下所有右连续的点
$x$.
这是因为如果不加这个限制, 很多直观上应该收敛的情况在数学上就会失败.

比如: 令$X_n = 1\/n$, 一个 constant random variable,
那么 $X_n$ 的分布函数 $F_(X_n)$ 是一个 step function.
但是在 $x = 0$ 处, $F_(X_n)\(0\)= 0$ for all $n$,
因而 $lim_(n arrow.r oo) F_(X_n)\(0\)= 0$.

而 $F_X\(0\)= 1$.

所以对于这种跳跃不连续点, 如果不跳过, 那么就会得出 $X_n$ 不收敛于 $X$ 的错误结论.
但是我们知道, 分布函数作为一个单调递增的函数,
是 a.e. continuous 的, 因而这些点是可以忽略掉的.

]
== Characterization of a distribution
<characterization-of-a-distribution>
=== moment generating function
<moment-generating-function>
#definition(
  title: [#kn[moment generating function]],
)[
对于一个随机变量 $X$, 其 moment generating function (MGF) 定义为
$ M_X\(t\)= bb(E)\[e^(t X)\]\,quad t in bb(R) $

]
#remark[
为什么这个东西叫做 moment generating function 呢?
因为如果 $M_X\(t\)$ 在 $t = 0$ 的某个 neighborhood 内存在,
那么我们可以通过对 $M_X\(t\)$ 求导来得到 $X$ 的各阶矩:

]
#proposition(
)[
如果 $M_X\(t\)$ 在 $t = 0$ 的某个 neighborhood 内存在,
则 $X$ 的 $n$ 阶矩可以表示为
$ bb(E)\[X^n\]= M_X^(\(n\))\(0\) $
其中 $M_X^(\(n\))\(0\)$ 表示 $M_X\(t\)$ 在 $t = 0$ 处的 $n$ 阶导数.

]
=== characteristic function
<characteristic-function>
== Central Limit Theorem
<central-limit-theorem-1>
#remark[
#ref[De Moivre–Laplace theorem] 给出了二项分布到正态分布的先导特例。
]
#theorem(
  title: [#kn[Lindeberg-Levy Central Limit Theorem]],
)[
对于任意一个 seq of i.i.d. random variables ${ X_i }$
with mean $mu$ and variance $sigma^2 < oo$,
set $S_n = X_1 + X_2 + dots.h.c + X_n$ for each $n$.

我们有:
$ frac(S_n - n mu, sqrt(n sigma^2)) arrow.r^d N\(0\,1\) $

]
#remark[
LLN 告诉我们, 当 $n$ 越来越大时, $S_n\/n$ 越来越接近 $mu$.
每个 $X_i$ 随机取样, 不论结果如何, 其平均值大概率都是 $mu$. \ CLT 则是进一步告诉我们这个接近的过程是如何发生的:
随着 $n$ 越来越大, $S_n$ 的分布会越来越接近一个正态分布,
且波动的幅度(标准差)数量级为 $sqrt(n)$.
#strong[因而平均值 $S_n\/n$ 的分布会越来越接近一个均值为 $mu$,
标准差为 $sigma\/sqrt(n)$ 的正态分布]
$ S_n / n = mu + sigma / sqrt(n) Z\,quad Z tilde.op N\(0\,1\) $
#strong[随着$n$ 越来越大, 这个标准差会越来越小, 因而
其极限坍缩为一个 constant $mu$.] \

]
#remark[
CLT 的一个主要的应用价值, 就是可以用来估计
由多个 i.i.d. 随机因素共同作用的现象的分布.

统计学中常用于对 confidence interval 的估计,
以及 hypothesis testing,
通过计算如 $bb(P) (frac(S_n - n mu, sqrt(n sigma^2)) in A)$
这种形式的概率来进行推断. \

]
在进行证明前, 我们先看一些 applications of CLT.
可能会帮助我们更好地理解 CLT 的意义.

=== applications of CLT
<applications-of-clt>
#example(
  title: [\(判断 coin 是否 fair)],
)[
我们有两个 coins, 想要判断它们是否是 fair coin.
我们可以 toss 这个 coin $n$ 次, 记录下每次 toss 的结果,
记为 $X_1\,X_2\,dots.h.c\,X_n$,
其中 $X_i = 1$ if the $i$-th toss is heads.

现在: 观测到第一个 coin 100 次 toss 中有 38 次是 heads,
第二个 coin 100 次 toss 中有 43 次是 heads.

#solution[
假设这两个 coins 是 fair coin.
那么 $X_i$ 是 i.i.d. Bernoulli random variables
with parameter $p = 0.5$, 因而
$mu = p = 1 / 2$,
$sigma^2 = p\(1 - p\)= 1 / 4$.
从而根据 CLT,
$ bb(P)\(S_100 < 38\)= bb(P) (frac(S_100 - 100 dot.op 1 / 2, sqrt(100 dot.op 1 / 4)) < frac(38 - 100 dot.op 1 / 2, sqrt(100 dot.op 1 / 4))) approx bb(P) (Z < frac(38 - 50, 5)) approx bb(P)\(Z < - 2.4\)approx 0.0082 < 0.01 $
因而这个第一个 coin 很可能不是 fair coin.
同样的方法计算出 $bb(P) (S_100 lt.eq 43) approx 0.0887$,
因而第二个 coin 虽然也可疑不是 fair coin,
但是不如第一个 coin 可疑. 如果以 0.05 作为显著性水平,
那么我们可以拒绝第一个 coin 是 fair coin 的假设. \

]
]
#example(
  title: [\(样本量需求的计算)],
)[
工厂生产了一批电线,
我们想知道它们的平均断裂强度 $mu$ 是多少.
遂抽取 $n$ 根电线进行测量,
得到 $X_1\,. . .\,X_n$,
然后计算它们的样本平均值 $accent(X, macron)_n$
来估计 $mu$.

已知量: 强度的方差 $sigma^2 = 1\/10$\.;
我们想估计的是 $mu$ 的值.
并且我们希望我们的估计是准的,
in the sense that: 误差 $\|accent(X, macron)_n - mu\|$ 不超过 0.01 的概率至少为 0.95.

#solution[
我们要达到: $bb(P)\(\|accent(X, macron)_n - mu\|lt.eq 1\/100\)$.

我们要把它转成标准的 normal distribution 的形式,
即 $Z = frac(S_n - n mu, sqrt(n sigma^2))$ 的形式.

于是我们把 $accent(X, macron)_n - mu$ 写为 $S_n / n - mu$,
然后两边同时乘 $sqrt(n) / sigma$.
右边的常数项也做相同的变换: $frac(1\/100, sigma\/sqrt(n)) = frac(sqrt(n), 100 sigma)$.

于是原式变为:
$ bb(P)\(\|Z\|lt.eq frac(sqrt(n), 100 sigma)\)approx 0.95 $
对于正态分布我们知道
$ bb(P)\(\|Z\|lt.eq x\)= 2 Phi\(x\)- 1 $
于是想要:
$ 2 Phi (frac(sqrt(n), 100 sigma)) - 1 gt.eq 0.95 arrow.r.double.long Phi (frac(sqrt(n), 100 sigma)) gt.eq 0.975 $
通过查表我们知道当 $Phi\(z\)= 0.975$ 时,
$z approx 1.96$. 因此要求
$frac(sqrt(n), 100 sigma) gt.eq 1.96$,
解得至少需要 $n gt.eq\(61.98\)^2approx 384.16$,
floor 一下得到 $n gt.eq 385$.

]
#remark[
这里的应用正是我们开头说的:
LLN 告诉我们, 当 $n$ 越来越大时,
$S_n\/n$ 越来越接近 $mu$.
每个 $X_i$ 随机取样, 不论结果如何,
其平均值大概率都是 $mu$\; 而
CLT 则是进一步告诉我们这个接近的过程是如何发生的:
$ S_n / n = mu + sigma / sqrt(n) Z\,quad Z tilde.op N\(0\,1\) $
随着$n$ 越来越大, 这个标准差会越来越小, 因而
其极限坍缩为一个 constant $mu$.
#strong[因而, 我们可以通过 CLT 来得到: 我们
要用样本均值来估计分布的真实均值的话,
在一定的置信水平下, 需要多少样本量 $n$ 才能保证我们的估计是准的.]

]
]
=== Berry-Esseen Theorem: CLT 的收敛速度
<berry-esseen-theorem-clt-的收敛速度>
之前的例子中, 我们都
使用了 $approx$ 表示:
我们直接把此时的分布近似当作了一个
normal distribution, 来计算一些概率.

但是: 这两个分布的近似行为的本身有多么精准?

下面有一个 theorem 刻画了这件事.

#theorem(
  title: [#kn[Berry-Esseen Theorem]],
)[
给定一个 seq of i.i.d. random variables ${ X_i }$
with mean $mu$ and variance $sigma^2 < oo$,
以及 $bb(E)\[\|X_i - mu\|^3\]= rho < oo$,
set $S_n = X_1 + X_2 + dots.h.c + X_n$,
我们有: 对于任意 $x in bb(R)$,
$ lr(|bb(P) (frac(S_n - n mu, sqrt(n sigma^2)) lt.eq x) - Phi \( x \)|) lt.eq frac(3 rho, sigma^2 sqrt(n)) $

]
#remark[
给定一个 number of samples $n$,
我们可以给出此时的
真实概率与正态近似值之间的差值的
一个 upper bound. \ 并且, 这个 bound 不是概率意义上的 bound,
而#strong[是一个 deterministic bound,
没有任何的随机性]\; 并且是
#strong[uniform across all $x$ 的 bound.] \ 这是因为这里本身就是两个概率的值之间的差,
而不是样本之间的差. 因而其实这是一个非常强大的
结论, 表面#strong[我们用正态分布近似估计出的概率
和真实的概率之间的差值是 determinstically
controllable 意义上非常小的.] \ 我们马上可以想到: 对于
控制样本数量来达到某个置信水平的问题,
这是一个非常有用的工具, 因为它告诉我们, 当 $n$ 足够大时,
我们用正态分布近似估计出的概率和真实的概率之间的
差值是非常小并且可以控制的. \ 并且, 这个控制应该是比较精准的.
因为相比其他的控制方法:
#strong[Chebyshev 只需要 first, second order
moments 的信息; Hoeffding
只需要有界性的假设, 甚至不需要知道
分布的任何 moment 信息; 而
Berry-Esseen 需要 third order moment 的信息,
因此它应该能够给一个更精准的控制.]

]
#proof[
\/\/TODO:

]
#example(
)[
一个工厂生产电子元件,
每个原件有概率是有缺陷的.

令
$ X_i = cases(delim: "{", 1\, & upright(" if the ") i upright(" th tested component is defective ")\,, 0\, & upright(" otherwise ") .) $
并假设 i.i.d. with parameter
$ bb(P)\(X_i = 1\)= p $
其中 $p$ 是一个未知的参数.

工厂方面表示这个 process 是 under control 的,
并给出了假设:
$H_0 : p lt.eq 0.02$.

为了验证这个假设,
一个 quality control manager
需要从生产线上需要随机 $n$ 个元件进行测试,
并估计出 $p$ 的值 by 样本均值:
$ hat(p)_n := 1 / n sum_(i = 1)^n X_i $
我们希望这个估计的误差最多为 0.005,
并且这个误差的置信度至少为 0.99,
即我们希望:
$ bb(P) (lr(|hat(p)_n - p|) > 0.005) lt.eq 0.01 $

那么我们至少需要多少样本量 $n$ 来达到这个要求呢?

]
#solution[
首先计算样本均值 $hat(p)_n$ 的 mean 和 variance:
$ bb(E) [hat(p)_n] = p\,quad "Var" (hat(p)_n) = 1 / n^2 sum_(i = 1)^n "Var" (X_i) = frac(p\(1 - p\), n) $
此时我们有三个办法:

- 办法1: #strong[Chebyshev's inequality].
  $ bb(P) (lr(|hat(p)_n - p|) gt.eq epsilon) lt.eq frac("Var" (hat(p)_n), epsilon^2) = frac(p\(1 - p\), n epsilon^2) $
  由于 $p\(1 - p\)lt.eq 1\/4$ for any $p in\[0\,1\]$,
  式子可以进一步控制为
  $ bb(P) (lr(|hat(p)_n - p|) gt.eq epsilon) lt.eq frac(1, 4 n epsilon^2) $
  我们希望此概率不超过 0.01,
  并且~$epsilon = 0.005$, 那么进一步得到需要
  $ frac(1, 4 n\(0.005\)^2) lt.eq 0.01 $
  解得至少需要 $n gt.eq 1000000$.

- 办法2: #strong[Hoeffding's inequality]. \ 由于 $0 lt.eq X_i lt.eq 1$,
  我们可以直接使用 Hoeffding's inequality 来控制:
  $ bb(P) (lr(|hat(p)_n - p|) gt.eq epsilon) lt.eq 2 e^(- 2 n epsilon^2) $
  我们 require 了 $2 e^(- 2 n\(0.005\)^2) lt.eq 0.01$,
  因而可以解得
  $ n gt.eq frac(\|ln\(0.005\)\|, 2\(0.005\)^2) approx 106\,000 $

- 办法3: #strong[Berry-Esseen Theorem]. \ 首先我们假设报告的 $p$ 的值 0.02 是正确的,
  从而可以计算出:
  $ bb(E) [X_1] = p\,quad sigma^2 := "Var" (X_1) = p\(1 - p\)= 0.0196\,quad sigma = 0.14 $
  并且, 由于 $lr(|X_1 - p|) lt.eq 1$,
  我们知道偏度 $rho := bb(E) [lr(|X_1 - p|)^3] < oo$.

  因而可以应用 Berry-Esseen Theorem.
  我们希望:
  $ bb(P) (lr(|hat(p)_n - p|) lt.eq epsilon) = bb(P) (lr(|S_n - n p|) lt.eq n epsilon) gt.eq 0.99\,quad epsilon = 0.005 $

  等价于
  $ bb(P) (lr(|frac(S_n - n p, sigma sqrt(n))|) lt.eq frac(epsilon sqrt(n), sigma)) gt.eq 0.99 $
  Berry-Esseen Theorem 可以得到:
  对于任意的 $x > 0$,
  有
  $ bb(P) (lr(|frac(S_n - n p, sigma sqrt(n))|) lt.eq x) gt.eq 2 Phi\(x\)- 1 - frac(6 rho, sigma^2 sqrt(n)) $
  因而我们需要选择 $n$ s.t.
  $ 2 Phi (frac(epsilon sqrt(n), sigma)) - 1 - frac(6 rho, sigma^2 sqrt(n)) gt.eq 0.99 $
  忽略掉 $frac(6 rho, sigma^2 sqrt(n))$ 这个很小的项
  (计算可以再精细地选择 $n$),
  我们也可以得到:

  $ frac(epsilon sqrt(n), sigma) gt.eq z_0.995 approx 2.576 $
  因而至少需要 $n gt.eq 5200$.

我们可以看到

- 通过 Chebyshev's inequality 来控制, 我们需要的样本量是 100 万级别的;

- 通过 Hoeffding's inequality 来控制, 我们需要的样本量是 10 万级别的;

- 通过 Berry-Esseen Theorem 来控制, 我们需要的样本量是 5000 级别的, 显然更为高效.

不过, 这个结果是基于我们假设 $p = 0.02$
的前提下得到的.
Chebyshev 的逻辑 (保守估计): 我不相信厂家的任何话, 我要建立一个无论真实 $p$ 是多少都绝对成立的置信区间. 所以我必须用最差的情况 $p = 0.5$ 来算 $n$.
CLT/Berry-Esseen 的逻辑 (假设检验):
厂家宣称 $p lt.eq 0.02$. 在统计学中,
我们通常先假设这个宣称是正确的 (即 $H_0$ 假设).
如果我们用在这个假设下得出的需要的样本量
$n = 5200$ 去测, 发现结果远超 $0.02$, 那我们就直接推翻厂家的说法.

]

=== proof of CLT
<proof-of-clt>
