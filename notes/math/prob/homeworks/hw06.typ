#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 6]
<homework-6>
#heading(level: 2, numbering: none)[Problem 1]
<problem-1>
Let $X$ be a random variable such that
$bb(E) [lr(|X|)] < oo$,
that is $X in L^1$.
Denote by $phi.alt_X\(t\):= bb(E) [e^(i t X)]\,t in bb(R)$,
its characteristic function.

- Show that $phi.alt_X$ is differentiable with
  $phi.alt'_X\(t\)= i bb(E) [X e^(i t X)]$. (Hint: DCT)

- If, in addition, $X$ has symmetric distribution(i.e. $X\,- X$ have the same distribution),
  then show that $phi.alt_X\(t\)in bb(R)$ for any $t in bb(R)$.

#proof[

- Fix $t in bb(R)$. Consider the difference quotient
  $ frac(phi.alt_X\(t + h\)- phi.alt_X\(t\), h) = bb(E) [e^(i t X) frac(e^(i h X) - 1, h)] $
  Notice we have (for a.e. $omega$):
  $ lim_(h arrow.r 0) frac(e^(i h X) - 1, h) = i X $
  Hence
  $ e^(i t X) frac(e^(i h X) - 1, h) arrow.r i X e^(i t X) quad upright("a.s.") quad upright("as ") h arrow.r 0 $

  Using the mean value theorem for the function
  $u mapsto e^(i u X)$, for $\|h\|lt.eq 1$ we have
  $ lr(|frac(e^(i h X) - 1, h)|) lt.eq\|X\| $
  Also, $\|e^(i t X)\|= 1$, so
  $ lr(|e^(i t X) frac(e^(i h X) - 1, h)|) =\|e^(i t X)\|lr(|frac(e^(i h X) - 1, h)|) lt.eq\|X\| $
  Since $X in L^1$, we have $bb(E)\[\|X\|\]< oo$, therefore $\|X\|$
  is a dominating integrable random variable for $e^(i t X) frac(e^(i h X) - 1, h)$.
  Then by DCT,
  $ lim_(h arrow.r 0) frac(phi.alt_X\(t + h\)- phi.alt_X\(t\), h) = bb(E) [lim_(h arrow.r 0) e^(i t X) frac(e^(i h X) - 1, h)] = bb(E)\[i X e^(i t X)\] $
  Thus $phi.alt_X$ is differentiable and
  $ phi.alt'_X\(t\)= i bb(E)\[X e^(i t X)\] $

- Since random
  variables with the same distribution
  have the same expectation under measurable functions for which the
  expectation exists, we get
  $ phi.alt_X\(t\)= bb(E)\[e^(i t X)\]= bb(E)\[e^(i t\(- X\))\]= bb(E)\[e^(- i t X)\]= phi.alt_X\(- t\) $
  On the other hand since
  $phi.alt_X\(- t\)= accent(phi.alt_X\(t\), macron)$, we thus have
  $ phi.alt_X\(t\)= accent(phi.alt_X\(t\), macron) $
  A complex number equal to its own conjugate must be real. Therefore,
  $ phi.alt_X\(t\)in bb(R)\,#h(2em) forall t in bb(R) $
  Writing
  $ phi.alt_X\(t\)= bb(E)\[cos\(t X\)\]+ i bb(E)\[sin\(t X\)\] $
  Since $X$ is symmetric, $sin\(t x\)$ is odd, so
  $ bb(E)\[sin\(t X\)\]= 0 $
  Therefore $phi.alt_X\(t\)= bb(E)\[cos\(t X\)\]in bb(R)$.

]
#heading(level: 2, numbering: none)[Problem 2]
<problem-2>
Let $X tilde.op "Bin"\(n\,p\)$,
where $n in bb(N)\,p in\(0\,1\)$ and
$Y tilde.op "Pois"\(lambda\)$,
where $lambda > 0$.

- Compute the characteristic functions of $X\,Y$.

- Let $(p_n)_(n in bb(N))$ be a sequence in $\(0\,1\)$
  such that $lim_(n arrow.r oo) n p_n = lambda$
  and $(X_n)_(n in bb(N))$ be a sequence of random variables
  with $X_n tilde.op "Bin" (n \, p_n)$.
  Show that $X_n arrow.r^d Y$.

#proof[

- We have
  $ bb(P)\(X = k\)= binom(n, k) p^k\(1 - p\)^(n - k)\,quad k = 0\,1\,dots.h\,n $
  Therefore,
  $ phi.alt_X\(t\)= bb(E)\[e^(i t X)\]= sum_(k = 0)^n e^(i t k) binom(n, k) p^k\(1 - p\)^(n - k) $
  We factor $e^(i t k)$ into $\(p e^(i t)\)^k\/p^k$ and obtain
  $ phi.alt_X\(t\)= sum_(k = 0)^n binom(n, k)\(p e^(i t)\)^k\(1 - p\)^(n - k) $
  By the binomial formula,
  $ phi.alt_X\(t\)=\(1 - p + p e^(i t)\)^n $

  Next for $Y tilde.op "Pois"\(lambda\)$ we have
  $ bb(P)\(Y = k\)= e^(- lambda) frac(lambda^k, k !)\,quad k = 0\,1\,2\,dots.h $
  Hence
  $ phi.alt_Y\(t\)= bb(E)\[e^(i t Y)\]= sum_(k = 0)^oo e^(i t k) e^(- lambda) frac(lambda^k, k !) $
  Thus
  $ phi.alt_Y\(t\)= e^(- lambda) sum_(k = 0)^oo frac(\(lambda e^(i t)\)^k, k !) = e^(- lambda) e^(lambda e^(i t)) = e^(lambda\(e^(i t) - 1\)) $

  So the characteristic functions are
  $ phi.alt_X\(t\)=\(1 - p + p e^(i t)\)^n\,quad phi.alt_Y\(t\)= e^(lambda\(e^(i t) - 1\)) $

- By part (a),
  $ phi.alt_(X_n)\(t\)=\(1 - p_n + p_n e^(i t)\)^n= (1 + p_n \( e^(i t) - 1 \))^n $
  We now compute the limit as $n arrow.r oo$.

  Set
  $ a_n := p_n\(e^(i t) - 1\) $
  Since $p_n arrow.r 0$ (as $n p_n arrow.r lambda < oo$),
  we have $a_n arrow.r 0$. Therefore,
  $ log\(1 + a_n\)arrow.r a_n\,quad n arrow.r oo $
  Hence
  $ n log\(1 + a_n\)arrow.r n a_n = n p_n\(e^(i t) - 1\)arrow.r.double.long lambda\(e^(i t) - 1\) $
  Exponentiating, we get
  $ phi.alt_(X_n)\(t\)= exp #scale(x: 120%, y: 120%)[\(] n log\(1 + a_n\)#scale(x: 120%, y: 120%)[\)] arrow.r exp #scale(x: 120%, y: 120%)[\(] lambda\(e^(i t) - 1\)#scale(x: 120%, y: 120%)[\)] $
  But by part (a),
  $ exp #scale(x: 120%, y: 120%)[\(] lambda\(e^(i t) - 1\)#scale(x: 120%, y: 120%)[\)] = phi.alt_Y\(t\) $
  Thus for every $t in bb(R)$,
  $ phi.alt_(X_n)\(t\)arrow.r phi.alt_Y\(t\) $

  Since $phi.alt_Y$ is the characteristic function
  of $Y tilde.op "Pois"\(lambda\)$, by the uniqueness theorem
  for characteristic functions, this implies
  $ X_n arrow.r^d Y $

]
#heading(level: 2, numbering: none)[Problem 3]
<problem-3>
Show that

$ lim_(n arrow.r oo) integral_0^(n\/2) frac(2^n, \(n - 1\)!) t^(n - 1) e^(- 2 t) d t = 1 / 2 $
Hint: Observe that the integral is the probability of an event
related to a Gamma distribution. Can we apply the central limit theorem?

#proof[
Let
$ I_n := integral_0^(n\/2) frac(2^n, \(n - 1\)!) t^(n - 1) e^(- 2 t) thin d t $
Then
$ f_n\(t\)= frac(2^n, \(n - 1\)!) t^(n - 1) e^(- 2 t) upright(bold(1))_(\(0\,oo\))\(t\) $
is the density of a Gamma distribution with parameters $\(n\,2\)$, that is,
$T_n tilde.op Gamma\(n\,2\)$.
Hence
$ I_n = bb(P)\(T_n lt.eq n\/2\) $

Now let $X_1\,X_2\,dots.h$ be i.i.d. random variables with
$ X_i tilde.op "Exp"\(2\) $
We know that
$ T_n = X_1 + dots.h.c + X_n $
Also,
$ mu := bb(E)\[X_1\]= 1 / 2\,quad sigma^2 := "Var"\(X_1\)= 1 / 4 $

Therefore,
$ I_n = bb(P)\(X_1 + dots.h.c + X_n lt.eq n\/2\)= bb(P) #h(-1em) (frac(T_n - n mu, sigma sqrt(n)) lt.eq 0) $
Since $mu = 1\/2$ and $sigma = 1\/2$, this is
$ I_n = bb(P) #h(-1em) (frac(T_n - n\/2, sqrt(n)\/2) lt.eq 0) $

By the Central Limit Theorem,
$ frac(T_n - n mu, sigma sqrt(n)) = frac(T_n - n\/2, sqrt(n)\/2) arrow.r^d Z\,quad Z tilde.op N\(0\,1\) $
Hence, since the standard normal distribution function is continuous at $0$,
$ lim_(n arrow.r oo) I_n = lim_(n arrow.r oo) bb(P) #h(-1em) (frac(T_n - n\/2, sqrt(n)\/2) lt.eq 0) = bb(P)\(Z lt.eq 0\)= 1 / 2 $
Thus
$ lim_(n arrow.r oo) integral_0^(n\/2) frac(2^n, \(n - 1\)!) t^(n - 1) e^(- 2 t) d t = 1 / 2 $

]
#heading(level: 2, numbering: none)[Problem 4]
<problem-4>
A casino offers the following random game:
A player rolls a fair die once.
If the outcome is 2 or 4, then the player wins 3 euros from the casino.
If the outcome is $1\,3\,5$, then the player loses 4 euros to the casino.
If the outcome is 6 , then the player neither wins nor loses.
If 90 players play the above game independently,
find approximately the probability that the casino wins
at least 30 euros in total.

#solution[
Let $X_i$ be the gain of the casino from the $i$-th player, for $i = 1\,dots.h\,90$. Then the random variables
$X_1\,dots.h\,X_90$ are independent and identically distributed, with
$ X_i = cases(delim: "{", - 3\, & upright("if the player wins 3 euros"), 4\, & upright("if the player loses 4 euros"), 0\, & upright("if the outcome is 6")) $
Since the die is fair, we have
$ bb(P)\(X_i = - 3\)= 2 / 6 = 1 / 3\,#h(2em) bb(P)\(X_i = 4\)= 3 / 6 = 1 / 2\,#h(2em) bb(P)\(X_i = 0\)= 1 / 6 $

Let
$ S_90 = X_1 + dots.h.c + X_90 $
be the total gain of the casino after 90 players. We want to approximate
$ bb(P)\(S_90 gt.eq 30\) $

We first compute the mean and variance of $X_1$. The mean is
$ mu := bb(E)\[X_1\]=\(- 3\)dot.op 1 / 3 + 4 dot.op 1 / 2 + 0 dot.op 1 / 6 = - 1 + 2 = 1 $
Also,
$ bb(E)\[X_1^2\]= 9 dot.op 1 / 3 + 16 dot.op 1 / 2 + 0 = 3 + 8 = 11 $
Hence
$ sigma^2 := "Var"\(X_1\)= bb(E)\[X_1^2\]- mu^2 = 11 - 1 = 10 $

Therefore,
$ bb(E)\[S_90\]= 90 mu = 90\,quad "Var"\(S_90\)= 90 sigma^2 = 900 $
So the standard deviation of $S_90$ is
$ sqrt(900) = 30 $

By the Central Limit Theorem,
$ frac(S_90 - 90, 30) approx N\(0\,1\) $
Thus,
$ bb(P)\(S_90 gt.eq 30\)= bb(P) (frac(S_90 - 90, 30) gt.eq frac(30 - 90, 30)) approx bb(P)\(Z gt.eq - 2\) $
where $Z tilde.op N\(0\,1\)$. Since
$ bb(P)\(Z gt.eq - 2\)= bb(P)\(Z lt.eq 2\)approx 0.9772 $
we conclude that
$ bb(P)\(S_90 gt.eq 30\)approx 0.9772 $
Hence, the probability that the casino wins at least 30 euros in total is
approximately 0.9772.

]
#heading(level: 2, numbering: none)[Problem 5]
<problem-5>
Assume that $(X_n)_(n in bb(N))$ is an i.i.d.
sequence of random variables such that $bb(E) [X_1] = 0$
and $bb(E) [X_1^2] = 1$. Show that
$ frac(sum_(i = 1)^n X_i, sqrt(sum_(i = 1)^n X_i^2)) arrow.r^d Z\,quad Z tilde.op N\(0\,1\) $

#proof[
Let
$ S_n := sum_(i = 1)^n X_i\,quad Q_n := sum_(i = 1)^n X_i^2 $
We want to show that
$ S_n / sqrt(Q_n) arrow.r^d Z\,quad Z tilde.op N\(0\,1\) $

First, since $\(X_n\)_(n in bb(N))$ are i.i.d. with
$bb(E)\[X_1\]= 0\,$ and $bb(E)\[X_1^2\]= 1$,
we have $"Var"\(X_1\)= 1$.
And thus by the Central Limit Theorem,
$ S_n / sqrt(n) arrow.r^d Z\,quad Z tilde.op N\(0\,1\) $
And then, consider $Q_n$.
Since $\(X_i^2\)$ are i.i.d. and $bb(E)\[X_1^2\]= 1 < oo$,
by the Law of Large Numbers we have
$ Q_n / n arrow.r^P 1 $
By continuity of the square root function,
$ sqrt(Q_n / n) arrow.r^P 1 $

Write
$ S_n / sqrt(Q_n) = S_n / sqrt(n) dot.op 1 / sqrt(Q_n\/n) $

Define
$ A_n := S_n / sqrt(n)\,quad B_n := 1 / sqrt(Q_n\/n) $
Then we have shown that
$A_n arrow.r^d Z$ and $B_n arrow.r^P 1$.

#strong[Now we claim that:
$A_n B_n arrow.r^d Z$.]

It suffices to show that $bb(E)\[f\(A_n B_n\)\]arrow.r bb(E)\[f\(Z\)\]$
for every bounded continuous function $f : bb(R) arrow.r bb(R)$.

Let $f : bb(R) arrow.r bb(R)$ be bounded and continuous.
Then
$ bb(E)\[f\(A_n B_n\)\]- bb(E)\[f\(Z\)\]= #scale(x: 120%, y: 120%)[\(] bb(E)\[f\(A_n B_n\)\]- bb(E)\[f\(A_n\)\]#scale(x: 120%, y: 120%)[\)] + #scale(x: 120%, y: 120%)[\(] bb(E)\[f\(A_n\)\]- bb(E)\[f\(Z\)\]#scale(x: 120%, y: 120%)[\)] $

Since $A_n arrow.r^d Z$, the second term converges to $0$.
It remains to show that
$bb(E)\[f\(A_n B_n\)\]- bb(E)\[f\(A_n\)\]arrow.r 0$.

Observe
$A_n B_n - A_n = A_n\(B_n - 1\)$.
Because $A_n arrow.r^d Z$, the sequence $\(A_n\)$ is tight.
Also, since $B_n arrow.r^P 1$, we have
$ B_n - 1 arrow.r^P 0 $
It follows that
$ A_n\(B_n - 1\)= A_n B_n - A_n arrow.r^P 0 $

We now show that
$ f\(A_n B_n\)- f\(A_n\)arrow.r^P 0 $
Fix $epsilon > 0$. Since $\(A_n\)$ is tight, there exists $M > 0$ such that
$ sup_(n gt.eq 1) bb(P)\(\|A_n\|> M\)< epsilon $
Since $f$ is continuous on the compact interval $\[- M - 1\,M + 1\]$, it is uniformly continuous there. Thus there
exists $delta > 0$ such that whenever $x\,y in\[- M - 1\,M + 1\]$ and $\|x - y\|< delta$,
we have
$ \|f\(x\)- f\(y\)\|< epsilon $
Now on the event
$ {\|A_n\|lt.eq M\,med\|A_n B_n - A_n\|< min\(delta\,1\)} $
we also have $\|A_n B_n\|lt.eq M + 1$, so
$ \|f\(A_n B_n\)- f\(A_n\)\|< epsilon $
Therefore,
$ bb(P) #scale(x: 120%, y: 120%)[\(]\|f\(A_n B_n\)- f\(A_n\)\|> epsilon #scale(x: 120%, y: 120%)[\)] lt.eq bb(P)\(\|A_n\|> M\)+ bb(P)\(\|A_n B_n - A_n\|gt.eq min\(delta\,1\)\) $
The first term is less than $epsilon$,
and the second term tends to $0$. Hence
$ f\(A_n B_n\)- f\(A_n\)arrow.r^P 0 $

Since $f$ is bounded, the random variables $f\(A_n B_n\)- f\(A_n\)$ are uniformly
bounded. Therefore,
$ bb(E)\[f\(A_n B_n\)- f\(A_n\)\]arrow.r 0 $
Combining this with
$bb(E)\[f\(A_n\)\]arrow.r bb(E)\[f\(Z\)\]$,
we get
$ bb(E)\[f\(A_n B_n\)\]arrow.r bb(E)\[f\(Z\)\] $
Thus
$ A_n B_n arrow.r^d Z $
This finishes the proof that
$ S_n / sqrt(Q_n) = A_n B_n arrow.r^d Z $
That is,
$ frac(sum_(i = 1)^n X_i, sqrt(sum_(i = 1)^n X_i^2)) arrow.r^d Z\,quad Z tilde.op N\(0\,1\) $

]
