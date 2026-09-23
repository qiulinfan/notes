#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 4: on measurable functions(36/40)]
<homework-4-on-measurable-functions3640>
#emph[None of the following questions will be graded. Do them, but do not hand them in].

#heading(level: 2, numbering: none)[One with Vitali.]
<one-with-vitali.>
Let $\(X\,cal(A)\)$ be a measurable space, and $E subset X$ a subset. Prove that $E in cal(A)$ iff the function $chi_E$ is measurable. Use this to construct a function $f : bb(R) arrow.r bb(R)$ that is not Lebesgue measurable.

#heading(level: 2, numbering: none)[Truncations in $L^(+)$: 通过 $integral f_n$ 或者 $integral_(X_n) f$ 的极限 (bounded function / subset) 得到 $integral_X f$]
<truncations-in-l-通过-int-f_n-或者-int_x_n-f-的极限-bounded-function-subset-得到-int_x-f>
Let $\(X\,cal(A)\,mu\)$ be a measure space and $f : X arrow.r\[0\,oo\]$ a measurable function.

- \(Horizontal truncation) Suppose that $X = union.big_(n = 1)^oo X_n$ for some $X_1 subset X_2 subset dots.h.c$
  with $X_n in cal(A)$. Prove that
  $ integral_X f thin d mu = lim_(n arrow.r oo) integral_(X_n) f thin d mu $

- \(Vertical truncation)
  Prove that
  $ integral f thin d mu = lim_(n arrow.r oo) integral min { f\,n } thin d mu . $

- Explain the terminology "horizontal truncation" and "vertical truncation".

#heading(level: 2, numbering: none)[Disregarding null sets.]
<disregarding-null-sets.>
Let $\(X\,cal(A)\,mu\)$ be a #emph[complete] measure space.

- Let $f : X arrow.r accent(bb(R), macron)$ and $g : X arrow.r accent(bb(R), macron)$ be functions such that $f = g$ $mu$-a.e.

  - Prove that $f$ is measurable (i.e.~$cal(A)$-measurable) iff $g$ is measurable.

  - Prove the same statement when $f$ and $g$ are $bb(C)$-valued, rather than
    $accent(bb(R), macron)$-valued.

  - Give examples showing that the condition that $mu$ be complete is necessary.

- Let $f_n : X arrow.r accent(bb(R), macron)$, $n in bb(N)$, and $f : X arrow.r accent(bb(R), macron)$ be functions such that $lim_(n arrow.r oo) f_n\(x\)= f\(x\)$ for a.e. $x in X$.

  - Prove that if $f_n$ is measurable for all $n$, then so is $f$.

  - Prove the same statement when $f_n$ and $f$ are $bb(C)$-valued, rather than
    $accent(bb(R), macron)$-valued.

  - Give examples showing that the condition that $mu$ be complete is necessary.

#emph[Hint]: this is Proposition 2.11 of \[Folland\].

#heading(level: 2, numbering: none)[Measurable functions and completions.]
<measurable-functions-and-completions.>
Let $\(X\,cal(A)\,mu\)$ be a measure space and let $\(X\,macron(cal(A))\,macron(mu)\)$ be its completion.
Suppose that $f : X arrow.r accent(bb(R), macron)$ is $macron(cal(A))$-measurable. Prove that there is an $cal(A)$-measurable function $g : X arrow.r accent(bb(R), macron)$ such that $g = f$ $macron(mu)$-a.e., and hence $integral g #h(0em) d mu = integral f #h(0em) d macron(mu)$.
#emph[Hint]: this is Proposition 2.12 of \[Folland\].

#heading(level: 2, numbering: none)[Measurability on subsets.]
<measurability-on-subsets.>
Let $\(X\,cal(A)\)$ be a measurable space, and $Y subset X$ a nonempty subset.
We say that a function $g : Y arrow.r accent(bb(R), macron)$ is #emph[$cal(A)$-measurable on $Y$] if $g$ is $cal(A)\|_Y$-measurable, where the $sigma$-algebra $cal(A)\|_Y$ on $Y$ is defined as in HW1.

- Prove that if $f : X arrow.r accent(bb(R), macron)$ is measurable and $Y subset X$, then $g = f\|_Y$ is $cal(A)$-measurable on $Y$.

- Prove that if $g$ is $cal(A)$-measurable on $Y$ and $Y in cal(A)$, then $g$ can be extended to an $cal(A)$-measurable function $f$ on $X$. Is the extension unique?

- Let $f : X arrow.r accent(bb(R), macron)$ be any function, and set $Y = f^(- 1)\(bb(R)\)$. Prove that $f$ is measurable iff $f^(- 1)\({ oo }\)in cal(A)$, $f^(- 1)\({ - oo }\)in cal(A)$, and
  $f\|_Y: Y arrow.r bb(R)$ is $cal(A)$-measurable on $Y$.

#heading(level: 2, numbering: none)[Suprema of uncountable families.]
<suprema-of-uncountable-families.>
Construct (using the Axiom of Choice, if needed) an #emph[uncountable] family $\(f_alpha\)_alpha$ of real-valued Borel measurable functions on $bb(R)$ such that the function $sup_alpha f_alpha$ is not Lebesgue measurable, let alone Borel measurable.

#heading(level: 2, numbering: none)[Increasing functions again.]
<increasing-functions-again.>
Let $f : bb(R) arrow.r bb(R)$ be an increasing function. Prove that $f$ is Borel measurable. Use this to give an example of a function $f : bb(R) arrow.r bb(R)$ that cannot be written as a difference between increasing functions.

#heading(level: 2, numbering: none)[Lebesgue but not Borel.]
<lebesgue-but-not-borel.>
Let $F :\[0\,1\]arrow.r\[0\,1\]$ be the function from HW3, whose graph is the Devil's Staircase. Define $G\(x\)= F\(x\)+ x$.

- Prove that $G :\[0\,1\]arrow.r\[0\,2\]$ is an increasing homeomorphism. In other words, $G$ is increasing, bijective, and both $G$ and $G^(- 1)$ are continuous.

- Let $C$ be the middle-thirds Cantor set, and set $K := G\(C\)$. Prove that $m\(K\)= 1$.

- Since $m\(K\)> 0$, we know from HW3 that there is a set $A subset K$ that is not
  Lebesgue measurable. Prove that $B = G^(- 1)\(A\)$ is Lebesgue measurable but not
  Borel measurable.

#heading(level: 2, numbering: none)[Measurability and absolute values.]
<measurability-and-absolute-values.>
Let $\(X\,cal(A)\)$ be a measure space.
Suppose that $f : X arrow.r bb(C)$ is a measurable function. Prove that the function $\|f\|: X arrow.r bb(R)$ is also measurable. Is the converse true?

#emph[Some of the following questions will be graded. Do them, and do hand them in. You may use the results from the exercises above].

#heading(level: 2, numbering: none)[Measurability of limit loci.]
<measurability-of-limit-loci.>
Let $\(X\,cal(A)\)$ be a measurable space. For each $n in bb(N)$, let $f_n : X arrow.r bb(R)$ be a measurable function. Consider the set
$ E := { x in X divides lim_(n arrow.r oo) f_n\(x\)med upright("converges to a real number") } . $
Prove that $E$ is a measurable set in two ways:

- by expressing $E$ in terms of the functions $g\(x\)= limsup_(n arrow.r oo) f_n\(x\)$ and
  $h\(x\)= liminf_(n arrow.r oo) f_n\(x\)$\;

- by expressing $E$ in terms of the sets
  $ E_(i\,j\,k) = { x divides\|f_j\(x\)- f_k\(x\)\|< 1 / i }\, $
  where $i\,j\,k in bb(N)$.
  #emph[Hint]: a sequence $\(a_n\)_n$ of real numbers converges iff it is a Cauchy
  sequence, i.e. for every $epsilon.alt > 0$
  there is $n$ such that for every $j\,k gt.eq n$, $\|a_j - a_k\|< epsilon.alt$.

#emph[Hint]: note that $plus.minus oo$ are not real numbers, and please avoid considering $oo - oo$\; you may want to prove a lemma to the effect that if $g\,h : X arrow.r accent(bb(R), macron)$ are measurable functions, then the set
$ { x in X divides g\(x\)= h\(x\)in accent(bb(R), macron) } $
is measurable; to do this, you may want to consider functions like $max { g\,kappa }$, $min { h\,kappa }$ and $min { g\,- kappa }$, $min { h\,- kappa }$ for large real constants $kappa > 0$.

#proof[
#strong[of method (i):] \ Define:
$ g\(x\):= limsup_(n arrow.r oo) f_n\(x\)quad upright("and") quad h\(x\):= liminf_(n arrow.r oo) f_n\(x\) $
Since each $f_n$ is measurable function, by proposition in lecture (sequential preservation of measurability), #strong[$g\,h$ are measurable.]

And as we know, for any real sequence $\(a_n\)$,
$ lim_(n arrow.r oo) a_n upright(" exists (as a real number)") quad arrow.l.r.double quad limsup_(n arrow.r oo) a_n = liminf_(n arrow.r oo) a_n in bb(R) $

Thus, for each $x in X$ we have:
$ x in E quad arrow.l.r.double quad limsup_(n arrow.r oo) f_n\(x\)= liminf_(n arrow.r oo) f_n\(x\)in bb(R) $

Thus, we can write $E$ as:
$ E = { x in X divides g\(x\)= h\(x\)in bb(R) } $

Note: here we want to have a difference function of the two functions, but it is undefined on $oo - oo$ type of points. So actually it is not valid to take the difference for functions mapping to $accent(bb(R), macron)$. This is why we use the following method instead:

For each $n in bb(N)$, we define:
$ g_n\(x\):= min { max { g\(x\)\,- n }\,n } quad upright("and") quad h_n\(x\):= min { max { h\(x\)\,- n }\,n } $
Notice that, #strong[each $g_n\,h_n$ is measurable], since $g\,h$ are measurable and constant function is measurable and we have proved in lecture that taking the max, min of two measurable functions is measurable. \ \ #strong[Claim 1.1:] $ g\(x\)= h\(x\)in bb(R) quad arrow.l.r.double quad exists N_0 > 0\,med forall n gt.eq N_0\,quad g_n\(x\)= h_n\(x\) $
#strong[proof of claim 1.1:]
Suppose $g\(x\)= h\(x\)in bb(R)$. Let $M := max {\|g\(x\)\|\,\|h\(x\)\|} < oo$, then for any $n > M$, we have
$g_n\(x\)= g\(x\)\,h_n\(x\)= h\(x\)$, so $g_n\(x\)= h_n\(x\)$.

Suppose $exists N_0 > 0\,med forall n gt.eq N_0\,quad g_n\(x\)= h_n\(x\)$, Then it is clear that $ g\(x\)= g_(N_0)\(x\)= h_(N_0)\(x\)= h\(x\)< oo $

#figure(image("../assets/hw4-33121738963658_.pic.png", width: 35.0%),
  caption: [
  ]
)

#strong[proof of remaining:]
Therefore we have:
$ E = union.big_(N = 1)^oo inter.big_(n gt.eq N) { x in X divides g_n\(x\)= h_n\(x\)} $
Foe each $n in bb(N)$, we define
$ E_n := { x in X divides g_n\(x\)= h_n\(x\)} $
Since each $g_n\,h_n$ is measurable and real-valued (finite), $g_n - h_n$ is measurable and $\|g_n - h_n\|$ is measurable, so we have for each $m in bb(N)$,
$ { x in X :\|g_(kappa_n)\(x\)- h_(kappa_n)\(x\)\|< 1\/m } =\|g_n - h_n\|^(- 1)\(\[0\,1\/m\)\)in cal(A) $
Thus $ E_n = inter.big_(m in bb(N))\|g_n - h_n\|^(- 1)\(\[0\,1\/m\)\)in cal(A) $ is a measurable set.
Thus $E$ is a countable union of countable intersections of mea
surable sets, then measurable.

]
#proof[
#strong[of method (ii):] \ Recall: #strong[a seq of real numbers converges iff it is a Cauchy.]
Now we fix an arbitrary $i in bb(N)$ and let $epsilon.alt = 1\/i$. Define:
$ E_(i\,j\,k) = { x in X :\|f_j\(x\)- f_k\(x\)\|< 1\/i } $
Since each $f_j$ is measurable, the function $x mapsto\|f_j\(x\)- f_k\(x\)\|$ is measurable (since each term in the sequence maps to $bb(R)$ but not $accent(bb(R), macron)$), and hence #strong[each $E_(i\,j\,k) =\|f_j\(x\)- f_k\(x\)\|^(- 1)\(\[0\,1\/i\)\)$ is measurable.] \ \ For each $i$, consider the set of $x in X$ for which the sequence $\(f_n\(x\)\)$ satisfies the Cauchy condition with respect to $epsilon.alt = 1\/i$. That is,
$ E_i = { x in X : exists N in bb(N) upright(" s.t. ") forall j\,k gt.eq N\,#h(0em)\|f_j\(x\)- f_k\(x\)\|< 1 / i } $
We can write $E_i$ as
$ E_i = union.big_(N = 1)^oo inter.big_(j\,k gt.eq N) E_(i\,j\,k) $
Since countable unions and intersections of measurable sets are measurable, #strong[$E_i$ is measurable.] \ \ Now, since $\(f_n\(x\)\)$ converges in $bb(R)$ i#strong[ff it is Cauchy, i.e. it is in $E_i$ for each $i in bb(N)$], we have:
$ E = inter.big_(i = 1)^oo E_i = inter.big_(i = 1)^oo \( union.big_(N = 1)^oo inter.big_(j\,k gt.eq N) E_(i\,j\,k) \) $
This is a countable intersection of measurable sets, and therefore $E$ is measurable.

]
#heading(level: 2, numbering: none)[Measurability of continuity loci.]
<measurability-of-continuity-loci.>
Let $\(X\,d\)$ be a metric space, and $f : X arrow.r bb(C)$ any function. Prove that the set of points $x in X$ such that $f$ is continuous at $x$ is a $G_delta$-set, and in particular a Borel set.
#emph[Hint]: consider sets of the form
$ { x in X divides\|f\(y\)- f\(z\)\|lt.eq 1 / n med upright("whenever ") max { d\(y\,x\)\,d\(z\,x\)} lt.eq delta } $
and show off your skills with quantifiers.

#proof[
Recall: $f : X arrow.r bb(C)$ #strong[from a metric space] is continuous at $x in X$ iff for every $epsilon > 0$ there exists a $delta > 0$ such that$\|f\(y\)- f\(x\)\|< epsilon upright(" whenever ") d\(y\,x\)< delta$.
We can easily check that, #strong[this condition is equivalent to]: for every $epsilon > 0$ there exists a $delta > 0$ such that $\|f\(y\)- f\(z\)\|< epsilon quad forall y\,z in B_delta\(x\)$, by the relation of diameter and radius of the open ball). \ \ Thus we have:
$ x in C arrow.l.r.double forall n in bb(N)\,med exists m in bb(N) upright(" s.t.") y\,z upright(" with ") d\(y\,x\)< 1 / m upright(" and ") d\(z\,x\)< 1 / m\,#h(0em)\|f\(y\)- f\(z\)\|< 1 / n $
In other words, #strong[$x$ is a continuity point iff it belongs to:]
$ C = inter.big_(n = 1)^oo union.big_(m = 1)^oo U_(n\,m) . $ where $ U_(n\,m) = { x in X divides y\,z in B_(1 / m)\(x\)arrow.r.double.long\|f\(y\)- f\(z\)\|< 1 / n } $
#strong[Claim: $U_(n\,m)$ is open.] \ #strong[Proof of Claim:] \ Let $x in U_(n\,m)$. WTS: $exists$ an $epsilon > 0$ such that $B_epsilon\(x\)subset U_(n\,m)$. \ Consider: $epsilon = frac(1, 2 m)$. \ Let $y in B_epsilon\(x\)$. Take any two points $z\,w in X$ satisfying
$ d\(z\,y\)< frac(1, 2 m) quad upright("and") quad d\(w\,y\)< frac(1, 2 m) $
Then by the triangle inequality, we have:
$ d\(z\,x\)lt.eq d\(z\,y\)+ d\(y\,x\)< frac(1, 2 m) + frac(1, 2 m) = 1 / m $
Similarly, $d\(w\,x\)< 1 / m$. Since $x in U_(n\,m)$, it follows that
$ \|f\(z\)- f\(w\)\|< 1 / n $
Thus, the condition defining $U_(n\,m)$ holds for $y$, meaning $y in U_(n\,m)$. This proves that $B_epsilon\(x\)subset U_(n\,m)$, thus $U_(n\,m)$ is open since $x$ is arbitrary. \ \ Therefore:
$ C = inter.big_(n = 1)^oo union.big_(m = 1)^oo U_(n\,m) $ is $G_delta$ since each $union.big_(m = 1)^oo U_(n\,m)$ is a union of open sets, thus open; and $C$ is thus a countable intersection of open sets, namely a $G_delta$-set. (thus Borel).

]
#heading(level: 2, numbering: none)[Measurability of differentiability loci.]
<measurability-of-differentiability-loci.>
Let $f : bb(R) arrow.r bb(R)$ be any function. Let us say (as usual) that $f$ is #strong[#emph[differentiable]] at $x$ if there exists $lambda in bb(R)$ such that $lim_(y arrow.r x) frac(f\(y\)- f\(x\), y - x) = lambda$.

We also declare $f$ to be #strong[#emph[strongly differentiable]] at $x$ if there exists $lambda in bb(R)$ with the following property: for each $epsilon.alt > 0$ there exists $delta > 0$ such that if $\|y - x\|lt.eq delta$ and $\|z - x\|lt.eq delta$, then $\|f\(y\)- f\(z\)- lambda\(y - z\)\|lt.eq epsilon.alt\|y - z\|$.

- Does $f$ being differentiable at $x$ imply that $f$ is strongly differentiable at $x$? Give a proof or a counterexample.

- Prove that the set of points $x in bb(R)$ at which $f$ is strongly differentiable is a Borel set. #emph[Hint]: consider sets of the form $ E_(lambda\,m\,n) := { x in bb(R) divides\|f\(y\)- f\(z\)- lambda\(y - z\)\|lt.eq 1 / n\|y - z\|med upright("whenever ") max {\|y - x\|\,\|z - x\|lt.eq 1 / m } . $

- #emph[Extra credit]: is the set of points $x in bb(R)$ at which $f$ is differentiable a Borel set?

#solution[
#strong[of (a):] No. Consider the following counterexample: \ $ f\(x\)= cases(delim: "{", x^2 sin \( 1 / x \)\, & x eq.not 0, 0\, & x = 0) $
We know that
$ frac(f\(x\)- f\(0\), x - 0) = frac(x^2 sin\(1\/x\), x) = x sin\(1\/x\) $
Note $\|x sin\(1\/x\)\|lt.eq\|x\|$, so when $x arrow.r 0$ we have:
$ lim_(x arrow.r 0) x sin\(1\/x\)= 0 $
Thus $f$ is differentiable at $0$ and $f'\(0\)= 0$.

#lemma(
)[
$f : bb(R) arrow.r bb(R)$ is strongly differentiable at $x$ $arrow.r.double.long$ it is differentiable at $x$, and $lambda$ is uniquely equal to the derivative at $x$.

]
#proof[
#strong[of lemma 4.1:] \ Suppose $f : bb(R) arrow.r bb(R)$ is strongly differentiable at $x$, so for any $epsilon.alt > 0$, there exists $delta > 0$ s.t. for all $y\,z in B_delta\(x\)$, we have: $ \| f\(y\)- f\(z\)- lambda\(y - z\)\| lt.eq epsilon.alt thin\|y - z\|. $
Suppose $y eq.not z$, then dividing by $\|y - z\|$ on both sides, we have
$ \| frac(f\(y\)- f\(x\), y - x) - lambda \| lt.eq epsilon.alt $
Since $epsilon.alt$ is arbitrary, this proves that
$ f'\(x\)= lim_(y arrow.r x) frac(f\(y\)- f\(x\), y - x) = lambda $

]
Now we go back to the counterexample. Suppose for contradiction that $f$ is strongly differentiable at $0$, then $lambda = 0$, so for all $epsilon.alt > 0$, there exist $delta > 0$ s.t. for all $y\,z in B_delta\(0\)$, we have
$ \|f\(y\)- f\(z\)\|lt.eq epsilon.alt thin\|y - z\| $
Consider $epsilon.alt = 1 / 4$. Let $delta > 0$. Take $n in bb(N)$ s.t.
$ frac(1, \(2 n + 3 / 2\)pi) < delta $and then take
$ y_n := frac(1, (2 n + 1 / 2) pi)\,quad z_n := frac(1, (2 n + 3 / 2) pi) $Note that each $\|y_n\|\,\|z_n\|< delta$. And we have $ sin \[ \( 2 n + 1 / 2 \) pi \] =\(- 1\)^n\,quad sin \[ \( 2 n + 3 / 2 \) pi \] = -\(- 1\)^n $Thus $ f\(y_n\)- f\(z_n\)=\(- 1\)^n\[ y_n^2 + z_n^2 \] $while
$ y_n - z_n = frac(1, (2 n + 1 / 2) pi) - frac(1, (2 n + 3 / 2) pi) = frac(1, pi (2 n + 1 / 2) (2 n + 3 / 2)) $
Taking limit of this behavior (increasing $n$), we get the sequential limit of $frac(\|f\(y_n\)- f\(z_n\)\|, \|y_n - z_n\|)$ indexing over $n$ is $frac(1, 2 pi^2 n^2) / frac(1, 4 pi n^2) = 2 / pi$.
By taking large enough $n$, we can alwasy get $frac(\|f\(y_n\)- f\(z_n\)\|, \|y_n - z_n\|)$ to be arbitrarily close to $2 / pi > 1 / 4$.
This shows that $f$ is not strongly differentiable at $0$.

]
#proof[
#strong[of (b):] \ Let $f : bb(R) arrow.r bb(R)$ be any a function.Denote $ E : = { x in bb(R) divides f upright(" is strongly differentiable at ") x } $
WTS: $E$ is a Borel set.

Set for each $lambda in bb(R)\,m\,n in bb(N)$: $ E_(lambda\,m\,n) := { x in bb(R) divides\|f\(y\)- f\(z\)- lambda\(y - z\)\|lt.eq 1 / n\|y - z\|med #h(0em) #h(0em) forall y\,z in B_(1 / m)\(x\)} $
where $B_(1 / m)\(x\)$ denote the open ball centered at $x$ with radius $1 / m$.

Then by the definition of strongly differentiable, we have: $ E = union.big_(lambda in bb(R)) inter.big_(n in bb(N)) union.big_(m in bb(N)) E_(lambda\,m\,n) thin $
#strong[Claim 3.1: Each $E_(lambda\,m\,n)$ is open.] \ #strong[Proof of Claim 3.1:] Let $x in E_(lambda\,m\,n)$. Then
$ forall y\,z in B_(1\/m)\(x\)\,quad \| f\(y\)- f\(z\)- lambda\(y - z\)\| lt.eq 1 / n thin\|y - z\| $
In particular, the inequality holds for all $y\,z in B_(1\/\(2 m\))\(x\)$. Now consider $B_(1\/\(2 m\))\(x\)$, let $x' in B_(1\/\(2 m\))\(x\)$, then for every $y in B_(1\/\(2 m\))\(x'\)$, we have $ \|y - x\|lt.eq\|y - x'\|+\|x' - x\|< frac(1, 2 m) + frac(1, 2 m) = 1 / m $
so $B_(1\/\(2 m\))\(x'\)subset B_(1\/m)\(x\)$. Hence the inequality holds for all $y\,z in B_(1\/\(2 m\))\(x'\)$. This confirms that every $x in E_(lambda\,m\,n)$ has a neighborhood contained in $E_(lambda\,m\,n)$, proving that $E_(lambda\,m\,n)$ is open. \ \ Now that each $E_(lambda\,m\,n)$ is open, we have $union.big_(m in bb(N)) E_(lambda\,m\,n)$ is each for each $lambda\,n$\; thus each for each $lambda$, $med G_lambda := inter.big_(n in bb(N)) union.big_(m in bb(N)) E_(lambda\,m\,n)$ is a $G_delta$ set.

$ E = union.big_(lambda in bb(R)) G_lambda $
is a union of $G_delta$ sets.

\(I do not now how to deal with it then, it might be that we somehow reduce it to countable union of $G_delta$ sets, getting something like $E = union.big_(lambda in bb(Q)) G_lambda$ using the density of $bb(Q)$ in $bb(R)$, thus confirming that it is Borel.)
\-2. 这里的正解是: 要利用 density of $bb(Q)$ in $bb(R)$ 的话, 只需要考虑交换 set operation 的顺序就好了. 我们会发现其实: $ E = inter.big_(n in bb(N)) union.big_(lambda in bb(Q)) union.big_(m in bb(N)) E_(lambda\,m\,n) thin $就这么简单。。

]
#proof[
of extra credit: yes. 这个解法非常麻烦. 需要再多考虑两层.
令 $E_(lambda\,k\,l\,m\,n)$ 表示 the set of points $x$ s.t. $ \|f\(y\)- f\(z\)- lambda\(y - z\)\|lt.eq 1 / n\|y - z\| $
whenever $ 1 / 2^(l + 1)\(1 + 1 / 2^k\)lt.eq\|y - x\|lt.eq 1 / 2^(l - 1)\(1 - 1 / 2^k\)quad upright("and") quad\|z - x\|lt.eq 1 / 2^m\(1 - 1 / 2^k\) $
Claim: $ f upright(" is differentiable at x") upright(" iff ") x in E := inter.big_(n in bb(N)) union.big_(lambda in bb(Q)) union.big_(l in bb(N)) inter.big_(r gt.eq l) union.big_(m gt.eq 1) union.big_(k in bb(N)) E_(lambda\,k\,r\,m\,n) $

]
#heading(level: 2, numbering: none)[decreasing MCT: 成立当且仅当 integral 的 limit 是 finite 的]
<decreasing-mct-成立当且仅当-integral-的-limit-是-finite-的>
Let $\(f_n\)_1^oo$ be a #emph[decreasing] sequence of non-negative measurable functions on a measure space.

- Prove that if $lim_n integral f_n < oo$, then $lim_n integral f_n = integral lim_n f_n$.

- Give an example of a decreasing sequence $\(f_n\)_n$ of nonnegative measurable functions such that $lim_n integral f_n eq.not integral lim_n f_n$.

#emph[Hint]: use MCT correctly.

#proof[
#strong[of (a):] \ Since $\(f_n\)$ is a decreasing sequence, i.e. for every $x in X$ we have
$ f_1\(x\)gt.eq f_2\(x\)gt.eq f_3\(x\)gt.eq dots.h.c $
We can define the function
$ g_n\(x\)= f_1\(x\)- f_n\(x\) $ for each $n in bb(N)$. Then for the seq $\(g_n\(x\)\)$ we have:

- non-negatice: $g_n\(x\)gt.eq 0 #h(0em) #h(0em) forall x$ because $f_1\(x\)gt.eq f_n\(x\)$.

- increasing in $n$:$ g_n\(x\)= f_1\(x\)- f_n\(x\)lt.eq f_1\(x\)- f_m\(x\)= g_m\(x\)#h(0em) #h(0em) forall m gt.eq n\,forall x $ since $\(f_n\)$ is decreasing. \ \

Define $f\(x\):= lim_n f_n\(x\)in accent(bb(R), macron)$ for each $x in X$.

Since $f_n\(x\)$ decreases to $f\(x\):= lim_(n arrow.r oo) f_n\(x\)$, we have $ lim_(n arrow.r oo) g_n\(x\)= f_1\(x\)- lim_(n arrow.r oo) f_n\(x\)= f_1\(x\)- f\(x\) $
Now we #strong[apply MCT to the increasing sequence $\(g_n\)$]. We have:
$ lim_(n arrow.r oo) integral g_n thin d mu = integral \( lim_(n arrow.r oo) g_n \) thin d mu = integral\(f_1 - f\)thin d mu $
And since $lim_(n arrow.r oo) integral f_n thin d mu < oo$, we have$ lim_(n arrow.r oo) integral g_n thin d mu = integral f_1 thin d mu - integral f #h(0em) d mu $ Also, because of $lim_(n arrow.r oo) integral f_n thin d mu < oo$, #strong[$integral f_n$ is eventually finite]. Say, it is finite after $n gt.eq N in bb(N)$. We only need to consider $n gt.eq N$ when considering the limit behavior. \ Then for each $n gt.eq N$,
$ integral g_n thin d mu = integral \( f_1 - f_n \) thin d mu = integral f_1 thin d mu - integral f_n thin d mu $
\-2. 这里注意, 我们既然知道 $f_1$ 的 integral 未必 finite, 就不能这么定义 $g_n$. 正解是取 $N$ s.t. $integral f_N$ finite, 然后定义 $g_n := f_N - f_n$.
Taking the limit as $n arrow.r oo$, have
$ lim_(n arrow.r oo) integral g_n thin d mu = lim_(n arrow.r oo) (integral f_1 thin d mu - integral f_n thin d mu) = integral f_1 thin d mu - lim_(n arrow.r oo) integral f_n thin d mu $
by linearity of numerical sequence. \ Thus, combining with the result from MCT we have:
$ integral f_1 thin d mu - lim_(n arrow.r oo) integral f_n thin d mu = integral f_1 thin d mu - integral f #h(0em) d mu $
Rearrange to get:
$ lim_(n arrow.r oo) integral f_n thin d mu = integral f thin d mu\, $
which is exactly what we wanted to prove.

]
#solution[
#strong[of (b):] \ Consider defining $\(f_n : bb(R) arrow.r bb(R)\)_(n in bb(N))$ with
$ f_n\(x\)= chi_(\[n\,oo\))\(x\) $
Note that:

- #strong[$f_n$ is a decreasing seq]: For each $n$ and every $x in bb(R)$,$ f_(n + 1)\(x\)= chi_(\[n + 1\,oo\))\(x\)lt.eq chi_(\[n\,oo\))\(x\)= f_n\(x\) $
  since $\[n + 1\,oo\)subset\[n\,oo\)$.

- #strong[$\(f_n\)$ the pointwise limit]:$ lim_(n arrow.r oo) f_n\(x\)= 0 quad forall x in bb(R) $since for each $x$ there exists an $N$ (any integer greater than $x$) such that for all $n gt.eq N$, $x < n$ and hence $f_n\(x\)= 0$.

- For each $n$, $ integral_(bb(R)) f_n thin d lambda = integral_n^oo 1 thin d x = oo $
  But on the other hand
  $ integral_(bb(R)) \( lim_(n arrow.r oo) f_n \) thin d lambda = integral_(bb(R)) 0 thin d lambda = 0 $

Then we have the decreasing seq of function with
$ lim_(n arrow.r oo) integral f_n thin d lambda = oo quad upright("while") quad integral \( lim_(n arrow.r oo) f_n \) thin d lambda = 0 $
This shows that in the absence of the finiteness assumption, the limit and integration need not commute.

]
#heading(level: 2, numbering: none)[Vitali meet Cantor.]
<vitali-meet-cantor.>
Construct a function $f :\[0\,1\]arrow.r\[0\,1\]$ such that:

- $f$ fails to be Lebesgue measurable;

- there exists a compact subset $K subset\(0\,1\)$ of positive Lebesgue measure such that $f$ is differentiable at every point $x in K$.

#emph[Hint]: use the function $g\(x\)= inf {\|x - y\|divides y in K }$\; then square this with the title of the problem.

#solution[
Let $V$ be a Vitali set on $\[0\,1\]$, $C$ be the fat Cantor set on $\[0\,1\]$ by recursively taking away the middle open subinterval of length $1 / 4^n$ on the $n$th recursion.
We consider the function: $ f\(x\)= chi_V dot.op d\(x\,C\)^2 $
where $ d\(x\,C\):= { inf {\|x - y\|divides y in C } $
By Hw3, we know $V$ is not Lebesgue measurable, and $C$ is compact with positive Lebesgue measure $1 / 2$.

And since $f^(- 1)\({ 1 }\)= V$, mapping a not measurable set to a measurable set, #strong[$chi_V$ is not measurable function.]

And since the distance function $d\(x\,C\)$ is a continuous function of $\[0\,1\]$, it is measurable, by the result proved in class that a continuous funciton on a topological space is measurable.

#lemma(
)[
The product of a measurable $f : bb(R) arrow.r bb(R)_(> 0)$ and a not measurable $g : bb(R) arrow.r bb(R)$ is not measurable.

]
#strong[Proof of Lemma 4.2:]
$f$ measurable $arrow.r.double.long$ $1\/f$ measurable. Suppose for contradiction that $f g$ is measurable, then $g = 1 / f\(f g\)$ is the product of two measurable functions, thus measurable, contradicting the fact that $g$ is not measurable. Thus $f g$ is not measurable. \ \ #strong[Claim 5.1: $f$ is not measurable.]
#strong[Proof of claim 5.1:]
Thus on the open set $A =\[0\,1\]\\C$, $d\(x\,C\)^2$ is positive, so $chi_V\|_A d\(x\,C\)^2\|_A$ is not measurable since it is a product of measurable and not measurable function by lemma 4.2. Thus #strong[$f$ is not measurable,] otherwise its restriction on $A$ should also be measurable. \ \ #strong[Claim 5.2: $f$ is differentiable on $C$.]
#strong[Proof of claim 5.2:]
Fix $x in C$, then $f\(x\)= 0$. We want to show:$f'\(x\)= lim_(h arrow.r 0) frac(f\(x + h\)- f\(x\), h) = lim_(h arrow.r 0) frac(f\(x + h\), h)$ exists
Let $h > 0$.
Case 1: $x + h in.not V$, then $chi_V\(x + h\)= 0$, so we have $f\(x + h\)= chi_V\(x + h\)thin d\(x + h\,C\)^2= 0$, then
$frac(f\(x + h\), h) = 0$.
Case 2: $x + h in V$, we have: $ d\(x + h\,C\)= inf_(y in C)\|\(x + h\)- y\|lt.eq\|\(x + h\)- x\|=\|h\| $ So $ lr(|frac(f\(x + h\), h)|) = frac(d\(x + h\,C\)^2, \|h\|) lt.eq frac(\|h\|^2, \|h\|) =\|h\| $
Therefore for all cases we have:
$ lr(|frac(f\(x + h\)- f\(x\), h)|) = lr(|frac(f\(x + h\), h)|) lt.eq\|h\| $
This confirms that
$ f'\(x\)= lim_(h arrow.r 0) frac(f\(x + h\)- f\(x\), h) = 0 $

This finishes the proof of required properties of $f$.

]
=== harder Vitali meet Cantor (extra credit)
<harder-vitali-meet-cantor-extra-credit>
We change the requirement of (a) to be: \"the restriction of $f$ to any open interval $I subset\[0\,1\]$ fails to be Lebesgue measurable\". Then how can we make the construction?

#solution[
I don't know. \ 官方答案: 我在前一问给出的 $ f\(x\)= chi_V dot.op d\(x\,C\)^2 $ 这个函数, 同样也是满足这一问的答案. (对于 $C$, 不仅可以选择 fat Cantor set, 实际上任何 choice of compact nowhere dense set 都可以.)

]
