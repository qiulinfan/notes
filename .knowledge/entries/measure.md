---
schema: kgdistiller-entry-v1
id: measure
label: measure
kind: definition
aliases: []
source: notes/math/measure-theory/chapters/01-sigma-algebra-与-measure.tex
line_start: 206
line_end: 224
understanding: unknown
---

# measure

## Summary

Let $X$ be a set, $cal(M)$ be a $sigma$-algebra on $X$. We call $\(X\,cal(M)\)$ a measurable space. \ A [measure] on this measurable space is a function $mu : cal(M) arrow.r\[0\,oo\)$ satisfying: + $mu\(nothing\)= 0$ + countable additive: $ mu\(union.big_(i = 1)^oo E_i\)= sum_(i = 1)^oo mu\(E_i\) $ for disjoint seq of $E_i in cal(M)$. 我们称 $\(X\,cal(M)\,mu\)$ 为一个 measure space.

## Evidence

```
\begin{definition}{\kn{measurable space} and \kn{measure space}}

Let \(X\) be a set, \(\mathcal{M}\) be a \(\sigma\)-algebra on \(X\). We call \((X,\mathcal{M})\) a measurable space.\\
A \kn{measure} on this measurable space is a function \(\mu:\mathcal{M}\rightarrow\lbrack 0,\infty)\) satisfying:

\begin{enumerate}
\item
  \(\mu(\varnothing) = 0\)
\item
  countable additive:

  \[\mu(\bigcup\limits_{i = 1}^{\infty}E_{i}) = \sum\limits_{i = 1}^{\infty}\mu(E_{i})\]

  for disjoint seq of \(E_{i} \in \mathcal{M}\).
\end{enumerate}

我们称 \((X,\mathcal{M},\mu)\) 为一个 measure space.

\end{definition}
```
