---
label: jointly continuous RVs 之间所有 defined 处总有 conditional density derived from joint pdf 和 joint cdf 的性质
kind: derived-from
derived:
  - "[[jointly-continuous-rvs-defined-conditional-density]]"
origin:
  - "[[joint-pdf-joint-cdf]]"
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 755-765
---
The proof differentiates the joint cdf and uses the joint and marginal densities to obtain f_{X|Y}=f_{X,Y}/f_Y.

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
