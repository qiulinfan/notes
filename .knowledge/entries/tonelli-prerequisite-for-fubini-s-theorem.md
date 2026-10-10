---
label: "Tonelli prerequisite for Fubini's Theorem"
kind: prerequisite-for
prerequisite:
  - "[[tonelli-theorem]]"
dependent:
  - "[[fubini-theorem]]"
source: notes/math/measure-theory/chapters/06-product_measure&Fubini-Tonelli.tex
lines: 569-585
---
Fubini's theorem uses Tonelli on positive and negative parts

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
