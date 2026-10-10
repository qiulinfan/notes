---
label: probability distribution derived from random variable
kind: derived-from
derived:
  - "[[probability-distribution]]"
origin:
  - "[[random-variable]]"
source: notes/math/prob/chapters/02-random-variables.tex
lines: 161-171
---
189：X 的 distribution 被定义为其 push-forward probability measure。

## Evidence

> \begin{definition}{\kn{probability distribution}}
>
> 对于 random variable \(\mathit{X}:\Omega\rightarrow\mathbb{R}\) on \(\Omega,\mathcal{F},\mathbb{P}\), 其 probability distribution 是 \(\mathit{X}\) 对于 \(\mathbb{P}\) 的 pushforward measure, 记作 \(\mathbb{P}^{\mathit{X}}:\mathcal{B}(\mathbb{R})\rightarrow\lbrack 0,1\rbrack\). 即
>
> \[\mathbb{P}^{\mathit{X}}(\mathit{B}) := \mathbb{P}(\mathit{X}^{- 1}(\mathit{B})),\quad\forall\mathit{B} \in \mathcal{B}(\mathbb{R})\]
>
> 我们 write:
>
> \[\mathit{X} \sim \mathbb{P}^{\mathit{X}}\]
>
> \end{definition}
