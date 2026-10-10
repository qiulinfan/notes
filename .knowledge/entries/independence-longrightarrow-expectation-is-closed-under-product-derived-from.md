---
label: "independence Longrightarrow expectation is closed under product derived from Fubini's Theorem"
kind: derived-from
derived:
  - "[[independence-implies-expectation-is-closed-under-product]]"
origin:
  - "[[fubini-theorem]]"
source: notes/math/prob/chapters/03-joint&conditional-distribution.tex
lines: 575-585
---
The proof explicitly applies Fubini's theorem to separate the product integral.

## Evidence

> \begin{theorem}{\kn{independence $\Longrightarrow$ expectation is closed under product}}
>
> 令 \(\left\{ {\mathit{X}_{\mathit{i}}:\mathit{i} \in \mathit{I}} \right\}\) 是一个 independent 的 random variables 的 family, 则对于任意的 finite subset \(\mathit{J} \subseteq \mathit{I}\), 以及对于任意的 Borel measurable functions \(\left\{ {\mathit{g}_{\mathit{j}}:\mathit{j} \in \mathit{J}} \right\}\), 如果 \(\left. \mathbb{E}\lbrack \middle| \mathit{g}_{\mathit{j}}(\mathit{X}_{\mathit{j}}) \middle| \rbrack < \infty \right.\) for all \(\mathit{j} \in \mathit{J}\), 则
>
> \[\mathbb{E}\left\lbrack {\prod\limits_{\mathit{j} \in \mathit{J}}\mathit{g}_{\mathit{j}}(\mathit{X}_{\mathit{j}})} \right\rbrack = \prod\limits_{\mathit{j} \in \mathit{J}}\mathbb{E}\lbrack\mathit{g}_{\mathit{j}}(\mathit{X}_{\mathit{j}})\rbrack\]
>
> 特别地, 取每个 \(\mathit{g}_{\mathit{j}}(\mathit{x}) = \mathit{x}\), 则
>
> \[\mathbb{E}\left\lbrack {\prod\limits_{\mathit{j} \in \mathit{J}}\mathit{X}_{\mathit{j}}} \right\rbrack = \prod\limits_{\mathit{j} \in \mathit{J}}\mathbb{E}\lbrack\mathit{X}_{\mathit{j}}\rbrack\]
>
> \end{theorem}
