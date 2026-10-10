---
schema: kgdistiller-entry-v1
id: independence-of-two-events
label: independence of two events 的等价定义
kind: proposition
aliases: []
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
line_start: 755
line_end: 761
understanding: unknown
---

# independence of two events 的等价定义

## Summary

在相关条件概率有定义时，A 与 B independent 等价于 P(B|A)=P(B)：A 的发生不改变 B 的概率。这个刻画由 independence 与 conditional probability 的定义直接得到。

## Evidence

```
\begin{proposition}{\kn{independence of two events 的等价定义}}

对于 prob space \((\Omega,\mathcal{F},\mathbb{P})\), 两个 events \(\mathit{A},\mathit{B} \in \mathcal{F}\) independent iff:

\[\mathbb{P}(\mathit{B} \mid \mathit{A}) = \mathbb{P}(\mathit{B})\]

\end{proposition}
```
