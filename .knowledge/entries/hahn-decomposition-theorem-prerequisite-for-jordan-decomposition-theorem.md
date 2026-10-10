---
label: Hahn Decomposition Theorem prerequisite for Jordan decomposition theorem
kind: prerequisite-for
prerequisite:
  - "[[hahn-decomposition-theorem]]"
dependent:
  - "[[jordan-decomposition-theorem]]"
source: notes/math/measure-theory/chapters/10-signed_measure&Jordan-decomposition.tex
lines: 502-517
---
Jordan decomposition is built from positive and negative Hahn sets

## Evidence

> \begin{theorem}{\kn{Jordan decomposition theorem}}
>
> 对于任意 s.m. \(\nu\) on \((X,\mathcal{A})\), 都存在唯一的 positive measure \(\nu^{+}\), \(\nu^{-}\) s.t.
>
> \begin{itemize}
> \item
>   \(\nu^{+},\nu^{-}\) 是 \((X,\mathcal{A})\) 上的 positive measure
> \item
>   \(\nu^{+},\nu^{-}\) 中\textbf{至少有一个是 finite measure} (对应了 \(\nu\) admit 的是 \(\infty\) 还是 \(- \infty\))
> \item
>   \[\nu = \nu^{+} - \nu^{-}\]
> \item
>   \[\nu^{+}\bot\,\nu^{-}\]
> \end{itemize}
>
> \end{theorem}
