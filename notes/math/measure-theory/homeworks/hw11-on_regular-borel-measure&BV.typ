#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 11: on regular Borel measure and functions of bounded variation (36/40)]
<homework-11-on-regular-borel-measure-and-functions-of-bounded-variation-3640>
#heading(level: 2, numbering: none)[Measurability of densities of measures]
<measurability-of-densities-of-measures>
Suppose $mu$ is a regular (positive) Borel measure on $bb(R)^n$.

- Prove that the functions $accent(f, macron) : bb(R)^n arrow.r\[0\,+ oo\]$ and $attach(limits(f), b: macron) : bb(R)^n arrow.r\[0\,+ oo\]$ defined by $ accent(f, macron)\(x\):= limsup_(r arrow.r 0 +) frac(mu\(B\(x\,r\)\), m\(B\(x\,r\)\))\,quad upright("and") quad attach(limits(f), b: macron)\(x\):= liminf_(r arrow.r 0 +) frac(mu\(B\(x\,r\)\), m\(B\(x\,r\)\)) $
  where $m$ denotes Lebesgue measure, are Borel measurable.

- Prove that the set $ A = { x in bb(R)^n divides med upright("the limit ") lim_(r arrow.r 0 +) frac(mu\(B\(x\,r\)\), m\(B\(x\,r\)\)) upright(" exists in ")\[0\,+ oo\]upright(")") } $ is Borel measurable.

- Give an example where $A eq.not bb(R)^n$.

#emph[Hint]: we are taking the limsup over an uncountable set, so you probably need to use some properties of the functions $r mapsto mu\(B\(x\,r\)\)$ and $r mapsto m\(B\(x\,r\)\)$, in addition to properties of $x mapsto mu\(B\(x\,r\)\)$ and $x mapsto m\(B\(x\,r\)\)$.

#proof[
#strong[of (a):]
We prove a lemma:

#lemma(
)[
For regular positive Borel measure $mu$ on $bb(R)^n$, fixing $r > 0$, $x mapsto mu\(B\(x\,r\)\)$ is Borel measurable.

]
#strong[Proof of Lemma:] We recall $ mu\(B\(x\,r\)\)= integral chi_(B\(x\,r\)) thin d mu = integral chi_(B\(x\,r\))\(y\)thin d mu\(y\) $
We define $ f\(x\,y\)= chi_(B\(x\,r\))\(y\) $
which is a function from $bb(R)^n times bb(R)^n arrow.r bb(R)$, and takes value between $0$ and $1$. \ Thus for $a gt.eq 1$, $ f^(- 1)\(\(a\,oo\)\)= diameter in cal(B)\(bb(R)^n\)times.o cal(B)\(bb(R)^n\) $
for $a < 0$, $ f^(- 1)\(\(a\,oo\)\)= f^(- 1)\({ 0\,1 }\)= bb(R)^n times bb(R)^n in cal(B)\(bb(R)^n\)times.o cal(B)\(bb(R)^n\) $
For $0 lt.eq a < 1$, $f^(- 1)\(\(a\,oo\)\)= f^(- 1)\({ 1 }\)$. Note this set is: $ f^(- 1)\(\(a\,oo\)\)= {\( x \, y \) in bb(R)^n times bb(R)^n : y in B \( x \, r \)} = {\(x\,y\)in bb(R)^n times bb(R)^n : parallel x - y parallel < r } $
Since $g :\(x\,y\)mapsto parallel x - y parallel_2$ is continuous function, and $ f^(- 1)\(\(a\,oo\)\)= {\(x\,y\)in bb(R)^n times bb(R)^n : parallel x - y parallel < r } = g^(- 1)\(r\) $
is open, since it is preimage of an open set, under a continuous function. \ Thus $ f^(- 1)\(\(a\,oo\)\)in cal(B)\(bb(R)^(2 n)\)= cal(B)\(bb(R)^n\)times.o cal(B)\(bb(R)^n\) $
Thus $f$ is Borel measurable function, and since it is nonnegative, $f in L^(+)\(bb(R)^(2 n)\)$, thus by #strong[Tonelli's Theorem], $ x mapsto integral f_x\(y\)thin d mu\(y\)= mu\(B\(x\,r\)\)quad upright(" is Borel measurable") $finishing the proof of Lemma. \ Define for $r > 0$ $ f_r\(x\):= frac(mu\(B (x \, r)\), m\(B (x \, r)\)) $
Notice that for each $r$, $m\(B\(x\,r\)\)= c_n r^n > 0$ is constant regardless of $x$, so #strong[$f_k$ is Borel measurable] as a product of a Boreal measurable function and a constant. \ ~So $ macron(f)\(x\)= limsup_(r arrow.r 0^(+)) f_r\(x\)= lim_(epsilon.alt > 0) sup_(0 < r < epsilon.alt) f_r\(x\) $
For fixed $epsilon.alt > 0$, we define $h_epsilon.alt\(x\): = sup_(0 < r < epsilon.alt) f_r\(x\)$, then for $a in bb(R)$, we have $ h_epsilon.alt\(\(a\,oo\)\)= union.big_(0 < r < epsilon.alt) f_r\(\(a\,oo\)\)= union.big_(0 < r < epsilon.alt\,r in bb(Q)) f_r\(\(a\,oo\)\) $is Bore measurable, Thus $h_epsilon.alt$ is a Borel measurable function, then $ macron(f) = lim_(epsilon.alt > 0) h_epsilon.alt = lim_(n arrow.r oo) h_(1 / n) $is a Borel measurable function as limit of a seq of Borel measurable functions.
这里注意: Reducing limup (or liminf) over an uncountable sets to a countable one requires upper/lower semicontinuity. 因而我们需要说明一下 $f_r$ 是 right ctn in r 的.
Same trick is applied to $attach(limits(f), b: macron)$. We set $g_epsilon.alt\(x\): = inf_(0 < r < epsilon.alt) f_r\(x\)$ and have $attach(limits(f), b: macron)\(x\)= lim_(n arrow.r oo) g_(1 / n)$ is Borel measurable, finishing the proof.

]
#proof[
#strong[of (b):] $ A & := { x in bb(R)^n : upright("the limit ") lim_(r arrow.r 0 +) frac(mu\(B\(x\,r\)\), m\(B\(x\,r\)\)) upright(" exists in ")\[0\,+ oo\]upright(")") }\
 & = { x in bb(R)^n : macron(f)\(x\)= attach(limits(f), b: macron)\(x\)} $
Notice:

#lemma(
)[
if $\(X\,cal(A)\)$ is a measurable space; $f\,g : X arrow.r bb(R)$ are $\(cal(A)\,cal(B)\(bb(R)\)\)$ -measurable functions, then $ F\(x\):=\(f\(x\)\,g\(x\)\): X arrow.r bb(R)^2 $is a $\(cal(A)\,cal(B)\(bb(R)^2\)\)$-measurable function.

]
Proof of Lemma: We have shown in hw8 that, $f$ is an product measurable function if $f^(- 1) (B_1 times B_2)$ is measurable for each measurable rectangle $B_1 times B_2$. \ And for measurable rectangle $U times V subset bb(R)^2$, we have:
$ F^(- 1)\(U times V\)= f^(- 1)\(U\)inter g^(- 1)\(V\)in cal(A) $
proving the lemma. \ And back to the original statement, we define: $ F\(x\)=\(macron(f)\(x\)\,attach(limits(f), b: macron)\(x\)\) $
Then we notice that $ A = { x in bb(R)^n : macron(f)\(x\)= attach(limits(f), b: macron)\(x\)} = F^(- 1)\({\(x\,x\)\|x in bb(R) }\) $
Since the diagonal ${\(x\,x\)\|x in bb(R) }$ is a closed set, it is a Borel set. And by lemma, $F$ is a Borel measurable function, implying that $A$ is Borel measurable.

]
#example(
)[
#strong[of (c):]
Consider $ I : = { 0 } union union.big_(j = 0)^oo\[2 / 3 dot.op 1 / 2^j\,1 / 2^j\] $
Set $ g : = chi_I\,quad mu\(E\): = integral_E g thin d m $
Then we look at $x = 0$, we have: $ frac(mu\(B\(0\,r\)\), m\(B\(0\,r\)\)) = frac(m\(B\(0\,r\)inter I\), m\(B\(0\,r\)\)) $
So $ lim_(r arrow.r 0^(+)) frac(mu\(B\(0\,r\)\), m\(B\(0\,r\)\)) = lim_(r arrow.r 0^(+)) frac(m\(I inter B\(x\,r\)\), m\(B\(x\,r\)\)) $ is exactly the density of $I$ at $0$, and we have shown in class that this limit does not exist, in the sense that its limsup is not equal to its liminf, i.e. $ limsup_(r arrow.r 0 +) frac(m\(I inter B\(x\,r\)\), m\(B\(x\,r\)\)) = : accent(f, macron)\(x\)eq.not attach(limits(f), b: macron)\(x\):= liminf_(r arrow.r 0 +) frac(m\(I inter B\(x\,r\)\), m\(B\(x\,r\)\)) $
Here we explain it in detailed:

#figure(image("../assets/ch3-pics-image-20250316223122736.png", width: 40.0%),
  caption: [
  ]
)

If we take $r_k = 1 / 2^k$ for $k in bb(N)$, we have:

$ B (0 \, r_k) = (- r_k \, r_k) = (- 1 / 2^k \, 1 / 2^k) $
Then for each $k$, $ m\(I inter B\(0\,r_k\)= sum_(j = k)^oo 1 / 3 dot.op 1 / 2^j = 1 / 3 dot.op sum_(j = k)^oo 1 / 2^j = 1 / 3 dot.op 1 / 2^(k - 1)\,quad m\(B (0 \, r_k)\)= 2 r_k = 2 / 2^k $
So for each $k$, $ frac(mu\(B\(0\,r_k\)\), m\(B\(0\,r_k\)\)) = 1 / 3 $
so we have: $ accent(f, macron)\(0\)gt.eq 1 / 3 $
But if we take $r_k = 2 / 3 dot.op 1 / 2^k$, then for each $k$, $ m\(I inter B\(0\,r_k\)\)= sum_(j = k + 1)^oo 1 / 3 dot.op 1 / 2^j = 1 / 3 dot.op sum_(j = k + 1)^oo 1 / 2^j = 1 / 3 dot.op 1 / 2^k\,quad m\(B (0 \, r_k)\)= 2 r_k = 2 / 2^k $
So for each $k$, $ frac(mu\(B\(0\,r_k\)\), m\(B\(0\,r_k\)\)) = 1 / 6 $
so we have: $ attach(limits(f), b: macron)\(0\)lt.eq 1 / 6 $
Proving that $ accent(f, macron)\(0\)eq.not attach(limits(f), b: macron)\(0\) $
This serves as an counterexample of $A eq.not bb(R)^n$ ($n = 1$ here)

]
#heading(level: 2, numbering: none)[Lebesgue decomposition $nu = lambda + rho arrow.r.double.long\|nu\|=\|lambda\|+\|rho\|$]
<lebesgue-decomposition-nulambdarhoimplies-nulambdarho>
- Let $nu$ be a regular complex or finite signed Borel measure on $bb(R)^n$, and let $nu = lambda + rho$ be its Lebesgue decomposition with respect to Lebesgue measure $m$, so that $lambda perp m$ and $rho lt.double m$. Prove that the Lebesgue decomposition of the total variation measure $\|nu\|$ with respect to $m$ is given by $\|nu\|=\|lambda\|+\|rho\|$. In other words, prove that $\|nu\|=\|lambda\|+\|rho\|$, $\|lambda\|perp m$, and $\|rho\|lt.double m$.

- Let $mu_1$ and $mu_2$ be positive, mutually singular Borel measures on $bb(R)^n$. Prove that $mu_1 + mu_2$ is regular iff $mu_1$ and $mu_2$ are both regular.

#emph[Remark]: these results were used the the proof of Theorem 3.22 in Folland. Please don't use any results from~§7.

#proof[
#strong[of (a):]
Recall that for two complex measures $lambda\,rho$, we define they are mutually singular if: $ lambda perp rho quad arrow.l.r.double quad lambda_r perp rho_r\,quad lambda_r perp rho_i\,quad lambda_i perp rho_r\,quad lambda_i perp rho_i $
We first show an equivalent form of it, for further use. \

#lemma(
)[
For two complex measures $lambda\,rho$ $ lambda perp rho quad arrow.l.r.double quad exists A in cal(A) #h(0em) upright(" s.t. ") #h(0em)\|lambda\|\(A^c\)= 0 upright(" and ")\|rho\|\(A\)= 0 quad arrow.l.r.double quad\|lambda\|perp\|rho\| $

]
#strong[Proof of the lemma:] The second equivalence follows from definition (since total variation measure is positive), and the backward direction of the first equivalence follows from that the null set of the total variation measure is also the null set for original complex measure (thus null set for the positive and imaginary part). \ For the forward direction of the first equivalence, $ lambda_a perp rho_b & arrow.r.double.long exists A_(a b) in cal(A) : A_(a b) upright(" is null set for ") rho_b upright(" and ") A_(a b)^c upright(" is null set for ") lambda_a\
 & arrow.r.double.long exists A_(a b) in cal(A) :\|lambda_a\|(A_(a b)^c) = 0\,\|rho_b\|(A_(a b)) = 0\
 $
Define: $ A := \( A_(r r) inter A_(r i) \) union.big \( A_(i r) inter A_(i i) \) in cal(A) $
Since $A_(r r) inter A_(r i)$ is a null set for $rho_r\,rho_i$, thus a null set for $\|rho\|$. And $\(A_(r r) inter A_(r i)\)^c= A_(r r)^c union A_(r i)^c$. Since these two are both null set for $lambda_r$ and union of null sets is null set, $\(A_(r r) inter A_(r i)\)^c$ is also a null set for $lambda_r$. \ Similarly, $A_(i r) inter A_(i i)$ is a null set for $\|rho\|$ and $\(A_(i r) inter A_(i i)\)^c$ is a null set for $lambda_i$. \ Thus, $A$ is a null set for $\|rho\|$, and $A^c = \( A_(r r) inter A_(r i) \)^c inter.big \( A_(i r) inter A_(i i) \)^c$ is a null set for both $lambda_r$
and $lambda_i$, thus a null set for $lambda$. \ This finishes the construction of $A$, proving our lemma. Now we can apply the equivalent conditions of $lambda perp rho$ for positive, signed and complex measures. \ Now we prove this statement which immediately implies what we want:

#proposition(
)[
If complex measure $lambda$ and $rho$ on the same measurable space are mutually singular, then $ \|lambda + rho\|=\|lambda\|+\|rho\| $

]
#strong[Proof of Proposition:] Since $lambda perp rho$, there exists a measurable set $A subset.eq X$ such that:
$ \|lambda\|(A^c) = 0 quad upright(" and ") quad\|rho\|\(A\)= 0 $
Let $nu := lambda + rho$. Let $E in cal(A)$.

Then
$ \|nu\|\(E\)=\|nu\|\(\(E inter A\)union.sq\(E inter A^c\)\) & =\|nu\|\(E inter A\)+\|nu\|\(E inter A^c\)\
 & =\|lambda + rho\|\(E inter A\)+\|lambda + rho\|\(E inter A^c\)\
 & =\|lambda\|\(E inter A\)+\|rho\|\(E inter A^c\)quad & upright("since ") lambda = 0 upright(" on ") A^c upright(" and ") rho = 0 upright(" on ") A\
 & =\|lambda\|\(E\)+\|rho\|\(E\)quad & upright("since ")\|lambda\|upright(" is ") 0 upright(" on ") E inter A^c upright(", ")\|rho\|upright(" is ") 0 upright(" on ") E inter A $
finishing the proof the the proposition. \ Now we look back at the original statement: For Lebesgue decomposition $nu = lambda + rho$, we have $lambda perp m$ and $rho lt.double m$.
$lambda perp m$ implies that there exists a measurable set $A subset.eq X$ such that:
$ \|lambda\|\(A^c\)= 0 quad upright(" and ") quad m\(A\)= 0 $
Since $rho lt.double m$, null sets of $m$ are also null sets of $rho$, thus $\|rho\|\(A\)= 0$. Thus we have $ lambda perp rho $
By our just proved proposition we have: $ \|nu\|=\|lambda + rho\|=\|lambda\|+\|rho\| $And it also follows from our lemma that $ lambda perp m arrow.r.double.long\|lambda\|perp m $
and $\|rho\|lt.double m$ is trivial, since $\|rho\|$ and $rho$ have the same null sets. \ This finishes the proof that: #strong[if Lebesgue decomposition of $nu$ is $nu = lambda + rho$, then Lebesgue decomposition of the total variation measure $\|nu\|$ with respect to $m$ is given by $\|nu\|=\|lambda\|+\|rho\|$.]

]
#proof[
#strong[of (b):]
#strong[First we show ($arrow.r.double.long$:) if $mu_1$ and $mu_2$ are both regular then $mu_1 + mu_2$ is regular.] \ Let $A$ be a Borel set. Since $mu_1$ and $mu_2$ are regular, we have:
$ mu_1\(A\)= inf_(A subset U) mu_1\(U\)= sup_(K subset A) mu_1\(K\)\,quad mu_2\(A\)= inf_(A subset U) mu_2\(U\)= sup_(K subset A) mu_2\(K\) $
Set $mu = mu_1 + mu_2$, then
$ mu\(A\)= inf_(A subset U)\(mu\(U\)\)= inf_(A subset U)\(mu_1\(U\)+ mu_2\(U\)\)gt.eq inf_(A subset U) mu_1\(U\)+ inf_(A subset U) mu_2\(U\)= mu_1\(A\)+ mu_2\(A\) $
Also on the other direction, $ mu\(A\)= sup_(K subset A)\(mu\(K\)\)= sup_(K subset A) mu_1\(K\)+ mu_2\(K\)\)lt.eq sup_(K subset A) mu_1\(K\)+ sup_(K subset A) mu_2\(K\)= mu_1\(A\)+ mu_2\(A\) $
Combining these two ineq chains, all inequalities is indeed equality. Thus we have $ mu\(A\)= inf_(A subset U)\(mu\(U\)\)= sup_(K subset A)\(mu\(K\)\)= mu_1\(A\)+ mu_2\(A\) $
The first two equalities shows regularities, and the last equality shows finiteness. This finishes the proof of forward direction. \ #strong[Next we show: ($arrow.l.double.long$:) if $mu_1 + mu_2$ is regular then $mu_1$ and $mu_2$ are both regular.] \ Let $A$ be a Borel set. \ First, suppose $A$ is compact. Then $\(mu_1 + mu_2\)\(K\)< oo$. Notice, since $mu_1\,mu_2$ are positive measures, $mu_1 + mu_2 gt.eq mu_1\,mu_2$, thus we sure have$ mu_1\(A\)\,mu_2\(A\)< oo $This shows the #strong[local finiteness] of $mu_1\,mu_2$. It #strong[remains to show the outer regularity] of $mu_1\,mu_2$. (Note: local finiteness $arrow.r.double.long$ outer regularity is reached using tools in Ch7, so we still need to show outer regularity here; for local finiteness + outer regularity $arrow.r.double.long$ inner regularity, it have similar steps as Thm 1.18, so it is done.) \ Since $mu_1 perp mu_2$, there exists measurable $E subset bb(R)^n$ s.t. $ E upright(" null for ") mu_1\,quad E^c upright(" null for ") mu_2 $
By outer regularity of $mu_1 + mu_2$, we can construct a seq of open sets $U_k supset A$ s.t. $ \(mu_1 + mu_2\)\(U_k\)<\(mu_1 + mu_2\)\(A\)+ 1 / 2^k $
Thus we have $ lim_(k arrow.r oo)\(mu_1 + mu_2\)\(U_k\)=\(mu_1 + mu_2\)\(A\) $
And notice that, for each $k$,
$ \(mu_1 + mu_2\)\(U_k\) & =\(mu_1 + mu_2\)\(U_k inter E\)+\(mu_1 + mu_2\)\(U_k inter E^c\)\
 & = mu_1\(U_k inter E^c\)+ mu_2\(U_k inter E\) & upright("since ") E upright(" null for ") mu_1\,#h(0em) E^c upright(" null for ") mu_2\
 $

And for $A$, similarly we have:$ \(mu_1 + mu_2\)\(A\)= mu_1\(A inter E^c\)+ mu_2\(A inter E\) $
Since $U_k supset A$, we have $U_k inter E supset A inter E$, thus $mu_1\(U_k inter E^c\)gt.eq mu_1\(A inter E^c\)$, and similarly $mu_2\(U_k inter E\)gt.eq mu_2\(A inter E\)$. \ Thus
$  & quad\(mu_2 + mu_2\)\(U_k\)-\(mu_2 + mu_2\)\(A\)\
 & = mu_1\(U_k inter E^c\)+ mu_2\(U_k inter E\)-\(mu_1\(A inter E^c\)+ mu_2\(A inter E\)\)\
 & = mu_1\(U_k inter E^c\)- mu_1\(A inter E^c\)+\(mu_2\(U_k inter E\)- mu_2\(A inter E\)\)\
 & gt.eq mu_1\(U_k inter E^c\)- mu_1\(A inter E^c\) & upright("(since ") mu_2\(U_k inter E\)- mu_2\(A inter E\)gt.eq 0 upright(")")\
 & = mu_1\(U_k inter E^c\)+ mu_1\(U_k inter E\)- mu_1\(A inter E^c\)- mu_1\(A inter E\) & upright("(since ") mu_1\(U_k inter E\)\,mu_2\(A inter E\)= 0 upright(")")\
 & = mu_1\(U_k\)- mu_1\(A\)gt.eq 0 $
Therefore $ \(mu_1 + mu_2\)\(U_k\)arrow.br^(k arrow.r oo)\(mu_1 + mu_2\)\(A\)arrow.r.double.long mu_1\(U_k\)arrow.br^(k arrow.r oo) mu_1\(A\) $
Since $U_k supset A$ for each $k$, this shows the outer regularity:$ mu_1\(A\)= inf_(U upright(" open ") supset A) mu_1\(U\) $
And dually, through exact same steps we can get: $ mu_2\(U_k\)arrow.br^(k arrow.r oo) mu_2\(A\)\,quad mu_2\(A\)= inf_(U upright(" open ") supset A) mu_2\(U\) $
finishing the proof.

]
#heading(level: 2, numbering: none)[A convergence problem]
<a-convergence-problem>
Let $f in L^1\(bb(R)\)$. For $n in bb(N)$, define $f_n : bb(R) arrow.r bb(R)$ as follows. For $k in bb(Z)$ and $x in\[k / n\,frac(k + 1, n)\)$, set $ f_n\(x\):= n integral_(k / n)^(frac(k + 1, n)) f\(t\)thin d t $

- Prove that $f_n arrow.r f$ a.e.

- Prove that $f_n arrow.r f$ in $L^1$.

#emph[Hint]: for (a), use the Lebesgue differentiability theorem; for (b) you may want to approximate $f$ by a nice function.

#proof[
#strong[of (a):]

#figure(image("../assets/hw11-image-20250411124145014.png", width: 30.0%),
  caption: [
  ]
)

$ f_n\(x\)= n integral_(k / n)^(frac(k + 1, n)) f\(t\)thin d t = frac(1, 1\/n) integral_(I_(n\,k)) f\(t\)thin d t = frac(1, m\(I_(n\,k)\)) integral_(I_(n\,k)) f\(t\)thin d t $
Thus $f_n\(x\)$ is the average of $f$ over the interval $I_(n\,k) := lr([k / n \, frac(k + 1, n)))$, where $x in I_(n\,k)$. \ Fixing $x in bb(R)$, for each $n$ we set $E_n\(x\):= I_(n\,k)$ for $I_(n\,k)$ s.t. $x in I_(n\,k)$. Notice that for each $n$,$ union.sq.big_k I_(n\,k) = bb(R) $so this $E_n$ is well-defined. \ And for each $E_n$, we have $ E_n\(x\)= lr([k / n \, frac(k + 1, n))) subset (x - 2 / n \, x + 2 / n) = B \( x\,2 / n \) $
And $ m\(E_n\(x\)\)= 1 / n = 1 / 4 m \( B \( x\,2 / n \) \) $
This shows that #strong[$E_n\(x\)$ nicely shrinks to $x$ as $n arrow.r oo$.] Then by LDT, we have $ lim_(n arrow.r oo) f_n\(x\)= lim_(n arrow.r oo) frac(1, m\(E_n\(x\)\)) integral_(E_n\(x\)) f\(t\)thin d t = f\(x\) $ for $m$-a.e. $x$. \ This finishes the proof.

]
#proof[
#strong[of (b):]
WTS:
$ lim_(n arrow.r oo) parallel f_n - f parallel_1 = integral\|f_n\(x\)- f\(x\)\|thin d x = 0 $
Since $f in L^1\(bb(R)\)$, we can select $phi.alt in C_c^0\(bb(R)\)$ a ctn compactly supported function (e.g., can take bump function) such that
$ parallel f - phi.alt parallel_1 < epsilon\/3 $
Now define $phi.alt_n$ by averaging $phi.alt$ over the same intervals:
$ phi.alt_n\(x\):= n integral_(k\/n)^(\(k + 1\)\/n) phi.alt\(t\)thin d t = frac(1, m\(I_(n\,k)\)) integral_(I_(n\,k)) phi.alt\(t\)thin d t quad upright(" , for ") x in lr([k / n \, frac(k + 1, n))) $
Then by tri eq on $L^1\(m\)$,
$ parallel f_n - f parallel_1 lt.eq parallel f_n - phi.alt_n parallel_1 + parallel phi.alt_n - phi.alt parallel_1 + parallel phi.alt - f parallel_1 $
First, $parallel phi.alt - f parallel_1 < epsilon\/3$ by construction.
Next, fixing $n\,k$, we write the value of $f_n\(x\)$ over the interval $I_(n\,k) := lr([k / n \, frac(k + 1, n)))$ as $f_(n\,k)$, and value of $phi.alt_n\(x\)$ over the interval $I_(n\,k) := lr([k / n \, frac(k + 1, n)))$ as $phi.alt_(n\,k)$. Then for each $n\,k$
$ parallel f_n\|_(I_(n\,k))- phi.alt_n\|_(I_(n\,k))parallel_1 & = integral_(I_(n\,k))\|f_(n\,k) - phi.alt_(n\,k)\|thin d x\
 & = 1 / n\|f_(n\,k) - phi.alt_(n\,k)\|\
 & = 1 / n dot.op n \| integral_(I_(n\,k))\(f\(t\)- phi.alt\(t\)\)thin d t \|\
 & = \| integral_(I_(n\,k))\(f\(t\)- phi.alt\(t\)\)thin d t \| $
Since $f_n - phi.alt_n = sum_(k in bb(Z)) f_n\|_(I_(n\,k))- phi.alt_n\|_(I_(n\,k))$, by Minkowski's ineq we then have:
$ parallel f_n - phi.alt_n parallel & lt.eq sum_(k in bb(Z)) parallel f_n\|_(I_(n\,k))- phi.alt_n\|_(I_(n\,k))parallel_1\
 & = sum_(k in bb(Z)) \| integral_(I_(n\,k))\(f\(t\)- phi.alt\(t\)\)thin d t \|\
 & lt.eq sum_(k in bb(Z)) integral_(I_(n\,k))\|f\(t\)- phi.alt\(t\)\|thin d t\
 & = integral\|f\(t\)- phi.alt\(t\)\|thin d t = parallel f - phi.alt parallel_1 < epsilon.alt / 3 $
This shows that, for every $n in bb(N)$, we all have $parallel f_n - phi.alt_n parallel < epsilon.alt / 3$. \ And finally for $phi.alt_n - phi.alt$, since $phi.alt in C_c^0\(bb(R)\)subset L^1\(bb(R)\)$, by (a) we already have $phi.alt_n arrow.r phi.alt$ a.e.; and, since $phi.alt$ have compact support, say $K$ with $m\(K\)< oo$ and it is continuous on the compact support, it is uniformly continuous and bounded. Say $\|phi.alt\|< M$ for some $M > 0$. \ Then the function $g = M$ on $K$ and $g = 0$ on $K^c$ can serve as a dominating function for $phi.alt_n$, with $integral g = M dot.op m\(K\)< oo$. Then by DCT, we have: $phi_n arrow.r phi$ in $L^1$. \ So for some $N in bb(N)$, $parallel phi.alt_n - phi.alt parallel_1 < epsilon.alt\/3$ for all $n gt.eq N$. \ Therefore for all $n gt.eq N$, we have: $ parallel f_n - f parallel_1 lt.eq parallel f_n - phi.alt_n parallel_1 + parallel phi.alt_n - phi.alt parallel_1 + parallel phi.alt - f parallel_1 < epsilon.alt $
This finishes the proof that
$ lim_(n arrow.r oo) parallel f_n - f parallel_1 = 0 $

]
#heading(level: 2, numbering: none)[Oscillations: $F\(x\)= x sin 1 / x\,x^2 sin 1 / x^2 in B V\(I\)arrow.l.r.double 0 in.not I$ ]
<oscillations-fxxsinfrac1xx2sinfrac1x2in-bvi-iff-0not-in-i>
- Define $F : bb(R) arrow.r bb(R)$ by $F\(x\)= x sin 1 / x$ for $x eq.not 0$ and $F\(0\)= 1$. Prove that if $I =\[a\,b\]subset bb(R)$ is a compact interval, so that $- oo < a < b < oo$, then $F in upright(B V)\(I\)$ iff $0 in.not I$.

- Define $F : bb(R) arrow.r bb(R)$ by $F\(x\)= x^2 sin 1 / x^2$ for $x eq.not 0$ and $F\(0\)= 0$. Prove that $F$ is differentiable everywhere (including at $x = 0$) but that $F in.not upright(B V)\(\[- 1\,1\]\)$.

#proof[
#strong[of (a):] \ #strong[We first verify ($arrow.r.double.long$): if $0 in.not I$ then $F in B V\(I\)$.] \ We differentiate $F\(x\)= x sin\(1\/x\)$ for $x eq.not 0$:
$ F'\(x\)= frac(d, d x) (x dot.op sin (1 / x)) = sin (1 / x) + x dot.op cos (1 / x) dot.op (- 1 / x^2) = sin (1 / x) - 1 / x cos (1 / x) $
WLOG suppose $a > 0$, then on $\[a\,b\]$ we have: $ 0 lt.eq\|F'\|lt.eq 1 + 1 / a $
Then for arbitrary division of $\[a\,b\]$, say $a = x_0 lt.eq dots.h.c lt.eq x_n = b$, for all $j$ we have: $ \|F\(x_j\)- F\(x_(j - 1)\)\|lt.eq\(1 + 1 / a\)\(x_j - x_(j - 1)\) $
Thus $ sum_(j = 1)^n\|F\(x_j\)- F\(x_(j - 1)\)\|lt.eq\(1 + 1 / a\)\(b - a\)= b - a + b / a - 1 $
Taking sup over all partition of $\[a\,b\]$, proving that $T_F\(a\;b\)lt.eq b - a + b / a - 1$, proving that $F in B V\(\[a\,b\]\)$\; If $a < 0$ then $b < 0$ also, then $0 lt.eq\|F'\|lt.eq 1 - 1 / b$, by same reasoning showing that $F in B V\(\[a\,b\]\)$. \ #strong[Then we verify: ($arrow.l.double.long$): if $F in B V\(I\)$ then $0 in.not I$. This is equiv to: if $0 in I$ then $F in.not B V\(I\)$.] \ Suppose $0 in I =\[a\,b\]$ then $a lt.eq 0$ and $b gt.eq 0$, one of which is strict. WLOG we suppose $b > 0$. \ Consider this seq:
$ y_n := frac(1, n pi + pi\/2) arrow.r 0^(+) $
we have:
$ F (y_n) = y_n sin (1 / y_n) = frac(1, n pi + pi\/2) dot.op sin\(n pi + pi\/2\) $For odd $n$, $F\(y_n\)= frac(- 1, n pi + pi\/2)$, for even $n$, $F\(y_n\)= frac(1, n pi + pi\/2)$. \ Since $b > 0$, for some $N_0$ we have $y_(N_0) < b$.
Then we consider the partition: pick $N in bb(N)$, and use $x_0 = 0\,x_1 = y_(N_0 + N - 1)\,x_2 = y_(N_0 + N - 2)\,dots.h.c\,x_N = y_(N_0)\,x_(N + 1) = b$ as the partition points of $\[0\,b\]$. \ Then we have $ sum_(n = 1)^(N + 1)\|F\(x_n\)- F\(x_(n - 1)\)\|gt.eq sum_(n = N_0)^(N_0 - 2 + N) frac(1, pi n + pi\/2) + frac(1, pi\(n + 1\)+ pi\/2) gt.eq 2 sum_(n = N_0)^(N_0 - 2 + N) frac(1, pi n + pi\/2) $
As $N arrow.r oo$, this sum $sum_(n = 1)^(N + 2)\|F\(x_j\)- F\(x_(j - 1)\)\|arrow.r oo$, by the harmonic series. Then taking sup over all partitions, the sup is unbounded, showing that $F in.not B V\(\[0\,b\]\)$, thus $F in.not B V\(I\)$. Same reasoning when we suppose $a < 0$ is strict.

]
#proof[
#strong[of (b):]
#strong[For $x eq.not 0$:] $sin\(1\/x^2\)$ is differentiable as the composition of two differentiable functions, thus differentiable; and $F\(x\)= x^2 sin (1 \/ x^2)$ is the product of differentiable functions, so $F$ is differentiable. \ #strong[For $x = 0$:]$ lim_(x arrow.r 0) frac(F\(x\)- F\(0\), x - 0) = lim_(x arrow.r 0) frac(x^2 sin (1 / x^2), x) = lim_(x arrow.r 0) x sin (1 / x^2) $
Since $lr(|sin (1 \/ x^2)|) lt.eq 1$, we get $lr(|x sin (1 \/ x^2)|) lt.eq\|x\|arrow.r 0$ as $x arrow.r 0$, thus $F$ is differentiable at $x = 0$, and $F'\(0\)= 0$. \ This proves that, $F$ is differentiable everywhere on $bb(R)$. \ Now we show that $F in.not upright(B V)\(\[- 1\,1\]\)$: \ Consider this seq:
$ y_n := sqrt(frac(1, n pi + pi\/2)) arrow.r 0^(+) $
we have:
$ F (y_n) = y_n^2 sin (1 / y_n^2) = frac(1, n pi + pi\/2) dot.op sin\(n pi + pi\/2\) $For odd $n$, $F\(y_n\)= frac(- 1, n pi + pi\/2)$, for even $n$, $F\(y_n\)= frac(1, n pi + pi\/2)$. \ Notice that $y_1 < 1$, so we then consider the partition: pick $N in bb(N)$, and use $x_0 = 0\,x_1 = y_N\,x_2 = y_(N - 1)\,dots.h.c\,x_N = y_1\,x_(N + 1) = 1$ as the partition points of $\[0\,1\]$. \ Then we have
$ T_F\(1\)- T_F\(- 1\) & gt.eq sum_(n = 1)^(N + 1)\|F\(x_n\)- F\(x_(n - 1)\)\|\
 & gt.eq sum_(n = 2)^N\|F\(y_n\)- F\(y_(n - 1)\)\|\
 & gt.eq sum_(n = 2)^N frac(1, pi n + pi\/2) + frac(1, pi\(n - 1\)+ pi\/2)\
 & gt.eq 2 sum_(n = 2)^N frac(1, pi n + pi\/2) $
This sum is unbounded as $N arrow.r oo$ by the harmonic series. Then taking sup over all partitions, the sup is unbounded, showing that $F in.not B V\(\[- 1\,1\]\)$.

]
#heading(level: 2, numbering: none)[Everywhere unbounded variation]
<everywhere-unbounded-variation>
Construct a function $F in C_0^0\(bb(R)\)$ (see HW9) such that $F$ does not have bounded variation on any interval $\[a\,b\]$ with $a < b$.
#emph[Hint]: construct $F$ based on functions like the ones in the previous problem.

#solution[
We consider this function as the building block: $ G\(x\)= {x sin 1 / x\,quad x in\(- 1 / pi\,0\)union\(0\,1 / pi\)\
0\,quad upright(" elsewhere ") $
We know that, this function is #strong[continuous] (we know in elementary real analysis course that it is true for $x in\(- 1 / pi\,1 / pi\)$, and $G arrow.r 0$ as $x arrow.r plus.minus - 1 / pi$, so it is true all over the domain.) and similar reasoning as question 4(a), we can verift that, #strong[$G in.not upright(B V)\(I\)$ for any $I in.rev 0$.] \ Also, it is clear that $ lim_(x arrow.r plus.minus oo) G\(x\)= G\(1\)= 0 $
Thus we have: $ G in C_0^0\(bb(R)\) $
And notice this function has #strong[uniform bound $1$]: setting $t = 1 / x$, so $x = 1 / t$, and
$ \|G\(x\)\|= lr(|1 / t sin \( t \)|) = lr(|frac(sin\(t\), t)|) lt.eq 1 quad forall t eq.not 0 $
So by translating, stretching and scaling it, we can define for each $n$: $ G_n\(x\)= 1 / 2^n G\(frac(x - x_n, sigma_n)\) $
where #strong[we will delicately choose $x_n\,sigma_n$.] \ By defining the partial sum seq: $ F_N\(x\)= sum_(n = 1)^N G_n\(x\) $
Then by geometric seq, such function is also uniformly bounded by $1$, and it is continuous since it is finite sum of continuous functions, and also have $F_N\(x\)arrow.r 0$ as $x arrow.r oo$, so for each $N$ we have $F_N in C_0^0\(bb(R)\)$. And $F_N$ is an increasing seq \(not really), so define: $ F := lim_(N arrow.r oo) F_N = sum_(n = 1)^oo G_n $
Then $F_N arrow.r F$ uniformly as $N arrow.r oo$. This is since $G_n$ is uniformly bounded by $1 / 2^n$: For $epsilon.alt > 0$, there exists $N_0$ s.t. $1 / 2^(N - 1) < epsilon.alt$, and then for all $M gt.eq N_0$, we have $ \|F_M\(x\)- F\(x\)\|lt.eq sum_(N = N_0)^oo 1 / 2^N = 1 / 2^(N - 1) < epsilon.alt $
Thus, we also have $ F in C_0^0\(bb(R)\) $since it is #strong[uniform limit of continuous functions,] and the limit to $plus.minus oo$ remains $0$. This is regardless of the choice of $x_n\,sigma_n$ for each $n$. \ Then, to finish the construction, it remains for us to choose $x_n\,sigma_n$ for each $n$, to let $F$ have the property that $F$ does not have bounded variation on any compact interval. \ Let ${ x_n }$ be the enumeration of a dense subset of $bb(R)$. e.g. Let it be the enumeration of $bb(Q)$. \ We #strong[inductively pick $sigma_n$]: for each $n$, we pick $sigma_n in\(0\,1\)$ s.t. for all $1 lt.eq j lt.eq n - 1$, we have $\|x_n - x_j\|> 2 sigma_n$ and $\|x_(n + 1) - x_n\|> 2 sigma_n$. \ Now let $I =\[a\,b\]$ be an arbitrary compact interval. WTS: $F in.not B V\(I\)$. \ By density of the seq, there exists $x_n$ such that $x_n in I$. \ We consider the subinterval: $ I' :=\(x_n - sigma_n\,x_n + sigma_n\)subset I $
This construction ensures that the $G_1\,dots.h.c\,G_(n - 1)\,G_(n + 1)$ will not have some offsetting variation such to make the variation of $G_n$ interfered (suspectively finite): for each $1 lt.eq j lt.eq n$ and $j = n + 1$, we have: $ G_j in B V\(I'\) $
since $x_j in.not I'$. This is by question 4(a). This means that we can ignore these terms when showing $F in.not B V\(I'\)$. \ And for we know that $ G_n in.not B V\(I'\) $
since $x_n in I$, as verified by question 4(a). \ And for the rest $G_(n + 2)\,dots.h.c$, #strong[their total variation contributed to this the total variation of $F$ on $I$ is at most a half of $G_n$ (by geometric seq).] \ Thus the only term matters is $G_n$. Since $G_n in.not B V\(I'\)$, we have $F = sum_(n = 1)^oo G_n in.not B V\(I'\)$, thus $F in.not B V\(I\)$ since $I supset I'$. \ This finishes the proof. \ (Rigorous reasoning is as question 4, we construct partitions to apply harmonic seq to the variation by the partition, and $G_(n + 2)\,dots.h.c$ can at most halve it, which does not matter.)

]
