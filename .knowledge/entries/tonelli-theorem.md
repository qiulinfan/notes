---
schema: kgdistiller-entry-v1
id: tonelli-theorem
label: Tonelli
kind: theorem
aliases: []
source: notes/math/measure-theory/chapters/06-product_measure&Fubini-Tonelli.tex
line_start: 493
line_end: 509
understanding: unknown
---

# Tonelli

## Summary

Let $\(X\,cal(A)\,mu\)$, $\(Y\,cal(B)\,nu\)$ be $sigma$-finite measure spaces. \ 条件: 令 $f in L^(+)\(X times Y\)$, \ 结论:$ g\(x\):= integral f\(x\,y\) d nu in L^(+)\(X\)quad h\(y\):= integral f\(x\,y\) d mu in L^(+)\(Y\) $ (显然) 并且 $ integral f d\(mu times nu\) & = integral \[ integral f\(x\,y\) d nu\(y\)\] d mu\(x\)\ & = integral \[ integral f\(x\,y\) d mu\(x\)\] d nu\(y\) $

## Evidence

```
\begin{theorem}{\kn{Tonelli}}

Let \((X,\mathcal{A},\mu)\), \((Y,\mathcal{B},\nu)\) be \(\sigma\)-finite measure spaces.\\
条件: 这里所用的非负可测函数积分空间见 \knref{l-space-and-integration-on-it}.\\
令 \(f \in L^{+}(X \times Y)\),\\
结论:

\[g(x) := \int f(x,y) d\nu \in L^{+}(X)\quad h(y) := \int f(x,y) d\mu \in L^{+}(Y)\]

(显然) 并且

\[\begin{matrix}
{\int f d(\mu \times \nu)} & {= \int\lbrack\int f(x,y) d\nu(y)\rbrack d\mu(x)} \\
 & {= \int\lbrack\int f(x,y) d\mu(x)\rbrack d\nu(y)}
\end{matrix}\]

\end{theorem}
```
