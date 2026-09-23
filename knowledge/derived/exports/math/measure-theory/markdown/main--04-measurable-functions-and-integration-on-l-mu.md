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
semantic-node-count: 22
source: "notes/math/measure-theory/chapters/04-measurable_functions_and_integration_on_L^+(mu).typ"
subtitle: Typst-first course notes and worked homeworks
title: "MATH 597: Measure Theory"
---
# measurable functions and integration on $L^{+}(\mu)$

## measurable function \[Fol 2.1\]

### general measurable function

> **Definition: --[[$(\mathcal{M},\mathcal{N})$-measurable function]]--**
>
> Let $(X,\mathcal{M})$, $(Y,\mathcal{N})$ be measurable spaces, 如果 $f:X\rightarrow Y$ 满足:
>
> $$
> B \in \mathcal{N}\Longrightarrow f^{- 1}(B) \in \mathcal{M}
> $$
>
> , 则称 $f$ 为一个 $(\mathcal{M},\mathcal{N})$-measurable function.

从一个 measurable space 到另一个 measurable space 的 function 被称为 measurable 的条件是: 被映射到可测集的集合只能是可测集.

这个定义和 topological space 上 continuous 的定义: 被映射到开集的只能是开集, 形式是完全一样的. 并且我们知道, topological space 和 measure space 也有很多相似之处. 因而连续性和可测性有一定的关系.

函数的可测性的定义是 with respect to 它们所在可测空间选定的 $\sigma$-algebra 的, 就像 topologica spaces 之间函数的连续性的定义是 with respect to 它们所在的 topological spaces 选定的 topology.

这两个定义都表示的是: 性质不好的集合不会被映射到性质良好的集合. (但是性质良好的集合有可能被映射到性质不好的集合.)

> **Proposition: --[[composition preserves measurability]]--**
>
> 如果 $f$ 是 $(\mathcal{A},\mathcal{B})$-measurable 的, $g$ 是 $(\mathcal{B},\mathcal{C})$-measurable 的, 那么 $g \circ f$ 是 $(\mathcal{A},\mathcal{C})$-measurable 的.

> **Proof**
>
> Trivial.

> **Lemma**
>
> Let $(X,\mathcal{M})$, $(Y,\mathcal{N})$ be measurable spaces, 如果 $\mathcal{N} = < \varepsilon >$ for some $\varepsilon \subseteq Y$, 那么
>
> $f:X\rightarrow Y$ $(\mathcal{M},\mathcal{N})$-measurable $\Leftrightarrow$ $f^{- 1}(E) \in \mathcal{M}\quad\forall E \subseteq \varepsilon$

> **Proof**
>
> foward direction: trivial.\
> backward direction: Let
>
> $$
> D: = \left\{ {E \subseteq Y \mid f^{- 1}(E) \in \mathcal{M}} \right\}
> $$
>
> 容易证明: $D \supseteq \varepsilon$, 并且 $D$ 是一个 $\sigma$-algebra.\
> 因而 $D \supseteq < \varepsilon > = \mathcal{N}$

> **Remark**
>
> 如果我们知道 $\mathcal{N}$ 是由某个子集生成出来的, 那么对于映射到这个 measurable space 的函数, 只要保证这个子集中的每个集合的 preimage 都是可测集就可以了, 可以 reduce 判断 $f$ measurable 的条件.
>
> 同样类比 topological space, 如果 $Y$ 的 topology 存在一个 basis, 那么判断 $f:X\rightarrow Y$ 连续, 只需要判断这个 basis 的 preimage 都是 open 的就好了.

> **Proposition**
>
> 对于 topological space $X,Y$, let $f:X\rightarrow Y$
>
> $f$ continuous $\Longrightarrow$$f$ 是 $(\mathcal{B}(X),\mathcal{B}(Y))$ measurable 的.

> **Remark**
>
> topological spaces 之间, 连续函数一定是在它们的 Borel algebra 之间 measurable 的.

### real and complex-valued measurable function

> **Definition: --[[(real-valued) measurable functions]]--**
>
> Let $(X,\mathcal{A})$ be a measurable space, 对于 $f:X\rightarrow\bar{\mathbb{R}}$ 如果它是 $(\mathcal{A},\mathcal{B}(\bar{\mathbb{R}}))$-measurable 的, 我们直接简称它是 $\mathcal{A}$-measurable 的, 或者简称为 measurable 的.

> **Remark**
>
> 实际上, 使用无穷作为值, 就是把**原本不在定义域上的无穷跳跃点放到了定义域上**, 些情况下, 仅仅是一种方便的记号，但它们通常不会被视为真正的值.
>
> 但是等价地, 我们为了便利一般都会使用 extended real number system 来进行分析, 把这些无穷间断当作无穷的值来进行分析.
>
> 这样做法的合理性是, 对于**零测集大小多个这样的无穷间断点**, 在 Lebesgue 积分体系下这一行为**并不会影响函数的 integrability 以及 integral 的值**, 因而我们可以这么做. 这一点之后并不会造成困扰, 因为我们在之后定义可积空间时, 会避开有超过零测集大小多个无穷间断点的函数, 以及无法定义的行为.
>
> 我们容易验证:
>
> $$
> \mathcal{B}(\bar{\mathbb{R}}) = \left\{ {E \subseteq \bar{\mathbb{R}} \mid E \cap {\mathbb{R}} \in \mathcal{B}({\mathbb{R}})} \right\}
> $$
>
> 以及, $\mathcal{B}(\bar{\mathbb{R}})$ 的 generating set 可以是所有的 $(a,\infty\rbrack$ 集合或者 $\lbrack - \infty,a)$ 集合**.** 所以**一个 map to $\bar{\mathbb{R}}$ 的函数是可测的, 当且仅当任意 $(a,\infty\rbrack$ 的 preimage 都可测**.\

> **Definition: --[[(complex-valued) measurable functions]]--**
>
> 如果 $f:X\rightarrow{\mathbb{C}}$ 满足: $\text{Re}\ f,\text{Im}\ f$ 都是 (real-valued) $X$-measurable 的, 那么也称 $f$ 是 $X$-measurable 的, 或者直接说是 measurable 的.

> **Remark**
>
> 任意 complex function $f$ 都可以写为
>
> $$
> f = \text{Re}\ f + i\ \text{Im}\ f
> $$
>
> 这个定义其实等价于 $f$ 是 $(\mathcal{M},\mathcal{B}({\mathbb{C}}))$-measurable 的, 因为这个 statment 等价于 $\text{Re}\ f$, $\text{Im}\ f$ 都是 (real-valued) $X$-measuable 的, 这是因为
>
> $$
> \mathcal{B}({\mathbb{C}}) \equiv \mathcal{B}({\mathbb{R}}^{2}) = \mathcal{B}({\mathbb{R}}) \otimes \mathcal{B}({\mathbb{R}})
> $$

> **Definition: --[[Lebesgue measurable functions, Borel measurable functions]]--**
>
> Naturally, 如果 $f:{\mathbb{R}}\rightarrow{\mathbb{C}}$ 是一个 $\mathfrak{L}$-measurable 的函数, 那么我们称 $f$ 是 **Lebesgue measurable** 的.
>
> 同样地, 如果它是一个 $\mathcal{B}({\mathbb{R}})$-measurable 的函数, 称 $f$ 是 **Borel measurable** 的.

> **Proposition**
>
> 在任何 $\mathcal{M}$-measurable function $f$ 前 compose 一个 Borel measurable 的 function, 结果仍然是 $\mathcal{M}$-measurable 的, follows from composition preserves measurability.

> **Proof**
>
> Follows from def.

> **Example**
>
> $f^{2}$, $- 3f$, $\frac{1}{|f|}$ ($f \neq 0$) 都仍然是 $\mathcal{M}$-measuble 的.

### arithmetic and sequential preservation of measurable functions

> **Proposition: --[[addition and multiplication preserve measurability]]--**
>
> 如果 $f,g$ 是 $\mathcal{M}$-measurable function, 那么 $f + g,fg$ 也是.

> **Proof**
>
> Suffices to assume $f,g$ is (extended) real-valued. Complex case follows trivially.
>
> Suppose $f,g$ 是 $\mathcal{M}$-measurable 的, 我们想要证明: $f + g$ 是 $\mathcal{M}$-measurable 的, suffices to show: $(f + g)^{- 1}(a,\infty\rbrack \in \mathcal{M}$ for any $a \in {\mathbb{R}}$.
>
> 我们 notice:
>
> $$
> \left\{ {x \in X \mid f(x) + g(x) > a} \right\} = \bigcup\limits_{r \in {\mathbb{Q}}}\left\{ {x \mid f(x) > r} \right\} \cap \left\{ {x \mid g(x) > a - r} \right\}
> $$
>
> 于是 finishes the proof.
>
> 对于 $fg$, 我们发现有
>
> $$
> fg = \frac{1}{2}((f + g)^{2} - f^{2} - g^{2})
> $$
>
> 于是也 finishes the proof, following 前一个 proposition.

> **Lemma: --[[sequential behavior of real-valued measurable function]]--**
>
> 如果 $\left\{ {f_{n}:X\rightarrow\bar{\mathbb{R}}} \right\}_{n \in {\mathbb{N}}}$ 是一个 seq of $\mathcal{M}$-measurable functions, 那么
>
> - $$
>   g_{1}(x): = \sup\limits_{j}f_{j}(x)
>   $$
>
> - $$
>   g_{2}(x): = \inf\limits_{j}f_{j}(x)
>   $$
>
> - $$
>   g_{3}(x): = \operatorname{lim\, sup}\limits_{j\rightarrow\infty}f_{j}(x)
>   $$
>
> - $$
>   g_{4}(x): = \operatorname{lim\, inf}\limits_{j\rightarrow\infty}f_{j}(x)
>   $$
>
> 都是 $\mathcal{M}$-measurable 的.

> **Proof**
>
> $$
> g_{1}(x) = \sup\limits_{j \in {\mathbb{N}}}f_{j}(x).
> $$
>
> 由上确界的定义：
>
> $$
> g_{1}(x) > a\Leftrightarrow\exists j \in {\mathbb{N}},\text{such that}\ f_{j}(x) > a.
> $$
>
> 因此，
>
> $$
> \left\{ {x \mid g_{1}(x) > a} \right\} = \bigcup\limits_{j \in {\mathbb{N}}}\left\{ {x \mid f_{j}(x) > a} \right\}.
> $$
>
> 因而:
>
> $$
> g_{1}^{- 1}((a,\infty\rbrack) = \bigcup\limits_{1}^{\infty}f_{j}^{- 1}((a,\infty\rbrack)
> $$
>
> 由于 $f_{j}$ 可测，集合 $\left\{ {x \mid f_{j}(x) > a} \right\}$ 是 $\mathcal{M}$-measurable ，而可测集合的可数并仍然是可测的，因此 $g_{1}$ 可测。
>
> inf: dually.
>
> limsup: 等于 inf of sup ($k \geq n$)
>
> liminf: 等于 sup of inf ($k \geq n$)

> **Remark**
>
> 从这个 proof 里笔者发现了这个惊人的事情。居然有
>
> $$
> (sup_{j}f_{j})^{- 1}((a,\infty\rbrack) = \bigcup\limits_{1}^{\infty}f_{j}^{- 1}((a,\infty\rbrack)
> $$
>
> 但是仔细想想也是合理的. 因为 function seq 的 sup 函数能够 map 到的值大的元素肯定比其中任何一个 function $f_{n}$ 更多. 并且其中存在一个 limit 关系.
>
> 以及得出了一个很重要的结论: **可测函数的 seq 的各种极限仍然是可测函数.**

> **Corollary**
>
> 如果 $\left\{ {f_{n}:X\rightarrow\bar{\mathbb{R}}} \right\}_{n \in {\mathbb{N}}}$ 是一个 seq of $\mathcal{M}$-measurable functions, 且在任意 $x$ 处极限都存在, 那么
>
> $$
> f(x) := \lim\limits_{j\rightarrow\infty}f_{j}(x)
> $$
>
> 是 $\mathcal{M}$-measurable 的.

> **Proof**
>
> directly follows from lemma. 因为 $x$ 处极限如果存在, 那么 $\sup_{f}f_{j}(x) = \inf_{j}f_{j}(x)$

> **Corollary**
>
> $f,g$ $\mathcal{M}$-measurable $\Longrightarrow$ $\max(f,g),\min(f,g)$$\mathcal{M}$- measurable

> **Proof**
>
> two element sequence, 剩余的用空集, 于是 follows form above.

> **Remark**
>
> 于是我们知道, 当我们把 $f$ 拆分成 $f^{+} := \max(f,0)$, $f^{-} := \max( - f,0)$, 我们有
>
> **$f$ $\mathcal{M}$-measurable $\Longrightarrow$ $f^{+},f^{-}$ $\mathcal{M}$-measurable**
>
> 并且由于 $f = f^{+} - f^{-}$, 反向也成立. 并且 $\left. |f \middle| = f^{+} + f^{-} \right.$, 因而有:
>
> **$f$ $\mathcal{M}$-measurable $\Leftrightarrow$ $f^{+},f^{-}$ $\mathcal{M}$-measurable** **$\Leftrightarrow$ $|f|$ $\mathcal{M}$-measurable**

## simple function and integration of nonnegative functions \[Fol 2.1, finished; 2.2\]

### indicator and simple function

> **Definition: --[[characteristic (indicator) function]]--**
>
> Given $E \subseteq X$, 我们定义:
>
> $$
> \begin{matrix}
> {\chi_{E}(x) := \{ 1\quad,x \in E} \\
> {0\quad,x \notin E}
> \end{matrix}
> $$

> **Lemma**
>
> 如果 $(X,\mathcal{M})$ 是一个 measurable space, 那么一个 indicator function
>
> **$\chi_{E}$ on $X$ 是 measurable 的 $\Leftrightarrow$ $E \in \mathcal{M}$**

indicator function measurable 当且仅当它 indicate 的集合是 measurable 的.

> **Definition: --[[simple function]]--**
>
> 一个 simple function on measurable space $(X,\mathcal{A})$ 是一个 $\mathcal{A}$-measurable function $\phi:X\rightarrow{\mathbb{C}}$, taking only finitely many values.
>
> 即: $\phi(X) = \left\{ {c_{1},\cdots,c_{k}} \right\}$

> **Proposition: --[[使用 **a sum of indicator functions of measurable sets** 来定义 simple function]]--**
>
> 对于 simple function $\phi:X\rightarrow{\mathbb{C}}$ s.t. $\phi(X) = \left\{ {c_{1},\cdots,c_{n}} \right\}$, 我们也可以定义它为:
>
> $$
> \phi(x) = \sum\limits_{j = 1}^{n}c_{j}\chi_{E_{j}}
> $$
>
> 其中, $E_{j} = \phi^{- 1}(\left\{ c_{j} \right\})$. 我们称之为: the **standard representation of simple $\phi$.**

这是因为, 单点集在 $\mathcal{B}({\mathbb{C}})$ 上是 measurable 的, **由于 $\phi$ measurable, 我们得到 $E_{j} \in \mathcal{M}$.**

> **Remark**
>
> 对于 simple function
>
> $$
> \phi(x) = \sum\limits_{j = 1}^{n}c_{j}\chi_{E_{j}}
> $$
>
> 一定有
>
> $$
> \bigsqcup\limits_{j = 1}^{n}E_{j} = X
> $$
>
> 其中通常有一个 $E_{j}$ 上 $\phi$ 的值是 0.

> **Lemma**
>
> 如果 $\phi,\psi:X\rightarrow{\mathbb{C}}$ 是 simple functions, 那么
>
> - $\phi + \psi$
>
> - $\phi\psi$
>
> - $|\phi|$
>
> - $k\phi$ $\forall k \in {\mathbb{C}}$
>
> 都是 simple functions.
>
> 特别地, 如果 $\phi,\psi:X\rightarrow{\mathbb{R}}$, 那么 $\max(\phi,\psi),\min(\phi,\psi)$ 也是 simple functions.

> **Proof**
>
> trivial.

### measurable function is a limit of simple functions

> **Theorem: --[[approximating a nonneg measurable function by simple function]]--**
>
> 任意的 measurable $f:X\rightarrow\lbrack 0,\infty\rbrack$ 都是 **pointwise limit** of an **increasing sequence of simple functions** $\left\{ {\phi_{n}:X\rightarrow\lbrack 0,\infty\rbrack} \right\}_{n \in {\mathbb{N}}}$.

> **Proof**
>
> 这个构造看起来有点复杂但是其实非常直观.
>
> 对于 $n \in {\mathbb{N}}$, 我们都 index $0 \leq k \leq 2^{2n} - 1$
>
> 然后对每个 $k$ 取:
>
> $$
> E_{n}^{k} := f^{- 1}((\frac{k}{2^{n}},\frac{k + 1}{2^{n + 1}}\rbrack)
> $$
>
> 以及:
>
> $$
> F_{n} := f^{- 1}((2^{n},\infty\rbrack)
> $$
>
> 即, 我们把 $(0,2^{n}\rbrack$ 这一部分值域切成了 $2^{2n}$ 份, 再把 $(2^{n},\infty\rbrack$ 这一部分值域单独列成一份.
>
> 这 $2^{2n} + 1$ 份值域的切片, 我们对每一份所对应的 function graph, 都取它对应的 Preimage 上的 indicator function 乘以 $\frac{k}{2^{n}}$, 这段值域的最小值的 constant 函数, 于是一定会得到一个 well approximation:
>
> $$
> \phi_{n} := \sum\limits_{k = 0}^{2^{2n} - 1}k\frac{k}{2^{n}}\chi_{E_{n}^{k}} + 2^{n}\chi_{F_{n}}
> $$
>
> 易得,
>
> $$
> \phi_{n} \leq \phi_{n + 1} \leq f
> $$
>
> for all $n$. 并且**在 $X\backslash F_{n} = \left\{ {x \mid f(x) \leq 2^{n}} \right\}$ 上我们有**:
>
> $$
> 0 \leq f - \phi_{n} \leq \frac{1}{2^{n}}
> $$
>
> 随着 $n$ 增大, 最终这个近似会覆盖整个 image, (除非具有非零测数量的无穷间断点, 那样的话最后结果也是无穷), 并且值域的划分越来越精细, 最后会得到:
>
> - **$\phi_{n}\rightarrow f$ pointwisely**
>
> - **在 $f$ bounded 的定义域 $\left\{ {x \mid f(x) < \infty} \right\}$ 上, $\phi_{n}\rightarrow f$ uniformly.**
>
> ![Figure 13:[ ]{style="white-space: pre-wrap"}](.assets/main--figure-raster-013.png){width="60%"}

> **Remark**
>
> 我们在构造 simple function 的时候这样用到 measurability: 这里的每个 $\phi_{n}$ 是 simple function, 是由于 $f$ measurable, 以至于每个 **$E_{n}^{k},F_{n}$ 作为 interval 的 preimage, 都是 measurable sets.**

> **Corollary: --[[simple approximation of complex measurable functions]]--**
>
> 对于任意的 measurable $f:X\rightarrow{\mathbb{C}}$, 都存在 a seq of simple functions
>
> $$
> \left. 0 \leq \middle| \phi_{1} \middle| \leq \middle| \phi_{2} \middle| \leq \cdots \leq \middle| f| \right.
> $$
>
> 使得
>
> - **$\phi_{n}\rightarrow f$ pointwisely**
>
> - **$\phi_{n}\rightarrow f$ uniformly on $\left\{ x \mid \middle| f(x) \middle| < \infty \right\}$**

> **Proof**
>
> 我们可以把 $f$ 拆为 $\text{Im}\ f,\text{Re}\ f$, 然后再把它们分别拆为 $\text{Im}\ f^{+} - \text{Im}\ f^{-}$, 以及 $\text{Re}\ f^{+} - \text{Re}\ f^{-}$. 得到四个 real-valued nonng functions.

### integration of non-neg functions

> **Definition: --[[$L^{+}$ space and integration on it]]--**
>
> 给定一个 measure space $(X,\mathcal{M},\mu)$ 我们定义:
>
> $$
> L^{+}(\mu) := \left\{ {\text{measurable functions}\ f:X\rightarrow\lbrack 0,\infty\rbrack} \right\}
> $$
>
> 对于所有的 **simple functions $\phi = \sum_{j = 1}^{n}a_{j}\chi_{E_{j}} \in L^{+}(\mu)$**, 即所有非负的 simple functions, 我们定义 **the integral of $\phi$ with respect to $\mu$** by:
>
> $$
> \int\phi d\mu( = \int_{X}\phi d\mu) := \sum\limits_{i = 1}^{n}a_{j}\mu(E_{j})
> $$
>
> 对于任意的 $f \in L^{+}(\mu)$, 我们定义 **the integral of $f$ with respect to $\mu$** by:
>
> $$
> \int fd\mu( = \int_{X}fd\mu) := \sup\left\{ {\int\phi d\mu \mid 0 \leq \phi \leq f,\phi\ \text{simple}} \right\}
> $$

> **Remark**
>
> 因而对于 general 的非负可测函数, 我们通过 [Theorem 4.15](#thm-04-measurable-functions-and-integration-on-l-mu-approximating-a-nonneg-measurable-function-by-simple-function) 得知, 我们可以用 simple function 来近似它. 从而, 我们使用 simple function 的积分的极限来定义 general measurable function 的积分.
>
> 而 simple function 的积分, 即等于它下方的面积. 因而我们发现, 这个积分的定义和 ${\mathbb{R}}^{n}\rightarrow{\mathbb{R}}$ 上 Rieamnn 积分有很大的相似之处, 不同在于一个竖切定义域一个横切值域.
>
> 之后我们也会证明, 在 ${\mathbb{R}}^{n}\rightarrow{\mathbb{R}}$ 上, 所有 Riemann 可积的函数也 Lebesgue 可积, 并且得到的结果相同.
>
> 这一积分的定义是对 Riemann 积分的推广.

> **Remark**
>
> measure theory 中的积分理论是把从 ${\mathbb{R}}^{n}$ 出发的函数 推广到了从抽象的测度空间出发的函数; 而还有其他的积分理论, 比如微分形式上的积分则是把实值函数的积分推广到了 oriented smooth manifolds 上, 不仅可以积分 scalars 还可以积分向量场. 这些积分理论的共同点是对 ${\mathbb{R}}^{n}\rightarrow{\mathbb{R}}$ 上的函数的积分是 coincide 的.
>
> 笔者感觉积分理论就是在一个抽象空间上，通过一个抽象的密度函数(被积函数) 以及体积指标(measure function), 得到一个抽象质量。由于这个理念本身是从 ${\mathbb{R}}^{n}$ 上 generalize 的，因而各种不同的积分理论在 ${\mathbb{R}}^{n}$ 上的积分总是 coincide 的

> **Definition: --[[integration on a subset]]--**
>
> 对非负 **simple functions $\phi = \sum_{j = 1}^{n}a_{j}\chi_{E_{j}} \in L^{+}(\mu)$**, 我们定义 **the integral of $\phi$ on $A \in \mathcal{M}$ with respect to $\mu$** by:
>
> $$
> \int_{A}\phi d\mu := \int\phi\chi_{A} d\mu
> $$
>
> 对于 general 的 $f \in L^{+}(\mu)$, 我们也从而定义:
>
> $$
> \int_{A}fd\mu := \sup\left\{ {\int_{A}\phi d\mu \mid 0 \leq \phi \leq f,\phi\ \text{simple}} \right\}
> $$

> **Remark**
>
> $$
> \int_{A}\phi d\mu := \int\phi\chi_{A} d\mu = \sum\limits_{j}a_{j}\chi_{A \cap E_{j}}
> $$

> **Proposition: --[[integral of simple functions 的性质]]--**
>
> Let $\phi,\psi$ be simple functions in $L^{+}(\mu)$, 有:
>
> - **homogeneity:** 对于任意非负 $c$, 有 $\int c\phi = c\int\phi$
>
> - **linearity:** $\int(\phi + \psi) = \int\phi + \int\psi$
>
> - **monotonicity:** $\phi \leq \psi\Longrightarrow\int\phi \leq \int\psi$
>
> - **induced measure**: $A\mapsto\int_{A}\phi d\mu$ 是一个 $\mathcal{M}$ 上的 measure.

> **Proof**
>
> **homogeneity** trivial .
>
> **linearity:** Let
>
> $$
> \phi = \sum\limits_{i = 1}^{n}a_{i}\chi_{E_{i}}\quad,\psi = \sum\limits_{j = 1}^{n}b_{j}\chi_{F_{j}}
> $$
>
> 则有:
>
> $$
> E_{j} = \bigsqcup\limits_{k}(E_{j} \cap F_{k})\quad,F_{k} = \bigsqcup\limits_{j}(E_{j} \cap F_{k})
> $$
>
> for each $j,k$. 从而有
>
> $$
> \int\phi + \int\psi = \sum\limits_{j,k}(a_{j} + b_{k})\mu(E_{j} \cap F_{k})
> $$
>
> **Monotonicity**: trivial.
>
> induced measure: 只需要证明 countable additivity, 于是我们让 $A$ be the union of a disjoint seq in $\mathcal{M},有:$
>
> $$
> \int_{A}\phi = \sum\limits_{j}a_{j}\mu(A \cap E_{j}) = \sum\limits_{j,k}a_{j}\mu(A_{k} \cap E_{j}) = \sum\limits_{k}\int_{A_{k}}\phi
> $$

> **Remark**
>
> 本身, 我们已经基于一个 measure 作为 \"体积密度\", 来定义一个 simple function 按照这个体积密度得到的积分, 而它在每个可测集上的积分又可以定义另一个 measure;
>
> 这个 measure 表示 \"某个集合和 $E_{1},\cdots,E_{n}$ 的交集在这个体积密度以及 simple function 放缩下有多大\".

那么对于 general 的 $f \in L^{+}(\mu)$, 有刚才的四条性质成立吗? **显然, monotonicity 和 homogeinity 是成立的**, 但是我们会发现, 很难证明

$$
\int f d\mu + \int g d\mu = \int(f + g) d\mu
$$

$\leq$ 是容易证明的, 但是 $\geq$ 有点困难. 为了证明 $\geq$ 这个方向, 我们需要下面这个重要定理:

### MCT

> **Theorem: --[[monotone convergence theorem]]--**
>
> Let $\left\{ f_{n} \right\}_{n \in {\mathbb{N}}}$ be a seq in $L^{+}(\mu)$, 并且有 $f_{n} \leq f_{n + 1}$ for each $n$.\
> 我们 define:
>
> $$
> f := \lim\limits_{n}f_{n}( = \sup\limits_{n}f_{n})
> $$
>
> , 则一定有
>
> $$
> \int f = \lim\limits_{n\rightarrow\infty}\int f_{n}
> $$

> **Proof**
>
> 首先 Note 几个事情: 1. 这个极限函数 **$f$ 是 well-defined 的** (可能 $\infty$), by **numerical sequence 的 monotone bounded convergence theorem**.
>
> 2\. 同样地, 由于 $\int f_{n} \leq \int f_{n + 1} \leq \int f$, 这个 **$\lim\int f_{n}$ 也是存在的**.
>
> 3\. 并且, $f$ 也是一个可测函数, 因为 by 上个 lecture 的定理: **可测函数序列的极限也是可测函数.**
>
> 现在进行证明: By monotonicity of integral,
>
> $$
> \lim\int f_{n} \leq \int f
> $$
>
> 是 natural 的. 因而只需要证明另一方向.
>
> By def, $\int f = \sup\left\{ {\int\phi \mid \phi \leq f} \right\}$ where $\phi$ is simple. 因而 it **suffices to show: 对于任意 simple $\phi \leq f$, 都有 $\lim\int f_{n} \geq \int\phi$.**
>
> 我们 fix 一个 $0 \leq \phi \leq f$. WTS:
>
> $$
> \lim\limits_{n}\int f_{n} \geq \int\phi
> $$
>
> 要证明 $\lim\int f_{n} \geq \int\phi$, 我们再把它转化成证明:
>
> $$
> \forall\alpha \in (0,1)\lim\limits_{n}\int f_{n} \geq \alpha\int\phi
> $$
>
> 我们取
>
> $$
> E_{n} := \left\{ {x \mid f_{n}(x) \geq \alpha\phi} \right\} = f^{- 1}(\lbrack\alpha\phi,\infty\rbrack) \in \mathcal{M}
> $$
>
> 容易发现, $E_{n} \subseteq E_{n + 1}$ for each $n$. 并且 Claim: $\bigcup_{n}E_{n} = X$. (这就是为什么要做取 $\alpha$ 这个意义不明的行为) 这是因为 $\alpha < 1$, 并且 $f_{n}$ converge pointwisely to $f$, by measurable function 的 limit behavior. **而由于 simple function $\phi$ 是 bounded 的, 从而 $f_{n}$ 会 uniformly 向上接近(以至于超过) $\phi$. 取 $\alpha$ 是为了保证, 一定存在一个 $n$ 使得 $E_{n} = X$**
>
> 于是我们有:
>
> $$
> \int f_{n} \geq \int f_{n}\chi_{E_{n}} \geq \int\alpha\phi\chi_{E_{n}} = \alpha\int_{E_{n}}\phi
> $$
>
> 我们此处又可以用到一条冷门的性质: **由于 $E\mapsto\int_{E}\phi$ 是一个 measure on $(X,\mathcal{A})$, by continuous from below, 有:**
>
> $$
> \lim\limits_{n}\int_{E_{n}}\phi = \int\phi
> $$
>
> 从而有
>
> $$
> \lim\limits_{n}\int f_{n} \geq \alpha\int\phi
> $$
>
> finishing the proof.

> **Remark**
>
> 这是一个非常重要的定理. 它表示了**非负可测函数的极限的积分等于积分的极限, 可以把取极限和积分这两个操作进行换序.**

以下为一个应用 MCT 得到的结论.

> **Example**
>
> 取
>
> $$
> ({\mathbb{N}},\mathcal{P}({\mathbb{N}}),\mu_{counting})
> $$
>
> 于是
>
> $$
> L^{+}(\mu) = \left\{ {f:{\mathbb{N}}\rightarrow\lbrack 0,\infty\rbrack} \right\}
> $$
>
> 是所有的从自然数到 reals 的函数. (因为我们取了 power set 作为 $\sigma$-algebra)
>
> 注意到任何一个这样的函数都可以被
>
> $$
> \phi_{n} := \sum\limits_{j = 1}^{n}f(j)\mu(\left\{ j \right\}) = \sum\limits_{j = 1}^{n}f(j)
> $$
>
> 来逼近. 从而
>
> $$
> \int f = \sum\limits_{j = 1}^{\infty}f(j) \in \lbrack 0,\infty\rbrack
> $$
>
> 如果取一个从下逼近 $f$ 的可测函数序列 $\left\{ f_{n} \right\}_{n \in {\mathbb{N}}}$, 那么 by MCT, 我们总有:
>
> $$
> \sum\limits_{1}^{\infty}f_{n}(j)\operatorname{\nearrow ︎}\sum\limits_{1}^{\infty}f(j)
> $$

### (countable) linearity of integral

> **Corollary**
>
> $$
> f,g \in L^{+}(\mu)\quad\Rightarrow\quad\int(f + g) = \int f + \int g
> $$

> **Proof**
>
> 使用 approximation by simple functions 以及 MCT. 取
>
> $$
> \phi_{n}\operatorname{\nearrow ︎}f,\quad\psi_{n}\operatorname{\nearrow ︎}g
> $$
>
> , 从而
>
> $$
> \phi_{n} + \psi_{n}\operatorname{\nearrow ︎}f + g
> $$
>
> , 从而我们有
>
> $$
> \int(f + g)\overset{MCT}{=}\lim\limits_{n}\int(\phi_{n} + \psi_{n})
> $$
>
> 从而由 simple function 的 Linearity 得到:
>
> $$
> \int(f + g) = \lim\limits_{n}\int\phi_{n} + \lim\limits_{n}\int\psi_{n}
> $$
>
> 并且由于
>
> $$
> \int\phi_{n}\operatorname{\nearrow ︎}\int f,\int\psi_{n}\operatorname{\nearrow ︎}\int g
> $$
>
> 我们得到:
>
> $$
> \int(f + g) \geq \int f + \int g
> $$
>
> 另一方向 trivial.

> **Remark**
>
> 由此可见,
>
> **$f\mapsto\int f$ 是 $\mathbb{R}$-linear 的映射.**

### Tonelli for sum and integrals

> **Corollary: --[[Tonelli for sum and integrals]]--**
>
> for $\left\{ f_{i} \right\}_{i \in {\mathbb{N}}}$ in $L^{+}(\mu)$, 有:
>
> $$
> \int\sum\limits_{i = 1}^{\infty}f_{i} = \sum\limits_{i = 1}^{\infty}\int f_{i}
> $$

> **Proof**
>
> Apply MCT to
>
> $$
> g_{n} = \sum\limits_{i = 1}^{n}f_{i}
> $$
>
> 可得证.

> **Remark**
>
> 这是 linearity of integral 的 countable version.\
> 由此可见 MCT 的用处很大.

## properties of integration on $L^{+}(\mu)$ \[Fol 2.2, finished\]

### Fatou's Lemma

> **Theorem: --[[Fatou's Lemma]]--**
>
> 令 $(f_{n})$ be a seq of functions in $L^{+}(\mu)$, then
>
> $$
> \operatorname{lim\, inf}\limits_{n}\int f_{n} \geq \int\operatorname{lim\, inf}\limits_{n}f_{n}
> $$

> **Proof**
>
> Set
>
> $$
> g_{n} := \inf\limits_{m \geq n}f_{n}
> $$
>
> 于是
>
> $$
> g_{n}\operatorname{\nearrow ︎}\operatorname{lim\, inf}\limits_{n}f_{n}
> $$
>
> 于是 **by MCT**, we have:
>
> $$
> \lim\limits_{n}\int g_{n} = \int\lim\limits_{n}g_{n} = \int\operatorname{lim\, inf}\limits_{n}f_{n}
> $$
>
> By def, 我们有 $g_{n} \leq f_{n}\forall n$, 于是 by monotonicity, $\int g_{n} \leq \int f_{n}$. 因而
>
> $$
> \operatorname{lim\, inf}\limits_{n}\int f_{n} \geq \operatorname{lim\, inf}\limits_{n}\int g_{n} = \lim\limits_{n}\int g_{n} = \int\operatorname{lim\, inf}\limits_{n}f_{n}
> $$

> **Remark**
>
> 对于 increasing 的从而有 limit 的可测 $(f_{n})$, 我们可以使用 MCT.
>
> 但是对于任意的可测 $(f_{n})$, 我们无法使用 MCT, 不过有弱化的版本 Fatou's Lemma. 它表示**下极限的积分 小于等于 积分的下极限**.
>
> 这是一个符合直觉的事情, 因为取函数的 pointwise 极限是一个很容易极端的事情.
>
> 积分的极限是一个 numerical seq 的极限, 比较 robust. 而函数的逐点极限是一个比较不稳定的事情, **在对函数逐点极限的过程中, 它的 \"质量\" 会存在一个比较大的损失, 因为其中可能包含了 uncountably many 个点的函数值的逐点极限的累积, 而积分的极限只是单个点的逐点极限. 因而大小关系很显然.**

> **Example**
>
> 取 $({\mathbb{R}},{\mathfrak{L}},m)$, 考虑 $L^{+}(m)$ 上的函数, 即非负 Lebesgue 可测函数.
>
> 下面有几个非常经典的 Fatou's Lemma 的例子:
>
> . **escape to hat**:
>
> $$
> f_{n} = \chi_{(n,n + 1)}
> $$
>
> $f_{n}$ 在 $\mathbb{R}$ 上平移
>
> . **escape to width**:
>
> $$
> f_{n} = \frac{1}{n}\chi_{(0,n)}
> $$
>
> $f_{n}$逐渐变得平坦
>
> . **escape to height**:
>
> $$
> f_{n} = n\chi_{(0,\frac{1}{n})}
> $$
>
> $f_{n}$ 逐渐变成一根针.
>
> 这三个例子中都有 $f_{n}\rightarrow 0$ pointwisely. 因而
>
> $$
> \int\lim f_{n} = 0
> $$
>
> , 而
>
> $$
> \lim\int f_{n} = 1
> $$
>
> , 因为对于所有 $f_{n}$ 都有 $\int f_{n} = 1$

### Chebyshev's inequality with corollaries

> **Lemma: --[[Chebyshev's inequality]]--**
>
> 对于 measure space $(X,\mathcal{M},\mu)$, 如果 $f \in L^{+}(\mu)$ 并且 $c > 0$, 那么
>
> $$
> \mu\left\{ {f \geq c} \right\} \leq \frac{1}{c}\int f
> $$

> **Proof**
>
> Let $E := \mu\left\{ {f \geq c} \right\}$
>
> $$
> \int f \geq \int f\chi_{E} \geq \int c\chi_{E} = c\int\chi_{E} = c\mu(E)
> $$

> **Remark**
>
> 一个可测集的测度, 就等于 constant 1 在它上面的积分, by definition.
>
> 这是一个简单而常用的结论.

> **Proposition: --[[非负函数积分为 0 等价于几乎处处为 0]]--**
>
> 令 $f \in L^{+}(\mu)$, 有:
>
> $\int f = 0$ $\Leftrightarrow$ $f = 0$ a.e. (即只在一个零测集上非 0)

> **Proof**
>
> forward direction: directly follows from Chebyshev: set $A_{n} := \left\{ {f \geq \frac{1}{n}} \right\}$, 对于任意 $n$ 都有 $\mu(A_{n}) \leq n\int f = 0$. 从而 by ctn from below, $> 0$ 处构成零测集.
>
> backward direction: 对于 simple function, trivial by 积分的定义; 对于 general $f$, 通过 limit 得到 (它下方的所有 simple functions 也 a.e. 为 0 从而积分为 0).

> **Corollary: 几乎处处相等的非负函数积分相等**
>
> Let $f,g \in L^{+}(\mu)$ 且 $f = g$ a.e., 则有
>
> $$
> \int f = \int g
> $$

> **Proof**
>
> Set $D: = \left\{ {x \mid f(x) \neq g(x)} \right\}$, 则 $\mu(D) = 0$ by def
>
> $$
> \int f = \int_{D}f + \int_{D^{c}}f = 0 + \int_{D^{c}}g = \int g
> $$

> **Corollary: --[[liminf version of MCT]]--**
>
> suppose $(f_{n})_{n \in {\mathbb{N}}}$ 是一个 seq of functions in $L^{+}(\mu)$, 且 $f_{n}\rightarrow f \in L^{+}(\mu)$, 则:
>
> $$
> \operatorname{lim\, inf}\limits_{n}\int f_{n} \geq \int f
> $$

> **Proof**
>
> 这是一个条件稍微弱化的 MCT: 把 $f_{n}\operatorname{\nearrow ︎}f$ 的条件改成了 $f_{n}\rightarrow f$ a.e., 得到的结论也稍弱化.\
> **modify $f_{n}$ and $f$ on a null set** (thus without chaning the integral) 后, follows directly from **Fatou's lemma**,

> **Theorem: --[[积分收敛 $\Longrightarrow$ 发散点集零测, 以及 support $\sigma$-finite]]--**
>
> 如果 $f \in L^{+}(\mu)$ 且 $\left. |\int f \middle| < \infty \right.$, 则有:
>
> $$
> \mu(\left\{ {x \in X \mid f(x) = \infty} \right\}) = 0
> $$
>
> 并且
>
> $$
> \left\{ {x \mid f(x) > 0} \right\}
> $$
>
> is **$\sigma$-finite**

> **Proof**
>
> 直接 follows from Chebyshev. 取
>
> $$
> A_{t} := \left\{ {x \mid f(x) \geq t} \right\}
> $$
>
> for $t > 0$.
>
> 于是:
>
> $$
> \left\{ {x \in X \mid f(x) = \infty} \right\} = \bigcap\limits_{n = 1}^{\infty}A_{n}
> $$
>
> By Chebyshev, each $A_{n}$ 都有: $\mu(A_{n}) \leq \frac{1}{n}\int t$, 从而 by continuous from above 可得这个交集的 measure 为 0.
>
> 又有:
>
> $$
> \left\{ {x \in X \mid f(x) > 0} \right\} = \bigcup\limits_{n = 1}^{\infty}A_{\frac{1}{n}}
> $$
>
> 其中, each set has measure $\leq n\int f \leq \infty$. By def, 这个集合 $\sigma$-finite.

