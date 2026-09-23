---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: MATH 597
date: Winter 2025
description: Measure theory notes migrated from the complete LaTeX course source.
keywords:
- measure theory
- integration
- Lebesgue measure
- Radon--Nikodym theorem
- Lp spaces
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: 7
source: "notes/math/measure-theory/chapters/11-Radon-Nikodym_theorem.typ"
subtitle: Typst-first course notes and worked homeworks
title: "MATH 597: Measure Theory"
---
# Radon-Nikodym theorem

## Radon-Nikodym Theorem \[Fol 3.2\]

以下是两个 instructive 的 questions:\
Question 1: Given 三个 s.m. on

$$
\mu = m + \sum\limits_{j = 1}^{\infty}c_{j}\delta_{x_{j}} + \mu_{Cantor}
$$

on $({\mathbb{R}},\mathcal{B}({\mathbb{R}}))$, 我们可否从 $\mu$ 中 recover 其中一个 measure, without 另外两个 measure?

$$
\mu_{Cantor} = (?)\mu
$$

Question 2: 给定一个任意的 p.m. $\mu$, 以及一个任意的 s.m. $\nu$ on $(X,\mathcal{A})$,\
如何判断是否存在一个 $f \in L^{1}(\mu)$, 使得

$$
\nu(E) = \int_{E}f\, d\mu
$$

以及, 如果存在, 如何找到这样的一个 $f$?

### absolutely continuous: $\nu \ll \mu$

> **Definition: --[[absolute continuity of signed measures]]--**
>
> 给定 p.m. $\mu$ 和 [[signed measure]] $\nu$ on $(X,\mathcal{A})$, 我们称 $\nu$ is absolutely continuous w.r.t. $\mu$, 如果
>
> $$
> \forall E \in \mathcal{A},\quad\mu(E) = 0\Longrightarrow\nu(E) = 0
> $$
>
> 即: $\nu$ 的 null sets 包含了 $\mu$ 的所有 null sets. ($\nu$ 拥有比 $\mu$ 严格更多的 null sets)\
> 写作
>
> $$
> \nu \ll \mu
> $$

![Figure 34:[ ]{style="white-space: pre-wrap"}mutually singular and absolutely continuous](.assets/main--figure-raster-033.png){width="50%"}

[[mutually singular]] 的记号 **$\nu\bot\mu$ 表示的是 $\nu$ 和 $\mu$ 出现变化的区域完全不同**, 而 **$\nu \ll \mu$ 表示的是 $\nu$ 出现变化的区域完全包括在 $\mu$ 出现变化的区域里** (因为 $\mu$ 不变化的区域被包括在 $\nu$ 不变化的区域里).

> **Example**
>
> $f \in L^{1}(\mu)$, $\nu(E): = \int_{E}f\, d\mu$, 由积分定义出的 s.m., 总是满足
>
> $$
> \nu \ll \mu
> $$

> **Example**
>
> $$
> \nu_{1}: = m,\quad\nu_{2} := \sum\limits_{j = 1}^{\infty}c_{j}\delta_{x_{j}},\quad\nu_{3}: = \mu_{Cantor}
> $$
>
> 这三个 measure 有
>
> $$
> \nu_{i}\ll\not{}\nu_{j}\quad\forall i \neq j
> $$
>
> 它们是 mutually singular 的. 对于其中任意两个 $\nu_{i},\nu_{j}$, 本身已经存在一个划分使得 $\nu_{i}$ 在 $E$ 上是 null 的而 $\nu_{j}$ 在 $E^{c}$ 上是 null 的. 那么如果 $\nu_{i} \ll \nu_{j}$, 则说明 $\nu_{i}$ 在 $E^{c}$ 上也是 null 的, 那么 $\nu_{i}$ 在整个 $X$ 上都是 null 的, 说明 $\nu_{i}$ 是一个 trivial measure.\
> 显然, 这里三个 measure 都不是 trivial measure, 因而它们之间没有 abs ctn 的关系.

> **Proposition: --[[absolutely continuous 的性质]]--**
>
> - 对 [[total variation measure]],
>
>   $$
>   \left. |\nu \middle| \ll \mu\Leftrightarrow\nu^{+} \ll \mu\ \text{and}\ \nu^{-} \ll \mu \right.
>   $$
>
>   (容易证明)
>
> - $$
>   \nu \perp \mu\ \text{and}\ \nu \ll \mu\Longrightarrow\nu = 0
>   $$
>
>   (刚才已经证明)

我们可以把 absolutely ctn 的概念从一个 s.m. wrt 一个 p.m. 扩展到一个 s.m. wrt 一个 s.m., by taking 后面这个 s.m. 的 total variation measure:

$$
\left. \text{say}\ \nu \ll \mu,\text{if}\ \nu \ll \middle| \mu| \right.
$$

但是 Folland 表示我们之后并不需要用到这个更 general 的定义. 所以不用在意它.

### $\nu \ll \mu$ 的等价条件

question: 为什么这个定义要叫做 absolutely continuous, 它和 continuous 这个词到底有什么关系. 下面这个 theorem 说明了这一点.

> **Theorem: --[[why it is called \"absolutely continuous\"]]--**
>
> 令 $\nu$ 为一个 **finite s.m.**, $\mu$ 为一个 **p.m.** on $(X,\mathcal{A})$.\
> Claim:
>
> $$
> \left. \nu \ll \mu\Leftrightarrow\forall\,\epsilon > 0,\,\exists\,\delta > 0\text{s.t.} \middle| \nu(E) \middle| < \epsilon\ \text{whenever}\ \mu(E) < \delta \right.
> $$

> **Remark**
>
> 类比: $f(x)$ is **uniform ctn function** of $x$: 对于任意 $\epsilon$ 都存在 $\delta$ 使得 $\left. |f(y) - f(x) \middle| < \epsilon \right.$ whenever $\left. |x - y \middle| < \delta \right.$.\
> 而 finite s.m. 的 absolutely ctn $\nu \ll \mu$ 也是一个连续性表达: 我们以 measure $\mu$ 作为集合大小的度量基准, **对于任意集合, 对其进行很小的调整改变其 $\mu$-大小 (比如去掉/并上一个 $\mu$-小集合), $\nu$ 的值的改变相对于这个 $\mu$-大小调整是连续的. (可以更改这个$\mu$-大小调整尺度, 使得 $\nu$ 的值的改变任意小)**\
> 我们经过思考可以发现, 这和我们之前说的 **\"$\nu \ll \mu$ 表示的是 $\nu$ 出现变化的区域完全包括在 $\mu$ 出现变化的区域里\" 是一致的**, 因为这即说明对于 finite $\nu$ 受到 $\mu$ 的可控制性 (不存在失控的区域): 既然只有在 $\mu$ 的 variation 区域才出现 variation, 那么取它们相对 variation 的最大比例, 那么总是可以通过 $\mu$, 把 $\nu$ 的 variation 控制在这个 variation 比例之上.

> **Proof**
>
> \(i\) to (ii): 我们使用反证, 利用 **limsup**.\
> Assume (i), 并 suppose for contradiction that (ii) 不成立.\
> 那么存在 $\epsilon > 0$ s.t. 对于任意 $n \in {\mathbb{N}}$, 都存在一个 seq $E_{n} \in \mathcal{A}$ s.t. $\mu(E_{n}) \leq \frac{1}{2^{n}}$, $\nu(E_{n}) \geq \epsilon$ for each $n$.\
> Set
>
> $$
> E: = \operatorname{lim\, sup}\limits_{n}E_{n} = \bigcap\limits_{n = 1}^{\infty}\bigcup\limits_{k = n}^{\infty}E_{k}
> $$
>
> 我们标记后面的每个集合为:
>
> $$
> F_{n}: = \bigcup\limits_{k = n}^{\infty}E_{k}
> $$
>
> 于是
>
> $$
> \mu(F_{n}) \leq \sum\limits_{k = n}^{\infty}\frac{1}{2^{k}} = \frac{1}{2^{n}}
> $$
>
> 从而得到,
>
> $$
> \mu(E) = 0
> $$
>
> 而由于 $\nu(F_{n}) \geq \epsilon$ for each $n$, we have
>
> $$
> \nu(E) \geq \epsilon
> $$
>
> 这与 $\nu \ll \mu$ contradict. 从而得证: $\nu \ll \mu\Longrightarrow\delta$-$\epsilon$ argument.\
> 而 $\delta$-$\epsilon$ argument $\Longrightarrow$ $\nu \ll \mu$ 是 trivial 的.

### RN derivative and RN Thm

### RN derivative: (if exist) express how $\nu$ can be induced from $\mu$

> **Definition: --[[Radon-Nikodym derivative]]--**
>
> 对于 $\begin{matrix}
> {\{\text{p.m.}\ \mu} \\
> {\text{s.m.}\ \nu}
> \end{matrix}$ on $(X,\mathcal{A})$, 如果存在一个 $\mathcal{A}$-measurable $f$, 使得 $\nu$ 为 the **signed measure $\nu$ induced by $\mu$ and $f$:**
>
> $$
> \nu(E) = \int_{E}f\, d\mu,\quad\forall E \in \mathcal{A}
> $$
>
> 则称 **$f$ is the Radon-Nikodym Derivative of $\nu$ w.r.t. $\mu$.** 写作
>
> $$
> f = \frac{d\nu}{d\mu}
> $$
>
> 或者
>
> $$
> d\nu = fd\mu
> $$

Radon-Nikodym derivative $f$ 刻画的是**在每一点 $x \in X$ 上, signed 测度 $\nu$ 相对于测度 $\mu$ 的变化速率.**\
We sometimes call $\nu$ **the signed measure $f\, d\mu$.**\

> **Example**
>
> 取 LS measure $\mu_{F}$ on $({\mathbb{R}},\mathcal{B}({\mathbb{R}}))$, with $F = e^{2x}$.\
> 那么:
>
> $$
> \mu_{F}((a,b)) = e^{2b} - e^{2a} = \int_{a}^{b}2e^{2x}\, dx
> $$
>
> 我们可以 check:
>
> $$
> \mu_{F}(E) = \int_{E}2e^{2x}\, dx,\quad\forall E \in \mathcal{B}({\mathbb{R}})
> $$
>
> 因而
>
> $$
> \frac{d\mu_{F}}{dm} = 2e^{2x} = F'(x)
> $$

> **Proposition**
>
> 任取 measure $\mu$, 以及 extended $\mu$-integrable function $f$, 那么the **signed measure $\nu$ induced by $\mu$ and $f$** 即 $\nu(E): = \int_{E}f\, d\mu$ 一定有:
>
> $$
> \nu \ll \mu
> $$

> **Proof**
>
> trivial.

Question: 我们如何判断这个 RN derivative 是否存在呢? Radon Nikodym Theorem 正是这个问题的答案.

### RN Thm: $\sigma$-finite $\nu \ll \mu\Leftrightarrow$ 存在 RN derivative

> **Theorem: --[[Radon-Nikodym Theorem]]--**
>
> 对于 [[$\sigma$-finite measure]] $\begin{matrix}
> {\{\text{p.m.}\ \mu} \\
> {\text{s.m.}\ \nu}
> \end{matrix}$ on $(X,\mathcal{A})$,
>
> $$
> \nu \ll \mu\Leftrightarrow\exists\ \text{ext.}\ \mu\ \text{-intble}\ f = \frac{d\nu}{d\mu}
> $$
>
> 并且这个 RN derivative **$f$ 是 **unique 的, in $\mu$-a.e. sense.**** (即在 $\mu$ 的一个 null set 之外唯一).

Radon Nikodym Theorem 表示, 对于 $\sigma$-finite 的 $\nu$ 和 $\mu$, RN derivative 存在(并且一定唯一)当且仅当 $\nu \ll \mu$. 即对于任意两个 abs ctn 的 measure, 只要它们 $\sigma$-finite, 就可以用一个具体的函数 $f$ 来表达它们之间的关系.\
要证明 RN Theorem, 我们还需要一些 Lemma.

> **Lemma**
>
> 如果 $\nu,\mu$ 都是 **finite positive** measure on $(X,\mathcal{A})$ 并且 $\mu\operatorname{\perp\not{}}\nu$, 那么一定存在 $\epsilon > 0$ 以及 $E \in \mathcal{A}$ with $\mu(E) > 0$ s.t.
>
> $$
> \nu \geq \epsilon\mu\quad\text{on}\ E
> $$

> **Proof**
>
> We look at $\nu - \frac{1}{n}\mu$ for each $n \in {\mathbb{N}}$. 它们都是 finite signed measure for sure.\
> 考虑 [[Hahn Decomposition Theorem]] 给出的 $P_{n} \sqcup N_{n}$ for each $n$. 并 set:
>
> $$
> P: = \bigcup\limits_{n}P_{n},\quad N: = \bigcap\limits_{n}N_{n} = P^{c}
> $$
>
> 于是: $N$ 对于任意 $n$, 都是 $\nu - \frac{1}{n}\mu$ 的 negative set.\
> 这说明:
>
> $$
> \forall n,\,\, 0 \leq \nu(N) \leq \frac{1}{n}\mu(N)
> $$
>
> 因而一定有:
>
> $$
> \nu(N) = 0
> $$
>
> (这是显然的, 因为 $N$ intersect 了所有的 $\nu - \frac{1}{n}\mu$ 的负集, 在 $n$ 大的时候这个 diff measure 基本等于 $\nu$, 而 $\nu$ 本身是 positive 的, 那么显然 $\nu(N) = 0$.)\
> Case 1: 如果 $\mu(P) = 0$, 那么 $\mu\bot\nu$.\
> Case 2: Otherwise then 存在某个 $\mu(P_{n}) > 0$, 说明 $P_{n}$ 是 $\nu - \frac{1}{n}\mu$ 的 positive set, 因而在 $P_{n}$ 上, $\nu \geq \frac{1}{n}\mu$.

这个 Lemma 表明, 对于两个 positive measures, 它们要么 mutually singular, 要么一定存在某个 nontrivial 的集合上, 一个能够以一定比例 bound 另外一个.\
这是因为, 只要这两个 positive measures 不是 mutually singular 的 (说明它们有共同的存在变化的区域), 那么 note that positive measure 随着集合增大一定是增大的, 因而直觉上肯定存在某个子集, 使得其上, 它们其中一个能够以一定比例 bound 另外一个.\
现在我们证明 RN Thm:

> **Proof**
>
> **of RN Thm:**\
> **Step 1: 首先确认 uniqueness, if exist.**\
> 首先我们 assume $\nu,\mu$ 都是 finite p.m.\
> 我们先 verity **uniqueness**: 假设
>
> $$
> d\nu = f_{1}\, d\mu = f_{2}\, d\mu,\quad f_{i}\ \text{ext.}\ \mu\ \text{-intble}
> $$
>
> 那么令 $g: = f_{1} - f_{2}$, 有
>
> $$
> \int_{E}g\, d\mu = 0\quad\forall E \in \mathcal{A}
> $$
>
> 所以 $g = 0$ a.e.\
> This shows the uniqueness.\
> 然后我们 verity **existence**:\
> 我们考虑
>
> $$
> \mathcal{F}: = \left\{ {f \in L^{+}(\mu):\int_{E}f\, d\mu \leq \nu(E),\forall E \in \mathcal{A}} \right\}
> $$
>
> We can define partial order on $\mathcal{F}$: 称 $f_{1} \leq f_{2}$ if $f_{1}(x) \geq f_{2}(x)$ for a.e. $x$.\
> 显然 $f = 0$ 是 $\mathcal{F}$ 中最小的元素. Idea: 我们想要得到 $\mathcal{F}$ 中最大的元素 $f_{max}$, 看看是否能取到总是有
>
> $$
> \int_{E}f_{max}d\mu = \nu(E)
> $$
>
> **Step 2: Claim** $f_{1},f_{2} \in \mathcal{F}\Longrightarrow f := \max\left\{ {f_{1},f_{2}} \right\} \in \mathcal{F}$\
> Proof of Claim: for fixed $f_{1},f_{2}$, 考虑 $A: = \left\{ {f_{1} > f_{2}} \right\}$. 任取 $E \in \mathcal{A}$, 有:
>
> $$
> \int_{E}f\, d\mu = \int_{E \cap A}f_{1}\, d\mu + \int_{E \cap A^{c}}f_{2}\, d\mu \leq \nu(E \cap A) + \nu(E \cap A^{c}) = \nu(E)
> $$
>
> Claim proved.\
> **Step 3: 构造出 potential RN derivative: 最大的元素 $f \in \mathcal{F}$** 现在我们 set
>
> $$
> a: = \sup\left\{ {\int f\, d\mu \mid f \in \mathcal{F}} \right\}
> $$
>
> 显然有:
>
> $$
> 1 \leq a \leq \nu(X)
> $$
>
> pick $g_{n} \in \mathcal{F}$ s.t. $\int g_{n}\, d\mu\operatorname{\nearrow ︎}a$, 并且 set
>
> $$
> f_{n}: = \max\left\{ {g_{1},\cdots,g_{n}} \right\}
> $$
>
> for each $n$.\
> 显然有:
>
> $$
> f_{n} \leq f_{n + 1},\quad\int f_{n}\, d\mu\operatorname{\nearrow ︎}a
> $$
>
> 并且根据我们的 claim, 所有 $f_{n} \in \mathcal{F}$.\
> 根据可测函数的性质,
>
> $$
> \exists f: = \lim\limits_{n}f_{n} \in L^{+}(\mu),\text{and} \in L^{1}(\mu)\text{(since}\ \mu\ \text{finite)}
> $$
>
> 并且根据 [[monotone convergence theorem]]（MCT）,
>
> $$
> \int f\, d\mu = \lim\limits_{n\rightarrow\infty}\int f_{n}\, d\mu = a
> $$
>
> 并且, 对于任意 $E$ measurable, 根据 MCT 也有
>
> $$
> \int_{E}f\, d\mu = \lim\limits_{n\rightarrow\infty}\int_{E}f_{n}\, d\mu \leq \nu(E)
> $$
>
> 我们 set:
>
> $$
> \nu'(E): = \int_{E}f\, d\mu
> $$
>
> **Step 4: 证明 $\nu' = \nu$.**\
> Proof: 首先我们知道 by def $\nu' \leq \nu$.\
> Set:
>
> $$
> \widetilde{\nu}: = \nu - \nu' \geq 0
> $$
>
> By our assumption $\nu \ll \mu$, 从而也有 $\widetilde{\nu} \ll \mu$.\
> 因而只需要证明 $\widetilde{\nu}\bot\mu$, 就可以得到 $\widetilde{\nu} = 0$, 从而证明出 $\nu' = \nu$.\
> 这个时候 Lemma 就起了作用:\
> Suppose for contradictin that $\widetilde{\nu}\operatorname{\perp\not{}}\mu$, 那么 by lemma, 由于 $\widetilde{\nu}$ 是一个 finite positive measure, $\mu$ 也是一个 finite positive measure, 则存在 $\epsilon > 0$ 和 nontrivial measurable $E$, 使得 $\widetilde{\nu} \geq \epsilon\mu$ on $E$.\
> 于是:
>
> $$
> g: = f + \epsilon\chi_{E} \in \mathcal{F}
> $$
>
> 而 $\int f\, d\mu = a$, 因而
>
> $$
> \int g\, d\mu > a
> $$
>
> 这和 $g \in \mathcal{F}$ 冲突 (否则它的积分一定小于等于 $a$).\
> **从而, $\mu,\nu$ 是 finite p.m. 的情况得证.**\
> **Step 5: 推广至 $\nu$ finite s.m., $\mu$ finite p.m. 的情况.**\
> 由 [[Jordan decomposition theorem]] 写出 $\nu^{+},\nu^{-}$, 再直接 Apply Step 1 即得证.\
> **Step 6: 推广至 $\nu,\mu$ $\sigma$-finite 的情况.**\
> Proof: By $\sigma$-finite 的定义, 我们可以 decompose
>
> $$
> X = \bigsqcup\limits_{n = 1}^{\infty}X_{n}
> $$
>
> 那么 by finite case, $\nu|_{X_{n}}$, $\mu|_{X_{n}}$ is finite for each $n$.\
> 因而
>
> $$
> f_{n}: = \frac{\left. d(\nu \middle| {}_{X_{n}}) \right.}{\left. d(\mu \middle| {}_{X_{n}}) \right.}\,\,\exists\quad\text{for each}\ n
> $$
>
> 于是, take
>
> $$
> f: = \sum\limits_{n = 1}^{\infty}\mathbf{1}_{X_{n}}f_{n}
> $$
>
> 即可得证.\
> **Note: 这里的 $f$ 是 ext $\mu$-intble 的, 即: $f^{+},f^{-}$ 至少有一个是 ext $\mu$-intble 的. 这 follows from $\nu$ 作为一个 signed measure 的定义: $\nu$ 至多 admit $+ \infty, - \infty$ 中的一个.\
> Specially, 如果 $\nu$ 是一个 positive measure, 那么 $f$ 一定也是非负的, 从而 $f^{-} = 0$.**

> **Remark**
>
> 在 RN Thm 的 proof 中, 我们的大体思路就是: 首先, 肯定要 reduce to 我们熟悉的 finite positive measure 的情况; 其次, 我们使用一个 trick: 取一个能够逐步逼近 RN derivative $\frac{d\nu}{d\mu}$ 的空间
>
> $$
> \mathcal{F}: = \left\{ {f \in L^{+}(\mu):\int_{E}f\, d\mu \leq \nu(E),\forall E \in \mathcal{A}} \right\}
> $$
>
> 并猜想其最大的元素就是 $\frac{d\nu}{d\mu}$, 然后证明它们确实相等, by proving 它们的差是一个 zero measure.

下一个 lecture: 我们将 upgrade RN Thm to 一个更加 general 的 version: Lebesgue Radon Nikodym Thm.

## Lebesgue-Radon-Nikodym Theorem \[Fol 3.2, finished; 3.3, finished\]

recall Radon-Nikodym Theorem:

$$
\begin{matrix}
{\{\mu\sigma\ \text{-finite p.m.}} \\
{\nu\sigma\ \text{-finite s.m.}} \\
{\nu \ll \mu\Longrightarrow\{\exists!\text{extended}\ \mu\ \text{-integrable} f:X\rightarrow{\mathbb{R}}} \\
{d\nu = fd\mu}
\end{matrix}
$$

我们称 $f$ 为 Radon-Nikodym Derivative:

$$
\nu(E) = \int_{E}f d\mu
$$

> **Example**
>
> Application: conditional expectation.\
>
> $$
> (X,\mathcal{A},\mu) := (\lbrack 0,1),\mathcal{B}(\lbrack 0,1)),m)
> $$
>
> $f:\lbrack 0,1)\rightarrow{\mathbb{R}}$ Borel measurable.\
> Define:
>
> $$
> B: = \left\{ {\varnothing,\lbrack 0,\frac{1}{2}),\lbrack\frac{1}{2},1),X} \right\}
> $$
>
> $f$ 并非一定是 $B$-measurable 的.

### LRNT: 任意 $\sigma$-finite $\nu,\mu$, 可将 $\nu$ 拆解成 $\lambda\bot\mu$ 和 $\rho \ll \mu$

> **Theorem: --[[Lebesgue-Radon-Nikodym Theorem]]--**
>
> 如果 $\begin{matrix}
> {\{\mu\sigma\ \text{-finite p.m.}} \\
> {\nu\sigma\ \text{-finite s.m.}}
> \end{matrix}$ on $(X,\mathcal{A})$, 那么存在唯一的 decomposition
>
> $$
> \nu = \lambda + \rho
> $$
>
> where $\lambda,\rho$ 是 $\sigma$-finite 的 signed measure s.t. $\begin{matrix}
> {\{\lambda\bot\mu} \\
> {\rho \ll \mu}
> \end{matrix}$.\
> (于是, by RNT, 存在 $\mu$-unique 的 extended $\mu$-integrable $f:X\rightarrow{\mathbb{R}}$ s.t. $d\rho = f\, d\mu$ ).

Sktech of proof of LRN theorem: Assume for simplicity that $\mu,\nu$ 是 finite p.m.\
Like last time, look at

$$
\mathcal{F}: = \left\{ {f \in L^{+}:\int_{E}f\, d\mu \leq \nu(E)\forall E \in \mathcal{A}} \right\}/ \sim
$$

Saw: $\mathcal{F}$ 有 max element $f$.\
Define $\rho$ by $d\rho = f\, d\mu$.\
Set:

$$
\lambda: = \nu - \rho
$$

Want: $\lambda\bot\mu$.\
Prove by contradiction: 如果 $\lambda\operatorname{\perp\not{}}\mu$, 那么Lemma 2 告诉我们: 存在 $\epsilon > 0$ 和 positive measure 的 $E \in \mathcal{A}$ 使得:

$$
\lambda \geq \epsilon\mu
$$

on $E$.\
Set

$$
g: = f + \epsilon\chi_{E}
$$

则

$$
\int_{F}g\, d\mu = \int_{F \cap E}(f + \epsilon)\, d\mu\, + \,\int_{F \cap E^{c}}f\, d\mu
$$

因而

$$
\begin{matrix}
{\rho(F \cap E) + \epsilon\mu(F \cap E) + \rho(F \cap E^{c})} & {= \rho(F) + \epsilon\mu(F \cap E)} \\
 & {\leq \nu(F) - \epsilon\mu(F) + \epsilon\mu(F \cap E)} \\
 & {\leq \nu(F)}
\end{matrix}
$$

因而 $g \in \mathcal{F}$ 且 $g > f$.\
从而得证 $\lambda\bot\mu$. 从而 existence proved.\
Uniqueness part: Suppose we have

$$
\nu = \lambda_{1} + \rho_{1} = \lambda_{2} + \rho_{2}
$$

where $\lambda_{i}\bot\mu$, $\rho_{i} \ll \mu$. 那么

$$
\lambda_{1} - \lambda_{2} = \rho_{2} - \rho_{1}
$$

我们知道, $\lambda_{1} - \lambda_{2}$ 和 $\rho_{2} - \rho_{1}$ 也是 signed measures. 并且,

$$
(\lambda_{1} - \lambda_{2})\bot\mu,\quad(\rho_{2} - \rho_{1}) \ll \mu
$$

By Lemma 1:

$$
\lambda_{1} - \lambda_{2} = \rho_{2} - \rho_{1} = 0
$$

Properties of the RN derivative: (P91 in Folland)

$$
\frac{d(\nu_{1} + \nu_{2})}{d\mu} = \frac{d\nu_{1}}{d\mu} + \frac{d\nu_{2}}{d\mu}
$$
$$
\nu \ll \mu,\mu \ll \mu\Longrightarrow\frac{d\nu}{d\mu}\frac{d\mu}{d\nu} = 1
$$

$\mu$-a.e. = $\nu$-a.e.

### complex measure 以及 complex version of LRNT

> **Definition: --[[complex measure]]--**
>
> 一个 complex measure on a measurable space $(X,\mathcal{A})$ 是一个 map $\nu:\mathcal{A}\rightarrow{\mathbb{C}}$ satisfying $\nu(\varnothing) = 0$ 以及 ctbl disjoint additivity.

> **Example**
>
> simple complex measures:
>
> $X = \left\{ {1,2,\cdots,n} \right\}$ $\nu$ p/s/c measure on $X$.\
> Since $X = \left\{ {1,2,\ldots,n} \right\}$, a complex measure $\nu$ is just a function
>
> $$
> \nu_{0}:X\rightarrow{\mathbb{C}},\quad\text{i.e.,}\ \nu_{0} = (\nu_{1},\ldots,\nu_{n}) \in {\mathbb{C}}^{n}.
> $$
>
> 而
>
> $$
> \nu(E) = \sum\limits_{x \in E}\nu_{0}(x)
> $$
>
> $\nu$ positive: $\in {\mathbb{R}}_{+}^{n}$ $\nu$ signed: $\in {\mathbb{R}}^{n}$
>
> For discrete spaces, the total variation measure is defined pointwise:
>
> $$
> \left. |\nu \middle| (i) := \middle| \nu_{i} \middle| ,\quad\text{for each}\ i = 1,\ldots,n. \right.
> $$
>
> So the total variation measure $|\nu|$ is just the vector of magnitudes:
>
> $$
> \left. |\nu \middle| = ( \middle| \nu_{1} \middle| , \middle| \nu_{2} \middle| ,\ldots, \middle| \nu_{n} \middle| ). \right.
> $$
>
> What is $\frac{d\nu}{\left. d \middle| \nu| \right.}$?
>
> Since this is a finite discrete setting, the Radon-Nikodym derivative is computed \*\*pointwise\*\*:
>
> $$
> \left( \frac{d\nu}{\left. d \middle| \nu| \right.} \right)(i) = \left\{ \begin{matrix}
> {\frac{\nu_{i}}{|\nu_{i}|}\ } & {\text{if}\ \nu_{i} \neq 0,} \\
> {0\ } & {\text{if}\ \nu_{i} = 0.}
> \end{matrix} \right.
> $$
>
> So the result is a function $f:X\rightarrow{\mathbb{C}}$, given by:
>
> $$
> f(i) = \left\{ \begin{matrix}
> {\frac{\nu_{i}}{|\nu_{i}|}\ } & {\text{if}\ \nu_{i} \neq 0,} \\
> {0\ } & {\text{if}\ \nu_{i} = 0.}
> \end{matrix} \right.
> $$
> $$
> f := \frac{d\nu}{\left. d \middle| \nu| \right.} = \left( {\frac{\nu_{1}}{|\nu_{1}|},\frac{\nu_{2}}{|\nu_{2}|},\ldots,\frac{\nu_{n}}{|\nu_{n}|}} \right),\quad\text{with the convention}\ \frac{0}{0} := 0.
> $$
>
> This derivative is a function that lives on the unit circle in $\mathbb{C}$ (except at zero), and it satisfies:
>
> $$
> \left. |f(i) \middle| = 1\quad\text{whenever}\ \nu_{i} \neq 0. \right.
> $$

