---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/measure-theory/homeworks/hw08-on_L^p-spacecs.typ"
kgd_source_format: "typst"
kgd_source_sha256: "7f6339aa96ee474b79774b8eb032091b228706600e62f91e69547144bc974988"
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
semantic-node-count: 1
source: "notes/math/measure-theory/homeworks/hw08-on_L^p-spacecs.typ"
subtitle: Typst-first course notes and worked homeworks
title: "MATH 597: Measure Theory"
---
# Homework 8: on $L^{p}$ spacecs (50/50)

*Some of the following questions will be graded. Do them, and do hand them in*.

## 一个 Barely in $L^{1}$ 的函数

Find a function $f \in L^{1}({\mathbb{R}}^{2025})$ such that $f \notin L^{p}(U)$ for any $p > 1$ and any nonempty open subset $U \subset {\mathbb{R}}^{2025}$. *Hint*: see HW5(g).

> **Solution**
>
> Recall Hw 5(g):For $\alpha \in (0,1)$, define $g_{\alpha}:{\mathbb{R}}\rightarrow{\mathbb{R}}$ by $g_{\alpha}(x) = (1 - \alpha)x^{- \alpha}$ for $0 < x < 1$ and $g_{\alpha}(x) = 0$ otherwise. Let $(x_{n})_{n}$ be an enumeration of the rational numbers, and define $f:{\mathbb{R}}\rightarrow\lbrack 0,\infty\rbrack$ by
>
> $$
> f(x) = \sum\limits_{n = 1}^{\infty}2^{- n}g_{1 - n^{- n}}(x - x_{n})
> $$
>
> We have proved $f$ has the following properties:
>
> - $f$ is Lebesgue integrable and $\left. \int_{\mathbb{R}} \middle| f \middle| dm = \int_{\mathbb{R}}f dm < \infty \right.$;
>
> - $\int_{I}f^{p} dm = \infty\quad\text{for all}\ p > 1,\text{for all open interval}\ I$
>
> Now we continuing this definition of $f$, and further define:
>
> $$
> \begin{matrix}
> {F:{\mathbb{R}}^{2025}} & {\rightarrow{\mathbb{R}}} \\
> {(x_{1},\cdots,x_{2025})} & {\mapsto\prod\limits_{j = 1}^{2025}f(x_{j})}
> \end{matrix}
> $$
>
> **Claim 1:** $F \in L^{1}({\mathbb{R}}^{2025})$.\
> To prove this, we just need this lemma.
>
> > **Lemma: (Folland 2.5 exercise 51)**
> >
> > If $f$ is $\mathcal{M}$-measurable, $g$ is $\mathcal{N}$-measurable, then $fg$ is $(\mathcal{M} \otimes \mathcal{N})$-measurable.\
> > Particularly, if $f \in L^{1}(\mu)$, $g \in L^{1}(\nu)$, then $fg \in L^{1}(\mu \times \nu)$ and
> >
> > $$
> > \int fg d(\mu \times \nu) = (f d\mu)(g d\nu)
> > $$
>
> It seems like we have not proved this yet so here let's prove it.
>
> > **Proof**
> >
> > of Lemma: Define
> >
> > $$
> > h: = fg
> > $$
> >
> > Note
> >
> > $$
> > p:(u,v)\mapsto uv
> > $$
> >
> > from ${\mathbb{C}}^{2}\rightarrow{\mathbb{C}}$ is a product of two coordinate maps, thus is measurable since coordinate map is measurable, and product of two measurable functions is measurable.\
> > And
> >
> > $$
> > \pi:(x,y)\mapsto(f(x),g(y))
> > $$
> >
> > from $X \times Y\rightarrow{\mathbb{C}}^{2}$ is $(\mathcal{M} \otimes \mathcal{N},{\mathbb{C}}^{2})$-measurable, since for any measurable rectangle $B_{1} \times B_{2} \in {\mathbb{C}}^{2}$, we have
> >
> > $$
> > \pi^{- 1}(B_{1} \times B_{2}) = f^{- 1}(B_{1}) \times g^{- 1}(B_{2}) \in \mathcal{A} \otimes \mathcal{B}\quad\text{as a measurable rect}
> > $$
> >
> > Thus $h = \pi \circ p$ is $(\mathcal{M} \otimes \mathcal{N})$-measurable, as a **composition of two measurable functions.**\
> > To show the second statement, it suffices to assume $f,g$ takes positive real values, since otherwise we can decompose $f,g$ into their real and imaginary parts, and for each part decompose them into positive part minus negative part.\
> > Take two seq of simple functions approximating $f,g$ respectively from below, say:
> >
> > $$
> > s_{n}(x) := \sum\limits_{k = 1}^{K}a_{k}\,\chi_{A_{k}}(x),\quad t_{n}(y) = \sum\limits_{\ell = 1}^{L}b_{l}\,\chi_{B_{l}}(y)
> > $$
> >
> > their product on $X \times Y$ is
> >
> > $$
> > s_{n}(x)\, t_{n}(y) = \sum\limits_{k = 1}^{K}\sum\limits_{l = 1}^{L}a_{k}\, b_{l}\chi_{A_{k} \times B_{l}}(x,y)
> > $$
> >
> > By definition of the product measure $\mu \times \nu$, we have
> >
> > $$
> > (\mu \times \nu)(A_{k} \times B_{l}) = \mu(A_{k})\,\nu(B_{l})
> > $$
> >
> > Hence
> >
> > $$
> > \begin{matrix}
> > {\int_{X \times Y}s_{n}(x)\, t_{n}(y)\, d(\mu \times \nu)} & {= \sum\limits_{k,l}a_{k}\, b_{l}\,\mu(A_{k})\,\nu(B_{l})} \\
> >  & {= (\sum\limits_{k}a_{k}\,\mu(A_{k}))\,(\sum\limits_{l}b_{l}\,\nu(B_{l}))} \\
> >  & {= (\int_{X}s_{n}\, d\mu)(\int_{Y}t_{n}\, d\nu)}
> > \end{matrix}
> > $$
> >
> > Since $s_{n}(x)\operatorname{\nearrow ︎}f(x)$ and $t_{n}(y)\operatorname{\nearrow ︎}g(y)$, we also have $s_{n}t_{n}\operatorname{\nearrow ︎}fg$, thus by **MCT** we have:
> >
> > $$
> > \lim\limits_{n}\int_{X}s_{n}\, d\mu = \int_{X}f,\quad\lim\limits_{n}\int_{Y}t_{n}\, d\nu = \int_{Y}g
> > $$
> >
> > and
> >
> > $$
> > \lim\limits_{n}\int_{X \times Y}s_{n}(x)\, t_{n}(y)\, d(\mu \times \nu) = \int_{X \times Y}fg d(\mu \times \nu)
> > $$
> >
> > Then, since the right side are two finite positive reals, we have:
> >
> > $$
> > \int_{X \times Y}f(x)\, g(y)\, d(\mu \times \nu) = (\int_{X}f\, d\mu)\,(\int_{Y}g\, d\nu) < \infty
> > $$
> >
> > Thus $h = fg \in L^{1}(\mu \times \nu)$
>
> After proving the Lemma, we can extend it to the product of any finite number of functions. Applying it, we get
>
> $$
> F \in L^{1}({\mathbb{R}}^{2025})
> $$
>
> Then, we take arbitrary open set $U \subset {\mathbb{R}}^{2025}$ and arbitrary $p > 1$, and fix it.\
> Claim 2: $F \notin L^{p}(U)$. Sine $U$ is open in ${\mathbb{R}}^{2025}$, it must contain an open ball, thus must contain an open box (e.g., the one internally connected in the open ball), say $I_{1} \times \cdots \times I_{2025}$.\
> Suppose for contradiction that $F \in L^{p}(U)$.\
> Then by monotonicity of integration:
>
> $$
> \left. \int_{I_{1} \times \cdots \times I_{2025}} \middle| F \middle| {}_{p}\, d(x_{1},\ldots,x_{2025}) \leq \int_{U} \middle| F \middle| {}_{p}\, d(x_{1},\ldots,x_{2025}) < \infty \right.
> $$
>
> Then by Fubini's Thm we have:
>
> $$
> \left. \int_{I_{1} \times \cdots \times I_{2025}}\prod\limits_{j = 1}^{2025} \middle| f(x_{j}) \middle| {}_{p}\, d(x_{1},\ldots,x_{2025}) = \prod\limits_{j = 1}^{2025}\int_{I_{j}} \middle| f(x_{j}) \middle| {}_{p}\, dx_{j} < \infty \right.
> $$
>
> Since for each $I_{j}$, we in hw 5 proved that:
>
> $$
> \left. \int_{I_{j}} \middle| f(x_{j}) \middle| {}_{p} dx_{j} = \infty \right.
> $$
>
> This contradicts with what we got. Thus we must have $F \notin L^{p}(U)$.\
> This finishes the proof.

## $L^{p}$ norm version of LDT

Let $1 \leq p < \infty$. Suppose that $f \in L^{p}({\mathbb{R}})$. Prove that

$$
\left. \lim\limits_{r\rightarrow 0}\frac{1}{2r}\int_{x - r}^{x + r} \middle| f(y) - f(x) \middle| {}_{p} dy = 0 \right.
$$

for a.e. $x$.\
(Hint: Follow the proof of the Lebegue Differentiation Theorem when $p = 1$, i.e. approximate $f$ by $g \in C_{c}({\mathbb{R}})$ satisfying $\parallel f - g\underset{p}{\parallel} < \epsilon$. At some point, use Minkowski's inequality; note that we have $\left. |a + b \middle| \leq \middle| a \middle| + \middle| b| \right.$, but we don't have $\left. |a + b \middle| {}_{p} \leq \middle| a \middle| {}_{p} + \middle| b|^{p} \right.$ for $p > 1$.)

> **Proof**
>
> **Claim 1: The statement is true for $f \in C_{c}^{0}({\mathbb{R}}^{n})$**.\
> Proof of Claim 1:Let $f \in C_{c}^{0}({\mathbb{R}})$, then it is uniformly continuous on any compact set, thus uniformly continuous on an open ball, since its closure is compact.\
> Therefore, let $\epsilon > 0$, then there exists $\delta > 0$ such that
>
> $$
> \left. |y - x \middle| < \delta\Longrightarrow \middle| f(y) - f(x) \middle| < \epsilon \right.
> $$
>
> Thus
>
> $$
> \left. |f(y) - f(x) \middle| {}_{p} < \epsilon^{p}\quad\text{whenever}\quad \middle| y - x \middle| < \delta \right.
> $$
>
> Now fix $x \in {\mathbb{R}}$, and take $r < \delta$. Then,
>
> $$
> \left. \frac{1}{2r}\int_{x - r}^{x + r} \middle| f(y) - f(x) \middle| {}_{p}\, dy < \frac{1}{2r}\int_{x - r}^{x + r}\epsilon^{p}\, dy = \epsilon^{p} \right.
> $$
>
> Since this holds for all $r < \delta$, we get:
>
> $$
> \left. \operatorname{lim\, sup}\limits_{r\rightarrow 0}\frac{1}{2r}\int_{x - r}^{x + r} \middle| f(y) - f(x) \middle| {}_{p}\, dy \leq \epsilon^{p} \right.
> $$
>
> Since $\epsilon > 0$ was arbitrary, this proves claim 1:
>
> $$
> \left. \lim\limits_{r\rightarrow 0}\frac{1}{2r}\int_{x - r}^{x + r} \middle| f(y) - f(x) \middle| {}_{p}\, dy = 0 \right.
> $$
>
> Next we will prove the general case.\
> **Step 1: Translate the problem into proving the measure of disqualified points is zero, for which we can use arbitrary error bound.**\
> Define for each $x \in {\mathbb{R}},r > 0$:
>
> $$
> \left. Q(x,r): = \int_{x - r}^{x + r} \middle| f(y) - f(x) \middle| {}_{p} dy = \parallel f\chi_{B_{r}(x)} - f(x)\chi_{B_{r}(x)}\underset{p}{\overset{p}{\parallel}} \right.
> $$
>
> And then we define for each $x \in {\mathbb{R}}$:
>
> $$
> Q(x): = \operatorname{lim\, sup}\limits_{r\rightarrow 0 +}\frac{Q(x,r)^{1/p}}{(2r)^{1/p}}
> $$
>
> Then what we want to show is just:
>
> $$
> m(\left\{ {x:Q(x) > 0} \right\}) = 0
> $$
>
> which is equivalent to show:
>
> $$
> m(\left\{ {x:Q(x) \geq \alpha} \right\}) = 0\quad\text{for all}\ \alpha > 0
> $$
>
> Fix $\alpha > 0$. It suffices to show: for any $\epsilon > 0$, we have:
>
> $$
> m(\left\{ {x:Q(x) \geq \alpha} \right\}) < \epsilon
> $$
>
> Now fix $\epsilon > 0$. Take $g \in C_{c}^{0}({\mathbb{R}})$ s.t. $\parallel f - g\underset{p}{\parallel} < \epsilon$. This can be done, by the density of $C_{c}^{0}({\mathbb{R}})$ in $L^{p}(m)$.\
> **Step 2: Bound the $\left. \lim_{r\rightarrow 0}\frac{1}{2r}\int_{x - r}^{x + r} \middle| f(y) - f(x) \middle| {}_{p} dy \right.$ by $\epsilon$-controllable expressions, using Minkowski's ineq; thus bound the measure of disqualified points by two $\epsilon$-controllable sets**\
> Define for each $x \in {\mathbb{R}},r > 0$:
>
> $$
> \left. Q(x,r): = \int_{x - r}^{x + r} \middle| f(y) - f(x) \middle| {}_{p} dy = \parallel f\chi_{B_{r}(x)} - f(x)\chi_{B_{r}(x)}\underset{p}{\overset{p}{\parallel}} \right.
> $$
>
> This is nonnegative. And since $|f - f(x)|$ is measurable and $L^{p}$ (since $|f|$ is $L^{p}$), $|f - f(x)|^{p}$ is $L^{1}$, and thus, recall we proved in lecture that $Q(x,r)$ is jointly continuous in $r$ and $x$.\
> By triangular ineq
>
> $$
> \left. Q(x,r)^{1/p} \leq (\int_{x - r}^{x + r}( \middle| f(y) - g(y) \middle| + \middle| g(y) - g(x) \middle| + \middle| g(x) - f(x) \middle| )^{p} dy)^{1/p} \right.
> $$
>
> Then by Minkowski's ineq:
>
> $$
> Q(x,r)^{1/p} \leq \parallel f\chi_{B_{r}(x)} - g\chi_{B_{r}(x)}\underset{p}{\parallel} + \parallel g\chi_{B_{r}(x)} - g(x)\chi_{B_{r}(x)}\underset{p}{\parallel} + \parallel g(x)\chi_{B_{r}(x)} - f(x)\chi_{B_{r}(x)}\underset{p}{\parallel}
> $$
>
> Thus
>
> $$
> \begin{matrix}
> {\operatorname{lim\, sup}\limits_{r\rightarrow 0 +}\frac{Q(x,r)^{1/p}}{(2r)^{1/p}}} & {\leq \operatorname{lim\, sup}\limits_{r\rightarrow 0 +}\frac{\parallel f\chi_{B} - g\chi_{B}\underset{p}{\parallel}}{(2r)^{1/p}} + \operatorname{lim\, sup}\limits_{r\rightarrow 0 +}\frac{\parallel g\chi_{B} - g(x)\chi_{B}\underset{p}{\parallel}}{(2r)^{1/p}} + \operatorname{lim\, sup}\limits_{r\rightarrow 0 +}\frac{\parallel g(x)\chi_{B} - f(x)\chi_{B}\underset{p}{\parallel}}{(2r)^{1/p}}} \\
>  & {= \operatorname{lim\, sup}\limits_{r\rightarrow 0 +}\frac{\parallel f\chi_{B} - g\chi_{B}\underset{p}{\parallel}}{(2r)^{1/p}} + \operatorname{lim\, sup}\limits_{r\rightarrow 0 +}\frac{\parallel g(x)\chi_{B} - f(x)\chi_{B}\underset{p}{\parallel}}{(2r)^{1/p}}}
> \end{matrix}
> $$
>
> Since we already proved the middle one of the three norms is zero, as continuous funciton with cpt supp.\
> Step 2: Reduce the statement to For simplication of notation, we also define for each $x \in {\mathbb{R}}$:
>
> $$
> M_{1}(x) := \operatorname{lim\, sup}\limits_{r\rightarrow 0 +}\frac{\parallel f\chi_{B_{r}(x)} - g\chi_{B_{r}(x)}\underset{p}{\parallel}}{(2r)^{1/p}},\quad M_{2}(x): = \operatorname{lim\, sup}\limits_{r\rightarrow 0 +}\frac{\parallel g(x)\chi_{B_{r}(x)} - f(x)\chi_{B_{r}(x)}\underset{p}{\parallel}}{(2r)^{1/p}}
> $$
>
> By the ineq we obtained, we have:
>
> $$
> \left\{ {x:Q(x) \geq \alpha} \right\} \subset \left\{ {x:M_{1}(x) \geq \frac{\alpha}{2}} \right\} \cup \left\{ {x:M_{2}(x) \geq \frac{\alpha}{2}} \right\}
> $$
>
> Since if we have both $M_{1}(x) < \frac{\alpha}{2}$ and $M_{2}(x) < \frac{\alpha}{2}$, we cannot have $Q(x) \geq \alpha$.\
> Thus
>
> $$
> m\left\{ {x:Q(x) \geq \alpha} \right\} \leq m\left\{ {x:M_{1}(x) \geq \frac{\alpha}{2}} \right\} + m\left\{ {x:M_{2}(x) \geq \frac{\alpha}{2}} \right\}
> $$
>
> **Step 3: Bound $m\left\{ {x:M_{1}(x) \geq \frac{\alpha}{2}} \right\}$ using HL max Thm.**\
> Note
>
> $$
> \left. \frac{\parallel f\chi_{B} - g\chi_{B}\underset{p}{\parallel}}{(2r)^{1/p}} = (\frac{1}{2r}\int \middle| f\chi_{B} - g\chi_{B} \middle| {}_{p})^{\frac{1}{p}} \right.
> $$
>
> And we can express it as HL max function of
>
> $$
> \left. \sup\limits_{r}\frac{1}{2r}\int \middle| f\chi_{B} - g\chi_{B} \middle| {}_{p} = H(f\chi_{B} - g\chi_{B})^{p}(x) \right.
> $$
>
> We want
>
> $$
> m\left\{ {x:(H(f\chi_{B} - g\chi_{B})^{p}(x))^{1/p} > \frac{\alpha}{2}} \right\} = m\left\{ {x:H(f\chi_{B} - g\chi_{B})^{p}(x) > (\frac{\alpha}{2})^{p}} \right\}
> $$
>
> And by HL max Thm:
>
> $$
> \left. m\left\{ {x:H(f\chi_{B} - g\chi_{B})^{p}(x) > (\frac{\alpha}{2})^{p}} \right\} \leq \frac{2^{p}3^{n}}{\alpha^{p}}\int( \middle| f - g \middle| \chi_{B})^{p} \leq \frac{2^{p}3^{n}}{\alpha^{p}}\int \middle| f - g \middle| {}_{p} \leq \frac{2^{p}3^{n}}{\alpha^{p}}\epsilon^{p} \right.
> $$
>
> **Step 4: Bound $m\left\{ {x:M_{2}(x) \geq \frac{\alpha}{2}} \right\}$ using Markov's ineq.**\
> Notice that $M_{2}(x)$ is independent with $r$:
>
> $$
> \frac{\parallel g(x)\chi_{B_{r}(x)} - f(x)\chi_{B_{r}(x)}\underset{p}{\parallel}}{(2r)^{1/p}} = \frac{((f(x) - g(x))^{p}\, 2r)^{1/p}}{(2r)^{1/p}} = (f(x) - g(x))^{p}
> $$
>
> Thus
>
> $$
> m\left\{ {x:M_{2}(x) \geq \frac{\alpha}{2}} \right\} = m\left\{ {x:(f(x) - g(x))^{p} \geq \frac{\alpha}{2}} \right\}
> $$
>
> Therefore by Markov's ineq:
>
> $$
> m\left\{ {x:M_{2}(x) \geq \frac{\alpha}{2}} \right\} = m\left\{ {x:(f(x) - g(x))^{p} \geq \frac{\alpha}{2}} \right\} \leq \frac{2}{\alpha}\int(f(x) - g(x))^{p} = \frac{2}{\alpha}\epsilon^{p}
> $$
>
> Put it all together we have:
>
> $$
> m\left\{ {x:Q(x) \geq \alpha} \right\} \leq (\frac{2^{p}3^{n}}{\alpha^{p}} + \frac{2}{\alpha})\epsilon^{p}
> $$
>
> Since $\epsilon$ is arbitrary, we finally proved that
>
> $$
> m\left\{ {x:Q(x) \geq \alpha} \right\} = 0\quad\text{for any}\ \alpha
> $$
>
> finishing the proof.

## **generalization of Hölder**: bootstrapped Hölder

Prove the following generalization of Hölder's inequality. Let $0 < s < \infty$ and $0 < p_{1},\ldots,p_{n} < \infty$ be such that

$$
\frac{1}{p_{1}} + \frac{1}{p_{2}} + \ldots + \frac{1}{p_{n}} = \frac{1}{s};
$$

then

$$
\parallel f_{1}f_{2}\cdots f_{n}\underset{s}{\parallel} \leq \parallel f_{1}\underset{p_{1}}{\parallel} \parallel f_{2}\underset{p_{2}}{\parallel}\cdots \parallel f_{n}\underset{p_{n}}{\parallel}.
$$

> **Proof**
>
> We prove by induction, applying Hölder's inequality each time.\
> base case: If $n = 1$ then the result is Hölder's inequality, as proved.\
> Inductive step: Suppose the inequality holds for all $s,p_{1},\cdots,p_{n - 1}$ such that the equality holds, then we assume there are $n$ positive reals $p_{1},\cdots,p_{n}$ and some $s > 0$ s.t.
>
> $$
> \frac{1}{p_{1}} + \frac{1}{p_{2}} + \ldots + \frac{1}{p_{n}} = \frac{1}{s}
> $$
>
> WTS the ineq also hold.\
> We set:
>
> $$
> \frac{1}{r} := \frac{1}{p_{1}} + \frac{1}{p_{2}} + \cdots + \frac{1}{p_{n - 1}}
> $$
>
> Then we have
>
> $$
> \frac{1}{r} + \frac{1}{p_{n}} = \frac{1}{s}
> $$
>
> By the induction hypothesis applying to the $n - 1$ functions $f_{1},\ldots,f_{n - 1}$, we have
>
> $$
> \parallel f_{1}f_{2}\cdots f_{n - 1}\underset{r}{\parallel} \leq \parallel f_{1}\underset{p_{1}}{\parallel}\, \parallel f_{2}\underset{p_{2}}{\parallel}\,\cdots\, \parallel f_{n - 1}\underset{p_{n - 1}}{\parallel}
> $$
>
> Now we define:
>
> $$
> g(x) := f_{1}(x)f_{2}(x)\cdots f_{n - 1}(x),\quad h(x) = :f_{n}(x)
> $$
>
> Applying the classical Hölder inequality with conjugate exponents $r$ and $p_{n}$, we have:
>
> $$
> \parallel gh\underset{s}{\parallel} = \parallel f_{1}f_{2}\cdots f_{n - 1} \cdot f_{n}\underset{s}{\parallel} \leq \parallel f_{1}f_{2}\cdots f_{n - 1}\underset{r}{\parallel} \cdot \parallel f_{n}\underset{p_{n}}{\parallel}.
> $$
>
> Putting it all together, we obtain:
>
> $$
> \begin{matrix}
> {\parallel gh\underset{s}{\parallel} = \parallel f_{1}f_{2}\cdots f_{n - 1} \cdot f_{n}\underset{s}{\parallel}} & \left. \leq \middle| f_{1}f_{2}\cdots f_{n - 1}\underset{r}{\parallel}\, \parallel f_{n}\underset{p_{n}}{\parallel} \right. \\
>  & {\leq ( \parallel f_{1}\underset{p_{1}}{\parallel}\cdots \parallel f_{n - 1}\underset{p_{n - 1}}{\parallel})\, \parallel f_{n}\underset{p_{n}}{\parallel}} \\
>  & {= \parallel f_{1}\underset{p_{1}}{\parallel}\cdots \parallel f_{n}\underset{p_{n}}{\parallel}}
> \end{matrix}
> $$
>
> This completes the inductive step, and thus the proof of the generalized Hölder inequality.

## Translated a function by $t$: $f^{t}\rightarrow f$ in $L^{p}$ ($1 \leq p < \infty$), but not in $L^{\infty}$ {#translated-a-function-by-t-ft-to-f-in-lp-1leq-p-infty-but-not-in-linfty}

For any measurable function $f:{\mathbb{R}}\rightarrow{\mathbb{R}}$, set

$$
f^{y}(x) := f(x - y),\quad x \in {\mathbb{R}}
$$

- Suppose that $f$ is continuous with compact support. Prove that $\lim_{y\rightarrow 0} \parallel f^{y} - f\underset{\infty}{\parallel} = 0$.

- Suppose that $f \in L^{p}({\mathbb{R}})$ for some $p \in \lbrack 1,\infty)$. Prove that $\lim_{y\rightarrow 0} \parallel f^{y} - f\underset{p}{\parallel} = 0$.

- Prove by example that (ii) is false for $p = \infty$.

> **Proof**
>
> **of (a):**\
> Suppose $f$ is continuous with compact support $K \subset {\mathbb{R}}$, then it is uniformly continuous.\
> Let $\epsilon > 0$ and fix it. By uniform continuity, there exists $\delta > 0$ such that
>
> $$
> \left. |\ x - z\  \middle| < \delta\Longrightarrow \middle| f(x) - f(z) \middle| < \epsilon \right.
> $$
>
> For given $y$, we have:
>
> $$
> \left. \parallel f^{y} - f\underset{\infty}{\parallel} = \text{ess}\sup\limits_{x \in {\mathbb{R}}} \middle| \ f^{y}(x) - f(x) \middle| \leq \sup\limits_{x \in {\mathbb{R}}} \middle| \ f^{y}(x) - f(x) \middle| = \sup\limits_{x \in {\mathbb{R}}} \middle| \ f(x - y) - f(x)| \right.
> $$
>
> Then for $\left. |y \middle| < \delta \right.$: for any $x$, $\left. |x - y - x \middle| = \middle| y \middle| < \delta \right.$. Thus by uniform continuity, must have $\left. |\ f(x - y) - f(x) \middle| < \epsilon \right.$. Thus we got:
>
> $$
> \left. \parallel f^{y} - f\underset{\infty}{\parallel} \leq \epsilon\quad\forall \middle| y \middle| < \delta \right.
> $$
>
> Since $\epsilon$ is arbitrary, this proves that
>
> $$
> \lim\limits_{y\rightarrow 0} \parallel f^{y} - f\underset{\infty}{\parallel} = 0
> $$

> **Proof**
>
> **of (b):**\
> Since $C_{c}({\mathbb{R}})$ is dense in $L^{p}({\mathbb{R}})$ for $1 \leq p < \infty$, we can take a seq of continuous functions with compact support, say $(\varphi_{n})$, s.t. $\varphi_{n}\rightarrow f$ in $L^{p}$.\
> Then for each $y \in {\mathbb{R}}$, we can define
>
> $$
> \varphi_{n}^{y}(x) := \varphi_{n}(x - y)
> $$
>
> From (a) we have, for each $n$:
>
> $$
> \lim\limits_{y\rightarrow 0} \parallel \varphi_{n}^{y} - \varphi_{n}\underset{\infty}{\parallel} = 0
> $$
>
> Note that since each $\varphi_{n}$ have compact $K$ whose measure is finite, we have:
>
> $$
> \left. \parallel \varphi_{n}^{y} - \varphi_{n}\underset{p}{\parallel} = \int \middle| \varphi_{n}^{y} - \varphi_{n} \middle| {}_{p} dm \leq \int\sup\limits_{x} \middle| \varphi_{n}^{y} - \varphi_{n} \middle| {}_{p} dm = \parallel \varphi_{n}^{y} - \varphi_{n}\underset{\infty}{\overset{p}{\parallel}}m(K) \right.
> $$
>
> Thus,
>
> $$
> \lim\limits_{y\rightarrow 0} \parallel \varphi_{n}^{y} - \varphi_{n}\underset{\infty}{\parallel} = 0\Longrightarrow\lim\limits_{y\rightarrow 0} \parallel \varphi_{n}^{y} - \varphi_{n}\underset{p}{\parallel} = 0
> $$
>
> Also, by translation invariance of Lebesgue measure, for each $y$ we have:
>
> $$
> \parallel f^{y} - \varphi_{n}^{y}\underset{p}{\parallel} = \parallel f - \varphi_{n}\underset{p}{\parallel}
> $$
>
> Therefore for each $y$, we can bound
>
> $$
> \begin{matrix}
> {\parallel f^{y} - f\underset{p}{\parallel}} & {\leq \parallel f^{y} - \varphi_{n}^{y}\underset{p}{\parallel} + \parallel \varphi_{n}^{y} - \varphi_{n}\underset{p}{\parallel} + \parallel \varphi_{n} - f\underset{p}{\parallel}} \\
>  & {\  = 2 \parallel \varphi_{n} - f\underset{p}{\parallel} + \parallel \varphi_{n}^{y} - \varphi_{n}\underset{p}{\parallel}}
> \end{matrix}
> $$
>
> The construction of bound has finished. Now Let $\epsilon > 0$ and fix it. We first choose $n$ large enough so that
>
> $$
> |\varphi_{n} - f\underset{p}{\parallel} < \frac{\epsilon}{3}
> $$
>
> and for the fixed $n$, we choose $\delta$ s.t. for all $\left. |y \middle| < \delta \right.$ we have
>
> $$
> \parallel \varphi_{n}^{y} - \varphi_{n}\underset{p}{\parallel} < \frac{\epsilon}{3}
> $$
>
> Then we have:
>
> $$
> \left. \parallel f^{y} - f\underset{p}{\parallel} \leq \epsilon\quad\forall \middle| y \middle| < \delta \right.
> $$
>
> Since $\epsilon$ is arbitrary, this proves that
>
> $$
> \lim\limits_{y\rightarrow 0} \parallel f^{y} - f\underset{p}{\parallel} = 0
> $$

> **Proof**
>
> **of (c):**\
>
> We consider
>
> $$
> f(x) := \chi_{(0,1)}
> $$
>
> We have
>
> $$
> \parallel f\underset{\infty}{\parallel} = 1
> $$
>
> and the sup is taken on $x \in (0,1)$.\
> Then for any $y$, we have: We have
>
> $$
> \left. |\ f^{y}(x) - f(x) \middle| = \middle| \ \chi_{(0,1)}(x - y) - \chi_{(0,1)}(x) \middle| = \middle| \ \chi_{(y,y + 1)}(x) - \chi_{(0,1)}(x)| \right.
> $$
>
> Thus for all $y > 0$, on the open set $(1,y + 1)$ which has positive measure, we have $\left. |\ f^{y}(x) - f(x) \middle| = 1 \right.$;\
> For all $y < 0$, on the open set $(y,0)$ which has positive measure, we have $\left. |\ f^{y}(x) - f(x) \middle| = 1 \right.$; Thus the function $\parallel f^{y} - f\underset{\infty}{\parallel}$ with respect to $y$ actually has a jump discontinuity at $0$, since it is $0$ at $y = 1$ and $1$ elsewhere.\
> This serves as an counterexample that we do not necessarily have $\lim_{y\rightarrow 0} \parallel f^{y} - f\underset{\infty}{\parallel} = 0$.

> **Remark**
>
> 这里可以体现 $L^{\infty}$ convergence 的严格性, 从本质上比其他 $L^{p}$ convergence 都要高一级别.

## Criterion for $L^{p}$-convergence: a.e. conv $+$ 积分值 conv

Suppose that $1 \leq p < \infty$ and that $f_{n},f \in L^{p}$ for some measure space $(X,\mathcal{A},\mu)$. Prove that if $f_{n}\rightarrow f$ a.e. and $\parallel f_{n}\underset{p}{\parallel}\rightarrow \parallel f\underset{p}{\parallel}$, then $\parallel f_{n} - f\underset{p}{\parallel}\rightarrow 0$. Is the converse true? *Hint*: revisit the "**Generalized DCT**" problem on HW5.

> **Proof**
>
> Recall we have proved
>
> > **Theorem: --[[Generalized DCT]]--**
> >
> > Let $(X,\mathcal{A},\mu)$ be a measure space, and $f_{n},g_{n},f,g \in L^{1}$, $n \in {\mathbb{N}}$. Suppose that
> >
> > - $\lim_{n\rightarrow\infty}f_{n}(x) = f(x)$ and $\lim_{n\rightarrow\infty}g_{n}(x) = g(x)$ for a.e. $x$;
> >
> > - $\left. |f_{n}(x) \middle| \leq g_{n}(x) \right.$ a.e. for every $n \in {\mathbb{N}}$;
> >
> > - $g_{n}:X\rightarrow\lbrack 0,\infty\rbrack$ and $\lim_{n\rightarrow\infty}\int g_{n} d\mu = \int g d\mu$.
> >
> > Then we have:
> >
> > $$
> > \lim\limits_{n\rightarrow\infty}\int f_{n} d\mu = \int f d\mu
> > $$
>
> which is the case $p = 1$. Now we prove the general case with the help of the case $p = 1$. We notice that $f_{n}\rightarrow f$ in $L^{p}$, is just to prove the function $\left. |f_{n} - f \middle| {}_{p}\rightarrow 0 \right.$ in $L^{1}$, that's how we can use the generalized DCT.\
> Assume the hypothesis. Since $x^{p}$ is convex for $p \geq 1$, we have for any $x,y$:
>
> $$
> (\frac{x + y}{2})^{p} \leq \frac{x^{p} + y^{p}}{2}
> $$
>
> Thus
>
> $$
> (x + y)^{p} \leq 2^{p - 1}(x^{p} + y^{p})
> $$
>
> Therefore for each $n$ and almost every $x$, we have:
>
> $$
> \left. |f_{n}(x) - f(x) \middle| {}_{p} \leq ( \middle| f_{n}(x) \middle| + \middle| f(x) \middle| )^{p} \leq 2^{\, p - 1}( \middle| f_{n}(x) \middle| {}_{p} + \middle| f(x) \middle| {}_{p}) \right.
> $$
>
> Hence
>
> $$
> \left. |f_{n} - f \middle| {}_{p} \leq 2^{\, p - 1}( \middle| f_{n} \middle| {}_{p} + \middle| f \middle| {}_{p}) \right.
> $$
>
> We define for each $n$:
>
> $$
> \left. g_{n} := 2^{\, p - 1}( \middle| f_{n} \middle| {}_{p} + \middle| f \middle| {}_{p}) \right.
> $$
>
> Since $f_{n}\rightarrow f$ a.e., we have $\left. |f_{n} \middle| {}_{p}\rightarrow \middle| f|^{p} \right.$ a.e. Thus
>
> $$
> \left. g_{n}(x) = 2^{p - 1}( \middle| f_{n}(x) \middle| {}_{p} + \middle| f(x) \middle| {}_{p})\overset{n\rightarrow\infty}{\rightarrow}2^{p - 1}( \middle| f(x) \middle| {}_{p} + \middle| f(x) \middle| {}_{p}) = 2^{p}\, \middle| f(x) \middle| {}_{p} = :g(x) \right.
> $$
>
> Note that
>
> $$
> \int g_{n}\, d\mu = 2^{p - 1}\,( \parallel f_{n}\underset{p}{\overset{p}{\parallel}} + \parallel f\underset{p}{\overset{p}{\parallel}})
> $$
>
> Since $\left\| f_{n} \right\|_{p}\rightarrow\left\| f \right\|_{p},$ we have
>
> $$
> \lim\limits_{n\rightarrow\infty}\int g_{n}\, d\mu = 2^{p - 1}\,( \parallel f\underset{p}{\overset{p}{\parallel}} + \parallel f\underset{p}{\overset{p}{\parallel}}) = 2^{p}\, \parallel f\underset{p}{\overset{p}{\parallel}} = \int g\, d\mu
> $$
>
> Now we have **(1)** $g_{n}\rightarrow g$, **(2)** $\int g_{n}\rightarrow\int g$, and **(3)** $g_{n}$ is an upper bound for $|f_{n} - f|^{p}$. Then we can apply generalized DCT to the function seq $|f_{n} - f|^{p}$:
>
> $$
> \left. \lim\limits_{n\rightarrow\infty} \parallel f_{n} - f\underset{p}{\overset{p}{\parallel}} = \lim\limits_{n\rightarrow\infty}\int \middle| \ f_{n}(x) - f(x) \middle| {}_{p}\, d\mu = \int 0\, d\mu = 0 \right.
> $$
>
> Thus
>
> $$
> \lim\limits_{n\rightarrow\infty} \parallel f_{n} - f\underset{p}{\parallel} = 0^{1/p} = 0
> $$
>
> This finishes the proof that $f_{n}\rightarrow f$ in $L^{p}$.

> **Solution**
>
> The converse does not hold.\
> We recall the typewriter function on $\lbrack 0,1\rbrack$:
>
> $$
> f_{n,k}(x) = \left\{ \begin{matrix}
> {1,} & {x \in \left\lbrack {\frac{n - 1}{2^{k}},\frac{n}{2^{k}}} \right\rbrack} \\
> {0,} & \text{otherwise}
> \end{matrix} \right.
> $$
>
> We index over $k \in {\mathbb{N}}$, and for each $k$ we index over $n = 1$ to $2^{k}$. That is, for given $k$, $f_{n}$ is the indicator function of the $n$-th dyadic interval.\
> Then
>
> $$
> \parallel f_{n}\underset{p}{\parallel} = \left( \int_{\lbrack 0,1\rbrack} \middle| \ f_{n}(x)\  \middle| {}_{p}\ dx \right)^{1/p} = \left( \text{length of the dyadic interval} \right)^{1/p} \leq 2^{- k/p}
> $$
>
> Therefore, since each $f_{n}$ has support of shrinking length, we get:
>
> $$
> \parallel f_{n,k}\underset{p}{\parallel}\rightarrow 0\quad\text{as}\ k\rightarrow\infty
> $$
>
> but for each $x$, $f_{n,k}(x) = 1$ for infinitely many $(n,k)$. so $f_{n}(x)$ does not converge to 0 for any $x \in \lbrack 0,1\rbrack$.

*Nur für Verrückte*

(It's **really** not necessary to attempt these problems. Do not, under any circumstances, hand them in!)

1.  Prove that the category of measurable spaces (see HW1) admits finite products, and that the product of $(X,\mathcal{A})$ and $(Y,\mathcal{B})$ equals $(X \times Y,\mathcal{A} \otimes \mathcal{B})$.

2.  Now consider the category of measure spaces (see HW2). Consider two measure spaces $(X_{i},\mathcal{A}_{i},\mu_{i})$, $i = 1,2$, and set $X = X_{1} \times X_{2}$, $\mathcal{A} = \mathcal{A}_{1} \otimes \mathcal{A}_{2}$, and $\mu = \mu_{1} \times \mu_{2}$.

    - Prove that the projection maps $X\rightarrow X_{i}$ are measurable, and that they are measure preserving iff $\mu_{j}(X_{j}) = 1$ for $j = 1,2$. Thus $(X,\mathcal{A},\mu)$ is *not* the categorical product of $(X_{i},\mathcal{A}_{i},\mu_{i})$ in general.

    - Prove that even if $\mu_{i}(X_{i}) = 1$, the measure space $(X,\mathcal{A},\mu)$ is *not* the categorical product of $(X_{i},\mathcal{A}_{i},\mu_{i})$ in general. *Hint*: consider the case when the $X_{i}$ consist of two elements, for example $X_{i} = \left\{ {{\mathfrak{o}}_{i},{\mathfrak{v}}_{i}} \right\}$.
