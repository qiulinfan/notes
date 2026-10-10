---
schema: kgdistiller-entry-v1
id: monotone-differentiation-theorem
label: Monotone Differentiation Theorem
kind: theorem
aliases: []
source: notes/math/measure-theory/chapters/12-differentiation_on_real_spaces.tex
line_start: 241
line_end: 259
understanding: unknown
---

# Monotone Differentiation Theorem

## Summary

令 $F : bb(R) arrow.r bb(R)$ 为一个 increasing (nondecreasing) function, set: $ G\(x\): = F\(x +\) $即 $F$ 的右极限函数. (note: $G$ 一定是 increasing 且 right ctn 的, 因而是一个 distribution function) \ 则有: - $D_F := { x : F upright(" disctn at ") x }$ 是至多 ctbl 的 (从而一定 zero measure) - $F\,G$ 都 differentaitble $m$-a.e., 并且 $ F' = G' upright(" a.e.") $

## Evidence

```
\begin{theorem}{\kn{Monotone Differentiation Theorem}}

令 \(F:\mathbb{R}\rightarrow\mathbb{R}\) 为一个 increasing (nondecreasing) function, set:

\[G(x): = F(x + )\]

即 \(F\) 的右极限函数. (note: \(G\) 一定是 \textbf{increasing} 且 \textbf{right ctn} 的, 因而是一个 distribution function)\\
则有:

\begin{itemize}
\item
  \(D_{F} := \left\{ {x:F\ \text{disctn at}\ x} \right\}\) 是至多 ctbl 的 (从而一定 zero measure)
\item
  \(F,G\) 都 differentaitble \(m\)-a.e., 并且

  \[F' = G'\ \text{a.e.}\]
\end{itemize}

\end{theorem}
```
