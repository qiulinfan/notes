---
label: jointly continuous RVs 之间所有 defined 处总有 conditional density
kind: theorem
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 755-765
understanding: unknown
---
若 (X,Y)^T 是 continuous random vector，则在 f_Y(y)>0 的每个 y 上，X given Y=y 有 conditional density f_{X|Y}(x|y)=f_{X,Y}(x,y)/f_Y(y)。

## Evidence

> \begin{theorem}{\kn{jointly continuous RVs 之间所有 defined 处总有 conditional density}}\label{thm-03-joint-conditional-distribution-jointly-continuous-rvs-defined-conditional-density}
>
> 令 \(\mathbf{X} = (\mathit{X},\mathit{Y})^{\mathit{T}}\) 是一个 continuous random vector, 则对于任意 \(\mathit{y}\) 使得 \(\mathit{f}_{\mathit{Y}}(\mathit{y}) > 0\), 都有 conditional distribution of \(\mathit{X}\) given \(\mathit{Y} = \mathit{y}\) 的 pdf:
>
> \[\left. \mathit{f}_{\mathit{X}|\mathit{Y}}(\mathit{x} \middle| \mathit{y}) := \frac{\mathit{f}_{\mathit{X},\mathit{Y}}(\mathit{x},\mathit{y})}{\mathit{f}_{\mathit{Y}}(\mathit{y})} \right.\]
>
> 即: \(\forall\mathit{x} \in \mathbb{R}\) 有:
>
> \[\left. \mathit{F}_{\mathit{X}|\mathit{Y}}(\mathit{x} \middle| \mathit{y}) = \int_{- \infty}^{\mathit{x}}\frac{\mathit{f}_{\mathit{X},\mathit{Y}}(\mathit{t},\mathit{y})}{\mathit{f}_{\mathit{Y}}(\mathit{y})}\,\mathit{d}\mathit{t} \right.\]
>
> \end{theorem}
