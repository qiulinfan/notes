---
label: real-valued integrable function prerequisite for dominated convergence theorem
kind: prerequisite-for
prerequisite:
  - "[[real-valued-integrable-function]]"
dependent:
  - "[[dominated-convergence-theorem]]"
source: notes/math/measure-theory/chapters/05-integration_of_real_and_complex_functions.tex
lines: 253-268
---
the dominating function must be integrable

## Evidence

> \begin{theorem}{\kn{dominated convergence theorem}}
>
> Let \((f_{n})\) be a seq of functions in \(L^{1}(\mu)\), s.t.
>
> \begin{itemize}
> \item
>   \(f_{n}\rightarrow f\) a.e.
> \item
>   存在 \(g \in L^{1}(\mu)\) s.t. \(\left. |f_{n} \middle| \leq g \right.\) a.e. for all \(n\).
> \end{itemize}
>
> Claim: \(f \in L^{1}(\mu)\) 并且
>
> \[\int f = \lim\limits_{n}\int f_{n}\]
>
> \end{theorem}
