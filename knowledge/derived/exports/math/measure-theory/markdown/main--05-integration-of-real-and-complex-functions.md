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
semantic-node-count: 20
source: "notes/math/measure-theory/chapters/05-integration_of_real_and_complex_functions.typ"
subtitle: Typst-first course notes and worked homeworks
title: "MATH 597: Measure Theory"
---
# integration of real and complex functions

## integration of real and complex functions-I \[Fol 2.3\]

我们目前只定义了 non-negative $\bar{\mathbb{R}}$-valued measurable function 的积分, 而我们想要完整地定义: $\bar{\mathbb{R}}$-valued measurable function 的积分 $\int f \in \bar{\mathbb{R}}$, 以及 $\mathbb{C}$-valued measurable function 的积分 $\int f \in {\mathbb{C}}$.

recall: 对于任意 $\bar{\mathbb{R}}$-valued $f$,

$$
f = f^{+} - f^{-}
$$

**因而我们希望 define:**

$$
\int f = \int f^{+} - \int f^{-}
$$

但是其中有一个 undefined 的问题: 我们要避免 $\infty - \infty$ 这一类的问题. 因而我们无法对所有的可测函数进行积分, 而是定义 \"integrable\" 的可测函数.

> **Lemma**
>
> $$
> \begin{matrix}
> {\{\int f^{+} < \infty} \\
> \left. \int f^{-} < \infty\Leftrightarrow\int \middle| f \middle| < \infty \right.
> \end{matrix}
> $$

> **Proof**
>
> trivial.

正负部分都可控, 肯定是当且仅当绝对值函数可控.

我们接下来将定义可积函数的空间是: 所有绝对值积分非无穷的函数. (怎么和预期不一样...这样的话这个空间在积分运算下的值域就是 $\mathbb{R}$ 而不是 $\bar{\mathbb{R}}$ 了. 我期待的是为了避免无穷之间相减的 undefined behavior 只需要正负部分有一个积分非无穷就行了. 但是我们要求的是都不是无穷. 不过既然这么定义了肯定有其道理.)

### $\widetilde{L}(X,\mu,{\mathbb{C}})$ and $L^{1}(X,\mu,{\mathbb{C}}$)

> **Definition: --[[real-valued integrable function]]--**
>
> Given measure space $(X,\mathcal{M},\mu)$, **measurable $f:X\rightarrow\bar{\mathbb{R}}$ 被称为 integrable** 的, 如果它满足
>
> $$
> \left. \int \middle| f \middle| < \infty \right.
> $$
>
> 并定义其 integral 为:
>
> $$
> \int f = \int f^{+} - \int f^{-}
> $$

> **Definition: --[[complex-valued integrable function]]--**
>
> Further, 我们定义 **measurable $f:X\rightarrow{\mathbb{C}}$ 是 integrable 的**, 如果它同样满足:
>
> $$
> \left. \int \middle| f \middle| < \infty \right.
> $$
>
> **注意到这个条件等价于 $\text{Re}\ f,\text{Im}\ f$ integrable, 因为**
>
> $$
> \left. |f \middle| \leq \middle| \text{Re}\ f \middle| + \middle| \text{Im}\ f \middle| \leq 2 \middle| f| \right.
> $$
>
> 我们定义其 integral 为:
>
> $$
> \int f = \int\text{Re}\ f + i\int\text{Im}\ f
> $$

> **Remark**
>
> 所以说, **实值函数的积分要计算两个, 复值函数的积分要计算四个**. (好麻烦.)

> **Proposition**
>
> 所有的 real-valued integrable functions 构成一个 $\mathbb{R}$-vector space, 并且 integral 是一个 linear functional on it.
>
> 所有的 complex-valued integrable functions 构成一个 $\mathbb{C}$-vector space, 并且 integral 是一个 linear functional on it.

> **Proof**
>
> trivial.

下面我们可以定义这个 vector space 并在上面进行一定研究. 此处为一个 temporary 的记号:

> **Definition: --[[$\widetilde{L}(X,\mu,{\mathbb{R}})$ 以及$\widetilde{L}(X,\mu,{\mathbb{C}})$ space]]--**
>
> 给定 measure space $(X,\mathcal{M},\mu)$ 我们定义
>
> $$
> \widetilde{L}(X,\mu,{\mathbb{R}}) := \left\{ {\text{all (extended) real-valued integrable functions on}\ X} \right\}
> $$
>
> 以及
>
> $$
> \widetilde{L}(X,\mu,{\mathbb{C}}) := \left\{ {\text{all complex-valued integrable functions on}\ X} \right\}
> $$

> **Remark**
>
> 这基本接近我们最终的可积空间的定义了. 只需要再 quotient 掉所有的 a.e. 相等的函数就可以. 在此之间, 我们首先在这临时的空间上证明一些结论.
>
> **我们基本不使用 $\widetilde{L}(X,\mu,{\mathbb{R}})$, 因为它是 $\widetilde{L}(X,\mu,{\mathbb{C}})$ 的 subspace, 而且大部分结论基本都在更 general 的 $\widetilde{L}(X,\mu,{\mathbb{C}})$ 上成立.**

> **Remark**
>
> 这个 $\mathbb{C}$-vector space 的 dimension 是多少呢:\
> 如果 $X$ 是一个 finite set, 那么 $\widetilde{L}(X,\mu,{\mathbb{C}})$ 的 dimension 是 $|X|$, 因为 $e_{i}:x_{j}\mapsto\delta_{ij}$ 是一个 basis; 同样的, 如果 $X$ countable, 那么 $\widetilde{L}(X,\mu,{\mathbb{C}})$ 的 dimension 也是 countably infinite 的; 如果 $X$ uncountable, 那么 $\widetilde{L}(X,\mu,{\mathbb{C}})$ 的 dimension 也是 uncountable 的.\
> 比如, $\widetilde{L}({\mathbb{R}}^{n},\mu,{\mathbb{C}})$ 的 dimension 就是 uncountable 的.

> **Proposition**
>
> $\widetilde{L}(X,\mu,{\mathbb{C}})$ 上, $f\mapsto\int f$ 为一个 linear functional.

因为积分是 linear 的, as we have proved.

> **Proposition**
>
> $$
> \left. f \in \widetilde{L}(X,\mu,{\mathbb{C}})\Longrightarrow \middle| \int f \middle| \leq \int \middle| f| \right.
> $$

> **Proof**
>
> For real-valued case,
>
> $$
> \left. |\int f\  \middle| = \middle| \int f^{+} - \int f^{-}\  \middle| \leq \middle| \int f^{+}\  \middle| + \middle| \int f^{-}\  \middle| = \int f^{+} + \int f^{-} = \int \middle| f| \right.
> $$
>
> For complex-valued case, Set
>
> $$
> \alpha = \frac{\int f}{|\int f|}
> $$
>
> 于是有 $\alpha \in {\mathbb{C}}$ 且 $\left. |\alpha \middle| = 1 \right.$. **Note: 一个绝对值为 1 的 complex number 的倒数是它的 conjuate.**\
> 因而:
>
> $$
> \left. |\int f\  \middle| = \bar{\alpha}\int f = \int\bar{\alpha}f \in {\mathbb{R}} \right.
> $$
>
> 从而
>
> $$
> \left. |\int f\  \middle| = \int\bar{\alpha}f = \int\text{Re}(\bar{\alpha}f) \leq \int \middle| \text{Re}(\bar{\alpha}f) \middle| \leq \int \middle| \bar{\alpha}f \middle| = \int \middle| f| \right.
> $$

> **Definition: --[[integral restricted to a measurable set]]--**
>
> if $f \in \widetilde{L}(X,\mu,{\mathbb{C}})$, $E \in \mathcal{A}$ ($\mu$ 的 $\sigma$-algebra), 我们 define:
>
> $$
> \int_{E}f\, d\mu := \int f\chi_{E}\, d\mu
> $$

> **Remark**
>
> 容易验证, restricted to a measurable set 的积分也是 linear 且 monotone 的.

> **Proposition: 可积函数几乎处处相等的等价条件**
>
> if $f,g \in \widetilde{L}(X,\mu,{\mathbb{C}})$, 则 TFAE:
>
> - $f = g$ a.e.
>
> - $\left. \int \middle| f - g \middle| = 0 \right.$
>
> - $\int_{E}f = \int_{E}g$ for all $E \in \mathcal{A}$

> **Proof**
>
> $(i)\Leftrightarrow(ii)$: by last time proposition.\
> $(ii)\Longrightarrow(iii)$: 因为
>
> $$
> \left. |\int_{E}f - \int_{E}g\  \middle| = \middle| \int(f - g_{)}\chi_{E}\  \middle| \leq \int \middle| f - g \middle| \chi_{E} \leq \int \middle| f - g \middle| = 0 \right.
> $$
>
> $(iii)\Longrightarrow(ii)$: 令 $u := \Re(f - g)$, $v := \Im(f - g)$, 则
>
> $$
> \left. \int \middle| f - g \middle| = \int u^{+} + \int u^{-} + i\int v^{+} + i\int v^{-} \right.
> $$
>
> **这四个积分都是正值.** 容易发现如果 $u^{+}$ 在一个 positive measure set $E$ 上非 0, 那么 $\int_{E}u^{+} > 0$ , 那么 $\left. \int \middle| f - g \middle| > 0 \right.$. (其他三个积分同理.)

> **Remark**
>
> $\left. \int \middle| f - g \middle| = 0 \right.$ 是一个比 $\int f - g = 0$ 更强的条件. $\int f - g = 0$ 可以是非零集有交错并且正负抵消, 而 $\left. \int \middle| f - g \middle| = 0 \right.$ 则表示 a.e. 相等.

> **Remark**
>
> 有这个定理得: **我们可以 integrate $f:X\rightarrow{\mathbb{C}}$ a.e. defined**.\
> 即:
>
> $$
> f:E^{c}\rightarrow{\mathbb{C}}\quad,\quad\mu(E) = 0
> $$
>
> 其中的一种情况是:
>
> $$
> \left. f:X\rightarrow\bar{\mathbb{R}}\quad s.t.\quad \middle| f \middle| < \infty\ a.e. \right.
> $$

并且我们发现, a.e. 相等的两个可积函数 $f,g \in \widetilde{L}(X,\mu,{\mathbb{C}})$ 在任意可测集上的积分都相等. 于是这两个函数在 $\widetilde{L}(X,\mu,{\mathbb{C}})$ 中的表现是相等的. 因而我们可以把 a.e. 相等的这种关系 quotient 掉, 简化这个空间:

> **Definition: --[[$L^{1}(\mu)$ space]]--**
>
> 我们定义 $L^{1}(X,\mu,{\mathbb{C}})$, 或简称为 $L^{1}(\mu)$, 为:
>
> $$
> \widetilde{L}(X,\mu,{\mathbb{C}})/ \sim
> $$
>
> 其中 $\sim$ 表示一个 equivalent class: $f \sim g$ if $f = g$ a.e. (等价于 $\left. \int \middle| f - g \middle| = 0 \right.$)

$L^{1}(\mu)$ 中的每个函数之间彼此至少都在一个正测度集上相互不同. 这减去了分析上考虑几乎处处相等的集合的顾虑, 对于处处相等的函数, 我们认为它们在 $L^{1}(\mu)$ 上直接相等. 并且, 我们有:

$$
f\mapsto\int f
$$

在 $L^{1}(\mu)$ 上是一个 well-defined function.

### DCT

> **Lemma**
>
> 令 $(f_{n})$ 为 a seq of **a.e. defined measurable functions** on $X$., s.t.
>
> $$
> f(x) := \lim\limits_{n\rightarrow\infty}f_{n}(x)
> $$
>
> **exists a.e.**\
> Claim: **$f$ is measurable.**

> **Remark**
>
> Measurability is well preserved by taking limit, 并且更改一个零测集上函数的 definedness 不会改变这个 behavior. (这是一个很宽的条件了)

> **Theorem: --[[dominated convergence theorem]]--**
>
> Let $(f_{n})$ be a seq of functions in $L^{1}(\mu)$, s.t.
>
> - $f_{n}\rightarrow f$ a.e.
>
> - 存在 $g \in L^{1}(\mu)$ s.t. $\left. |f_{n} \middle| \leq g \right.$ a.e. for all $n$.
>
> Claim: $f \in L^{1}(\mu)$ 并且
>
> $$
> \int f = \lim\limits_{n}\int f_{n}
> $$

> **Proof**
>
> 首先由于 $f_{n}\rightarrow f$ a.e., by lemma 可以得到 $f$ 是 measurable 的.\
> 并且
>
> $$
> \left. |f_{n} \middle| \leq \middle| g \middle| \text{a.e.}\Longrightarrow \middle| f \middle| \leq \middle| g \right|\text{a.e.}
> $$
>
> 于是
>
> $$
> \left. \int \middle| f \middle| \leq \int \middle| g \middle| < \infty \right.
> $$
>
> 即 $f \in L^{1}$. (从而 $|f|$ 至多在一个 measure zero set 上无穷).\
> 并且 $g(x) \pm f_{n}(x) \geq 0$ a.e. 这一点很重要, 因为从而我们可以对 $g + f_{n}$, $g - f_{n}$ 使用 Fatou's Lemma:
>
> $$
> \begin{matrix}
> {\int g + \int f = \int(g + f)} & {= \int(g + \lim\limits_{n\rightarrow\infty}f_{n})} \\
>  & {= \int\lim\limits_{n\rightarrow\infty}(g + f_{n})} \\
>  & {\overset{\text{by Fatou}}{\leq}\operatorname{lim\, inf}\limits_{n}\int(g + f_{n})} \\
>  & {= \int g + \operatorname{lim\, inf}\limits_{n}\int f_{n}}
> \end{matrix}
> $$
>
> 从而 (由于 $\int g < \infty$)
>
> $$
> \int f \leq \operatorname{lim\, inf}\limits_{n}\int f_{n}
> $$
>
> 以及 similarly get:
>
> $$
> \int g - \int f\overset{\text{by Fatou}}{\leq}\operatorname{lim\, inf}\limits_{n}\int(g - f_{n}) = \int g - \operatorname{lim\, sup}\limits_{n}\int f_{n}
> $$
>
> 从而:
>
> $$
> \int f \geq \operatorname{lim\, sup}\limits_{n}\int f_{n}
> $$
>
> (这里注意, negate 一个 numerical seq 后 liminf 变 limsup. 由此可见 Fatou'e Lemma 其实是很强大的, 只需要对 $\int g + \int f$ 和 $\int g - \int f$ 各用一次就可以得到: )
>
> $$
> \int f = \lim\limits_{n\rightarrow\infty}\int f_{n}
> $$

> **Remark**
>
> DCT 是 MCT 在 $L^{1}$ 上的推广. MCT 只作用于非负的可测函数, 并且要求序列递增. 而 DCT 则作用于更加广泛的情况.\
> DCT 增加的要求是存在一个 $L^{1}$ 的 (a.e.) bound function, 以及极限 a.e. 存在于 extened $\mathbb{R}$. 这两个要求都是合理的, 一个控制了函数的上下浮动程度, 一个控制了序列的收敛性.\
> 而进一步, 我们可以把 \"存在 $g \in L^{1}$ s.t. $\left. |f_{n} \middle| \leq \middle| g| \right.$ a.e. for all $n$.\" 这一 条件放宽到 : 存在一个 seq $(g_{n})$ 以及 $g$ in $L^{1}$, 使得
>
> - $\left. |f_{n} \middle| \leq g_{n} \right.$
>
> - $g_{n}\rightarrow g$ a.e.
>
> - $\int g_{n}\rightarrow\int g$
>
> Proof 在 hw 5.

> **Example**
>
> Suppose $u:\lbrack 0,1\rbrack\rightarrow\lbrack 0,1\rbrack$ is Lebesgue measurable.\
> 考虑这一 seq of function: $(u^{n})$.\
> 容易发现 $u^{n}\rightarrow\chi_{\{{u = 1}\}}$ p.w. 我们可以用 $g = 1$ 作为 bound function. 从而得到:
>
> $$
> \int f = \lim\limits_{n\rightarrow\infty}\int f_{n} = \int_{\{{u = 1}\}}1 = m(\left\{ {\mu = 1} \right\})
> $$

> **Example**
>
> compute
>
> $$
> I = \lim\limits_{n\rightarrow\infty}\int_{\lbrack 0,1\rbrack}\frac{1 + nx^{2}}{(1 + x^{2})^{n}}
> $$
>
> 令 $f_{n}(x): = \frac{1 + nx^{2}}{(1 + x^{2})^{n}}$, 有: $f_{n}(x)\rightarrow 0$ as $n\rightarrow\infty$ for $x \in (0,1\rbrack$;\
> 并且考虑 $g = 1$, 作为 bound.\
> 因而有 $I = 0$

## integration of real and complex functions-II \[Fol 2.3\]

### corollaries of DCT

以下为 DCT 的 corollaries:

### Fubini for series and integral

> **Corollary: --[[Fubini for series and integral]]--**
>
> 对于 $L^{1}(\mu)$ 中的 sequence $(f_{n})$, 如果 $\left. \sum_{n = 1}^{\infty}\int \middle| f_{n} \middle| < \infty \right.$, 则
>
> $$
> \sum\limits_{n = 1}^{\infty}f_{n}\overset{a.e.}{\rightarrow}F \in L^{1}(\mu)
> $$
>
> 并且
>
> $$
> \int\sum\limits_{n = 1}^{\infty}f_{n} = \int F = \sum\limits_{n = 1}^{\infty}\int f_{n}
> $$

> **Proof**
>
> Recall **Tonelli for sum and integrals**: 对于 $\left\{ f_{n} \right\}_{n \in {\mathbb{N}}}$ in $L^{+}(\mu)$, 有:
>
> $$
> \int\sum\limits_{n = 1}^{\infty}f_{n} = \sum\limits_{n = 1}^{\infty}\int f_{n}
> $$
>
> (又是经典 Fubini 补充 Tonelli) 这个定理是 Tonelli for sum and integrals 在 $L^{1}$ 上的推广.\
> 我们 set
>
> $$
> \left. F_{n}: = \sum\limits_{i = 1}^{n}f_{j}\quad G := \sum\limits_{n = 1}^{\infty} \middle| f_{n}| \right.
> $$
>
> By Tonelli for sum and integrals, 有:
>
> $$
> \left. \int G = \int\sum\limits_{n = 1}^{\infty} \middle| f_{n} \middle| = \sum\limits_{n = 1}^{\infty}\int \middle| f_{n}| \right.
> $$
>
> 由条件知道, $\int G < \infty$, 因而 $G \in L^{1}(\mu)$. 所以 $G$ 可以作为 $F_{n}$ 的 DCT bound:
>
> $$
> \left. \int \middle| F \middle| \leq \int G = \sum\limits_{n = 1}^{\infty}\int \middle| f_{n}| \right.
> $$
>
> 因而 by DCT::
>
> $$
> \int F = \lim\limits_{n\rightarrow\infty}\sum\limits_{i = 1}^{n}\int f_{i} = \sum\limits_{n = 1}^{\infty}\int f_{n}
> $$

> **Remark**
>
> Fubini's for sum and integrals : 对于一个 seq of 可积函数, **如果它们的绝对积分和收敛, 那么它们的 infinite sum 函数也是可积的**, 并且可以交换积分和极限次序.\
> 其实显然. 因为绝对积分和肯定 by tri ineq 是大于等于和的积分的, 绝对积分和能作为一个 bound function.

### a function that is measurable in one var and ctn/diffble in another

> **Corollary**
>
> 令 $(X,\mathcal{A},\mu)$ be a measure space.\
> 如果 $f:X \times \lbrack a,b\rbrack\rightarrow{\mathbb{C}}$ 满足 $f( \cdot ,t) \in L^{1}(\mu)$ for all $t \in \lbrack a,b\rbrack$, 令
>
> $$
> F(t) := \int f(x,t) d\mu(x)
> $$
>
> 则有:
>
> 1.  如果 $t\mapsto f(x,t)$ 对于任意 $x$ 都连续, 并且存在一个 $g \in L^{1}(\mu)$ 使得 $\left. |f(t,x) \middle| \leq g(x) \right.$ for all $t,x$, 那么 **$F$ 也是 ctn 的.**
>
> 2.  如果 $\frac{\partial f}{\partial t}(x,t)$ 对于任意 $x,t$ 都存在, 并且存在一个 $g \in L^{1}(\mu)$ 使得 $\left. |\frac{\partial f}{\partial t}(x,t) \middle| \leq g(x) \right.$ for all $t,x$, 那么 **$F$ 是 differentiable 的**, 并且
>
>     $$
>     F'(t) = \int\frac{\partial f}{\partial t}(x,t) d\mu(x)
>     $$

> **Proof**
>
> 这一证明并不困难.\
> For part(1), STS: $t_{n}\rightarrow t\Longrightarrow F(t_{n})\rightarrow F(t)$\
> Apply DCT with $f_{n}(x) = f(x,t_{n})$, $f(x) = f(x,t)$.\
> For part(2), Suppose $t_{n}\rightarrow t$.\
> Apply DCT to
>
> $$
> h_{n}(x) := \frac{f(x,t_{n}) - f(x,t)}{t_{n} - t}
> $$
>
> 由可导得连续得 $x\mapsto\frac{\partial f}{\partial t}(x,t)$ measurable.\
> 并且 **by MVT,**
>
> $$
> \left. |h_{n}(x) \middle| \leq \sup\limits_{t \in \lbrack a,b\rbrack} \middle| \ \frac{\partial f}{\partial t}(x,t) \middle| \leq g(x) \right.
> $$
>
> 从而我们也用 $g$ bound 住了 $h_{n}(x)$. **Apply DCT:**
>
> $$
> F'(t) = \lim\limits_{n\rightarrow\infty}\frac{F(t_{n}) - F(t)}{t_{n} - t} = \lim\limits_{n\rightarrow\infty}\int\frac{f(x,t_{n}) - f(x,t)}{t_{n} - t} = \lim\limits_{n\rightarrow\infty}\int h_{n} = \int\frac{\partial f}{\partial t}(x,t) d\mu(x)
> $$

> **Remark**
>
> 由 DCT, 我们不仅可以交换积分和求极限的次序, 还可以在足够的条件下交换多变量的求导和积分的次序. 这一点是值得注意的, 因为 **DCT 描述的 sequential behavior 可以应用到证明函数 continuous 和 derivative 存在**, 使用 sequential definition.\
> 如: 如果一个多变量函数对于 $x$ 是 measurable 的, 并且满足对于 $t$ 的 partial derivative 处处符合 DCT 条件. 那么我们可以**调换它对于 $x$ 积分和对于 $t$ 求导的顺序**.\
> 看起来很雾但是我们看一个例子 (此为一个反例):

> **Example**
>
> 是否有:
>
> $$
> \frac{\partial}{\partial t}\int_{{\mathbb{R}}_{> 0}}e^{- tx} dm(x)\overset{???}{=}\int_{{\mathbb{R}}_{> 0}} - xe^{- tx} dm(x) = - \frac{1}{t^{2}}
> $$
>
> Here
>
> $$
> f(t,x) = e^{- tx},\quad t > 0,x > 0
> $$
>
> 因而
>
> $$
> \left. |\ \frac{\partial}{\partial t}f(t,x) \middle| = xe^{- tx},\quad t > 0,x > 0 \right.
> $$
>
> 尝试找到它的 dominating $g(x)$: 这个函数在 $t\rightarrow 0$ 处的上极限是 $g(x,t) = x$, 但是这个 $g$ 却不是一个 $L^{1}$ 函数 (在半轴上积分为 $\infty$). 从而它不可以这么交换积分和求导顺序. 但是如果把 $t$ 的范围限制在 $t \geq a \in {\mathbb{R}}_{+}$ 而不是 $t > 0$, 我们就可以交换这个积分和求导顺序, 因为此时可以设定
>
> $$
> g(x,t) = xe^{- ax}
> $$

### $L^{1}$ as a Banach space

> **Theorem: --[[$L^{1}(\mu)$ 以 integral w.r.t. $\mu$ 作为 norm 是一个 normed VS]]--**
>
> 在 $L^{1}(\mu)$ 上, 我们 set
>
> $$
> \left. | \middle| f \middle| \middle| := \int \middle| f| \right.
> $$
>
> 则 $\left. (L^{1}(\mu), \middle| \middle| \cdot \middle| \middle| ) \right.$ 为一个 **normed $\mathbb{C}$-vector space. 即, 这是一个 well-defined norm.**

> **Proof**
>
> recall norm 的定义, 需要符合:
>
> - Homogeneity:
>
>   $$
>   \left. | \middle| af \middle| \middle| = \middle| a \middle| \cdot \middle| \middle| f \middle| | \right.
>   $$
>
> - triangle ineq:
>
>   $$
>   \left. | \middle| f + g \middle| \middle| \leq \middle| \middle| f \middle| \middle| + \middle| \middle| g \middle| | \right.
>   $$
>
> - nonnegativity:
>
>   $$
>   \left. | \middle| f \middle| \middle| \geq 0,\quad = \text{iff}\ f = 0 \in L^{1}\ \text{(i.e.}\ f(x) = 0\ \text{a.e.)} \right.
>   $$
>
> 前两条是积分的 linearity 的下位推论. 后一条 by def.

> **Corollary: --[[$\left. (L^{1}(\mu), \middle| \middle| \cdot \middle| \middle| ) \right.$ 是一个 Banach space]]--**
>
> $\left. (L^{1}(\mu), \middle| \middle| \cdot \middle| \middle| ) \right.$ 的 induced metric space 是 complete 的. 即, every Cauchy seq converges.\
> (**从而这是一个 Banach space**. )

> **Proof**
>
> 取一个 Cauchy seq $(f_{n})$ in $L^{1}$.\
> 这里有一个值得 recall 的 proposition:
>
> > **Proposition**
> >
> > 在一个 metric space 中, 一个 Cauchy seq converges 当且仅当它存在一个 convergent 的 subsequence.
>
> 证明很简单. 对于任意的 $\epsilon$, 可以取 $\max(N,M)$, 其中 N 为使得这个子序列所有元素距离 $x_{\ast} < \epsilon/2$ 的下标，M 为使得主序列所有元素两两之间距离 $< \epsilon/2$ 的下标.\
> 因而我们**只需要证明存在一个 subseq $(f_{n_{j}})$ s.t. $f_{n_{j}}\overset{j\rightarrow\infty}{\rightarrow}f \in L^{1}$ 即可.**\
> 已知 Cauchy, WTS: $f_{n}$ 收敛且极限在 $L^{1}$ 中. 我们直觉: 用 Cachy 条件构造 $1/\epsilon^{2}$ argument.\
> 我们 pick 子下标 $(n_{j})_{j \in {\mathbb{N}}}$ 使得对于每个 $j$ 都有
>
> $$
> \left. m,n \geq n_{j}\Longrightarrow \middle| \middle| f_{m} - f_{n} \middle| \middle| {}_{1} \leq \frac{1}{2^{j}} \right.
> $$
>
> 并 set
>
> $$
> g_{j} := f_{n_{j}} - f_{n_{j - 1}},\quad g_{1} = f_{n_{1}}
> $$
>
> 则有
>
> $$
> \left. \sum\limits_{j = 1}^{\infty}\int \middle| g_{j} \middle| \leq 1 < \infty \right.
> $$
>
> 从而 **by Fubini's Thm for series and seqs,** 存在:
>
> $$
> f: = \lim\limits_{j\rightarrow\infty}\sum\limits_{i = 1}^{j}g_{j} = \lim\limits_{j\rightarrow\infty}f_{n_{j}} \in L^{1}\exists a.e.
> $$
>
> 同时有
>
> $$
> \left. \int \middle| f - f_{n_{j}} \middle| \leq \sum\limits_{j + 1}^{\infty}\int \middle| g_{j} \middle| \leq \frac{1}{2^{j}}\overset{j\rightarrow\infty}{\rightarrow}0 \right.
> $$

> **Remark**
>
> 这里就发现了 Fubini for series and seq 的用处: 把求和与积分的换序从有限推广到无限求和上, 以绝对积分和有限为条件. 因而, **绝对积分和有限的 seq 是性质强大的.**\
> 而我们可以运用这一点来发掘 function seq 的性质, 比如这里**把一个 function seq 通过构造前后项差的方式, induce 出一个绝对积分和有限的 seq, 从而用这个 seq 的积分和反向证明原 seq 的性质**.

### density of simple function of $L^{1}(\mu)$

> **Theorem: --[[density of simple functions in $L^{1}(\mu)$]]--**
>
> 令 $(X,\mathcal{A},\mu)$ 为一个 measure space, 令 $f \in L^{1}(\mu)$,\
> 对于任意 $\epsilon > 0$, 都存在 simple $\phi:X\rightarrow{\mathbb{C}}$ in $L^{1}(\mu)$, 使得
>
> $$
> \left. \int \middle| f - \phi \middle| < \epsilon \right.
> $$

> **Proof**
>
> 这是显然的, by 积分的定义. 我么首先把 $f$ divide 为
>
> $$
> f = u + iv,\quad u = u^{+} - u^{-},\quad v = v^{+} - v^{-}
> $$
>
> 而后对这四个非负函数 $u^{+},u^{-},v^{+},v^{-}$分别使用 simple function seq approximation, 再使用 DCT:
>
> $$
> \int\lim\phi_{n} = \int u^{+} = \lim\int\phi_{n}
> $$
>
> 比方说 $(\phi_{n})$ 为从下逼近 $u^{+}$ 的 simple function seq, 那么 $u^{+}$ 是它的 dominating function, 同时也是极限. 那么对于任意的 $\epsilon > 0$ 都存在一个 $n$ 使得
>
> $$
> \left. | \middle| u^{+} - \phi_{n} \middle| \middle| {}_{1} \leq \int u^{+} - \int\phi_{n} < \epsilon \right.
> $$

尤其是这一特殊情况:

### density of step functions in $L^{1}(m)$

> **Theorem: --[[LS measure space 的 $L^{1}$ space 上的 density of step functions]]--**
>
> 考虑 $({\mathbb{R}},\mathcal{L},m_{s})$ where $m_{s}$ 为一个 Lebesgue-Stieljes measure on $\mathbb{R}$, let $f \in L^{1}(\mu)$,\
> 对于任意 $\epsilon > 0$, 都存在 step function $\phi = \sum_{j = 1}^{N}c_{j}\chi_{I_{j}}$, 使得
>
> $$
> \int(f - \phi) < \epsilon
> $$
>
> where each $I_{j}$ 都是 open intervals.

> **Proof**
>
> 和 general case 相似. 利用 the fact that 任意一个 Lebesgue mble function 都可以用 step function 来 approximate.

## integration of real and complex functions-III \[Fol 2.3, finished\]

### another dense subspace of $L^{1}(m_{s})$: $C_{c}({\mathbb{R}})$

上一节课我们知道了: 所有的 simple functions 在 $L^{1}(\mu)$ 中构成了一个 dense subspace. 尤其是特殊情况: 对于 $({\mathbb{R}},\mathcal{L},m_{s})$, **所有的 step functions 构成了一个 dense subspace of $L^{1}(m_{s})$.**

今天我们先介绍另一个特殊情况 $({\mathbb{R}},\mathcal{L},m_{s})$ 的 $L^{1}(m_{s})$ 的 **另一个 dense subspace: 所有的 cpt supported continuous function.**

也就是说, **任意的 Lebesgue intble function 都可以用 ctn function with compact supp 来近似.** 一个可积函数可以是 supp 非常怪异的以及非常 unctn 的, 但是却可以用 ctn and cpt supp functions 来逼近, in $L^{1}$ sense. 当然这是一种弱逼近. 函数可以差异很大.

> **Definition: --[[$C_{c}(X)$]]--**
>
> 令 $X$ be a metric space, 我们定义:
>
> $$
> C_{c}(X) := \left\{ {\text{all ctn functions}\ f:X\rightarrow{\mathbb{C}}\ \text{with cpt supp}} \right\}
> $$

> **Theorem: --[[$C_{c}(X) \subset L^{1}(\mu)$ 是一个 dense linear subspace]]--**
>
> $C_{c}({\mathbb{R}}) \subset L^{1}(\mu_{m})$ 为一个 dense linear subspace.

> **Proof**
>
> 对于 $f \in L^{1}(m_{s})$, let $\epsilon > 0$.我们首先 pick 一个 step function 来approximate $f$:
>
> $$
> \left. \phi = \sum\limits_{j = 1}^{n}c_{j}\chi_{I_{j}},\quad s.t. \middle| \middle| f - \phi \middle| \middle| {}_{1} < \frac{\epsilon}{2} \right.
> $$
>
> 空出来的 $\frac{\epsilon}{2}$, 我们使用 ctn and cpt supp function $f_{j}$对每个 $\chi_{I_{j}}$ 进行逼近, by:
>
> ![Figure 15:[ ]{style="white-space: pre-wrap"}](.assets/main--figure-raster-015.png){width="60%"}
>
> 从而 $\left. | \middle| \sum_{j}f_{j} - \phi \middle| \middle| < \frac{\epsilon}{2} \right.$, 因此 $\left. | \middle| \sum_{j}f_{j} - f \middle| \middle| < \frac{\epsilon}{2} \right.$ by tri ineq. 得证.

### Riemann v.s. Lebesgue integral

我们已经完成了一个任意的 measure space 上的 Lebesgue 积分的定义, 以及可积空间的定义.\
Recall: Riemann integral 是对于 ${\mathbb{R}}^{n}\rightarrow{\mathbb{R}}$ 的函数定义的, 经典定义为 ${\mathbb{R}}\rightarrow{\mathbb{R}}$ 的函数.\
现在我们比较对于 ${\mathbb{R}}\rightarrow{\mathbb{R}}$ 的函数的 Riemann 和 Lebesgue 积分. 我们将会得出结论: **Riemann 积分是 Lebesgue 积分的特殊情况, 即, Riemann 可积的函数一定也 Lebesgue 可积, 并且积分值相同**. (对于 ${\mathbb{R}}^{n}\rightarrow{\mathbb{R}}$ 的函数也一样, 之后将展开.)\
Recall Riemann integral 的定义:

> **Definition**
>
> 对于 $f:\lbrack a,b\rbrack\rightarrow{\mathbb{R}}$ bdd, 一个 **partition** $\mathcal{P} = \left\{ t_{j} \right\}_{j = 0}^{n}$ on $\lbrack a,b\rbrack$ 满足
>
> $$
> a = t_{0} < t_{1} < \cdots < t_{n} = b
> $$
>
> Define:
>
> $$
> S_{\mathcal{P}}(f): = \sum\limits_{j = 1}^{n}\sup\limits_{\lbrack t_{j - 1},t_{j}\rbrack}f(t_{j} - t_{j - 1})
> $$
> $$
> s_{\mathcal{P}}(f): = \sum\limits_{j = 1}^{n}\inf\limits_{\lbrack t_{j - 1},t_{j}\rbrack}f(t_{j} - t_{j - 1})
> $$
>
> Define over all possible partition on $\lbrack a,b\rbrack$: **lower integral** and **upper integral**
>
> $$
> \bar{I}(f): = \inf\limits_{\mathcal{P}\ \text{partition}}S_{\mathcal{P}}(f)
> $$
> $$
> \underset{¯}{I}(f): = \sup\limits_{\mathcal{P}\ \text{partition}}s_{\mathcal{P}}(f)
> $$
>
> 注意到, 对于任意的 $f$, 总是有
>
> $$
> \underset{¯}{I}(f) \leq \bar{I}(f)
> $$
>
> 我们称 $f$ 是 **Riemann integrable** 的, if
>
> $$
> \underset{¯}{I}(f) = \bar{I}(f) := I(f)
> $$
>
> 这个 $I(f)$ 称为 $f$ 在 $\lbrack a,b\rbrack$ 上的 Riemann integral.

### Riemann intble $\Longrightarrow$ Lebesgue intble

> **Theorem: --[[Riemann integral 是 Lebesgue integral 的特殊情况]]--**
>
> $$
> \begin{matrix}
> {f\ \text{Riemann integrable}\Longrightarrow\{ f \in L^{1}(\lbrack a,b\rbrack,\mathcal{L}.m)} \\
> {I(f) = \int_{\lbrack a,b\rbrack}f dm}
> \end{matrix}
> $$

> **Proof**
>
> for (a): 对于给定 partition $\mathcal{P}$, 我们 set:
>
> $$
> G_{\mathcal{P}}: = \sum\limits_{j}M_{j}\chi_{\lbrack t_{j - 1},t_{j}\rbrack},\quad g_{\mathcal{P}}: = \sum\limits_{j}m_{j}\chi_{\lbrack t_{j - 1},t_{j}\rbrack}
> $$
>
> 从而有:
>
> $$
> S_{\mathcal{P}}(f) = \int G_{\mathcal{P}} dm,\quad s_{\mathcal{P}}(f) = \int g_{\mathcal{P}} dm
> $$
>
> 我们知道, refinement 能增加 $s_{\mathcal{P}}$, 减小 $S_{\mathcal{P}}$ 从而增加逼近精度, 这一点在 Lebesgue integral 中更加明显:
>
> $$
> \begin{matrix}
> {\mathcal{P} \subset \mathcal{P}'} & {\Longrightarrow g_{\mathcal{P}} \leq g_{\mathcal{P}'} \leq f \leq G_{\mathcal{P}'} \leq G_{\mathcal{P}}} \\
>  & {\Longrightarrow s_{\mathcal{P}} \leq s_{\mathcal{P}'} \leq I(f) \leq S_{\mathcal{P}'} \leq S_{\mathcal{P}}}
> \end{matrix}
> $$
>
> 由于$f$ Riem integrable, **存在一个 seq of partitions $(\mathcal{P}_{n})$ 使得 $\mathcal{P}_{\mathcal{n}} \subset \mathcal{P}_{n + 1}$, $\left. | \middle| \mathcal{P} \middle| \middle| \rightarrow 0 \right.$ (mesh), 并且**
>
> $$
> s_{\mathcal{P}_{\mathcal{n}}},S_{\mathcal{P}_{\mathcal{n}}}\overset{n\rightarrow\infty}{\rightarrow}I(f)
> $$
>
> 因而 settiing
>
> $$
> g: = \lim\limits_{n\rightarrow\infty}g_{\mathcal{P}_{n}}
> $$
>
> 为一个 increasing limit;
>
> $$
> G: = \lim\limits_{n\rightarrow\infty}G_{\mathcal{P}_{n}}
> $$
>
> 为一个 decreasing limit; 由 mble seq 的 limit behvior 得 $g,G \in L^{1}(m)$ 且 $g \leq f \leq G$ 并且 by DCT:
>
> $$
> \int g dm = \lim\limits_{n}\int g_{\mathcal{P}_{n}} = I(f)
> $$
> $$
> \int G dm = \lim\limits_{n}\int G_{\mathcal{P}_{n}} = I(f)
> $$
>
> 从而
>
> $$
> g \leq f \leq G,\quad\text{and}\int(G - g) dm = 0
> $$
>
> 因而
>
> $$
> g = G a.e.(\Longrightarrow = f a.e.)
> $$
>
> 因而
>
> $$
> I(f) = \int f dm
> $$
>
> (由于 $m$ complete, $f$ 是 Lebesgue mble 的.)

> **Remark**
>
> 整体 intuitive. 对定义域的切分是对值域的切分的特殊情况.

### Lebesgue's criterion for Riemann integrability

> **Theorem: --[[Lebesgue's characterization of Riemann integrability]]--**
>
> 定义
>
> $$
> D_{f} = \left\{ {x\ \text{where}\ f\ \text{is not ctn at}} \right\}
> $$
>
> 则有
>
> $$
> f\ \text{Riemann intble}\Leftrightarrow m(D_{f}) = 0
> $$

> **Proof**
>
> 在 395 中已经证明一次. 这里再回顾一次.\
> Backward direction: trivial.\
> Forward direction: assume $f\ \text{Riemann intble}$.\
> 对于 $f:\lbrack a,b\rbrack\rightarrow{\mathbb{R}}$, 我们 define:
>
> $$
> H(x) := \lim\limits_{\delta\rightarrow 0}\sup\limits_{|y - x| \leq \delta}f(y),\quad h(x) := \lim\limits_{\delta\rightarrow 0}\inf\limits_{|y - x| \leq \delta}f(y)
> $$
>
> 即 $f$ 在 $x$ 处的上下极限. 从而:
>
> $$
> f\ \text{ctn at}\ x\Leftrightarrow\lim\limits_{y\rightarrow x}f(y) = f(x)\Leftrightarrow H(x) = h(x)
> $$
>
> 因而要证明 $m(D_{f}) = 0$, STS: $H(x) = h(x)$ a.e.\
> To prove this: 见 395.

## modes of convergence \[Fol 2.4, finished\]

### convergence family

对于 $f_{n},f:X\rightarrow{\mathbb{C}}$, 我们目前有 4 种不同的 convergence.\
2 **general ones**:

- **pointwise convergence**: 字面意思.

- **uniform convergence** (on a subset): 对于任意 error bound $\epsilon$, 存在同一个序号 $N$ 可以 $\epsilon$-bound 住这个集合里所有的 $x$ 的函数值和 limit 函数值的 error.

2 **in a measure space**:

- **a.e. convergence**: ptwise convergence for a.e. $x$, 即 outside a null $E$.

- **convergence in $L^{1}$**: $\left. \int \middle| f_{n} - f \middle| \rightarrow 0 \right.$

我们 recall trivial relation:

$$
\text{uni. conv}\Longrightarrow\text{ptwise. conv}\Longrightarrow\text{conv. a.e.}
$$

但是我们不清楚 $L^{1}$-convergence 和它们之间的关系.\
我们看以下的 examples:

### examples showing a.e. ptwise conv 和 $L^{1}$ conv 不能互推

> **Example**
>
> on $({\mathbb{R}},{\mathfrak{L}},m)$, 以下 $(f_{n})$:
>
> - **escape to width**
>
>   $$
>   f_{n} = \frac{1}{n}\chi_{(0,n)}
>   $$
>
>   $f_{n}\rightarrow 0$ **uniformly 但 $\operatorname{\rightarrow\not{}}0$ in $L^{1}$**
>
> - **escape to hat**:
>
>   $$
>   f_{n} = \chi_{(n,n + 1)}
>   $$
>
>   $f_{n}\rightarrow 0$ **ptwisely** 但并不 uniformly, 并且 **$\operatorname{\rightarrow\not{}}0$ in $L^{1}$**
>
> - **escape to height**:
>
>   $$
>   f_{n} = n\chi_{\lbrack 0,\frac{1}{n})}
>   $$
>
>   $f_{n}\rightarrow 0$ **a.e., 但是并不 ptwisely,** 当然也并不 uniformly, 并且$\operatorname{\rightarrow\not{}}0$ in $L^{1}$
>
> - **typewriter**: 我们把区间$\lbrack 0,1\rbrack$划分成$2^{k}$个等长子区间, 对于 $1 \leq n \leq 2^{k}$ 令 $f_{k,n}(x)$ 交替取 1, 其他取 0.
>
>   $$
>   f_{n,k}(x) = \left\{ \begin{matrix}
>   {1,} & {x \in \left\lbrack {\frac{n - 1}{2^{k}},\frac{n}{2^{k}}} \right\rbrack} \\
>   {0,} & \text{otherwise}
>   \end{matrix} \right.
>   $$
>
>   即, for given $k$, $f_{n}$ is the indicator function of the $n$-th dyadic interval.
>
>   $$
>   \parallel f_{n,k}\underset{1}{\parallel} = \frac{1}{2^{k}}\rightarrow 0
>   $$
>
>   因而 $f_{n,k}\rightarrow 0$ in $L^{1}$, 但是 $\forall x \in \lbrack 0,1\rbrack$, $f_{n,k}(x)\operatorname{\rightarrow\not{}}0$ ptwisely. (也不 a.e.) (这个例子, 在推广至 $L^{p}$ 空间的时候, 也有 $\parallel f_{n,k}\underset{p}{\parallel}\rightarrow 0$, 也可以说明 **$L^{p}$ convergence 并不能推导 a.e. convergence, 除了 $L^{\infty}$ 的例外**.)

在这些例子中, 我们发现, $L^{1}$-convergence 和 uniform, ptwise, a.e. 这三个 modes of covergence 都互不推导. 对于 uniform convergence 和 ptwise convergence, 这是很合理的, 因为可以函数越来越宽和扁使得积分不变但是却 uni conv; 也可以函数积分收敛但是在一个零测集上反复跳跃.\
并且我们进一步发现, 就算是 a.e. 收敛, 也和 $L^{1}$ 收敛没有互推关系. 比如 ex (3), 这个函数只在 $0$ 处不收敛至 0, 但是整体的积分却是 const 1.\
我们 recall: 两个函数 a.e. 相等, 等价于它们的 $L^{1}$ distance 为 0. 但是**它们作为函数列极限行为, 并不相干**.\
关于 $L^{1}$-convergence 和 uniform, ptwise, a.e. convergence 的关系我们已经讨论完了.\
接下来我们将关于 $L^{1}$-convergence 这一条线, 引入一些新的 convergence modes, 在更大的 convergence family 中讨论这些 convergence 的关系.

### 3 new modes of convergence: fast $L^{1}$-conv, conv measure and subseq a.e. conv

> **Definition: --[[modes of convergence for measurable functions]]--**
>
> 对于 $f_{n},f:X\rightarrow{\mathbb{C}}$, 我们定义以下三种 convergence:
>
> - **fast $L^{1}$-convergence**: if
>
>   $$
>   \left. \sum\limits_{n = 1}^{\infty}\int \middle| f_{n} - f \middle| < \infty \right.
>   $$
>
> - **convergence in measure**: if
>
>   $$
>   \left. \mu(x: \middle| f_{n}(x) - f(x) \middle| > \epsilon)\overset{n\rightarrow\infty}{\rightarrow}0 \right.
>   $$
>
> - **subseq a.e. convergence**: if 存在一个 subseq $(f_{n_{j}})$ 使得
>
>   $$
>   f_{n_{j}}\overset{j\rightarrow\infty}{\rightarrow}f a.e.
>   $$

显然, **fast $L^{1}$-convergence $\Longrightarrow$ $L^{1}$-convergence;**\
我们接下来将说明, **fast $L^{1}$-convergence 也 $\Longrightarrow$ a.e. convergence** (于是它同时作为 a.e. convergence 和 $L^{1}$-convergence 的上位收敛, 作为这两条线路的上位交汇.)\
而我们也将说明: **$L^{1}$-convergence 和 a.e. convergence 都 $\Longrightarrow$ subseq a.e. convergence, 作为这两条线路的下位交汇.**\
以及, $L^{1}$-convergence $\Longrightarrow$ convergence in measure.\
\

> **Remark**
>
> 对于 convergence in measure, 还有一个可提及的定义是 **Cachy in measure**: 对于任意 $\epsilon > 0$,
>
> $$
> \left. \mu(x: \middle| f_{n}(x) - f_{m}(x) \middle| > \epsilon)\overset{n,m\rightarrow\infty}{\rightarrow}0 \right.
> $$
>
> 我们可以证明 (Folland 2.30)
>
> $$
> \text{Cauchy in measure}\Longrightarrow\text{convergent in measure}
> $$
>
> 但是反向并不成立. examples 中, **escape to width, escape to hat 以及 typewritter 是 convergent to $0$ in measure 的, 但不 Cauchy in measure;**\
> 这里和我们在 metric space 上 distance function 的定义中的 \"convergent\" 和 \"Cauchy\" 是不同的, **在 以 distance 为收敛条件的意义上, convergent 是比 Cauchy 更强的性质.**

以下的标记将在之后几个定理的证明中用到: 我们现在 define:

$$
B_{n,k} := \left\{ x \in X: \middle| f_{n}(x) - f(x) \middle| \leq \frac{1}{k} \right\}
$$

这个集合表示**对第 $n$th term, error 控制在 $\frac{1}{k}$ 以内的点.**\
从而我们可以用交并的形式来表示 ptwise 收敛点的集合:

$$
\left\{ {x \mid f_{n}(x)\rightarrow f(x)} \right\} = \bigcap\limits_{k = 1}^{\infty}\bigcup\limits_{N = 1}^{\infty}\bigcap\limits_{n \geq N}B_{n,k}
$$

Recall Chebyshev:

$$
\left. g \in L^{1}\Longrightarrow\mu(\left\{ |g \middle| \geq c \right\}) \leq \frac{1}{c}\int \middle| g| \right.
$$

> **Proposition: --[[**fast $L^{1}$-conv $\Longrightarrow$ a.e. conv.**]]--**
>
> $$
> \left. \sum\limits_{j = 1}^{\infty}\int \middle| f_{n} - f \middle| < \infty\Longrightarrow f_{n}\rightarrow f a.e. \right.
> $$

> **Proof**
>
> 我们取
>
> $$
> \left\{ {x \mid f_{n}(x)\rightarrow f(x)} \right\} = \bigcap\limits_{k = 1}^{\infty}\bigcup\limits_{N = 1}^{\infty}\bigcap\limits_{n \geq N}B_{n,k}
> $$
>
> 的 complement
>
> $$
> E := \bigcup\limits_{k = 1}^{\infty}\bigcap\limits_{N = 1}^{\infty}\bigcup\limits_{n \geq N}B_{n,k}^{c} = \left\{ {f_{n}\operatorname{\rightarrow\not{}}f} \right\}
> $$
>
> **By Cheb, for each $n,k$ we have:**
>
> $$
> \left. \mu(B_{n,k}^{c}) \leq k\int \middle| f_{n} - f| \right.
> $$
>
> 因而由 fast $L^{1}$-convergence 的条件可得
>
> $$
> \left. \forall k\forall N,\quad\mu(\bigcup\limits_{n \geq N}B_{n,k}^{c}) \leq k\sum\limits_{n = N}^{\infty}\int \middle| f_{n} - f \middle| \quad(\rightarrow 0\ \text{as}\ N\rightarrow\infty) \right.
> $$
>
> 因而 by ctn from above,
>
> $$
> \mu(\bigcap\limits_{N = 1}^{\infty}\bigcup\limits_{n \geq N}B_{n,k}^{c}) = 0
> $$
>
> 因而
>
> $$
> \mu(E) = 0
> $$

> **Remark**
>
> 我们知道, $L^{1}$-convergence 和 a.e. convergence 互不能推, 因为这一个是逐点的性质, 一个是整体的性质. 但是 $L^{1}$-convergence 作为一个整体的性质又不够强大 (它允许用函数的纵深来换取宽度, 从而在收敛的情况下保持积分不变.). 然而, fast $L^{1}$-convergence 则是一个足够强大的整体性质. 因而它可以 imply a.e. convergence.

> **Corollary: --[[$L^{1}$-convergence ($\Longrightarrow$conv. in measure) $\Longrightarrow$ subseq a.e. conv.]]--**
>
> if $f_{n}\rightarrow f$ in $L^{1}$, then there exists subseq $(f_{n_{j}})_{j \in {\mathbb{N}}}$ s.t. $f_{n_{j}}\rightarrow f$ a.e.\
> (即 **$L^{1}$ convergence implies subseq a.e. convergence**)

> **Proof**
>
> 注意: **对于 $L^{1}$-convergent 的 seq, 我们可以 pick 出一个 fast $L^{1}$-convergent 的 subseq.**\
> Pick $(n_{j})_{j \in {\mathbb{N}}}$ s.t.
>
> $$
> \left. \int \middle| f_{n_{j}} - f \middle| \leq \frac{1}{j^{n}} \right.
> $$
>
> Then
>
> $$
> \left. \sum\limits_{j = 1}^{\infty}\int \middle| f_{n_{j}} - f \middle| < \infty \right.
> $$
>
> 由刚才的 prop 得, $f_{n_{j}}\rightarrow f$ a.e.

### a.u. conv.(并非 uni. conv. a.e.) 和 Egoroff's Theorem

> **Definition**
>
> 我们称 $f_{n}\rightarrow f$ almost uniformly (a.u.), 如果 $\forall\varepsilon > 0$, 都存在 $E \subseteq A$ s.t. $\mu(E) < \varepsilon$ 并且 $f_{n}\rightarrow f$ uniformly on $E^{C}$

> **Remark**
>
> 和 a.e. convergence 的定义不同, **a.u. convergence 并不能保证在一个零测集外都 uniform convergence, 但是它仍然 imply a.e. convergence.**\
> 也有更强的一种 convergence: **uniform convergence a.e.**, 表示在一个零测集外都 uniform convergence, 其强度在 uni. conv. 和 a.u. conv. 中间. 但在这里, 对于我们即将介绍的 Egoroff's Theorem 而言不需要这么强的 convergence.\
> 我们将在 $L^{p}$ space 的部分讨论 uniform convergence a.e. 这个 convergence mode, 并表示它等价于 $L^{\infty}$ convergence.

> **Theorem: --[[Egoroff's Theorem]]--**
>
> 如果 $\mu$ 是个 finite measure ($\mu(X) < \infty$), 那么
>
> $$
> f_{n}\rightarrow f a.e.\Leftrightarrow f_{n}\rightarrow f a.u.
> $$

> **Proof**
>
> a.u. $\Longrightarrow$ a.e.: DIY (显然)\
> a.e. $\Longrightarrow$ a.u.: Fix $\varepsilon > 0$, 我们有
>
> $$
> f_{n}\rightarrow f a.e.\Leftrightarrow\mu(\bigcup\limits_{k = 1}^{\infty}\bigcap\limits_{N = 1}^{\infty}\bigcup\limits_{n \geq N}B_{n,k}^{c}) = 0
> $$
>
> 因而
>
> $$
> \forall k,\mu(\bigcup\limits_{k = 1}^{\infty}\bigcap\limits_{N = 1}^{\infty}\bigcup\limits_{n \geq N}B_{n,k}^{c}) = 0
> $$
>
> By Ctn from Above:
>
> $$
> \forall k,\lim\limits_{N\rightarrow\infty}\mu(\bigcup\limits_{n \geq N}B_{n,k}) = 0
> $$
>
> Then:
>
> $$
> \forall k,\exists N_{k} s.t.\mu(\bigcup\limits_{n \geq N}B_{n,k}) < \frac{\varepsilon}{2^{k}}
> $$
>
> Set
>
> $$
> E := \bigcup\limits_{K = 1}^{\infty}\bigcup\limits_{n \geq N_{k}}B_{n,k}^{c}
> $$
>
> Then we have:
>
> $$
> \begin{matrix}
> {\{\mu(E) < \sum\limits_{1}^{\infty}\frac{\varepsilon}{2^{k}} = \varepsilon} \\
> {f_{n}\rightarrow f\text{unif. on}\ E^{c} = \bigcap\limits_{k = 1}^{\infty}\bigcap\limits_{n \geq N_{k}}B_{n,k}}
> \end{matrix}
> $$

> **Remark**
>
> 在 Prob Theory 中很有用, 因为 prob space 是 finite measure space.

> **Example**
>
> $\mu = \infty$ 时的反例: 考虑 escape to hat function $f_{n} := \chi_{(n,n + 1)}$ on $({\mathbb{R}},{\mathfrak{L}},m)$.\
> $f_{n}\rightarrow 0$ a.e. 但是并不 a.u., 因为 $\mu(X) = \infty$.

> **Theorem: --[[Lusin's Theorem]]--**
>
> If $f:\lbrack a,b\rbrack\rightarrow{\mathbb{C}}$ 是 Leb. mble 的, 那么 $\forall\varepsilon > 0$, 都存在 compact $K \subseteq \lbrack a,b\rbrack$ s.t. $m(K^{c}) < \varepsilon$ 并且 $f|_{K}$ ctn.

> **Proof**
>
> 这里我们 restrict $({\mathbb{R}},{\mathfrak{L}},m)$ to $\lbrack a,b\rbrack$, 得到这个 subspace 是一个 finite ($= b - a$) 的 measure space. 我们知道 $C_{c}(\lbrack a,b\rbrack) \subseteq L^{1}(m)$ 是 dense subset.\
> First assume $f$ bounded, then $f \in L^{1}(m)$, $\left. \int \middle| f \middle| < \infty \right.$.\
> Then:
>
> $$
> \exists(f_{n}) \subseteq C_{c}(\lbrack a,b\rbrack) s.t. f_{n}\rightarrow f\ \text{in}\ L^{1}
> $$
>
> Pass to subseq: $(f_{n_{j}})\rightarrow f$ a.e.\
> Then by **Egorov**:
>
> $$
> \exists F \subseteq \lbrack a,b\rbrack\text{mble}\ s.t.\mu(F) < \frac{\varepsilon}{2}
> $$
>
> 并且 $(f_{n_{j}})\rightarrow f$ uniformly on $F^{c}$.\
> By inner regu: 存在 $K \subseteq \lbrack a,b\rbrack$ cpt s.t. $K \subseteq F^{c}$ 并且 $m(F^{c}\backslash K) < \frac{\varepsilon}{2}$, **从而 $m(K^{c}) < \varepsilon$ 并且 $f_{n}$ conv unif. on $K$, so $f$ ctn on $K$.**

> **Remark**
>
> 这个定理的证明中展示了 subseq a.e. convergence 的用处.\
> 我们可以从一个 $L^{1}$-convergent 的 seq 中 \"蒸馏\" 出一个 a.e. convergent 的 subseq, conv to 同一个函数.\
> 并且如果把空间限制在 measure finite 的 subset 上, 还能获取到一个 a.u. convergent 的 seq.\
> a.u. convergent 的作用很大, 比如可以保留函数在一个比较大的空间上的 ctn 性质.\
> 因而 **subseq convergent 的性质可以 as good as convergent, a.u. 的性质可以 as good as uniform.**

### summary: convergence mode relations

![Figure 16:[ ]{style="white-space: pre-wrap"}](.assets/main--figure-raster-016.png){width="85%"}

一条线是函数值方面的收敛, 一条线是测度和积分方面的收敛, 第一次交汇是 fast $L^{1}$ conv, 汇聚在 subseq a.e. conv.\
**subseq a.e. conv. 是最弱的 convergence, 这里所有的 convergence 都可以推到它.**\
这里可能还有其他的 convergence 关系. 但是我们不关心. 因为不太会用到它们的关系.

> **Remark**
>
> 那我们不禁想要问: 如果没有 fast $L^{1}$ convergence, 但是还是想 show $L^{1}$ convergence, 怎么办呢? 这个常用的 convergence 难道只能从定义来证明吗?\
> 有以下两个方法:
>
> - DCT. DCT 就是专门为了证明 $L^{1}$ convergence 定制的.\
>   DCT 表明:
>
>   $$
>   f_{n}\rightarrow f\text{a.e.} + \text{dominating function}\Longrightarrow f_{n}\rightarrow f\text{in}\ L^{1}
>   $$
>
> - 如果作为底的 measure space 是 finite measure 的, 那么 uniform conv. a.e. (which is equiv to $L^{\infty}$ conv.) 可以推出 $L^{1}$ convergence. (以及任意的 $L^{p}$ convergence).

