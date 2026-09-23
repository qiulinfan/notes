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
semantic-node-count: 10
source: "notes/math/measure-theory/chapters/07-Lebesgue_measure_on_R^n.typ"
subtitle: Typst-first course notes and worked homeworks
title: "MATH 597: Measure Theory"
---
# Lebesgue measure on ${\mathbb{R}}^{n}$

## Lebesgue measure in ${\mathbb{R}}^{n}$ \[Fol 2.6\]

今日: Lebesgue measure in ${\mathbb{R}}^{n}$ 的

- regularity

- behavior under affine transformation

- behavior under diffeomorphism

### Lebesgue measure in ${\mathbb{R}}^{n}$

这是 product measure 最常见的应用和例子.

> **Definition**
>
> $({\mathbb{R}}^{n},\mathcal{L}^{n},m)$ Lebesgue measure is **completion of** $\left. ({\mathbb{R}}^{n},\mathcal{B}_{{\mathbb{R}}^{n}},m \middle| {}_{borel}) \right.$.

where $\mathcal{B}_{{\mathbb{R}}^{n}} = \mathcal{B}_{\mathbb{R}} \otimes \cdots \otimes \mathcal{B}_{\mathbb{R}}$ $\mathcal{L}^{\mathcal{n}} = \left\{ \text{Leb meas sets} \right\} \supset \mathcal{B}_{{\mathbb{R}}^{n}}$ Write:

$$
\int f dm^{n}\quad
$$

> **Theorem: --[[Fubini-Tonelli for $m^{n}$]]--**
>
> Suppose $f \in L^{+}({\mathbb{R}}^{n})$ or $L^{1}({\mathbb{R}}^{n})$
>
> $$
> \begin{matrix}
> {\int f dm^{n}} & {= \int\cdots\int f(x_{1},\cdots,x_{n}) dx_{1}\cdots dx_{n}} \\
>  & {= \int\cdots\int f(x_{1},\cdots,x_{n}) dx_{n}\cdots dx_{1}}
> \end{matrix}
> $$

> **Example**
>
> Show:
>
> $$
> \int_{0}^{\infty}e^{- sx}\frac{\sin^{2}(x)}{x} dx = \frac{1}{4}\log(1 + 4s^{- 2})
> $$
>
> for $s > 0$, by integrating $e^{- sx}\sin 2xy = f(x,y)$ over the rectangle $x \in (0,\infty),y \in (0,1)$.\
> Sketch: $f \in L^{1}$ (since it is ctn on $\mathbb{R}$) 以及
>
> $$
> \left. |f \middle| \leq e^{- sx},\quad\int_{\mathbb{R}}e^{- sx} < \infty \right.
> $$
>
> 可计算得
>
> $$
> \int_{0}^{1}\sin 2xy dy = \frac{1}{2x}\sin^{2}x
> $$
>
> 而后 compute
>
> $$
> \int_{0}^{1}e^{- sx}\sin 2xy dy
> $$
>
> by integration by part for twice.

### regularities of Lebesgue measure in ${\mathbb{R}}^{n}$

> **Theorem: --[[regularities of $\mathcal{L}^{n}$]]--**
>
> If $E \subset \mathcal{L}^{n}$, 则有:
>
> - **outer regularity**:
>
>   $$
>   m(E) = \inf\left\{ {m(U) \mid U\ \text{open} \supset E} \right\}
>   $$
>
> - **inner regularity**:
>
>   $$
>   m(E) = \sup\left\{ {m(K) \mid K\ \text{compact} \subset E} \right\}
>   $$
>
> - if $m(E) < \infty$, 则对于任意 $\epsilon > 0$, 都存在 disjoint rectangles $R_{1},\cdots R_{N}$ with sides that are open intervals (literally rectangles) s.t.
>
>   $$
>   m(E\Delta\bigcup\limits_{j}R_{j}) < \epsilon
>   $$

> **Proof**
>
> **for (a,b) i.e. regularities:**\
> Fix $\epsilon > 0$. By construction, 存在 finite disjoint union of rectangle $T_{j}$ for each $j$, 使得
>
> $$
> E \subset \bigcup\limits_{j = 1}^{\infty}T_{j}\quad\text{and}\quad\sum\limits_{j = 1}^{\infty}m(T_{j}) \leq m(E) + \epsilon
> $$
>
> By outer regularity of $m^{1}$, 存在 $U_{j} \supset T_{j}$ open rect s.t. $m(U_{j}) \leq m(T_{j}) + \epsilon/2^{j}$ Then:
>
> $$
> E \subset U := \bigcup\limits_{j = 1}^{\infty}U_{j}\quad\text{and}\quad m(U) \leq \sum\limits_{j = 1}^{\infty}m(U_{j})
> $$
>
> Construct $K$ as in dim $1$ (DIY) $\leq m(E) + 2\epsilon$.\
> (完整 Pf 可见 395 笔记, 此略)

> **Proof**
>
> **for (c):**\
> Notation as above.\
>
> $$
> m(E) < \infty\Longrightarrow m(U) < \infty\Longrightarrow m(U_{j}) < \infty\forall j
> $$
>
> Sides of $U_{j}$ are disjoint union of ctbly many open finite intervals.\
> 因而存在 open rectangle $V_{j} \subset U_{j}$ for each $j$ that are finite disjoint union of finite open intervals s.t.
>
> $$
> m(U_{j}\backslash V_{j}) < \epsilon/2^{j}
> $$
>
> Now pick $R_{1},\cdots,R_{N}$ from honest rectangles (即 sides 都是 intervals 的 rectangle) insides $V_{j}$ (DIY). (完整 Pf 可见 395 笔记, 此略)

> **Corollary**
>
> For $f \in L^{1}(m)$, if $f \in L^{1}(m)$ and $\epsilon > 0$ then
>
> - 对于任意 $\epsilon > 0$, 都存在 $\phi = \sum_{j = 1}^{N}c_{j}\chi_{R_{j}}$ s.t.
>
>   $$
>   \left. \int \middle| \phi - f \middle| dm < \epsilon \right.
>   $$
>
>   其中 each $c_{j} \in {\mathbb{C}}$, $R_{j}$ 是 rectangles with sides as finite open intervals.
>
> - 存在 $\phi \in C_{c}^{0}({\mathbb{R}}^{n})$ s.t.
>
>   $$
>   \left. \int \middle| f - \phi \middle| dm < \epsilon \right.
>   $$

> **Proof**
>
> Similar to 1 dim case, 可以证明 $\left\{ \text{all step functions} \right\}$, $C_{c}^{0}({\mathbb{R}}^{n})$ 是 dense subspace of $L^{1}(m)$.

### approximating an open set $E \subset {\mathbb{R}}^{n}$ by countable disjoint interior cubes

对于 $k \in {\mathbb{Z}}$, 令 $\mathcal{Q}_{k}$ be the collection of cubes whose side length is $\frac{1}{2^{k}}$ 且 vertices 在 lattice $(2^{- k}{\mathbb{Z}})^{n}$ 中, 即精细度为 $\frac{1}{2^{k}}$ 的网格中的所有 cubes.\

![Figure 20:[ ]{style="white-space: pre-wrap"}](.assets/main--figure-raster-020.png){width="40%"}

对于 $E \subset {\mathbb{R}}^{n}$, 我们定义:

$$
\underset{¯}{A}(E,k) := \bigcup\left\{ {Q \in \mathcal{Q}_{\mathcal{k}}:Q \subset E} \right\},\quad\bar{A}(E,k) := \bigcup\left\{ {Q \in \mathcal{Q}_{\mathcal{k}}:Q \cap E \neq \varnothing} \right\}
$$

即, 一个是被包含在 $E$ 中的所有格子, 一个是最小的覆盖 $E$ 的所有格子. 并定义:

$$
\underset{¯}{A}(E): = \bigcup\limits_{k = 1}^{\infty}\underset{¯}{A}(E,k),\quad\bar{A}(E): = \bigcup\limits_{k = 1}^{\infty}\bar{A}(E,k)
$$

以及

$$
\bar{\kappa}(E) := \lim\limits_{k\rightarrow\infty}m(\underset{¯}{A}(E,k)),\quad\underset{¯}{\kappa}(E) := \lim\limits_{k\rightarrow\infty}m(\bar{A}(E,k))
$$

By CFB, CFA 容易得到:

$$
\bar{\kappa}(E) = m(\bar{A}(E)),\quad\underset{¯}{\kappa}(E) = m(\underset{¯}{A}(E))
$$

Note: 这里的 $\underset{¯}{A}(E,k),\bar{A}(E,k),\underset{¯}{A}(E),\bar{A}(E)$ 都是 union of cubes with disjoint interiors.

> **Lemma: --[[approximate an open set by disjoint interior cubes]]--**
>
> Let $E \subset {\mathbb{R}}^{n}$ be open.\
> Claim: $E = \underset{¯}{A}(E)$

> **Proof**
>
> Folland 2.43.

> **Corollary**
>
> $E \subset {\mathbb{R}}^{n}$ 是 Lebesuge measurable 的 $\Leftrightarrow$ $\bar{\kappa}(E) = \underset{¯}{\kappa}(E)$

### behavior under affine transformation

Affine transformation 即 linear transformation + translation.

### Lebesgue measure and integral is invariant under translation

对于 $a \in {\mathbb{R}}^{n}$, 一个 translation $t:{\mathbb{R}}^{n}\rightarrow{\mathbb{R}}^{n},x\mapsto x + a$ 是 ctn 的并且

$$
t_{a}^{- 1} = t_{- a}
$$

> **Theorem: --[[Lebesgue measure and integral is invariant under translation]]--**
>
> \(a\) 任取 $a \in {\mathbb{R}}^{n}$,
>
> $$
> E \in \mathcal{L}^{n}\Longrightarrow t_{a}(E) \in \mathcal{L}^{n}\quad\text{and}\quad m(t_{a}(E)) = m(E)
> $$
>
> \(b\) if $f:{\mathbb{R}}^{n}\rightarrow{\mathbb{C}}$ is Leb measurable, then so is $f \circ t_{a}$.\
> More, if $f \in L^{+}$ or $f \in L^{1}$, then $f \circ t_{a} \in L^{1}$ 并且
>
> $$
> \int(f \circ t_{a}) dm = \int f dm
> $$

> **Remark**
>
> 集合的 measure 以及 measurable function 的积分在 translation 下保持不变.

> **Proof**
>
> (Folland 2.42)\
> (a) $t_{a}$ ctn $\Longrightarrow$ $t_{a}(\mathcal{B}_{{\mathbb{R}}^{n}}) \subset \mathcal{B}_{{\mathbb{R}}^{n}}$, 因而 $t_{a}(\mathcal{B}_{{\mathbb{R}}^{n}}) = \mathcal{B}_{{\mathbb{R}}^{n}}$ $E$ rectangle, so $E = E_{1} \times \cdots \times E_{n}$, each in $\mathcal{B}_{\mathbb{R}}$ $m(E) = \prod_{1}^{n}m(E_{i})$, $t_{a}(E) = \prod t_{a_{i}}(E_{i})$ 因而
>
> $$
> m(t_{a}(E)) = \prod m(t_{a_{i}}(E_{i})) = \prod m(E_{i}) \subset m(E)
> $$
>
> BY HK uniqueness, get
>
> $$
> m(t_{a}(E)) = m(E)\quad\forall E \in \mathcal{B}_{{\mathbb{R}}^{n}}
> $$
>
> if $N \subset {\mathbb{R}}^{n}$ subnull set, so is $t_{a}(N)$. 因而
>
> $$
> m(t_{a}(E)) = m(E)\quad\forall E \in \mathcal{L}^{n}
> $$
>
> \(b\) Pick $B \in \mathcal{B}_{\mathbb{C}}\Longrightarrow f^{- 1}(B) \in \mathcal{L}$. 因而 $f^{- 1}(B) = E \cup N$, $E \in \mathcal{B}_{{\mathbb{R}}^{n}}$, $N$ null set 因而
>
> $$
> \begin{matrix}
> {(f \circ t_{a})^{- 1}(B)} & {= t_{a}^{- 1}(f^{- 1}(B))} \\
>  & {= t_{a}^{- 1}(E) \cup t_{a}^{- 1}(N)\text{(one Borel, one null)}} \\
>  & {= t_{- a}(f^{- 1}(B))}
> \end{matrix}
> $$
>
> 当 $f = \chi_{E}$ 时, 积分 reduce to measure, 即 (a); 因而
>
> $$
> \int(f \circ t_{a}) dm = \int f dm
> $$
>
> also holds for simple $f$, by linearity.\
> 从而 by def, 也 hold for $f \in L^{+}$ 和 $f \in L^{1}$.

### Lebesgue measure and integration is scaled $|\det T|$ under linear map

> **Theorem: --[[Lebesgue measure and integration is scaled $|\det T|$ by linear map]]--**
>
> For $T \in GL(n,{\mathbb{R}})$ (即 linear map $T:{\mathbb{R}}^{n}\rightarrow{\mathbb{R}}^{n}$ 且可逆) (a) 如果 $f:{\mathbb{R}}^{n}\rightarrow{\mathbb{C}}$ is Lebesgue measurable, then so is $f \circ T$.\
> Moreover if $f \in L^{+}$ or $f \in L^{1}$, then $f \circ T \in L^{+}$, $f \circ T \in L^{1}$ respectively. And
>
> $$
> \left. \int f dm = \middle| \det T \middle| \int f \circ T dm \right.
> $$
>
> \(b\)
>
> $$
> \left. E \in \mathcal{L}^{n}\Longrightarrow T(E) \in \mathcal{L}^{n}\quad\text{and}\quad m(T(E)) = \middle| \det T \middle| m(E) \right.
> $$

> **Proof**
>
> Note: 对于 $T,S \in GL(n,{\mathbb{R}})$, 如果
>
> $$
> \left. \int f = \middle| \det T \middle| \int f \circ T\quad\text{and}\quad\int f = \middle| \det S \middle| \int f \circ S \right.
> $$
>
> , 那么则有
>
> $$
> \left. \int f = \middle| \det(T \circ S) \middle| \int f \circ (T \circ S)(x) \right.
> $$
>
> which trivially follows from computation. (and $\det(S \circ T) = \det S \times \det T$ for any linear map $S,T$.)\
> recall that:
>
> > **Lemma: --[[row reduction]]--**
> >
> > **任意 invertible linear map 可以被拆分为 finite 个 elementary linear maps.** ( $T_{1}$: scale 一行; $T_{2}$: 交换两行; $T_{3}$: 一行加上另一行的倍数).
>
> 于是, 我们只需要 prove the theorem for elementary linear maps 就可以了. 而 elementary linear maps 的 cases 则 easily follows from Fubini-Toneilli.\
> **Let $f$ be Borel measurable.**\
> 对于 $T_{2}$: 交换两行 (其 det 为 −1), 我们改变 the order of integration for two coordinates, 因而 integration 不变;\
> 对于 $T_{1}$: scale 一行 by const $c$ (其 det 为 $c$), 我们在一个 coordinate 上积分值翻 $c$ 倍, 因而整体积分值翻 $c$ 倍. 这里用到了 ${\mathbb{R}}\rightarrow{\mathbb{R}}$ 的 Lebesgue integral 的已证明结论:
>
> $$
> \left. \int f(t) dt = \middle| c \middle| \int f(ct) dt \right.
> $$
>
> 对于 $T_{3}$: 一行加上另一行的倍数 (其 det为 1), 我们 recall ${\mathbb{R}}\rightarrow{\mathbb{R}}$ 的 Lebesgue integral 的 translation invariance:
>
> $$
> \int f(t + a) dt = \int f(t) dt
> $$
>
> 因而整体积分值不变.\
> 从而**我们证明了 (a) for Borel measurable $f$**.\
> 从而, (b) for Borel set $E$ trivially follows from (a), by taking indicator function.\
> 而对于 (b) 的 $E$ Lebesgue measurable case, $E = B \cup N$ for some Borel set $B$ 以及 subnull set $N$, 从而 $m(E) = m(B)$.\
> **从而 (b) proved.**\
> 而 (a) 的 $f$ Lebesugue measurable 的 case, by def **reduces to $f = \chi_{E}$ where $E$ is Lebesgue measurable set**, 于是 follows from the (b).

### Lebesgue measure is invariant under rotation (and reflection)

> **Corollary: --[[Lebesgue measure is invariant under rotation]]--**
>
> 对于 rotation 和 reflection (即 orthogonal transformation), 即 $TT^{\ast} = I_{n}$ 的 linear map $T$, 有 $m(T(E)) = m(E)$.

> **Proof**
>
> $\left. TT^{\ast} = I_{n}\Longrightarrow \middle| \det(T) \middle| = 1 \right.$.

> **Remark**
>
> $A \in GL(n,{\mathbb{R}})$ 为一个 orthogonal transformation (可写作 $A \in O(n)$) 的定义是它 preserve norm.\
> 我们知道, $A \in O(n)$ 当且仅当 $A^{\ast} = A^{- 1}$.\
> 有两种情况: rotation ($\det A = 1$) 和 reflection ($\det A = - 1$).\

## Change of Variable Thm on ${\mathbb{R}}^{n}$\[Fol 2.6, finished\]

### COV

> **Theorem: --[[general change of variable theorem]]--**
>
> Suppose $\Omega \subset {\mathbb{R}}^{n}$ **open**, $G:\Omega\rightarrow{\mathbb{R}}^{n}$ 为一个 $C^{1}$ **diffeomorphism**.\
> Claim:
>
> - 如果 $f:G(\Omega)\rightarrow{\mathbb{C}}$ 上是 Lebesgue measurable 的, 则 $f \circ G:\Omega\rightarrow{\mathbb{C}}$ 也是 Lebesgue measurable 的. 并且, 如果 $f \in L^{+}(G(\Omega),m)$ 或者 $f \in f \in L^{1}(G(\Omega),m)$, 则有
>
>   $$
>   \left. \int_{G(\Omega)}f dm = \int_{\Omega}(f \circ G)\, \middle| \det DG \middle| dm \right.
>   $$
>
> - 如果 $E \subset \Omega$ 是 Lebesgue measurable set, 则 $G(E)$ 也是 Lebesgue measurable set, 并且
>
>   $$
>   \left. m(G(E)) = \int_{E} \middle| \det DG \middle| dm \right.
>   $$

> **Proof**
>
> 首先, 类似于上一个 lecture 中的各个证明, 只需要 prove for Borel measurable functions 和 Borel sets 就可以了. 我们分为五步证明.\
> **Step 1: 我们首先证明, 在 $E$ 为一个 closed cube 的情况下** (我们转而用 $Q$ 来表示它), 有
>
> $$
> \left. m(G(Q)) \leq \int_{Q} \middle| \det DG(x) \middle| dx \right.
> $$
>
> **Proof of Step 1**:
>
> $$
> Q = \left\{ x: \middle| \middle| x - a \middle| \middle| {}_{\sup} \leq h \right\}
> $$
>
> By MVT 容易得到, 对于任意的 $x \in Q$, 有:
>
> $$
> \left. | \middle| G(x) - G(a) \middle| \middle| {}_{\sup} \leq h \cdot (\sup\limits_{y \in Q} \middle| \middle| DG(y) \middle| \middle| {}_{\sup}) \right.
> $$
>
> (by bounding each entry.)\
> 从而, 我们发现 $G(Q)$ **是 contained in 一个边长是 $\left. h \cdot \sup_{y \in Q} \middle| \middle| DG(y) \middle| |_{\sup} \right.$ 的 cube 的**.\
> 从而有:
>
> $$
> \left. m(G(Q)) \leq (\sup\limits_{y \in Q} \middle| \middle| DG(y) \middle| \middle| )^{n}m(Q) \right.
> $$
>
> 在 invertible $T$ 的作用下, $T^{- 1} \circ G$ 仍然是一个 diffeomorphism, 从而
>
> $$
> \begin{matrix}
> {m(G(Q))} & \left. = \middle| \det T \middle| m(T^{- 1}(G(Q))) \right. \\
>  & \left. \leq \middle| \det T \middle| (\sup\limits_{y \in Q} \middle| \middle| T^{- 1}DG(y) \middle| \middle| )^{n}m(Q) \right.
> \end{matrix}
> $$
>
> Let $\epsilon > 0$.\
> 由于 $DG$ 是 continuous 的, $DG(x)^{- 1}DG(y)$ 也是 ctn 的 (从而 **uni.ctn.** in the compact cube), 我们对于任意 $\epsilon > 0$ 都可以找到一个 $\delta > 0$ 使得 对于任意的 $y,z \in Q$ s.t. $\left. | \middle| y - z \middle| \middle| {}_{\sup} \leq \delta \right.$, 都有
>
> $$
> \left. | \middle| DG(x)^{- 1}DG(y) \middle| \middle| \leq 1 + \epsilon \right.
> $$
>
> 于是我们可以把 $Q$ 切分成 interior disjoint 的 closed subcubes $Q_{1},\cdots,Q_{N}$, 标记其各个中心为 $x_{1},\cdots x_{N}$, 其每个的 side length 都至多为 $\delta$, 从而有 $G(Q) \subset \bigcup_{j = 1}^{N}m(G(Q_{j}))$. 于是
>
> $$
> \begin{matrix}
> {m(G(Q))} & {\leq \sum\limits_{j = 1}^{N}m(G(Q_{j}))} \\
>  & \left. \leq \sum\limits_{j = 1}^{N} \middle| \det DG(x_{j}) \middle| \,(\sup\limits_{y \in Q_{j}} \middle| \middle| DG(x_{j})^{- 1}DG(y) \middle| \middle| {}_{\sup})^{n}m(Q_{j}) \right. \\
>  & \left. \leq (1 + \epsilon)\sum\limits_{j = 1}^{N} \middle| \det DG(x_{j}) \middle| \, m(Q_{j}) \right. \\
>  & \left. \rightarrow(1 + \epsilon)\, \middle| \det DG(x) \middle| \, m(Q)\quad\text{as}\quad\delta\rightarrow 0 \right. \\
>  & \left. \rightarrow \middle| \det DG(x) \middle| \, m(Q) = \int_{Q} \middle| \det DG(x) \middle| dm\quad\text{as}\quad\epsilon\rightarrow 0 \right.
> \end{matrix}
> $$
>
> 证明了这一结论, 我们就完成了这个 proof 的一大半.\
> \
> **Step 2:** Prove
>
> $$
> \left. m(G(U)) \leq \int_{U} \middle| \det DG(x) \middle| dm \right.
> $$
>
> for open $U$ 的 case.\
> **Proof of Step 2**: Directly follows from 上一 lecture 的这个 statement: 任意 open $E \subset {\mathbb{R}}^{n}$ 都是 countable disjoint interior cubes 的 union.\
> \
> **Step 3:** Prove
>
> $$
> \left. m(G(E)) \leq \int_{E} \middle| \det DG(x) \middle| dm \right.
> $$
>
> for $E$ Borel 的 case.\
> **Proof of Step 3:** Apply step 2 的结论, 使用 MCT for $L^{+}$ case, 使用 DCT for $L^{1}$ case. 至此, 我们完成了 (b) 的证明的一个方向, 由此可以完成 (a) 的不等式的一个方向:\
> \
> **Step 4**: 证明
>
> $$
> \left. \int_{G(\Omega)}f dm \leq \int_{\Omega}f \circ G\, \middle| \det DG(x) \middle| dm \right.
> $$
>
> simple function 的 case reduces to measure, 而 $L^{+}$ 的 case follows from MCT.\
> \
> **Step 5**: 不等式的另一方向: 其实很简单, 因为 diffeomorphism 的 inverse 仍然是 diffeomorphism, 所以 apply inverse 可得.\
> 注意, 这只是 for Borel $E$ 和 $L^{+}$ Borel measurable $f$, 不过我们容易接着推导出 Lebesgue measurable $E$ 的情况和 $f \in L^{+}(m)$ 的情况; 从而再接着推导出 $f \in L^{1}(m)$ 的情况.

> **Remark**
>
> 这个证明写得比较潦草. 详情见 Folland 2.47.\
> 但是大概思路都比较简单. 其中比较困难的是 Step 1 中的各种 error bounds. 很麻烦.\

### application of COV: polar coordinate

> **Definition: --[[mapping from Euclidean coord to polar coord]]--**
>
> 我们定义:
>
> $$
> \Phi:{\mathbb{R}}^{n}\backslash\left\{ 0 \right\}\rightarrow\ (0,\infty) \times S^{n - 1}
> $$
>
> by:
>
> $$
> x\mapsto(r \in {\mathbb{R}},\theta \in {\mathbb{S}}^{{\mathbb{n}} - \mathbb{1}})
> $$
>
> 其中,
>
> $$
> \left. r = \middle| x \middle| ,\quad\theta = \frac{x}{|x|} \in S^{n - 1} \right.
> $$

这是一个很直观的坐标变换, 即一个 diffeomorphism.\

> **Definition: --[[a Borel measure on $(0,\infty) \times S^{n - 1}$]]--**
>
> 我们定义
>
> $$
> m_{\ast}(E) := m(\Phi^{- 1}(E))
> $$

这是一个通过坐标变换的 preimage 的 Borel measure 定义的新的 Borel measure.\

> **Theorem**
>
> Define Borel measure $\rho$ on $(0,\infty)$ by:
>
> $$
> \rho(E) = \int_{E}r^{n - 1} dr
> $$
>
> 存在 unique 的 Borel measure $\sigma_{n - 1}$ on $S^{n - 1}$, 使得 for Borel measurable $f:{\mathbb{R}}^{n}\rightarrow{\mathbb{C}}$ 且 $f \geq 0$ or $f \in L^{1}(m)$, 有
>
> $$
> \begin{matrix}
> {\int_{{\mathbb{R}}^{n}}f(x) dm} & {\overset{COV}{=}\int_{(0,\infty) \times S^{n - 1}}f(r\theta) dm_{\ast}} \\
>  & {\overset{Fubini}{=}\int_{0}^{\infty}\int_{S^{n - 1}}f(r\theta) d\sigma\, d\rho} \\
>  & {= \int_{0}^{\infty}r^{n - 1}\int_{S^{n - 1}}f(r\theta) d\sigma\, dr}
> \end{matrix}
> $$

> **Proof**
>
> 见 Folland 2.49.

> **Remark**
>
> 这里 $S^{n - 1}$ 的 unique measure $\sigma$ 的计算公式是:
>
> $$
> \sigma(E) = n \cdot m(\Phi^{- 1}((0,1) \times E)) = n \cdot m\left\{ {r\theta \mid 0 < r \leq 1,\theta \in E} \right\}
> $$
>
> 这很容易直观:
>
> ![Figure 21:[ ]{style="white-space: pre-wrap"}](.assets/main--figure-raster-021.png){width="40%"}
>
> 这里 $n = 2$, **$m(E_{1})$ 表示的单位圆下, $E$ 的弧长下的扇形面积, 而 $\sigma(E)$ 表示 $E$ 的 arc length.**\
> (类比, 在 $n = 3$ 的情况下, $m(E_{1})$ 表示单位球下, $E$ 的球面下的锥形体积, $\sigma(E)$ 表示 $E$ 在 $S^{2}$ 中的球面面积.)

> **Remark**
>
> 对于 $E = S^{n - 1}$ 即全集的情况 , 这个 measure 有固定的计算公式.
>
> $$
> \sigma(S^{n - 1}) = \frac{2\pi^{\frac{n}{2}}}{\Gamma(\frac{n}{2})}
> $$

> **Example**
>
> $\sigma(S^{1}) = 2\pi$, $\sigma(S^{2}) = 4\pi$.

> **Example**
>
> 使用 polar coordinate 计算积分:
>
> $$
> \int_{{\mathbb{R}}^{n}}e^{- a|x|^{2}} dx = (\frac{\pi}{a})^{\frac{n}{2}}
> $$
>
> 这是因为:
>
> $$
> I_{2} = 2\pi\int_{0}^{\infty}re^{- ar^{2}} dr = \frac{\pi}{a}
> $$
>
> 而由于
>
> $$
> e^{- a|x|^{2}} = \prod\limits_{j = 1}^{n}e^{- ax_{j}^{2}}
> $$
>
> 我们得到
>
> $$
> I_{n} = (I_{1})^{n}
> $$
>
> 特别地,
>
> $$
> I_{2} = I_{1}^{2},\quad\text{thus}\ I_{1} = (\frac{\pi}{a})^{\frac{1}{2}}
> $$

