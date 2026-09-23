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
source: "notes/math/measure-theory/homeworks/hw05-on_integration.typ"
subtitle: Typst-first course notes and worked homeworks
title: "MATH 597: Measure Theory"
---
# Homework 5: on integration(50/50)

*None of the following questions will be graded. Do them, but do not hand them in*.

## Dirac measure: $\int f d\delta_{x_{0}} = f(x_{0})$

Let $(X,\mathcal{A})$ be a measurable space, and $x_{0} \in X$ a point. Let $\delta_{x_{0}}$ be the Dirac measure at $x_{0}$, i.e. for $E \in \mathcal{A}$, $\delta_{x_{0}}(E) = 1$ if $x_{0} \in E$ and $\delta_{x_{0}}(E) = 0$ if $x_{0} \notin E$. Show that every measurable function $f:X\rightarrow{\mathbb{R}}$ is integrable and

$$
\int f d\delta_{x_{0}} = f(x_{0})
$$

*Remark*: what is often called a Dirac delta function is actually this Dirac measure.

## measure space 的 extension 保留 measurable function 的可测性和积分

Let $(X,\mathcal{A},\mu)$ and $(X,\mathcal{B},\nu)$ be measure spaces on the same set $X$. Suppose that $(X,\mathcal{B},\nu)$ is an extension of $(X,\mathcal{A},\mu)$.

- Show that if a function $f$ on $X$ is $\mathcal{A}$-measurable, then it is $\mathcal{B}$-measurable.

- Show that if a function $f$ on $X$ is $\mathcal{A}$-measurable and $f \in L^{1}(\mathcal{A},\mu)$, then $f \in L^{1}(\mathcal{B},\nu)$ and $\int f d\mu = \int f d\nu$.

## almost everywhere defined measurable function

Carefully think through the notion of an "almost everywhere defined" measurable (or integrable) function. How can we deduce the "almost everywhere" versions of the main convergence theorems (MCT, FL, DCT) from their "everywhere" counterparts? Propositions 2.11 and 2.12 in \[Folland\] are useful here (these appeared on HW4).

## new measure from old: $\nu(A) := \int_{A}f d\mu\Longrightarrow\int g d\nu = \int gf d\mu$ {#new-measure-from-old-nuaint_a-f-dmu-impliesint-g-d-nu-int-gf-dmu}

Let $(X,\mathcal{A},\mu)$ be a measure space. Let $f:X\rightarrow\lbrack 0,\infty\rbrack$ be an $\mathcal{A}$-measurable function. Define $\nu:\mathcal{A}\rightarrow\lbrack 0,\infty\rbrack$ by $\nu(A) = \int_{A}f d\mu = \int f\chi_{A} d\mu$ for $A \in \mathcal{A}$.

- Prove that $\nu$ is a measure on $(X,\mathcal{A})$.

- Prove that $\int g d\nu = \int gf d\mu$ for every $\mathcal{A}$-measurable function $g:X\rightarrow\lbrack 0,\infty\rbrack$. *Hint*: Start with the case when $g = \chi_{E}$; then treat the case when $g$ is a simple function; finally consider the case when $g$ is a general nonnegative function.

- Now consider the case $(X,\mathcal{A},\mu) = ({\mathbb{R}},\mathcal{B}({\mathbb{R}}),m)$, where $m$ is Lebesgue measure. Each nonnegative function $f:{\mathbb{R}}\rightarrow\lbrack 0,\infty\rbrack$ induces a Borel measure $\nu_{f}(A) = \int_{A}f dm$ by (a).

  - Which functions $f$ induce a locally finite Borel measure? In that case, what is the distribution function for $\nu_{f}$?

  - Do all locally finite Borel measures arise from some $f$?

  - Can you interpret (b) as a change of variables formula?

## Truncations in $L^{1}$: 通过 $\int f_{n}$ 或者 $\int_{X_{n}}f$ 的极限 (bounded function / subset) 得到 $\int_{X}f$ {#truncations-in-l1-通过-int-f_n-或者-int_x_n-f-的极限-bounded-function-subset-得到-int_x-f}

Let $(X,\mathcal{A},\mu)$ be a measure space and $f:X\rightarrow{\mathbb{C}}$ an integrable function.

- (Horizontal truncation) Suppose that $X = \bigcup_{n = 1}^{\infty}X_{n}$ for some $X_{1} \subset X_{2} \subset \cdots$ with $X_{n} \in \mathcal{A}$. Prove that

  $$
  \int_{X}f\, d\mu = \lim\limits_{n\rightarrow\infty}\int_{X_{n}}f\, d\mu
  $$

- (Vertical truncation) Prove that

  $$
  \int f\, d\mu = \lim\limits_{n\rightarrow\infty}\int f\chi_{\{{|f| \leq n}\}} d\mu
  $$

*Remark*: a similar question for nonnegative measurable functions appeared in HW4.

## $L^{1}$-convergence from dominated convergence

Let $(X,\mathcal{A},\mu)$ be a measure space, and $f_{n},f$, measurable functions on $X$, $n \in {\mathbb{N}}$. Suppose that $f_{n}\rightarrow f$ a.e. and there is an integrable nonnegative function $g$ such that $\left. |f_{n}(x) \middle| \leq g(x) \right.$ a.e. for all $n$. Prove that $f_{n}\rightarrow f$ in $L^{1}$, i.e.

$$
\left. \lim\limits_{n\rightarrow\infty}\int \middle| f_{n} - f \middle| = 0. \right.
$$

*Hint*: use DCT.

## Lebesgue integrals and affine transformations

Let $f$ be a Lebesgue integrable function on $\mathbb{R}$. Prove that

$$
\int f(rx + s) dm(x) = \frac{1}{|r|}\int f(x) dm(x)
$$

for all real numbers $r,s$ with $r \neq 0$.

*Hint*: approximate using simple functions $f$.

## even moments of Gaussian distribution

Using Multivariable Calculus (and the fact that Riemann integrals coincide with Lebesgue integrals) one can show that

$$
\frac{1}{\sqrt{2\pi}}\int_{- \infty}^{\infty}e^{- t\frac{x^{2}}{2}} dx = \frac{1}{\sqrt{t}}
$$

for every $t > 0$. Prove, by (justified!) differentiating with respect to $t$, that

$$
\frac{1}{\sqrt{2\pi}}\int_{- \infty}^{\infty}x^{2n}e^{- \frac{x^{2}}{2}} = (2n - 1)!! := \frac{(2n)!}{2^{n}n!}
$$

for $n \in {\mathbb{N}}$.

*Remark*: here the integrals are as defined in this course. *Remark*: in probability theory, these are the even moments of the standard normal distribution.

## Generalized DCT

Let $(X,\mathcal{A},\mu)$ be a measure space, and $f_{n},g_{n},f,g \in L^{1}$, $n \in {\mathbb{N}}$. Suppose that

- $\lim_{n\rightarrow\infty}f_{n}(x) = f(x)$ and $\lim_{n\rightarrow\infty}g_{n}(x) = g(x)$ for a.e. $x$;

- $\left. |f_{n}(x) \middle| \leq g_{n}(x) \right.$ a.e. for every $n \in {\mathbb{N}}$;

- $g_{n}:X\rightarrow\lbrack 0,\infty\rbrack$ and $\lim_{n\rightarrow\infty}\int g_{n} d\mu = \int g d\mu$.

Prove that

$$
\lim\limits_{n\rightarrow\infty}\int f_{n} d\mu = \int f d\mu.
$$

*Hint*: Follow the proof of the DCT, based on FL.

## Criterion for $L^{1}$-convergence

Let $(X,\mathcal{A},\mu)$ be a measure space. Let $f_{n},f$ be integrable functions on $X$, $n \in {\mathbb{N}}$. Suppose that $\lim_{n\rightarrow\infty}f_{n}(x) = f(x)$ a.e. Prove that

$$
\left. \lim\limits_{n\rightarrow\infty}\int \middle| f_{n} - f \middle| d\mu = 0\quad\text{iff}\quad\lim\limits_{n\rightarrow\infty}\int \middle| f_{n} \middle| d\mu = \int \middle| f \middle| d\mu \right.
$$

*Hint*: use the generalized DCT.

*Some of the following questions will be graded. Do them, and do hand them in*.

## Formal equivalence between MCT and FL

Let $(X,\mathcal{A},\mu)$ be a measure space and $L^{+} = L^{+}(X,\mathcal{A})$ the space of measurable functions $f:X\rightarrow\lbrack 0,\infty\rbrack$.\
Let $I:L^{+}\rightarrow\lbrack 0,\infty\rbrack$ be a function that is increasing in the sense that $f \leq g$ implies $I(f) \leq I(g)$. Prove that the following properties are equivalent:

- $I$ is continuous along increasing sequences: if $f_{n} \in L^{+}$, and $f_{n} \leq f_{n + 1}$ for $n \in {\mathbb{N}}$, then $\lim I(f_{n}) = I(\lim f_{n})$.

- if $f_{n} \in L^{+}$, $n \in {\mathbb{N}}$, then $\operatorname{lim\, inf}_{n}I(f_{n}) \geq I(\operatorname{lim\, inf}_{n}f_{n})$.

- $I$ is lower semicontinuous: if $f_{n},f \in L^{+}$, and $\lim_{n}f_{n} = f$, then $I(f) \leq \operatorname{lim\, inf}_{n}I(f_{n})$.

Here $\lim_{n}f_{n} = f$ means that $\lim_{n}f_{n}(x) = f(x)$ for all $x \in X$, and similarly for $\operatorname{lim\, inf}f_{n}$. *Remark*: the equivalence between (a) and (b) shows that **the Monotone Convergence Theorem and Fatou's Lemma are equivalent.**

> **Proof**
>
> **of ($\text{a}\Longrightarrow\text{b}$):**\
> Suppose $I$ is continuous along increasing sequences. WTS:
>
> $$
> \operatorname{lim\, inf}\limits_{n}I(f_{n}) \geq I\mspace{-18mu}(\operatorname{lim\, inf}\limits_{n}f_{n})
> $$
>
> for any sequence $(f_{n})$ in $L^{+}$.\
> Define for each $k \in {\mathbb{N}}$
>
> $$
> g_{k} := \inf\limits_{n \geq k}\, f_{n}
> $$
>
> Then for all $k \in {\mathbb{N}}$, $g_{k}$ is a measurable function. Also notice that by definition, $\left\{ g_{k} \right\}$ is an increasing sequence, and
>
> $$
> \lim\limits_{k\rightarrow\infty}g_{k}(x) = \operatorname{lim\, inf}\limits_{n\rightarrow\infty}f_{n}(x)
> $$
>
> for each $x \in X$.\
> Applying $(\text{a})$ to $g_{k}$: since $g_{k} \uparrow \lim_{k}g_{k}$, we get
>
> $$
> \lim\limits_{k\rightarrow\infty}I(g_{k}) = I(\lim\limits_{k\rightarrow\infty}g_{k}) = I(\operatorname{lim\, inf}\limits_{n\rightarrow\infty}f_{n})
> $$
>
> By def of $g_{k}$, we have:
>
> $$
> g_{k} \leq f_{n}\quad\text{for all}\ n \geq k
> $$
>
> Since $g_{k} \leq f_{n}$ implies $I(g_{k}) \leq I(f_{n})$, we also have:
>
> $$
> I(g_{k}) \leq \inf\limits_{n \geq k}\, I(f_{n})
> $$
>
> Taking the limit as $k\rightarrow\infty$, we get
>
> $$
> \lim\limits_{k\rightarrow\infty}I(g_{k}) \leq \lim\limits_{k\rightarrow\infty}\inf\limits_{n \geq k}\, I(f_{n}) = \operatorname{lim\, inf}\limits_{n\rightarrow\infty}I(f_{n})
> $$
>
> Combining (5.1) and (5.2), we obtain:
>
> $$
> I(\operatorname{lim\, inf}\limits_{n}f_{n}) = \lim\limits_{k}I(g_{k}) \leq \operatorname{lim\, inf}\limits_{n}I(f_{n}).
> $$
>
> which is exactly what we want.\
> \

> **Proof**
>
> ($\text{b}\Longrightarrow\text{c}$): We now assume $(\text{b})$ and prove that $I$ is lower semicontinuous, i.e. WTS:
>
> $$
> f_{n}\rightarrow f\quad\text{pointwisely}\quad\Rightarrow\quad I(f) \leq \operatorname{lim\, inf}\limits_{n}I(f_{n}).
> $$
>
> Given $f_{n}\rightarrow f$ pointwise, we have
>
> $$
> f(x) = \lim\limits_{n}f_{n}(x) = \operatorname{lim\, inf}\limits_{n}f_{n}(x)\quad\forall x
> $$
>
> Hence for the sequence $\left\{ f_{n} \right\}$, the pointwise limit of $f_{n}$ is exactly $\operatorname{lim\, inf}_{n}f_{n}$. $(\text{b})$ gives:
>
> $$
> \lim\limits_{n}f_{n}(x) = \operatorname{lim\, inf}\limits_{n}I(f_{n}) \geq I(\operatorname{lim\, inf}\limits_{n}f_{n}) = I(f)
> $$
>
> This is precisely the definition of lower semicontinuity, proving $(\text{b})\Longrightarrow(\text{c})$.\
> \

> **Proof**
>
> of ($\text{c}\Longrightarrow\text{a}$):\
> Assume $I$ is lower semi-continuous, i.e. If $f_{n}\rightarrow f$ pointwise, then
>
> $$
> I(f) \leq \operatorname{lim\, inf}\limits_{n}I(f_{n})
> $$
>
> Let $(f_{n})$ be a sequence in $L^{+}$ such that $f_{n} \uparrow f$, i.e.
>
> $$
> f_{1} \leq f_{2} \leq \cdots\quad\text{and}\quad\lim\limits_{n\rightarrow\infty}f_{n}(x) = f(x)\quad\text{ptwisely for all}\ x
> $$
>
> WTS (a): $\lim_{n}I(f_{n}) = I(f)$.\
> Since $f_{n}$ is an increasing seq, $f_{n} \leq f$ for each $n$, and since $I$ is monotone, we have
>
> $$
> I(f_{n}) \leq I(f)\quad\forall n
> $$
>
> Hence
>
> $$
> \operatorname{lim\, sup}\limits_{n}I(f_{n}) \leq I(f)
> $$
>
> And by $(\mathbf{c})$, since $f_{n}\rightarrow f$ pointwisely, we have
>
> $$
> I(f) \leq \operatorname{lim\, inf}\limits_{n}I(f_{n})
> $$
>
> Combining (1) and (2), we get
>
> $$
> \operatorname{lim\, inf}\limits_{n}I(f_{n}) \geq I(f) \geq \operatorname{lim\, sup}\limits_{n}I(f_{n})
> $$
>
> This we also has $\operatorname{lim\, inf}_{n}I(f_{n}) \leq \operatorname{lim\, sup}_{n}I(f_{n})$, this shows that $\lim_{n}I(f_{n})$ exists and equals $I(f)$. This is exactly the statement of (a). Thus $(\mathbf{c})\Longrightarrow(\mathbf{a})$.\
> \

Here we finished the proof that the three properties are equivalent. In particular, the equivalence of (a), (b) shows the equivalence of Fatou's Lemma and MCT.

## Convergence on subsets

Let $(X,\mathcal{A},\mu)$ be a measure space. Let $f_{n}:X\rightarrow\lbrack 0,\infty\rbrack$ be a measurable function for each $n \in {\mathbb{N}}$. Suppose that there is a function $f:X\rightarrow\lbrack 0,\infty\rbrack$ such that

$$
\lim\limits_{n\rightarrow\infty}f_{n}(x) = f(x)\text{for every}\ x \in X\ \text{and}\lim\limits_{n\rightarrow\infty}\int f_{n} = \int f
$$

- Assume that $\int f < \infty$. Show that $\lim_{n\rightarrow\infty}\int_{E}f_{n} = \int_{E}f$ for every $E \in \mathcal{A}$. *Hint*: Use Fatou twice. It may be useful to note that even though $\operatorname{lim\, inf}(\alpha_{n} + \beta_{n}) \geq \operatorname{lim\, inf}\alpha_{n} + \operatorname{lim\, inf}\beta_{n}$ in general, if $\lim\alpha_{n}$ exists, then $\operatorname{lim\, inf}(\alpha_{n} + \beta_{n}) = \lim\alpha_{n} + \operatorname{lim\, inf}\beta_{n}$ for sequences of extended real numbers $\alpha_{n},\beta_{n}$.

- Find an example of $f_{n}:{\mathbb{R}}\rightarrow\lbrack 0,\infty\rbrack$ on the measure space $({\mathbb{R}},\mathcal{B}({\mathbb{R}}),m)$ showing that (a) does not necessarily hold if $\int f = \infty$.

> **Proof**
>
> **of (a):**\
> By Fatou's Lemma, since $f_{n}\rightarrow f$ pointwise and all $f_{n}$ are nonnegative,
>
> $$
> \operatorname{lim\, inf}\limits_{n\rightarrow\infty}\int_{E}f_{n} = \operatorname{lim\, inf}\limits_{n\rightarrow\infty}\int f_{n}\chi_{E} \geq \int f\chi_{E} = \int_{E}f
> $$
>
> For the same reason,
>
> $$
> \operatorname{lim\, inf}\limits_{n\rightarrow\infty}\int_{E^{c}}f_{n}\, \geq \,\int_{E^{c}}f
> $$
>
> Since
>
> $$
> \int f d\mu = \int_{X}f d\mu = \int_{E}f d\mu + \int_{E^{c}}f d\mu
> $$
>
> , we have:
>
> $$
> \begin{matrix}
> {\int f d\mu - \int_{E}f d\mu} & {= \int_{E^{c}}f d\mu} \\
>  & {\leq \operatorname{lim\, inf}\limits_{n}\int_{E^{c}}f_{n} d\mu} \\
>  & {= \operatorname{lim\, inf}\limits_{n}(\int f_{n} d\mu - \int_{E}f_{n} d\mu)} \\
>  & {= \lim\limits_{n\rightarrow\infty}\int f_{n} d\mu + \operatorname{lim\, inf}\limits_{n}( - \int_{E}f_{n} d\mu)} \\
>  & {= \lim\limits_{n\rightarrow\infty}\int f_{n} d\mu - \operatorname{lim\, sup}\limits_{n}\int_{E}f_{n} d\mu} \\
>  & {= \int f d\mu - \operatorname{lim\, sup}\limits_{n}\int_{E}f_{n} d\mu}
> \end{matrix}
> $$
>
> Rearranging the terms, gives:
>
> $$
> \int_{E}f \geq \operatorname{lim\, sup}\limits_{n}\int_{E}f_{n} d\mu
> $$
>
> Combining with the statement given by Fatou's Lemma:
>
> $$
> \operatorname{lim\, inf}\limits_{n\rightarrow\infty}\int_{E}f_{n} \geq \int_{E}f
> $$
>
> We then have:
>
> $$
> \operatorname{lim\, inf}\limits_{n\rightarrow\infty}\int_{E}f_{n} = \int_{E}f \geq \operatorname{lim\, sup}\limits_{n}\int_{E}f_{n}
> $$
>
> Since also by definition of limsup and liminf we have:
>
> $$
> \operatorname{lim\, inf}\limits_{n\rightarrow\infty}\int_{E}f_{n} \leq \operatorname{lim\, sup}\limits_{n\rightarrow\infty}\int_{E}f_{n}
> $$
>
> We have:
>
> $$
> \operatorname{lim\, inf}\limits_{n\rightarrow\infty}\int_{E}f_{n} = \operatorname{lim\, sup}\limits_{n\rightarrow\infty}\int_{E}f_{n} = \lim\limits_{n\rightarrow\infty}\int_{E}f_{n} = \int_{E}f
> $$
>
> This completes the proof.

> **Solution**
>
> **of (b):** Define for each $n \in {\mathbb{N}}$
>
> $$
> f_{n}(x) := \chi_{\lbrack n,n + 1\rbrack} + \chi_{( - \infty,0\rbrack}
> $$
>
> Then we have:
>
> $$
> \int f_{n}(x) = 1 + \infty = \infty
> $$
>
> for each $n$. So
>
> $$
> \lim\limits_{n\rightarrow\infty}\int f_{n}(x) = \infty
> $$
>
> And the pointwise limit of $f_{n}$ is
>
> $$
> f(x): = \lim\limits_{n\rightarrow\infty}f_{n}(x) = \chi_{( - \infty,0\rbrack}
> $$
>
> So the integral of $f$ is also:
>
> $$
> \int\lim\limits_{n\rightarrow\infty}f_{n}(x) = \int f(x) = \infty
> $$
>
> But consider the subset $E = \lbrack 0,\infty)$, we have:
>
> $$
> \int_{E}f_{n} = \int\chi_{\lbrack n,n + 1\rbrack} = 1\quad\text{for all}\ n
> $$
>
> So
>
> $$
> \lim\limits_{n\rightarrow\infty}\int_{E}f_{n} = 1
> $$
>
> while
>
> $$
> \int_{E}f = 0 \neq \lim\limits_{n\rightarrow\infty}\int_{E}f_{n}
> $$
>
> This completes the counterexample.

## Some integrals

Use the DCT to evaluate the following limits:

- $$
  \ \lim\limits_{n\rightarrow\infty}\int_{0}^{\infty}\frac{n\sin\left( \frac{x}{n} \right)}{x(1 + x^{2})} dx
  $$

- $$
  \lim\limits_{n\rightarrow\infty}\int_{0}^{n}x^{m}\left( {1 - \frac{x}{n}} \right)^{n} dx,
  $$

  where $m$ is a non-negative integer. (The integrals are Lebesgue integrals.)

> **Solution**
>
> **of (a):**\
> Define
>
> $$
> \begin{matrix}
> {f_{n} := \{\frac{n\sin\left( \frac{x}{n} \right)}{x(1 + x^{2})},\quad x > 0} \\
> {0,\quad x \leq 0}
> \end{matrix}
> $$
>
> Recall that for all $x \in {\mathbb{R}}$, we have:
>
> $$
> \left. |\sin(x) \middle| \leq \middle| x| \right.
> $$
>
> So for all $n$, and for all $x > 0$, we have:
>
> $$
> \left. |f_{n}(x) \middle| = \middle| \ \frac{n\sin\left( \frac{x}{n} \right)}{x(1 + x^{2})}\  \middle| = \frac{n\sin\left( \frac{x}{n} \right)}{x(1 + x^{2})} \leq \frac{n\frac{x}{n}}{x(1 + x^{2})} = \frac{1}{1 + x^{2}} \right.
> $$
>
> So by taking:
>
> $$
> \begin{matrix}
> {g(x) := \{\frac{1}{1 + x^{2}},\quad x > 0} \\
> {0,\quad x \leq 0}
> \end{matrix}
> $$
>
> We have:
>
> $$
> \left. g(x) \geq \middle| f_{n}(x) \middle| \quad\forall x \in {\mathbb{R}},\forall n \right.
> $$
>
> Since $g$ is continuous a.e. (except on $x = 0$), it is a measurable function. And it is Riemann integrable. We can do Riemann integration of $g$:
>
> $$
> \int_{0}^{\infty}\frac{1}{1 + x^{2}}\, dx = \left\lbrack {\arctan(x)} \right\rbrack_{0}^{\infty} = \frac{\pi}{2} < \infty
> $$
>
> Also, for each $x > 0$, since
>
> $$
> \lim\limits_{n\rightarrow\infty}\frac{\sin(\frac{x}{n})}{\frac{x}{n}} = 1
> $$
>
> We have for each $x > 0$:
>
> $$
> \lim\limits_{n\rightarrow\infty}f_{n}(x) = \frac{1}{1 + x^{2}}\lim\limits_{n\rightarrow\infty}\frac{\sin(\frac{x}{n})}{\frac{x}{n}} = \frac{1}{1 + x^{2}}
> $$
>
> Thus the pointwise limit of $f_{n}$ is:
>
> $$
> \begin{matrix}
> {f(x) := \lim\limits_{n\rightarrow\infty}f_{n}(x) = \{\frac{1}{1 + x^{2}},\quad x > 0} \\
> {0,\quad x \leq 0}
> \end{matrix}
> $$
>
> (Notice it coincides with the $g$ that we chose as bound.) We also have:
>
> $$
> \int_{0}^{\infty}f(x) dx = \frac{\pi}{2}
> $$
>
> Then by DCT,
>
> $$
> \lim\limits_{n\rightarrow\infty}\int_{0}^{\infty}\frac{n\sin\left( \frac{x}{n} \right)}{x(1 + x^{2})} dx = \lim\limits_{n\rightarrow\infty}\int_{0}^{\infty}f_{n}(x) dx = \int_{0}^{\infty}\lim\limits_{n\rightarrow\infty}f_{n}(x) dx = \int_{0}^{\infty}f(x) dx = \frac{\pi}{2}
> $$
>
> This finishes the calculation.

> **Solution**
>
> **of (b):**\
> Define for each $n \in {\mathbb{N}}$
>
> $$
> f_{n}(x) = x^{m}\left( {1 - \frac{x}{n}} \right)^{n}\quad\text{for}\quad 0 \leq x \leq n
> $$
>
> and $f_{n}(x) = 0$ for $x > n$.\
> Then the integral we wish to evaluate can be written as
>
> $$
> \lim\limits_{n\rightarrow\infty}\int_{0}^{n}x^{m}\left( {1 - \frac{x}{n}} \right)^{n}\, dx = \lim\limits_{n\rightarrow\infty}\int_{0}^{\infty}f_{n}(x)\, dx
> $$
>
> We first evaluate the ptwise limit function $f := \lim_{n\rightarrow\infty}f_{n}(x)$.\
> For $x = 0$:
>
> $$
> f_{n}(0) = 0^{m}\left( {1 - \frac{0}{n}} \right)^{n} = 0^{m} \cdot 1 = 0^{m}e^{- x}\quad\forall n
> $$
>
> For $0 < x < \infty$:
>
> $$
> f_{n}(x) = x^{m}\left( {1 - \frac{x}{n}} \right)^{n}
> $$
>
> for all large enough $n$.\
> Recall the standard limit $\lim_{n\rightarrow\infty}\left( {1 - \frac{x}{n}} \right)^{n} = e^{- x}$, hence
>
> $$
> f(x) := \lim\limits_{n\rightarrow\infty}f_{n}(x) = \lim\limits_{n\rightarrow\infty}x^{m}\left( {1 - \frac{x}{n}} \right)^{n} = x^{m}e^{- x}
> $$
>
> Thus
>
> $$
> \begin{matrix}
> {f(x) = \{ 0,\quad x < 0} \\
> {x^{m}e^{- x},\quad x \geq 0}
> \end{matrix}
> $$
>
> Now we determine the dominating function $g$.\
> Consider the same function as $f$:
>
> $$
> \begin{matrix}
> {g(x) := \{ 0,\quad x < 0} \\
> {x^{m}e^{- x},\quad x \geq 0}
> \end{matrix}
> $$
>
> We now prove this same function $g$ works.\
> Let $n \in {\mathbb{N}}$.\
> It is sure that for $x > n$, $\left. g(x) \geq \middle| f_{n}(x)| \right.$ since $f_{n}(x) = 0$.\
> So consider $x \in \lbrack 0,n\rbrack$.\
> Recall the inequality:
>
> $$
> \ln(1 - t) \leq - t\quad\forall t \in \lbrack 0,1\rbrack
> $$
>
> Thus we have:
>
> $$
> \left( {1 - \frac{x}{n}} \right)^{n} \leq e^{- \frac{x}{n}n} = e^{- x}
> $$
>
> Therefore,
>
> $$
> 0 \leq x^{m}\left( {1 - \frac{x}{n}} \right)^{n} \leq x^{m}e^{- x}\quad\text{for all}\ 0 \leq x \leq n
> $$
>
> Thus in all cases,
>
> $$
> \left. |f_{n}(x) \middle| = f_{n}(x) \leq x^{m}e^{- x} = g(x) \right.
> $$
>
> Recall:
>
> $$
> \int_{0}^{\infty}x^{m}e^{- x}\, dx = \Gamma(m + 1) = m!
> $$
>
> is **finite** for all nonnegative integers $m$. Thus $g$ is **integrable**. Then **$g$ is indeed a dominating function for $(f_{n})$.**\
> Applying the DCT, we exchange the limit and the integral:
>
> $$
> \lim\limits_{n\rightarrow\infty}\int_{0}^{\infty}f_{n}(x)\, dx = \int_{0}^{\infty}\lim\limits_{n\rightarrow\infty}f_{n}(x)\, dx = \int_{0}^{\infty}x^{m}e^{- x}\, dx
> $$
>
> thus
>
> $$
> \lim\limits_{n\rightarrow\infty}\int_{0}^{n}x^{m}\left( {1 - \frac{x}{n}} \right)^{n}\, dx = \int_{0}^{\infty}x^{m}e^{- x}\, dx = \Gamma(m + 1) = m!
> $$
>
> This finishes the evalutation of this integral.

## Continuity of translations

Let $f \in L^{1}({\mathbb{R}},\mathcal{L},m)$. For $x \in {\mathbb{R}}$, set $f_{s}(x) = f(x - s)$. Prove that $s\mapsto f_{s}$ is a continuous map from $\mathbb{R}$ to $L^{1}$. In other words, prove that if $t \in {\mathbb{R}}$, then

$$
\left. \lim\limits_{s\rightarrow t}\int \middle| f_{s} - f_{t} \middle| dm = 0 \right.
$$

*Hint*: approximate $f$.

> **Proof**
>
> We write:
>
> $$
> \left. | \middle| f - g \middle| \middle| {}_{1} := \int \middle| f - g \middle| dm \right.
> $$
>
> for $f,g \in L^{1}({\mathbb{R}},\mathcal{L},m)$. Let $\epsilon > 0$.\
> Recall that $C_{c}({\mathbb{R}})$ is dense in $L^{1}({\mathbb{R}})$. So there exists a function $g \in C_{c}({\mathbb{R}})$ such that
>
> $$
> \parallel f - g\underset{1}{\parallel} < \frac{\epsilon}{3}
> $$
>
> Since $g$ is continuous and compactly supported, it is **uniformly continuous**. Denote $K := \text{supp}(g)$. There exists $\delta > 0$ such that for all $x \in {\mathbb{R}}$,
>
> $$
> \left. |s - t \middle| < \delta\Longrightarrow \middle| g(x - s) - g(x - t) \middle| < \frac{\epsilon}{3 \cdot m(K)} \right.
> $$
>
> Integrating the difference over this support gives:
>
> $$
> \parallel g_{s} - g_{t}\underset{1}{\parallel} \leq \frac{\epsilon}{3 \cdot m(K)} \cdot m(K) = \frac{\epsilon}{3}
> $$
>
> Recall that $L^{1}({\mathbb{R}},\mathcal{L},m)$ is a normed vector space with $\left. | \middle| \cdot \middle| |_{1} \right.$ as the norm. So by the triangle inequality of a norm, we have:
>
> $$
> \parallel f_{s} - f_{t}\underset{1}{\parallel} \leq \parallel f_{s} - g_{s}\underset{1}{\parallel} + \parallel g_{s} - g_{t}\underset{1}{\parallel} + \parallel g_{t} - f_{t}\underset{1}{\parallel}
> $$
>
> By the translation invariance of Lebesgue measure, we have:
>
> $$
> \parallel f_{s} - g_{s}\underset{1}{\parallel} = \parallel f - g\underset{1}{\parallel} < \frac{\epsilon}{3}\quad\text{and}\quad \parallel g_{t} - f_{t}\underset{1}{\parallel} = \parallel g - f\underset{1}{\parallel} < \frac{\epsilon}{3}
> $$
>
> By choosing $\delta$ such that $\parallel g_{s} - g_{t}\underset{1}{\parallel} < \frac{\epsilon}{3}$, we get
>
> $$
> \parallel f_{s} - f_{t}\underset{1}{\parallel} < \frac{\epsilon}{3} + \frac{\epsilon}{3} + \frac{\epsilon}{3} = \epsilon
> $$
>
> Since $\epsilon$ is arbitrary, this proves that for any $t \in {\mathbb{R}}$,
>
> $$
> \left. \lim\limits_{s\rightarrow t}\int \middle| f_{s} - f_{t} \middle| \, dm = \middle| \middle| f_{s} - f_{t} \middle| \middle| {}_{1} = 0 \right.
> $$
>
> finishing the proof of continuity of the map $s\mapsto f_{s}$.

## An interesting integrable function

For $\alpha \in (0,1)$, define $g_{\alpha}:{\mathbb{R}}\rightarrow{\mathbb{R}}$ by $g_{\alpha}(x) = (1 - \alpha)x^{- \alpha}$ for $0 < x < 1$ and $g_{\alpha}(x) = 0$ otherwise. Let $(x_{n})_{n}$ be an enumeration of the rational numbers, and define $f:{\mathbb{R}}\rightarrow\lbrack 0,\infty\rbrack$ by

$$
f(x) = \sum\limits_{n = 1}^{\infty}2^{- n}g_{1 - n^{- n}}(x - x_{n})
$$

Prove that $f$ has the following properties:

- $f$ is Borel (and hence Lebesgue) measurable;

- $f$ is Lebesgue integrable, that is $\int_{\mathbb{R}}f dm < \infty$;

- there exist uncountably many $x \in {\mathbb{R}}$ such that $f(x) < \infty$;

- $f$ is discontinuous at every point $x \in {\mathbb{R}}$ where $f(x) < \infty$;

- $f$ is unbounded on any nonempty open interval $I = (a,b)$, that is $\sup_{I}f = \infty$;

- the statements in (d) and (e) remain true even if we redefine $f$ on a set of (Lebesgue) measure zero.

- $\int_{I}f^{p} dm = \infty$ for all $p > 1$ and all intervals $I = (a,b)$.

> **Proof**
>
> **of (a):**\
> We define
>
> $$
> \alpha_{n}: = 1 - n^{- n}
> $$
>
> and
>
> $$
> h_{n}(x) := 2^{- n}g_{\alpha_{n}}(x - x_{n})
> $$
>
> and
>
> $$
> f_{k}(x) := \sum\limits_{n = 1}^{k}2^{- n}g_{\alpha_{n}}(x - x_{n}) = \sum\limits_{n = 1}^{k}h_{n}(x)
> $$
>
> to simplify the expression.\
> Then we have:
>
> $$
> f(x) = \lim\limits_{k\rightarrow\infty}f_{k}(x)
> $$
>
> Notice that, since each $g_{\alpha_{n}}$ is nonnegative, $f_{k}(x)$ is a **increasing** sequence of functions, so for any $x \in {\mathbb{R}}$, $\lim_{k\rightarrow\infty}f_{k}(x)$ exists in $\bar{\mathbb{R}}$. This shows the well-definedness of $f = \lim_{k\rightarrow\infty}f_{k}$.\
> Now we **claim: each $h_{n}(x)$ is Borel measurable.**\
> By translate invariance and scaling invariance of Borel measurability, to prove the claim, it **suffices to prove that each $g_{\alpha}$ is Borel measurable for any $\alpha \in (0,1)$**.\
>
> ![Figure 17:[ ]{style="white-space: pre-wrap"}](.assets/main--figure-raster-017.png){width="30%"}
>
> If $a < 0$, we have:
>
> $$
> g_{\alpha}^{- 1}((a,\infty)) = {\mathbb{R}}
> $$
>
> if $0 \leq a \leq 1 - \alpha$, then we have
>
> $$
> g_{\alpha}^{- 1}((a,\infty)) = (0,1)
> $$
>
> if $a > 1 - \alpha$, then we have
>
> $$
> g_{\alpha}^{- 1}((a,\infty)) = (0,(\frac{1 - \alpha}{a})^{1/\alpha})
> $$
>
> This proves that $g_{\alpha}$ is Borel measurable for any $\alpha \in (0,1)$.\
> Thus each $f_{k}$ being a **finite sum of Borel measurable functions**, is Borel measurable.\
> Then $f$ as **the limit of Borel measurable function sequence** $(f_{k})$, is Borel measurable.\
> \

> **Proof**
>
> **of (b):**\
> We define:
>
> $$
> h_{n}(x) := 2^{- n}g_{\alpha_{n}}(x - x_{n})
> $$
>
> in order to simplify the expression.\
> By translation invariance of Lebesgue measure, we have for any $\alpha_{n}$, :
>
> $$
> \int_{\mathbb{R}}g_{\alpha_{n}}(x - x_{n})\, dm = \int_{\mathbb{R}}g_{\alpha_{n}}(x)\, dm_{t} = (1 - \alpha) \cdot \frac{1 - 0}{1 - \alpha} = 1
> $$
>
> So by homogeneity of integral,
>
> $$
> \int_{\mathbb{R}}h_{n}(x) dm = \int_{\mathbb{R}}2^{- n}g_{\alpha_{n}}(x - x_{n})\, dm = 2^{- n}\int_{\mathbb{R}}g_{\alpha_{n}}(x - x_{n})\, dm = \frac{1}{2^{n}}
> $$
>
> Thus we have:
>
> $$
> \left. \sum\limits_{n = 1}^{\infty}\int_{\mathbb{R}} \middle| h_{n}(x) \middle| = \sum\limits_{n = 1}^{\infty}\int_{\mathbb{R}}h_{n}(x) = \frac{1/2}{1 - 1/2} = 1 < \infty \right.
> $$
>
> by sum of geometric series. Since this sum of integral of the sequence is finite, we can apply **theorem 2.25 on Folland, to exachange the order of limit and integral**, and have:
>
> $$
> \int_{\mathbb{R}}\sum\limits_{n = 1}^{\infty}h_{n}(x) = \sum\limits_{n = 1}^{\infty}\int_{\mathbb{R}}h_{n}(x) = 1
> $$
>
> Hence,
>
> $$
> \int_{\mathbb{R}}f\, dm = \int_{\mathbb{R}}\sum\limits_{n = 1}^{\infty}h_{n}(x)dm = \sum\limits_{n = 1}^{\infty}\int_{\mathbb{R}}h_{n}(x)dm = 1
> $$
>
> So $\int_{\mathbb{R}}f < \infty$. This proves $f \in L^{1}({\mathbb{R}})$.\
> \

> **Proof**
>
> **of (c):**
>
> > **Lemma**
> >
> > For $f \in L^{+}(\mu)$, if $f(x) = + \infty$ on a set $S$ where $\mu(S) > 0$, then $\int f = \infty$
>
> Proof for Lemma: trivially follows from definition. We can pick make a sequence of simple functions $(\phi_{n})$, setting $\left. \phi_{n} \middle| {}_{S} = n \right.$ (doable since $\left. f \middle| {}_{S} = \left\{ \infty \right\} \right.$) then we have:
>
> $$
> \int\phi_{n} d\mu \geq \int n\chi_{S} = n
> $$
>
> So the limit of integral of this simple function sequence is $\infty$.\
> \
> Then (c) follows from the lemma: suppose for contradiction that there exist only countably many $x \in {\mathbb{R}}$ such that $f(x) < \infty$, we denote this this by $C$, then on ${\mathbb{R}}\backslash C$ which has positive measure (since $C$ has measure 0), $f(x) = \infty$. So by lemma, $\int f = \infty$, contradicting with the fact that $\int f = 1$ proven in (b). So there exist uncountably many $x \in {\mathbb{R}}$ such that $f(x) < \infty$.\
> \

> **Proof**
>
> **of (e):** Fix an interval $I$. By the density of rational numbers in any interval, there exists some rational $x_{N} \in I$. Note that though $g_{\alpha_{N}}(x_{N}) = 0$, $g_{\alpha_{N}}(x)$ can be arbitrarily large near $x_{N}$.\
> Fix $M > 0$.\
> It suffices to pick some $x$ s.t.
>
> $$
> 2^{- N}g_{\alpha_{N}}(x - x_{N}) = \frac{1 - \alpha_{N}}{2^{N}}(x - x_{N})^{- \alpha_{N}} > M
> $$
>
> So by taking any
>
> $$
> x \in (x_{N},x_{N} + (\frac{2^{N}M}{1 - \alpha_{N}})^{\alpha_{N}}) \cap I
> $$
>
> then it is done.\
> Since we already have $2^{- N}g_{\alpha_{N}}(x - x_{N}) > M$, we have
>
> $$
> f(x) > 2^{- N}g_{\alpha_{N}}(x - x_{N}) > M
> $$
>
> Since $M$ is arbitrary, this proves that the value of $f$ on $I$ can be unboundedly large, finishing the proof that
>
> $$
> \sup\limits_{I}f = \infty
> $$

> **Proof**
>
> **of (d):** Notice that we first proved (e) and then let's prove (d) using the conclusion of (e).\
> Let $x \in {\mathbb{R}}$ s.t. $f(x) < \infty$.\
> Suppose $f$ is continuous at $x$, then by definition, there exists an open neighborhood $B_{\delta}(x) = (x - \delta,x + \delta)$ s.t. $\left. |f(y) - f(x) \middle| < \frac{1}{83} \right.$ for all $y \in B_{\delta}(x)$.\
> But since the neighborhood is an interval, we have:
>
> $$
> \sup\limits_{(x - \delta,x + \delta)}f = \infty
> $$
>
> by (e). This two facts contradicts. So by contradiction we have proved that $f$ is discontinuous at $x$.\
> So we can conclude that $f$ is discontinuous at any point $x$ s.t. $f(x) < \infty$.\
> \

> **Proof**
>
> **of (f):** Let $I$ be an interval.\
> Suppose we have redefined $f$ on a measure $0$ set. We pick a rational $x_{N} \in I$ (It does not matter whether the new $f$ is defined there.)\
> For arbitrary $M > 0$, we can still always find an $x$ s.t. $x \in (x_{N},x_{N} + (\frac{2^{N}M}{1 - \alpha_{N}})^{\alpha_{N}}) \cap I$ that **keeps its original $f(x)$**, which guarantees that $f(x) > M$, implying $\sup_{I}f = \infty$. This is because, if not so, then it means that we have modified the whole interval $(x_{N},x_{N} + (\frac{2^{N}M}{1 - \alpha_{N}})^{\alpha_{N}}) \cap I$, **which is not a measure zero set**, **conflicting with the statement** \"redefining $f$ on a measure zero set\". So (e) must still hold true.\
> For (d), we apply the same trick as original, getting an open interval around $x$ s.t. $\left. |f(y) - f(x) \middle| < \frac{1}{83} \right.$ for all $y \in B_{\delta}(x) = (x - \delta,x + \delta)$. And by the restated (d), even if we modified a set of measure zero on $(x - \delta,x + \delta)$, we still reaches the the same conclusion that $\sup_{(x - \delta,x + \delta)}f = \infty$, thus causing the same contradiction.\
> This finishes the proof.\
> \

> **Proof**
>
> **of (g):** WTS: $\int_{I}f^{p}\, dm = \infty$ for all $p > 1$ and every interval $I$ **Claim: for each $n$, $g_{\alpha_{n}}^{p}$ *fails* to be in $L^{1}$ when $p > 1$, i.e its integral is $\infty$.** Fix $p > 1$.\
> Since by translation invariance of Lebesgue integral,:
>
> $$
> \int_{\mathbb{R}}(2^{- n}g_{\alpha_{n}}(x - x_{n}))^{p}\, dm = 2^{- np}\int_{\mathbb{R}}g_{\alpha_{n}}(x)^{p}\, dm
> $$
>
> where
>
> $$
> g_{\alpha_{n}}(t)^{p} = (n^{- n}t^{- \,\alpha_{n}})^{p} = n^{- np}\, t^{- \, p\alpha_{n}} = n^{- np}\, t^{- \, p\,(1 - n^{- n})}
> $$
>
> Since $p > 1$, there eixst $N$ such that for all $N \geq n$, the exponent $- p(1 - n^{- n})$ is less than $- 1$, causing $\int_{0}^{1}t^{- p + p\, n^{- n}}\, dt = + \infty$ for sufficiently large $n$. Multiplying by the constant $n^{- np}$ does not remove the infinity.\
> Hence for large enough $n$, each individual summand has an infinite integral, then by monotonicity of integral,
>
> $$
> f^{p}(x) = (\sum\limits_{n}2^{- n}g_{\alpha_{n}}(x - x_{n}))^{p} \geq 2^{- N}g_{\alpha_{N}}^{p}(x - x_{N})
> $$
>
> also has an infinite integral, finishing the proof.\
> \

*Nur für Verrückte*

(It's **really** not necessary to attempt these problems. Do not, under any circumstances, hand them in!)

1.  Make an accurate sketch of the graph of the function in the last problem.

