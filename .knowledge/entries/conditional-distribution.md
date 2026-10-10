---
label: conditional distribution
kind: definition
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 716-728
understanding: unknown
---
X given Y=y 的 conditional distribution 由 P^{X|Y=y}(A)=lim_{h->0+}P(X in A | y<=Y<=y+h) 定义；其 conditional cdf 是该 measure 在 (-infinity,x] 上的取值。

## Evidence

> \begin{definition}{\kn{conditional distribution}}
>
> 给定 random variables \(\mathit{X},\mathit{Y}:\Omega\rightarrow\mathbb{R}\), 其中下面极限里的条件概率按 \knref{conditional probability} 理解. 我们定义 the conditional distribution of \(\mathit{X}\) given \(\mathit{Y} = \mathit{y}\) 为 the probability measure \(\mathbb{P}^{\mathit{X}|\mathit{Y} = \mathit{y}}\):
>
> \[\mathbb{P}^{\mathit{X}|\mathit{Y} = \mathit{y}}(\mathit{A}) := \lim\limits_{h\rightarrow 0^{+}}\mathbb{P}(\mathit{X} \in \mathit{A} \mid \mathit{y} \leq \mathit{Y} \leq \mathit{y} + h),\quad\forall\mathit{A} \in \mathcal{B}(\mathbb{R})\]
>
> 并将 function \(\mathit{F}_{\mathit{X}|\mathit{Y} = \mathit{y}}:\mathbb{R}\rightarrow\mathbb{R}\) defined by \(\mathit{F}_{\mathit{X}|\mathit{Y} = \mathit{y}}(\mathit{x}) := \mathbb{P}^{\mathit{X}|\mathit{Y} = \mathit{y}}(( - \infty,\mathit{x}\rbrack)\):
>
> \[\left. \mathit{F}_{\mathit{X}|\mathit{Y}}(\mathit{x} \middle| \mathit{y}) := \lim\limits_{h\rightarrow 0^{+}}\mathbb{P}(\mathit{X} \leq \mathit{x} \mid \mathit{y} \leq \mathit{Y} \leq \mathit{y} + h) \right.\]
>
> 称为 the conditional distribution function of \(\mathit{X}\) given \(\mathit{Y} = \mathit{y}\).
>
> \end{definition}
