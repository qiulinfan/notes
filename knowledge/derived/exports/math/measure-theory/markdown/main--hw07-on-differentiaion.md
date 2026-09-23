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
source: "notes/math/measure-theory/homeworks/hw07-on_differentiaion.typ"
subtitle: Typst-first course notes and worked homeworks
title: "MATH 597: Measure Theory"
---
# Homework 7: on differentiaion (50/50)

*None of the following questions will be graded. Do them, but do not hand them in*.

## Completion of $(X \times Y,\mathcal{A} \otimes \mathcal{B},\mu \times \nu)$ = Completion of $(X \times Y,\bar{\mathcal{A}} \otimes \bar{\mathcal{B}},\bar{\mu} \times \bar{\nu})$ {#completion-of-xtimes-y-mathcalaotimes-mathcalb-mutimes-nu-completion-of-xtimes-y-barmathcalaotimes-barmathcalb-barmutimes-barnu}

Let $(X,\mathcal{A},\mu)$ and $(Y,\mathcal{B},\nu)$ be measure spaces. Let $(X,\bar{\mathcal{A}},\bar{\mu})$ and $(Y,\bar{\mathcal{B}},\bar{\nu})$ be their completions, respectively. Then, the completion of $(X \times Y,\mathcal{A} \otimes \mathcal{B},\mu \times \nu)$ is same as the completion of $(X \times Y,\bar{\mathcal{A}} \otimes \bar{\mathcal{B}},\bar{\mu} \times \bar{\nu})$.

## Modified HL maximal inequality ($\geq$ instead of $>$)

Prove that there is a constant $C_{n} > 0$ that only depends on $n$ such that for every $f \in L^{1}({\mathbb{R}}^{n})$ and $\alpha > 0$,

$$
\left. m(\left\{ {x \in {\mathbb{R}}^{n} \mid Hf(x) \geq \alpha} \right\}) \leq \frac{C_{n}}{\alpha}\int_{{\mathbb{R}}^{n}} \middle| f(x) \middle| dx \right.
$$

(Remark: We had $Hf(x) > \alpha$ for the HL maximal inequality. Here we have $Hf(x) \geq \alpha$.)

## density of a mble set at a point: $D_{E}(x) = 1$ for a.e. $x \in E$, $0$ for a.e. $x \in E^{c}$

For a Lebesgue measurable subset $E$ of ${\mathbb{R}}^{n}$, the *density of $E$ at $x$* is defined as

$$
D_{E}(x) = \lim\limits_{r\rightarrow 0}\frac{m(E \cap B(x,r))}{m(B(x,r)}
$$

provided that the limit exists. Prove that $D_{E}(x) = 1$ for a.e. $x \in E$ and $D_{E}(x) = 0$ for a.e. $x \in E^{c}$. *Hint*: ask Lebesgue.

*Some of the following questions will be graded. Do them, and do hand them in*.

## An identity: $\int_{0}^{\infty}e^{- 2sx}\frac{\sin^{2}x}{x} dx = \frac{1}{4}\log(1 + s^{- 2})$ {#an-identity-int_0infty-e-2sxfracsin2xxd-xfrac14log1s-2}

Prove that $\int_{0}^{\infty}e^{- 2sx}\frac{\sin^{2}x}{x} dx = \frac{1}{4}\log(1 + s^{- 2})$ for $s > 0$ by integrating the function $e^{- 2sx}\sin(2xy)$ with respect to $x$ and $y$ over suitable regions.

> **Proof**
>
> For fixed $x > 0$, by FTC we have:
>
> $$
> \sin^{2}(x) = \int_{0}^{x}\sin(2t)\, dt
> $$
>
> We do change of variable $t = xy$. This is a valid diffeomorphism mapping $y \in (0,1)$ to $t \in (0,x)$.\
> Then by change of variable theorem we have:
>
> $$
> \int_{(0,x)}\sin(2t)\, dt = \int_{(0,1)}x\sin(2xy)\, dy
> $$
>
> Thus
>
> $$
> \frac{\sin^{2}x}{x} = \int_{0}^{1}\sin(2xy)\, dy
> $$
>
> Then we get:
>
> $$
> \int_{0}^{\infty}e^{- 2sx}\frac{\sin^{2}x}{x} dx = \int_{0}^{\infty}e^{- 2sx}\lbrack\int_{0}^{1}\sin(2xy)\, dy\rbrack dx
> $$
>
> Consider the function
>
> $$
> f(x,y) := e^{- 2sx}\sin(2xy),\quad(x,y) \in (0,\infty) \times (0,1)
> $$
>
> $f$ is a composition of continuous functions, thus continuous. Note that it is also in $L^{1}((0,\infty) \times (0,1))$ since $|f(x,y)|$ is bounded by $g(x,y) := e^{- 2sx}$, which is $L^{1}$ on the same domain (its integral is $\frac{1}{2s}$), then by DCT, $f \in L^{1}((0,\infty) \times (0,1))$.\
> Thus we can apply Fubini's theorem to switch the order of integration:
>
> $$
> \begin{matrix}
> {\int_{0}^{\infty}e^{- 2sx}\lbrack\int_{0}^{1}\sin(2xy)\, dy\rbrack dx} & {= \int_{(0,\infty) \times (0,1)}e^{- 2sx}\,\sin(2xy)\, d(x \times y)} \\
>  & {= \int_{0}^{1}(\int_{0}^{\infty}e^{- 2sx}\sin(2xy)\, dx)dy}
> \end{matrix}
> $$
>
> Recall back in Calculus we use integration by part to get:
>
> $$
> \int_{0}^{\infty}e^{- ax}\,\sin(bx)\, dx = \frac{b}{a^{2} + b^{2}}
> $$
>
> for $a > 0$. In our case, $a = 2s$ and $b = 2y$. Thus
>
> $$
> \int_{0}^{\infty}e^{- 2sx}\,\sin(2xy)\, dx = \frac{2y}{(2s)^{2} + (2y)^{2}} = \frac{y}{2\,(s^{2} + y^{2})}
> $$
>
> Therefore we here get
>
> $$
> \begin{matrix}
> {\int_{0}^{\infty}e^{- 2sx}\frac{\sin^{2}x}{x} dx} & {= \int_{0}^{1}(\int_{0}^{\infty}e^{- 2sx}\sin(2xy)\, dx)dy} \\
>  & {= \int_{0}^{1}\frac{y}{2\,(s^{2} + y^{2})}\, dy} \\
>  & {= \frac{1}{2}\int_{0}^{1}\frac{y}{s^{2} + y^{2}}\, dy}
> \end{matrix}
> $$
>
> By Calculus we have (by chain rule):
>
> $$
> \int_{0}^{1}\frac{y}{s^{2} + y^{2}}\, dy = \lbrack\frac{1}{2}\log(s^{2} + y^{2})\rbrack_{0}^{1} = \frac{1}{2}\log(\frac{s^{2} + 1}{s^{2}}) = \frac{1}{2}\log(1 + \frac{1}{s^{2}})
> $$
>
> Thus we conclude:
>
> $$
> \begin{matrix}
> {\int_{0}^{\infty}e^{- 2sx}\frac{\sin^{2}x}{x} dx} & {= \frac{1}{2}\int_{0}^{1}\frac{y}{s^{2} + y^{2}}\, dy} \\
>  & {= \frac{1}{2} \cdot \frac{1}{2}\log(1 + \frac{1}{s^{2}})} \\
>  & {= \frac{1}{4}\log(1 + \frac{1}{s^{2}})}
> \end{matrix}
> $$
>
> as desired.

## $E \in \mathcal{A} \otimes \mathcal{A}\Longrightarrow$diagonal of $E \in \mathcal{A}$ {#einmathcalaotimesmathcala-impliesdiagonal-of-e-in-mathcala}

- Prove that if $E \in \mathcal{A} \otimes \mathcal{A}$, then

  $$
  \left\{ {x \in X:(x,x) \in E} \right\} \in \mathcal{A}
  $$

- Using this fact, find an example of a subset $E \subset {\mathbb{R}} \times {\mathbb{R}}$ such that $E_{x} \in \mathcal{L}({\mathbb{R}})$ for all $x \in {\mathbb{R}}$ and $E^{y} \in \mathcal{L}({\mathbb{R}})$ for all $y \in {\mathbb{R}}$, but $E \notin \mathcal{L}({\mathbb{R}}) \otimes \mathcal{L}({\mathbb{R}})$. *Hint*: ask Vitali.

> **Proof**
>
> **of (a):**\
> We consider the map:
>
> $$
> \begin{matrix}
> {\phi:X} & {\rightarrow X \times X} \\
> x & {\mapsto(x,x)}
> \end{matrix}
> $$
>
> Then it suffices to show that $\phi$ is $(\mathcal{A},\mathcal{A} \otimes \mathcal{A})$-measurable. Since if so, then for each $E \in \mathcal{A} \otimes \mathcal{A}$, $\phi^{- 1}(E) = \left\{ {x \in X:(x,x) \in E} \right\} \in \mathcal{A}$, which is exactly what we want.\
> Let $A \times B \in \mathcal{A} \otimes \mathcal{A}$ be a measurable rectangle, we discover that:
>
> $$
> \phi^{- 1}(A \times B) = \left\{ {x \in X:x \in A,x \in B} \right\} = A \cap B \in \mathcal{A}
> $$
>
> ![Figure 26:[ ]{style="white-space: pre-wrap"}](.assets/main--figure-raster-026.png){width="30%"}
>
> We first prove a lemma:
>
> > **Lemma**
> >
> > Suppose $f:X\rightarrow Y \times Z$ is a function from a measurable space $(X,\mathcal{A})$ to a product measure space $(Y \times Z,\mathcal{B}_{1} \otimes \mathcal{B}_{2})$.\
> > Claim: If $f^{- 1}(B_{1} \times B_{2}) \in \mathcal{A}$ for each measurable rectangle $B_{1} \times B_{2} \in \mathcal{B}_{1} \otimes \mathcal{B}_{2}$, then $f$ is an $(\mathcal{A},\mathcal{B}_{1} \otimes \mathcal{B}_{2})$-measurable function.
>
> > **Proof**
> >
> > **of Lemma:**\
> > Since $f^{- 1}(B \times C) \in \mathcal{A}$ for each measurable rectangle $B_{1} \times B_{2} \in \mathcal{B}_{1} \otimes \mathcal{B}_{2}$, the preimage of any countable disjoint unions of measurable rectangles, is also in $\mathcal{A}$, since $\mathcal{A}$ is an $\sigma$-algebra.\
> > We want to show: $f^{- 1}(E) \in \mathcal{A}$ for any $E \in \mathcal{B}_{1} \otimes \mathcal{B}_{2}$. It is equivalent to show that
> >
> > $$
> > \mathcal{B}_{1} \otimes \mathcal{B}_{2} \subset \mathcal{C}: = \left\{ {E \in Y \times Z:\phi^{- 1}(E) \in \mathcal{A}} \right\}
> > $$
> >
> > Note that, it suffices to show that: $\mathcal{C}$ is an $\sigma$-algebra. This is because we have shown
> >
> > $$
> > \left\{ {\text{all disjoint unions of measurable rectangles in}\ Y \times Z} \right\} \subset \mathcal{C}
> > $$
> >
> > , and this is an algebra generating $\mathcal{B}_{1} \otimes \mathcal{B}_{2}$. Thus, if $\mathcal{C}$ is an $\sigma$-algebra, we must have $\mathcal{B}_{1} \otimes \mathcal{B}_{2} \subset \mathcal{C}$.\
> > And since $\left\{ {\text{all disjoint unions of measurable rectangles in}\ Y \times Z} \right\}$ is an algebra, it suffices to show that $\mathcal{C}$ is a monotone class, by the monotone class lemma.\
> > Suppose $E_{1} \subseteq E_{2} \subseteq \cdots$ with each $E_{n} \in \mathcal{C}$, i.e. $\phi^{- 1}(E_{n}) \in \mathcal{A}$. Since $\left\{ E_{n} \right\}$ is increasing, we hve
> >
> > $$
> > \phi^{- 1}(E_{1}) \subseteq \phi^{- 1}(E_{2}) \subseteq \cdots \subseteq \phi^{- 1}(E_{n}) \subseteq \cdots
> > $$
> >
> > Since $\mathcal{A}$ is an $\sigma$-algebra, we have
> >
> > $$
> > \phi^{- 1}(\bigcup\limits_{n = 1}^{\infty}E_{n}) = \bigcup\limits_{n = 1}^{\infty}\phi^{- 1}(E_{n}) \in \mathcal{A}
> > $$
> >
> > Thus
> >
> > $$
> > \bigcup\limits_{n = 1}^{\infty}E_{n} \in \mathcal{C}
> > $$
> >
> > This is dually true for decreasing intersection, **finishing the proof that $\mathcal{C}$ is a monotone class thus $\sigma$-algebra,** **thus proving the lemma.**\
>
> After we proved the Lemma, we return to the original statement, concluding that $\phi$ is $(\mathcal{A},\mathcal{A} \otimes \mathcal{A})$-measurable, thus finishing the proof: if $E \in \mathcal{A} \otimes \mathcal{A}$, then
>
> $$
> \left\{ {x \in X:(x,x) \in E} \right\} \in \mathcal{A}
> $$

> **Solution**
>
> **of (b):**\
> Take a Vitali set $V \subset {\mathbb{R}}$, and consider:
>
> $$
> E := \left\{ {(x,y) \in {\mathbb{R}}^{2}:x \neq y} \right\} \cup \left\{ {(x,x):x \in V} \right\}.
> $$
>
> ![Figure 27:[ ]{style="white-space: pre-wrap"}](.assets/main--figure-raster-027.png){width="30%"}
>
> Then for any fixed $x \in {\mathbb{R}}$, we have:
>
> $$
> E_{x} = \left\{ {y:(x,y) \in E} \right\} = \left\{ \begin{matrix}
> {{\mathbb{R}},} & {x \in V} \\
> {{\mathbb{R}}\backslash\left\{ x \right\},} & {x \notin V}
> \end{matrix} \right.
> $$
>
> And for any fixed $y \in {\mathbb{R}}$, we have:
>
> $$
> E^{y} = \left\{ {x:(x,y) \in E} \right\} = \left\{ \begin{matrix}
> {{\mathbb{R}},} & {y \in V} \\
> {{\mathbb{R}}\backslash\left\{ y \right\},} & {y \notin V}
> \end{matrix} \right.
> $$
>
> Thus $E_{x} \in \mathcal{L}({\mathbb{R}})$ for all $x \in {\mathbb{R}}$ and $E^{y} \in \mathcal{L}({\mathbb{R}})$ for all $y \in {\mathbb{R}}$.\
> However, we have $E \notin \mathcal{L}({\mathbb{R}}) \otimes \mathcal{L}({\mathbb{R}})$, since by (a) we have proved that if $E \in \mathcal{L}({\mathbb{R}}) \otimes \mathcal{L}({\mathbb{R}})$, then
>
> $$
> V = \left\{ {x \in {\mathbb{R}}:(x,x) \in E} \right\} \in \mathcal{L}({\mathbb{R}})
> $$
>
> But it contradicts with the fact that $V$ is not Lebesgue measurable.\
> Thus $E$ satisfies our requirements.\
> (This happends since, as shown in class, the product measure space of two complete measure space is not necesarily complete. Here, the diagonal is a null set in ${\mathbb{R}}^{2}$ and thus our Vitali portion is a subnull set, but $\mathcal{L}({\mathbb{R}}) \otimes \mathcal{L}({\mathbb{R}})$ is not complete (its completion is $\mathcal{L}({\mathbb{R}}^{2})$.)

## Too dense: $m(E \cap I) \leq \alpha m(I)$ for all $I$ $\Longrightarrow m(E) = 0$ for mble $E$ {#too-dense-mecap-ile-alpha-mi-for-all-i-implies-me0-for-mble-e}

Prove that if $E \subset \mathcal{L}({\mathbb{R}})$ is a Lebesgue measurable subset such that

$$
m(E \cap I) \leq 0.123m(I)
$$

for all open intervals $I \subset \mathcal{L}({\mathbb{R}})$, then $m(E) = 0$.

> **Proof**
>
> Since $E$ is Lebesgue measurable, $m(E) = m^{\ast}(E)$.\
> Let $\epsilon > 0$.\
> Then by definition of outer mesure, we can pick open intervals seq $\left\{ I_{k} \right\}_{k = 1}^{\infty}$ covering $E$ s.t.
>
> $$
> m(E) > \sum\limits_{k = 1}^{\infty}m(I_{k}) - \epsilon
> $$
>
> Since $E \subset \bigcup_{k}I_{k}$, we have
>
> $$
> \begin{matrix}
> E & {= (\bigcup\limits_{k}I_{k}) \cap E} \\
>  & {= \bigcup\limits_{k}(I_{k} \cap E)}
> \end{matrix}
> $$
>
> Thus
>
> $$
> \begin{matrix}
> {m(E) = m(\bigcup\limits_{k}(I_{k} \cap E))} & {\leq \sum\limits_{k}m(I_{k} \cap E)\quad\text{by ctbl subadditivity}} \\
>  & {\leq 0.123\sum\limits_{k}\, m(I_{k})\quad\text{by our requirement}}
> \end{matrix}
> $$
>
> Thus we have:
>
> $$
> \begin{matrix}
> {\sum\limits_{k}m(I_{k}) - \epsilon} & {< 0.123\sum\limits_{k}m(I_{k})} \\
> {0.877\sum\limits_{k}m(I_{k})} & {< \epsilon} \\
> {\sum\limits_{k}m(I_{k})} & {< \frac{\epsilon}{0.877}}
> \end{matrix}
> $$
>
> Thus
>
> $$
> m(E) \leq \sum\limits_{k}m(I_{k}) < \frac{\epsilon}{0.877}
> $$
>
> Since $\epsilon > 0$ is arbitrary, this proves that
>
> $$
> m(E) = 0
> $$

## 给定任意 $0 < \alpha < 1$, prescribe 出一个在 $0$ 处 density 为 $\alpha/2$ 的集合 {#给定任意-0alpha-1-prescribe-出一个在-0-处-density-为-alpha2-的集合}

Let $0 < \alpha < 1$. Find an example of a Lebesgue measurable subset $E$ of $\lbrack 0,\infty) \subset \mathcal{L}({\mathbb{R}})$ whose density at $0$ is $\alpha/2$. *Hint*: Consider $E = \bigcup_{n = 1}^{\infty}I_{n}$. where $I_{n} = (x_{n},x_{n} + \delta_{n})$ are disjoint small intervals accumulating at $0$.

> **Proof**
>
> Consider take
>
> $$
> E := \bigcup\limits_{n = 1}^{\infty}(\frac{1}{n},\frac{1}{n} + \frac{\alpha}{n(n - 1)})
> $$
>
> as the union of a countable sequence of intervals drawing near $0$.\
> Notice: There intervals are **mutually disjoint**, since
>
> $$
> \frac{1}{n - 1} - \frac{1}{n} = \frac{1}{n(n - 1)} > \frac{\alpha}{n(n - 1)}
> $$
>
> we thus have for $n \geq 2$,
>
> $$
> \frac{1}{n} + \frac{\alpha}{n(n - 1)} < \frac{1}{n - 1}
> $$
>
> We use $x_{n}: = \frac{1}{n}$; $I_{n} := (x_{n},\, x_{n} + \delta_{n})$ to denote each component interval; $J_{n}: = (x_{n},x_{n - 1})$ to denote the open interval where $I_{n}$ is located at; and $\delta_{n} := \frac{\alpha}{n(n - 1)}$ to denote the length of each interval. Note that for each $n$,
>
> $$
> \delta_{n} = \alpha(\frac{1}{n - 1} - \frac{1}{n}) = \alpha(x_{n - 1} - x_{n}) = \alpha J_{n}
> $$
>
> ![Figure 28:[ ]{style="white-space: pre-wrap"}](.assets/main--figure-raster-025.png){width="40%"}
>
> Now we show that this set has Lebesgue density $\frac{\alpha}{2}$ at $0$ below.\
> Let $r > 0$ (WLOG $r < 1$), then we have
>
> $$
> \frac{1}{n + 1} < r \leq \frac{1}{n}\quad\text{for some}\ n \in {\mathbb{N}}
> $$
>
> Then for each $k \geq n + 2$, we have $\frac{1}{k} < \frac{1}{n + 1} < r$. Hence $I_{k}$ is **entirely contained** in $(0,r)$:
>
> $$
> \bigcup\limits_{k = n + 2}^{\infty}I_{k} \subseteq E \cap ( - r,r)
> $$
>
> We know that by telescoping,
>
> $$
> \sum\limits_{k = n + 2}^{\infty}\frac{1}{k(k - 1)} = \left( {\frac{1}{n + 1} - \frac{1}{n + 2}} \right) + \left( {\frac{1}{n + 2} - \frac{1}{n + 3}} \right) + \cdots = \frac{1}{n + 1}
> $$
>
> Multiplying this by $\frac{\alpha}{2}$ gives:
>
> $$
> \sum\limits_{k = n + 2}^{\infty}\frac{\alpha}{k(k - 1)} = \frac{\alpha}{n + 1}
> $$
>
> Thus by monotonicity of measure:
>
> $$
> m(E \cap ( - r,r)) \geq \frac{\alpha}{n + 1}
> $$
>
> And for each $k \leq n$, $I_{k}$ exceeds $(0,r)$ on the right, thus we get dually:
>
> $$
> m(E \cap ( - r,r)) \leq \frac{\alpha}{n - 1}
> $$
>
> And we have:
>
> $$
> \frac{2}{n + 1} \leq m( - r,r) \leq \frac{2}{n}
> $$
>
> since $\frac{1}{n + 1} \leq r \leq \frac{1}{n}$.\
> Therefore we get:
>
> $$
> \frac{\frac{\frac{\alpha}{n + 1}}{2}}{n} \leq \frac{m(E \cap ( - r,r))}{m(( - r,r))} \leq \frac{\frac{\alpha}{n - 1}}{\frac{2}{n + 1}}
> $$
>
> Further simplify:
>
> $$
> \frac{n}{n + 1} \cdot \frac{\alpha}{2} \leq \frac{m(E \cap ( - r,r))}{m(( - r,r))} \leq \frac{n + 1}{n - 1} \cdot \frac{\alpha}{2}
> $$
>
> As $r\rightarrow 0^{+}$, we must have $n\rightarrow\infty$, and we know
>
> $$
> \lim\limits_{n\rightarrow\infty}\frac{n}{n + 1} \cdot \frac{\alpha}{2} = \lim\limits_{n\rightarrow\infty}\frac{n + 1}{n - 1} \cdot \frac{\alpha}{2} = \frac{\alpha}{2}
> $$
>
> Thus by **Squeeze Theorem**, we have:
>
> $$
> \lim\limits_{r\rightarrow 0^{+}}\frac{m(E \cap ( - r,r))}{m(( - r,r))} = \frac{\alpha}{2}
> $$
>
> Hence by def, $E$ indeed has Lebesgue density $\alpha/2$ at $0$.\
> (My note: The key point here is that, the harmonic seq shrinks very slowly in proportion as $n$ grows, $J_{n}$ almost have same length as $J_{n + 1}$ for large $n$, thus $m(J_{n})/m( \cup_{k > N}J_{k}) = 0$ as we knows, so that whether $r$ lies in $I_{n}$ or $J_{n}\backslash I_{n}$ does not quite matter.\
> On the other hand, the counterexample in class, using the geometric sequence as build block of $J_{n}$, fails since the length of $J_{n}$ is too much compared to $\cup_{k \geq n}J_{k}$, actually $m(J_{n}) = m( \cup_{k > n}J_{k})$, thus whether $r$ lies in $I_{n}$ or $J_{n}\backslash I_{n}$ makes a lot difference, making the density at $0$ undefined.)

## Seqs of complex numbers: $\ell^{1} \subsetneq \bigcap_{1 < p < \infty}\ell^{p}$ and $\bigcup_{1 < p < \infty}\ell^{p} \subsetneq \ell^{\infty}$ {#seqs-of-complex-numbers-ell1subsetneqbigcap_1pinftyellp-and-bigcup_1pinftyellpsubsetneqellinfty}

- Prove that $\ell^{1} \subsetneq \bigcap_{1 < p < \infty}\ell^{p}$.

- Prove that $\bigcup_{1 < p < \infty}\ell^{p} \subsetneq \ell^{\infty}$.

> **Proof**
>
> **of (a):**\
> We first want to show: for any $1 < p < \infty$, we have:
>
> $$
> \ell^{1} \subseteq \ell^{p}
> $$
>
> Fix $p > 1$.\
> Let $(x_{n}) \in \ell^{1}$. By definition,
>
> $$
> \left. \sum\limits_{n = 1}^{\infty} \middle| x_{n} \middle| < \infty \right.
> $$
>
> We need to show that $\left. \sum_{n = 1}^{\infty} \middle| x_{n} \middle| {}_{p} < \infty \right.$.\
> **Claim: There are at most finitely many $n \in {\mathbb{N}}$ s.t. $\left. |x_{n} \middle| \geq 1 \right.$**.\
> Proof of Claim: Suppose for contradiction that there are inifinitely many $n \in {\mathbb{N}}$ s.t. $\left. |x_{n} \middle| \geq 1 \right.$, say, all terms in the subseqence $\left\{ x_{n_{j}} \right\}_{j = 1}^{\infty}$ has $\left. |x_{n_{j}} \middle| \geq 1 \right.$. Then
>
> $$
> \left. \sum\limits_{n = 1}^{\infty} \middle| x_{n} \middle| \geq \sum\limits_{j = 1}^{\infty} \middle| x_{n_{j}} \middle| \geq \sum\limits_{j = 1}^{\infty}1 = \infty \right.
> $$
>
> which contradicts with $(x_{n}) \in \ell^{1}$.\
> Thus, suppose only on the finite terms $\left\{ x_{n_{j}} \right\}_{j = 1}^{N}$ we have $\left. |x_{n_{j}} \middle| \geq 1 \right.$ (WLOG $N \geq 1$). Then
>
> $$
> \left. \sum\limits_{n = 1}^{\infty} \middle| x_{n} \middle| = \sum\limits_{j = 1}^{N} \middle| x_{n_{j}} \middle| + \sum\limits_{n \neq n_{j}\ \text{for any}\ j} \middle| x_{n}| \right.
> $$
>
> Since for $n$ s.t. n $\neq n_{j}\ \text{for any subseq index}\ j$, we have $\left. |x_{n} \middle| < 1 \right.$, for these indexes we have:
>
> $$
> \left. |x_{n} \middle| {}_{p} < \middle| x_{n} \middle| \quad\text{for any}\ p > 1 \right.
> $$
>
> Thus we have
>
> $$
> \left. \sum\limits_{n \neq n_{j}\ \text{for any}\ j} \middle| x_{n} \middle| {}_{p} < \sum\limits_{n \neq n_{j}\ \text{for any}\ j} \middle| x_{n} \middle| < \infty \right.
> $$
>
> And also,
>
> $$
> \left. \sum\limits_{j = 1}^{N} \middle| x_{n_{j}} \middle| {}_{p} < \infty\quad\text{since only have finite terms} \right.
> $$
>
> Thus
>
> $$
> \left. \sum\limits_{n = 1}^{\infty} \middle| x_{n} \middle| {}_{p} = \sum\limits_{j = 1}^{N} \middle| x_{n_{j}} \middle| {}_{p} + \sum\limits_{n \neq n_{j}\ \text{for any}\ j} \middle| x_{n} \middle| {}_{p} < \infty \right.
> $$
>
> Thus
>
> $$
> \ell^{1} \subseteq \ell^{p}
> $$
>
> Since $p > 1$ is arbitrary, this proves that
>
> $$
> \ell^{1} \subseteq \bigcap\limits_{1 < p < \infty}\ell^{p}
> $$
>
> To show the strictness of the inclusion, we consider the **harmonic series** $\sum_{n = 1}^{\infty}\frac{1}{n}$. We know that it diverges and for any $p > 1$, the **$p$-series** $\sum_{n = 1}^{\infty}\frac{1}{n^{p}}$ (absolutely for sure) converges, thus $(\frac{1}{n}) \notin \ell^{1}$ but $(\frac{1}{n}) \in \ell^{p}$ for every $p > 1$, showing that
>
> $$
> \ell^{1} \neq \bigcap\limits_{1 < p < \infty}\ell^{p}
> $$
>
> This finishes the proof that
>
> $$
> \ell^{1} \subsetneq \bigcap\limits_{1 < p < \infty}\ell^{p}
> $$

> **Proof**
>
> **of (b):**\
> Fix $p > 1$.\
> Suppose sequence $(x_{n})$ belongs $\ell^{p}$, then
>
> $$
> \left. \sum\limits_{n = 1}^{\infty} \middle| x_{n} \middle| {}_{p} < \infty \right.
> $$
>
> This implies that $x_{n}\rightarrow 0$ as $n\rightarrow\infty$, because if it did not, there would be infinitely many terms where $|x_{n}|$ is bounded away from zero, leading to divergence of the sum.\
> Suppose for contradiction that
>
> $$
> \left. \sup\limits_{n} \middle| x_{n} \middle| = \infty \right.
> $$
>
> Then there are infinitely many terms $n$ s.t. $\left. |x_{n} \middle| > 1 \right.$, since otherwise, exists some $N$ s.t. all $\left. |x_{n} \middle| \leq 1 \right.$ for $n \geq N$, then $\left. \sup \middle| x_{n} \middle| \leq \max(1,\max_{1 \leq n \leq N - 1} \middle| x_{n} \middle| ) < \infty \right.$.\
> Suppose for the subseq $\left\{ x_{n_{j}} \right\}_{j = 1}^{\infty}$ we have $\left. |x_{n_{j}} \middle| > 1 \right.$. Thus
>
> $$
> \left. \sum\limits_{n = 1}^{\infty} \middle| x_{n} \middle| {}_{p} \geq \sum\limits_{j = 1}^{\infty} \middle| x_{n_{j}} \middle| {}_{p} > \sum\limits_{j = 1}^{\infty}1^{p} = \infty \right.
> $$
>
> which contradicts with $\left. \sum_{n = 1}^{\infty} \middle| x_{n} \middle| {}_{p} < \infty \right.$. Therefore we have:
>
> $$
> \left. \sup\limits_{n} \middle| x_{n} \middle| < \infty \right.
> $$
>
> This shows that
>
> $$
> \ell^{p} \subseteq \ell^{\infty}
> $$
>
> Since $p > 1$ is arbitrary, this proves that
>
> $$
> \bigcup\limits_{1 < p < \infty}\ell^{p} \subseteq \ell^{\infty}
> $$
>
> Now we show the inclusion is strict. Consider the sequence $x_{n} = 1$ for all $n$. Clearly, $(x_{n}) \in \ell^{\infty}$ because it is bounded. However, $x_{n} \notin \ell^{p}$ for any $p > 1$:
>
> $$
> \left. \sum\limits_{n = 1}^{\infty} \middle| 1 \middle| {}_{p} = \sum\limits_{n = 1}^{\infty}1 = \infty \right.
> $$
>
> This shows
>
> $$
> \bigcup\limits_{1 < p < \infty}\ell^{p} \neq \ell^{\infty}
> $$
>
> Thus we have
>
> $$
> \bigcup\limits_{1 < p < \infty}\ell^{p} \subsetneq \ell^{\infty}
> $$

*Nur für Verrückte*

(It's **really** not necessary to attempt these problems. Do not, under any circumstances, hand them in!)

## Prescribing a Lebesgue density, Season 2

Let $0 < \alpha < 1$ and $n \geq 1$. Find an example of a Lebesgue measurable subset $E$ of $\mathcal{L}({\mathbb{R}})^{n}$ whose density at $0$ is $\alpha$. *Hint*: think spherically.

