---
label: "Fubini's Theorem"
kind: theorem
source: notes/math/measure-theory/chapters/06-product_measure&Fubini-Tonelli.tex
lines: 569-585
understanding: unknown
---
条件: $f in L^1\(mu times nu\)$, \ 结论: - $f_x in L^1\(nu\)$ for a.e. $x$, $f^y in L^1\(mu\)$ for a.e. - The a.e. defined functions: $ g\(x\):= integral f_x d nu in L^1\(mu\)\,quad h\(x\):= integral f^y d nu in L^1\(nu\) $ - $ integral f d\(mu times nu\)= integral g d mu = integral h d nu \(= integral.double f d mu d nu\) $

## Evidence

> \begin{theorem}{\kn{Fubini's Theorem}}
>
> 条件: \(f \in L^{1}(\mu \times \nu)\),\\
> 结论:
>
> \begin{itemize}
> \item
>   \(f_{x} \in L^{1}(\nu)\) for a.e. \(x\), \(f^{y} \in L^{1}(\mu)\) for a.e.
> \item
>   The a.e. defined functions:
>
>   \[g(x) := \int f_{x} d\nu \in L^{1}(\mu),\quad h(x) := \int f^{y} d\nu \in L^{1}(\nu)\]
> \item
>   \[\int f d(\mu \times \nu) = \int g d\mu = \int h d\nu( = \iint f d\mu d\nu)\]
> \end{itemize}
>
> \end{theorem}
