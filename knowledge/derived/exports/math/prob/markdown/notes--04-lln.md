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
semantic-node-count: 6
source: "notes/math/prob/chapters/04-LLN.typ"
subtitle: Typst-first course notes
title: "Math 525: Probability"
---
# Behaviors of a sequence of random variables

## Toolbox review: inequalities in probability

这一节是一个 review, 复习一些在 measure theory 中我们已经证明过, 在 probability theory 中经常用到的 inequalities.

### Markov's ineqaulity and Chebyshev's inequality

> **Theorem: --[[Markov's inequality]]--**
>
> 对于一个 non-negative random variable $X$ (即 $X \geq 0$ a.s.), 任取 $t > 0$, 都有
>
> $$
> {\mathbb{P}}(X \geq t) \leq \frac{{\mathbb{E}}\lbrack X\rbrack}{t}
> $$

> **Remark**
>
> 这是一个很直观的 geometric intuition: 如果 $t$ 是均值 $\mu$ 的 3 倍, 那么 $X$ 大于 $t$ 的测度就不应该超过均值 $\mu$ 的 1/3; 否则, $X$ 的均值 就一定大于 $\mu$ 了 (即便其他地方的值都为 0).
>
> 它 imply 这样一个时期: 对于 density function, 只要我们知道这个 RV 的均值, 那么对于 density function 截取任意点后面的 tail, 我们总是能够给出一个 upper bound:
>
> ![密度曲线在阈值 $t$ 右侧的尾部概率](.assets/notes--fig-prob-04-lln-diagram-01.svg){#fig-prob-04-lln-diagram-01 alt="A density curve with the tail to the right of threshold t shaded as P(X >= t)."}

> **Proof**
>
> 我们考虑一个 indicator function $\mathbf{1}_{\{{X \geq t}\}}$, 这也是 一个 non-negative random variable. 显然:
>
> $$
> X \geq t \cdot \mathbf{1}_{\{{X \geq t}\}}
> $$
>
> (在 $X \geq t$ 的事件上等于, 其他事件上小于), 并且这个 indicator function 的 expectation 正是 $X$ 大于 $t$ 的概率 ${\mathbb{P}}(X \geq t)$.
>
> 因而 by linearity of expectation,
>
> $$
> {\mathbb{E}}\lbrack X\rbrack \geq t{\mathbb{E}}\lbrack\mathbf{1}_{\{{X \geq t}\}}\rbrack = t{\mathbb{P}}(X \geq t)
> $$
>
> 其值为 1 当 $X \geq t$ 时, 否则为 0. 对于任意的 $t > 0$, 有

> **Corollary: [[Chebyshev's inequality]]**
>
> 对于一个 random variable $X$ 和任意的 $t > 0$, 如果它的方差 $\text{Var}(X)$ 是有限的, 那么 有
>
> $$
> \left. {\mathbb{P}}( \middle| X - {\mathbb{E}}\lbrack X\rbrack \middle| \geq t) \leq \frac{\text{Var}(X)}{t^{2}} \right.
> $$

> **Remark**
>
> Markov's ineq 是通过均值来 bound 非负随机变量 达到一定大小的概率 (在多少事件上是大于 $t$ 的);
>
> Chebyshev's ineq 则是通过方差来 bound 任意随机变量 偏离均值达到一定程度的概率 (在多少事件上是偏离均值超过 $t$ 的).

> **Proof**
>
> 考虑 non-negative random variable $(X - {\mathbb{E}}\lbrack X\rbrack)^{2}$, 那么
>
> $$
> \left. {\mathbb{P}}( \middle| X - {\mathbb{E}}\lbrack X\rbrack \middle| \geq t) = {\mathbb{P}}((X - {\mathbb{E}}\lbrack X\rbrack)^{2} \geq t^{2}) \leq \frac{{\mathbb{E}}\lbrack(X - {\mathbb{E}}\lbrack X\rbrack)^{2}\rbrack}{t^{2}} = \frac{\text{Var}(X)}{t^{2}} \right.
> $$

### Cauchy-Schwarz and Jensen's ineq

> **Theorem: --[[Cauchy-Schwarz inequality]]--**
>
> 对于任意的 random variables $X$ 和 $Y$, 都有
>
> $$
> \left. |{\mathbb{E}}\lbrack XY\rbrack \middle| \leq \sqrt{{\mathbb{E}}\lbrack X^{2}\rbrack \cdot {\mathbb{E}}\lbrack Y^{2}\rbrack} \right.
> $$

这是 prob space 作为一个 measure space, 其上的函数空间 $L^{2}(\Omega,\mathcal{F},{\mathbb{P}})$ 作为一个 Hilbert space, 自然的 Cauchy-Schwarz inequality. 不赘述了.

> **Theorem: --[[Jensen's inequality]]--**
>
> 对于一个 convex function $\phi$ 和 任意的 random variable $X$, 只要 ${\mathbb{E}}\lbrack X\rbrack$ 和 ${\mathbb{E}}\lbrack\phi(X)\rbrack$ 都是 well-defined 的 (即 finite), 都有
>
> $$
> \phi({\mathbb{E}}\lbrack X\rbrack) \leq {\mathbb{E}}\lbrack\phi(X)\rbrack
> $$

> **Proof**
>
> Let $x_{0} := {\mathbb{E}}\lbrack X\rbrack$.
>
> Since $\phi$ is convex, for any $x$, there exists a supporting line to the graph of $\phi$ at $x$. 即 存在一个 $m \in {\mathbb{R}}$ s.t. 对于任意的 $y$, 都有
>
> $$
> \varphi(x) \geq \varphi\left( x_{0} \right) + m\left( {x - x_{0}} \right)
> $$
>
> 因而 apply to $X$, 我们 a.s. 有
>
> $$
> \varphi(X) \geq \varphi({\mathbb{E}}\lbrack X\rbrack) + m(X - {\mathbb{E}}\lbrack X\rbrack)
> $$
>
> 因此 by linearity of expectation,
>
> $$
> {\mathbb{E}}\lbrack\varphi(X)\rbrack \geq \varphi({\mathbb{E}}\lbrack X\rbrack) + m({\mathbb{E}}\lbrack X\rbrack - {\mathbb{E}}\lbrack X\rbrack) = \varphi({\mathbb{E}}\lbrack X\rbrack)
> $$

### Fatou's Lemma, MCT and DCT

我们在 measure theory 中最熟悉的三个定理. 复习一下. 这里不 prove 了. proof 请左转 measure theory notes.

> **Theorem: [[Fatou's Lemma]]**
>
> 令 $\left\{ X_{n} \right\}$ 是一列 non-negative random variables, 那么
>
> $$
> {\mathbb{E}}\lbrack\operatorname{lim\, inf}\limits_{n\rightarrow\infty}X_{n}\rbrack \leq \operatorname{lim\, inf}\limits_{n\rightarrow\infty}{\mathbb{E}}\lbrack X_{n}\rbrack
> $$

> **Remark**
>
> pointwise 下极限的积分, 得到的结果不会大于每个函数积分的下极限.
>
> 因为 pointwise 下极限即: 在每个 $\omega$ 上, 整个序列中最终稳定的最低水平 , 这是最稳定的一层.
>
> 而逐个函数可能会有一些 spike, 使得它的 expectation 很大, 但是这个 spike 只出现有限次, 导致 pointwise limitinf 的函数没有受到它的影响; 但是, 不同的 spike 可能 finitely 出现在不同的位置上, 而这个出现的行为是无限的(比如 typewritter 函数), 使得每个函数的 expectation 都很大, 从而导致 expectation 的 limit 很大.
>
> 而 pointwise liminf 的 expectation 就是对每个点都取最终稳定的最低水平, 从而避免了这些 spikes 的影响.

> **Theorem: [[monotone convergence theorem]]**
>
> 令 $\left\{ X_{n} \right\}$ 是一列递增的 non-negative random variables (即 $X_{n} \uparrow X$ a.s.), 那么 suppose $X := \lim_{n\rightarrow\infty}X_{n}$ a.e. exists, 那么 a.s. 有
>
> $$
> \lim\limits_{n\rightarrow\infty}{\mathbb{E}}\lbrack X_{n}\rbrack = {\mathbb{E}}\lbrack X\rbrack
> $$

> **Remark**
>
> 如果 $X_{n}$ 是递减的, 那么 expectation 的 limit 就等于逐点 limit 的 expectation 了.

> **Theorem: [[dominated convergence theorem]]**
>
> 令 $\left\{ X_{n} \right\}$ 是一列 random variables, 并且存在一个 a.e. pointwise limit $X$ (即 $X_{n}\rightarrow X$ a.s.), 并且存在一个 integrable random variable $Y$ 作为一个 bound: 使得 $\left. |X_{n} \middle| \leq Y \right.$ a.s. 对所有的 $n$ 成立,
>
> 那么
>
> $$
> \lim\limits_{n\rightarrow\infty}{\mathbb{E}}\lbrack X_{n}\rbrack = {\mathbb{E}}\lbrack X\rbrack
> $$

> **Remark**
>
> 只要这个序列有一个 integrable 的 uniform bound (不要有很多 unbounded 的 spike 就行了), 那么 expectation 的 limit 就等于逐点 limit 的 expectation 了.

### Tonneli and fubini

> **Theorem: [[Tonelli]]**
>
> 对于一列 non-negative random variables $\left\{ X_{n} \right\}$, 累加和积分(求期望)的顺序可以交换:
>
> $$
> {\mathbb{E}}\left\lbrack {\sum\limits_{n = 1}^{+ \infty}X_{n}} \right\rbrack = \sum\limits_{n = 1}^{+ \infty}{\mathbb{E}}\left\lbrack X_{n} \right\rbrack
> $$

> **Theorem: [[Fubini's Theorem]]**
>
> 对于一列任意的 random variables $\left\{ X_{n} \right\}$, 只要其绝对值的 sum 的 expectation 是 finite 的 (或者绝对值的 expectation 的 sum 是 finite 的, by Tonneli 都是一样的), 那么就有 linearity of expectation 的推广:
>
> $$
> {\mathbb{E}}\left\lbrack {\sum\limits_{n = 1}^{+ \infty}X_{n}} \right\rbrack = \sum\limits_{n = 1}^{+ \infty}{\mathbb{E}}\left\lbrack X_{n} \right\rbrack
> $$

> **Remark**
>
> Fubini 和 Tonelli 即: 把 linearity of expectation 推广到 countable sum 的情况, 前提是 either 非负(因而无穷不用管) or 它们的 expectation 是一个绝对 收敛的 series 就行了.

## Definition review: modes of convergence

这一个 section 也是一个 review. 讲讲 不同的 convergence mode 的定义, 以及它们之间的关系.

首先, 我们对 pointwise limit 和 uniform limit 的定义已经很熟悉了, 这里就不赘述了. (算了 uniform 还是提一嘴, 意思是我们需要 pointwise limit 的 收敛速度也是 uniform 的, 即对任意的 $\epsilon > 0$, 都存在一个 $N$ 使得对于所有的 $n \geq N$ 和所有的 $\omega$, 都有 $\left. |X_{n}(\omega) - X(\omega) \middle| < \epsilon \right.$, 是一个严格强于 pointwise 的收敛方式. )

> **Definition: --[[RV 序列的三种收敛方式]]--**
>
> - **converge a.s. (almost surely)** 或称 converge with probability 1:
>
>   $$
>   {\mathbb{P}}\left( {\lim\limits_{n\rightarrow\infty}X_{n} = X} \right) = 1
>   $$
>
>   即:
>
>   $$
>   {\mathbb{P}}\left( \left\{ {\omega \in \Omega:\lim\limits_{n\rightarrow\infty}X_{n}(\omega) = X(\omega)} \right\} \right) = 1
>   $$
>
>   也就是说 $X_{n}$ 的 a.e. pointwise limit 是 $X$.
>
> - **converge in $L^{p}$**: 对于 $L^{p}$-integrable 的 random variables sequence $X_{n}$ 和 $X$, 我们称 $X_{n}\overset{L^{p}}{\rightarrow}X$, 如果
>
>   $$
>   \lim\limits_{n\rightarrow\infty}{\mathbb{E}}\left\lbrack \left| {X_{n} - X} \right|^{p} \right\rbrack = 0
>   $$
>
>   即: 这个 seq of RVs 与这个 limit function 之间的 $L^{p}$ distance 收敛到 0; 也就是它们的偏差 as a random variable, 其 $p$-th moment 收敛到 0.
>
> - **converge in probability**: 对于任意的 $\epsilon > 0$, 如果
>
>   $$
>   \left. \lim\limits_{n\rightarrow\infty}{\mathbb{P}}( \middle| X_{n} - X \middle| > \epsilon) = 0 \right.
>   $$
>
>   即 $X_{n}$ 与 $X$ 之间的偏差超过 $\epsilon$ 的概率收敛到 0.

## Borel-Cantelli Lemma

## Laws of Large Numbers

### weak and strong LLN

下面是概率论中最重要的定律之一: 大数定律 (Laws of Large Numbers, LLN).

它证明的是一个十分符合直觉的结论: 一个 random variable 的 sample mean (即 $n$ 个 i.i.d. 的 copy 的均值), 随着 sample 数量的增加, 会 converge to 它的 expectation.

就是说: 我们重复做一个相同的实验并 取结果的平均值, 当我们做的实验足够多时, 这个平均值就会非常接近于这个实验的 expectation, 也就是理论的均值.\
例如最经典的例子就是抛硬币: 我们连续抛 $n$ 次一个公平的硬币, 记录每次抛出正面 (记为 1) 或者反面 (记为 0), 然后计算这些结果的平均值, 随着 $n$ 的增加, 这个平均值会趋近于 0.5, 等于 理论的 expectation (这是个 Bernouli random variable, expectation = $p$).\
LLN 有两个阶段, weak LLN 和 strong LLN, weak LLN 证明的是这个 convergence 是 in probability 的, 而 strong LLN 证明的是这个 convergence 是 a.s. 的. 就是说 strong LLN 是严格强于 weak LLN 的.

> **Theorem: --[[weak Law of Large Numbers]]--**
>
> 对于一列 i.i.d. 的 random variables $\left\{ X_{i} \right\}$, 只要这个 random variable 的 expectation 是 finite 的 ${\mathbb{E}}\lbrack X_{1}^{2}\rbrack < \infty$, 那么就有:
>
> $$
> \frac{X_{1} + X_{2} + \cdots + X_{n}}{n}\overset{p}{\rightarrow}{\mathbb{E}}\lbrack X_{1}\rbrack\quad\text{as}\ n\rightarrow\infty
> $$

> **Proof**
>
> 简写 $\mu := {\mathbb{E}}\lbrack X_{1}\rbrack$, $S_{n} := \frac{X_{1} + X_{2} + \cdots + X_{n}}{n}$ for each $n$.
>
> Let $\varepsilon > 0$. It suffices to show: $\left. {\mathbb{P}}( \middle| S_{n} - \mu \middle| > \varepsilon)\rightarrow 0 \right.$ as $n\rightarrow\infty$. By Chebyshev's inequality, we have
>
> $$
> \begin{matrix}
> {{\mathbb{P}}\left( {\left| {S_{n}/n - \mu} \right| > \varepsilon} \right)} & {\leq \frac{\text{Var}(S_{n}/n)}{\varepsilon^{2}}} \\
>  & {= \frac{1}{n^{2}\varepsilon^{2}}\left( \sum\limits_{n = 1}^{n}{\mathbb{E}}\lbrack \middle| \ X_{i} - \mu\  \middle| {}_{2}\rbrack + 2\sum\limits_{1 \leq i < j \leq n}{\mathbb{E}}\lbrack(X_{i} - \mu)(X_{j} - \mu)\rbrack \right)}
> \end{matrix}
> $$
>
> notice: 由于每个 $X_{i}$ 都是 i.i.d. 的, independence $\Longrightarrow$ uncorrelatedness $\Longrightarrow\text{Cov}(X,Y) = {\mathbb{E}}\lbrack XY\rbrack - {\mathbb{E}}\lbrack X\rbrack{\mathbb{E}}\lbrack Y\rbrack = 0$, 因而 ${\mathbb{E}}\lbrack(X_{i} - \mu)(X_{j} - \mu)\rbrack = {\mathbb{E}}\lbrack(X_{i} - \mu)\rbrack{\mathbb{E}}\lbrack(X_{j} - \mu)\rbrack = 0 \cdot 0 = 0$ for each $i \neq j$.
>
> 因而
>
> $$
> \left. {\mathbb{P}}\left( {\left| {S_{n}/n - \mu} \right| > \varepsilon} \right) = \frac{1}{\varepsilon^{2}n^{2}}\sum\limits_{n = 1}^{n}{\mathbb{E}}\lbrack \middle| X_{i} - \mu \middle| {}_{2}\rbrack = \frac{1}{\varepsilon^{2}n} \cdot n\ \text{Var}(X_{1})\overset{n\rightarrow\infty}{\rightarrow}0 \right.
> $$

> **Theorem: --[[strong Law of Large Numbers]]--**
>
> 在 weak LLN[Theorem 4.28](#thm-04-lln-weak-law-of-large-numbers) 的相同条件 (其实可以更弱, 让 $E\lbrack X_{1}\rbrack < \infty$ 即可) 下, 我们其实可以得到一个更强的结论:
>
> $$
> \frac{X_{1} + \ldots + X_{n}}{n}\overset{\text{a.s.}}{\rightarrow}{\mathbb{E}}\left\lbrack X_{1} \right\rbrack,\quad\text{as}\ n\rightarrow\infty
> $$

> **Proof**
>
> For simplicity, 我们不证明更弱的条件 ($E\lbrack X_{1}\rbrack < \infty$) 下的 strong LLN 了. 只沿用相同的条件.
>
> 简写 $\mu := {\mathbb{E}}\lbrack X_{1}\rbrack$, $\sigma^{2} := \text{Var}(X_{1})$, $S_{n} := \frac{X_{1} + X_{2} + \cdots + X_{n}}{n}$ for each $n$, 以及
>
> $$
> Y_{n} := \frac{S_{n}}{n} - \mu
> $$
>
> 我们将要证明: $Y_{n}\overset{a.s.}{\rightarrow}0$.
>
> 首先, 在 weak LLN 的 proof 中, 我们已经证明了:
>
> $$
> {\mathbb{E}}(Y_{n}) = 0,\quad{\mathbb{E}}\lbrack Y_{n}^{2}\rbrack = \frac{\sigma^{2}}{n}
> $$
>
> 我们发现: 当我们只采样 $n^{2}$ indexed 的时候, 它们的 expectation 的 sum 是 finite 的, by p-test (因为 $\sum_{n = 1}^{\infty}\frac{1}{n^{p}}$ 收敛当且仅当 $p > 1$), 即:
>
> $$
> {\mathbb{E}}\left\lbrack {\sum\limits_{n = 1}^{+ \infty}Y_{n^{2}}^{2}} \right\rbrack = \sum\limits_{n = 1}^{+ \infty}{\mathbb{E}}\left\lbrack Y_{n^{2}}^{2} \right\rbrack = \sum\limits_{n = 1}^{+ \infty}\frac{\sigma^{2}}{n^{2}} < \infty
> $$
>
> 先考虑所有 $Y_{n}$ 都非负的 case. 我们知道: expectation of 一个 non-negative random variable 是 finite 的, 就 imply 它是 a.e. finite 的. 因而
>
> $$
> \sum\limits_{n = 1}^{+ \infty}Y_{n^{2}}^{2} < \infty\quad\text{a.s.}
> $$
>
> 因而
>
> $$
> \lim\limits_{n\rightarrow\infty}Y_{n^{2}} = 0\quad\text{a.s.}
> $$
>
> 意味把在 $1,4,9,16...$ 这些 index 的 $Y_{i}$ 求 average, 确实收敛到了 $\mu$.
>
> 而我们可以通过 squeeze theorem 得到 general case: 对于任意正整数 $k$, 总能找到一对平方数把它夹在中间. 比如令 $n^{2} < k < (n + 1)^{2}$.
>
> 我们发现:
>
> $$
> \frac{S_{n^{2}}}{(n + 1)^{2}} \leq \frac{S_{k}}{k} \leq \frac{S_{(n + 1)^{2}}}{n^{2}}
> $$
>
> notice: $\frac{S_{n^{2}}}{(n + 1)^{2}} = \frac{S_{n^{2}}}{n^{2}} \cdot \frac{n^{2}}{(n + 1)^{2}}$, 前向 converge to $\mu$, 后向 converge to 1, 因而 $\frac{S_{n^{2}}}{(n + 1)^{2}}\rightarrow\mu$, 后面那个也同理. 因而夹逼得到 $S_{k}/k\rightarrow\mu$. 从而得证.
>
> General case:
>
> $$
> X_{n} = \max\left\{ {X_{n},0} \right\} - \max\left\{ {- X_{n},0} \right\} = :X_{n}^{+} - X_{n}^{-}
> $$
>
> 因而
>
> $$
> \frac{X_{1} + \ldots + X_{n}}{n} = \frac{X_{1}^{+} + \ldots + X_{n}^{+}}{n} - \frac{X_{1}^{-} + \ldots + X_{n}^{-}}{n}\overset{\text{a.s.}}{\rightarrow}{\mathbb{E}}\left\lbrack X_{1}^{+} \right\rbrack - {\mathbb{E}}\left\lbrack X_{1}^{-} \right\rbrack = {\mathbb{E}}\left\lbrack X_{1} \right\rbrack
> $$
>
> 得证.

> **Remark**
>
> 我们要求 $\left. {\mathbb{E}}\lbrack \middle| X_{1} \middle| \rbrack \right.$ 是 finite 的, 或者 $\left. {\mathbb{E}}\lbrack \middle| X_{1} \middle| {}_{2}\rbrack \right.$ 是 finite 的, 并不是一个硬性的条件, 只是结果确实 converge to ${\mathbb{E}}\lbrack X_{1}\rbrack$ 这个 finite value 的条件.
>
> 实际上在 ${\mathbb{E}}\lbrack X_{1}\rbrack$ infinite (等于 $\infty$ 或者 $- \infty$) 时, 我们会得到这个 average 发散, 因而也是 和 ${\mathbb{E}}\lbrack X_{1}\rbrack$ 一样, 只不过不是 converge 而是 diverge.
>
> 此处不证明了.

### application: Monte Carlo methods

任何利用 LLN 来近似计算 一个 quantity 的方法, 都可以称之为 Monte Carlo 方法.

它的核心思想是:

- 选择一个随机变量, 其 expectation 等于我们要计算的 quantity.

- 大量重复采样这个随机变量, 并计算样本的平均值

- 根据大数定律, 这个平均值近似于我们要计算的 quantity.

- 我们可以用 Chebyshev's inequality 来给出这个近似的误差 bound.

> **Example: 估算 $\pi$**
>
> 我们令 $X,Y \sim U(\lbrack - 1,1\rbrack)$
>
> 那么
>
> $$
> {\mathbb{E}}\left\lbrack {\mathbf{1}_{C}(X,Y)} \right\rbrack = \int_{- 1}^{1}\int_{- 1}^{1}\mathbf{1}_{C}(x,y)f_{X,Y}(x,y)dxdy = \frac{1}{4}\int_{- 1}^{1}\int_{- 1}^{1}\mathbf{1}_{C}(x,y)dxdy = \frac{\pi}{4}
> $$
>
> 注意我们每次随机采样 $X,Y$ 的时候, 都是在 $\lbrack - 1,1\rbrack \times \lbrack - 1,1\rbrack$ 这个正方形里随机选一个点, 即创建了一个 random variable $(X_{i},Y_{i})$ 并进行观测.
>
> 根据 LLN, 不论单次的采样结果如何, 我们都可以得到
>
> $$
> \lim\limits_{n\rightarrow\infty}\frac{\mathbf{1}_{C}\left( {X_{1},Y_{1}} \right) + \ldots + \mathbf{1}_{C}\left( {X_{n},Y_{n}} \right)}{n} = \frac{\pi}{4},\quad\text{a.s.}
> $$
>
> 我们还可以用 Chebyshev's inequality 来给出这个近似的误差 bound:
>
> $$
> {\mathbb{P}}\left( {\left| {4S_{n}/n - \pi} \right| > \varepsilon} \right) \leq \frac{\text{Var}\ \left( {4S_{n}/n} \right)}{\varepsilon^{2}} = \frac{4^{2}}{n^{2}\varepsilon^{2}}\ \text{Var}\ \left( {\sum\limits_{i = 1}^{n}\mathbf{1}_{C}\left( {X_{i},Y_{i}} \right)} \right) = \frac{16}{n\varepsilon^{2}}\ \text{Var}\ \left( {\mathbf{1}_{C}\left( {X_{1},Y_{1}} \right)} \right) \approx \frac{1}{n\varepsilon^{2}}
> $$
>
> 因而当 $n$ 足够大时, 几乎一定可以得到目标值.
>
> ``` {data-lang="python"}
> import random
> def estimate_pi(n):
>     S_n = 0 # This step 1
>     for _ in range(n):
>         # Here is step 2 (and 3)
>         X = random.uniform(-1, 1)
>         Y = random.uniform(-1, 1)
>         # Check if the point is inside the unit circle
>         if X**2 + Y**2 <= 1:
>             S_n += 1
>     pi_estimate = 4 * S_n / n
>     return pi_estimate
> # Example usage
> n = 1000000
> pi_approx = estimate_pi(n)
> print(pi_approx)
> ```

### application: Bernstein Polynomials

### application: Hypothesis testing

