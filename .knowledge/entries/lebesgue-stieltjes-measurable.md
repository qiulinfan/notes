---
schema: kgdistiller-entry-v1
id: lebesgue-stieltjes-measurable
label: Lebesgue-Stieltjes measurable 的等价条件
kind: theorem
aliases: []
source: notes/math/measure-theory/chapters/03-distribution-function-与-lebesgue-stieltjes-measures.tex
line_start: 321
line_end: 342
understanding: unknown
---

# Lebesgue-Stieltjes measurable 的等价条件

## Summary

TFAE: + $ E in cal(M)_mu $ + 存在一个 $G_delta$ set $V$ 以及一个 measure zero set $N_1$ ($mu_F\(N_1\)= 0$) 使得 $ E = V\\N_1 $ + 存在一个 $F_sigma$ set $H$ 以及一个 measure zero set $N_2$ ($mu_F\(N_2\)= 0$) 使得 $ E = H union N_2 $ + 存在一个 open set $U$ 使得对于任意的 $epsilon.alt > 0$, 都有 $ mu^(*)\(U\\E\)< epsilon.alt $

## Evidence

```
\begin{theorem}{\kn{Lebesgue-Stieltjes measurable 的等价条件}}\label{thm-03-distribution-function-lebesgue-stieltjes-measures-lebesgue-stieltjes-measurable}

TFAE:

\begin{enumerate}
\item
  \[E \in \mathcal{M}_{\mu}\]
\item
  存在一个 \(G_{\delta}\) set \(V\) 以及一个 measure zero set \(N_{1}\) (\(\mu_{F}(N_{1}) = 0\)) 使得

  \[E = V\backslash N_{1}\]
\item
  存在一个 \(F_{\sigma}\) set \(H\) 以及一个 measure zero set \(N_{2}\) (\(\mu_{F}(N_{2}) = 0\)) 使得

  \[E = H \cup N_{2}\]
\item
  存在一个 open set \(U\) 使得对于任意的 \(\varepsilon > 0\), 都有

  \[\mu^{\ast}(U\backslash E) < \varepsilon\]
\end{enumerate}

\end{theorem}
```
