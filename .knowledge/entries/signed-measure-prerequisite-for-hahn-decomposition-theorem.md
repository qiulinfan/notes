---
label: signed measure prerequisite for Hahn Decomposition Theorem
kind: prerequisite-for
prerequisite:
  - "[[signed-measure]]"
dependent:
  - "[[hahn-decomposition-theorem]]"
source: notes/math/measure-theory/chapters/10-signed_measure&Jordan-decomposition.tex
lines: 213-228
---
Hahn decomposition is a theorem about signed measures

## Evidence

> \begin{theorem}{\kn{Hahn Decomposition Theorem}}
>
> 对于任意 measurable space \((X,\mathcal{A})\) 上的任意 signed measure \(\nu\), 都存在一个 positive set \(P\) 和一个 negative set \(N\) s.t.
>
> \[P \cap N = \varnothing\]
>
> 并且
>
> \[P \sqcup N = X\]
>
> 即\(X\) 被 \(\nu\) 划分为一个 positive measure space 和一个 negative measure space.\\
> 并且, \textbf{这个 decomposition 是唯一的, in \(\nu\)-a.e. sense}: 即, 如果 \(P',N'\) 是 another pair of such decomposition, 必然有:
>
> \[P\Delta P' = N\Delta N'\quad\text{is null set}\]
>
> \end{theorem}
