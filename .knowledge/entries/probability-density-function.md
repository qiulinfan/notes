---
schema: kgdistiller-entry-v1
id: probability-density-function
label: probability density function 的性质
kind: proposition
aliases: []
source: notes/math/prob/chapters/02-random-variables.tex
line_start: 471
line_end: 490
understanding: unknown
---

# probability density function 的性质

## Summary

pdf 非负、积分为一，区间概率是密度积分。

## Evidence

```
\begin{proposition}{\kn{probability density function 的性质}}

对于 continuous random variable \(\mathit{X}\) with pdf \(\mathit{f}_{\mathit{X}}\),

\begin{itemize}
\item
  \(\mathit{f}_{\mathit{X}}(\mathit{x}) \geq 0\) for \(\mathit{m}\)-a.e. \(\mathit{x} \in \mathbb{R}\). (因为 \(\mathit{F}_{\mathit{X}}\) 是 non-decreasing 的.)
\item
  \(\int_{- \infty}^{+ \infty}\mathit{f}_{\mathit{X}}(\mathit{x})\mathit{d}\mathit{x} = 1\). (因为 \(\mathit{F}_{\mathit{X}}(\infty) = 1\).)
\item
  对于任意 Borel set \(\mathit{A}\), 有

  \[\mathbb{P}(\mathit{X} \in \mathit{A}) = \mathbb{P}^{\mathit{X}}(\mathit{A}) = \int_{\mathit{A}}\mathit{f}_{\mathit{X}}(\mathit{x})\mathit{d}\mathit{x}\]
\item
  对于 \(\mathit{m}\)-a.e. \(\mathit{x} \in \mathbb{R}\),

  \[\mathit{f}_{\mathit{X}}(\mathit{x}) = \lim\limits_{\mathit{\varepsilon}\rightarrow 0^{+}}\frac{\mathbb{P}^{\mathit{X}}(\lbrack\mathit{x},\mathit{x} + \mathit{\varepsilon}))}{\mathit{\varepsilon}} = \lim\limits_{\mathit{\varepsilon}\rightarrow 0^{+}}\frac{\mathit{F}_{\mathit{X}}(\mathit{x} + \mathit{\varepsilon}) - \mathit{F}_{\mathit{X}}(\mathit{x})}{\mathit{\varepsilon}}\]
\end{itemize}

\end{proposition}
```
