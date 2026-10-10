---
schema: kgdistiller-entry-v1
id: ls-measure-space-l-1-space-density-of-step-functions
label: LS measure space 的 L^1 space 上的 density of step functions
kind: theorem
aliases: []
source: notes/math/measure-theory/chapters/05-integration_of_real_and_complex_functions.tex
line_start: 590
line_end: 599
understanding: unknown
---

# LS measure space 的 L^1 space 上的 density of step functions

## Summary

考虑 $\(bb(R)\,cal(L)\,m_s\)$ where $m_s$ 为一个 Lebesgue-Stieljes measure on $bb(R)$, let $f in L^1\(mu\)$, \ 对于任意 $epsilon.alt > 0$, 都存在 step function $phi.alt = sum_(j = 1)^N c_j chi_(I_j)$, 使得 $ integral\(f - phi.alt\)< epsilon.alt $ where each $I_j$ 都是 open intervals.

## Evidence

```
\begin{theorem}{\kn{LS measure space 的 $L^1$ space 上的 density of step functions}}

考虑 \((\mathbb{R},\mathcal{L},m_{s})\) where \(m_{s}\) 为一个 Lebesgue-Stieljes measure on \(\mathbb{R}\), let \(f \in L^{1}(\mu)\),\\
对于任意 \(\varepsilon > 0\), 都存在 step function \(\varphi = \sum_{j = 1}^{N}c_{j}\chi_{I_{j}}\), 使得

\[\int(f - \varphi) < \varepsilon\]

where each \(I_{j}\) 都是 open intervals.

\end{theorem}
```
