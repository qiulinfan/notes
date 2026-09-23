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
semantic-node-count: 0
source: "notes/math/measure-theory/homeworks/hw10-on_LRN-theorem&complex-measure.typ"
subtitle: Typst-first course notes and worked homeworks
title: "MATH 597: Measure Theory"
---
# Homework 10: on LRN Theorem and complex measure (40/40)

(Note: For this homework I applied for an one-day extension since I met with some emergent problem with my bank and rent payment.)

## complex measure 的 total variation 的 formulas

Let $\nu$ be a complex measure on a measurable space $(X,\mathcal{A})$. Prove that, for any $E \in \mathcal{A}$:

$$
\begin{matrix}
\left. |\nu \middle| (E) \right. & {= \sup\left\{ \sum\limits_{j = 1}^{n} \middle| \nu(E_{j}) \middle| \mid n \in {\mathbb{N}},E_{1}\ldots E_{n}\ \text{disjoint},\ E = \bigcup\limits_{j = 1}^{n}E_{j} \right\}} \\
 & {= \sup\left\{ \sum\limits_{j = 1}^{\infty} \middle| \nu(E_{j}) \middle| \mid E_{1},E_{2},\ldots\ \text{disjoint},\ E = \bigcup\limits_{j = 1}^{\infty}E_{j} \right\}} \\
 & {= \sup\left\{ |\int_{E}f\, d\nu\  \middle| \mid f:X\rightarrow{\mathbb{C}}\ \text{measurable}, \middle| f \middle| \leq 1 \right\}.}
\end{matrix}
$$

> **Proof**
>
> Take some positive measure $\mu$ s.t. $\nu \ll \mu$ (e.g. $\left. \mu: = \middle| \Re\nu \middle| + \middle| \Im\nu| \right.$), then by RN Thm there exists $\mu$-unique RN derivative $f$, and $|\nu|$ can be defined by
>
> $$
> \left. d \middle| \nu \middle| : = \middle| f \middle| \, d\mu \right.
> $$
>
> Now we denote:
>
> $$
> \begin{matrix}
> {\mu_{1}(E)} & {:= \sup\left\{ \sum\limits_{j = 1}^{n} \middle| \nu(E_{j}) \middle| \mid n \in {\mathbb{N}},E_{1}\ldots E_{n}\ \text{disjoint},\ E = \bigcup\limits_{j = 1}^{n}E_{j} \right\}} \\
> {\mu_{2}(E)} & {:= \sup\left\{ \sum\limits_{j = 1}^{\infty} \middle| \nu(E_{j}) \middle| \mid E_{1},E_{2},\ldots\ \text{disjoint},\ E = \bigcup\limits_{j = 1}^{\infty}E_{j} \right\}} \\
> {\mu_{3}(E)} & {:= \sup\left\{ |\int_{E}f\, d\nu\  \middle| \mid f:X\rightarrow{\mathbb{C}}\ \text{measurable}, \middle| f \middle| \leq 1 \right\}.}
> \end{matrix}
> $$
>
> We will prove the equality by showing that $\left. \mu_{1} \leq \mu_{2} \leq \middle| \nu \middle| (E) \leq \mu_{3} \leq \mu_{1} \right.$.\
> **Claim 1: $\mu_{1} \leq \mu_{2}$.**\
> Proof: This is trivial since for each finite disjoint segmentation $E = \bigsqcup_{j = 1}^{n}E_{j}$ of $E$ can be made into a countable segmentation of $E$, by taking all $E_{N} = \varnothing$ for $N \geq n + 1$. So every value included in $\left\{ \sum_{j = 1}^{n} \middle| \nu(E_{j}) \middle| \mid E = \bigsqcup_{j = 1}^{n}E_{j} \right\}$ is also in $\left\{ \sum_{j = 1}^{\infty} \middle| \nu(E_{j}) \middle| \mid E = \bigsqcup_{j = 1}^{\infty}E_{j} \right\}$. Thus taking $\sup$, we have the ineq.\
> **Claim 2: $\left. \mu_{2} \leq \middle| \nu \middle| \leq \mu_{3} \right.$.**\
> Since $\left. \nu \ll \middle| \nu| \right.$ (Folland prop 3.13), by complex RN Thm we have have
>
> $$
> \left. f := \frac{d\nu}{\left. d \middle| \nu| \right.} \in L^{1}( \middle| \nu \middle| ) \right.
> $$
>
> Notice that **$f$ have absolute value $1$, $|\nu|$-a.e.** (Folland prop 3.13)\
> Suppose $E = \sqcup_{1}^{\infty}E_{j}$, we have:
>
> $$
> \begin{matrix}
> {\sum\limits_{j = 1}^{\infty}\left| {\nu\left( E_{j} \right)} \right|} & \left. \leq \sum\limits_{j = 1}^{\infty} \middle| \nu \middle| \left( E_{j} \right)\quad \right. & \text{by property of total variation measure} \\
>  & {\left. = \middle| \nu \middle| (E) = \int_{E}1\, d \middle| \nu \right|\quad} & \text{by ctbl disjoint additivity} \\
>  & {\left. = \int_{E} \middle| f \middle| {}_{2}d \middle| \nu \middle| = \int_{E}\bar{f}fd \middle| \nu \right|\quad} & {\text{since}\ f\ \text{have absolute value}\ 1\ \ \nu\ \text{-a.e.}} \\
>  & \left. = \int_{E}\bar{f}\frac{d\nu}{\left. d \middle| \nu| \right.}d \middle| \nu| \right. &
> \end{matrix}
> $$
>
> To confirm this equal to $\int\bar{f}\, d\nu$, we extend Folland prop 3.9 to the complex case.
>
> > **Proposition**
> >
> > For complex measure $\nu$ and $\sigma$-finite positive measure $\mu$ s.t. $\nu \ll \mu$, if $g \in L^{1}(\nu)$, then
> >
> > $$
> > g(\frac{d\nu}{d\mu}) \in L^{1}(\mu),\quad\int g\, d\nu = \int g(\frac{d\nu}{d\mu})d\mu
> > $$
>
> And the proof just follows from the finite signed-measure case, applied both to im part and re part.
>
> $$
> \begin{matrix}
> {\int g\, d\nu} & {= \int g\, d(\Re\nu) + i\int g\, d(\Im\nu)} \\
>  & {= \int g(\frac{d(\Re\nu)}{d\mu})\, d\mu + i\int g(\frac{d(\Im\nu)}{d\mu})\, d\mu} \\
>  & {= \int g(\Re\frac{d\nu}{d\mu} + i\Im\frac{d\nu}{d\mu})\, d\mu} \\
>  & {= \int g(\frac{d\nu}{d\mu})d\mu}
> \end{matrix}
> $$
>
> Now we back to Claim 2, since $f,\bar{f} \in L^{1}(\nu)$, we have:
>
> $$
> \begin{matrix}
> \left. \sum\limits_{j = 1}^{\infty} \middle| \nu\left( E_{j} \right)| \right. & \left. \leq \middle| \nu \middle| (E) \right. \\
>  & \left. = \int_{E}\bar{f}\frac{d\nu}{\left. d \middle| \nu| \right.}d \middle| \nu| \right. \\
>  & {= \int_{E}\bar{f}\, d\nu} \\
>  & {\leq \left| {\int_{E}\bar{f}d\nu} \right|}
> \end{matrix}
> $$
>
> Since $\left. |\bar{f} \middle| \leq 1 \right.$ (in $\nu$-a.e. sense), this shows that every element in $\left\{ \sum_{j = 1}^{\infty} \middle| \nu(E_{j}) \middle| \mid E = \bigsqcup_{j = 1}^{\infty}E_{j} \right\}$ is less then or equal to $\left. |\nu \middle| (E)| \right.$, and $\left. |\nu \middle| (E)| \right.$ is less then some element in $\left\{ |\int_{E}f\, d\nu\  \middle| \mid \text{measurable} \middle| f \middle| \leq 1 \right\}$, proves that $\left. \mu_{2} \leq \middle| \nu \middle| \leq \mu_{3} \right.$.\
> **Claim 3: $\mu_{3} \leq \mu_{1}$.**\
> For arbitrary simple function $\phi := \sum_{1}^{n}c_{k}\chi_{E_{k}}$ where $\left| c_{k} \right| \leq 1$ for all $k,E_{i}$ s are disjoint and $\bigcup_{i = 1}^{n}E_{i} = E$. We have
>
> $$
> \begin{matrix}
> \left| {\int_{E}\phi d\nu} \right| & {\leq \sum\limits_{k = 1}^{n}\left| {c_{k}\int_{E_{k}}\chi_{E_{k}}d\nu} \right|} \\
>  & {= \sum\limits_{k = 1}^{n}\left| c_{k} \right|\left| {\nu\left( E_{k} \right)} \right|} \\
>  & {\leq \sum\limits_{k = 1}^{n}\left| {\nu\left( E_{k} \right)} \right|} \\
>  & {\leq \mu_{1}(E)}
> \end{matrix}
> $$
>
> Now we consider the general case: any measurable $f$.\
> Fix arbitrary measurable $f$ s.t. $\left. |f \middle| \leq 1 \right.$, since it is measurable, we can choose seq of simple functions $(\phi_{n})_{1}^{\infty}$ that approximate $f$ pointwisely from below.\
>
> $$
> \lim\limits_{n\rightarrow\infty}\phi_{n} = f
> $$
>
> with
>
> $$
> \left. 0 \leq \middle| \phi_{1} \middle| \leq \middle| \phi_{2} \middle| \leq \cdots \leq \middle| f| \right.
> $$
>
> Then $|f|$ as a dominating function for $\left. ( \middle| \phi_{n} \middle| )_{n} \right.$, **by DCT** we obtain:
>
> $$
> \int_{E}f\, d(\Re\nu) = \lim\limits_{n\rightarrow\infty}\int_{E}\phi_{n}\, d(\Re\nu)
> $$
>
> and
>
> $$
> \int_{E}f\, d(\Im\nu) = \lim\limits_{n\rightarrow\infty}\int_{E}\phi_{n}\, d(\Im\nu)
> $$
>
> Thus
>
> $$
> \begin{matrix}
> {\int_{E}f\, d\nu} & {= \int_{E}f\, d(\Re\nu) + i\int_{E}f\, d(\Im\nu)} \\
>  & {= \lim\limits_{n\rightarrow\infty}(\int_{E}\phi_{n}\, d(\Re\nu) + i\int_{E}\phi_{n}\, d(\Im\nu))} \\
>  & {= \lim\limits_{n\rightarrow\infty}\int_{E}\phi_{n}d\nu}
> \end{matrix}
> $$
>
> Since for each $\phi_{n}$, we have $\left. 0 \leq \middle| \phi_{n}(x) \middle| \leq \middle| f(x) \middle| \leq 1 \right.$ for a.e. $x \in E$, we can apply the ineq we obtained that
>
> $$
> \left| {\int_{E}\phi_{n}\, d\nu} \right| \leq \mu_{1}(E)
> $$
>
> for each $n$. Thus taking limit we get:
>
> $$
> \left| {\int_{E}f\, d\nu} \right| \leq \mu_{1}(E)
> $$
>
> Taking supremum over $f$, proves that $\mu_{3}(E) \leq \mu_{1}(E)$.\
> Thus since we have shown $\left. \mu_{1} \leq \mu_{2} \leq \middle| \nu \middle| \leq \mu_{3} \leq \mu_{1} \right.$, every inequality above is an equality, i.e.
>
> $$
> \left. \mu_{1} = \mu_{2} = \mu_{3} = \middle| \nu| \right.
> $$
>
> finishing the proof.

## complex measure 与其 total variation measure 之间的关系: 整体即可决定局部

Let $\nu$ be a complex measure on a measurable space $(X,\mathcal{A})$.

### $\left. \nu(X) = \middle| \nu \middle| (X)\Leftrightarrow\nu = \middle| \nu \middle| \Leftrightarrow\nu\ \text{positive} \right.$

- $\left. \nu(X) = \middle| \nu \middle| (X) \right.$;

- $\nu$ is a (finite) positive measure;

- $\left. \nu = \middle| \nu| \right.$.

> **Proof**
>
> **(ii) $\Longrightarrow$ (iii):** If $\nu$ is positive then $\nu^{-} = 0$, so $\left. \nu = \middle| \nu \middle| = \nu^{+} \right.$.\
> **(iii) $\Longrightarrow$ (i):** Trivially true by taking $E = X$.\
> **(i) $\Longrightarrow$ (ii):** Take some positive measure $\mu$ s.t. $\nu \ll \mu$ (e.g. $\left. \mu: = \middle| \Re\nu \middle| + \middle| \Im\nu| \right.$), then by RN Thm there exists $\mu$-unique RN derivative $f$, and $|\nu|$ can be defined by
>
> $$
> \left. d \middle| \nu \middle| : = \middle| f \middle| \, d\mu \right.
> $$
>
> Then by def
>
> $$
> \left. \int f\, d\mu = \int \middle| f \middle| \, d\mu,\quad i.e.\quad\int\Re f\, d\mu + i\int\Im f\, d\mu = \int \middle| f \middle| \, d\mu \right.
> $$
>
> Since the right hand side is real, we have:
>
> $$
> \left. \int( \middle| f \middle| - \Re f)\, d\mu = 0 \right.
> $$
>
> Note that, $\left. |f \middle| - \Re f \right.$ is always nonnegative, so this implies that $\left. \Re f = \middle| f \middle| \mu\ \text{-a.e.} \right.$\
> Thus $\Im f = 0\mu\ \text{-a.e.}$, so $\left. f = \middle| f| \right.$ is real and positive $\mu$-a.e. Thus
>
> $$
> \nu(E) = \int_{E}f\, d\mu \in {\mathbb{R}}_{+},\quad\forall E \in \mathcal{A}
> $$
>
> finishing the proof that $\nu$ is a positive measure.

### $\left. |\nu(X) \middle| = \middle| \nu \middle| (X)\Leftrightarrow\nu = \lambda \middle| \nu| \right.$ for some $\left. |\lambda \middle| = 1 \right.$

Prove that the following two conditions are equivalent:

- $\left. |\nu(X) \middle| = \middle| \nu \middle| (X) \right.$;

- there exists a complex number $\lambda$ with $\left. |\lambda \middle| = 1 \right.$ such that $\left. \nu = \lambda \middle| \nu| \right.$.

> **Proof**
>
> **(i) $\Longrightarrow$ (ii):** Since $\left. \nu \ll \middle| \nu| \right.$, by complex RN Thm we have RN derivative
>
> $$
> \left. h := \frac{d\nu}{\left. d \middle| \nu| \right.} \in L^{1}( \middle| \nu \middle| ) \right.
> $$
>
> Notice that **$h$ have absolute value $1$, $|\nu|$-a.e.**\
> Then by def of RN derivative we have
>
> $$
> \left. \nu(X) = \int_{X}hd \middle| \nu| \right.
> $$
>
> Thus
>
> $$
> \left. |\nu(X) \middle| = \left| \int_{X}hd\  \middle| \ \nu\ | \right| \leq \int_{X} \middle| h \middle| d \middle| \nu \middle| = \int_{X}1d \middle| \nu \middle| = \middle| \nu \middle| (X) \right.
> $$
>
> Since we have $\left. |\nu(X) \middle| = \middle| \nu \middle| (X) \right.$, it implie that:
>
> $$
> \left. \left| \int_{X}hd\  \middle| \ \nu\ | \right| = \int_{X} \middle| h \middle| d \middle| \nu| \right.
> $$
>
> **Claim: $h$ is constant $|\nu|$-a.e.**\
> We first prove a lemma:
>
> > **Lemma**
> >
> > Let $\mu$ be a finite positive measure.\
> > For measurable function $f:X\rightarrow{\mathbb{C}}$, if $\left. |f \middle| = k \right.$ a.e. for some nonzero constant $k$ and
> >
> > $$
> > \left. |\int f\, d\mu\  \middle| = \int \middle| f \middle| \, d\mu \right.
> > $$
> >
> > then $f$ must be a.e. constant.
>
> Proof of Lemma: Set:
>
> $$
> c := \frac{\int fd\mu}{\left| {\int fd\mu} \right|}
> $$
>
> Then $\left. |c \middle| = 1 \right.$, and we consider:
>
> $$
> \left. \int fd\mu = c\left| {\int fd\mu} \right| = c\int \middle| f \middle| d\mu \right.
> $$
>
> Define $g(x) := \bar{c}f(x)$, so:
>
> $$
> \left. \int g\, d\mu = \bar{c}\int f\, d\mu = \bar{c}c\int \middle| f \middle| \, d\mu = \int \middle| f \middle| \, d\mu \right.
> $$
>
> Notice $\left. \int \middle| f \middle| \, d\mu \in {\mathbb{R}}_{+} \right.$ and
>
> $$
> \int g\, d\mu = \int\Re g\, d\mu + i\int\Im g\, d\mu \in {\mathbb{C}}
> $$
>
> Thus
>
> $$
> \left. \int\Re g\, d\mu = \int \middle| g \middle| \, d\mu = \int \middle| f \middle| \, d\mu\Longrightarrow\int(\Re g - \middle| g \middle| )\, d\mu = 0 \right.
> $$
>
> Since by def:
>
> $$
> \left. 0 \leq \Re g \leq \middle| g| \right.
> $$
>
> We must have
>
> $$
> \left. \Re g = \middle| g \middle| \quad a.e. \right.
> $$
>
> This proves that $g$ is a.e. real. And also since $\left. |g \middle| = \middle| f \middle| = k \right.$ a.e., **$g$ is then constant $k$ a.e.**\
> Therefore, **$f$ is constant $\frac{k}{\bar{c}}$ a.e.**\
> \
> Now we go back to the proof of the original statement. By our Lemma we get:
>
> $$
> \left. h = \frac{\left| {\int h\, d\mu} \right|}{\bar{\int h\, d\mu}}\quad\text{constant for} \middle| \nu \middle| \text{-a.e.}\ x \right.
> $$
>
> Therefore,
>
> $$
> \left. \nu = \frac{\left| {\int h\, d\mu} \right|}{\bar{\int h\, d\mu}} \middle| \nu| \right.
> $$
>
> This finishes the proof of (i) $\Longrightarrow$ (ii).\
> **(ii) $\Longrightarrow$(i):** This direction is trivial. Since $\left. \nu = \lambda \middle| \nu| \right.$, we have
>
> $$
> \left. |\nu(X) \middle| = \middle| \lambda \middle| \middle| \nu \middle| (X) = 1 \middle| \nu \middle| (X) = \middle| \nu \middle| (X) \right.
> $$

## complex measures on $(X,\mathcal{A})$ 组成一个 complex Banach space

Let $(X,\mathcal{A})$ be a measurable space. Prove that the set $\mathcal{M}$ of complex measures on $(X,\mathcal{A})$ is a complex Banach space, with norm given by $\left. \parallel \nu \parallel := \middle| \nu \middle| (X) \right.$.

> **Proof**
>
> **Claim 1: $\mathcal{M}$ is a complex vector space**, with addition operation defined by the addition of two complex measures, and scalar multiplication defined by scaling a complex measure by a complex number.\
> Proof of Claim 1: For $\nu,\mu \in \mathcal{M}$, and $\alpha \in {\mathbb{C}}$, define:
>
> - $(\nu + \mu)(E) := \nu(E) + \mu(E)$ for all $E \in \mathcal{A}$
>
> - $(\alpha\nu)(E) := \alpha \cdot \nu(E)$ for all $E \in \mathcal{A}$.
>
> Then: $(\nu + \mu)(\varnothing) = 0 + 0 = 0,(\alpha\nu)(\varnothing) = \alpha 0 = 0$.\
> Also, $\nu + \mu$ and $\alpha\nu$ are both countably additive, since sum and scalar multiples preserve this property: for $E = \bigsqcup_{j = 1}^{\infty}E_{j}$ with each $E_{j} \in \mathcal{A}$, we have:
>
> $$
> (\nu + \mu)(\bigsqcup\limits_{j = 1}^{\infty}E_{j}) = \nu(\bigsqcup\limits_{j = 1}^{\infty}E_{j}) + \mu(\bigsqcup\limits_{j = 1}^{\infty}E_{j}) = \nu(E) + \nu(E) = (\nu + \mu)(E)
> $$
>
> and
>
> $$
> (\alpha\nu)(\bigsqcup\limits_{j = 1}^{\infty}E_{j}) = \alpha \cdot \nu(\bigsqcup\limits_{j = 1}^{\infty}E_{j}) = \alpha\nu(E)
> $$
>
> So they are also complex measures, showing that $\mathcal{M}$ is closed under addition and scalar multiplication, thus a complex vector space.\
> **Claim 2: total variation $\left. \parallel \nu \parallel : = \middle| \nu(X)| \right.$ defines a norm on $\mathcal{M}$.**\
> Proof of Claim 2: To verify this is a norm, we check the norm requirements:
>
> - **Nonnegative**: $\parallel \nu \parallel \geq 0$, and $\parallel \nu \parallel = 0\Leftrightarrow\nu = 0$\
>   Proof: $\parallel \nu \parallel \geq 0$ follows from that $|\nu|$ is a p.m.\
>   Since we know $\left. \nu \ll \middle| \nu| \right.$, if $\left. |\nu \middle| (X) = 0 \right.$ then $X$ is a null set of $|\nu|$, and thus is a null set for $\nu$, so $\nu = 0$;\
>   Conversely, if $\nu = 0$ then
>
>   $$
>   \left. \parallel \nu \parallel := \middle| \nu \middle| (X) = \sup\left\{ \sum\limits_{j = 1}^{n} \middle| \nu(E_{j}) \middle| :X = \bigsqcup\limits_{j = 1}^{n}E_{j} \right\} = \sup\left\{ 0 \right\} = 0 \right.
>   $$
>
>   finishing the proof that $\parallel \nu \parallel = 0\Leftrightarrow\nu = 0$
>
> - **Homogeneity**: $\left. \parallel \alpha\nu \parallel = \middle| \alpha \middle| \cdot \parallel \nu \parallel \right.$\
>   Proof:
>
>   $$
>   \begin{matrix}
>   \left. \parallel \alpha\nu \parallel := \middle| \alpha\nu \middle| (X) \right. & {= \sup\left\{ \sum\limits_{j = 1}^{n} \middle| \alpha\nu(E_{j}) \middle| :X = \bigsqcup\limits_{j = 1}^{n}E_{j} \right\}} \\
>    & \left. = \middle| \alpha \middle| \sup\left\{ \sum\limits_{j = 1}^{n} \middle| \nu(E_{j}) \middle| :X = \bigsqcup\limits_{j = 1}^{n}E_{j} \right\} \right. \\
>    & \left. = \middle| \alpha \middle| \middle| \nu \middle| (X) = \middle| \alpha \middle| \parallel \nu \parallel \right.
>   \end{matrix}
>   $$
>
> - **Triangle inequality**: $\parallel \nu + \mu \parallel \leq \parallel \nu \parallel + \parallel \mu \parallel$\
>   Proof:
>
>   $$
>   \begin{matrix}
>   \left. |\nu + \kappa \middle| (X) \right. & {= \sup\left\{ \sum\limits_{i = 1}^{n} \middle| \ (\nu + \kappa)(E_{i})\  \middle| :X = \bigsqcup\limits_{i = 1}^{N}E_{i} \right\}} & \\
>    & {\leq \sup\left\{ \sum\limits_{i = 1}^{n}( \middle| \ \nu(E_{i})\  \middle| + \middle| \ \kappa(E_{i})\  \middle| ):X = \bigsqcup\limits_{i = 1}^{N}E_{i} \right\}\quad} & {\text{by tri ineq in}\ {\mathbb{R}}} \\
>    & {= \sup\left\{ \sum\limits_{i = 1}^{n} \middle| \ \nu(E_{i})\  \middle| + \sum\limits_{i = 1}^{n} \middle| \ \kappa(E_{i})\  \middle| :X = \bigsqcup\limits_{i = 1}^{N}E_{i} \right\}} & \\
>    & {\leq \sup\left\{ \sum\limits_{i = 1}^{n} \middle| \ \nu(E_{i})\  \middle| :X = \bigsqcup\limits_{i = 1}^{N}E_{i} \right\} + \sup\left\{ \sum\limits_{i = 1}^{n} \middle| \ \kappa(E_{i})\  \middle| :X = \bigsqcup\limits_{i = 1}^{N}E_{i} \right\}} & \\
>    & \left. = \middle| \nu \middle| (X) + \middle| \kappa \middle| (X) \right. &
>   \end{matrix}
>   $$
>
> Here we have finished the proof of $(\mathcal{M}, \parallel \cdot \parallel )$ being a normed $\mathbb{C}$-vector space.\
> **Claim 3: $(\mathcal{M}, \parallel \cdot \parallel )$ is complete (thus Banach space)**\
> Proof: Let $(\nu_{n})$ be a Cauchy sequence in $\mathcal{M}$. We have
>
> $$
> \left. |\nu_{n}(B) - \nu_{m}(B) \middle| = \middle| (\nu_{n} - \nu_{m})(B) \middle| \leq \middle| (\nu_{n} - \nu_{m})(X) \middle| = \parallel \nu_{n} - \nu_{m} \parallel \quad\text{for all}\ B \in \mathcal{A} \right.
> $$
>
> In particular, $(\nu_{n}(B))_{n}$ is a Cauchy sequence for all $B \in \mathcal{A}$. For each $B \in \mathcal{A}$, this is a Cauchy seq in $\mathbb{C}$, thus converges. So we can get:
>
> $$
> \nu(B) := \lim\limits_{n}\nu_{n}(B)
> $$
>
> as the pointwise limit (by a point we mean a set).\
> **Claim 3.1: $\nu \in \mathcal{M}$**.\
> Since for all $n$, $\nu_{n}(\varnothing) = 0$, we have:
>
> $$
> \nu(\varnothing) := \lim\limits_{n}\nu_{n}(\varnothing) = 0
> $$
>
> For a countable disjoint union of measurable sets $E = \bigsqcup_{i = 1}^{\infty}E_{i}$,
>
> $$
> \nu(E) = \lim\limits_{n}\nu_{n}(E) = \lim\limits_{n}\sum\limits_{i}\nu_{n}(E_{i})
> $$
>
> We know by property of total variation measure that for each $n$ we have:
>
> $$
> \left. \sum\limits_{i} \middle| \nu_{n}(E_{i}) \middle| < \middle| \nu_{n} \middle| (X) = \parallel \nu_{n} \parallel < M \right.
> $$
>
> for some uniform bound $M$ for each $n$, since $\parallel \nu_{n} \parallel$ is a Cauchy seq in $\mathbb{C}$. Thus we can exchange the order of taking limit and sum. Then we get:
>
> $$
> \nu(E) = \lim\limits_{n}\nu_{n}(E) = \lim\limits_{n}\sum\limits_{i}\nu_{n}(E_{i}) = \sum\limits_{i}\lim\limits_{n}\nu_{n}(E_{i}) = \sum\limits_{i}\nu(E_{i})
> $$
>
> verifying the countable disjoint additivity.\
> And notice, as we have mentioned, for each measurable set $E \in \mathcal{A}$, since $(\nu_{n}(E))_{n}$ is a Cauchy sequence in $\mathbb{C}$**, it is bounded**, verifying that $\nu$ **is a valid complex measure.**\
> **Claim 3.2: $\nu_{n}\rightarrow\nu$ in $\parallel \cdot \parallel$.**\
> Fix $\epsilon > 0$.\
> By Cauchy in $\parallel \cdot \parallel$, there exists $N \in {\mathbb{N}}$ s.t. for all $m,n \geq N$ , we have
>
> $$
> \left. \parallel \nu_{m} - \nu_{n} \parallel = \middle| \nu_{m} - \nu_{n} \middle| (X) < \epsilon \right.
> $$
>
> Fix $n \geq N$, and consider the sequence $\nu_{m}$. Then $\nu_{m}\rightarrow\nu$ pointwise implies **$\nu_{n} - \nu_{m}\rightarrow\nu_{n} - \nu$ pointwise.** Thus
>
> $$
> \left. \parallel \nu_{n} - \nu \parallel = \middle| \nu_{n} - \nu \middle| (X) \leq \operatorname{lim\, inf}\limits_{m\rightarrow\infty} \middle| \nu_{n} - \nu_{m} \middle| (X) < \epsilon \right.
> $$
>
> Since $\epsilon > 0$ is arbitrary, this shows that, $\parallel \nu_{n} - \nu \parallel \rightarrow 0$ as $n\rightarrow\infty$, proving the convergence is in norm.\
> Now we conclude that $(\mathcal{M}, \parallel \cdot \parallel )$ is a Banach space.

## Positivity

Let $\nu_{1}$, $\nu_{2}$ be complex measures on a measurable space $(X,\mathcal{A})$ such that $\parallel \nu_{1} + \nu_{2} \parallel = \parallel \nu_{1} \parallel + \parallel \nu_{2} \parallel$. Is it true that there exists a nonzero constant $a \in {\mathbb{C}}$ such that $a\nu_{1}$ and $a\nu_{2}$ are both positive measures?

> **Solution**
>
> No, not necessarily.

> **Proof**
>
> Consider $X: = \left\{ {m,n} \right\}$\
> Define $\nu_{1},\nu_{2}$ by atoms:
>
> $$
> \nu_{1}(\left\{ m \right\}) = \nu_{2}(\left\{ m \right\}) = 1,\quad\nu_{1}(\left\{ n \right\}) = \nu_{2}(\left\{ n \right\}) = - 1
> $$
>
> Then
>
> $$
> \left. \parallel \nu_{1} + \nu_{2} \parallel = \parallel 2\nu_{1} \parallel = \middle| 2\nu_{1} \middle| (X) = 4 = \parallel \nu_{1} \parallel + \parallel \nu_{2} \parallel \right.
> $$
>
> But there is no nonzero constant $a \in {\mathbb{C}}$ such that $a\nu_{1}$ and $a\nu_{2}$ are both positive measures.\
> This is because for any nonzero constant $a$ scaled on $\nu_{1}$: **if $a$ real, then it either flip, or preserve the sign of $\nu_{1}(\left\{ m \right\})$ and $\nu_{1}(\left\{ n \right\})$, where there is always one positive number and one negative number between them; if $a$ complex, then make the two numbers complex.**\
> In both case, $\nu_{1}$ cannot become a positive measure. And since $\nu_{2}$ is defined the same as $\nu_{1}$, same for it. Therefore it can never become positive measure by scaling a nonzero constant.

## Averaging: Conditional Expectation

Let $(X,\mathcal{A},\mu)$ be a finite measure space (i.e. a measure space such that $\mu(X) < \infty$). Let $\mathcal{B} \subset \mathcal{A}$ be a sub-$\sigma$-algebra, and set $\nu := \mu|_{\mathcal{B}}$. Thus $(X,\mathcal{B},\nu)$ is also a finite measure space.

- Prove that if $f:X\rightarrow{\mathbb{C}}$ is $\mathcal{B}$-measurable, then $f$ is $\mathcal{A}$-measurable. Is the converse true?

- Suppose that $f \in L^{1}(\mu)$. Prove that there exists a $\mathcal{B}$-measurable function $g \in L^{1}(\nu)$ such that $\int_{E}f\, d\mu = \int_{E}g\, d\nu$ for all $E \in \mathcal{B}$. Also prove that any two such functions $g$ must agree outside a set of $\nu$-measure zero.

- Construct $g$ explicitly in the case when $X = \left\{ {1,2,3,4} \right\}$, $\mathcal{A} = \mathcal{P}(X)$, $\mu(\left\{ i \right\}) = 1/4$ for $i \in X$, and $\mathcal{B} = \left\{ {\varnothing,\left\{ {1,2} \right\},\left\{ {3,4} \right\},X} \right\}$. Thus, given the four complex numbers $f(i)$, $1 \leq i \leq 4$, you should find the four complex numbers $g(i)$, $1 \leq i \leq 4$.

*Hint*: use the Radon--Nikodym Theorem. *Remark*: if $\mu$ is a probability measure, then we can view $g$ as the conditional expectation of (the random variable) $f$ with respect to the $\sigma$-algebra $\mathcal{B}$.

> **Proof**
>
> **of (a):** Suppose $f:X\rightarrow{\mathbb{C}}$ is $\mathcal{B}$-measurable, then for any Borel set $B \subset {\mathbb{C}}$, $f^{- 1}(B) \in \mathcal{B} \subset \mathcal{A}$, so $f$ is $\mathcal{A}$ -measurable.\
> The converse is not true.\
> Consider $X = \left\{ {0,1,2,3} \right\},A := \mathcal{P}(X),\mathcal{B} := \left\{ {\varnothing,X} \right\}$.\
> Consider $f:x\mapsto x$ from $X$ to $\mathbb{R}$.\
> $f$ is $\mathcal{A}$-measurable since $\mathcal{A}$ is the power set, containing all subsets of $X$.\
> But $f^{- 1}(\left\{ 0 \right\}) = \left\{ 0 \right\} \notin \mathcal{B}$. Thus $f$ is not $\mathcal{B}$-measurable.

> **Proof**
>
> **of (b):** Let $\nu := \mu|_{\mathcal{B}}$, and define a signed measure on $\mathcal{B}$ by:
>
> $$
> \,\lambda(E) := \int_{E}fd\mu,\quad E \in \mathcal{B}
> $$
>
> Then $\lambda \ll \nu$, since $\nu(E) = \mu(E) = 0\Longrightarrow\lambda(E) = 0$.\
> By Radon-Nikodym Thm, there exists a $\mathcal{B}$-measurable function $g \in L^{1}(\nu)$ such that
>
> $$
> \lambda(E) = \int_{E}g\, d\nu\quad\text{for all}\ E \in \mathcal{B}
> $$
>
> Then
>
> $$
> \int_{E}f\, d\mu = \int_{E}g\, d\nu,\quad\forall E \in \mathcal{B}
> $$
>
> Suppose $g_{1},g_{2}$ are both such functions, then
>
> $$
> \int_{E}\left( {g_{1} - g_{2}} \right)d\nu = 0\quad\forall E \in \mathcal{B}
> $$
>
> Define
>
> $$
> G^{+}: = \left\{ {g_{1} - g_{2} > 0} \right\},G^{-}: = \left\{ {g_{1} - g_{2} < 0} \right\}
> $$
>
> These two sets are in $\mathcal{B}$ since $g_{1},g_{2}$ are $\mathcal{B}$-measurable. Then we have:
>
> $$
> \int_{G^{+}}(g_{1} - g_{2})\, d\nu = \int_{G^{-}}(g_{1} - g_{2})\, d\nu = 0
> $$
>
> Since on $G^{+}$ we have $g_{1} - g_{2} > 0$,
>
> $$
> \left. \int_{G^{+}}(g_{1} - g_{2})\, d\nu = 0\Longrightarrow\int_{G^{+}} \middle| g_{1} - g_{2} \middle| \, d\nu = 0\Longrightarrow g_{1} = g_{2}\,\,\nu\ \text{-a.e. on}\ G^{+}\Longrightarrow\nu(G^{+}) = 0 \right.
> $$
>
> Similarly, since on $G^{-}$ we have $g_{1} - g_{2} < 0$,
>
> $$
> \left. \int_{G^{-}}(g_{1} - g_{2})\, d\nu = 0\Longrightarrow - \int_{G^{-}} \middle| g_{1} - g_{2} \middle| \, d\nu = 0\Longrightarrow g_{1} = g_{2}\,\,\nu\ \text{-a.e. on}\ G^{+}\Longrightarrow\nu(G^{-}) = 0 \right.
> $$
>
> Thus
>
> $$
> \nu\left\{ {g_{1} \neq g_{2}} \right\} = \nu(G^{+}) + \nu(G^{-}) = 0
> $$
>
> This finishes the proof.

> **Solution**
>
> **of (c):** Given:
>
> - $X = \left\{ {1,2,3,4} \right\}$
>
> - $\mathcal{A} = \mathcal{P}(X)$
>
> - $\mu(\left\{ i \right\}) = 1/4$ for each $i$
>
> - $\mathcal{B} = \left\{ {\varnothing,\left\{ {1,2} \right\},\left\{ {3,4} \right\},X} \right\}$
>
> Suppose we have: $f:X\rightarrow{\mathbb{C}}$, so $f(i) \in {\mathbb{C}}$ for $i = 1,2,3,4$. We want to find: $g(i) \in {\mathbb{C}},i = 1,2,3,4$, such that $g$ is $\mathcal{B}$-measurable and
>
> $$
> \int_{E}f\, d\mu = \int_{E}g\, d\nu\quad\text{for all}\ E \in \mathcal{B}
> $$
>
> Notice that $\mathcal{B} = \left\{ {\varnothing,\left\{ {1,2} \right\},\left\{ {3,4} \right\},X} \right\}$, we must set $g(1) = g(2)$ and $g(3) = g(4)$, this is because, suppose if we set $g(1) \neq g(2)$, then it will happen that
>
> $$
> 1 \in g^{- 1}(g(1)) \not\ni 2
> $$
>
> No set in $\mathcal{B}$ satisfy this condition, thus $g^{- 1}(g(1)) \notin \mathcal{B}$, contradicts that $g$ is $\mathcal{B}$-measurable.\
> Thus we set
>
> $$
> g(1) = g(2) = a,\quad g(3) = g(4) = b
> $$
>
> We have:
>
> $$
> \int_{\{{1,2}\}}g\, d\nu = \int_{\{{1,2}\}}f\, d\nu = f(1)\mu(\left\{ 1 \right\}) + f(2)\mu(\left\{ 2 \right\}) = \frac{f(1) + f(2)}{4}
> $$
>
> and
>
> $$
> \int_{\{{3,4}\}}g\, d\nu = \int_{\{{1,2}\}}f\, d\nu = f(3)\mu(\left\{ 3 \right\}) + f(4)\mu(\left\{ 4 \right\}) = \frac{f(3) + f(4)}{4}
> $$
>
> while on the other hand
>
> $$
> \int_{\{{1,2}\}}g\, d\nu = \frac{g(1) + g(2)}{4} = \frac{a}{2},\quad\int_{\{{3,4}\}}g\, d\nu = \frac{g(3) + g(4)}{4} = \frac{b}{2}
> $$
>
> Thus $g$ is defined by:
>
> $$
> g(1) = g(2) = \frac{f(1) + f(2)}{2},\quad g(3) = g(4) = \frac{f(3) + f(4)}{2}
> $$
>
> Thus what $g$ expressses: is the conditonal expectation of $f$ on $\left\{ {1,2} \right\},\left\{ {3,4} \right\}$.\
> (Therefore it can be generalized: given any sub $\sigma$-algebra $\mathcal{B} \subset \mathcal{A}$, there exists a $\mu|_{\mathcal{B}}$-unique $\mathcal{B}$ measurable function $\left. g \in L^{1}(\mu \middle| {}_{\mathcal{B}}) \right.$, that is the conditional expectation
>
> $$
> g = {\mathbb{E}}\lbrack f \mid \mathcal{B}\rbrack
> $$
>
> s.t. for $B \in \mathcal{B}$,
>
> $$
> \int_{B}fd\mu = \int_{B}{\mathbb{E}}\lbrack f \mid \mathcal{B}\rbrack\, d\mu
> $$
>
> it gives the average of $f$ on sets in $\mathcal{B}$.)

*Nur für Verrückte*

(It's **really** not necessary to attempt these problems. Do not, under any circumstances, hand them in!) To any measure space $(X,\mathcal{A})$ we can associate a new measure space $(Y,\mathcal{B})$, where $Y$ is the Banach space of complex measures on $(X,\mathcal{A})$, and $\mathcal{B}$ is the Borel $\sigma$-algebra on $Y$.

- Does this operation define a functor from the category of measurable spaces to itself. Is this functor (if well defined) full? Is it faithful? Is it essentially surjective?

- Does the operation above admit any nontrivial fixed points (up to isomorphism)?

