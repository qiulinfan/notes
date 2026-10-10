---
schema: kgdistiller-entry-v1
id: vitali-covering-lemma
label: Vitali-type covering lemma
kind: lemma
aliases: []
source: notes/math/measure-theory/chapters/08-Hardy-Littlewood&LDT.tex
line_start: 139
line_end: 151
understanding: unknown
---

# Vitali-type covering lemma

## Summary

For given collection of balls ${ B_j subset bb(R)^n }_(j = 1)^k$, 存在 disjoint subcollection ${ B_(j_1)\,dots.h.c\,B_(j_m) }$ 使得$ union.big_(j = 1)^k B_j subset union.big_(i = 1)^m\(3 B_(j_i)\) $ (于是, $ m\(union.big_(j = 1)^k B_j\)lt.eq 3^n m\(union.big_(i = 1)^m\(3 B_(j_i)\)\) $)

## Evidence

```
\begin{lemma}{\kn{Vitali-type covering lemma}}

For given collection of balls \(\left\{ {B_{j} \subset \mathbb{R}^{n}} \right\}_{j = 1}^{k}\), 存在 \textbf{disjoint} subcollection \(\left\{ {B_{j_{1}},\cdots,B_{j_{m}}} \right\}\) 使得

\[\bigcup\limits_{j = 1}^{k}B_{j} \subset \bigcup\limits_{i = 1}^{m}(3B_{j_{i}})\]

(于是,

\[m(\bigcup\limits_{j = 1}^{k}B_{j}) \leq 3^{n}m(\bigcup\limits_{i = 1}^{m}(3B_{j_{i}}))\]

)

\end{lemma}
```
