---
schema: kgdistiller-entry-v1
id: uniform-continuity
label: Uniform continuity
kind: definition
aliases: []
source: notes/math/mathematical-analysis/chapters/04-limits-and-continuity.tex
line_start: 204
line_end: 208
understanding: unknown
---

# Uniform continuity

## Summary

A function is uniformly continuous when one delta works for all pairs of domain points for each epsilon.

## Evidence

```
\begin{definition}{\kn{Uniform continuity}}

Let \(B \subseteq A \subseteq \mathbb{R}\) and \(f:A\rightarrow\mathbb{R}\). Then \(f\) is uniformly continuous on \(B\) if, for every \(\varepsilon > 0\), there is \(\delta > 0\) such that for all \(x,y \in B\), \(\left| {x - y} \right| < \delta\) implies \(\left| {f(x) - f(y)} \right| < \varepsilon\).

\end{definition}
```
