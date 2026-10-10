---
label: generalized LDT
kind: theorem
source: notes/math/measure-theory/chapters/08-Hardy-Littlewood&LDT.tex
lines: 441-456
understanding: unknown
---
对于 $f in L_(l o c)^1\(bb(R)^n\)$, 任意的 $x in L_f$, 令 ${ E_r\(x\)}$ 为 a family of Lebesgue measurable sets, 其中对于每个 $E_r\(x\)$ 都有: $ E_r\(x\)subset B\(x\,r\) $ 并且 $ m\(E_r\(x\)\)> alpha m\(B\(x\,r\)\) $ for some $0 < alpha < 1$. \ 则有: $ lim_(r arrow.r 0^(+)) frac(integral_(E_r\(x\))\|f\(y\)- f\(x\)\| d y, m\(E_r\(x\)) = 0 quad upright("for a.e.") x $

## Evidence

> \begin{theorem}{\kn{generalized LDT}}
>
> 对于 \(f \in L_{loc}^{1}(\mathbb{R}^{n})\), 任意的 \(x \in L_{f}\), 令 \(\left\{ {E_{r}(x)} \right\}\) 为 a family of Lebesgue measurable sets, 其中对于每个 \(E_{r}(x)\) 都有:
>
> \[E_{r}(x) \subset B(x,r)\]
>
> 并且
>
> \[m(E_{r}(x)) > \alpha m(B(x,r))\]
>
> for some \(0 < \alpha < 1\).\\
> 则有:
>
> \[\lim\limits_{r\rightarrow 0^{+}}\frac{\left. \int_{E_{r}(x)} \middle| f(y) - f(x) \middle| dy \right.}{m(E_{r}(x)} = 0\quad\text{for a.e.}\ x\]
>
> \end{theorem}
