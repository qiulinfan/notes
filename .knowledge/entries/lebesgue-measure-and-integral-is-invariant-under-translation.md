---
schema: kgdistiller-entry-v1
id: lebesgue-measure-and-integral-is-invariant-under-translation
label: Lebesgue measure and integral is invariant under translation
kind: theorem
aliases: []
source: notes/math/measure-theory/chapters/07-Lebesgue_measure_on_R^n.tex
line_start: 204
line_end: 215
understanding: unknown
---

# Lebesgue measure and integral is invariant under translation

## Summary

(a) 任取 $a in bb(R)^n$, $ E in cal(L)^n arrow.r.double.long t_a\(E\)in cal(L)^n quad upright(" and ") quad m\(t_a\(E\)\)= m\(E\) $ (b) if $f : bb(R)^n arrow.r bb(C)$ is Leb measurable, then so is $f compose t_a$. \ More, if $f in L^(+)$ or $f in L^1$, then $f compose t_a in L^1$ 并且 $ integral\(f compose t_a\) d m = integral f d m $

## Evidence

```
\begin{theorem}{\kn{Lebesgue measure and integral is invariant under translation}}

(a) 任取 \(a \in \mathbb{R}^{n}\),

\[E \in \mathcal{L}^{n}\Longrightarrow t_{a}(E) \in \mathcal{L}^{n}\quad\text{and}\quad m(t_{a}(E)) = m(E)\]

(b) if \(f:\mathbb{R}^{n}\rightarrow\mathbb{C}\) is Leb measurable, then so is \(f \circ t_{a}\).\\
More, if \(f \in L^{+}\) or \(f \in L^{1}\), then \(f \circ t_{a} \in L^{1}\) 并且

\[\int(f \circ t_{a}) dm = \int f dm\]

\end{theorem}
```
