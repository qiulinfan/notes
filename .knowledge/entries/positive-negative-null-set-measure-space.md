---
schema: kgdistiller-entry-v1
id: positive-negative-null-set-measure-space
label: positive, negative, null set 内的局部性质和普通的 measure space 一样
kind: lemma
aliases: []
source: notes/math/measure-theory/chapters/10-signed_measure&Jordan-decomposition.tex
line_start: 161
line_end: 174
understanding: unknown
---

# positive, negative, null set 内的局部性质和普通的 measure space 一样

## Summary

如果 $E$ 是一个 positive set for signed measure $nu$, 那么 $ F subset E arrow.r.double.long nu\(F\)lt.eq nu\(E\) $ 通过上一个 lemma, $E$ 的任何子集也有这个性质. 因而 $E$ 局部是一个普通的 measure space. \ 同理, 如果 $E$ 是一个 negative set, 那么 $ F subset E arrow.r.double.long nu\(F\)gt.eq nu\(E\) $ 因而 $E$ 局部也等价于是一个普通的 measure space, 只不过所有集合的 measure 加上了一个负号.

## Evidence

```
\begin{lemma}{\kn{positive, negative, null set 内的局部性质和普通的 measure space 一样}}

如果 \(E\) 是一个 \textbf{positive set} for signed measure \(\nu\), 那么

\[F \subset E\Longrightarrow\nu(F) \leq \nu(E)\]

通过上一个 lemma, \(E\) 的任何子集也有这个性质. 因而 \textbf{\(E\) 局部是一个普通的 measure space}.\\
同理, 如果 \(E\) 是一个 \textbf{negative set}, 那么

\[F \subset E\Longrightarrow\nu(F) \geq \nu(E)\]

因而 \(E\) 局部也等价于是一个普通的 measure space, 只不过所有集合的 measure 加上了一个负号.

\end{lemma}
```
