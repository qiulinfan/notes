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
source: "notes/math/multivariate-analysis/chapters/05-integration-and-change-of-variables.typ"
subtitle: Typst-first mathematics notes
title: Multivariate Analysis
---
# Integration and change of variables

## Fubini's theorem

> **Theorem: Fubini for bounded Riemann integrable functions**
>
> Let $A \subset \mathbb{R}^{m}$ and $B \subset \mathbb{R}^{n}$ be boxes, and let $f:A \times B\rightarrow\mathbb{R}$ be bounded and Riemann integrable. For $x \in A$, put
>
> $$
> I(x) = \int_{B}\, f\left( {x,y} \right)\, dy,\quad I(x) = \int_{B}\, f\left( {x,y} \right)\, dy.
> $$
>
> Then $I$ and $I$ are Riemann integrable on $A$ and
>
> $$
> \int_{A \times B}f\left( {x,y} \right)\, d\left( {x,y} \right) = \int_{A}I(x)\, dx = \int_{A}I(x)\, dx.
> $$
>
> Consequently, $x\mapsto\int_{B}f\left( {x,y} \right)\, dy$ is integrable and
>
> $$
> \int_{A \times B}f\left( {x,y} \right)\, d\left( {x,y} \right) = \int_{A}\left( {\int_{B}f\left( {x,y} \right)\, dy} \right)\, dx.
> $$

> **Proof**
>
> Let $P_{A}$ and $P_{B}$ be partitions of $A$ and $B$, and let $P = P_{A} \times P_{B}$. If $R = R_{A} \times R_{B}$ is a subbox of $P$ and $x_{0} \in R_{A}$, then
>
> $$
> m_{R{(f)}} \leq \inf\limits_{y \in R_{B}}f\left( {x_{0},y} \right) = m_{R_{B}}\left( {f\left( {x_{0}, \cdot} \right)} \right).
> $$
>
> Taking the infimum in $x_{0}$ and then multiplying by the volume of $R_{A}$ gives
>
> $$
> m_{R{(f)}}\ \text{vol}(R) \leq m_{R_{A}}(I)\ \text{vol}\left( R_{A} \right)\ \text{vol}\left( R_{B} \right).
> $$
>
> On summing over the boxes of $P_{A}$ and $P_{B}$,
>
> $$
> L\left( {f,P} \right) \leq L\left( {I,P_{A}} \right) \leq U\left( {I,P_{A}} \right) \leq U\left( {f,P} \right).
> $$
>
> The same argument with suprema gives
>
> $$
> L\left( {f,P} \right) \leq L\left( {I,P_{A}} \right) \leq U\left( {I,P_{A}} \right) \leq U\left( {f,P} \right).
> $$
>
> Refine the product partitions so that $U\left( {f,P} \right) - L\left( {f,P} \right)$ tends to zero. The displayed inequalities force the lower and upper integrals of both sectional functions to agree, and their common integrals equal $\int_{A \times B}f$.

## Integrals over bounded sets

> **Definition: Zero extension and integral over a bounded set**
>
> Let $S \subset \mathbb{R}^{n}$ be bounded and let $Q$ be a box containing $S$. For a bounded function $f:S\rightarrow\mathbb{R}$, define its zero extension to $Q$ by
>
> $$
> f_{S{(x)}} = \left\{ \begin{matrix}
> {f(x)} & \\
>  & {x \in S} \\
> {\backslash 0} & \\
>  & {x \notin S.}
> \end{matrix} \right..
> $$
>
> If $f_{S}$ is Riemann integrable on $Q$, define
>
> $$
> \int_{S}f = \int_{Q}f_{S}.
> $$

> **Lemma: Independence of the containing box**
>
> If $Q$ and $Q'$ are boxes containing $S$ and the zero extension is integrable on one of them, then it is integrable on the other, with the same integral.

> **Proof**
>
> Enclose $Q \cup Q'$ in a larger box $R$. The two extensions to $R$ differ only by functions which vanish off a set on which they already agree; partition $R$ along the faces of $Q$ and $Q'$. Additivity for the resulting subboxes shows that the new pieces outside the original containing box contribute $0$. Thus both definitions are the same integral over $R$.

> **Proposition: Elementary properties**
>
> Whenever the displayed integrals exist, the integral over a bounded set is linear, monotone, and satisfies
>
> $$
> \int_{S}\left( {\alpha f + \beta g} \right) = \alpha\int_{S}f + \beta\int_{S}g,\quad f \leq g\rightarrow\int_{S}f \leq \int_{S}g.
> $$
>
> It is also additive under a finite disjoint decomposition of $S$. More generally, for two bounded Jordan-measurable sets,
>
> $$
> \int_{S \cup T}f + \int_{S \cap T}f = \int_{S}f + \int_{T}f.
> $$
>
> In particular, if $S_{i}$ have pairwise intersections of Jordan measure zero, then $\int_{\cup_{i}S_{i}}f = \sum_{i}\int_{S_{i}}f$.

> **Theorem: Jordan-measurable sets**
>
> A bounded set $S \subset \mathbb{R}^{n}$ is Jordan measurable if and only if its boundary has measure zero:
>
> $$
> S \in \mathcal{J}\quad\Leftrightarrow\quad m\left( {\partial S} \right) = 0.
> $$
>
> In that event the constant function $1$ is integrable over $S$, and
>
> $$
> m_{J{(S)}} = \int_{S}1.
> $$

> **Remark**
>
> The lecture uses $\mathcal{J}$ for the class of Jordan-measurable bounded sets and $\mathcal{J}_{c}$ for compact Jordan-measurable sets. Thus integrals over arbitrary bounded sets are not silently assumed to exist: the zero extension must first be Riemann integrable.

## Extended integrals on open sets

> **Definition: Positive extended integral**
>
> Let $A \subset \mathbb{R}^{n}$ be open and let $f:A\rightarrow\mathbb{R}$ be continuous with $f \geq 0$. Its extended integral is
>
> $$
> \text{ext}(\int)_{A}f = \sup\limits_{D \subseteq A,D \in \mathcal{J}_{c}}\int_{D}f.
> $$
>
> This value is allowed to be $+ \infty$.

> **Definition: Signed extended integral**
>
> For a continuous $f:A\rightarrow\mathbb{R}$, set
>
> $$
> f^{+} = \max\left( {f,0} \right),\quad f^{-} = \max\left( {- f,0} \right),\quad f = f^{+} - f^{-},\quad|f| = f^{+} + f^{-}.
> $$
>
> If both $\text{ext}(\int)_{A}f^{+}$ and $\text{ext}(\int)_{A}f^{-}$ are finite, define
>
> $$
> \text{ext}(\int)_{A}f = \text{ext}(\int)_{A}f^{+} - \text{ext}(\int)_{A}f^{-}.
> $$

> **Lemma: Compact exhaustion**
>
> Every open set $A \subset \mathbb{R}^{n}$ has compact Jordan-measurable sets $C_{N}$ such that
>
> $$
> C_{N} \subset C_{N + 1}^{o},\quad C_{N} \subset A,\quad \cup_{N = 1}^{\infty}C_{N} = A.
> $$

> **Proof**
>
> Take compact sets $D_{N}$ increasing to $A$, for example by requiring a positive distance from $\partial A$ and a bound on the norm. Cover each $D_{N}$ by finitely many closed cubes whose interiors lie in $A$, and let $C_{N}$ be the finite union of the cubes selected up to stage $N$. Enlarging at each stage if necessary gives $C_{N} \subset C_{N + 1}^{o}$.

> **Theorem: Exhaustion criterion**
>
> For $f$ continuous on an open set $A$ and for any compact exhaustion $\left( C_{N} \right)$ as above,
>
> $$
> \text{ext}(\int)_{A}f\exists\quad\Leftrightarrow\quad\left( {\int_{C_{N}}|f|} \right)_{N = 1}^{\infty}\ \text{is bounded}.
> $$
>
> In that case,
>
> $$
> \text{ext}(\int)_{A}f = \lim\limits_{N\rightarrow\infty}\int_{C_{N}}f.
> $$

> **Proof**
>
> The integrals of $|f|$ over $C_{N}$ are increasing. If they are bounded, the positive and negative parts have finite suprema, so the signed extended integral exists and the asserted limit follows by subtracting the two monotone limits. Conversely, if the positive and negative extended integrals are finite, each $\int_{C_{N}}|f|$ is bounded by their sum.
>
> The point that the exhaustion computes the supremum is that every compact $D \subset A$ is contained in some $C_{N}$: the open sets $C_{N}^{o}$ cover $D$, so a finite subcover has a largest index. Hence $\int_{D}f^{+} \leq \int_{C_{N}}f^{+}$ for some $N$, and taking suprema gives the claim.

> **Theorem: Agreement on bounded open sets**
>
> If $A$ is bounded and open and $f$ is bounded and continuous on $A$, then the extended integral exists. If the zero extension makes the ordinary Riemann integral over $A$ meaningful, it agrees with the extended integral:
>
> $$
> \text{ext}(\int)_{A}f = \int_{A}f.
> $$

> **Remark**
>
> 对于 bounded open $A$，lecture notes 记录：extended integral must exist； 如果 ordinary integral 存在，则二者相等。

## Change of variables

> **Theorem: One-dimensional change of variables**
>
> Let $g:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ be $C^{1}$, and let $f$ be continuous on an interval containing $g\left( \left\lbrack {a,b} \right\rbrack \right)$. Then
>
> $$
> \int_{g{(a)}}^{g{(b)}}f(y)\, dy = \int_{a}^{b}f\left( {g(x)} \right)g'(x)\, dx.
> $$

> **Proof**
>
> Choose an antiderivative $F$ of $f$. The chain rule and the fundamental theorem of calculus give
>
> $$
> \int_{a}^{b}f\left( {g(x)} \right)g'(x)\, dx = \int_{a}^{b}\left( {F \circ g} \right)'(x)\, dx = F\left( {g(b)} \right) - F\left( {g(a)} \right).
> $$

> **Theorem: Change-of-variables theorem**
>
> Let $A,B \subset \mathbb{R}^{n}$ be open, let $g:A\rightarrow B$ be a $C^{1}$ diffeomorphism, and let $f:B\rightarrow\mathbb{R}$ be continuous. Then
>
> $$
> f\ \text{is integrable over}\ B\quad\Leftrightarrow\quad f\left( {g(x)} \right)\left| {\det Dg(x)} \right|\ \text{is integrable over}\ A,
> $$
>
> and, whenever either condition holds,
>
> $$
> \int_{B}f(y)\, dy = \int_{A}f\left( {g(x)} \right)\left| {\det Dg(x)} \right|\, dx.
> $$

> **Example: Polar coordinates**
>
> On the annular region
>
> $$
> B = \left\{ {\left( {x,y} \right):a^{2} < x^{2} + y^{2} < b^{2}} \right\},
> $$
>
> use $g\left( {r,\theta} \right) = \left( {r\cos\theta,r\sin\theta} \right)$ on $\left( {a,b} \right) \times \left( {0,2\pi} \right)$. Since
>
> $$
> \det Dg\left( {r,\theta} \right) = \det\begin{pmatrix}
> {\cos\theta} & {- r\sin\theta} \\
> {\sin\theta} & {r\cos\theta}
> \end{pmatrix} = r,
> $$
>
> the omitted radial cut has measure zero and
>
> $$
> \int_{B}f\left( {x,y} \right)\, dx\, dy = \int_{0}^{2\pi}\int_{a}^{b}f\left( {r\cos\theta,r\sin\theta} \right)r\, dr\, d\theta.
> $$

> **Example: Spherical coordinates**
>
> With
>
> $$
> g\left( {\rho,\varphi,\theta} \right) = \left( {\rho\sin\varphi\cos\theta,\rho\sin\varphi\sin\theta,\rho\cos\varphi} \right),
> $$
>
> one has $\left| {\det Dg} \right| = \rho^{2}\sin\varphi$. Thus, subject to the usual bounds on $\rho$, $\varphi$, and $\theta$ describing the region,
>
> $$
> \int_{B}f = \int\int\int f\left( {g\left( {\rho,\varphi,\theta} \right)} \right)\rho^{2}\sin\varphi\, d\rho\, d\varphi\, d\theta.
> $$

## Diffeomorphisms and null sets

> **Theorem: $C^{1}$ maps preserve sets of measure zero**
>
> If $g:A\rightarrow\mathbb{R}^{m}$ is $C^{1}$ on an open set $A \subset \mathbb{R}^{n}$ and $E \subset A$ has measure zero, then $g(E)$ has measure zero. In particular, if $m > n$, the image of every bounded set under a $C^{1}$ map $A \subset \mathbb{R}^{n}\rightarrow\mathbb{R}^{m}$ has measure zero.

> **Proof**
>
> First restrict to a closed cube $C \subset A$ on which $\left\| {Dg} \right\| \leq M$. By the mean-value estimate, a cube of side length $w$ in $C$ has image contained in a cube of side length at most $nMw$. Cover $E \cap C$ by cubes of total volume as small as desired; the corresponding image cubes have total volume at most $\left( {nM} \right)^{n}$ times that quantity. Hence $g\left( {E \cap C} \right)$ has measure zero. Exhaust $A$ by such closed cubes and take a countable union.

> **Proposition: Diffeomorphisms preserve interior and boundary**
>
> If $g:A\rightarrow B$ is a diffeomorphism of open sets and $D \subset A$, then
>
> $$
> g\left( D^{o} \right) = \left( {g(D)} \right)^{o},\quad g\left( {\partial D} \right) = \partial\left( {g(D)} \right).
> $$
>
> Hence $D$ is Jordan measurable if and only if $g(D)$ is Jordan measurable.

> **Remark**
>
> The notes contrast this with the rationals in an interval: they have Lebesgue measure zero but are not Jordan measurable, because their boundary is the whole interval.

## Primitive diffeomorphisms

> **Definition: Primitive diffeomorphism**
>
> A primitive diffeomorphism changes only one coordinate. For some $i$,
>
> $$
> h\left( {x_{1},\ldots,x_{n}} \right) = \left( {x_{1},\ldots,x_{i - 1},h_{i{(x)}},x_{i + 1},\ldots,x_{n}} \right).
> $$

> **Theorem: Local decomposition**
>
> Every local $C^{1}$ diffeomorphism can, after restricting to sufficiently small neighborhoods, be written as a finite composition of primitive diffeomorphisms.

> **Proof**
>
> The proof in the notes has three reductions. First, an invertible linear map is a product of elementary matrices: coordinate swaps, scalings, and additions of one coordinate to another. Each is primitive (a coordinate swap is factored into elementary operations when necessary). Translations are also primitive.
>
> Next assume $g(0) = 0$ and $Dg(0) = I$. Define
>
> $$
> h(x) = \left( {g_{1}(x),\ldots,g_{n - 1}(x),x_{n}} \right).
> $$
>
> Near $0$, $h$ is a diffeomorphism. The map $k = g \circ h^{- 1}$ fixes the first $n - 1$ coordinates, so $g = k \circ h$ is a product of primitive maps. Finally, translate the chosen point to $0$ and compose with $\left( {Dg(0)} \right)^{- 1}$ to reduce the general case to this one.

## Partitions of unity

> **Definition: A smooth bump on a box**
>
> Let
>
> $$
> \eta(t) = \left\{ \begin{matrix}
> {\exp\left( {- \frac{1}{t}} \right)} & \\
>  & {t > 0} \\
> {\backslash 0} & \\
>  & {t \leq 0.}
> \end{matrix} \right..
> $$
>
> Then $\eta$ is $C^{\infty}$, positive on $\left( {0,\infty} \right)$, and zero on $\left( {- \infty,0} \right\rbrack$. The product
>
> $$
> \psi(x) = \prod\limits_{j = 1}^{n}\eta\left( {x_{j} - a_{j}} \right)\eta\left( {b_{j} - x_{j}} \right)
> $$
>
> is $C^{\infty}$, positive on the interior of the closed box $Q = \prod_{j}\left\lbrack {a_{j},b_{j}} \right\rbrack$, and zero outside that interior.

> **Definition: Support and partition of unity**
>
> The support of a function is
>
> $$
> \text{supp}(\psi) = \bar{\left\{ {x:\psi(x)\neq 0} \right\}}.
> $$
>
> A partition of unity on an open set $A$, subordinate to an open cover $\left( U_{i} \right)$, is a locally finite family $\left( \varphi_{i} \right)$ of functions $A\rightarrow\left\lbrack {0,1} \right\rbrack$ such that
>
> $$
> \text{supp}\left( \varphi_{i} \right) \subset U_{i},\quad\sum\limits_{i}\varphi_{i{(x)}} = 1\quad\left( {x \in A} \right).
> $$

> **Theorem: Smooth partition of unity**
>
> Every open cover of an open subset $A \subset \mathbb{R}^{n}$ admits a locally finite smooth partition of unity $\left( \varphi_{i} \right)$ subordinate to that cover. Each $\varphi_{i}$ may be chosen with compact support contained in one member of the cover.

> **Proof**
>
> Choose a locally finite collection of closed cubes $S_{i}$ whose interiors cover $A$, with each $S_{i}$ contained in a member of the given cover. The compact-exhaustion construction supplies such cubes by covering successive compact annuli with finitely many cubes. Let $\psi_{i}$ be the smooth box bump positive on $S_{i}^{o}$ and supported in its containing cover member. Local finiteness makes
>
> $$
> \lambda(x) = \sum\limits_{i}\psi_{i{(x)}}
> $$
>
> a smooth, positive function. Then
>
> $$
> \varphi_{i{(x)}} = \frac{\psi_{i{(x)}}}{\lambda(x)}
> $$
>
> has the required support, local finiteness, and sum.

> **Theorem: Integration by a partition of unity**
>
> Let $f$ be continuous on an open set $A$, and let $\left( \varphi_{i} \right)$ be a smooth partition of unity with compact supports in $A$. Then
>
> $$
> \text{ext}(\int)_{A}f\ \text{exists}\quad\Leftrightarrow\quad\sum\limits_{i}\int_{A}\varphi_{i}f = \sum\limits_{i}\int_{\text{supp}{(\varphi_{i})}}\varphi_{i}f\ \text{converges},
> $$
>
> and in that case this series equals $\text{ext}(\int)_{A}f$.

> **Proof**
>
> For $f \geq 0$, finite partial sums satisfy $0 \leq \sum_{i \in F}\varphi_{i} \leq 1$. Their integrals increase to the extended integral by the compact support of each summand and local finiteness. Apply this statement separately to $f^{+}$ and $f^{-}$ to obtain the signed assertion.

> **Remark**
>
> Integration by POU assembles local integrals into a global one: "POU 的作用是把局部的积分拼成全局积分。"

