#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 9: on signed measure (50/50)]
<homework-9-on-signed-measure-5050>
#heading(level: 2, numbering: none)[Three real Banach spaces and a fake one]
<three-real-banach-spaces-and-a-fake-one>
- Let
  $ ell_0^oo := { a =\(a_1\,a_2\,dots.h.c\)divides a_i in bb(R)\,lim_(n arrow.r oo) a_n = 0 } . $Prove that $\(ell_0^oo\,parallel dot.op parallel_oo\)$, where $parallel a parallel_oo = sup_n\|a_n\|$, is a Banach space.

- Let
  $ C_b^0\(bb(R)\):= { f : bb(R) arrow.r bb(R) divides f upright(" is continuous and bounded") } . $
  Prove that $\(C_b^0\(bb(R)\)\,parallel dot.op parallel_oo\)$, where $parallel f parallel_oo = sup_(x in bb(R))\|f\(x\)\|$, is a Banach space.

- Let
  $ C_0^0\(bb(R)\):= { f : bb(R) arrow.r bb(R) divides f upright(" is continuous, ") lim_(x arrow.r plus.minus oo) f\(x\)= 0 } . $
  Prove that $\(C_0^0\(bb(R)\)\,parallel dot.op parallel_oo\)$, where $parallel f parallel_oo = sup_(x in bb(R))\|f\(x\)\|$, is a Banach space.

- Recall that
  $ C_c^0\(bb(R)\)= { f : bb(R) arrow.r bb(R) divides f upright(" is continuous and ") f = 0 upright(" outside a bounded set") } . $
  Show that $\(C_c^0\(bb(R)\)\,parallel dot.op parallel_oo\)$, where $parallel f parallel_oo = sup_(x in bb(R))\|f\(x\)\|$, is not a Banach space.

#proof[
#strong[of (a):] Since we showed in class that $ ell^oo = L^oo\(bb(N)\,cal(P)\(bb(N)\)\,mu_(c o u n t i n g)\) $ and $L^oo$ spaces are Banach, $ell^oo$ is Banach. \ Thus it suffices to show that $ell_0^oo$ is closed in $ell^oo$, since a closed subset of a complete metric space is complete. \ Let $\(a^(\(k\))\)_(k = 1)^oo$ be a sequence in $ell_0^oo$ converging in norm to $a in ell^oo$, i.e.,
$ parallel a^(\(k\)) - a parallel_oo arrow.r 0 $
Let $epsilon > 0$. \ Since $parallel a^(\(k\)) - a parallel_oo arrow.r 0$, there exists $K$ such that for all $k gt.eq K$,
$ parallel a^(\(k\)) - a\|\|= sup_n\|a_n^(\(k\)) - a_n\|< epsilon / 2 $
This implies that $ forall n\,\|a_n^(\(K\)) - a_n\|< epsilon $Since $a^(\(K\)) in ell_0^oo$, $a_n^(\(K\)) arrow.r 0$ as $n arrow.r oo$. Thus there exists $N in bb(N)$ s.t. for all $n gt.eq N$, $ \|a_n^(\(K\))\|lt.eq epsilon / 2 $
Then for all $n gt.eq N$, we have:
$ \|a_n\|lt.eq\|a_n - a_n^(\(K\))\|+\|a_n^(\(K\))\|< epsilon $
This shows that $ lim_(n arrow.r oo)\|a_n\|< epsilon.alt $
Since $epsilon > 0$ is arbitrary, this implies $ lim_(n arrow.r oo) a_n = 0 $
Hence $a in ell_0^oo$. So $ell_0^oo$ is closed in $ell^oo$, thus itself Banach.

]
#proof[
#strong[of (b):]
Let $\(f_n\)_(n in bb(N))$ be a Cauchy seq in $\(C_b^0\(bb(R)\)\,parallel dot.op parallel_oo\)$, then
$ forall epsilon > 0\,exists N in bb(N) #h(0em) #h(0em) s . t . parallel f_n - f_m parallel_oo = sup_(x in bb(R))\|f_n\(x\)- f_m\(x\)\|< epsilon $In particular, for each fixed $x in bb(R)$, $\(f_n\(x\)\)_(n in bb(N))$ is a Cauchy sequence in $bb(R)$, hence converges (since $bb(R)$ is complete). So we can define the pointwise limit: $ f\(x\):= lim_(n arrow.r oo) f_n\(x\) $
#strong[Claim 1: $f_n arrow.r f$ in $parallel dot.op parallel_oo$.] \ Let $epsilon > 0$. \ Since $\(f_n\)$ is Cauchy in $parallel dot.op parallel_oo$, there exists $N$ such that: $ parallel f_n - f_m parallel_oo < epsilon\,quad forall n\,m gt.eq N $
Fix $m gt.eq N$, and let $n arrow.r oo$. For each $x$, we get: $ \|f_n\(x\)- f_m\(x\)\|< epsilon #h(0em) #h(0em) forall n arrow.r.double.long lim_(n arrow.r oo)\|f_n\(x\)- f_m\(x\)\|=\|f\(x\)- f_m\(x\)\|lt.eq epsilon $
Since this is true for each $x in bb(R)$, we obtain: $ parallel f - f_m parallel_oo lt.eq epsilon\,quad upright("for all ") m gt.eq N $
Since $epsilon > 0$ is arbitrary, this shows that $ lim_(n arrow.r oo) parallel f - f_n parallel_oo = 0 $
#strong[Claim 2: $f in\(C_b^0\(bb(R)\)\,parallel dot.op parallel_oo\)$.] \ Since $lim_(n arrow.r oo) parallel f - f_n parallel_oo = 0$, it also implies that the convergence is uniform. \ We know the uniform limit of continuous functions is continuous, so $f$ is continuous. It remains to show $f$ is bounded, and this directly follows from the uniform convergence. We take $epsilon = 1$. We have proved that there exists $N$ s.t. for all $m gt.eq N$,
$ parallel f - f_m parallel_oo lt.eq 1 $
Thus $ sup_(x in bb(R))\|f\(x\)\|lt.eq sup_(x in bb(R))\|f_N\(x\)\|+ 1 $
Since $f_n in C_b^0\(bb(R)\)$), it is bounded, thus $ sup_(x in bb(R))\|f\(x\)\|< oo $showing that the limit function is bounded. This finishes the proof that $f in C_b^0\(bb(R)\)$.
Thus, every Cauchy seq in $\(C_b^0\(bb(R)\)\,parallel dot.op parallel_oo\)$ converges in $\(C_b^0\(bb(R)\)\,parallel dot.op parallel_oo\)$, i.e. it is Banach.

]
#proof[
#strong[of (c):]
Let $\(f_n\)_(n in bb(N))$ be a Cauchy seq in $\(C_0^0\(bb(R)\)\,parallel dot.op parallel_oo\)$, then for each fixed $x in bb(R)$, $\(f_n\(x\)\)_(n in bb(N))$ is a Cauchy sequence in $bb(R)$, so for the same reason as (b), we can define the pointwise limit: $ f\(x\):= lim_(n arrow.r oo) f_n\(x\) $And for the same reason as (b), we get $ f_n arrow.r f upright(" in ") parallel dot.op parallel_oo $
which also implies that the pointwise convergence is uniform. Since each $f_n$ is continuous, the uniform limit $f$ is continuous. \ Thus it suffices to show that $lim_(x arrow.r plus.minus oo) f\(x\)= 0$. \ Let $epsilon.alt > 0$. Since $f_n arrow.r f$ uniformly, there exists $N$ such that for all $n gt.eq N$, $parallel f_n - f parallel_oo < epsilon.alt\/2$. Also, since $f_N in C_0^0\(bb(R)\)$, there exists $M > 0$ such that $\|f_N\(x\)\|< epsilon.alt\/2$ for all $\|x\|> M$. \ Then for $\|x\|> M$, $ \|f\(x\)\|lt.eq\|f\(x\)- f_N\(x\)\|+\|f_N\(x\)\|< epsilon.alt\/2 + epsilon.alt\/2 < epsilon.alt $
So $lim_(x arrow.r plus.minus oo) f\(x\)= 0$, i.e., $f in C_0^0\(bb(R)\)$. Thus, every Cauchy seq in $\(C_0^0\(bb(R)\)\,parallel dot.op parallel_oo\)$ converges in $\(C_0^0\(bb(R)\)\,parallel dot.op parallel_oo\)$, i.e. it is Banach.

]
#proof[
of (d):
We consider a continuous (smooth actually) function $phi.alt : bb(R) arrow.r bb(R)$ with $"supp"\(phi.alt\)=\[0\,2\]$ (here we take the closure):$ phi.alt\(x\):= cases(delim: "{", exp #h(-1em) \( #h(-1em) - frac(1, x thin\(2 - x\)) \)\, & 0 < x < 2\,, 0\, & upright("otherwise")) $

#figure(image("../assets/hw9-Screenshot 2025-03-27 at 20.28.30.png", width: 35.0%),
  caption: [
  ]
)

This function reaches its maximum at $x = 1$, $ parallel phi.alt parallel_oo = 1 / e $
For each integer $n gt.eq 1$, define $ phi.alt_n\(x\)= phi.alt #h(-1em) \( x - n \) $
Then each $phi.alt_n$ is also continuous, and $"supp"\(phi.alt_n\)=\[n\,n + 2\]$. \ Consider the sequence $\(S_N\)_1^oo$, defined as: $ S_N\(x\):= sum_(n = 1)^N 2^(- n) thin phi.alt_n\(x\) $
Then each $S_N in C_c^0\(bb(R)\)$, since finite sum of continuous functions is also continuous, and $"supp"\(S_N\)=\[1\,N + 2\]$, thus each $S_N in C_c^0\(bb(R)\)$. \ #strong[Claim: $\(S_N\)_1^oo$ is Cauchy in the sup norm.] \ This is because for each (WLOG) $M > N in bb(N)$, $ parallel S_M - S_N parallel_oo & = parallel sum_(n = N + 1)^M 1 / 2^n phi.alt_n parallel_oo\
 & lt.eq sum_(n = N + 1)^M 1 / 2^n parallel phi.alt parallel_oo\
 & lt.eq sum_(n = N + 1)^oo 1 / 2^n parallel phi.alt parallel_oo\
 & = sum_(n = N + 1)^oo frac(1, 2^n e) = frac(1, 2^N e) arrow.r^(N arrow.r oo) 0 $
Thus for arbitrary $epsilon > 0$, exists $K in bb(N)$ s.t. for all $M\,N gt.eq K$, $parallel S_M - S_N parallel_oo < epsilon$. And by same reason as (b), (c), $\(S_N\)_1^oo$ converges by $parallel dot.op parallel_oo$ into its pointwise limit: $ S\(x\):= sum_(n = 1)^oo 2^(- n) thin phi.alt_n\(x\) $
But $S\(x\)$ does not have compact support, $"supp"\(S\)=\[0\,oo\)$. So $S in.not C_c^0\(bb(R)\)$. This serves as a counterexample showing that $C_c^0\(bb(R)\)$ is not Banach.

]
#heading(level: 2, numbering: none)[$nu^(+)\(E\)\,nu^(-)\(E\)\,\|nu\|\(E\)$ 的formula from original $nu$]
<nue-nu-enue-的formula-from-original-nu>
Let $nu$ be a signed measure on $\(X\,cal(A)\)$, and $E in cal(A)$. Prove the following statements:

- $nu^(+)\(E\)= sup { nu\(F\)divides : F in cal(A)\,F subset E }$, and $nu^(-)\(E\)= - inf { nu\(F\)divides F in cal(A)\,F subset E }$\;

- $\|nu\|\(E\)= sup { sum_(i = 1)^N\|nu\(E_i\)\|divides N in bb(N)\,thin E = union.big_(i = 1)^N E_i upright(" disjoint union") }$\;

- $\|nu\|\(E\)gt.eq\|nu\(E\)\|$. In the case $nu$ finite, it achieves equality iff $E$ is positive or negative for $nu$.

#proof[
#strong[of (i):] By the Hahn decomposition theorem, we can take a Hahn decomposition $X = P union.sq N$ where $ nu\(A\)gt.eq 0 quad upright("for all ") A subset P\,#h(2em) nu\(B\)lt.eq 0 quad upright("for all ") B subset N $
Fix $E in cal(A)$. By Jordan decomposition we have $ nu^(+)\(E\)= nu\(E inter P\) $Fix $F subset E$, we have:$ F =\(F inter P\)union.sq\(F inter N\) $
Since $nu\(F inter N\)lt.eq 0$, we have: $ nu\(F\)lt.eq nu \( F inter P \) #h(0em) lt.eq #h(0em) nu \( E inter P \) = nu^(+)\(E\) $Since $F$ is arbitrary, this shows: $ sup { nu\(F\)divides F subset E } lt.eq nu^(+)\(E\) $
On the other hand, taking $F = E inter P subset E$, we get $ nu\(F\)= nu \( E inter P \) = nu^(+)\(E\) $
Hence $ sup { nu\(F\)divides F subset E } gt.eq nu^(+)\(E\) $
Combining both inequalities gives $ nu^(+)\(E\)= sup { nu\(F\)divides F subset E } $
Similarly, since $nu\(F inter P\)gt.eq 0$ and $nu\(F\)= nu\(F inter P\)+ nu \( F inter N \)$, we have $nu\(F\)gt.eq nu \( F inter N \)$. And Since $nu \( E inter N \) = nu\(F inter N\)+ nu\(\(E\\F\)inter N\)$ with $nu\(\(E\\F\)inter N\)lt.eq 0$, we get $nu \( F inter N \) gt.eq nu \( E inter N \)$. \ Putting it together:
$ nu\(F\)gt.eq nu \( F inter N \) gt.eq nu \( E inter N \) = - nu^(-)\(E\) $Since $F$ is arbitrary, this shows: $ inf { nu\(F\)divides F subset E } gt.eq - nu^(-)\(E\) $
On the other hand, taking $F = E inter N subset E$, we get $ nu\(F\)= nu \( E inter N \) = - nu^(-)\(E\) $
Hence $ inf { nu\(F\)divides F subset E } lt.eq - nu^(-)\(E\) $
Combining both inequalities gives $ nu^(-)\(E\)= - inf { nu\(F\)divides F subset E } $

]
#proof[
#strong[of (ii):]
Let $E in cal(A)$.
By def of total variation measure, $ \|nu\|\(E\)= nu^(+)\(E\)+ nu^(-)\(E\) $
One direction of the equality is easy. Take a Hahn decomposition $X = P union.sq N$ where $ nu\(A\)gt.eq 0 quad upright("for all ") A subset P\,#h(2em) nu\(B\)lt.eq 0 quad upright("for all ") B subset N $
Then by Jordan decomposition, we have:$ nu^(+)\(E\)= nu\(E inter P\)\,quad nu^(-)\(E\)= - nu\(E inter N\) $
So by taking $E_1 : = E inter P$, $E_2 : = E inter N$, we have: $ \|nu\|\(E\)= nu^(+)\(E\)+ nu^(-)\(E\)= nu\(E_1\)+ nu\(E_2\) $This shows that $ \|nu\|\(E\)lt.eq sup { sum\|nu\(E_i\)\|} $
And for the other direction, for any disjoint measurable partition $E = union.big_(i = 1)^N E_i$, we have $ \|nu\(E_i\)\|= \| nu^(+)\(E_i\)- nu^(-)\(E_i\)\| lt.eq nu^(+)\(E_i\)+ nu^(-)\(E_i\)=\|nu\|\(E_i\) $
Therefore $ sum_(i = 1)^N \| nu\(E_i\)\| lt.eq sum_(i = 1)^N \| nu\|\(E_i\)=\|nu\|\( union.big_(i = 1)^N E_i \) =\|nu\|\(E\) $
since $\|nu\|$ is a p.m. and the $E_i$'s are disjoint. Thus $ sup { sum_(i = 1)^N\|nu\(E_i\)\|} lt.eq\|nu\|\(E\) $
Combining the two inequalities gives
$ \|nu\|\(E\)= sup { sum_(i = 1)^N \| nu\(E_i\)\| \| #h(0em) N in bb(N)\,E = union.big_(i = 1)^N E_i upright(" disjoint") } $
proving the statement.

]
#proof[
#strong[of (iii):]
Let $E in cal(A)$.
The ineq $\|nu\|\(E\)gt.eq\|nu\(E\)\|$ follows from triangular ineq on $bb(R)$:
$ \|nu\(E\)\|= \| nu^(+)\(E\)- nu^(-)\(E\)\| lt.eq nu^(+)\(E\)+ nu^(-)\(E\)=\|nu\|\(E\) $
Now we assume $nu$ is finite (i.e.~$\|nu\|\(X\)< oo$). The equality condition $\|nu\(E\)\|=\|nu\|\(E\)$ is detailedly:
$ \| nu^(+)\(E\)- nu^(-)\(E\)\| = nu^(+)\(E\)+ nu^(-)\(E\) $
Since $\|nu\|\(X\)< oo$, $nu^(+)\(E\)< oo$ and $nu^(-)\(E\)< oo$. \ Case 1: $nu^(+)\(E\)gt.eq nu^(-)\(E\)$, then $ \| nu^(+)\(E\)- nu^(-)\(E\)\| = nu^(+)\(E\)+ nu^(-)\(E\) & arrow.l.r.double nu^(+)\(E\)- nu^(-)\(E\)= nu^(+)\(E\)+ nu^(-)\(E\)\
 & arrow.l.r.double - nu^(-)\(E\)= nu^(-)\(E\)\
 & arrow.l.r.double nu^(-)\(E\)= 0\
 & arrow.l.r.double E subset P $
Case 2: $nu^(+)\(E\)< nu^(-)\(E\)$, then $ \| nu^(+)\(E\)- nu^(-)\(E\)\| = nu^(+)\(E\)+ nu^(-)\(E\) & arrow.l.r.double nu^(-)\(E\)- nu^(+)\(E\)= nu^(+)\(E\)+ nu^(-)\(E\)\
 & arrow.l.r.double - nu^(+)\(E\)= nu^(+)\(E\)\
 & arrow.l.r.double nu^(+)\(E\)= 0\
 & arrow.l.r.double E subset N $
Therefore the equality condition implies that $E$ must be positive or negative for $nu$\; and in converse, if $E$ is neither positive nor negative set, in either case it implies $\|nu\(E\)\|eq.not\|nu\|\(E\)$, thus when $nu$ finite, $\|nu\(E\)\|=\|nu\|\(E\)$ iff $E$ is positive or negative for $nu$.

]
#heading(level: 2, numbering: none)[Signed integrals]
<signed-integrals>
Let $nu$ be a signed measure on $\(X\,cal(A)\)$.

- Prove that $integral g thin d\|nu\|= integral g thin d nu^(+) + integral g thin d nu^(-)$ for $g in L^(+)\(\|nu\|\)$ or $g in L^1\(\|nu\|\)$.

- Define $L^1\(nu\)= L^1\(nu^(+)\)inter L^1\(nu^(-)\)$. Prove that $L^1\(nu\)= L^1\(\|nu\|\)$.

- Define $integral f thin d nu = integral f thin d nu^(+) - integral f thin d nu^(-)$ for $f in L^1\(nu\)$.
  Prove that if $f in L^1\(nu\)$, then
  $ lr(|integral f thin d nu|) lt.eq integral\|f\|thin d\|nu\| $

- Suppose that $nu$ is a finite measure (i.e. $nu^plus.minus\(X\)< oo$\.) Prove that if $E in cal(A)$, then
  $ \|nu\|\(E\)= sup {lr(|integral_E f thin d nu|) divides parallel f parallel_oo lt.eq 1} . $

#proof[
#strong[of (i)]:
Take a Hahn decomposition $X = P union.sq N$. \ Then by Jordan decomposition, $ nu^(+)\(E\)= nu\(E inter P\)\,quad nu^(-)\(E\)= - nu\(E inter N\)\,quad forall E subset X $
and therefore $P$ is null set of $nu^(-)$ and $N$ is null set of $nu^(+)$. So on $P$, $\|nu\|= nu^(+) + nu^(-) = nu^(+)$\; on $N$, $\|nu\|= nu^(+) + nu^(-) = nu^(-)$
Thus, suppose $g in L^(+)\(\|nu\|\)$, $ integral g thin d\|nu\|= integral_X g thin d\|nu\| & = integral_P g thin d\|nu\|+ integral_N g thin d\|nu\|quad upright("since ") X = P union.sq N\
 & = integral_P g thin d nu^(+) + integral_N g thin d nu^(-) quad upright("since ")\|nu\|= nu^(+)\,nu^(-) upright(" on ") P\,N\
 & = integral g thin d nu^(+) + integral g thin d nu^(-) quad upright("since ") N\,P upright(" is null for ") nu^(+)\,nu^(-) $
Suppose $g in L^1\(\|nu\|\)$, then $ integral g thin d\|nu\|= integral_X g thin d\|nu\| & = integral_X g^(+) thin d\|nu\|- integral_X g^(-) thin d\|nu\|quad upright("by def")\
 & = \( integral_P g^(+) thin d nu^(+) + integral_N g^(+) thin d nu^(-) \) - \( integral_P g^(-) thin d nu^(+) + integral_N g^(-) thin d nu^(-) \) quad upright("since ") X = P union.sq N\
 & =\(integral_P g^(+) thin d nu^(+) - integral_P g^(-) thin d nu^(+) \) + \( integral_N g^(+) thin d nu^(-) - integral_N g^(-) thin d nu^(-) \)\
 & = integral_P g thin d nu^(+) + integral_N g thin d nu^(-) quad upright("since ") g in L^1\(\|nu\|\)\
 & = integral g thin d nu^(+) + integral g thin d nu^(-) quad upright("since ") N\,P upright(" is null for ") nu^(+)\,nu^(-) $
This finishes the proof.

]
#proof[
#strong[of (ii):]
WTS: $L^1\(nu^(+)\)inter L^1\(nu^(-)\)= L^1\(\|nu\|\)$. \ ($arrow.r.double$): Suppose $f in L^1\(\|nu\|\)$, i.e. $integral\|f\|thin d\|nu\|< oo$. \ Let $phi.alt$ be arbitrary positive-valued simple function: $ phi.alt = sum_(j = 1)^n a_j chi_(E_j) $
then $ integral phi.alt thin d\|nu\|= sum_(i = 1)^n a_j\|nu\|\(E_j\) $
Since $nu^(-)\(E_j\)\,nu^(+)\(E_j\)lt.eq nu^(+)\(E_j\)+ nu^(-)\(E_j\)=\|nu\|\(E_j\)$ for each $j$, we have $ integral phi.alt thin d nu^(+)\,integral phi.alt thin d nu^(-) lt.eq integral phi.alt thin d\|nu\| $
Since $phi.alt$ is arbitrary, we have
$ integral\|f\|thin d nu^(+) = sup { integral phi.alt thin d nu^(+) : 0 lt.eq phi.alt lt.eq\|f\|\,phi.alt upright(" simple") } lt.eq sup { integral phi.alt thin d\|nu\|: 0 lt.eq phi.alt lt.eq\|f\|\,phi.alt upright(" simple") } = integral\|f\|thin d\|nu\| $
Same for $nu^(-)$. This shows that $ integral\|f\|thin d nu^(+)\,integral\|f\|thin d nu^(-) lt.eq integral\|f\|thin d\|nu\|< oo $
i.e. $f in L^1\(nu^(+)\)$ and $f in L^1\(nu^(-)\)$, so $f in L^1\(nu^(+)\)inter L^1\(nu^(-)\)$. \ Thus $ L^1\(\|nu\|\)subset L^1\(nu^(+)\)inter L^1\(nu^(-)\) $
($arrow.l.double$): Suppose $f in L^1\(nu^(+)\)inter L^1\(nu^(-)\)$, i.e. $ integral\|f\|thin d nu^(+) < oo\,quad integral\|f\|thin d nu^(-) < oo $
Since $\|f\|$ is non-negative and measurable, we have $\|f\|in L^(+)\(\|nu\|\)$. Thus by (i) we have:
$ integral\|f\|thin d\|nu\|= integral\|f\|thin d nu^(+) + integral\|f\|thin d nu^(-) < oo $
So $f in L^1\(\|nu\|\)$. \ This shows that: $ L^1\(nu^(+)\)inter L^1\(nu^(-)\)subset L^1\(\|nu\|\) $
Combining both direction, we finished the proof that: $ L^1\(nu^(+)\)inter L^1\(nu^(-)\)= L^1\(\|nu\|\) $

]
#proof[
#strong[of (iii):]
Suppose $f in L^1\(nu\)$, then
$ lr(|integral f thin d nu|) & = lr(|integral f thin d nu^(+) - integral f thin d nu^(-)|) quad upright("by def")\
 & lt.eq lr(|integral f thin d nu^(+)|) + lr(|integral f thin d nu^(-)|) quad upright("by tri ineq")\
 & lt.eq integral\|f\|thin d nu^(+) + integral\|f\|thin d nu^(-) quad upright("by property of ") L^1 upright(" integration ")\
 & = integral\|f\|thin d\|nu\|quad upright(" from (i)") $
Therefore, $ lr(|integral f thin d nu|) lt.eq integral\|f\|thin d\|nu\| $

]
#proof[
#strong[of (iv):]
Suppose that $nu$ is a finite measure (i.e. $nu^plus.minus\(X\)< oo$), let $E in cal(A)$. \ We denote: $ S := sup {lr(|integral_E f thin d nu|) thin mid(bar.v) thin parallel f parallel_oo lt.eq 1} $
#strong[First we show $S lt.eq\|nu\|\(E\)$:] \ For any bounded measurable $f$ with $parallel f parallel_oo lt.eq 1$, $ lr(|integral_E f thin d nu|) & lt.eq integral_E\|f\|thin d\|nu\|quad upright("by (iii)")\
 & lt.eq integral_E 1 thin d\|nu\|quad upright("by linearity of integration")\
 & =\|nu\|\(E\) $
So by taking the supremum over such $f$, we get:
$ S lt.eq\|nu\|\(E\) $
#strong[Next we will show $\|nu\|\(E\)lt.eq S$:] \ We take a Hahn decomposition, getting $X = P union.sq N$ where $ nu^(+)\(B\)= nu\(P union B\)gt.eq 0\,nu^(-)\(B\)= - nu\(P union B\)lt.eq 0\,#h(0em) #h(0em) upright("for all ") B subset X $
Then
$ \|nu\|\(E\)= nu^(+)\(E\)+ nu^(-)\(E\)= nu\(E inter P\)- nu\(E inter N\) $
Now define:
$ f := chi_P - chi_N $
Then $f$ is measurable since $P\,N$ are measurable. And $parallel f parallel_oo lt.eq 1$ since $f\(x\)in { - 1\,1 } thin forall x in X$
Compute:
$ integral_E f thin d nu = integral_(E inter P) 1 thin d nu - integral_(E inter N) 1 thin d nu = nu\(E inter P\)- nu\(E inter N\)= nu^(+)\(E\)+ nu^(-)\(E\)=\|nu\|\(E\) $
Thus $ \|nu\|\(E\)= lr(|integral_E f thin d nu|) lt.eq S $
Combining both inequalities, we get: $ \|nu\|\(E\)= S $

]
#heading(level: 2, numbering: none)[finite signed measures on $\(X\,cal(A)\)$ 是一个 NVM]
<finite-signed-measures-on-xmathcala-是一个-nvm>
Let $\(X\,cal(A)\)$ be a measurable space.

- Let $lambda$, $mu$ be finite #emph[positive] measures on $\(X\,cal(A)\)$.
  Let $nu = lambda - mu$. Prove that $ nu^(+)\(E\)lt.eq lambda\(E\)\,#h(2em) nu^(-)\(E\)lt.eq mu\(E\)\,#h(2em)\|nu\|\(E\)lt.eq lambda\(E\)+ mu\(E\) $
  for every $E in cal(A)$.

- Let $nu$ and $kappa$ be finite #emph[signed] measures on $\(X\,cal(A)\)$ (i.e. $nu\(E\)\,kappa\(E\)in bb(R)$ for all $E in cal(A)$). Show that
  $ \|nu + kappa\|\(E\)lt.eq\|nu\|\(E\)+\|kappa\|\(E\) $
  for every $E in cal(A)$.

- Let $cal(M)$ be the collection of finite signed measure $nu$ on $\(X\,cal(A)\)$.
  For $nu in cal(M)$, define $ parallel nu parallel =\|nu\|\(X\) $
  Prove that $parallel dot.op parallel$ is a norm on $cal(M)$ with an appropriate definition of the sum of two signed measures and the multiplication of a signed measure by a (real) scalar.

- Suppose $\(X\,cal(A)\)=\(bb(R)\,cal(B)\(bb(R)\)\)$. Compute $parallel delta_x - delta_y parallel$ for $x\,y in bb(R)$.

#emph[Remark]: the norm on $cal(M)$ is called the #emph[the total variation norm].

#proof[
#strong[of (a):] \ Recall in problem 2 we get:
$ nu^(+)\(E\)= sup { nu\(F\): F subset E\,F in cal(A) }\,quad nu^(-)\(E\)= - inf { nu\(F\): F subset E\,F in cal(A) } $
#strong[Claim 1: $nu^(+)\(E\)lt.eq lambda\(E\)$.] \ Let $F subset E$, $F in cal(A)$. Then:
$ nu\(F\)= lambda\(F\)- mu\(F\)lt.eq lambda\(F\)lt.eq lambda\(E\) $
since $F subset E$ and $lambda$ is positive.
Taking the sup over all such $F$, we get
$ nu^(+)\(E\)= sup_(F subset E) nu\(F\)lt.eq lambda\(E\) $#strong[Claim 2: $nu^(-)\(E\)lt.eq mu\(E\)$.] \ Similarly as Claim 1, for any $F subset E$, since $lambda$ and $mu$ are p.m., we have
$ nu\(F\)= lambda\(F\)- mu\(F\)gt.eq - mu\(F\)gt.eq - mu\(E\)arrow.r.double.long - nu\(F\)lt.eq mu\(E\) $
Taking the inf over $F subset E$, we get
$ nu^(-)\(E\)= - inf_(F subset E) nu\(F\)lt.eq mu\(E\) $
#strong[Claim 3: $\|nu\|\(E\)lt.eq lambda\(E\)+ mu\(E\)$.] \ This is just combining the two ineqs: $ \|nu\|\(E\)= nu^(+)\(E\)+ nu^(-)\(E\)lt.eq lambda\(E\)+ mu\(E\) $

]
#proof[
#strong[of (b):] \ Let $E in cal(A)$. WTS: $\|nu + kappa\|\(E\)lt.eq\|nu\|\(E\)+\|kappa\|\(E\)$. \ Recall in problem 2 we showed that for a signed measure $sigma$ and a measurable set $E$ , we have:
$ \|sigma\|\(E\)= sup {sum_(i = 1)^n \| sigma \( E_i \) \| : E = union.sq.big_(i = 1)^N E_i} $
Let ${ E_i }_(i = 1)^n$ be any finite measurable partition of $E$. Then for each $E_i$:
$ \|\(nu + kappa\)\(E_i\)\|=\|nu\(E_i\)+ kappa\(E_i\)\|lt.eq\|nu\(E_i\)\|+\|kappa\(E_i\)\|quad upright("(by tri ineq on ") bb(R) upright(")") $
Summing over the partition, we have:$ sum_(i = 1)^n\|\(nu + kappa\)\(E_i\)\|lt.eq sum_(i = 1)^n\|nu\(E_i\)\|+ sum_(i = 1)^n\|kappa\(E_i\)\| $
Now take the supremum over all such partitions of $E$:
$ \|nu + kappa\|\(E\) & = sup {sum_(i = 1)^n \| \( nu + kappa \) \( E_i \) \| : E = union.sq.big_(i = 1)^N E_i}\
 & lt.eq sup {sum_(i = 1)^n \| nu \( E_i \) \| + sum_(i = 1)^n \| kappa \( E_i \) \| : E = union.sq.big_(i = 1)^N E_i}\
 & lt.eq sup {sum_(i = 1)^n \| nu \( E_i \) \| : E = union.sq.big_(i = 1)^N E_i} + sup {sum_(i = 1)^n \| kappa \( E_i \) \| : E = union.sq.big_(i = 1)^N E_i}\
 & =\|nu\|\(E\)+\|kappa\|\(E\) $
Since measurable $E$ is arbitrary, this finishes the proof.

]
#proof[
#strong[of (c)]:
$ cal(M) : = { upright("all finite signed measures on ")\(X\,cal(A)\)} $
and for $nu in cal(M)$, we define: $ parallel nu parallel :=\|nu\|\(X\) $
WTS: $parallel dot.op parallel$ is a norm on $cal(M)$. \

+ #strong[Positive Definiteness]: \ Let $nu in cal(M)$. Since $\|nu\|$ is a positive measure, $parallel nu parallel =\|nu\|\(X\)gt.eq 0$. \ Since $\|nu\|$ is a positive measure, $parallel nu parallel =\|nu\|\(X\)gt.eq 0$. \ Suppose $\|nu\|\(X\)= 0$, then $X$ is a $\|nu\|$-null set, so $\|nu\|\(E\)= 0$ for all $E in cal(A)$. Thus $nu = 0$. \ And suppose $nu = 0$, then $\|nu\|= 0$ also, so $\|nu\|\(X\)= 0$. \ Thus, $parallel nu parallel = 0$ iff $nu = 0$. This finishes the proof of positive definiteness.

+ #strong[Absolute Homogeneity]: \ Since for any measurable set $E$:
  $ \|a nu\|\(E\) & = sup {sum_(i = 1)^n \| \( a nu \) \( E_i \) \| : E = union.sq.big_(i = 1)^N E_i}\
   & = sup {sum_(i = 1)^n \| a \| \| nu \( E_i \) \| : E = union.sq.big_(i = 1)^N E_i}\
   & =\|a\|sup {sum_(i = 1)^n \| nu \( E_i \) \| : E = union.sq.big_(i = 1)^N E_i}\
   & =\|a\|dot.op\|nu\|\(E\) $
  We have: $ parallel a nu parallel =\|a nu\|\(X\)=\|a\|dot.op\|nu\|\(X\)=\|a\|dot.op parallel nu parallel $
  finishing the proof of absolute homogeneity.

+ #strong[Triangle Inequality]: \ Recall we just proved in (b) that for any measurable $E$:$ \|nu + kappa\|\(E\)lt.eq\|nu\|\(E\)+\|kappa\|\(E\) $Thus $ parallel nu + kappa parallel =\|nu + kappa\|\(X\)lt.eq\|nu\|\(X\)+\|kappa\|\(X\)= parallel nu parallel + parallel kappa parallel $
  finishing the proof of triangle inequality. \

So we can conclude that $parallel nu parallel :=\|nu\|\(X\)upright(" defines a norm on ") cal(M)$, with the standard definitions of addition and scalar multiplication of signed measures.

]
#proof[
#strong[of (d)] \ Suppose $\(X\,cal(A)\)=\(bb(R)\,cal(B)\(bb(R)\)\)$. Compute $parallel delta_x - delta_y parallel$ for $x\,y in bb(R)$.

Recall def: For any Borel set $A subset bb(R)$, $ delta_x\(A\)= cases(delim: "{", 1 & upright("if ") x in A, 0 & upright("otherwise")) $
So we define the signed measure $nu := delta_x - delta_y$ as:
$ nu\(A\)= delta_x\(A\)- delta_y\(A\) $
If $x = y$, then $delta_x = delta_y$, then $nu = 0$, so $parallel nu parallel = 0$. This is the trivial case.
if $x eq.not y$: We first compute the Jordan decomposition. \ We know that $nu^(+)\(E\)= sup { nu\(F\)divides : F in cal(A)\,F subset E }$, and $nu^(-)\(E\)= - inf { nu\(F\)divides F in cal(A)\,F subset E }$.
For any $E in.rev x$, we have $ nu^(+)\(E\)= nu\({ x }\)= 1 $
In other cases, we have: $ nu^(+)\(E\)= nu\(E\\{ y }\)= 0 $
For any $E in.rev y$, we have $ nu^(-)\(y\)= - nu\({ y }\)= 1 $
In other cases, we have: $ nu^(-)\(E\)= - nu\(E\\{ x }\)= 0 $
And we thus discover that: $ nu^(+) = delta_x\,quad nu^(-) = delta_y $
So $ parallel nu parallel =\|nu\|\(bb(R)\)= delta_x\(bb(R)\)+ delta_y\(bb(R)\)= 1 + 1 = 2 $
Thus we can conclude that $ parallel nu parallel = cases(delim: "{", 2 & upright("if ") x eq.not y, 0 & upright("otherwise")) $

]
#heading(level: 2, numbering: none)[and more: finite signed measures on $\(X\,cal(A)\)$ 组成一个 real Banach space]
<and-more-finite-signed-measures-on-xmathcala-组成一个-real-banach-space>
Prove that the normed vector space $cal(M)$ in the previous problem is in fact a Banach space.

#proof[
In problem 4 we have shown that on $\(cal(M)\,parallel dot.op parallel\)$ is a normed vector space, where $ cal(M) : = { upright("all finite signed measures on ")\(X\,cal(A)\)} $
and $ parallel nu parallel :=\|nu\|\(X\) $
Now we prove that the NVM $\(cal(M)\,parallel dot.op parallel\)$ is complete, i.e. it is a Banach space. \ Let $\(nu_n\)$ be a Cauchy sequence in $cal(M)$. We have
$ \|nu_n\(B\)- nu_m\(B\)\|=\|\(nu_n - nu_m\)\(B\)\|lt.eq parallel nu_n - nu_m parallel quad upright("for all ") B in cal(A) $
In particular, $\(nu_n\(B\)\)_n$ is a Cauchy sequence for all $B in cal(A)$. For each $B in cal(A)$, this is a Cauchy seq in $bb(R)$, thus converges. So we can get: $ nu\(B\):= lim_n nu_n\(B\) $
as the pointwise limit (by a point we mean a set). \ #strong[Claim 1: $nu in cal(M)$]. \ Since for all $n$, $nu_n\(diameter\)= 0$, we have:
$ nu\(diameter\):= lim_n nu_n\(diameter\)= 0 $
For a countable disjoint union of measurable sets $E = union.sq.big_(i = 1)^oo E_i$, $ lim_n nu_n\(E\)= lim_n sum_i nu_n\(E_i\) $is the limit of a finite sum of numerical sequences in $bb(R)$. So we can exchange the order of taking limit and sum. Then we get: $ nu\(E\)= lim_n nu_n\(E\)= lim_n sum_i nu_n\(E_i\)= sum_i lim_n nu_n\(E_i\)= sum_i nu\(E_i\) $
And notice, for each measurable set $B in cal(A)$, #strong[since $\(nu_n\(B\)\)_n$ is a Cauchy sequence in $bb(R)$, it is bounded], thus does not admit $oo\,- oo$ values. verifying that $nu$ #strong[is a valid signed measure.] \ Also, this means that taking Hahn Decomposition $X = P union.sq N$ by $nu$, we have $ nu^(+)\(X\)= nu\(P\)\,quad nu^(-)\(X\)= - nu\(N\) $
Since $nu\(P\)\,nu\(N\)$ are bounded, we have:
Thus $ \|nu\|\(X\)= nu^(+)\(X\)+ nu^(-)\(X\)< oo $
This verifies that $nu$ is a finite s.m. \ #strong[Claim 2: $nu_n arrow.r nu$ in $parallel dot.op parallel$.]
Fix $epsilon > 0$. There exists $N$ such that $parallel nu_n - nu_m parallel < epsilon\/2$ for all $m\,n gt.eq N$. Thus for all $n gt.eq N$ we have:
$ \|\(nu_n - nu\)\(B\)\|= lim_m\|\(nu_n - nu_m\)\(B\)\|lt.eq epsilon\/2\,quad forall B in cal(A)\,med forall n gt.eq N $Notice that
$ nu^(+)\(B\)= sup { nu\(C\)divides C in cal(A)\,med C subset B } quad $and $ nu^(-)\(B\)= - inf { nu\(C\)divides C in cal(A)\,med C subset B } = sup { - nu\(C\)divides C in cal(A)\,med C subset B } $
It follows that
$ \(nu_n - nu\)^(+)\(X\)= sup {\(nu_n - nu\)\(B\)divides B in cal(A) } lt.eq epsilon\/2\,quad forall n gt.eq N $
Similarly,
$ \(nu_n - nu\)^(-)\(X\)= sup { -\(nu_n - nu\)\(B\)divides B in cal(A) } lt.eq epsilon\/2\,quad forall n gt.eq N $
Thus $ \|nu_n - nu\|\(X\)=\(nu_n - nu\)^(+)\(X\)+\(nu_n - nu\)^(-)\(X\)lt.eq epsilon $
This holds for all $n gt.eq N$. And since $epsilon > 0$ is arbitrary, this proves that $ lim_(n arrow.r oo) parallel nu_n - nu parallel = 0 $
As a result, $nu_n arrow.r nu$ in $parallel dot.op parallel$, completeing the proof.

]
#emph[Nur für Verrückte]

\(It's #strong[really] not necessary to attempt these problems. Do not, under any circumstances, hand them in!)
Does there exist a signed Borel measure $nu$ on $bb(R)$ with the property that for every $alpha in bb(R)$ there exists a Borel set $E subset bb(R)$ with $nu\(E\)= alpha$.
