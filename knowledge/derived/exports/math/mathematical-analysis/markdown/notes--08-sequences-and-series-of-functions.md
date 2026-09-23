---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: MATH 451
date: 2026
description: Single-variable mathematical analysis notes migrated from the selected lectures and historical homework artefacts.
keywords:
- real analysis
- metric spaces
- Riemann integration
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/mathematical-analysis/chapters/08-sequences-and-series-of-functions.typ"
subtitle: Single-variable analysis --- migrated working notes
title: Mathematical Analysis
---
# Sequences and series of functions

## Sequences of functions (L19)

> **Definition: Pointwise convergence**
>
> 令 $\left( {f_{n}:A\rightarrow\mathbb{R}} \right)_{n \in \ \mathbb{N}}$ 是一个 seq. of functions（domains 都相同）。 称 $\left( f_{n} \right)$ 在 $A$ 上 pointwise converges to $f:A\rightarrow\mathbb{R}$，记作 $\left( f_{n} \right)\rightarrow f$ on $A$，if
>
> $$
> \lim\limits_{n\rightarrow\infty}f_{n{(x)}} = f(x)\quad\text{for all}\ x \in A.
> $$
>
> 等价地，
>
> $$
> \forall a \in A,\forall\varepsilon > 0,\exists N \in \mathbb{N}\text{such that}\ \forall n > N,\left| {f_{n{(a)}} - f(a)} \right| < \varepsilon.
> $$
>
> seq. of functions 的 pointwise convergence 即：对每一点 $x \in A$， $f_{n{(x)}}\rightarrow f(x)$。

> **Example: Pointwise limits can destroy everything**
>
> On $\left\lbrack {0,1} \right\rbrack$, let $f_{n{(x)}} = x^{n}$. Then
>
> $$
> f_{n{(x)}}\rightarrow f(x) = \left\{ \begin{matrix}
> 0 & {x \in \left\lbrack {0,1} \right)} \\
> 1 & {x = 1}
> \end{matrix} \right..
> $$
>
> Every $f_{n}$ is continuous and differentiable，但 $f$ is discontinuous。 因而 pointwise conv. 不 preserve continuity & differentiability。
>
> L19 p.1 draws the family $x,x^{2},x^{3},\ldots$ rising from $\left( {0,0} \right)$ to $\left( {1,1} \right)$, with the limiting graph equal to $0$ before the endpoint and $1$ at the endpoint. The graph information is equivalently captured by
>
>   ------------------------------------ ---------------------- --------------------------------------------------------
>   $x \in \left\lbrack {0,1} \right)$   $x = 1$                limit graph
>   $x^{n}\rightarrow 0$                 $x^{n}\rightarrow 1$   $f = 0$ on $\left\lbrack {0,1} \right)$ and $f(1) = 1$
>   ------------------------------------ ---------------------- --------------------------------------------------------
>
> .
>
> Write $\mathbb{Q} \cap \left\lbrack {0,1} \right\rbrack = \left\{ {q_{n}:n \in \mathbb{N}} \right\}$（$q_{n}$ 可以任意排序）。Let
>
> $$
> f_{n{(x)}} = \left\{ \begin{matrix}
> 1 & {x \in \left\{ {q_{1},\ldots,q_{n}} \right\}} \\
> {0\ } & \text{otherwise}
> \end{matrix} \right..
> $$
>
> Then $\left( f_{n} \right)\rightarrow D|_{\lbrack{0,1}\rbrack}$ (Dirichlet's function). Each $f_{n}$ is Riemann integrable, but $D|_{\lbrack{0,1}\rbrack}$ is not；因而 pointwise conv. 不 preserve integrability.
>
> On $\left\lbrack {0,2} \right\rbrack$, let
>
> $$
> f_{n{(x)}} = \left\{ \begin{matrix}
> {n^{2}x} & {0 \leq x \leq \frac{1}{n}} \\
> {2n - n^{2}x} & {\frac{1}{n} < x < \frac{2}{n}} \\
> 0 & {\frac{2}{n} \leq x}
> \end{matrix} \right.
> $$
>
> Each triangular spike has area $\left( \frac{1}{2} \right)\left( \frac{2}{n} \right)n = 1$, so $\int_{0}^{2}f_{n{(x)}}\, dx = 1$ for every $n$. Pointwise $f_{n}\rightarrow 0$, hence
>
> $$
> \lim\limits_{n\rightarrow\infty}\int_{0}^{2}f_{n{(x)}}\, dx = 1 \neq \int_{0}^{2}\lim\limits_{n\rightarrow\infty}f_{n{(x)}}\, dx = 0.
> $$
>
> 因而 pointwise convergence 不 preserve the limit of an integral。
>
> The p.1 spike picture has base $\left\lbrack {0,\frac{2}{n}} \right\rbrack$, apex $\left( {\frac{1}{n},n} \right)$, and area $1$:
>
>   ------------- --------------- ---------------
>   $0$           $\frac{1}{n}$   $\frac{2}{n}$
>   $f_{n} = 0$   $f_{n} = n$     $f_{n} = 0$
>   left edge     apex            right edge
>   ------------- --------------- ---------------
>
> .
>
> On $\mathbb{R}$, let $f_{n{(x)}} = \frac{\sin\left( {2\pi nx} \right)}{2\pi n}$. Then $f_{n}^{'{(x)}} = \cos\left( {2\pi nx} \right)$, $f_{n{(x)}}\rightarrow f(x) = 0$, yet $f_{n}^{'{(0)}} = 1$ for all $n$ while $f^{'{(0)}} = 0$. Thus
>
> $$
> \lim\limits_{n\rightarrow\infty}f_{n}^{'{(0)}} \neq f^{'{(0)}}:
> $$
>
> pointwise convergence 不 preserve the limit of a derivative。
>
> 因而 pointwise limit can destroy continuity, differentiability, and integrability；即使不 destroy，也不 reserve the value of an integral / derivative。pointwise convergence 是局部的逐点性质，不是整体性质： 在每个 $x \in A$，$f_{n{(x)}}\rightarrow f(x)$，最后的 $f$ 由每个 $x$ 的极限拼接而成。 若想让 convergence 更好地保留整体性质，就需要更强的定义。

> **Definition: Uniform convergence**
>
> 令 $\left( {f_{n}:A\rightarrow\mathbb{R}} \right)_{n \in \ \mathbb{N}}$ 是一个 seq. of functions。称 $\left( f_{n} \right)$ 在 $A$ 上 uniformly converges to $f:A\rightarrow\mathbb{R}$，if
>
> $$
> \forall\varepsilon > 0,\exists N \in \mathbb{N}\text{such that}\ \forall x \in A\ \text{and}\ n \geq N,\left| {f_{n{(x)}} - f(x)} \right| < \varepsilon.
> $$
>
> 两个 definitions 的 distinction 是：
>
> $$
> \text{pointwise}:\forall x \in A,\forall\varepsilon > 0,\exists N \in \mathbb{N}\text{such that}\ \left| {f_{n{(x)}} - f(x)} \right| < \varepsilon\ \text{whenever}n \geq N;
> $$
> $$
> \text{uniform}:\forall\varepsilon > 0,\exists N \in \mathbb{N}\text{such that}\ \forall x \in A,\left| {f_{n{(x)}} - f(x)} \right| < \varepsilon\ \text{whenever}n \geq N.
> $$
>
> pointwise 是逐点各自使用自己的 $\varepsilon$ bound；uniform 是一个 $\varepsilon$ bound 所有 $x \in A$ 共用，把 $A$ 中所有点作为整体联系起来。

> **Theorem: Uniform convergence and uniformly Cauchy**
>
> $\left( {f_{n}:A\rightarrow\mathbb{R}} \right)$ converges uniformly iff it is uniformly Cauchy on $A$, i.e. for every $\varepsilon > 0$ there is $N$ such that
>
> $$
> \left| {f_{n{(x)}} - f_{m{(x)}}} \right| < \varepsilon
> $$
>
> for all $x \in A$ and $m,n \geq N$.

> **Proof**
>
> If $f_{n}\rightarrow f$ uniformly, choose $N$ such that $\left| {f_{n{(x)}} - f(x)} \right| < \frac{\varepsilon}{2}$ for $x \in A,n \geq N$. Then
>
> $$
> \left| {f_{n{(x)}} - f_{m{(x)}}} \right| \leq \left| {f_{n{(x)}} - f(x)} \right| + \left| {f_{m{(x)}} - f(x)} \right| < \varepsilon.
> $$
>
> Conversely, uniformly Cauchy implies each scalar sequence $\left( f_{n{(x)}} \right)$ is Cauchy, so define $f(x) = \lim_{n\rightarrow\infty}f_{n{(x)}}$. Choose $N$ with $\left| {f_{n{(x)}} - f_{m{(x)}}} \right| < \frac{\varepsilon}{2}$ for all $x$ and $m,n \geq N$; taking $m\rightarrow\infty$ shows $\left| {f_{n{(x)}} - f(x)} \right| \leq \varepsilon$ for all $x,n \geq N$.

> **Theorem: A uniform limit of continuous functions is continuous**
>
> If $\left( {f_{n}:A\rightarrow\mathbb{R}} \right)\rightarrow f$ uniformly and $f_{n}$ is continuous at $a$ for every $n \in \mathbb{N}$, then $f$ is continuous at $a$. In symbols,
>
> $$
> \lim\limits_{x\rightarrow a}\lim\limits_{n\rightarrow\infty}f_{n{(x)}} = \lim\limits_{n\rightarrow\infty}\lim\limits_{x\rightarrow a}f_{n{(x)}}.
> $$

> **Proof**
>
> Let $\varepsilon > 0$. Uniform convergence supplies $N$ with $\left| {f_{N{(x)}} - f(x)} \right| < \frac{\varepsilon}{3}$ for all $x \in A$. By continuity of $f_{N}$ at $a$, choose $\delta > 0$ such that $\left| {f_{N{(x)}} - f_{N{(a)}}} \right| < \frac{\varepsilon}{3}$ if $\left| {x - a} \right| < \delta$. Then
>
> $$
> \left| {f(x) - f(a)} \right| \leq \left| {f(x) - f_{N{(x)}}} \right| + \left| {f_{N{(x)}} - f_{N{(a)}}} \right| + \left| {f_{N{(a)}} - f(a)} \right| < \varepsilon.
> $$

> **Theorem: Uniform limit of integrable functions is integrable**
>
> Suppose $\left( {f_{n}:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}} \right)\rightarrow f$ uniformly on $\left\lbrack {a,b} \right\rbrack$. If every $f_{n}$ is Riemann integrable, then $f$ is integrable and
>
> $$
> \int_{a}^{b}\lim\limits_{n\rightarrow\infty}f_{n} = \int_{a}^{b}f = \lim\limits_{n\rightarrow\infty}\int_{a}^{b}f_{n}.
> $$

> **Proof**
>
> Uniform convergence makes $\left( f_{n} \right)$ uniformly Cauchy, so fix $N$ with $\left| {f_{m{(x)}} - f_{n{(x)}}} \right| < \frac{\varepsilon}{b - a}$ for all $x \in \left\lbrack {a,b} \right\rbrack$ and $m,n \geq N$. Then
>
> $$
> \left| {\int_{a}^{b}f_{m} - \int_{a}^{b}f_{n}} \right| < \varepsilon,
> $$
>
> so $\left( {\int_{a}^{b}f_{n}} \right)$ is Cauchy and converges, say to $\ell$. Take $n$ sufficiently large so that $\left| {\int_{a}^{b}f_{n} - \ell} \right| < \frac{\varepsilon}{3}$, $\left| {f_{n{(x)}} - f(x)} \right| < \frac{\varepsilon}{3\left( {b - a} \right)}$ for all $x$, and a partition $P$ with $U\left( {f_{n},P} \right) - L\left( {f_{n},P} \right) < \frac{\varepsilon}{3}$. The uniform bound gives
>
> $$
> \left| {U\left( {f,P} \right) - U\left( {f_{n},P} \right)} \right| \leq \sum\limits_{k = 1}^{m{({\sup f{\lbrack I_{k}\rbrack} - \sup f_{n{\lbrack I_{k}\rbrack}}})}}\Delta x_{k} \leq \frac{\varepsilon}{3},
> $$
>
> and then $\left| {U\left( {f,P} \right) - \ell} \right| < \varepsilon$; likewise $\left| {L\left( {f,P} \right) - \ell} \right| < \varepsilon$. Since $\varepsilon$ is arbitrary, $\int_{a}^{b}f = \ell$.

> **Theorem: Uniform limit of a derivative sequence**
>
> Suppose $\left( {f_{n}:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}} \right)_{n \in \ \mathbb{N}}$ is a sequence of $C^{1}$ functions, $\left( f_{n} \right)\rightarrow f$ pointwise on $\left\lbrack {a,b} \right\rbrack$, and $\left( f_{n}' \right)$ converges uniformly on $\left\lbrack {a,b} \right\rbrack$. Then $f \in C^{1}$ and
>
> $$
> f' = \lim\limits_{n\rightarrow\infty}f_{n}'
> $$
>
> on $\left\lbrack {a,b} \right\rbrack$.

> **Proof**
>
> Write $g = \lim_{n\rightarrow\infty}f_{n}'$. Each $f_{n}'$ is continuous and integrable, so $g$ is continuous and integrable by the preceding theorems. For $x \in \left\lbrack {a,b} \right\rbrack$,
>
> $$
> \int_{a}^{x}g = \int_{a}^{x}\lim\limits_{n\rightarrow\infty}f_{n}' = \lim\limits_{n\rightarrow\infty}\int_{a}^{x}f_{n}' = \lim\limits_{n\rightarrow\infty}\left( {f_{n{(x)}} - f_{n{(a)}}} \right) = f(x) - f(a).
> $$
>
> FTC II now gives $f' = g$. The lecture notes that this theorem has many conditions and presents a stronger version.

> **Theorem: Stronger uniform-convergence derivative theorem**
>
> Let $\left( {f_{n}:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}} \right)_{n \in \ \mathbb{N}}$ with every $f_{n} \in C^{1}$. Suppose there is a point $x_{0} \in \left\lbrack {a,b} \right\rbrack$ such that $\left( f_{n{(x_{0})}} \right)$ converges, and $\left( f_{n}' \right)\rightarrow g$ uniformly. Then $\left( f_{n} \right)\rightarrow f$ uniformly for some $f \in C^{1}$, where $f' = g$.

> **Proof**
>
> Uniform convergence of the derivatives gives, for $m,n \geq N$,
>
> $$
> \left| {f_{n}^{'{(x)}} - f_{m}^{'{(x)}}} \right| < \frac{\varepsilon}{2\left( {b - a} \right)}
> $$
>
> for all $x$. Pointwise convergence at $x_{0}$ gives $\left| {f_{n{(x_{0})}} - f_{m{(x_{0})}}} \right| < \frac{\varepsilon}{2}$. Thus, for arbitrary $x$,
>
> $$
> \left| {f_{n{(x)}} - f_{m{(x)}}} \right| \leq \left| {f_{n{(x_{0})}} - f_{m{(x_{0})}}} \right| + \left| {\int_{x_{0}}^{x{({f_{n}^{'{(t)}} - f_{m}^{'{(t)}}})}}\, dt} \right| < \varepsilon.
> $$
>
> So $\left( f_{n} \right)$ is uniformly Cauchy, hence uniformly convergent. Letting limits in the displayed FTC identity gives
>
> $$
> f(x) = f\left( x_{0} \right) + \int_{x_{0}}^{x}g(t)\, dt,
> $$
>
> and FTC II yields $f' = g$.

> **Remark: Summary**
>
> 1.  A uniform limit of continuous $\left( f_{n} \right)$ is continuous.
> 2.  Under suitable conditions,
>
> $$
> \int_{a}^{b}\lim\limits_{n\rightarrow\infty}f_{n} = \lim\limits_{n\rightarrow\infty}\int_{a}^{b}f_{n},\quad\frac{d}{dx}\left( {\lim\limits_{n\rightarrow\infty}f_{n{(x)}}} \right) = \lim\limits_{n\rightarrow\infty}\frac{d}{dx}f_{n{(x)}}.
> $$
>
> Since differentiation and integration are very basic operations, the uniform-convergence hypotheses ensure the desired stability.

## Series of functions and power series (L20)

> **Definition: Series of functions**
>
> If $\left( {f_{k}:A\rightarrow\mathbb{R}} \right)_{k \in \ \mathbb{N}}$ is a sequence of functions, then $\left( {\sum_{k = 1}^{n}f_{k}} \right)_{n \in \ \mathbb{N}}$ is its sequence of partial sums. Write $\sum f_{k}$ or $\sum_{k = 1}^{\infty}f_{k}$ for the infinite series determined by $\left( f_{k} \right)$.
>
> On $B \subset A$, the following are definitions:
>
> 1.  $\sum f_{k}$ **converges** on $B$ iff, for every $x \in B$, $\lim_{n\rightarrow\infty}\sum_{k = 1}^{n}f_{k{(x)}}$ exists; equivalently there is $f:B\rightarrow\mathbb{R}$ with $\left( {\sum_{k = 1}^{n}f_{k}} \right)\rightarrow f$ pointwise.
> 2.  It converges **uniformly** on $B$ iff those partial sums converge uniformly to some $f:B\rightarrow\mathbb{R}$.
> 3.  It converges **absolutely** on $B$ iff $\sum_{k = 1}^{\infty}\left| f_{k{(x)}} \right|$ converges at every $x \in B$; equivalently $\sum\left| f_{k} \right|$ converges on $B$.

> **Theorem: Term-by-term operations for a function series**
>
> 1.  If every $f_{k}$ is continuous on $A$ and $\sum f_{k}\rightarrow S$ uniformly on $A$, then $S$ is continuous on $A$.
>
> 2.  If every $f_{k}$ is continuous on $\left\lbrack {a,b} \right\rbrack$ and $\sum f_{k}\rightarrow S$ uniformly on $\left\lbrack {a,b} \right\rbrack$, then $S$ is integrable and
>
>     $$
>     \int_{a}^{b}S = \sum\limits_{k = 1}^{\infty}\int_{a}^{b}f_{k}.
>     $$
>
> 3.  If every $f_{k} \in C^{1}$ on $\left\lbrack {a,b} \right\rbrack$, $\sum f_{k}\rightarrow S$ on $\left\lbrack {a,b} \right\rbrack$ (not necessarily uniformly), and $\sum f_{k}'$ converges uniformly on $\left\lbrack {a,b} \right\rbrack$, then $S \in C^{1}$ and $S' = \sum f_{k}'$.
>
> Stronger version of (3): if $f_{k} \in C^{1}$ on $\left\lbrack {a,b} \right\rbrack$, there exists $x_{0} \in \left\lbrack {a,b} \right\rbrack$ such that $\sum f_{k{(x_{0})}}$ converges, and $\sum f_{k}'$ converges uniformly on $\left\lbrack {a,b} \right\rbrack$, then $\sum f_{k}$ converges uniformly to some $S \in C^{1}$, and $S' = \sum f_{k}'$.

> **Proof**
>
> Since every partial sum is continuous, differentiable, and integrable as appropriate, apply the corresponding uniform-limit theorem to the sequence of partial sums $\left( {\sum_{k = 1}^{n}f_{k}} \right)_{n \in \ \mathbb{N}}$.

## Power series

> **Definition: Power series**
>
> For a sequence $\left( a_{n} \right)$ in $\mathbb{R}$, the power series centered at $c$ with coefficients $\left( a_{n} \right)$ is the series of functions
>
> $$
> \sum\limits_{n = 0}^{\infty}a_{n{({x - c})}}^{n}.
> $$
>
> The partial sums are polynomials. Custom: for $x \neq 0$, $0^{x} = 0$; and $x^{0} = 1$ for every $x$ (including $0^{0} = 1$).
>
> Note: the L20 pages use power series centered at $0$ in the displayed examples, but every result applies to a center $c$ by replacing $x$ with $x - c$.

> **Theorem: Cauchy-Hadamard theorem**
>
> Given a power series $\sum_{n = 0}^{\infty}a_{n}x^{n}$, let $\rho = \operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}}$. Then it converges absolutely when $|x|\rho < 1$ and diverges when $|x|\rho > 1$. Its radius of convergence is
>
> $$
> R = \frac{1}{\rho}.
> $$
>
> The set of all $x$ for which $\sum a_{n{({x - c})}}^{n}$ converges is an interval, called the interval of convergence.

> **Proof**
>
> If $|x|\operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}} < r < 1$, then for all but finitely many $n$, $|x|\left| a_{n} \right|^{\frac{1}{n}} \leq r$, so $\left| {a_{n}x^{n}} \right| \leq r^{n}$ and comparison applies. If $|x|\rho > r > 1$, then $\left| {a_{n}x^{n}} \right| > r^{n} > 1$ infinitely often, so the $n$th-term test gives divergence.

> **Remark: Endpoints and a ratio shortcut**
>
> Radius of convergence cannot imply interval of convergence: endpoints $c - R,c + R$ may or may not be included, so they must be checked separately. If $\lim_{n\rightarrow\infty}\left| \frac{a_{n + 1}}{a_{n}} \right| = \ell$ exists, then $\frac{1}{\ell}$ is the radius; this is often the best way to find $R$, but it is not more general than $\operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}}$.

> **Example: Power-series radii and intervals**
>
> 1.  For $\sum_{n = 0}^{\infty}\frac{x^{n}}{n!}$, $\left| \frac{a_{n + 1}}{a_{n}} \right| = \frac{1}{n + 1}\rightarrow 0$, hence $R = \infty$; it converges for all $x \in \mathbb{R}$, and in fact equals $e^{x}$ by Taylor.
>
> 2.  For $\sum_{n = 0}^{\infty}x^{n}$, $\rho = R = 1$; it diverges for $x = \pm 1$, so the interval is $\left( {- 1,1} \right)$, and
>
>     $$
>     \sum\limits_{n = 0}^{\infty}x^{n} = \frac{1}{1 - x}\quad\text{for}\ x \in \left( {- 1,1} \right).
>     $$
>
> 3.  The handwritten page writes $\sum_{n = 0}^{\infty}\left( \frac{1}{n} \right)x^{n}$. Its subsequent endpoint calculation treats the terms as the harmonic series from $n = 1$: $\rho = R = 1$; at $x = 1$ it diverges, and at $x = - 1$ it is alternating harmonic and converges. Thus the interval written is $\left\lbrack {- 1,1} \right)$.
>
> 4.  The handwritten page likewise writes $\sum_{n = 0}^{\infty}\left( \frac{1}{n^{2}} \right)x^{n}$; the subsequent endpoint sums begin at $n = 1$. Here $\rho = R = 1$ and both $\sum\frac{1}{n^{2}}$ and $\frac{{\sum\left( {- 1} \right)}^{n}}{n^{2}}$ converge, so the interval is $\left\lbrack {- 1,1} \right\rbrack$.
>
> 5.  For $\sum_{n = 0}^{\infty}n!x^{n}$, $\rho = \infty$, so $R = 0$ and it diverges for all $x \neq 0$.

> **Theorem: Weierstrass M-Test**
>
> Let $f_{k}:A\rightarrow\mathbb{R}$ be a sequence of functions, and let $\left( M_{k} \right)$ be a sequence in $\mathbb{R}$ such that
>
> $$
> \left| f_{k{(x)}} \right| \leq M_{k}
> $$
>
> for all $k \in \mathbb{N}$ and $x \in A$. If $\sum M_{k} < \infty$, then $\sum f_{k}$ converges uniformly and absolutely on $A$.

> **Proof**
>
> Let $g_{n{(x)}} = \sum_{k = 1}^{n}f_{k{(x)}}$. Since $\sum M_{k}$ satisfies Cauchy, choose $N$ so that $\left| {\sum_{k = m + 1}^{n}M_{k}} \right| < \varepsilon$ for $N \leq m \leq n$. Then for all $x \in A$,
>
> $$
> \left| {g_{n{(x)}} - g_{m{(x)}}} \right| = \left| {\sum\limits_{k = m + 1}^{n}f_{k{(x)}}} \right| \leq \sum\limits_{k = m + 1}^{n}\left| f_{k{(x)}} \right| \leq \sum\limits_{k = m + 1}^{n}M_{k} < \varepsilon.
> $$
>
> Thus $\left( g_{n} \right)$ is uniformly Cauchy and $\sum f_{k}$ converges uniformly; the same calculation gives uniform absolute convergence.

> **Corollary: Uniform convergence inside a radius**
>
> If $\sum a_{n}x^{n}$ has radius of convergence $R$, then for every $0 \leq K < R$, $\sum a_{n}x^{n}$ converges uniformly to a continuous function on $\left\lbrack {- K,K} \right\rbrack$. Indeed $\sum\left| a_{n} \right|K^{n} < \infty$ and $\left| {a_{n}x^{n}} \right| \leq \left| a_{n} \right|K^{n}$ on $\left\lbrack {- K,K} \right\rbrack$, so M-test applies.
>
> Consequently $f(x) = \sum a_{n}x^{n}$ is continuous on $\left( {- R,R} \right)$. However its convergence on the entire interval of convergence may not be uniform:
>
> $$
> \sum\limits_{n = 1}^{\infty}\left( {- 1} \right)^{n + 1}\frac{\left( {x - 1} \right)^{n}}{n}
> $$
>
> converges to $\ln x$ on $\left( {0,2} \right\rbrack$ as written in the source note, but the convergence is not uniform there (the graph marks the unbounded behavior at $x = 0$). Fact: a uniform limit of uniformly continuous functions is uniformly continuous.

> **Theorem: Abel's theorem**
>
> 1.  If a power series $\sum_{k = 1}^{\infty}a_{k}x^{k}$ converges at $x = x_{0}$, then it converges uniformly on $\left( {- \left| x_{0} \right|,\left| x_{0} \right|} \right)$. If it diverges at $x_{0}$, then it diverges on $\left( {- \infty, - \left| x_{0} \right|} \right) \cup \left( {\left| x_{0} \right|,\infty} \right)$.
> 2.  If a power series has radius of convergence $R$, then convergence at an endpoint of its radius implies convergence at every point between that endpoint and $0$; divergence at an endpoint implies divergence on the corresponding exterior ray.
>
> Note: the convergence of $\sum a_{n}x^{n}$ on its interval of convergence may not be uniform.

> **Proof**
>
> 提示一下，下边（略）。

> **Theorem: Term-by-term integration and differentiation of power series**
>
> Let $\sum_{n = 0}^{\infty}a_{n}x^{n}$ have radius of convergence $R > 0$ and let $f(x) = \sum_{n = 0}^{\infty}a_{n}x^{n}$ for $x \in \left( {- R,R} \right)$.
>
> 1.  For every $\left\lbrack {a,b} \right\rbrack \subset \left( {- R,R} \right)$, $f$ is integrable and
>
>     $$
>     \int_{a}^{b}f = \sum\limits_{n = 0}^{\infty}\int_{a}^{b}a_{n}x^{n}\, dx.
>     $$
>
> 2.  The power series $\sum_{n = 1}^{\infty}na_{n}x^{n - 1}$ has radius $R$, $f$ is differentiable on $\left( {- R,R} \right)$, and
>
>     $$
>     f^{'{(x)}} = \sum\limits_{n = 1}^{\infty}na_{n}x^{n - 1}.
>     $$

> **Proof**
>
> \(i\) follows from integrability of polynomials and uniform convergence of $\sum a_{n}x^{n}$ on $\left\lbrack {a,b} \right\rbrack$. For (ii), for $t \neq 0$,
>
> $$
> \operatorname{lim\, sup}\left| {\frac{n}{t}a_{n}} \right|^{\frac{1}{n}} = \left| \frac{1}{t} \right|\operatorname{lim\, sup}\left| {na_{n}} \right|^{\frac{1}{n}} = \left| \frac{1}{t} \right|\operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}},
> $$
>
> so the differentiated series has radius $R$; its uniform convergence on compact subintervals and the preceding derivative theorem prove the claim.

> **Example: Taylor series, calculus, and its caveat**
>
> If $f \in C^{\infty}$, try to approximate $f$ near $c$ with
>
> $$
> P_{n{(x)}} = \sum\limits_{k = 0}^{n}f^{(k)}\frac{c}{k!}\left( {x - c} \right)^{k},
> $$
>
> and define
>
> $$
> T(x) = \lim\limits_{n\rightarrow\infty}P_{n{(x)}} = \sum\limits_{k = 0}^{\infty}f^{(k)}\frac{c}{k!}\left( {x - c} \right)^{k},
> $$
>
> where the domain is the interval of convergence of $T$. The source records power series
>
> $$
> e^{x} = \sum\limits_{n = 0}^{\infty}\frac{x^{n}}{n!},\quad\sin x = \sum\limits_{n = 0}^{\infty}\left( {- 1} \right)^{n}\frac{x^{2n + 1}}{\left( {2n + 1} \right)!},\quad\cos x = \sum\limits_{n = 0}^{\infty}\left( {- 1} \right)^{n}\frac{x^{2n}}{\left( {2n} \right)!}.
> $$
>
> Thus $\frac{d}{dx}\left( {\sin x} \right) = \cos x$, $\frac{d}{dx}\left( {\cos x} \right) = - \sin x$, and $\frac{d}{dx}\left( e^{x} \right) = e^{x}$; $e^{\pi i} + 1 = 0$. Termwise integration yields
>
> $$
> \int\cos\left( x^{2} \right)\, dx = \sum\limits_{n = 0}^{\infty}\frac{\left( {- 1} \right)^{n}}{\left( {2n} \right)!\left( {4n + 1} \right)}x^{4n + 1}.
> $$
>
> Remark: The Taylor expansion of $f$ may not converge to $f$ at $x = a$ even if it converges at $x = a$. Let
>
> $$
> f(x) = \left\{ \begin{matrix}
> e^{- \frac{1}{x^{2}}} & {x \neq 0} \\
> 0 & {x = 0}
> \end{matrix} \right..
> $$
>
> Then $f \in C^{\infty}$ on $\mathbb{R}$ and $f^{(n)}(0) = 0$ for all $n \in \mathbb{N}$. Its Taylor series converges everywhere, but converges to $f$ itself only at $x = 0$. If $f \in C^{\infty}$ and $T(x)\rightarrow f$ pointwise for all $x$ lies in the domain of $T$, then $f$ is a real analytic function, i.e. $f \in C^{\omega}$ ($C^{\omega} \subset C^{\infty}$).
