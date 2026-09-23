#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 12: on absolutely continuous functions (40/40)]
<homework-12-on-absolutely-continuous-functions-4040>
#emph[Some of the following questions will be graded. Do them, and do hand them in].

#heading(level: 2, numbering: none)[Terminologies 的 communication: $\|mu_F\|= mu_(T_F)$]
<terminologies-的-communication-mu_fmu_t_f>
Let $F : bb(R) arrow.r bb(R)$ be a function in NBV. Prove that total variation of the complex measure associated to $F$ is the complex measure associated to the total variation of $F$. In other words, prove that $\|mu_F\|= mu_(T_F)$.
#emph[Hint]: see Exercise 28 in Chapter 3 of \[Folland\]; proofs by terminology alone are not valid.

#proof[
Set: $ G\(x\): =\|mu_F\|\(\(- oo\,x\]\) $
#strong[Claim 1: It suffices to show that $G = T_F$.] \ Proof of Claim 1: Since $F in N B V$, $mu_F$ is then a complex (regular) Borel measure, as we have shown in class; And by def,
$\|mu_F\|\(E\)= integral_E\|f\|thin d m$ where $f = frac(d mu_F, d m) in L^1\(m\)$, thus $\|mu_F\|$ is also a complex (regular) Borel measure since it is finite. \ Thus $G in N B V$ and its association with $\|mu_F\|$ is unique. if $G = T_F$, it is then also uniquely associated with $mu_(T_F)$, which implies that $mu_(T_F) =\|mu_F\|$. \ #strong[Claim 2: $G = T_F$ Indeed.] \ Proof of Claim 2: \ First we verity that $T_F lt.eq G$: \ By def:
$ T_F\(x\) & = sup {sum_(j = 1)^n lr(|F (x_j) - F (x_(j - 1))|) : n in bb(N) \, - oo < x_0 < dots.h < x_n = x}\
 & = sup {sum_(j = 1)^n lr(|mu_F lr((- oo \, x_j]) - mu_F lr((- oo \, x_(j - 1)])|) : n in bb(N) \, - oo < x_0 < dots.h < x_n = x}\
 & = sup {sum_(j = 1)^n lr(|mu_F lr((x_j \, x_(j - 1)])|) : n in bb(N) \, - oo < x_0 < dots.h < x_n = x}\
 & lt.eq sup {\| mu_F \( - oo \, x_0 \] \| + sum_(j = 1)^n lr(|mu_F lr((x_j \, x_(j - 1)])|) : n in bb(N) \, - oo < x_0 < dots.h < x_n = x}\
 & lt.eq sup {sum_(j = 1)^n lr(|mu_F (E_j)|) : \( - oo \, x \] = union.sq.big_(j = 1)^n E_j}\
 & =\|mu_F\|\(\(- oo\,x\]\)= G\(x\) $
This proves this direction. \ Then we verity that $G lt.eq T_F$: \ #strong[Claim 2.1: $lr(|mu_F \( E \)|) = mu_(T_F)\(E\)$ for all borel set $E$.] \ First, for h-interval $E =\(a\,b\]$, we have:
$ lr(|mu_F \( E \)|) & = lr(|mu_F \( a \, b \]|)\
 & = lr(|mu_F \( - oo \, b \] - mu_F \( - oo \, a \]|) =\|F\(b\)- F\(a\)\|\
 & lt.eq sup {sum_(j = 1)^n lr(|F (x_j) - F (x_(j - 1))|) : n in bb(N) \, a = x_0 < dots.h < x_n = b}\,quad upright("by tri ineq")\
 & = T_F\(b\)- T_F\(a\)\
 & = mu_(T_F)\(- oo\,b\]- mu_(T_F)\(- oo\,a\]\
 & = mu_(T_F)\(a\,b\]= mu_(T_F)\(E\) $
Also for intervals like $\(- oo\,b\]$, we have
$ lr(|mu_F \( \( - oo \, b \] \)|) = lr(|sum_(k = 1)^oo mu_F \( \( b - k \, b + 1 - k \] \)|) lt.eq sum_(k = 1)^oo lr(|mu_F \( \( b - k \, b + 1 - k \] \)|) lt.eq sum_(k = 1)^oo mu_(T_F)\(\(b - k\,b + 1 - k\]\)= mu_(T_F)\(\(- oo\,b\]\) $
Thus #strong[$lr(|mu_F \( E \)|) = mu_(T_F)\(E\)$ is true for all left-open, right-closed intervals $E$], and thus also true for all finite disjoint unions of left-open, right-closed intervals. Notice that, the #strong[set of all finite disjoint unions of left-open, right-closed intervals is an algebra,] we denote it by $cal(A)$. So $ lr(|mu_F \( E \)|) lt.eq mu_(T_F)\(E\)\,quad forall E in cal(A) $
Now we define: $ cal(C) := {E in cal(B) \( bb(R) \) : \| mu_F \( E \) \| lt.eq mu_(T_F) \( E \)} $
Then we have: $ cal(A) subset cal(C) $
Notice that increasing sequence $(E_k)_(k = 1)^oo$ in $cal(C)$, we have:
$ lr(|mu_F (union.big_(k = 1)^oo E_k)|) & = lr(|mu_F (union.sq.big_(k = 1)^oo \( E_k \\ union.big_(j = 1)^(k - 1) E_j \))|)\
 & lt.eq sum_(k = 1)^oo\|mu_F\(E_k\\ union.big_(j = 1)^(k - 1) E_j\)\|\
 & lt.eq sum_(k = 1)^oo mu_(T_F)\(E_k\\ union.big_(j = 1)^(k - 1) E_j\)\
 & = mu_(T_F) (union.big_(k = 1)^oo E_k) $
Showing that $cal(C)$ is closed under countable increasing unions. Similarly, $cal(C)$ is closed under countable decreasing intersections. This shows that #strong[$cal(C)$ is a monotone class]. Since $cal(C) supset cal(A)$ which is an algebra that generates the $sigma$-algebra $cal(B)\(bb(R)\)$, we have by the monotone class lemma: $ cal(B)\(bb(R)\)subset cal(C) $
This finishes the proof that $lr(|mu_F \( E \)|) = mu_(T_F)\(E\)$ for all borel set $E$.

Then we have: $ lr(|mu_F|)\(E\) & = sup {sum_(k = 1)^oo lr(|mu_F (E_k)|) : E = union.sq.big_(k = 1)^oo E_k}\
 & lt.eq sup {sum_(k = 1)^oo mu_(T_F) (E_k) : E = union.sq.big_(k = 1)^oo E_k}\
 & = sup {mu_(T_F) \( E \)}\
 & = mu_(T_F)\(E\) $
Therefore we have $ G lt.eq T_F $Combining both directions we have$ G = T_F $which shows by Claim 1 that $ \|mu_F\|= mu_(T_F) $

]
#heading(level: 2, numbering: none)[Characterization of Lipschitz continuity: $A C$ + bounded derivative$arrow.l.r.double$Lipschitz continuity:]
<characterization-of-lipschitz-continuity-ac-bounded-derivativeifflipschitz-continuity>
Consider a function $F : bb(R) arrow.r bb(R)$.
Show that $\|F\(x\)- F\(y\)\|lt.eq M\|x - y\|$ for all $x\,y$ (i.e. $F$ is Lipschitz continuous with Lipschitz constant at most $M$) iff $F$ is absolutely continuous, and $\|F'\(x\)\|lt.eq M$ for Lebesgue a.e.~$x$.

#proof[
Forward Direction ($arrow.r.double.long$): Suppose $F$ is Lipschitz continuous, and take Lipschitz constant $M > 0$ such that $\|F\(y\)- F\(x\)\|lt.eq M\|y - x\|$ for all $x\,y in bb(R)$. \ Let $epsilon.alt > 0$. \ Let $(a_1 \, b_1)\,(a_2 \, b_2)\,dots.h\,(a_n \, b_n)$ be a finite collection of disjoint intervals with $sum_(k = 1)^n (b_k - a_k) < epsilon.alt / M$ then we have:
$ sum_(k = 1)^n lr(|F (b_k) - F (a_k)|) lt.eq sum_(k = 1)^n M lr(|b_k - a_k|) = M sum_(k = 1)^m (b_k - a_k) < M epsilon / M = epsilon $
This shows that $F$ is absolutely continuous. And since $F$ is absolutely continuous, its restriction on any compact interval is of bounded variation, thus differentiable a.e.; thus $F$ is differentiable $m$-a.e. \ Then for $m$-a.e. $x in bb(R)$, we have:
$ lr(|F' \( x \)|) = lr(|lim_(y arrow.r x) frac(F\(y\)- F\(x\), y - x)|) = lim_(y arrow.r x) frac(\|F\(y\)- F\(x\)\|, \|y - x\|) lt.eq lim_(y arrow.r x) frac(M\|y - x\|, \|y - x\|) = lim_(y arrow.r x) M = M $
This finishes the proof of the forward direction. \ Backward Direction ($arrow.r.double.long$): Suppose $F$ is absolutely continuous, and $\|F'\(x\)\|lt.eq M$ for $m$-a.e.~$x$. \ Let $x\,y in bb(R)$ and $x lt.eq y$ then on $\[x\,y\]$ we have: $ \|F\(y\)- F\(x\)\|= lr(|integral_x^y F' d m|) lt.eq integral_x^y lr(|F'|) d m lt.eq integral_x^y M d m = M\(y - x\)= M\|y - x\| $ Therefore $F$ is Lipschitz continuous with Lipschitz constant $M$.

]
#heading(level: 2, numbering: none)[$A C$ function 保留 null sets]
<ac-function-保留-null-sets>
Let $F : bb(R) arrow.r bb(R)$ be an absolutely continuous function. Prove that $F$ maps null sets to null sets. In other words, if $E subset bb(R)$ is a set of Lebesgue measure zero, then $F\(E\)= { F\(x\)divides x in E }$ is also of Lebesgue measure zero. (In particular, $F\(E\)$ is Lebesgue measurable, cf.~HW4\#6.)

#proof[
Fix $F : bb(R) arrow.r bb(R)$ abs ctn, and $E subset bb(R)$ s.t. $m\(E\)= 0$. \ Let $epsilon.alt > 0$. \ Since $F in A C$, there exists some $delta > 0$ s.t. for any disjoint intervals $\(a_1\,b_1\)\,dots.h.c\,\(a_n\,b_n\)$ s.t. $sum_1^n\(b_j - a_j\)< delta$, we have: $sum_1^N\|F\(b_j\)- F\(a_j\)\|< epsilon.alt$. \ Fix this $delta$. Since $m\(E\)= 0$, there exists finite collection of bounded open intervals $\(c_1\,d_1\)\,dots.h.c .\(c_n\,d_n\)$ such that $ E subset union.big_1^n\(c_j\,d_j\) $with $ sum_1^n m\(c_j\,d_j\)= sum_1^n\(d_j - c_j\)< delta $
Notice that, though these open intervals are not necessarily disjoint, but finite union of bounded open intervals can be expressed as finite union of disjoint open intervals. We just need to connect those open intervals that has intersection. \ By doing this, we get some disjoint intervals $\(a_1\,b_1\)\,dots.h.c\,\(a_N\,b_N\)$ from $\(c_1\,d_1\)\,dots.h.c .\(c_n\,d_n\)$, with $ E subset union.big_1^N\(a_j\,b_j\)= union.big_1^n\(c_j\,d_j\) $
and (since new intervals remove the intersection part and keep the union:) $ sum_1^N m\(a_j\,b_j\)lt.eq sum_1^n m\(c_j\,d_j\)< delta $
Now we can apply the absolute continuity. Since $F in A C$, it is continuous for sure. Thus on $\[a_j\,b_j\]$, it takes max and min value respectively on some $x_j\,y_j in\[a_j\,b_j\]$. Then $ F\(\[a_j\,b_j\]\)=\[F\(y_j\)\,F\(x_j\)\] $
So $ F\(\(a_j\,b_j\)\)subset\[F\(y_j\)\,F\(x_j\)\] $
This is by the intermediate value theorem. We denote the open interval using $x_j\,y_j$ as endpoints as $I_j$. We then have $I_j subset\[a_j\,b_j\]$. \ Thus $ sum_1^N\|I_j\|< delta $and by abs ctnity, we have : $ sum_1^N\|F\(y_j\)- F\(x_j\)\|< epsilon.alt $
Since $E subset union.big_1^N\(a_i\,b_i\)$, we have $ F\(E\)subset F \( union.big_1^N\(a_i\,b_i\)\) = union.big_1^N F\(\(a_i\,b_i\)\)subset union.big_1^N\[F\(y_j\)\,F\(x_j\)\] $
so we then have$ m\(F\(E\)\)lt.eq m\(union.big_1^N\[F\(y_j\)\,F\(x_j\)\]\)lt.eq sum_1^N m\(\[F\(y_j\)\,F\(x_j\)\]\)= sum_1^N\|F\(y_j\)- F\(x_j\)\|< epsilon.alt $
Since $epsilon.alt > 0$ is arbitrary, this finishes the proof that $ m\(F\(E\)\)= 0 $

]
#heading(level: 2, numbering: none)[$B V$ function 每点的 left $&$ right limit 一定存在]
<bv-function-每点的-left-right-limit-一定存在>
Prove directly from the definition that if $F : bb(R) arrow.r bb(R)$ is a function of bounded variation, then $F$ admits a left and a right limit at every point. In other words, for any $a in bb(R)$, the limits $ lim_(x arrow.r a +) F\(x\)quad upright("and") quad lim_(x arrow.r a -) F\(x\) $
both exist. Do not use the Jordan decomposition. #emph[Hint]: as is often the case, limits can be studied through limsup and liminf.

#proof[
Let $F : bb(R) arrow.r bb(R)$ be a function of bounded variation, fix $a in bb(R)$. \ Define $ L := limsup_(x arrow.r a^(+)) F\(x\)\,quad l := liminf_(x arrow.r a^(+)) F\(x\) $
Then we have $L gt.eq l$. We will show $L = l$. \ Let $epsilon.alt > 0$. \ Suppose for contradiction that $L > l + epsilon.alt$. \ Let $a_n arrow.r a$ be a seq. By the def of limsup and lininf, there must exists a subseq $a_(n_j)$ such that for some $N_1$, we have: $ \|L - F\(a_(n_j)\)\|< epsilon.alt / 4\,quad forall j gt.eq N_1 $ And there must exists a subseq $a_(m_k)$ such that for some $N_2$, we have: $ \|F\(a_(m_k)\)- l\|< epsilon.alt / 4\,quad forall k gt.eq N_2 $
Then for all $j\,k gt.eq max\(N_1\,N_2\)$ we have: $ \|F\(a_(n_j)\)- F\(a_(m_k)\)\|gt.eq\|L - l\|-\|L - F\(a_(n_j)\)\|-\|F\(a_(m_k)\)- l\|> epsilon.alt / 2 $
Notice: for any $j gt.eq max\(N_1\,N_2\)$ and given start $K_0 in bb(N)$, there exists some $k gt.eq max\(K_0\,N_1\,N_2\)$ s.t. $ a_(m_k) < a_(n_j) $ This is because $a_(m_k) arrow.r a$ as $k arrow.r oo$. \ And this is same on the $k$ side. \

#figure(image("../assets/hw11-image-20250420224142076.png", width: 50.0%),
  caption: [
    unbounded total variation by alternating limsup/inf seq
  ]
)
#label("fig:unbounded total variation by alternating limsup/inf seq")

Thus, by picking $j_0 = max\(N_1\,N_2\)$, we can pick $k_0$ s.t. $a_(m_(k_0)) < a_(n_(j_0))$, and then pick $j_1$ s.t. $a_(m_(j_1)) < a_(n_(k_0))$ \; and inductively, for the pick of $j_p$, we can always pick $k_p$ s.t. $a_(m_(k_p)) < a_(n_(j_p))$ an then pick $a_(m_(j_(p + 1))) < a_(n_(k_p))$. \ We do this process to get the finite seq $j_0\,k_0\,j_1\,k_1\,dots.h.c\,j_p\,k_p$ for some int $p$. Then we have:
$ T_F\(\[a\,a_(n_(j_0))\]\)gt.eq\|F\(a_(n_(j_0))\)- F\(a_(m_(k_0))\)\|+\|F\(a_(n_(k_0))\)- F\(a_(m_(j_1))\)\|+ dots.h.c +\|F\(a_(n_(j_p))\)- F\(a_(m_(k_p))\)\|+\|F\(a_(n_(k_p))\)- F\(a\)\|gt.eq p epsilon.alt / 2 $
As $p arrow.r oo$, we have $T_F\(\[a\,a_(j_0)\]\)gt.eq p epsilon.alt / 2 arrow.r oo$. Thus by def, $T_F\(\[a\,a_(j_0)\]\)= oo$, contradicting the assumption that $F$ is a function of bounded variation. \ Thus by contradiction, it shows that $ L lt.eq l + epsilon.alt $
Since $L gt.eq l$ and $epsilon.alt > 0$ is arbitrary, this finishes the proof that $ L = l $
Since we have $limsup_(x arrow.r a^(+)) F\(x\)= liminf_(x arrow.r a^(+)) F\(x\)$, we then have: $ lim_(x arrow.r a +) F\(x\)#h(0em) exists $
By same reasoning, we can get that $ lim_(x arrow.r a -) F\(x\)#h(0em) exists $

]
#heading(level: 2, numbering: none)[$A C & L^1$ 函数的导数绝对值的总积分为 $0 arrow.r.double.long f = 0$]
<ac-l1-函数的导数绝对值的总积分为-0implies-f-0>
Let $f : bb(R) arrow.r bb(R)$ be an absolutely continuous function. Assume that $f in L^1\(bb(R)\)$, and that $ lim_(t arrow.r 0 +) integral_(- oo)^oo lr(|frac(f\(x + t\)- f\(x\), t)|) thin d x = 0 . $
Prove that $f = 0$. #emph[Hint]: consult Fatou Samba but ignore any dance moves.

#proof[
We define: $ D_t\(x\): = frac(f\(x + t\)- f\(x\), t) $
Since $f in A C$, we have that $f' in L^1\(m\)$ exists a.e., thus by def of derivative we have:
So we take a seq of functions $g_n : =\|D_(1\/n)\|$, we then have: $ lim_(n arrow.r oo) g_n = lim_(t arrow.r 0^(+))\|D_t\|=\|f'\|quad upright(" a.e.") $
Notice we are given the condition that: $ lim_(t arrow.r 0^(+)) parallel D_t parallel_1 = lim_(n arrow.r oo) integral g_n = 0 $
Since fixing $t$, $f\(x + t\)$ and $f\(x\)$ are measurable functions, $D_t$ is also measurable, and thus $g_n in L^(+)\(m\)$ for each $n$. (we can ignore the points where the limit does not exist, since the set of these points has Lebesgue measure $0$\.) \ Applying Fatou's Lemma we have: $ integral liminf_(n arrow.r oo) g_n thin d x lt.eq liminf_(n arrow.r oo) integral g_n d x = lim_(n arrow.r oo) integral g_n = 0 $
Since $g_n$ and $liminf_(n arrow.r oo) g_n = lim_(n arrow.r oo) g_n$ are nonnegative, we have: $ \|f'\|= lim_(n arrow.r oo) g_n = 0 quad upright("a.e.") $
Thus $ f' = 0 quad upright("a.e.") $
Since by AC, we can apply FTC: Let $\[a\,b\]$ be an arbitrary interval, then by FTC we have: $ f\(x\)- f\(a\)= integral_a^x 0 thin d y = 0\,quad forall x in\[a\,b\] $
Thus $ f\(x\)= f\(a\)\,quad forall x in\[a\,b\] $
Since the interval $\[a\,b\]$ is arbitrary, this proves: $f$ is a constant function. (By taking $I_n : =\[- n\,n\]$ over $n in bb(N)$, we can get $f\(x\)= 0$ for all $x in bb(R)$\.) \ Suppose for contradiction that $f = c eq.not 0$, then $ integral\|f\|= integral_(bb(R))\|c\|= oo $contradicting $f in L^1\(m\)$, thus we have $ f = 0 $This finishes the proof.

]
