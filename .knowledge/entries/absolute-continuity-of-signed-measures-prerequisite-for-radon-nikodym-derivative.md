---
label: absolute continuity of signed measures prerequisite for Radon-Nikodym derivative
kind: prerequisite-for
prerequisite:
  - "[[absolute-continuity-of-signed-measures]]"
dependent:
  - "[[radon-nikodym-derivative]]"
source: notes/math/measure-theory/chapters/11-Radon-Nikodym_theorem.tex
lines: 146-163
---
the derivative represents an absolutely continuous measure

## Evidence

> \begin{definition}{\kn{Radon-Nikodym derivative}}
>
> 对于 \(\begin{matrix}
> {\{\text{p.m.}\ \mu} \\
> {\text{s.m.}\ \nu}
> \end{matrix}\) on \((X,\mathcal{A})\), 如果存在一个 \(\mathcal{A}\)-measurable \(f\), 使得 \(\nu\) 为 the \textbf{signed measure \(\nu\) induced by \(\mu\) and \(f\):}
>
> \[\nu(E) = \int_{E}f\, d\mu,\quad\forall E \in \mathcal{A}\]
>
> 则称 \textbf{\(f\) is the Radon-Nikodym Derivative of \(\nu\) w.r.t. \(\mu\).} 写作
>
> \[f = \frac{d\nu}{d\mu}\]
>
> 或者
>
> \[d\nu = fd\mu\]
>
> \end{definition}
