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
source: "notes/math/measure-theory/homeworks/hw06-on_product-measure&mode-of-convergence.typ"
subtitle: Typst-first course notes and worked homeworks
title: "MATH 597: Measure Theory"
---
# Homework 6: on product measure and mode of convergence (49/50)

*Some of the following questions will be graded. Do them, and do hand them in*.

## Order of integration: $\int_{0}^{\infty}\int_{x}^{\infty}e^{- y^{2}/2} dy dx = 1$ {#order-of-integration-int_0inftyint_xinfty-e-y22d-y-d-x1}

Use Tonelli's Theorem and 1-variable calculus to give a rigorous proof for the equality

$$
\int_{0}^{\infty}\int_{x}^{\infty}e^{- y^{2}/2} dy dx = 1
$$

> **Proof**
>
> Define
>
> $$
> f(x,y) := \left\{ \begin{matrix}
> {e^{- y^{2}/2},} & {\text{if}\ 0 \leq x \leq y,} \\
> {0,} & {\text{otherwise}\ .}
> \end{matrix} \right.
> $$
>
> Then we have
>
> $$
> \int_{0}^{\infty}\int_{x}^{\infty}e^{- y^{2}/2} dy dx = \int\lbrack\int f(x,y) dm(y)\rbrack dm(x)
> $$
>
> Since $f(x,y) = e^{- y^{2}/2}$ is **nonnegative** and **continuous**, it is measurable and thus in $L^{+}(X \times Y)$, where $X = Y = ({\mathbb{R}},\mathcal{L},m)$ is $\sigma$-finite.\
> Thus we can apply Tonelli's theorem:
>
> $$
> \begin{matrix}
> {\int\lbrack\int f(x,y) dm(y)\rbrack dm(x)} & {= \int f d(m(x) \times m(y))} \\
>  & {= \int\lbrack\int f(x,y) dm(x)\rbrack dm(y)} \\
>  & {= \int\lbrack\int f(x,y) dm(x)\rbrack dm(y)} \\
>  & {= \int\lbrack\int e^{- y^{2}/2} dm(x)\rbrack dm(y)}
> \end{matrix}
> $$
>
> Where
>
> $$
> \int e^{- y^{2}/2} dm(x) = \int_{\lbrack 0,y\rbrack}e^{- y^{2}/2} dx = ye^{- y^{2}/2}
> $$
>
> Thus
>
> $$
> \begin{matrix}
> {\int\lbrack\int f(x,y) dm(y)\rbrack dm(x)} & {= \int\lbrack\int e^{- y^{2}/2} dm(x)\rbrack dm(y)} \\
>  & {= \int ye^{- y^{2}/2} dm(y)} \\
>  & {= \int_{\lbrack 0,\infty)}ye^{- y^{2}/2} dy}
> \end{matrix}
> $$
>
> Make the substitution $t = \frac{y^{2}}{2}$, then we have
>
> $$
> \int_{0}^{\infty}y\, e^{- y^{2}/2}\, dy = \int_{0}^{\infty}e^{- t}\, dt = \lbrack - e^{- t}\rbrack_{0}^{\infty} = 1
> $$
>
> This finishes the proof that
>
> $$
> \int_{0}^{\infty}\int_{x}^{\infty}e^{- y^{2}/2} dy dx = 1
> $$

## integration of a function $=$ Area under the curve

Let $(X,\mathcal{A},\mu)$ be a $\sigma$-finite measure space, and let $f \in L^{+}(X)$. Consider the subset $G_{f} \subset X \times \lbrack 0,\infty)$ consisting of all points $(x,y)$ with $y < f(x)$.

- Prove that $G_{f}$ is $\mathcal{A} \otimes \mathcal{B}_{\mathbb{R}}$-measurable.

- Prove that $(\mu \otimes m)(G_{f}) = \int f d\mu$.

> **Remark**
>
> 这个 $G_{f}$ 即为 $f:X\rightarrow{\mathbb{R}}$ 的 graph 下的 area,

> **Proof**
>
> **of 2(a):**\
>
> $$
> y < f(x)\quad\Leftrightarrow\quad\exists\, q \in {\mathbb{Q}}, y < q < f(x)
> $$
>
> Hence
>
> $$
> G_{f} = \bigcup\limits_{q \in {\mathbb{Q}},\, q > 0}(\left\{ {x:f(x) > q} \right\} \times \left\{ {y:y < q} \right\})
> $$
>
> Since $\left\{ {x:f(x) > q} \right\} \in \mathcal{A}$ (by the measurability of $f$) and $\left\{ {y:y < q} \right\} \in \mathcal{B}_{\mathbb{R}}$, each set in the union is a measurable rectangle, thus measurable in the product measurable space $X \times {\mathbb{R}}$. Since a countable union of measurable sets is measurable in the product $\sigma$-algebra, We have
>
> $$
> G_{f} \in \mathcal{A} \otimes \mathcal{B}_{\mathbb{R}}
> $$

> **Proof**
>
> **of 2(b)**:\
> Since $f \geq 0$, and $\sigma$-finiteness of $X$ is assumed, $\sigma$-finiteness of $Y$ is known,\
> we can apply Tonelli's theorem to compute:
>
> $$
> \begin{matrix}
> {(\mu \otimes m)(G_{f})} & {= \int_{X \times \lbrack 0,\infty)}\chi_{G_{f}}(x,y)\, d(\mu \otimes m)} \\
>  & {= \int_{X}\lbrack\int_{\lbrack 0,\infty)}\chi_{G_{f}}(x,y)\, dm(y)\rbrack d\mu(x)}
> \end{matrix}
> $$
>
> By definition of $G_{f}$, $\chi_{G_{f}}(x,y) = 1$ if and only if $y < f(x)$, and $0$ otherwise. Hence, for each fixed $x$,
>
> $$
> \int_{\lbrack 0,\infty)}\chi_{G_{f}}(x,y)\, dm(y) = \int_{\lbrack 0,\infty)}\chi_{\{{y < f(x)}\}}\, dm(y) = \left\{ \begin{matrix}
> {f(x),} & {\text{if}\ f(x) < \infty,} \\
> {\infty,} & {\text{if}\ f(x) = \infty}
> \end{matrix} \right.
> $$
>
> Therefore
>
> $$
> \int_{\lbrack 0,\infty)}\chi_{G_{f}}(x,y)\, dm(y) = f(x) a.e.
> $$
>
> Applying Tonelli's theorem again yields
>
> $$
> (\mu \otimes m)(G_{f}) = \int_{X}\lbrack\int_{\lbrack 0,\infty)}\chi_{G_{f}}(x,y)\, dm(y)\rbrack d\mu(x) = \int_{X}f(x)\, d\mu(x)
> $$
>
> Thus we conclude that
>
> $$
> (\mu \otimes m)(G_{f}) = \int_{X}f\, d\mu
> $$

## Oscillations: $f_{n}(x) = (\sin(\pi nx))^{n}\rightarrow f = 0$ in measure {#oscillations-f_nxsinpi-n-xn-to-f-0-in-measure}

Consider the sequence $f_{n}(x) = (\sin(\pi nx))^{n}$, $n = 1,2,\ldots$, on the interval $\lbrack 0,1\rbrack$. Prove that there exists a set $E \subset \lbrack 0,1\rbrack$ such that $m(E^{c}) \leq 2^{- 597}$ and a sequence $1 \leq n_{1} < n_{2} < \ldots$ such that $\left. |f_{n_{j}}(x) \middle| \leq j^{- 597} \right.$ for all $x \in E$ and all $j \geq 1$. *Hint*: use E. Consider convergence in measure

> **Proof**
>
> **Claim 1: It suffices to show that $f_{n}$ converges in measure.**\
> Proof of Claim 1: Suppose $f_{n}$ converges in measure to $f = 0$, then by Folland 2.30, there exists a subseq $(f_{n_{k}})\overset{k\rightarrow\infty}{\rightarrow}f = 0$ a.e. .And since $\lbrack 0,1\rbrack$ has **finite measure** $1$, **by Egoroff's Theorem**, for any $\epsilon > 0$ there exists $E \subset \lbrack 0,1\rbrack$ s.t. $\mu(E^{c}) < \epsilon$ and $(f_{n_{k}})\overset{k\rightarrow\infty}{\rightarrow}f = 0$ **uniformly** on $E$.\
> Then we take $\epsilon: = 2^{- 597}$and coresponding $E$.\
> And for each $j \in {\mathbb{N}}$, we let $\delta_{j} = j^{- 597}$. By the uniform convergence property of $(f_{n_{k}})$, we can take $N_{j}$ s.t. $\left. |f_{n_{k}}(x) \middle| < \delta_{j} \right.$ for all $x \in E$ whenever $n_{k} \geq N_{j}$.\
> Therefore, $E$ and the sequence $(f_{N_{j}})$ satisfty the requirements in the context.\
> This shows that, **as long as we can show $(f_{n})$ converges in measure** to $f = 0$, the statement is proved.\
> \
> Let $f_{n}(x): = \sin(n\pi x)^{n}$ for $n \in {\mathbb{N}}$.\
> **Claim 2:** $f_{n}$ **converges in measure.**\
> Proof of Claim 2: The idea is that the exponent $n$ makes the sequence converge faster than the linear growth of $nx$ that shortens a period and messes up the sin values.\
> Fix $\epsilon > 0$. (WLOG $\epsilon < 1$.) WTS:
>
> $$
> m(\left\{ x: \middle| \sin(n\pi x) \geq \epsilon^{1/n} \right\})\rightarrow 0\quad\text{as}\ n\rightarrow\infty
> $$
>
> We know that $\sin(n\pi x) = 1$ iff $x = \frac{2k - 1}{2n}$ for some $k = 0,\cdots,2n - 1$. Consider $x \in \lbrack 0,\frac{1}{2n})$, let $\left. |\sin(n\pi x_{0}) \middle| : = \epsilon^{1/n} \right.$.\
> Denote
>
> $$
> \left. \delta_{n} := \middle| \ \frac{1}{2n} - x_{0}\ | \right.
> $$
>
> Then we can express the measure as:
>
> $$
> m(\left\{ x: \middle| \sin(n\pi x) \geq \epsilon^{1/n} \right\}) = 2n\delta_{n}
> $$
>
> Notice that by the monotonicity of arcsin function, we can solve for $x_{0}$ as:
>
> $$
> x_{0} = \frac{1}{n\pi}\arcsin(\epsilon^{\frac{1}{n}})
> $$
>
> Thus
>
> $$
> \delta_{n} = \frac{1}{2n} = \frac{1}{n\pi}\arcsin(\epsilon^{\frac{1}{n}})
> $$
>
> Thus
>
> $$
> \begin{matrix}
> {\lim\limits_{n\rightarrow\infty}m(\left\{ x: \middle| \sin(n\pi x) \geq \epsilon^{1/n} \right\})} & {= \lim\limits_{n\rightarrow\infty}2n\delta_{n}} \\
>  & {= 1 - \lim\limits_{n\rightarrow\infty}\frac{2}{\pi}\arcsin(\epsilon^{\frac{1}{n}})} \\
>  & {= 1 - \frac{2}{\pi} \cdot \frac{\pi}{2}} \\
>  & {= 0}
> \end{matrix}
> $$
>
> Since $\epsilon$ is arbitrary, this finishes the proof that $f_{n}\rightarrow f = 0$ in measure.\
> Thus combining Claim 1, the whole statement is proved.

## Indicator functions 是 $L^{+}$ 的一个 closed subset

Let $(X,\mathcal{A},\mu)$ be any measure space. Let $M \subset L^{+}$ be the set of indicator functions $\chi_{E}$, where $E \in \mathcal{A}$ and $\mu(E) < \infty$. Prove that $M$ is a closed subset of $L^{1}$. In other words, prove that $M \subset L^{1}$, and that if $f_{n} \in M$, $f \in L^{1}$, and $\left. \int \middle| f_{n} - f \middle| \rightarrow 0 \right.$, then $f \in M$.

> **Proof**
>
> Let $(f_{n} := \chi_{E_{n}})_{n \in {\mathbb{N}}}$ be a seq of indicator functions in $L^{+}$ s.t. $\left. \int \middle| f_{n} - f \middle| \rightarrow 0 \right.$ for some $f \in L^{1}$.\
> Define for all $k \in {\mathbb{N}}$
>
> $$
> A_{k} := \left\{ x: \middle| f(x) \middle| > \frac{1}{k}, \middle| f(x) - 1 \middle| > \frac{1}{k} \right\}
> $$
>
> Fix one $k \in {\mathbb{N}}$, bt monotonicity of integration in $L^{1}$, we have
>
> $$
> \left. \int \middle| f - \chi_{E_{n}} \middle| \geq \int_{A_{k}} \middle| f - \chi_{E_{n}} \middle| \geq \int_{A_{k}}\frac{1}{k} \geq \frac{\mu(A_{k})}{k} \right.
> $$
>
> Thus
>
> $$
> \left. \mu(A_{k}) \leq k\int \middle| f - \chi_{E_{n}}| \right.
> $$
>
> Since $\chi_{E_{n}}\rightarrow f$ in $L^{1}$, it follows that $\mu(A_{k}) = 0$.\
> Since $A_{k}$ is arbitrary, by ctbl sub additivity,
>
> $$
> \mu(\bigcup\limits_{k = 1}^{\infty}A_{k}) \leq \sum\limits_{k = 1}^{\infty}\mu(A_{k}) = 0
> $$
>
> Define
>
> $$
> A := \left\{ {x:f(x) \neq 0,1} \right\}
> $$
>
> By the definition of $A_{k}$, we have the equality:
>
> $$
> A = \bigcup\limits_{k = 1}^{\infty}A_{k}
> $$
>
> Thus $\mu(A) = 0$, which means that $f(x) \in \left\{ {0,1} \right\}$ a.e., showing that $f$ is a.e. an indicator function, in the same equivalence class of some indicator function in $L^{1}$, thus we have $f \in M \subset L^{1}$. This finishes the proof that $M$ is a closed subset of $L^{1}$.

## a complete metric space of measurable functions (other then $L^{1}(\mu)$)

Suppose that $(X,\mathcal{A},\mu)$ is a measure space such that $\mu(X) < \infty$. Set $\chi(t) = \frac{t}{1 + t}$ for $t \geq 0$.\
Given measurable functions $f,g:X\rightarrow{\mathbb{C}}$, set

$$
\left. \rho(f,g) := \int\chi( \middle| f - g \middle| ) d\mu \right.
$$

- Prove that $\rho$ induces a metric, also denoted $\rho$, on the space

  $$
  L := \left\{ {f:X\rightarrow{\mathbb{C}}\ \text{measurable}} \right\}/\mspace{-18mu}\mspace{-18mu} \sim ,
  $$

  where $f \sim g$ iff $f = g$ a.e. *Hint*: prove that $\chi(s + t) \leq \chi(s) + \chi(t)$ for $s,t \geq 0$.

- Prove that if $f_{n},f \in L$, then $\rho(f_{n},f)\rightarrow 0$ iff $f_{n}\rightarrow f$ in measure.

- Prove that $(L,\rho)$ is a complete metric space.

> **Remark**
>
> **对于任何 measure $\mu$, $L^{1}(\mu)$ 都是一个 complete metric space (因为它是 Banach space)**; 这里, 我们略微修改了 $L^{1}(\mu)$ 的 metric, 嵌套了一个函数, 但是它**仍然是一个 complete metric space.**

> **Proof**
>
> **of 5(a):** $\chi(t) = \frac{t}{1 + t} = 1 - \frac{1}{1 + t}$ is an increasing function on $t \geq 0$.\
> **Claim: for all $s,t \geq 0$, we have $\chi(s) + \chi(t) \leq \chi(s + t)$.**\
> **Proof of claim:**\
> Let $s,t \geq 0$, we have
>
> $$
> \chi(s) + \chi(t) = \frac{s}{1 + s} + \frac{t}{1 + t} = \frac{s(1 + t) + t(1 + s)}{(1 + s)(1 + t)} = \frac{s + st + t + ts}{(1 + s)(1 + t)} = \frac{s + t + 2st}{(1 + s)(1 + t)}
> $$
>
> while
>
> $$
> \chi(s + t) = \frac{s + t}{1 + s + t}
> $$
>
> Note
>
> $$
> \begin{matrix}
> {(s + t)(1 + s)(1 + t) = (s + t)(1 + s + t + st)} & {= s + t + s^{2} + 2st + t^{2} + s^{2}t + st^{2}} \\
> {(s + t + 2st)(1 + s + t)} & {= s + t + s^{2} + 4st + t^{2} + 2s^{2}t + 2st^{2}}
> \end{matrix}
> $$
>
> We have:
>
> $$
> (s + t)(1 + s)(1 + t) \leq (s + t + 2st)(1 + s + t)
> $$
>
> Since $(1 + s + t)$ and $(1 + s)(1 + t)$ are positive, we can rearrange the ineq to be
>
> $$
> \frac{s + t}{1 + s + t} \leq \frac{s + t + 2st}{(1 + s)(1 + t)}
> $$
>
> which is exactly
>
> $$
> \chi(s) + \chi(t) \leq \chi(s + t)
> $$
>
> as needed.\
> \
> First, $\rho$ is a well-defined function on the quotient set, since if $f \sim g$ and $f' \sim g'$ then $\left. |f - g \middle| = \middle| f' - g'| \right.$ a.e. Consequently,
>
> $$
> \left. \chi( \middle| f - g \middle| ) = \chi( \middle| f' - g' \middle| )\quad\text{a.e.} \right.
> $$
>
> and hence
>
> $$
> \left. \int_{X}\chi( \middle| f - g \middle| )\, d\mu = \int_{X}\chi( \middle| f' - g' \middle| )\, d\mu \right.
> $$
>
> Now we prove that $\rho$ is a metric:
>
> - **Nonnegativity**: $\rho(f,g) \geq 0$ is immediate since $\chi( \cdot ) \geq 0$ and $\mu$ is a measure; and since $\chi(h) = 0$ iff $h = 0$ a.e., we have $\rho(f,g) = 0$ iff $f = g$ a.e., that is, $f = g \in L^{1}(\mu)$
>
> - **Symmetry**: $\rho(f,g) = \rho(g,f)$ follows immediately from $\left. \chi( \middle| f - g \middle| ) = \chi( \middle| g - f \middle| ) \right.$.
>
> - **Triangle inequality**: For any three functions $f,g,h$, we have pointwise
>
>   $$
>   \left. |f(x) - h(x) \middle| \leq \middle| f(x) - g(x) \middle| + \middle| g(x) - h(x) \middle| . \right.
>   $$
>
>   Then applying the subadditivity of $\chi$ proved above, we have:
>
>   $$
>   \left. \chi( \middle| f(x) - h(x) \middle| ) \leq \chi( \middle| f(x) - g(x) \middle| + \middle| g(x) - h(x) \middle| ) \leq \chi( \middle| f(x) - g(x) \middle| ) + \chi( \middle| g(x) - h(x) \middle| ) \right.
>   $$
>
>   Integrating both sides over $X$ gives
>
>   $$
>   \left. \rho(f,h) = \int_{X}\chi( \middle| f - h \middle| )\, d\mu \leq \int_{X}\chi( \middle| f - g \middle| )\, d\mu + \int_{X}\chi( \middle| g - h \middle| )\, d\mu = \rho(f,g) + \rho(g,h) \right.
>   $$
>
> Therefore, $\rho$ is a metric on $L = \left\{ {f:X\rightarrow{\mathbb{C}}\ \text{measurable}} \right\}/\mspace{-18mu}\mspace{-18mu} \sim$ as desired.

> **Proof**
>
> **of 5(b)**:\
> **Claim 1: $\rho(f_{n},f)\rightarrow 0$ $\Longrightarrow$ $f_{n}\rightarrow f$ in measure**\
> Suppose $\rho(f_{n},f)\rightarrow 0$. Let $\epsilon > 0$.\
> Since $\chi(t) = \frac{t}{1 + t}$ is **strictly increasing** in $t$:
>
> $$
> \left. |f_{n} - f \middle| > \epsilon\Leftrightarrow\chi( \middle| f_{n} - f \middle| ) > \chi(\epsilon) = \frac{\epsilon}{1 + \epsilon} \right.
> $$
>
> Hence
>
> $$
> \left\{ |f_{n} - f \middle| > \epsilon \right\} = \left\{ \chi( \middle| f_{n} - f \middle| ) > \frac{\epsilon}{1 + \epsilon} \right\}
> $$
>
> Since the function is nonnegative, by Chebyshev:
>
> $$
> \left. \mu(\left\{ |f_{n} - f \middle| > \epsilon \right\}) = \mu(\left\{ \chi( \middle| f_{n} - f \middle| ) > \frac{\epsilon}{1 + \epsilon} \right\}) \leq \frac{1}{\,\frac{\epsilon}{1 + \epsilon}\,}\int\chi( \middle| f_{n} - f \middle| )\, d\mu = \frac{\rho(f_{n},f)}{\chi(\epsilon)} \right.
> $$
>
> By assumption, $\rho(f_{n},f)\rightarrow 0$, thus
>
> $$
> \mu(\left\{ |f_{n} - f \middle| > \epsilon \right\}) \leq \frac{\rho(f_{n},f)}{\chi(\epsilon)}\rightarrow 0
> $$
>
> Since $\epsilon$ is arbitrary, it proves that $f_{n}\rightarrow f$ in measure.\
> \
> **Claim 2: $f_{n}\rightarrow f$ in measure $\Longrightarrow$ $\rho(f_{n},f)\rightarrow 0$**\
> Now assume $f_{n}\rightarrow f$ in measure.\
> Let $\delta > 0$.\
> Observe that for any $\epsilon > 0$:
>
> - $\left. |f_{n} - f \middle| \leq \epsilon\Longrightarrow\frac{|f_{n} - f|}{\left. 1 + \middle| f_{n} - f| \right.} \leq \frac{\epsilon}{1 + \epsilon} \right.$.
>
> - $\left. |f_{n} - f \middle| \geq \epsilon\Longrightarrow\frac{|f_{n} - f|}{\left. 1 + \middle| f_{n} - f| \right.} \leq 1 \right.$
>
> Hence by choosing any arbitrary $\epsilon$, we can bound the integral by:
>
> $$
> 0 \leq \int_{X}\frac{|f_{n} - f|}{\left. 1 + \middle| f_{n} - f| \right.}\, d\mu \leq \int_{\{{|f_{n} - f| \leq \epsilon}\}}\frac{\epsilon}{1 + \epsilon}\, d\mu + \int_{\{{|f_{n} - f| > \epsilon}\}}1\, d\mu
> $$
>
> For the first term:
>
> $$
> \int_{\{{|f_{n} - f| \leq \epsilon}\}}\frac{\epsilon}{1 + \epsilon}\, d\mu = \frac{\epsilon}{1 + \epsilon}\mu(\left\{ |f_{n} - f \middle| \leq \epsilon \right\}) \leq \frac{\epsilon}{1 + \epsilon}\mu(X)
> $$
>
> Because $\mu(X)$ is finite, we can choose $\epsilon$ s.t. $\frac{\epsilon}{1 + \epsilon}\mu(X) < \delta/2$.\
> Once $\epsilon$ is fixed, by convergence in measure there exists $N$ such that for all $n \geq N$,
>
> $$
> \mu(\left\{ |f_{n} - f \middle| > \epsilon \right\}) < \delta/2
> $$
>
> Then for any $n \geq N$, we have:
>
> $$
> \left. \rho(f_{n},f) = \int_{X}\chi( \middle| f_{n} - f \middle| )\, d\mu \leq \mu(X)\,\frac{\epsilon}{1 + \epsilon} + \mu(\left\{ |f_{n} - f \middle| > \epsilon \right\}) < \delta \right.
> $$
>
> Hence
>
> $$
> \rho(f_{n},f)\overset{n\rightarrow\infty}{\rightarrow}0
> $$

> **Proof**
>
> **of 5(c):**\
> Suppose $(f_{n})$ is a Cauchy seq in $(L,\rho)$, i.e. for any $\epsilon > 0$, exists some $N > 0$ s.t. $\rho(f_{m},f_{n}) < \epsilon$ whenever $n,m \geq N$.\
> WTS: $(f_{n})$ converges, i.e. $\rho(f_{n},f)\rightarrow 0$.\
> By (b) we know **it suffices to show that $f_{n}\rightarrow f$ in measure**.\
> And by Folland 2.30, **STS: $(f_{n})$ is Cachy in measure**.\
> Let $\epsilon > 0$. Let $\delta > 0$.\
> by Chebyshev:
>
> $$
> \left. \mu(\left\{ |f_{n} - f_{m} \middle| > \epsilon \right\}) = \mu(\left\{ \chi( \middle| f_{n} - f_{m} \middle| ) > \frac{\epsilon}{1 + \epsilon} \right\}) \leq \frac{1}{\,\frac{\epsilon}{1 + \epsilon}\,}\int\chi( \middle| f_{n} - f_{m} \middle| )\, d\mu = \frac{\rho(f_{n},f_{m})}{\chi(\epsilon)} \right.
> $$
>
> So since $(f_{n})$ is a Cauchy, there exists $N > 0$ s.t. $\rho(f_{n},f_{m}) < \chi(\epsilon)\delta$ whenever $n,m \geq N$, thus $\mu(\left\{ |f_{n} - f_{m} \middle| > \epsilon \right\}) \leq \delta$ whenever $m,n \geq N$.\
> This proves that $(f_{n})$ is Cachy in measure, thus $f_{n}\rightarrow f$ in measure, and thus $(f_{n})$ converges, showing that every Cachy seq converges in $(L,\rho)$. Therefore $(L,\rho)$ is a complete metric space.

Nur für Verrückte (Only for nuts).

(It's **really** not necessary to attempt these problems. Do not, under any circumstances, hand them in!)

1.  Prove that the category of measurable spaces (see HW1) admits finite products, and that the product of $(X,\mathcal{A})$ and $(Y,\mathcal{B})$ equals $(X \times Y,\mathcal{A} \otimes \mathcal{B})$.

2.  Now consider the category of measure spaces (see HW2). Consider two measure spaces $(X_{i},\mathcal{A}_{i},\mu_{i})$, $i = 1,2$, and set $X = X_{1} \times X_{2}$, $\mathcal{A} = \mathcal{A}_{1} \otimes \mathcal{A}_{2}$, and $\mu = \mu_{1} \times \mu_{2}$.

    - Prove that the projection maps $X\rightarrow X_{i}$ are measurable, and that they are measure preserving iff $\mu_{j}(X_{j}) = 1$ for $j = 1,2$. Thus $(X,\mathcal{A},\mu)$ is *not* the categorical product of $(X_{i},\mathcal{A}_{i},\mu_{i})$ in general.

    - Prove that even if $\mu_{i}(X_{i}) = 1$, the measure space $(X,\mathcal{A},\mu)$ is *not* the categorical product of $(X_{i},\mathcal{A}_{i},\mu_{i})$ in general. *Hint*: consider the case when the $X_{i}$ consist of two elements, for example $X_{i} = \left\{ {{\mathfrak{o}}_{i},{\mathfrak{v}}_{i}} \right\}$.

