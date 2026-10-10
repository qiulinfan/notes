---
schema: kgdistiller-entry-v1
id: convergence-in-l-infty-iffuniform-convergence-a-e
label: convergence in L^ infty Leftrightarrowuniform convergence a.e.
kind: theorem
aliases:
  - convergence in L^oo arrow.l.r.doubleuniform convergence a.e.
source: notes/math/measure-theory/chapters/09-L^P-space_and_inequalities.tex
line_start: 792
line_end: 799
understanding: unknown
---

# convergence in L^ infty Leftrightarrowuniform convergence a.e.

## Summary

$ f_n arrow.r f upright(" in ") L^oo arrow.l.r.double upright("exists null set ") E subset X s . t . f_n arrow.r f upright(" uniformly on ") E^c $ (注意, 这不是 conv almost uniformly, 而是一个比 almost uniformly 更强的条件: conv uniformly almost everywhere, 因为 almost uniformly 只要求对于任意的 $epsilon.alt$, 都存在一个 measure 小于 $epsilon.alt$ 的 $E$, 使得在 $E^c$ 上 uni conv 即可.)

## Evidence

```
\begin{theorem}{\kn{convergence in $L^{\infty}$ $\Leftrightarrow$uniform convergence
a.e.}}

\[f_{n}\rightarrow f\text{in}\ L^{\infty}\Leftrightarrow\text{exists null set}\ E \subset X s.t.f_{n}\rightarrow f\ \text{uniformly on}\ E^{c}\]

(注意, 这\textbf{不是 conv almost uniformly}, 而是一个比 almost uniformly \textbf{更强}的条件: \textbf{conv uniformly almost everywhere}, 因为 almost uniformly 只要求对于任意的 \(\varepsilon\), 都存在一个 measure 小于 \(\varepsilon\) 的 \(E\), 使得在 \(E^{c}\) 上 uni conv 即可.)

\end{theorem}
```
