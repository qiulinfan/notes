---
label: "Markov's inequality prerequisite for Chebyshev's inequality"
kind: prerequisite-for
prerequisite:
  - "[[markov-inequality]]"
dependent:
  - "[[chebyshev-inequality]]"
source: notes/math/measure-theory/chapters/04-measurable_functions_and_integration_on_L^+(mu).tex
lines: 807-813
---
Chebyshev follows by applying Markov to a squared deviation

## Evidence

> \begin{lemma}{\kn{Chebyshev's inequality}}
>
> 对于 measure space \((X,\mathcal{M},\mu)\), \knref{markov-inequality} 在本处以非负函数的 measure-space 形式使用：如果 \(f \in L^{+}(\mu)\) 并且 \(c > 0\), 那么
>
> \[\mu\left\{ {f \geq c} \right\} \leq \frac{1}{c}\int f\]
>
> \end{lemma}
