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
source: "notes/math/multivariate-analysis/chapters/03-implicit-and-inverse-functions.typ"
subtitle: Typst-first mathematics notes
title: Multivariate Analysis
---
# Inverse and implicit functions

## Local invertibility

> **Definition: Local inverse, homeomorphism, and diffeomorphism**
>
> For $f:A \subseteq \mathbb{R}^{n}\rightarrow\mathbb{R}^{n}$, say $f$ is locally invertible near $x_{0}$ when some $B_{\delta{(x_{0})}}$ is mapped bijectively onto an open set $\Omega \subseteq \mathbb{R}^{n}$. It is a local homeomorphism if this restriction and its inverse are continuous, a local diffeomorphism if both are differentiable, and a local $C^{r}$ diffeomorphism if both are $C^{r}$.

> **Remark**
>
> $x\mapsto x^{3}$ is locally invertible but not a local diffeomorphism near zero. A derivative that exists and is nonzero only at a point is not enough for local injectivity: the lecture sketches an oscillating graph tangent to $y = x$ as the counterexample. If $f'$ exists near $a$ and $f'(a) \neq 0$, however, continuity of $f'$ is not needed to obtain local injectivity in one variable.

> **Lemma: Quantitative invertibility of a matrix**
>
> If $E$ is an invertible $n \times n$ matrix, then for all $x,y \in \mathbb{R}^{n}$, $\left\| {Ex - Ey} \right\| \geq \frac{1}{\left\| E^{- 1} \right\|}\left\| {x - y} \right\|$.

> **Proof**
>
> Put $v = x - y$. Since $\left\| v \right\| = \left\| {E^{- 1}Ev} \right\| \leq \left\| E^{- 1} \right\|\left\| {Ev} \right\|$, rearrange to get the bound.

> **Lemma: Mean-value estimate**
>
> If $H:A \subseteq \mathbb{R}^{n}\rightarrow\mathbb{R}^{m}$ is $C^{1}$ and the segment from $x$ to $y$ is contained in $A$, then $\left\| {H(x) - H(y)} \right\| \leq \max_{t \in {\lbrack{0,1}\rbrack}}\left\| {DH\left( {x + t\left( {y - x} \right)} \right)} \right\|\left\| {x - y} \right\|$.

> **Proof**
>
> Apply the one-variable mean value theorem to each coordinate of $\varphi(t) = H\left( {x + t\left( {y - x} \right)} \right)$ and take the largest coordinate estimate.

> **Lemma: Nonsingular derivative gives a lower Lipschitz bound**
>
> Let $f:A \subseteq \mathbb{R}^{n}\rightarrow\mathbb{R}^{n}$ be $C^{1}$ and suppose $Df\left( x_{0} \right)$ is invertible. Then there are an open neighborhood $U$ of $x_{0}$ and $\alpha > 0$ such that $\left\| {f(x) - f(y)} \right\| \geq \alpha\left\| {x - y} \right\|$ for all $x,y \in U$.

> **Proof**
>
> Set $E = Df\left( x_{0} \right)$ and $H(x) = f(x) - Ex$. Since $DH\left( x_{0} \right) = 0$, continuity of $DH$ gives a small ball on which $\left\| {H(x) - H(y)} \right\| < \frac{1}{2\left\| E^{- 1} \right\|}\left\| {x - y} \right\|$. Combine the preceding two lemmas with $f(x) - f(y) = E\left( {x - y} \right) + H(x) - H(y)$ to obtain $\alpha = \frac{1}{2\left\| E^{- 1} \right\|}$.

> **Theorem: Inverse function theorem**
>
> Let $f:A \subseteq \mathbb{R}^{n}\rightarrow\mathbb{R}^{n}$ be $C^{r}$ ($r \geq 1$), with $A$ open and $x_{0} \in A$. If $Df\left( x_{0} \right)$ is nonsingular, then some open neighborhoods $U$ of $x_{0}$ and $V$ of $f\left( x_{0} \right)$ satisfy: $f:U\rightarrow V$ is bijective, its inverse $g:V\rightarrow U$ is $C^{r}$, and $Dg\left( {f(x)} \right) = \left( {Df(x)} \right)^{- 1}$ for $x \in U$.

> **Proof**
>
> The lower Lipschitz bound makes $f$ injective on a small $U$. It also shows that $f(U)$ is open: take a closed ball inside $U$, minimize $z\mapsto\left\| {f(z) - c} \right\|^{2}$ on it, and use the chain rule plus invertibility of the derivative to see that the minimizer for $c$ close to $f(x)$ is interior. Thus $V = f(U)$ is open and $g$ is continuous.
>
> For $y = f(x)$ and $h = g\left( {y + k} \right) - g(y)$, differentiability of $f$ gives $k - Df(x)h = r(h)$, where $\frac{\left\| {r(h)} \right\|}{\left\| h \right\|}\rightarrow 0$. The lower bound relates $\left\| h \right\|$ to $\left\| k \right\|$, giving $\frac{g\left( {y + k} \right) - g(y) - \left( {Df(x)} \right)^{- 1}k}{\left\| k \right\|}\rightarrow 0$. Hence $Dg(y) = \left( {Df(x)} \right)^{- 1}$. Cramer's rule expresses the inverse matrix as rational functions of the entries of $Df$; induction then upgrades $g$ to $C^{r}$.

> **Remark**
>
> $\det M = \sum_{\sigma \in S_{n}}\text{sgn}(\sigma)\prod_{i}M_{i,\sigma{(i)}}$ is continuous. Therefore $\det Df\left( x_{0} \right) \neq 0$ remains nonzero on a small neighborhood. The theorem says the functions $y_{i} = f_{i{({x_{1},\ldots,x_{n}})}}$ can be used as local coordinates in place of $x_{i}$.

> **Example: Polar and spherical coordinates**
>
> For $\left( {r,\theta} \right)\mapsto\left( {r\cos\theta,r\sin\theta} \right)$, $Df = \begin{pmatrix}
> {\cos\theta} & {- r\sin\theta} \\
> {\sin\theta} & {r\cos\theta}
> \end{pmatrix}$ and $\det Df = r$, so it is locally invertible for $r \neq 0$. For spherical coordinates $\left( {r,\varphi,\theta} \right)\mapsto\left( {r\sin\varphi\cos\theta,r\sin\varphi\sin\theta,r\cos\varphi} \right)$, the notes calculate $\det Df = r^{2}\sin\varphi$; it is nonzero away from $r = 0$ and the polar axis.

## Implicit functions

> **Theorem: Implicit differentiation**
>
> Let $f:A \subseteq \mathbb{R}^{k + n}\rightarrow\mathbb{R}^{n}$ be differentiable, with $\left( {x,y} \right) \in \mathbb{R}^{k} \times \mathbb{R}^{n}$. If a differentiable map $g:B \subseteq \mathbb{R}^{k}\rightarrow\mathbb{R}^{n}$ satisfies $f\left( {x,g(x)} \right) = 0$, then $\partial\frac{f}{\partial}x\left( {x,g(x)} \right) + \partial\frac{f}{\partial}y\left( {x,g(x)} \right)Dg(x) = 0$. If $\partial\frac{f}{\partial}y$ is invertible, then $Dg(x) = - \left( {\partial\frac{f}{\partial}y\left( {x,g(x)} \right)} \right)^{- 1}\partial\frac{f}{\partial}x\left( {x,g(x)} \right)$.

> **Proof**
>
> Apply the chain rule to $h(x) = \left( {x,g(x)} \right)$. Its derivative is the block matrix $Dh = \begin{pmatrix}
> I_{k} \\
> {Dg}
> \end{pmatrix}$, while $Df = \left( {\partial\frac{f}{\partial}x,\partial\frac{f}{\partial}y} \right)$.

> **Theorem: Implicit function theorem**
>
> Let $A \subseteq \mathbb{R}^{k} \times \mathbb{R}^{n}$ be open, let $f:A\rightarrow\mathbb{R}^{n}$ be $C^{r}$ ($r \geq 1$), and assume $\left( {a,b} \right) \in A$, $f\left( {a,b} \right) = 0$, and $\partial\frac{f}{\partial}y\left( {a,b} \right)$ is nonsingular. Then on a neighborhood of $a$ there is a unique $C^{r}$ function $g$ with $g(a) = b$ and $f\left( {x,g(x)} \right) = 0$. Its derivative is the implicit-differentiation formula above.

> **Proof**
>
> Define the auxiliary map $F\left( {x,y} \right) = \left( {x,f\left( {x,y} \right)} \right)$. Its derivative is block triangular: $DF = \begin{pmatrix}
> I_{k} & 0 \\
> {\partial\frac{f}{\partial}x} & {\partial\frac{f}{\partial}y}
> \end{pmatrix}$, hence $\det DF\left( {a,b} \right) = \det\left( {\partial\frac{f}{\partial}y\left( {a,b} \right)} \right) \neq 0$. The inverse function theorem gives a local inverse $G$. Since the first $k$ coordinates of $F$ are the identity, write $G\left( {x,z} \right) = \left( {x,h\left( {x,z} \right)} \right)$ and set $g(x) = h\left( {x,0} \right)$. This gives existence. For uniqueness, the notes let $S = \left\{ x\  \middle| \ g(x) = g'(x) \right\}$; it is nonempty, closed by continuity, and open by the local inverse, so connectedness of a sufficiently small ball implies $S = B$.

> **Remark**
>
> The theorem turns a level set $\left\{ {\left( {x,y} \right):f\left( {x,y} \right) = 0} \right\}$ locally into the graph of a function. In the linear case $f\left( {x,y} \right) = Ax + By$, invertibility of $B$ gives the familiar formula $y = - B^{- 1}Ax$.

> **Example: Level-set examples**
>
> The unit circle $f\left( {x,y} \right) = x^{2} + y^{2} - 1 = 0$ defines locally $y = \sqrt{1 - x^{2}}$ away from $\left( {1,0} \right)$ and $\left( {- 1,0} \right)$, exactly where $\partial\frac{f}{\partial}y = 2y$ is nonzero. Two $C^{1}$ surfaces $f = g = 0$ in $\mathbb{R}^{3}$ typically meet in a curve: if the $2 \times 2$ derivative with respect to $\left( {y,z} \right)$ has rank two, the implicit theorem solves $\left( {y,z} \right)$ in terms of $x$.

