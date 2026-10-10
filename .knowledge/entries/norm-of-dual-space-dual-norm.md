---
schema: kgdistiller-entry-v1
id: norm-of-dual-space-dual-norm
label: "norm of dual space: 即 dual norm"
kind: definition
aliases: []
source: notes/math/measure-theory/chapters/13-the_dual_of_L^p-spaces.tex
line_start: 110
line_end: 118
understanding: unknown
---

# norm of dual space: 即 dual norm

## Summary

Given $f in V^(*)$, set $ \|\|f\|\|_(*): = sup_(v in V\\{ 0 }) frac(\|f\(v\)\|, \|\|v\|\|) = sup_(\|\|v\|\|= 1)\|f\(v\)\| $ where $parallel v parallel$ 表示的是 $V$ 上使用的 norm. 这个 norm 被称为 dual norm.

## Evidence

```
\begin{definition}{\kn{norm of dual space: 即 \textbf{dual norm}}}

Given \(f \in V^{\ast}\), set

\[\left. | \middle| f \middle| \middle| {}_{\ast}: = \sup\limits_{v \in V\backslash{\{ 0\}}}\frac{|f(v)|}{\left. | \middle| v \middle| | \right.} = \sup\limits_{||v|| = 1} \middle| f(v)| \right.\]

where \(\parallel v \parallel\) 表示的是 \(V\) 上使用的 norm. 这个 norm 被称为 dual norm.

\end{definition}
```
