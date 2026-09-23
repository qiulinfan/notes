#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= Homework 2: Congruence Classes and Functions (35/40)
<homework-02>

Source: 'Homework/412-Hw-2-graded.pdf' (33 PDF pages). The source interleaves
Canvas grading and navigation pages with the handwritten submission. Source
trails identify all transcribed pages; navigation-only and empty-shell pages
are recorded in the migration receipt.

== Grading record and feedback

*Source trail:* PDF p. 1.

The graded total is 35/40. Question scores are 8/10, 10/10, 10/10, and 7/10.
The substantive comments are retained verbatim:

- Question 1: “I didn't really understand anything, try to always point out
  what you are accomplishing with each step.”
- Question 4: “This is somewhat philosophically unsatisfactory for then, there
  may be an empty eq. class. And all that follows would be inaccurate. I'm just
  going to subtract one point for it, but remember to think of eq. classes as
  partitions first.”
- Question 4: “To define Z/nZ you need the equivalence relation you are trying
  to show exists as of this form. The logic is somewhat circular.”

A separate one-character Question 2 comment reads “n”.

== Question 1: simultaneous congruences

*Source trail:* PDF pp. 3-4, 6, 8, 10, and 11 (prompt and handwritten answer).

The system is $x equiv a$ modulo $m$ and $x equiv b$ modulo $n$, where
$gcd(m,n)=1$.

For part (a), assuming $r m+s n=1$, the response takes

$ x=a s n+b r m. $

Modulo $m$, it rewrites $a s n$ as $a(1-r m)=a-a r m$, while $b r m$ is divisible by
$m$, so $x equiv a$. Similarly, modulo $n$, it rewrites $b r m$ as
$b(1-s n)=b-b s n$, while $a s n$ is divisible by $n$, giving $x equiv b$. It
therefore states that this $x$ solves the system.

For part (b), $gcd(m,n)=1$ and Bézout give integers $r,s$ with $r m+s n=1$.
Part (a) then supplies $x=a s n+b r m$ for every choice of $a,b$.

For part (c), fix a solution $x_1$ and take an arbitrary
$x in [x_1]_(m n)$. The answer writes $x=x_1+k m n$ for some integer $k$.
Consequently $x equiv x_1 equiv a$ modulo $m$ and
$x equiv x_1 equiv b$ modulo $n$, so every element of the class is a solution.

For part (d), it lets $x_1=a+g m=b+f n$ and an arbitrary solution
$x=a+p m=b+q n$. Hence both $m$ and $n$ divide $x-x_1$. The response invokes the
Fundamental Theorem of Arithmetic and the relative primality of $m,n$ to
conclude that $m n$ divides $x-x_1$, so $x in [x_1]_(m n)$. Together with part
(c), this proves that the set of solutions is exactly $[x_1]_(m n)$.

For part (e), the Euclidean algorithm in the answer is

$ 169=2 dot 72+25, 72=2 dot 25+22, 25=22+3, $

$ 22=7 dot 3+1, 3=3 dot 1+0. $

Back-substitution gives

$ 1=54 dot 72-23 dot 169. $

For the system $x equiv 11$ modulo $72$ and $x equiv 30$ modulo $169$, it takes

$ x_1=30 dot 54 dot 72-11 dot 23 dot 169=73883. $

The response checks $x_1=11-594 dot 72$, hence $x_1 equiv 11$ modulo $72$,
and states similarly that $x_1 equiv 30$ modulo $169$. Its full answer is

$ [73883]_(12168). $

== Question 2: maps between congruence classes

*Source trail:* PDF pp. 11, 13, 15, and 17 (prompt and handwritten answer).

For part (a), the proposed map $ZZ_3 -> ZZ_6$, $[a]_3 -> [a]_6$, is declared
not well-defined. The counterexample is $a=1$, $b=4$: $[a]_3=[b]_3$, but
$[1]_6$ and $[4]_6$ are distinct.

For part (b), the map $ZZ_6 -> ZZ_3$, $[a]_6 -> [a]_3$, is declared
well-defined. If $[a]_6=[b]_6$, then $b=a+6 k=a+3(2 k)$, so
$b equiv a$ modulo $3$ and $[b]_3=[a]_3$.

For part (c), assume $n$ divides $m$ and write $m=n p$. If
$[a]_m=[b]_m$, then $b=a+m k=a+n(p k)$ for some integer $k$. Thus
$b equiv a$ modulo $n$, proving that $[a]_m -> [a]_n$ is well-defined.

For part (d), assume $n$ does not divide $m$. The two source representatives
$[a]_m$ and $[a+m]_m$ are the same class. If their targets in $ZZ_n$ were
equal, then $a+m=a+k n$ for some integer $k$, so $n$ would divide $m$, a
contradiction. The response concludes that the rule is not well-defined.

== Question 3: solutions of a congruence-class equation

*Source trail:* PDF pp. 19-21, 23, 25, and 27-28 (prompt and handwritten
answer).

Let $d=gcd(a,n)$ and consider $[a]_n y=[b]_n$.

For part (a), the proof is by contraposition. If $y=[r]_n$ is a solution, then
$[a r]_n=[b]_n$, hence $a r=b+p n$ for some integer $p$. Thus

$ b=a r-p n $

is an integer linear combination of $a,n$. The answer invokes the description
of all such combinations as the multiples of $gcd(a,n)$, and obtains $d$
dividing $b$. Hence if $d$ does not divide $b$, there is no solution.

For part (b), with $b=0$, it first takes $x=k n/d$ and computes

$ a x=k dot (a/d) dot n, $

so $[a]_n [x]_n=[0]_n$. Conversely, if $[x]_n$ is a solution, then $a x=p n$.
After division by $d$,

$ (a/d) x=p dot (n/d). $

The response proves $gcd(a/d,n/d)=1$ by contradiction: a common divisor greater
than $1$ would make a common divisor of $a,n$ greater than $d$. It then applies
the Fundamental Theorem of Arithmetic to conclude that $n/d$ divides $x$.
Thus the displayed solution set is

$ {[k n/d]_n : k in ZZ} = {[0]_n,[n/d]_n,[2 n/d]_n,dots,[(d-1)n/d]_n}. $

For part (c), Bézout gives $r a+s n=d$. Since $d-r a=s n$, the response writes
$[d]_n=[r a]_n$. If $b=k d$, then

$ [a]_n [r b/d]_n=[a]_n [r k]_n=[r a]_n [k]_n=[d]_n [k]_n=[b]_n. $

Thus $[r b/d]_n$ is a solution.

For part (d), fix a solution $y_1=[r_1]_n$. If $y=[r]_n$ is another solution,
then $a r=b+p n$ and $a r_1=b+p_1 n$, so

$ a dot (r-r_1)=(p-p_1) dot n. $

Thus $z=y-y_1$ solves $[a]_n z=[0]_n$. Conversely, if
$z=y-y_1$ solves the zero equation, the response uses distributivity in
congruence classes to add $[a]_n y_1=[b]_n$ and obtain
$[a]_n y=[b]_n$. Therefore the number of solutions to the original equation is
the same as for the zero equation, namely exactly $d$.

== Question 4: equivalence relations induced by functions

*Source trail:* PDF pp. 28, 30-31, and 33 (prompt and handwritten answer).

For part (a), let $x,y,z in X$. Since $f(x)=f(x)$, the relation defined by
$f(x)=f(x')$ is reflexive. If $x tilde y$, then $f(x)=f(y)$ and therefore
$f(y)=f(x)$, proving symmetry. If $x tilde y$ and $y tilde z$, then
$f(x)=f(y)=f(z)$, proving transitivity. The response concludes that it is an
equivalence relation.

For part (b), it defines the class indexed by an image value as

$ [y]={x in X : f(x)=y} $

and the set of all such classes as

$ X_f={ [y] : y in Im(f) }. $

It then defines $phi:X_f -> Im(f)$ by $[y] -> y$. The answer argues that every
member of $[y]$ has image $y$, so the map is well-defined; it argues
injectivity by contradiction from unequal classes allegedly mapping to the same
image; and it proves surjectivity because every $y in Im(f)$ is $f(x)$ for some
$x in X$, whose class maps to $y$. It concludes that $phi$ is bijective.

For part (c), it takes

$ f:ZZ -> ZZ_n,\qquad x -> [x]_n. $

Then $f(x)=f(x')$ exactly when $x equiv x'$ modulo $n$, so congruence modulo a
fixed $n$ is the preceding function-induced relation. The response concludes
that this gives a partition of $ZZ$ whose equivalence classes are

$ [0]_n,[1]_n,dots,[n-1]_n. $
