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
source: "notes/math/measure-theory/chapters/12-differentiation_on_real_spaces.typ"
subtitle: Typst-first course notes and worked homeworks
title: "MATH 597: Measure Theory"
---
# differentiation on real spaces

## differentiation of regular Borel measures on ${\mathbb{R}}^{n}$ \[Fol 3.4, finished\]

> **Definition: --[[regular Borel measure]]--**
>
> 一个 Borel measure $\nu$ on ${\mathbb{R}}^{n}$ 被称为 regular 的, if $\nu$ is locally finite (finite on every compact set).

> **Theorem: --[[regular Borel measure: 蕴含了 regularity]]--**
>
> 一个 regular Borel measure $\nu$ on ${\mathbb{R}}^{n}$ 一定满足:
>
> 1.  outer regularity:
>
>     $$
>     \nu(E) = \inf\left\{ {\nu(U) \mid E \subset U\ \text{open}} \right\}
>     $$
>
> 2.  inner regularity:
>
>     $$
>     \nu(E) = \inf\left\{ {\nu(U) \mid E \subset U\ \text{open}} \right\}
>     $$

> **Remark**
>
> 这里不证明这两个性质. 因为目前的知识不够.\
> regular $\Longrightarrow$ outer regularity: Hard, 其推导需要 Ch7 regular 和 inner regularity $\Longrightarrow$ outer regularity: 这个简单, same as proof of Thm 1.18 on Folland.

> **Example**
>
> 任何 LS measure on $\mathbb{R}$ (restrict to Borel sets) 都是 regular measure. Lebesgue measure $m$ on ${\mathbb{R}}^{n}$ (restrict to Borel sets) 是 regular measure.

当然, 这个概念也可以推广至 signed/coplex measure 上.

> **Definition: --[[regular signed/complex measure]]--**
>
> 一个 signed/complex measure $\nu$ on ${\mathbb{R}}^{n}$ 被称为 regular measure, if $|\nu|$ is regular 的.

> **Lemma**
>
> 如果 $f \in L_{loc}^{1}({\mathbb{R}}^{n})$, 则 $f\, dm$ 是一个 regular measure. 如果 $f:{\mathbb{R}}^{n}\rightarrow{\mathbb{R}}$ 是 extended-integrable 的, 则
>
> $$
> f \in L_{loc}^{1}(m)\Leftrightarrow f\, dm\ \text{is a regular measure}
> $$

> **Proof**
>
> Folland p99. 这显然, 因为 $f$ locally integrable 就说明 $f\, dm$ 是 locally finite 的.

> **Lemma**
>
> 如果 $\rho,\lambda$ 是 signed/complex measure 并且 $\rho\bot\lambda$, 那么
>
> $$
> \rho,\lambda\ \text{are regular measures}\Leftrightarrow\rho + \lambda\ \text{is a regular measure}
> $$

> **Proof**
>
> 在 hw 10 中.\
> Note: STS it for positive measure, 这是因为对于 regular signed / complex measure 而言,
>
> $$
> \left. \lambda \perp \rho\quad\Leftrightarrow\quad\exists A \in \mathcal{A}\text{s.t.} \middle| \lambda \middle| (A^{c}) = 0\ \text{and} \middle| \rho \middle| (A) = 0\quad\Leftrightarrow\quad \middle| \lambda \middle| \perp \middle| \rho| \right.
> $$
>
> 并且从而
>
> $$
> \left. \nu = \lambda + \rho,\lambda \perp \rho\Longrightarrow \middle| \nu \middle| = \middle| \lambda + \rho \middle| = \middle| \lambda \middle| + \middle| \rho| \right.
> $$
>
> 这一命题的证明也在 hw 10 中,\

### LDT meets LRNT: 任何 regular Borel measure $\nu$ on ${\mathbb{R}}^{n}$ 对于 $m$ 的 RN-derivative $=$ relative density

> **Theorem: --[[LDT meets LRNT: computing RN derivative on ${\mathbb{R}}^{n}$]]--**
>
> Let $\nu$ be a regular Borel measure on ${\mathbb{R}}^{n}$, with LRN decomposition
>
> $$
> \nu = \lambda + \rho,\quad d\rho = f\, dm,\quad\lambda\bot m
> $$
>
> 即
>
> $$
> d\nu = d\lambda + f\, dm
> $$
>
> 那么: 对于 $m$-a.e. $x \in {\mathbb{R}}^{n}$, 都有:
>
> $$
> \lim\limits_{r\rightarrow 0}\frac{\nu(B(x,r))}{m(B(x,r))} = f(x)
> $$

> **Remark**
>
> Also true with $B(x,r)$ replaced with shrinking $E_{r}$.\
> 这一 Thm 一句话概括即: **如果 $\nu$ 是一个 regular measure, 那么几乎处处, 我们都可以用这一点上的 density of $\nu$ over $m$ 来获得它对 $m$ 的 RN derivative $f$.**

> **Proof**
>
> 由 $\nu = \lambda + \rho$ 得到:
>
> $$
> \frac{\nu(B(x,r))}{m(B(x,r))} = \frac{\lambda(B(x,r))}{m(B(x,r))} + \frac{\rho(B(x,r))}{m(B(x,r))}
> $$
>
> **By LDT, 我们有:**
>
> $$
> \lim\limits_{r\rightarrow 0}\frac{\rho(B(x,r))}{m(B(x,r))} = f(x),\quad\text{for}\ m\ \text{-a.e.}\ x\ \text{.}
> $$
>
> 于是, 原命题即转化为 WTS:
>
> $$
> \lim\limits_{r\rightarrow 0}\frac{\lambda(B(x,r))}{m(B(x,r))} = 0,\quad\text{for}\ m\ \text{-a.e.}\ x\ \text{.}
> $$
>
> (Notice: 这里 $0$ 也就是 $d\lambda/dm$, 因为两个 mutually singular 的 measure，其 RN derivative = $0$ a.e.).\
> By lemma: 因为 $\nu$ regular, 且 $\lambda \perp \rho$ ,可以推出: $\lambda,\rho$ 也是 regular 的.\
> WLOG 我们可以 suppose $\lambda$ 是 positive measure, 因为 $\left. \lambda \perp m\Leftrightarrow \middle| \lambda \middle| \perp m \right.$, 并且$\left. |\lambda(E) \middle| \leq \middle| \lambda \middle| (E) \right.$ for any $E$. 因而 $\lambda$ 是 positive measure 的情况中这个极限为 $0$ 也自然推广到 complex measure 上.\
> 注意: 由于 $\lambda \perp m$, 我们可以选取 Borel set $A$ such that
>
> $$
> \lambda(A) = 0,\quad m(A^{c}) = 0
> $$
>
> 从而: 只需要证明 $\lim_{r\rightarrow 0}\frac{\lambda(B(x,r))}{m(B(x,r))} = 0$ for a.e. $x \in A$ 就可以了, 因为 $A^{c}$ 本身也是 $m$ 的 null set.\
> 我们 set:
>
> $$
> F_{k}: = \left\{ {x \in A:\lim\limits_{r\rightarrow 0}\frac{\lambda(B(x,r))}{m(B(x,r))} \geq \frac{1}{k}} \right\}
> $$
>
> 从而 STS: 对于任意 $k$, $m(F_{k}) = 0$.\
> 我们 Fix 一个 $k$, by $\lambda$ 的 inner regularity, STS: 对于任意的 cpt $K \subset F_{k}$ compact, 都有 $m(K) = 0$.\
> 于是我们 fix 一个 compact set $K \subset F_{k}$, 并 fix $\epsilon > 0$, STS: $m(K) < \epsilon$.\
> By $\lambda$ 的 outer regularity, 存在 $U_{\epsilon} \supset A$ open 使得
>
> $$
> \lambda(U_{\epsilon}) < \frac{\epsilon}{3^{n}k}
> $$
>
> By $F_{k}$ 的定义, 对于任意的 $x \in F_{k}$, 都存在某个 $r_{x} > 0$ 使得
>
> $$
> \nu(B(x,r_{x})) > \frac{1}{k}m(B(x,r_{x}))
> $$
>
> Since
>
> $$
> K \subset \bigcup\limits_{x \in K}B(x,r_{x})
> $$
>
> 从而 by finite open covering thm, 一定存在某个 finite set $K'$ 使得
>
> $$
> K \subset \bigcup\limits_{x \in K'}B(x,r_{x})
> $$
>
> 我们 recall VItali covering lemma: For given collection of balls $\left\{ {B_{j} \subset {\mathbb{R}}^{n}} \right\}_{j = 1}^{k}$, 存在 **disjoint** subcollection $\left\{ {B_{j_{1}},\cdots,B_{j_{m}}} \right\}$ 使得
>
> $$
> \bigcup\limits_{j = 1}^{k}B_{j} \subset \bigcup\limits_{i = 1}^{m}(3B_{j_{i}})
> $$
>
> 代入这里, 得到: 存在 $K^{''} \subset K'$ s.t. for all $x \in K^{''}$, $B(x,r_{x})$ 都是 disjoint 的, with
>
> $$
> K \subset \bigcup\limits_{x \in K^{''}}3B(x,r_{x})
> $$
>
> 于是
>
> $$
> \begin{matrix}
> {m(K)} & {\leq \sum\limits_{x \in K^{''}}m(3B(x,r_{x}))} \\
>  & {= 3^{n}\sum\limits_{x \in K^{''}}m(B(x,r_{x}))} \\
>  & {\leq 3^{n}k\sum\limits_{x \in K^{''}}\lambda(B(x,r_{x}))} \\
>  & {\leq 3^{n}k\lambda(U_{\epsilon}) \leq \epsilon}
> \end{matrix}
> $$
>
> Since $\epsilon$ 任意, $m(K) = 0$.\
> Since $K$ 任意, $m(F_{k}) = 0$.\
> Since $k$ 任意,
>
> $$
> m(\left\{ {x \in A:\lim\limits_{r\rightarrow 0}\frac{\lambda(B(x,r))}{m(B(x,r))} > 0} \right\}) = 0
> $$
>
> 从而得证.

> **Remark**
>
> 这实际上是一件比较自然的事情. 因为 $\lambda \perp m$, 那么存在一个划分: 使得某边 $\lambda$ null, $m$ 具有全测度. 在这一边几乎每一点上, $\lambda$ 相对于 $m$ 的密度理应为 $0$; 而另一边, $m$ 是零测度的; 从而整体, 在至多一个 $m$ 的 null set 外, $\lambda$ 相对于 $m$ 的密度为 $0$.\
> 在这个证明中, 我们巧妙地同时运用了 inner 和 outer regularity 来简化要证明的结论, 最后 reduce to finite open covering 并自然地使用 VItali covering lemma 来 bound measure. 属于比较好看的证明.

### Differentiation on $\mathbb{R}$

### $\left\{ {\text{positive regular Borel measures on}\ {\mathbb{R}}} \right\} \simeq \left\{ {\text{distribution functions}\ F:{\mathbb{R}}\rightarrow{\mathbb{R}}} \right\}$

Recall that: **每个 distribution function (非严格 increasing, right ctn function) 都对应了唯一的一个 regular Borel measures $\mu_{F}$ on $\mathbb{R}$, 反之亦然.**\
给定一个 regular Borel measures $\mu_{F}$,

$$
\begin{matrix}
{F_{\mu}(x) := \{\mu((0,x\rbrack)\quad,x \geq 0} \\
{- \mu((x,0\rbrack),x < 0}
\end{matrix}
$$

为它的 unique distribution function. 即 $\mu((a,b\rbrack) = F(b) - F(a)$, for all h-intervals.\
而给定对于 distribution function $F$, 我们 define $\mu_{0}$ by:

$$
\mu_{0}(\bigcup\limits_{i = 1}^{n}(a_{i},b_{i}\rbrack) = \sum\limits_{i = 1}^{n}(F(b_{i}) - F(a_{i}))
$$

然后 **by Hahn-Kolmogrov, extend to a regular Borel measure $\mu_{F}$**, 使得 $\mu_{F}((a,b\rbrack) = F(b) - F(a)$ for any h-interval, i.e. $F$ 是 $\mu_{F}$ 的 distribution function, 并且 unique in the sense that 任意其他的 such function $G$ 如果也是$\mu_{F}$ 的 distribition function, 则必然有 $F - G$ 为 const. 从而

$$
\mu_{F}\operatorname{\leftrightarrow ︎}F
$$

之间构成了一个 measures 和 functions 的空间的 bijection.

distribution function 和 regular measure 之间的对应关系, 关键用处在于什么呢? 我们 recall 刚刚才证明的定理, 不过使用一个更 general 的 version (can easily be extended from what we proved):

> **Theorem: --[[slightly more general version of LRNT meets LDT]]--**
>
> Let $\nu$ be a regular Borel measure on ${\mathbb{R}}^{n}$, with LRN decomposition
>
> $$
> \nu = \lambda + \rho,\quad d\rho = f\, dm,\quad\lambda\bot m
> $$
>
> 那么: 对于 $m$-a.e. $x \in {\mathbb{R}}^{n}$, 取任意 nicely shrinking $\left\{ E_{r} \right\}$ to $x$, 都有:
>
> $$
> \lim\limits_{r\rightarrow 0}\frac{\nu(E_{r})}{m(E_{r})} = f(x)
> $$

因而如果我们有一个 $\mathbb{R}$ 上的 regualr measure $\mu_{G}$, 那么考虑 $E_{r}: = (x,x + r\rbrack$, 我们有:

$$
\frac{\mu_{G}(E_{r})}{m(E_{r})} = \frac{G(x + r) - G(x)}{r}
$$

从而我们发现 for a.e. $x$, 都有:

$$
\lim\limits_{r\rightarrow 0}\frac{\mu_{G}(E_{r})}{m(E_{r})} = G'(x)
$$

我们可以得到: 这**个 regualr measure $\mu_{G}$ 相对于 $m$ 的 LRN derivative, 就等于它的 distribution function 的 derivative!** 甚至, 我们可以由此判断: **如果 $G:{\mathbb{R}}\rightarrow{\mathbb{R}}$ 是一个 distribution function (increasing, right ctn), 那么它的 derivative 一定是 a.e. 存在的!** Since $\mu_{G}$ regular $\Longrightarrow$ $G$ locally intble $\Longrightarrow$ by LDT, 这个 density limit 是 a.e. 存在的.\
至此, 我们发现了 Monotone Differentiation Theorem.\

### Monotone Differentiation Theorem

> **Theorem: --[[Monotone Differentiation Theorem]]--**
>
> 令 $F:{\mathbb{R}}\rightarrow{\mathbb{R}}$ 为一个 increasing (nondecreasing) function, set:
>
> $$
> G(x): = F(x + )
> $$
>
> 即 $F$ 的右极限函数. (note: $G$ 一定是 **increasing** 且 **right ctn** 的, 因而是一个 distribution function)\
> 则有:
>
> - $D_{F} := \left\{ {x:F\ \text{disctn at}\ x} \right\}$ 是至多 ctbl 的 (从而一定 zero measure)
>
> - $F,G$ 都 differentaitble $m$-a.e., 并且
>
>   $$
>   F' = G'\ \text{a.e.}
>   $$

> **Proof**
>
> **of (a):** STS that, 对于任意 $m,n \in {\mathbb{N}}$,
>
> $$
> Z_{m,n}: = \left\{ {x \in \lbrack - m,m\rbrack:F(x + ) - F(x - ) \geq \frac{1}{n}} \right\}
> $$
>
> 是一个 finite set. 从而 $D_{F} = \bigcup_{m,n}Z_{m,n}$ 是 at most ctbl 的.\
> 而 $Z_{m,n}$ 确实是 finite 的, 因为 $F( - m) - F(m)$ 是 bounded 的, 所以 $Z_{m,n}$ 一定是 finite 的. (至多经历 $F( - m) - F(m)/(1/n)$ 个这样的点).\

> **Proof**
>
> **of (b):** 首先我们知道, $G$ right ctn + increasing $\Longrightarrow\mu_{G}$ 是一个 LS (thus regular when restricted to Borel sets) measure on $\mathbb{R}$.\
> Apply LDT to $\mu_{G}$, take $E_{r}: = (x,x + r\rbrack$ as the shrinking family to $x$.\
> 于是
>
> $$
> \frac{\mu_{G}(E_{r})}{m(E_{r})} = \frac{G(x + r) - G(x)}{r}
> $$
>
> 由 LDT $\Longrightarrow$ 上式的 limit exist for a.e. $x$ ( $\mu_{G}$ w.r.t. $m$ 的 RN derivative), 它就是 $G'$, 且 $G'$ a.e. 存在, 等于其 induce 的 LS measure 的 RN derivaive.\
> 现在 remains to show: $F$ 的 derivative 也 a.e. 存在, 并且和 $G$ 的相等. 我们 set:
>
> $$
> H: = G - F
> $$
>
> 从而 STS: $H'$ a.e. 存在且为 $0$.\
> 首先, $H > 0$ 并且 $H \neq 0$ 只有可能在 discontinuous points (which is at most ctbl)上. We set:
>
> $$
> \mu: = \sum\limits_{x \in D_{F}}H(x)\delta_{x}
> $$
>
> 从而对于任意区间 $I$,
>
> $$
> \mu(I) = \sum\limits_{x \in D_{F} \cap I}H(x)
> $$
>
> 由于 $F,G$ locally intble, **这个 $\mu$ 是一个 regular Borel measure**.\
> 并且, 这个 $\mu$ 的 null set 为 $D_{f}^{c}$, 而 $D_{f}$, as we have proved, is at most ctbl, 因而是 $m$ 的 null set. 从而得到:
>
> $$
> \mu \perp m
> $$
>
> 于是
>
> $$
> \frac{d\mu}{dm} = 0\quad a.e
> $$
>
> 从而由 LDT 得:
>
> $$
> \frac{\mu((x - r,x + r))}{2r}\overset{r\rightarrow 0}{\rightarrow}0\quad a.e.
> $$
>
> 因而对于任意的 $h > 0$,
>
> $$
> \left. |\ \frac{H(x + h) - H(x)}{h}\  \middle| \leq \frac{H(x + h) + H(x)}{|h|} \leq \frac{\left. \mu((x - 2 \middle| h \middle| ,x + 2 \middle| h \middle| )) \right.}{\left. 4 \middle| h| \right.}\overset{h\rightarrow 0}{\rightarrow}0 \right.
> $$
>
> finishing the proof.

> **Remark**
>
> **As conclusion: $\mathbb{R}$ 上的任意 increasing 函数 $F$, 其 right limit induce 的 LS measure 对于 $m$ 的 RN derivative, 就等于它的 derivative a.e.**

## functions of bounded variation: $F \in BV$ \[Fol 3.5\]

上一节课我们证明了 Monotone Differentiation Theorem: 它表明的是, 任何 ${\mathbb{R}}\rightarrow{\mathbb{R}}$ 的 non-decreasing function 都是 differentiable a.e. 的.\
我们知道一个函数在一整个区间上 differentiable 其实是一个比价严格的条件, 但是 differentiable a.e. 的条件就略好达到一些.\
Question: 如果一个函数在 $\lbrack a,b\rbrack$ 上 differentiable a.e., 那么 in a.e. sense, 可以在 $\lbrack a,b\rbrack$ 上定义它的 derivative $F'$. 那么, 是否一定有

$$
F(b) - F(a) = \int_{a}^{b}F'(x)\, dx
$$

呢? 答案肯定是不一定的. 以下是三个反例: 1. Heaviside function; 2. Cantor function; 3.$F'(x) = 0$ a.e., but not $0$ on a null set.\
这也很显然: 因为单点的值是无法控制的. 我们只能控制 in sense of a.e. , 因而有 outlier 的 $a,b$ 是很正常的.\
我们之后将 revisit 这一问题, 给出这个等式成立的 condition.

接下来我们将

### total variation function $T_{F}$ of a function $F$

> **Definition: --[[total variation function]]--**
>
> 给定一个 function $F:{\mathbb{R}}\rightarrow{\mathbb{C}}$, 我们定义它的 total variation function $T_{F}$ 为:
>
> $$
> \begin{matrix}
> {T_{F}:{\mathbb{R}}} & {\rightarrow\lbrack 0,\infty\rbrack} \\
> x & {\mapsto\sup\left\{ \sum\limits_{j = 1}^{n} \middle| F(x_{j}) - F(x_{j + 1}) \middle| : - \infty < x_{0} < \cdots < x_{n} = x \right\}}
> \end{matrix}
> $$

> **Remark**
>
> Total variation 是一个很形象的定义. $T_{F}(x)$ 表示的是 $F$ 从 $- \infty$ 到当前 $x$ 的这段定义域上, 总的变化量. 它 count into 所有的变化, 包括离散的和连续的, 正方向的和负方向的.\
>
> ![Figure 35:[ ]{style="white-space: pre-wrap"}](.assets/main--figure-raster-034.png){width="50%"}

> **Lemma**
>
> 对于任意的 $F:{\mathbb{R}}\rightarrow{\mathbb{C}}$, $T_{F}$ 都是 increasing 的; 并且对于任意 $a < b$, 有:
>
> $$
> T_{F}(b) = T_{F}(a) + T_{F}(a;b)
> $$
>
> where
>
> $$
> T_{F}(a;b) = \sup\left\{ \sum\limits_{j = 1}^{n} \middle| F(x_{j}) - F(x_{j + 1}) \middle| :b = x_{0} < \cdots < x_{n} = a \right\}
> $$
>
> 表示 $F$ 的定义域限制在 $\lbrack a,b\rbrack$ 上的 total variation.

> **Proof**
>
> 显然, 由于 total variation 是 increasing 的, **我们总是可以 greedyly 选择 partition**. 对于一个 partition, 总是可以插入一个中间点把它分成两半, 而这两半的 sub partition 的 total variation 的和 $\geq$ 原先的 partition 的 total variation.

### space of functions of bounded variation: $BV$ 的基本性质

> **Definition: --[[function of bounded variation]]--**
>
> 如果 $T_{F}(\infty) < \infty$, 我们称 $F:{\mathbb{R}}\rightarrow{\mathbb{C}}$ is **of bounded variation** 的, 写作 $F \in BV$.

> **Definition: --[[function of bounded variation on an interval]]--**
>
> 如果 $T_{F}(a;b) < \infty$, 我们称 $F:{\mathbb{R}}\rightarrow{\mathbb{C}}$ is **of bounded variation** on $\lbrack a,b\rbrack$, 写成 $F \in BV(\lbrack a,b\rbrack)$.

首先显然, $F \in BV$ 可以 reduce to real-valued 的情况来讨论.

> **Proposition**
>
> $$
> F \in BV\Leftrightarrow\Re f \in BV\ \text{and}\ \Im f \in BV
> $$

### $BV$ as a vector space

> **Lemma: --[[$BV$ 是一个 complex vector space]]--**
>
> 如果 $F,G \in BV$, 那么对于任意的 $a,b \in {\mathbb{C}}$, we have
>
> $$
> \left. T_{aF + bG} \leq \middle| a \middle| T_{F} + \middle| b \middle| T_{G} \right.
> $$
>
> 从而
>
> $$
> aF + bG \in BV
> $$

> **Proof**
>
> 易得. 显然, 函数的 total variation 是线性可加的.

### $F \in BV$ 的 $T_{F}$ 的 limit behavior

我们知道，$F \in BV$ if $T_{F}(\infty) < \infty$. 而关于 $T_{F}( - \infty)$, 同样有强结论:

> **Proposition**
>
> $$
> F \in BV\Longrightarrow T_{F}( - \infty) = 0
> $$

> **Proof**
>
> Let $\epsilon > 0$.\
> 从而对于任意的 $x \in {\mathbb{R}}$, since $F \in BV$ 那么 $T_{F}$ bounded, $T_{F}(x)$ 是一个 real number.\
> 因而我们可以找到一组 partition points $x_{0} < \cdots < x_{n}$ 使得
>
> $$
> \left. \sum\limits_{1}^{n} \middle| F(x_{j}) - F(x_{j - 1}) \middle| \geq T_{F}(x) - \epsilon \right.
> $$
>
> 从而
>
> $$
> T_{F}(x) - T_{F}(x_{0}) \geq T_{F}(x) - \epsilon
> $$
>
> 从而
>
> $$
> T_{F}(y) \leq \epsilon,\quad\forall y \leq x_{0}
> $$
>
> Since $\epsilon > 0$ arbitrary, 这证明了 $T_{F}( - \infty) = 0$

> **Remark**
>
> $F$ bounded variation 的必要条件是它在 $x\rightarrow\infty$ 时, 截止 $x$ 处的 variation $\rightarrow 0$.

> **Lemma: --[[$F \in BV$ right ctn $\Longrightarrow T_{F}$ right ctn]]--**
>
> $F \in BV$ right ctn $\Longrightarrow T_{F}$ 也 right ctn

> **Proof**
>
> Let $x \in {\mathbb{R}},\epsilon > 0$.\
> Let
>
> $$
> \alpha: = T_{F}(x + ) - T_{F}(x)
> $$
>
> WTS: $\alpha = 0$.\
> By right ctnity of $F$ 和 $T_{F}$ increasing, 我们可以选择 $\delta > 0$, 同时满足: $\left. |F(x + h) - F(x) \middle| < \epsilon \right.$, $T_{F}(x + h) - T_{F}(x + ) < \epsilon$ whenever $0 < h < \delta$.\
> Fix 一个满足 $0 < h < \delta$ 的 $h$. 其后的证明见 Folland 104.

### 属于 $BV,BV(I)$ 的函数

> **Lemma: --[[哪些函数一定 $BV$ or $BV(I)$]]--**
>
> 1.  如果 $F:{\mathbb{R}}\rightarrow{\mathbb{R}}$ bounded 且 increasing, 那么 $F \in BV$ 且 $T_{F}(x) = F(x) - F( - \infty)$.\
>
> 2.  如果 $F:{\mathbb{R}}\rightarrow{\mathbb{R}}$ 是 Lipschitz countinuous 的, 那么$F \in BV(I)$ for 任意的 cpt interval $I$
>
> 3.  如果 $F:{\mathbb{R}}\rightarrow{\mathbb{R}}$ 是 differentiable 且 $F'$ bounded 的, 那么 $F \in BV(I)$ for 任意的 cpt interval $I$

> **Proof**
>
> \(1\) trivial.\
> (2) by def: 考虑 Lipschitz const $M$, 则 $T_{F}(a;b) \leq M(b - a)$.\
> (3): 这是 (2) 的推论, 因为 recall: by MCT 可得: $F:{\mathbb{R}}\rightarrow{\mathbb{R}}$ 是 differentiable 且 $F'$ bounded $\Longrightarrow F$ Lipstchiz ctn.

> **Proposition**
>
> 以下是一些经典的函数的 variational behavior:
>
> 1.  $f(x) = \sin(x)$: 属于 $BV(I)$ for 任意 cpt $I$, 但不属于 $BV$.
>
> 2.  $f(x) = x\sin\frac{1}{x},f(0) = 0$: **属于$BV(I)$ iff $0 \notin I$.**
>
> 3.  $f(x) = x^{2}\sin\frac{1}{x^{2}},f(0) = 0$: **属于$BV(I)$ iff $0 \notin I$.**

> **Proof**
>
> \(1\) 显然; (2),(3) 见 HW 11. 其实它们基本相同. ($\Longrightarrow$): if $0 \notin I$ then $F \in BV(I)$. 是简单的, we differentiate $F(x) = x\sin(1/x)$ for $x \neq 0$:
>
> $$
> F'(x) = \frac{d}{dx}\left( {x \cdot \sin\left( \frac{1}{x} \right)} \right) = \sin\left( \frac{1}{x} \right) + x \cdot \cos\left( \frac{1}{x} \right) \cdot \left( {- \frac{1}{x^{2}}} \right) = \sin\left( \frac{1}{x} \right) - \frac{1}{x}\cos\left( \frac{1}{x} \right)
> $$
>
> 在不含 $0$ 的区间上, 它是 bounded 的. 于是 by lemma 得证.\
> ($\Longleftarrow$): if $F \in BV(I)$ then $0 \notin I$. This is equiv to: if $0 \in I$ then $F \notin BV(I)$.\
> Suppose $0 \in I = \lbrack a,b\rbrack$ then $a \leq 0$ and $b \geq 0$, one of which is strict. WLOG we suppose $b > 0$.\
> 我们的 idea 是 harmonic series. 考虑
>
> $$
> y_{n} := \frac{1}{n\pi + \pi/2}\rightarrow 0^{+}
> $$
>
> we have:
>
> $$
> F\left( y_{n} \right) = y_{n}\sin\left( \frac{1}{y_{n}} \right) = \frac{1}{n\pi + \pi/2} \cdot \sin(n\pi + \pi/2)
> $$
>
> For odd $n$, $F(y_{n}) = \frac{- 1}{n\pi + \pi/2}$, for even $n$, $F(y_{n}) = \frac{1}{n\pi + \pi/2}$. Since $b > 0$, for some $N_{0}$ we have $y_{N_{0}} < b$. Then we consider the partition: pick $N \in {\mathbb{N}}$, and use $x_{0} = 0,x_{1} = y_{N_{0} + N - 1},x_{2} = y_{N_{0} + N - 2},\cdots,x_{N} = y_{N_{0}},x_{N + 1} = b$ as the partition points of $\lbrack 0,b\rbrack$.\
> Then we have
>
> $$
> \left. \sum\limits_{n = 1}^{N + 1} \middle| F(x_{n}) - F(x_{n - 1}) \middle| \geq \sum\limits_{n = N_{0}}^{N_{0} - 2 + N}\frac{1}{\pi n + \pi/2} + \frac{1}{\pi(n + 1) + \pi/2} \geq 2\sum\limits_{n = N_{0}}^{N_{0} - 2 + N}\frac{1}{\pi n + \pi/2} \right.
> $$
>
> As $N\rightarrow\infty$, this sum $\left. \sum_{n = 1}^{N + 2} \middle| F(x_{j}) - F(x_{j - 1}) \middle| \rightarrow\infty \right.$, by the harmonic series.

### Jordan decomposition for $f \in BV$: $f = \frac{1}{2}(T_{F} + F) - \frac{1}{2}(T_{F} - F)$

> **Lemma**
>
> 如果 real-valued $F \in BV$, 那么 $T_{F} + F,T_{F} - F$ 都是 increasing 的.

> **Remark**
>
> $T_{F} + F$ 即: $F$ increasing 的地方加倍 increasing, $F$ decreasing 的地方 const;\
> $T_{F} - F$ 即: $F$ decreasing 的地方反向加倍 increasing, $F$ increasing 的地方 const;
>
> ![Figure 36:[ ]{style="white-space: pre-wrap"}](.assets/main--figure-raster-035.png){width="50%"}

> **Proof**
>
> 任取 $x < y$.\
> Let $\epsilon > 0$.\
> Can find $x_{0} < x_{1} < \cdots < x_{N} = x$, s.t.
>
> $$
> \left. \sum\limits_{1}^{N} \middle| F(x_{j}) - F(x_{j - 1}) \middle| \geq T_{F}(x) - \epsilon \right.
> $$
>
> 从而
>
> $$
> \begin{matrix}
> {T_{F}(y)} & \left. \geq \sum\limits_{1}^{N} \middle| F(x_{j}) - F(x_{j - 1}) \middle| + \middle| F(y) - F(x)| \right. \\
>  & \left. \geq T_{F}(x) - \epsilon + \middle| F(y) - F(x)| \right.
> \end{matrix}
> $$
>
> 由于 $\epsilon > 0$ 任意, 可以得到:
>
> $$
> \left. T_{F}(y) - T_{F}(x) \geq \middle| F(y) - F(x)| \right.
> $$
>
> 因而:
>
> $$
> \left. (T_{F}(y) - F(y)) - (T_{F}(x) - F(x)) \geq \middle| F(y) - F(x) \middle| - (F(y) - F(x)) \geq 0 \right.
> $$

> **Theorem: --[[Jordan decomposition for $F \in BV$]]--**
>
> 对于 $F:{\mathbb{R}}\rightarrow{\mathbb{R}}$ (注意是 real-valued):
>
> $$
> F \in BV\Leftrightarrow F\ \text{等于两个 bounded increasing functions 的差}
> $$
>
> Specially,
>
> $$
> F \in BV\Leftrightarrow T_{F} \pm F\ \text{bounded}
> $$
>
> 因而 for $F \in BV$, 我们总是可以把它写作
>
> $$
> F = \frac{1}{2}(T_{F} + F) - \frac{1}{2}(T_{F} - F)
> $$
>
> where we call it as the **Jordan decomposition** of $F \in BV$. 其中, $\frac{1}{2}(T_{F} + F)$ 被称为 $F$ 的 **positive variation**; $\frac{1}{2}(T_{F} - F)$ 被称为 $F$ 的 **negative variation**.

> **Proof**
>
> 显然, $F \in BV\Longrightarrow F$ bdd, 因为
>
> $$
> \left. |F(y) - F(x) \middle| \leq T_{F}(\infty) - T_{F}( - \infty) \right.
> $$
>
> For $F \in BV$, we have $T_{F}(\infty) < \infty, T_{F}( - \infty) = 0$.\
> 又 $F \in BV\Longrightarrow T_{F}$ bdd by def, 我们得到:
>
> $$
> F \in BV\Longrightarrow T_{F} \pm F\ \text{bounded}
> $$
>
> 而反向 trivial (bounded function 的差仍然 bounded).

> **Remark**
>
> 我们可以通过 $F$ 和 $0$ 的 min, max 取到它的正负部分, 把它按正负部分分解成
>
> $$
> F = F^{+} - F^{-}
> $$
>
> 而这里, Jordan decomposition 则是按照它正负方向上的 variation 来分:
>
> $$
> F = \frac{1}{2}(T_{F} + F) - \frac{1}{2}(T_{F} - F)
> $$
>
> $F$ 的 **positive variation**, **negative variation** 和 total variation 一样也是很形象.
>
> ![Figure 37:[ ]{style="white-space: pre-wrap"}positive/negative variation](.assets/main--figure-raster-036.png){width="50%"}
>
> 我们把
>
> $$
> F_{+}: = \frac{1}{2}T_{F} + F,\quad F_{-}: = \frac{1}{2}T_{F} - F
> $$
>
> (这和正负部分的拆分的记号差别在正负号的上下.)

### corollaries of Jordan decomposition

> **Corollary**
>
> Let $F \in BV$. By Jordan decomposition, $F$ 等于两个 bounded increasing functions 的差.从而我们 **by MDT 得**:
>
> - $F(x + ),F(x - )$ 存在 for all $x$; $F( \pm \infty)$ 也存在.
>
> - $D_{F} = \left\{ {x:F\ \text{disctn at}\ x} \right\}$ 是 at most ctbl 的.
>
> - 定义 $G(x): = F(x + )$, 则 $F,G$ 都 a.e. differentiable 且 $F' = G'$ $m$-a.e.

这里最重要的是:

$$
F \in BV\Longrightarrow F\ \text{a.e. differentiable}
$$

## $NBV AC$ 空间, 以及其上的 FTC for Lebesgue integral \[Fol 3.5, finished\]

### $NBV$ 及其性质

> **Definition: --[[NBV]]--**
>
> For $F:{\mathbb{R}}\rightarrow{\mathbb{C}}$, 我们定义: $F \in NBV$, if $F \in BV$ 且 $F$ right ctn, $F( - \infty) = 0$.

> **Remark**
>
> 这个要求中 $F( - \infty) = 0$ 这一条并不要紧, 因为我们知道 for $F \in BV$, $F( - \infty) = c$ for some const $c$ 是一定的 (因为 $T_{F}( - \infty) = 0$), 因而 right ctn 的 $F \in BV$ 减去一个常数一定是 $NBV$ 的. $F \in NBV$ 的

> **Proposition**
>
> $NBV \subset BV$ 是一个 linear subspace.

> **Remark**
>
> 我们容易发现
>
> $$
> F \in BV\Leftrightarrow T_{F} \in BV\Leftrightarrow F_{+},F_{-} \in BV
> $$
>
> 又因为, $T_{F}( - \infty) = 0$ 对于 $F \in BV$ 总是成立, 且我们知道 $F$ right ctn $\Longrightarrow T_{F}$ right ctn; 于是:
>
> $$
> F \in BV\ \text{and right ctn}\Longrightarrow T_{F} \in NBV\Longrightarrow F_{+},F_{-} \in NBV
> $$

我们已经知道:

$$
\left\{ {\text{positive regular Borel measures on}\ {\mathbb{R}}} \right\} \simeq \left\{ {\text{distribution functions}\ F:{\mathbb{R}}\rightarrow{\mathbb{R}}} \right\}
$$

Notice: 这一点 is achieved by

$$
\begin{matrix}
{F_{\mu}(x) := \{\mu((0,x\rbrack)\quad,x \geq 0} \\
{- \mu((x,0\rbrack),x < 0}
\end{matrix}
$$

等同于:

$$
\mu_{F}((a,b\rbrack) = F(b) - F(a)
$$

注意: positive regular Borel measure 和 distribution functions 都有一个共同点: 它们在 bounded set 上是 bounded 的, 但是整体可以 unbounded.\
而现在我们证明:

### $\left\{ {\text{complex Borel measures on}\ {\mathbb{R}}} \right\} \simeq NBV$

注意: 一个 complex Borel measure 和一个 $F \in NBV$ 都是 finite 的.

> **Theorem: --[[$\left\{ {\text{complex Borel measures on}\ {\mathbb{R}}} \right\} \simeq NBV$]]--**
>
> 1.  对于 $\mathbb{R}$ 上的 complex measure $\mu$, defining
>
>     $$
>     F(x): = \mu(( - \infty,x\rbrack)
>     $$
>
>     则有:
>
>     $$
>     F \in NBV
>     $$
>
> 2.  对于 $F \in NBV$, 一定存在某个 unique complex measure $\mu_{F}$ on $\mathbb{R}$, 使得
>
>     $$
>     \mu(( - \infty,x\rbrack) = F(x)\quad\forall x
>     $$

> **Proof**
>
> (1): 当 $\mu$ 是 positive 的情况下, 是显然的. complex 的情况就是 re/im 部分分别叠加即可.\
> (2): 同样, WLOG 我们可以假设 $F$ 是 real-valued 的.\
> $F \in NBV\Longrightarrow F = F_{+} - F_{-}$, 这两个都是 bounded increasing functions 且 NBV, 从而存在两个 finite signed measure 满足:
>
> $$
> \mu_{\pm}(( - \infty,x\rbrack) = F_{\pm}(x) - F_{\pm}( - \infty)
> $$
>
> 再定义
>
> $$
> \mu: = \mu_{+} - \mu_{-}
> $$
>
> 即可

> **Remark**
>
> 这里其实和 positive regular measure 关联 distribution function 的 way:
>
> $$
> \begin{matrix}
> {F_{\mu}(x) := \{\mu((0,x\rbrack)\quad,x \geq 0} \\
> {- \mu((x,0\rbrack),x < 0}
> \end{matrix}
> $$
>
> 是等价的, 只不过**差了一个常数 $\mu(( - \infty,0\rbrack)$** 而已.\
> 之所以我们这里可以直接定义
>
> $$
> F(x): = \mu(( - \infty,x\rbrack)
> $$
>
> 是因为, **对于 complex measure (thus finite) 而言, 这个常数 $\mu(( - \infty,0\rbrack)$ 一定是 finite 的. 但是对于 regular positive regular measure 而言, 这个常数可能是无穷** (且很可能). 因而对于 regular positive regular measure 我们采用这种迂回的定义方式来避开无穷值, 但是对于 complex measure 我们可以直接爽快地定义
>
> $$
> F(x): = \mu(( - \infty,x\rbrack)
> $$

> **Theorem: --[[$\mu_{F}$ 的 total variation measure $=$ $\mu_{T_{F}}$]]--**
>
> 对于任意的 $F \in NBV$, 我们有:
>
> $$
> \left. |\mu_{F} \middle| = \mu_{T_{F}} \right.
> $$
>
> Specially when $F$ 是 real-valued 情况下, 那么 $\mu_{F}$ 是一个 finite positive measure, 且有
>
> $$
> \mu_{\pm} = \mu_{F_{\pm}}
> $$

Now: Given $F \in NBV$ with associated c.m. $\mu_{F}$, 什么时候 $\mu_{F} \perp m$, 什么时候 $\mu_{F} \ll m$?

> **Theorem: --[[characterization of $\mu_{F} \perp m$ 和 $\mu_{F} \ll m$, for $F \in NBV$]]--**
>
> 对于 $F \in NBV$, 我们已经知道: $F'$ $m$-a.e. 存在, 且 $F' \in L^{1}(m)$.\
> Now we claim, 有:
>
> $$
> \mu_{F} \perp m\Leftrightarrow F' = 0\quad m\ \text{-a.e.}
> $$
>
> 以及
>
> $$
> \mu_{F} \ll m\Leftrightarrow F(x) = \int_{- \infty}^{x}F'(t)\, dt\quad\forall x
> $$

> **Proof**
>
> Let $x \in {\mathbb{R}}$. Applying LDT and LRNT, with $E_{r}: = (x,x + r\rbrack$:
>
> $$
> \lim\limits_{r\rightarrow 0}\frac{\mu_{F}(E_{r})}{m(E_{r})} = \lim\limits_{r\rightarrow 0}\frac{F(x + r) - F(x)}{r} = F'
> $$
>
> 因而 $F'$ 就是这个 RN derivative. 对于
>
> $$
> \mu_{F} = \lambda + \rho
> $$
>
> where $\lambda \perp m,\rho \ll m$, 我们有:
>
> $$
> F(x): = \mu_{F}(( - \infty,x\rbrack) = \lambda(( - \infty,x\rbrack) + \rho(( - \infty,x\rbrack)
> $$
>
> 我们知道, $\mu_{F} \perp m\Leftrightarrow\rho = 0$, 从而 by LDT meets LRNT, we know that
>
> $$
> F' = 0\,\, a.e.
> $$
>
> 而 $\mu_{F} \ll m\Leftrightarrow\lambda = 0$, 从而直接 :
>
> $$
> F(x): = \rho(( - \infty,x\rbrack) = F'dm(( - \infty,x\rbrack) = \int_{- \infty}^{x}F'(t)\, dt
> $$

### $AC$ 及其性质

> **Definition: --[[absolutely continuous function]]--**
>
> 我们定义 $F:{\mathbb{R}}\rightarrow{\mathbb{C}}$ 是 absolutely ctn 的, if 对于任意 $\epsilon > 0$ 都存在 $\delta > 0$ 使得对于任意的 disjoint intervals $(a_{1},b_{1}),\cdots,(a_{N},b_{N})$, 都有:
>
> $$
> \left. \sum\limits_{1}^{N} \middle| F(b_{j}) - F(a_{j}) \middle| < \epsilon\quad\text{whenever}\quad\sum\limits_{1}^{N} \middle| b_{j} - a_{j} \middle| < \delta \right.
> $$

> **Remark**
>
> absolutely continuous 是比 uniformly continuous 严格更强的条件: 我们只考虑 $N = 1$ 而非任意正整数时这个 def 就 reduce 为 uniform ctn.\
> absolutely continuous 表示了一种更强的控制性: 选取任意一些地方的变化足够小的 $x$, 其引发的 $y$ 的变化一定可控. ($y$ 的变化的可控性完全由 $x$ 的变化量决定, 不由 $x$ 的位置决定)\
> 这一看就和 measure 有关系.

> **Definition: --[[absolutely continuous function on a cpt interval]]--**
>
> 我们定义 $F:I\rightarrow{\mathbb{C}}$ 是 absolutely ctn 的, if 对于任意 $\epsilon > 0$ 都存在 $\delta > 0$ 使得对于任意的 disjoint intervals $(a_{1},b_{1}),\cdots,(a_{N},b_{N}) \subset I$, 都有:
>
> $$
> \left. \sum\limits_{1}^{N} \middle| F(b_{j}) - F(a_{j}) \middle| < \epsilon\quad\text{whenever}\quad\sum\limits_{1}^{N} \middle| b_{j} - a_{j} \middle| < \delta \right.
> $$

> **Lemma: --[[$F \in NBV$ abs ctn $\Leftrightarrow$ $\mu_{F} \ll m$]]--**
>
> 对于 $F \in NBV$,
>
> $$
> F \in AC\Leftrightarrow\mu_{F} \ll m
> $$

> **Proof**
>
> 我们 recall, abs ctn 除了 \"$m$ 的 nullsets 也一定是 $\mu_{F}$ 的 null sets\" 之外, 还有另一个 characterization: $\mu_{F} \ll m$ 当且仅当对于任意 $\epsilon > 0$ 都存在 $\delta > 0$ 使得 $\left. m(E) < \delta\Longrightarrow \middle| \mu_{F}(E) \middle| < \epsilon \right.$.\
> 显然, 这个 characterization 和这里的命题有关. 我们发现, $\mu_{F} \ll m\Longrightarrow F \in AC$ 直接 naturally follows from 这个 form. Let $\epsilon > 0$, 存在 $\delta$ 使得 $\left. m(E) < \delta\Longrightarrow \middle| \mu_{F}(E) \middle| < \epsilon \right.$. 那么考虑 $E = \bigsqcup_{1}^{N}(a_{j},b_{j})$ with $m(E) < \delta$, 直接有
>
> $$
> \left. |\mu_{F}(E) \middle| = \sum\limits_{1}^{N} \middle| F(b_{j}) - F(a_{j}) \middle| < \epsilon \right.
> $$
>
> 从而得证.\
> 而反向, 我们考虑 $m(E) = 0$, 并利用 outer regularity 取一个逼近它的 open set (每个是 union of finite disjoint open intervals) seq, 逼近 $E$, with $m(U_{1}) < \delta$. 由 $F \in AC$ 可以得到
>
> $$
> \mu_{F}(U_{j}) \leq \mu_{F}(U_{1}) < \epsilon
> $$
>
> for all $j$, 从而 $\mu_{F}(E) \leq \epsilon$. 从而得证, since $\epsilon$ arbitrary.

### FTC for Lebesgue integral on $\mathbb{R}$: requires $NBV + AC$

> **Corollary**
>
> 如果 $f \in L^{1}(m)$, 那么
>
> $$
> F(x): = \int_{- \infty}^{x}f(t)\, dt \in NBV \cap AC,\quad f = F'\quad a.e.
> $$
>
> Conversely, 如果 $F \in NBV \cap AC$, 那么
>
> $$
> F' \in L^{1}(m),\quad F(x) = \int_{- \infty}^{x}F'(t)\, dt
> $$

> **Remark**
>
> forward 方向即: $f \in L^{1}(m)$ 则它的累积函数 $\int_{- \infty}^{x}f(t)\, dt$ 具有良好的连续性和变差有界性, 从而满足 FTC: a.e. 有
>
> $$
> \frac{d}{dx}(F(x) := \int_{- \infty}^{x}f(t)\, dt) = f(x)
> $$
>
> 并且 for $F(x): = \int_{- \infty}^{x}f(t)\, dt$, 这个函数是 $NBV \cap AC$ 的. 这可以推出:
>
> $$
> F(x) - F(y) = \int_{y}^{x}f(t)\, dt
> $$
>
> backward 方向即: 如果 $F$ 具有良好的连续性和变差有界性, 那么它的导数满足:
>
> $$
> F(x) = \int_{- \infty}^{x}F'(t)\, dt
> $$
>
> 简而言之: **FTC-I for Lebesgue integral 在整个 $\mathbb{R}$ 上都成立当且仅当 $F \in NBV \cap AC$.**

### FTC for Lebesgue integral on a cpt interval: 只需要 $AC$

比起刚才的 FTC-I, FTC-II 的条件要宽松很多, 只需要 $F$ 在它需要被用到的 compact interval 上 AC 即可以. 这是因为, 我们不需要用到 NBV 只需要 BV, 并且在 cpt interval 上, AC 本身就可以推出 BV.

> **Lemma**
>
> 如果 $F \in AC(\lbrack a,b\rbrack)$, 那么 $F \in BV(\lbrack a,b\rbrack)$.\
> 即
>
> $$
> AC(\lbrack a,b\rbrack) \subset BV(\lbrack a,b\rbrack)
> $$

> **Proof**
>
> 这是显然的. 我们看到 $F \in AC(\lbrack a,b\rbrack)$ 的定义: on $\lbrack a,b\rbrack$ we have:
>
> $$
> \left. \sum\limits_{1}^{N} \middle| F(b_{j}) - F(a_{j}) \middle| < \epsilon\quad\text{whenever}\quad\sum\limits_{1}^{N} \middle| b_{j} - a_{j} \middle| < \delta \right.
> $$
>
> 我们不妨考虑 $\epsilon = 1$, 然后可以划分 $\lbrack a,b\rbrack$ into 一个个总长度为 $\frac{\delta}{2}$ 的由 disjoint intervals 构成的块 (补空缺没事), 从而 Bound 住这个划分上的 variation by parition $\left. \sum_{1}^{N_{0}} \middle| F(b_{j}) - F(a_{j})| \right.$. 而我们发现: 这个时候我们不论怎么 fine 这个划分, 每个块的总长度总归是不变的, 从而仍然可以使用原先的 bound.\
> 我们 recall: for total variation, partition 的选取是 greddy 的. 从而这就足以得证.

> **Remark**
>
> 这里没有仔细证明, 但是理解这个 idea 即可. 这表现了 locally, $AC$ 是一个比 $BV$ 更强的条件, 因为 total variation 就是 sup of variations over 所有划分, 而 **$AC$ 的定义正好就是: 无视划分的方法, 只要这个集合的总长度小于 $\delta$, 它上面的 variation by partition 就要小于 $\epsilon$.**

> **Theorem: --[[FTC-II for Lebesgue integral on a cpt interval]]--**
>
> TFAE:
>
> - $F \in AC\lbrack a,b\rbrack$
>
> - $F$ 是 diffble a.e. on $\lbrack a,b\rbrack$ 的, 且 $F' \in L^{1}(\lbrack a,b\rbrack,m)$, 且
>
>   $$
>   F(x) - F(a) = \int_{a}^{x}F'(t)\, dt
>   $$
>
>   **for all $x \in \lbrack a,b\rbrack$**.

> **Proof**
>
> 首先, $F \in AC\lbrack a,b\rbrack\Longrightarrow F \in BV\lbrack a,b\rbrack\Longrightarrow F$ diffble a.e. on $\lbrack a,b\rbrack$.\
> Notice that: 这里我们只考虑 $F|_{\lbrack a,b\rbrack}$, 于是我们可以将其他部分的值都设为 smooth 的, 并 normalize it: 把 $F(x) := 0$ for $x < a$, $F(x): = b$ for $x > b$.\
> 又 $F \in AC\Longrightarrow F$ right ctn for sure, 我们 then have: $F \in NBV$, 从而

### characterization for Lipschitz ctn

> **Theorem: --[[characterization for Lipschitz ctn]]--**
>
> 对于 $F:{\mathbb{R}}\rightarrow{\mathbb{C}}$, we have:
>
> $$
> \left. F\ \text{Lipschitz ctn with const}\ M\Leftrightarrow F \in AC\ \text{and} \middle| F'(x) \middle| \leq M\ \text{a.e.} \right.
> $$

> **Proof**
>
> 见 HW 12.

从而我们得到: ctnity 条件的递推关系:

$$
\text{Lipschitz ctn}\Longrightarrow\text{abs ctn}\Longrightarrow\text{uniformly ctn}\Longrightarrow\text{ctn}
$$

关于连续函数的可导性: Lipschitz ctn 可以推得 a.e. diffble $+$ bounded derivative; abs ctn 可以推得 a.e. diffble 且在 cpt interval 上 derivative $L^{1}$; 而往后的 uniform ctn 则不蕴含可导性条件.

而关于和可导性紧密相关的变差性质: abs ctn 在 bounded interval 上是比 BV, NBV 更强的条件, 而在 $\mathbb{R}$ 上则并不是.

在 $\mathbb{R}$ 上, NBV + AC 的函数可运用 FTC. 而在 bounded area 上 AC 的函数就可以运用 FTC.

