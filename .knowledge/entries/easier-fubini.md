---
schema: kgdistiller-entry-v1
id: easier-fubini
label: easier Fubini
kind: lemma
aliases: []
source: notes/math/measure-theory/chapters/06-product_measure&Fubini-Tonelli.tex
line_start: 238
line_end: 249
understanding: unknown
---

# easier Fubini

## Summary

条件: $\(X\,cal(A)\,mu\)$, $\(Y\,cal(B)\,nu\)$ 为 arbitrary measure space (不需要 $sigma$-finite.), $f : X arrow.r bb(C)$, $g : Y arrow.r bb(C)$ 为 measurable functions. \ 结论: $ h := f g quad upright("is ")\(cal(A) times.o cal(B)\)upright("-measurable") $ 并且如果 $f\,g$ 是 $L^1$ 的, 那么 $h in L^1\(mu times nu\)$ 并且 $ integral h d\(mu times nu\)= \( integral f d mu \) \( integral g d nu \) $

## Evidence

```
\begin{lemma}{\kn{easier Fubini}}

条件: \((X,\mathcal{A},\mu)\), \((Y,\mathcal{B},\nu)\) 为 arbitrary measure space (不需要 \(\sigma\)-finite.), \(f:X\rightarrow\mathbb{C}\), \(g:Y\rightarrow\mathbb{C}\) 为 measurable functions.\\
结论:

\[h := fg\quad\text{is}(\mathcal{A} \otimes \mathcal{B})\text{-measurable}\]

并且如果 \(f,g\) 是 \(L^{1}\) 的, 那么 \(h \in L^{1}(\mu \times \nu)\) 并且

\[\int h d(\mu \times \nu) = (\int f d\mu)(\int g d\nu)\]

\end{lemma}
```
