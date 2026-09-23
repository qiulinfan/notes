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
source: "notes/math/mathematical-analysis/chapters/06-numerical-series.typ"
subtitle: Single-variable analysis --- migrated working notes
title: Mathematical Analysis
---
# Numerical series

> **Definition: Series**
>
> 若 $\left( a_{k} \right)_{k \in \ \mathbb{N}}$ 是 $\mathbb{R}$ 中的一个 sequence，记
>
> $$
> s_{n} = \sum\limits_{k = 1}^{n}a_{k}
> $$
>
> 为其 $n$th partial sum；$\left( s_{n} \right)$ 是 sequence of partial sums。用 $\sum_{k = 1}^{\infty}a_{k}$ 表示由 $\left( a_{k} \right)$ 确定的 infinite series。
>
> 若 $\lim_{n\rightarrow\infty}\sum_{k = 1}^{n}a_{k} = L$，则 series **converges**；否则 **diverges**。Informally，$\sum a_{k} < \infty$。Note： $\sum_{k = 1}^{\infty}a_{k}$ 代表一个 limit 而非 algebraic operation.

> **Example: Harmonic and geometric series**
>
> The harmonic series diverges to $+ \infty$:
>
> $$
> \sum\limits_{n = 1}^{\infty}\frac{1}{n} = 1 + \frac{1}{2} + \left( {\frac{1}{3} + \frac{1}{4}} \right) + \left( {\frac{1}{5} + \frac{1}{6} + \frac{1}{7} + \frac{1}{8}} \right) + \ldots \geq 1 + \frac{1}{2} + \frac{1}{2} + \ldots = \sum\limits_{n = 1}^{\infty}\frac{1}{2} = \infty.
> $$
>
> 给定 $a,r \in \mathbb{R}$ 和 $m \in \mathbb{Z}$，$\sum_{k = m}^{\infty}ar^{k}$ 是 geometric series。If $r \neq 1$，then
>
> $$
> \sum\limits_{k = m}^{n}ar^{k} = \frac{a\left( {r^{m} - r^{n + 1}} \right)}{1 - r},
> $$
>
> and therefore
>
> $$
> \sum\limits_{k = m}^{\infty}ar^{k} = \left\{ \begin{matrix}
> {a\frac{r^{m}}{1 - r}} & {|r| < 1} \\
> {\text{DNE}\ } & {|r| \geq 1}
> \end{matrix} \right..
> $$
>
> The source writes the finite calculation explicitly (for $m \leq n$):
>
> $$
> \left( {1 - r} \right)\sum\limits_{k = m}^{n}ar^{k} = a\left\lbrack {\left( {r^{m} + \ldots + r^{n}} \right) - \left( {r^{m + 1} + \ldots + r^{n + 1}} \right)} \right\rbrack,
> $$
>
> hence $\sum_{k = m}^{n}ar^{k} = \frac{a\left( {r^{m} - r^{n + 1}} \right)}{1 - r}$.

> **Definition: $p$-series**
>
> 给定 $p \in \mathbb{R}$，形如
>
> $$
> \sum\limits_{n = 1}^{\infty}\left( \frac{1}{n} \right)^{p}
> $$
>
> 的 series 称为 $p$-series。

> **Theorem: $p$-series criterion**
>
> A $p$-series converges iff $p > 1$.

> **Proof**
>
> If $p \leq 1$, then $n^{p} \leq n$, so $\frac{1}{n^{p}} \geq \frac{1}{n}$ and comparison with the harmonic series gives divergence. If $p > 1$,
>
> $$
> \sum\limits_{n = 1}^{\infty}\frac{1}{n^{p}} = 1 + \frac{1}{2^{p}} + \frac{1}{3^{p}} + \left( {\frac{1}{4^{p}} + \ldots + \frac{1}{7^{p}}} \right) + \left( {\frac{1}{8^{p}} + \ldots + \frac{1}{15^{p}}} \right) + \ldots
> $$
> $$
> \leq 1 + \frac{2}{2^{p}} + \frac{4}{4^{p}} + \frac{8}{8^{p}} + \ldots = \sum\limits_{j = 0}^{\infty}\left( \frac{1}{2^{p - 1}} \right)^{j} = \frac{1}{1 - \left( \frac{1}{2} \right)^{p - 1}} < \infty.
> $$
>
> The notes record $\sum\frac{1}{n^{2}} = \frac{\pi^{2}}{6}$, $\sum\frac{1}{n^{4}} = \frac{\pi^{4}}{90}$, and "$\sum\frac{1}{n^{3}}$: no nice formula".

> **Example: Telescoping and alternating harmonic series**
>
> $$
> \sum\limits_{n = 1}^{\infty}\left( {\frac{1}{n} - \frac{1}{n + 1}} \right) = \left( {1 - \frac{1}{2}} \right) + \left( {\frac{1}{2} - \frac{1}{3}} \right) + \ldots = \lim\limits_{n\rightarrow\infty}\left( {1 - \frac{1}{n + 1}} \right) = 1.
> $$
>
> For the alternating harmonic series,
>
> $$
> \sum\limits_{k = 1}^{\infty}\frac{\left( {- 1} \right)^{k + 1}}{k} = \left( {1 - \frac{1}{2}} \right) + \left( {\frac{1}{3} - \frac{1}{4}} \right) + \ldots.
> $$
>
> If $s_{n} = \frac{\sum_{k = 1}^{{n{({- 1})}}^{k + 1}}}{k}$, then $\left( s_{2n} \right)$ increases and $\left( s_{2n + 1} \right)$ decreases, so
>
> $$
> \sum\limits_{k = 1}^{\infty}\frac{\left( {- 1} \right)^{k + 1}}{k} = \sup\left\{ s_{2n} \right\} = \inf\left\{ s_{2n + 1} \right\} = \ln 2.
> $$

> **Theorem: Linearity of series**
>
> 设 $\sum a_{n}$ 和 $\sum b_{n}$ converge，且 $c \in \mathbb{R}$。Then
>
> $$
> \sum ca_{n} = c\sum a_{n},\quad\sum\left( {a_{n} + b_{n}} \right) = \sum a_{n} + \sum b_{n}.
> $$
>
> Note: $\sum a_{n}b_{n} \neq \left( {\sum a_{n}} \right)\left( {\sum b_{n}} \right)$.

> **Theorem: Cauchy criterion for convergence**
>
> 令 $\sum a_{k}$ 是 partial sums 为 $\left( s_{n} \right)$ 的 series。则 $\sum a_{k}$ converges iff $\left( s_{n} \right)$ is Cauchy，即对每个 $\varepsilon > 0$ 存在 $N \in \mathbb{N}$ such that
>
> $$
> \left| {s_{n} - s_{m}} \right| < \varepsilon\quad\text{whenever}\quad N \leq m \leq n.
> $$
>
> Equivalently, $\left| {\sum_{k = m + 1}^{n}a_{k}} \right| < \varepsilon$.

> **Proof**
>
> 课后。

> **Theorem: The $n$th-term test**
>
> If $\sum a_{n}$ converges, then $a_{n}\rightarrow 0$. Contrapositively useful: $\left( a_{n} \right)$ not tending to $0$ implies $\sum a_{n}$ diverges. （这是 convergence 的 necessary 而非 sufficient condition。）

> **Proof**
>
> $$
> \lim\limits_{k\rightarrow\infty}a_{k} = \lim\limits_{k\rightarrow\infty}\left( {s_{k} - s_{k - 1}} \right) = \lim\limits_{k\rightarrow\infty}s_{k} - \lim\limits_{k\rightarrow\infty}s_{k - 1} = 0.
> $$

> **Theorem: Comparison test**
>
> Let $\left( a_{n} \right)$ be a sequence of nonnegative numbers and let $\left( b_{n} \right)$ be any sequence.
>
> - If $\sum a_{n}$ converges and $\left| b_{n} \right| \leq a_{n}$ for all $n$, then $\sum b_{n}$ converges.
> - If $\sum a_{n} = \infty$ and $b_{n} \geq a_{n}$ for all $n$, then $\sum b_{n} = \infty$.
>
> The finite-tail form is also recorded: if $\sum b_{n}$ converges and $\left| b_{n} \right| \leq a_{n}$ for all $n \geq N$, then $\sum b_{n}$ converges; of course the limit is different.

> **Proof**
>
> Let $\left( s_{n} \right)$ and $\left( t_{n} \right)$ be the partial sums of $\sum a_{k}$ and $\sum b_{k}$. In the first case,
>
> $$
> \left| {t_{n} - t_{m}} \right| = \left| {\sum\limits_{k = m + 1}^{n}b_{k}} \right| \leq \sum\limits_{k = m + 1}^{n}\left| b_{k} \right| \leq \sum\limits_{k = m + 1}^{n}a_{k} = \left| {s_{n} - s_{m}} \right|.
> $$
>
> Thus the Cauchy criterion makes $\sum b_{k}$ converge. The second assertion is similar.

> **Example: Comparison and absolute convergence**
>
> $$
> \sum\limits_{n = 2}^{\infty}\frac{\sin(n)}{n^{2}\ln n}
> $$
>
> converges by comparison with $\sum\frac{1}{n^{2}}$, since for all sufficiently large $n$,
>
> $$
> \left| {\sin\frac{n}{n^{2}\ln n}} \right| < \frac{1}{n^{2}}.
> $$
>
> A series $\sum a_{k}$ **converges absolutely** if $\sum\left| a_{k} \right|$ converges. Absolute convergence is a stronger condition: if $\sum a_{k}$ converges absolutely, then $\sum a_{k}$ converges, because
>
> $$
> \left| {s_{n} - s_{m}} \right| = \left| {\sum\limits_{k = m + 1}^{n}a_{k}} \right| \leq \sum\limits_{k = m + 1}^{n}\left| a_{k} \right|.
> $$

> **Definition: Conditional convergence**
>
> 一个 convergent 但不 absolutely convergent 的 series 称为 conditionally convergent。alternating harmonic series $\frac{\sum_{k = 1}^{{\infty{({- 1})}}^{k + 1}}}{k}$ conditional convergence。

> **Remark: Disturbing fact: reordering**
>
> A conditionally convergent series can be made to converge to any number by "reordering" its terms. A reordered conditionally convergent series still has a limit, but it can be made to converge to any value. For example,
>
> $$
> \sum\frac{\left( {- 1} \right)^{k + 1}}{k} = 1 - \frac{1}{2} + \frac{1}{3} - \frac{1}{4} + \frac{1}{5} - \ldots
> $$
>
> can be reordered to converge to $\sqrt{2}$ by placing enough positive terms first and using negative terms as compensation after the partial sum exceeds $\sqrt{2}$.
>
> In contrast, absolutely convergent series are closed under reordering: if $\sum a_{k}$ converges absolutely, then for every bijection $f:\mathbb{N}\rightarrow\mathbb{N}$,
>
> $$
> \sum\limits_{k = 1}^{\infty}a_{f{(k)}} = \sum\limits_{k = 1}^{\infty}a_{k}.
> $$
>
> For nonnegative $a_{k}$, this follows because $\left( {\sum_{k = 1}^{n}a_{k}} \right)$ and $\left( {\sum_{k = 1}^{n}a_{f{(k)}}} \right)$ are increasing sequences with the same supremum. In the general case take
>
> $$
> b_{n} = \left\{ \begin{matrix}
> a_{n} & {a_{n} \geq 0} \\
> {0\ } & \text{otherwise}
> \end{matrix} \right.,\quad c_{n} = \left\{ \begin{matrix}
> \left| a_{n} \right| & {a_{n} < 0} \\
> {0\ } & \text{otherwise}
> \end{matrix} \right.,
> $$
>
> so $a_{n} = b_{n} - c_{n}$, and apply the nonnegative claim to $b_{n},c_{n}$.

> **Theorem: Root test**
>
> Let $\left( a_{n} \right)$ be a sequence in $\mathbb{R}$ and let $\rho = \operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}}$.
>
> - If $\rho < 1$, then $\sum a_{n}$ converges absolutely.
> - If $\left| a_{n} \right| \geq 1$ for infinitely many $n$ (which happens when $\rho > 1$), then $\sum a_{n}$ diverges.
>
> Note: $L = \operatorname{lim\, sup}a_{n}$ iff, for every $\varepsilon > 0$, there are only finitely many $n$ with $a_{n} > L + \varepsilon$, while there are infinitely many $n$ with $a_{n} > L - \varepsilon$.

> **Proof**
>
> Assume $\rho < 1$, fix $\rho < r < 1$, and choose $N$ such that $\left| a_{n} \right|^{\frac{1}{n}} \leq r$ for $n \geq N$. Then $\left| a_{n} \right| \leq r^{n}$ and comparison with $\sum r^{n}$ proves absolute convergence. If $\left| a_{n} \right| \geq 1$ infinitely often, then $a_{n}$ does not tend to $0$, so the $n$th-term test gives divergence.

> **Theorem: Ratio test**
>
> Let $\left( a_{n} \right)$ be a sequence of nonzero numbers.
>
> - If $\operatorname{lim\, sup}\left| \frac{a_{n + 1}}{a_{n}} \right| < 1$, then $\sum a_{n}$ converges absolutely.
> - If $\operatorname{lim\, inf}\left| \frac{a_{n + 1}}{a_{n}} \right| > 1$, then $\sum a_{n}$ diverges.
>
> This follows from the root test and the lecture's fact
>
> $$
> \operatorname{lim\, inf}\left| \frac{a_{n + 1}}{a_{n}} \right| \leq \operatorname{lim\, inf}\left| a_{n} \right|^{\frac{1}{n}} \leq \operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}} \leq \operatorname{lim\, sup}\left| \frac{a_{n + 1}}{a_{n}} \right|.
> $$

> **Remark: Root and ratio tests**
>
> root test implies ratio test；root test 通常比 ratio test 更强。Both are inconclusive when $\operatorname{lim\, sup}\left| a_{n} \right|^{\frac{1}{n}} = 1$ or $\lim\left| \frac{a_{n + 1}}{a_{n}} \right| = 1$ (for example $a_{n} = \frac{1}{n}$, $b_{n} = \frac{1}{n^{2}}$). If either limit exists and is $r$, there is absolute convergence for $r < 1$ and divergence for $r > 1$. Whenever the root test is inconclusive, the ratio test is also inconclusive（反而不用再试）.

> **Theorem: Alternating Series Test**
>
> If $\left( a_{k} \right)$ is a decreasing sequence of positive numbers converging to $0$, then
>
> $$
> \sum\limits_{k = 1}^{{\infty{({- 1})}}^{k + 1}}a_{k}
> $$
>
> converges.

> **Proof**
>
> Let $s_{n} = \sum_{k = 1}^{{n{({- 1})}}^{k + 1}}a_{k}$. Then
>
> $$
> s_{2n} = \left( {a_{1} - a_{2}} \right) + \left( {a_{3} - a_{4}} \right) + \ldots + \left( {a_{2n - 1} - a_{2n}} \right)
> $$
>
> is increasing and bounded above by $a_{1}$, hence converges to $\ell$. Choose $N$ so that $\left| {s_{2n} - \ell} \right| < \frac{\varepsilon}{2}$ and $\left| a_{2n + 1} \right| < \frac{\varepsilon}{2}$ for $n \geq N$. Then
>
> $$
> \left| {s_{2n + 1} - \ell} \right| \leq \left| {s_{2n} - \ell} \right| + \left| a_{2n + 1} \right| < \varepsilon.
> $$
>
> Thus $s_{2n + 1}\rightarrow\ell$ as well, hence $s_{n}\rightarrow\ell$.

> **Theorem: Integral test**
>
> Let $f$ be a positive and decreasing function on $\left\lbrack {1,\infty} \right)$. Then
>
> $$
> \sum\limits_{k = 1}^{\infty}f(k)\ \text{converges}\quad\Leftrightarrow\quad\int_{1}^{\infty}f(x)\, dx
> $$
>
> converges, where
>
> $$
> \int_{1}^{\infty}f(x)\, dx = \lim\limits_{b\rightarrow\infty}\int_{1}^{b}f(x)\, dx.
> $$
>
> Note: 此时我们还没有严格定义 improper integral；integral test 的证明以后 再证，但其意义很直观，并由矩形比较
>
> $$
> f\left( {k + 1} \right) \leq \int_{k}^{k + 1}f(x)\, dx \leq f(k).
> $$
>
> L15 p.4 的紫色 rectangle sketch 就是这组不等式：一个宽度为 $1$ 的 interval $\left\lbrack {k,k + 1} \right\rbrack$ 上，decreasing curve 下的 area 介于两端点高的 rectangles 之间。其 native table reconstruction is
>
>   ----------------------------------- -------------------------------------------------------- -----------------
>   left rectangle                      curve area over $\left\lbrack {k,k + 1} \right\rbrack$   right rectangle
>   $f\left( {k + 1} \right) \cdot 1$   $\int_{k}^{k + 1}f(x)\, dx$                              $f(k) \cdot 1$
>   lower bound                         middle                                                   upper bound
>   ----------------------------------- -------------------------------------------------------- -----------------
>
> .

> **Remark: Numerical Series Summary**
>
> \(1\) Cauchy Criterion: $\sum a_{k}$ converges iff $\left( s_{n} \right)$ is Cauchy. (2) $n$th term test: $\left( a_{n} \right)$ not tending to $0$ implies divergence. (3) Comparison Test. (4) Root Test. (5) Ratio Test. (6) Alternating Series Test: positive decreasing $\left( a_{n} \right)$ converging to $0$ makes its alternating series converge. (7) Integral Test for positive decreasing $f$.
>
> Abs convergence $\Rightarrow$ convergence. Abs convergence is closed under reordering; conditionally convergent series are not.

