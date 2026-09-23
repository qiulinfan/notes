---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: MATH 395
date: 2026
description: Multivariate Analysis notes migrated from the explicitly selected personal historical sources.
keywords:
- Multivariate Analysis
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/multivariate-analysis/chapters/02-multivariable-differentiation.typ"
subtitle: Typst-first mathematics notes
title: Multivariate Analysis
---
# Multivariable differentiation

## Continuity and differentiability

> **Definition: Continuity and uniform continuity**
>
> A map $f:X\rightarrow Y$ between metric spaces is continuous at $x_{0}$ if for every $\varepsilon > 0$ there is $\delta > 0$ such that $d_{X{({x,x_{0}})}} < \delta$ implies $d_{Y{({f{(x)},f{(x_{0})}})}} < \varepsilon$; equivalently, $f\left( B_{\delta{(x_{0})}} \right) \subseteq B_{\varepsilon{({f{(x_{0})}})}}$. It is uniformly continuous if $\delta$ can be chosen independently of $x_{0}$.

> **Theorem: Compact domain gives uniform continuity**
>
> If $f:X\rightarrow Y$ is continuous and $X$ is compact, then $f$ is uniformly continuous.

> **Proof**
>
> For each $x \in X$, continuity provides a ball $B_{\frac{\delta{(x)}}{2}}(x)$ mapped into $B_{\frac{\varepsilon}{2}}\left( {f(x)} \right)$. Take a finite subcover and put $\delta = \min_{i}\frac{\delta\left( x_{i} \right)}{2}$. If $d\left( {a_{1},a_{2}} \right) < \delta$, choose $i$ with $a_{1} \in B_{\frac{\delta{(x_{i})}}{2}}\left( x_{i} \right)$; then $d\left( {a_{2},x_{i}} \right) < \delta\left( x_{i} \right)$ and the triangle inequality gives $d\left( {f\left( a_{1} \right),f\left( a_{2} \right)} \right) < \varepsilon$.

> **Remark**
>
> The notes record that continuous functions map compact sets to compact sets, and that a continuous real-valued function on a compact set attains a maximum and a minimum. The example $f(x) = x^{2}:\mathbb{R}\rightarrow\mathbb{R}$ is not uniformly continuous.

> **Definition: Differentiability**
>
> Let $A \subseteq \mathbb{R}^{n}$ be open and $f:A\rightarrow\mathbb{R}^{m}$. The map $f$ is differentiable at $x_{0} \in A$ if there is a linear map $A_{0}:\mathbb{R}^{n}\rightarrow\mathbb{R}^{m}$ such that $\lim_{{\| h\|}\rightarrow 0}\frac{\left\| {f\left( {x_{0} + h} \right) - f\left( x_{0} \right) - A_{0}h} \right\|}{\left\| h \right\|} = 0$. The linear map is unique and is denoted $Df\left( x_{0} \right)$.

> **Proof**
>
> If $A_{1},A_{2}$ both satisfy the definition, then $\frac{\left\| {\left( {A_{1} - A_{2}} \right)h} \right\|}{\left\| h \right\|}$ is bounded by the two remainders and tends to zero. A nonzero matrix has a vector on which this quotient is nonzero, so $A_{1} = A_{2}$.

> **Remark**
>
> The Euclidean norm is used in the written definition, but the notes stress that any norm would give the same notion. $Df\left( x_{0} \right)$ is the best linear approximation to $h\mapsto f\left( {x_{0} + h} \right) - f\left( x_{0} \right)$, and the remainder is sublinear: $r_{x_{0}}(h) = f\left( {x_{0} + h} \right) - f\left( x_{0} \right) - Df\left( x_{0} \right)h = o\left( \left\| h \right\| \right)$.

> **Definition: Directional and partial derivatives**
>
> For $u \in \mathbb{R}^{n}$, the directional derivative, when it exists, is $\left. D_{u}f\left( x_{0} \right) = \lim_{t\rightarrow 0}\frac{f\left( {x_{0} + tu} \right) - f\left( x_{0} \right)}{t} = \left( {\frac{d}{d}t} \right) \middle| {}_{t = 0}\ f\left( {x_{0} + tu} \right) \right.$. The $j$th partial derivative is $\partial\frac{f}{\partial}x_{j}\left( x_{0} \right) = D_{e_{j}}f\left( x_{0} \right)$.

> **Theorem: Differentiability controls directional derivatives**
>
> If $f$ is differentiable at $x_{0}$, then every directional derivative exists and $D_{u}f\left( x_{0} \right) = Df\left( x_{0} \right)u$. In particular, $u\mapsto D_{u}f\left( x_{0} \right)$ is linear.

> **Proof**
>
> Substitute $h = tu$ into the differentiability remainder. For vector-valued $f = \left( {f_{1},\ldots,f_{m}} \right)$ this is componentwise.

> **Remark**
>
> Directional derivatives may exist without differentiability. Conversely, differentiability is a local approximation by a **linear** map, not merely a collection of one-dimensional limits. For $f\left( {x_{1},x_{2}} \right) = \sin\left( {x_{1}x_{2}} \right)$ and $u = \left( {1,0} \right)$, the notes compute $D_{u}f\left( {x_{1},x_{2}} \right) = x_{2}\cos\left( {x_{1}x_{2}} \right)$.

## Jacobians and the $C^{1}$ criterion

> **Theorem: Jacobian and components**
>
> Let $f = \left( {f_{1},\ldots,f_{m}} \right):A \subseteq \mathbb{R}^{n}\rightarrow\mathbb{R}^{m}$. If $f$ is differentiable at $x_{0}$, then $Df\left( x_{0} \right) = \begin{pmatrix}
> {\partial_{1}f_{1}\left( x_{0} \right)} & \ldots & {\partial_{n}f_{1}\left( x_{0} \right)} \\
> \ldots & \ldots & \ldots \\
> {\partial_{1}f_{m{(x_{0})}}} & \ldots & {\partial_{n}f_{m{(x_{0})}}}
> \end{pmatrix}$. Conversely, $f$ is differentiable iff each component is differentiable.

> **Proof**
>
> The $j$th column is $Df\left( x_{0} \right)e_{j} = D_{e_{j}}f\left( x_{0} \right)$, whose entries are $\partial\frac{f_{i}}{\partial}x_{j{(x_{0})}}$. The lecture's example is $F\left( {x,y} \right) = \left( {x^{2} + y^{2},xy,\sin y} \right)$, for which $DF\left( {x,y} \right) = \begin{pmatrix}
> {2x} & {2y} \\
> y & x \\
> 0 & {\cos y}
> \end{pmatrix}$ and $D_{1,2}F = D_{e_{1}}F + 2D_{e_{2}}F$.

> **Definition: $C^{r}$ and $C^{\infty}$**
>
> A function is $C^{r}$ if all partial derivatives of order at most $r$ exist and are continuous. It is $C^{\infty}$ if it is $C^{r}$ for every $r \in \mathbb{N}$. Higher derivatives are defined componentwise using multi-indices.

> **Theorem: Continuous partials imply differentiability**
>
> Let $f:A \subseteq \mathbb{R}^{n}\rightarrow\mathbb{R}^{m}$, with $A$ open. If all first partial derivatives exist in a neighborhood of $x_{0}$ and are continuous at $x_{0}$, then $f$ is differentiable at $x_{0}$. Thus every $C^{1}$ map is differentiable.

> **Proof**
>
> Reduce to a scalar component. With $h = \left( {h_{1},\ldots,h_{n}} \right)$ set $p_{0} = x_{0}$, $p_{i} = p_{i - 1} + h_{i}e_{i}$. Apply the one-variable mean value theorem to $\varphi_{i{(s)}} = f\left( {p_{i - 1} + se_{i}} \right)$ on $\left\lbrack {0,h_{i}} \right\rbrack$. For some points $q_{i}$ on the successive segments, $f\left( {x_{0} + h} \right) - f\left( x_{0} \right) = \sum_{i}\partial_{i}f\left( q_{i} \right)h_{i}$. Subtract $\sum_{i}\partial_{i}f\left( x_{0} \right)h_{i}$ and use $\left\| h \right\|_{1} \leq \sqrt{n}\left\| h \right\|$; continuity makes the remainder quotient tend to zero.

> **Remark**
>
> The converse is false: $x\mapsto x^{2}\sin\left( \frac{1}{x} \right)$ (with the value at zero) is differentiable but its derivative is not continuous. The handwritten notes emphasize that, unlike $f:\mathbb{R}\rightarrow\mathbb{R}$, the derivative of a general $f:\mathbb{R}^{n}\rightarrow\mathbb{R}^{m}$ takes values in a different function space.

## Higher derivatives and products

> **Theorem: 任意二阶 partial 可交换**
>
> Last time we proved: if $f \in C^{2}$, then $\partial^{2}\frac{f}{\partial x_{i}\partial x_{j}} = \partial^{2}\frac{f}{\partial x_{j}\partial x_{i}}$. （任意二阶 partial 可交换。）

> **Proof**
>
> In the scalar two-variable case, put $G\left( {h,k} \right) = f\left( {x_{1} + h,x_{2} + k} \right) - f\left( {x_{1} + h,x_{2}} \right) - f\left( {x_{1},x_{2} + k} \right) + f\left( {x_{1},x_{2}} \right)$. Applying the one-variable mean value theorem twice gives both $G\left( {h,k} \right) = hk\partial_{1}\partial_{2}f\left( {s_{0},t_{0}} \right)$ and $G\left( {h,k} \right) = hk\partial_{2}\partial_{1}f\left( {s_{0}',t_{0}'} \right)$, where the intermediate points tend to $\left( {x_{1},x_{2}} \right)$. Continuity of the second partials gives the result.

> **Theorem: Higher partial regularity**
>
> $f \in C^{k + 1}$ if and only if all partials of $f$ are in $C^{k}$.

> **Theorem: Corollary（因而）**
>
> 如果 $f:A \subseteq \mathbb{R}^{n}\rightarrow\mathbb{R}$ is $C^{r}$，then for every $2 \leq m \leq r$,
>
> $\partial^{m}\frac{f}{\partial x_{i_{1}}\partial x_{i_{2}}\cdots\partial x_{i_{m}}} = \partial^{m}\frac{f}{\partial x_{i_{\pi{(1)}}}\partial x_{i_{\pi{(2)}}}\cdots\partial x_{i_{\pi{(m)}}}}$
>
> for any permutation $\pi \in S_{m}$。（即 $f \in C^{r}$，$f$ 的 $r$-order 的 partial derivative 可以随意换顺序。）For example, if $f$ is $C^{3}$,
>
> $\partial^{3}\frac{f}{\partial x\partial y\partial z} = \partial^{3}\frac{f}{\partial x\partial z\partial y} = \partial^{3}\frac{f}{\partial z\partial x\partial y} = \cdots$.

> **Definition: 定义 multi-index notation**
>
> 一个 $n$-tuple $\alpha = \left( {\alpha_{1},\ldots,\alpha_{n}} \right)$ is a multi-index, s.t. each $\alpha_{i} \in \mathbb{Z}_{\geq 0}$. If $\alpha$ is a multi-index, define its degree (or order) by $|\alpha| = \sum_{i}\alpha_{i}$, and write $\alpha! = \prod_{i}\alpha_{i!}$（note: $0! = 1$）. For $x \in \mathbb{R}^{n}$, $x^{\alpha} = x_{1}^{\alpha_{1}}x_{2}^{\alpha_{2}}\cdots x_{n}^{\alpha_{n}}$; for $f:\mathbb{R}^{n}\rightarrow\mathbb{R}$, $\partial^{\alpha}f = \left( \frac{\partial}{\partial x_{1}} \right)^{\alpha_{1}}\cdots\left( \frac{\partial}{\partial x_{n}} \right)^{\alpha_{n}}f$。 每个运算符 $\frac{\partial}{\partial x_{i}}$ 只对 $x_{i}$ 求导，随后可按任意顺序排列。 For example, for $f:\mathbb{R}^{2}\rightarrow\mathbb{R}$, $\partial^{2,1}f = \left( \frac{\partial}{\partial x_{1}} \right)^{2}\left( \frac{\partial}{\partial x_{2}} \right)f = \partial^{3}\frac{f}{\partial x_{1}\partial x_{1}\partial x_{2}}$.

> **Theorem: Multinomial theorem**
>
> For $x \in \mathbb{R}^{n}$ and $k \in \mathbb{N}$, $\left( {x_{1} + \cdots + x_{n}} \right)^{k} = \sum_{{|\alpha|} = k}\frac{k!}{\alpha!}x^{\alpha}$.

> **Remark**
>
> $\frac{k!}{\alpha!}$ is the number of ways to divide a set of size $k$ into disjoint subsets of sizes $\alpha_{1},\ldots,\alpha_{n}$. There are $k!$ ways to order the set, and $\alpha! = \alpha_{1!}\alpha_{2!}\cdots\alpha_{n!}$ ways to get the same result.

> **Theorem: Higher-order product rule**
>
> If $f,g$ are $C^{|\alpha|}$, then $\partial^{\alpha{({fg})}} = \sum_{\beta + \gamma = \alpha}\frac{\alpha!}{\beta!\gamma!}\left( {\partial^{\beta}f} \right)\left( {\partial^{\gamma}g} \right)$.

> **Proof**
>
> The $|\alpha| = 1$ case is the usual product rule. For the induction step, write $\alpha = e_{i} + \alpha'$ and differentiate the induction formula for $\alpha'$; reindex the two sums to obtain the multinomial coefficient $\frac{\alpha!}{\beta!\gamma!}$.

## Chain rule and Taylor's theorem

> **Theorem: Chain rule**
>
> Let $f:A \subseteq \mathbb{R}^{n}\rightarrow B \subseteq \mathbb{R}^{m}$ and $g:B\rightarrow\mathbb{R}^{p}$, with $A,B$ open. If $f$ is differentiable at $x_{0}$ and $g$ is differentiable at $f\left( x_{0} \right)$, then $g \circ f$ is differentiable at $x_{0}$ and $D\left( {g \circ f} \right)\left( x_{0} \right) = Dg\left( {f\left( x_{0} \right)} \right)Df\left( x_{0} \right)$.

> **Proof**
>
> Recall first the one-dimensional statement: $\left( {\frac{d}{d}x} \right)\left( {g \circ f} \right)(x) = g'\left( {f(x)} \right)f'(x)$（if $g'\left( {f(x)} \right)$ and $f'(x)$ exist）；one can view these as $1 \times 1$ matrices. Now put $y_{0} = f\left( x_{0} \right)$ and, for $h$ small, define the remainder
>
> $R_{f{(h)}} = \frac{f\left( {x_{0} + h} \right) - f\left( x_{0} \right) - Df\left( x_{0} \right)h}{\left\| h \right\|}$.
>
> Since $f$ is differentiable, $\left\| R_{f{(h)}} \right\|\rightarrow 0$ as $\left\| h \right\|\rightarrow 0$. For $k$ small, likewise set
>
> $R_{g{(k)}} = \frac{g\left( {y_{0} + k} \right) - g\left( y_{0} \right) - Dg\left( y_{0} \right)k}{\left\| k \right\|}$,
>
> so $\left\| R_{g{(k)}} \right\|\rightarrow 0$ as $\left\| k \right\|\rightarrow 0$. Set $A = Dg\left( y_{0} \right)Df\left( x_{0} \right)$ and $k = Df\left( x_{0} \right)h + \left\| h \right\| R_{f{(h)}}$. Then $f\left( {x_{0} + h} \right) = y_{0} + k$, and
>
> $\left\| k \right\| \leq \left\| {Df\left( x_{0} \right)} \right\|\left\| h \right\| + \left\| h \right\|\left\| R_{f{(h)}} \right\|$.
>
> In particular $k\rightarrow 0$ as $h\rightarrow 0$. The composite remainder is
>
> $R_{g \circ f}(h) = \frac{g\left( {y_{0} + k} \right) - g\left( y_{0} \right) - Ah}{\left\| h \right\|}$ $= \frac{Dg\left( y_{0} \right)\left( {Df\left( x_{0} \right)h + \left\| h \right\| R_{f{(h)}}} \right) + \left\| k \right\| R_{g{(k)}} - Ah}{\left\| h \right\|}$ $= Dg\left( y_{0} \right)R_{f{(h)}} + \left( \frac{\left\| k \right\|}{\left\| h \right\|} \right)R_{g{(k)}}$.
>
> The displayed bound and the two remainder limits make this tend to zero, which proves the stated matrix formula.

> **Definition: Convex set**
>
> A set $G \subseteq \mathbb{R}^{n}$ is convex if $tx + \left( {1 - t} \right)y \in G$ for all $x,y \in G$ and $t \in \left\lbrack {0,1} \right\rbrack$.

> **Theorem: Taylor's theorem**
>
> Let $G \subseteq \mathbb{R}^{n}$ be open and convex, let $f:G\rightarrow\mathbb{R}$ be $C^{k + 1}$, and let $a,x \in G$. Then $f(x) = \sum_{{|\alpha|} \leq k}\frac{\partial^{\alpha}f(a)}{\alpha!}\left( {x - a} \right)^{\alpha} + R_{a,k}(x)$, where, for some $c$ on the line segment from $a$ to $x$, $R_{a,k}(x) = \sum_{{|\alpha|} = k + 1}\frac{\partial^{\alpha}f(c)}{\alpha!}\left( {x - a} \right)^{\alpha}$.

> **Proof**
>
> Put $\varphi(t) = f\left( {a + t\left( {x - a} \right)} \right)$. The one-variable Taylor theorem applied at $t = 0$ gives $f(x) = \varphi(1)$. Repeated chain rule and the multinomial theorem yield $\varphi^{p}(t) = \sum_{{|\alpha|} = p}\frac{p!}{\alpha!}\left( {x - a} \right)^{\alpha}\partial^{\alpha}f\left( {a + t\left( {x - a} \right)} \right)$, giving the displayed polynomial and remainder.

> **Example: A second-order Taylor polynomial**
>
> For $f\left( {x,y} \right) = \sin\left( {x^{2} + y} \right)$, the notes compute at $\left( {0,0} \right)$: $\partial^{1,0}f = 2x\cos\left( {x^{2} + y} \right)$, $\partial^{0,1}f = \cos\left( {x^{2} + y} \right)$, $\partial^{2,0}f = 2\cos\left( {x^{2} + y} \right) - 4x^{2}\sin\left( {x^{2} + y} \right)$, $\partial^{1,1}f = - 2x\sin\left( {x^{2} + y} \right)$, and $\partial^{0,2}f = - \sin\left( {x^{2} + y} \right)$. Thus its degree-two Taylor polynomial is $T\left( {x,y} \right) = y + x^{2}$.

