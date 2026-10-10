---
label: "Jensen's inequality"
kind: theorem
source: notes/math/prob/chapters/04-LLN.tex
lines: 88-94
understanding: unknown
---
凸 φ 下，φ(E[X])≤E[φ(X)]，要求两侧有限且有定义。

## Evidence

> \begin{theorem}{\kn{Jensen's inequality}}
>
> 对于一个 convex function \(\mathit{\varphi}\) 和 任意的 random variable \(\mathit{X}\), 只要 \(\mathbb{E}\lbrack\mathit{X}\rbrack\) 和 \(\mathbb{E}\lbrack\mathit{\varphi}(\mathit{X})\rbrack\) 都是 well-defined 的 (即 finite), 都有
>
> \[\mathit{\varphi}(\mathbb{E}\lbrack\mathit{X}\rbrack) \leq \mathbb{E}\lbrack\mathit{\varphi}(\mathit{X})\rbrack\]
>
> \end{theorem}
