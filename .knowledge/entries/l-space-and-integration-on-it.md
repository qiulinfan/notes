---
schema: kgdistiller-entry-v1
id: l-space-and-integration-on-it
label: L^ + space and integration on it
kind: definition
aliases:
  - L^(+) space and integration on it
source: notes/math/measure-theory/chapters/04-measurable_functions_and_integration_on_L^+(mu).tex
line_start: 448
line_end: 462
understanding: unknown
---

# L^ + space and integration on it

## Summary

给定一个 measure space $\(X\,cal(M)\,mu\)$ 我们定义: $ L^(+)\(mu\):= { bold("measurable functions ") f : X arrow.r\[0\,oo\]} $ 对于所有的 simple functions $phi.alt = sum_(j = 1)^n a_j chi_(E_j) in L^(+)\(mu\)$, 即所有非负的 simple functions, 我们定义 the integral of $phi.alt$ with respect to $mu$ by: $ integral phi.alt d mu \(= integral_X phi.alt d mu\):= sum_(i = 1)^n a_j mu\(E_j\) $ 对于任意的 $f in L^(+)\(mu\)$, 我们定义 the integral of $f$ with respect to $mu$ by: $ integral f d mu \(= integral_X f d mu\):= sup { integral phi.alt d mu divides 0 lt.eq phi.alt lt.eq f\,phi.alt upright(" simple") } $

## Evidence

```
\begin{definition}{\kn{$L^{+}$ space and integration on it}}

给定一个 measure space \((X,\mathcal{M},\mu)\) 我们定义:

\[L^{+}(\mu) := \left\{ {\text{\textbf{measurable functions }}\ f:X\rightarrow\lbrack 0,\infty\rbrack} \right\}\]

对于所有的 \textbf{simple functions \(\varphi = \sum_{j = 1}^{n}a_{j}\chi_{E_{j}} \in L^{+}(\mu)\)}, 即所有非负的 simple functions, 我们定义 \textbf{the integral of \(\varphi\) with respect to \(\mu\)} by:

\[\int\varphi d\mu( = \int_{X}\varphi d\mu) := \sum\limits_{i = 1}^{n}a_{j}\mu(E_{j})\]

对于任意的 \(f \in L^{+}(\mu)\), 我们定义 \textbf{the integral of \(f\) with respect to \(\mu\)} by:

\[\int fd\mu( = \int_{X}fd\mu) := \sup\left\{ {\int\varphi d\mu \mid 0 \leq \varphi \leq f,\varphi\ \text{simple}} \right\}\]

\end{definition}
```
