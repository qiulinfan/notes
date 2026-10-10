---
schema: kgdistiller-entry-v1
id: mathcal-m-mathcal-n-measurable-function
label: (M,N)-measurable function
kind: definition
aliases:
  - (cal(M),cal(N))-measurable function
source: notes/math/measure-theory/chapters/04-measurable_functions_and_integration_on_L^+(mu).tex
line_start: 8
line_end: 16
understanding: unknown
---

# (M,N)-measurable function

## Summary

Let $\(X\,cal(M)\)$, $\(Y\,cal(N)\)$ be measurable spaces, 如果 $f : X arrow.r Y$ 满足: $ B in cal(N) arrow.r.double.long f^(- 1)\(B\)in cal(M) $, 则称 $f$ 为一个 $\(cal(M)\,cal(N)\)$-measurable function.

## Evidence

```
\begin{definition}{\kn{$(\mathcal{M},\mathcal{N})$-measurable function}}

Let \knref{measurable-space-and-measure-space} \((X,\mathcal{M})\), \((Y,\mathcal{N})\) be measurable spaces, 如果 \(f:X\rightarrow Y\) 满足:

\[B \in \mathcal{N}\Longrightarrow f^{- 1}(B) \in \mathcal{M}\]

, 则称 \(f\) 为一个 \((\mathcal{M},\mathcal{N})\)-measurable function.

\end{definition}
```
