---
label: σ-finite measure prerequisite for Lebesgue-Radon-Nikodym Theorem
kind: prerequisite-for
prerequisite:
  - "[[sigma-finite-measure]]"
dependent:
  - "[[lebesgue-radon-nikodym-theorem]]"
source: notes/math/measure-theory/chapters/11-Radon-Nikodym_theorem.tex
lines: 404-419
---
The theorem statement assumes σ-finiteness of both μ and ν.

## Evidence

> \begin{theorem}{\kn{Lebesgue-Radon-Nikodym Theorem}}
>
> 如果 \(\begin{matrix}
> {\{\mu\sigma\ \text{-finite p.m.}} \\
> {\nu\sigma\ \text{-finite s.m.}}
> \end{matrix}\) on \((X,\mathcal{A})\), 那么存在唯一的 decomposition
>
> \[\nu = \lambda + \rho\]
>
> where \(\lambda,\rho\) 是 \(\sigma\)-finite 的 signed measure s.t. \(\begin{matrix}
> {\{\lambda\bot\mu} \\
> {\rho \ll \mu}
> \end{matrix}\).\\
> (于是, by RNT, 存在 \(\mu\)-unique 的 extended \(\mu\)-integrable \(f:X\rightarrow\mathbb{R}\) s.t. \(d\rho = f\, d\mu\) ).
>
> \end{theorem}
