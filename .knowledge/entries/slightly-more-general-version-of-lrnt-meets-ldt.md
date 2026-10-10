---
schema: kgdistiller-entry-v1
id: slightly-more-general-version-of-lrnt-meets-ldt
label: slightly more general version of LRNT meets LDT
kind: theorem
aliases: []
source: notes/math/measure-theory/chapters/12-differentiation_on_real_spaces.tex
line_start: 216
line_end: 226
understanding: unknown
---

# slightly more general version of LRNT meets LDT

## Summary

Let $nu$ be a regular Borel measure on $bb(R)^n$, with LRN decomposition $ nu = lambda + rho\,quad d rho = f thin d m\,quad lambda tack.t m $那么: 对于 $m$-a.e. $x in bb(R)^n$, 取任意 nicely shrinking ${ E_r }$ to $x$, 都有: $ lim_(r arrow.r 0) frac(nu\(E_r\), m\(E_r\)) = f\(x\) $

## Evidence

```
\begin{theorem}{\kn{slightly more general version of LRNT meets LDT}}

Let \(\nu\) be a regular Borel measure on \(\mathbb{R}^{n}\), with LRN decomposition

\[\nu = \lambda + \rho,\quad d\rho = f\, dm,\quad\lambda\bot m\]

那么: 对于 \(m\)-a.e. \(x \in \mathbb{R}^{n}\), 取任意 nicely shrinking \(\left\{ E_{r} \right\}\) to \(x\), 都有:

\[\lim\limits_{r\rightarrow 0}\frac{\nu(E_{r})}{m(E_{r})} = f(x)\]

\end{theorem}
```
