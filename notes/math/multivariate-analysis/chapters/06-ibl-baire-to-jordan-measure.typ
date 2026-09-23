#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Complete manual Typst migration of IBL-source/ibl.tex, lines 14–336.
= IBL: Baire category through Jordan measure

== 1A：证明 metric space 是 topological space

// Source: ibl.tex lines 18–84.
#definition(title: [Open balls and the metric topology])[
  In a metric space $(X,d)$, $U subset.eq X$ is open when every $x in U$ has
  an $epsilon>0$ with $B_epsilon(x) subset.eq U$. A sequence converges in this
  topology exactly when it satisfies the metric epsilon definition.
]

The source’s 1A problem has five parts: prove that these open sets form a
topology; compare topological and metric convergence; prove open balls open;
prove closed balls closed; and give the discrete-metric counterexample above.

#solution(title: [1A：闭球不一定是开球的 closure])[
  考虑 discrete topology。此时 $B_r(x)$ 可以等于 ${x}$，而在距离发生跳跃的
  半径处，closed ball 可能更大，因此它不必等于 open ball 的 closure。
]

#theorem(title: [Baire category theorem])[
  If $(X,d)$ is complete and $(U_n)_(n=1)^infinity$ are open dense subsets of
  $X$, then $inter.big_(n=1)^infinity U_n$ is dense in $X$.
]

#solution(title: [1B：Baire Category Thm 在不 complete MS 中的反例])[
  考虑 $bQ$ 的 usual metric。令 ${q_n}$ 枚举所有既约分数；对于任意
  $n in bN$，取 $U_n=bQ\{q_n}$。每个 $U_n$ 都是 $bQ$ 中 dense and open set，
  但是 $inter.big_n U_n=emptyset$。
]

== 1C：证明 Baire Category Thm

原 worksheet 接着要求用 nested balls 证明：从任意 ball 出发，选择
$x_(i+1)$ 与 $0<r_(i+1)<r_i/2$，使得
$accent(B_(r_(i+1))(x_(i+1)), macron) subset.eq B_(r_i)(x_i) inter U_(i+1)$; prove
$(x_i)$ 是 Cauchy，并识别其 limit。1D 再要求推出：每点都是 limit point 的
nonempty complete metric space 必为 uncountable。

== Why not measure every subset?

// Source: ibl.tex lines 90–169.
#definition(title: [Middle-thirds Cantor set])[
  Begin with $C=[0,1]$ and remove the middle third at each stage.  The set
  $C=inter.big_(n=1)^infinity C_n$ is the middle-thirds Cantor set; $C_n$ is a
  union of $2^n$ closed intervals, each of length $3^(-n)$.
]

The migrated problems ask to show that $C$ is nonempty and compact, every
point is a limit point, $C$ is uncountable by Baire category, and $C$ contains
no interval. Its stage-$n$ total length is $(2/3)^n$, motivating a notion of
measure beyond intervals.

#remark(title: [来源中文批注])[
  Cantor set 是一个 compact 且 closed 的集合（甚至 perfect）；由于它在
  $bR^n$ 中，它还是 complete metric space。它 uncountable，却不包含任何
  open interval；来源同时标注其 Lebesgue measure 为 $0$。
]

#definition(title: [Vitali-type obstruction])[
  On $[0,1)$ define $x ~ y$ when $x-y in bQ$. Choose one representative from
  each equivalence class, forming $N$. For $r in bQ inter [0,1)$, let $N_r$
  be the translate of $N$ by $r$, taken modulo one.
]

#theorem(title: [No translation-invariant countably additive measure on every subset])[
  The sets $N_r$ are disjoint and their union is $[0,1)$. If a function on
  all subsets were countably additive, invariant under rigid motions, and
  normalized by $m([0,1))=1$, then all $N_r$ would have a common measure. It
  would be either zero or positive, forcing the union’s measure to be either
  zero or infinity — a contradiction.
]

#solution(title: [来源中的中文归谬说明])[
  我们想测量 $bR^n$ 子集的「长度」，希望它对可数个 disjoint sets closed
  under addition，对通过 translate、rotation 或 reflection 得到的 congruent
  sets 取相同 measure，并且精准满足 $m([0,1))=1$。但是把 $[0,1)$ 中相差
  rational 的点分成 congruent classes（所有 rational 都进入同一类；不同的
  irrational roots 与 transcendental numbers 会形成各自的 classes），并把
  $[0,1)$ 的 rationals 放入 $R$、在每一类取一点组成 $N$。任取 $r in R$，对
  $N$ 作 circular translate 得到 $N_r$；每个 $N_r$ 的 measure 相同，且它们的
  disjoint union 是 $[0,1)$。$m(N)=0$ 与 $m(N)!=0$ 都导致矛盾。
]

The source explicitly notes that merely replacing countable additivity by
finite additivity does not solve this problem: Banach–Tarski supplies a
finite-piece obstruction in three dimensions. The conclusion is to measure a
proper family of subsets rather than every subset of $bR^d$.

== Elementary and pixel measure

// Source: ibl.tex lines 170–239.
#definition(title: [Boxes, elementary sets, and elementary measure])[
  An interval is any of $[a,b]$, $[a,b)$, $(a,b]$, or $(a,b)$, with length
  $b-a$. A box is a Cartesian product of intervals; its volume is the product
  of their lengths. An elementary set is a finite union of boxes. After
  writing it as a finite disjoint union $union.big_i B_i$, define
  $m(E)=sum_i abs(B_i)$.
]

The source’s problem sequence establishes closure of elementary sets under
union, intersection, difference, symmetric difference, and translation; it
then asks for a disjoint-box decomposition and well-definedness of $m$. A
lattice-counting route is recorded: scale the number of lattice points in
$B inter (1/N)bZ^d$ by $N^(-d)$ and pass to the limit.

It then asks for finite additivity on disjoint elementary sets, monotonicity,
and finite subadditivity for arbitrary finite collections. The pixel-measure
exercise is deliberately retained as a counterexample prompt, since the source
does not supply a completed personal answer.

#theorem(title: [Elementary-measure properties])[
  For elementary sets, elementary measure is finitely additive on disjoint
  unions, monotone, and finitely subadditive.
]

#remark[
  The exploratory “pixel measure”
  The pixel measure is the limit of $N^(-d)$ times the number of lattice
  points in $E inter (1/N)bZ^d$. It is not translation invariant whenever both
  displayed limits exist; the source asks for an explicit example.
]

== Jordan measure and Riemann integrability

// Source: ibl.tex lines 240–336.
#definition(title: [#kn[Jordan measure] inner and outer measure])[
  For bounded $E subset.eq bR^d$,
  $attach(limits(m), b: macron)_J(E)=sup_(A subset.eq E, A upright(" elementary"))m(A)$ and
  $accent(m, macron)_J(E)=inf_(B supset.eq E, B upright(" elementary"))m(B)$.
  The set is Jordan measurable when these agree.
]

#theorem(title: [Jordan measurability criteria])[
  A bounded set is Jordan measurable exactly when it can be sandwiched between
  elementary sets $A subset.eq E subset.eq B$ with $m(B\A)$ arbitrarily
  small; equivalently, it can be approximated in Jordan outer measure by an
  elementary set.  Its boundary has Jordan outer measure zero exactly when it
  is Jordan measurable.
]

The retained problem set establishes that elementary sets are Jordan
measurable, then asks for closure under union, intersection, difference, and
symmetric difference, as well as finite additivity, monotonicity, finite
subadditivity, and translation invariance. It asks to prove that the graph of
a continuous function on a closed box has Jordan measure zero and that the
region below such a graph is Jordan measurable.

The next chapter asks to prove that open and closed balls are Jordan measurable
with measure $c_d r^d$, to bound $c_d$, and to compare a bounded set with its
closure and interior. It gives the boundary criterion above. Finally it defines
lower and upper Darboux integrals through a partition
$a=x_0<x_1<dots.h<x_n=b$ and asks to show that a bounded nonnegative $f$ is
Riemann integrable exactly when its subgraph is Jordan measurable.

// TODO（来源：ibl.tex lines 14–336）：上面的题目和非空 personal proof sketches
// 已迁入。TeX 来源没有低层手写展开；两处空白的 Baire proof steps 只有在写出新的
// personal derivation 时才补充，不能把新证明归因于来源。
