---
label: monotone convergence theorem prerequisite for Radon-Nikodym Theorem
kind: prerequisite-for
prerequisite:
  - "[[monotone-convergence-theorem]]"
dependent:
  - "[[radon-nikodym-theorem]]"
source: notes/math/measure-theory/chapters/11-Radon-Nikodym_theorem.tex
lines: 203-214
---
The existence proof uses monotone convergence for the increasing maximizing sequence f_n.

## Evidence

> \begin{theorem}{\kn{Radon-Nikodym Theorem}}
>
> 对于 \knref{$\sigma$-finite measure} \(\begin{matrix}
> {\{\text{p.m.}\ \mu} \\
> {\text{s.m.}\ \nu}
> \end{matrix}\) on \((X,\mathcal{A})\),
>
> \[\nu \ll \mu\Leftrightarrow\exists\ \text{ext.}\ \mu\ \text{-intble}\ f = \frac{d\nu}{d\mu}\]
>
> 并且这个 RN derivative \textbf{\(f\) 是 \textbf{unique 的, in \(\mu\)-a.e. sense.}} (即在 \(\mu\) 的一个 null set 之外唯一).
>
> \end{theorem}
