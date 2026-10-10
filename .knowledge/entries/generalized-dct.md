---
schema: kgdistiller-entry-v1
id: generalized-dct
label: Generalized DCT
kind: theorem
aliases: []
source: notes/math/measure-theory/homeworks/hw08-on_L^p-spacecs.tex
line_start: 434
line_end: 452
understanding: unknown
---

# Generalized DCT

## Summary

Let $\(X\,cal(A)\,mu\)$ be a measure space, and $f_n\,g_n\,f\,g in L^1$, $n in bb(N)$. Suppose that - $lim_(n arrow.r oo) f_n\(x\)= f\(x\)$ and $lim_(n arrow.r oo) g_n\(x\)= g\(x\)$ for a.e. $x$\; - $\|f_n\(x\)\|lt.eq g_n\(x\)$ a.e. for every $n in bb(N)$\; - $g_n : X arrow.r\[0\,oo\]$ and $lim_(n arrow.r oo) integral g_n d mu = integral g d mu$. Then we have: $ lim_(n arrow.r oo) integral f_n d mu = integral f d mu $

## Evidence

```
\begin{theorem}{\kn{Generalized DCT}}

Let \((X,\mathcal{A},\mu)\) be a measure space, and \(f_{n},g_{n},f,g \in L^{1}\), \(n \in \mathbb{N}\). This is the varying-dominator extension of \knref{dominated-convergence-theorem}.\\
Suppose that

\begin{itemize}
\item
  \(\lim_{n\rightarrow\infty}f_{n}(x) = f(x)\) and \(\lim_{n\rightarrow\infty}g_{n}(x) = g(x)\) for a.e. \(x\);
\item
  \(\left. |f_{n}(x) \middle| \leq g_{n}(x) \right.\) a.e. for every \(n \in \mathbb{N}\);
\item
  \(g_{n}:X\rightarrow\lbrack 0,\infty\rbrack\) and \(\lim_{n\rightarrow\infty}\int g_{n} d\mu = \int g d\mu\).
\end{itemize}

Then we have:

\[\lim\limits_{n\rightarrow\infty}\int f_{n} d\mu = \int f d\mu\]

\end{theorem}
```
