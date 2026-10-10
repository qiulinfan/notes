---
label: simple function prerequisite for L^ + space and integration on it
kind: prerequisite-for
prerequisite:
  - "[[simple-function]]"
dependent:
  - "[[l-space-and-integration-on-it]]"
source: notes/math/measure-theory/chapters/04-measurable_functions_and_integration_on_L^+(mu).tex
lines: 448-462
---
the nonnegative integral is constructed from simple functions

## Evidence

> \begin{definition}{\kn{$L^{+}$ space and integration on it}}
>
> 给定一个 measure space \((X,\mathcal{M},\mu)\) 我们定义:
>
> \[L^{+}(\mu) := \left\{ {\text{\textbf{measurable functions }}\ f:X\rightarrow\lbrack 0,\infty\rbrack} \right\}\]
>
> 对于所有的 \textbf{simple functions \(\varphi = \sum_{j = 1}^{n}a_{j}\chi_{E_{j}} \in L^{+}(\mu)\)}, 即所有非负的 simple functions, 我们定义 \textbf{the integral of \(\varphi\) with respect to \(\mu\)} by:
>
> \[\int\varphi d\mu( = \int_{X}\varphi d\mu) := \sum\limits_{i = 1}^{n}a_{j}\mu(E_{j})\]
>
> 对于任意的 \(f \in L^{+}(\mu)\), 我们定义 \textbf{the integral of \(f\) with respect to \(\mu\)} by:
>
> \[\int fd\mu( = \int_{X}fd\mu) := \sup\left\{ {\int\varphi d\mu \mid 0 \leq \varphi \leq f,\varphi\ \text{simple}} \right\}\]
>
> \end{definition}
