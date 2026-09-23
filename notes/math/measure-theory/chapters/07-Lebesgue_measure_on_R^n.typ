#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= Lebesgue measure on $bb(R)^n$
<lebesgue-measure-on-mathbbrn>
== Lebesgue measure in $bb(R)^n$ \[Fol 2.6\]
<lebesgue-measure-in-mathbbrn-fol-2.6>
今日: Lebesgue measure in $bb(R)^n$ 的

- regularity

- behavior under affine transformation

- behavior under diffeomorphism

=== Lebesgue measure in $bb(R)^n$
<lebesgue-measure-in-mathbbrn>
这是 product measure 最常见的应用和例子.

#definition(
)[
$\(bb(R)^n\,cal(L)^n\,m\)$ Lebesgue measure is #strong[completion of] $\(bb(R)^n\,cal(B)_(bb(R)^n)\,m\|_(b o r e l)\)$.

]
where $cal(B)_(bb(R)^n) = cal(B)_(bb(R)) times.o dots.h.c times.o cal(B)_(bb(R))$
$cal(L^n) = { upright("Leb meas sets") } supset cal(B)_(bb(R)^n)$
Write: $ integral f #h(0em) d m^n quad $

#theorem(
  title: [#kn[Fubini-Tonelli for $m^n$]],
)[
Suppose $f in L^(+)\(bb(R)^n\)$ or $L^1\(bb(R)^n\)$
$ integral f #h(0em) d m^n & = integral dots.h.c integral f\(x_1\,dots.h.c\,x_n\)#h(0em) d x_1 dots.h.c d x_n\
 & = integral dots.h.c integral f\(x_1\,dots.h.c\,x_n\)#h(0em) d x_n dots.h.c d x_1 $

]
#example(
)[
Show: $ integral_0^oo e^(- s x) frac(sin^2\(x\), x) #h(0em) d x = 1 / 4 log\(1 + 4 s^(- 2)\) $
for $s > 0$, by integrating $e^(- s x) sin 2 x y = f\(x\,y\)$ over the rectangle $x in\(0\,oo\)\,y in\(0\,1\)$. \ Sketch: $f in L^1$ (since it is ctn on $bb(R)$)
以及 $ \|f\|lt.eq e^(- s x)\,quad integral_(bb(R)) e^(- s x) < oo $
可计算得 $ integral_0^1 sin 2 x y #h(0em) d y = frac(1, 2 x) sin^2 x $
而后 compute $ integral_0^1 e^(- s x) sin 2 x y #h(0em) d y $ by integration by part for twice.

]
=== regularities of Lebesgue measure in $bb(R)^n$
<regularities-of-lebesgue-measure-in-mathbbrn>
#theorem(
  title: [#kn[regularities of $cal(L)^n$]],
)[
If $E subset cal(L)^n$, 则有:

- #strong[outer regularity]: $ m\(E\)= inf { m\(U\)divides U upright(" open") supset E } $

- #strong[inner regularity]: $ m\(E\)= sup { m\(K\)divides K upright(" compact") subset E } $

- if $m\(E\)< oo$, 则对于任意 $epsilon.alt > 0$, 都存在 disjoint rectangles $R_1\,dots.h.c R_N$ with sides that are open intervals (literally rectangles) s.t. $ m\(E Delta union.big_j R_j\)< epsilon.alt $

]
#proof[
#strong[for (a,b) i.e. regularities:] \ Fix $epsilon.alt > 0$. By construction, 存在 finite disjoint union of rectangle $T_j$ for each $j$, 使得 $ E subset union.big_(j = 1)^oo T_j quad upright(" and ") quad sum_(j = 1)^oo m\(T_j\)lt.eq m\(E\)+ epsilon.alt $
By outer regularity of $m^1$, 存在 $U_j supset T_j$ open rect s.t. $m\(U_j\)lt.eq m\(T_j\)+ epsilon.alt\/2^j$
Then: $ E subset U := union.big_(j = 1)^oo U_j quad upright("and") quad m\(U\)lt.eq sum_(j = 1)^oo m\(U_j\) $
Construct $K$ as in dim $1$ (DIY) $lt.eq m\(E\)+ 2 epsilon.alt$. \ (完整 Pf 可见 395 笔记, 此略)

]
#proof[
#strong[for (c):] \ Notation as above. \ $ m\(E\)< oo arrow.r.double.long m\(U\)< oo arrow.r.double.long m\(U_j\)< oo #h(0em) #h(0em) #h(0em) forall j $
Sides of $U_j$ are disjoint union of ctbly many open finite intervals. \ 因而存在 open rectangle $V_j subset U_j$ for each $j$ that are finite disjoint union of finite open intervals s.t. $ m\(U_j\\V_j\)< epsilon.alt\/2^j $
Now pick $R_1\,dots.h.c\,R_N$ from honest rectangles (即 sides 都是 intervals 的 rectangle) insides $V_j$ (DIY).
(完整 Pf 可见 395 笔记, 此略)

]
#corollary(
)[
For $f in L^1\(m\)$,
if $f in L^1\(m\)$ and $epsilon.alt > 0$ then

- 对于任意 $epsilon.alt > 0$, 都存在 $phi.alt = sum_(j = 1)^N c_j chi_(R_j)$ s.t. $ integral\|phi.alt - f\|#h(0em) d m < epsilon.alt $其中 each $c_j in bb(C)$, $R_j$ 是 rectangles with sides as finite open intervals.

- 存在 $phi.alt in C_c^0\(bb(R)^n\)$ s.t. $ integral\|f - phi.alt\|#h(0em) d m < epsilon.alt $

]
#proof[
Similar to 1 dim case, 可以证明 ${ upright("all step functions") }$, $C_c^0\(bb(R)^n\)$ 是 dense subspace of $L^1\(m\)$.

]
=== approximating an open set $E subset bb(R)^n$ by countable disjoint interior cubes
<approximating-an-open-set-esubset-mathbbrn-by-countable-disjoint-interior-cubes>
对于 $k in bb(Z)$, 令 $cal(Q)_k$ be the collection of cubes whose side length is $1 / 2^k$ 且 vertices 在 lattice $\(2^(- k) bb(Z)\)^n$ 中, 即精细度为 $1 / 2^k$ 的网格中的所有 cubes. \

#figure(image("../assets/ch2-pics-image-20250311142400747.png", width: 40.0%),
  caption: [
  ]
)

对于 $E subset bb(R)^n$, 我们定义: $ attach(limits(A), b: macron)\(E\,k\):= union.big { Q in cal(Q_k) : Q subset E }\,quad accent(A, macron)\(E\,k\):= union.big { Q in cal(Q_k) : Q inter E eq.not diameter } $
即, 一个是被包含在 $E$ 中的所有格子, 一个是最小的覆盖 $E$ 的所有格子.
并定义: $ attach(limits(A), b: macron)\(E\): = union.big_(k = 1)^oo attach(limits(A), b: macron)\(E\,k\)\,quad accent(A, macron)\(E\): = union.big_(k = 1)^oo accent(A, macron)\(E\,k\) $以及
$ accent(kappa, macron)\(E\):= lim_(k arrow.r oo) m\(attach(limits(A), b: macron)\(E\,k\)\)\,quad attach(limits(kappa), b: macron)\(E\):= lim_(k arrow.r oo) m\(accent(A, macron)\(E\,k\)\) $
By CFB, CFA 容易得到: $ accent(kappa, macron)\(E\)= m\(accent(A, macron)\(E\)\)\,quad attach(limits(kappa), b: macron)\(E\)= m\(attach(limits(A), b: macron)\(E\)\) $
Note: 这里的 $attach(limits(A), b: macron)\(E\,k\)\,#h(0em) accent(A, macron)\(E\,k\)\,#h(0em) attach(limits(A), b: macron)\(E\)\,#h(0em) accent(A, macron)\(E\)$ 都是 union of cubes with disjoint interiors.

#lemma(
  title: [#kn[approximate an open set by disjoint interior cubes]],
)[
Let $E subset bb(R)^n$ be open. \ Claim: $E = attach(limits(A), b: macron)\(E\)$

]
#proof[
Folland 2.43.

]
#corollary(
)[
$E subset bb(R)^n$ 是 Lebesuge measurable 的 $arrow.l.r.double$ $accent(kappa, macron)\(E\)= attach(limits(kappa), b: macron)\(E\)$

]
=== behavior under affine transformation
<behavior-under-affine-transformation>
Affine transformation 即 linear transformation + translation.

=== Lebesgue measure and integral is invariant under translation
<lebesgue-measure-and-integral-is-invariant-under-translation>
对于 $a in bb(R)^n$, 一个 translation $t : bb(R)^n arrow.r bb(R)^n\,x mapsto x + a$ 是 ctn 的并且 $ t_a^(- 1) = t_(- a) $

#theorem(
  title: [#kn[Lebesgue measure and integral is invariant under translation]],
)[
\(a) 任取 $a in bb(R)^n$,
$ E in cal(L)^n arrow.r.double.long t_a\(E\)in cal(L)^n quad upright(" and ") quad m\(t_a\(E\)\)= m\(E\) $
(b) if $f : bb(R)^n arrow.r bb(C)$ is Leb measurable, then so is $f compose t_a$. \ More, if $f in L^(+)$ or $f in L^1$, then $f compose t_a in L^1$ 并且 $ integral\(f compose t_a\)#h(0em) d m = integral f #h(0em) d m $

]
#remark[
集合的 measure 以及 measurable function 的积分在 translation 下保持不变.

]
#proof[
\(Folland 2.42) \ (a)
$t_a$ ctn $arrow.r.double.long$ $t_a\(cal(B)_(bb(R)^n)\)subset cal(B)_(bb(R)^n)$, 因而 $t_a\(cal(B)_(bb(R)^n)\)= cal(B)_(bb(R)^n)$
$E$ rectangle, so $E = E_1 times dots.h.c times E_n$, each in $cal(B)_(bb(R))$
$m\(E\)= product_1^n m\(E_i\)$, $t_a\(E\)= product t_(a_i)\(E_i\)$
因而 $ m\(t_a\(E\)\)= product m\(t_(a_i)\(E_i\)\)= product m\(E_i\)subset m\(E\) $
BY HK uniqueness, get $ m\(t_a\(E\)\)= m\(E\)quad forall E in cal(B)_(bb(R)^n) $
if $N subset bb(R)^n$ subnull set, so is $t_a\(N\)$. 因而 $ m\(t_a\(E\)\)= m\(E\)quad forall E in cal(L)^n $
(b) Pick $B in cal(B)_(bb(C)) arrow.r.double.long f^(- 1)\(B\)in cal(L)$.
因而 $f^(- 1)\(B\)= E union N$, $E in cal(B)_(bb(R)^n)$, $N$ null set
因而 $ \(f compose t_a\)^(- 1)\(B\) & = t_a^(- 1)\(f^(- 1)\(B\)\)\
 & = t_a^(- 1)\(E\)union t_a^(- 1)\(N\)upright(" (one Borel, one null)")\
 & = t_(- a)\(f^(- 1)\(B\)\) $
当 $f = chi_E$ 时, 积分 reduce to measure, 即 (a);
因而 $ integral\(f compose t_a\)#h(0em) d m = integral f #h(0em) d m $ also holds for simple $f$, by linearity. \ 从而 by def, 也 hold for $f in L^(+)$ 和 $f in L^1$.

]
=== Lebesgue measure and integration is scaled $\|det T\|$ under linear map
<lebesgue-measure-and-integration-is-scaled-det-t-under-linear-map>
#theorem(
  title: [#kn[Lebesgue measure and integration is scaled $\|det T\|$ by linear map]],
)[
For $T in G L\(n\,bb(R)\)$ (即 linear map $T : bb(R)^n arrow.r bb(R)^n$ 且可逆)
(a) 如果 $f : bb(R)^n arrow.r bb(C)$ is Lebesgue measurable, then so is $f compose T$. \ Moreover if $f in L^(+)$ or $f in L^1$, then $f compose T in L^(+)$, $f compose T in L^1$ respectively. And $ integral f #h(0em) d m =\|det T\|integral f compose T #h(0em) d m $
(b) $ E in cal(L)^n arrow.r.double.long T\(E\)in cal(L)^n quad upright("and") quad m\(T\(E\)\)=\|det T\|m\(E\) $

]
#proof[
Note: 对于 $T\,S in G L\(n\,bb(R)\)$, 如果 $ integral f =\|det T\|integral f compose T quad upright(" and ") quad integral f =\|det S\|integral f compose S $ , 那么则有 $ integral f =\|det\(T compose S\)\|integral f compose\(T compose S\)\(x\) $
which trivially follows from computation. (and $det\(S compose T\)= det S times det T$ for any linear map $S\,T$\.) \ recall that:

#lemma(
  title: [#kn[row reduction]],
)[
#strong[任意 invertible linear map 可以被拆分为 finite 个 elementary linear maps.] ( $T_1$: scale 一行; $T_2$: 交换两行; $T_3$: 一行加上另一行的倍数).

]
于是, 我们只需要 prove the theorem for elementary linear maps 就可以了. 而 elementary linear maps 的 cases 则 easily follows from Fubini-Toneilli. \ #strong[Let $f$ be Borel measurable.] \ 对于 $T_2$: 交换两行 (其 det 为 -1), 我们改变 the order of integration for two coordinates, 因而 integration 不变; \ 对于 $T_1$: scale 一行 by const $c$ (其 det 为 $c$), 我们在一个 coordinate 上积分值翻 $c$ 倍, 因而整体积分值翻 $c$ 倍. 这里用到了 $bb(R) arrow.r bb(R)$ 的 Lebesgue integral 的已证明结论:$ integral f\(t\)#h(0em) d t =\|c\|integral f\(c t\)#h(0em) d t $
对于 $T_3$: 一行加上另一行的倍数 (其 det为 1), 我们 recall $bb(R) arrow.r bb(R)$ 的 Lebesgue integral 的 translation invariance: $ integral f\(t + a\)#h(0em) d t = integral f\(t\)#h(0em) d t $
因而整体积分值不变. \ 从而#strong[我们证明了 (a) for Borel measurable $f$]. \ 从而, (b) for Borel set $E$ trivially follows from (a), by taking indicator function. \ 而对于 (b) 的 $E$ Lebesgue measurable case, $E = B union N$ for some Borel set $B$ 以及 subnull set $N$, 从而 $m\(E\)= m\(B\)$. \ #strong[从而 (b) proved.] \ 而 (a) 的 $f$ Lebesugue measurable 的 case, by def #strong[reduces to $f = chi_E$ where $E$ is Lebesgue measurable set], 于是 follows from the (b).

]
=== Lebesgue measure is invariant under rotation (and reflection)
<lebesgue-measure-is-invariant-under-rotation-and-reflection>
#corollary(
  title: [#kn[Lebesgue measure is invariant under rotation]],
)[
对于 rotation 和 reflection (即 orthogonal transformation), 即 $T T^(*) = I_n$ 的 linear map $T$, 有 $m\(T\(E\)\)= m\(E\)$.

]
#proof[
$T T^(*) = I_n arrow.r.double.long\|det\(T\)\|= 1$.

]
#remark[
$A in G L\(n\,bb(R)\)$ 为一个 orthogonal transformation (可写作 $A in O\(n\)$) 的定义是它 preserve norm. \ 我们知道, $A in O\(n\)$ 当且仅当 $A^(*) = A^(- 1)$. \ 有两种情况: rotation ($det A = 1$) 和 reflection ($det A = - 1$). \

]
== Change of Variable Thm on $bb(R)^n$\[Fol 2.6, finished\]
<change-of-variable-thm-on-mathbbrnfol-2.6-finished>
=== COV
<cov>
#theorem(
  title: [#kn[general change of variable theorem]],
)[
Suppose $Omega subset bb(R)^n$ #strong[open], $G : Omega arrow.r bb(R)^n$ 为一个 $C^1$ #strong[diffeomorphism]. \ Claim:

- 如果 $f : G\(Omega\)arrow.r bb(C)$ 上是 Lebesgue measurable 的, 则 $f compose G : Omega arrow.r bb(C)$ 也是 Lebesgue measurable 的. 并且, 如果 $f in L^(+)\(G\(Omega\)\,m\)$ 或者 $f in f in L^1\(G\(Omega\)\,m\)$, 则有$ integral_(G\(Omega\)) f #h(0em) d m = integral_Omega\(f compose G\)thin\|det D G\|#h(0em) d m $

- 如果 $E subset Omega$ 是 Lebesgue measurable set, 则 $G\(E\)$ 也是 Lebesgue measurable set, 并且 $ m\(G\(E\)\)= integral_E\|det D G\|#h(0em) d m $

]
#proof[
首先, 类似于上一个 lecture 中的各个证明, 只需要 prove for Borel measurable functions 和 Borel sets 就可以了. 我们分为五步证明. \ #strong[Step 1: 我们首先证明, 在 $E$ 为一个 closed cube 的情况下] (我们转而用 $Q$ 来表示它), 有 $ m\(G\(Q\)\)lt.eq integral_Q\|det D G\(x\)\|#h(0em) d x $
#strong[Proof of Step 1]: $ Q = { x :\|\|x - a\|\|_sup lt.eq h } $
By MVT 容易得到, 对于任意的 $x in Q$, 有: $ \|\|G\(x\)- G\(a\)\|\|_sup lt.eq h dot.op\(sup_(y in Q)\|\|D G\(y\)\|\|_sup\) $
(by bounding each entry.) \ 从而, 我们发现 $G\(Q\)$ #strong[是 contained in 一个边长是 $h dot.op sup_(y in Q)\|\|D G\(y\)\|\|_sup$ 的 cube 的]. \ 从而有: $ m\(G\(Q\)\)lt.eq\(sup_(y in Q)\|\|D G\(y\)\|\|\)^n m\(Q\) $
在 invertible $T$ 的作用下, $T^(- 1) compose G$ 仍然是一个 diffeomorphism, 从而
$ m\(G\(Q\)\) & =\|det T\|m\(T^(- 1)\(G\(Q\)\)\)\
 & lt.eq\|det T\|\(sup_(y in Q)\|\|T^(- 1) D G\(y\)\|\|\)^n m\(Q\) $
Let $epsilon.alt > 0$. \ 由于 $D G$ 是 continuous 的, $D G\(x\)^(- 1)D G\(y\)$ 也是 ctn 的 (从而 #strong[uni.ctn.] in the compact cube), 我们对于任意 $epsilon.alt > 0$ 都可以找到一个 $delta > 0$ 使得 对于任意的 $y\,z in Q$ s.t. $\|\|y - z\|\|_sup lt.eq delta$, 都有
$ \|\|D G\(x\)^(- 1)D G\(y\)\|\|lt.eq 1 + epsilon.alt $
于是我们可以把 $Q$ 切分成 interior disjoint 的 closed subcubes $Q_1\,dots.h.c\,Q_N$, 标记其各个中心为 $x_1\,dots.h.c x_N$, 其每个的 side length 都至多为 $delta$, 从而有 $G\(Q\)subset union.big_(j = 1)^N m\(G\(Q_j\)\)$.
于是
$ m\(G\(Q\)\) & lt.eq sum_(j = 1)^N m\(G\(Q_j\)\)\
 & lt.eq sum_(j = 1)^N\|det D G\(x_j\)\|thin \( sup_(y in Q_j)\|\|D G\(x_j\)^(- 1)D G\(y\)\|\|_sup\)^n m\(Q_j\)\
 & lt.eq\(1 + epsilon.alt\)sum_(j = 1)^N\|det D G\(x_j\)\|thin m\(Q_j\)\
 & arrow.r\(1 + epsilon.alt\)thin\|det D G\(x\)\|thin m\(Q\)quad upright(" as ") quad delta arrow.r 0\
 & arrow.r\|det D G\(x\)\|thin m\(Q\)= integral_Q\|det D G\(x\)\|#h(0em) d m quad upright(" as ") quad epsilon.alt arrow.r 0 $
证明了这一结论, 我们就完成了这个 proof 的一大半. \ \ #strong[Step 2:] Prove $ m\(G\(U\)\)lt.eq integral_U\|det D G\(x\)\|#h(0em) d m $ for open $U$ 的 case. \ #strong[Proof of Step 2]: Directly follows from 上一 lecture 的这个 statement: 任意 open $E subset bb(R)^n$ 都是 countable disjoint interior cubes 的 union. \ \ #strong[Step 3:] Prove $ m\(G\(E\)\)lt.eq integral_E\|det D G\(x\)\|#h(0em) d m $ for $E$ Borel 的 case. \ #strong[Proof of Step 3:] Apply step 2 的结论, 使用 MCT for $L^(+)$ case, 使用 DCT for $L^1$ case.
至此, 我们完成了 (b) 的证明的一个方向, 由此可以完成 (a) 的不等式的一个方向: \ \ #strong[Step 4]: 证明 $ integral_(G\(Omega\)) f #h(0em) d m lt.eq integral_Omega f compose G thin\|det D G\(x\)\|#h(0em) d m $
simple function 的 case reduces to measure, 而 $L^(+)$ 的 case follows from MCT. \ \ #strong[Step 5]: 不等式的另一方向: 其实很简单, 因为 diffeomorphism 的 inverse 仍然是 diffeomorphism, 所以 apply inverse 可得. \ 注意, 这只是 for Borel $E$ 和 $L^(+)$ Borel measurable $f$, 不过我们容易接着推导出 Lebesgue measurable $E$ 的情况和 $f in L^(+)\(m\)$ 的情况; 从而再接着推导出 $f in L^1\(m\)$ 的情况.

]
#remark[
这个证明写得比较潦草. 详情见 Folland 2.47. \ 但是大概思路都比较简单. 其中比较困难的是 Step 1 中的各种 error bounds. 很麻烦. \

]
=== application of COV: polar coordinate
<application-of-cov-polar-coordinate>
#definition(
  title: [#kn[mapping from Euclidean coord to polar coord]],
)[
我们定义: $ Phi : bb(R)^n\\{ 0 } arrow.r med\(0\,oo\)times S^(n - 1) $by: $ x mapsto\(r in bb(R)\,theta in bb(S^(n - 1))\) $
其中, $ r =\|x\|\,quad theta = frac(x, \|x\|) in S^(n - 1) $

]
这是一个很直观的坐标变换, 即一个 diffeomorphism. \

#definition(
  title: [#kn[a Borel measure on $\(0\,oo\)times S^(n - 1)$]],
)[
我们定义 $ m_(*)\(E\):= m\(Phi^(- 1)\(E\)\) $

]
这是一个通过坐标变换的 preimage 的 Borel measure 定义的新的 Borel measure. \

#theorem(
)[
Define Borel measure $rho$ on $\(0\,oo\)$ by: $ rho\(E\)= integral_E r^(n - 1) #h(0em) d r $
存在 unique 的 Borel measure $sigma_(n - 1)$ on $S^(n - 1)$, 使得 for Borel measurable $f : bb(R)^n arrow.r bb(C)$ 且 $f gt.eq 0$ or $f in L^1\(m\)$, 有 $ integral_(bb(R)^n) f\(x\)#h(0em) d m & =^(C O V) integral_(\(0\,oo\)times S^(n - 1)) f\(r theta\)#h(0em) d m_(*)\
 & =^(F u b i n i) integral_0^oo integral_(S^(n - 1)) f\(r theta\)#h(0em) d sigma thin d rho\
 & = integral_0^oo r^(n - 1) integral_(S^(n - 1)) f\(r theta\)#h(0em) d sigma thin d r $

]
#proof[
见 Folland 2.49.

]
#remark[
这里 $S^(n - 1)$ 的 unique measure $sigma$ 的计算公式是: $ sigma\(E\)= n dot.op m \( Phi^(- 1) \(\(0\,1\)times E \) \) = n dot.op m { r theta divides 0 < r lt.eq 1\,theta in E } $
这很容易直观:

#figure(image("../assets/ch2-pics-image-20250312031159838.png", width: 40.0%),
  caption: [
  ]
)

这里 $n = 2$, #strong[$m\(E_1\)$ 表示的单位圆下, $E$ 的弧长下的扇形面积, 而 $sigma\(E\)$ 表示 $E$ 的 arc length.] \ (类比, 在 $n = 3$ 的情况下, $m\(E_1\)$ 表示单位球下, $E$ 的球面下的锥形体积, $sigma\(E\)$ 表示 $E$ 在 $S^2$ 中的球面面积.)

]
#remark[
对于 $E = S^(n - 1)$ 即全集的情况 , 这个 measure 有固定的计算公式. $ sigma\(S^(n - 1)\)= frac(2 pi^(n / 2), Gamma\(n / 2\)) $

]
#example(
)[
$sigma\(S^1\)= 2 pi$, $sigma\(S^2\)= 4 pi$.

]
#example(
)[
使用 polar coordinate 计算积分: $ integral_(bb(R)^n) e^(- a\|x\|^2) #h(0em) d x =\(pi / a\)^(n / 2) $
这是因为: $ I_2 = 2 pi integral_0^oo r e^(- a r^2) #h(0em) d r = pi / a $
而由于 $ e^(- a\|x\|^2) = product_(j = 1)^n e^(- a x_j^2) $
我们得到 $ I_n =\(I_1\)^n $
特别地, $ I_2 = I_1^2\,quad upright("thus ") I_1 =\(pi / a\)^(1 / 2) $

]
