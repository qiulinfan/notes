---
schema: kgdistiller-entry-v1
id: general-change-of-variable-theorem
label: general change of variable theorem
kind: theorem
aliases: []
source: notes/math/measure-theory/chapters/07-Lebesgue_measure_on_R^n.tex
line_start: 335
line_end: 351
understanding: unknown
---

# general change of variable theorem

## Summary

Suppose $Omega subset bb(R)^n$ open, $G : Omega arrow.r bb(R)^n$ 为一个 $C^1$ diffeomorphism. \ Claim: - 如果 $f : G\(Omega\)arrow.r bb(C)$ 上是 Lebesgue measurable 的, 则 $f compose G : Omega arrow.r bb(C)$ 也是 Lebesgue measurable 的. 并且, 如果 $f in L^(+)\(G\(Omega\)\,m\)$ 或者 $f in f in L^1\(G\(Omega\)\,m\)$, 则有$ integral_(G\(Omega\)) f d m = integral_Omega\(f compose G\)thin\|det D G\| d m $ - 如果 $E subset Omega$ 是 Lebesgue measurable set, 则 $G\(E\)$ 也是 Lebesgue measurable set, 并且 $ m\(G\(E\)\)= integral_E\|det D G\| d m $

## Evidence

```
\begin{theorem}{\kn{general change of variable theorem}}

Suppose \(\Omega \subset \mathbb{R}^{n}\) \textbf{open}, \(G:\Omega\rightarrow\mathbb{R}^{n}\) 为一个 \(C^{1}\) \textbf{diffeomorphism}.\\
Claim:

\begin{itemize}
\item
  如果 \(f:G(\Omega)\rightarrow\mathbb{C}\) 上是 Lebesgue measurable 的, 则 \(f \circ G:\Omega\rightarrow\mathbb{C}\) 也是 Lebesgue measurable 的. 并且, 如果 \(f \in L^{+}(G(\Omega),m)\) 或者 \(f \in f \in L^{1}(G(\Omega),m)\), 则有

  \[\left. \int_{G(\Omega)}f dm = \int_{\Omega}(f \circ G)\, \middle| \det DG \middle| dm \right.\]
\item
  如果 \(E \subset \Omega\) 是 Lebesgue measurable set, 则 \(G(E)\) 也是 Lebesgue measurable set, 并且

  \[\left. m(G(E)) = \int_{E} \middle| \det DG \middle| dm \right.\]
\end{itemize}

\end{theorem}
```
