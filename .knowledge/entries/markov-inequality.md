---
label: "Markov's inequality"
kind: theorem
source: notes/math/prob/chapters/04-LLN.tex
lines: 10-16
understanding: unknown
---
非负 X 与 t>0 时，P(X≥t)≤E[X]/t。

## Evidence

> \begin{theorem}{\kn{Markov's inequality}}
>
> 下文的 expectation 与 variance 采用 \knref{expectation and variance of random variable} 的定义。对于一个 non-negative random variable \(\mathit{X}\) (即 \(\mathit{X} \geq 0\) a.s.), 任取 \(\mathit{t} > 0\), 都有
>
> \[\mathbb{P}(\mathit{X} \geq \mathit{t}) \leq \frac{\mathbb{E}\lbrack\mathit{X}\rbrack}{\mathit{t}}\]
>
> \end{theorem}
