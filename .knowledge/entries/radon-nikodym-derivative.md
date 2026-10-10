---
schema: kgdistiller-entry-v1
id: radon-nikodym-derivative
label: Radon-Nikodym derivative
kind: definition
aliases:
  - Radon–Nikodym derivative
  - RN derivative
source: notes/math/measure-theory/chapters/11-Radon-Nikodym_theorem.tex
line_start: 146
line_end: 163
understanding: unknown
---

# Radon-Nikodym derivative

## Summary

对于 ${upright("p.m. ") mu\ upright("s.m. ") nu$ on $\(X\,cal(A)\)$, 如果存在一个 $cal(A)$-measurable $f$, 使得 $nu$ 为 the signed measure $nu$ induced by $mu$ and $f$: $ nu\(E\)= integral_E f thin d mu\,quad forall E in cal(A) $ 则称 $f$ is the Radon-Nikodym Derivative of $nu$ w.r.t. $mu$. 写作 $ f = frac(d nu, d mu) $或者 $ d nu = f d mu $

## Evidence

```
\begin{definition}{\kn{Radon-Nikodym derivative}}

对于 \(\begin{matrix}
{\{\text{p.m.}\ \mu} \\
{\text{s.m.}\ \nu}
\end{matrix}\) on \((X,\mathcal{A})\), 如果存在一个 \(\mathcal{A}\)-measurable \(f\), 使得 \(\nu\) 为 the \textbf{signed measure \(\nu\) induced by \(\mu\) and \(f\):}

\[\nu(E) = \int_{E}f\, d\mu,\quad\forall E \in \mathcal{A}\]

则称 \textbf{\(f\) is the Radon-Nikodym Derivative of \(\nu\) w.r.t. \(\mu\).} 写作

\[f = \frac{d\nu}{d\mu}\]

或者

\[d\nu = fd\mu\]

\end{definition}
```
