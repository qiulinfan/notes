---
label: conditional expectation
kind: definition
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 881-895
understanding: unknown
---
conditional expectation E[X|Y=y] 是 x 对 conditional distribution P^{X|Y=y} 的积分；discrete case 为加权和，continuous case 为 x f_{X|Y}(x|y) 的积分，并可视为 y 的函数。

## Evidence

> \begin{definition}{\kn{conditional expectation}}\label{def-03-joint-conditional-distribution-conditional-expectation}
>
> 令 \(\mathit{X},\mathit{Y}:\Omega\rightarrow\mathbb{R}\) 为 RVs. 这里沿用 \knref{expectation and variance of random variable} 中 expectation 的积分定义. 对于 \(\mathit{y} \in \mathbb{R}\) where \(\mathit{F}_{\mathit{X}|\mathit{Y}} = \mathbb{P}^{\mathit{X}|\mathit{Y} = \mathit{y}}(\mathit{X} \leq \mathit{x})\) is defined (这个条件对于 discrete 是筛选掉 \(\mathbb{P}(\mathit{y}) = 0\) 的点, 对于 continuous 这是为了筛选掉 \(\mathit{f}_{\mathit{Y}} = 0\) 的点), 我们定义 conditional expectation:
>
> \[\left. \mathbb{E}\lbrack\mathit{X} \middle| \mathit{Y} = \mathit{y}\rbrack := \int_{- \infty}^{\infty}\mathit{x}\,\mathit{d}\mathbb{P}^{\mathit{X}|\mathit{Y} = \mathit{y}}(\mathit{x}) \right.\]
>
> 特别地, 如果\((\mathit{X},\mathit{Y})\) 是一个 discrete random vector, 则它即是:
>
> \[\left. \mathbb{E}\lbrack\mathit{X} \middle| \mathit{Y} = \mathit{y}\rbrack = \sum\limits_{\mathit{x}}\mathit{x}\mathbb{P}(\mathit{X} \middle| \mathit{Y})(\mathit{x} \middle| \mathit{y}) = \sum\limits_{\mathit{x}}\mathit{x}\mathbb{P}(\mathit{X} = \mathit{x} \middle| \mathit{Y} = \mathit{y}) \right.\]
>
> 而如果 \((\mathit{X},\mathit{Y})\) 是一个 (absolutely) continuous random vector, 则它即是:
>
> \[\left. \mathbb{E}\lbrack\mathit{X} \middle| \mathit{Y} = \mathit{y}\rbrack = \int_{- \infty}^{\infty}\mathit{x}\mathit{f}_{\mathit{X}|\mathit{Y}}(\mathit{x} \middle| \mathit{y})\,\mathit{d}\mathit{x} \right.\]
>
> \end{definition}
