---
label: probability space derived from sample space
kind: derived-from
derived:
  - "[[probability-space]]"
origin:
  - "[[sample-space]]"
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
lines: 366-374
---
The source constructs the probability-space triplet on the outcome set Omega called the sample space.

## Evidence

> \begin{definition}{\kn{probability space}, \kn{probability measure}, \kn{sample space},
> \kn{event space}}
>
> 按 \knref{measure space} 的定义, 一个 probability space 是三元组 \((\Omega,\mathcal{F},\mathbb{P})\), 其中 \(\mathbb{P}(\varnothing) = 0,\mathbb{P}(\Omega) = 1\).\\
> 对于这样的 \knref{measure} \(\mathbb{P}\), 我们称之为 \textbf{probability measure (概率测度, 即概率)}.\\
> 而这里的 \(\Omega\) 我们称之为 \textbf{sample space (样本空间)}; 这里的 \knref{$\mathit{\sigma}$-algebra} \(\mathcal{F}\), 我们称之为 \textbf{event space (事件空间)}.\\
> 任意的 \(\mathit{A} \subset \Omega\) 都是一个 \textbf{event}, 但是概率论中只考虑 \(\mathit{A} \in \mathcal{F}\), 即 measurable event. 为简化, event 这个单词就指 measurable event.
>
> \end{definition}
