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
semantic-node-count: 19
source: "notes/math/measure-theory/chapters/09-L^P-space_and_inequalities.typ"
subtitle: Typst-first course notes and worked homeworks
title: "MATH 597: Measure Theory"
---
# $L_{p}$ space and inequalities

## Banach Space and $L_{p}$ space \[Fol 5.1; 6.1\]

对应 Folland 5.1(1), 6.1(1).

### norm and completeness

Recall:

> **Definition: --[[semi-norm, norm]]--**
>
> 一个**semi norm** 是一个函数 $\left. | \middle| \cdot \middle| \middle| :V\rightarrow\lbrack 0,\infty) \right.$ starting from a vector space $V$. 其满足 (1): tri eq 和 (2): homogeneity.\
> 如果一个 semi-norm 满足 (3): $\left. | \middle| v \middle| \middle| = 0 \right.$ iff $v = 0$, 则称它为一个 **norm**.

> **Definition: --[[Banach space]]--**
>
> 一个 normed vector space $\left. (V, \middle| \middle| \cdot \middle| \middle| ) \right.$ 的 induced metric space 如果是 complete 的, 它就被称为一个 **Banach space**.\

> **Remark**
>
> Cauchy 指的是对于任意 $\epsilon$, 都存在 $N$ 使得对于任意 $n,m \geq N$ 都有
>
> $$
> \parallel v_{n} - v_{m} \parallel < \epsilon
> $$
>
> 而 convergent 指的是存在一个极限 $v$, 使得对于任意 $\epsilon$, 都存在 $N$ 使得对于任意 $n \geq N$ 都有
>
> $$
> \parallel v_{n} - v \parallel \leq \epsilon
> $$
>
> By tri ineq 容易证明: 在 genral normed VS 中, convergent imply Cauchy, 反之未必. convergent 是更强的条件. (interestingly, convergence in measure 却不 imply Cauchy in measure)

> **Example**
>
> ${\mathbb{R}}^{n},{\mathbb{C}}^{n}$ with Euclidean norm is a Banach space.\
> $C^{0}(\lbrack 0,1\rbrack)$: space of ctn functions on $\lbrack 0,1\rbrack$ equipped with $\sup$ norm **is Banach**.
>
> $$
> \left. | \middle| f - g \middle| \middle| := \sup\limits_{x \in \lbrack 0,1\rbrack} \middle| f(x) - g(x)| \right.
> $$
>
> $C_{c}^{0}({\mathbb{R}})$: space of ctn functions with cpt supp on $\mathbb{R}$ equipped with $\sup$ norm **is not Banach**! 这是因为, 一个有 cpt supp 的 function seq 的极限未必有 cpt supp. 比如 $(\chi_{\lbrack - n,n\rbrack})_{n \in {\mathbb{N}}}$.

> **Lemma**
>
> A metric space $(X,\rho)$ is **complete** iff **every Cauchy seq has a subseq that converges.**

> **Proof**
>
> Trivial.\
> $\Longrightarrow$: Clear.\
> $\Longleftarrow$: subseq conv dist bound + Cauchy dist bound can bound the whole tail with arbitrary $\epsilon$.

这个 statement, 直接把 complete 的定义从每个 Cauchy seq 都收敛, 优化为每个 Cauchy seq 都有一个收敛 subseq.

### every Cachy seq conv (complete) $\Leftrightarrow$ every abs conv series convs

> **Definition: --[[series: convergence 和 absolute convergence]]--**
>
> 对于一个 normed VS $\left. (V, \middle| \middle| \cdot \middle| \middle| ) \right.$ 中的 seq $(v_{n})$, 我们称 $\sum_{n = 1}^{\infty}v_{n}$ **converges**, 如果存在 $v \in V$ s.t.
>
> $$
> \lim\limits_{N\rightarrow\infty}\sum\limits_{n = 1}^{N}v_{n} = v
> $$
>
> 即
>
> $$
> \lim\limits_{N\rightarrow\infty} \parallel v - \sum\limits_{n = 1}^{N}v_{n} \parallel = 0
> $$
>
> 我们称 $\sum_{n = 1}^{\infty}v_{n}$ **absolutely converges**, 如果
>
> $$
> \left. \sum\limits_{n = 1}^{\infty} \middle| \middle| v_{n} \middle| \middle| < \infty \right.
> $$
>
> 即这个 series 对应的 norm series converges to some real number.

> **Theorem: --[[another criterion for Banach space]]--**
>
> A normed VS $\left. (V, \middle| \middle| \cdot \middle| \middle| ) \right.$ is a Banach space iff every absolutely convergent series converges.

> **Proof**
>
> "$\Longrightarrow$\": 如果 $\left. (V, \middle| \middle| \cdot \middle| \middle| ) \right.$ is a Banach space, Suppose $\left. \sum_{n = 1}^{\infty} \middle| \middle| v_{n} \middle| \middle| < \infty \right.$, 取部分和序列
>
> $$
> S_{N} := \sum\limits_{n = 1}^{N}v_{n}
> $$
>
> 有
>
> $$
> \parallel S_{m} - S_{n} \parallel = \parallel \sum\limits_{k = n + 1}^{m}v_{k} \parallel \leq \sum\limits_{k = n + 1}^{m} \parallel v_{k} \parallel
> $$
>
> For large enough $m,n$ 这个 bound 可以无限小, 因而 $(S_{N})$ is Cauchy. "$\Longleftarrow$\": 如果 $\left. (V, \middle| \middle| \cdot \middle| \middle| ) \right.$ 中 every absolutely convergent series converges.\
> Suppose $(v_{n})$ is Cauchy. WTS it converges.\
> By Cauchy, 存在 subseq, say labeled $n_{1} < n_{2} < \cdots$, s.t. $\left. | \middle| v_{m} - v_{n} \middle| \middle| < \frac{1}{3^{j}} \right.$for all $m,n \geq n_{j}$ Then
>
> $$
> \left. \sum\limits_{j = 1}^{\infty} \middle| \middle| v_{n_{j + 1}} - v_{n_{j}} \middle| \middle| < \infty \right.
> $$
>
> Let $(y_{j})$ be s.t. $y_{1} = v_{n_{1}}$, $y_{j} = v_{n_{j + 1}} - v_{n_{j}}$, then
>
> $$
> \sum\limits_{j = 1}^{\infty} \parallel y_{j} \parallel \leq \parallel y_{1} \parallel + \sum\limits_{j}\frac{1}{2^{j}} = \parallel y_{1} \parallel + 1 < \infty
> $$
>
> 并且有:
>
> $$
> v_{n_{j}} = \sum\limits_{k = 1}^{j}y_{k}
> $$
>
> 由于 $\sum_{j = 1}^{\infty} \parallel y_{j} \parallel < \infty$, by our assumption 得到, 这个极限 $\lim_{j\rightarrow\infty}v_{n_{j}} = \sum_{k = 1}^{\infty}y_{k}$ 是存在的.

> **Remark**
>
> 这个证明中也有一个简略但是有用的结论: 任意 normed VS 中, **一个 series absolutely convergent 可以推出它的部分和 seq 是 Cauchy 的. (反向则未必成立).**\
> 整个 imply 关系的示意图:
>
> $$
> \begin{matrix}
> {\sum\limits_{k = 1}^{\infty} \parallel x_{k} \parallel < \infty\Longrightarrow S_{N}\ \text{Cauchy}} & {\overset{\text{if Banach}}{\Longrightarrow}S_{N}\ \text{converges}\Leftrightarrow\sum\limits_{k = 1}^{\infty}x_{k}\ \text{converges}\Longrightarrow(x_{k})\rightarrow 0} \\
>  & \overset{\text{always}}{\Longleftarrow}
> \end{matrix}
> $$
>
> (这个图直观说明了为什么 Banach 和 \"every abs conv seq conv\" 是等价的. 因为这只是**在 Cauchy imply conv 的前后套了两个必然发生的 implication 关系**而已. 但有时候, 这个关系反而更加好证明.)\
> **(注意, partial sum seq Cauchy 并不 imply 原 series absolutely converge!**)

### 任何 finite dim normed VS 一定 Banach, infinite dim 则不一定 Banach

> **Remark**
>
> Note, 我们知道在 ${\mathbb{R}}^{n}$, ${\mathbb{C}}^{n}$ 上, abs conv 一定 imply con; 但是在 general (infinite dimension) 的 normed VS 上, **absolutely converge 并不 imply converge.**\
> 1. As is known to all, ${\mathbb{R}}^{n},{\mathbb{C}}^{n}$ 上 Euclidean norm 的 induced metric 就是 Euclidean metric, making it complete metric space, 从而是 Banach space.\
> 2. recall in elementary functional analysis:
>
> > **Definition**
> >
> > 我们称两个 norms $\parallel \cdot \underset{a}{\parallel}, \parallel \cdot \underset{b}{\parallel}$ on a vector space 是 equivalent, 如果存在常数 $C_{1},C_{2} > 0$ 使得对于任意 $x$ 都有
> >
> > $$
> > C_{1} \parallel x\underset{a}{\parallel} \leq \parallel x\underset{b}{\parallel} \leq C_{2} \parallel x\underset{a}{\parallel}
> > $$
> >
> > 这一定义即 topologically equivalent. 因为 equivalent norms define **equivalent metric, 从而 same topology.**
>
> 以及这个经典的定理:
>
> > **Theorem**
> >
> > finite dimensional vector space $X$ 上, 所有 norms 都 equivalent.
>
> 这里先不证明.\
> 利用这个定理, 我们发现 **${\mathbb{R}}^{n},{\mathbb{C}}^{n}$ 上采用任何 norm 都是 Banach space.**\
> 3. 我们 recall: 任何 finite dim $\mathbb{R}$-vector space 或者 $\mathbb{C}$-vector space 都 isomorphic to some ${\mathbb{R}}^{n}$, ${\mathbb{C}}^{n}$. 因而 利用这 theorem, 我们得到: **任何 finite dim normed VS 都是 complete metric space (Banach space), regardless of choice of norm.**\
> 然而 **infinite dim normed VS 则未必一定 Banach.**\
> 一个常见的反例:
>
> $$
> V = {\mathbb{R}}\lbrack x\rbrack
> $$
>
> 所有的 polynomials with real coeffs. 考虑这一 norm:
>
> $$
> \left. \parallel p\underset{\infty}{\parallel} = \sup\limits_{x \in \lbrack 0,1\rbrack} \middle| p(x)| \right.
> $$
>
> ${\mathbb{R}}\lbrack x\rbrack$ 是无限维的, 因为多项式的次数可以任意提高.\
> $({\mathbb{R}}\lbrack x\rbrack, \parallel p\underset{\sup}{\parallel})$ 不是 complete 的, 其 completion 是 Banach 空间 $C\lbrack 0,1\rbrack$, 所有在 $\lbrack 0,1\rbrack$ 上的连续函数, with the same $\sup$ norm.\

下面我们将介绍一类 infinite dimension 但是 Banach 的 normed VS: $L^{p}$ spaces.

### $L^{p}$ spaces

> **Definition: --[[$L_{p}$ spaces]]--**
>
> Consider $p \in (0,\infty)$.\
> Let $(X,\mathcal{A},\mu)$ 为一个 measure space.\
> Define for $f:X\rightarrow{\mathbb{R}}$ measurable:
>
> $$
> \left. | \middle| f \middle| \middle| {}_{p}: = (\int \middle| f \middle| {}_{p} d\mu)^{\frac{1}{p}} \in \lbrack 0,\infty\rbrack \right.
> $$
>
> Define
>
> $$
> L^{p}(\mu): = \left\{ f: \middle| \middle| f \middle| \middle| {}_{p} < \infty \right\}/ \sim
> $$
>
> where $f \sim g$ if $f = g$ a.e.

固定一个 measure space $(X,\mathcal{A},\mu)$, 我们将用 $L_{p}$ 来简易指代 $L^{p}(\mu)$.\

> **Remark**
>
> 注意, 我们容易发现:if $0 < p < \infty$ and $f$ measurable, TFAE：
>
> - $f \in L^{p}$
>
> - $\left. |f \middle| \in L^{p} \right.$
>
> - $\left. |f \middle| {}_{p} \in L^{1} \right.$

> **Example**
>
> $(X,\mathcal{A},\mu) := ({\mathbb{R}},\mathcal{L},m)$,
>
> $$
> f(x): = \frac{1}{x^{\alpha}}\chi_{(0,1)}, f \in L^{p}(m)\Leftrightarrow\alpha p < 1
> $$
> $$
> f(x): = \frac{1}{x^{\alpha}}\chi_{(1,\infty)}, f \in L^{p}(m)\Leftrightarrow\alpha p > 1
> $$
>
> $(X,\mathcal{A},\mu) := ({\mathbb{N}},\mathcal{P}({\mathbb{N}}),\mu_{counting})$,
>
> $$
> L^{p}(\mu_{counting}) = \left\{ (a_{n})_{n \in {\mathbb{N}}}:\sum\limits_{n = 1}^{\infty} \middle| a_{n} \middle| {}_{p} < \infty \right\}
> $$

> **Lemma: --[[$L_{p}$ space is a vector space]]--**
>
> $L_{p}$ space is a $\mathbb{C}$-vector space.

> **Proof**
>
> Suppose $f,g \in L^{p}$.\
> 由于
>
> $$
> \left. |f + g \middle| {}_{p} \leq ( \middle| f \middle| + \middle| g \middle| )^{p} \leq (2\max\left\{ |f \middle| , \middle| g| \right\})^{p} \leq 2^{p}( \middle| f \middle| {}_{p} + \middle| g \middle| {}_{p}) \right.
> $$
>
> 于是 by linearity of integral, 得到:
>
> $$
> f,g \in L^{p}\Longrightarrow f + g \in L^{p}
> $$
>
> (Note: $p > 1$ 时也可以 by $|x|^{p}$ 这一函数的 convexity 得到这个 bound, 但是这个方法只有效于 $p > 1$)

但是 **Question 1:** **Is $L_{p}$ a normed VS? 即, $\parallel \cdot \underset{p}{\parallel}$ 总是一个 valid norm 吗?** A: **True for $p \in \lbrack 1,\infty)$, false for $p \in (0,1)$.** Homogeneity 和 $\parallel f\underset{p}{\parallel} = 0$ iff $f = 0$ (a.e.) 是显然的, 但是我们发现, tri ineq 没有显然的证明.\
Next lecture, we will show the Minkowski's ineq, 即 $L^{p}$ space 上的三角不等式:

$$
\left. | \middle| f + g \middle| \middle| {}_{p} \leq \middle| \middle| f \middle| \middle| {}_{p} + \middle| \middle| g \middle| |_{p} \right.
$$

但是这个不等式只 hold for $p \in \lbrack 1,\infty)$, 并且 fail otherwise.\
(因而对于 $L^{p}$ space 的研究, 我们将 **focus on $p \in \lbrack 1,\infty)$ 的情况.**)\
**Question 2: Is $L^{p}$ space, $p \in \lbrack 1,\infty)$, Banach? Answer: Yes.**\
我们也将在 next lecture 证明它.

## inequilities on $L^{p}$ spaces \[Fol 6.1\]

对应 Folland 6.1(2).\
我们将证明 Hölder's ineq 以及它的 corollary Minkowski's ineq, 从而证明: $L^{p}$ 是一个 normed VS, 并且是一个 Banach space (这里 $1 \leq p < \infty$, 但是 later we will also prove $L^{\infty}$ 也是 Banach space).\
这两个不等式非常重要.

### Hölder's ineq

> **Theorem: --[[Hölder's ineq]]--**
>
> Consider conjugate pair: $p,q \in \lbrack 1,\infty)$ s.t.
>
> $$
> \frac{1}{p} + \frac{1}{q} = 1
> $$
>
> 则对于任意两个 measurable function $f,g:X\rightarrow{\mathbb{C}}$, 一定有:
>
> $$
> \parallel fg\underset{1}{\parallel} \leq \parallel f\underset{p}{\parallel} \cdot \parallel g\underset{q}{\parallel}
> $$
>
> 特别地, 如果 $f \in L^{p}(\mu)$, $g \in L^{q}(\mu)$, 则 $fg \in L^{1}(\mu)$, 并且 equality holds iff
>
> $$
> \left. \parallel g\underset{q}{\overset{q}{\parallel}} \middle| f \middle| {}_{p} = \parallel f\underset{p}{\overset{p}{\parallel}} \middle| g \middle| {}_{q}\quad\mu\ \text{-a.e.} \right.
> $$

> **Remark**
>
> For $(p,q) = (2,2)$, this is **Cauchy-Swartz ineq**:
>
> $$
> \parallel fg\underset{1}{\parallel} \leq \parallel f\underset{2}{\parallel} \cdot \parallel g\underset{2}{\parallel}
> $$
>
> 即:
>
> $$
> \left. (\int f\,\bar{g}) \leq \int \middle| fg \middle| \leq \sqrt{\left. (\int \middle| f \middle| {}_{2})(\int \middle| g \middle| {}_{2}) \right.} \right.
> $$

> **Proof**
>
> Trivial Case 1: 如果 $\parallel f\underset{p}{\parallel} = 0$ (或者$\parallel g\underset{q}{\parallel} = 0$ ), then $f$ is zero $\mu$-almost everywhere, and the product $fg$ is zero $\mu$-almost everywhere, 于是两边都是 $0$, ineq trivially true.\
> Trivial Case 2: 如果 $\parallel f\underset{p}{\parallel} = \infty$ or $\parallel g\underset{q}{\parallel} = \infty$, 则右边 infinite, ineq trivially true. 因而我们只需要考虑 $\parallel f\underset{p}{\parallel}$ and $\parallel g\underset{q}{\parallel}$ are in $(0,\infty)$ 的情况就好了.\
> Main case: 我们需要一个 Lemma:
>
> > **Lemma: --[[Young's inequality for products]]--**
> >
> > Whenever $p,q \in (1,\infty)$ with $\frac{1}{p} + \frac{1}{q} = 1$, 都有
> >
> > $$
> > ab \leq \frac{a^{p}}{p} + \frac{b^{q}}{q},\quad\forall a,b \geq 0
> > $$
> >
> > where equality is achieved if and only if $a^{p} = b^{q}$.\
> > 另一个等价形式是:
> >
> > $$
> > a^{\lambda}b^{1 - \lambda} \leq \lambda a + (1 - \lambda)b,\quad\forall a,b \geq 0
> > $$
>
> > **Proof**
> >
> > **of Lemma:**\
> > $b = 0$ 则 trivial case. 因而 setting $t: = \frac{a}{b}$, reduced to show:
> >
> > $$
> > t^{\lambda} \leq \lambda t + (1 - \lambda)
> > $$
> >
> > with eq iff $t = 1$. 这是显然的, 因为 by Calculus, $t^{\lambda} - \lambda t$ 是 strictly increasing for $t < 1$, strictly decreasing for $t > 1$ 的, max 在 $t = 1$, 正好是 $1 - \lambda$.
>
> 使用 Young's inequality for products 得到:
>
> $$
> \frac{|f(x)|}{\parallel f\underset{p}{\parallel}}\frac{|g(x)|}{\parallel g\underset{q}{\parallel}} \leq \frac{|f(x)|^{p}}{p \parallel f\underset{p}{\overset{p}{\parallel}}} + \frac{|g(x)|^{q}}{q \parallel g\underset{q}{\overset{q}{\parallel}}},\quad x \in X
> $$
>
> Integrating both sides gives
>
> $$
> \frac{\parallel fg\underset{1}{\parallel}}{\parallel f\underset{p}{\parallel} \parallel g\underset{q}{\parallel}} \leq \frac{\parallel f\underset{p}{\overset{p}{\parallel}}}{p \parallel f\underset{p}{\overset{p}{\parallel}}} + \frac{\parallel g\underset{q}{\overset{q}{\parallel}}}{q \parallel g\underset{q}{\overset{q}{\parallel}}} = \frac{1}{p} + \frac{1}{q} = 1,
> $$
>
> which proves the claim.\
> Integration 的 equality holds iff point equality holds a.e., 并且, by Young's inequality for products, 上面的 equality holds iff
>
> $$
> \left. \parallel g\underset{q}{\overset{q}{\parallel}} \middle| f \middle| {}_{p} = \parallel f\underset{p}{\overset{p}{\parallel}} \middle| g \middle| {}_{q}\quad\mu\ \text{-a.e.} \right.
> $$

> **Remark**
>
> 1\. 显然, 根据我们的证明过程可知: **Hölder's ineq also holds on any measurable subset $S \subset X$**:
>
> $$
> \left. \int_{S} \middle| fg \middle| \leq (\int_{S} \middle| f \middle| {}_{p})^{\frac{1}{p}}(\int_{S} \middle| g \middle| {}_{q})^{\frac{1}{q}} \right.
> $$
>
> 2\. 这里的满足 $\frac{1}{p} + \frac{1}{q} = 1$ 的 $p,q$ 我们称之为: **Hölder conjugate**, 并称它们互为对方的 **conjugate exponent**.\
> 3. 左边实际上是两个正值函数的 inner product, 相当于把一个投影到另一个上;\
> 几何直观: Hölder's ineq 在退化为 Cauchy-Swartz 时表示, 两个函数/向量的内积一定小于等于长度积; 而 Hölder's ineq 更广义: 表示它们的内积一定小于它们取任意相互 conjugate 的 norm 长度的积. 并且 sooner 我们会学到: 对作为 Hölder conjugates 的 $p,q$, $L^{p}$ 和 $L^{q}$ 互为 dual space, 从而 Hölder ineq 表示的是就是 norm 与其 dual norm 之间的 maximal inner product 控制关系.

> **Remark**
>
> Hölder's ineq 有一个 generalization: 对于任意 $0 < s < \infty$ and $0 < p_{1},\ldots,p_{n} < \infty$ such that
>
> $$
> \frac{1}{p_{1}} + \frac{1}{p_{2}} + \ldots + \frac{1}{p_{n}} = \frac{1}{s};
> $$
>
> 都有
>
> $$
> \parallel f_{1}f_{2}\cdots f_{n}\underset{s}{\parallel} \leq \parallel f_{1}\underset{p_{1}}{\parallel} \parallel f_{2}\underset{p_{2}}{\parallel}\cdots \parallel f_{n}\underset{p_{n}}{\parallel}.
> $$
>
> This generalization will be proved in hw8.

### Minkowski's ineq: tri ineq on $L^{p}$, 确认 $\parallel \cdot \underset{p}{\parallel}$-norm 是 $L^{p}$ 上的 valid norm

Minkowski's ineq 即 $L^{p}$ space 上的 tri ineq.

> **Corollary: --[[Minkowski inequality]]--**
>
> 对于任意 $1 \leq p < \infty$, 都有:
>
> $$
> \parallel f + g \parallel \leq \parallel f\underset{p}{\parallel} + \parallel g\underset{p}{\parallel}
> $$

> **Proof**
>
> 显然, 对于任意 $x$ 都有:
>
> $$
> \left. |f + g \middle| {}_{p} \leq ( \middle| f \middle| + \middle| g \middle| ) \middle| f + g|^{p - 1} \right.
> $$
>
> 因而:
>
> $$
> \left. \int \middle| f + g \middle| {}_{p} \leq \int \middle| f \middle| \cdot \middle| f + g \middle| {}_{p - 1} + \int \middle| g \middle| \cdot \middle| f + g|^{p - 1} \right.
> $$
>
> 我们定义
>
> $$
> \left. h(x) := \middle| f(x) + g(x)|^{p - 1} \right.
> $$
>
> 于是
>
> $$
> \begin{matrix}
> \left. \int \middle| f + g|^{p} \right. & \left. \leq \int \middle| fh \middle| + \int \middle| gh| \right. \\
>  & {\leq \parallel f\underset{p}{\parallel} \parallel h\underset{q}{\parallel} + \parallel g\underset{p}{\parallel} \parallel h\underset{q}{\parallel}} \\
>  & \left. = ( \parallel f\underset{p}{\parallel} + \parallel g\underset{p}{\parallel})(\int \middle| f + g \middle| {}_{(p - 1)q})^{1/q} \right.
> \end{matrix}
> $$
>
> 其中 $q$ 是 $p$ 的 Hölder conjugate. 这里的 punchline is actually: 由于
>
> $$
> q: = \frac{p}{p - 1}
> $$
>
> actually,
>
> $$
> (p - 1)q = p
> $$
>
> 因而:
>
> $$
> \begin{matrix}
> \left. \int \middle| f + g|^{p} \right. & \left. \leq ( \parallel f\underset{p}{\parallel} + \parallel g\underset{p}{\parallel})(\int \middle| f + g \middle| {}_{(p - 1)q})^{1/q} \right. \\
>  & \left. = ( \parallel f\underset{p}{\parallel} + \parallel g\underset{p}{\parallel})(\int \middle| f + g \middle| {}_{p})^{1/q} \right. \\
>  & \left. = ( \parallel f\underset{p}{\parallel} + \parallel g\underset{p}{\parallel})(\int \middle| f + g \middle| {}_{p})^{1 - 1/p} \right.
> \end{matrix}
> $$
>
> 两边同时除以 $\left. (\int \middle| f + g \middle| {}_{p})^{1 - 1/p} \right.$ 得到:
>
> $$
> \left. (\int \middle| f + g \middle| {}_{p})^{1/p} = : \parallel f + g\underset{p}{\parallel} \leq \parallel f\underset{p}{\parallel} + \parallel g\underset{p}{\parallel} \right.
> $$
>
> 从而得证.

> **Remark**
>
> 这里的技巧是: 把一个 $p$ 次方的函数拆成一个 $1$ 次方的函数和一个 $p - 1$ 次方的函数, 并且使用Hölder, 这样就得到了一个 1 次的函数的 $p$-norm 和另一个 $p - 1$ 次的函数的 $q$ norm, 但是注意 $q(p - 1) = p$, 因而这个函数就变成了
>
> $$
> \left. (\int \middle| \phi \middle| {}_{p})^{1/q} \right.
> $$
>
> 的形式. 并且注意到:
>
> $$
> \left. \frac{\left. \int \middle| \phi|^{p} \right.}{\left. (\int \middle| \phi \middle| {}_{p})^{1/q} \right.} = (\int \middle| \phi \middle| {}_{p})^{1/p} = \parallel \phi\underset{p}{\parallel} \right.
> $$

> **Remark**
>
> Minkowski 不等式证明的是 $1 \leq p < \infty$ 时的 $p$-norm 的三角不等式. 但是对于 $0 < p < 1$, 它并不成立. 因为这个时候 $p - 1 < 0$, 我们刚才的证明不作效.\
> 直观的证明: 在 $p \geq 1$ 的时候, $|x|^{p}$ 是一个 strictly convex 的函数; 而在 $0 < p < 1$ 的时候, $|x|^{p}$ 则是一个 strictly concave 的函数.\
> 因而我们运用 strictly concave 的性质:
>
> $$
> \left. |a + b \middle| {}_{p} > \middle| a \middle| {}_{p} + \middle| b|^{p} \right.
> $$
>
> 再由积分可得到反例. (比如取 indicator function 进行积分)

### properties of $L^{p}$ spaces ($1 \leq p < \infty$)

### $L^{p}$ ($1 \leq p < \infty$) is Banach

> **Theorem: --[[$L^{p}$ space ($1 \leq p < \infty$) is Banach]]--**
>
> $L^{p}$ ($1 \leq p < \infty$) is Banach.

> **Proof**
>
> By last lec 的定理: 一个 NVS 是 Banach 的等价条件是任意 abs conv series 都 conv. 因而我们证明这一点即可.\
> Suppose $f_{n} \in L^{p}$ for each $n$, 并且这个 series abs conv, 即:
>
> $$
> B := \sum\limits_{k = 1}^{\infty} \parallel f_{k}\underset{p}{\parallel} < \infty
> $$
>
> 我们 define:
>
> $$
> g(x): = \sum\limits_{k = 1}^{\infty}f_{k}(x),\quad g_{n}(x): = \sum\limits_{k = 1}^{n}f_{k}(x)
> $$
>
> 我们 WTS:
>
> $$
> \lim\limits_{n\rightarrow\infty}g_{n} = g
> $$
>
> in $p$-norm induced metric sense, 即, for some $f \in L^{p}$, 有
>
> $$
> \lim\limits_{n\rightarrow\infty} \parallel g - g_{n}\underset{p}{\parallel} = 0
> $$
>
> 我们 Set:
>
> $$
> \left. G_{n} := \sum\limits_{k = 1}^{n} \middle| f_{k} \middle| ,\quad G := \sum\limits_{k = 1}^{\infty} \middle| f_{k}| \right.
> $$
>
> 这个函数以及函数列的定义是为了使用 DCT, 作 donimating function 用.\
> By measurable function 的 limit behavior, 有
>
> $$
> G_{n},G \in L^{+}
> $$
>
> 并且
>
> $$
> \parallel G_{n}\underset{p}{\parallel} \leq \sum\limits_{k = 1}^{n} \parallel f_{k}\underset{p}{\parallel} \leq B
> $$
>
> 由于 $G_{n}\operatorname{\nearrow ︎}G$, by MCT 有
>
> $$
> \int G^{p} = \lim\limits_{n\rightarrow\infty}\int G_{n}^{p} \leq B^{p} < \infty
> $$
>
> 由于 $G \in L^{p}$, 有
>
> $$
> G(x) < \infty\quad a.e.
> $$
>
> 于是:
>
> $$
> g(x): = \sum\limits_{k = 1}^{\infty}f_{k}(x) < \infty\quad a.e.
> $$
>
> 又 $\left. |g_{n} \middle| , \middle| g \middle| \leq G,g_{n}\rightarrow g \right.$, 可得到:
>
> $$
> \left. |g_{n} - g \middle| {}_{p} \leq 2^{p}G^{p} \in L^{1} \right.
> $$
>
> 因而 by DCT 可以得到:
>
> $$
> \left. \lim\limits_{n}\int \middle| g_{n} - g \middle| {}_{p} = 0 \right.
> $$
>
> 从而
>
> $$
> \left. \lim\limits_{n\rightarrow\infty} \parallel g - g_{n}\underset{p}{\parallel} = (\lim\limits_{n}\int \middle| g_{n} - g \middle| {}_{p})^{1/p} = 0 \right.
> $$

> **Remark**
>
> 1\. 我们说一个 function seq converge to 一个 function 指的是 in the sense of distance, 而这里就是 metric induced by norm, 即**它们的差的 $L_{p}$ norm converge to $0$.**\
> 2. 注意, 我们 recall: $f_{k}\rightarrow f$ a.e. 并不说明 $f_{k}\rightarrow f$ in $L^{1}$, 因为每个点 converge 的速度不一样. 当然, 对 $L^{p}$ 也同理.\
> 3. **虽然 a.e. convergence 不能推出 $L^{p}$ convergence, 但是配合 DCT, 则可以推出.** **DCT 是我们证明 $L^{p}$ convergence 的关键.**\
> 4. 要证明
>
> $$
> \lim\limits_{n\rightarrow\infty} \parallel g - g_{n}\underset{p}{\parallel} = 0
> $$
>
> 完全可以忽略积分外的 $1/p$ 次方. 其实只需要证明
>
> $$
> \left. \lim\limits_{n}\int \middle| g_{n} - g \middle| {}_{p} = 0 \right.
> $$
>
> 就可以了. 证明 $L^{p}$ convergence, 比起 $L^{1}$ convergence 略困难的地方就是被积函数变得更大了.

### Criterion for $L^{p}$ convergence: 逐点 a.e. conv $+$ $L^{p}$ 积分值 conv

我们刚才 mention: DCT 对于 function seq $L^{p}$ convergence 的证明有很大作用. 这里我们就提供一个 DCT 推出的 $L^{p}$ convergence 的判断准则:

> **Theorem: --[[Criterion for $L^{p}$ convergence]]--**
>
> if $f_{n}\rightarrow f$ a.e. and $\parallel f_{n}\underset{p}{\parallel}\rightarrow \parallel f\underset{p}{\parallel}$, then $\parallel f_{n} - f\underset{p}{\parallel}\rightarrow 0$.

即

$$
\text{a.e. conv} + L^{p}\ \text{norm conv}\Longrightarrow L^{p}conv
$$

但是 converse 并不成立. 反例是 typewriter function.

> **Proof**
>
> In Hw 8.

### dense subsets of $L^{p}$, and specially $L^{p}({\mathbb{R}},m)$

> **Proposition**
>
> 对于任意 $1 \leq p < \infty$, the set of $\{$simple functions$\}$, is dense in $L^{p}$.\
> 即:
>
> $$
> \left\{ {f:X\rightarrow{\mathbb{C}} \mid f = \sum\limits_{1}^{n}a_{j}\chi_{E_{j}},\mu(E_{j}) < \infty} \right\}
> $$
>
> 是 $L^{p}$ 的 dense subset.

> **Remark**
>
> 我们已经 proved this for $L^{1}$, 而其实这个 density 推广至 $L^{p}$ 也成立.

> **Proof**
>
> 对 $f$ 使用 simple function seq 逼近, 使用 $\left. 2^{p} \middle| f|^{p} \right.$ 作为 dominating function of $|f_{k} - f|^{p}$; 而后使用 DCT 得证.

> **Theorem: --[[$C_{c}^{0}({\mathbb{R}}^{n})$ is dense in $L^{p}({\mathbb{R}},m)$ for $1 \leq p < \infty$]]--**
>
> $C_{c}^{0}({\mathbb{R}}^{n})$ is dense in $L^{p}({\mathbb{R}},m)$ for $1 \leq p < \infty$

> **Proof**
>
> exercise. Similar to the proof for $L^{1}$, 只需要使用加入 $p$ power 的 function 作为 dominating function 即可.

## $L^{\infty}$ space, and relationship between $L^{p}$ spaces ($0 \leq p \leq \infty$) \[Fol 6.1, finished\]

对应 Folland 6.1(3), finishing 6.1.\
我们已经完成了对 $1 \leq p < \infty$ 的 $L^{p}$ space 的构建. 现在, 我们来构建最后一块拼图: $L^{\infty}$ space.

### $L^{\infty}$ space

我们考虑这个启发式的例子:

$$
X := \left\{ {1,2,\cdots,n} \right\},\quad\mathcal{A} := \mathcal{P}(X),\quad\mu = \mu_{counting}
$$

于是:

$$
L^{p}(\mu) = \left\{ (a_{1},\cdots,a_{n}): \parallel (a_{1},\cdots,a_{n})\underset{p}{\parallel} = (\sum \middle| a_{i} \middle| {}_{p})^{1/p} < \infty \right\} = {\mathbb{C}}^{n}
$$

我们发现:

$$
\left. \parallel (a_{1},\cdots,a_{n})\underset{p}{\parallel}\rightarrow\max\limits_{j} \middle| a_{j} \middle| \quad\text{as}\quad p\rightarrow\infty \right.
$$

因为 $p$ 取得越大, 最大的 entry 的 contribution 占比就越突出.\
对于这样的 $L^{p}$ space, 我们可以定义 $\sup$ norm, 定义为最大的 entry.\
即便 $X$ 是 countable 的, 这个定义也可以定义为 $\left. \sup_{j} \middle| a_{j}| \right.$, make sense.\
那么如果我们想要给任意的 measure space 定义 sup norm 呢? 我们可以考虑

$$
\left. \parallel f\underset{\infty}{\parallel}: = \sup\limits_{x \in X} \middle| f(x) \middle| ? \right.
$$

实际上我们有更好的定义方式:

> **Definition: --[[essential supremum]]--**
>
> $$
> \parallel f\underset{\infty}{\parallel}: = \inf\left\{ {a \geq 0:\mu\left\{ x: \middle| f(x) \middle| > a \right\} = 0} \right\}
> $$
>
> 也可以写作:
>
> $$
> \left. \text{ess}\sup\limits_{x \in X} \middle| f(x)| \right.
> $$

> **Remark**
>
> essential sup 是一个比较容易搞错的定义.\
> 一个 function 的 essential supremum 即: 这个 function 几乎处处的 sup.\
> 它 $\leq \sup f$ , 因为它允许在零测集上存在一些点的函数值大于它.\
> 这是合理的, 因为积分可以不考虑零测集.\

> **Remark**
>
> 对于零测集只有空集的 measure space 上的函数, 比如 对于 $\ell^{\infty}({\mathbb{N}})$ 上的函数, 其 essentail supermum 即 supermum.\
> 对于
>
> $$
> \left. \sup\limits_{x \in X} \middle| f(x)| \right.
> $$
>
> 我们也有一个称呼, 称其为 **uniform norm**. 即:
>
> $$
> \left. \parallel f\underset{u}{\parallel} := \sup\limits_{x \in X} \middle| f(x)| \right.
> $$

> **Definition: --[[$L^{\infty}$ space]]--**
>
> $$
> L^{\infty}(\mu): = \left\{ {f:X\rightarrow{\mathbb{C}}\ \text{measurable}: \parallel f\underset{\infty}{\parallel} < \infty} \right\}/ \sim
> $$
>
> where $\sim$ 表示 a.e. 相等的函数的 equiv class.

> **Remark**
>
> 注意: **$f \in L^{\infty}(\mu)$, 并不等价于 $f$ a.e. bounded!**\
> 实则 recall: $f$ a.e. **bounded 是 $f \in L^{p}(\mu)$ for any $1 \leq p \leq \infty$ 的必要条件**, 否则, 函数积分不可能 $< \infty$, 函数 $p$ 次方的积分更加不可能 $< \infty$.\
> $f \in L^{\infty}(\mu)$ 是一个很严格的条件, 当然严格强于 $f$ a.e. bounded.\
> 比方说: **$f = \frac{1}{x}$, 只有在 $0$ 这一个点上 $f$ 是 unbounded 的, 但是它的 essential supermum 仍然是 $\infty$**, 因为不可能通过去掉一个 measure $0$ set 来使它 bounded.\
> 无法找到一个 $M$, 使得 $f$ 在几乎处处都小于 $M$. 你只能控制, $f$ 在 $(0,1/M)$ 上小于 $M$, 这个集合的测度随 $M$ 增大越来越小, 但是永远都是正测度. (同样这个函数也不属于任何 $L^{p}(m)$.)\
> 一个函数 essential supermum $< \infty$, 即 $\in L^{\infty}$, 则必须要它 unbounded 的这个行为是可以忽略不计的, 不能是明显的. 比如它在 $\mathbb{Q}$ 上 unbounded. 如果是在一个点上连续 blow up, 那么它就不可能 $\in L^{\infty}$. 类似于这里的 $f = \frac{1}{x}$.\

> **Remark**
>
> 我们在本节课还会证明, 如果 measure space $X$ has finite measure, 那么有
>
> $$
> L^{\infty}(X) \subset \cdots \subset L^{p}(X) \subset \cdots \subset L^{q}(X) \subset \cdots \subset L^{1}(X)
> $$
>
> for 任意的 $p \geq q$.\
> 这表明的是, 在一定要求下, $L^{\infty}$ 是要求最严格的 space.

下面是一个比较典型的例子:

### $\ell^{\infty}$ space

> **Definition: --[[$\ell^{\infty}$]]--**
>
> $$
> \ell^{\infty}: = \left\{ (a_{j})_{1}^{\infty}: \parallel (a_{j})\underset{\infty}{\parallel}: = \sup\limits_{j} \middle| a_{j} \middle| < \infty \right\}
> $$

> **Example**
>
> $$
> f = x\chi_{\mathbb{Q}} \in L^{\infty}(m)
> $$
>
> with
>
> $$
> \parallel f\underset{\infty}{\parallel} = 0
> $$
>
> 因为整个 $\mathbb{Q}$ 都是零测的.

> **Remark**
>
> $\ell^{\infty}$ 其实就是:
>
> $$
> X: = {\mathbb{N}},\quad\mathcal{A}: = \mathcal{P}(X),\quad\mu = \mu_{counting}
> $$
>
> 的 measure space 上的 $L^{\infty}(\mu)$.
>
> $$
> \ell^{\infty} = L^{\infty}({\mathbb{N}},\mathcal{P}({\mathbb{N}}),\mu_{counting})
> $$
>
> 一个 seq 就是一个从 $\mathbb{N}$ to $\mathbb{C}$ 的函数, 把每个 entry map to 一个 complex number.\
> **而对于 counting measure 作为 measure 的 measure space 上, 唯一的零测集就是空集**, 因为哪怕只取一个元素, 这个子集的测度也是 1.\
> 比如, 我们只取三个 entry $1,2,8$, 看 $\left\{ {|a_{n}|} \right\}_{1}^{\infty}\backslash\left\{ |a_{1} \middle| , \middle| a_{2} \middle| , \middle| a_{3} \middle| ) \right\}$ 中的 $\sup$ value, 也不符合 essential supremum 的定义.\
> 因而我们发现, **对于 唯一的零测集就是空集 的 measure space, for example, 任何以 counting measure 作为 measure 的 measure space, 其 essential sup norm 就是普通的 sup value norm.**\
> 比如
>
> $$
> {\mathbb{C}}^{1},{\mathbb{C}}^{2},{\mathbb{C}}^{3},\cdots,\ell^{\infty}
> $$

### $L^{\infty}$ 的基本性质: as a NVS; Hölder's ineq on it; dense subsets

> **Lemma**
>
> 如果 $f \in L^{\infty}(\mu)$ 则:
>
> - 一定有 $\left. |f(x) \middle| \leq \parallel f\underset{\infty}{\parallel} \right.$ for a.e. $x$.
>
> - 存在一个 bounded 函数 $g$, 使得 $f = g$ a.e.

> **Proof**
>
> 显然.

> **Remark**
>
> 是否有在某个零测集上 unbounded 但是却 $L^{\infty}$ 的函数? 答案是肯定的:
>
> $$
> f(x) = \left\{ \begin{matrix}
> {\frac{1}{x},} & {x \in {\mathbb{Q}} \cap (0,1\rbrack} \\
> {0,} & \text{otherwise}
> \end{matrix} \right.
> $$
>
> 有 $\parallel f\underset{\infty}{\parallel} = 0$.

> **Theorem**
>
> - $$
>   \parallel fg\underset{\infty}{\parallel} \leq \parallel f\underset{1}{\parallel} \parallel g\underset{\infty}{\parallel}
>   $$
>
>   可以把它看作 **Hölder 的一部分特殊情况**, 因为可以看作
>
>   $$
>   \frac{1}{1} + \frac{1}{\infty} = 1
>   $$
>
>   从而补充完整了 Hölder ineq for $1 \leq p,q \leq \infty$
>
> - $L^{\infty}$ 是一个 **normed vector space**, equipped with $\parallel \cdot \underset{\infty}{\parallel}$
>
> - simple functions are dense in $L^{\infty}$

> **Proof**
>
> 容易证明.

> **Remark**
>
> 注意, $L^{\infty}$ 和 $L^{p}$ 有一个出入点是: **$C_{c}^{0}({\mathbb{R}}^{n})$ 并不是 $L^{\infty}({\mathbb{R}}^{n},m)$ 上的 dense subspace!**\

### $L^{\infty}$-convergence 作为 (finite measure space 下) 最强的 $L^{p}$ convergence: 等价于 uni. conv a.e.

> **Theorem: --[[convergence in $L^{\infty}$ $\Leftrightarrow$uniform convergence a.e.]]--**
>
> $$
> f_{n}\rightarrow f\text{in}\ L^{\infty}\Leftrightarrow\text{exists null set}\ E \subset X s.t.f_{n}\rightarrow f\ \text{uniformly on}\ E^{c}
> $$
>
> (注意, 这**不是 conv almost uniformly**, 而是一个比 almost uniformly **更强**的条件: **conv uniformly almost everywhere**, 因为 almost uniformly 只要求对于任意的 $\epsilon$, 都存在一个 measure 小于 $\epsilon$ 的 $E$, 使得在 $E^{c}$ 上 uni conv 即可.)

> **Remark**
>
> 这一条 convergence 十分惊人. 因为**对于普通的 $L^{p}$ space, converge in $L^{p}$ 和 a.e. convergence 并没有任何的互推关系**; 但是对于 $L^{\infty}$ convergence, 我们却可以把它**等价于 uniform convergence almost everywhere**, which is 一个**比 a.u convergence 更强, 比 a.e. convergence 更强的逐点 convergence**. 可以看出 $L^{\infty}$ convergence 是比任何 $L^{p}$ convergence 都要强一个层次的收敛性质.\
> 这一点

> **Proof**
>
> ⇐: Suppose $f_{n}\rightarrow f$ uni. a.e; WTS: $f_{n}\rightarrow f$ in $L^{\infty}$ $f_{n}\rightarrow f$ uni. a.e 即: 存在零测集 $E \subset X$, $f_{n}\rightarrow f$ on $E^{c}$.\
> Let $\epsilon > 0$.\
> $f_{n}\rightarrow f$ uni. a.e 表明, 存在 $N$ 使得 for all $n \geq N$ 有
>
> $$
> \left. \forall x \in E^{c},\quad \middle| f_{n}(x) - f(x) \middle| < \epsilon \right.
> $$
>
> by def, exactly is:
>
> $$
> \left. \parallel f_{n} - f\underset{L^{\infty}}{\parallel} = \text{ess\,sup}_{x \in X} \middle| f_{n}(x) - f(x) \middle| \leq \epsilon \right.
> $$
>
> This shows that $\parallel f_{n} - f\underset{L^{\infty}}{\parallel}\rightarrow 0$, 即 $f_{n}\rightarrow f$ in $L^{\infty}$.\
> ⇐: Suppose $f_{n}\rightarrow f$ in $L^{\infty}$; WTS: $f_{n}\rightarrow f$ uni. a.e.Denote:
>
> $$
> \epsilon_{n} := \parallel f_{n} - f\underset{L^{\infty}}{\parallel}
> $$
>
> By assumption, $\epsilon_{n}\rightarrow 0$. Define for each $n$:
>
> $$
> A_{n} := \left\{ x \in X: \middle| f_{n}(x) - f(x) \middle| > \epsilon_{n} \right\}
> $$
>
> By def $\left. \parallel f_{n} - f\underset{L^{\infty}}{\parallel} = \text{ess sup}_{x} \middle| f_{n}(x) - f(x) \middle| \leq \epsilon_{n} \right.$, 于是 $\mu(A_{n}) = 0$ 那么令:
>
> $$
> E := \bigcup\limits_{n = 1}^{\infty}A_{n}
> $$
>
> by subadditivity of measure 有 $\mu(E) = 0$. 于是对于任意 $\epsilon_{n}$, 都有
>
> $$
> \left. |f_{n}(x) - f(x) \middle| \leq \epsilon_{n}\rightarrow 0,\quad\text{for all}\ x \in E^{c} \right.
> $$
>
> 由于 $\epsilon_{n}\rightarrow 0$, showing that outside $E$, 有 $\parallel f_{n} - f\underset{L^{\infty}}{\parallel}\rightarrow 0$.

> **Remark**
>
> 这两个 convergence 直觉上是自然相等的.\
> 但是这并不能够说明 $L^{\infty}(\mu)\text{-convergence}$ 就是强于任何 $L^{p}(\mu)\text{-convergence}$ 的. 因为即便是 uniform 的 ptwise conv 也无法推出 $L^{p}$ conv.\
> 特殊情况是, 如果整个 base space $X$ 是 finite measure 的, 则可以推出
>
> $$
> L^{\infty}(\mu)\text{-convergence}\Longrightarrow L^{p}(\mu)\text{-convergence}\Longrightarrow L^{q}(\mu)\text{-convergence}\Longrightarrow\cdots
> $$
>
> whenever $p > q$. (可证明)\
> 但是对于无限测度空间, 这种推论未必成立.

### $L^{\infty}$ as Banach space

> **Theorem: --[[$L^{p}$ ($1 \leq p \leq \infty$) is Banach]]--**
>
> For any measure space $(X,\mathcal{A},\mu)$, $L^{p}(\mu)$ is Banach for all $1 \leq p \leq \infty$

> **Proof**
>
> 我们已经 proved 了 $1 \leq p < \infty$ 的 case, 现在 prove $p = \infty$ 的 case.\
> By [Theorem 9.44](#thm-09-l-p-space-and-inequalities-another-criterion-for-banach-space), 我们知道 STS: every abs conv series conv in $L^{\infty}$.\
> 我们 suppose $f_{k} \in L^{\infty}$ 有
>
> $$
> \sum\limits_{k = 1}^{\infty} \parallel f_{k}\underset{\infty}{\parallel} < \infty
> $$
>
> WTS: $\sum_{k = 1}^{\infty}f_{k}$ converges.\
> Set:
>
> $$
> E_{k} := \left\{ x: \middle| f_{k}(x) \middle| > \parallel f_{k} \middle| |_{\infty} \right\}
> $$
>
> 于是有
>
> $$
> \mu(E_{k}) = 0\quad\text{for each}\ k
> $$
>
> 因而 setting
>
> $$
> E: = \bigcup\limits_{k = 1}^{\infty}E_{k}
> $$
>
> 有
>
> $$
> \mu(E) = 0
> $$
>
> note:
>
> $$
> \left. x \in E^{c}\Longrightarrow\sum\limits_{k = 1}^{\infty} \middle| f_{k}(x) \middle| \leq \sum\limits_{k = 1}^{\infty} \parallel f_{k}\underset{\infty}{\parallel} < \infty \right.
> $$
>
> 从而,
>
> $$
> g: = \sum\limits_{k = 1}^{\infty}f_{k}
> $$
>
> 在 $E^{c}$ 上是 well-defined 的, 且 bounded by $\sum_{k = 1}^{\infty} \parallel f_{k}\underset{\infty}{\parallel}$.\
> 对于 $x \in E$, 我们可以随便设置值, 比如 $\pi$, 然后 define $g(x) = \pi$ on $x \in E$. 然后对于 each $n$, 我们 set:
>
> $$
> \begin{matrix}
> {g_{n}(x): = \{\sum\limits_{k = 1}^{n}f_{k}(x),\quad x \in E^{c}} \\
> {\frac{1}{\pi},\quad x \in E}
> \end{matrix}
> $$
>
> 从而
>
> $$
> \begin{matrix}
> \left. \parallel g_{n} - g\underset{\infty}{\parallel} \leq \sup\limits_{x \in E^{c}} \middle| g_{n}(x) - g(x)| \right. & \left. \leq \sup\limits_{x \in E^{c}} \middle| \sum\limits_{n + 1}^{\infty}f_{k}(x)| \right. \\
>  & \left. \leq \sup\limits_{x \in E^{c}}\sum\limits_{n + 1}^{\infty} \middle| f_{k}(x)| \right. \\
>  & {\leq \sum\limits_{n + 1}^{\infty} \parallel f_{k}\underset{\infty}{\parallel}\rightarrow 0}
> \end{matrix}
> $$

> **Remark**
>
> My reflection: 不 Banach 的 normed vector space 是什么样子的呢? 即, 这个 space 中存在某些 series, 其对应的 norm series absolutely conv 但是它却不 converge to 一个元素呢?\
> 我们考虑空间 $c_{00}$，它是所有 finite supp 的 seq 组成的空间:
>
> $$
> c_{00} := \left\{ {x = (x_{1},x_{2},\ldots) \in {\mathbb{R}}^{\mathbb{N}} \mid \text{only finite}\ x_{i} \neq 0} \right\}
> $$
>
> with $\ell^{1}$ norm:
>
> $$
> \left. \parallel x \parallel = \sum\limits_{i = 1}^{\infty} \middle| x_{i}| \right.
> $$
>
> $c_{00}$ 是一个 normed vector space, 但不是 Banach space, 它的完备化是 $\ell^{1}$. 我们考虑 series, with:
>
> $$
> x_{n} = e_{n}/2^{n}
> $$
>
> 其中 $e_{n} = (0,\ldots,0,1,0,\ldots)$, 第 $n$ 个位置是 1, 其余是 $0$, 是这个 NVS 的 standard basis.\
> 显然每个 $x_{n} \in c_{00}$，并且：
>
> $$
> \parallel x_{n} \parallel = \frac{1}{2^{n}}\quad\Rightarrow\quad\sum\limits_{n = 1}^{\infty} \parallel x_{n} \parallel = \sum\limits_{n = 1}^{\infty}\frac{1}{2^{n}} = 1
> $$
>
> 这是一个 absolutely convergent series, 但其和
>
> $$
> \sum\limits_{n = 1}^{\infty}x_{n} = \left( {\frac{1}{2},\frac{1}{4},\frac{1}{8},\ldots} \right) \notin c_{00}
> $$
>
> $L^{p}$ space 的 Banach 性表示了其**极限存在的稳定性**. recall, Banach 即 complete NVS, 而 **complete 是比 closed 更强的条件**.\
> 因而**任何一个 $L^{p}$ 函数列, 如果 Cauchy / converge in $L^{p}$ norm, 那么它的极限一定在 $L^{p}$ 里.**

### relationship between $L^{p}$ spaces

### $L^{m}(\mu) \subset L^{n}(\mu),0 < n \leq m \leq \infty$, for measure finite space)

刚才我们已经 state 了, 但还没有证明:

> **Theorem: --[[inclusion relation between $L^{p}$ spaces (when base space is finite measure)]]--**
>
> 如果 measure space $X$ has finite measure, 那么有
>
> $$
> L^{\infty}(X) \subset \cdots \subset L^{m}(X) \subset \cdots \subset L^{n}(X) \subset \cdots
> $$
>
> for 任意的 $m \geq n$.

这是我们首次把 $p < 1$ 也 include 进我们的讨论.

这个 statement 即: 对于 from finite measure space to $\mathbb{C}$ 的 function $f$, 它的 $\parallel f\underset{m}{\parallel} < \infty$ 是比 $\parallel f\underset{n}{\parallel} < \infty$ 更强的条件.\
尤其, 除去 $L^{\infty}$ 的情况, 它更直接的意思是: 对于 $0 < n \leq m < \infty$ 而言, $f$ 的绝对值的 $m$ 次方的积分 $< \infty$ 是比 $f$ 的绝对值的 $n$ 次方的积分 $< \infty$ 要更强的条件.

这其实是一件比较直观的事情. 因为对于 $\left. |f \middle| \geq 1 \right.$ 的部分,

$$
\left. \int_{|f| \geq 1} \middle| f \middle| {}_{large} \geq \int_{|f| \geq 1} \middle| f|^{small} \right.
$$

而对于 $\left. |f \middle| < 1 \right.$ 的部分,

$$
\left. \int_{|f| < 1} \middle| f \middle| {}_{large} \leq \int_{|f| < 1} \middle| f|^{small} \right.
$$

然而**由于整个 space 的 measure 是 finite 的, $\left. |f \middle| < 1 \right.$ 的部分并不影响**. 因为

$$
\left. \int_{|f| < 1} \middle| f \middle| {}_{large} \leq \int_{|f| < 1} \middle| f \middle| {}_{small} \leq \int_{|f| < 1}1 \leq \mu(X) \right.
$$

因而, 对于 $\mu(X) < \infty$ 的情况, 显然有 $\parallel f\underset{large}{\parallel} < \infty$ 是比 $\parallel f\underset{small}{\parallel} < \infty$ 更强的条件.\
**(实际上, 如果只有 measure finite 的 $x$ 上 $\left. |f(x) \middle| < 1 \right.$, 那么即便 $\mu(X) = \infty$, $\parallel f\underset{large}{\parallel} < \infty$ 也是比 $\parallel f\underset{small}{\parallel} < \infty$ 更强的条件; 而如果有 measure infinite 的 $x$ 上 $\left. |f(x) \middle| < 1 \right.$, 那么有可能 $\parallel f\underset{large}{\parallel} < \infty$ 是比 $\parallel f\underset{small}{\parallel} < \infty$ 更弱的条件)**\
My point: 虽然说 $|f(x)|^{large}$ 比起 $|f(x)|^{small}$ 是更大还是更小取决于 $|f(x)|$ 是否 $\geq 1$ or $< 1$, 但是 $\geq 1$ 的值是可以 unbounded 的, 而 $< 1$ 的值再怎么通过小次方变得更大, 也超不过 $1$. 因而 $\left. |f(x) \middle| \geq 1 \right.$ 的部分通常更能函数积分值的有限性, 除非在一个 measure infinite 的集合上 $\left. |f(x) \middle| < 1 \right.$.

这里有一个更加严格的证明:

> **Proof**
>
> 首先, 对于 $m = \infty$ 的 case, 如果 $f \in L^{m} = L^{\infty}$, 那么取任意 $1 \leq n < \infty$ 都有:
>
> $$
> \left. \int \middle| f \middle| {}_{n} \leq \int \parallel f\underset{\infty}{\overset{n}{\parallel}} = \parallel f\underset{\infty}{\overset{n}{\parallel}}\mu(X) < \infty \right.
> $$
>
> 其次, 对于正常的 $m < \infty$ 的 case, 我们使用 Hölder: 如果 $f \in L^{m}$, 那么对于任意 $n < m$, 我们可以构造出 Hölder conjugate $\frac{m}{n}$ 和 $\frac{m}{m - n}$,从而:
>
> $$
> \begin{matrix}
> \left. \int \middle| f|^{n} \right. & \left. = \int \middle| f \middle| {}_{n} \cdot 1 \right. \\
>  & \left. \leq (\int( \middle| f \middle| {}_{n})^{\frac{m}{n}})^{\frac{n}{m}}(\int 1^{\frac{m}{m - n}})^{\frac{m - n}{m}} \right. \\
>  & {= \parallel f\underset{m}{\overset{n}{\parallel}}\mu(X)^{\frac{m - n}{m}} < \infty}
> \end{matrix}
> $$
>
> 从而
>
> $$
> \parallel f\underset{m}{\parallel} < \infty\Longrightarrow \parallel f\underset{n}{\parallel} < \infty
> $$
>
> 这一 proof 利用 Hölder conjuate, 通过构造包含 $\frac{m}{n}$ 的 Hölder conjugate, 把 $\left. \int \middle| f|^{n} \right.$ 改成了 $\parallel f\underset{m}{\parallel}$ 的 expression.

以下是一个经典的例子:

> **Example**
>
> 考虑 **measure finite 的 measure space $(0,1)$**: 通过经典的 Calculus 我们知道:
>
> $$
> f(x) = \frac{1}{x^{m}} \in L^{p}(0,1)\quad\text{for all}\ p < \frac{1}{m}
> $$
>
> 但是对于任意的 $m$, 都有:
>
> $$
> f(x) = \frac{1}{x^{m}} \notin L^{p}(0,1)
> $$
>
> 而我们再看一个 **measure infinite 的 measure space $(1,\infty)$ 上的反例**, 采用同一个函数:
>
> $$
> f(x) = \frac{1}{x^{m}},\quad x \in (1,\infty)
> $$
>
> 这个时候, $p$ 越大, $\left. \int \middle| f \middle| {}_{p} = \parallel f\underset{p}{\overset{p}{\parallel}} \right.$ 反而越小, 通过经典的 Calculus 我们知道:我们知道 而对于
>
> $$
> f(x) = \frac{1}{x^{m}} \in L^{p}(1,\infty)\quad\text{for all}\ p > \frac{1}{m}
> $$
>
> 并且 $f \in L^{\infty}(1,\infty)$, 因为 $\parallel f\underset{\infty}{\parallel} = 1$.\
> 这个空间上的这个函数正对应了我们刚才讨论的, 如果有 infinite measure 数量的 $x$ 上 $\left. |f(x) \middle| < 1 \right.$, 那么很可能 $\parallel f\underset{large}{\parallel} < \infty$ 是比 $\parallel f\underset{small}{\parallel} < \infty$ 更弱的条件

### control arbitrary $\parallel f\underset{m}{\parallel}$ 和 $\parallel f\underset{n}{\parallel}$ 的大小比例, in measure finite space

> **Remark**
>
> 刚才我们的推导中,
>
> $$
> \left. \int \middle| f \middle| {}_{n} \leq \parallel f\underset{m}{\overset{n}{\parallel}}\mu(X)^{\frac{m - n}{m}} < \infty \right.
> $$
>
> 两边开 $p$ 方, 可以得到一个不等式:
>
> > **Theorem**
> >
> > 对于 measure finite space $X$, 对于任意的 $0 < n \leq m \leq \infty$, 有:
> >
> > $$
> > \parallel f\underset{n}{\parallel} \leq \parallel f\underset{m}{\parallel}\,\mu(X)^{\frac{1}{n} - \frac{1}{m}}
> > $$
>
> 这也是一个有用的不等式. 它在 measure finite space 上, 对于任意的可测函数, 控制了两个任意的 function $p$-norm (虽然 for $p < 1$ 不能严格地称为 norm) 之间的大小关系。

### $(L^{n} \cap L^{r}) \subset L^{m} \subset (L^{n} + L^{r})$, 对任意 $0 < n < m < r \leq \infty$

> **Proposition**
>
> 对于 measurable $f:X\rightarrow{\mathbb{C}}$,
>
> $$
> t\mapsto \parallel f\underset{\frac{1}{t}}{\parallel}
> $$
>
> is **log-convex**.\
> equivalently 即: 对于任意的 $0 < n < m < r \leq \infty$, 都有
>
> $$
> \parallel f\underset{m}{\parallel} \leq \parallel f\underset{n}{\overset{\lambda}{\parallel}} \cdot \parallel f\underset{r}{\overset{1 - \lambda}{\parallel}}
> $$
>
> where
>
> $$
> \lambda := \frac{\frac{1}{m} - \frac{1}{r}}{\frac{1}{n} - \frac{1}{r}} \in (0,1),\quad i.e.(\frac{1}{m}) = \lambda(\frac{1}{n}) + (1 - \lambda)(\frac{1}{r})
> $$

> **Remark**
>
> log convex 即: 这个函数的 $\log$ 函数是 convex 的. 即对于任意 $x,y$, 以及 $\lbrack x,y\rbrack$ 上的任意一点, 即 $\lambda x + (1 - \lambda)y$ for some $\lambda \in \lbrack 0,1\rbrack$, 都有:
>
> $$
> \log f(\lambda x + (1 - \lambda)y) \leq \lambda\log f(x) + (1 - \lambda)\log f(y)
> $$
>
> 即:
>
> $$
> f(\lambda x + (1 - \lambda)y) \leq f(x)^{\lambda}f(y)^{1 - \lambda}
> $$
>
> 例如: $e^{x},e^{x^{2}},x^{x}$ 都是 log-convex 的. convex 函数的几何意义是 **\"函数值小于等于两端的线性插值\"**, 中点值 $\leq$两端值的**算术平均**, 而 log-convex 函数的几何意义是: , 中点值 $\leq$两端值的**几何平均**.\
> 这里, 两端点是 $\frac{1}{r} < \frac{1}{n}$, 而中间的取点则是 $\frac{1}{m}$. log convexity 性质表明:
>
> $$
> \parallel f\underset{m}{\parallel} \leq \parallel f\underset{n}{\overset{\lambda}{\parallel}} \cdot \parallel f\underset{r}{\overset{1 - \lambda}{\parallel}}
> $$

> **Proof**
>
> For $r = \infty$, then $\lambda = \frac{n}{m}$.\
> Since
>
> $$
> \left. |f \middle| {}_{m} = \middle| f \middle| {}_{n} \cdot \middle| f \middle| {}_{m - n} \leq \middle| f \middle| {}_{n} \cdot \parallel f\underset{\infty}{\overset{m - n}{\parallel}}\quad a.e. \right.
> $$
>
> 可以得到
>
> $$
> \left. \int \middle| f \middle| {}_{m} \leq (\int \middle| f \middle| {}_{n}) \cdot \parallel f\underset{\infty}{\overset{m - n}{\parallel}} = \parallel f \middle| |_{n}^{n} \cdot \parallel f\underset{\infty}{\overset{m - n}{\parallel}} \right.
> $$
>
> 从而 Taking $q$th root 得到结果:
>
> $$
> \parallel f\underset{m}{\parallel} \leq \parallel f\underset{n}{\overset{n/m}{\parallel}} \parallel f\underset{\infty}{\overset{1 - n/m}{\parallel}}
> $$
>
> For $r < \infty$: 我们采用 conjugate exponents:
>
> $$
> \frac{n}{\lambda m},\frac{r}{(1 - \lambda)m}
> $$
>
> 这是因为:
>
> $$
> (\frac{1}{m}) = \lambda(\frac{1}{n}) + (1 - \lambda)(\frac{1}{r})\Longrightarrow 1 = \lambda(\frac{m}{n}) + (1 - \lambda)(\frac{m}{r})
> $$
>
> 从而 Applying Hölder:
>
> $$
> \begin{matrix}
> \left. \int \middle| f|^{m} \right. & \left. = \int \middle| f \middle| {}_{\lambda m} \middle| f|^{(1 - \lambda)m} \right. \\
>  & \left. \leq (\int \middle| f \middle| {}_{n})^{\frac{\lambda m}{n}}(\int \middle| f \middle| {}_{r})^{\frac{(1 - \lambda)m}{r}} \right. \\
>  & {= \parallel f\underset{n}{\overset{\lambda m}{\parallel}} \cdot \parallel f\underset{r}{\overset{(1 - r)m}{\parallel}}}
> \end{matrix}
> $$
>
> Taking $q$ th root 得到结果.

> **Remark**
>
> Hölder's ineq 仍然是这里重要的一步. 我们这里需要利用 convexity 表述中的 \"point on a line segment\" 条件来构造一个 conjugate.

> **Remark**
>
> 此处我们可以由这个 proposition 直接得到一个推论:
>
> > **Corollary**
> >
> > 对于任意的 $0 < n < m < r \leq \infty$, 都有
> >
> > $$
> > (L^{n} \cap L^{r}) \subset L^{m}
> > $$

> **Example**
>
> 令 $A$ 为任意集合, $0 \leq p < q \leq \infty$, 有:
>
> $$
> \parallel f\underset{q}{\parallel} \leq \parallel f\underset{p}{\parallel}\quad\text{and thus}\quad\ell^{p}(A) \subset \ell^{q}(A)
> $$
>
> 这是因为
>
> $$
> \left. \parallel f\underset{\infty}{\overset{p}{\parallel}} = \sup\limits_{\alpha} \middle| f(\alpha) \middle| {}_{p} \leq \sum\limits_{\alpha} \middle| f(\alpha) \middle| {}_{p} = \parallel f\underset{p}{\overset{p}{\parallel}} \right.
> $$
>
> 于是 for $q \neq \infty$ case
>
> $$
> \parallel f\underset{q}{\parallel} \leq \parallel f\underset{p}{\overset{\lambda}{\parallel}} \parallel f\underset{\infty}{\overset{1 - \lambda}{\parallel}} \leq \parallel f\underset{p}{\parallel}
> $$
>
> (另一 case, trivial.)\
> 我们发现 $\ell^{p}$ 空间, $p$ 越小要求反而越严格.\
> 这是因为 $\ell^{p}$ 空间中一个函数就是一个 seq, 其 $p$-norm 就是各项的 $p$ 次方和, 再开 $p$ 次方根.\
> 对于一个 seq, 如果它的累和 series 收敛, 它的各项肯定是 **eventually 收敛的**, 那么这些除了有限项外的这些项的绝对值都是 $< 1$ 的, 那么 **$p$ 越大, 它们 $p$ 次方和只会越小**. 这正对应了我们之前说的 **\"$\left. |f(x) \middle| < 1 \right.$ 的点主导函数\" 的情况.**\
> \

相对于这个inclusion 关系, 我们还有另外一个 inclusion 关系:

> **Proposition: --[[每个 $L^{m}$ 函数都是一个 $L^{n}$ 函数和一个 $L^{r}$ 函数的和 ($0 < n < m < r \leq \infty$)]]--**
>
> 对于任意的 $0 < n < m < r \leq \infty$, 都有
>
> $$
> L^{m} \subset (L^{n} + L^{r})
> $$

这个 inclusion 关系有一种调和的感觉在里面. 它 roughly mean 给定一个函数, 它可以拆成一个更加容易积的函数和一个更加不容易积的函数, 并且我们很大程度上可以控制这两个函数的可积性.\
但其实很简单, 就是用我们之前的 $\left. |f(x) \middle| < 1 \right.$ 和 $\geq 1$ 的点作为区分, 把函数的定义域分成两部分. 如果 $|f|$ 的 m 次方是可积的, 那么更小的 $n$ 次方, 对于 $\left. |f(x) \middle| \geq 1 \right.$ 的部分肯定也是可积的; 更大的 $r$ 次方, 对于 $\left. |f(x) \middle| < 1 \right.$ 的部分肯定也是可积的;

> **Proof**
>
> Suppose $f \in L^{m}$. Let
>
> $$
> E := \left\{ x: \middle| f(x) \middle| > 1 \right\}
> $$
>
> let
>
> $$
> g: = f\chi_{E},\quad h := f\chi_{E^{c}}
> $$
>
> 于是 $g \in L^{n}$ for all $0 < n \leq m$, $h \in L^{r}$ for all $r \geq m$ and $r = \infty$.

