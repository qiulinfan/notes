---
label: properties of measure derived from measure is finitely additive
kind: derived-from
derived:
  - "[[properties-of-measure]]"
origin:
  - "[[measure-is-finitely-additive]]"
source: notes/math/measure-theory/chapters/01-sigma-algebra-与-measure.tex
lines: 304-359
---
The proofs decompose sets into finite disjoint pieces before applying additivity.

## Evidence

> \begin{theorem}{\kn{properties of measure}}
>
> 对于任何 measure space \((X,\mathcal{M},\mu)\):
>
> \begin{enumerate}
> \item
>   \textbf{monotonicity}: \(A \subseteq B \in \mathcal{M}\Longrightarrow\mu(A) \leq \,\mu(B)\)
>
>   \begin{proof}
>
>   trivial.
>
>   \end{proof}
> \item
>   \textbf{countable subadditivity}:
>
>   \[\mu(\bigcup\limits_{i = 1}^{\infty}A_{i}) \leq \sum\limits_{i = 1}^{\infty}\mu(A_{i})\]
>
>   \begin{proof}
>
>   By setting \(B_{i} = A_{i}\backslash\bigcup_{j = 1}^{i - 1}A_{j}\), 而后通过 ctbl disjoint additivity 与 monotonicity 可得
>
>   \end{proof}
> \item
>   \textbf{continuous from above}: 如果 \(A_{i} \subseteq A_{i + 1}\forall i \geq 2\Longrightarrow\)
>
>   \[\mu(\bigcup\limits_{i = 1}^{\infty}A_{i}) = \lim\limits_{i\rightarrow\infty}\mu(A_{i})\]
>
>   \begin{proof}
>
>   使用 same trick as 2.
>
>   \end{proof}
> \item
>   \textbf{countinuous from below}: 如果 \(A_{i} \supseteq A_{i + 1}\forall i\) 且存在某个 \(j\) 使得 \(\mu(A_{i}) < \infty\), 则
>
>   \[\mu(\bigcap\limits_{i = 1}^{\infty}A_{i}) = \lim\limits_{n\rightarrow\infty}\mu(A_{n})\]
>
>   \begin{proof}
>
>   前面的都无视, 直到第一个 measure \(< \infty\) 的集合, 是可能出现在最后的 intersection 里的最大集合. 我们 Fix 这个 \(A_{j}\). 通过构造补集的方式, 把交转为并, 从而用 (3) 得证. Define: \(E_{i} := A_{j}\backslash A_{i}\forall i \geq j\) 从而
>
>   \[\bigcup\limits_{i = j}^{\infty}E_{i} = A_{j}\backslash(\bigcap\limits_{i = j}^{\infty}A_{i})\]
>
>   进而
>
>   \[\mu(\bigcup\limits_{i = j}^{\infty}E_{i}) = \mu(A_{j}) - \mu(\bigcap\limits_{i = j}^{\infty}A_{i})\]
>
>   进而 by (3)
>
>   \[\mu(\bigcap\limits_{i = 1}^{\infty}A_{i}) = \mu(\bigcap\limits_{i = j}^{\infty}A_{i}) = \mu(A_{j}) - \lim\limits_{i\rightarrow\infty}\mu(E_{i}) = \mu(A_{j}) - \lim\limits_{i\rightarrow\infty}(\mu(A_{j}) - \mu(A_{i})) = \lim\limits_{i\rightarrow\infty}A_{i}\]
>
>   \end{proof}
> \end{enumerate}
>
> \end{theorem}
