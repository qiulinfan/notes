---
label: complete Fubini-Tonelli
kind: theorem
source: notes/math/measure-theory/chapters/06-product_measure&Fubini-Tonelli.tex
lines: 640-660
understanding: unknown
---
对于 complete measure space $\(X\,cal(A)\,mu\)$, $\(Y\,cal(B)\,nu\)$, 取它们的 product measure space 的 completion: $ \(X times Y\,accent(cal(A) times.o cal(B), macron)\,accent(mu times nu, macron)\) $ 我们将 $accent(cal(A) times.o cal(B), macron)$ 简易写作 $cal(L)$, $accent(mu times nu, macron)$ 简易写作 $lambda$. \ Suppose $f : X times Y arrow.r bb(C)$ is $cal(L)$-measurable 并且 $f in L^(+)\(lambda\)$ or $f in L^1\(lambda\)$, 则有 - $f_x$ 是 $cal(B)$-measurable 的 for a.e. $x$ 且 $x mapsto integral f_x d nu$ 是 measurable 的 - $f_y$ 是 $cal(A)$-measurable 的 for a.e…

## Evidence

> \begin{theorem}{\kn{complete Fubini-Tonelli}}
>
> 对于 complete measure space \((X,\mathcal{A},\mu)\), \((Y,\mathcal{B},\nu)\), 取它们的 product measure space 的 completion:
>
> \[(X \times Y,\bar{\mathcal{A}\otimes\mathcal{B}},\bar{\mu\times\nu})\]
>
> 我们将 \(\bar{\mathcal{A}\otimes\mathcal{B}}\) 简易写作 \(\mathcal{L}\), \(\bar{\mu\times\nu}\) 简易写作 \(\lambda\).\\
> Suppose \(f:X \times Y\rightarrow\mathbb{C}\) is \(\mathcal{L}\)-measurable 并且 \(f \in L^{+}(\lambda)\) or \(f \in L^{1}(\lambda)\), 则有
>
> \begin{itemize}
> \item
>   \(f_{x}\) 是 \(\mathcal{B}\)-measurable 的 for a.e. \(x\) 且 \(x\mapsto\int f_{x} d\nu\) 是 measurable 的
> \item
>   \(f_{y}\) 是 \(\mathcal{A}\)-measurable 的 for a.e. \(y\) 且 \(y\mapsto\int f_{y} d\mu\) 是 measurable 的
> \end{itemize}
>
> 并且, 在 \(f \in L^{1}(\lambda)\) 的情况下, \(f_{x},f_{y}\), \(x\mapsto\int f_{x} d\nu\), \(y\mapsto\int f_{y} d\mu\) 也是 \textbf{integrable} 的, 即 \(\in L^{1}(\lambda)\), 并且
>
> \[\int f d\lambda = \iint f d\mu d\nu = \iint f d\nu d\mu\]
>
> \end{theorem}
