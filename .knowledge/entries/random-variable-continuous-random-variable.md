---
label: 一个 random variable 是 continuous random variable 的充要条件
kind: theorem
source: notes/math/prob/chapters/02-random-variables.tex
lines: 413-435
understanding: unknown
---
X 连续当且仅当其 CDF 绝对连续，因而可由密度积分表示。

## Evidence

> \begin{theorem}{\kn{一个 random variable 是 continuous random variable 的充要条件}}
>
> \begin{itemize}
> \item
>   一个 random variable \(\mathit{X}:\Omega\rightarrow\mathbb{R}\) 的 cdf 一定是 \(\mathit{m}\)-a.e. differentiable 的.
> \item
>   \(\mathit{X}\) 是一个 continuous random variable 当且 仅当 \(\mathbb{P}^{\mathit{X}} \ll \mathit{m}\), 即当且仅当存在一个函数 \(\mathit{f}_{\mathit{X}}:\mathbb{R}\rightarrow\lbrack 0,\infty)\), 使得 使得对于任意 Borel set \(\mathit{A} \subseteq \mathbb{R}\), 有
>
>   \[\mathbb{P}^{\mathit{X}}(\mathit{A}) = \int_{\mathit{A}}\mathit{f}_{\mathit{X}}\mathit{d}\mathit{m}\]
>
>   这个函数 \(\mathit{f}_{\mathit{X}}\) 即是:
>
>   \begin{itemize}
>   \item
>     \textbf{distribution 对于 Lebesgue measure 的 Radon-Nikodym derivative}: \(\mathit{f}_{\mathit{X}} = \frac{\mathit{d}\mathbb{P}^{\mathit{X}}}{\mathit{d}\mathit{m}}\).
>   \item
>     \textbf{cdf \(\mathit{F}_{\mathit{X}}\) 的 \(\mathit{m}\)-a.e.导数 \(\mathit{f}_{\mathit{X}} = \mathit{F}_{\mathit{X}}'\).}
>   \end{itemize}
>
>   我们也称这个 \(\mathit{f}_{\mathit{X}}\) 是 continuous random variable \(\mathit{X}\) 的 \textbf{probability density function (pdf).}
> \end{itemize}
>
> \end{theorem}
