---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/multivariate-analysis/chapters/07-ibl-lebesgue-outer-measure.typ"
kgd_source_format: "typst"
kgd_source_sha256: "272445032df15f024362ee87394cf4c7cd39a66648b49af63ae4c64c75f7304c"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Complete manual Typst migration of IBL-source/ibl.tex, lines 337–490.
= IBL: Lebesgue outer measure

#definition(title: [#kn[Lebesgue outer measure]])[
  For $E subset.eq bR^d$,
  $m^*(E)=inf_(E subset.eq union.big_(j=1)^infinity B_j) sum_(j=1)^infinity abs(B_j)$,
  where the cover is by boxes. This replaces the finite covers in Jordan outer
  measure by countable covers.
]

#theorem(title: [Basic outer-measure facts])[
  $m^*(emptyset)=0$; if $E subset.eq F$, then $m^*(E)<=m^*(F)$; and
  $m^*(union.big_n E_n)<=sum_(n=1)^infinity m^*(E_n)$.
]

对 monotonicity，来源的中文批注是「trivial. 每个 $F$ 的覆盖也覆盖了 $E$」；
这正是 $E subset.eq F$ 时外测度不增的覆盖论证。

来源对 countable subadditivity 的中文证明思路是：为序列中每个集合创造一个
可数覆盖，得到一个 double union；再用 $epsilon/2^n$ 控制每个集合的覆盖和
与它的 Lebesgue outer measure 的差距，从而把双累加变成单累加。

The IBL problems record that a Jordan-measurable set can be outer-approximated
by an elementary set; $m^*(E)<=accent(m, macron)_J(E)$; the defining covers may be
restricted to open or closed boxes; and every countable set has outer measure
zero. The proof sketch preserves the source’s $epsilon/2^n$ allocation for
the countable cover.

#remark(title: [来源中文批注])[
  Jordan measurable 的意义是可以 outer-approximate by elementary set。关于
  closed/open boxes 的定义限制，来源指出 boundary 的 Jordan measure 为 $0$，
  可以在每个 open box 内用误差小于 $epsilon/2^n$ 的 closed boxes 覆盖；dually
  亦然。对于 countable set，只需对每个点给出体积小于对应
  $epsilon/2^n$ 的 box 覆盖，因此其 Lebesgue outer measure 总是 $0$；这也
  说明 Lebesgue measure 比 Jordan measure 更好。
]

#definition(title: [Lebesgue measurability — course definition])[
  A set $E subset.eq bR^d$ is Lebesgue measurable if for each $epsilon>0$
  there is an open $U supset.eq E$ with $m^*(U\E)<=epsilon$. Its Lebesgue
  measure is $m(E)=m^*(E)$.
]

#theorem(title: [elementary set 的 Lebesgue measure 就是 elementary measure])[
  If $E$ is elementary, then $m^*(E)=m(E)$, where the right side is elementary
  measure.
]

来源中的证明记录为：$m^*(E) <= m(E)$ 显然；反向不等式则对任意 ctbl
covering 取一个 disjoint cover。后一步的具体推导在来源中未完成，故这里不补造。

#theorem(title: [dist>0 的集合外测度 union additive；ctbl 个 almost disjoint boxes])[
  If $upright("dist")(E,F)>0$, then $m^*(E union F)=m^*(E)+m^*(F)$. If $E$ is a countable
  union of almost-disjoint boxes $B_k$, then $m^*(E)=sum_k abs(B_k)$.
]

关于从 finite 到 countable 的过渡，来源的中文提示为：「extend finite to
countable by continuing the seq using empty sets 即可得到。」

== Lebesgue measure 的大小处于 Jordan outer/inner measure 之间

来源把这一节保留为由 elementary measure 与 outer measure 比较得出的结论，
并单独要求构造 non-Jordan-measurable 的 bounded open set，以及证明 ctbl 个
almost disjoint boxes 的 outer-measure union additivity。

#example(title: [example：non J-measurable 的 open set])[
  Enumerate the rationals in $[0,1]$ and cover the $n$th rational by an open
  interval whose lengths form a summable sequence. The union can have
  arbitrarily small outer measure but dense complement structure that prevents
  Jordan measurability, exactly as posed in the source.
]

来源的 personal solution 只写到「我们首先 list 出 $[0,1]$ 之间的 ratioals，
称为 $(q_n)$。我们对于每个……」便中断；这里保留其不完整状态，而不把后续构造
误标为来源解答。

// TODO（来源：ibl.tex lines 337–490）：formal statements 和每个列出的 problem
// 均已迁入。来源中 almost-disjoint-box result 的未完成证明仍仅保留为 exercise，
// 不把它静默补成来源已有的证明。
