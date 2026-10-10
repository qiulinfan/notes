---
label: "σ-algebra closure properties: set difference, symmetric difference and countable intersection derived from σ-algebra"
kind: derived-from
derived:
  - "[[sigma-algebra-closure-properties]]"
origin:
  - "[[sigma-algebra]]"
source: notes/math/measure-theory/chapters/01-sigma-algebra-与-measure.tex
lines: 41-89
---
Every listed closure property is proved directly from the defining sigma-algebra axioms.

## Evidence

> \begin{theorem}{\kn{$\sigma$-algebra closure properties: set difference, symmetric
> difference and countable intersection}}
>
> Let \(S\) be a \(\sigma\)-algebra on set \(X\).\\
> Claim:
>
> \begin{enumerate}
> \item
>   \(X \in S\)
>
>   \begin{proof}
>
>   Directly from def.
>
>   \end{proof}
> \item
>   \(D,E \in S\Longrightarrow D \cup E,D \cap E,D\backslash E \in S\)
>
>   \begin{proof}
>
>   union: from def by leaving others as \(\varnothing\);\\
>   intersection:
>
>   \[(D \cap E)^{C} = D^{C} \cup E^{C} \in S\]
>
>   setminus:
>
>   \[D\backslash E = D \cap (X\backslash E) \in S\]
>
>   \end{proof}
> \item
>   \(D,E \in S\Longrightarrow D\Delta S \in S\)
>
>   \begin{proof}
>
>   \[D\Delta E = (D\backslash E)\bigcup(E\backslash D)\]
>
>   \end{proof}
> \item
>   \(A_{1},A_{2},\cdots \in S\Longrightarrow\bigcap_{i = 1}^{\infty}A_{i} \in S\)
>
>   \begin{proof}
>
>   \[(\bigcap\limits_{n = 1}^{\infty})^{C} = \bigcup\limits_{n = 1}^{\infty}E_{n}^{C} \in S\]
>
>   \end{proof}
> \end{enumerate}
>
> \end{theorem}
