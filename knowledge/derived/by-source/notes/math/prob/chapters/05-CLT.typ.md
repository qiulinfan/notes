---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/prob/chapters/05-CLT.typ"
kgd_source_format: "typst"
kgd_source_sha256: "88d799268db0cc91a0a37db031d5e89034d3d441d7e3d5c617ddc8aa3ba01e5a"
---

---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: Math 525
date: 2026
description: Probability notes migrated from the complete LaTeX course source.
keywords:
- probability
- random variables
- law of large numbers
- central limit theorem
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: 4
source: "notes/math/prob/chapters/05-CLT.typ"
subtitle: Typst-first course notes
title: "Math 525: Probability"
---
# Central Limit Theorem

## convergence in distribution

> **Definition: --[[convergence in distribution]]--**
>
> 我们称一个 seq of random variables $\left\{ X_{n} \right\}$ converge in distribution to a random variable $X$, 写作 $X_{n}\overset{d}{\rightarrow}X$, 如果 $X$ 的 分布函数 $F_{X}$ 下所有 右连续的 $x$ (即 $F_{X}(x) = F_{X}(x - )$ ), 都有
>
> $$
> \lim\limits_{n\rightarrow\infty}F_{X_{n}}(x) = F_{X}(x)
> $$

> **Remark**
>
> Convergence in distribution 的意思就是: 随着 $n$ 越来越大, $X_{n}$ 的分布是否越来越接近 $X$ 的分布. 这是一个非常弱的收敛概念, 因为它甚至**不要求 $X_{n}$ 和 $X$ 在同一个概率空间上定义,** 也不要求 $X_{n}$ 和 $X$ 之间有任何关系. 只需要 分布函数收敛即可.
>
> 并且 notice: 并不要求对所有点 $x$ 都有 $F_{X_{n}}(x)\rightarrow F_{X}(x)$, 而是只要求对 $X$ 的分布函数 $F_{X}$ 下所有右连续的点 $x$. 这是因为如果不加这个限制, 很多直观上应该收敛的情况在数学上就会失败.
>
> 比如: 令$X_{n} = 1/n$, 一个 constant random variable, 那么 $X_{n}$ 的分布函数 $F_{X_{n}}$ 是一个 step function. 但是在 $x = 0$ 处, $F_{X_{n}}(0) = 0$ for all $n$, 因而 $\lim_{n\rightarrow\infty}F_{X_{n}}(0) = 0$.
>
> 而 $F_{X}(0) = 1$.
>
> 所以对于这种跳跃不连续点, 如果不跳过, 那么就会得出 $X_{n}$ 不收敛于 $X$ 的错误结论. 但是我们知道, 分布函数作为一个单调递增的函数, 是 a.e. continuous 的, 因而这些点是可以忽略掉的.

## Characterization of a distribution

### moment generating function

> **Definition: --[[moment generating function]]--**
>
> 对于一个随机变量 $X$, 其 moment generating function (MGF) 定义为
>
> $$
> M_{X}(t) = {\mathbb{E}}\lbrack e^{tX}\rbrack,\quad t \in {\mathbb{R}}
> $$

> **Remark**
>
> 为什么这个东西叫做 moment generating function 呢? 因为如果 $M_{X}(t)$ 在 $t = 0$ 的某个 neighborhood 内存在, 那么我们可以通过对 $M_{X}(t)$ 求导来得到 $X$ 的各阶矩:

> **Proposition**
>
> 如果 $M_{X}(t)$ 在 $t = 0$ 的某个 neighborhood 内存在, 则 $X$ 的 $n$ 阶矩可以表示为
>
> $$
> {\mathbb{E}}\lbrack X^{n}\rbrack = M_{X}^{(n)}(0)
> $$
>
> 其中 $M_{X}^{(n)}(0)$ 表示 $M_{X}(t)$ 在 $t = 0$ 处的 $n$ 阶导数.

### characteristic function

## Central Limit Theorem

> **Theorem: --[[Lindeberg-Levy Central Limit Theorem]]--**
>
> 对于任意一个 seq of i.i.d. random variables $\left\{ X_{i} \right\}$ with mean $\mu$ and variance $\sigma^{2} < \infty$, set $S_{n} = X_{1} + X_{2} + \cdots + X_{n}$ for each $n$.
>
> 我们有:
>
> $$
> \frac{S_{n} - n\mu}{\sqrt{n\sigma^{2}}}\overset{d}{\rightarrow}N(0,1)
> $$

> **Remark**
>
> LLN 告诉我们, 当 $n$ 越来越大时, $S_{n}/n$ 越来越接近 $\mu$. 每个 $X_{i}$ 随机取样, 不论结果如何, 其平均值大概率都是 $\mu$.\
> CLT 则是进一步告诉我们这个接近的过程是如何发生的: 随着 $n$ 越来越大, $S_{n}$ 的分布会越来越接近一个正态分布, 且波动的幅度(标准差)数量级为 $\sqrt{n}$. **因而平均值 $S_{n}/n$ 的分布会越来越接近一个均值为 $\mu$, 标准差为 $\sigma/\sqrt{n}$ 的正态分布**
>
> $$
> \frac{S_{n}}{n} = \mu + \frac{\sigma}{\sqrt{n}}Z,\quad Z \sim N(0,1)
> $$
>
> **随着$n$ 越来越大, 这个标准差会越来越小, 因而 其极限坍缩为一个 constant $\mu$.**\

> **Remark**
>
> CLT 的一个主要的应用价值, 就是可以用来估计 由多个 i.i.d. 随机因素共同作用的现象的分布.
>
> 统计学中常用于对 confidence interval 的估计, 以及 hypothesis testing, 通过计算如 ${\mathbb{P}}\left( {\frac{S_{n} - n\mu}{\sqrt{n\sigma^{2}}} \in A} \right)$ 这种形式的概率来进行推断.\

在进行证明前, 我们先看一些 applications of CLT. 可能会帮助我们更好地理解 CLT 的意义.

### applications of CLT

> **Example: (判断 coin 是否 fair)**
>
> 我们有两个 coins, 想要判断它们是否是 fair coin. 我们可以 toss 这个 coin $n$ 次, 记录下每次 toss 的结果, 记为 $X_{1},X_{2},\cdots,X_{n}$, 其中 $X_{i} = 1$ if the $i$-th toss is heads.
>
> 现在: 观测到第一个 coin 100 次 toss 中有 38 次是 heads, 第二个 coin 100 次 toss 中有 43 次是 heads.
>
> > **Solution**
> >
> > 假设这两个 coins 是 fair coin. 那么 $X_{i}$ 是 i.i.d. Bernoulli random variables with parameter $p = 0.5$, 因而 $\mu = p = \frac{1}{2}$, $\sigma^{2} = p(1 - p) = \frac{1}{4}$. 从而根据 CLT,
> >
> > $$
> > {\mathbb{P}}(S_{100} < 38) = {\mathbb{P}}\left( {\frac{S_{100} - 100 \cdot \frac{1}{2}}{\sqrt{100 \cdot \frac{1}{4}}} < \frac{38 - 100 \cdot \frac{1}{2}}{\sqrt{100 \cdot \frac{1}{4}}}} \right) \approx {\mathbb{P}}\left( {Z < \frac{38 - 50}{5}} \right) \approx {\mathbb{P}}(Z < - 2.4) \approx 0.0082 < 0.01
> > $$
> >
> > 因而这个第一个 coin 很可能不是 fair coin. 同样的方法计算出 ${\mathbb{P}}\left( {S_{100} \leq 43} \right) \approx 0.0887$, 因而第二个 coin 虽然也可疑不是 fair coin, 但是不如第一个 coin 可疑. 如果以 0.05 作为显著性水平, 那么我们可以拒绝第一个 coin 是 fair coin 的假设.\

> **Example: (样本量需求的计算)**
>
> 工厂生产了一批电线, 我们想知道它们的平均断裂强度 $\mu$ 是多少. 遂抽取 $n$ 根电线进行测量, 得到 $X_{1},...,X_{n}$, 然后计算它们的样本平均值 ${\bar{X}}_{n}$ 来估计 $\mu$.
>
> 已知量: 强度的方差 $\sigma^{2} = 1/10$.; 我们想估计的是 $\mu$ 的值. 并且我们希望我们的估计是准的, in the sense that: 误差 $|{\bar{X}}_{n} - \mu|$ 不超过 0.01 的概率至少为 0.95.
>
> > **Solution**
> >
> > 我们要达到: $\left. {\mathbb{P}}( \middle| {\bar{X}}_{n} - \mu \middle| \leq 1/100) \right.$.
> >
> > 我们要把它转成标准的 normal distribution 的形式, 即 $Z = \frac{S_{n} - n\mu}{\sqrt{n\sigma^{2}}}$ 的形式.
> >
> > 于是我们把 ${\bar{X}}_{n} - \mu$ 写为 $\frac{S_{n}}{n} - \mu$, 然后两边同时乘 $\frac{\sqrt{n}}{\sigma}$. 右边的常数项也做相同的变换: $\frac{1/100}{\sigma/\sqrt{n}} = \frac{\sqrt{n}}{100\sigma}$.
> >
> > 于是原式变为:
> >
> > $$
> > \left. {\mathbb{P}}( \middle| Z \middle| \leq \frac{\sqrt{n}}{100\sigma}) \approx 0.95 \right.
> > $$
> >
> > 对于正态分布我们知道
> >
> > $$
> > \left. {\mathbb{P}}( \middle| Z \middle| \leq x) = 2\Phi(x) - 1 \right.
> > $$
> >
> > 于是想要:
> >
> > $$
> > 2\Phi\left( \frac{\sqrt{n}}{100\sigma} \right) - 1 \geq 0.95\Longrightarrow\Phi\left( \frac{\sqrt{n}}{100\sigma} \right) \geq 0.975
> > $$
> >
> > 通过查表我们知道当 $\Phi(z) = 0.975$ 时, $z \approx 1.96$. 因此要求 $\frac{\sqrt{n}}{100\sigma} \geq 1.96$, 解得至少需要 $n \geq (61.98)^{2} \approx 384.16$, floor 一下得到 $n \geq 385$.
>
> > **Remark**
> >
> > 这里的应用正是我们开头说的: LLN 告诉我们, 当 $n$ 越来越大时, $S_{n}/n$ 越来越接近 $\mu$. 每个 $X_{i}$ 随机取样, 不论结果如何, 其平均值大概率都是 $\mu$; 而 CLT 则是进一步告诉我们这个接近的过程是如何发生的:
> >
> > $$
> > \frac{S_{n}}{n} = \mu + \frac{\sigma}{\sqrt{n}}Z,\quad Z \sim N(0,1)
> > $$
> >
> > 随着$n$ 越来越大, 这个标准差会越来越小, 因而 其极限坍缩为一个 constant $\mu$. **因而, 我们可以通过 CLT 来得到: 我们 要用样本均值来估计分布的真实均值的话, 在一定的置信水平下, 需要多少样本量 $n$ 才能保证我们的估计是准的.**

### Berry-Esseen Theorem: CLT 的收敛速度

之前的例子中, 我们都 使用了 $\approx$ 表示: 我们直接把此时的分布近似当作了一个 normal distribution, 来计算一些概率.

但是: 这两个分布的近似行为的本身有多么精准?

下面有一个 theorem 刻画了这件事.

> **Theorem: --[[Berry-Esseen Theorem]]--**
>
> 给定一个 seq of i.i.d. random variables $\left\{ X_{i} \right\}$ with mean $\mu$ and variance $\sigma^{2} < \infty$, 以及 $\left. {\mathbb{E}}\lbrack \middle| X_{i} - \mu \middle| {}_{3}\rbrack = \rho < \infty \right.$, set $S_{n} = X_{1} + X_{2} + \cdots + X_{n}$, 我们有: 对于任意 $x \in {\mathbb{R}}$,
>
> $$
> \left| {{\mathbb{P}}\left( {\frac{S_{n} - n\mu}{\sqrt{n\sigma^{2}}} \leq x} \right) - \Phi(x)} \right| \leq \frac{3\rho}{\sigma^{2}\sqrt{n}}
> $$

> **Remark**
>
> 给定一个 number of samples $n$, 我们可以给出此时的 真实概率与正态近似值之间的差值的 一个 upper bound.\
> 并且, 这个 bound 不是概率意义上的 bound, 而**是一个 deterministic bound, 没有任何的随机性**; 并且是 **uniform across all $x$ 的 bound.**\
> 这是因为这里本身就是两个概率的值之间的差, 而不是样本之间的差. 因而其实这是一个非常强大的 结论, 表面**我们用正态分布近似估计出的概率 和真实的概率之间的差值是 determinstically controllable 意义上非常小的.**\
> 我们马上可以想到: 对于 控制样本数量来达到某个置信水平的问题, 这是一个非常有用的工具, 因为它告诉我们, 当 $n$ 足够大时, 我们用正态分布近似估计出的概率和真实的概率之间的 差值是非常小并且可以控制的.\
> 并且, 这个控制应该是比较精准的. 因为相比其他的控制方法: **Chebyshev 只需要 first, second order moments 的信息; Hoeffding 只需要有界性的假设, 甚至不需要知道 分布的任何 moment 信息; 而 Berry-Esseen 需要 third order moment 的信息, 因此它应该能够给一个更精准的控制.**

> **Proof**
>
> //TODO:

> **Example**
>
> 一个工厂生产电子元件, 每个原件有概率是有缺陷的.
>
> 令
>
> $$
> X_{i} = \left\{ \begin{matrix}
> {1,} & {\text{if the}\ i\ \text{th tested component is defective},} \\
> {0,} & {\text{otherwise}\ .}
> \end{matrix} \right.
> $$
>
> 并假设 i.i.d. with parameter
>
> $$
> {\mathbb{P}}(X_{i} = 1) = p
> $$
>
> 其中 $p$ 是一个未知的参数.
>
> 工厂方面表示这个 process 是 under control 的, 并给出了假设: $H_{0}:p \leq 0.02$.
>
> 为了验证这个假设, 一个 quality control manager 需要从生产线上需要随机 $n$ 个元件进行测试, 并估计出 $p$ 的值 by 样本均值:
>
> $$
> {\widehat{p}}_{n} := \frac{1}{n}\sum\limits_{i = 1}^{n}X_{i}
> $$
>
> 我们希望这个估计的误差最多为 0.005, 并且这个误差的置信度至少为 0.99, 即我们希望:
>
> $$
> {\mathbb{P}}\left( {\left| {{\widehat{p}}_{n} - p} \right| > 0.005} \right) \leq 0.01
> $$
>
> 那么我们至少需要多少样本量 $n$ 来达到这个要求呢?

> **Solution**
>
> 首先计算样本均值 ${\widehat{p}}_{n}$ 的 mean 和 variance:
>
> $$
> {\mathbb{E}}\left\lbrack {\widehat{p}}_{n} \right\rbrack = p,\quad\text{Var}\ \left( {\widehat{p}}_{n} \right) = \frac{1}{n^{2}}\sum\limits_{i = 1}^{n}\text{Var}\ \left( X_{i} \right) = \frac{p(1 - p)}{n}
> $$
>
> 此时我们有三个办法:
>
> - 办法1: **Chebyshev's inequality**.
>
>   $$
>   {\mathbb{P}}\left( {\left| {{\widehat{p}}_{n} - p} \right| \geq \varepsilon} \right) \leq \frac{\text{Var}\ \left( {\widehat{p}}_{n} \right)}{\varepsilon^{2}} = \frac{p(1 - p)}{n\varepsilon^{2}}
>   $$
>
>   由于 $p(1 - p) \leq 1/4$ for any $p \in \lbrack 0,1\rbrack$, 式子可以进一步控制为
>
>   $$
>   {\mathbb{P}}\left( {\left| {{\widehat{p}}_{n} - p} \right| \geq \varepsilon} \right) \leq \frac{1}{4n\varepsilon^{2}}
>   $$
>
>   我们希望此概率不超过 0.01, 并且 $\varepsilon = 0.005$, 那么进一步得到需要
>
>   $$
>   \frac{1}{4n(0.005)^{2}} \leq 0.01
>   $$
>
>   解得至少需要 $n \geq 1000000$.
>
> - 办法2: **Hoeffding's inequality**.\
>   由于 $0 \leq X_{i} \leq 1$, 我们可以直接使用 Hoeffding's inequality 来控制:
>
>   $$
>   {\mathbb{P}}\left( {\left| {{\widehat{p}}_{n} - p} \right| \geq \varepsilon} \right) \leq 2e^{- 2n\varepsilon^{2}}
>   $$
>
>   我们 require 了 $2e^{- 2n(0.005)^{2}} \leq 0.01$, 因而可以解得
>
>   $$
>   n \geq \frac{|\ln(0.005)|}{2(0.005)^{2}} \approx 106,000
>   $$
>
> - 办法3: **Berry-Esseen Theorem**.\
>   首先我们假设报告的 $p$ 的值 0.02 是正确的, 从而可以计算出:
>
>   $$
>   {\mathbb{E}}\left\lbrack X_{1} \right\rbrack = p,\quad\sigma^{2} := \text{Var}\ \left( X_{1} \right) = p(1 - p) = 0.0196,\quad\sigma = 0.14
>   $$
>
>   并且, 由于 $\left| {X_{1} - p} \right| \leq 1$, 我们知道偏度 $\rho := {\mathbb{E}}\left\lbrack \left| {X_{1} - p} \right|^{3} \right\rbrack < \infty$.
>
>   因而可以应用 Berry-Esseen Theorem. 我们希望:
>
>   $$
>   {\mathbb{P}}\left( {\left| {{\widehat{p}}_{n} - p} \right| \leq \varepsilon} \right) = {\mathbb{P}}\left( {\left| {S_{n} - np} \right| \leq n\varepsilon} \right) \geq 0.99,\quad\varepsilon = 0.005
>   $$
>
>   等价于
>
>   $$
>   {\mathbb{P}}\left( {\left| \frac{S_{n} - np}{\sigma\sqrt{n}} \right| \leq \frac{\varepsilon\sqrt{n}}{\sigma}} \right) \geq 0.99
>   $$
>
>   Berry-Esseen Theorem 可以得到: 对于任意的 $x > 0$, 有
>
>   $$
>   {\mathbb{P}}\left( {\left| \frac{S_{n} - np}{\sigma\sqrt{n}} \right| \leq x} \right) \geq 2\Phi(x) - 1 - \frac{6\rho}{\sigma^{2}\sqrt{n}}
>   $$
>
>   因而我们需要选择 $n$ s.t.
>
>   $$
>   2\Phi\left( \frac{\varepsilon\sqrt{n}}{\sigma} \right) - 1 - \frac{6\rho}{\sigma^{2}\sqrt{n}} \geq 0.99
>   $$
>
>   忽略掉 $\frac{6\rho}{\sigma^{2}\sqrt{n}}$ 这个很小的项 (计算可以再精细地选择 $n$), 我们也可以得到:
>
>   $$
>   \frac{\varepsilon\sqrt{n}}{\sigma} \geq z_{0.995} \approx 2.576
>   $$
>
>   因而至少需要 $n \geq 5200$.
>
> 我们可以看到
>
> - 通过 Chebyshev's inequality 来控制, 我们需要的样本量是 100 万级别的;
>
> - 通过 Hoeffding's inequality 来控制, 我们需要的样本量是 10 万级别的;
>
> - 通过 Berry-Esseen Theorem 来控制, 我们需要的样本量是 5000 级别的, 显然更为高效.
>
> 不过, 这个结果是基于我们假设 $p = 0.02$ 的前提下得到的. Chebyshev 的逻辑 (保守估计): 我不相信厂家的任何话, 我要建立一个无论真实 $p$ 是多少都绝对成立的置信区间. 所以我必须用最差的情况 $p = 0.5$ 来算 $n$. CLT/Berry-Esseen 的逻辑 (假设检验): 厂家宣称 $p \leq 0.02$. 在统计学中, 我们通常先假设这个宣称是正确的 (即 $H_{0}$ 假设). 如果我们用在这个假设下得出的需要的样本量 $n = 5200$ 去测, 发现结果远超 $0.02$, 那我们就直接推翻厂家的说法.

### proof of CLT
