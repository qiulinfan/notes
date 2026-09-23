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
source: "notes/math/mathematical-analysis/chapters/07-riemann-integration.typ"
subtitle: Single-variable analysis --- migrated working notes
title: Mathematical Analysis
---
# Riemann integration

## Antiderivatives and Riemann sums (L16)

> **Definition: Antiderivatives**
>
> A function $F$ 被称为 an antiderivative of $f$ on interval $I$，if $F^{'{(x)}} = f(x)$ for all $x \in I$。若 $F$ 是 $f$ 在 $I$ 上的 antdv，那么 对任意 $C \in \mathbb{R}$，$F(x) + C$ 都是在 $I$ 上的 antdv；且 $f$ 在 $I$ 上的任何 antdv 都是 $F(x) + C$ 的形式。

> **Example: The antiderivative problem**
>
> For $r \neq - 1$,
>
> $$
> \frac{d}{dx}\left( \frac{x^{r + 1}}{r + 1} \right) = x^{r}.
> $$
>
> Thus $\frac{x^{r + 1}}{r + 1}$ is an antiderivative of $x^{r}$ on $\mathbb{R}$. For example, $f(x) = 3x^{2} - 2x + 7$ has antiderivative $F(x) = x^{3} - x^{2} + 7x + C$; $g(x) = \sin\left( {2x} \right)$ has $G(x) = - \frac{\cos\left( {2x} \right)}{2} + C$; for $h(x) = \cos\left( x^{2} \right)$, the question $H(x) = ?$ is left as an illustration that antiderivatives need not have a familiar formula.
>
> The antiderivative problem：given a ctn function $f$ on interval $I$，find $F$ such that $F' = f$ on $I$。Informal 的分析是：当 $h$ 很小时， differentiability suggests $F\left( {a + h} \right) - F(a) \approx hf(a)$，即 graph 下的一条 narrow region 的 area approximately 为 $hf(a)$。

> **Remark: The idea "area so far"**
>
> 对 $t \geq 0$，令 $F(t)$ 为 $y = f(x)$ 下、$x = 0$ 到 $x = t$ 的 area。则对 $a > 0$ 与 small $h$，$F\left( {a + h} \right) - F(a) \approx hf(a)$，故 $\frac{F\left( {a + h} \right) - F(a)}{h} \approx f(a)$。但 area'' 需要 definition：1 使用 rectangle as basic notion；2 使用 rectangles 来 approximate complicated regions；3 使用 limit of such approximation 定义 area''。这就是最早的 Riemann Integral 的 basic idea。
>
> L16 p.1 的 shaded vertical strip is represented by the following native relation table (the strip runs from $a$ to $a + h$ beneath $y = f(x)$):
>
>   -------------------- ------------------------------------------------ ---------------------------------------
>   $0$                  $a$                                              $a + h$
>   area so far $F(a)$   narrow strip                                     area so far $F\left( {a + h} \right)$
>                        $F\left( {a + h} \right) - F(a) \approx hf(a)$
>   -------------------- ------------------------------------------------ ---------------------------------------

> **Definition: Def② 基础架构：partitions, mesh, and tags**
>
> $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ 是一个 function（不需要 ctn）。
>
> 1.  A partition $P$ of $\left\lbrack {a,b} \right\rbrack$ is a finite ordered set $P = \left( {x_{0},x_{1},\ldots,x_{n}} \right)$ where $a = x_{0} < x_{1} < \ldots < x_{n} = b$.
>
> 2.  $I_{k} = \left\lbrack {x_{k - 1},x_{k}} \right\rbrack$ is the $k$th subinterval of $\left\lbrack {a,b} \right\rbrack$.
>
> 3.  The norm (mesh) is
>
>     $$
>     \left\| P \right\| = \max\left\{ {\Delta x_{k}:1 \leq k \leq n} \right\},\quad\Delta x_{k} = x_{k} - x_{k - 1}.
>     $$
>
> 4.  A tagged partition $\cdot P$ is a partition $P = \left( {x_{0},\ldots,x_{n}} \right)$ together with a choice $t_{k} \in I_{k}$ for every $k$; $t_{k}$ is the tag.
>
> The numbered line on L16 p.2 is the partition picture $a = x_{0} < x_{1} < \ldots < x_{n} = b$; a representative finite rendering is
>
>   ------------- --------- --------- ---------- -------------
>   $a = x_{0}$   $x_{1}$   $x_{2}$   $\ldots$   $x_{n} = b$
>   $I_{1}$       $I_{2}$   $I_{3}$              $I_{n}$
>   ------------- --------- --------- ---------- -------------
>
> .

> **Definition: Riemann sum**
>
> 对 tagged partition $\cdot P$，$f$ 在 $\left\lbrack {a,b} \right\rbrack$ 上的 Riemann Sum 是
>
> $$
> S\left( {f, \cdot P} \right) = \sum\limits_{k = 1}^{n}f\left( t_{k} \right)\Delta x_{k}.
> $$
>
> tagged partition 就是把 $\left\lbrack {a,b} \right\rbrack$ 切分成 $n$ 个 subinterval，在每个 subinterval 上都取一点作为 tag；Riemann Sum 对每个 subinterval 都用 $f\left( t_{k} \right)\Delta x_{k}$ 近似面积。
>
> The colored rectangles in L16 p.2 assign one tag to each interval:
>
>   ------------------------------------- ------------------------------------- ---------- -------------------------------------
>   $I_{1}$                               $I_{2}$                               $\ldots$   $I_{n}$
>   $t_{1} \in I_{1}$                     $t_{2} \in I_{2}$                     $\ldots$   $t_{n} \in I_{n}$
>   $f\left( t_{1} \right)\Delta x_{1}$   $f\left( t_{2} \right)\Delta x_{2}$   $\ldots$   $f\left( t_{n} \right)\Delta x_{n}$
>   ------------------------------------- ------------------------------------- ---------- -------------------------------------
>
> .

> **Definition: Riemann integrability**
>
> 称 $f$ 在 $\left\lbrack {a,b} \right\rbrack$ 上 Riemann Integrable，若存在 $L \in \mathbb{R}$，使对任意 $\varepsilon > 0$，存在 $\delta > 0$ 满足
>
> $$
> \left| {S\left( {f, \cdot P} \right) - L} \right| < \varepsilon
> $$
>
> 对任何 $\left\| P \right\| < \delta$ 的 tagged partition $\cdot P$ 都成立。记
>
> $$
> L = \int_{a}^{b}f(x)\, dx = \int_{a}^{b}f
> $$
>
> 并称为 $f$ 在 $\left\lbrack {a,b} \right\rbrack$ 上的 Riemann integral。
>
> Riemann Integrable: 对于任意小的 $\varepsilon$，都存在 $\delta$ 使得对于任何 mesh 小于 $\delta$ 的 partition，都有其 Riemann Sum 和 $L$ 的距离小于 $\varepsilon$。我们发现这是一个 Cauchy 式的 Definition；直觉上（稍后将证明） mesh $\left\| P \right\|$ 越小，即 partition 越精细，Riemann Sum 就会越接近 area so far，因而这个定义很符合直觉。Informally, $\lim_{{\| P\|}\rightarrow 0}S\left( {f, \cdot P} \right) = L$.

> **Theorem: bounded 是 Riemann integrable 的必要条件**
>
> If $f$ is Riemann integrable on $\left\lbrack {a,b} \right\rbrack$，then $f$ is bounded on $\left\lbrack {a,b} \right\rbrack$。

> **Proof**
>
> Prove the contrapositive. Suppose $f$ is unbounded on $\left\lbrack {a,b} \right\rbrack$. Let $\varepsilon = 1$, choose any $\delta > 0$, and take any tagged partition $\cdot P$ with $\left\| P \right\| < \delta$. Fix $k$ such that $f$ is unbounded on $I_{k}$, then choose $s_{k} \in I_{k}$ with
>
> $$
> \left| {f\left( s_{k} \right) - f\left( t_{k} \right)} \right| > \frac{1}{\Delta x_{k}}.
> $$
>
> Replace only the $k$th tag of $\cdot P$ by $s_{k}$, producing $\cdot P'$. Then $\left| {S\left( {f, \cdot P} \right) - S\left( {f, \cdot P'} \right)} \right| > 1$. Thus no common limiting $L$ can satisfy the definition.

> **Remark: Two boundary examples**
>
> 一年级 calculus 常把 $\int_{0}^{1}\frac{1}{\sqrt{x}}\, dx$ 写作答案，但 $\frac{1}{\sqrt{x}}$ 因 unbounded 而不是 Riemann integrable；这实际是 improper integral，
>
> $$
> \int_{0}^{1}\frac{1}{\sqrt{x}}\, dx = \lim\limits_{a\rightarrow 0^{+}}\int_{a}^{1}\frac{1}{\sqrt{x}}\, dx.
> $$
>
> 还有 bounded 而 non-Riemann-integrable 的 functions：Dirichlet function
>
> $$
> D(x) = \left\{ \begin{matrix}
> 1 & {x \in \mathbb{Q}} \\
> 0 & {x \in \mathbb{R} \smallsetminus \mathbb{Q}}
> \end{matrix} \right.
> $$
>
> is bounded on $\left\lbrack {0,1} \right\rbrack$ but not Riemann integrable. It is Lebesgue integrable, with $\int_{0}^{1}D(x)\, dx = 0$, because $\mathbb{Q}$ has measure zero on $\left\lbrack {0,1} \right\rbrack$, while $\mathbb{R} \smallsetminus \mathbb{Q}$ has measure one. （之后再学 Lebesgue measure 和 Lebesgue integral。）

> **Definition: Special Riemann sums**
>
> 一个 regular partition 的所有 $\Delta x_{k}$ 都相同： $\Delta x_{k} = \left\| P \right\| = \frac{b - a}{n}$。对一个 partition，取 $t_{k} = x_{k}$ 得 right Riemann sum；取 $t_{k} = x_{k - 1}$ 得 left Riemann sum；取 $t_{k} = \frac{x_{k} + x_{k - 1}}{2}$ 得 midpoint Riemann sum。
>
> Combining the regular partition with the right Riemann sum gives
>
> $$
> S\left( {f, \cdot P} \right) = \sum\limits_{k = 1}^{n}f\left( {a + \frac{k\left( {b - a} \right)}{n}} \right)\frac{b - a}{n}.
> $$
>
> L16 p.3 displays the three choices with their tag positions:
>
>   ------------------- --------------------- ---------------------------------------
>   right Riemann sum   left Riemann sum      midpoint Riemann sum
>   $t_{k} = x_{k}$     $t_{k} = x_{k - 1}$   $t_{k} = \frac{x_{k - 1} + x_{k}}{2}$
>   ------------------- --------------------- ---------------------------------------
>
> .

> **Example: A right sum for $x^{2}$**
>
> Compute the right Riemann sum of $f(x) = x^{2}$ on $\left\lbrack {0,1} \right\rbrack$ using a regular partition with $n$ subintervals. Here
>
> $$
> x_{k} = \frac{k}{n},\quad\Delta x_{k} = \frac{1}{n},\quad t_{k} = \frac{k}{n}
> $$
>
> for $1 \leq k \leq n$, so
>
> $$
> S\left( {f, \cdot P_{n}} \right) = \sum\limits_{k = 1}^{{n{(\frac{k}{n})}}^{2}}\left( \frac{1}{n} \right) = \frac{1}{n^{3}}\sum\limits_{k = 1}^{n}k^{2} = \frac{2n^{3} + 3n^{2} + n}{6n^{3}}.
> $$
>
> Therefore $\lim_{n\rightarrow\infty}S\left( {f, \cdot P_{n}} \right) = \frac{1}{3}$. But this is only one kind of tags on one family of partitions; Riemann integrability must cover all tagged partitions. We return to this using Darboux sums.

> **Definition: Darboux sums and integral**
>
> Suppose $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ is bounded and $P = \left( {x_{0},\ldots,x_{n}} \right)$ is a partition. The upper and lower sums are
>
> $$
> U\left( {f,P} \right) = \sum\limits_{k = 1}^{n}\sup f\left\lbrack I_{k} \right\rbrack\Delta x_{k},\quad L\left( {f,P} \right) = \sum\limits_{k = 1}^{n}\inf f\left\lbrack I_{k} \right\rbrack\Delta x_{k}.
> $$
>
> The upper and lower Darboux integrals are
>
> $$
> U(f) = \inf\left\{ {U\left( {f,P} \right):P\ \text{partitions of}\ \left\lbrack {a,b} \right\rbrack} \right\},\quad L(f) = \sup\left\{ {L\left( {f,P} \right):P\ \text{partitions of}\ \left\lbrack {a,b} \right\rbrack} \right\}.
> $$
>
> Always $L(f) \leq U(f)$. We say $f$ is Darboux integrable on $\left\lbrack {a,b} \right\rbrack$ iff $U(f) = L(f)$. Upper Darboux integral 是所有 partitions 的 upper sum 的下确界； lower Darboux integral 是所有 partitions 的 lower sum 的上确界。
>
> Darboux sum 本身不是 Riemann sum，除非 $f$ continuous（此时 extrema 可取）； but for every tagged partition, $L\left( {f,P} \right) \leq S\left( {f, \cdot P} \right) \leq U\left( {f,P} \right)$.
>
> L16 p.4 contrasts the upper and lower rectangle pictures on one partition:
>
>   ------------------------------------------------------ -------------------------------- ------------------------------------------------------
>   rectangle height on $I_{k}$                            tag height                       rectangle height on $I_{k}$
>   $\inf f\left\lbrack I_{k} \right\rbrack$ (lower sum)   $f\left( t_{k} \right)$          $\sup f\left\lbrack I_{k} \right\rbrack$ (upper sum)
>   $L\left( {f,P} \right)$                                $S\left( {f, \cdot P} \right)$   $U\left( {f,P} \right)$
>   ------------------------------------------------------ -------------------------------- ------------------------------------------------------
>
> .

> **Theorem: Refinement lemma**
>
> Let $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ be bounded with $\left| {f(x)} \right| \leq B$ for all $x \in \left\lbrack {a,b} \right\rbrack$. Let $Q \supseteq P = \left( x_{k} \right)_{k = 0}^{n}$ be partitions of $\left\lbrack {a,b} \right\rbrack$, and put
>
> $$
> J = \left\{ {k:Q \cap \left( {x_{k - 1},x_{k}} \right) \neq \varnothing} \right\}.
> $$
>
> Then
>
> $$
> L\left( {f,P} \right) \leq L\left( {f,Q} \right),\quad\left| {L\left( {f,P} \right) - L\left( {f,Q} \right)} \right| \leq 2|J|B\left\| P \right\|,
> $$
>
> and dually
>
> $$
> U\left( {f,Q} \right) \leq U\left( {f,P} \right),\quad\left| {U\left( {f,Q} \right) - U\left( {f,P} \right)} \right| \leq 2|J|B\left\| P \right\|.
> $$

> **Proof**
>
> Fix $k \in J$, and let $x_{k - 1} = y_{0} < \ldots < y_{r} = x_{k}$ be the partition points of $Q$ in $I_{k}$. Then
>
> $$
> L\left( {f,Q \cap I_{k}} \right) = \sum\limits_{j = 1}^{r}\inf\limits_{\lbrack{y_{j - 1},y_{j}}\rbrack}f\Delta y_{j}
> $$
>
> whereas $\left( {\inf f\left\lbrack I_{k} \right\rbrack} \right)\Delta x_{k} = \sum_{j = 1}^{r}\inf f\left\lbrack I_{k} \right\rbrack\Delta y_{j}$. Each difference is at most $2B\Delta y_{j}$, hence
>
> $$
> 0 \leq L\left( {f,Q \cap I_{k}} \right) - \left( {\inf f\left\lbrack I_{k} \right\rbrack} \right)\Delta x_{k} \leq 2B\Delta x_{k} \leq 2B\left\| P \right\|.
> $$
>
> Sum over $k \in J$. The upper-sum statement is dual. Thus refinement makes lower sums bigger and upper sums smaller, and the difference depends on how many new points and how small the mesh is.

## Equivalence and basic properties (L17)

> **Theorem: Equivalent Riemann/Darboux criteria**
>
> For a bounded function $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$, the following are equivalent:
>
> 1.  $f$ is Riemann integrable on $\left\lbrack {a,b} \right\rbrack$.
> 2.  For every $\varepsilon > 0$, there is $\delta > 0$ such that every two tagged partitions $\cdot P, \cdot Q$ with $\left\| P \right\|,\left\| Q \right\| < \delta$ satisfy $\left| {S\left( {f, \cdot P} \right) - S\left( {f, \cdot Q} \right)} \right| < \varepsilon$.
> 3.  For every $\varepsilon > 0$, there is $\delta > 0$ such that every partition $P$ with $\left\| P \right\| < \delta$ satisfies $U\left( {f,P} \right) - L\left( {f,P} \right) < \varepsilon$.
> 4.  $f$ is Darboux integrable on $\left\lbrack {a,b} \right\rbrack$.
> 5.  For every $\varepsilon > 0$, there is a partition $P$ of $\left\lbrack {a,b} \right\rbrack$ such that $U\left( {f,P} \right) - L\left( {f,P} \right) < \varepsilon$.

> **Proof**
>
> **(1) =\> (2).** If all sufficiently fine Riemann sums are within $\frac{\varepsilon}{2}$ of $L$, their pairwise difference is below $\varepsilon$.
>
> **(2) =\> (3).** For a fixed fine partition choose, in every $I_{k}$, points $s_{k},t_{k}$ approaching $\inf f\left\lbrack I_{k} \right\rbrack$ and $\sup f\left\lbrack I_{k} \right\rbrack$ sufficiently closely:
>
> $$
> \left| {f\left( s_{k} \right) - \inf f\left\lbrack I_{k} \right\rbrack} \right| < \frac{\varepsilon}{4\left( {b - a} \right)},\quad\left| {f\left( t_{k} \right) - \sup f\left\lbrack I_{k} \right\rbrack} \right| < \frac{\varepsilon}{4\left( {b - a} \right)}.
> $$
>
> The associated tagged sums differ by less than $\frac{\varepsilon}{2}$, while their distances to $L\left( {f,P} \right)$ and $U\left( {f,P} \right)$ are each below $\frac{\varepsilon}{4}$; thus $U\left( {f,P} \right) - L\left( {f,P} \right) < \varepsilon$.
>
> **(3) =\> (4).** Since $L\left( {f,P} \right) \leq L(f) \leq U(f) \leq U\left( {f,P} \right)$ for every $P$, $\left| {L(f) - U(f)} \right| \leq U\left( {f,P} \right) - L\left( {f,P} \right) < \varepsilon$. Hence $L(f) = U(f)$.
>
> **(4) =\> (5).** Choose partitions $P,Q$ with $L(f) - \frac{\varepsilon}{2} < L\left( {f,P} \right)$ and $U\left( {f,Q} \right) < U(f) + \frac{\varepsilon}{2}$. For the common refinement $P \cup Q$,
>
> $$
> L(f) - \frac{\varepsilon}{2} < L\left( {f,P} \right) \leq L\left( {f,P \cup Q} \right) \leq U\left( {f,P \cup Q} \right) \leq U\left( {f,Q} \right) < U(f) + \frac{\varepsilon}{2},
> $$
>
> whence its upper-minus-lower sum is below $\varepsilon$.
>
> **(5) =\> (3).** Fix $P_{0}$ with $U\left( {f,P_{0}} \right) - L\left( {f,P_{0}} \right) < \frac{\varepsilon}{2}$. Let $\left| {f(x)} \right| \leq B$ and choose $\delta = \frac{\varepsilon}{8mB}$, where $m$ is the number of subintervals of $P_{0}$. For any $P$ with $\left\| P \right\| < \delta$, let $Q = P \cup P_{0}$. The refinement lemma bounds both changes by $2mB\delta \leq \frac{\varepsilon}{4}$. Together with $L\left( {f,P_{0}} \right) \leq L\left( {f,Q} \right) \leq U\left( {f,Q} \right) \leq U\left( {f,P_{0}} \right)$ this gives $U\left( {f,P} \right) - L\left( {f,P} \right) < \varepsilon$.

> **Example: $x^{2}$ and the Dirichlet function**
>
> For $f(x) = x^{2}$ on $\left\lbrack {0,1} \right\rbrack$ and the regular partition $P_{n}$ with $n$ intervals,
>
> $$
> U\left( {f,P_{n}} \right) = \sum\limits_{k = 1}^{{n{(\frac{k}{n})}}^{2}}\left( \frac{1}{n} \right) = \frac{2n^{3} + 3n^{2} + n}{6n^{3}},
> $$
> $$
> L\left( {f,P_{n}} \right) = \sum\limits_{k = 0}^{n - 1}\left( \frac{k}{n} \right)^{2}\left( \frac{1}{n} \right) = \frac{2n^{3} - 3n^{2} + n}{6n^{3}}.
> $$
>
> Both tend to $\frac{1}{3}$, so $x^{2}$ is Darboux and hence Riemann integrable, with $\int_{0}^{1}x^{2}\, dx = \frac{1}{3}$.
>
> For $D(x) = 1$ on $\mathbb{Q}$ and $0$ on $\mathbb{R} \smallsetminus \mathbb{Q}$, every subinterval contains rationals and irrationals, so every partition has $U\left( {D,P} \right) = 1$ and $L\left( {D,P} \right) = 0$. Therefore it is neither Darboux nor Riemann integrable, although it is Lebesgue integrable and $\int_{0}^{1}D(x)\, dx = 0$.

> **Theorem: Linearity of integration**
>
> If $f,g:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ are Riemann integrable and $c \in \mathbb{R}$, then $cf$ and $f + g$ are Riemann integrable and
>
> $$
> \int_{a}^{b}cf = c\int_{a}^{b}f,\quad\int_{a}^{b{({f + g})}} = \int_{a}^{b}f + \int_{a}^{b}g.
> $$

> **Proof**
>
> This follows from linearity of Riemann sums: $S\left( {cf, \cdot P} \right) = cS\left( {f, \cdot P} \right)$ and $S\left( {f + g, \cdot P} \right) = S\left( {f, \cdot P} \right) + S\left( {g, \cdot P} \right)$.

> **Theorem: Monotonicity of integration**
>
> If $f,g:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ are Riemann integrable and $f(x) \leq g(x)$ for all $x \in \left\lbrack {a,b} \right\rbrack$, then
>
> $$
> \int_{a}^{b}f \leq \int_{a}^{b}g.
> $$

> **Proof**
>
> For every partition $P$, $U\left( {f,P} \right) \leq U\left( {g,P} \right)$, hence $U(f) \leq U(g)$.

> **Theorem: Monotone functions are integrable**
>
> If $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ is monotone on $\left\lbrack {a,b} \right\rbrack$, then $f$ is Riemann integrable on $\left\lbrack {a,b} \right\rbrack$.

> **Proof**
>
> WLOG suppose $f$ is increasing. Given $\varepsilon > 0$, take any partition $P = \left( x_{k} \right)_{k = 0}^{n}$ with $\left\| P \right\| < \frac{\varepsilon}{f(b) - f(a)}$. Then
>
> $$
> U\left( {f,P} \right) - L\left( {f,P} \right) = \sum\limits_{k = 1}^{n{({\sup f{\lbrack I_{k}\rbrack} - \inf f{\lbrack I_{k}\rbrack}})}}\Delta x_{k} = \sum\limits_{k = 1}^{n{({f{(x_{k})} - f{(x_{k - 1})}})}}\Delta x_{k}
> $$
> $$
> \leq \sum\limits_{k = 1}^{n{({f{(x_{k})} - f{(x_{k - 1})}})}}\frac{\varepsilon}{f(b) - f(a)} = \varepsilon.
> $$

## Measure-zero criterion, FTC, and rules (L18)

> **Definition: Zero-measure set**
>
> $A \subset \mathbb{R}$ has measure zero if, for every $\varepsilon > 0$, there is a sequence of open intervals $\left( \left( {a_{k},b_{k}} \right) \right)_{k \in \ \mathbb{N}}$ such that
>
> $$
> A \subset \cup_{k \in \ \mathbb{N}}\left( {a_{k},b_{k}} \right),\quad\sum\limits_{k = 1}^{\infty{({b_{k} - a_{k}})}} < \varepsilon.
> $$
>
> 注：zero measure 的意义是这个集合的 length 是 $0$。它可以是无限甚至 uncountable 的，但能由一串很窄的开区间覆盖；例如 Cantor set， $|F| = c$, 但它是 zero measure。

> **Theorem: Lebesgue's characterization of integrability**
>
> A bounded function $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ is Riemann integrable iff the set of discontinuities of $f$ has measure zero. （$f$ 的非连续点是零测的。）

> **Remark: Consequences of the criterion**
>
> 任何 countable 的 $A \subset \mathbb{R}$ 都 has measure zero，因此任何只有 countably many discontinuities 的函数都是 Riemann integrable，例如 Thomae's function. Last time: monotone functions are Riemann integrable.

> **Lemma: Uniform-continuity oscillation estimate**
>
> Let $g:\left\lbrack {c,d} \right\rbrack\rightarrow\mathbb{R}$. Suppose there are $\varepsilon,\delta > 0$ such that $\left| {g(x) - g(y)} \right| < \varepsilon$ whenever $x,y \in \left\lbrack {c,d} \right\rbrack$ and $\left| {x - y} \right| \leq \delta$. Then $g$ is bounded, and
>
> $$
> \sup(g) - \inf(g) \leq \left( {\frac{d - c}{\delta} + 1} \right)\varepsilon.
> $$

> **Proof**
>
> Given $x < y$, choose least $n$ with $\frac{d - c}{\delta} \leq n$, so $n < 1 + \frac{d - c}{\delta}$, and set $z_{k} = x + \frac{k\left( {y - x} \right)}{n}$. Each increment is at most $\delta$, hence
>
> $$
> \left| {g(x) - g(y)} \right| \leq \sum\limits_{k = 1}^{n}\left| {g\left( z_{k} \right) - g\left( z_{k - 1} \right)} \right| < n\varepsilon < \left( {\frac{d - c}{\delta} + 1} \right)\varepsilon.
> $$
>
> Since $x,y$ are arbitrary, the claim follows.

> **Theorem: Composition theorem**
>
> Let $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ be integrable on $\left\lbrack {a,b} \right\rbrack$, and suppose $g:\mathbb{R}\rightarrow\mathbb{R}$ is continuous. Then $g ○ f$ is integrable on $\left\lbrack {a,b} \right\rbrack$.

> **Proof**
>
> Since $f$ is integrable it is bounded, so choose a closed bounded interval $I \supseteq f\left( \left\lbrack {a,b} \right\rbrack \right)$. Then $g$ is uniformly continuous on $I$. Given $\varepsilon > 0$, choose $\delta > 0$ so that
>
> $$
> \left| {x - y} \right| < \delta\Rightarrow\left| {g(x) - g(y)} \right| < \frac{\varepsilon}{2\left( {b - a} \right)}.
> $$
>
> Choose $P$ with $U\left( {f,P} \right) - L\left( {f,P} \right) < \delta\left( {b - a} \right)$. Apply the lemma on every $\left\lbrack {\inf f\left\lbrack I_{k} \right\rbrack,\sup f\left\lbrack I_{k} \right\rbrack} \right\rbrack$ to estimate its $g ○ f$ oscillation. Then
>
> $$
> U\left( {g ○ f,P} \right) - L\left( {g ○ f,P} \right) \leq \frac{\varepsilon}{2\delta\left( {b - a} \right)}\left( {U\left( {f,P} \right) - L\left( {f,P} \right)} \right) + \sum\limits_{k = 1}^{n}\frac{\varepsilon}{2\left( {b - a} \right)}\Delta x_{k} < \varepsilon.
> $$

> **Corollary: Continuous functions and products**
>
> Continuous functions are integrable: take $g(x) = x$ in the composition theorem. If $f$ and $g$ are integrable, then $fg$ is integrable, because
>
> $$
> fg = \frac{1}{2}\left( {\left( {f + g} \right)^{2} - f^{2} - g^{2}} \right)
> $$
>
> and $h(x) = x^{2}$ is continuous.

> **Theorem: Additional properties of the integral**
>
> If $f$ is integrable on $\left\lbrack {a,b} \right\rbrack$, then $|f|$ is integrable and
>
> $$
> \left| {\int_{a}^{b}f} \right| \leq \int_{a}^{b}|f|.
> $$
>
> If $a < c < b$, then $f$ is integrable on $\left\lbrack {a,b} \right\rbrack$ iff it is integrable on both $\left\lbrack {a,c} \right\rbrack$ and $\left\lbrack {c,b} \right\rbrack$, and
>
> $$
> \int_{a}^{b}f = \int_{a}^{c}f + \int_{c}^{b}f.
> $$
>
> More generally, the L18 p.2 restriction construction says: if $\left\lbrack {c,d} \right\rbrack \subset \left\lbrack {a,b} \right\rbrack$ and
>
> $$
> g(x) = \left\{ \begin{matrix}
> {f(x)} & {x \in \left\lbrack {c,d} \right\rbrack} \\
> 0 & {x \in \left\lbrack {a,b} \right\rbrack \smallsetminus \left\lbrack {c,d} \right\rbrack}
> \end{matrix} \right.,
> $$
>
> then $g = f\chi_{\lbrack{c,d}\rbrack}$, where
>
> $$
> \chi_{A{(x)}} = \left\{ \begin{matrix}
> 1 & {x \in A} \\
> 0 & {x \notin A}
> \end{matrix} \right.,
> $$
>
> is the characteristic function of $A \subset \mathbb{R}$, and
>
> $$
> \int_{c}^{d}f = \int_{a}^{b}g = \int_{a}^{b}f\chi_{\lbrack{c,d}\rbrack}.
> $$
>
> Altering $f$ at finitely many points does not change integrability or the integral. Equivalently, if $f$ is integrable and
>
> $$
> g(x) = f(x)\ \text{for all but finitely many}\ x \in \left\lbrack {a,b} \right\rbrack,
> $$
>
> then $g$ is integrable and $\int_{a}^{b}f = \int_{a}^{b}g$. The proof uses uniform continuity to make the changed finite-point contributions arbitrarily small.

## Fundamental Theorem of Calculus

> **Theorem: FTC I**
>
> Suppose $F:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ is continuous on $\left\lbrack {a,b} \right\rbrack$, differentiable on $\left( {a,b} \right)$, and $F'$ is Riemann integrable on $\left\lbrack {a,b} \right\rbrack$. Then
>
> $$
> \int_{a}^{b}F^{'{(x)}}\, dx = F(b) - F(a).
> $$
>
> Notation: $F(b) - F(a) = F(x)|_{a}^{b}$.

> **Proof**
>
> Given a partition $P = \left( x_{k} \right)_{k = 0}^{n}$ with $U\left( {F',P} \right) - L\left( {F',P} \right) < \varepsilon$, MVT supplies $t_{k} \in I_{k}$ with
>
> $$
> F^{'{(t_{k})}} = \frac{F\left( x_{k} \right) - F\left( x_{k - 1} \right)}{x_{k} - x_{k - 1}}.
> $$
>
> Thus
>
> $$
> F(b) - F(a) = \sum\limits_{k = 1}^{n{({F{(x_{k})} - F{(x_{k - 1})}})}} = \sum\limits_{k = 1}^{n}F^{'{(t_{k})}}\Delta x_{k} = S\left( {F', \cdot P} \right).
> $$
>
> Since $L\left( {F',P} \right) \leq S\left( {F', \cdot P} \right) \leq U\left( {F',P} \right)$, the difference between $\int_{a}^{b}F'$ and $F(b) - F(a)$ is below $\varepsilon$.

> **Theorem: FTC II**
>
> Let $f:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ be Riemann integrable and define
>
> $$
> F(x) = \int_{a}^{x}f(t)\, dt,\quad a \leq x \leq b.
> $$
>
> Then $F$ is uniformly continuous on $\left\lbrack {a,b} \right\rbrack$. If $f$ is continuous at $x_{0} \in \left( {a,b} \right)$, then $F$ is differentiable at $x_{0}$ and $F^{'{(x_{0})}} = f\left( x_{0} \right)$.

> **Proof**
>
> Fix $B$ with $\left| {f(x)} \right| \leq B$. If $0 < x - y < \delta = \frac{\varepsilon}{B}$, then
>
> $$
> \left| {F(x) - F(y)} \right| = \left| {\int_{y}^{x}f(t)\, dt} \right| \leq \int_{y}^{x}\left| {f(t)} \right|\, dt \leq B\left( {x - y} \right) < \varepsilon,
> $$
>
> so $F$ is uniformly continuous. At a continuity point $x_{0}$,
>
> $$
> \frac{F(x) - F\left( x_{0} \right)}{x - x_{0}} - f\left( x_{0} \right) = \frac{1}{x - x_{0}}\int_{x_{0}}^{x{({f{(t)} - f{(x_{0})}})}}\, dt.
> $$
>
> Given $\varepsilon > 0$, continuity gives $\delta > 0$ with $\left| {f(t) - f\left( x_{0} \right)} \right| < \varepsilon$ whenever $\left| {t - x_{0}} \right| < \delta$. Thus, for $x \in V_{\delta{(x_{0})}}$ and $x \neq x_{0}$,
>
> $$
> \left| {\frac{F(x) - F\left( x_{0} \right)}{x - x_{0}} - f\left( x_{0} \right)} \right| \leq \frac{1}{\left| {x - x_{0}} \right|}\left| {\int_{x_{0}}^{x{({f{(t)} - f{(x_{0})}})}}\, dt} \right| \leq \frac{1}{\left| {x - x_{0}} \right|}\int_{x_{0}}^{x}\varepsilon\, dt = \varepsilon.
> $$
>
> Therefore $F^{'{(x_{0})}} = f\left( x_{0} \right)$.
>
> Note: $f$ 在 $x_{0}$ 处 continuous 是 FTC II 中很重要的条件。

> **Example: FTC examples and caveats**
>
> $$
> g(x) = \int_{0}^{x}\cos\left( t^{2} \right)\, dt
> $$
>
> is an antiderivative of $f(x) = \cos x^{2}$ on $\mathbb{R}$ because $f$ is continuous. Also
>
> $$
> \frac{d}{dx}\int_{0}^{x}e^{t^{2}}\, dt = e^{x^{2}},
> $$
>
> though the integral generally cannot be written in elementary closed form. By the chain rule,
>
> $$
> \frac{d}{dx}\int_{0}^{x^{3}}\sin t\, dt = \sin\left( x^{3} \right) \cdot 3x^{2}.
> $$
>
> More generally,
>
> $$
> \frac{d}{dx}\int_{a}^{g{(x)}}f(t)\, dt = f\left( {g(x)} \right)g^{'{(x)}}
> $$
>
> if $f$ is Riemann integrable and continuous where needed.
>
> FTC says differentiation and integration can be inverse operations, but: (1) derivatives need not be integrable, for example $f(x) = x^{2}\sin\left( \frac{1}{x^{2}} \right)$ has an unbounded derivative; (2) indefinite integrals need not be antiderivatives (Thomae's function has no antiderivative), while an integral has constant zero.

> **Theorem: Integration by parts**
>
> If $u,v$ are continuous on $\left\lbrack {a,b} \right\rbrack$, differentiable on $\left( {a,b} \right)$, and $u',v'$ are integrable on $\left\lbrack {a,b} \right\rbrack$, then
>
> $$
> \int_{a}^{b}u(x)v^{'{(x)}}\, dx = u(x)v(x)|_{a}^{b} - \int_{a}^{b}u^{'{(x)}}v(x)\, dx.
> $$
>
> In the shorthand, $\int u\, dv = uv - \int v\, du$.

> **Proof**
>
> Differentiate $u(x)v(x)$: $\left( {uv} \right)' = u'v + uv'$, then integrate on $\left\lbrack {a,b} \right\rbrack$ and use FTC I.

> **Theorem: Change of variables**
>
> Suppose $u = f(x)$ is a continuously differentiable function on an open interval $J$, let $I$ be an open interval with $I \supseteq f\lbrack J\rbrack$, and let $g$ be continuous on $I$. Then for $a,b \in J$,
>
> $$
> \int_{a}^{b}g\left( {f(x)} \right)f^{'{(x)}}\, dx = \int_{f{(a)}}^{f{(b)}}g(u)\, du.
> $$

> **Proof**
>
> If $G' = g$, then $\left( {G ○ f} \right)' = g ○ f \cdot f'$, so FTC I gives the equality.

