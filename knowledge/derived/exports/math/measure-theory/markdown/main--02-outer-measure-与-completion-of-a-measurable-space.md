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
semantic-node-count: 13
source: "notes/math/measure-theory/chapters/02-outer-measure-与-completion-of-a-measurable-space.typ"
subtitle: Typst-first course notes and worked homeworks
title: "MATH 597: Measure Theory"
---
# outer measure 与 completion of a measurable space

## complete measure space and outer measure \[Fol 1.3, finished; 1.4\]

> **Definition: --[[null set]]-- , --[[subnull set]]-- , --[[almost everywhere]]--**
>
> 对于 [[measure space]] $(X,\mathcal{M},\mu)$, 其中 $\mu$ 是相应的 [[measure]],
>
> 1.  我们称 $A \in \mathcal{M}$ 为一个 **null set**, 如果 $\mu(A) = 0$;
>
> 2.  我们称 $B \subseteq X$ 为一个 **subnull set**, 如果存在某个 null set $A$ containing it.
>
> 3.  我们称一个 statement about $X$ 是 **almost everywhere (a.e.)** 的, 如果这个 statement 除了在某个 null set 上之外, 在 $X$ 上处处成立.

> **Definition: --[[complete measure space]]--**
>
> 我们称 $(X,\mathcal{M},\mu)$ 是一个 complete measure space, 如果它其中的任意 subnull set 都是 null set. (即它 measurable)

> **Remark**
>
> 我们知道, 根据 measure 的 monotonicity, subnull set 的 measure, 如果存在, 一定是 $\leq$ 它所在的 null set 的, 即一定 $= 0$. 所以 complete measure space 的实际意思是： 这个 measure space 里, 任意 null set 的所有子集都是 measurable 的, 即所有足够小的集合都在这个 $\sigma$-algebra 里.

> **Example**
>
> 一个 not complete 的 measure space 的例子:
>
> $$
> X = \left\{ {1,2} \right\},\mathcal{M} = \varnothing,X,\mu(\forall) = 0.
> $$
>
> 这个例子中, $\left\{ 1 \right\},\left\{ 2 \right\}$ 这两个集合不是 measurable 的, 但是却是 nullset (全集) 的子集.

> **Theorem: --[[every measure space can be completed]]--**
>
> Suppose $(X,\mathcal{M},\mu)$ is a measure space.\
> Let
>
> $$
> \mathcal{N} := \left\{ {\text{all null sets in}\ \mathcal{M}} \right\}
> $$
>
> Claim:
>
> $$
> \bar{M} := \left\{ {E \cup F \mid E \in \mathcal{M},F \subseteq N\ \text{for some}\ N \in \mathcal{N}} \right\}
> $$
>
> is a $\sigma$-algebra, 并且在 $\bar{\mathcal{M}}$ 上存在一个 unique 的 extension $\bar{\mu}$ of $\mu$.

> **Proof**
>
> 这一部分的 proof 以及 remark 在 hw2. 这里, $\bar{M}$ 称为 **completion of $\mathcal{M}$ with respect to $\mu$**, 以及 $\bar{\mu}$ 称为 **completion of $\mu$.**

### outer measure

> **Definition: --[[outer measure]]--**
>
> An outer measure on $X$ is a function $\mu^{\ast}:\mathcal{P}(X)\rightarrow\lbrack 0,\infty)$ such that
>
> 1.  $\mu(\varnothing) = 0$
>
> 2.  monotone ($A \subset B\Longrightarrow\mu^{\ast}(A) \leq \mu^{\ast}(B)$)
>
> 3.  countable subadditive ($\mu^{\ast}(\bigcup_{i = 1}^{\infty}E_{i}) \leq \sum_{i = 1}^{\infty}\mu^{\ast}(E_{i})$)

> **Remark**
>
> 我们对比 measure 和 outer measure 的定义: measure 的条件比 outer measure 强在:
>
> 1.  measure 是定义在一个严格的 $\sigma$-algebra 上的, 而 outer measure 则是定义在整个幂集上的.
>
> 2.  measure 要求 disjoint countable additivity, outer measure 并不要求

在这两个条件的缩减下, 我们规定 outer measure 具有 monotonicity 和 countable subadditivity. 注意: measure 本身也有这个性质, 这是 measure 的 countable additivity 的推论.\
outer measure 的意义在于, 我们的 measure 只定义在 $\sigma$-algebra 上, 而我们想要给每个子集都赋予一个近似于测度的东西.

### induce outer measure out of a \"elementary length function\"

> **Theorem: --[[construct outer measure out of an \"elementary length function\"]]--**
>
> 另 $\mathcal{E} \subseteq \mathcal{P}(X)$ 为一个包含 $\varnothing,X$ 的集合, 并定义 $\rho:\mathcal{E}\rightarrow\lbrack 0,\infty)$ 为一个满足 $\rho(\varnothing) = 0$ 的函数, 则
>
> $$
> \mu^{\ast}(A) = \inf\left\{ {\sum\limits_{i = 1}^{\infty}\rho(E_{i}) \mid E_{i} \in \mathcal{E}\ \text{for each i and}\ A \subseteq \bigcup\limits_{i = 1}^{\infty}E_{i}} \right\}
> $$
>
> is an outer measure.

> **Proof**
>
> 1.  取所有 $E_{j} = \varnothing$, 得到 $\mu^{\ast}(\varnothing) = 0$
>
> 2.  monotonicity 显然, 因为如果 $A \subseteq B$, 那么 $A$ 取 inf 的这个集合是包含于 $B$ 的, 因而取到的 inf 是小于等于的.
>
> 3.  证明 ctbl subadditivity, 我们使用经典的 $\epsilon/2^{i}$ argument. 这个 statement 直观上是显然的, 因为对一个 seq of sets, 每一个里面都有一个 seq of covering, 那么这个 seq of seq of covering 总体也是这个 seq union 的一个 covering. 不过我们不能这么说, 因为这里有一个 inf 操作的换序. 所以我们令 $\epsilon > 0$, 对于每个 $A_{i}$ 的 covering $(E_{i,k})_{k \in {\mathbb{N}}}$, 我们令 $\sum_{k}\rho(E_{i,k}) \leq \mu^{\ast}(A_{i}) + \epsilon/2^{i}$, 最后可以得到 $\mu^{\ast}(\bigcup_{i}A_{i}) \leq \sum_{i}\mu^{\ast}(A_{i})$. 由于 $\epsilon$ arbitrary, 得证.

> **Example**
>
> 我们取 $\mathcal{E}$ 为 $\mathbb{R}$ 上所有的 intervals, 并取 $\rho$ 为 interval 的 length, 就得到了一个外测度. (也就是 Lebesgue outer measure)

## $\mu^{\ast}$-measurability and Carathéodory's Theorem \[Fol 1.4\]

### $\mu^{\ast}$-measurable

> **Definition: --[[$\mu^{\ast}$-measurable]]--**
>
> Given outer measure $\mu^{\ast}$, 我们称 $A \subseteq X$ 是 $\mu^{\ast}$-measurable 的, if:
>
> $$
> \mu^{\ast}(E) = \mu^{\ast}(E \cap A) + \mu^{\ast}(E \cap A^{c})
> $$

> **Remark**
>
> countable subadditivity 蕴含的信息是: 如果我们把一个集合 divide 成几部分, **其 outer measure 有可能 increase.** 而 $\mu^{\ast}$-measurable 的含义是: 任何一个其他集合, 分割为和 $E$ 重合以及和 $E$ 的两部分之后, 其 measure 都不会增大.\
> **Note:** **by subaddivity, must have $\mu^{\ast}(E) \leq \mu^{\ast}(E \cap A) + \mu^{\ast}(E \cap A^{c})$**, 而 $\mu^{\ast}$-measurable 的集合, 则有 equality 总是成立.\
> 同时注意: 这个行为对于 complement 是对称的.

> **Remark**
>
> outer measure 是对于整个 power set 中每一个集合都赋予的, 并且其性质 ctbl subadditivity 严格弱于 countable additivity. 我们自然想到: 是否有一个 power set 的子集, 其不仅是一个 $\sigma$-algebra, 并且其上满足 countable additivity? 如果存在, 那么我们就从 outer measure induce 出了 measure.\
> 再加上之前的用随意的 length function 来 induce outer measure 的方法, 我们就可以通过一个随意的 length function $\rightarrow$ outer measre $\rightarrow$ measure. (eg: 从 box length induce 出 Legesgue outer measure, 再 induce 出 Lebesgue measure).\
> 而实际上这个想法是正确的. 只要把 $\mu^{\ast}$ 的范围限制在所有 $\mu^{\ast}$-measurable sets 上, 就形成了 $\sigma$-algebra, 并且其 restriction 是一个 measure, 甚至是一个 complete measure.

### Carathéodory's Theorem

> **Theorem: --[[Carathéodory theorem]]--**
>
> 对于任意的 outer measure $\mu^{\ast}$,
>
> $$
> \mathcal{M} := \left\{ {\text{all}\ \mu^{\ast}\ \text{-measurable sets}} \right\}
> $$
>
> **is a [[$\sigma$-algebra]]**.\
> 并且, $\mu^{\ast}|_{\mathcal{M}}$ **is a complete measure.**

> **Proof**
>
> 我们首先证明这个 $\mathcal{M}$ 是一个 $\sigma$-algebra
>
> 1.  $\varnothing \in \mathcal{M}$ by def.
>
> 2.  $\mathcal{M}$ closed under complement, by def of $\mu^{\ast}$-measurablity. (它对于 complement 是对称的.)
>
> 3.  为证明 $\mathcal{M}$ closed under countable union, 我们首先 prove it for two sets. 假设 $A,B \in \mathcal{M}$, 且 disjoint. Let $E \subseteq X$. 我们已知
>
>     $$
>     \mu^{\ast}(E) = \mu^{\ast}(E \cap A) + \mu^{\ast}(E \cap A^{c})
>     $$
>
>     **我们 WTS: $\mu^{\ast}(E) = \mu^{\ast}(E \cap (A \cup B)) + \mu^{\ast}(E \cap (A \cup B)^{c})$**\
>     我们对于 $E \cap A$, $E \cap A^{c}$ 可以得到:
>
>     $$
>     \mu^{\ast}(E \cap A) = \mu^{\ast}(E \cap A \cap B) + \mu^{\ast}(E \cap A \cap B^{c})
>     $$
>
> $$
> \mu^{\ast}(E \cap A^{c}) = \mu^{\ast}(E \cap A \cap B) + \mu^{\ast}(E \cap A^{c} \cap B^{c})
> $$
>
> By $A \cup B = (A\backslash B) \sqcup (A \cap B) \sqcup (B\backslash A)$, 可以得到:
>
> $$
> \mu^{\ast}(E \cap (A \cup B)) \geq \mu^{\ast}(E \cap A \cap B) + \mu^{\ast}(E \cap A \cap B^{c}) + \mu^{\ast}(E \cap A^{c} \cap B)
> $$
>
> 结合以上四个 equations 可以得到
>
> $$
> \mu^{\ast}(E) \geq \mu^{\ast}(E \cap (A \cup B)) + \mu^{\ast}(E \cap (A \cup B^{c}))
> $$
>
> 又 $\leq$ by countable subadditivity 成立, 我们得证 closed under two union (从而 inductively closed under any finite union, $\mathcal{M}$ 因而是一个 algebra).\
>
> > **Remark**
> >
> > (Note: 这里我会想: 证明了这个 statement for any union of two sets 不就是证明了它对 any union 都成立吗? 实则不然, 因为 set union 的从属关系并不是可以从对任意 $n$ 成立推广到对无穷成立, 因为这里的无穷是一个真实存在的 sequence, 而我们可以从\"任意 $n$ 成立推广到对无穷成立\" 的是比较数值大小, 因为 infinite series sum 的定义就是 limit, 而 set union 并没有 limit. 所以这里不能够直接得证.)\
> > \
>
> (Continuing the proof:) 现在我们再把这个 closed under finite union 推广到 closed under countable union, 以映证 $\mathcal{M}$ 是一个 $\sigma$-algebra. 注意到 **STS (suffices to show): $\mathcal{M}$ closed under countable disjoint union**. 因为任意不 disjoint 的两个集合都可以拆分成三个 disjoint 的集合.\
> 我们令 $(A_{i})$ 为一个 $\mathcal{M}$ 中的 disjoint sequence, 并定义 $B_{n} := \bigcup_{i = 1}^{n}A_{i}$, 我们由上一步的结论知道, $B_{n} \in \mathcal{M}$ for all $n$. Define $B := \bigcup_{i = 1}^{\infty}A_{i}$, Let $E \subseteq X$, WTS: $\mu^{\ast}(E) = \mu^{\ast}(E \cap B) + \mu^{\ast}(E \cap B^{c})$.\
> 考虑 $\mu^{\ast}(E \cap B_{n}) = \mu^{\ast}(E \cap B_{n} \cap A_{n}) + \mu^{\ast}(E \cap B_{n} \cap A_{n}^{c}) = \mu^{\ast}(E \cap A_{n}) + \mu^{\ast}(E \cap B_{n - 1})$, 因为 inductively 可得到:
>
> $$
> \mu^{\ast}(E \cap B_{n}) = \sum\limits_{i = 1}^{n}\mu^{\ast}(E \cap A_{i})
> $$
>
> 从而：
>
> $$
> \mu^{\ast}(E) = \mu^{\ast}(E \cap B_{n}) + \mu^{\ast}(E \cap B_{n}^{c}) \geq \sum\limits_{i = 1}^{n}\mu^{\ast}(E \cap A_{i}) + \mu^{\ast}(E \cap B^{c})
> $$
>
> by monotonicity ($\mu^{\ast}(E \cap B_{n}^{c}) \geq \mu^{\ast}(E \cap B^{c})$), 这里是一个 infinite sum, 并且 true for every $n$, 因而可以推广到 infinity, 得到
>
> $$
> \mu^{\ast}(E) \geq \sum\limits_{i = 1}^{\infty}\mu^{\ast}(E \cap A_{i}) + \mu^{\ast}(E \cap B^{c}) \geq \mu^{\ast}(\bigcup\limits_{i = 1}^{\infty}(E \cap A_{i})) + \mu^{\ast}(E \cap B^{c}) = \mu^{\ast}(E \cap B) + \mu^{\ast}(E \cap B^{c}) \geq \mu^{\ast}(E)
> $$

**This finishes the proof of $\mathcal{M}$ being a $\sigma$-algebra.** 我们同时发现, $\mu^{\ast}|_{\mathcal{M}}$ 是一个 **complete measure** on $\mathcal{M}$ 是一个 trivial fact after the proof, 因为 taking $B = E$, 可以得到

$$
\mu^{\ast}(B) = \sum\limits_{i = 1}^{\infty}\mu^{\ast}(A_{i})
$$

并且 by monotonicity, 对于任意的 $\mu^{\ast}(A) = 0$, 任取 $E \subseteq X$, 都有

$$
\mu^{\ast}(E) \leq \mu^{\ast}(E \cap A) + \mu^{\ast}(E \cap A^{c}) = \mu^{\ast}(E \cap A^{c}) \leq \mu^{\ast}(E)
$$

因而

$$
\mu^{\ast}(E) = \mu^{\ast}(E \cap A) + \mu^{\ast}(E \cap A^{c})
$$

得到 $A \in \mathcal{M}$. 从而得证这是一个 complete measure.\

> **Remark**
>
> 证明 Carathéodory's Theorem 的 punchline 在于: 我们令 $(A_{i}) \in \mathcal{M}$ be a sequence, $B_{n}$ be its partial union for $n$ terms, 可以得到
>
> $$
> \mu^{\ast}(E \cap B_{n}) = \mu^{\ast}(E \cap B_{n} \cap A_{n}) + \mu^{\ast}(E \cap B_{n} \cap A_{n}^{c}) = \mu^{\ast}(E \cap A_{n}) + \mu^{\ast}(E \cap B_{n - 1})
> $$
>
> , 因为 inductively 可得到:
>
> $$
> \mu^{\ast}(E \cap B_{n}) = \sum\limits_{i = 1}^{n}\mu^{\ast}(E \cap A_{i})
> $$
>
> 这个 statement 对于 $\mathcal{M}$ 是 $\sigma$-algebra 以及 $\mu^{\ast}|_{\mathcal{M}}$ 是 measure 的证明都很重要. 我们在 outer measure 的定义中, 只声明了 countable subadditivity, 而我们需要证明的是 countable diskjoint additivity, 也就是需要把不等式变成一个等式.\
> 为此我们看到 $\mu^{\ast}$-measurable 的定义 (Carathéodory condition) 中的等号, 并从中找到这个等式关系: **通过 disjoint set sequence 上 inductively 对于前一项使用 Carathéodory condition, 得到 disjoint additivity.** (笔者的感觉是 Carathéodory condition 的直观看似不明显, 但是如果把一个 disjoint union 自身作为 $E$, 并把自身的某项作为 $A$, 就非常明显, 表示的是 disjoint measure sum 就是 measure of disjoint union.)

## premeasure and Hahn-Kolmogrov extension Theorem \[Fol 1.4, finished\]

我们发现: 有些子集簇上的 \"length\" 很明显, 并且也符合 measure 的定义, 但是这个子集簇却并不构成一个 $\sigma$-algebra. 比如:

> **Example**
>
> $\left\{ \text{all half-open, half-closed intervals} \right\} \subseteq {\mathbb{R}}$ 上, 以 interval 的 length 作为 measure, 很显然符合 measure function 的定义, 但是 $\left\{ \text{all half-open, half-closed intervals} \right\} \subseteq {\mathbb{R}}$ 并不是一个 $\sigma$-algebra, 因为它可以通过 ctbl union 出 open interval, 并不在这个子集簇中. 不过, 这是一个 algebra.\

因此, 我们想要一个方法来 **extend a \"measure\" function on an algebra, to a measure on a $\sigma$-algebra.**

> **Definition: --[[premeasure]]--**
>
> 给定 $\mathcal{P}(X)$ 上的一个 [[algebra of sets]] $\mathcal{A}_{0}$, 我们称 $\mu_{0}:\mathcal{A}_{0}\rightarrow\lbrack 0, + \infty\rbrack$ 为一个 premeasure, if
>
> 1.  $\mu_{0}(\varnothing) = 0$
>
> 2.  $\mu_{0}$ ctbl disjoint additive in $\mathcal{A}_{0}$

> **Remark**
>
> premeasure 就是定义在 algebra instead of $\sigma$-algebra 上的 measure. 显然, 通过和 measure 相同的方式可证明, premeasure 在 $\mathcal{A}_{0}$ 上是 **monotone 以及 ctbl subadditive 的.**

### induce outer measure out of a premeasure: preserving $\mu_{0}$ on $\mathcal{A}_{0}$

> **Proposition: --[[premeasure extension via induced outer measure]]--**
>
> Any premeasure can induce an outer measure:
>
> $$
> \mu^{\ast}(E) = \inf\left\{ {\sum\limits_{i = 1}^{\infty}\mu_{0}(A_{i}) \mid A_{i} \in \mathcal{A}_{0},E \subseteq \bigcup\limits_{i = 1}^{\infty}A_{i}} \right\}
> $$
>
> 并且, we have:
>
> $$
> \left. \mu^{\ast} \middle| {}_{\mathcal{A}_{0}} = \mu_{0} \right.
> $$
>
> 并且 **every set in $\mathcal{A}_{0}$ is $\mu^{\ast}$-measurable.**

> **Proof**
>
> **这个 outer measure 的 construction directly follows from** [Theorem 2.5](#thm-02-outer-measure-completion-of-a-measurable-space-construct-outer-measure-out-of-an-elementary-length-function).\
> **Proof that $\mu^{\ast}$ restricted to $\mathcal{A}_{0}$ is $\mu_{0}$**: 令 $E \in \mathcal{A}_{0}$, 假设 $E \subseteq \bigcup_{i = 1}^{\infty}A_{i}$, 我们令 $B_{n} := E \cap (A_{n}\backslash\bigcup_{i = 1}^{n - 1}A_{i})$, 即把 covering intersecting $E$ 变成 disjoint covering $(B_{n})$, 从而由 $\mu_{0}$ 的 ctbl disjoint additivity 可得, 这一个新 covering 的 measure sum $\sum_{i = 1}^{\infty}\mu_{0}(B_{i}) := \mu_{0}(E)$. 并且由于 $\mathcal{A}_{0}$ 是一个 algebra, 这些 $B_{n}$ 也在 $\mathcal{A}_{0}$ 里面, 从而它满足 monotonicty, then $\mu_{0}(E) = \sum_{i = 1}^{\infty}\mu_{0}(B_{i}) \leq \sum_{i = 1}^{\infty}\mu_{0}(A_{i})$\
> **Proof that every set in $\mathcal{A}_{0}$ is $\mu^{\ast}$-measurable**: Fix $A \in \mathcal{A}_{0}$, 我们取任意 $E \subseteq X$. Let $\epsilon > 0$, by def of the outer measure, 存在一个 seq $\left\{ B_{i} \right\}_{i = 1}^{\infty} \subseteq \mathcal{A}_{0}$, 使得 $E \subseteq \bigcup_{i = 1}^{\infty}B_{i}$ 并且 $\sum_{i = 1}^{\infty}\mu_{0}(B_{i}) \leq \mu^{\ast}(E) + \epsilon$. 有 disjoint additivity of $\mu_{0}$ 可得, $\sum_{i = 1}^{\infty}\mu_{0}(B_{i}) = \sum_{i = 1}^{\infty}\mu_{0}(B_{i} \cap A) + \sum_{i = 1}^{\infty}\mu_{0}(B_{i} \cap A^{c})$. 从而 $\mu^{\ast}(E) \geq \mu^{\ast}(E \cap A) + \mu^{\ast}(E \cap A^{c})$, 得证. (实际上这是个 trivial argument, 通过$\epsilon$ argument 来严格证明.)

> **Remark**
>
> 这一 simple proposition 表明的是, $\mu_{0}$ induce 出的 outer measure 在 $\mathcal{A}_{0}$ 上 **presearve $\mu_{0}$ 的 measure 与 measurability.**

### Hahn-Kolmogrov Theorem

> **Definition: --[[$\sigma$-finite measure]]--**
>
> Let $(X,\mathcal{M},\mu)$ be a measure space.\
> 如果 $\mu(X) < \infty$, 则称 $\mu$ 是 finite 的.\
> 如果存在一个 sequence $(E_{i})$ in $\mathcal{M}$ 使得 $\bigcup_{i}E_{i} = X$ 并且每个 $\mu(E_{i}) < \infty$, 则称 $\mu$ 是 $\sigma$-finite 的.

> **Remark**
>
> 一个 finite measure 说明 $\mathcal{M}$ 中的所有集合的 measure 都 finite.

> **Theorem: --[[Hahn--Kolmogorov theorem]]--**
>
> 给定一个 premeasure $\mu_{0}$ on algebra $\mathcal{M}_{0}$ of $X$, 以及其 induced outer measure $\mu \ast$, 我们令 按 [[$\sigma$-algebra generated by a subset]] 的定义,
>
> $$
> \mathcal{M} := < \mathcal{M}_{0} >
> $$
>
> 表示 $\sigma$-algebra generated by the algebra $\mathcal{M}_{0}$.\
> 并令
>
> $$
> \mu := \mu^{\ast}|_{\mathcal{M}}
> $$
>
> then we have:
>
> 1.  $(X,\mathcal{M}_{0},\mu_{0})$ extends to $(X,\mathcal{M},\mu)$\
>     即: $\left. \mu \middle| {}_{\mathcal{M}_{0}} = \mu_{0} \right.$
>
> 2.  $\mu|_{\mathcal{M}}$ 是 **the largest extension of $\mu_{0}$ to $\mathcal{M}$** (即: 对于任意其他的 $\mathcal{M}$ 上的 measure $\nu$ that extends $\mu_{0}$ to $\mathcal{M}$, 都有 $\nu(E) \leq \mu(E)$ for all $E \in \mathcal{M}$);\
>     并且 **if $\mu_{0}$ is $\sigma$-finite**, 则 $\mu$ 是 **the unique extension** of $\mu_{0}$ to $\mathcal{M}$.

> **Proof**
>
> **Proof of $(X,\mathcal{A}_{0},\mu_{0})$ extends to $(X,\mathcal{M},\mu)$:**\
> 这个 Statement directly follows from [Theorem 2.6](#thm-02-outer-measure-completion-of-a-measurable-space-theorem-003)(Carathéodory's Theorem) 以及上一个 proposition [Proposition 2.1](#prop-02-outer-measure-completion-of-a-measurable-space-proposition-001).\
> . 我们首先用 $\mu_{0}$ induce 出 $\mu^{\ast}$, 再 restrict $\mu^{\ast}$ to $\mathcal{M}^{\ast} := \left\{ {\text{all}\ \mu^{\ast}\ \text{-measurable sets}} \right\}$, 得到一个 $\sigma$-algebra $\mathcal{M}^{\ast}$.\
> 注意此时: 由上一个 proposition [Proposition 2.1](#prop-02-outer-measure-completion-of-a-measurable-space-proposition-001) 可得 $\mathcal{M}_{0}$ 中所有集合都是 $\mu^{\ast}$-measurable 的, thus $M_{0} \subseteq \mathcal{M}^{\ast}$, 由于 $\mathcal{M}^{\ast}$ 是一个 $\sigma$-algebra, 由 [Lemma 2.2](#lem-01-sigma-algebra-measure-inclusion-properties-of-generated-sigma-algebra) 可得: $\mathcal{M} := < \mathcal{M}_{0} > \subseteq \mathcal{M}^{\ast}$.\
> . 由 Carathéodory's Theorem 可以得到: $\mu^{\ast}|_{\mathcal{M}^{\ast}}$ 是一个 measure, 从而 $\mu := \mu^{\ast}|_{\mathcal{M}}$ 也是一个 measure(等于把 $\mu^{\ast}|_{\mathcal{M}^{\ast}}$ 限制在了一个更小的 sub-$\sigma$-algebra 上).\
> **(Note: this is a trivial fact that if $M^{\ast}$ is a $\sigma$-algebra and $M \subset M^{\ast}$is also a $\sigma$-algebra, then $\mu|_{M}$ is a measure if given that $\mu$ is a $\sigma$-algebra on $M^{\ast}$)**\
> \
> **Proof of $\mu$ being the largest extension of $\mu_{0}$ to $\mathcal{M}$:** 假设 $\nu$ 是一个 $\mathcal{M}$ 上的 $\sigma$-algebra s.t. $\left. \nu \middle| {}_{\mathcal{M}_{0}} = \mu_{0} \right.$.\
> Let $E \subseteq \mathcal{M}$. (WTS: $\nu(E) \leq \mu(E)$, 即$\nu(E) \leq \mu^{\ast}(E)$ .)\
> 由外测度 $\mu^{\ast}$ 的定义, 对于任意 $\epsilon > 0$, 存在一列集合 $\left\{ A_{i} \right\}_{i = 1}^{\infty} \subset \mathcal{A}_{0}$ 满足
>
> $$
> E \subset \bigcup\limits_{i = 1}^{\infty}A_{i}\quad\text{且}\quad\sum\limits_{i = 1}^{\infty}\mu_{0}(A_{i}) \leq \mu^{\ast}(E) + \epsilon.
> $$
>
> 由于 $\nu$ 在 $\mathcal{A}_{0}$ 上和 $\mu_{0}$ 一致，即
>
> $$
> \nu(A_{i}) = \mu_{0}(A_{i})\quad\forall i,
> $$
>
> 因此，
>
> $$
> \sum\limits_{i = 1}^{\infty}\nu(A_{i}) = \sum\limits_{i = 1}^{\infty}\mu_{0}(A_{i}) \leq \mu^{\ast}(E) + \epsilon
> $$
>
> 利用 $\nu$ 的 additivity 和 monotoncity 得
>
> $$
> \nu(E) \leq \nu(\bigcup\limits_{i = 1}^{\infty}A_{i}) \leq \sum\limits_{i = 1}^{\infty}\nu(A_{i}) = \sum\limits_{i = 1}^{\infty}\mu_{0}(A_{i}) \leq \mu^{\ast}(E) + \epsilon
> $$
>
> 由于 $\epsilon$ arbitrary, 得到
>
> $$
> \nu(E) \leq \mu^{\ast}(E)
> $$
>
> (证明思路: 在 $\mathcal{M}$ 上 $\mu$ 就等于 $\mu_{0}$ induce 的外测度, 对于其他的 extended measure, 其作用在一个集合上的测度一定小于等于任意的 $\mathcal{M}_{0}$ covering 的 premeasure 和, 而我们可以通过控制这个 covering 的测度和与它的外测度的差距(since inf), 从而使得这个测度小于等它的外测度加一个无限小的 $\epsilon$, 从而得证.)\
> \
> **Proof of $\mu$ being the unique extension of $\mu_{0}$ to $\mathcal{M}$, provided that $\mu_{0}$ is $\sigma$-finite**:\
> (recall $\mu_{0}$ is $\sigma$-finite 即 $\mu_{0}(X) < \infty$) It remains to show that $\nu(E) \geq \mu^{\ast}(E)$.
>
> Continuing 上一个 proof, we have:
>
> $$
> \mu^{\ast}(E) \leq \mu^{\ast}(\bigcup\limits_{i = 1}^{\infty}A_{i}) = \nu(\bigcup\limits_{i = 1}^{\infty}A_{i}) = \nu(E) + \nu(\bigcup\limits_{i = 1}^{\infty}A_{i}\backslash E)
> $$
> $$
> \leq \nu(E) + \mu^{\ast}(\bigcup\limits_{i = 1}^{\infty}A_{i}\backslash E)
> $$
>
> 我们只要 controling $\mu^{\ast}(\bigcup_{i = 1}^{\infty}A_{i}\backslash E) = \mu^{\ast}(\bigcup_{i = 1}^{\infty}A_{i}) - \mu^{\ast}(E) = \epsilon$ 逼近 0, 即可得到反向的不等式关系.\
> (证明思路: 我们证明了 $\nu(E) \leq \mu^{\ast}(E)$ 之后, 注意到 covering set 和 $E$ 之间的差集的 $\nu$-measure 自然也小于等于这个差集的 $\mu^{\ast}$-measure, which can approximate 0.)\
> \

> **Remark**
>
> . 我们首先容易定义 $X$ 上的一个 algebra $\mathcal{M}_{0}$ 和一个 algebra 上的 premeasure $\mu_{0}$;\
> \
> . 然后用 inf of covering sum 来 induce 出一个 $\mathcal{P}(X)$ 上的 outer measure $\mu^{\ast}$, 而后我们限制 $\mu^{\ast}$ 到 $\mu^{\ast}|_{\mathcal{M}^{\ast}}$ (where $\mathcal{M}^{\ast}$ 表示所有的 $\mu^{\ast}$-measurable sets), by Carathéodory's theorem 这就 induce 出了一个 complete measure.\
> \
> . 我们可以再取 $\mathcal{M}^{\ast}$ 的一个 sub $\sigma$-algebra $\mathcal{M} := < \mathcal{M}_{0} >$, 限制在这个集合上的 $\mu^{\ast}|_{\mathcal{M}}$ 自然也是一个 measure, 并且是 $\mathcal{M}_{0}$ extend 到 $\mathcal{M}$ 上的 lartest measure. By Hahn-Kolmogrov Thm, 这个 measure 如果是 $\sigma$-finite 的则是 $\mathcal{M}_{0}$ extend 到 $\mathcal{M}$ 上的 unique measure.\
> (Notice: **自然地, $\left. (X,\mathcal{M}^{\ast},\mu^{\ast} \middle| {}_{\mathcal{M}^{\ast}}) \right.$ 是 $\left. (X,\mathcal{M},\mu^{\ast} \middle| {}_{\mathcal{M}}) \right.$ 的一个 completion.**)

