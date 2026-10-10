---
schema: kgdistiller-entry-v1
id: sigma-algebra
label: σ-algebra
kind: definition
aliases:
  - sigma-algebra
source: notes/math/measure-theory/chapters/01-sigma-algebra-与-measure.tex
line_start: 21
line_end: 36
understanding: unknown
---

# σ-algebra

## Summary

对于 set $X$, $S subset.eq cal(P)\(X\)$ 被称为 $X$ 上的一个 $sigma$-algebra, if 其满足: + $nothing in X$\; + closed under complement: if $E in S$ then $X\\E in S$\; + closed under countable union: if $E_1\,E_2\,dots.h.c in S$ then $union.big_(k = 1)^oo E_k in S$. 如果第三条并不满足, 而是只满足 closed under finite union, 则称 $S$ 是 $X$ 上的一个 [algebra of sets]. 当然, $sigma$-algebra 是比 algebra 严格更强的条件.

## Evidence

```
\begin{definition}{\kn{$\sigma$-algebra}}

对于 set \(X\), \(S \subseteq \mathcal{P}(X)\) 被称为 \(X\) 上的一个 \(\sigma\)-algebra, if 其满足:

\begin{enumerate}
\item
  \(\varnothing \in X\);
\item
  \textbf{closed under complement}: if \(E \in S\) then \(X\backslash E \in S\);
\item
  \textbf{closed under countable union}: if \(E_{1},E_{2},\cdots \in S\) then \(\bigcup_{k = 1}^{\infty}E_{k} \in S\).
\end{enumerate}

如果第三条并不满足, 而是只满足 \textbf{closed under finite union}, 则称 \(S\) 是 \(X\) 上的一个 \kn{algebra of sets}. 当然, \(\sigma\)-algebra 是比 algebra 严格更强的条件.

\end{definition}
```
