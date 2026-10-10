---
label: "monotone convergence theorem prerequisite for Fatou's Lemma"
kind: prerequisite-for
prerequisite:
  - "[[monotone-convergence-theorem]]"
dependent:
  - "[[fatou-lemma]]"
source: notes/math/measure-theory/chapters/04-measurable_functions_and_integration_on_L^+(mu).tex
lines: 729-735
---
Fatou's lemma is derived using monotone convergence

## Evidence

> \begin{theorem}{\kn{Fatou's Lemma}}
>
> 令 \((f_{n})\) be a seq of functions in \(L^{+}(\mu)\), then
>
> \[\operatorname{lim\, inf}\limits_{n}\int f_{n} \geq \int\operatorname{lim\, inf}\limits_{n}f_{n}\]
>
> \end{theorem}
