---
schema: kgdistiller-entry-v1
id: properties-of-correlation
label: properties of correlation
kind: proposition
aliases: []
source: notes/math/prob/chapters/02-random-variables.tex
line_start: 867
line_end: 878
understanding: unknown
---

# properties of correlation

## Summary

correlation 对称且绝对值不超过一，并刻画线性相关的等号情形。

## Evidence

```
\begin{proposition}{\kn{properties of correlation}}

\begin{itemize}
\item
  \(\mathit{\rho}(\mathit{X},\mathit{Y}) \in \lbrack - 1,1\rbrack\)
\item
  如果 \(\mathit{\rho}(\mathit{X},\mathit{Y}) = 1\), 那么 \(\mathit{Y} = \mathit{a}\mathit{X} + \mathit{b}\) for some \(\mathit{a} > 0\) and \(\mathit{b}\); 如果 \(\mathit{\rho}(\mathit{X},\mathit{Y}) = - 1\), 那么 \(\mathit{Y} = \mathit{a}\mathit{X} + \mathit{b}\) for some \(\mathit{a} < 0\) and \(\mathit{b}\).~
\item
  By Cauchy-Schwarz inequality, \(\left. |\text{Cov}(\mathit{X},\mathit{Y}) \middle| \leq \mathit{\sigma}_{\mathit{X}}\mathit{\sigma}_{\mathit{Y}} \right.\).
\end{itemize}

\end{proposition}
```
