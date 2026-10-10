---
schema: kgdistiller-entry-v1
id: ftc-in-lebesgue
label: FTC in Lebesgue
kind: theorem
aliases: []
source: notes/math/measure-theory/chapters/08-Hardy-Littlewood&LDT.tex
line_start: 466
line_end: 472
understanding: unknown
---

# FTC in Lebesgue

## Summary

对于 $f in L_(l o c)^1\(bb(R)\)$, 任取 $x in L_f$, 都有 $ lim_(r arrow.r 0) 1 / r integral_x^(x + r) f d m = f\(x\) $

## Evidence

```
\begin{theorem}{\kn{FTC in Lebesgue}}

对于 \(f \in L_{loc}^{1}(\mathbb{R})\), 任取 \(x \in L_{f}\), 都有

\[\lim\limits_{r\rightarrow 0}\frac{1}{r}\int_{x}^{x + r}f dm = f(x)\]

\end{theorem}
```
