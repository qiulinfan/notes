---
schema: kgdistiller-entry-v1
id: metric-space
label: Metric space
kind: definition
aliases: []
source: notes/math/mathematical-analysis/chapters/02-functions-countability-and-metric-spaces.tex
line_start: 62
line_end: 78
understanding: unknown
---

# Metric space

## Summary

A metric space is a set equipped with a nonnegative symmetric distance satisfying the triangle inequality.

## Evidence

```
\begin{definition}{Metric and \kn{Metric space}}

A metric on \(X\) is a map \(d:X \times X\rightarrow\mathbb{R}\) such that, for all \(a,b,c \in X\):

\begin{itemize}
\tightlist
\item
  \(d\left( {a,b} \right) \geq 0\), with equality if and only if \(a = b\);
\item
  \(d\left( {a,b} \right) = d\left( {b,a} \right)\); and
\item
  \(d\left( {a,c} \right) \leq d\left( {a,b} \right) + d\left( {b,c} \right)\).
\end{itemize}

The pair \(\left( {X,d} \right)\) is a metric space.

\end{definition}
```
