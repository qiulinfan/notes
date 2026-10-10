---
label: RV 序列的三种收敛方式
kind: definition
source: notes/math/prob/chapters/04-LLN.tex
lines: 198-225
understanding: unknown
---
给出 a.s.、Lᵖ 与 probability 三种随机变量序列收敛的定义。

## Evidence

> \begin{definition}{\kn{RV 序列的三种收敛方式}}
>
> \begin{itemize}
> \item
>   \textbf{converge a.s. (almost surely)} 或称 converge with probability 1:
>
>   \[\mathbb{P}\left( {\lim\limits_{\mathit{n}\rightarrow\infty}\mathit{X}_{\mathit{n}} = \mathit{X}} \right) = 1\]
>
>   即:
>
>   \[\mathbb{P}\left( \left\{ {\mathit{\omega} \in \Omega:\lim\limits_{\mathit{n}\rightarrow\infty}\mathit{X}_{\mathit{n}}(\mathit{\omega}) = \mathit{X}(\mathit{\omega})} \right\} \right) = 1\]
>
>   也就是说 \(\mathit{X}_{\mathit{n}}\) 的 a.e. pointwise limit 是 \(\mathit{X}\).
> \item
>   \textbf{converge in \(\mathit{L}^{\mathit{p}}\)}: 对于 \(\mathit{L}^{\mathit{p}}\)-integrable 的 random variables sequence \(\mathit{X}_{\mathit{n}}\) 和 \(\mathit{X}\), 我们称 \(\mathit{X}_{\mathit{n}}\overset{\mathit{L}^{\mathit{p}}}{\rightarrow}\mathit{X}\), 如果
>
>   \[\lim\limits_{\mathit{n}\rightarrow\infty}\mathbb{E}\left\lbrack \left| {\mathit{X}_{\mathit{n}} - \mathit{X}} \right|^{\mathit{p}} \right\rbrack = 0\]
>
>   即: 这个 seq of RVs 与这个 limit function 之间的 \(\mathit{L}^{\mathit{p}}\) distance 收敛到 0; 也就是它们的偏差 as a random variable, 其 \(\mathit{p}\)-th moment 收敛到 0.
> \item
>   \textbf{converge in probability}: 对于任意的 \(\mathit{\varepsilon} > 0\), 如果
>
>   \[\left. \lim\limits_{\mathit{n}\rightarrow\infty}\mathbb{P}( \middle| \mathit{X}_{\mathit{n}} - \mathit{X} \middle| > \mathit{\varepsilon}) = 0 \right.\]
>
>   即 \(\mathit{X}_{\mathit{n}}\) 与 \(\mathit{X}\) 之间的偏差超过 \(\mathit{\varepsilon}\) 的概率收敛到 0.
> \end{itemize}
>
> \end{definition}
