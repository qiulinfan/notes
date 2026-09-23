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
source: "notes/math/mathematical-analysis/chapters/05-differentiation.typ"
subtitle: Single-variable analysis --- migrated working notes
title: Mathematical Analysis
---
# Differentiation

## Derivatives and rules (L13)

> **Definition: Derivative**
>
> Let $A \subset \mathbb{R}$, $f:A\rightarrow\mathbb{R}$, and $a \in A \cap A'$ (此处 $a$ 是 accumulation point，所以 $a$ lies in the domain of $f'$). Define the derivative of $f$ at $a$ by
>
> $$
> f^{'{(a)}} = \lim\limits_{h\rightarrow 0}\frac{f\left( {a + h} \right) - f(a)}{h}.
> $$
>
> If $x = a + h$, then $h = x - a$, hence equivalently
>
> $$
> f^{'{(a)}} = \lim\limits_{x\rightarrow a}\frac{f(x) - f(a)}{x - a}.
> $$
>
> 如果 $f^{'{(a)}}$ exists，则称 $f$ is differentiable at $a$. 把 $a$ 作为 variable 时，我们把 derivative 看作 function：
>
> $$
> f^{'{(x)}} = \lim\limits_{h\rightarrow 0}\frac{f\left( {x + h} \right) - f(x)}{h},\quad\operatorname{dom}\left( f' \right) = \left\{ {x \in \operatorname{dom}(f):f\ \text{is differentiable at}\ x} \right\}.
> $$
>
> 如果 $B \subset \operatorname{dom}(f)$ 且 $\forall x \in B$ 都有 $f$ differentiable at $x$， 则称 $f$ is differentiable on $B$.

> **Remark: Geometrical meaning and linear approximation**
>
> 我们称 derivative 的 geometrical meaning 为：the slope of the line tangent to the graph of $y = f(x)$ at point $\left( {a,f(a)} \right)$. 我们称
>
> $$
> L(x) = f(a) + f^{'{(a)}}\left( {x - a} \right)
> $$
>
> 为 the linear approximation of $f$ near $x = a$.
>
> L13 p.1 的两幅草图可由下列关系读出：左图把 $a$ 处的 curve 与其 tangent line 放在同一坐标轴上；右图标为 ctn, 但不 diffble''。
>
>   ------------------- ------------------------------------------------------------------------
>   tangent at $a$      $y = L(x) = f(a) + f^{'{(a)}}\left( {x - a} \right)$ and $L(a) = f(a)$
>   ctn, 但不 diffble   left/right slopes do not agree, so $f^{'{(a)}}$ DNE
>   ------------------- ------------------------------------------------------------------------

> **Theorem: Differentiability implies continuity**
>
> If $f$ is differentiable at $a$, then $f$ is continuous at $a$.

> **Proof**
>
> Suppose $f^{'{(a)}}$ exists, so $a \in \operatorname{dom}\left( f' \right)$. Then
>
> $$
> \lim\limits_{x\rightarrow a}f(x) = \lim\limits_{x\rightarrow a}\left( {f(a) + \frac{f(x) - f(a)}{x - a}\left( {x - a} \right)} \right) = f(a) + f^{'{(a)}}0 = f(a).
> $$
>
> Since $a \in \operatorname{dom}\left( f' \right)$, $\lim_{x\rightarrow a}f(x) = f(a)$ implies continuity. 因而 differentiability $\Rightarrow$ continuity，但反之不成立（例如尖点图形）。

> **Theorem: Linearity of the derivative**
>
> Suppose $f,g$ are differentiable at $a$, and $c \in \mathbb{R}$. Then $cf$ and $f + g$ are differentiable at $a$, and
>
> $$
> \left( {cf} \right)^{'{(a)}} = cf^{'{(a)}},\quad\left( {f + g} \right)^{'{(a)}} = f^{'{(a)}} + g^{'{(a)}}.
> $$
>
> 即 $\frac{d}{dx}$ is a linear operator.

> **Proof**
>
> $$
> \left( {cf} \right)^{'{(a)}} = \lim\limits_{h\rightarrow 0}\frac{cf\left( {a + h} \right) - cf(a)}{h} = c\lim\limits_{h\rightarrow 0}\frac{f\left( {a + h} \right) - f(a)}{h} = cf^{'{(a)}},
> $$
>
> and the source continues the second calculation line by line:
>
> $$
> \left( {f + g} \right)^{'{(a)}} = \lim\limits_{h\rightarrow 0}\frac{\left( {f + g} \right)\left( {a + h} \right) - \left( {f + g} \right)(a)}{h}\backslash = \lim\limits_{h\rightarrow 0}\frac{f\left( {a + h} \right) - f(a)}{h} + \lim\limits_{h\rightarrow 0}\frac{g\left( {a + h} \right) - g(a)}{h}\backslash = f^{'{(a)}} + g^{'{(a)}}.
> $$

> **Theorem: Product rule**
>
> 若 $f,g$ 在 $a$ 处 diffble，则 $fg$ 在 $a$ 处 diffble，且
>
> $$
> \left( {fg} \right)^{'{(a)}} = f^{'{(a)}}g(a) + f(a)g^{'{(a)}}.
> $$

> **Proof**
>
> $$
> \begin{matrix}
> \left( {fg} \right)^{'{(a)}} & {= \lim\limits_{h\rightarrow 0}\frac{f\left( {a + h} \right)g\left( {a + h} \right) - f(a)g(a)}{h}} \\
>  & {= \lim\limits_{h\rightarrow 0}\frac{\left( {f\left( {a + h} \right) - f(a)} \right)g\left( {a + h} \right) + f(a)\left( {g\left( {a + h} \right) - g(a)} \right)}{h}} \\
>  & {= f^{'{(a)}}\lim\limits_{h\rightarrow 0}g\left( {a + h} \right) + \lim\limits_{h\rightarrow 0}f(a)g^{'{(a)}}} \\
>  & {= f^{'{(a)}}g(a) + f(a)g^{'{(a)}}.}
> \end{matrix}
> $$

> **Theorem: Quotient rule**
>
> 若 $f,g$ 在 $a$ 处 diffble 且 $g(a) \neq 0$，则 $\frac{f}{g}$ 在 $a$ 处 diffble，且
>
> $$
> \left( \frac{f}{g} \right)^{'{(a)}} = \frac{f^{'{(a)}}g(a) - f(a)g^{'{(a)}}}{\left( {g(a)} \right)^{2}}.
> $$

> **Proof**
>
> PF similar to product rule.

记号为 $f^{'{(x)}} = \frac{d}{dx}(f)$，且 $\left. f^{'{(a)}} = \frac{d}{dx} \middle| {}_{x = a}(f) \right.$; likewise $f''(x) = d^{2}\frac{y}{dx^{2}}$, $f''(a)$, $f^{(q)}(x)$, $\ldots$.

> **Example: Polynomials and standard derivatives**
>
> If $p(x) = \sum_{k = 0}^{n}a_{k}x^{k}$ is a polynomial, then
>
> $$
> p^{'{(x)}} = \sum\limits_{k = 1}^{n}ka_{k}x^{k - 1}.
> $$
>
> The proof is by induction on $n$; in particular
>
> $$
> \frac{d}{dx}\left( x^{n} \right) = \frac{d}{dx}\left( {xx^{n}} \right) = x^{n} + x \cdot nx^{n - 1} = \left( {n + 1} \right)x^{n}.
> $$
>
> The lecture records the facts
>
> $$
> \forall p \in \mathbb{R},\quad\frac{d}{dx}\left( x^{p} \right) = px^{p - 1},\quad\frac{d}{dx}\left( a^{x} \right) = \left( {\ln a} \right)a^{x},
> $$
>
> especially $\frac{d}{dx}\left( e^{x} \right) = e^{x}$, and
>
> $$
> \frac{d}{dx}\left( {\sin x} \right) = \cos x,\quad\frac{d}{dx}\left( {\cos x} \right) = - \sin x.
> $$
>
> L13 p.2 还逐项写了以下 derivative-law exercises：
>
> $$
> (1)\quad\frac{d}{dx}\sqrt{x} = \lim\limits_{h\rightarrow 0}\frac{\sqrt{x + h} - \sqrt{x}}{h} = \lim\limits_{h\rightarrow 0}\frac{1}{\sqrt{x + h} + \sqrt{x}} = \frac{1}{2\sqrt{x}};
> $$
> $$
> (2)\quad f(x) = |x|\ \text{is differentiable everywhere except at}x = 0;
> $$
> $$
> (3)\quad\frac{d}{dx}\left( {e^{3x}\sin\left( x^{2} \right)} \right) = 3e^{3x}\sin\left( x^{2} \right) + 2xe^{3x}\cos\left( x^{2} \right);
> $$
> $$
> (4)\quad\lim\limits_{x\rightarrow 4}\frac{x^{\frac{3}{2}} - \sqrt{x} - 6}{x - 4} = f^{'{(4)}} = \frac{11}{4},\quad f(x) = x^{\frac{3}{2}} - \sqrt{x}.
> $$

> **Theorem: Chain rule**
>
> 如果 $f$ 在 $a$ 处 differentiable 且 $g$ 在 $f(a)$ 处 differentiable， 则 $g ○ f$ 在 $a$ 处 differentiable，且
>
> $$
> \left( {g ○ f} \right)^{'{(a)}} = g^{'{({f{(a)}})}}f^{'{(a)}}.
> $$

> **Proof**
>
> 设 $g$ 的辅助函数为
>
> $$
> \varphi(u) = \left\{ \begin{matrix}
> \frac{g(u) - g\left( {f(a)} \right)}{u - f(a)} & {u \neq f(a)} \\
> g^{'{({f{(a)}})}} & {u = f(a)}
> \end{matrix} \right.
> $$
>
> Thus $\varphi(u)\left( {u - f(a)} \right) = g(u) - g\left( {f(a)} \right)$ for all $u$ in the domain of $g$, and $\varphi$ is continuous at $f(a)$. Hence
>
> $$
> \begin{matrix}
> {f^{'{(a)}}g^{'{({f{(a)}})}}} & {= \lim\limits_{x\rightarrow a}\frac{f(x) - f(a)}{x - a}\lim\limits_{x\rightarrow a}\varphi\left( {f(x)} \right)} \\
>  & {= \lim\limits_{x\rightarrow a}\frac{g\left( {f(x)} \right) - g\left( {f(a)} \right)}{x - a} = \left( {g ○ f} \right)^{'{(a)}}.}
> \end{matrix}
> $$
>
> 这个证明的核心在于构造一个函数 $\varphi$，用来模拟用 tangent line 逼近 $g\left( {f(a)} \right)$ 附近的行为，并通过 $g$ 的 differentiability 说明 $\varphi$ 在 $g\left( {f(a)} \right)$ 的 continuity，从而在 limit 中使用 expansion。

> **Example: Derivative need not be continuous**
>
> Let
>
> $$
> f(x) = \left\{ \begin{matrix}
> {x\sin\left( \frac{1}{x} \right)} & {x \neq 0} \\
> 0 & {x = 0}
> \end{matrix} \right.,\quad g(x) = \left\{ \begin{matrix}
> {x^{2}\sin\left( \frac{1}{x} \right)} & {x \neq 0} \\
> 0 & {x = 0}
> \end{matrix} \right..
> $$
>
> We know $f,g$ are continuous everywhere. For $x \neq 0$,
>
> $$
> f^{'{(x)}} = \sin\left( \frac{1}{x} \right) - \left( \frac{1}{x} \right)\cos\left( \frac{1}{x} \right),\quad g^{'{(x)}} = 2x\sin\left( \frac{1}{x} \right) - \cos\left( \frac{1}{x} \right).
> $$
>
> At $0$, $f^{'{(0)}} = \lim_{x\rightarrow 0}\sin\left( \frac{1}{x} \right)$ DNE, while $g^{'{(0)}} = 0$; but $\lim_{x\rightarrow 0}g^{'{(x)}}$ DNE. 因而 derivatives 不连续。

> **Definition: $C^{n}$**
>
> Given $n \in \mathbb{N}$, the function $f \in C^{n}$ ($n$-times continuously differentiable) on an open set $U \subset \mathbb{R}$ if $f^{(n)}$ exists and is continuous on $U$.

## Extrema, MVT, and Darboux (L14)

> **Definition: Local extrema**
>
> Let $A \subset \mathbb{R}$, $f:A\rightarrow\mathbb{R}$, and $c \in A$. If there is $\delta > 0$ such that $f(x) \leq f(c)$ for all $x \in V_{\delta{(c)}} \cap \operatorname{dom}(f)$, then $c$ is a local maximum point of $f$, and $f(c)$ is a local maximum value of $f$. Dually define local minimum point/value; together these are local extreme point and local extrema.
>
> L14 p.1 的曲线标出了一个 local min、两个 local max（其中右侧极大值 高于左侧），以及随后的 local min；其可辨识信息是极值只比较 $c$ 的某个 neighborhood，而非整个 domain。用点位/不等式表表示为
>
>   ------------------------- ------------------------- -------------------------
>   left local min            interior local max        right local min
>   $f(c) \leq f(x)$ nearby   $f(c) \geq f(x)$ nearby   $f(c) \leq f(x)$ nearby
>   ------------------------- ------------------------- -------------------------
>
> .

> **Lemma: Key lemma**
>
> Let $A \subset \mathbb{R}$, $f:A\rightarrow\mathbb{R}$, $c \in A \cap A'$, and suppose $f$ is differentiable at $c$.
>
> \(i\) If $f^{'{(c)}} > 0$, then there is $\delta > 0$ such that, for all $x,y \in V_{\delta{(c)}} \cap A$, $x < c < y$ implies $f(x) < f(c) < f(y)$.
>
> \(ii\) Dually, if $f^{'{(c)}} < 0$, then there is $\delta > 0$ such that $x < c < y$ implies $f(x) > f(c) > f(y)$.

> **Proof**
>
> For (i), let $\varepsilon = \frac{f^{'{(c)}}}{2}$. Fix $\delta > 0$ such that
>
> $$
> \left| {\frac{f(x) - f(c)}{x - c} - f^{'{(c)}}} \right| < \varepsilon
> $$
>
> whenever $0 < \left| {x - c} \right| < \delta$. Thus
>
> $$
> 0 < \frac{f^{'{(c)}}}{2} < \frac{f(x) - f(c)}{x - c} < 3\frac{f^{'{(c)}}}{2}.
> $$
>
> If $x < c < y$, division by $x - c < 0$ gives $f(x) < f(c)$, while division by $y - c > 0$ gives $f(c) < f(y)$. (ii) is dual. 这两条 lemma 的结论也说明： 如果 $f^{'{(c)}} \neq 0$，则 $f$ 在 $c$ 的某个 open neighborhood 中严格 monotone。

> **Corollary: Fermat's theorem**
>
> Suppose $f$ is defined on an open neighborhood of $c$. 如果 $c$ 是 $f$ 的 一个 local extreme point 且 $f^{'{(c)}}$ 存在，则 $f^{'{(c)}} = 0$.

> **Proof**
>
> Directly follows from the key lemma: if $f^{'{(c)}} > 0$ or $f^{'{(c)}} < 0$, then $c$ cannot be a local extreme point.

> **Corollary: Rolle's theorem**
>
> If $f$ is continuous on $\left\lbrack {a,b} \right\rbrack$, differentiable on $\left( {a,b} \right)$, and $f(a) = f(b)$, then there is some $c \in \left( {a,b} \right)$ such that $f^{'{(c)}} = 0$.

> **Proof**
>
> By EVT, choose $x_{0},y_{0} \in \left\lbrack {a,b} \right\rbrack$ such that $f\left( x_{0} \right) \leq f(x) \leq f\left( y_{0} \right)$ for all $x \in \left\lbrack {a,b} \right\rbrack$. If neither is an endpoint, Fermat gives the result. More explicitly as on L14 p.1: if $f\left( x_{0} \right) < f(a)$, then $x_{0}$ is an interior local minimum and $f^{'{(x_{0})}} = 0$; if $f\left( y_{0} \right) > f(a)$, then $y_{0}$ is an interior local maximum and $f^{'{(y_{0})}} = 0$. If neither strict inequality holds, then $f(x) = f(a)$ for every $x \in \left\lbrack {a,b} \right\rbrack$, so $f$ is constant and $f^{'{(c)}} = 0$ for every $c \in \left( {a,b} \right)$.

> **Corollary: Mean Value Theorem**
>
> If $f$ is continuous on $\left\lbrack {a,b} \right\rbrack$ and differentiable on $\left( {a,b} \right)$, then there is $c \in \left( {a,b} \right)$ such that
>
> $$
> f^{'{(c)}} = \frac{f(b) - f(a)}{b - a}.
> $$

> **Proof**
>
> Let $g(x) = f(x) - \left( \frac{f(b) - f(a)}{b - a} \right)\left( {x - a} \right)$. Then $g$ is continuous on $\left\lbrack {a,b} \right\rbrack$, differentiable on $\left( {a,b} \right)$, and $g(a) = g(b)$. Rolle's theorem gives $g^{'{(c)}} = 0$, which rearranges to the displayed equality.
>
> The L14 p.1 secant/tangent diagram records the same parallel-slope relation:
>
>   -------------- ----------------------------------- -----------------------------
>   $a$            $c \in \left( {a,b} \right)$        $b$
>   $f(a)$         $f^{'{(c)}}$ is the tangent slope   $f(b)$
>   secant slope   =$f^{'{(c)}}$                       $\frac{f(b) - f(a)}{b - a}$
>   -------------- ----------------------------------- -----------------------------

> **Corollary: Zero derivative and monotonicity**
>
> 若 $f$ 在 $\left( {a,b} \right)$ 上 diffble 且每个 $x \in \left( {a,b} \right)$ 都有 $f^{'{(x)}} = 0$，则 $f$ 在 $\left( {a,b} \right)$ 上 constant。于是若 $f' = g'$ on $\left( {a,b} \right)$，则该处 $f = g + C$。interval $I$ 上的 function 在 $x < y$ 推出 $f(x) \leq f(y)$ 时称 increasing；$f(x) < f(y)$ 时称 strictly increasing；decreasing 对偶定义。 Weakly increasing or decreasing on $I$'' 与 monotone on $I$ 同义。

> **Proof**
>
> If $f$ were not constant, there would be $x \neq y$ with $f(x) \neq f(y)$; MVT would give $\frac{f(x) - f(y)}{x - y} \neq 0$, a contradiction. Apply this to $f - g$ for the second assertion.

> **Corollary: Increasing/decreasing test**
>
> If $f$ is differentiable on $\left( {a,b} \right)$, then $f^{'{(x)}} \geq 0$ for every $x \in \left( {a,b} \right)$ implies $f$ is increasing on $\left( {a,b} \right)$. If $f^{'{(x)}} > 0$ for all $x$, then $f$ is strictly increasing. Both statements have decreasing duals.
>
> Note: (i) is a weak statement, but (ii) has a strict conclusion. For $y = x^{3}$, $x < y$ implies $x^{3} < y^{3}$, though $f^{'{(0)}} = 0$.

> **Proof**
>
> For $x < y$, MVT gives a $c \in \left( {x,y} \right)$ with $\frac{f(y) - f(x)}{y - x} = f^{'{(c)}} \geq 0$.

> **Remark: First-derivative sign chart (L14 p.2)**
>
> The handwritten graph for the first derivative test is the sign transition below; reversing both signs gives the local-minimum version.
>
>   -------------------------------------- ----------- --------------------------------------
>   $\left( {c - \varepsilon,c} \right)$   $c$         $\left( {c,c + \varepsilon} \right)$
>   $f' > 0$                               local max   $f' < 0$
>   $f$ increasing                         $f(c)$      $f$ decreasing
>   -------------------------------------- ----------- --------------------------------------

> **Corollary: First derivative test**
>
> Let $c \in \mathbb{R}$ and suppose $f$ is continuous on $V_{\varepsilon{(c)}}$ for some $\varepsilon > 0$, and differentiable on $\left( {c - \varepsilon,c} \right)$ and $\left( {c,c + \varepsilon} \right)$. If $f' > 0$ on $\left( {c - \varepsilon,c} \right)$ and $f' < 0$ on $\left( {c,c + \varepsilon} \right)$, then $c$ is a local maximum of $f$; dually, the reversed signs give a local minimum.

> **Proof**
>
> For $x < c$, MVT gives a $t \in \left( {x,c} \right)$ with $\frac{f(x) - f(c)}{x - c} = f^{'{(t)}} > 0$, hence $f(x) < f(c)$. The same argument for $c < y$ gives $f(y) < f(c)$.

> **Theorem: Darboux's theorem**
>
> If $f$ is differentiable on $\left\lbrack {a,b} \right\rbrack$ and $f^{'{(a)}} < \ell < f^{'{(b)}}$, then there is $c \in \left( {a,b} \right)$ such that $f^{'{(c)}} = \ell$. Thus a differentiable function has every slope between $f^{'{(a)}}$ and $f^{'{(b)}}$: derivatives satisfy IVT even though they need not be continuous (no jump/infinite discontinuity).

> **Proof**
>
> WLOG let $g(x) = f(x) - \ell x$. Then $g^{'{(a)}} < 0 < g^{'{(b)}}$, and $g$ is continuous on $\left\lbrack {a,b} \right\rbrack$. EVT gives a minimum point $c$ of $g$. The endpoint derivative signs force $c \in \left( {a,b} \right)$, so Fermat gives $g^{'{(c)}} = 0$, hence $f^{'{(c)}} = \ell$.

## Functions on intervals, inverse functions, and L'Hôpital (L14(2))

Standing assumption: let $I \subset \mathbb{R}$ be a nondegenerate interval, and $f:I\rightarrow\mathbb{R}$ a function.

> **Theorem: Strictly increasing functions**
>
> If $f$ is strictly increasing, then:
>
> - $f$ is injective;
> - $f^{- 1}$ is also strictly increasing;
> - if $c \in I$ is not the right endpoint of $I$, then $\lim_{x\rightarrow c^{+}}f(x)$ exists;
> - if $c \in I$ is not the left endpoint of $I$, then $\lim_{x\rightarrow c^{-}}f(x)$ exists;
> - $f$ has at most countably many discontinuities, and they are all jumps;
> - if $f\lbrack I\rbrack$ is an interval, then $f$ is continuous.

> **Proof**
>
> For the right limit let $S = f\left\lbrack {I \cap \left( {c,\infty} \right)} \right\rbrack$, which is nonempty and bounded below by $f(c)$; write $L = \inf(S)$. Given $\varepsilon > 0$, fix $0 < \delta$ with $c + \delta \in I$ and $f\left( {c + \delta} \right) < L + \varepsilon$. Then $L \leq f(x) \leq f\left( {c + \delta} \right) < L + \varepsilon$ for $x \in \left( {c,c + \delta} \right)$, so $\lim_{x\rightarrow c^{+}}f(x) = L$. The left-limit proof is similar, and these imply that discontinuities are jumps. For the final claim, prove the contrapositive: at an interior jump with $\ell = \lim_{x\rightarrow c^{-}}f(x) < L = \lim_{x\rightarrow c^{+}}f(x)$, both $\left( {- \infty,\ell} \right\rbrack \cap f\lbrack I\rbrack$ and $\left\lbrack {L,\infty} \right) \cap f\lbrack I\rbrack$ are nonempty but $\left( {\ell,L} \right)$ is not contained in $f\lbrack I\rbrack$ because $\left( {\ell,L} \right) \cap f\lbrack I\rbrack \subset \left\{ {f(c)} \right\}$. The endpoint cases are similar. The remaining proofs are left as exercises. Remark: the dual also holds if $f$ is strictly decreasing.

> **Theorem: Continuous functions on intervals**
>
> If $f$ is continuous, then:
>
> - $f\lbrack I\rbrack$ is an interval;
> - if $I$ is closed and bounded, so is $f\lbrack I\rbrack$;
> - $f$ is strictly monotone iff $f$ is injective;
> - if $f$ is injective, then $f^{- 1}$ is also continuous.

> **Proof**
>
> The first two were proved previously. For the backward direction of (iii), if $f$ is not strictly monotone, WLOG find $x < y < z$ in $I$ with either $f(x) < f(y) > f(z)$ or $f(x) > f(y) < f(z)$. IVT then implies $f$ is not one-to-one. L14(2) p.2 visualizes these two alternatives by the following ordered-value charts, each forcing a repeated intermediate value:
>
>   ---------------------- ---------------------- -----------------------
>   $x < y < z$            $x < y < z$
>   $f(x) < f(y) > f(z)$   $f(x) > f(y) < f(z)$   not one-to-one by IVT
>   ---------------------- ---------------------- -----------------------
>
> Finally, injectivity makes $f$ strictly monotone, hence $f^{- 1}$ strictly monotone; since $I = f^{- 1}\left\lbrack {f\lbrack I\rbrack} \right\rbrack$ is an interval, the previous theorem makes $f^{- 1}$ continuous.

> **Corollary: Injective functions and inverses**
>
> If $f$ is injective, then $f$ is strictly increasing iff $f^{- 1}$ is strictly increasing; $f$ is strictly decreasing iff $f^{- 1}$ is strictly decreasing; and $f$ is continuous iff $f^{- 1}$ is continuous.
>
> Question: Could we add "$f$ is differentiable iff $f^{- 1}$ is differentiable"? Answer: not quite. $f(x) = x^{3}$ is injective and differentiable on $\left( {- 1,1} \right)$, but $f^{- 1}$ is not differentiable at $f(0) = 0$.

> **Theorem: Inverse Function Theorem**
>
> Suppose $f$ is continuous and injective on an open interval $I$, let $x_{0} \in I$, and suppose $f$ is differentiable at $x_{0}$ with $f^{'{(x_{0})}} \neq 0$. Then $f^{- 1}$ is differentiable at $y_{0} = f\left( x_{0} \right)$ and
>
> $$
> \left( f^{- 1} \right)^{'{(y_{0})}} = \frac{1}{f^{'{(x_{0})}}}.
> $$
>
> The p.3 inverse-function sketch has the paired coordinates
>
>   --------------------------------- --------------- ---------------------------------
>   $x_{0}$                           $f$             $y_{0} = f\left( x_{0} \right)$
>   $g\left( y_{0} \right) = x_{0}$   $g = f^{- 1}$   $y_{0}$
>   --------------------------------- --------------- ---------------------------------
>
> .

> **Proof**
>
> Write $g = f^{- 1}$. Since $f^{'{(x_{0})}} \neq 0$ and $f(x) \neq f\left( x_{0} \right)$ for $x \neq x_{0}$,
>
> $$
> \lim\limits_{x\rightarrow x_{0}}\frac{x - x_{0}}{f(x) - f\left( x_{0} \right)} = \frac{1}{f^{'{(x_{0})}}}.
> $$
>
> Fix $\delta_{0} > 0$ such that the difference between the displayed quotient and $\frac{1}{f^{'{(x_{0})}}}$ is less than $\varepsilon$ whenever $0 < \left| {x - x_{0}} \right| < \delta_{0}$. Continuity of $g$ at $y_{0}$ supplies $\delta_{1} > 0$ with $\left| {g(y) - g\left( y_{0} \right)} \right| < \delta_{0}$ whenever $\left| {y - y_{0}} \right| < \delta_{1}$. Substitution $x = g(y)$ is the displayed p.4 calculation: for $0 < \left| {y - y_{0}} \right| < \delta_{1}$,
>
> $$
> \left| {\frac{g(y) - g\left( y_{0} \right)}{f\left( {g(y)} \right) - f\left( {g\left( y_{0} \right)} \right)} - \frac{1}{f^{'{(x_{0})}}}} \right| < \varepsilon,
> $$
>
> and, since $f\left( {g(y)} \right) = y$ and $f\left( {g\left( y_{0} \right)} \right) = y_{0}$, this gives
>
> $$
> \left| {\frac{g(y) - g\left( y_{0} \right)}{y - y_{0}} - \frac{1}{f^{'{(x_{0})}}}} \right| < \varepsilon,
> $$
>
> whence the result. Consequently, if $f$ is differentiable and $f' \neq 0$ on an open interval $I$, then $f$ is injective on $I$, $f^{- 1}$ is differentiable on $f\lbrack I\rbrack$, and $\left( f^{- 1} \right)' = \frac{1}{f' ○ f^{- 1}}$. The final visible p.4 margin annotation is: "Prove? Fix? Skip? 6.1.9".

> **Example: Inverse derivative**
>
> Define the invertible differentiable function
>
> $$
> f(x) = \frac{e^{x}}{x^{2} + 1} + x^{3} + 2x
> $$
>
> on $\mathbb{R}$. Find $\left( f^{- 1} \right)^{'{(1)}}$. Since $f(0) = 1$ and
>
> $$
> f^{'{(x)}} = \frac{e^{x{({x^{2} + 1})}} - 2xe^{x}}{\left( {x^{2} + 1} \right)^{2}} + 3x^{2} + 2 = \frac{e^{{x{({x - 1})}}^{2}}}{\left( {x^{2} + 1} \right)^{2}} + 3x^{2} + 2,
> $$
> $$
> \left( f^{- 1} \right)^{'{(1)}} = \frac{1}{f^{'{({f^{- 1}{(1)}})}}} = \frac{1}{f^{'{(0)}}} = \frac{1}{3}.
> $$

## L'Hôpital's Rule

> **Lemma: Cauchy's Mean Value Theorem**
>
> Let $a < b$, and suppose $f,g:\left\lbrack {a,b} \right\rbrack\rightarrow\mathbb{R}$ are continuous on $\left\lbrack {a,b} \right\rbrack$ and differentiable on $\left( {a,b} \right)$. Then there is $c \in \left( {a,b} \right)$ such that
>
> $$
> \left( {f(b) - f(a)} \right)g^{'{(c)}} = \left( {g(b) - g(a)} \right)f^{'{(c)}}.
> $$

> **Proof**
>
> Apply MVT to $h(x) = \left( {f(b) - f(a)} \right)g(x) - \left( {g(b) - g(a)} \right)f(x)$ on $\left\lbrack {a,b} \right\rbrack$.

> **Theorem: L'Hôpital's Rule**
>
> Let $a < b$, and let $f,g:\left( {a,b} \right)\rightarrow\mathbb{R}$ be differentiable functions with $g^{'{(x)}} \neq 0$ for all $x \in \left( {a,b} \right)$. Suppose $\lim_{x\rightarrow a^{+}}f(x) = \lim_{x\rightarrow a^{+}}g(x) = 0$. If $\lim_{x\rightarrow a^{+}}\frac{f^{'{(x)}}}{g^{'{(x)}}}$ exists and equals $L \in \mathbb{R}$, then $\lim_{x\rightarrow a^{+}}\frac{f(x)}{g(x)}$ exists and equals $L$.

> **Proof**
>
> Extend $f,g$ to $F,G:\left\lbrack {a,b} \right)\rightarrow\mathbb{R}$ by $F(a) = G(a) = 0$. Rolle's theorem on $G$ shows that not just $g'$ but $g$ itself is never $0$ on $\left( {a,b} \right)$. Let $\left( x_{n} \right)$ in $\left( {a,b} \right)$ tend to $a$. Cauchy's MVT supplies $y_{n} \in \left( {a,x_{n}} \right)$ with
>
> $$
> F^{'{(y_{n})}}\left( {G\left( x_{n} \right) - G(a)} \right) = G^{'{(y_{n})}}\left( {F\left( x_{n} \right) - F(a)} \right).
> $$
>
> Then $y_{n}\rightarrow a$ and $\frac{f\left( x_{n} \right)}{g\left( x_{n} \right)} = \frac{f^{'{(y_{n})}}}{g^{'{(y_{n})}}}$ for all $n$; hence the quotient tends to $L$. Since $\left( x_{n} \right)$ was arbitrary, the desired right-hand limit is $L$.
>
> Remark: the rule also holds for two-sided limits and limits at $\pm \infty$. It also holds for indeterminate limits of the form $\pm \frac{\infty}{\pm}\infty$, and can be adapted to $\infty - \infty$, $0 \cdot \infty$, $1^{\infty}$, $0^{0}$, and $\infty^{0}$ (see 6.3). **Skip the rest?**

> **Example: L'Hôpital examples**
>
> $$
> \lim\limits_{x\rightarrow 0}\sin\frac{x}{x} = \lim\limits_{x\rightarrow 0}\cos\frac{x}{1} = 1;\quad\forall a > 0,\lim\limits_{x\rightarrow\infty}\frac{\ln x}{x^{a}} = \lim\limits_{x\rightarrow\infty}\frac{1}{ax^{a}} = 0;
> $$
> $$
> \forall a > 0,\lim\limits_{x\rightarrow\infty}\frac{x^{a}}{e^{x}} = \lim\limits_{x\rightarrow\infty}\frac{ax^{a - 1}}{e^{x}} = \ldots = 0.
> $$

> **Corollary: No removable discontinuity for a derivative**
>
> Let $a \in \mathbb{R}$, let $I$ be an open interval containing $a$, and let $f:I\rightarrow\mathbb{R}$ be continuous and differentiable on $I \smallsetminus \left\{ a \right\}$. If $\lim_{x\rightarrow a}f^{'{(x)}}$ exists, then $f$ is differentiable at $a$ and $\lim_{x\rightarrow a}f^{'{(x)}} = f^{'{(a)}}$.

> **Proof**
>
> Let $F(x) = f(x) - f(a)$ and $G(x) = x - a$. Then $\lim_{x\rightarrow a}F(x) = \lim_{x\rightarrow a}G(x) = 0$ and $\lim_{x\rightarrow a}\frac{F^{'{(x)}}}{G^{'{(x)}}} = \lim_{x\rightarrow a}f^{'{(x)}}$ exists. The definition of derivative and L'Hôpital's rule give
>
> $$
> f^{'{(a)}} = \lim\limits_{x\rightarrow a}\frac{f(x) - f(a)}{x - a} = \lim\limits_{x\rightarrow a}\frac{F(x)}{G(x)} = \lim\limits_{x\rightarrow a}\frac{F^{'{(x)}}}{G^{'{(x)}}} = \lim\limits_{x\rightarrow a}f^{'{(x)}}.
> $$

> **Example: Final counterexample**
>
> Let $f(x) = x\sin\left( \frac{1}{x} \right)$ for $x \neq 0$, and $f(0) = 0$. From continuity at $0$ and differentiability everywhere except at $0$, we already know that $\lim_{x\rightarrow 0}f^{'{(x)}}$ cannot exist.

