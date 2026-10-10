---
label: algebra of sets generalizes σ-algebra
kind: generalizes
general:
  - "[[algebra-of-sets]]"
special:
  - "[[sigma-algebra]]"
source: notes/math/measure-theory/chapters/01-sigma-algebra-与-measure.tex
lines: 21-36
---
The source states that a sigma-algebra satisfies the stricter countable-union condition, while an algebra of sets requires only finite-union closure.

## Evidence

> \begin{definition}{\kn{$\sigma$-algebra}}
>
> 对于 set \(X\), \(S \subseteq \mathcal{P}(X)\) 被称为 \(X\) 上的一个 \(\sigma\)-algebra, if 其满足:
>
> \begin{enumerate}
> \item
>   \(\varnothing \in X\);
> \item
>   \textbf{closed under complement}: if \(E \in S\) then \(X\backslash E \in S\);
> \item
>   \textbf{closed under countable union}: if \(E_{1},E_{2},\cdots \in S\) then \(\bigcup_{k = 1}^{\infty}E_{k} \in S\).
> \end{enumerate}
>
> 如果第三条并不满足, 而是只满足 \textbf{closed under finite union}, 则称 \(S\) 是 \(X\) 上的一个 \kn{algebra of sets}. 当然, \(\sigma\)-algebra 是比 algebra 严格更强的条件.
>
> \end{definition}
