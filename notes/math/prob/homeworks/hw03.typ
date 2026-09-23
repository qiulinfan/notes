#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 3]
<homework-3>
#heading(level: 2, numbering: none)[Problem 1]
<problem-1>
Let $Z$ be a standard normal random variable $Z tilde.op N\(0\,1\)$. We denote by $Phi$ its distribution function. Answer the questions below

- If $a\,b in bb(R)$ with $a > 0$, show that the random variable $a Z + b$
  is also normal and find its mean and variance.

- Show that $Phi\(0\)= 1\/2$.

- Show that $Phi\(- x\)= 1 - Phi\(x\)$ for any $x in bb(R)$.

#solution[
- $Z tilde.op N\(0\,1\)$ has density
  $ f_Z\(z\)= 1 / sqrt(2 pi) e^(- z^2\/2) $

  $ F_X\(x\)= bb(P)\(X lt.eq x\) & = bb(P)\(a Z + b lt.eq x\)\
   & = bb(P) (Z lt.eq frac(x - b, a))\
   & = Phi (frac(x - b, a)) $
  Thus $ f_X\(x\)= frac(d, d x) Phi (frac(x - b, a)) = 1 / a phi (frac(x - b, a)) = 1 / sqrt(a^22 pi) e^(- frac(\(x - b\)^2, 2 a^2)) $

  Note this is the density of a normal distribution with mean $b$ and variance $a^2$.
  Therefore
  $ a Z + b tilde.op N\(b\,a^2\) $
  Since $Z$ has mean $0$ and variance $1$, use linearity we have
  $ bb(E)\[a Z + b\]= a bb(E)\[Z\]+ b = b $
  and
  $ upright(V a r)\(a Z + b\)= a^2 upright(V a r)\(Z\)= a^2 $

- Note the standard normal density is an even function:
  $ phi\(x\)= 1 / sqrt(2 pi) e^(- x^2\/2) = phi\(- x\) $
  Thus
  $ Phi\(0\)= integral_(- oo)^0 phi\(x\)thin d x = integral_0^oo phi\(x\)thin d x $
  Since $integral_(- oo)^oo phi\(x\)thin d x = 1$,
  the two equal halves are each $1\/2$, so $Phi\(0\)= 1\/2$.

- For any $x in bb(R)$,
  $ Phi\(- x\)= integral_(- oo)^(- x) phi\(t\)thin d t $
  Let $u = - t$, using $phi\(- u\)= phi\(u\)$ we have
  $ Phi\(- x\)= integral_oo^x phi\(- u\)\(- d u\)= integral_x^oo phi\(u\)thin d u = 1 - integral_(- oo)^x phi\(u\)thin d u = 1 - Phi\(x\) $

]
#heading(level: 2, numbering: none)[Problem 2]
<problem-2>
Let $X$ and $Y$ be random variables with joint density
$ f\(x\,y\)= cases(delim: "{", - x y\, & \(x\,y\)in\(- 1\,0\)times\(0\,1\)union\(1\,2\)times\(- 1\,0\)\,, 0\, & upright(" otherwise ")) $

- Compute the probability $bb(P)\(X + Y < 0\)$.

- Compute the expected value $bb(E)\[X Y\]$.

- Are $X$ and $Y$ independent?

#solution[
- On $\(1\,2\)times\(- 1\,0\)$ we have $x + y > 0$ since $x > 1$ and $y > - 1$,
  hence this region contributes nothing to ${ X + Y < 0 }$.

  On $\(- 1\,0\)times\(0\,1\)$, the ineq $x + y < 0$ is equivalent to $0 < y < - x$. Therefore,
  $ bb(P)\(X + Y < 0\)= integral_(- 1)^0 integral_0^(- x)\(- x y\)thin d y thin d x $
  Compute the inner integral:
  $ integral_0^(- x)\(- x y\)thin d y = - x dot.op frac(\(- x\)^2, 2) = - x^3 / 2 $
  Hence,
  $ bb(P)\(X + Y < 0\)= integral_(- 1)^0 (- x^3 / 2) d x = - 1 / 2 dot.op x^4 / 4 #scale(x: 180%, y: 180%)[\|]_(- 1)^0 = 1 / 8 $

- By def,
  $ bb(E)\[X Y\] & = integral_(bb(R)^2) x y thin f\(x\,y\)thin d x thin d y\
   & = - integral_(\(- 1\,0\)times\(0\,1\)union\(1\,2\)times\(- 1\,0\)) x^2 y^2 thin d x thin d y\
   & = - integral_(- 1)^0 integral_0^1 x^2 y^2 thin d y thin d x - integral_1^2 integral_(- 1)^0 x^2 y^2 thin d y thin d x $

  Split over the two rectangles.
  On $\(- 1\,0\)times\(0\,1\)$,
  $ - integral_(- 1)^0 integral_0^1 x^2 y^2 thin d y thin d x = - (integral_(- 1)^0 x^2 thin d x) (integral_0^1 y^2 thin d y) = - (1 / 3) (1 / 3) = - 1 / 9 $
  On $\(1\,2\)times\(- 1\,0\)$,
  $ - integral_1^2 integral_(- 1)^0 x^2 y^2 thin d y thin d x = - (integral_1^2 x^2 thin d x) (integral_(- 1)^0 y^2 thin d y) = - (7 / 3) (1 / 3) = - 7 / 9 $
  Thus,
  $ bb(E)\[X Y\]= - 1 / 9 - 7 / 9 = - 8 / 9 $

- Consider: For $x in\(- 1\,0\)$,
  $ f_X\(x\)= integral_0^1\(- x y\)thin d y = frac(- x, 2) $
  For $y in\(0\,1\)$,
  $ f_Y\(y\)= integral_(- 1)^0\(- x y\)thin d x = y integral_(- 1)^0\(- x\)thin d x = y / 2 $
  And for $\(x\,y\)in\(- 1\,0\)times\(0\,1\)$,
  $ f_X\(x\)f_Y\(y\)= (frac(- x, 2)) (y / 2) = frac(- x y, 4) eq.not - x y = f\(x\,y\) $
  Thus $X$ and $Y$ are not independent.

]
#heading(level: 2, numbering: none)[Problem 3]
<problem-3>
Let $X tilde.op "Exp"\(1\)$ and $Y = X + frac(1, X + 1)$.
Find $bb(P)\(\(X + 1\)Y lt.eq 2\)$ and $"Cov"\(X\,Y\)$. \ Hint: You may leave your answer as a function of the integral $integral_0^oo frac(e^(- x), 1 + x) d x$.

#solution[
Note
$ \(X + 1\)Y =\(X + 1\)(X + frac(1, X + 1)) = X\(X + 1\)+ 1 = X^2 + X + 1 $
Thus,
$ \(X + 1\)Y lt.eq 2 arrow.l.r.double X^2 + X - 1 lt.eq 0 $
The roots of $x^2 + x - 1 = 0$ are $frac(- 1 plus.minus sqrt(5), 2)$. Since $X gt.eq 0$, the event is
$ 0 lt.eq X lt.eq frac(sqrt(5) - 1, 2) $
Therefore, using the CDF of $upright(E x p)\(1\)$,
$ bb(P)\(\(X + 1\)Y lt.eq 2\)= bb(P)\(X lt.eq frac(sqrt(5) - 1, 2)\)= 1 - e^(- frac(sqrt(5) - 1, 2)) = 1 - exp #h(-1em) (- frac(sqrt(5) - 1, 2)) $
Nowe we compute the covariance. By def,
$ upright(C o v)\(X\,Y\)= bb(E)\[X Y\]- bb(E)\[X\]bb(E)\[Y\] $
For $X tilde.op upright(E x p)\(1\)$, $bb(E)\[X\]= 1$ and $bb(E)\[X^2\]= 2$. Let
$ I := integral_0^oo frac(e^(- x), 1 + x) thin d x = bb(E) #h(-1em) [frac(1, 1 + X)] $
Then
$ bb(E)\[Y\]= bb(E)\[X\]+ bb(E) #h(-1em) [frac(1, 1 + X)] = 1 + I $
Also,
$ X Y = X (X + frac(1, 1 + X)) = X^2 + frac(X, 1 + X) = X^2 + (1 - frac(1, 1 + X)) $
so
$ bb(E)\[X Y\]= bb(E)\[X^2\]+ 1 - bb(E) #h(-1em) [frac(1, 1 + X)] = 2 + 1 - I = 3 - I $
Hence,
$ upright(C o v)\(X\,Y\)=\(3 - I\)-\(1\)\(1 + I\)= 2 - 2 I = 2 - 2 integral_0^oo frac(e^(- x), 1 + x) thin d x $

]
#heading(level: 2, numbering: none)[Problem 4]
<problem-4>
Find the conditional density $f_(Y divides X)\(y divides x\)$ of $Y$
given that $X = x$ and the corresponding conditional expectation
$bb(E)\[Y divides X = x\]$ if the pair of random variables $\(X\,Y\)$
has absolutely continuous distribution with joint density:
$f_(X\,Y)\(x\,y\)= lambda^2 e^(- lambda y) upright(bold(1))_({ 0 lt.eq x lt.eq y })$.

#solution[
Given the joint density
$f_(X\,Y)\(x\,y\)= lambda^2 e^(- lambda y) upright(bold(1))_({ 0 lt.eq x lt.eq y })$, we first compute the marginal density of $X$. For $x gt.eq 0$,
$ f_X\(x\)= integral_(y = x)^oo lambda^2 e^(- lambda y) thin d y = lambda^2 dot.op e^(- lambda x) / lambda = lambda e^(- lambda x) $
and $f_X\(x\)= 0$ for $x < 0$.

Therefore, for $x gt.eq 0$,
$ f_(Y\|X)\(y\|x\)= frac(f_(X\,Y)\(x\,y\), f_X\(x\)) = frac(lambda^2 e^(- lambda y) upright(bold(1))_({ y gt.eq x }), lambda e^(- lambda x)) = lambda e^(- lambda\(y - x\)) upright(bold(1))_({ y gt.eq x }) $
This shows that $Y\|X = x$ has the same distribution as $x + E$ where $E tilde.op upright(E x p)\(lambda\)$, hence
$ bb(E)\[Y\|X = x\]= x + 1 / lambda $

]
#heading(level: 2, numbering: none)[Problem 5]
<problem-5>
A machine produces a coin that shows heads with a random probability $p$.
The value of $p$ is unknown to us, but from many observations of the coins produced by the machine
we know that the distribution of the random parameter $p$ is uniform on $\(0\,1\/2\)$.
We start tossing the coin. Compute the following probabilities:

- The coin shows heads on the first toss.

- The expected number of tosses until tails show up.

#solution[
- The head probability $p tilde.op upright(U n i f)\(0\,1\/2\)$. Thus the density is:
  $ f_P\(p\)= 2 thin upright(bold(1))_(\(0\,1\/2\))\(p\) $
  The unconditional probability of heads on the first toss is
  $ bb(P)\(upright("H on first toss")\)= bb(E)\[p\]= integral_0^(1\/2) p dot.op 2 thin d p = 2 dot.op p^2 / 2 #scale(x: 180%, y: 180%)[\|]_0^(1\/2) = 1 / 4 $

- Let $T$ be the number of tosses until the first tail occurs.
  Conditional on $p$, tails occurs with probability $1 - p$ each toss,
  so $T$ is geometric with parameter $1 - p$.
  Hence
  $ bb(E)\[T thin\|thin p\]= frac(1, 1 - p) $
  Taking expectation over $p$,
  $ bb(E)\[T\]= bb(E) #h(-1em) [frac(1, 1 - p)] = integral_0^(1\/2) frac(1, 1 - p) dot.op 2 thin d p = 2 #scale(x: 120%, y: 120%)[\[] - ln\(1 - p\)#scale(x: 120%, y: 120%)[\]]_0^(1\/2) = 2 ln 2 $

]
#heading(level: 2, numbering: none)[Problem 6]
<problem-6>
The joint probability density function of the random variables $X$ and $Y$ is given by
$ f_(X\,Y)\(x\,y\)= cases(delim: "{", c (x^2 + frac(x y, 2))\, & \(x\,y\)in\(0\,1\)times\(0\,2\), 0\, & upright(" otherwise ")) $

- Find the constant $c$.

- Find the marginal density of $X$ and compute $bb(E)\[X\]$.

- Compute $bb(P)\(X > Y\)$.

- Compute $bb(P) (Y > 1 / 2\| thin X < 1 / 2)$.

#solution[
- Determine $c$ from normalization:
  $ 1 = integral_0^1 integral_0^2 c (x^2 + frac(x y, 2)) thin d y thin d x $
  For fixed $x$,
  $ integral_0^2 (x^2 + frac(x y, 2)) d y = 2 x^2 + x / 2 dot.op y^2 / 2 #scale(x: 180%, y: 180%)[\|]_0^2 = 2 x^2 + x $
  Thus
  $ 1 = c integral_0^1\(2 x^2 + x\)thin d x = c (2 / 3 + 1 / 2) = c dot.op 7 / 6 $
  so $c = 6 / 7$

- The marginal density of $X$ (for $0 < x < 1$) is
  $ f_X\(x\)= integral_0^2 c (x^2 + frac(x y, 2)) thin d y = c\(2 x^2 + x\)= 6 / 7\(2 x^2 + x\) $
  and $f_X\(x\)= 0$ otherwise.

  Thus
  $ bb(E)\[X\]= integral_0^1 x f_X\(x\)thin d x = 6 / 7 integral_0^1\(2 x^3 + x^2\)thin d x = 6 / 7 (1 / 2 + 1 / 3) = 5 / 7 $

- The event ${ X > Y }$ corresponds to the region $0 < y < x < 1$ (since $x in\(0\,1\)$). Hence
  $ bb(P)\(X > Y\)= integral_0^1 integral_0^x c (x^2 + frac(x y, 2)) thin d y thin d x $
  For fixed $x$,
  $ integral_0^x (x^2 + frac(x y, 2)) d y = x^3 + x / 2 dot.op y^2 / 2 #scale(x: 180%, y: 180%)[\|]_0^x = x^3 + x^3 / 4 = 5 / 4 x^3 $
  Therefore
  $ bb(P)\(X > Y\)= c integral_0^1 5 / 4 x^3 thin d x = c dot.op 5 / 4 dot.op 1 / 4 = c dot.op 5 / 16 = 6 / 7 dot.op 5 / 16 = 15 / 56 $

- By definition,
  $ bb(P) #h(-1em) (Y > 1 / 2\| X < 1 / 2) = frac(bb(P) (Y > 1 / 2 \, med X < 1 / 2), bb(P) (X < 1 / 2)) $
  Calculate each part. First the denominator:
  $ bb(P) (X < 1 / 2) = integral_0^(1\/2) f_X\(x\)thin d x = c integral_0^(1\/2)\(2 x^2 + x\)thin d x = c (1 / 12 + 1 / 8) = c dot.op 5 / 24 = 5 / 28 $
  And the numerator:
  $ bb(P) (Y > 1 / 2 \, med X < 1 / 2) = integral_0^(1\/2) integral_(1\/2)^2 c (x^2 + frac(x y, 2)) thin d y thin d x $
  For fixed $x$,
  $ integral_(1\/2)^2 (x^2 + frac(x y, 2)) d y = x^2 (2 - 1 / 2) + x / 2 dot.op y^2 / 2 #scale(x: 180%, y: 180%)[\|]_(1\/2)^2 = 3 / 2 x^2 + x / 4 (4 - 1 / 4) = 3 / 2 x^2 + 15 / 16 x $
  Thus
  $ bb(P) (Y > 1 / 2 \, med X < 1 / 2) = c integral_0^(1\/2) (3 / 2 x^2 + 15 / 16 x) d x = c (1 / 16 + 15 / 128) = c dot.op 23 / 128 = 69 / 448 $
  Therefore,
  $ bb(P) #h(-1em) (Y > 1 / 2\| X < 1 / 2) = frac(69\/448, 5\/28) = 69 / 80 $

]
