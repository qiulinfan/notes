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
source: "notes/math/measure-theory/homeworks/hw09-on_signed-measure.typ"
subtitle: Typst-first course notes and worked homeworks
title: "MATH 597: Measure Theory"
---
# Homework 9: on signed measure (50/50)

## Three real Banach spaces and a fake one

- Let

  $$
  \ell_{0}^{\infty} := \left\{ {a = (a_{1},a_{2},\cdots) \mid a_{i} \in {\mathbb{R}},\lim\limits_{n\rightarrow\infty}a_{n} = 0} \right\}.
  $$

  Prove that $(\ell_{0}^{\infty}, \parallel \cdot \underset{\infty}{\parallel})$, where $\left. \parallel a\underset{\infty}{\parallel} = \sup_{n} \middle| a_{n}| \right.$, is a Banach space.

- Let

  $$
  C_{b}^{0}({\mathbb{R}}) := \left\{ {f:{\mathbb{R}}\rightarrow{\mathbb{R}} \mid f\ \text{is continuous and bounded}} \right\}.
  $$

  Prove that $(C_{b}^{0}({\mathbb{R}}), \parallel \cdot \underset{\infty}{\parallel})$, where $\left. \parallel f\underset{\infty}{\parallel} = \sup_{x \in {\mathbb{R}}} \middle| f(x)| \right.$, is a Banach space.

- Let

  $$
  C_{0}^{0}({\mathbb{R}}) := \left\{ {f:{\mathbb{R}}\rightarrow{\mathbb{R}} \mid f\ \text{is continuous,}\lim\limits_{x\rightarrow \pm \infty}f(x) = 0} \right\}.
  $$

  Prove that $(C_{0}^{0}({\mathbb{R}}), \parallel \cdot \underset{\infty}{\parallel})$, where $\left. \parallel f\underset{\infty}{\parallel} = \sup_{x \in {\mathbb{R}}} \middle| f(x)| \right.$, is a Banach space.

- Recall that

  $$
  C_{c}^{0}({\mathbb{R}}) = \left\{ {f:{\mathbb{R}}\rightarrow{\mathbb{R}} \mid f\ \text{is continuous and}\ f = 0\ \text{outside a bounded set}} \right\}.
  $$

  Show that $(C_{c}^{0}({\mathbb{R}}), \parallel \cdot \underset{\infty}{\parallel})$, where $\left. \parallel f\underset{\infty}{\parallel} = \sup_{x \in {\mathbb{R}}} \middle| f(x)| \right.$, is not a Banach space.

> **Proof**
>
> **of (a):** Since we showed in class that
>
> $$
> \ell^{\infty} = L^{\infty}({\mathbb{N}},\mathcal{P}({\mathbb{N}}),\mu_{counting})
> $$
>
> and $L^{\infty}$ spaces are Banach, $\ell^{\infty}$ is Banach.\
> Thus it suffices to show that $\ell_{0}^{\infty}$ is closed in $\ell^{\infty}$, since a closed subset of a complete metric space is complete.\
> Let $(a^{(k)})_{k = 1}^{\infty}$ be a sequence in $\ell_{0}^{\infty}$ converging in norm to $a \in \ell^{\infty}$, i.e.,
>
> $$
> \parallel a^{(k)} - a\underset{\infty}{\parallel}\rightarrow 0
> $$
>
> Let $\varepsilon > 0$.\
> Since $\parallel a^{(k)} - a\underset{\infty}{\parallel}\rightarrow 0$, there exists $K$ such that for all $k \geq K$,
>
> $$
> \left. \parallel a^{(k)} - a \middle| \middle| = \sup\limits_{n} \middle| a_{n}^{(k)} - a_{n} \middle| < \frac{\varepsilon}{2} \right.
> $$
>
> This implies that
>
> $$
> \left. \forall n, \middle| a_{n}^{(K)} - a_{n} \middle| < \varepsilon \right.
> $$
>
> Since $a^{(K)} \in \ell_{0}^{\infty}$, $a_{n}^{(K)}\rightarrow 0$ as $n\rightarrow\infty$. Thus there exists $N \in {\mathbb{N}}$ s.t. for all $n \geq N$,
>
> $$
> \left. |a_{n}^{(K)} \middle| \leq \frac{\varepsilon}{2} \right.
> $$
>
> Then for all $n \geq N$, we have:
>
> $$
> \left. |a_{n} \middle| \leq \middle| a_{n} - a_{n}^{(K)} \middle| + \middle| a_{n}^{(K)} \middle| < \varepsilon \right.
> $$
>
> This shows that
>
> $$
> \left. \lim\limits_{n\rightarrow\infty} \middle| a_{n} \middle| < \epsilon \right.
> $$
>
> Since $\varepsilon > 0$ is arbitrary, this implies
>
> $$
> \lim\limits_{n\rightarrow\infty}a_{n} = 0
> $$
>
> Hence $a \in \ell_{0}^{\infty}$. So $\ell_{0}^{\infty}$ is closed in $\ell^{\infty}$, thus itself Banach.

> **Proof**
>
> **of (b):** Let $(f_{n})_{n \in {\mathbb{N}}}$ be a Cauchy seq in $(C_{b}^{0}({\mathbb{R}}), \parallel \cdot \underset{\infty}{\parallel})$, then
>
> $$
> \left. \forall\varepsilon > 0,\exists N \in {\mathbb{N}} s.t. \parallel f_{n} - f_{m}\underset{\infty}{\parallel} = \sup\limits_{x \in {\mathbb{R}}} \middle| f_{n}(x) - f_{m}(x) \middle| < \varepsilon \right.
> $$
>
> In particular, for each fixed $x \in {\mathbb{R}}$, $(f_{n}(x))_{n \in {\mathbb{N}}}$ is a Cauchy sequence in $\mathbb{R}$, hence converges (since $\mathbb{R}$ is complete). So we can define the pointwise limit:
>
> $$
> f(x) := \lim\limits_{n\rightarrow\infty}f_{n}(x)
> $$
>
> **Claim 1: $f_{n}\rightarrow f$ in $\parallel \cdot \underset{\infty}{\parallel}$.**\
> Let $\varepsilon > 0$.\
> Since $(f_{n})$ is Cauchy in $\parallel \cdot \underset{\infty}{\parallel}$, there exists $N$ such that:
>
> $$
> \parallel f_{n} - f_{m}\underset{\infty}{\parallel} < \varepsilon,\quad\forall n,m \geq N
> $$
>
> Fix $m \geq N$, and let $n\rightarrow\infty$. For each $x$, we get:
>
> $$
> \left. |f_{n}(x) - f_{m}(x) \middle| < \varepsilon\forall n\Longrightarrow\lim\limits_{n\rightarrow\infty} \middle| f_{n}(x) - f_{m}(x) \middle| = \middle| f(x) - f_{m}(x) \middle| \leq \varepsilon \right.
> $$
>
> Since this is true for each $x \in {\mathbb{R}}$, we obtain:
>
> $$
> \parallel f - f_{m}\underset{\infty}{\parallel} \leq \varepsilon,\quad\text{for all}\ m \geq N
> $$
>
> Since $\varepsilon > 0$ is arbitrary, this shows that
>
> $$
> \lim\limits_{n\rightarrow\infty} \parallel f - f_{n}\underset{\infty}{\parallel} = 0
> $$
>
> **Claim 2: $f \in (C_{b}^{0}({\mathbb{R}}), \parallel \cdot \underset{\infty}{\parallel})$.**\
> Since $\lim_{n\rightarrow\infty} \parallel f - f_{n}\underset{\infty}{\parallel} = 0$, it also implies that the convergence is uniform.\
> We know the uniform limit of continuous functions is continuous, so $f$ is continuous. It remains to show $f$ is bounded, and this directly follows from the uniform convergence. We take $\varepsilon = 1$. We have proved that there exists $N$ s.t. for all $m \geq N$,
>
> $$
> \parallel f - f_{m}\underset{\infty}{\parallel} \leq 1
> $$
>
> Thus
>
> $$
> \left. \sup\limits_{x \in {\mathbb{R}}} \middle| f(x) \middle| \leq \sup\limits_{x \in {\mathbb{R}}} \middle| f_{N}(x) \middle| + 1 \right.
> $$
>
> Since $f_{n} \in C_{b}^{0}({\mathbb{R}})$), it is bounded, thus
>
> $$
> \left. \sup\limits_{x \in {\mathbb{R}}} \middle| f(x) \middle| < \infty \right.
> $$
>
> showing that the limit function is bounded. This finishes the proof that $f \in C_{b}^{0}({\mathbb{R}})$. Thus, every Cauchy seq in $(C_{b}^{0}({\mathbb{R}}), \parallel \cdot \underset{\infty}{\parallel})$ converges in $(C_{b}^{0}({\mathbb{R}}), \parallel \cdot \underset{\infty}{\parallel})$, i.e. it is Banach.

> **Proof**
>
> **of (c):** Let $(f_{n})_{n \in {\mathbb{N}}}$ be a Cauchy seq in $(C_{0}^{0}({\mathbb{R}}), \parallel \cdot \underset{\infty}{\parallel})$, then for each fixed $x \in {\mathbb{R}}$, $(f_{n}(x))_{n \in {\mathbb{N}}}$ is a Cauchy sequence in $\mathbb{R}$, so for the same reason as (b), we can define the pointwise limit:
>
> $$
> f(x) := \lim\limits_{n\rightarrow\infty}f_{n}(x)
> $$
>
> And for the same reason as (b), we get
>
> $$
> f_{n}\rightarrow f\ \text{in} \parallel \cdot \underset{\infty}{\parallel}
> $$
>
> which also implies that the pointwise convergence is uniform. Since each $f_{n}$ is continuous, the uniform limit $f$ is continuous.\
> Thus it suffices to show that $\lim_{x\rightarrow \pm \infty}f(x) = 0$.\
> Let $\epsilon > 0$. Since $f_{n}\rightarrow f$ uniformly, there exists $N$ such that for all $n \geq N$, $\parallel f_{n} - f\underset{\infty}{\parallel} < \epsilon/2$. Also, since $f_{N} \in C_{0}^{0}({\mathbb{R}})$, there exists $M > 0$ such that $\left. |f_{N}(x) \middle| < \epsilon/2 \right.$ for all $\left. |x \middle| > M \right.$.\
> Then for $\left. |x \middle| > M \right.$,
>
> $$
> \left. |f(x) \middle| \leq \middle| f(x) - f_{N}(x) \middle| + \middle| f_{N}(x) \middle| < \epsilon/2 + \epsilon/2 < \epsilon \right.
> $$
>
> So $\lim_{x\rightarrow \pm \infty}f(x) = 0$, i.e., $f \in C_{0}^{0}({\mathbb{R}})$. Thus, every Cauchy seq in $(C_{0}^{0}({\mathbb{R}}), \parallel \cdot \underset{\infty}{\parallel})$ converges in $(C_{0}^{0}({\mathbb{R}}), \parallel \cdot \underset{\infty}{\parallel})$, i.e. it is Banach.

> **Proof**
>
> of (d): We consider a continuous (smooth actually) function $\phi:{\mathbb{R}}\rightarrow{\mathbb{R}}$ with $\text{supp}(\phi) = \lbrack 0,2\rbrack$ (here we take the closure):
>
> $$
> \phi(x) := \left\{ \begin{matrix}
> {\exp\mspace{-18mu}(\mspace{-18mu} - \frac{1}{x\,(2 - x)}),} & {0 < x < 2,} \\
> {0,} & \text{otherwise}
> \end{matrix} \right.
> $$
>
> ![Figure 33:[ ]{style="white-space: pre-wrap"}](.assets/main--figure-raster-032.png){width="35%"}
>
> This function reaches its maximum at $x = 1$,
>
> $$
> \parallel \phi\underset{\infty}{\parallel} = \frac{1}{e}
> $$
>
> For each integer $n \geq 1$, define
>
> $$
> \phi_{n}(x) = \phi\mspace{-18mu}(x - n)
> $$
>
> Then each $\phi_{n}$ is also continuous, and $\text{supp}(\phi_{n}) = \lbrack n,n + 2\rbrack$.\
> Consider the sequence $(S_{N})_{1}^{\infty}$, defined as:
>
> $$
> S_{N}(x) := \sum\limits_{n = 1}^{N}2^{- n}\,\phi_{n}(x)
> $$
>
> Then each $S_{N} \in C_{c}^{0}({\mathbb{R}})$, since finite sum of continuous functions is also continuous, and $\text{supp}(S_{N}) = \lbrack 1,N + 2\rbrack$, thus each $S_{N} \in C_{c}^{0}({\mathbb{R}})$.\
> **Claim: $(S_{N})_{1}^{\infty}$ is Cauchy in the sup norm.**\
> This is because for each (WLOG) $M > N \in {\mathbb{N}}$,
>
> $$
> \begin{matrix}
> {\parallel S_{M} - S_{N}\underset{\infty}{\parallel}} & {= \parallel \sum\limits_{n = N + 1}^{M}\frac{1}{2^{n}}\phi_{n}\underset{\infty}{\parallel}} \\
>  & {\leq \sum\limits_{n = N + 1}^{M}\frac{1}{2^{n}} \parallel \phi\underset{\infty}{\parallel}} \\
>  & {\leq \sum\limits_{n = N + 1}^{\infty}\frac{1}{2^{n}} \parallel \phi\underset{\infty}{\parallel}} \\
>  & {= \sum\limits_{n = N + 1}^{\infty}\frac{1}{2^{n}e} = \frac{1}{2^{N}e}\overset{N\rightarrow\infty}{\rightarrow}0}
> \end{matrix}
> $$
>
> Thus for arbitrary $\varepsilon > 0$, exists $K \in {\mathbb{N}}$ s.t. for all $M,N \geq K$, $\parallel S_{M} - S_{N}\underset{\infty}{\parallel} < \varepsilon$. And by same reason as (b), (c), $(S_{N})_{1}^{\infty}$ converges by $\parallel \cdot \underset{\infty}{\parallel}$ into its pointwise limit:
>
> $$
> S(x) := \sum\limits_{n = 1}^{\infty}2^{- n}\,\phi_{n}(x)
> $$
>
> But $S(x)$ does not have compact support, $\text{supp}(S) = \lbrack 0,\infty)$. So $S \notin C_{c}^{0}({\mathbb{R}})$. This serves as a counterexample showing that $C_{c}^{0}({\mathbb{R}})$ is not Banach.

## $\left. \nu^{+}(E),\nu^{-}(E), \middle| \nu \middle| (E) \right.$ 的formula from original $\nu$ {#nue-nu-enue-的formula-from-original-nu}

Let $\nu$ be a signed measure on $(X,\mathcal{A})$, and $E \in \mathcal{A}$. Prove the following statements:

- $\nu^{+}(E) = \sup\left\{ {\nu(F) \mid :F \in \mathcal{A},F \subset E} \right\}$, and $\nu^{-}(E) = - \inf\left\{ {\nu(F) \mid F \in \mathcal{A},F \subset E} \right\}$;

- $\left. |\nu \middle| (E) = \sup\left\{ \sum_{i = 1}^{N} \middle| \nu(E_{i}) \middle| \mid N \in {\mathbb{N}},\, E = \bigcup_{i = 1}^{N}E_{i}\ \text{disjoint union} \right\} \right.$;

- $\left. |\nu \middle| (E) \geq \middle| \nu(E)| \right.$. In the case $\nu$ finite, it achieves equality iff $E$ is positive or negative for $\nu$.

> **Proof**
>
> **of (i):** By the Hahn decomposition theorem, we can take a Hahn decomposition $X = P \sqcup N$ where
>
> $$
> \nu(A) \geq 0\quad\text{for all}\ A \subset P,\qquad\nu(B) \leq 0\quad\text{for all}\ B \subset N
> $$
>
> Fix $E \in \mathcal{A}$. By Jordan decomposition we have
>
> $$
> \nu^{+}(E) = \nu(E \cap P)
> $$
>
> Fix $F \subset E$, we have:
>
> $$
> F = (F \cap P) \sqcup (F \cap N)
> $$
>
> Since $\nu(F \cap N) \leq 0$, we have:
>
> $$
> \nu(F) \leq \nu(F \cap P) \leq \nu(E \cap P) = \nu^{+}(E)
> $$
>
> Since $F$ is arbitrary, this shows:
>
> $$
> \sup\left\{ {\nu(F) \mid F \subset E} \right\} \leq \nu^{+}(E)
> $$
>
> On the other hand, taking $F = E \cap P \subset E$, we get
>
> $$
> \nu(F) = \nu(E \cap P) = \nu^{+}(E)
> $$
>
> Hence
>
> $$
> \sup\left\{ {\nu(F) \mid F \subset E} \right\} \geq \nu^{+}(E)
> $$
>
> Combining both inequalities gives
>
> $$
> \nu^{+}(E) = \sup\left\{ {\nu(F) \mid F \subset E} \right\}
> $$
>
> Similarly, since $\nu(F \cap P) \geq 0$ and $\nu(F) = \nu(F \cap P) + \nu(F \cap N)$, we have $\nu(F) \geq \nu(F \cap N)$. And Since $\nu(E \cap N) = \nu(F \cap N) + \nu((E\backslash F) \cap N)$ with $\nu((E\backslash F) \cap N) \leq 0$, we get $\nu(F \cap N) \geq \nu(E \cap N)$.\
> Putting it together:
>
> $$
> \nu(F) \geq \nu(F \cap N) \geq \nu(E \cap N) = - \nu^{-}(E)
> $$
>
> Since $F$ is arbitrary, this shows:
>
> $$
> \inf\left\{ {\nu(F) \mid F \subset E} \right\} \geq - \nu^{-}(E)
> $$
>
> On the other hand, taking $F = E \cap N \subset E$, we get
>
> $$
> \nu(F) = \nu(E \cap N) = - \nu^{-}(E)
> $$
>
> Hence
>
> $$
> \inf\left\{ {\nu(F) \mid F \subset E} \right\} \leq - \nu^{-}(E)
> $$
>
> Combining both inequalities gives
>
> $$
> \nu^{-}(E) = - \inf\left\{ {\nu(F) \mid F \subset E} \right\}
> $$

> **Proof**
>
> **of (ii):** Let $E \in \mathcal{A}$. By def of total variation measure,
>
> $$
> \left. |\nu \middle| (E) = \nu^{+}(E) + \nu^{-}(E) \right.
> $$
>
> One direction of the equality is easy. Take a Hahn decomposition $X = P \sqcup N$ where
>
> $$
> \nu(A) \geq 0\quad\text{for all}\ A \subset P,\qquad\nu(B) \leq 0\quad\text{for all}\ B \subset N
> $$
>
> Then by Jordan decomposition, we have:
>
> $$
> \nu^{+}(E) = \nu(E \cap P),\quad\nu^{-}(E) = - \nu(E \cap N)
> $$
>
> So by taking $E_{1}: = E \cap P$, $E_{2}: = E \cap N$, we have:
>
> $$
> \left. |\nu \middle| (E) = \nu^{+}(E) + \nu^{-}(E) = \nu(E_{1}) + \nu(E_{2}) \right.
> $$
>
> This shows that
>
> $$
> \left. |\nu \middle| (E) \leq \sup\left\{ \sum \middle| \nu(E_{i})| \right\} \right.
> $$
>
> And for the other direction, for any disjoint measurable partition $E = \bigcup_{i = 1}^{N}E_{i}$, we have
>
> $$
> \left. |\nu(E_{i}) \middle| = \middle| \ \nu^{+}(E_{i}) - \nu^{-}(E_{i}) \middle| \leq \nu^{+}(E_{i}) + \nu^{-}(E_{i}) = \middle| \nu \middle| (E_{i}) \right.
> $$
>
> Therefore
>
> $$
> \left. \sum\limits_{i = 1}^{N} \middle| \ \nu(E_{i}) \middle| \leq \sum\limits_{i = 1}^{N} \middle| \ \nu \middle| (E_{i}) = \middle| \nu \middle| (\bigcup\limits_{i = 1}^{N}E_{i}) = \middle| \nu \middle| (E) \right.
> $$
>
> since $|\nu|$ is a p.m. and the $E_{i}$'s are disjoint. Thus
>
> $$
> \left. \sup\left\{ \sum\limits_{i = 1}^{N} \middle| \nu(E_{i})| \right\} \leq \middle| \nu \middle| (E) \right.
> $$
>
> Combining the two inequalities gives
>
> $$
> \left. |\nu \middle| (E) = \sup\left\{ \sum\limits_{i = 1}^{N} \middle| \ \nu(E_{i}) \middle| \  \middle| N \in {\mathbb{N}},E = \bigcup\limits_{i = 1}^{N}E_{i}\ \text{disjoint} \right\} \right.
> $$
>
> proving the statement.

> **Proof**
>
> **of (iii):** Let $E \in \mathcal{A}$. The ineq $\left. |\nu \middle| (E) \geq \middle| \nu(E)| \right.$ follows from triangular ineq on $\mathbb{R}$:
>
> $$
> \left. |\nu(E) \middle| = \middle| \ \nu^{+}(E) - \nu^{-}(E) \middle| \leq \nu^{+}(E) + \nu^{-}(E) = \middle| \nu \middle| (E) \right.
> $$
>
> Now we assume $\nu$ is finite (i.e. $\left. |\nu \middle| (X) < \infty \right.$). The equality condition $\left. |\nu(E) \middle| = \middle| \nu \middle| (E) \right.$ is detailedly:
>
> $$
> \left. |\ \nu^{+}(E) - \nu^{-}(E) \middle| = \nu^{+}(E) + \nu^{-}(E) \right.
> $$
>
> Since $\left. |\nu \middle| (X) < \infty \right.$, $\nu^{+}(E) < \infty$ and $\nu^{-}(E) < \infty$.\
> Case 1: $\nu^{+}(E) \geq \nu^{-}(E)$, then
>
> $$
> \begin{matrix}
> \left. |\ \nu^{+}(E) - \nu^{-}(E) \middle| = \nu^{+}(E) + \nu^{-}(E) \right. & {\Leftrightarrow\nu^{+}(E) - \nu^{-}(E) = \nu^{+}(E) + \nu^{-}(E)} \\
>  & {\Leftrightarrow - \nu^{-}(E) = \nu^{-}(E)} \\
>  & {\Leftrightarrow\nu^{-}(E) = 0} \\
>  & {\Leftrightarrow E \subset P}
> \end{matrix}
> $$
>
> Case 2: $\nu^{+}(E) < \nu^{-}(E)$, then
>
> $$
> \begin{matrix}
> \left. |\ \nu^{+}(E) - \nu^{-}(E) \middle| = \nu^{+}(E) + \nu^{-}(E) \right. & {\Leftrightarrow\nu^{-}(E) - \nu^{+}(E) = \nu^{+}(E) + \nu^{-}(E)} \\
>  & {\Leftrightarrow - \nu^{+}(E) = \nu^{+}(E)} \\
>  & {\Leftrightarrow\nu^{+}(E) = 0} \\
>  & {\Leftrightarrow E \subset N}
> \end{matrix}
> $$
>
> Therefore the equality condition implies that $E$ must be positive or negative for $\nu$; and in converse, if $E$ is neither positive nor negative set, in either case it implies $\left. |\nu(E) \middle| \neq \middle| \nu \middle| (E) \right.$, thus when $\nu$ finite, $\left. |\nu(E) \middle| = \middle| \nu \middle| (E) \right.$ iff $E$ is positive or negative for $\nu$.

## Signed integrals

Let $\nu$ be a signed measure on $(X,\mathcal{A})$.

- Prove that $\left. \int g\, d \middle| \nu \middle| = \int g\, d\nu^{+} + \int g\, d\nu^{-} \right.$ for $\left. g \in L^{+}( \middle| \nu \middle| ) \right.$ or $\left. g \in L^{1}( \middle| \nu \middle| ) \right.$.

- Define $L^{1}(\nu) = L^{1}(\nu^{+}) \cap L^{1}(\nu^{-})$. Prove that $\left. L^{1}(\nu) = L^{1}( \middle| \nu \middle| ) \right.$.

- Define $\int f\, d\nu = \int f\, d\nu^{+} - \int f\, d\nu^{-}$ for $f \in L^{1}(\nu)$. Prove that if $f \in L^{1}(\nu)$, then

  $$
  \left. \left| {\int f\, d\nu} \right| \leq \int \middle| f \middle| \, d \middle| \nu| \right.
  $$

- Suppose that $\nu$ is a finite measure (i.e. $\nu^{\pm}(X) < \infty$.) Prove that if $E \in \mathcal{A}$, then

  $$
  \left. |\nu \middle| (E) = \sup\left\{ {\left| {\int_{E}f\, d\nu} \right| \mid \parallel f\underset{\infty}{\parallel} \leq 1} \right\}. \right.
  $$

> **Proof**
>
> **of (i)**: Take a Hahn decomposition $X = P \sqcup N$.\
> Then by Jordan decomposition,
>
> $$
> \nu^{+}(E) = \nu(E \cap P),\quad\nu^{-}(E) = - \nu(E \cap N),\quad\forall E \subset X
> $$
>
> and therefore $P$ is null set of $\nu^{-}$ and $N$ is null set of $\nu^{+}$. So on $P$, $\left. |\nu \middle| = \nu^{+} + \nu^{-} = \nu^{+} \right.$; on $N$, $\left. |\nu \middle| = \nu^{+} + \nu^{-} = \nu^{-} \right.$ Thus, suppose $\left. g \in L^{+}( \middle| \nu \middle| ) \right.$,
>
> $$
> \begin{matrix}
> \left. \int g\, d \middle| \nu \middle| = \int_{X}g\, d \middle| \nu| \right. & \left. = \int_{P}g\, d \middle| \nu \middle| + \int_{N}g\, d \middle| \nu \middle| \quad\text{since}\ X = P \sqcup N \right. \\
>  & \left. = \int_{P}g\, d\nu^{+} + \int_{N}g\, d\nu^{-}\quad\text{since} \middle| \nu \middle| = \nu^{+},\nu^{-}\ \text{on}\ P,N \right. \\
>  & {= \int g\, d\nu^{+} + \int g\, d\nu^{-}\quad\text{since}\ N,P\ \text{is null for}\ \nu^{+},\nu^{-}}
> \end{matrix}
> $$
>
> Suppose $\left. g \in L^{1}( \middle| \nu \middle| ) \right.$, then
>
> $$
> \begin{matrix}
> \left. \int g\, d \middle| \nu \middle| = \int_{X}g\, d \middle| \nu| \right. & {\left. = \int_{X}g^{+}\, d \middle| \nu \middle| - \int_{X}g^{-}\, d \middle| \nu \right|\quad\text{by def}} \\
>  & {= (\int_{P}g^{+}\, d\nu^{+} + \int_{N}g^{+}\, d\nu^{-}) - (\int_{P}g^{-}\, d\nu^{+} + \int_{N}g^{-}\, d\nu^{-})\quad\text{since}\ X = P \sqcup N} \\
>  & {= (\int_{P}g^{+}\, d\nu^{+} - \int_{P}g^{-}\, d\nu^{+}) + (\int_{N}g^{+}\, d\nu^{-} - \int_{N}g^{-}\, d\nu^{-})} \\
>  & \left. = \int_{P}g\, d\nu^{+} + \int_{N}g\, d\nu^{-}\quad\text{since}\ g \in L^{1}( \middle| \nu \middle| ) \right. \\
>  & {= \int g\, d\nu^{+} + \int g\, d\nu^{-}\quad\text{since}\ N,P\ \text{is null for}\ \nu^{+},\nu^{-}}
> \end{matrix}
> $$
>
> This finishes the proof.

> **Proof**
>
> **of (ii):** WTS: $\left. L^{1}(\nu^{+}) \cap L^{1}(\nu^{-}) = L^{1}( \middle| \nu \middle| ) \right.$.\
> ($\Rightarrow$): Suppose $\left. f \in L^{1}( \middle| \nu \middle| ) \right.$, i.e. $\left. \int \middle| f \middle| \, d \middle| \nu \middle| < \infty \right.$.\
> Let $\phi$ be arbitrary positive-valued simple function:
>
> $$
> \phi = \sum\limits_{j = 1}^{n}a_{j}\chi_{E_{j}}
> $$
>
> then
>
> $$
> \left. \int\phi\, d \middle| \nu \middle| = \sum\limits_{i = 1}^{n}a_{j} \middle| \nu \middle| (E_{j}) \right.
> $$
>
> Since $\left. \nu^{-}(E_{j}),\nu^{+}(E_{j}) \leq \nu^{+}(E_{j}) + \nu^{-}(E_{j}) = \middle| \nu \middle| (E_{j}) \right.$ for each $j$, we have
>
> $$
> \left. \int\phi\, d\nu^{+},\int\phi\, d\nu^{-} \leq \int\phi\, d \middle| \nu| \right.
> $$
>
> Since $\phi$ is arbitrary, we have
>
> $$
> \left. \int \middle| f \middle| \, d\nu^{+} = \sup\left\{ \int\phi\, d\nu^{+}:0 \leq \phi \leq \middle| f \middle| ,\phi\ \text{simple} \right\} \leq \sup\left\{ \int\phi\, d \middle| \nu \middle| :0 \leq \phi \leq \middle| f \middle| ,\phi\ \text{simple} \right\} = \int \middle| f \middle| \, d \middle| \nu| \right.
> $$
>
> Same for $\nu^{-}$. This shows that
>
> $$
> \left. \int \middle| f \middle| \, d\nu^{+},\int \middle| f \middle| \, d\nu^{-} \leq \int \middle| f \middle| \, d \middle| \nu \middle| < \infty \right.
> $$
>
> i.e. $f \in L^{1}(\nu^{+})$ and $f \in L^{1}(\nu^{-})$, so $f \in L^{1}(\nu^{+}) \cap L^{1}(\nu^{-})$.\
> Thus
>
> $$
> \left. L^{1}( \middle| \nu \middle| ) \subset L^{1}(\nu^{+}) \cap L^{1}(\nu^{-}) \right.
> $$
>
> ($\Leftarrow$): Suppose $f \in L^{1}(\nu^{+}) \cap L^{1}(\nu^{-})$, i.e.
>
> $$
> \left. \int \middle| f \middle| \, d\nu^{+} < \infty,\quad\int \middle| f \middle| \, d\nu^{-} < \infty \right.
> $$
>
> Since $|f|$ is non-negative and measurable, we have $\left. |f \middle| \in L^{+}( \middle| \nu \middle| ) \right.$. Thus by (i) we have:
>
> $$
> \left. \int \middle| f \middle| \, d \middle| \nu \middle| = \int \middle| f \middle| \, d\nu^{+} + \int \middle| f \middle| \, d\nu^{-} < \infty \right.
> $$
>
> So $\left. f \in L^{1}( \middle| \nu \middle| ) \right.$.\
> This shows that:
>
> $$
> \left. L^{1}(\nu^{+}) \cap L^{1}(\nu^{-}) \subset L^{1}( \middle| \nu \middle| ) \right.
> $$
>
> Combining both direction, we finished the proof that:
>
> $$
> \left. L^{1}(\nu^{+}) \cap L^{1}(\nu^{-}) = L^{1}( \middle| \nu \middle| ) \right.
> $$

> **Proof**
>
> **of (iii):** Suppose $f \in L^{1}(\nu)$, then
>
> $$
> \begin{matrix}
> \left| {\int f\, d\nu} \right| & {= \left| {\int f\, d\nu^{+} - \int f\, d\nu^{-}} \right|\quad\text{by def}} \\
>  & {\leq \left| {\int f\, d\nu^{+}} \right| + \left| {\int f\, d\nu^{-}} \right|\quad\text{by tri ineq}} \\
>  & \left. \leq \int \middle| f \middle| \, d\nu^{+} + \int \middle| f \middle| \, d\nu^{-}\quad\text{by property of}\ L^{1}\ \text{integration} \right. \\
>  & {\left. = \int \middle| f \middle| \, d \middle| \nu \right|\quad\text{from (i)}}
> \end{matrix}
> $$
>
> Therefore,
>
> $$
> \left. \left| {\int f\, d\nu} \right| \leq \int \middle| f \middle| \, d \middle| \nu| \right.
> $$

> **Proof**
>
> **of (iv):** Suppose that $\nu$ is a finite measure (i.e. $\nu^{\pm}(X) < \infty$), let $E \in \mathcal{A}$.\
> We denote:
>
> $$
> S := \sup\left\{ \left| {\int_{E}f\, d\nu} \right|\, \middle| \, \parallel f\underset{\infty}{\parallel} \leq 1 \right\}
> $$
>
> **First we show $\left. S \leq \middle| \nu \middle| (E) \right.$:**\
> For any bounded measurable $f$ with $\parallel f\underset{\infty}{\parallel} \leq 1$,
>
> $$
> \begin{matrix}
> \left| {\int_{E}f\, d\nu} \right| & {\left. \leq \int_{E} \middle| f \middle| \, d \middle| \nu \right|\quad\text{by (iii)}} \\
>  & {\left. \leq \int_{E}1\, d \middle| \nu \right|\quad\text{by linearity of integration}} \\
>  & \left. = \middle| \nu \middle| (E) \right.
> \end{matrix}
> $$
>
> So by taking the supremum over such $f$, we get:
>
> $$
> \left. S \leq \middle| \nu \middle| (E) \right.
> $$
>
> **Next we will show $\left. |\nu \middle| (E) \leq S \right.$:**\
> We take a Hahn decomposition, getting $X = P \sqcup N$ where
>
> $$
> \nu^{+}(B) = \nu(P \cup B) \geq 0,\nu^{-}(B) = - \nu(P \cup B) \leq 0,\text{for all}\ B \subset X
> $$
>
> Then
>
> $$
> \left. |\nu \middle| (E) = \nu^{+}(E) + \nu^{-}(E) = \nu(E \cap P) - \nu(E \cap N) \right.
> $$
>
> Now define:
>
> $$
> f := \chi_{P} - \chi_{N}
> $$
>
> Then $f$ is measurable since $P,N$ are measurable. And $\parallel f\underset{\infty}{\parallel} \leq 1$ since $f(x) \in \left\{ {- 1,1} \right\}\,\forall x \in X$ Compute:
>
> $$
> \left. \int_{E}f\, d\nu = \int_{E \cap P}1\, d\nu - \int_{E \cap N}1\, d\nu = \nu(E \cap P) - \nu(E \cap N) = \nu^{+}(E) + \nu^{-}(E) = \middle| \nu \middle| (E) \right.
> $$
>
> Thus
>
> $$
> \left. |\nu \middle| (E) = \left| {\int_{E}f\, d\nu} \right| \leq S \right.
> $$
>
> Combining both inequalities, we get:
>
> $$
> \left. |\nu \middle| (E) = S \right.
> $$

## finite signed measures on $(X,\mathcal{A})$ 是一个 NVM

Let $(X,\mathcal{A})$ be a measurable space.

- Let $\lambda$, $\mu$ be finite *positive* measures on $(X,\mathcal{A})$. Let $\nu = \lambda - \mu$. Prove that

  $$
  \left. \nu^{+}(E) \leq \lambda(E),\qquad\nu^{-}(E) \leq \mu(E),\qquad \middle| \nu \middle| (E) \leq \lambda(E) + \mu(E) \right.
  $$

  for every $E \in \mathcal{A}$.

- Let $\nu$ and $\kappa$ be finite *signed* measures on $(X,\mathcal{A})$ (i.e. $\nu(E),\kappa(E) \in {\mathbb{R}}$ for all $E \in \mathcal{A}$). Show that

  $$
  \left. |\nu + \kappa \middle| (E) \leq \middle| \nu \middle| (E) + \middle| \kappa \middle| (E) \right.
  $$

  for every $E \in \mathcal{A}$.

- Let $\mathcal{M}$ be the collection of finite signed measure $\nu$ on $(X,\mathcal{A})$. For $\nu \in \mathcal{M}$, define

  $$
  \left. \parallel \nu \parallel = \middle| \nu \middle| (X) \right.
  $$

  Prove that $\parallel \cdot \parallel$ is a norm on $\mathcal{M}$ with an appropriate definition of the sum of two signed measures and the multiplication of a signed measure by a (real) scalar.

- Suppose $(X,\mathcal{A}) = ({\mathbb{R}},\mathcal{B}({\mathbb{R}}))$. Compute $\parallel \delta_{x} - \delta_{y} \parallel$ for $x,y \in {\mathbb{R}}$.

*Remark*: the norm on $\mathcal{M}$ is called the *the total variation norm*.

> **Proof**
>
> **of (a):**\
> Recall in problem 2 we get:
>
> $$
> \nu^{+}(E) = \sup\left\{ {\nu(F):F \subset E,F \in \mathcal{A}} \right\},\quad\nu^{-}(E) = - \inf\left\{ {\nu(F):F \subset E,F \in \mathcal{A}} \right\}
> $$
>
> **Claim 1: $\nu^{+}(E) \leq \lambda(E)$.**\
> Let $F \subset E$, $F \in \mathcal{A}$. Then:
>
> $$
> \nu(F) = \lambda(F) - \mu(F) \leq \lambda(F) \leq \lambda(E)
> $$
>
> since $F \subset E$ and $\lambda$ is positive. Taking the sup over all such $F$, we get
>
> $$
> \nu^{+}(E) = \sup\limits_{F \subset E}\nu(F) \leq \lambda(E)
> $$
>
> **Claim 2: $\nu^{-}(E) \leq \mu(E)$.**\
> Similarly as Claim 1, for any $F \subset E$, since $\lambda$ and $\mu$ are p.m., we have
>
> $$
> \nu(F) = \lambda(F) - \mu(F) \geq - \mu(F) \geq - \mu(E)\Longrightarrow - \nu(F) \leq \mu(E)
> $$
>
> Taking the inf over $F \subset E$, we get
>
> $$
> \nu^{-}(E) = - \inf\limits_{F \subset E}\nu(F) \leq \mu(E)
> $$
>
> **Claim 3: $\left. |\nu \middle| (E) \leq \lambda(E) + \mu(E) \right.$.**\
> This is just combining the two ineqs:
>
> $$
> \left. |\nu \middle| (E) = \nu^{+}(E) + \nu^{-}(E) \leq \lambda(E) + \mu(E) \right.
> $$

> **Proof**
>
> **of (b):**\
> Let $E \in \mathcal{A}$. WTS: $\left. |\nu + \kappa \middle| (E) \leq \middle| \nu \middle| (E) + \middle| \kappa \middle| (E) \right.$.\
> Recall in problem 2 we showed that for a signed measure $\sigma$ and a measurable set $E$ , we have:
>
> $$
> \left. |\sigma \middle| (E) = \sup\left\{ \sum\limits_{i = 1}^{n} \middle| \ \sigma(E_{i})\  \middle| :E = \bigsqcup\limits_{i = 1}^{N}E_{i} \right\} \right.
> $$
>
> Let $\left\{ E_{i} \right\}_{i = 1}^{n}$ be any finite measurable partition of $E$. Then for each $E_{i}$:
>
> $$
> \left. |(\nu + \kappa)(E_{i}) \middle| = \middle| \nu(E_{i}) + \kappa(E_{i}) \middle| \leq \middle| \nu(E_{i}) \middle| + \middle| \kappa(E_{i}) \middle| \quad\text{(by tri ineq on}\ {\mathbb{R}}\ \text{)} \right.
> $$
>
> Summing over the partition, we have:
>
> $$
> \left. \sum\limits_{i = 1}^{n} \middle| (\nu + \kappa)(E_{i}) \middle| \leq \sum\limits_{i = 1}^{n} \middle| \nu(E_{i}) \middle| + \sum\limits_{i = 1}^{n} \middle| \kappa(E_{i})| \right.
> $$
>
> Now take the supremum over all such partitions of $E$:
>
> $$
> \begin{matrix}
> \left. |\nu + \kappa \middle| (E) \right. & {= \sup\left\{ \sum\limits_{i = 1}^{n} \middle| \ (\nu + \kappa)(E_{i})\  \middle| :E = \bigsqcup\limits_{i = 1}^{N}E_{i} \right\}} \\
>  & {\leq \sup\left\{ \sum\limits_{i = 1}^{n} \middle| \ \nu(E_{i})\  \middle| + \sum\limits_{i = 1}^{n} \middle| \ \kappa(E_{i})\  \middle| :E = \bigsqcup\limits_{i = 1}^{N}E_{i} \right\}} \\
>  & {\leq \sup\left\{ \sum\limits_{i = 1}^{n} \middle| \ \nu(E_{i})\  \middle| :E = \bigsqcup\limits_{i = 1}^{N}E_{i} \right\} + \sup\left\{ \sum\limits_{i = 1}^{n} \middle| \ \kappa(E_{i})\  \middle| :E = \bigsqcup\limits_{i = 1}^{N}E_{i} \right\}} \\
>  & \left. = \middle| \nu \middle| (E) + \middle| \kappa \middle| (E) \right.
> \end{matrix}
> $$
>
> Since measurable $E$ is arbitrary, this finishes the proof.

> **Proof**
>
> **of (c)**:
>
> $$
> \mathcal{M}: = \left\{ {\text{all finite signed measures on}(X,\mathcal{A})} \right\}
> $$
>
> and for $\nu \in \mathcal{M}$, we define:
>
> $$
> \left. \parallel \nu \parallel := \middle| \nu \middle| (X) \right.
> $$
>
> WTS: $\parallel \cdot \parallel$ is a norm on $\mathcal{M}$.\
>
> 1.  **Positive Definiteness**:\
>     Let $\nu \in \mathcal{M}$. Since $|\nu|$ is a positive measure, $\left. \parallel \nu \parallel = \middle| \nu \middle| (X) \geq 0 \right.$.\
>     Since $|\nu|$ is a positive measure, $\left. \parallel \nu \parallel = \middle| \nu \middle| (X) \geq 0 \right.$.\
>     Suppose $\left. |\nu \middle| (X) = 0 \right.$, then $X$ is a $|\nu|$-null set, so $\left. |\nu \middle| (E) = 0 \right.$ for all $E \in \mathcal{A}$. Thus $\nu = 0$.\
>     And suppose $\nu = 0$, then $\left. |\nu \middle| = 0 \right.$ also, so $\left. |\nu \middle| (X) = 0 \right.$.\
>     Thus, $\parallel \nu \parallel = 0$ iff $\nu = 0$. This finishes the proof of positive definiteness.
>
> 2.  **Absolute Homogeneity**:\
>     Since for any measurable set $E$:
>
>     $$
>     \begin{matrix}
>     \left. |a\nu \middle| (E) \right. & {= \sup\left\{ \sum\limits_{i = 1}^{n} \middle| \ (a\nu)(E_{i})\  \middle| :E = \bigsqcup\limits_{i = 1}^{N}E_{i} \right\}} \\
>      & {= \sup\left\{ \sum\limits_{i = 1}^{n} \middle| \ a\  \middle| \  \middle| \ \nu(E_{i})\  \middle| :E = \bigsqcup\limits_{i = 1}^{N}E_{i} \right\}} \\
>      & \left. = \middle| a \middle| \sup\left\{ \sum\limits_{i = 1}^{n} \middle| \ \nu(E_{i})\  \middle| :E = \bigsqcup\limits_{i = 1}^{N}E_{i} \right\} \right. \\
>      & \left. = \middle| a \middle| \cdot \middle| \nu \middle| (E) \right.
>     \end{matrix}
>     $$
>
>     We have:
>
>     $$
>     \left. \parallel a\nu \parallel = \middle| a\nu \middle| (X) = \middle| a \middle| \cdot \middle| \nu \middle| (X) = \middle| a \middle| \cdot \parallel \nu \parallel \right.
>     $$
>
>     finishing the proof of absolute homogeneity.
>
> 3.  **Triangle Inequality**:\
>     Recall we just proved in (b) that for any measurable $E$:
>
>     $$
>     \left. |\nu + \kappa \middle| (E) \leq \middle| \nu \middle| (E) + \middle| \kappa \middle| (E) \right.
>     $$
>
>     Thus
>
>     $$
>     \left. \parallel \nu + \kappa \parallel = \middle| \nu + \kappa \middle| (X) \leq \middle| \nu \middle| (X) + \middle| \kappa \middle| (X) = \parallel \nu \parallel + \parallel \kappa \parallel \right.
>     $$
>
>     finishing the proof of triangle inequality.\
>
> So we can conclude that $\left. \parallel \nu \parallel := \middle| \nu \middle| (X)\text{defines a norm on}\ \mathcal{M} \right.$, with the standard definitions of addition and scalar multiplication of signed measures.

> **Proof**
>
> **of (d)**\
> Suppose $(X,\mathcal{A}) = ({\mathbb{R}},\mathcal{B}({\mathbb{R}}))$. Compute $\parallel \delta_{x} - \delta_{y} \parallel$ for $x,y \in {\mathbb{R}}$.
>
> Recall def: For any Borel set $A \subset {\mathbb{R}}$,
>
> $$
> \delta_{x}(A) = \left\{ \begin{matrix}
> {1\ } & {\text{if}\ x \in A} \\
> {0\ } & \text{otherwise}
> \end{matrix} \right.
> $$
>
> So we define the signed measure $\nu := \delta_{x} - \delta_{y}$ as:
>
> $$
> \nu(A) = \delta_{x}(A) - \delta_{y}(A)
> $$
>
> If $x = y$, then $\delta_{x} = \delta_{y}$, then $\nu = 0$, so $\parallel \nu \parallel = 0$. This is the trivial case. if $x \neq y$: We first compute the Jordan decomposition.\
> We know that $\nu^{+}(E) = \sup\left\{ {\nu(F) \mid :F \in \mathcal{A},F \subset E} \right\}$, and $\nu^{-}(E) = - \inf\left\{ {\nu(F) \mid F \in \mathcal{A},F \subset E} \right\}$. For any $E \ni x$, we have
>
> $$
> \nu^{+}(E) = \nu(\left\{ x \right\}) = 1
> $$
>
> In other cases, we have:
>
> $$
> \nu^{+}(E) = \nu(E\backslash\left\{ y \right\}) = 0
> $$
>
> For any $E \ni y$, we have
>
> $$
> \nu^{-}(y) = - \nu(\left\{ y \right\}) = 1
> $$
>
> In other cases, we have:
>
> $$
> \nu^{-}(E) = - \nu(E\backslash\left\{ x \right\}) = 0
> $$
>
> And we thus discover that:
>
> $$
> \nu^{+} = \delta_{x},\quad\nu^{-} = \delta_{y}
> $$
>
> So
>
> $$
> \left. \parallel \nu \parallel = \middle| \nu \middle| ({\mathbb{R}}) = \delta_{x}({\mathbb{R}}) + \delta_{y}({\mathbb{R}}) = 1 + 1 = 2 \right.
> $$
>
> Thus we can conclude that
>
> $$
> \parallel \nu \parallel = \left\{ \begin{matrix}
> {2\ } & {\text{if}\ x \neq y} \\
> {0\ } & \text{otherwise}
> \end{matrix} \right.
> $$

## and more: finite signed measures on $(X,\mathcal{A})$ 组成一个 real Banach space

Prove that the normed vector space $\mathcal{M}$ in the previous problem is in fact a Banach space.

> **Proof**
>
> In problem 4 we have shown that on $(\mathcal{M}, \parallel \cdot \parallel )$ is a normed vector space, where
>
> $$
> \mathcal{M}: = \left\{ {\text{all finite signed measures on}(X,\mathcal{A})} \right\}
> $$
>
> and
>
> $$
> \left. \parallel \nu \parallel := \middle| \nu \middle| (X) \right.
> $$
>
> Now we prove that the NVM $(\mathcal{M}, \parallel \cdot \parallel )$ is complete, i.e. it is a Banach space.\
> Let $(\nu_{n})$ be a Cauchy sequence in $\mathcal{M}$. We have
>
> $$
> \left. |\nu_{n}(B) - \nu_{m}(B) \middle| = \middle| (\nu_{n} - \nu_{m})(B) \middle| \leq \parallel \nu_{n} - \nu_{m} \parallel \quad\text{for all}\ B \in \mathcal{A} \right.
> $$
>
> In particular, $(\nu_{n}(B))_{n}$ is a Cauchy sequence for all $B \in \mathcal{A}$. For each $B \in \mathcal{A}$, this is a Cauchy seq in $\mathbb{R}$, thus converges. So we can get:
>
> $$
> \nu(B) := \lim\limits_{n}\nu_{n}(B)
> $$
>
> as the pointwise limit (by a point we mean a set).\
> **Claim 1: $\nu \in \mathcal{M}$**.\
> Since for all $n$, $\nu_{n}(\varnothing) = 0$, we have:
>
> $$
> \nu(\varnothing) := \lim\limits_{n}\nu_{n}(\varnothing) = 0
> $$
>
> For a countable disjoint union of measurable sets $E = \bigsqcup_{i = 1}^{\infty}E_{i}$,
>
> $$
> \lim\limits_{n}\nu_{n}(E) = \lim\limits_{n}\sum\limits_{i}\nu_{n}(E_{i})
> $$
>
> is the limit of a finite sum of numerical sequences in $\mathbb{R}$. So we can exchange the order of taking limit and sum. Then we get:
>
> $$
> \nu(E) = \lim\limits_{n}\nu_{n}(E) = \lim\limits_{n}\sum\limits_{i}\nu_{n}(E_{i}) = \sum\limits_{i}\lim\limits_{n}\nu_{n}(E_{i}) = \sum\limits_{i}\nu(E_{i})
> $$
>
> And notice, for each measurable set $B \in \mathcal{A}$, **since $(\nu_{n}(B))_{n}$ is a Cauchy sequence in $\mathbb{R}$, it is bounded**, thus does not admit $\infty, - \infty$ values. verifying that $\nu$ **is a valid signed measure.**\
> Also, this means that taking Hahn Decomposition $X = P \sqcup N$ by $\nu$, we have
>
> $$
> \nu^{+}(X) = \nu(P),\quad\nu^{-}(X) = - \nu(N)
> $$
>
> Since $\nu(P),\nu(N)$ are bounded, we have: Thus
>
> $$
> \left. |\nu \middle| (X) = \nu^{+}(X) + \nu^{-}(X) < \infty \right.
> $$
>
> This verifies that $\nu$ is a finite s.m.\
> **Claim 2: $\nu_{n}\rightarrow\nu$ in $\parallel \cdot \parallel$.** Fix $\varepsilon > 0$. There exists $N$ such that $\parallel \nu_{n} - \nu_{m} \parallel < \varepsilon/2$ for all $m,n \geq N$. Thus for all $n \geq N$ we have:
>
> $$
> \left. |(\nu_{n} - \nu)(B) \middle| = \lim\limits_{m} \middle| (\nu_{n} - \nu_{m})(B) \middle| \leq \varepsilon/2,\quad\forall B \in \mathcal{A},\ \forall n \geq N \right.
> $$
>
> Notice that
>
> $$
> \nu^{+}(B) = \sup\left\{ {\nu(C) \mid C \in \mathcal{A},\ C \subset B} \right\}\quad
> $$
>
> and
>
> $$
> \nu^{-}(B) = - \inf\left\{ {\nu(C) \mid C \in \mathcal{A},\ C \subset B} \right\} = \sup\left\{ {- \nu(C) \mid C \in \mathcal{A},\ C \subset B} \right\}
> $$
>
> It follows that
>
> $$
> (\nu_{n} - \nu)^{+}(X) = \sup\left\{ {(\nu_{n} - \nu)(B) \mid B \in \mathcal{A}} \right\} \leq \varepsilon/2,\quad\forall n \geq N
> $$
>
> Similarly,
>
> $$
> (\nu_{n} - \nu)^{-}(X) = \sup\left\{ {- (\nu_{n} - \nu)(B) \mid B \in \mathcal{A}} \right\} \leq \varepsilon/2,\quad\forall n \geq N
> $$
>
> Thus
>
> $$
> \left. |\nu_{n} - \nu \middle| (X) = (\nu_{n} - \nu)^{+}(X) + (\nu_{n} - \nu)^{-}(X) \leq \varepsilon \right.
> $$
>
> This holds for all $n \geq N$. And since $\varepsilon > 0$ is arbitrary, this proves that
>
> $$
> \lim\limits_{n\rightarrow\infty} \parallel \nu_{n} - \nu \parallel = 0
> $$
>
> As a result, $\nu_{n}\rightarrow\nu$ in $\parallel \cdot \parallel$, completeing the proof.

*Nur für Verrückte*

(It's **really** not necessary to attempt these problems. Do not, under any circumstances, hand them in!) Does there exist a signed Borel measure $\nu$ on $\mathbb{R}$ with the property that for every $\alpha \in {\mathbb{R}}$ there exists a Borel set $E \subset {\mathbb{R}}$ with $\nu(E) = \alpha$.

