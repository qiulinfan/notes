---
schema: kgdistiller-entry-v1
id: jordan-decomposition-for-f-in-bv
label: Jordan decomposition for F in BV
kind: theorem
aliases:
  - Jordan decomposition for F in B V
source: notes/math/measure-theory/chapters/12-differentiation_on_real_spaces.tex
line_start: 591
line_end: 607
understanding: unknown
---

# Jordan decomposition for F in BV

## Summary

对于 $F : bb(R) arrow.r bb(R)$ (注意是 real-valued): $ F in B V arrow.l.r.double F upright(" 等于两个 bounded increasing functions 的差") $ Specially, $ F in B V arrow.l.r.double T_F plus.minus F upright(" bounded") $ 因而 for $F in B V$, 我们总是可以把它写作 $ F = 1 / 2\(T_F + F\)- 1 / 2\(T_F - F\) $ where we call it as the Jordan decomposition of $F in B V$. 其中, $1 / 2\(T_F + F\)$ 被称为 $F$ 的 positive variation\; $1 / 2\(T_F - F\)$ 被称为 $F$ 的 negative variation.

## Evidence

```
\begin{theorem}{\kn{Jordan decomposition for $F \in BV$}}

对于 \(F:\mathbb{R}\rightarrow\mathbb{R}\) (注意是 real-valued):

\[F \in BV\Leftrightarrow F\ \text{等于两个 bounded increasing functions 的差}\]

Specially,

\[F \in BV\Leftrightarrow T_{F} \pm F\ \text{bounded}\]

因而 for \(F \in BV\), 我们总是可以把它写作

\[F = \frac{1}{2}(T_{F} + F) - \frac{1}{2}(T_{F} - F)\]

where we call it as the \textbf{Jordan decomposition} of \(F \in BV\). 其中, \(\frac{1}{2}(T_{F} + F)\) 被称为 \(F\) 的 \textbf{positive variation}; \(\frac{1}{2}(T_{F} - F)\) 被称为 \(F\) 的 \textbf{negative variation}.

\end{theorem}
```
