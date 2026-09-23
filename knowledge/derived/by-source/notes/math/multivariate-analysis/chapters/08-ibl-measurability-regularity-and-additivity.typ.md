---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/multivariate-analysis/chapters/08-ibl-measurability-regularity-and-additivity.typ"
kgd_source_format: "typst"
kgd_source_sha256: "5c267e5bb41fbfc3f2090bdd0174d2e2f794999164ffada9679df2aeee293c8d"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Complete manual Typst migration of IBL-source/ibl.tex, lines 491–748.
= IBL: regularity, measurability, and additivity

#theorem(title: [$bR^n$ 中任意开集都是一个 ctbl union of almost disjoint boxes])[
  Every open subset of $bR^d$ is a countable union of almost-disjoint boxes;
  the source gives a dyadic construction selecting boxes not already chosen at
  earlier scales.
]

The source’s construction starts with unit grid boxes contained in an open
set, then repeats at dyadic scales after removing boxes selected earlier. It
asks to verify that their union is the original open set and that interiors do
not overlap.

来源的中文批注说，这与在 $bR$ 上用 ctbl closed intervals 逼近任意 open
interval 如出一辙；随后给出的 process 只是更 generalized 的算法。

#theorem(title: [Outer regularity])[
  For every $E subset.eq bR^d$,
  $m^*(E)=inf_(E subset.eq U, U upright(" open"))m^*(U)$.
]

#remark[
  The reverse inner approximation by open subsets is false in general; the
  source asks for a counterexample and foreshadows compact inner regularity.
]

== outer regularity 的 dual 并不正确

来源要求给出反例，说明不能用 contained open sets 的 outer measure supremum
来代替 outer regularity；正确的 inner regularity 要以 compact sets 逼近。

== Closure properties of measurable sets

#theorem(title: [Null sets are measurable])[
  Every set of outer measure zero is Lebesgue measurable.
]

#theorem(title: [Countable unions, complements, and intersections])[
  A countable union of Lebesgue measurable sets is measurable. Complements of
  measurable sets are measurable, and hence countable intersections are
  measurable.
]

来源的中文证明提示为：$bN^2$ 也是 ctbl 的。对每个 $E_n$ 都选取一个 open
cover，最后的 double union 仍是 countable open cover；取任意 $epsilon$，
再用 $epsilon/2^n$ bound 每个 $E_n$ 与其 cover 的差距即可。

#theorem(title: [Closed sets are measurable])[
  Every closed subset of $bR^d$ is Lebesgue measurable. The recorded approach
  reduces to compact pieces and uses the almost-disjoint-box decomposition of
  an open complement.
]

The recorded proof plan writes an unbounded closed set as a countable union of
closed bounded pieces, reduces to compact sets, and decomposes their open
complements into almost-disjoint closed cubes.

== Approximation and regularity

#definition(title: [#kn[Symmetric difference]])[
  $A triangle B=(A\B) union (B\A)$. The source notes
  $A triangle B subset.eq (A triangle C) union (C triangle B)$.
]

#remark(title: [来源中文批注])[
  sym diff 越加入更多 set 越大；这正是
  $A triangle B subset.eq (A triangle C) union (C triangle B)$ 的直观来源。
]

#theorem(title: [Approximation by open sets])[
  $E$ is measurable if and only if for every $epsilon>0$ there is an open
  $U$ with $m^*(E triangle U)<=epsilon$.
]

For the difficult direction, the IBL notes choose open $U_n$ with errors
$epsilon/2^(n+67)$, take their union, then cover the remaining null set by an
open set of small outer measure. This preserves the original proof strategy
without inventing its omitted final estimates.

来源的中文说明强调：和 9D 一样，当希望两个相近集合具有包含关系、但已知条件
又不能直接构造包含关系时，可以先用近似条件构造 measure 无限接近的序列，再经由
intersection 得到一个 measure $0$ set，最后通过交、并、补得到所需关系。它还
指出 ordinary set diff 的 measure 总小于等于 sym diff 的大小，以此估计
$m^*(U without E)$。

#theorem(title: [Inner regularity])[
  If $E$ is measurable, then $m^*(E)=sup_K m^*(K)$ as $K$ ranges over compact
  subsets of $E$. The source also records the equivalent approximation by
  closed sets in symmetric difference.
]

#theorem(title: [Countable additivity])[
  For pairwise disjoint Lebesgue measurable sets $(E_n)$,
  $m(union.big_(n=1)^infinity E_n)=sum_(n=1)^infinity m(E_n)$.
]

The explicit $epsilon/2^n$ exercise is retained: with $a_(n,m)=1/(n m)$, one
must not interchange an infimum and an infinite sum without a valid argument.

// TODO（来源：ibl.tex lines 491–748）：所有 theorem/problem statements 和既有
// proof ideas 已迁入。来源未完成的 “closed set” derivation 与 countable additivity
// proof 继续明确保持 open，不伪造完成的来源推导。
