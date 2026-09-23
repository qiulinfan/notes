#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Complete manual Typst migration of IBL-source/ibl.tex, lines 749–820.
= IBL: limits and Carathéodory's criterion

#theorem(title: [Jordan measurable implies Lebesgue measurable])[
  Every Jordan measurable subset of $bR^n$ is Lebesgue measurable. The source
  points to the zero-boundary characterization as the route to the proof.
]

#theorem(title: [Continuity from below])[
  For measurable $E_1 subset.eq E_2 subset.eq dots.h$,
  $m(union.big_(k=1)^infinity E_k)=lim_(k->infinity)m(E_k)$.
]

The source suggests taking the disjoint increments
$F_k=E_k union.big_(i=1)^(k-1)E_i$ and applying countable additivity.

#theorem(title: [Continuity from above])[
  For measurable $E_1 supset.eq E_2 supset.eq dots.h$, if some $E_k$ has finite
  measure, then $m(inter.big_(k=1)^infinity E_k)=lim_(k->infinity)m(E_k)$.
]

#remark[
  The finite-measure assumption in continuity from above is necessary; the
  source asks for a counterexample when it is dropped.
]

#theorem(title: [Finite-measure approximation by elementary sets])[
  A finite-measure set $E subset.eq bR^n$ is measurable exactly when it differs
  from an elementary set by a set of arbitrarily small outer measure.
]

#theorem(title: [#kn[Caratheodory's criterion] — elementary test sets])[
  A set $E subset.eq bR^n$ is measurable if and only if for every elementary
  set $A$,
  $m(A)=m^*(A inter E)+m^*(A\E)$.
]

The source remarks that some texts use this elementary-test identity as the
definition of measurability. Its final linear-map problem asks for the precise
Jacobian factor $abs(det T)$, including singular linear maps.

#theorem(title: [Linear change of measure])[
  If $E subset.eq bR^n$ is measurable and $T:bR^n -> bR^n$ is linear, then
  $T(E)$ is measurable and $m(T(E))=abs(det T)m(E)$.
]

// TODO(source: ibl.tex lines 749–820): complete only new, independently
// written proofs for the stated exercises; the original TeX provides prompts
// and short hints but does not supply full personal derivations for several.
