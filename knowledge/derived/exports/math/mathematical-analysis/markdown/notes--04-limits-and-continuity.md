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
source: "notes/math/mathematical-analysis/chapters/04-limits-and-continuity.typ"
subtitle: Single-variable analysis --- migrated working notes
title: Mathematical Analysis
---
# Limits and continuity

## Limit points and limits of functions

> **Definition: Limit point, closure, isolated and discrete sets**
>
> Let $A \subseteq \mathbb{R}$ and $c \in \mathbb{R}$. Then $c$ is a limit point of $A$ if for every $\varepsilon > 0$ there exists $x \in A$ with $0 < \left| {x - c} \right| < \varepsilon$. Equivalently, every open neighborhood of $c$ meets $A \smallsetminus \left\{ c \right\}$.
>
> Write $A'$ for the set of limit points and $\text{cl}(A) = A \cup A'$ for the closure. A point of $A \smallsetminus A'$ is isolated; a set is discrete when $A = A \smallsetminus A'$.

中文批注说，在 topology 中也能给出这个定义，但"还是等价的". 每个 limit point 都是某个 subsequence 的 limit；若 $A = \left\{ {a_{n}:n \in \mathbb{N}} \right\}$，则其 limit points 来自 $\left( a_{n} \right)$ 的 subsequential limits，但 reverse inclusion 不必成立。Examples：

- $\mathbb{N}$ has no limit point in $\mathbb{R}$;
- every real number is a limit point of $\mathbb{Q}$;
- $\left( {\left\{ 0 \right\} \cup \left( {1,2} \right) \cup \left( {2,3} \right)} \right)' = \left\lbrack {1,3} \right\rbrack$.

源页写 $\text{cl}(A)$ 是 closed，并且是包含 $A$ 的 smallest closed set。

> **Definition: Limit of a function**
>
> Let $A \subseteq \mathbb{R}$, $f:A\rightarrow\mathbb{R}$, and let $c$ be a limit point of $A$. We say $\lim_{x\rightarrow c}f(x) = l$ if for every $\varepsilon > 0$ there is $\delta > 0$ such that $\left| {f(x) - l} \right| < \varepsilon$ whenever $x \in A$ and $0 < \left| {x - c} \right| < \delta$.

中文解释把它和 sequences 比较：$n\rightarrow\infty$ 控制 index，而这里 $x\rightarrow c$ 由 distance $\delta$ 控制。此 definition 不要求 $c \in A$，并且即使 $f(c)$ 有定义， 其 value 也不起作用。

> **Theorem: Sequential criterion for a function limit**
>
> $\lim_{x\rightarrow c}f(x) = l$ if and only if every sequence $\left( a_{n} \right)$ in $A \smallsetminus \left\{ c \right\}$ with $a_{n}\rightarrow c$ satisfies $f\left( a_{n} \right)\rightarrow l$.

The source uses its contrapositive to show that if some $\left( a_{n} \right)$ approaches $c$ but $f\left( a_{n} \right)$ does not approach $l$, then the limit is not $l$; if one approaching sequence has divergent values, or two have different image limits, the function limit does not exist.

> **Definition: Infinite and one-sided function limits**
>
> $\lim_{x\rightarrow c}f(x) = + \infty$ means that for every $M > 0$ there is $\delta > 0$ such that $f(x) > M$ whenever $x \in \text{dom}(f)$ and $0 < \left| {x - c} \right| < \delta$. Definitions at $+ \infty$ and $- \infty$ are analogous.
>
> If $c$ is a limit point of $\text{dom}(f) \cap \left( {c, + \infty} \right)$, then $\lim_{x\rightarrow c^{+}}f(x) = l$ means the same estimate with $0 < x - c < \delta$. The left-hand limit is defined dually.

源页说有五种 function limits：$c,c^{+},c^{-}, + \infty, - \infty$。其 examples 包括 $\lim_{x\rightarrow 0}\frac{|x|}{x}$ does not exist and $\lim_{x\rightarrow 0}\frac{1}{x}$ does not exist.

> **Theorem: Function-limit laws**
>
> If $\lim_{x\rightarrow c}f(x)$ and $\lim_{x\rightarrow c}g(x)$ exist, then for $k \in \mathbb{R}$:
>
> - $\lim_{x\rightarrow c}kf(x) = k\lim_{x\rightarrow c}f(x)$;
> - $\lim_{x\rightarrow c}\left( {f(x) + g(x)} \right) = \lim f + \lim g$;
> - $\lim_{x\rightarrow c}f(x)g(x) = \left( {\lim f} \right)\left( {\lim g} \right)$; and
> - $\lim_{x\rightarrow c}\frac{f(x)}{g(x)} = \frac{\lim f}{\lim g}$ when $\lim g(x) \neq 0$.

Function limits are unique. If $f(x) \leq g(x)$ in a deleted neighborhood of $c$ and both limits exist, then $\lim f \leq \lim g$. The squeeze theorem says that $f(x) \leq g(x) \leq h(x)$ there and $\lim f = \lim h = l$ imply $\lim g = l$. The examples are

$\lim_{x\rightarrow 0}\frac{\sin(x)}{x} = 1$,

$\lim_{x\rightarrow 0}x\sin\left( \frac{1}{x} \right) = 0$, and

$\lim_{x\rightarrow 0}\sin\left( \frac{1}{x} \right)$ does not exist.

The last page annotation explains that $\frac{x^{2}}{x - 2}$, and every rational function in particular, is continuous at every point of its domain.

## Alternative formulations and continuity

sequence test 再次强调：$a_{n}\rightarrow c$ 不表示 every sequence of domain points 都 tends to $c$；test limit 要取 $\text{dom}(f) \smallsetminus \left\{ c \right\}$ 中 approaching $c$ 的 sequences。源页也给出如下 open-neighborhood formulation。

> **Definition: Function limit in terms of open sets**
>
> Let $A \subseteq \mathbb{R}$, $f:A\rightarrow\mathbb{R}$, and $c,l \in \mathbb{R} \cup \left\{ {+ \infty, - \infty} \right\}$, with $c \in A'$. Then $\lim_{x\rightarrow c}f(x) = l$ if every open neighborhood $V$ of $l$ contains $f\left\lbrack {\left( {A \cap U} \right) \smallsetminus \left\{ c \right\}} \right\rbrack$ for some open neighborhood $U$ of $c$.

The source convention is that if $A$ is bounded above/below, then $+ \frac{\infty}{-}\infty \in A'$; open neighborhoods of $+ \infty$ are $\left( {a, + \infty} \right)$ and of $- \infty$ are $\left( {- \infty,a} \right)$.

> **Theorem: One-sided and ordinary limits**
>
> $\lim_{x\rightarrow c}f(x) = l$ if and only if both $\lim_{x\rightarrow c^{-}}f(x) = l$ and $\lim_{x\rightarrow c^{+}}f(x) = l$, provided $c$ is a limit point from both sides.

> **Theorem: Equivalent zero formulations**
>
> For a finite limit, the following are equivalent: $\lim_{x\rightarrow c}f(x) = l$, $\lim_{x\rightarrow c}\left( {f(x) - l} \right) = 0$, $\lim_{x\rightarrow c}\left| {f(x) - l} \right| = 0$, and $\lim_{x\rightarrow c}f(x) = l$ after replacing $f$ by $\left| {f - l} \right|$.

> **Definition: Continuity**
>
> Let $A \subseteq \mathbb{R}$, $f:A\rightarrow\mathbb{R}$, and $a \in A$. Then $f$ is continuous at $a$ if, for every $\varepsilon > 0$, there exists $\delta > 0$ such that $\left| {f(x) - f(a)} \right| < \varepsilon$ whenever $x \in \text{dom}(f)$ and $\left| {x - a} \right| < \delta$.

手写 distinction 很重要：limit at $c$ 需要 $c \in \left( {\text{dom}\ f} \right)'$，却不需要 $c \in \text{dom}\ f$；continuity at $a$ 需要 $a \in \text{dom}\ f$，却不需要 $a$ 是 limit point。 Accordingly, every function is continuous at an isolated point of its domain.

> **Theorem: Continuity criteria**
>
> For $a \in A$, the following are equivalent:
>
> - $f$ is continuous at $a$;
> - either $a$ is isolated in $A$, or $\lim_{x\rightarrow a}f(x) = f(a)$;
> - for every sequence $\left( a_{n} \right)$ in $A$ with $a_{n}\rightarrow a$, one has $f\left( a_{n} \right)\rightarrow f(a)$;
> - for every open neighborhood $V$ of $f(a)$, there is an open neighborhood $U$ of $a$ with $f\left\lbrack {A \cap U} \right\rbrack \subseteq V$.

The source lists rational functions (especially polynomials), power functions $x^{p}$ on $x > 0$, exponential functions, logarithms, trig/inverse trig functions, and $|x|$ as continuous on their natural domains.

> **Definition: Continuous on a set and topological continuity**
>
> $f$ is continuous on $B \subseteq \text{dom}(f)$ when it is continuous at every $b \in B$; it is a continuous function when this holds on all of $\text{dom}(f)$. More generally, $f:X\rightarrow Y$ between metric/topological spaces is continuous if $f^{- 1}\lbrack V\rbrack$ is open in $X$ for every open $V \subseteq Y$.

源页给出 $x^{2}$ 在 $2$ ctn 的 direct epsilon--delta proof，取 $\delta = \min\left( {1,\frac{\varepsilon}{5}} \right)$；在一般 $a$ 取 $\delta = \min\left( {1,\frac{\varepsilon}{2|a| + 1}} \right)$。 又用 $\left| {|x| - |a|} \right| \leq \left| {x - a} \right|$ 证明 $|x|$ everywhere ctn，旁注为： "here $\delta$ depend on $\varepsilon$ but not $a$".

It also notes that

$g(x) = \sin\left( \frac{1}{x} \right)$ for $x \neq 0$, while $g(0) = 0$

is continuous everywhere except at $0$, whereas

$h(x) = x\sin\left( \frac{1}{x} \right)$ for $x \neq 0$, while $h(0) = 0$

is continuous everywhere by squeeze. Dirichlet's function is discontinuous everywhere. Thomae's function

$T\left( \frac{m}{n} \right) = \frac{1}{n}$ for a rational $\frac{m}{n}$ in lowest terms, and $T(x) = 0$ for $x \in \mathbb{R} \smallsetminus \mathbb{Q}$

is continuous at every irrational and is a source of the questions "是否存在 $f:\mathbb{R}\rightarrow\mathbb{R}$ 使 $f$ ctn at $x$ iff $x \in \mathbb{Q}$?" and "is $T$ diffable anywhere?".

> **Definition: Discontinuities**
>
> $f$ is discontinuous at $a \in \text{dom}(f)$ if it is not continuous there. If both one-sided limits exist but differ, $f$ has a jump discontinuity; if $\lim_{x\rightarrow a}f(x)$ exists but differs from $f(a)$, it has a removable discontinuity; if a one-sided limit fails to exist by oscillation, it has an essential discontinuity; and if a one-sided limit is infinite, it has an infinite discontinuity.

The examples are $\frac{|x|}{x}$ for a jump, the function $1$ off $0$ and $0$ at $0$ for a removable discontinuity, $\sin\left( \frac{1}{x} \right)$ for essential/oscillating discontinuity, and $\frac{1}{x}$ (with a chosen value at $0$) for infinite discontinuity.

## Closure properties and uniform continuity

> **Theorem: Closure properties of continuous functions**
>
> If $f,g$ are continuous at $a$, then $f + g$, $f - g$, $fg$, $\frac{f}{g}$ where defined, and $cf$ for $c \in \mathbb{R}$ are continuous at $a$.

The domains recorded on the page are $A \cap B$ for $f + g$, $f - g$, and $fg$, and $\left\{ {x \in A \cap B:g(x) \neq 0} \right\}$ for $\frac{f}{g}$.

> **Theorem: Composition**
>
> If $f:A\rightarrow\mathbb{R}$ is continuous at $a$ and $g:B\rightarrow\mathbb{R}$ is continuous at $f(a) \in B$, then $g \circ f$ is continuous at $a$ and $\lim_{x\rightarrow a}g\left( {f(x)} \right) = g\left( {\lim_{x\rightarrow a}f(x)} \right)$.

源页明确说此 theorem 也有 variants，把 limit at $a$ 全部替换为 limit at $a^{+}$、$a^{-}$、$+ \infty$ 或 $- \infty$。Examples 是 $\lim_{x\rightarrow 0^{+}}\arctan\left( \frac{1}{x} \right) = \frac{\pi}{2}$ and $\lim_{\theta\rightarrow\frac{\pi}{2^{-}}}e^{- \tan\theta} = 0$.

Further source examples retain their proof choices:

- $x^{2}$ at $2$: $\left| {x^{2} - 4} \right| = \left| {x - 2} \right|\left| {x + 2} \right|$, choose $\delta = \min\left( {1,\frac{\varepsilon}{5}} \right)$;
- $|x|$: choose $\delta = \varepsilon$;
- $x^{2}$ at any $a$: choose $\delta = \min\left( {1,\frac{\varepsilon}{2|a| + 1}} \right)$;
- $x^{2}$ has a "longest $\delta$" at $a = 2$ of $\sqrt{4 + \varepsilon} - 2$;
- $x^{2}$ is uniformly continuous on $\left\lbrack {- c,c} \right\rbrack$ with $\delta = \frac{\varepsilon}{2c}$;
- $x\sin\left( \frac{1}{x} \right)$ with value $0$ at $0$ is continuous everywhere;
- $D$ is discontinuous everywhere; and
- $f(x) = x$ for $x \in \mathbb{Q}$, $f(x) = 0$ for $x \in \mathbb{R} \smallsetminus \mathbb{Q}$ is continuous at $0$ but discontinuous everywhere else.

> **Definition: Uniform continuity**
>
> Let $B \subseteq A \subseteq \mathbb{R}$ and $f:A\rightarrow\mathbb{R}$. Then $f$ is uniformly continuous on $B$ if, for every $\varepsilon > 0$, there is $\delta > 0$ such that for all $x,y \in B$, $\left| {x - y} \right| < \delta$ implies $\left| {f(x) - f(y)} \right| < \varepsilon$.

The source's quantifier comparison is retained: ordinary continuity has "for every point $a$" before the choice of $\delta$; uniform continuity chooses one $\delta$ for all points. 中文解释为：对任意 $\varepsilon$，总有一个距离 $\delta$ 使得在 $B$ 上距离足够近 的点，其 image 的距离也足够近；"uniformly ctn 的要求比 ctn 更严格".

> **Theorem: Basic uniform-continuity facts**
>
> Uniform continuity on $B$ implies continuity on $B$. A restriction of a uniformly continuous function is uniformly continuous.

The examples are $x\mapsto cx$ (choose $\delta = \frac{\varepsilon}{|c|}$), $x^{2}$ not uniformly continuous on $\mathbb{R}$ (take $\varepsilon = 1$ and a large $a = \frac{2}{\delta}$), and $x^{2}$ uniformly continuous on $\left\lbrack {- c,c} \right\rbrack$. The source observes that $\frac{1}{x}$ is uniformly continuous on $\left\lbrack {1,\infty} \right)$ but not on $\left( {0,1} \right\rbrack$ nor on $\left\lbrack {a,\infty} \right)$ for $a > 0$.

> **Theorem: Heine--Cantor**
>
> If $A \subseteq \mathbb{R}$ is closed and bounded (compact) and $f:A\rightarrow\mathbb{R}$ is continuous, then $f$ is uniformly continuous on $A$.

proof 假设 not uniformly continuous，固定 $\varepsilon > 0$，构造 $x_{n},y_{n} \in A$ 使 $\left| {x_{n} - y_{n}} \right| < \frac{1}{n}$ 但 $\left| {f\left( x_{n} \right) - f\left( y_{n} \right)} \right| \geq \varepsilon$。Bolzano--Weierstrass 给出 convergent subsequences $x_{n_{k}}\rightarrow l_{1}$、$y_{n_{k}}\rightarrow l_{2}$；distance condition 给出 $l_{1} = l_{2}$。closedness 保证 $l_{1} \in A$，continuity 使两条 image subsequences 都趋于 $f\left( l_{1} \right)$，矛盾。

The Chinese discussion explains why both hypotheses matter: $x^{2}$ on $\mathbb{R}$ is continuous and its domain closed but unbounded, so not uniformly continuous; $\sin\left( \frac{1}{x} \right)$ on $\left\lbrack {- 5,0} \right) \cup \left( {0,4} \right\rbrack$ is continuous on a bounded but nonclosed set and is not uniformly continuous. Positive examples are $\sqrt{x}$ on $\left\lbrack {0,1} \right\rbrack$, $\sin\left( \frac{1}{x} \right)$ on $\left\lbrack {a,b} \right\rbrack$ for $0 < a < b$, and $x\sin\left( \frac{1}{x} \right)$ with value $0$ at zero on $\left\lbrack {0,1} \right\rbrack$.

> **Theorem: Uniform continuity preserves Cauchy sequences**
>
> If $f:A\rightarrow\mathbb{R}$ is uniformly continuous and $\left( a_{n} \right)$ is Cauchy in $A$, then $\left( {f\left( a_{n} \right)} \right)$ is Cauchy.

The page's counterexample is $f(x) = \frac{1}{x}$ on $x > 0$: $\left( \frac{1}{n} \right)$ is Cauchy but $(n)$ is not, so $f$ is not uniformly continuous on any set containing $\left\{ {\frac{1}{n}:n \in \mathbb{N}} \right\}$.

> **Theorem: Extension criterion**
>
> Let $A \subseteq \mathbb{R}$ be bounded and $f:A\rightarrow\mathbb{R}$. Then $f$ is uniformly continuous if and only if there is a continuous $g:\text{cl}(A)\rightarrow\mathbb{R}$ whose restriction to $A$ equals $f$.

For the forward direction, if $a \in \text{cl}(A) \smallsetminus A$ and $a_{n} \in A$ tends to $a$, define $g(a) = \lim f\left( a_{n} \right)$; uniform continuity makes $\left( {f\left( a_{n} \right)} \right)$ Cauchy and the definition independent of the approximating sequence.

## Extreme and intermediate values

> **Theorem: Extreme Value Theorem**
>
> If nonempty $A \subseteq \mathbb{R}$ is closed and bounded and $f:A\rightarrow\mathbb{R}$ is continuous, then $f$ is bounded and there are $x_{0},y_{0} \in A$ such that $f\left( x_{0} \right) \leq f(x) \leq f\left( y_{0} \right)$ for every $x \in A$.

The proof sets $M = \sup\left\{ {f(x):x \in A} \right\}$. Choose $\left( x_{n} \right)$ in $A$ with $f\left( x_{n} \right)\rightarrow M$, take a convergent subsequence, use closedness to retain its limit $y_{0} \in A$, and use continuity to obtain $M = f\left( y_{0} \right)$. The notes summarize: "closed + bounded $A$ + ctn $f$，那么 extreme value 一定存在".

> **Theorem: Intermediate Value Theorem**
>
> If $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ is continuous and $l$ lies between $f(a)$ and $f(b)$, then some $c \in \left\lbrack {a,b} \right\rbrack$ satisfies $f(c) = l$.

Assume $f(a) < l < f(b)$ and set $S = \left\{ {x \in \left\lbrack {a,b} \right\rbrack:f(x) \leq l} \right\}$. Then $S$ is nonempty and bounded above; for $c = \sup S$, continuity and sequences approaching $c$ from both sides give $f(c) = l$. The source's Chinese explanation is that a continuous curve on an interval must "覆盖了 $\left\lbrack {f(a),f(b)} \right\rbrack$ 中的所有值".

The application is the fixed-point theorem: if $f:\left\lbrack {0,1} \right\rbrack\rightarrow\left\lbrack {0,1} \right\rbrack$ is continuous, then some $x_{0} \in \left\lbrack {0,1} \right\rbrack$ has $f\left( x_{0} \right) = x_{0}$. When the endpoint signs do not immediately give this, take $g(x) = x - f(x)$ and apply IVT.

> **Theorem: Continuous image of an interval**
>
> If $I \subseteq \mathbb{R}$ is an interval and $f:I\rightarrow\mathbb{R}$ is continuous, then $f\lbrack I\rbrack$ is an interval.

For $y_{1} < y_{2} \in f\lbrack I\rbrack$, choose preimages $x_{1},x_{2} \in I$ and apply IVT on the subinterval between them. If $I$ is a closed bounded interval, EVT gives $f\lbrack I\rbrack = \left\lbrack {m,M} \right\rbrack$, so the image is again a closed bounded interval.

## Page-complete proof and diagram ledger

### L09--Limit-of-Functions-I, pp. 1--3

The visible lecture framing is "Ch4 limit of functions", $A \subseteq \mathbb{R}$, $f:A\rightarrow\mathbb{R}$, with three equivalent styles: epsilon/delta, sequences, and open sets. A limit point is exactly $\left. \forall\varepsilon > 0,\exists x \in A:0 < \middle| x - c \middle| < \varepsilon \right.$, equivalently every open neighborhood meets $A \smallsetminus \left\{ c \right\}$. The sheet writes that a sequence's limit points are subsequential limits but the reverse can fail (constant-sequence example); it gives $\mathbb{N}$ no limit point, all reals as limit points of $\mathbb{Q}$, and $\left( {\left\{ 0 \right\} \cup \left( {1,2} \right) \cup \left( {2,3} \right)} \right)' = \left\lbrack {1,3} \right\rbrack$. It defines $\text{cl}(A) = A \cup A'$, isolated $a \in A \smallsetminus A'$, and discrete $A = A \smallsetminus A'$.

The three graph examples $x + 2$, $\frac{x^{2} - 4}{x - 2}$, and the latter assigned zero at $2$ have the same limit $4$ at $2$. The sequential proof forward combines $\left. |a_{n} - c \middle| < \delta \right.$ with the epsilon condition; backwards selects $a_{n} \in A$ with $\left. 0 < \middle| a_{n} - c \middle| < \frac{1}{n} \right.$ and $\left. |f\left( a_{n} \right) - l \middle| \geq \varepsilon \right.$. It explicitly records the diagnostics: one approaching sequence with images not tending to $l$ disproves $l$; divergent images prove DNE; two image limits that differ prove DNE.

The one-sided definition restricts $0 < x - c < \delta$, requiring $c$ a limit point from that side. The displayed examples are $|x\frac{|}{x}$ and $\frac{1}{x}$ DNE at zero. The sheet says there are five kinds of limits: $c,c^{+},c^{-}, + \infty, - \infty$. The limit laws include scalar, sum, product, quotient, order and squeeze. Its calculations are $\cos x \leq \sin\frac{x}{x} \leq 1$ near $0$, $\left. - \middle| x \middle| \leq x\sin\left( \frac{1}{x} \right) \leq \middle| x| \right.$, and $a_{n} = \frac{2}{n\pi}\rightarrow 0$ while $\sin\left( \frac{1}{a_{n}} \right)$ diverges.

### L10(1)--Limit-of-Functions-II, pp. 1--2

The sequence review graph distinguishes a sequence approaching $1$ with image limits $2$ and $0$ (so no limit) from a curve with a separately assigned isolated value at $1$ (nearby limit $2$). The open-neighborhood definition is

$\lim_{x\rightarrow c}f(x) = l\Rightarrow\forall\ \text{open nbh}\ V\ \text{of}l,\exists\ \text{open nbh}U\ \text{of}c:f\left\lbrack {\left( {A \cap U} \right) \smallsetminus \left\{ c \right\}} \right\rbrack \subseteq V.$

The convention gives $+ \infty, - \infty \in A'$ for bounded-above/below sets and neighborhoods $\left( {a, + \infty} \right)$, $\left( {- \infty,a} \right)$. The ordinary limit is equivalent to both matching one-sided limits; the proof takes $\delta = \min\left( {\delta_{1},\delta_{2}} \right)$. The finite zero forms are $\lim f = l$, $\lim\left( {f - l} \right) = 0$, and $\left. \lim \middle| f - l \middle| = 0 \right.$.

### L10(2)--Continuity-I, pp. 1--2

The source contrasts a limit at $c$ (requires $c \in \left( {\text{dom}\ f} \right)'$, not $c \in \text{dom}\ f$) with continuity at $a$ (requires $a \in \text{dom}\ f$, not a limit point). Thus every isolated domain point is continuous. Its four criteria are: continuity; isolated or limit $f(a)$; sequence criterion; and the open neighborhood inverse-image inclusion.

Visible epsilon proofs are $\left. |x^{2} - 4 \middle| \leq 5 \middle| x - 2| \right.$ with $\delta = \min\left( {1,\frac{\varepsilon}{5}} \right)$; $\left. |x^{2} - a^{2} \middle| \leq \middle| x - a \middle| \left( 2 \middle| a \middle| + 1 \right) \right.$ with $\delta = \min\left( {1,\frac{\varepsilon}{\left. 2 \middle| a \middle| + 1 \right.}} \right)$; and $\left. \| x \middle| - \middle| a\| \leq \middle| x - a| \right.$ with $\delta = \varepsilon$. It asks for the longest delta at $2$, recording $\sqrt{4 + \varepsilon} - 2$. The diagrams classify jump $|x\frac{|}{x}$, removable $1$ off zero and $0$ at zero, essential $\sin\left( \frac{1}{x} \right)$, and infinite $\frac{1}{x}$ with a zero value. It proves $x\sin\left( \frac{1}{x} \right)$ continuous at zero by $\left. - \middle| x \middle| \leq x\sin\left( \frac{1}{x} \right) \leq \middle| x| \right.$, says Dirichlet is discontinuous everywhere, and states the continuity properties of the rational/irrational indicator and Thomae's function exactly as in the source.

### L11(1)--Continuity-II, pp. 1--2

The closure-property domain ledger is: $\text{dom}\left( {f + g} \right) = \text{dom}\left( {f - g} \right) = \text{dom}\left( {fg} \right) = A \cap B$, $\text{dom}\left( \frac{f}{g} \right) = \left\{ {x \in A \cap B:g(x) \neq 0} \right\}$. The proof uses sequence continuity. For composition, $f:A\rightarrow\mathbb{R}$, $g:B\rightarrow\mathbb{R}$, $f(a) \in B$ gives $\lim_{x\rightarrow a}g\left( {f(x)} \right) = g\left( {\lim_{x\rightarrow a}f(x)} \right)$; the source's variants replace $a$ throughout by $a^{+},a^{-}, + \infty, - \infty$. Examples are $\lim_{x\rightarrow 0^{+}}\arctan\left( \frac{1}{x} \right) = \frac{\pi}{2}$ and $\lim_{\theta\rightarrow\frac{\pi}{2^{-}}}e^{- \tan\theta} = 0$. The topology proof uses $\left( {g \circ f} \right)^{- 1}\lbrack V\rbrack = f^{- 1}\left\lbrack {g^{- 1}\lbrack V\rbrack} \right\rbrack$.

### L11(2)--Uniform-Continuity, pp. 1--3

The quantifier contrast is $\forall a,\forall\varepsilon,\exists\delta$ for ordinary continuity versus $\forall\varepsilon,\exists\delta,\forall x,y$ for uniform continuity; the page states the latter delta does not depend on the position of $x,y$. Uniform continuity implies continuity and restrictions remain uniform. Examples: $cx$ uses $\delta = \frac{\varepsilon}{|}c|$; $x^{2}$ on $\mathbb{R}$ fails by taking epsilon $1$, $a = \frac{1}{\delta}$, and comparing $a,a + \frac{\delta}{2}$; $x^{2}$ on $\left\lbrack {- c,c} \right\rbrack$ uses $\delta = \frac{\varepsilon}{2c}$; $\frac{1}{x}$ is uniform on $\left\lbrack {1,\infty} \right)$ but not on $\left( {0,1} \right\rbrack$ or $\left\lbrack {a,\infty} \right)$ for $a > 0$.

Heine--Cantor's contradiction creates $\left. |x_{n} - y_{n} \middle| < \frac{1}{n} \right.$, $\left. |f\left( x_{n} \right) - f\left( y_{n} \right) \middle| \geq \varepsilon \right.$, takes convergent subsequences, uses equal limits from the distance condition, closedness to retain the limit in $A$, and continuity for the contradiction. It lists the source counterexamples $x^{2}$ on $\mathbb{R}$ and $\sin\left( \frac{1}{x} \right)$ on $\left\lbrack {- 5,0} \right) \cup \left( {0,4} \right\rbrack$, plus positive examples $\sqrt{x}$, $\sin\left( \frac{1}{x} \right)$ away from zero, and $x\sin\left( \frac{1}{x} \right)$ on $\left\lbrack {0,1} \right\rbrack$.

The Cauchy theorem follows by applying uniform delta to the Cauchy tail. For $\frac{1}{x}$, $\left( \frac{1}{n} \right)$ is Cauchy but $(n)$ is not, so no uniform continuity on a set containing $\left\{ {\frac{1}{n}:n \in \mathbb{N}} \right\}$. The extension theorem for bounded $A$ defines, for $a \in \text{cl}(A) \smallsetminus A$, $g(a) = \lim f\left( a_{n} \right)$ for any $a_{n} \in A$ tending to $a$; uniform continuity makes this well-defined. The reverse direction uses compact $\text{cl}(A)$ and Heine--Cantor.

### L12--EVT&IVT, pp. 1--2

EVT proves a maximum by $M = \sup\left\{ {f(x):x \in A} \right\}$, a sequence $f\left( x_{n} \right)\rightarrow M$, BW $x_{n_{k}}\rightarrow y_{0}$, closedness $y_{0} \in A$, and continuity $M = f\left( y_{0} \right)$; the minimum is dual. IVT takes $S = \left\{ {x \in \left\lbrack {a,b} \right\rbrack:f(x) \leq l} \right\}$, $c = \sup S$, $s_{n} \in S$ tending to $c$, and $t_{n} = \min\left( {c + \frac{1}{n},b} \right)$, then continuity yields $f(c) = l$. The fixed point proof uses $g(x) = x - f(x)$. For continuous $f:I\rightarrow\mathbb{R}$, $f\lbrack I\rbrack$ is an interval by applying IVT between preimages; for $\left\lbrack {a,b} \right\rbrack$, EVT plus IVT gives $\text{ran}(f) = \left\lbrack {m,M} \right\rbrack$.

