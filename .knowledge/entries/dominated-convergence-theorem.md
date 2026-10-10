---
schema: kgdistiller-entry-v1
id: dominated-convergence-theorem
label: dominated convergence theorem
kind: theorem
aliases: []
source: notes/math/measure-theory/chapters/05-integration_of_real_and_complex_functions.tex
line_start: 253
line_end: 268
understanding: unknown
---

# dominated convergence theorem

## Summary

Let $\(f_n\)$ be a seq of functions in $L^1\(mu\)$, s.t. - $f_n arrow.r f$ a.e. - 存在 $g in L^1\(mu\)$ s.t. $\|f_n\|lt.eq g$ a.e. for all $n$. Claim: $f in L^1\(mu\)$ 并且 $ integral f = lim_n integral f_n $

## Evidence

```
\begin{theorem}{\kn{dominated convergence theorem}}

Let \((f_{n})\) be a seq of functions in \(L^{1}(\mu)\), s.t.

\begin{itemize}
\item
  \(f_{n}\rightarrow f\) a.e.
\item
  存在 \(g \in L^{1}(\mu)\) s.t. \(\left. |f_{n} \middle| \leq g \right.\) a.e. for all \(n\).
\end{itemize}

Claim: \(f \in L^{1}(\mu)\) 并且

\[\int f = \lim\limits_{n}\int f_{n}\]

\end{theorem}
```
