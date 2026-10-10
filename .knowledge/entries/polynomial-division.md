---
schema: kgdistiller-entry-v1
id: polynomial-division
label: Polynomial division
kind: theorem
aliases:
  - polynomial division algorithm
source: notes/math/modern-algebra/chapters/04-polynomials-and-quotients.tex
line_start: 16
line_end: 22
understanding: unknown
---

# Polynomial division

## Summary

For f and nonzero g in F[X], there are unique q and r with f = qg + r, where r is zero or has degree less than g.

## Evidence

```
\begin{theorem}{\kn{Polynomial division}}

For \(f,g \in F\lbrack X\rbrack\) with \(g \neq 0\), there are unique \(q,r \in F\lbrack X\rbrack\) such that

\[f = qg + r\quad \land \quad\left( {r = 0 \vee \deg r < \deg g} \right).\]

\end{theorem}
```
