#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 2]
<homework-2>
#heading(level: 2, numbering: none)[Problem 1]
<problem-1>
Suppose that the cumulative distribution function (CDF) of a random variable $F : bb(R) arrow.r bb(R)$ is strictly increasing and continuous. Let $U$ be a random variable with the uniform distribution on $\(0\,1\)$ and define
$ X := F^(- 1)\(U\) $
Show that $X$ has CDF equal to $F$.
This exercise shows us how to construct a random variable with given distribution, assuming that we have a uniform random variable.

#proof[
Since $F$ is strictly increasing and continuous,
it has an inverse function $F^(- 1)$ on its range,
and $F^(- 1)$ is also strictly increasing. Thus for any $x\,y in bb(R)$,
$ F^(- 1)\(y\)lt.eq x arrow.l.r.double y lt.eq\(F^(- 1)\)^(- 1)\(x\)= F\(x\) $
Therefore for any $x in bb(R)$, we have
$ { x divides X\(x\)lt.eq x } = { x divides F^(- 1)\(U\(x\)\)lt.eq x } = { x divides U\(x\)lt.eq F\(x\)} $

Therefore
$ bb(P)\(X lt.eq x\)= bb(P)\(U\(x\)lt.eq F\(x\)\) $
Since $U tilde.op upright(U n i f)\(0\,1\)$ and for a CDF we have $F\(x\)in\[0\,1\]$, we get
$ bb(P)\(U\(x\)lt.eq F\(x\)\)= F\(x\) $
Thus for all $x$ $bb(P)\(X lt.eq x\)= F\(x\)$, i.e., the CDF of $X$ equals $F$.

]
#heading(level: 2, numbering: none)[Problem 2]
<problem-2>
A gas station fills its tank completely once a week.
Let the weekly sales volume (in thousands of liters) be a random variable with density
$ f\(x\)= cases(delim: "{", a\(1 - x\)^4\, & x in\(0\,1\)\,, 0\, & upright(" otherwise ")) $
Find the constant $a$. What should be the tank capacity
so that the probability of running out of fuel during a given week is $1\/100$ ?

#solution[
Since the density integrates to 1,
$ 1 = integral_(- oo)^oo f\(x\)thin d x = integral_0^1 a\(1 - x\)^4thin d x = a integral_0^1\(1 - x\)^4thin d x $
Let $u = 1 - x$, then
$ integral_0^1\(1 - x\)^4d x = integral_0^1 u^4 d u = 1 / 5 $So $1 / 5 a = 1$, which gives
$ a = 5 $
Now we look for the tank capacity $c$ such that $bb(P)\(X > c\)= 1 / 100$. \ Let the tank capacity be $c$ (in thousands of liters).
Running out of fuel in a week occurs when sales exceed $c$, i.e., the event ${ X > c }$. We need
$ bb(P)\(X > c\)= 1 / 100 $
Since $a = 5$,
$ bb(P)\(X > c\)= integral_c^1 5\(1 - x\)^4thin d x $
Again let $u = 1 - x$, then we have
$ integral_c^1 5\(1 - x\)^4d x = 5 integral_(1 - c)^0 u^4\(- d u\)= 5 integral_0^(1 - c) u^4 d u = 5 dot.op frac(\(1 - c\)^5, 5) =\(1 - c\)^5 $
Therefore
$ \(1 - c\)^5= 1 / 100 arrow.r.double.long 1 - c = 100^(- 1\/5) = 10^(- 2\/5) arrow.r.double.long c = 1 - 10^(- 2\/5) $
So the tank capacity should be $1 - 10^(- 2\/5)$ thousand liters.

]
#heading(level: 2, numbering: none)[Problem 3]
<problem-3>
Let the random variable $X$ have density
$ f_X\(x\)= cases(delim: "{", frac(1, 2 x^2)\, & \|x\|gt.eq 1\,, 0\, & \|x\|< 1 .) $
Find the probability density function of $Y := X^2$ and
compute the probability $bb(P)\(2 Y + 3 lt.eq 10\)$.

#solution[
Since $f_X\(x\)= 0$ for $\|x\|< 1$, we have $bb(P)\(\|X\|gt.eq 1\)= 1$. Hence $Y = X^2 gt.eq 1$ almost surely, so $F_Y\(y\)= 0$ for $y < 1$ and therefore $f_Y\(y\)= 0$ for $y < 1$ (a.e.).

For $y gt.eq 1$,
$ F_Y\(y\)= bb(P)\(X^2 lt.eq y\)= bb(P)\(- sqrt(y) lt.eq X lt.eq sqrt(y)\)= integral_(- sqrt(y))^(- 1) frac(1, 2 x^2) thin d x + integral_1^(sqrt(y)) frac(1, 2 x^2) thin d x $
Compute each integral:
$ integral_1^(sqrt(y)) frac(1, 2 x^2) thin d x = 1 / 2 integral_1^(sqrt(y)) x^(- 2) thin d x = 1 / 2 #scale(x: 180%, y: 180%)[\[] - x^(- 1) #scale(x: 180%, y: 180%)[\]]_1^(sqrt(y)) = 1 / 2 (1 - 1 / sqrt(y)) $
and similarly $integral_(- sqrt(y))^(- 1) frac(1, 2 x^2) thin d x = 1 / 2 (1 - 1 / sqrt(y))$ since the function is even.
Therefore, for $y gt.eq 1$,
$ F_Y\(y\)= 1 - 1 / sqrt(y) $
Combining both cases we have
$ F_Y\(y\)= cases(delim: "{", 0\, & y < 1\,, 1 - 1 / sqrt(y) & y gt.eq 1) $
Notice that on $y gt.eq 1$, $F_Y\(y\)$ is differentiable (except on $y = 1$): $ F'_Y\(y\)= frac(d, d y) (1 - y^(- 1\/2)) = 1 / 2 thin y^(- 3\/2) $
So consider the function
$ g\(y\)= cases(delim: "{", frac(1, 2 y^(3\/2))\, & y gt.eq 1\,, 0\, & y < 1 .) $
Then for $x < 1$,
$ integral_(- oo)^x g\(y\)thin d y = 0 = F_Y\(x\) $
and for $x gt.eq 1$
$ integral_(- oo)^x g\(y\)thin d y = integral_1^x frac(1, 2 y^(3\/2)) thin d y = [- y^(- 1\/2)]_1^x = 1 - 1 / sqrt(x) = F_Y\(x\) $
This shows that #strong[$Y$ is absolutely continuous and $g$ is a probability density of $Y$].
Hence
$ f_Y\(y\)= cases(delim: "{", frac(1, 2 y^(3\/2))\, & y gt.eq 1\,, 0\, & y < 1) $
Now we compute $bb(P)\(2 Y + 3 lt.eq 10\)$.

We have $2 Y + 3 lt.eq 10 arrow.l.r.double Y lt.eq 7 / 2$. Thus
$ bb(P)\(2 Y + 3 lt.eq 10\)= bb(P) (Y lt.eq 7 / 2) = F_Y #h(-1em) (7 / 2) = 1 - 1 / sqrt(7\/2) = 1 - sqrt(2 / 7) $
Thus,
$ bb(P)\(2 Y + 3 lt.eq 10\)= 1 - sqrt(2 / 7) $

]
#heading(level: 2, numbering: none)[Problem 4]
<problem-4>
Let the random variable $X$ have density $f$,
which is symmetric about $mu in bb(R)$,
that is, $f\(mu + x\)= f\(mu - x\)$, for all $x in bb(R)$.
Show that $bb(P)\(X lt.eq mu\)= bb(P)\(X gt.eq mu\)$.
If in addition $bb(E)\|X\|< oo$, show that $bb(E)\(X\)= mu$.
Can you use this observation if $X tilde.op N\(0\,1\)$ ?

#proof[
Since $X$ has density $f$,
$ bb(P)\(X lt.eq mu\)= integral_(- oo)^mu f\(t\)thin d t $
Let $t = mu - x$ so that $d t = - d x$. Then
$ integral_(- oo)^mu f\(t\)thin d t = integral_oo^0 f\(mu - x\)\(- d x\)= integral_0^oo f\(mu - x\)thin d x $
Similarly,
$ bb(P)\(X gt.eq mu\)= integral_mu^oo f\(t\)thin d t = integral_0^oo f\(mu + x\)thin d x $
By symmetry $f\(mu - x\)= f\(mu + x\)$ for all $x$, hence the two integrals are equal, i.e. proved
$ bb(P)\(X lt.eq mu\)= bb(P)\(X gt.eq mu\) $

If $bb(E)\|X\|< oo$, then $bb(E)\[X\]= mu$ for some $mu in bb(R)$,
We want to show that this $mu$ is the same as the one in the symmetry condition.
Consider $bb(E)\[X - mu\]$. Since $bb(E)\|X\|< oo$, we also have $bb(E)\|X - mu\|< oo$,
so the following integral is well-defined:
$ bb(E)\[X - mu\]= integral_(- oo)^oo\(t - mu\)f\(t\)thin d t $
Let $t = mu + x$\; then
$ bb(E)\[X - mu\]= integral_(- oo)^oo x thin f\(mu + x\)thin d x $
Define $g\(x\):= f\(mu + x\)$. The symmetry condition $f\(mu + x\)= f\(mu - x\)$ implies
that $g$ is an even function, thus $x g\(x\)$ is an odd function.
Since $integral\|x\|g\(x\)thin d x < oo$, we may integrate over symmetric limits to get
$ integral_(- oo)^oo x g\(x\)thin d x = 0 $
Therefore $bb(E)\[X - mu\]= 0$, thus
$ bb(E)\[X\]= mu $

Application to $X tilde.op N\(0\,1\)$:
Since the standard normal density $phi\(x\)= 1 / sqrt(2 pi) e^(- x^2\/2)$
satisfies $phi\(0 + x\)= phi\(0 - x\)$, so it is symmetric about $mu = 0$. Hence
$ bb(P)\(X lt.eq 0\)= bb(P)\(X gt.eq 0\)= 1 / 2 quad upright("and") quad bb(E)\[X\]= 0 $

]
#heading(level: 2, numbering: none)[Problem 5]
<problem-5>
An airline has observed that $5 %$ of ticket holders do not show up for their flight. Today's flight has an airplane with 200 seats, and the airline has sold 203 tickets.
What is the probability that the airline will not be able to accommodate a ticketed passenger? Assume that, for each passenger $i$,
the event $A_i$ that passenger $i$ shows up is independent of all others,
for $1 lt.eq i lt.eq 203$.

#solution[
Let $S$ be the number of passengers who show up. The condition indicates that $S$ is a
binomial random variable with parameters $n = 203$ and $p = 0.95$:
$ S tilde.op upright(B i n o m i a l)\(n = 203\,p = 0.95\) $
The airline cannot accommodate everyone exactly when more than 200 passengers show up, i.e.
$ bb(P)\(upright("cannot accommodate")\)= bb(P)\(S gt.eq 201\)= sum_(k = 201)^203 binom(203, k)\(0.95\)^k\(0.05\)^(203 - k) $
Equivalently, letting $N := 203 - S$ be the number of no-shows, we have $N tilde.op upright(B i n o m i a l)\(203\,0.05\)$
and
$ bb(P)\(S gt.eq 201\)= bb(P)\(N lt.eq 2\)= sum_(j = 0)^2 binom(203, j)\(0.05\)^j\(0.95\)^(203 - j) $
Numerically we can calculate
$ bb(P)\(upright("cannot accommodate")\)approx 0.206 % $

]
#heading(level: 2, numbering: none)[Problem 6]
<problem-6>
Consider a sequence of tosses of a fair die. We continue tossing until both outcomes 3 and 4 have appeared at least once. For example,
one possible sequence of results is
$ 5\,1\,1\,4\,6\,5\,4\,2\,6\,3\, $
and we then stop. Let $X$ be the number of tosses required (in this example, $X = 10$ ).
What is the expected value of the random variable $X$ ?

#solution[
We can decompose the waiting time into two stages.

Stage 1: wait until the first time we see either 3 or 4:
On each toss, the probability to get a 3 or 4 is $2\/6 = 1\/3$. Hence the number of tosses $T_1$
until the first occurrence of ${ 3\,4 }$ is geometric with success probability $1\/3$, so
$ bb(E)\[T_1\]= frac(1, 1\/3) = 3 $

Stage 2: after seeing one of them, wait until we see the other:
Once 3 has appeared, each subsequent toss produces a 4 with probability $1\/6$\;
otherwise we are still missing a 4. Thus the additional waiting time $T_2$ is
geometric with success probability $1\/6$, so
$ bb(E)\[T_2\]= frac(1, 1\/6) = 6 $

Since $X = T_1 + T_2$, by linearity of expectation we get
$ bb(E)\[X\]= bb(E)\[T_1\]+ bb(E)\[T_2\]= 3 + 6 = 9 $

]
