---
schema: kgdistiller-entry-v1
id: sequential-behavior-of-real-valued-measurable-function
label: sequential behavior of real-valued measurable function
kind: lemma
aliases: []
source: notes/math/measure-theory/chapters/04-measurable_functions_and_integration_on_L^+(mu).tex
line_start: 176
line_end: 194
understanding: unknown
---

# sequential behavior of real-valued measurable function

## Summary

如果 ${ f_n : X arrow.r accent(bb(R), macron) }_(n in bb(N))$ 是一个 seq of $cal(M)$-measurable functions, 那么 - $ g_1\(x\): = sup_j f_j\(x\) $ - $ g_2\(x\): = inf_j f_j\(x\) $ - $ g_3\(x\): = limsup_(j arrow.r oo) f_j\(x\) $ - $ g_4\(x\): = liminf_(j arrow.r oo) f_j\(x\) $ 都是 $cal(M)$-measurable 的.

## Evidence

```
\begin{lemma}{\kn{sequential behavior of real-valued measurable function}}

如果 \(\left\{ {f_{n}:X\rightarrow\bar{\mathbb{R}}} \right\}_{n \in \mathbb{N}}\) 是一个 seq of \(\mathcal{M}\)-measurable functions, 那么

\begin{itemize}
\tightlist
\item
  \[g_{1}(x): = \sup\limits_{j}f_{j}(x)\]
\item
  \[g_{2}(x): = \inf\limits_{j}f_{j}(x)\]
\item
  \[g_{3}(x): = \operatorname{lim\, sup}\limits_{j\rightarrow\infty}f_{j}(x)\]
\item
  \[g_{4}(x): = \operatorname{lim\, inf}\limits_{j\rightarrow\infty}f_{j}(x)\]
\end{itemize}

都是 \(\mathcal{M}\)-measurable 的.

\end{lemma}
```
