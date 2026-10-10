---
label: "expectation and variance of random variable prerequisite for Markov's inequality"
kind: prerequisite-for
prerequisite:
  - "[[expectation-and-variance-of-random-variable]]"
dependent:
  - "[[markov-inequality]]"
source: notes/math/prob/chapters/04-LLN.tex
lines: 10-16
---
Markov's inequality bounds tails using expectation

## Evidence

> \begin{theorem}{\kn{Markov's inequality}}
>
> 下文的 expectation 与 variance 采用 \knref{expectation and variance of random variable} 的定义。对于一个 non-negative random variable \(\mathit{X}\) (即 \(\mathit{X} \geq 0\) a.s.), 任取 \(\mathit{t} > 0\), 都有
>
> \[\mathbb{P}(\mathit{X} \geq \mathit{t}) \leq \frac{\mathbb{E}\lbrack\mathit{X}\rbrack}{\mathit{t}}\]
>
> \end{theorem}
