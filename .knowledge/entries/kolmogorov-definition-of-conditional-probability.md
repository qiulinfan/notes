---
label: Kolmogorov definition of conditional probability
kind: definition
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
lines: 698-707
understanding: unknown
---
给定 sub-σ-algebra 𝓖⊆𝓕，P(A|𝓖) 是满足 ∫_G P(A|𝓖)dP=P(A∩G)（对所有 G∈𝓖）的 𝓖-measurable random variable，并在 P-a.s. 意义下唯一。当条件 event 具有正概率时，它退化为经典 conditional probability。

## Evidence

> \begin{definition}{\kn{Kolmogorov definition of conditional probability}}
>
> 对于给定的 prob space \((\Omega,\mathcal{F},\mathbb{P})\), 设 \(\mathcal{G} \subseteq \mathcal{F}\) 是一个 sub-\(\mathit{\sigma}\)-algebra. 对于 event \(\mathit{A} \in \mathcal{F}\), 条件概率 \(\mathbb{P}(\mathit{A} \mid \mathcal{G})\) 是一个 \(\mathcal{G}\)-measurable 的随机变量, 其满足对于任意 \(\mathit{G} \in \mathcal{G}\), 有:
>
> \[\int_{\mathit{G}}\mathbb{P}(\mathit{A} \mid \mathcal{G})\,\mathit{d}\mathbb{P} = \mathbb{P}(\mathit{A} \cap \mathit{G})\]
>
> 显然, 当 \(\mathbb{P}(\mathit{B}) > 0\) 时, 这个定义和我们之前的定义是等价的.\\
> 这个 random variable \(\mathbb{P}(\mathit{A} \mid \mathcal{G})\) 在 \(\mathbb{P}\)-a.s. 意义下是唯一的.
>
> \end{definition}
