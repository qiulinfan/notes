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
source: "notes/math/mathematical-analysis/chapters/02-functions-countability-and-metric-spaces.typ"
subtitle: Single-variable analysis --- migrated working notes
title: Mathematical Analysis
---
# Functions, countability, and metric spaces

## Archimedean facts and metric spaces

源页问 一个 field 既 algebraically closed 又 geometrically closed''。 答案是 $\text{ℂ}$：both algebraically and geometrically closed (topologically)''； 但 $\text{ℂ}$ 不是 ordered field。作业旁注是 impossible to define linear order on $\text{ℂ}$''。尽管 $\mathbb{R}$ 的 completeness axiom 用 order 表述，后面会从 Cauchy sequences 得到一个不依赖 order 的版本。

> **Theorem: Useful supremum test**
>
> Let $A \subseteq \mathbb{R}$ and $l \in \mathbb{R}$. Then $l = \sup A$ if and only if $l$ is an upper bound of $A$ and, for every $\varepsilon > 0$, there exists $a \in A$ with $l - \varepsilon < a \leq l$.

The Chinese explanation is: "只要下移一点点，就会超进去". For a set bounded below, if $L$ is its set of lower bounds, then $\inf A = \sup L$; equivalently, $\inf A = - \sup\left( {- A} \right)$.

> **Theorem: Copies of $\mathbb{N}$, $\mathbb{Z}$, and $\mathbb{Q}$**
>
> Every ordered field $F$ contains copies of $\mathbb{N}$, $\mathbb{Z}$, and $\mathbb{Q}$: $1_{F}$, $2_{F} = 1_{F} + 1_{F}$, and so on give $\mathbb{N}$; additive inverses give $\mathbb{Z}$; and $\frac{p_{F}}{q_{F}}$ gives $\mathbb{Q}$.

> **Theorem: Archimedean properties**
>
> In an Archimedean ordered field $F$:
>
> - for every $x \in F$, there is $n \in \mathbb{N}$ with $x < n$;
> - for every $x > 0$ in $F$, there is $n \in \mathbb{N}$ with $\frac{1}{n} < x$;
> - for every $x \in F$, there is $n \in \mathbb{Z}$ with $n - 1 \leq x \leq n$;
> - equivalently, for $x,y > 0$ in $F$, there is $n \in \mathbb{N}$ with $ny > x$.

这些 characterizations 给出 $\mathbb{Q}$ 的 density：

$\forall x < y \in F,\exists r \in \mathbb{Q}:x < r < y.$

取 $n$ 使 $n\left( {y - x} \right) > 2$，再取 $m \in \mathbb{Z}$ 使 $nx < m < ny$，于是 $x < \frac{m}{n} < y$。所以任意两个 reals 之间有 infinitely many rational points。 源页还写 $\mathbb{R} \smallsetminus \mathbb{Q}$ is also dense in $\mathbb{R}$ (hw)''。

> **Theorem: $\mathbb{R}$ is Archimedean**
>
> $\mathbb{R}$ is an Archimedean ordered field.

若 $\mathbb{N}$ 有 upper bound，令 $s = \sup\mathbb{N}$。则 $s - 1$ 不是 upper bound，故某个 $n \in \mathbb{N}$ 满足 $s - 1 < n$。于是 $s < n + 1$，但 $n + 1 \in \mathbb{N}$，矛盾。源页给出 $\mathbb{R}(x)$（rational functions）和 $p$-adic fields $\mathbb{Q}_{p}$ 作为 non-Archimedean examples，并写道： "there is a consistent and rigorous way to do calculus with infinitesimals (non-standard analysis)".

> **Definition: Absolute value**
>
> For $a,b \in \mathbb{R}$, $- |a| \leq a \leq |a|$, $|a| = \sqrt{a^{2}}$, $\left| {ab} \right| = |a||b|$, and $\left| {a + b} \right| \leq |a| + |b|$. Consequently $\left| {|a| - |b|} \right| \leq \left| {a - b} \right|$.

The proof of the triangle inequality squares both sides: $\left( {a + b} \right)^{2} \leq a^{2} + 2|a||b| + b^{2} = \left( {|a| + |b|} \right)^{2}$. The extended form is $\left| {\sum_{i = 1}^{n}a_{i}} \right| \leq \sum_{i = 1}^{n}\left| a_{i} \right|$.

> **Definition: Metric and metric space**
>
> A metric on $X$ is a map $d:X \times X\rightarrow\mathbb{R}$ such that, for all $a,b,c \in X$:
>
> - $d\left( {a,b} \right) \geq 0$, with equality if and only if $a = b$;
> - $d\left( {a,b} \right) = d\left( {b,a} \right)$; and
> - $d\left( {a,c} \right) \leq d\left( {a,b} \right) + d\left( {b,c} \right)$.
>
> The pair $\left( {X,d} \right)$ is a metric space.

> **Theorem: Euclidean metric**
>
> For every $k \in \mathbb{N}$, $\mathbb{R}^{k}$ is a metric space under $d\left( {\begin{pmatrix}
> x
> \end{pmatrix},\begin{pmatrix}
> y
> \end{pmatrix}} \right) = \left\| {\begin{pmatrix}
> x
> \end{pmatrix} - \begin{pmatrix}
> y
> \end{pmatrix}} \right\|$, where $\begin{pmatrix}
> x
> \end{pmatrix} \cdot \begin{pmatrix}
> y
> \end{pmatrix} = \sum_{i = 1}^{k}x_{i}y_{i}$ and $\left\| \begin{pmatrix}
> x
> \end{pmatrix} \right\| = \sqrt{\begin{pmatrix}
> x
> \end{pmatrix} \cdot \begin{pmatrix}
> x
> \end{pmatrix}}$.

Cauchy--Schwarz, $\left| {\begin{pmatrix}
x
\end{pmatrix} \cdot \begin{pmatrix}
y
\end{pmatrix}} \right| \leq \left\| \begin{pmatrix}
x
\end{pmatrix} \right\|\left\| \begin{pmatrix}
y
\end{pmatrix} \right\|$, follows by expanding $\left\| {\lambda\begin{pmatrix}
x
\end{pmatrix} - \begin{pmatrix}
y
\end{pmatrix}} \right\|^{2} \geq 0$ and taking $\lambda = \frac{\begin{pmatrix}
x
\end{pmatrix} \cdot \begin{pmatrix}
y
\end{pmatrix}}{\left\| \begin{pmatrix}
x
\end{pmatrix} \right\|^{2}}$ when $\begin{pmatrix}
x
\end{pmatrix} \neq 0$. The metric triangle inequality then follows from $\begin{pmatrix}
x
\end{pmatrix} - \begin{pmatrix}
y
\end{pmatrix} = \left( {\begin{pmatrix}
x
\end{pmatrix} - \begin{pmatrix}
z
\end{pmatrix}} \right) + \left( {\begin{pmatrix}
z
\end{pmatrix} - \begin{pmatrix}
y
\end{pmatrix}} \right)$.

## Functions

The lecture begins with

$\left\lbrack {a,b} \right\rbrack = \bigcap_{n \in \ \mathbb{N}}\left( {a - \frac{1}{n},b + \frac{1}{n}} \right)$

and

$\left( {a,b} \right) = \bigcup_{n \in \ \mathbb{N}}\left\lbrack {a + \frac{1}{n},b - \frac{1}{n}} \right\rbrack$.

It records $\inf\left( {A \cup B} \right) = \min\left( {\inf A,\inf B} \right)$, $\sup\left( {A \cup B} \right) = \max\left( {\sup A,\sup B} \right)$, $\sup\left( {cA} \right) = c\sup A$ for $c > 0$, $\sup\left( {- A} \right) = - \inf A$, and $\sup\left( {A + B} \right) = \sup A + \sup B$. The warning is $\sup\left( {AB} \right) \neq \sup A\sup B$ in general.

> **Definition: Function, domain, codomain, image**
>
> 一个 function $f:X\rightarrow Y$ 是 $f \subseteq X \times Y$ 的 subset，且对每个 $x \in X$，恰有一个 $y \in Y$ 满足 $\left( {x,y} \right) \in f$。 Write $\text{dom}(f) = X$, $\text{cod}(f) = Y$, and $\operatorname{im}(f) = \text{ran}(f) = \left\{ {f(x):x \in X} \right\} \subseteq Y$.
>
> For $A \subseteq X$ and $B \subseteq Y$, $f\lbrack A\rbrack = \left\{ {f(a) \in Y:a \in A} \right\}$ and $f^{- 1}\lbrack B\rbrack = \left\{ {x \in X:f(x) \in B} \right\}$.

源页 examples 为 $x\mapsto x^{2}$ on $\mathbb{R}$、$x\mapsto\frac{1}{x}$ on $\mathbb{R} \smallsetminus \left\{ 0 \right\}$、the supremum function from $\mathcal{P}\left( \mathbb{R} \right)$ to $\mathbb{R} \cup \left\{ {+ \infty, - \infty} \right\}$, the harmonic function $n\mapsto\frac{1}{n}$, and Dirichlet's function $D(x) = 1$ for $x \in \mathbb{Q}$ and $D(x) = 0$ for $x \in \mathbb{R} \smallsetminus \mathbb{Q}$.

The handout "More Joy of Sets" retains its English terminology: "map" and "mapping" are synonyms for function; domain/source and codomain/target space are $\text{dom}(f)$ and $\text{cod}(f)$; an input variable is independent and an output variable dependent. The pointwise notation is $x\mapsto f(x)$.

For image and inverse image:

- $f\left\lbrack {f^{- 1}\lbrack C\rbrack} \right\rbrack \subseteq C$ and $f^{- 1}\left\lbrack {f\lbrack A\rbrack} \right\rbrack \supseteq A$;
- $f\left\lbrack {A \cup B} \right\rbrack = f\lbrack A\rbrack \cup f\lbrack B\rbrack$;
- $f\left\lbrack {A \cap B} \right\rbrack \subseteq f\lbrack A\rbrack \cap f\lbrack B\rbrack$;
- $f\left\lbrack {A \smallsetminus B} \right\rbrack \supseteq f\lbrack A\rbrack \smallsetminus f\lbrack B\rbrack$;
- inverse images preserve union, intersection, and difference exactly.

The identity is $\operatorname{id}_{X}:X\rightarrow X$, $\operatorname{id}_{X{(x)}} = x$. Composition is $\left( {g \circ f} \right)(x) = g\left( {f(x)} \right)$ and is associative.

> **Definition: Inverse, injection, surjection, bijection**
>
> An inverse of $f:X\rightarrow Y$ is $g:Y\rightarrow X$ with $g \circ f = \operatorname{id}_{X}$ and $f \circ g = \operatorname{id}_{Y}$. A function is injective if $x \neq x'$ implies $f(x) \neq f\left( x' \right)$, surjective if each $y \in Y$ has a preimage, and bijective if it is both.

> **Theorem: Invertibility criterion**
>
> A function is invertible if and only if it is bijective.

If $f:X\rightarrow Y$ and $g:Y\rightarrow Z$, composition preserves injectivity, surjectivity, and bijectivity; if $g \circ f$ is injective, $f$ is injective, and if it is surjective, $g$ is surjective. The source's graph remark is that horizontal lines meet an injective real graph at most once and a surjective one at least once.

The restriction of $f:X\rightarrow Y$ to $A \subseteq X$ is the map $A\rightarrow Y$ which agrees with $f$ on $A$. Thus $x\mapsto x^{2}$ on $\mathbb{R}$ is neither injective nor surjective, its restriction to $\left\lbrack {0,\infty} \right)$ is injective, and $\left\lbrack {0,\infty} \right)\rightarrow\left\lbrack {0,\infty} \right)$, $x\mapsto x^{2}$, is bijective.

list 记住 order 和 repetition： $\left( {N,A,S,A} \right) \neq \left( {N,A,S} \right)$ and $\left( {N,A,S} \right) \neq \left( {N,S,A} \right)$. An $n$-tuple is $\left( {x_{1},\ldots,x_{n}} \right)$. The Cartesian product is $X \times Y = \left\{ {\left( {x,y} \right):x \in X\ \text{and}\ y \in Y} \right\}$, while $\mathbb{R}^{n}$ is both a Cartesian product and a vector space. The graph is $\text{graph}(f) = \left\{ {\left( {x,y} \right) \in X \times Y:f(x) = y} \right\}$, and the rigorous ordered-pair encoding is $\left( {x,y} \right) = \left\{ {\left\{ x \right\},\left\{ {x,y} \right\}} \right\}$.

## Cardinality and countability

> **Definition: Cardinality and countability**
>
> $X$ is finite if $\left. |X \middle| = n \right.$ for some $n \in \mathbb{N}$, and infinite if an injection $\mathbb{N}\rightarrow X$ exists. Write $X \leq Y$ for an injection $X\rightarrow Y$, and $X \approx Y$ for a bijection.
>
> $X$ is countably infinite if $X \approx \mathbb{N}$; it is countable if $X \leq \mathbb{N}$.

The example $\mathbb{N} \approx \mathbb{Z}$ maps an odd $n$ to $\frac{n - 1}{2}$ and an even $n$ to $- \frac{n}{2}$; it is bijective.

> **Theorem: Cantor--Schröder--Bernstein**
>
> If $X \leq Y$ and $Y \leq X$, then $X \approx Y$.

> **Theorem: Cantor diagonal arguments**
>
> $\mathbb{Q}$ is countable, $\mathbb{R}$ is uncountable, and every set $X$ satisfies $\left. |\mathcal{P}(X) \middle| > \middle| X| \right.$.

Rationals are diagonally enumerated as pairs $\left( {m,n} \right) \in \mathbb{Z} \times \mathbb{Z}$, $n \neq 0$. If $f:\mathbb{N}\rightarrow\left\lbrack {0,1} \right\rbrack$ were surjective, choose decimal $0.d_{1}d_{2}\ldots$ whose $n$th digit differs from the $n$th digit of $f(n)$; it is not in the range. More generally, for $f:X\rightarrow\mathcal{P}(X)$, $D = \left\{ {x \in X:x \notin f(x)} \right\}$ cannot equal $f\left( x_{0} \right)$ for any $x_{0}$. The page notes $\text{ℂ} \approx \mathbb{R}^{2}$ and calls the assertion that no cardinality lies strictly between $\mathbb{N}$ and $\mathbb{R}$ the continuum hypothesis.

> **Theorem: Countable products and unions**
>
> If $A_{1},\ldots,A_{n}$ are countable, then $A_{1} \times \ldots \times A_{n}$ is countable. If $I$ is countable and every $A_{i}$ is countable, then $\bigcup_{i \in I}A_{i}$ is countable.

For the product, injections $f_{i}:A_{i}\rightarrow\mathbb{N}$ yield

$f\left( {a_{1},\ldots,a_{n}} \right) = \prod_{i = 1}^{n}p_{i}^{f_{i{(a_{i})}}},$

an injection by unique prime factorization. For the union, take a surjection $f:\mathbb{N}\rightarrow I$, surjections $f_{n}:\mathbb{N}\rightarrow A_{f{(n)}}$, and a surjection $h:\mathbb{N}\rightarrow\mathbb{N} \times \mathbb{N}$ with $h(n) = \left( {n_{1},n_{2}} \right)$; then $g(n) = f_{n_{1}}\left( n_{2} \right)$ is surjective onto the union.

最后，$\left( {a,b} \right)$ 包含 uncountably many irrational numbers：若其 irrational part countable，与 $\left( {a,b} \right) \cap \mathbb{Q}$ 的 union 会使 $\left( {a,b} \right)$ countable。手写结论为 $\bar{\mathbb{Q}}$ is countable，so there are uncountably many transcendental numbers。

## Page-complete lecture record

### L03--Archimedean-property&Metric-Space, p. 1

The review first says $\bar{\mathbb{Q}}$ is algebraically closed and $\mathbb{R}$ is geometrically closed, but $\bar{\mathbb{Q}} \neq \mathbb{R}$ and $\mathbb{R} \neq \bar{\mathbb{Q}}$. The written question is "can we find a both-closed field?" Answer: yes, $\text{ℂ}$; "$\text{ℂ}$ is both algebraically and geometrically closed (topologically)". However, "$\text{ℂ}$ is not an ordered field" and the homework is "impossible to define linear order on $\text{ℂ}$". The note asks how $\text{ℂ}$ can be geometrically complete if the completeness axiom for $\mathbb{R}$ is based on order; answer: define an order-free axiom with Cauchy sequences (next week).

The dual completeness statement is written and proved twice:

$A \subseteq \mathbb{R},A \neq \varnothing,A\ \text{bounded below}\Rightarrow\exists\inf A \in \mathbb{R}.$

First let $L$ be the set of all lower bounds of $A$; completeness gives $\sup L \in \mathbb{R}$, and the goal is $\sup L = \inf A$. Second define $- A = \left\{ {- a:a \in A} \right\}$; then $- A \neq \varnothing$ and, since $A$ is bounded below, $- A$ is bounded above, and $\inf A = - \sup\left( {- A} \right)$.

The useful supremum fact is stated as

$l = \sup A\Rightarrow l\ \text{is a UB of}\ A\ \text{and}\ \left( {\forall\varepsilon > 0} \right)\left( {\exists a \in A} \right)\left( {l - \varepsilon < a \leq l} \right).$

The source's number-line schematic is equivalently rendered by

and its Chinese explanation is "只要下移一点点，就会超进去". It also records the "wrong" Newton/Leibniz definition $\varepsilon > 0$ is infinitesimal exactly when $\left( {\forall n \in \mathbb{N}} \right)\varepsilon \leq \frac{1}{n}$, then asks "这边 infinitesimal 吗?" The answer depends on the definition of $\mathbb{R}$; according to axioms 1--15, "NO!", and the present proof uses the Archimedean property of $\mathbb{R}$.

For every ordered field $F$, the page constructs its copies of $\mathbb{N},\mathbb{Z},\mathbb{Q}$: $1_{F}$, $2_{F} = 1_{F} + 1_{F}$, $3_{F} = 1_{F} + 1_{F} + 1_{F},\ldots$; then $0_{F} - 1_{F}, - 2_{F} = 0_{F} - 1_{F} - 1_{F},\ldots$; and finally $\left( \frac{p}{q} \right)_{F} = \frac{p_{F}}{q_{F}}$. The Archimedean properties are listed exactly as

$\forall x \in F,\exists n \in \mathbb{N}:x < n;$

$\forall x > 0 \in F,\exists n \in \mathbb{N}:\frac{1}{n} < x;$

$\forall x \in F,\exists n \in \mathbb{Z}:n - 1 \leq x < n;$

$\forall x,y > 0 \in F,\exists n \in \mathbb{N}:ny > x.$

### L03--Archimedean-property&Metric-Space, p. 2

The page observes that (4) implies (1) by taking $y = 1$, while (1) implies (4): given $x,y > 0$, choose $n > \frac{x}{y}$. It states density in the mixed wording "$\mathbb{Q}$ 在 $F$ 中稠密性：$\forall x < y \in F,\exists r \in \mathbb{Q}$ s.t. $x < r < y$". The complete working is

$x < y\Rightarrow y - x > 0;$ choose $n \in \mathbb{N}$ with $n\left( {y - x} \right) > 2$; by the integer property choose $m \in \mathbb{Z}$ with $nx < m < ny$; hence $x < \frac{m}{n} < y$.

The native number-line schematic on the sheet has the rational point between the endpoints:

The conclusion is "there are infinitely many rational pts between $x,y$"; also "$\mathbb{R} \smallsetminus \mathbb{Q}$ is also dense in $\mathbb{R}$ (hw)". It contrasts $\mathbb{R}$ and $\mathbb{Q}$ as Archimedean with non-Archimedean ordered fields, giving $\mathbb{R}(x)$ (all real functions) and $p$-adic fields $\mathbb{Q}_{p}$. The full proof of "$\mathbb{R}$ is an Archimedean ordered field" is: suppose $\exists x \in \mathbb{R}$ such that no $n \in \mathbb{N}$ has $x < n$. Then $x$ is a UB of $\mathbb{N}$, so $\sup\mathbb{N} \in \mathbb{R}$. Since $\sup\mathbb{N} - 1$ is not a UB, some $n \in \mathbb{N}$ satisfies $\sup\mathbb{N} - 1 < n$, hence $\sup\mathbb{N} < n + 1$, contradicting $n + 1 \in \mathbb{N}$. The source then says, "尽管 infinitesimal 在 real line 上不存在, there is a consistent and rigorous way to do calculus with infinitesimals (non-standard analysis)."

The absolute-value list is

$\left. - \middle| a \middle| \leq a \leq \middle| a \middle| ,\quad \middle| a \middle| = \sqrt{a^{2}},\quad \middle| ab \middle| = \middle| a\| b \middle| , \right.$

$\left. |a + b \middle| \leq \middle| a \middle| + \middle| b \middle| ,\quad \middle| a - b \middle| \geq \| a \middle| - \middle| b\|. \right.$

For the triangle inequality it writes

$\left. |a + b \middle| {}_{2} = \left( {a + b} \right)^{2} = a^{2} + 2ab + b^{2} \leq a^{2} + 2 \middle| a\| b \middle| + b^{2} = \left( |a \middle| + \middle| b| \right)^{2}, \right.$

then $\left. |a + b \middle| \leq \middle| a \middle| + \middle| b| \right.$. The extension is

$\left. \forall a_{1},\ldots,a_{n} \in \mathbb{R},\quad \middle| \sum_{i = 1}^{n}a_{i} \middle| \leq \sum_{i = 1}^{n} \middle| a_{i} \middle| . \right.$

A metric is a function $d:X \times X\rightarrow\mathbb{R}$ with (i) $d\left( {a,b} \right) \geq 0$ and $d\left( {a,b} \right) = 0\Rightarrow a = b$, (ii) $d\left( {a,b} \right) = d\left( {b,a} \right)$, and (iii) $d\left( {a,c} \right) \leq d\left( {a,b} \right) + d\left( {b,c} \right)$. If it satisfies the triangular property, $d$ is a metric and $X$ is a metric space; hence absolute value makes $\mathbb{R}$ a metric space.

### L03--Archimedean-property&Metric-Space, p. 3

For $k \in \mathbb{N}$, the source writes

$\mathbb{R}^{k} = \left\{ {\begin{pmatrix}
x
\end{pmatrix} = \left( {x_{1},x_{2},\ldots,x_{k}} \right):x_{i} \in \mathbb{R},1 \leq i \leq k} \right\},$

$\begin{pmatrix}
x
\end{pmatrix} \cdot \begin{pmatrix}
y
\end{pmatrix} = \sum_{i = 1}^{k}x_{i}y_{i},\quad\left\| \begin{pmatrix}
x
\end{pmatrix} \right\| = \sqrt{\begin{pmatrix}
x
\end{pmatrix} \cdot \begin{pmatrix}
x
\end{pmatrix}},$

and $d\left( {\begin{pmatrix}
x
\end{pmatrix},\begin{pmatrix}
y
\end{pmatrix}} \right) = \left\| {\begin{pmatrix}
x
\end{pmatrix} - \begin{pmatrix}
y
\end{pmatrix}} \right\|$. The proofs of positivity and symmetry are explicitly $\sqrt{\sum_{i = 1}^{{k{({x_{i} - y_{i}})}}^{2}}} > 0$ if $\begin{pmatrix}
x
\end{pmatrix} \neq \begin{pmatrix}
y
\end{pmatrix}$ (and $= 0$ exactly when equal), and $\sqrt{\sum_{i = 1}^{{k{({x_{i} - y_{i}})}}^{2}}} = \sqrt{\sum_{i = 1}^{{k{({y_{i} - x_{i}})}}^{2}}}$.

For Cauchy--Schwarz, $\left( {\lambda\begin{pmatrix}
x
\end{pmatrix} - \begin{pmatrix}
y
\end{pmatrix}} \right)^{2} \geq 0$ gives

$\lambda^{2}\left\| \begin{pmatrix}
x
\end{pmatrix} \right\|^{2} - 2\lambda\begin{pmatrix}
x
\end{pmatrix} \cdot \begin{pmatrix}
y
\end{pmatrix} + \left\| \begin{pmatrix}
y
\end{pmatrix} \right\|^{2} \geq 0.$

Take $\lambda = \frac{\begin{pmatrix}
x
\end{pmatrix} \cdot \begin{pmatrix}
y
\end{pmatrix}}{\left\| \begin{pmatrix}
x
\end{pmatrix} \right\|^{2}}$ when $\begin{pmatrix}
x
\end{pmatrix} \neq 0$, giving

$\frac{\left( {\begin{pmatrix}
x
\end{pmatrix} \cdot \begin{pmatrix}
y
\end{pmatrix}} \right)^{2}}{\left\| \begin{pmatrix}
x
\end{pmatrix} \right\|^{2}} \leq \left\| \begin{pmatrix}
y
\end{pmatrix} \right\|^{2},$

hence $\left\| \begin{pmatrix}
x
\end{pmatrix} \right\|\left\| \begin{pmatrix}
y
\end{pmatrix} \right\| \geq \begin{pmatrix}
x
\end{pmatrix} \cdot \begin{pmatrix}
y
\end{pmatrix}$. For the triangle inequality, let $\begin{pmatrix}
a
\end{pmatrix} = \begin{pmatrix}
x
\end{pmatrix} - \begin{pmatrix}
y
\end{pmatrix}$, $\begin{pmatrix}
b
\end{pmatrix} = \begin{pmatrix}
x
\end{pmatrix} - \begin{pmatrix}
z
\end{pmatrix}$, $\begin{pmatrix}
c
\end{pmatrix} = \begin{pmatrix}
z
\end{pmatrix} - \begin{pmatrix}
y
\end{pmatrix}$, so $\begin{pmatrix}
a
\end{pmatrix} = \begin{pmatrix}
b
\end{pmatrix} + \begin{pmatrix}
c
\end{pmatrix}$; then

$\left( {\left\| \begin{pmatrix}
b
\end{pmatrix} \right\| + \left\| \begin{pmatrix}
c
\end{pmatrix} \right\|} \right)^{2} = \left\| \begin{pmatrix}
b
\end{pmatrix} \right\|^{2} + 2\left\| \begin{pmatrix}
b
\end{pmatrix} \right\|\left\| \begin{pmatrix}
c
\end{pmatrix} \right\| + \left\| \begin{pmatrix}
c
\end{pmatrix} \right\|^{2}$

$\geq \left\| \begin{pmatrix}
b
\end{pmatrix} \right\|^{2} + 2\begin{pmatrix}
b
\end{pmatrix} \cdot \begin{pmatrix}
c
\end{pmatrix} + \left\| \begin{pmatrix}
c
\end{pmatrix} \right\|^{2} = \left\| {\begin{pmatrix}
b
\end{pmatrix} + \begin{pmatrix}
c
\end{pmatrix}} \right\|^{2} = \left\| {\begin{pmatrix}
x
\end{pmatrix} - \begin{pmatrix}
y
\end{pmatrix}} \right\|^{2}.$

### L04(1)--Function&Countability, pp. 1--3

The review uses the two native interval relationships

$\left\lbrack {a,b} \right\rbrack = \bigcap_{n \in \ \mathbb{N}}\left( {a - \frac{1}{n},b + \frac{1}{n}} \right),\quad\left( {a,b} \right) = \bigcup_{n \in \ \mathbb{N}}\left\lbrack {a + \frac{1}{n},b - \frac{1}{n}} \right\rbrack$

and the Archimedean test: in any ordered field, $\left( \forall\varepsilon > 0, \middle| a - b \middle| < \varepsilon \right)\Rightarrow a = b$; in an Archimedean ordered field it suffices that $\left( \forall n \in \mathbb{N}, \middle| a - b \middle| < \frac{1}{n} \right)\Rightarrow a = b$. It then lists $\inf A \leq \sup A$, $\inf\left( {A \cup B} \right) = \min\left( {\inf A,\inf B} \right)$, $\sup\left( {A \cup B} \right) = \max\left( {\sup A,\sup B} \right)$, $\sup\left( {cA} \right) = c\sup A$ for $c > 0$, $\sup\left( {- A} \right) = - \inf A$, $\sup\left( {A + B} \right) = \sup A + \sup B$, and $\sup\left( {AB} \right) \neq \sup(A)\sup(B)$.

The "blobs and arrows" function diagram is rebuilt natively:

Its exact definition is $f:X\rightarrow Y$, $f \subseteq X \times Y$, and $\left( {\forall x \in X} \right)\left( {\exists!y \in Y} \right)$ such that $\left( {x,y} \right) \in f$; it calls $X = \text{dom}(f)$, $Y = \text{cod}(f)$, and $\operatorname{im}(f) = \text{ran}(f) = \left\{ {f(x):x \in X} \right\} \subseteq \text{cod}(f)$. It gives $f\lbrack A\rbrack = \left\{ {f(x) \in \text{cod}(f):x \in A} \right\}$ and $f^{- 1}\lbrack B\rbrack = \left\{ {x \in \text{dom}(f):f(x) \in B} \right\}$. The explicit examples are the squaring function, reciprocal function $\mathbb{R} \smallsetminus \left\{ 0 \right\}\rightarrow\mathbb{R} \smallsetminus \left\{ 0 \right\}$, supremum function $\mathcal{P}\left( \mathbb{R} \right)\rightarrow\mathbb{R} \cup \left\{ {+ \infty, - \infty} \right\}$, harmonic function $\mathbb{N}\rightarrow\mathbb{R}$, $h(n) = \frac{1}{n}$, and Dirichlet's function $D(x) = 0$ for $x \in \mathbb{R} \smallsetminus \mathbb{Q}$, $D(x) = 1$ for $x \in \mathbb{Q}$.

Its two-level function sketch is retained natively:

For cardinality, "finite" means $\exists n \in \mathbb{N}$ such that $X$ has $n$ elements, denoted $\left. |X \middle| = n \right.$; "infinite" means an injection $\mathbb{N}\rightarrow X$. $X \leq Y$ means an injection and $X \approx Y$ a bijection. The homework remark is $X \leq Y$ iff there is an injection $X\rightarrow Y$, not merely a surjection $Y\rightarrow X$. The $\mathbb{N} \approx \mathbb{Z}$ bijection is $f(n) = \frac{n - 1}{2}$ for odd $n$ and $f(n) = \frac{n}{2}$ for even $n$, with table $1\mapsto 0$, $2\mapsto 1$, $3\mapsto - 1$, $4\mapsto 2$, $5\mapsto - 2$, $6\mapsto 3$, dots. "Countably infinite" means $X \approx \mathbb{N}$; "countable" means $X \leq \mathbb{N}$, equivalently a surjection $\mathbb{N}\rightarrow X$.

The lattice diagram for $\mathbb{Q}$ is retained natively. View $\frac{m}{n}$ as $\left( {m,n} \right) \in \mathbb{Z} \times \mathbb{Z}$, $n \neq 0$, and enumerate the lattice by increasingly large finite squares, omitting repetitions; this yields a surjection $\mathbb{N}\rightarrow\mathbb{Q}$. Cantor's proof writes any proposed $f:\mathbb{N}\rightarrow\left\lbrack {0,1} \right\rbrack$ as $f(n) = 0.n_{1}n_{2}n_{3}\ldots$, chooses $x = 0.d_{1}d_{2}d_{3}\ldots$ with $d_{n} \neq n$th digit of $f(n)$, and concludes $x \neq f(n)$ for every $n$, so $\left\lbrack {0,1} \right\rbrack$ and $\mathbb{R}$ are uncountable.

The power-set proof defines, for $f:X\rightarrow\mathcal{P}(X)$,

$D = \left\{ {x \in X:x \notin f(x)} \right\} \in \mathcal{P}(X).$

If $D = f\left( x_{0} \right)$, then $x_{0} \in D$ iff $x_{0} \notin D$, a contradiction. The page then asks whether there are cardinalities larger than $\mathbb{R}$ and answers $\text{ℂ} \approx \mathbb{R}^{2}$ (though $\text{ℂ} \neq \mathbb{R}$); whether there are cardinalities strictly between $\mathbb{N}$ and $\mathbb{R}$ remains unknown, and the assertion that there are none is the continuum hypothesis. The final theorem says finite products of countable sets are countable and, for countable $I$, a family $\left\{ {A_{i}:i \in I} \right\}$ of countable sets has countable union; the final application is that $\left( {a,b} \right)$ has uncountably many irrationals and $\bar{\mathbb{Q}}$ is countable, hence there are uncountably many transcendental numbers.

### L04(2)--Handout--Function, pp. 1--4

"More Joy of Sets" says it continues the basic-set-theory summary from "The Joy of Sets", with special emphasis on FUNCTIONS. It explains that a function from $X$ to $Y$ assigns each $x \in X$ a unique $y \in Y$; $f:X\rightarrow Y$ is read "$f$ maps $X$ to $Y$". Map/mapping are synonyms for function; $X$ is domain/source and $Y$ codomain/target space. The pointwise arrow is $x\mapsto f(x)$; a rule's input variable is independent and output variable dependent. A footnote says $(x)f$ might have been better notation for a left-to-right reader, but mathematical convention writes $f(x)$.

The image is $\operatorname{im}(f) = \left\{ {f(x):x \in X} \right\}$; for subsets, $f\lbrack A\rbrack = \left\{ {f(a) \in Y:a \in A} \right\}$ and $f^{- 1}\lbrack B\rbrack = \left\{ {x \in X:f(x) \in B} \right\}$. The complete displayed list is

$f\left\lbrack {f^{- 1}\lbrack C\rbrack} \right\rbrack \subseteq C;\quad f^{- 1}\left\lbrack {f\lbrack A\rbrack} \right\rbrack \supseteq A;$

$f\left\lbrack {A \cup B} \right\rbrack = f\lbrack A\rbrack \cup f\lbrack B\rbrack;\quad f\left\lbrack {A \cap B} \right\rbrack \subseteq f\lbrack A\rbrack \cap f\lbrack B\rbrack;$

$f\left\lbrack {A \smallsetminus B} \right\rbrack \supseteq f\lbrack A\rbrack \smallsetminus f\lbrack B\rbrack;$

$f^{- 1}\left\lbrack {C \cup D} \right\rbrack = f^{- 1}\lbrack C\rbrack \cup f^{- 1}\lbrack D\rbrack;$

$f^{- 1}\left\lbrack {C \cap D} \right\rbrack = f^{- 1}\lbrack C\rbrack \cap f^{- 1}\lbrack D\rbrack;\quad f^{- 1}\left\lbrack {C \smallsetminus D} \right\rbrack = f^{- 1}\lbrack C\rbrack \smallsetminus f^{- 1}\lbrack D\rbrack.$

The identity example is $\operatorname{id}_{X}:X\rightarrow X$, $\operatorname{id}_{X{(x)}} = x$. It gives the power-set example $\mathcal{P}:V\rightarrow V$, $\mathcal{P}(X) = \left\{ {Y:Y \subseteq X} \right\}$, then composition: if $f:X\rightarrow Y$, $g:Y\rightarrow Z$, $\left( {g \circ f} \right)(x) = g\left( {f(x)} \right)$, and $h\mathring{g\circ f} = \left( {h \circ g} \right) \circ f$. Composition is read backwards: "$g \circ f$ means first apply $f$, then apply $g$".

An inverse $g:Y\rightarrow X$ satisfies $g \circ f = \operatorname{id}_{X}$ and $f \circ g = \operatorname{id}_{Y}$; if it exists it is unique and is denoted $f^{- 1}$. Definitions are injective ($x \neq x'$ implies $f(x) \neq f\left( x' \right)$), surjective ($\left( {\forall y \in Y} \right)\left( {\exists x \in X} \right)y = f(x)$), and bijective (both); the theorem is "for any function $f$, $f$ is invertible iff $f$ is bijective". The sheet adds: equal functions require the same domain and codomain; $f$ restricted to $A \subseteq X$ is $g:A\rightarrow Y$, $g(x) = f(x)$, written $\left. f \middle| A \right.$ or $\text{res}_{A}f$; a function $X\rightarrow\operatorname{im}(f)$ with the same rule is surjective. For real graphs, injective means every horizontal line meets at most once; surjective means every horizontal line meets at least once. The squaring function example and its $\left\lbrack {0,\infty} \right)$ restriction have the same statements as above.

A list is a finite ordered set: $\left( {N,A,S,A} \right) \neq \left( {N,A,S} \right)$ and $\left( {N,A,S} \right) \neq \left( {N,S,A} \right)$; order and repetition matter. A list of length $n$ is $L = \left( {x_{1},\ldots,x_{n}} \right) = \left( {x_{k}:1 \leq k \leq n} \right)$; equal lists have the same length and entries in the same order. A sequence is an infinite ordered set ordered like $\mathbb{N}$. Cartesian products are

$X \times Y = \left\{ {\left( {x,y} \right):x \in X\ \text{and}\ y \in Y} \right\},$

$X_{1} \times \ldots \times X_{n} = \left\{ {\left( {x_{1},\ldots,x_{n}} \right):x_{k} \in X_{k}\ \text{for each}1 \leq k \leq n} \right\},$

with $\mathbb{R}^{2} = \mathbb{R} \times \mathbb{R} = \left\{ {\left( {a,b} \right):a,b \in \mathbb{R}} \right\}$ and generally $\mathbb{R}^{n}$ the set of $n$-tuples. It gives $\text{graph}\left( \exp \right) = \left\{ {\left( {x,y} \right) \in \mathbb{R}^{2}:e^{x} = y} \right\}$ and the familiar increasing exponential sketch through $\left( {0,1} \right)$; generally $\text{graph}(f) = \left\{ {\left( {x,y} \right) \in X \times Y:f(x) = y} \right\}$. The rigorous definition is then repeated: a function is its graph, and $\left( {x,y} \right) = \left\{ {\left\{ x \right\},\left\{ {x,y} \right\}} \right\}$; this has $\left( {a,b} \right) = \left( {c,d} \right)\Rightarrow a = c$ and $b = d$.

### L04(3)--Handout--Countability, pp. 1--2

The Cantor--Schröder--Bernstein proof is reproduced in full. Given injective $f:X\rightarrow Y$ and $g:Y\rightarrow X$, define $\varphi:\mathcal{P}(X)\rightarrow\mathcal{P}(X)$ by

$\varphi(A) = X \smallsetminus \left( {g\left\lbrack {Y \smallsetminus f\lbrack A\rbrack} \right\rbrack} \right).$

Put $A_{0} = \varnothing$, $A_{n + 1} = \varphi\left( A_{n} \right)$, and $A = \bigcup_{n}A_{n}$. Define

$h(x) = f(x)$ for $x \in A$, while $h(x) = g^{- 1}(x)$ for $x \in X \smallsetminus A$.

Using De Morgan and preservation of unions/intersections by forward images of injective functions,

$\varphi(A) = X \smallsetminus g\left\lbrack {Y \smallsetminus f\left\lbrack {\bigcup_{n}A_{n}} \right\rbrack} \right\rbrack$

$= X \smallsetminus g\lbrack\bigcap_{n{({Y \smallsetminus f{\lbrack A_{n}\rbrack}})}} = \bigcup_{n{({X \smallsetminus g{\lbrack{Y \smallsetminus f{\lbrack A_{n}\rbrack}}\rbrack}})}}$

$= \bigcup_{n}\varphi\left( A_{n} \right) = \bigcup_{n}A_{n + 1} = A.$

Thus $X \smallsetminus A = g\left\lbrack {Y \smallsetminus f\lbrack A\rbrack} \right\rbrack$, which makes $h$ bijective.

For countable products, injections $f_{i}:A_{i}\rightarrow\mathbb{N}$ produce

$f\left( {a_{1},\ldots,a_{n}} \right) = \prod_{i = 1}^{n}p_{i}^{f_{i{(a_{i})}}},$

where $p_{i}$ is the $i$th prime; FTA makes it injective. For countable unions, take a surjection $f:\mathbb{N}\rightarrow I$, for each $n$ a surjection $f_{n}:\mathbb{N}\rightarrow A_{f{(n)}}$, and a surjection $h:\mathbb{N}\rightarrow\mathbb{N} \times \mathbb{N}$, $h(n) = \left( {n_{1},n_{2}} \right)$. Then $g(n) = f_{n_{1}}\left( n_{2} \right)$ is surjective onto $\bigcup_{i \in I}A_{i}$.

