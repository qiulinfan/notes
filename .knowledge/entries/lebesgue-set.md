---
schema: kgdistiller-entry-v1
id: lebesgue-set
label: Lebesgue set
kind: definition
aliases: []
source: notes/math/measure-theory/chapters/08-Hardy-Littlewood&LDT.tex
line_start: 224
line_end: 232
understanding: unknown
---

# Lebesgue set

## Summary

我们定义一个函数 $f in L_(l o c)^1\(bb(R)^n\)$ 的 Lebesgue set 为: $ L_f := { x in bb(R)^n divides lim_(r arrow.r 0^(+)) "avg"_(B\(x\,r\))\|f\(y\)- f\(x\)\| d y = 0 } $ 其中每个 point 被称为一个Lebesgue point.

## Evidence

```
\begin{definition}{\kn{Lebesgue set}}

我们定义一个函数 \(f \in L_{loc}^{1}(\mathbb{R}^{n})\) 的 Lebesgue set 为:

\[L_{f} := \left\{ x \in \mathbb{R}^{n} \mid \lim\limits_{r\rightarrow 0^{+}}\text{avg}_{B(x,r)} \middle| f(y) - f(x) \middle| dy = 0 \right\}\]

其中每个 point 被称为一个\textbf{Lebesgue point}.

\end{definition}
```
