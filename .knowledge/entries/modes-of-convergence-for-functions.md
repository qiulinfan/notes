---
label: modes of convergence for measurable functions
kind: definition
source: notes/math/measure-theory/chapters/05-integration_of_real_and_complex_functions.tex
lines: 862-881
understanding: unknown
---
对于 $f_n\,f : X arrow.r bb(C)$, 我们定义以下三种 convergence: - fast $L^1$-convergence: if $ sum_(n = 1)^oo integral\|f_n - f\|< oo $ - convergence in measure: if $ mu\(x :\|f_n\(x\)- f\(x\)\|> epsilon.alt\)arrow.r^(n arrow.r oo) 0 $ - subseq a.e. convergence: if 存在一个 subseq $\(f_(n_j)\)$ 使得 $ f_(n_j) arrow.r^(j arrow.r oo) f a . e . $

## Evidence

> \begin{definition}{\kn{modes of convergence for measurable functions}}
>
> 对于 \(f_{n},f:X\rightarrow\mathbb{C}\), 我们定义以下三种 convergence:
>
> \begin{itemize}
> \item
>   \textbf{fast \(L^{1}\)-convergence}: if
>
>   \[\left. \sum\limits_{n = 1}^{\infty}\int \middle| f_{n} - f \middle| < \infty \right.\]
> \item
>   \textbf{convergence in measure}: if
>
>   \[\left. \mu(x: \middle| f_{n}(x) - f(x) \middle| > \varepsilon)\overset{n\rightarrow\infty}{\rightarrow}0 \right.\]
> \item
>   \textbf{subseq a.e. convergence}: if 存在一个 subseq \((f_{n_{j}})\) 使得
>
>   \[f_{n_{j}}\overset{j\rightarrow\infty}{\rightarrow}f a.e.\]
> \end{itemize}
>
> \end{definition}
