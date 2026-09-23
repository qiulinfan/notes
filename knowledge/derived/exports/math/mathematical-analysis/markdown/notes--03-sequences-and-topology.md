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
source: "notes/math/mathematical-analysis/chapters/03-sequences-and-topology.typ"
subtitle: Single-variable analysis --- migrated working notes
title: Mathematical Analysis
---
# Sequences and metric topology

## Sequences and elementary limits

> **Definition: Sequence**
>
> 一个 sequence 是一个 function，其 domain 为某个 $n_{0} \in \mathbb{Z}$ 的 $\left\{ {n \in \mathbb{Z}:n \geq n_{0}} \right\}$；其 values 称为 terms。For $s:\mathbb{N}\rightarrow\mathbb{R}$，write $s_{n}$、$\left( s_{n} \right)_{n \in \ \mathbb{N}}$，or $\left( s_{n} \right)_{1}^{\infty}$。

源页强调 order matters in seq.!!''。其 examples 是 constant sequence $\left( {0,0,0,\ldots} \right)$、harmonic sequence $\left( \frac{1}{n} \right)_{n \in \ \mathbb{N}}$、 $\left( 2^{- n} \right)_{n \in \ \mathbb{N} \cup {\{ 0\}}}$, the Fibonacci sequence $s_{1} = s_{2} = 1$, $s_{n + 2} = s_{n + 1} + s_{n}$, $\left( \left( {- 1} \right)^{n} \right)_{n \in \ \mathbb{N}}$, decimal approximations to $\pi$, and $\left( {1 + \frac{1}{n}} \right)^{n}$.

> **Definition: Convergence in $\mathbb{R}$**
>
> A sequence $\left( s_{n} \right)$ converges to $l \in \mathbb{R}$ if, for every $\varepsilon > 0$, there is $N \in \mathbb{N}$ such that $\left| {s_{n} - l} \right| < \varepsilon$ whenever $n \geq N$. Write $\lim_{n\rightarrow\infty}s_{n} = l$ or $s_{n}\rightarrow l$.

不存在 $l \in \mathbb{R}$ 使其 converges 的 sequence 称为 divergent。源页还定义：对每个 $M \in \mathbb{R}$ 都 eventually $s_{n} > M$ 时 $s_{n}\rightarrow + \infty$；$s_{n}\rightarrow - \infty$ 对偶。 其 examples 是：

- a constant sequence converges to its constant;
- $\frac{1}{n}\rightarrow 0$ by the Archimedean property;
- $2^{- n}\rightarrow 0$;
- Fibonacci terms diverge to $+ \infty$;
- $\left( {- 1} \right)^{n}$ does not converge;
- decimal approximations converge to $\pi$; and
- $\left( {1 + \frac{1}{n}} \right)^{n}\rightarrow e$ (the definition of $e$ appears later).

> **Theorem: Every real is a rational-sequence limit**
>
> For every $r \in \mathbb{R}$, there is a sequence $\left( q_{n} \right)$ in $\mathbb{Q}$ such that $q_{n}\rightarrow r$.

Use density to choose $q_{n} \in \mathbb{Q}$ with $r < q_{n} < r + \frac{1}{n}$.

> **Theorem: Uniqueness of limit**
>
> If $s_{n}\rightarrow l_{1}$ and $s_{n}\rightarrow l_{2}$, then $l_{1} = l_{2}$.

Given $\varepsilon > 0$, choose $N = \max\left( {N_{1},N_{2}} \right)$ so that both $\left| {s_{n} - l_{i}} \right| < \frac{\varepsilon}{2}$ after $N$. Then $\left| {l_{1} - l_{2}} \right| \leq \left| {l_{1} - s_{n}} \right| + \left| {s_{n} - l_{2}} \right| < \varepsilon$.

> **Theorem: Basic limits**
>
> For $p > 0$, $n^{p}\rightarrow + \infty$; for $p < 0$, $n^{p}\rightarrow 0$. If $r > 1$, then $r^{n}\rightarrow + \infty$; if $|r| < 1$, then $r^{n}\rightarrow 0$. Also $s_{n}\rightarrow 0$ if and only if $\left| s_{n} \right|\rightarrow 0$, and $s_{n}\rightarrow 1$ if and only if $\left| {s_{n} - 1} \right|\rightarrow 0$.

For $r = 1 + a > 1$, Bernoulli gives $r^{n} > 1 + na$; for $0 < r < 1$, write $r = \frac{1}{1 + a}$ and compare with $\frac{1}{1 + na}$. The handwritten note says that the $- 1 < r < 0$ case uses an earlier fact. The source also proves $c^{\frac{1}{n}}\rightarrow 1$ for $c > 0$ and $n^{\frac{1}{n}}\rightarrow 1$, citing Rudin 3.20 for the latter.

> **Theorem: Subsequences preserve convergence**
>
> $\left( s_{n} \right)$ converges to $l$ if and only if every subsequence converges to $l$. A tail $\left( s_{n + k} \right)_{n \in \ \mathbb{N}}$ has the same limit.

源页写道 convergent sequence 与其 tail 可以看成没有任何本质区别''。

The rendered page is blank except for its page frame; it contains no mathematical text to transcribe.

## Limit laws, boundedness, and $\frac{\operatorname{lim\, sup}}{\operatorname{lim\, inf}}$

> **Theorem: Limit laws**
>
> If $s_{n}\rightarrow s$ and $t_{n}\rightarrow t$, then
>
> - $s_{n} + t_{n}\rightarrow s + t$ (and likewise for subtraction);
> - $cs_{n}\rightarrow cs$ for every $c \in \mathbb{R}$;
> - $s_{n}t_{n}\rightarrow st$; and
> - if no $s_{n}$ is zero and $s \neq 0$, then $\frac{1}{s_{n}}\rightarrow\frac{1}{s}$.

对于 product，展开 $s_{n}t_{n} - st = \left( {s_{n} - s} \right)\left( {t_{n} - t} \right) + s\left( {t_{n} - t} \right) + t\left( {s_{n} - s} \right)$ and use $\sqrt{\varepsilon}$ bounds. For reciprocals, first use convergence to obtain $\left| s_{n} \right| \geq \frac{|s|}{2}$ eventually, then $\left| {\frac{1}{s_{n}} - \frac{1}{s}} \right| \leq 2\frac{\left| {s_{n} - s} \right|}{|s|^{2}}$. The source annotates these two preliminary bounds as "bound ①" and "bound ②".

Further laws recorded on the page are: convergent $\left( a_{n} \right)$ implies $\left( \left| a_{n} \right| \right)$ converges; for $k \in \mathbb{N}$, $\lim a_{n}^{k} = \left( {\lim a_{n}} \right)^{k}$; and for $k \in \mathbb{N}$, $\lim a_{n}^{\frac{1}{k}} = \left( {\lim a_{n}} \right)^{\frac{1}{k}}$ provided $a_{n} \geq 0$. It defines real exponentiation for $x > 0$ by $x^{r} = \sup\left\{ {y \in \mathbb{R}:y \geq 0\ \text{and}\ y^{n} \leq x^{m}} \right\}$ when $r = \frac{m}{n}$.

> **Theorem: Vector sequences**
>
> A sequence $\left( \begin{pmatrix}
> x
> \end{pmatrix}_{n} \right)$ in $\mathbb{R}^{k}$, with components $\begin{pmatrix}
> x
> \end{pmatrix}_{n} = \left( {a_{1,n},\ldots,a_{k,n}} \right)$, converges to $\begin{pmatrix}
> a
> \end{pmatrix} = \left( {a_{1},\ldots,a_{k}} \right)$ if and only if $a_{i,n}\rightarrow a_{i}$ for every $i$.

正向使用 $\left| {a_{i,n} - a_{i}} \right| \leq \left\| {\begin{pmatrix}
x
\end{pmatrix}_{n} - \begin{pmatrix}
a
\end{pmatrix}} \right\|$; for the reverse direction, make each coordinate error smaller than $\frac{\varepsilon}{\sqrt{k}}$. Vector sum, dot product, and scalar multiplication obey the same limit laws as real sequences.

> **Definition: Bounded function and bounded sequence**
>
> A function $f:X\rightarrow\mathbb{R}$ is bounded when its range is bounded. In particular a sequence is bounded if all of its terms lie between two real bounds.

> **Theorem: Convergent sequences are bounded**
>
> Every convergent sequence of real numbers is bounded.

若 $a_{n}\rightarrow l$，取一个 tail 使 $\left| {a_{n} - l} \right| < 1$，再分别 bound finitely many earlier terms。直接应用 limit laws 给出 rational function $\frac{a_{m}n^{m} + \ldots + a_{0}}{b_{k}n^{k} + \ldots + b_{0}}$: it is $\frac{a_{m}}{b_{k}}$ when $m = k$, it is either $+ \infty$ or $- \infty$ when $m > k$, with the sign determined by $\frac{a_{m}}{b_{k}}$.

> **Theorem: Limits involving $+ \infty$ and $- \infty$**
>
> If $a_{n}\rightarrow + \infty$ and $b_{n}\rightarrow l > 0$, then $a_{n}b_{n}\rightarrow + \infty$; for $l < 0$ the product tends to $- \infty$. The signs reverse when $a_{n}\rightarrow - \infty$. If $a_{n}$ tends to either infinite endpoint and $b_{n}$ converges, then $a_{n} + b_{n}$ has the same infinite limit.

The exercise records, for a positive real sequence: $a_{n}\rightarrow + \infty$ if and only if $\frac{1}{a_{n}}\rightarrow 0$; the negative version gives $a_{n}\rightarrow - \infty$ if and only if $\frac{1}{a_{n}}\rightarrow 0$.

> **Definition: Monotone sequence**
>
> $\left( a_{n} \right)$ is increasing if $a_{n} \leq a_{n + 1}$ for every $n$, decreasing if $a_{n} \geq a_{n + 1}$, and monotone if it is either.

> **Theorem: Monotone convergence theorem**
>
> Every bounded monotone real sequence converges. If $\left( a_{n} \right)$ is bounded and increasing, then $a_{n}\rightarrow\sup\left\{ {a_{n}:n \in \mathbb{N}} \right\}$; if decreasing, its limit is the corresponding infimum.

源页说明 increasing seq. 必定 bounded below；decreasing seq. 必定 bounded above''。证明令 $l = \sup\left\{ a_{n} \right\}$ and takes a term with $l - \varepsilon < a_{N} \leq a_{n} \leq l$.

> **Definition: $\operatorname{lim\, sup}$ and $\operatorname{lim\, inf}$**
>
> For a bounded sequence set $u_{n} = \sup\left\{ {a_{k}:k \geq n} \right\}$ and $v_{n} = \inf\left\{ {a_{k}:k \geq n} \right\}$. Then $\left( u_{n} \right)$ is decreasing and $\left( v_{n} \right)$ increasing, and
>
> $\operatorname{lim\, sup}a_{n} = \lim_{n\rightarrow\infty}u_{n}$, $\operatorname{lim\, inf}a_{n} = \lim_{n\rightarrow\infty}v_{n}$.

The notes display

$\inf\left\{ {a_{k}:k \in \mathbb{N}} \right\} \leq \operatorname{lim\, inf}a_{n} \leq \operatorname{lim\, sup}a_{n} \leq \sup\left\{ {a_{k}:k \in \mathbb{N}} \right\}$.

直观地，$\operatorname{lim\, sup}$ 是 the largest number that can get arbitrarily close to, for infinitely often''。$l$ 是 $\operatorname{lim\, sup}a_{n}$ 当且仅当对每个 $\varepsilon > 0$，有 infinitely many $n$ 使 $a_{n} > l - \varepsilon$，且只有 finitely many $n$ 使 $a_{n} > l + \varepsilon$。定义也经由 $+ \infty$ 和 $- \infty$ 延伸至 unbounded sequences。

> **Theorem: Convergence via upper and lower limits**
>
> If $a_{n}\rightarrow l$, then $\operatorname{lim\, inf}a_{n} = \operatorname{lim\, sup}a_{n} = l$. Conversely, if $\operatorname{lim\, inf}a_{n} = \operatorname{lim\, sup}a_{n} = l \in \mathbb{R}$, then $a_{n}\rightarrow l$.

Examples include ${\operatorname{lim\, inf}\left( {- 1} \right)}^{n} = - 1$, ${\operatorname{lim\, sup}\left( {- 1} \right)}^{n} = 1$, $\operatorname{lim\, inf}\left( {\left( {- 1} \right)^{n} + \frac{1}{n}} \right) = - 1$, and $\operatorname{lim\, sup}\left( {\sin n} \right) = 1$, $\operatorname{lim\, inf}\left( {\sin n} \right) = - 1$. If $a_{n} \leq b_{n}$ eventually, then $\operatorname{lim\, sup}a_{n} \leq \operatorname{lim\, sup}b_{n}$ and $\operatorname{lim\, inf}a_{n} \leq \operatorname{lim\, inf}b_{n}$. The page proves the squeeze theorem and the ratio-test corollary: for positive $a_{n}$, if $\lim\left( \frac{a_{n + 1}}{a_{n}} \right) = l < 1$, then $a_{n}\rightarrow 0$.

## Cauchy sequences, subsequences, and completeness

> **Definition: Cauchy sequence**
>
> A real sequence $\left( a_{n} \right)$ is Cauchy if for every $\varepsilon > 0$ there is $N \in \mathbb{N}$ such that $\left| {a_{m} - a_{n}} \right| < \varepsilon$ whenever $m,n \geq N$.

> **Theorem: Cauchy criterion in $\mathbb{R}$**
>
> A sequence in $\mathbb{R}$ converges if and only if it is Cauchy.

Every Cauchy sequence is bounded: use the Cauchy condition with $\varepsilon = 1$ for a tail and bound the finitely many initial terms. The converse first proves $\operatorname{lim\, inf}a_{n} = \operatorname{lim\, sup}a_{n}$ from pairwise closeness.

> **Definition: Complete metric space**
>
> A metric space $\left( {X,d} \right)$ is complete if every Cauchy sequence in $X$ converges to a point of $X$.

源页写 $\mathbb{R}$ 和 $\text{ℂ}$ complete，而 $\mathbb{Q}$ 不 complete。一个 example 定义 $s_{0} = a$、$s_{1} = b$，and $s_{n + 2} = \frac{s_{n} + s_{n + 1}}{2}$ for $a < b$; it has $\left| {s_{n + 2} - s_{n + 1}} \right| = \frac{b - a}{2^{n + 1}}$ and is Cauchy.

> **Definition: Contractive sequence**
>
> $\left( a_{n} \right)$ is contractive if some $c \in \left( {0,1} \right)$ satisfies $\left| {a_{n + 2} - a_{n + 1}} \right| \leq c\left| {a_{n + 1} - a_{n}} \right|$ for every $n$.

Every contractive real sequence is Cauchy, hence convergent. The source uses the geometric bound $\left| {s_{m} - s_{n}} \right| \leq \sum_{k = n}^{m - 1}\frac{b - a}{2^{k}} \leq \frac{b - a}{2^{n - 1}}$. It also solves $a_{1} = 1$, $a_{n + 1} = \sqrt{2 + a_{n}}$: a bounded increasing sequence converges to the positive root $2$. The decreasing sequence $\left( {1 + \frac{1}{n}} \right)^{n + 1}$ defines $e = \lim_{n\rightarrow\infty}\left( {1 + \frac{1}{n}} \right)^{n}$.

> **Definition: Subsequence and subsequential limit**
>
> If $s:\mathbb{N}\rightarrow\mathbb{R}$ and $g:\mathbb{N}\rightarrow\mathbb{N}$ is strictly increasing, then $s \circ g = \left( s_{n_{k}} \right)_{k \in \ \mathbb{N}}$, $n_{k} = g(k)$, is a subsequence. A subsequential limit is the limit of a subsequence.

对 $s_{n} = \left( {- 1} \right)^{n}$，even subsequence converges to $1$ 而 full sequence diverges。$\left( \frac{1}{n} \right)$ 的每个 subsequence 都 converges to $0$，且每个 tail 是一个 subsequence。

> **Theorem: Monotone subsequence theorem**
>
> Every real sequence has a monotone subsequence.

A term is dominant if it is at least every later term. If infinitely many dominant terms occur, they form a decreasing subsequence; otherwise, after the final dominant term one recursively chooses later, strictly larger terms to obtain an increasing subsequence.

> **Theorem: Bolzano--Weierstrass**
>
> Every bounded real sequence has a convergent subsequence.

Apply the monotone subsequence theorem and monotone convergence. For a bounded sequence $S$ of values, the set of subsequential limits is nonempty; if $\lim a_{n} = l$, it is $\left\{ l \right\}$; and $\operatorname{lim\, sup}a_{n} = \max S$, $\operatorname{lim\, inf}a_{n} = \min S$. The source adds that these claims extend to unbounded sequences using $+ \infty$ and $- \infty$.

## Topology in metric spaces

> **Definition: Open neighborhood, open/closed set**
>
> In $\left( {X,d} \right)$, the open neighborhood of $x_{0}$ of radius $\varepsilon$ is $V_{\varepsilon{(x_{0})}} = \left\{ {x \in X:d\left( {x,x_{0}} \right) < \varepsilon} \right\}$. A set $U \subseteq X$ is open if every $x \in U$ has an $\varepsilon > 0$ with $V_{\varepsilon{(x)}} \subseteq U$. A set $F \subseteq X$ is closed if $X \smallsetminus F$ is open.

The examples say $\varnothing$ and $X$ are both open and closed in $X$, while $\mathbb{R}$ is closed but not open in $\text{ℂ}$. Common metrics are $\left| {x - y} \right|$ on $\mathbb{R}$, Euclidean distance and taxi-cab distance on $\mathbb{R}^{n}$, and $d\left( {a + bi,c + di} \right) = \sqrt{\left( {a - c} \right)^{2} + \left( {b - d} \right)^{2}}$ on $\text{ℂ}$.

> **Definition: Interior, limit point, isolated point, closure**
>
> $p \in E \subseteq X$ is an interior point if some neighborhood of $p$ lies in $E$; $\text{int}(E)$ is the set of all such points.
>
> $p \in X$ is a limit point of $E$ if every neighborhood of $p$ contains a point of $E \smallsetminus \left\{ p \right\}$. An element of $E$ which is not a limit point is isolated. The closure is $\text{cl}(E) = E \cup E'$ where $E'$ is the set of limit points.

The Chinese note says interior membership is necessary but not sufficient for being an interior point; isolated points are not necessarily interior points. A set is open exactly when $\text{int}(U) = U$. A discrete set is $A = A \smallsetminus A'$; it has no limit points, only isolated points.

> **Theorem: Sequential and closure characterizations**
>
> $F \subseteq X$ is closed if and only if every convergent sequence in $F$ has its limit in $F$. Equivalently, $F$ contains all its limit points. Also $\text{cl}(E)$ is closed and is the smallest closed subset of $X$ containing $E$.

In $\mathbb{R}$, every open neighborhood is exactly an open interval, every nonempty open $U \subseteq \mathbb{R}$ contains $\left( {a,b} \right)$ around each of its points, closed intervals are closed, finite sets are closed, and every open set is a countable union of open intervals. The generalized Bolzano--Weierstrass theorem recorded here is: every bounded sequence in a complete metric space has a convergent subsequence. In particular $\mathbb{R}^{n}$ and $\text{ℂ}$ are complete, but $\mathbb{Q}$ is not.

## Page-complete lecture record

### L05--Seq&Limit, pp. 1--3

Besides the definitions above, the source writes the divergent negation $\left. \forall l \in \mathbb{R},\exists\varepsilon > 0,\forall N \in \mathbb{N},\exists n \geq N: \middle| s_{n} - l \middle| \geq \varepsilon \right.$, and $s_{n}\rightarrow + \infty$ as $\forall M \in \mathbb{R},\exists N \in \mathbb{N},n \geq N\Rightarrow s_{n} > M$ (dually for $- \infty$). It gives the decimal sequence $\left( {3,3.1,3.14,3.141,3.1415,\ldots} \right)$ for $\pi$, the Fibonacci recurrence $s_{1} = s_{2} = 1$, $s_{n + 2} = s_{n + 1} + s_{n}$, and the proof of uniqueness: for $N = \max\left( {N_{1},N_{2}} \right)$, $\left. |l_{1} - l_{2} \middle| \leq \middle| l_{1} - s_{n} \middle| + \middle| s_{n} - l_{2} \middle| < \varepsilon \right.$. For every $r \in \mathbb{R}$, choose $q_{n} \in \mathbb{Q}$ with $r < q_{n} < r + \frac{1}{n}$.

For $p > 0$, $N = M^{\frac{1}{p}} + 1$ proves $n^{p}\rightarrow + \infty$; for $p < 0$, $N = \left( \frac{1}{\varepsilon} \right)^{- \frac{1}{p}} + 1$ proves $n^{p}\rightarrow 0$. If $r = 1 + a > 1$, $\left( {1 + a} \right)^{n} \geq 1 + na$; if $0 < r < 1$, write $r = \frac{1}{1 + a}$ and use $0 < r^{n} \leq \frac{1}{1 + na} < \varepsilon$. The $- 1 < r < 0$ case is annotated as an earlier fact. For $c > 0$, $x_{n} = c^{\frac{1}{n}} - 1$ obeys $0 < x_{n} \leq \frac{c - 1}{n}$; for $n^{\frac{1}{n}} - 1 = x_{n}$, $n = \left( {1 + x_{n}} \right)^{n} \geq \left( \frac{n}{2} \right)x_{n}^{2}$, so $x_{n}\rightarrow 0$ (Rudin 3.20). L05 p. 3 is visually blank.

### L06--Limit--II, pp. 1--4

The worked epsilon proof is $\left. |\ \frac{3n + 1}{4n - 1} - \frac{3}{4}\  \middle| = \frac{7}{4\left( {4n - 1} \right)} < \varepsilon \right.$ once $n > \frac{7}{16\varepsilon} + \frac{1}{4}$. The product-law proof expands $s_{n}t_{n} - st = \left( {s_{n} - s} \right)\left( {t_{n} - t} \right) + s\left( {t_{n} - t} \right) + t\left( {s_{n} - s} \right)$; the reciprocal proof uses eventually $\left. |s_{n} \middle| > \middle| s\frac{|}{2} \right.$ and $\left. |\frac{1}{s_{n}} - \frac{1}{s} \middle| < 2 \middle| s_{n} - s\frac{|}{|}s|^{2} \right.$. The source additionally gives $\lim\left( a_{n}^{k} \right) = \left( {\lim a_{n}} \right)^{k}$, $\lim\left( a_{n}^{\frac{1}{k}} \right) = \left( {\lim a_{n}} \right)^{\frac{1}{k}}$ for nonnegative terms, and $x^{\frac{1}{n}} = \sup\left\{ {y \in \mathbb{R}:y \geq 0\ \text{and}\ y^{n} \leq x} \right\}$.

For vector sequences, coordinatewise convergence is equivalent to Euclidean convergence: $\left. |\alpha_{i,n} - \alpha_{i} \middle| \leq \left\| {\begin{pmatrix}
x
\end{pmatrix}_{n} - \begin{pmatrix}
x
\end{pmatrix}} \right\| \right.$ one way, and coordinate errors $< \frac{\varepsilon}{\sqrt{k}}$ the other. The rational function rule is $\frac{a_{m}}{b_{k}}$ for equal degrees, $0$ for numerator degree smaller, and signed infinity for larger degree. A convergent sequence's explicit bounds are $M_{1} = \min\left( {l - 1,\min\left\{ {a_{k}:k < N} \right\}} \right)$, $M_{2} = \max\left( {l + 1,\max\left\{ {a_{k}:k < N} \right\}} \right)$.

The infinity multiplication table has the usual signs $( + )( + ) = +$, $( + )( - ) = -$, $( - )( + ) = -$, $( - )( - ) = +$; if one sequence tends to either infinity and the other converges, their sum tends to that infinity. For positive $a_{n}$, $a_{n}\rightarrow + \infty$ exactly when $\frac{1}{a_{n}}\rightarrow 0$ (negative dual). The monotone proof is: bounded increasing $\left( a_{n} \right)$ has $l = \sup\left\{ a_{n} \right\}$ and $l - \varepsilon < a_{N} \leq a_{n} \leq l$ for $n \geq N$; the decreasing dual tends to infimum.

Put $u_{n} = \sup\left\{ {a_{k}:k \geq n} \right\}$, $l_{n} = \inf\left\{ {a_{k}:k \geq n} \right\}$; $\left( u_{n} \right)$ is decreasing, $\left( l_{n} \right)$ increasing, and limsup/liminf are their limits. The native tail schematic is

It gives the "infinitely often" limsup criterion and examples ${\operatorname{lim\, inf}\left( {- 1} \right)}^{n} = - 1$, ${\operatorname{lim\, sup}\left( {- 1} \right)}^{n} = 1$, $\operatorname{lim\, inf}\left( {\left( {- 1} \right)^{n} + \frac{1}{n}} \right) = - 1$, $\operatorname{lim\, sup}\left( {\left( {- 1} \right)^{n} + \frac{1}{n}} \right) = 1$, $\operatorname{lim\, inf}\left( {\sin n} \right) = - 1$, $\operatorname{lim\, sup}\left( {\sin n} \right) = 1$. It proves convergence iff limsup equals liminf, including the $+ \infty$ extension. The comparisons, squeeze theorem, and ratio corollary are all shown with their tail bounds: positive $a_{n}$ and $\lim\left( \frac{a_{n + 1}}{a_{n}} \right) < 1$ give $a_{n}\rightarrow 0$; homework records the $> 1$ divergence case.

### L07--Cauchy-seq, pp. 1--3

The source warns $a_{n}$ convergent implies $|a_{n} - a_{n + 1}\mapsto 0$, but not conversely. The Cauchy boundedness proof takes epsilon $1$ about $a_{N}$, then bounds the initial finite set. For the reverse Cauchy criterion, pairwise closeness gives

$a_{N} - \frac{\varepsilon}{2} \leq \inf\left\{ {a_{m}:m \geq N} \right\} \leq \operatorname{lim\, inf}a_{n} \leq \operatorname{lim\, sup}a_{n} \leq \sup\left\{ {a_{m}:m \geq N} \right\} \leq a_{N} + \frac{\varepsilon}{2},$

so upper and lower limits are equal. Complete metric space means every Cauchy sequence converges; the source explicitly gives the complex metric $d\left( {a + bi,c + di} \right) = \sqrt{\left( {a - c} \right)^{2} + \left( {b - d} \right)^{2}}$.

The averaging example is $s_{0} = a$, $s_{1} = b$, $s_{n + 2} = \frac{s_{n} + s_{n + 1}}{2}$, with $\left. |s_{n + 2} - s_{n + 1} \middle| = \frac{b - a}{2^{n + 1}} \right.$ and

$\left. |s_{m} - s_{n} \middle| \leq \sum_{k = m}^{n - 1}\frac{b - a}{2^{k}} \leq \frac{b - a}{2^{m - 1}}. \right.$

A contractive sequence has $\left. |a_{n + 2} - a_{n + 1} \middle| \leq c \middle| a_{n + 1} - a_{n}| \right.$, $0 < c < 1$, and is Cauchy (Rudin 3.8). $a_{1} = 1$, $a_{n + 1} = \sqrt{2 + a_{n}}$ is bounded increasing and limits to $2$. For the same averaging recursion with $0 < a < b$, the source derives $d_{n} = - \frac{d_{n - 1}}{2}$ and limit $2\frac{b}{3} + \frac{a}{3}$. It proves $\left( {1 + \frac{1}{n}} \right)^{n + 1}$ weakly decreasing and $> 1$, then defines $e = {\lim\left( {1 + \frac{1}{n}} \right)}^{n} = {\lim\left( {1 + \frac{1}{n}} \right)}^{n + 1}$.

### L08(1)--subseqs, pp. 1--2

A subsequence is $s \circ g$ for strictly increasing $g:\mathbb{N}\rightarrow\mathbb{N}$. Examples: $\left( {- 1} \right)^{n}$ has $g(n) = 2n$ and constant subsequence $1$; $\sin\left( {n\frac{\pi}{2}} \right)$ has subsequential limits $0,1, - 1$. The forward proof for subsequences uses $n_{k} \geq k$. A dominant term has $s_{n} \geq s_{m}$ for all later $m$; infinitely many dominant terms form a decreasing subsequence, otherwise the recursive choice of later larger terms gives a strictly increasing one. Thus BW holds. It names $\left( {\sin k} \right)$ as an example.

For bounded $\left( s_{n} \right)$, the set $S$ of subsequential limits is nonempty, $\lim s_{n} = l\Rightarrow S = \left\{ l \right\}$, $\operatorname{lim\, sup}s_{n} = \max S$, $\operatorname{lim\, inf}s_{n} = \min S$. The proof chooses $n_{k}$ with both $\left. |\sup\left\{ {s_{j}:j \geq n_{k}} \right\} - l \middle| < \frac{1}{k} \right.$ and $\left. |s_{n_{k}} - l \middle| < \frac{2}{k} \right.$, and rules out $M > l$ by a tail supremum. It explicitly extends this to unbounded sequences: $n^{{({- 1})}^{n}}$ has $S = \left\{ {0, + \infty} \right\}$, limsup $+ \infty$, liminf $0$.

### L08(2)--topology-in-metric-space, pp. 1--3

The source's visible native neighborhood pictures are the circle $V_{\varepsilon{(x_{0})}}$ in $\mathbb{R}^{2}$ and interval $\left( {x_{0} - \varepsilon,x_{0} + \varepsilon} \right)$ in $\mathbb{R}$. It defines $\text{int}(E) \subseteq E$, and says membership is necessary but not sufficient for being interior; isolated points need not be interior. It defines $E'$, $\text{cl}(E) = E \cup E'$, isolated $p \in E \smallsetminus E'$, and discrete $A = A \smallsetminus A'$.

The sequential closed-set proof is complete: if $F$ is closed, an open neighborhood of any $l \in X \smallsetminus F$ eventually contains any sequence tending to $l$, so it cannot lie in $F$. If not closed, choose $a_{n} \in \left( {x_{0} - \frac{1}{n},x_{0} + \frac{1}{n}} \right) \cap F$ for a point $x_{0} \in X \smallsetminus F$ whose every neighborhood meets $F$; then $a_{n}\rightarrow x_{0}$. It also proves a limit point has infinitely many nearby points by using the minimum positive distance to a hypothetical finite list. In $\mathbb{R}$, every open set is a countable union of open intervals. General convergence, boundedness by $\exists M > 0,\forall x,y,d\left( {x,y} \right) \leq M$, and generalized BW are stated; the page concludes $\mathbb{R}^{n},\text{ℂ}$ complete and $\mathbb{Q}$ not complete.

