---
schema: kgdistiller-entry-v1
id: chebyshev-inequality
label: Chebyshev's inequality
kind: lemma
aliases: []
source: notes/math/measure-theory/chapters/04-measurable_functions_and_integration_on_L^+(mu).tex
line_start: 807
line_end: 813
understanding: unknown
---

# Chebyshev's inequality

## Summary

对于 measure space $\(X\,cal(M)\,mu\)$, 如果 $f in L^(+)\(mu\)$ 并且 $c > 0$, 那么 $ mu { f gt.eq c } lt.eq 1 / c integral f $

## Evidence

```
\begin{lemma}{\kn{Chebyshev's inequality}}

对于 measure space \((X,\mathcal{M},\mu)\), \knref{markov-inequality} 在本处以非负函数的 measure-space 形式使用：如果 \(f \in L^{+}(\mu)\) 并且 \(c > 0\), 那么

\[\mu\left\{ {f \geq c} \right\} \leq \frac{1}{c}\int f\]

\end{lemma}
```
