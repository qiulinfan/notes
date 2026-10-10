---
label: Derivative
kind: definition
source: notes/math/mathematical-analysis/chapters/05-differentiation.tex
lines: 6-22
understanding: unknown
---
The derivative of a real function is defined by its difference-quotient limit at an accumulation point.

## Evidence

> \begin{definition}{\kn{Derivative}}
>
> Let \(A \subset \mathbb{R}\), \(f:A\rightarrow\mathbb{R}\), and \(a \in A \cap A'\) (此处 \(a\) 是 accumulation point，所以 \(a\) lies in the domain of \(f'\)). Define the derivative of \(f\) at \(a\) by
>
> \[f^{'{(a)}} = \lim\limits_{h\rightarrow 0}\frac{f\left( {a + h} \right) - f(a)}{h}.\]
>
> If \(x = a + h\), then \(h = x - a\), hence equivalently
>
> \[f^{'{(a)}} = \lim\limits_{x\rightarrow a}\frac{f(x) - f(a)}{x - a}.\]
>
> 如果 \(f^{'{(a)}}\) exists，则称 \(f\) is differentiable at \(a\). 把 \(a\) 作为 variable 时，我们把 derivative 看作 function：
>
> \[f^{'{(x)}} = \lim\limits_{h\rightarrow 0}\frac{f\left( {x + h} \right) - f(x)}{h},\quad\operatorname{dom}\left( f' \right) = \left\{ {x \in \operatorname{dom}(f):f\ \text{is differentiable at}\ x} \right\}.\]
>
> 如果 \(B \subset \operatorname{dom}(f)\) 且 \(\forall x \in B\) 都有 \(f\) differentiable at \(x\)， 则称 \(f\) is differentiable on \(B\).
>
> \end{definition}
