---
label: NBV prerequisite for Jordan decomposition for F in BV
kind: prerequisite-for
prerequisite:
  - "[[nbv]]"
dependent:
  - "[[jordan-decomposition-for-f-in-bv]]"
source: notes/math/measure-theory/chapters/12-differentiation_on_real_spaces.tex
lines: 591-607
---
Jordan decomposition applies to normalized BV functions

## Evidence

> \begin{theorem}{\kn{Jordan decomposition for $F \in BV$}}
>
> 对于 \(F:\mathbb{R}\rightarrow\mathbb{R}\) (注意是 real-valued):
>
> \[F \in BV\Leftrightarrow F\ \text{等于两个 bounded increasing functions 的差}\]
>
> Specially,
>
> \[F \in BV\Leftrightarrow T_{F} \pm F\ \text{bounded}\]
>
> 因而 for \(F \in BV\), 我们总是可以把它写作
>
> \[F = \frac{1}{2}(T_{F} + F) - \frac{1}{2}(T_{F} - F)\]
>
> where we call it as the \textbf{Jordan decomposition} of \(F \in BV\). 其中, \(\frac{1}{2}(T_{F} + F)\) 被称为 \(F\) 的 \textbf{positive variation}; \(\frac{1}{2}(T_{F} - F)\) 被称为 \(F\) 的 \textbf{negative variation}.
>
> \end{theorem}
