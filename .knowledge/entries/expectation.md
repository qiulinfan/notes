---
schema: kgdistiller-entry-v1
id: expectation
label: expectation 的性质
kind: proposition
aliases: []
source: notes/math/prob/chapters/02-random-variables.tex
line_start: 681
line_end: 694
understanding: unknown
---

# expectation 的性质

## Summary

expectation 满足线性性、单调性及常数规则。

## Evidence

```
\begin{proposition}{\kn{expectation 的性质}}

令 \(\mathit{X},\mathit{Y}:\Omega\rightarrow\mathbb{R}\) 为 \textbf{integrable} random variables, 则

\begin{itemize}
\item
  \textbf{linearity of expectation}: \(\mathbb{E}\lbrack\mathit{a}\mathit{X} + \mathit{b}\mathit{Y}\rbrack = \mathit{a}\mathbb{E}\lbrack\mathit{X}\rbrack + \mathit{b}\mathbb{E}\lbrack\mathit{Y}\rbrack\) for any \(\mathit{a},\mathit{b} \in \mathbb{R}\).
\item
  \textbf{monotonicity of expectation}: 如果 \(\mathit{X} \leq \mathit{Y}\) a.s., 那么 \(\mathbb{E}\lbrack\mathit{X}\rbrack \leq \mathbb{E}\lbrack\mathit{Y}\rbrack\).
\item
  \textbf{absolute value}: \(\left. \mathbb{E}\lbrack\mathit{X}\rbrack \leq \mathbb{E}\lbrack \middle| \mathit{X} \middle| \rbrack \right.\)
\end{itemize}

\end{proposition}
```
