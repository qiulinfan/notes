---
kgd_schema: "kgdistiller-entry-v1"
kgd_id: "properties-of-measure"
kgd_label: "properties of measure"
kgd_entry_origin: "agent-extracted"
kgd_source: "knowledge/derived/by-source/notes/math/measure-theory/chapters/01-sigma-algebra-与-measure.typ.md"
kgd_source_sha256: "d2a4a6660aa520139b5bbc3df595938a3609a233b8ce852e222b85e16ab3ec93"
kgd_definition_sha256: "51cd1cf59bd02dc5cb59a11dbfbc7181a5e431ae58c425caec0e8cbff354f691"
---

# properties of measure

## Summary

对于任何 measure space $\(X\,cal(M)\,mu\)$: + monotonicity: $A subset.eq B in cal(M) arrow.r.double.long mu\(A\)lt.eq thin mu\(B\)$ [ trivial. ] + countable subadditivity: $ mu\(union.big_(i = 1)^oo A_i\)lt.eq sum_(i = 1)^oo mu\(A_i\) $ [ By setting $B_i = A_i\\ union.big_(j = 1)^(i - 1) A_j$, 而后通过 ctbl disjoint additivity 与 monotonicity 可得 ] + continuous from above: 如果 $A_i subset.eq A_(i + 1) forall i gt.eq 2 arrow.r.double.long$ $ mu\(union.big_(i = 1)^oo A_i\)= lim_(i arrow.r oo) mu\(A_i\) $ [ 使用 same trick as 2. ] + countinuous from below: 如果 $A_i supset.eq A_(i + 1) forall i$ 且存在某个 $j$ 使得 $mu\(A_i\)< oo$, 则 $ mu\(inter.big_(i = 1)^oo A_i\)= lim_(n arrow…

## Context

原生 theorem；authority: notes/math/measure-theory/chapters/01-sigma-algebra-与-measure.typ:221。
