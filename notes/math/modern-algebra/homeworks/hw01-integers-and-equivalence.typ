#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= Homework 1: Integers and Equivalence Relations (49/50)
<homework-01>

Source: 'Homework/412-Hw-1-graded.pdf' (30 PDF pages). Canvas grading and
navigation pages are interleaved with the submitted handwritten pages. The
source trails below identify every page with transcribed work; navigation-only
pages are recorded in the migration receipt rather than copied as note content.

== Question 1: square and cubic integers

*Source trail:* PDF pp. 6 and 8 (handwritten answer); p. 1 (10/10 grading).

For the square claim, the answer begins, “We prove by cases.” It invokes
Corollary 2.5 to split the integers into $3k$, $3k+1$, and $3k+2$. For an
arbitrary $a$ it records:

- if $a=3k$, then $a^2=9k^2=3(3k^2)$;
- if $a=3k+1$, then $a^2=(3k+1)^2=3(3k^2+2k)+1$;
- if $a=3k+2$, it writes $a^2=(3k+2)^2=3(3k^2+4k)+1$.

The conclusion underneath is that the three cases cover all integers and none
gives remainder $2$ upon division by $3$.

For the cubic claim, the answer again uses the same three cases:

- $a^3=27m^3=9(3m^3)$, so it takes $k=3m^3$;
- $a^3=27m^3+27m^2+9m+1=9(3m^3+3m^2+m)+1$;
- $a^3=27m^3+54m^2+36m+8=9(3m^3+6m^2+4m+1)-1$.

Thus it concludes that a cubic integer has form $9k$, $9k+1$, or $9k-1$. On
the first cubic line, the handwriting says $a^2=9k$ after a calculation for
$a^3$; it is retained as a source-writing slip rather than silently treated as
a new assertion.

== Question 2: least common multiples

*Source trail:* PDF pp. 10 and 12 (handwritten answer); p. 2 (10/10 grading).

For part (a), the response lets $a,b$ be arbitrary positive integers and
defines the set of positive common multiples

$ S = {s in ZZ^+ : a divides s and b divides s}. $

It observes that $a b in S$, hence $S$ is nonempty and is a subset of the
positive integers. The well-ordering principle supplies a smallest element,
which it identifies as the least common multiple of $a$ and $b$.

For part (b), with $d=gcd(a,b)$, the handwritten calculation is

$ a=d p, b=d q, a b=d p q, m=p q, d m=a b. $

This is transcribed as written: the displayed factorization omits a factor of
$d$ if both preceding equalities are read literally. The written construction
targets an integer $m$ satisfying $d m=a b$.

For part (c), it starts from $d m=a b$ and $a=d p$, then writes

$ d m=d p b, m=p b, $

and, similarly, $m=q a$. It concludes that both $a$ and $b$ divide $m$.

For part (d), let $M$ be an arbitrary common multiple, so $M=s a=k b$ for
integers $s,k$. Bézout is written as

$ gcd(a,b)=r a+s b. $

With $m=a b/gcd(a,b)$, the response calculates

$ M/m = ((r a+s b)/(a b))k b = r k + (k s b)/a = r k+s^2. $

The substitution $k b=s a$ makes the last expression integral, so $m$ divides
$M$. Together with the preceding divisibility calculation, it concludes that
$m$ is the least common multiple.

== Question 3: greatest common divisors under an integral matrix

*Source trail:* PDF pp. 14 and 16 (handwritten answer); p. 2 (10/10 grading,
with feedback).

Let $A=mat(a,b;c,d)$ and write its inverse as $A^(-1)$. The proof notes that
both $det A$ and $det A^(-1)=1/(det A)$ are integers. It concludes that
$det A$ is $1$ or $-1$, and writes

$ A^(-1) = (1/(det A)) mat(d,-b;-c,a). $

It applies this to the column vector with entries $a x+b y$ and $c x+d y$,
obtaining $plus.minus (x,y)^T$. In particular,

$ x = plus.minus (d(a x+b y)-b(c x+d y)) $

and

$ y = plus.minus (-c(a x+b y)+a(c x+d y)). $

Thus $x$ and $y$ are integer linear combinations of $a x+b y$ and $c x+d y$;
conversely those two expressions are integer linear combinations of $x,y$.
The response phrases the two divisibility comparisons as mutual
greatest-common-divisor inequalities and concludes

$ gcd(x,y)=gcd(a x+b y,c x+d y). $

*Grader feedback (PDF p. 2):* “avoid the gcd notation.”

== Question 4: prime multiplicities and irrational roots

*Source trail:* PDF pp. 16, 18, 20, and 22 (handwritten answer); p. 3
(9/10 grading and feedback).

The answer labels the two assertions “1” and “2.” For the first direction of
the equivalence in part (1), it writes $n=beta^d$, factors

$ beta=q_1^(a_1) q_2^(a_2) dots q_m^(a_m), $

and argues for a prime $p=q_i$ that $p^(a_i d)$ divides $n$; hence the
multiplicity is divisible by $d$. For the converse it writes

$ n=p_1^(a_1) p_2^(a_2) dots p_m^(a_m) $

and, from $a_i=k_i d$, obtains

$ n=(p_1^(k_1) p_2^(k_2) dots p_m^(k_m))^d. $

This is the stated proof that $n$ is a $d$-th power exactly when all its prime
multiplicities are divisible by $d$.

For part (2), it argues by contradiction. Assume $n$ is not a $d$-th power but

$ root(d,n)=p/q $

with $p,q in ZZ$, $q != 0$, and $gcd(p,q)=1$. It writes $n q^d=p^d$ and factors
$p$ and $q$ by the Fundamental Theorem of Arithmetic. Since their prime factors
are disjoint, it concludes that each prime factor of $n$ has multiplicity $d$,
so $n$ is a $d$-th power, a contradiction.

*Grader feedback (PDF p. 3):* “You forgot the powers on the primes.” A second
comment says, “Again, if you had written out the powers, you would have gotten
that q = 1, and be done with it all.”

== Question 5: equivalence relations and classes

*Source trail:* PDF pp. 26, 28, and 30 (handwritten answer); p. 4 (10/10
grading).

For part (a), take arbitrary column vectors $(x,y)^T$ and $(w,z)^T$ with
$x-y=w-z$. The response checks reflexivity from $x-y=x-y$, symmetry by
reversing the equality, and transitivity by setting $w-z=alpha-beta$ and
chaining $x-y=w-z=alpha-beta$. It concludes that this relation on $RR^2$ is an
equivalence relation.

For part (b), it supplies the transitivity counterexample

$ a=1, b=0, c=-1. $

Then $a b=0$ and $b c=0$, so $a tilde b$ and $b tilde c$, while $a c=-1<0$, so $a$ is
not related to $c$. Thus the relation $a tilde b$ when $a b >= 0$ is not an
equivalence relation.

For part (c), if $a in X$, reflexivity gives $a tilde a$, so

$ a in {x in X : x tilde a}=[a]. $

Therefore every equivalence class is nonempty.

For part (d), assume the intersection of $[a]$ and $[b]$ is nonempty and choose
$x$ in both classes. For arbitrary $m in [a]$, the response uses
$m tilde a$, $x tilde a$, symmetry, and transitivity to obtain $m tilde x$ and hence
$m in [b]$. Reversing the argument for arbitrary $n in [b]$ gives
$[a]=[b]$. Therefore two classes are either disjoint or equal.

For part (e), every $x in X$ has $x tilde x$, so $[x]$ is a nonempty class in the
set $S$ of all classes and $x$ belongs to that class. The handwritten conclusion
is that $X$ is the disjoint union of the classes $Y$ with $Y in S$. Using part
(d), the response identifies the union as disjoint, concluding that the
equivalence classes partition $X$.
