---
label: Bayes theorem derived from conditional probability
kind: derived-from
derived:
  - "[[bayes-theorem]]"
origin:
  - "[[conditional-probability]]"
source: notes/math/prob/chapters/01-combinatorics&prob_space.tex
lines: 518-524
---
The source derives Bayes' formula from the two conditional-probability factorizations of P(A intersection B).

## Evidence

> \begin{theorem}{\kn{Bayes theorem}}
>
> If \(\mathit{A},\mathit{B} \subseteq \Omega\) such that \(\mathbb{P}(\mathit{B}) \neq 0\), then
>
> \[\mathbb{P}(\mathit{A} \mid \mathit{B}) = \frac{\mathbb{P}(\mathit{A}) \cdot \mathbb{P}(\mathit{B} \mid \mathit{A})}{\mathbb{P}(\mathit{B})}\]
>
> \end{theorem}
