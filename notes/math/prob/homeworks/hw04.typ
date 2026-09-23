#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 4]
<homework-4>
#heading(level: 2, numbering: none)[Problem 1]
<problem-1>
Let $X$ be a random variable with values in $\[0\,+ oo\]$
such that $bb(E)\[X\]= 0$.
Explain why $X < oo$ almost surely and show that $X = 0$ almost surely.

#proof[
Since $X gt.eq 0$ and $bb(E)\[X\]= 0 < oo$, by Markov's inequality, for any $t > 0$,
$ bb(P)\(X gt.eq t\)lt.eq frac(bb(E)\[X\], t) = 0 $
Hence $bb(P)\(X gt.eq t\)= 0$ for all $t > 0$. In particular,
$ bb(P)\(X = + oo\)= lim_(t arrow.r + oo) bb(P)\(X gt.eq t\)= lim_(t arrow.r + oo) 0 = 0 $
that is, $X < oo$ almost surely.

Also notice that
$ { X > 0 } = union.big_(n = 1)^oo {X gt.eq 1 / n} $
and by countable subadditivity,
$ bb(P)\(X > 0\)lt.eq sum_(n = 1)^oo bb(P) (X gt.eq 1 / n) = 0 $
Thus $bb(P)\(X > 0\)= 0$.
And since $X$ takes values in $\[0\,+ oo\]$,
we have $ bb(P)\({ X = 0 }\)= bb(P)\({ X lt.eq 0 }\)= 1 - bb(P)\({ X > 0 }\)= 1 $, and

This finishes the proof that $X < oo$ a.s. and $X = 0$ a.s.

]
#heading(level: 2, numbering: none)[Problem 2]
<problem-2>
Let $X$ be a random variable with $bb(E)\[X\]= 3$
and $bb(E)\[X^2\]= 13$. Show that:
$ bb(P)\(- 2 lt.eq X lt.eq 8\)gt.eq 21 / 25 $

#solution[
Compute the variance of $X$:
$ upright(V a r)\(X\)= bb(E)\[X^2\]-\(bb(E)\[X\]\)^2= 13 - 3^2 = 4 $
Observe that
$ bb(P)\(- 2 lt.eq X lt.eq 8\)= bb(P)\(\|X - 3\|lt.eq 5\) $
By Chebyshev's inequality,
$ bb(P)\(\|X - 3\|gt.eq 5\)lt.eq frac(upright(V a r)\(X\), 5^2) = 4 / 25 $
Therefore,
$ bb(P)\(\|X - 3\|lt.eq 5\)= 1 - bb(P)\(\|X - 3\|gt.eq 5\)gt.eq 1 - 4 / 25 = 21 / 25 $
Thus,
$ bb(P)\(- 2 lt.eq X lt.eq 8\)gt.eq 21 / 25 $

]
#heading(level: 2, numbering: none)[Problem 3]
<problem-3>
Let $X\,Y$ be two random variables such that
$bb(P)\(Y = 1\)= 1\/5\,bb(P)\(Y = 2\)= 3\/5$
and $bb(P)\(Y = 3\)= 1\/5$. In addition
$ X\|{ Y = 1 } tilde.op "Exp"\(2\)\,X\|{ Y = 2 } tilde.op "Exp"\(3\)upright(" and ") X divides { Y = 3 } = 7 . $
Compute the moment generating function of $X$.

#solution[
Compute each conditional moment generating function:

For $X divides { Y = 1 } tilde.op "Exp"\(2\)$
$ bb(E)\[e^(t X) divides Y = 1\]= frac(2, 2 - t)\,quad t < 2 $
For $X divides { Y = 2 } tilde.op "Exp"\(3\)$
$ bb(E)\[e^(t X) divides Y = 2\]= frac(3, 3 - t)\,quad t < 3 $
For $X divides { Y = 3 } = 7$,
$ bb(E)\[e^(t X) divides Y = 3\]= e^(7 t) $
Then we use the law of total expectation conditioning on $Y$:
for any $t$ such that the expectations below are finite, we have
$ M_X\(t\)= bb(E)\[e^(t X)\] & = sum_(y = 1)^3 bb(E)\[e^(t X) divides Y = y\]bb(P)\(Y = y\)\
 & = 1 / 5 dot.op frac(2, 2 - t) + 3 / 5 dot.op frac(3, 3 - t) + 1 / 5 e^(7 t)\
 & = frac(2, 5\(2 - t\)) + frac(9, 5\(3 - t\)) + 1 / 5 e^(7 t)\,quad t < 2 $
So the moment generating function of $X$ is
$ M_X\(t\)= frac(2, 5\(2 - t\)) + frac(9, 5\(3 - t\)) + 1 / 5 e^(7 t)\,quad t < 2 $

]
#heading(level: 2, numbering: none)[Problem 4]
<problem-4>
For any $n in bb(N)$ with $n gt.eq 1$ we set $a_n = 1\/(2 n^2)$.
Consider the sequence of random variables $(X_n)_(n in bb(N))$ with
$ X_n = cases(delim: "{", 0\, & upright(" with probability ") a_n, 1\, & upright(" with probability ") 1 - 2 a_n, n^2\, & upright(" with probability ") a_n) $
Check if $(X_n)$ converges in probability and
if $(X_n)$ converges in $L^1$.

#solution[
We first show that $X_n arrow.r 1$ in probability.

Let $epsilon > 0$. \ For $n$ large enough s.t. $n^2 - 1 > epsilon$,
$\|X_n - 1\|> epsilon$ iff $X_n = 0$ or $X_n = n^2$. Therefore,
$ bb(P)\(\|X_n - 1\|> epsilon\)= bb(P)\(X_n = 0\)+ bb(P)\(X_n = n^2\)= a_n + a_n = 2 a_n = 1 / n^2 $
Since
$1 / n^2 arrow.r 0$, we have:
$ lim_(n arrow.r oo) med bb(P)\(\|X_n - 1\|> epsilon\)= 0 $
Since $epsilon > 0$ is arbitrary, we conclude that
$ X_n arrow.r^(bb(P)) 1 $

We then show that $X_n$ does not converge to $1$ in $L^1$.

We compute
$ bb(E)\[\|X_n - 1\|\] & =\|0 - 1\|a_n +\|1 - 1\|\(1 - 2 a_n\)+\|n^2 - 1\|a_n\
 & = a_n +\(n^2 - 1\)a_n\
 & = n^2 a_n = 1 / 2 ↛ 0 $
Hence
\$\$X\_n \\not\\xrightarrow{L^1} 1\$\$

]
#heading(level: 2, numbering: none)[Problem 5]
<problem-5>
Let $X$ and $Y$ be independent random variables with densities
$ f_X\(x\)= {2 x\, & 0 lt.eq x lt.eq 1\,\
0\, & upright(" otherwise ") quad f_Y \( y \) = cases(delim: "{", 1\/2\, & 0 lt.eq y lt.eq 2, 0\, & upright(" otherwise ")) $
Find the distribution function of the sum $Z = X + Y$.

#solution[
Since $X$ and $Y$ are independent, the density of
$Z = X + Y$
is given by convolution:
$ f_Z\(z\)= integral_(- oo)^oo f_X\(x\)f_Y\(z - x\)thin d x $
where we know
$ f_X\(x\)= 2 x upright(bold(1))_(\[0\,1\])\(x\)\,quad f_Y\(y\)= 1 / 2 upright(bold(1))_(\[0\,2\])\(y\) $
Thus
$ f_Z\(z\) & = integral_(- oo)^oo 2 x dot.op 1 / 2 upright(bold(1))_(\[0\,1\])\(x\)upright(bold(1))_(\[0\,2\])\(z - x\)thin d x\
 & = integral_(- oo)^oo x #scale(x: 240%, y: 240%)[\(] upright(bold(1))_(\[0\,1\])\(x\)#scale(x: 240%, y: 240%)[\)] #scale(x: 240%, y: 240%)[\(] upright(bold(1))_(\[0\,2\])\(z - x\)#scale(x: 240%, y: 240%)[\)] thin d x\
 & = integral_(max\(0\,z - 2\))^(min\(1\,z\)) x thin d x $

Compute this piecewise:
If $0 lt.eq z lt.eq 1$, then the interval is $\[0\,z\]$, so
$ f_Z\(z\)= integral_0^z x thin d x = z^2 / 2 $
If $1 lt.eq z lt.eq 2$, then the interval is $\[0\,1\]$, so
$ f_Z\(z\)= integral_0^1 x thin d x = 1 / 2 $
If $2 lt.eq z lt.eq 3$, then the interval is $\[z - 2\,1\]$, so
$ f_Z\(z\)= integral_(z - 2)^1 x thin d x = frac(1 -\(z - 2\)^2, 2) $
Outside $\[0\,3\]$, clearly $f_Z\(z\)= 0$.
Therefore,
$ f_Z\(z\)= cases(delim: "{", 0\, & z < 0\,, z^2 / 2\, & 0 lt.eq z lt.eq 1\,, 1 / 2\, & 1 lt.eq z lt.eq 2\,, frac(1 -\(z - 2\)^2, 2)\, & 2 lt.eq z lt.eq 3\,, 0\, & z > 3) $
Now we integrate to get the cdf.
For $z < 0$, $F_Z\(z\)= 0$.

For $0 lt.eq z lt.eq 1$,
$ F_Z\(z\)= integral_0^z t^2 / 2 thin d t = z^3 / 6 $
For $1 lt.eq z lt.eq 2$,
$ F_Z\(z\)= F_Z\(1\)+ integral_1^z 1 / 2 thin d t = 1 / 6 + frac(z - 1, 2) = z / 2 - 1 / 3 $
For $2 lt.eq z lt.eq 3$,
$ F_Z\(z\)= F_Z\(2\)+ integral_2^z frac(1 -\(t - 2\)^2, 2) thin d t = 2 / 3 + frac(z - 2, 2) - frac(\(z - 2\)^3, 6) $
And for $z gt.eq 3$, $F_Z\(z\)= 1$.

Hence the cdf of $Z = X + Y$ is
$ F_Z\(z\)= cases(delim: "{", 0\, & z < 0\,, z^3 / 6\, & 0 lt.eq z lt.eq 1\,, z / 2 - 1 / 3\, & 1 lt.eq z lt.eq 2\,, 2 / 3 + frac(z - 2, 2) - frac(\(z - 2\)^3, 6)\, & 2 lt.eq z lt.eq 3\,, 1\, & z gt.eq 3) $

]
#heading(level: 2, numbering: none)[Problem 6]
<problem-6>
Let $a_1\,a_2\,dots.h\,a_n$ and $lambda$ be positive constants and
let ${X_i : 1 lt.eq i lt.eq n}$ be independent random variables with
$ X_i tilde.op Gamma (a_i \, lambda)\,quad i = 1\,2\,dots.h\,n $
(i.e., with the same second parameter $lambda$ ).
Show that $X_1 + X_2 + dots.h.c + X_n tilde.op Gamma\(a\,lambda\)$,
with $a = sum_(i = 1)^n a_i$.

#proof[
Let
$ S_n := X_1 + X_2 + dots.h.c + X_n\,quad a = sum_(i = 1)^n a_i $
We need to show that $S_n tilde.op Gamma\(a\,lambda\)$.

Since $X_i tilde.op Gamma\(a_i\,lambda\)$, its moment generating function is
$ M_(X_i)\(t\)= bb(E)\[e^(t X_i)\]= (frac(lambda, lambda - t))^(a_i)\,quad t < lambda $

Since $X_1\,dots.h\,X_n$ are independent,
the moment generating function of $S_n$ is
$ M_(S_n)\(t\)= bb(E)\[e^(t\(X_1 + dots.h.c + X_n\))\]= product_(i = 1)^n bb(E)\[e^(t X_i)\]= product_(i = 1)^n M_(X_i)\(t\) $
Therefore,
$ M_(S_n)\(t\)= product_(i = 1)^n (frac(lambda, lambda - t))^(a_i) = (frac(lambda, lambda - t))^(sum_(i = 1)^n a_i) = (frac(lambda, lambda - t))^a\,quad t < lambda $

Note this is exactly the moment generating function of a
$Gamma\(a\,lambda\)$ random variable. Hence,
$ S_n = X_1 + dots.h.c + X_n tilde.op Gamma\(a\,lambda\)\,quad a = sum_(i = 1)^n a_i $

]
