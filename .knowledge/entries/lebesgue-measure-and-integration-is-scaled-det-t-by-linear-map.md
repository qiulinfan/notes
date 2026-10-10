---
label: Lebesgue measure and integration is scaled |det T| by linear map
kind: theorem
source: notes/math/measure-theory/chapters/07-Lebesgue_measure_on_R^n.tex
lines: 257-268
understanding: unknown
---
For $T in G L\(n\,bb(R)\)$ (即 linear map $T : bb(R)^n arrow.r bb(R)^n$ 且可逆) (a) 如果 $f : bb(R)^n arrow.r bb(C)$ is Lebesgue measurable, then so is $f compose T$. \ Moreover if $f in L^(+)$ or $f in L^1$, then $f compose T in L^(+)$, $f compose T in L^1$ respectively. And $ integral f d m =\|det T\|integral f compose T d m $ (b) $ E in cal(L)^n arrow.r.double.long T\(E\)in cal(L)^n quad upright("and") quad m\(T\(E\)\)=\|det T\|m\(E\) $

## Evidence

> \begin{theorem}{\kn{Lebesgue measure and integration is scaled $|\det T|$ by linear map}}
>
> For \(T \in GL(n,\mathbb{R})\) (即 linear map \(T:\mathbb{R}^{n}\rightarrow\mathbb{R}^{n}\) 且可逆) (a) 如果 \(f:\mathbb{R}^{n}\rightarrow\mathbb{C}\) is Lebesgue measurable, then so is \(f \circ T\).\\
> Moreover if \(f \in L^{+}\) or \(f \in L^{1}\), then \(f \circ T \in L^{+}\), \(f \circ T \in L^{1}\) respectively. And
>
> \[\left. \int f dm = \middle| \det T \middle| \int f \circ T dm \right.\]
>
> (b)
>
> \[\left. E \in \mathcal{L}^{n}\Longrightarrow T(E) \in \mathcal{L}^{n}\quad\text{and}\quad m(T(E)) = \middle| \det T \middle| m(E) \right.\]
>
> \end{theorem}
