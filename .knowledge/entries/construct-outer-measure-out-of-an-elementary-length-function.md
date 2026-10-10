---
schema: kgdistiller-entry-v1
id: construct-outer-measure-out-of-an-elementary-length-function
label: construct outer measure out of an "elementary length function"
kind: theorem
aliases: []
source: notes/math/measure-theory/chapters/02-outer-measure-与-completion-of-a-measurable-space.tex
line_start: 100
line_end: 108
understanding: unknown
---

# construct outer measure out of an "elementary length function"

## Summary

另 $cal(E) subset.eq cal(P)\(X\)$ 为一个包含 $diameter\,X$ 的集合, 并定义 $rho : cal(E) arrow.r\[0\,oo\)$ 为一个满足 $rho\(diameter\)= 0$ 的函数, 则 $ mu^(*)\(A\)= inf { sum_(i = 1)^oo rho\(E_i\)divides E_i in cal(E) upright(" for each i and ") A subset.eq union.big_(i = 1)^oo E_i } $ is an outer measure.

## Evidence

```
\begin{theorem}{\kn{construct outer measure out of an "elementary length function"}}\label{thm-02-outer-measure-completion-of-a-measurable-space-construct-outer-measure-out-of-an-elementary-length-function}

另 \(\mathcal{E} \subseteq \mathcal{P}(X)\) 为一个包含 \(\varnothing,X\) 的集合, 并定义 \(\rho:\mathcal{E}\rightarrow\lbrack 0,\infty)\) 为一个满足 \(\rho(\varnothing) = 0\) 的函数, 则

\[\mu^{\ast}(A) = \inf\left\{ {\sum\limits_{i = 1}^{\infty}\rho(E_{i}) \mid E_{i} \in \mathcal{E}\ \text{for each i and}\ A \subseteq \bigcup\limits_{i = 1}^{\infty}E_{i}} \right\}\]

is an outer measure.

\end{theorem}
```
