---
schema: kgdistiller-entry-v1
id: properties-of-measure
label: properties of measure
kind: theorem
aliases: []
source: notes/math/measure-theory/chapters/01-sigma-algebra-与-measure.tex
line_start: 304
line_end: 359
understanding: unknown
---

# properties of measure

## Summary

对于任何 measure space $\(X\,cal(M)\,mu\)$: + monotonicity: $A subset.eq B in cal(M) arrow.r.double.long mu\(A\)lt.eq thin mu\(B\)$ [ trivial. ] + countable subadditivity: $ mu\(union.big_(i = 1)^oo A_i\)lt.eq sum_(i = 1)^oo mu\(A_i\) $ [ By setting $B_i = A_i\\ union.big_(j = 1)^(i - 1) A_j$, 而后通过 ctbl disjoint additivity 与 monotonicity 可得 ] + continuous from above: 如果 $A_i subset.eq A_(i + 1) forall i gt.eq 2 arrow.r.double.long$ $ mu\(union.big_(i = 1)^oo A_i\)= lim_(i arrow.r oo) mu\(A_i\) $ [ 使用 same trick as 2. ] + countinuous from below: 如果 $A_i supset.eq A_(i + 1) forall i$ 且存在某个 $j$ 使得 $mu\(A_i\)< oo$, 则 $ mu\(inter.big_(i = 1)^oo A_i\)= lim_(n arrow…

## Evidence

```
\begin{theorem}{\kn{properties of measure}}

对于任何 measure space \((X,\mathcal{M},\mu)\):

\begin{enumerate}
\item
  \textbf{monotonicity}: \(A \subseteq B \in \mathcal{M}\Longrightarrow\mu(A) \leq \,\mu(B)\)

  \begin{proof}

  trivial.

  \end{proof}
\item
  \textbf{countable subadditivity}:

  \[\mu(\bigcup\limits_{i = 1}^{\infty}A_{i}) \leq \sum\limits_{i = 1}^{\infty}\mu(A_{i})\]

  \begin{proof}

  By setting \(B_{i} = A_{i}\backslash\bigcup_{j = 1}^{i - 1}A_{j}\), 而后通过 ctbl disjoint additivity 与 monotonicity 可得

  \end{proof}
\item
  \textbf{continuous from above}: 如果 \(A_{i} \subseteq A_{i + 1}\forall i \geq 2\Longrightarrow\)

  \[\mu(\bigcup\limits_{i = 1}^{\infty}A_{i}) = \lim\limits_{i\rightarrow\infty}\mu(A_{i})\]

  \begin{proof}

  使用 same trick as 2.

  \end{proof}
\item
  \textbf{countinuous from below}: 如果 \(A_{i} \supseteq A_{i + 1}\forall i\) 且存在某个 \(j\) 使得 \(\mu(A_{i}) < \infty\), 则

  \[\mu(\bigcap\limits_{i = 1}^{\infty}A_{i}) = \lim\limits_{n\rightarrow\infty}\mu(A_{n})\]

  \begin{proof}

  前面的都无视, 直到第一个 measure \(< \infty\) 的集合, 是可能出现在最后的 intersection 里的最大集合. 我们 Fix 这个 \(A_{j}\). 通过构造补集的方式, 把交转为并, 从而用 (3) 得证. Define: \(E_{i} := A_{j}\backslash A_{i}\forall i \geq j\) 从而

  \[\bigcup\limits_{i = j}^{\infty}E_{i} = A_{j}\backslash(\bigcap\limits_{i = j}^{\infty}A_{i})\]

  进而

  \[\mu(\bigcup\limits_{i = j}^{\infty}E_{i}) = \mu(A_{j}) - \mu(\bigcap\limits_{i = j}^{\infty}A_{i})\]

  进而 by (3)

  \[\mu(\bigcap\limits_{i = 1}^{\infty}A_{i}) = \mu(\bigcap\limits_{i = j}^{\infty}A_{i}) = \mu(A_{j}) - \lim\limits_{i\rightarrow\infty}\mu(E_{i}) = \mu(A_{j}) - \lim\limits_{i\rightarrow\infty}(\mu(A_{j}) - \mu(A_{i})) = \lim\limits_{i\rightarrow\infty}A_{i}\]

  \end{proof}
\end{enumerate}

\end{theorem}
```
