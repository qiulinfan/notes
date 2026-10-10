---
label: L^ + space and integration on it prerequisite for monotone convergence theorem
kind: prerequisite-for
prerequisite:
  - "[[l-space-and-integration-on-it]]"
dependent:
  - "[[monotone-convergence-theorem]]"
source: notes/math/measure-theory/chapters/04-measurable_functions_and_integration_on_L^+(mu).tex
lines: 559-570
---
monotone convergence concerns the nonnegative integral

## Evidence

> \begin{theorem}{\kn{monotone convergence theorem}}
>
> Let \(\left\{ f_{n} \right\}_{n \in \mathbb{N}}\) be a seq in \(L^{+}(\mu)\), 并且有 \(f_{n} \leq f_{n + 1}\) for each \(n\).\\
> 我们 define:
>
> \[f := \lim\limits_{n}f_{n}( = \sup\limits_{n}f_{n})\]
>
> , 则一定有
>
> \[\int f = \lim\limits_{n\rightarrow\infty}\int f_{n}\]
>
> \end{theorem}
