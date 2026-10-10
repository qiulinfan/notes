---
schema: kgdistiller-entry-v1
id: sigma-algebra-closure-properties
label: "σ-algebra closure properties: set difference, symmetric difference and countable intersection"
kind: theorem
aliases: []
source: notes/math/measure-theory/chapters/01-sigma-algebra-与-measure.tex
line_start: 41
line_end: 89
understanding: unknown
---

# σ-algebra closure properties: set difference, symmetric difference and countable intersection

## Summary

Let $S$ be a $sigma$-algebra on set $X$. \ Claim: + $X in S$ [ Directly from def. ] + $D\,E in S arrow.r.double.long D union E\,D inter E\,D\\E in S$ [ union: from def by leaving others as $nothing$\; \ intersection: $ \(D inter E\)^C= D^C union E^C in S $ setminus: $ D\\E = D inter\(X\\E\)in S $ ] + $D\,E in S arrow.r.double.long D Delta S in S$ [ $ D Delta E =\(D\\E\)union.big\(E\\D\) $ ] + $A_1\,A_2\,dots.h.c in S arrow.r.double.long inter.big_(i = 1)^oo A_i in S$ [ $ \(inter.big_(n = 1)^oo\)^C= union.big_(n = 1)^oo E_n^C in S $ ]

## Evidence

```
\begin{theorem}{\kn{$\sigma$-algebra closure properties: set difference, symmetric
difference and countable intersection}}

Let \(S\) be a \(\sigma\)-algebra on set \(X\).\\
Claim:

\begin{enumerate}
\item
  \(X \in S\)

  \begin{proof}

  Directly from def.

  \end{proof}
\item
  \(D,E \in S\Longrightarrow D \cup E,D \cap E,D\backslash E \in S\)

  \begin{proof}

  union: from def by leaving others as \(\varnothing\);\\
  intersection:

  \[(D \cap E)^{C} = D^{C} \cup E^{C} \in S\]

  setminus:

  \[D\backslash E = D \cap (X\backslash E) \in S\]

  \end{proof}
\item
  \(D,E \in S\Longrightarrow D\Delta S \in S\)

  \begin{proof}

  \[D\Delta E = (D\backslash E)\bigcup(E\backslash D)\]

  \end{proof}
\item
  \(A_{1},A_{2},\cdots \in S\Longrightarrow\bigcap_{i = 1}^{\infty}A_{i} \in S\)

  \begin{proof}

  \[(\bigcap\limits_{n = 1}^{\infty})^{C} = \bigcup\limits_{n = 1}^{\infty}E_{n}^{C} \in S\]

  \end{proof}
\end{enumerate}

\end{theorem}
```
