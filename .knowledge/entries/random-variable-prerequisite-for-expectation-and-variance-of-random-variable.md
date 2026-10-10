---
label: random variable prerequisite for expectation and variance of random variable
kind: prerequisite-for
prerequisite:
  - "[[random-variable]]"
dependent:
  - "[[expectation-and-variance-of-random-variable]]"
source: notes/math/prob/chapters/02-random-variables.tex
lines: 600-610
---
expectation and variance are functionals of a random variable

## Evidence

> \begin{definition}{\kn{expectation and variance of random variable}}
>
> 对于 random variable \(\mathit{X}:\Omega\rightarrow\mathbb{R}\), 其 expectation 定义为
>
> \[\mathbb{E}\lbrack\mathit{X}\rbrack := \int_{\Omega}\mathit{X}\mathit{d}\mathbb{P}\]
>
> 其 variance 定义为
>
> \[\text{Var}(\mathit{X}) := \mathbb{E}\lbrack(\mathit{X} - \mathbb{E}\lbrack\mathit{X}\rbrack)^{2}\rbrack = \int_{\Omega}(\mathit{X} - \mathbb{E}\lbrack\mathit{X}\rbrack)^{2}\mathit{d}\mathbb{P}\]
>
> \end{definition}
