---
schema: kgdistiller-entry-v1
id: implies-support-sigma-finite
label: 积分收敛 Longrightarrow 发散点集零测, 以及 support σ-finite
kind: theorem
aliases:
  - 积分收敛 arrow.r.double.long 发散点集零测, 以及 support σ-finite
source: notes/math/measure-theory/chapters/04-measurable_functions_and_integration_on_L^+(mu).tex
line_start: 878
line_end: 891
understanding: unknown
---

# 积分收敛 Longrightarrow 发散点集零测, 以及 support σ-finite

## Summary

如果 $f in L^(+)\(mu\)$ 且 $\|integral f\|< oo$, 则有: $ mu\({ x in X divides f\(x\)= oo }\)= 0 $ 并且 $ { x divides f\(x\)> 0 } $ is $sigma$-finite

## Evidence

```
\begin{theorem}{\kn{积分收敛 $\Longrightarrow$ 发散点集零测, 以及 support
$\sigma$-finite}}

如果 \(f \in L^{+}(\mu)\) 且 \(\left. |\int f \middle| < \infty \right.\), 则有:

\[\mu(\left\{ {x \in X \mid f(x) = \infty} \right\}) = 0\]

并且

\[\left\{ {x \mid f(x) > 0} \right\}\]

is \textbf{\(\sigma\)-finite}

\end{theorem}
```
