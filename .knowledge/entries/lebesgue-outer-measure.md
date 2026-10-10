---
schema: kgdistiller-entry-v1
id: lebesgue-outer-measure
label: Lebesgue outer measure
kind: definition
aliases: []
source: notes/math/multivariate-analysis/chapters/07-ibl-lebesgue-outer-measure.tex
line_start: 4
line_end: 8
understanding: unknown
---

# Lebesgue outer measure

## Summary

The Lebesgue outer measure of a subset of R^d is the infimum of the total volumes of its countable box covers.

## Evidence

```
\begin{definition}{\kn{Lebesgue outer measure}}

For \(E \subseteq \mathbb{R}^{d}\), \(m^{\ast}(E) = \inf_{E \subseteq \bigcup_{j = 1}^{\infty}B_{j}}\sum_{j = 1}^{\infty}\left| B_{j} \right|\), where the cover is by boxes. This replaces the finite covers in Jordan outer measure by countable covers.

\end{definition}
```
