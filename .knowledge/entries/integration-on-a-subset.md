---
label: integration on a subset
kind: definition
source: notes/math/measure-theory/chapters/04-measurable_functions_and_integration_on_L^+(mu).tex
lines: 484-494
understanding: unknown
---
对非负 simple functions $phi.alt = sum_(j = 1)^n a_j chi_(E_j) in L^(+)\(mu\)$, 我们定义 the integral of $phi.alt$ on $A in cal(M)$ with respect to $mu$ by: $ integral_A phi.alt d mu := integral phi.alt chi_A d mu $ 对于 general 的 $f in L^(+)\(mu\)$, 我们也从而定义: $ integral_A f d mu := sup { integral_A phi.alt d mu divides 0 lt.eq phi.alt lt.eq f\,phi.alt upright(" simple") } $

## Evidence

> \begin{definition}{\kn{integration on a subset}}
>
> 对非负 \textbf{simple functions \(\varphi = \sum_{j = 1}^{n}a_{j}\chi_{E_{j}} \in L^{+}(\mu)\)}, 我们定义 \textbf{the integral of \(\varphi\) on \(A \in \mathcal{M}\) with respect to \(\mu\)} by:
>
> \[\int_{A}\varphi d\mu := \int\varphi\chi_{A} d\mu\]
>
> 对于 general 的 \(f \in L^{+}(\mu)\), 我们也从而定义:
>
> \[\int_{A}fd\mu := \sup\left\{ {\int_{A}\varphi d\mu \mid 0 \leq \varphi \leq f,\varphi\ \text{simple}} \right\}\]
>
> \end{definition}
