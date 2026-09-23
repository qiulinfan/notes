---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/measure-theory/chapters/13-the_dual_of_L^p-spaces.typ"
kgd_source_format: "typst"
kgd_source_sha256: "3bcb65d134d38c89ef26ee01cef180d459307e87ef11600afcfaa4fa1c6b74a3"
---

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
semantic-node-count: 6
source: "notes/math/measure-theory/chapters/13-the_dual_of_L^p-spaces.typ"
subtitle: Typst-first course notes and worked homeworks
title: "MATH 597: Measure Theory"
---
# the dual of $L^{p}$ spaces

## the dual of $L^{p}$-I \[Fol 6.2\]

对应: Folland 5.1, 6.2.\
(原本这是在 lec 25 的位置讲的, 但是当时由于没有 Radon-Nikodym Thm, 没有足够的工具去完成

$$
(L^{p})^{\ast} = L^{q}
$$

的证明 (差了一个 proof surjectivity of the isometry $g\rightarrow\ell_{g}$). 因而我把它放在这里, 衔接下面几个 lectures, 完成 6.2 这一节.\
我们首先练习一个 example of Hölder's ineq 来回忆一下:\
recall Hölder's ineq: for $1 \leq p,q \leq \infty,\frac{1}{p} + \frac{1}{q} = 1\Longrightarrow$

$$
\left. | \middle| fg \middle| \middle| {}_{1} \leq \middle| \middle| f \middle| \middle| {}_{p} \middle| \middle| g \middle| |_{q} \right.
$$

> **Example**
>
> Prove:
>
> $$
> f \in L^{3}(\lbrack - 1,1\rbrack,m)\Longrightarrow\int_{- 1}^{1}\frac{|f(x)|}{\sqrt{|x|}}\, dx < \infty
> $$

> **Proof**
>
> Apply Hölder's: 既然 $f \in L^{3}$, 那么我们就拉满, take $p = 3$, correspondingly $q = 3/2$:
>
> $$
> \left. \int_{- 1}^{1}\frac{|f(x)|}{\sqrt{|x|}}\, dx \leq (\int_{- 1}^{1} \middle| f(x) \middle| {}_{3}\, dx)^{\frac{1}{3}}(\int_{- 1}^{1}\frac{1}{|x|^{\frac{3}{4}}}\, dx)^{\frac{2}{3}} \right.
> $$
>
> both integrals evaluate $< \infty$

### intro to dual space

这里只讨论 ${\mathbb{K}} := {\mathbb{R}}$ or $\mathbb{C}$.\
recall, 对于一个 $\mathbb{K}$-vector space $V$, 一个 linear functional of $V$ 就是一个 linear function

$$
f:V\rightarrow{\mathbb{K}}
$$

对于作为 NVS 的 $V$, 我们还可以定义一个 linear functional 的 boundedness.

> **Definition: --[[bounded linear functional]]--**
>
> Let $V$ be a $\mathbb{K}$-NVS, $f:V\rightarrow{\mathbb{K}}$ be a linear functional.\
> 我们称 $f$ bounded, if exist $C > 0$ s.t.
>
> $$
> \left. |f(v) \middle| \leq C \middle| \middle| v \middle| \middle| ,\quad\forall\, v \in V \right.
> $$

> **Remark**
>
> 注意, **linear functional 的 boundedness 和它作为函数的 boundedness 是不一样的概念.**\
> 作为函数的 boundedness 表示函数值的有界性, 而**作为 linear map 的 boundedness (此处) 表示它的作用效果的 boundedness, 不会把一个 vector 放大太多倍.**

> **Proposition: --[[linear functional bounded $\Leftrightarrow$ ctn at $0$]]--**
>
> if $f:V\rightarrow{\mathbb{K}}$ is a linear functional, TFAE:
>
> - $f$ bounded
>
> - $f$ continuous
>
> - $f$ continuous at $0 \in V$

> **Proof**
>
> \(ii\) to (iii): trivial.\
> (i) to (ii): 假设 $f$ bounded, 那么可以 pick $C$ s.t. $\left. |f(v) \middle| \leq C \middle| \middle| v \middle| | \right.$.\
> Pick $v_{0} \in V,\epsilon > 0$. Set $\delta := \frac{\epsilon}{C}$. Then
>
> $$
> \left. | \middle| v - v_{0} \middle| \middle| < \delta\Longrightarrow \middle| f(v) - f(v_{0}) \middle| = \middle| f(v - v_{0}) \middle| \leq C \middle| \middle| v - v_{0} \middle| \middle| < \epsilon \right.
> $$
>
> 从而 ctn.\
> (iii) to (i): $\exists\delta > 0$ s.t. $\left. | \middle| v \middle| \middle| \leq \delta\Longrightarrow \middle| f(v) \middle| \leq 1 \right.$.\
> 于是 $\forall v \in V\backslash\left\{ 0 \right\}$, 都有
>
> $$
> \left. |f(v) \middle| = \frac{|\ f(v \cdot \frac{\delta}{\left. | \middle| v \middle| | \right.})|}{\frac{\delta}{\left. | \middle| v \middle| | \right.}} \leq \frac{\delta}{\left. | \middle| v \middle| | \right.} \right.
> $$
>
> taking $C = \frac{1}{\delta}$, 得到 boundedness.

> **Remark**
>
> 这个 proposition 看起来很神奇, 把一个整体性质和局部性质等价了, 但是我们知道 linear map 就是局部决定整体的, by its def.\
> recall in 395: 实际上这个性质应该对所有的 linear map 都成立, 不只是 linear functionals.\
> 通常我们认为 linear map 总是 ctn 的, 但是其实它 ctn iff bounded, unbounded 的时候就不 ctn.\
> 以及: **linear map between finite dim spaces 总是 bounded 的, 从而总是 ctn 的**. 不过这里我们要讨论的就是 infinite dim spaces. 比如 $L^{p}$.

> **Definition: --[[dual space]]--**
>
> If $V$ is a NVS, 我们定义它的 **dual space** as:
>
> $$
> V^{\ast} := \left\{ {\text{bounded linear functionals} f:V\rightarrow{\mathbb{K}}} \right\}
> $$

> **Definition: --[[norm of dual space: 即 **dual norm**]]--**
>
> Given $f \in V^{\ast}$, set
>
> $$
> \left. | \middle| f \middle| \middle| {}_{\ast}: = \sup\limits_{v \in V\backslash{\{ 0\}}}\frac{|f(v)|}{\left. | \middle| v \middle| | \right.} = \sup\limits_{||v|| = 1} \middle| f(v)| \right.
> $$
>
> where $\parallel v \parallel$ 表示的是 $V$ 上使用的 norm. 这个 norm 被称为 dual norm.

这个形式是我们在各种地方见过非常多次的[ ]{style="white-space: pre-wrap"} operator norm, 只不过这里, 指定一个 NVS, 对于其 dual space 上的 linear functional, 它是固定的, 不需要指定 $v$ 和 $f(v)$使用哪个 norm, 因为 $f(v)$ 就是标量, 而 $v$ from 原 NVS, 已经指定好 norm.

> **Remark**
>
> 从定义中我们可知, 对于任意的 $v \in V$, $f \in V^{\ast}$, 都有:
>
> $$
> \left. |f(v) \middle| \leq \parallel f\underset{\ast}{\parallel} \middle| v| \right.
> $$

### $V^{\ast}$ being a Banach space

> **Theorem: --[[dual space is always Banach]]--**
>
> 对于**任意的 NVS** $V$: $V^{\ast}$ 都是一个 Banach space. (not assuming $V$ Banach).

> **Proof**
>
> First we can confirm $V^{\ast}$ is a VS, 因为它由 linear functions of the same size 组成.\
> **Claim 1: $V^{\ast}$ 是一个 NVS.**\
> 因为任取 $v \in V,\lambda \in {\mathbb{K}}$ 都有 $\left. |f(\lambda v) \middle| = \middle| \lambda \middle| \cdot \middle| f(v)| \right.$, 从而
>
> $$
> \left. f \in V^{\ast},\lambda \in {\mathbb{K}}\Longrightarrow \middle| \middle| \lambda f \middle| \middle| {}_{\ast} = \middle| \lambda \middle| \cdot \middle| \middle| f \middle| |_{\ast} \right.
> $$
>
> 以及
>
> $$
> \left. f,g \in V^{\ast},v \in V\Longrightarrow \middle| (f + g)(v) \middle| = \middle| f(v) + g(v) \middle| \leq \middle| f(v) \middle| + \middle| g(v)| \right.
> $$
>
> 因而
>
> $$
> f,g \in V^{\ast}\Longrightarrow \parallel f + g\underset{\ast}{\parallel} \leq \parallel f\underset{\ast}{\parallel} + \parallel g\underset{\ast}{\parallel}
> $$
>
> 下面我们 verify $V^{\ast}$ Banach.\
> **Claim 2: 一个 Cauchy seq in $V^{\ast}$ 一定 pointwise converge to some $f$.**\
> Pick $(f_{n})_{1}^{\infty}$, 一个 Cauchy seq in $V^{\ast}$. Let $\epsilon < 0$, 存在 $N$ 使得对于任意 $m,n \geq N$ 都有 $\parallel f_{n} - f_{m}\underset{\ast}{\parallel} < \epsilon$, 我们简写为:
>
> $$
> \parallel f_{n} - f_{m}\underset{\ast}{\parallel}\rightarrow 0
> $$
>
> 因而对于任意 $v \in V$, we have
>
> $$
> \left. |f_{n}(v) - f_{m}(v) \middle| \leq \parallel f_{n} - f_{m}\underset{\ast}{\parallel} \middle| \middle| v \middle| \middle| \rightarrow 0 \right.
> $$
>
> 并且我们知道 **$\mathbb{K}$ 是 complete 的**, 因而 $f_{n}(v)$ converges in $\mathbb{K}$ to some element, declared to be $f(v)$.\
> 即 **$f_{n}\rightarrow f$ pointwisely**:
>
> $$
> \lim\limits_{n\rightarrow\infty}f_{n}(v) = f(v)
> $$
>
> (这是自然的, 因为如果 linear function $f - g$ 的 operator norm 是 $0$, 那么说明它们毫无差别, 否则一定有某个地方 $f,g$ 的 image 不一样, 使得这个 norm 不是 $0$.)\
> **Claim 3: $f$ 是 linear 的, 并且 bounded (从而 ctn), 即 $f \in V^{\ast}$.**\
> linearity: 由于每个 $f_{n}$ 都是 linear 的,
>
> $$
> f_{n}(x + \alpha y) = f_{n}(x) + \alpha f_{n}(y)
> $$
>
> 因而
>
> $$
> f(x + \alpha y) = \lim\limits_{n\rightarrow\infty}f_{n}(x + \alpha y) = \lim\limits_{n\rightarrow\infty}(f_{n}(x) + \alpha f_{n}(y)) = \lim\limits_{n\rightarrow\infty}f_{n}(x) + \alpha\lim\limits_{n\rightarrow\infty}f_{n}(y) = f(x) + \alpha f(y)
> $$
>
> 因此 $f$ 是线性的.\
> **(Note: 这里证明了 linear map 的 pointwise 极限一定也是 linear map.)**\
> Boundedness: Note a standard fact from metric spaces: **every Cauchy sequence is bounded.**\
> 因而 $f_{n}$ 是一个 bounded seq, 即存在 $M > 0$ such that $\parallel f_{n} \parallel \leq M$ for all $n$. Then
>
> $$
> \left. |f(x) \middle| = \middle| \lim\limits_{n\rightarrow\infty}f_{n}(x) \middle| \leq \lim\limits_{n\rightarrow\infty} \middle| f_{n}(x) \middle| \leq \lim\limits_{n\rightarrow\infty} \parallel f_{n}\underset{\ast}{\parallel} \parallel x \parallel \leq M\, \parallel x \parallel \right.
> $$
>
> Hence $f$ is bounded (continuous), and $\parallel f\underset{\ast}{\parallel} \leq M$. **Claim 4: $\parallel f_{n} - f\underset{\ast}{\parallel}\rightarrow 0$, proving $V^{\ast}$ 是 Banach 的.** WTS:
>
> $$
> \left. \parallel f_{n} - f \parallel = \sup\limits_{\parallel x \parallel = 1} \middle| (f_{n} - f)(x) \middle| \rightarrow 0 \right.
> $$
>
> //TO BE DONE.

Actually 这个 Theorem 有更 general 的形式:

> **Theorem**
>
> 对于任意 nvm $V$ 和 Banach $W$, $\mathcal{L}(V,W)$ 一定是 Banach 的.

Proof 见 Folland 5.4.

### $(L^{p})^{\ast} = L^{q}$, $\frac{1}{p} + \frac{1}{q} = 1$

> **Theorem: --[[对于互为 conjugate exponent 的 $p,q$, $L^{p}$ 是 $L^{q}$ 的 dual space]]--**
>
> For $1 < p,q < \infty$ with $\frac{1}{p} + \frac{1}{q} = 1$, we have:
>
> $$
> (L^{p})^{\ast} = L^{q}
> $$
>
> In particular the Hilbert space:
>
> $$
> (L^{2})^{\ast} = L^{2}
> $$

> **Proof**
>
> Define map
>
> $$
> \begin{matrix}
> L^{q} & {\rightarrow(L^{p})^{\ast}} \\
> g & {\mapsto\varnothing_{g}}
> \end{matrix}
> $$
>
> where
>
> $$
> \varnothing_{g}(f) := \int fg,\quad f \in L^{p}
> $$
>
> It is well-defined by Hölder:
>
> $$
> f \in L^{p},g \in L^{q}\Longrightarrow fg \in L^{1}
> $$
>
> and
>
> $$
> \left. | \middle| fg \middle| \middle| {}_{1} = \int \middle| fg \middle| \leq \middle| \middle| f \middle| \middle| {}_{p} \middle| \middle| g \middle| |_{q} \right.
> $$
>
> Easy:
>
> $$
> \varnothing_{g}(f_{1} + f_{2}) = \varnothing_{g}(f_{1}) + \varnothing_{g}(f_{2})
> $$
>
> Also
>
> $$
> \left. |\varnothing_{g}(f) \middle| = \middle| \int fg\  \middle| \leq \int \middle| fg \middle| \leq \middle| \middle| f \middle| \middle| {}_{p} \cdot \middle| \middle| g \middle| |_{q} \right.
> $$
>
> Thus
>
> $$
> \varnothing_{g} \in (L^{p})^{\ast}\
> $$

## the dual of $L^{p}$-II \[Fol 6.2\]

## the dual of $L^{p}$-III \[Fol 6.2, finished\]
