#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 5]
<homework-5>
#heading(level: 2, numbering: none)[Problem 1]
<problem-1>
Let $(U_i)_(i in bb(N))$ be an i.i.d sequence
of random variables with $U_i tilde.op U\(\[0\,1\]\)$. Show that

- $lim_(n arrow.r oo) (U_1 U_2 dots.h U_n)^(1\/n) = e^(- 1)$ almost surely.

- $lim_(n arrow.r oo) U_1 U_2 dots.h U_n = 0$ almost surely.

#proof[

- Let
  $ X_i := - log U_i\,quad i in bb(N) $
  Since $U_i tilde.op U\(\[0\,1\]\)$, for $x gt.eq 0$,
  $ bb(P)\(X_i lt.eq x\)= bb(P)\(- log U_i lt.eq x\)= bb(P)\(U_i gt.eq e^(- x)\)= 1 - e^(- x) $
  Thus $X_i tilde.op upright(E x p)\(1\)$, so
  $bb(E)\[X_i\]= 1$.
  Also,
  $ log (\( U_1 U_2 dots.h.c U_n \)^(1\/n)) = 1 / n sum_(i = 1)^n log U_i = - 1 / n sum_(i = 1)^n X_i $
  By the Strong Law of Large Numbers,
  $ 1 / n sum_(i = 1)^n X_i = 1 / n sum_(i = 1)^n log U_i arrow.r 1 quad upright("a.s.") $
  Since the exponential function is continuous,
  $ \(U_1 U_2 dots.h.c U_n\)^(1\/n)= exp (1 / n sum_(i = 1)^n log U_i) arrow.r e^(- 1) quad upright("a.s.") $

- Let
  $ P_n := U_1 U_2 dots.h.c U_n $
  Then from the first part we instantly have
  $ P_n^(1\/n) arrow.r e^(- 1) < 1 quad upright("a.s.") $
  Then for any event $omega$ in the event of probability one where this convergence holds,
  choose $r$ s.t.
  $e^(- 1) < r < 1$,
  then for all sufficiently large $n$,
  $ P_n\(omega\)^(1\/n)< r\,quad upright("i.e.") quad P_n\(omega\)< r^n $
  Since $0 < r < 1$, we have $r^n arrow.r 0$. Therefore
  $P_n\(omega\)arrow.r 0$. Therefore
  $ U_1 U_2 dots.h.c U_n arrow.r 0 quad upright("a.s.") $

]
#heading(level: 2, numbering: none)[Problem 2]
<problem-2>
A factory produces small resistors, and the resistance of each resistor
is a random variable $X_i$ with unknown mean $mu$ and variance $sigma^2 = 0.25$ ohms $""^2$.
The quality control engineer wants to estimate the average resistance of a batch.
She decides to measure $n$ resistors and compute the sample average
$ macron(X)_n := frac(X_1 + X_2 + dots.h.c + X_n, n) $

Determine approximately the number of resistors $n$
she needs to measure so that the probability that
the sample mean differs from the true mean by more than 0.005 ohms
is less than $1 %$, i.e.,
$ bb(P) (lr(|macron(X)_n - mu|) > 0.005) < 0.01 $

#proof[
By linearity of expectation,
$ bb(E)\[macron(X)_n\]= mu $
And (assmuming the $X_i$ are independent), we have
$ upright(V a r) (sum_(i = 1)^n X_i) = sum_(i = 1)^n upright(V a r)\(X_i\)+ sum_(i eq.not j) upright(C o v)\(X_i\,X_j\)= n sigma^2 = 0.25 n $
Thus
$ upright(V a r)\(macron(X)_n\)= sigma^2 / n = 0.25 / n $
By Chebyshev's inequality, for any $epsilon > 0$,
$ bb(P) (\| macron(X)_n - mu \| > epsilon) lt.eq frac(upright(V a r)\(macron(X)_n\), epsilon^2) $
Taking $epsilon = 0.005$, we get
$ bb(P) (\| macron(X)_n - mu \| > 0.005) lt.eq frac(0.25\/n, \(0.005\)^2) = frac(0.25, n dot.op 0.000025) = 10000 / n $
We want this upper bound to be less than $0.01$,
so it is enough to require
$ 10000 / n < 0.01 $
Therefore, she needs to measure approximately
$n approx 1\,000\,000$
resistors.

]
#heading(level: 2, numbering: none)[Problem 3]
<problem-3>
Let $(X_n)_(n in bb(N))$ be a sequence of random variables
with $bb(P) (X_n eq.not 0) = 1\/n^2$ for all $n in bb(N)$.
Show that with probability 1,
there exists an $n_0 in bb(N)$ such that $X_n = 0$ for all $n gt.eq n_0$.

#proof[
Let
$ A_n := { X_n eq.not 0 }\,quad n in bb(N) $
Then
$bb(P)\(A_n\)= 1 / n^2$ by assumption.
Hence
$ sum_(n = 1)^oo bb(P)\(A_n\)= sum_(n = 1)^oo 1 / n^2 < oo $
By Borel-Cantelli lemma,
$ bb(P) (limsup_(n arrow.r oo) A_n) = 0 $
So with probability $1$, only finitely many of the events $A_n$ occur. In other words, with probability $1$, there exists $n_0 in bb(N)$ such that for all $n gt.eq n_0$,
$ A_n^c = { X_n = 0 } $
occurs. Equivalently,
$ X_n = 0 #h(2em) upright("for all ") n gt.eq n_0 $

Therefore, with probability $1$, there exists $n_0 in bb(N)$ such that $X_n = 0$ for all $n gt.eq n_0$.

]
#heading(level: 2, numbering: none)[Problem 4]
<problem-4>
Assume that $(X_n)_(n in bb(N))$ be a sequence of i.i.d random variables
with density
$ f\(x\)= cases(delim: "{", frac(1, 2 sqrt(x))\, & upright(" if ") x in\(0\,1\)\,, 0\, & upright(" otherwise ")) $

- Find the distribution function of $X_1$.

- Let $Y_n = min {X_1 \, dots.h \, X_n}$ for any $n in bb(N)$.
  Show that $n^2 Y_n arrow.r^d Y$, where $Y$ has distribution function
  $ F_Y\(x\)= cases(delim: "{", 0\, & upright(" if ") x lt.eq 0, 1 - e^(- sqrt(x))\, & upright(" otherwise ")) $

#proof[

- For $x in bb(R)$,
  $ F_(X_1)\(x\)= bb(P)\(X_1 lt.eq x\)= integral_(- oo)^x f\(t\)thin d t = cases(delim: "{", 0\, & x lt.eq 0\,, integral_0^x frac(1, 2 sqrt(t)) thin d t = sqrt(x)\, & 0 < x < 1\,, 1\, & x gt.eq 1 .) $

- If $x lt.eq 0$, then $n^2 Y_n gt.eq 0$, so
  $ bb(P)\(n^2 Y_n lt.eq x\)= 0 $
  Now consider $x > 0$. Then
  $ bb(P)\(n^2 Y_n > x\)= bb(P) (Y_n > x / n^2) $
  Since
  $ Y_n > x / n^2 arrow.l.r.double X_1 > x / n^2\,dots.h\,X_n > x / n^2 $
  and the $X_i$ are independent,
  $ bb(P) (Y_n > x / n^2) = (bb(P) (X_1 > x / n^2))^n $
  For all sufficiently large $n$, we have $0 < x / n^2 < 1$, hence
  $ bb(P) (X_1 > x / n^2) = 1 - F_(X_1) (x / n^2) = 1 - sqrt(x / n^2) = 1 - sqrt(x) / n $
  Therefore,
  $ bb(P)\(n^2 Y_n > x\)= (1 - sqrt(x) / n)^n $
  so
  $ F_(n^2 Y_n)\(x\)= bb(P)\(n^2 Y_n lt.eq x\)= 1 - (1 - sqrt(x) / n)^n $
  Taking $n arrow.r oo$, we use the standard limit
  $ (1 - a / n)^n arrow.r e^(- a) $
  with $a = sqrt(x)$, we obtain
  $ F_(n^2 Y_n)\(x\)arrow.r 1 - e^(- sqrt(x))\,quad x > 0 $
  Thus,
  $ F_(n^2 Y_n)\(x\)arrow.r cases(delim: "{", 0\, & x lt.eq 0\,, 1 - e^(- sqrt(x))\, & x > 0) $
  which is exactly $F_Y\(x\)$. Hence
  $ n^2 Y_n arrow.r^d Y $

]
#heading(level: 2, numbering: none)[Problem 5]
<problem-5>
Let $(X_n)_(n in bb(N))$ be a sequence of random variables
with values in $bb(R)$.
Show that there exists a sequence $(a_n)_(n in bb(N))$ with $a_n > 0$ such that
$ X_n / a_n arrow.r^(upright(" a.s. ")) 0 $
For simplicity you may assume that $X_n tilde.op "Exp"\(1\/n\)$.

Hint: For any $n in bb(N)$ construct $b_n$ such that
$bb(P) (lr(|X_n|) gt.eq b_n) lt.eq 1 / 2^n$
and use Borel-Cantelli for the events ${lr(|X_n|) \/ b_n gt.eq n}$.

#proof[
For each $n in bb(N)$, choose $b_n > 0$ such that
$ bb(P)\(\|X_n\|gt.eq b_n\)lt.eq 1 / 2^n $
Notice such a choice is always possible, since $\|X_n\|$ is a well-defined
random variable, which implies $bb(P)\(\|X_n\|gt.eq t\)arrow.r 0$ as $t arrow.r oo$.

Now define
$ a_n := n b_n > 0 $
Consider the sequence of events
$ E_n := {frac(\|X_n\|, a_n) gt.eq 1 / n} $
By the definition of $a_n$, we have
$ E_n = {frac(\|X_n\|, n b_n) gt.eq 1 / n} = {\|X_n\|gt.eq b_n } $
It follows that
$ sum_(n = 1)^oo bb(P)\(E_n\)= sum_(n = 1)^oo bb(P)\(\|X_n\|gt.eq b_n\)lt.eq sum_(n = 1)^oo 1 / 2^n < oo $
By the first Borel-Cantelli lemma,
$ bb(P)\(E_n upright(" infinitely often")\)= 0 $
This means that for almost all $omega in Omega$,
there exists $N\(omega\)in bb(N)$ such that: for all
$n gt.eq N\(omega\)$, the event $E_n$ does not occur,
i.e.,
$ frac(\|X_n\(omega\)\|, a_n) < 1 / n $
Since $1\/n arrow.r 0$ as $n arrow.r oo$, it follows immediately that
$ X_n / a_n arrow.r 0 quad upright("a.s.") $
If we assume $X_n tilde.op upright(E x p)\(1\/n\)$,
we can provide an explicit sequence.
Since
$ bb(P)\(X_n gt.eq t\)= e^(- t\/n) quad upright("for ") t gt.eq 0 $
we can choose $b_n = n^2 log 2$. So that
$ bb(P)\(X_n gt.eq b_n\)= e^(-\(n^2 log 2\)\/n) = e^(- n log 2) = 1 / 2^n $
Then $a_n = n b_n = n^3 log 2$, the general argument above guarantees that
$ X_n / a_n = frac(X_n, n^3 log 2) arrow.r^(upright("a.s.")) 0 $
This completes the proof.

]
#heading(level: 2, numbering: none)[Problem 6]
<problem-6>
Let ${X_i}_(i gt.eq 1)$ be i.i.d. positive integer-valued random variables
with $0 < bb(E) [X_1] < oo$.
Interpret $X_i$ as the number of children in family $i$.
From the first $n$ families, choose a child uniformly at random among all children.
Let $N_n$ denote the number of children in the selected child's family.
Show that $N_n arrow.r^d X_1^(*)$, where $X_1^(*)$ has distribution

$ bb(P) (X_1^(*) = k) = frac(k bb(P) (X_1 = k), bb(E) [X_1]) $

#proof[
For each $n in bb(N)$, let
$ S_n := X_1 + dots.h.c + X_n $
be the total number of children in the first $n$ families.

Given $X_1\,dots.h\,X_n$, we choose one child uniformly
at random among these $S_n$ children.
Hence, conditionally on $X_1\,dots.h\,X_n$,
the probability that the chosen child comes from a family
with exactly $k$ children is
$ bb(P)\(N_n = k divides X_1\,dots.h\,X_n\)= frac(sum_(i = 1)^n X_i upright(bold(1))_({ X_i = k }), S_n) $
Since $X_i upright(bold(1))_({ X_i = k }) = k upright(bold(1))_({ X_i = k })$, this becomes
$ bb(P)\(N_n = k divides X_1\,dots.h\,X_n\)= frac(k sum_(i = 1)^n upright(bold(1))_({ X_i = k }), S_n) = frac(k dot.op 1 / n sum_(i = 1)^n upright(bold(1))_({ X_i = k }), 1 / n sum_(i = 1)^n X_i) $

By the Strong Law of Large Numbers,
$ 1 / n sum_(i = 1)^n upright(bold(1))_({ X_i = k }) arrow.r bb(E)\[upright(bold(1))_({ X_1 = k })\]= bb(P)\(X_1 = k\)quad upright("a.s.") $
and
$ 1 / n sum_(i = 1)^n X_i arrow.r bb(E)\[X_1\]quad upright("a.s.") $
Since $0 < bb(E)\[X_1\]< oo$, it follows that
$ bb(P)\(N_n = k divides X_1\,dots.h\,X_n\)arrow.r frac(k bb(P)\(X_1 = k\), bb(E)\[X_1\]) quad upright("a.s.") $

Taking expectations on both sides, and using dominated convergence because
$0 lt.eq bb(P)\(N_n = k divides X_1\,dots.h\,X_n\)lt.eq 1$,
we obtain
$ bb(P)\(N_n = k\)= bb(E) #scale(x: 120%, y: 120%)[\[] bb(P)\(N_n = k divides X_1\,dots.h\,X_n\)#scale(x: 120%, y: 120%)[\]] arrow.r frac(k bb(P)\(X_1 = k\), bb(E)\[X_1\]) $
Thus, for every $k in bb(N)$,
$ bb(P)\(N_n = k\)arrow.r bb(P)\(X_1^(*) = k\) $
Hence
$ N_n arrow.r^d X_1^(*) $

]
