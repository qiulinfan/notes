---
schema: kgdistiller-entry-v1
id: ftc-ii-for-lebesgue-integral-on-a-cpt-interval
label: FTC-II for Lebesgue integral on a cpt interval
kind: theorem
aliases: []
source: notes/math/measure-theory/chapters/12-differentiation_on_real_spaces.tex
line_start: 948
line_end: 963
understanding: unknown
---

# FTC-II for Lebesgue integral on a cpt interval

## Summary

TFAE: - $F in A C\[a\,b\]$ - $F$ 是 diffble a.e. on $\[a\,b\]$ 的, 且 $F' in L^1\(\[a\,b\]\,m\)$, 且 $ F\(x\)- F\(a\)= integral_a^x F'\(t\)thin d t $for all $x in\[a\,b\$].

## Evidence

```
\begin{theorem}{\kn{FTC-II for Lebesgue integral on a cpt interval}}

TFAE:

\begin{itemize}
\item
  \(F \in AC\lbrack a,b\rbrack\)
\item
  \(F\) 是 diffble a.e. on \(\lbrack a,b\rbrack\) 的, 且 \(F' \in L^{1}(\lbrack a,b\rbrack,m)\), 且

  \[F(x) - F(a) = \int_{a}^{x}F'(t)\, dt\]

  \textbf{for all \(x \in \lbrack a,b\rbrack\)}.
\end{itemize}

\end{theorem}
```
