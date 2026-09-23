#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 3: on Lebesgue-Stieljes measures(30/40)]
<homework-3-on-lebesgue-stieljes-measures3040>
#emph[None of the following questions will be graded. Do them, but do not hand them in].

#heading(level: 2, numbering: none)[Fun facts about increasing functions]
<fun-facts-about-increasing-functions>
Let $F : bb(R) arrow.r bb(R)$ be an increasing function, that is, $F\(x\)lt.eq F\(y\)$ whenever $x lt.eq y$.

- Prove that the following limits exist (and make sure you understand the definitions):

  - $F\(a -\):= lim_(x arrow.r a -) F\(x\)in bb(R)$ and $F\(a +\):= lim_(x arrow.r a +) F\(x\)in bb(R)$ for $a in bb(R)$\;

  - $F\(oo\):= lim_(x arrow.r oo) F\(x\)in\(- oo\,oo\]$\;

  - $F\(- oo\):= lim_(x arrow.r - oo) F\(x\)in\[- oo\,oo\)$.

- Fix any $a in bb(R)$.

  - Prove that $F\(a -\)lt.eq F\(a\)lt.eq F\(a +\)$\;

  - Prove that $F$ is continuous at $a$ iff $F\(a -\)= F\(a +\)$.

  We say that a function is #emph[left continuous] if $F\(a -\)= F\(a\)$ for every $a in bb(R)$. It is #emph[right-continuous] if instead $F\(a +\)= F\(a\)$ for every $a in bb(R)$.

- If $X$ is a metric space (or, more generally, a topological space), then a function $f : X arrow.r bb(R)$ is #emph[upper semicontinuous] if the set ${ x in X divides f\(x\)< a }$ is open for every $a in bb(R)$. It is #emph[lower semicontinuous] if instead the set ${ x in X divides f\(x\)> a }$ is open for every $a in bb(R)$.
  Prove that our function $F : bb(R) arrow.r bb(R)$ is right-continuous (resp. left continuous) iff it is upper semicontinuous (resp.~lower semicontinuous). Give an example showing that this is no longer true if $F$ is not assumed increasing.

- Prove that the following are equivalent:

  - $F$ is surjective;

  - $F$ is continuous, $F\(oo\)= oo$, and $F\(- oo\)= - oo$.

- Let $A subset bb(R)$ be the set of points where $F$ fails to be continuous. Prove that $A$ is a countable (i.e. empty, finite, or countably infinite) set. #emph[Hint]: prove that for any integers $m\,n gt.eq 1$, the set of points $x in\[- m\,m\]$ where $F\(x +\)- F\(x -\)gt.eq 1\/n$ is finite.

#heading(level: 2, numbering: none)[Locally finite measures]
<locally-finite-measures>
If $X$ is a metric space (or, more generally, a topological space), then a Borel measure $mu$ on $X$ is said to be #emph[locally finite] if $mu\(K\)< oo$ for every compact set $K subset X$. Now let $mu$ be a Borel measure on $bb(R)$, that is $mu : cal(B)\(bb(R)\)arrow.r\[0\,oo\]$ satisfies $mu\(nothing\)= 0$ and is countably additive.

- Prove that the following are equivalent:

  - $mu$ is locally finite;

  - $mu\(\[- N\,N\]\)< oo$ for every $N gt.eq 0$\;

  - $mu\(I\)< oo$ for every bounded interval $I$.

- Prove that if $mu$ is locally finite, then $mu$ is $sigma$-finite. Is the converse true? Give a proof or a counterexample.

#heading(level: 2, numbering: none)[Basic formulas for LS measures]
<basic-formulas-for-ls-measures>
Let $F : bb(R) arrow.r bb(R)$ be a distribution function, and $mu = mu_F$ the associated Lebesgue--Stieltjes measure. From its definition using h-intervals, it follows that $mu\(\(a\,b\]\)= F\(b\)- F\(a\)$ for $- oo < a < b < oo$. Using this property together with basic general properties of ($sigma$-finite) measures, we proved in class that $mu\(\(a\,b\)\)= F\(b -\)- F\(a\)$ for $oo < a lt.eq b < oo$. Using a similar strategy, prove the following:

- $mu\(\[a\,b\]\)= F\(b\)- F\(a -\)$ for $- oo < a lt.eq b < oo$\;

- $mu\(\[a\,b\)\)= F\(b -\)- F\(a -\)$ for $- oo < a lt.eq b < oo$\;

- $mu\({ a }\)\)= F\(a\)- F\(a -\)$ for $- oo < a < oo$\;

- $mu\(\(- oo\,b\]\)= F\(b\)- F\(- oo\)$ for $- oo < b < oo$\;

- $mu\(\(- oo\,b\)\)= F\(b -\)- F\(- oo\)$ for $- oo < b < oo$\;

- $mu\(\(a\,oo\)\)= F\(oo\)- F\(a\)$ for $- oo < a < oo$\;

- $mu\(\[a\,oo\)\)= F\(oo\)- F\(a -\)$ for $- oo < a < oo$\;

- $mu\(\[- oo\,oo\)\)= F\(oo\)- F\(- oo\)$.

#heading(level: 2, numbering: none)[Vitali sets]
<vitali-sets>
For $x\,y in\[- 1\,1\]$, write $x tilde.op y$ iff $x - y in bb(Q)$.

- Show that $tilde.op$ is an equivalence relation, i.e. show that (i) $x tilde.op x$, (ii) $x tilde.op y$ implies $y tilde.op x$, (iii) if $x tilde.op y$ and $y tilde.op z$, then $x tilde.op z$.

- The set $\[- 1\,1\]$ is partitioned into equivalence classes. Let $V subset\[- 1\,1\]$ be a set containing exactly one element from each equivalence class. (Here, we use the Axiom of choice.) We call $V$ a #emph[Vitali set].
  Let ${ r_1\,r_2\,dots.h } =\[- 2\,2\]inter bb(Q)$. Define $V_i = r_i + V = { r_i + x divides x in V }$.
  Prove that the sets $V_1\,V_2\,dots.h$ are mutually disjoint, and that
  $ \[- 1\,1\]subset union.big_(i = 1)^oo V_i subset\[- 3\,3\]. $

#heading(level: 2, numbering: none)[Vitali sets, season 2]
<vitali-sets-season-2>
Let $V subset\[- 1\,1\]$ be a Vitali set (see above).

- Using the translation invariance of Lebesgue measure, prove $V$ is not Lebesgue
  measurable.

- Prove that if $E$ is a Lebesgue measurable set and satisfies $E subset V$, then $m\(E\)= 0$.

- Using the technique in~(a), prove the following statement: if $A subset bb(R)$ is any Lebesgue measurable set with $m\(A\)> 0$, then $A$ contains a set which is not Lebesgue measurable.

#heading(level: 2, numbering: none)[The middle-thirds Cantor set]
<the-middle-thirds-cantor-set>
Let $C$ be the middle-thirds Cantor set, defined as
$ C := inter.big_(n = 1)^oo C_n\, $
where
$ C_n := union.big_(a_1\,dots.h\,a_n in { 0\,2 }) \[ sum_(i = 1)^n a_i / 3^i\,sum_(i = 1)^n a_i / 3^i + 1 / 3^n \] $

- Set $C_0 =\[0\,1\]$. Show that $C_n subset C_(n - 1)$ for all $n gt.eq 1$.
  Also prove that $C_n$ is the union of $2^n$ #emph[disjoint] closed intervals, that the set $U_n := C_(n - 1)\\C_n$ is the union of the middle thirds open intervals of the disjoint closed intervals of $C_(n - 1)$, and that
  $ U_n = union.big_(a_1\,dots.h.c\,a_(n - 1) in { 0\,2 }) \( sum_(i = 1)^(n - 1) a_i / 3^i + 1 / 3^n\,sum_(i = 1)^(n - 1) a_i / 3^i + 2 / 3^n \) . $
  (We interpret this as the interval $\(1\/3\,2\/3\)$ when $n = 1$\.)
  Thus, $C$ is the set obtained by removing successive middle thirds of the remaining disjoint closed intervals starting with $\[0\,1\]$. Sketch the first few sets $C_n$ and $U_n$.

- Show that $C$ is a compact set, and that $m\(C\)= 0$, where $m$ denotes Lebesgue measure. Also show that $C$ does not contain any non-empty open interval $\(a\,b\)$.

- Show that $C$ equals the set of numbers $x in\[0\,1\]$ which have a base-3 expansion of the form
  $x = 0 . a_1 a_2 a_3 dots.h.c$ where $a_i$ is either $0$ or $2$, i.e.~$ C = { sum_(i = 1)^oo a_i / 3^i divides upright(" ") a_i in { 0\,2 } upright(" for all ") i in bb(N) } . $
  (Note: A point may have two base-3 expansions such as $1\/3 = 0.1000 dots.h = 0.0222 dots.h$\; this number is in $C$ since one of the expansions is of the desired form.)

- Show that $1 / 4\,9 / 13 in C$ but $5 / 36 in.not C$.

#heading(level: 2, numbering: none)[The Devil's Staircase: an increasing function build on Cantor set]
<the-devils-staircase-an-increasing-function-build-on-cantor-set>
Let $C$ be the middle-thirds Cantor set, and define $F : C arrow.r\[0\,1\]$ by
$ F\(x\)= sum_(i = 1)^oo frac(a_i\/2, 2^i) $<eq:Cantorfunctiondefn>
for $x = sum_(i = 1)^oo a_i / 3^i$, $a_i in { 0\,2 }$.

- Prove that $F$ is an increasing function, and that $F\(C\)=\[0\,1\]$.

- Suppose that $x\,y in C$ and $x < y$. Prove that $F\(x\)= F\(y\)$ iff $x$ and $y$ are the endpoints of a removed open interval, that is, one of the $2^(n - 1)$ disjoint open intervals whose union equals $U_n = C_(n - 1)\\C_n$ for some $n gt.eq 1$.

- Prove that $F : C arrow.r\[0\,1\]$ extends uniquely to a continuous function which is constant on all the intervals in $U_n$, $n gt.eq 1$. Sketch the graph of $F$.
  #emph[Hint]: to prove continuity, it suffices to show that $F\(\[0\,1\]\)=\[0\,1\]$ (Why?)

- Prove that $F'\(x\)= 0$ for a.e.~$x$. In other words, there exists a set $E subset\[0\,1\]$ such that $m\(E\)= 0$, and such that $lim_(h arrow.r 0)\(F\(x + h\)- F\(x\)\)\/h = 0$ for $x in\[0\,1\]\\E$.

\(Remark 1: because of~(c) and~(d), the graph of $F$ is called the #emph[Devil's Staircase]\; it is horizontal almost everywhere, and has no vertical jumps, but nevertheless climbs upwards.)

\(Remark 2: the fact that $F\(C\)=\[0\,1\]$ implies that $C$ has the same cardinality as $\[0\,1\]$, in particular the Cantor set is uncountable.)

#emph[Some of the following questions will be graded. Do them, and do hand them in].

#heading(level: 2, numbering: none)[fun facts about distribution functions]
<fun-facts-about-distribution-functions>
- Let $A subset bb(R)$ be a countable set. Exhibit a distribution function $F$ that is discontinuous at every point in $A$, but continuous everywhere else. Justify your answer. #emph[Hint]: play around with the Heaviside function.

- Let $F : bb(R) arrow.r bb(R)$ be an increasing function. Prove that there exists a unique distribution function $G$ such that $G\(x\)= F\(x\)$ for all points $x$ where $F$ is continuous.
  #emph[Hint]: there is a simple formula for $G$ in terms of $F$.

#solution[
#strong[of (a):] \ We list $A = { a_n }_(n = 1)^oo$ as a sequence to label its elements. Define:
$ F\(x\)= sum_(n = 1)^oo 1 / 2^n H\(x - a_n\) $
where $H\(x\)$ is the Heaviside function: $H\(x\)= cases(delim: "{", 0\, & x < 0\,, 1\, & x gt.eq 0 .)$. \ #strong[Claim 1.1 $F$ is non-decreasing]. \ Proof: Suppose $y > x in bb(R)$, then $H\(y - a_n\)gt.eq H\(x - a_n\)$ for each $n in bb(N)$, so we have $F\(y\)gt.eq F\(x\)$. \ \ #strong[Claim 1.2 $F$ is right continuous but not left continuous (thus discontinuous) at every $a_n$.] \ Proof: Let $epsilon.alt > 0$. \ We take $N in bb(N)$ s.t. $sum_(k gt.eq N\,n in bb(N)) 1 / 2^k < epsilon.alt$. \ Then we take $delta > 0$ such that $a_1\,a_2\,dots.h.c\,a_N in.not\(a_n\,a_n + delta\)$\.(This can be done since there are only finite points here) \ Thus $forall y in\(a_n\,a_n + delta\)$, we have $\|F\(y\)- F\(a_n\)\|< epsilon.alt$, since $F\(y\)< F\(a_n\)+ sum_(k gt.eq N\,n in bb(N)) 1 / 2^k$.
Since $epsilon.alt$ is arbitrary, this finishes the proof that $F$ is right continuous at $a_n$. \ Also, $forall y < a_n$, we have $F\(y\)< F\(a_n\)- 1 / 2^n$, which means that $\|F\(y\)- F\(a_n\)\|> 1 / 2^n$ for any $y$ on the left, so $F$ is not left continuous at $a_n$. \ \ #strong[Claim 1.3: $F$ is continuous at every $x in bb(R)\\A$.] \ Proof: This is similar to the proof in Claim 1.2. \ Fix $x in bb(R)\\A$. Let $epsilon.alt > 0$. \ We take $N in bb(N)$ s.t. $sum_(k gt.eq N\,n in bb(N)) 1 / 2^k < epsilon.alt$. \ Then we take $delta > 0$ such that $a_1\,a_2\,dots.h.c\,a_N in.not\(a_n - delta\,a_n + delta\)$. This can be done since there are only finite points here. \ Thus $forall y in\(a_n - delta\,a_n + delta\)$, we have $\|F\(y\)- F\(a_n\)\|< sum_(k gt.eq N\,n in bb(N)) 1 / 2^k < epsilon.alt$. \ ~Since $epsilon.alt$ is arbitrary, this finishes the proof that $F$ is continuous at $x$. \ \ By claim 1.1, 1.2, 1.3, we have proved that $F$ is a distribution function that is discontinuous at every point of $A$ but continuous elsewhere. \ \

]
#proof[
#strong[of (b):] \ Given an increasing function $F : bb(R) arrow.r bb(R)$, we define $G : bb(R) arrow.r bb(R)$ by:
$ G\(x\)= lim_(y arrow.r x^(+)) F\(y\). $
We will show that this is the unique distribution function $G$ such that $G\(x\)= F\(x\)$ for all points $x$ where $F$ is continuous. \ #strong[Incresing:] Since $F$ is increasing, for any $x < y$ we have $F\(x\)lt.eq F\(y\)$. Thus, for any $x < y$ we have:
$ G\(x\)= lim_(z arrow.r x^(+)) F\(z\)lt.eq lim_(z arrow.r y^(+)) F\(z\)= G\(y\). $
Thus, $G$ is increasing. \ #strong[Right-continuity:] Since $F$ is an increasing function, it can only have jump discontinuities, and the right limit exists for all $X$. By construction, $G$ is right-ctn. \ Above finishes the proof that $G$ is a distribution function. \ #strong[Agree with $F$ at ctn point:] $G\(x\)= F\(x\)$ where $F$ is continuous at $x$, since $G\(x\)= lim_(y arrow.r x^(+)) F\(y\)= F\(x\)$ there. \ It remains to show that it is unique. \ Suppose $R$ is another such function. It suffices to show: $R$ agrees with $G$ on discontinuous points of $F$. \ Since $R\,G$ are right continuous, their right limit must exist at each point. Therefore, let $x$ be an arbitrary point where $F$ is discontinuous at $x$, #strong[it suffices to show that there is a sequence ${ x_n }$ approaching $x$, such that $lim_n G\(x_n\)= lim_n R\(x_n\)$.] \ Since $F$ is increasing, the points where $F$ is disctn is at most countable. Therefore #strong[the points where $F$ is ctn, denote it as $C$, is dense in $bb(R)$.] Thus we can pick a sequence ${ x_n }$ in $C$ approaching $x$, then $G\(x_n\)= R\(x_n\)= F\(x_n\)$ for each $n$, impling that $lim_n G\(x_n\)= lim_n R\(x_n\)$. This finishes the proof of uniqueness.

]
#heading(level: 2, numbering: none)[Finding intervals]
<finding-intervals>
Let $E subset bb(R)$ be a Lebesgue measurable subset with $m\(E\)> 0$. Prove that for every $alpha in\(0\,1\)$ there exists an (nonempty) bounded open interval $I$ such that $m\(E inter I\)gt.eq alpha m\(I\)$.
#emph[Hint]: first reduce to the case when $E$ is bounded, then use outer regularity.

#proof[
Let $alpha in\(0\,1\)$ be arbitrary and fix it. \ We first consider the case that $E$ is bounded. By outer regularity of Lebesgue measure, there exists an open set $G$ such that

$ E subset G quad upright("and") quad m\(G\)- m\(E\)lt.eq\(1\/alpha - 1\)#h(0em) m\(E\) $
since $alpha in\(0\,1\)$.
Then we have:
$ m\(G\)lt.eq 1\/alpha #h(0em) m\(E\) $
Note that in $bb(R)$, an open set is just a countable disjoint union of open intervals. We write:
$ G = union.sq.big_(i in bb(N)) I_i $
Since $E subset G$, we have:
$ E = union.sq.big_(i in bb(N))\(I_i inter E\) $
Thus
$ m\(E\)= sum_(i in bb(N)) m\(I_i inter E\)gt.eq alpha sum_(i in bb(N)) m\(I_i\) $
So #strong[there must exist some $i$ such that $m\(I_i inter E\)gt.eq alpha thin m\(I_i\)$, otherwise contradicting with the ineq above.] \ This finishes the proof of the bounded case. \ The we consider the case when $E$ is unbounded.
We can write
$ E = union.sq.big_(n in bb(Z))\(E inter\(n\,n + 1\]\) $
where each $E_n := E inter\(n\,n + 1\]$ is bounded. \ We apply the case where $E$ is bounded, confirming that there is some interval $I$ such that $m\(E_1 inter I\)gt.eq alpha m\(I\)$. By monotonicity of measure, we have $m\(E inter I\)gt.eq m\(E_1 inter I\)gt.eq alpha m\(I\)$.

]
#heading(level: 2, numbering: none)[So many differences]
<so-many-differences>
Let $E subset bb(R)$ be a Lebesgue measurable subset with $m\(E\)> 0$.

- Prove that the set
  $ E - E := { x - y divides x\,y in E } subset bb(R) $
  contains a nonempty open interval centered at the
  origin. #emph[Hint]: use the previous exercise with $alpha$
  large enough, together with the translation invariance of Lebesgue
  measure.

- Prove that there exists $epsilon.alt > 0$ such that $E times E subset bb(R)^2$ intersects every line $y = x + t$ with $\|t\|< epsilon.alt$.

- Let $C subset bb(R)$ be the middle-third Cantor set (so $m\(C\)= 0$). Does $C - C$ contain a nonempty open interval centered at the origin?

#proof[
#strong[of (a):]

#figure(image("../assets/hw3-image-20250131212105730.png", width: 65.0%),
  caption: [
  ]
)

#figure(image("../assets/hw3-image-20250131212120558.png", width: 70.0%),
  caption: [
  ]
)

]
#proof[
#strong[of (b):] \ Consider taking $epsilon.alt$ as the one in (a) where the interval contained in $E - E$ is $\(- epsilon.alt\,epsilon.alt\)$, then the box $\(- epsilon.alt\,epsilon.alt\)times\(- epsilon.alt\,epsilon.alt\)$ is contained in $E times E$. It trivially follows that $E times E subset bb(R)^2$ intersects every line $y = x + t$ with $\|t\|< epsilon.alt$, since the intercept of this line with $y$-axis is below $epsilon.alt$ and above $- epsilon.alt$.

#figure(image("../assets/hw3-image-20250131212337897.png", width: 25.0%),
  caption: [
  ]
)

]
#solution[
#strong[of (c):] $C - C$ contain a nonempty open interval centered at the origin, and we will prove that one such interval is $\(- 1\,1\)$.

#proof[
Recall the balanced ternary representation of $\[- 1\/2\,1\/2\]$: $forall x in\[- 1\/2\,1\/2\]$, there is a seq of $\(a_n\)_(n in bb(N))$ in ${ - 1\,0\,1 }$ s,t,
$ x = sum_(n = 1)^oo a_n / 3^n\,#h(2em) a_n in { - 1\,0\,1 }\, $
Thus every $x in\[- 1\,1\]$ can be halved, ternary expanded and then doubled to recover:
$ x = 2 sum_(n = 1)^oo a_n / 3^n & = sum_(n = 1)^oo frac(2 a_n, 3^n)\,#h(2em) a_n in { - 1\,0\,1 }\
 & = sum_(n = 1)^oo b_n / 3^n\,#h(2em) b_n in { - 2\,0\,2 } $

And by the problem \"The middle-thirds Cantor set\", we learned that $ C = { sum_(i = 1)^oo a_i / 3^i divides upright(" ") a_i in { 0\,2 } upright(" for all ") i in bb(N) } . $
Therefore we can write every number $x in\[- 1\,1\]$ into a difference of two $x\,y in C$, i.e. an element of $C - C$:
$ x & = sum_(n = 1)^oo b_n / 3^n\,#h(2em) b_n in { - 2\,0\,2 }\
 & = sum_(n = 1)^oo frac(p_n - q_n, 3^n)\,#h(2em) p_n\,q_n in { - 2\,0\,2 }\
 & = sum_(n = 1)^oo p_n / 3^n - sum_(n = 1)^oo q_n / 3^n\,#h(2em) p_n\,q_n in { - 2\,0\,2 } $
since each series converges independently. Here we let $p_n = 2\,q_n = 0$ if $b_n = 2$\; $p_n = 0\,q_n = 2$ if $b_n = - 2$, $p_n = 0\,q_n = 0$ if $b_n = 0$. \ Thus $x in C - C$, so $\[- 1\,1\]subset C - C$.

]
]
#heading(level: 2, numbering: none)[a holey set]
<a-holey-set>
Let $\(x_n\)_1^oo$ be a countable dense sequence in $\(0\,1\)$. For each $t > 0$, consider the set
$ A_t :=\[0\,1\]\\ union.big_(n = 1)^oo\(x_n - 2^(- n) t\,x_n + 2^(- n) t\). $

- Prove that $A_t$ is a compact (possibly empty) subset of $bb(R)$. Also prove that $A_t$ has empty interior, that is, $A_t$ contains no nonempty open set.

- Prove that $t mapsto m\(A_t\)$ is continuous.

- Prove that there exists $t > 0$ such that $m\(A_t\)= 597\/2025$.

#proof[
#strong[of a:]

#figure(image("../assets/hw3-image-20250131221847429.png", width: 70.0%),
  caption: [
  ]
)

]
#proof[
#strong[of b:]
Define for each $n in bb(N)$
$ I_n\(t\)=\(x_n - 2^(- n) t\,x_n + 2^(- n) t\) $
Then $ A_t =\[0\,1\]\\ union.big_(n = 1)^oo I_n\(t\) $So
$ m\(A_t\)= m\(\[0\,1\]\)- m\(union.big_(n = 1)^oo I_n\(t\)\)= 1 - m\(union.big_(n = 1)^oo I_n\(t\)\) $

#strong[Thus it suffices to show $t mapsto m\(union.big_(n = 1)^oo I_n\(t\)\)$ is continuous.]

Let $epsilon.alt > 0$.
Let $t > 0$. \ We consider $p in\(t\,t + epsilon.alt\/2\)$:

By set inclusion relation and measure's property, we have:
$ m\(union.big_(n = 1)^oo I_n\(p\)\)- m\(union.big_(n = 1)^oo I_n\(t\)\) & = m\(union.big_(n = 1)^oo I_n\(p\)\\ union.big_(n = 1)^oo I_n\(t\)\) $
Since
$ \(union.big_(n = 1)^oo I_n\(p\)\)\\\(union.big_(n = 1)^oo I_n\(t\)\)subset union.big_(n = 1)^oo\(I_n\(p\)\\I_n\(t\)\) $
We have:
$ m\(union.big_(n = 1)^oo I_n\(p\)\)- m\(union.big_(n = 1)^oo I_n\(t\)\) & lt.eq m\(union.big_(n = 1)^oo\(I_n\(p\)\\I_n\(t\)\)\)\
 & lt.eq sum_(n = 1)^oo\(m\(I_n\(p\)\)- m\(I_n\(t\)\)\)\
 & = sum_(n = 1)^oo 2 dot.op 2^(- n)\(p - t\)\
 & = 2\(p - t\)\
 & lt.eq epsilon.alt $

Similarly for $p in\(t - epsilon.alt\/2\,t\)$, we get the same bound. This finishes the proof pf (b).

]
#proof[
#strong[of c: \ ]
We use the same notation of $I_n\(t\)$ as in (b). We have:
$ m\(union.big_(n = 1)^oo I_n\(t\)\)lt.eq sum_(n = 1)^oo m\(I_n\(t\)\)= sum_(n = 1)^oo m\(I_n\(t\)\)= sum_(n = 1)^oo 2 dot.op 2^(- n) t = 2 t . $
So by choosing $t := 1\/6$, we have $m\(A_t\)= 1 - m\(union.big_(n = 1)^oo I_n\(t\)\)gt.eq 2\/3$.
And by choosing $t := 4$, $I_1\(t\)$ covers an interval of length $4$, so $A_t = diameter$, $m\(A_t\)= 0$.
By intermediate value theorem, there exists some $t in\(1\/6\,4\)$ such that $m\(A_t\)= 597\/2025$.

]
#heading(level: 2, numbering: none)[a Cantor measure]
<a-cantor-measure>
\(A Cantor measure.)
Let $E subset bb(R)$ be a nonempty compact set with the following property: for every $x in E$ and every $epsilon.alt > 0$, the set $\(x - epsilon.alt\,x\)union\(x\,x + epsilon.alt\)$ has nonempty intersection with both $E$ and $E^c$. Prove that there exists a Borel measure $mu$ on $bb(R)$ with the following properties:

- if $I subset bb(R)$ is a nonempty open interval, then $mu\(I\)> 0$ iff $I inter E eq.not nothing$.

- $mu\({ x }\)= 0$ for all $x in bb(R)$\;

- $mu\(bb(R)\)= 0.597597597 dots.h$.

#emph[Hint]: set $mu = mu_F$, where $F$ is a distribution function whose graph is similar to the Devil's staircase above.

#proof[
Write $T := 0.597597597 dots.h$ \ Since $E$ is compact, $E^c$ is open. Also, since $E$ is compact, it takes min and max element. \ Thus we consider $A := E^c inter\(min E\,max E\)$, this is an open set. We know any open set in $bb(R)$ is a countable disjoint union of open intervals, so $A := E^c inter\(min E\,max E\)= union.sq.big_(n = 1)^oo I_n$ for some disjoint intervals $I_1 =\(a_1\,b_1\)\,I_2 =\(a_2\,b_2\)\,dots.h.c$ . \ \ Now we construct a function $G : A arrow.r\[0\,T\)$ by sending $G\(x\)= sum_(b_i lt.eq a_N) T / 2^n$, for $x in I_N$. \ This is an #strong[increasing step function] since, each $I_n$ is disjoint and on a fixed interval $I_N$, the number of $b_i$ that its $a_N$ surpasses is constant. And suppose $y > x$ is on $I_M$, we have must $G\(y\)gt.eq G\(x\)$ because he number of $b_i$ that $a_M$ surpasses is at least at many as that $a_N$ surpasses. \ And for each $x in A$, we have #strong[$G\(x\)< T$], by geometric series \ Then we construct $F$ out of $G$, define:
$ F := {0\,quad quad x lt.eq min E\
inf { G\(y\)divides y gt.eq x\,y in A }\,quad quad x in\(min E\,max E\)\
T\,quad quad x gt.eq max E\
 $
#strong[$F$ is increasing:] It is constant on $\(- oo\,min E\)union\(max E\,oo\)$ and is the infimum of $G\(y\)$ with $y gt.eq x$ on $\(min E\,max E\)$. Since $G$ is increasing, $F$ is also increasing. \ #strong[$F$ is right continuous:] It suffices to prove the right-continuity of $F$ on $x in E^c inter\(min E\,max E\)$. \ Fix $x_0 in E^c inter\(min E\,max E\)$. \ Let $epsilon.alt > 0$. \ Let $k in bb(N)$ such that $epsilon.alt > frac(T, 2^k + 1)$. \ We define for each $y$, $S_y := { b_i divides x_0 lt.eq b_i lt.eq y }$ as the set of all $b_i$ (right endpoint of $I_k$) that is witin $x_0$ and $y$. Note that $I_z subset I_y$ for all $y > z$. \ Consider $y_1 := min\({ b_1\,dots.h.c\,b_k }\\S_x\)$. \ Then for all $y in\(x_0\,y_1\)$, we have:
$ F\(y\)lt.eq F\(x_0\)+ sum_(i = k)^oo T / 2^i lt.eq F\(x_0\)+ epsilon.alt $
By defining $delta : = y_1 - x_0$, we have shown the right continuity of $F$. \ (By dual reason, we can prove that $F$ is left continuous. So $F$ is actually continuous.)
Above, we have shown that $F$ is a distribution function. \ \ Now let $mu_F$ be the Lebesgue-Stieljes measure associated with $F$. We will prove for the three properties above: \

- Let ${ x }$ be a singleton set in $bb(R)$, for each $n in bb(N)$, we can construct an h-intervals seq of covering of ${ x }$ by $\(x - 1\/n\,x\]$ as the first covering set and $diameter$ as all other covering sets. \ Then by the definition of $mu_F$, we have:
  $ mu_F\({ x }\)= inf_(n in bb(N))\(F\(x\)- F\(x - 1\/n\)\) $
  By continuity, it shows that $mu_F\({ x }\)= 0$.

- $ mu_F\(bb(R)\)= lim_(x arrow.r oo) F\(x\)- lim_(x arrow.r - oo) F\(x\)= T - 0 = T = 0.597597597 dots.h.c $

- Let $I =\(a\,b\)$ be a nonempty open interval. \ Suppose $mu\(I\)> 0$, then $F\(b\)- F\(a\)> 0$, so by definition of $G$, some must be at least two different intervals $I_(n_1)$, $I_(n_2)$ in $A$ such that for some $x\,y in\(a\,b\)$, $x in I_(n_1)$ and $y in I_(n_2)$, thus $exists$ some $e in E$ such that $e in\(x\,y\)$. Thus $I inter E eq.not nothing$. \ Suppose $I inter E eq.not nothing$. Let $e in E inter I$. Since $forall epsilon.alt > 0$, $\(x - epsilon.alt\,x\)union\(x\,x + epsilon.alt\)$ has nonempty intersection with both $E$ and $E^c$, $e$ has some open neighborhood $B_epsilon.alt\(e\)subset I$, intersecting two different $I_N$, $I_M subset A$. Take $n in I_N$, $m in I_m$. Then $F\(m\)- F\(n\)= G\(m\)- G\(n\)> 0$, so $mu_F\(E\)gt.eq F\(m\)- F\(n\)> 0$ by monotinicity of measure. \ This finishes the proof.

]
'
