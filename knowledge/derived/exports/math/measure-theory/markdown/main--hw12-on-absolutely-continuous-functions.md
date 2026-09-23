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
source: "notes/math/measure-theory/homeworks/hw12-on_absolutely-continuous-functions.typ"
subtitle: Typst-first course notes and worked homeworks
title: "MATH 597: Measure Theory"
---
# Homework 12: on absolutely continuous functions (40/40)

*Some of the following questions will be graded. Do them, and do hand them in*.

## Terminologies 的 communication: $\left. |\mu_{F} \middle| = \mu_{T_{F}} \right.$ {#terminologies-的-communication-mu_fmu_t_f}

Let $F:{\mathbb{R}}\rightarrow{\mathbb{R}}$ be a function in NBV. Prove that total variation of the complex measure associated to $F$ is the complex measure associated to the total variation of $F$. In other words, prove that $\left. |\mu_{F} \middle| = \mu_{T_{F}} \right.$. *Hint*: see Exercise 28 in Chapter 3 of \[Folland\]; proofs by terminology alone are not valid.

> **Proof**
>
> Set:
>
> $$
> \left. G(x): = \middle| \mu_{F} \middle| (( - \infty,x\rbrack) \right.
> $$
>
> **Claim 1: It suffices to show that $G = T_{F}$.**\
> Proof of Claim 1: Since $F \in NBV$, $\mu_{F}$ is then a complex (regular) Borel measure, as we have shown in class; And by def, $\left. |\mu_{F} \middle| (E) = \int_{E} \middle| f \middle| \, dm \right.$ where $f = \frac{d\mu_{F}}{dm} \in L^{1}(m)$, thus $|\mu_{F}|$ is also a complex (regular) Borel measure since it is finite.\
> Thus $G \in NBV$ and its association with $|\mu_{F}|$ is unique. if $G = T_{F}$, it is then also uniquely associated with $\mu_{T_{F}}$, which implies that $\left. \mu_{T_{F}} = \middle| \mu_{F}| \right.$.\
> **Claim 2: $G = T_{F}$ Indeed.**\
> Proof of Claim 2:\
> First we verity that $T_{F} \leq G$:\
> By def:
>
> $$
> \begin{matrix}
> {T_{F}(x)} & {= \sup\left\{ {\sum\limits_{j = 1}^{n}\left| {F\left( x_{j} \right) - F\left( x_{j - 1} \right)} \right|:n \in {\mathbb{N}}, - \infty < x_{0} < \ldots < x_{n} = x} \right\}} \\
>  & {= \sup\left\{ {\sum\limits_{j = 1}^{n}\left| {\mu_{F}\left( {- \infty,x_{j}} \right\rbrack - \mu_{F}\left( {- \infty,x_{j - 1}} \right\rbrack} \right|:n \in {\mathbb{N}}, - \infty < x_{0} < \ldots < x_{n} = x} \right\}} \\
>  & {= \sup\left\{ {\sum\limits_{j = 1}^{n}\left| {\mu_{F}\left( {x_{j},x_{j - 1}} \right\rbrack} \right|:n \in {\mathbb{N}}, - \infty < x_{0} < \ldots < x_{n} = x} \right\}} \\
>  & {\leq \sup\left\{ |\ \mu_{F}( - \infty,x_{0}\rbrack\  \middle| + \sum\limits_{j = 1}^{n}\left| {\mu_{F}\left( {x_{j},x_{j - 1}} \right\rbrack} \right|:n \in {\mathbb{N}}, - \infty < x_{0} < \ldots < x_{n} = x \right\}} \\
>  & {\leq \sup\left\{ {\sum\limits_{j = 1}^{n}\left| {\mu_{F}\left( E_{j} \right)} \right|:( - \infty,x\rbrack = \bigsqcup\limits_{j = 1}^{n}E_{j}} \right\}} \\
>  & \left. = \middle| \mu_{F} \middle| (( - \infty,x\rbrack) = G(x) \right.
> \end{matrix}
> $$
>
> This proves this direction.\
> Then we verity that $G \leq T_{F}$:\
> **Claim 2.1: $\left| {\mu_{F}(E)} \right| = \mu_{T_{F}}(E)$ for all borel set $E$.**\
> First, for h-interval $E = (a,b\rbrack$, we have:
>
> $$
> \begin{matrix}
> \left| {\mu_{F}(E)} \right| & {= \left| {\mu_{F}(a,b\rbrack} \right|} \\
>  & \left. = \left| {\mu_{F}( - \infty,b\rbrack - \mu_{F}( - \infty,a\rbrack} \right| = \middle| F(b) - F(a)| \right. \\
>  & {\leq \sup\left\{ {\sum\limits_{j = 1}^{n}\left| {F\left( x_{j} \right) - F\left( x_{j - 1} \right)} \right|:n \in {\mathbb{N}},a = x_{0} < \ldots < x_{n} = b} \right\},\quad\text{by tri ineq}} \\
>  & {= T_{F}(b) - T_{F}(a)} \\
>  & {= \mu_{T_{F}}( - \infty,b\rbrack - \mu_{T_{F}}( - \infty,a\rbrack} \\
>  & {= \mu_{T_{F}}(a,b\rbrack = \mu_{T_{F}}(E)}
> \end{matrix}
> $$
>
> Also for intervals like $( - \infty,b\rbrack$, we have
>
> $$
> \left| {\mu_{F}(( - \infty,b\rbrack)} \right| = \left| {\sum\limits_{k = 1}^{\infty}\mu_{F}((b - k,b + 1 - k\rbrack)} \right| \leq \sum\limits_{k = 1}^{\infty}\left| {\mu_{F}((b - k,b + 1 - k\rbrack)} \right| \leq \sum\limits_{k = 1}^{\infty}\mu_{T_{F}}((b - k,b + 1 - k\rbrack) = \mu_{T_{F}}(( - \infty,b\rbrack)
> $$
>
> Thus **$\left| {\mu_{F}(E)} \right| = \mu_{T_{F}}(E)$ is true for all left-open, right-closed intervals $E$**, and thus also true for all finite disjoint unions of left-open, right-closed intervals. Notice that, the **set of all finite disjoint unions of left-open, right-closed intervals is an algebra,** we denote it by $\mathcal{A}$. So
>
> $$
> \left| {\mu_{F}(E)} \right| \leq \mu_{T_{F}}(E),\quad\forall E \in \mathcal{A}
> $$
>
> Now we define:
>
> $$
> \mathcal{C} := \left\{ E \in \mathcal{B}({\mathbb{R}}): \middle| \ \mu_{F}(E)\  \middle| \leq \mu_{T_{F}}(E) \right\}
> $$
>
> Then we have:
>
> $$
> \mathcal{A} \subset \mathcal{C}
> $$
>
> Notice that increasing sequence $\left( E_{k} \right)_{k = 1}^{\infty}$ in $\mathcal{C}$, we have:
>
> $$
> \begin{matrix}
> \left| {\mu_{F}\left( {\bigcup\limits_{k = 1}^{\infty}E_{k}} \right)} \right| & {= \left| {\mu_{F}\left( {\bigsqcup\limits_{k = 1}^{\infty}(E_{k}\backslash\bigcup\limits_{j = 1}^{k - 1}E_{j})} \right)} \right|} \\
>  & \left. \leq \sum\limits_{k = 1}^{\infty} \middle| \mu_{F}(E_{k}\backslash\bigcup\limits_{j = 1}^{k - 1}E_{j})| \right. \\
>  & {\leq \sum\limits_{k = 1}^{\infty}\mu_{T_{F}}(E_{k}\backslash\bigcup\limits_{j = 1}^{k - 1}E_{j})} \\
>  & {= \mu_{T_{F}}\left( {\bigcup\limits_{k = 1}^{\infty}E_{k}} \right)}
> \end{matrix}
> $$
>
> Showing that $\mathcal{C}$ is closed under countable increasing unions. Similarly, $\mathcal{C}$ is closed under countable decreasing intersections. This shows that **$\mathcal{C}$ is a monotone class**. Since $\mathcal{C} \supset \mathcal{A}$ which is an algebra that generates the $\sigma$-algebra $\mathcal{B}({\mathbb{R}})$, we have by the monotone class lemma:
>
> $$
> \mathcal{B}({\mathbb{R}}) \subset \mathcal{C}
> $$
>
> This finishes the proof that $\left| {\mu_{F}(E)} \right| = \mu_{T_{F}}(E)$ for all borel set $E$.
>
> Then we have:
>
> $$
> \begin{matrix}
> {\left| \mu_{F} \right|(E)} & {= \sup\left\{ {\sum\limits_{k = 1}^{\infty}\left| {\mu_{F}\left( E_{k} \right)} \right|:E = \bigsqcup\limits_{k = 1}^{\infty}E_{k}} \right\}} \\
>  & {\leq \sup\left\{ {\sum\limits_{k = 1}^{\infty}\mu_{T_{F}}\left( E_{k} \right):E = \bigsqcup\limits_{k = 1}^{\infty}E_{k}} \right\}} \\
>  & {= \sup\left\{ {\mu_{T_{F}}(E)} \right\}} \\
>  & {= \mu_{T_{F}}(E)}
> \end{matrix}
> $$
>
> Therefore we have
>
> $$
> G \leq T_{F}
> $$
>
> Combining both directions we have
>
> $$
> G = T_{F}
> $$
>
> which shows by Claim 1 that
>
> $$
> \left. |\mu_{F} \middle| = \mu_{T_{F}} \right.
> $$

## Characterization of Lipschitz continuity: $AC$ + bounded derivative$\Leftrightarrow$Lipschitz continuity: {#characterization-of-lipschitz-continuity-ac-bounded-derivativeifflipschitz-continuity}

Consider a function $F:{\mathbb{R}}\rightarrow{\mathbb{R}}$. Show that $\left. |F(x) - F(y) \middle| \leq M \middle| x - y| \right.$ for all $x,y$ (i.e. $F$ is Lipschitz continuous with Lipschitz constant at most $M$) iff $F$ is absolutely continuous, and $\left. |F'(x) \middle| \leq M \right.$ for Lebesgue a.e. $x$.

> **Proof**
>
> Forward Direction ($\Longrightarrow$): Suppose $F$ is Lipschitz continuous, and take Lipschitz constant $M > 0$ such that $\left. |F(y) - F(x) \middle| \leq M \middle| y - x| \right.$ for all $x,y \in {\mathbb{R}}$.\
> Let $\epsilon > 0$.\
> Let $\left( {a_{1},b_{1}} \right),\left( {a_{2},b_{2}} \right),\ldots,\left( {a_{n},b_{n}} \right)$ be a finite collection of disjoint intervals with $\sum_{k = 1}^{n}\left( {b_{k} - a_{k}} \right) < \frac{\epsilon}{M}$ then we have:
>
> $$
> \sum\limits_{k = 1}^{n}\left| {F\left( b_{k} \right) - F\left( a_{k} \right)} \right| \leq \sum\limits_{k = 1}^{n}M\left| {b_{k} - a_{k}} \right| = M\sum\limits_{k = 1}^{m}\left( {b_{k} - a_{k}} \right) < M\frac{\varepsilon}{M} = \varepsilon
> $$
>
> This shows that $F$ is absolutely continuous. And since $F$ is absolutely continuous, its restriction on any compact interval is of bounded variation, thus differentiable a.e.; thus $F$ is differentiable $m$-a.e.\
> Then for $m$-a.e. $x \in {\mathbb{R}}$, we have:
>
> $$
> \left| {F'(x)} \right| = \left| {\lim\limits_{y\rightarrow x}\frac{F(y) - F(x)}{y - x}} \right| = \lim\limits_{y\rightarrow x}\frac{|F(y) - F(x)|}{|y - x|} \leq \lim\limits_{y\rightarrow x}\frac{\left. M \middle| y - x| \right.}{|y - x|} = \lim\limits_{y\rightarrow x}M = M
> $$
>
> This finishes the proof of the forward direction.\
> Backward Direction ($\Longrightarrow$): Suppose $F$ is absolutely continuous, and $\left. |F'(x) \middle| \leq M \right.$ for $m$-a.e. $x$.\
> Let $x,y \in {\mathbb{R}}$ and $x \leq y$ then on $\lbrack x,y\rbrack$ we have:
>
> $$
> \left. |F(y) - F(x) \middle| = \left| {\int_{x}^{y}F'dm} \right| \leq \int_{x}^{y}\left| F' \right|dm \leq \int_{x}^{y}Mdm = M(y - x) = M \middle| y - x| \right.
> $$
>
> Therefore $F$ is Lipschitz continuous with Lipschitz constant $M$.

## $AC$ function 保留 null sets

Let $F:{\mathbb{R}}\rightarrow{\mathbb{R}}$ be an absolutely continuous function. Prove that $F$ maps null sets to null sets. In other words, if $E \subset {\mathbb{R}}$ is a set of Lebesgue measure zero, then $F(E) = \left\{ {F(x) \mid x \in E} \right\}$ is also of Lebesgue measure zero. (In particular, $F(E)$ is Lebesgue measurable, cf. HW4#6.)

> **Proof**
>
> Fix $F:{\mathbb{R}}\rightarrow{\mathbb{R}}$ abs ctn, and $E \subset {\mathbb{R}}$ s.t. $m(E) = 0$.\
> Let $\epsilon > 0$.\
> Since $F \in AC$, there exists some $\delta > 0$ s.t. for any disjoint intervals $(a_{1},b_{1}),\cdots,(a_{n},b_{n})$ s.t. $\sum_{1}^{n}(b_{j} - a_{j}) < \delta$, we have: $\left. \sum_{1}^{N} \middle| F(b_{j}) - F(a_{j}) \middle| < \epsilon \right.$.\
> Fix this $\delta$. Since $m(E) = 0$, there exists finite collection of bounded open intervals $(c_{1},d_{1}),\cdots.(c_{n},d_{n})$ such that
>
> $$
> E \subset \bigcup\limits_{1}^{n}(c_{j},d_{j})
> $$
>
> with
>
> $$
> \sum\limits_{1}^{n}m(c_{j},d_{j}) = \sum\limits_{1}^{n}(d_{j} - c_{j}) < \delta
> $$
>
> Notice that, though these open intervals are not necessarily disjoint, but finite union of bounded open intervals can be expressed as finite union of disjoint open intervals. We just need to connect those open intervals that has intersection.\
> By doing this, we get some disjoint intervals $(a_{1},b_{1}),\cdots,(a_{N},b_{N})$ from $(c_{1},d_{1}),\cdots.(c_{n},d_{n})$, with
>
> $$
> E \subset \bigcup\limits_{1}^{N}(a_{j},b_{j}) = \bigcup\limits_{1}^{n}(c_{j},d_{j})
> $$
>
> and (since new intervals remove the intersection part and keep the union:)
>
> $$
> \sum\limits_{1}^{N}m(a_{j},b_{j}) \leq \sum\limits_{1}^{n}m(c_{j},d_{j}) < \delta
> $$
>
> Now we can apply the absolute continuity. Since $F \in AC$, it is continuous for sure. Thus on $\lbrack a_{j},b_{j}\rbrack$, it takes max and min value respectively on some $x_{j},y_{j} \in \lbrack a_{j},b_{j}\rbrack$. Then
>
> $$
> F(\lbrack a_{j},b_{j}\rbrack) = \lbrack F(y_{j}),F(x_{j})\rbrack
> $$
>
> So
>
> $$
> F((a_{j},b_{j})) \subset \lbrack F(y_{j}),F(x_{j})\rbrack
> $$
>
> This is by the intermediate value theorem. We denote the open interval using $x_{j},y_{j}$ as endpoints as $I_{j}$. We then have $I_{j} \subset \lbrack a_{j},b_{j}\rbrack$.\
> Thus
>
> $$
> \left. \sum\limits_{1}^{N} \middle| I_{j} \middle| < \delta \right.
> $$
>
> and by abs ctnity, we have :
>
> $$
> \left. \sum\limits_{1}^{N} \middle| F(y_{j}) - F(x_{j}) \middle| < \epsilon \right.
> $$
>
> Since $E \subset \bigcup_{1}^{N}(a_{i},b_{i})$, we have
>
> $$
> F(E) \subset F(\bigcup\limits_{1}^{N}(a_{i},b_{i})) = \bigcup\limits_{1}^{N}F((a_{i},b_{i})) \subset \bigcup\limits_{1}^{N}\lbrack F(y_{j}),F(x_{j})\rbrack
> $$
>
> so we then have
>
> $$
> \left. m(F(E)) \leq m(\bigcup\limits_{1}^{N}\lbrack F(y_{j}),F(x_{j})\rbrack) \leq \sum\limits_{1}^{N}m(\lbrack F(y_{j}),F(x_{j})\rbrack) = \sum\limits_{1}^{N} \middle| F(y_{j}) - F(x_{j}) \middle| < \epsilon \right.
> $$
>
> Since $\epsilon > 0$ is arbitrary, this finishes the proof that
>
> $$
> m(F(E)) = 0
> $$

## $BV$ function 每点的 left[ ]{style="white-space: pre-wrap"} right limit 一定存在

Prove directly from the definition that if $F:{\mathbb{R}}\rightarrow{\mathbb{R}}$ is a function of bounded variation, then $F$ admits a left and a right limit at every point. In other words, for any $a \in {\mathbb{R}}$, the limits

$$
\lim\limits_{x\rightarrow a +}F(x)\quad\text{and}\quad\lim\limits_{x\rightarrow a -}F(x)
$$

both exist. Do not use the Jordan decomposition. *Hint*: as is often the case, limits can be studied through limsup and liminf.

> **Proof**
>
> Let $F:{\mathbb{R}}\rightarrow{\mathbb{R}}$ be a function of bounded variation, fix $a \in {\mathbb{R}}$.\
> Define
>
> $$
> L := \operatorname{lim\, sup}\limits_{x\rightarrow a^{+}}F(x),\quad l := \operatorname{lim\, inf}\limits_{x\rightarrow a^{+}}F(x)
> $$
>
> Then we have $L \geq l$. We will show $L = l$.\
> Let $\epsilon > 0$.\
> Suppose for contradiction that $L > l + \epsilon$.\
> Let $a_{n}\rightarrow a$ be a seq. By the def of limsup and lininf, there must exists a subseq $a_{n_{j}}$ such that for some $N_{1}$, we have:
>
> $$
> \left. |L - F(a_{n_{j}}) \middle| < \frac{\epsilon}{4},\quad\forall j \geq N_{1} \right.
> $$
>
> And there must exists a subseq $a_{m_{k}}$ such that for some $N_{2}$, we have:
>
> $$
> \left. |F(a_{m_{k}}) - l \middle| < \frac{\epsilon}{4},\quad\forall k \geq N_{2} \right.
> $$
>
> Then for all $j,k \geq \max(N_{1},N_{2})$ we have:
>
> $$
> \left. |F(a_{n_{j}}) - F(a_{m_{k}}) \middle| \geq \middle| L - l \middle| - \middle| L - F(a_{n_{j}}) \middle| - \middle| F(a_{m_{k}}) - l \middle| > \frac{\epsilon}{2} \right.
> $$
>
> Notice: for any $j \geq \max(N_{1},N_{2})$ and given start $K_{0} \in {\mathbb{N}}$, there exists some $k \geq \max(K_{0},N_{1},N_{2})$ s.t.
>
> $$
> a_{m_{k}} < a_{n_{j}}
> $$
>
> This is because $a_{m_{k}}\rightarrow a$ as $k\rightarrow\infty$.\
> And this is same on the $k$ side.\
>
> ![Figure 40:[ ]{style="white-space: pre-wrap"}unbounded total variation by alternating limsup/inf seq](.assets/main--figure-raster-038.png){width="50%"}
>
> Thus, by picking $j_{0} = \max(N_{1},N_{2})$, we can pick $k_{0}$ s.t. $a_{m_{k_{0}}} < a_{n_{j_{0}}}$, and then pick $j_{1}$ s.t. $a_{m_{j_{1}}} < a_{n_{k_{0}}}$ ; and inductively, for the pick of $j_{p}$, we can always pick $k_{p}$ s.t. $a_{m_{k_{p}}} < a_{n_{j_{p}}}$ an then pick $a_{m_{j_{p + 1}}} < a_{n_{k_{p}}}$.\
> We do this process to get the finite seq $j_{0},k_{0},j_{1},k_{1},\cdots,j_{p},k_{p}$ for some int $p$. Then we have:
>
> $$
> \left. T_{F}(\lbrack a,a_{n_{j_{0}}}\rbrack) \geq \middle| F(a_{n_{j_{0}}}) - F(a_{m_{k_{0}}}) \middle| + \middle| F(a_{n_{k_{0}}}) - F(a_{m_{j_{1}}}) \middle| + \cdots + \middle| F(a_{n_{j_{p}}}) - F(a_{m_{k_{p}}}) \middle| + \middle| F(a_{n_{k_{p}}}) - F(a) \middle| \geq p\frac{\epsilon}{2} \right.
> $$
>
> As $p\rightarrow\infty$, we have $T_{F}(\lbrack a,a_{j_{0}}\rbrack) \geq p\frac{\epsilon}{2}\rightarrow\infty$. Thus by def, $T_{F}(\lbrack a,a_{j_{0}}\rbrack) = \infty$, contradicting the assumption that $F$ is a function of bounded variation.\
> Thus by contradiction, it shows that
>
> $$
> L \leq l + \epsilon
> $$
>
> Since $L \geq l$ and $\epsilon > 0$ is arbitrary, this finishes the proof that
>
> $$
> L = l
> $$
>
> Since we have $\operatorname{lim\, sup}_{x\rightarrow a^{+}}F(x) = \operatorname{lim\, inf}_{x\rightarrow a^{+}}F(x)$, we then have:
>
> $$
> \lim\limits_{x\rightarrow a +}F(x)\exists
> $$
>
> By same reasoning, we can get that
>
> $$
> \lim\limits_{x\rightarrow a -}F(x)\exists
> $$

## $ACL^{1}$ 函数的导数绝对值的总积分为 $0\Longrightarrow f = 0$ {#ac-l1-函数的导数绝对值的总积分为-0implies-f-0}

Let $f:{\mathbb{R}}\rightarrow{\mathbb{R}}$ be an absolutely continuous function. Assume that $f \in L^{1}({\mathbb{R}})$, and that

$$
\lim\limits_{t\rightarrow 0 +}\int_{- \infty}^{\infty}\left| \frac{f(x + t) - f(x)}{t} \right|\, dx = 0.
$$

Prove that $f = 0$. *Hint*: consult Fatou Samba but ignore any dance moves.

> **Proof**
>
> We define:
>
> $$
> D_{t}(x): = \frac{f(x + t) - f(x)}{t}
> $$
>
> Since $f \in AC$, we have that $f' \in L^{1}(m)$ exists a.e., thus by def of derivative we have: So we take a seq of functions $\left. g_{n}: = \middle| D_{1/n}| \right.$, we then have:
>
> $$
> \left. \lim\limits_{n\rightarrow\infty}g_{n} = \lim\limits_{t\rightarrow 0^{+}} \middle| D_{t} \middle| = \middle| f' \right|\quad\text{a.e.}
> $$
>
> Notice we are given the condition that:
>
> $$
> \lim\limits_{t\rightarrow 0^{+}} \parallel D_{t}\underset{1}{\parallel} = \lim\limits_{n\rightarrow\infty}\int g_{n} = 0
> $$
>
> Since fixing $t$, $f(x + t)$ and $f(x)$ are measurable functions, $D_{t}$ is also measurable, and thus $g_{n} \in L^{+}(m)$ for each $n$. (we can ignore the points where the limit does not exist, since the set of these points has Lebesgue measure $0$.)\
> Applying Fatou's Lemma we have:
>
> $$
> \int\operatorname{lim\, inf}\limits_{n\rightarrow\infty}g_{n}\, dx \leq \operatorname{lim\, inf}\limits_{n\rightarrow\infty}\int g_{n}dx = \lim\limits_{n\rightarrow\infty}\int g_{n} = 0
> $$
>
> Since $g_{n}$ and $\operatorname{lim\, inf}_{n\rightarrow\infty}g_{n} = \lim_{n\rightarrow\infty}g_{n}$ are nonnegative, we have:
>
> $$
> \left. |f' \middle| = \lim\limits_{n\rightarrow\infty}g_{n} = 0\quad\text{a.e.} \right.
> $$
>
> Thus
>
> $$
> f' = 0\quad\text{a.e.}
> $$
>
> Since by AC, we can apply FTC: Let $\lbrack a,b\rbrack$ be an arbitrary interval, then by FTC we have:
>
> $$
> f(x) - f(a) = \int_{a}^{x}0\, dy = 0,\quad\forall x \in \lbrack a,b\rbrack
> $$
>
> Thus
>
> $$
> f(x) = f(a),\quad\forall x \in \lbrack a,b\rbrack
> $$
>
> Since the interval $\lbrack a,b\rbrack$ is arbitrary, this proves: $f$ is a constant function. (By taking $I_{n}: = \lbrack - n,n\rbrack$ over $n \in {\mathbb{N}}$, we can get $f(x) = 0$ for all $x \in {\mathbb{R}}$.)\
> Suppose for contradiction that $f = c \neq 0$, then
>
> $$
> \left. \int \middle| f \middle| = \int_{\mathbb{R}} \middle| c \middle| = \infty \right.
> $$
>
> contradicting $f \in L^{1}(m)$, thus we have
>
> $$
> f = 0
> $$
>
> This finishes the proof.

