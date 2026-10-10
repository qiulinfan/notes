---
schema: kgdistiller-entry-v1
id: jordan-measure
label: Jordan measure
kind: definition
aliases:
  - Jordan measurable set
source: notes/math/multivariate-analysis/chapters/06-ibl-baire-to-jordan-measure.tex
line_start: 98
line_end: 102
understanding: unknown
---

# Jordan measure

## Summary

For a bounded subset of R^d, Jordan inner and outer measures use elementary subsets and supersets; equality characterizes Jordan measurability.

## Evidence

```
\begin{definition}{\kn{Jordan measure} inner and outer measure}

For bounded \(E \subseteq \mathbb{R}^{d}\), \({\underline{m}}_{J{(E)}} = \sup_{A \subseteq E,A\ \text{elementary}}m(A)\) and \({\bar{m}}_{J{(E)}} = \inf_{B \supseteq E,B\ \text{elementary}}m(B)\). The set is Jordan measurable when these agree.

\end{definition}
```
