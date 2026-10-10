---
schema: kgdistiller-entry-v1
id: distribution-function
label: distribution function 的性质
kind: theorem
aliases: []
source: notes/math/prob/chapters/02-random-variables.tex
line_start: 225
line_end: 242
understanding: unknown
---

# distribution function 的性质

## Summary

CDF 单调、右连续，极限为 0 与 1，并以增量给出区间概率。

## Evidence

```
\begin{theorem}{\kn{distribution function 的性质}}\label{thm-02-random-variables-distribution-function}

对于 random variable \(\mathit{X}:\Omega\rightarrow\mathbb{R}\), 其 distribution function \(\mathit{F}_{\mathit{X}}\) 满足:

\begin{itemize}
\item
  \(\mathit{F}_{\mathit{X}}\) 是 non-decreasing (non-strictly increasing) 的.
\item
  \(\lim_{\mathit{x}\rightarrow + \infty}\mathit{F}_{\mathit{X}}(\mathit{x}) = 1\), \(\lim_{\mathit{x}\rightarrow - \infty}\mathit{F}_{\mathit{X}}(\mathit{x}) = 0\).
\item
  \(\mathit{F}_{\mathit{X}}\) 是 right-continuous 的. 即对于任意 \(\mathit{x}_{0}\), 有 \(\lim_{\mathit{x}\rightarrow\mathit{x}_{0}^{+}}\mathit{F}_{\mathit{X}}(\mathit{x}) = \mathit{F}_{\mathit{X}}(\mathit{x}_{0})\).
\item
  对于任意 \(\mathit{x}_{0}\), 有 \(\lim_{\mathit{x}\rightarrow\mathit{x}_{0}^{-}}\mathit{F}_{\mathit{X}}(\mathit{x}) = \mathit{P}(\mathit{X} < \mathit{x}_{0})\). 并且 \(\mathbb{P}(\mathit{X} = \mathit{x}_{0}) = \lim_{\mathit{x}\rightarrow\mathit{x}_{0}^{+}}\mathit{F}_{\mathit{X}}(\mathit{x}) - \lim_{\mathit{x}\rightarrow\mathit{x}_{0}^{-}}\mathit{F}_{\mathit{X}}(\mathit{x})\).
\item
  对于任意 \(\mathit{x}_{1} < \mathit{x}_{2}\), 有 \(\mathit{P}(\mathit{X} \in (\mathit{x}_{1},\mathit{x}_{2}\rbrack) = \mathit{F}_{\mathit{X}}(\mathit{x}_{2}) - \mathit{F}_{\mathit{X}}(\mathit{x}_{1})\).
\end{itemize}

\end{theorem}
```
