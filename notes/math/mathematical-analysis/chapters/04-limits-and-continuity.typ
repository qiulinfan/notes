#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= Limits and continuity

== Limit points and limits of functions

// Source: lectures/L09-Limit-of-Functions-I.pdf p.1.

#definition(title: [Limit point, closure, isolated and discrete sets])[
  Let $A subset.eq bR$ and $c in bR$.  Then $c$ is a limit point of $A$ if
  for every $epsilon>0$ there exists $x in A$ with
  $0<abs(x-c)<epsilon$.  Equivalently, every open neighborhood of $c$
  meets $A without {c}$.

  Write $A'$ for the set of limit points and
  $upright("cl")(A)=A union A'$ for the closure.  A point of $A without A'$ is isolated; a
  set is discrete when $A=A without A'$.
]

中文批注说，在 topology 中也能给出这个定义，但“还是等价的”.
每个 limit point 都是某个 subsequence 的 limit；若
$A={a_n:n in bN}$，则其 limit points 来自 $(a_n)$ 的 subsequential
limits，但 reverse inclusion 不必成立。Examples：

- $bN$ has no limit point in $bR$;
- every real number is a limit point of $bQ$;
- $({0} union (1,2) union (2,3))'=[1,3]$.

源页写 $upright("cl")(A)$ 是 closed，并且是包含 $A$ 的 smallest closed set。

#definition(title: [Limit of a function])[
  Let $A subset.eq bR$, $f:A->bR$, and let $c$ be a limit point of $A$.
  We say $lim_(x->c)f(x)=l$ if for every $epsilon>0$ there is $delta>0$
  such that
  $abs(f(x)-l)<epsilon$ whenever $x in A$ and
  $0<abs(x-c)<delta$.
]

中文解释把它和 sequences 比较：$n->infinity$ 控制 index，而这里 $x->c$ 由
distance $delta$ 控制。此 definition 不要求 $c in A$，并且即使 $f(c)$ 有定义，
其 value 也不起作用。

#theorem(title: [Sequential criterion for a function limit])[
  $lim_(x->c)f(x)=l$ if and only if every sequence
  $(a_n)$ in $A without {c}$ with $a_n->c$ satisfies $f(a_n)->l$.
]

The source uses its contrapositive to show that if some
$(a_n)$ approaches $c$ but $f(a_n)$ does not approach $l$, then the limit
is not $l$; if one approaching sequence has divergent values, or two have
different image limits, the function limit does not exist.

// Source: lectures/L09-Limit-of-Functions-I.pdf p.2.

#definition(title: [Infinite and one-sided function limits])[
  $lim_(x->c)f(x)=+infinity$ means that for every $M>0$ there is
  $delta>0$ such that $f(x)>M$ whenever
  $x in upright("dom")(f)$ and $0<abs(x-c)<delta$.
  Definitions at $+infinity$ and $-infinity$ are analogous.

  If $c$ is a limit point of $upright("dom")(f) inter (c,+infinity)$, then
  $lim_(x->c^+)f(x)=l$ means the same estimate with $0<x-c<delta$.
  The left-hand limit is defined dually.
]

源页说有五种 function limits：$c,c^+,c^-,+infinity,-infinity$。其 examples
包括
$lim_(x->0)abs(x)/x$ does not exist and $lim_(x->0)1/x$ does not exist.

// Source: lectures/L09-Limit-of-Functions-I.pdf p.3.

#theorem(title: [Function-limit laws])[
  If $lim_(x->c)f(x)$ and $lim_(x->c)g(x)$ exist, then for $k in bR$:

  - $lim_(x->c) k f(x)=k lim_(x->c)f(x)$;
  - $lim_(x->c)(f(x)+g(x))=lim f+lim g$;
  - $lim_(x->c)f(x)g(x)=(lim f)(lim g)$; and
  - $lim_(x->c)f(x)/g(x)=(lim f)/(lim g)$ when $lim g(x)!=0$.
]

Function limits are unique.  If $f(x)<=g(x)$ in a deleted neighborhood of
$c$ and both limits exist, then $lim f<=lim g$.  The squeeze theorem says
that $f(x)<=g(x)<=h(x)$ there and $lim f=lim h=l$ imply $lim g=l$.
The examples are

$lim_(x->0) sin(x)/x=1$,

$lim_(x->0) x sin(1/x)=0$, and

$lim_(x->0) sin(1/x)$ does not exist.

The last page annotation explains that $x^2/(x-2)$, and every rational
function in particular, is continuous at every point of its domain.

== Alternative formulations and continuity

// Source: lectures/L10(1)-Limit-of-Functions-II.pdf p.1.

sequence test 再次强调：$a_n->c$ 不表示 every sequence of domain points 都
tends to $c$；test limit 要取 $upright("dom")(f) without {c}$ 中 approaching $c$ 的
sequences。源页也给出如下 open-neighborhood formulation。

#definition(title: [Function limit in terms of open sets])[
  Let $A subset.eq bR$, $f:A->bR$, and
  $c,l in bR union {+infinity,-infinity}$, with $c in A'$.
  Then $lim_(x->c)f(x)=l$ if every open
  neighborhood $V$ of $l$ contains $f[(A inter U) without {c}]$ for some open
  neighborhood $U$ of $c$.
]

The source convention is that if $A$ is bounded above/below, then
$+infinity/-infinity in A'$; open neighborhoods of $+infinity$ are
$(a,+infinity)$ and of $-infinity$ are $(-infinity,a)$.

#theorem(title: [One-sided and ordinary limits])[
  $lim_(x->c)f(x)=l$ if and only if both
  $lim_(x->c^-)f(x)=l$ and $lim_(x->c^+)f(x)=l$, provided $c$ is a limit
  point from both sides.
]

#theorem(title: [Equivalent zero formulations])[
  For a finite limit, the following are equivalent:
  $lim_(x->c)f(x)=l$,
  $lim_(x->c)(f(x)-l)=0$,
  $lim_(x->c)abs(f(x)-l)=0$, and
  $lim_(x->c)f(x)=l$ after replacing $f$ by $abs(f-l)$.
]

// Source: lectures/L10(1)-Limit-of-Functions-II.pdf p.2.

#definition(title: [Continuity])[
  Let $A subset.eq bR$, $f:A->bR$, and $a in A$.  Then $f$ is continuous at
  $a$ if, for every $epsilon>0$, there exists $delta>0$ such that
  $abs(f(x)-f(a))<epsilon$ whenever $x in upright("dom")(f)$ and $abs(x-a)<delta$.
]

手写 distinction 很重要：limit at $c$ 需要 $c in (upright("dom") f)'$，却不需要
$c in upright("dom") f$；continuity at $a$ 需要 $a in upright("dom") f$，却不需要
$a$ 是 limit point。
Accordingly, every function is continuous at an isolated point of its
domain.

#theorem(title: [Continuity criteria])[
  For $a in A$, the following are equivalent:

  - $f$ is continuous at $a$;
  - either $a$ is isolated in $A$, or $lim_(x->a)f(x)=f(a)$;
  - for every sequence $(a_n)$ in $A$ with $a_n->a$, one has
    $f(a_n)->f(a)$;
  - for every open neighborhood $V$ of $f(a)$, there is an open
    neighborhood $U$ of $a$ with $f[A inter U] subset.eq V$.
]

The source lists rational functions (especially polynomials), power
functions $x^p$ on $x>0$, exponential functions, logarithms, trig/inverse
trig functions, and $abs(x)$ as continuous on their natural domains.

// Source: lectures/L10(2)-Continuity-I.pdf p.1.

#definition(title: [Continuous on a set and topological continuity])[
  $f$ is continuous on $B subset.eq upright("dom")(f)$ when it is continuous at every
  $b in B$; it is a continuous function when this holds on all of $upright("dom")(f)$.
  More generally, $f:X->Y$ between metric/topological spaces is continuous
  if $f^(-1)[V]$ is open in $X$ for every open $V subset.eq Y$.
]

源页给出 $x^2$ 在 $2$ ctn 的 direct epsilon--delta proof，取
$delta=min(1,epsilon/5)$；在一般 $a$ 取 $delta=min(1,epsilon/(2abs(a)+1))$。
又用 $abs(abs(x)-abs(a))<=abs(x-a)$ 证明 $abs(x)$ everywhere ctn，旁注为：
“here $delta$ depend on $epsilon$ but not $a$”.

It also notes that

$g(x)=sin(1/x)$ for $x!=0$, while $g(0)=0$

is continuous everywhere except at $0$, whereas

$h(x)=x sin(1/x)$ for $x!=0$, while $h(0)=0$

is continuous everywhere by squeeze.
Dirichlet's function is discontinuous everywhere.  Thomae's function

$T(m/n)=1/n$ for a rational $m/n$ in lowest terms, and $T(x)=0$ for
$x in bR without bQ$

is continuous at every irrational and is a source of the questions
“是否存在 $f:bR->bR$ 使 $f$ ctn at $x$ iff $x in bQ$?” and
“is $T$ diffable anywhere?”.

// Source: lectures/L10(2)-Continuity-I.pdf p.2.

#definition(title: [Discontinuities])[
  $f$ is discontinuous at $a in upright("dom")(f)$ if it is not continuous there.
  If both one-sided limits exist but differ, $f$ has a jump discontinuity;
  if $lim_(x->a)f(x)$ exists but differs from $f(a)$, it has a removable
  discontinuity; if a one-sided limit fails to exist by oscillation, it has
  an essential discontinuity; and if a one-sided limit is infinite, it has
  an infinite discontinuity.
]

The examples are $abs(x)/x$ for a jump, the function $1$ off $0$ and $0$ at
$0$ for a removable discontinuity, $sin(1/x)$ for essential/oscillating
discontinuity, and $1/x$ (with a chosen value at $0$) for infinite
discontinuity.

== Closure properties and uniform continuity

// Source: lectures/L11(1)-Continuity-II.pdf p.1.

#theorem(title: [Closure properties of continuous functions])[
  If $f,g$ are continuous at $a$, then $f+g$, $f-g$, $f g$, $f/g$ where
  defined, and $c f$ for $c in bR$ are continuous at $a$.
]

The domains recorded on the page are $A inter B$ for $f+g$, $f-g$, and
$f g$, and $ {x in A inter B:g(x)!=0}$ for $f/g$.

#theorem(title: [Composition])[
  If $f:A->bR$ is continuous at $a$ and $g:B->bR$ is continuous at
  $f(a) in B$, then $g compose f$ is continuous at $a$ and
  $lim_(x->a)g(f(x))=g(lim_(x->a)f(x))$.
]

源页明确说此 theorem 也有 variants，把 limit at $a$ 全部替换为 limit at
$a^+$、$a^-$、$+infinity$ 或 $-infinity$。Examples 是
$lim_(x->0^+) arctan(1/x)=pi/2$ and
$lim_(theta->pi/2^-) e^(-tan theta)=0$.

// Source: lectures/L11(1)-Continuity-II.pdf p.2.

Further source examples retain their proof choices:

- $x^2$ at $2$: $abs(x^2-4)=abs(x-2)abs(x+2)$, choose
  $delta=min(1,epsilon/5)$;
- $abs(x)$: choose $delta=epsilon$;
- $x^2$ at any $a$: choose $delta=min(1,epsilon/(2abs(a)+1))$;
- $x^2$ has a “longest $delta$” at $a=2$ of $sqrt(4+epsilon)-2$;
- $x^2$ is uniformly continuous on $[-c,c]$ with
  $delta=epsilon/(2c)$;
- $x sin(1/x)$ with value $0$ at $0$ is continuous everywhere;
- $D$ is discontinuous everywhere; and
- $f(x)=x$ for $x in bQ$, $f(x)=0$ for $x in bR without bQ$ is continuous at $0$
  but discontinuous everywhere else.

// Source: lectures/L11(2)-Uniform-Continuity.pdf p.1.

#definition(title: [#kn[Uniform continuity]])[
  Let $B subset.eq A subset.eq bR$ and $f:A->bR$.  Then $f$ is uniformly
  continuous on $B$ if, for every $epsilon>0$, there is $delta>0$ such that
  for all $x,y in B$,
  $abs(x-y)<delta$ implies $abs(f(x)-f(y))<epsilon$.
]

The source's quantifier comparison is retained:
ordinary continuity has “for every point $a$” before the choice of
$delta$; uniform continuity chooses one $delta$ for all points.
中文解释为：对任意 $epsilon$，总有一个距离 $delta$ 使得在 $B$ 上距离足够近
的点，其 image 的距离也足够近；“uniformly ctn 的要求比 ctn 更严格”.

#theorem(title: [Basic uniform-continuity facts])[
  Uniform continuity on $B$ implies continuity on $B$.  A restriction of a
  uniformly continuous function is uniformly continuous.
]

The examples are $x mapsto c x$ (choose $delta=epsilon/abs(c)$),
$x^2$ not uniformly continuous on $bR$ (take $epsilon=1$ and a large
$a=2/delta$), and $x^2$ uniformly continuous on $[-c,c]$.
The source observes that $1/x$ is uniformly continuous on $[1,infinity)$
but not on $(0,1]$ nor on $[a,infinity)$ for $a>0$.

// Source: lectures/L11(2)-Uniform-Continuity.pdf p.2.

#theorem(title: [Heine--Cantor])[
  If $A subset.eq bR$ is closed and bounded (compact) and
  $f:A->bR$ is continuous, then $f$ is uniformly continuous on $A$.
]

proof 假设 not uniformly continuous，固定 $epsilon>0$，构造 $x_n,y_n in A$
使 $abs(x_n-y_n)<1/n$ 但 $abs(f(x_n)-f(y_n))>=epsilon$。Bolzano--Weierstrass
给出 convergent subsequences $x_(n_k)->l_1$、$y_(n_k)->l_2$；distance condition
给出 $l_1=l_2$。closedness 保证 $l_1 in A$，continuity 使两条 image
subsequences 都趋于 $f(l_1)$，矛盾。

The Chinese discussion explains why both hypotheses matter:
$x^2$ on $bR$ is continuous and its domain closed but unbounded, so not
uniformly continuous; $sin(1/x)$ on $[-5,0) union (0,4]$ is continuous on a
bounded but nonclosed set and is not uniformly continuous.  Positive
examples are $sqrt(x)$ on $[0,1]$, $sin(1/x)$ on $[a,b]$ for $0<a<b$, and
$x sin(1/x)$ with value $0$ at zero on $[0,1]$.

// Source: lectures/L11(2)-Uniform-Continuity.pdf p.3.

#theorem(title: [Uniform continuity preserves Cauchy sequences])[
  If $f:A->bR$ is uniformly continuous and $(a_n)$ is Cauchy in $A$, then
  $(f(a_n))$ is Cauchy.
]

The page's counterexample is $f(x)=1/x$ on $x>0$:
$(1/n)$ is Cauchy but $(n)$ is not, so $f$ is not uniformly continuous on
any set containing $ {1/n:n in bN}$.

#theorem(title: [Extension criterion])[
  Let $A subset.eq bR$ be bounded and $f:A->bR$.  Then $f$ is uniformly
  continuous if and only if there is a continuous
  $g:upright("cl")(A)->bR$ whose restriction to $A$ equals $f$.
]

For the forward direction, if $a in upright("cl")(A) without A$ and $a_n in A$ tends to $a$,
define $g(a)=lim f(a_n)$; uniform continuity makes $(f(a_n))$ Cauchy and
the definition independent of the approximating sequence.

== Extreme and intermediate values

// Source: lectures/L12-EVT&IVT.pdf p.1.

#theorem(title: [Extreme Value Theorem])[
  If nonempty $A subset.eq bR$ is closed and bounded and $f:A->bR$ is
  continuous, then $f$ is bounded and there are $x_0,y_0 in A$ such that
  $f(x_0)<=f(x)<=f(y_0)$ for every $x in A$.
]

The proof sets $M=sup {f(x):x in A}$.  Choose $(x_n)$ in $A$ with
$f(x_n)->M$, take a convergent subsequence, use closedness to retain its
limit $y_0 in A$, and use continuity to obtain $M=f(y_0)$.
The notes summarize: “closed + bounded $A$ + ctn $f$，那么 extreme value
一定存在”.

#theorem(title: [Intermediate Value Theorem])[
  If $f:[a,b]->bR$ is continuous and $l$ lies between $f(a)$ and $f(b)$,
  then some $c in [a,b]$ satisfies $f(c)=l$.
]

Assume $f(a)<l<f(b)$ and set
$S={x in [a,b]:f(x)<=l}$.  Then $S$ is nonempty and bounded above; for
$c=sup S$, continuity and sequences approaching $c$ from both sides give
$f(c)=l$.  The source's Chinese explanation is that a continuous curve on
an interval must “覆盖了 $[f(a),f(b)]$ 中的所有值”.

The application is the fixed-point theorem: if
$f:[0,1]->[0,1]$ is continuous, then some $x_0 in[0,1]$ has $f(x_0)=x_0$.
When the endpoint signs do not immediately give this, take $g(x)=x-f(x)$
and apply IVT.

// Source: lectures/L12-EVT&IVT.pdf p.2.

#theorem(title: [Continuous image of an interval])[
  If $I subset.eq bR$ is an interval and $f:I->bR$ is continuous, then
  $f[I]$ is an interval.
]

For $y_1<y_2 in f[I]$, choose preimages $x_1,x_2 in I$ and apply IVT on
the subinterval between them.  If $I$ is a closed bounded interval, EVT
gives $f[I]=[m,M]$, so the image is again a closed bounded interval.

== Page-complete proof and diagram ledger

=== L09--Limit-of-Functions-I, pp. 1--3

The visible lecture framing is "Ch4 limit of functions", $A subset.eq bR$,
$f:A->bR$, with three equivalent styles: epsilon/delta, sequences, and open
sets. A limit point is exactly
$forall epsilon>0, exists x in A:0<|x-c|<epsilon$, equivalently every open
neighborhood meets $A without {c}$. The sheet writes that a sequence's limit points
are subsequential limits but the reverse can fail (constant-sequence
example); it gives $bN$ no limit point, all reals as limit points of $bQ$,
and $({0} union (1,2) union (2,3))'=[1,3]$. It defines
$upright("cl")(A)=A union A'$, isolated $a in A without A'$, and discrete $A=A without A'$.

The three graph examples $x+2$, $(x^2-4)/(x-2)$, and the latter assigned
zero at $2$ have the same limit $4$ at $2$. The sequential proof forward
combines $|a_n-c|<delta$ with the epsilon condition; backwards selects
$a_n in A$ with $0<|a_n-c|<1/n$ and $|f(a_n)-l|>=epsilon$. It explicitly
records the diagnostics: one approaching sequence with images not tending to
$l$ disproves $l$; divergent images prove DNE; two image limits that differ
prove DNE.

The one-sided definition restricts $0<x-c<delta$, requiring $c$ a limit
point from that side. The displayed examples are $|x|/x$ and $1/x$ DNE at
zero. The sheet says there are five kinds of limits:
$c,c^+,c^-,+infinity,-infinity$. The limit laws include scalar, sum,
product, quotient, order and squeeze. Its calculations are
$cos x<=sin x/x<=1$ near $0$,
$-|x|<=x sin(1/x)<=|x|$, and
$a_n=2/(n pi)->0$ while $sin(1/a_n)$ diverges.

=== L10(1)--Limit-of-Functions-II, pp. 1--2

The sequence review graph distinguishes a sequence approaching $1$ with
image limits $2$ and $0$ (so no limit) from a curve with a separately
assigned isolated value at $1$ (nearby limit $2$). The open-neighborhood
definition is

$lim_(x->c)f(x)=l => forall upright(" open nbh") V upright(" of ")l,
exists upright(" open nbh")U upright(" of ")c:
f[(A inter U) without {c}] subset.eq V.$

The convention gives $+infinity,-infinity in A'$ for bounded-above/below
sets and neighborhoods $(a,+infinity)$, $(-infinity,a)$. The ordinary limit
is equivalent to both matching one-sided limits; the proof takes
$delta=min(delta_1,delta_2)$. The finite zero forms are
$lim f=l$, $lim(f-l)=0$, and $lim|f-l|=0$.

=== L10(2)--Continuity-I, pp. 1--2

The source contrasts a limit at $c$ (requires $c in (upright("dom") f)'$, not $c in
upright("dom") f$) with continuity at $a$ (requires $a in upright("dom") f$, not a limit point).
Thus every isolated domain point is continuous. Its four criteria are:
continuity; isolated or limit $f(a)$; sequence criterion; and the open
neighborhood inverse-image inclusion.

Visible epsilon proofs are
$|x^2-4|<=5|x-2|$ with $delta=min(1,epsilon/5)$;
$|x^2-a^2|<=|x-a|(2|a|+1)$ with
$delta=min(1,epsilon/(2|a|+1))$; and
$||x|-|a||<=|x-a|$ with $delta=epsilon$. It asks for the longest delta at
$2$, recording $sqrt(4+epsilon)-2$. The diagrams classify jump $|x|/x$,
removable $1$ off zero and $0$ at zero, essential $sin(1/x)$, and infinite
$1/x$ with a zero value. It proves $x sin(1/x)$ continuous at zero by
$-|x|<=x sin(1/x)<=|x|$, says Dirichlet is discontinuous everywhere, and
states the continuity properties of the rational/irrational indicator and
Thomae's function exactly as in the source.

=== L11(1)--Continuity-II, pp. 1--2

The closure-property domain ledger is:
$upright("dom")(f+g)=upright("dom")(f-g)=upright("dom")(f g)=A inter B$,
$upright("dom")(f/g)={x in A inter B:g(x)!=0}$. The proof uses sequence continuity.
For composition, $f:A->bR$, $g:B->bR$, $f(a) in B$ gives
$lim_(x->a)g(f(x))=g(lim_(x->a)f(x))$; the source's variants replace $a$
throughout by $a^+,a^-,+infinity,-infinity$. Examples are
$lim_(x->0^+)arctan(1/x)=pi/2$ and
$lim_(theta->pi/2^-)e^(-tan theta)=0$. The topology proof uses
$(g compose f)^(-1)[V]=f^(-1)[g^(-1)[V]]$.

=== L11(2)--Uniform-Continuity, pp. 1--3

The quantifier contrast is
$forall a,forall epsilon,exists delta$ for ordinary continuity versus
$forall epsilon,exists delta,forall x,y$ for uniform continuity; the page
states the latter delta does not depend on the position of $x,y$. Uniform
continuity implies continuity and restrictions remain uniform. Examples:
$c x$ uses $delta=epsilon/|c|$; $x^2$ on $bR$ fails by taking epsilon $1$,
$a=1/delta$, and comparing $a,a+delta/2$; $x^2$ on $[-c,c]$ uses
$delta=epsilon/(2c)$; $1/x$ is uniform on $[1,infinity)$ but not on
$(0,1]$ or $[a,infinity)$ for $a>0$.

Heine--Cantor's contradiction creates
$|x_n-y_n|<1/n$, $|f(x_n)-f(y_n)|>=epsilon$, takes convergent subsequences,
uses equal limits from the distance condition, closedness to retain the
limit in $A$, and continuity for the contradiction. It lists the source
counterexamples $x^2$ on $bR$ and $sin(1/x)$ on
$[-5,0) union (0,4]$, plus positive examples $sqrt(x)$, $sin(1/x)$ away
from zero, and $x sin(1/x)$ on $[0,1]$.

The Cauchy theorem follows by applying uniform delta to the Cauchy tail.
For $1/x$, $(1/n)$ is Cauchy but $(n)$ is not, so no uniform continuity on
a set containing $ {1/n:n in bN}$. The extension theorem for bounded $A$
defines, for $a in upright("cl")(A) without A$, $g(a)=lim f(a_n)$ for any $a_n in A$ tending
to $a$; uniform continuity makes this well-defined. The reverse direction
uses compact $upright("cl")(A)$ and Heine--Cantor.

=== L12--EVT&IVT, pp. 1--2

EVT proves a maximum by $M=sup{f(x):x in A}$, a sequence
$f(x_n)->M$, BW $x_(n_k)->y_0$, closedness $y_0 in A$, and continuity
$M=f(y_0)$; the minimum is dual. IVT takes
$S={x in[a,b]:f(x)<=l}$, $c=sup S$, $s_n in S$ tending to $c$, and
$t_n=min(c+1/n,b)$, then continuity yields $f(c)=l$. The fixed point proof
uses $g(x)=x-f(x)$. For continuous $f:I->bR$, $f[I]$ is an interval by
applying IVT between preimages; for $[a,b]$, EVT plus IVT gives
$upright("ran")(f)=[m,M]$.
