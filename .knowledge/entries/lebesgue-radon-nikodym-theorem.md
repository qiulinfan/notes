---
schema: kgdistiller-entry-v1
id: lebesgue-radon-nikodym-theorem
label: Lebesgue-Radon-Nikodym Theorem
kind: theorem
aliases:
  - Lebesgue–Radon–Nikodym theorem
  - LRNT
source: notes/math/measure-theory/chapters/11-Radon-Nikodym_theorem.tex
line_start: 404
line_end: 419
understanding: unknown
---

# Lebesgue-Radon-Nikodym Theorem

## Summary

如果 ${mu sigma upright("-finite p.m.")\ nu sigma upright("-finite s.m.")$ on $\(X\,cal(A)\)$, 那么存在唯一的 decomposition $ nu = lambda + rho $where $lambda\,rho$ 是 $sigma$-finite 的 signed measure s.t. ${lambda tack.t mu\ rho lt.double mu$. \ (于是, by RNT, 存在 $mu$-unique 的 extended $mu$-integrable $f : X arrow.r bb(R)$ s.t. $d rho = f thin d mu$ ).

## Evidence

```
\begin{theorem}{\kn{Lebesgue-Radon-Nikodym Theorem}}

如果 \(\begin{matrix}
{\{\mu\sigma\ \text{-finite p.m.}} \\
{\nu\sigma\ \text{-finite s.m.}}
\end{matrix}\) on \((X,\mathcal{A})\), 那么存在唯一的 decomposition

\[\nu = \lambda + \rho\]

where \(\lambda,\rho\) 是 \(\sigma\)-finite 的 signed measure s.t. \(\begin{matrix}
{\{\lambda\bot\mu} \\
{\rho \ll \mu}
\end{matrix}\).\\
(于是, by RNT, 存在 \(\mu\)-unique 的 extended \(\mu\)-integrable \(f:X\rightarrow\mathbb{R}\) s.t. \(d\rho = f\, d\mu\) ).

\end{theorem}
```
