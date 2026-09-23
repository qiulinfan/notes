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
source: "notes/math/measure-theory/chapters/03-distribution-function-与-lebesgue-stieltjes-measures.typ"
subtitle: Typst-first course notes and worked homeworks
title: "MATH 597: Measure Theory"
---
# distribution function 与 Lebesgue-Stieltjes measures

## distribution function and Borel measures on $\mathcal{B}({\mathbb{R}})$ \[Fol 1.5\]

This lecture: 1. distribution function 是 increasing 且 right continuous 的, 2. 任意 increasing 且 right continuous 的函数可以作为 distribution function, 用它来构造它对应的 measure.

### distribution function of a locally finite (i.e. regular) Borel measure

> **Definition: --[[distribution function of $\mu$]]--**
>
> 给定一个 **locally finite (finite on all compact sets)** 的 **Borel measure** on $\mathbb{R}$ (即 $({\mathbb{R}},\mathcal{B}(bR),\mu)$), 我们定义:
>
> $$
> \begin{matrix}
> {F_{\mu}(x) := \{\mu((0,x\rbrack)\quad,x \geq 0} \\
> {- \mu((x,0\rbrack),x < 0}
> \end{matrix}
> $$
>
> 这个函数被称为 $\mu$ 的 **distribution function.**

> **Remark**
>
> 一个 **locally finite (finite on all compact sets)** 的 Borel measure on ${\mathbb{R}}^{n}$ 被称为一个 regular measure.\
> 在 Ch 3 中, 我们将在讨论 ${\mathbb{R}}^{n}$ 上 regular measure 对于 Lebesgue measure 的 derivative.

> **Proposition**
>
> 容易发现: $F$ 是 $\mu$ 的 distribution function, 当且仅当 $\mu((a,b\rbrack) = F(b) - F(a)$, 任取这样的 interval.

这两个定义是等价的.

> **Theorem: --[[distribution function is increasing and right ctn]]--**
>
> 对于 $\mathbb{R}$ 上的任意 locally finite Borel measure $\mu$, 其 distribution function $F_{\mu}$ 都是 increasing 且 right continuous 的. (right ctn:
>
> $$
> F_{\mu}(a) = \lim\limits_{x\rightarrow a^{+}}f(x)
> $$

> **Proof**
>
> increasing: trivially by monotonicity of measure.\
> right continuous: follows from measure 的 ctnity. 正轴上: $\mu((0,x + 1/n\rbrack)$ 的 sequence 极限为 $\mu(0,x\rbrack)$, by ctn from above; 负轴上, $\mu((x + 1/n,0\rbrack)$ 的 sequence 极限为 $\mu((x,0\rbrack)$, by ctn from below.\

> **Remark**
>
> **Note: distribution function 是 right ctn 的, 但却未必是 left ctn 的.** 因为我们构造离散的 measure, 使得这个 distribution function 具有间断点. 这样导致了左不连续. 反例: 例如 atomic measure.

### any increasing and right ctn function is a unique distribution function

> **Definition: --[[h-interval]]--**
>
> 我么定义形如 $(a,b\rbrack$, $( - \infty,b\rbrack$ 的 $\mathbb{R}$ 的子集, 以及 $\varnothing$, $\mathbb{R}$, 为 h-intervals.

h-intervals 即**所有的左开右闭区间.**

![Figure 6:[ ]{style="white-space: pre-wrap"}](.assets/main--figure-raster-006.png){width="20%"}

> **Lemma: --[[h-intervals form an algebra and generate borel set]]--**
>
> $$
> \mathcal{A}_{0} := \left\{ \text{finite (disjoint) unions of h-intervals} \right\}
> $$
>
> 是一个 algebra, 并且
>
> $$
> < \mathcal{A}_{0} > = \mathcal{B}({\mathbb{R}})
> $$

> **Proof**
>
> trivial. follows from lec 2 的 generating set of borel set on $\mathbb{R}$.

> **Theorem: --[[**任意 increasing 且 right ctn 函数都是某个 regular Borel measure 的 distribution 函数**]]--**
>
> 取 lemma 中的 $\mathcal{A}_{0}$. 对于**任意的 increasing 且 right ctn 的 $F:{\mathbb{R}}\rightarrow{\mathbb{R}}$,** 我们 define $\mu_{0}:\mathcal{A}_{0}\rightarrow\lbrack 0,\infty\rbrack$, by:
>
> $$
> \mu_{0}(\bigcup\limits_{i = 1}^{n}(a_{i},b_{i}\rbrack) = \sum\limits_{i = 1}^{n}(F(b_{i}) - F(a_{i}))
> $$
>
> 并规定 $\mu_{0}(0) = 0$, 以及 $F(\infty) = \lim_{x\rightarrow\infty}F(x)$\
> , **Claim 1: $\mu_{0}$ 是一个 $\mathcal{A}_{0}$ 上的 $\sigma$-finite premeasure.**\
> **Claim 2: (by Hahn-Kolmogrov) $\mu_{0}$ extend to a locally finite Borel measure $\mu_{F}$**, 并且 $\mu_{F}((a,b\rbrack) = F(b) - F(a)$ for any h-interval, i.e. $F$ 是 $\mu_{F}$ 的 distribution function.\
> Claim 3: **$F$ 是 $\mu_{F}$ 的唯一 distribution function up to constant term**, in the sense that 任意其他的 such function $G$ 如果也是$\mu_{F}$ 的 distribition function, 则必然有 $F - G$ 为 const.

> **Proof**
>
> Claim1
>
> 1.  well-definedness of $\mu_{0}$: 对于两个结果一样的 union, finding common refinement 即可.
>
> 2.  $\mu_{0}(\varnothing) = 0$: 因为 $\varnothing$ 就是 $(a,a\rbrack$.
>
> 3.  finite additivity: trivial.
>
> 4.  $\sigma$-finiteness: each $\mu_{0}((n,n + 1\rbrack) < \infty$
>
> 5.  **ctbl additivity: nontrivial, 下面详细展开.**
>
> Suppose $A_{1},A_{2},\cdots$ 是 seq of disjoint h-intervals in $\mathcal{A}_{0}$. Let $A := \bigsqcup_{i}A_{i}$.\
> WTS: $\mu_{0}(A) = \sum_{i}\mu_{0}(A_{i})$.\
> (1) WTS $\mu_{0}(A) \geq \sum_{i}\mu_{0}(A_{i})$ 这个 direction easy. We define $B_{n} := \bigsqcup_{1}^{n}A_{i}$, 由 finite additivity 得到: $\mu_{0}(B_{n}) = \sum_{i}^{n}\mu_{0}(A_{i})$, 从而
>
> $$
> \mu_{0}(A) = \mu_{0}(B_{n}) + \mu_{0}(A\backslash B_{n}) \geq \mu_{0}(B_{n})
> $$
>
> for each $n$, 由于这是一个 numerical seq, 可以 conclude $\mu_{0}(A) \geq \sum_{i}\mu_{0}(A_{i})$. (2) WTS $\sum_{i}\mu_{0}(A_{i}) \geq \mu_{0}(A)$.\
> 这个 direction 较难, 需要用到 $\epsilon/2^{n}$ 的 argument.\
> For simplicity, 我们只需要考虑 $A_{i} = (a_{i},b_{i}\rbrack$ 的 interval 形式, 其他形式 can trivially prove. 并且, 由于 $\mathcal{A}_{0}$ 中任何一个元素至多只有 finite 个离散的 h-intervals, 我们 **suffice to assume $A$ 是一个 h-interval.**\
> 从而, 我们也可以 denote $A = (a,b\rbrack$.\
> Let $\epsilon > 0$.\
> By $F$ 的 increasing 和 right ctn, 存在 $\delta,\delta_{i}$ s.t.
>
> $$
> F(a + \delta) - F(a) \leq \epsilon
> $$
>
> 同样地, 对于每个 $A_{i}$. 我们都可以找到 $\delta_{i}$ 使得
>
> $$
> F(b_{i} + \delta_{i}) - F(b_{i}) \leq \frac{\epsilon}{2^{i}}
> $$
>
> 于是 $(a_{i},b_{i} + \delta_{i})_{i \in {\mathbb{N}}}$ 就形成了一个 open covering for $\lbrack a + \delta,b\rbrack$. By cptness, 存在一个 finite subcovering $(a_{i},b_{i} + \delta_{i})_{1 \leq i \leq N}$.\
> By relabelling, **我们 suppose $A_{i}$ 是从左到右排序的. 于是每个 $b_{i} + \delta_{i}$ 都处于下一个 $A_{i + 1}$ 之内.**
>
> ![Figure 7:[ ]{style="white-space: pre-wrap"}](.assets/main--figure-raster-007.png){width="20%"}
>
> 从而:
>
> $$
> \begin{matrix}
> {\mu_{0}(A)} & {\leq F(b) - F(a + \delta) - \epsilon} \\
>  & {\leq F(b_{N} + \delta_{N}) - F(a_{1}) + \epsilon} \\
>  & {= F(b_{N} + \delta_{N}) - F(a_{N}) + \sum\limits_{1}^{N - 1}(F(a_{i + 1}) - F(a_{i})) + \epsilon} \\
>  & {\leq F(b_{N} + \delta_{N}) - F(a_{N}) + \sum\limits_{1}^{N - 1}(F(b_{i} + \delta_{i}) - F(a_{i})) + \epsilon} \\
>  & {< \sum\limits_{1}^{N}(F(b_{i}) - A(a_{i}) + \frac{\epsilon}{2^{i}}) + \epsilon} \\
>  & {< \sum\limits_{1}^{\infty}\mu_{0}(A_{i}) + 2\epsilon}
> \end{matrix}
> $$
>
> Claim 2, 3 都 directly follows from Hahn-Komogrov Thm.

> **Remark**
>
> 这一证明实则简单. 关键的步骤是 1. 简化问题为 union 成一个 h-interval; 2. 通过 cptness 取 finite covering；3. 对每个 $A_{i}$ 取一个 $\epsilon/2^{i}$ 的小 cover, 最后可以被 $\epsilon$ bound.

> **Example**
>
> 我们已经证明, 从任意的 increasing 且 right ctn 的函数都可以构造出一个以其为 distribution function 的 locally finite Borel measure on $\mathbb{R}$, 因而我们简称这样的函数都叫做 distribution function.\
> 以下为两个 distribution function 的例子:\
> 1. Heaviside function
>
> $$
> \begin{matrix}
> {H(x) = \{ 1,x \geq 0} \\
> {0,x < 0}
> \end{matrix}
> $$
>
> 2\. 我们将 $\mathbb{Q}$ 以某种形式列出: ${\mathbb{Q}} = \left\{ {q_{1},q_{2},\cdots} \right\}$ 而后定义:
>
> $$
> F(x) := \sum\limits_{i = 1}^{\infty}2^{- n}H(x - r_{n}) \in (0,1)
> $$
>
> 这个函数通过有理数的次序给每个有理数赋了一个\"weight\", 并对于每个$x$, 把所有有理数分为 $> x$ 和 $\leq x$ 的两部分, 只把 $\leq x$ 的那部分有理数的权重算进 $F(x)$. 于是 $x$ 越大, 被算进 $F(x)$ 的有理数越多, $F(x)$ 就越大. (虽然每个有理数的权重是乱的). 这个函数在每一点上都 discrete.\
> 这个过程可推广, 不取 $\mathbb{Q}$ 而取任意的 countable sets in $\mathbb{R}$ 作为参照.

本 lec 总结: 通过直接定义 distribution function 来得到的 measure, 实则就是不同于直接取 interval 长度, 我们隐性地给每个点一个 mass (类似概率密度), 从而把区间的长度中每一个点加上一个权重. 最后形成一个不一定均匀的 measure. 这个 distribution 的分布曲线决定了这个 measure.

## Lebesgue-Stieltjes measure \[Fol 1.5, finished\]

给定一个 increasing 且 right ctn 的函数 $F$, 我们已经展示了用它作为 distribution function 来 induce 出一个 regular Borel measure $\mu_{F}$ on $\mathcal{B}({\mathbb{R}})$.\
在构造这个函数时, 我们使用的是用 premeasure $\mathcal{A}_{0}$ (of all finite unions of h-intervals), 使用 Hahn-Kolmogrov 来 induce outer measure $\mu_{F}^{\ast}$, 再把 restrict 它到 $< \mathcal{A}_{0} >$, 即 $\mathcal{B}({\mathbb{R}})$ 上, 获得的 measure. **这一个 measure 是一个 Borel measure, 但是它并不 complete.**\
recall in lec 6: 我们其实可以 complete 这个 measure, 只需要在第二步, 用 premeasure $\mathcal{A}_{0}$ induce 出 outer measure 后, 不要 restrict 它到 $\mathcal{B}({\mathbb{R}})$ 上, 而是 restrict 到取 $\mathcal{M}_{\mu} := \{\text{all}\ \mu_{F}^{\ast}\ \text{-measurable set\}}$ 上, 得到的就是 completion of $\mu_{F}$, 即

$$
({\mathbb{R}},\mathcal{M}_{\mu},\bar{\mu_{F}})
$$

其中, $\mathcal{A}^{\ast}$ 是 $< \mathcal{A}_{0} >$ 即 $\mathcal{B}({\mathbb{R}})$ 的 proper super set. **我们把这个 completed measure 叫做 Lebesgue Stieltjes measure associated with $F$, 并用 $\mu_{F}$ 来指代它. (刚才, 我们把未完备的 measure 叫做 $\mu_{F}$, 但现在我们不再使用这个 measure, 而是使用它的 completion, 并转而称它的 completion ($\bar{\mu_{F}}$) 为 $\mu_{F}$.)**

$$
\text{Regular Borel measure}\overset{\text{completion}}{\rightarrow}\text{LS measure}
$$

> **Definition: --[[Lebesgue-Stieltjes measure associated with $F$]]--**
>
> 给定一个 distribution function $F$, 我们使用它来定义 h-intervals 的 premeasure $\mu_{0}$, 并把这个 premeasure induce 出的 outer measure $\mu^{\ast}$ 限制在
>
> $$
> \mathcal{M}_{\mu} := \{\text{all}\ \mu^{\ast}\ \text{-measurable set\}}
> $$
>
> 上, 由 Carathéodory Thm 得它是 complete 的. 称这个 complete 的 measure
>
> $$
> \mu_{F} := \mu^{\ast}|_{\mathcal{M}_{\mu}}
> $$
>
> 为 **Lebesgue Stieltjes measure associated with $F$.**

> **Remark**
>
> 根据定义, 对于任意 $E \in \mathcal{M}_{\mu}$, 它的 LS measure 为:
>
> $$
> \mu_{F}(E) = \inf\left\{ {\sum\limits_{1}^{\infty}(F(b_{i}) - F(a_{i})) \mid E \subseteq \bigcup\limits_{1}^{\infty}(a_{i},b_{i}\rbrack} \right\}
> $$

### inner and outer regularity of LS measure

虽然我们使用 h-intervals 来 induce 了这个 measure, 但是实际上我们在表示 measure 时,可以用 open intervals 来代替 h-intervals:

> **Lemma: --[[open-interval covers for Lebesgue--Stieltjes measure]]--**
>
> 固定一个 Lebesgue-Stieltjes measure associated with $F$, 任意 $E \in \mathcal{M}_{\mu}$, 它的 measure 等于:
>
> $$
> \mu_{F}(E) = \inf\left\{ {\sum\limits_{1}^{\infty}(F(b_{i}) - F(a_{i})) \mid E \subseteq \bigcup\limits_{1}^{\infty}(a_{i},b_{i})} \right\}
> $$

> **Proof**
>
> 每个 open interval 都等于 a ctbl disjoint union of h-intervals, 从而是在这个被取 inf 集合内的; 所以只需要证明能取到这个 inf 即可. Fix $\epsilon > 0$, 我们根据定义可以取到一个 seq $(a_{i},b_{i}\rbrack$ 使得它 measure sum $\leq \mu(E) + \epsilon/2$, 而我们对于每个 $i$, 在 interval 的右边再取一个 $< \epsilon/2^{i + 1}$ 的 $\delta_{i}$, 就变成了一个 open interval, 并且最后距离这个 h-interval seq 的 measure sum 差距至多 $\epsilon/2$. 从而得证.

> **Theorem: --[[**outer regularity**]]--**
>
> 对于一个 Lebesgue-Stieltjes measure associated with $F$, 任意 $E \in \mathcal{M}_{\mu}$, 它的 measure 等于:
>
> $$
> \mu_{F}(E) = \inf\left\{ {\mu_{F}(U) \mid U\ \text{open , and}\ E \subseteq U} \right\}
> $$

> **Proof**
>
> Directly follows from lemma. 首先, by monotonicity, 一个包含 $E$ 的开集 $U$ 的 $\mu_{F}$ 一定比 $E$ 的大. 并且, 对于任意的 $\epsilon > 0$, 都可以找到一个 open covering 使得 measure sum $< \mu_{F}(E) + \epsilon$, by def.\

> **Theorem: --[[**inner regularity**]]--**
>
> 对于一个 Lebesgue-Stieltjes measure associated with $F$, 任意 $E \in \mathcal{M}_{\mu}$, 它的 measure 等于:
>
> $$
> \mu_{F}(E) = \sup\left\{ {\mu_{F}(K) \mid K\ \text{compact , and}\ K \subseteq E} \right\}
> $$

> **Proof**
>
> 首先证明 $E$ bounded 的 case. 假设 $E$ bdd.\
> 如果 $E$ closed, 则 $E$ cpt, trivially true.\
> 如果 $E$ open, 那么 $E$ 的 bounadry 是 closed (cpt) 的, 从而 $\partial E \in \mathcal{M}_{\mu}$ 我们 let $\epsilon > 0$. 我们对 $\partial E$ 使用 outer regularity, 可以取一个 open set $U$ covering $\partial E$, 并且使得 $\mu_{F}(U) \leq \mu_{F}(E) + \epsilon$\
> 此时取 $K := E\backslash U$, 我们发现这是一个 approximating $E$ 的 compact set, 并且有:
>
> $$
> E = K \sqcup (U \cap E)
> $$
>
> 从而:
>
> ![Figure 8:[ ]{style="white-space: pre-wrap"}](.assets/main--figure-raster-008.png){width="40%"}
>
> 而对于 unbounded 的 case, 直接由
>
> $$
> E = \bigsqcup\limits_{j}(E \cap (j,j + 1\rbrack)
> $$
>
> 得到.

> **Remark**
>
> outer / inner regularity 表示, $\mathbb{R}$ 上一个 (LS-measurable set 的) LS measure 就等于它内部用 cpt set 逼近它的 measure limit; 以及等于它外部用 open set 逼近它的 measure limit.\
> 这个性质也可以推广到 ${\mathbb{R}}^{n}$ 上.

### Lebesgue-Stieltjes measurable 的等价条件

> **Definition: --[[$G_{\delta},F_{\sigma}$ sets]]--**
>
> Topological space 中, 一个 **coutable intersection of open sets 被称为一个 $G_{\delta}$ set**, 一个 **countable union of closed sets 被称为一个 $F_{\sigma}$ set**.

> **Remark**
>
> topological space 中, finite intersection of open sets 还是 open set, 但是 countable intersection 则未必; finite union of closed sets 还是 closed set, 但是 countable union 则未必.\
> $G_{\delta}$ sets 包括了所有的 open sets, 以及一部分扩充; $F_{\sigma}$ sets 包括了所有的 closed sets, 以及一部分扩充.

> **Theorem: --[[Lebesgue-Stieltjes measurable 的等价条件]]--**
>
> TFAE:
>
> 1.  $$
>     E \in \mathcal{M}_{\mu}
>     $$
>
> 2.  存在一个 $G_{\delta}$ set $V$ 以及一个 measure zero set $N_{1}$ ($\mu_{F}(N_{1}) = 0$) 使得
>
>     $$
>     E = V\backslash N_{1}
>     $$
>
> 3.  存在一个 $F_{\sigma}$ set $H$ 以及一个 measure zero set $N_{2}$ ($\mu_{F}(N_{2}) = 0$) 使得
>
>     $$
>     E = H \cup N_{2}
>     $$
>
> 4.  存在一个 open set $U$ 使得对于任意的 $\epsilon > 0$, 都有
>
>     $$
>     \mu^{\ast}(U\backslash E) < \epsilon
>     $$

> **Proof**
>
> 由 (ii) 和 (iii) 推得 (i) 是 trivial 的. 这是因为 LS measure 是 complete measure, 任意 null set 都是 measurable 的. 由 (i) 推 (ii) 和 (iii): follows from outer 与 inner regularity. 假设 $E$ 是 LS-measurable 的, 我们直接取一个 inner seq of cpt subsets 以及一个 outer seq of open super sets, 使得
>
> $$
> \mu_{F}(U_{j}) - \frac{1}{2^{i}} \leq \mu_{F}(E) \leq \mu_{F}(K_{j}) + \frac{1}{2^{i}}
> $$
>
> 于是就得到: $V := \bigcap_{i}U_{i}$, $H := \bigcup_{i}K_{i}$, 与 $E$ 的差集都是一个 null set. 并且它们分别为 $G_{\delta}$ 和 $F_{\sigma}$ sets.

> **Remark**
>
> $\sigma$-algebra 和 topology 各自只 closed under finite 的交和并, 而 $< \mathcal{B}({\mathbb{R}}) >$ 则 closed under ctbl 交和并, 从而所有的 $G_{\delta}$ 和 $F_{\sigma}$ sets 都在其中. $\mathcal{M}_{\mu}$ 是一个比 $< \mathcal{B}({\mathbb{R}}) >$ 更大的集合, 但是其实它其中的元素都可以用 $G_{\delta}$ 和 $F_{\sigma}$ sets, 即 $< \mathcal{B}({\mathbb{R}}) >$ 中的集合来逼近. 这是合理的, 因为 completion 就是把一些 subnull sets 加入到了 $\sigma$-algebra 里.

### Lebesgue measure and its invariance properties

> **Definition: --[[Lebesgue measure]]--**
>
> Lebesgue measure 即 Lebesgue-Stieltjes measure associated with $F(x) = x$. 我们用 $m := \mu_{F}$ 来表示它, 并用 $\mathcal{L} := \mathcal{M}_{m}$ 来表示所有的 Lebesgue measurable sets.\
> 从而 $\mathbb{R}$ 上的 Lebesgue measure space 表示为:
>
> $$
> ({\mathbb{R}},\mathcal{L},m)
> $$

> **Remark**
>
> Lebesgue measure 是最 normal 的 Lebesgue-Stieltjes measure, 它 preserve intervals 的长度作为其 measure:
>
> $$
> m((a,b\rbrack) = b - a
> $$

> **Theorem: --[[$\mathcal{L}$ preserves translation and scaling]]--**
>
> if $E \in \mathcal{L}$ $\Rightarrow$ $E + s,rE \in \mathcal{L}$ $\forall s,r \in {\mathbb{R}}$.\
> 并且, $\left. m(E + s) = m(E),m(rE) = \middle| r \middle| m(E) \right.$

> **Proof**
>
> 首先, 如果 $E \in \mathcal{B}({\mathbb{R}})$, 那么 by hw 1, 我们证明了 $\mathcal{B}({\mathbb{R}})$ 是 closed under translation 和 scaling 的, 因而 $rE,E + s \in \mathcal{B}({\mathbb{R}})$.\
> 我们 define on $\mathcal{A}_{0} :=$ $\left\{ \text{finite union of h-intervals} \right\}$:
>
> $$
> m_{s}(E) := m(E + s)
> $$
> $$
> m^{r}(E) := m(rE)
> $$
>
> 显然, 这两个函数 agree with $\left. m, \middle| r \middle| m \right.$. **由于 $m$ 是 $\sigma$-finite 的, 从而 by Hahn-Kolmogrov, 它 uniquely extend to $\mathcal{B}({\mathbb{R}})$**. 因而, $m_{s}$ 在 $\mathcal{B}({\mathbb{R}})$ 上和 $m$ 相等, $m^{r}$ 在 $\mathcal{B}({\mathbb{R}})$ 上和 $\left. |r \middle| m \right.$ 相等. 并且, 我们知道 **$({\mathbb{R}},\mathcal{L},m)$ 是 completion of $({\mathbb{R}},\mathcal{B}({\mathbb{R}}),m)$**, 因而 $m_{s}$ 也同样 complete to $m$ on $\mathcal{L}$. (同理, $m^{r}$ 也同样 complete to $\left. |r \middle| m \right.$ on $\mathcal{L}$)

> **Remark**
>
> 我们只要证明两个 measure function 在 premeasure 上相等或称倍数关系, 就能证明它们在 induced (complete) measure 上相等.\
> 此外, 有另一种证明方式. After we know $m_{s}$ 在 $\mathcal{B}({\mathbb{R}})$ 上和 $m$ 相等, $m^{r}$ 在 $\mathcal{B}({\mathbb{R}})$ 上和 $\left. |r \middle| m \right.$ 相等, 我们由 [Theorem 3.13](#thm-03-distribution-function-lebesgue-stieltjes-measures-lebesgue-stieltjes-measurable) Lebesgue-Stieltjes measurable 的等价条件 可知: $\mathcal{L}$ 上的集合一定是一个 Borel set 并上一个 null set, 由于 null set 的 measure 在经过 translation 和 scaling 后仍然是 0, 同样得证.

