#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 1: on $sigma$-algebra (39/40)]
<homework-1-on-sigma-algebra-3940>
#heading(level: 2, numbering: none)[Borel vs Open]
<borel-vs-open>
Let $X$ be a metric space such that every subset of $X$ is Borel set. Does it follow that every subset of $X$ is open? Give a proof or a counterexample.

#solution[
It is not true. \ Every subset of $X$ is Borel set $arrow.l.r.double cal(P)\(X\)subset cal(B)_X$. And We know $cal(B)_X subset cal(P)\(X\)$, so it is equivalent to saying that $cal(B)_X = cal(P)\(X\)$. \ So consider this counterexample: $bb(Q)$ with the Euclidean metric. \ Claim: every singleton set in $bb(Q)$ is closed, thus in $cal(B)_(bb(Q))$.
This is because this only sequence in a singleton set is the point itself repeating, thus converging to itself, in the singleton set. This proves the claim. \ And since $bb(Q)$ is countable, every subset of $bb(Q)$ is a countable union of singleton sets, thus by property of $sigma$-algebra, every subset of $bb(Q)$ is in $cal(B)_(bb(Q))$. Thus: $ cal(B)_(bb(Q)) = cal(P)\(bb(Q)\) $
But clearly, #strong[not every subset in $bb(Q)$ is open.] Consider any singleton set, ${ 1 }$ as an example. Any open ball centered at $1$ is not contained in ${ 1 }$, thus contradicting the statement.

]
#heading(level: 2, numbering: none)[Restriction of a $sigma$-algebra to a Subset]
<restriction-of-a-sigma-algebra-to-a-subset>
Let $X$ be a set, and $Y subset X$ a subset.

- Given a $sigma$-algebra $cal(A)$ on $X$, prove that
  $ cal(A)\|_Y:= { E inter Y divides E in cal(A) } $
  is a $sigma$-algebra on $Y$.

- Given a $sigma$-algebra $cal(B)$ on $Y$, prove that there exists a $sigma$-algebra $cal(A)$ on $X$ such that $cal(A)\|_Y= cal(B)$.

- Is the $sigma$-algebra $cal(A)$ in (b) unique? Give a proof or a counterexample.

#remark[
这表示任何一个 measurable space 都可以对其中的一个 subspace 取一个 submeasurable space

]
#proof[

- + Since $nothing in cal(A)$, $nothing inter Y = nothing$, we have $nothing in cal(A)\|_Y$

  + Let $F in cal(A)\|_Y$, we must have $E in cal(A)$ s.t. $E inter Y = F$. Since $E in cal(A)$, we have $X\\E in cal(A)$, so $X\\E inter Y in cal(A)\|_Y$. Since $E inter Y = F$ and $Y =\(E inter Y\)union.sq\(\(X\\E\)inter Y\)$, it implies $\(X\\E\)inter Y = Y\\F$, therefore $Y\\F in cal(A)\|_Y$.

  + Let $F_1\,F_2\,dots.h.c$ be a sequence of subsets in $cal(A)\|_Y$. Then for each $i in bb(N)$, we have $F_i = E_i inter Y$ for some $E_i in cal(A)$. Then $union.big_(i = 1)^oo F_i = union.big_(i = 1)^oo\(E_i inter Y\)=\(union.big_(i = 1)^oo E_i\)inter Y in cal(A)\|_Y$ since $union.big_(i = 1)^oo E_i in cal(A)$.

- Let $cal(B)$ be a $sigma$-algebra on $Y$.

  prove that there exists a $sigma$-algebra $cal(A)$ on $X$ such that $cal(A)\|_Y= cal(B)$.
  Consider let
  $ cal(A) := { thin E subset X divides E inter Y in cal(B) } $
  Then
  $ cal(A)\|_Y= { E inter Y divides E\,Y subset X\,E inter Y in cal(B) } = cal(B) $
  We then prove that this is a $sigma$-algebra on $X$. \

  + $nothing inter Y = nothing$ so $nothing in cal(A)$.

  + #strong[Closed under complement]: Let $E in cal(A)$, we have $E inter Y in cal(B)$, so $Y\\\(E inter Y\)= Y\\E in cal(B)$. \ Then $\(X\\E\)inter Y = Y\\E in cal(B)$, so $X\\E in cal(A)$.

  + #strong[Closed under countable union]: Let $E_1\,E_2\,dots.h.c$ be a sequence in $cal(A)$, then $E_n inter Y in cal(B)$. for each $n$.
    Hence
    $ (union.big_(n = 1)^oo E_n) inter Y #h(0em) = #h(0em) union.big_(n = 1)^oo\(E_n inter Y\)#h(0em) in #h(0em) cal(B)\, $
    since $cal(B)$ is a $sigma$-algebra on $Y$. Therefore, $union.big_(n = 1)^oo E_n in cal(A)$.

- This is not unique. \ Counterexample:
  $ X = { 0\,1\,2 }\,Y = { 0 } subset X $
  Consider
  $ A_1 := cal(P)\(X\)\,A_2 := { nothing\,{ 0 }\,{ 1\,2 }\,X } $ are valid $sigma$-algebra on $X$. \ Then we have $A_1\|_Y= A_2\|_Y= { nothing\,{ 0 } }$, while $A_1$ is different from $A_2$.

]
#heading(level: 2, numbering: none)[Invariance Properties of the Borel $sigma$-algebra on $bb(R)^n$]
<invariance-properties-of-the-borel-sigma-algebra-on-mathbbrn>
- Prove that $cal(B)\(bb(R)^n\)$ is translation invariant, i.e., if $A subset bb(R)^n$ is a Borel measurable set, then
  $ t + A := { t + x divides x in A } $
  is a Borel measurable set for every $t in bb(R)^n$. (Hint: For any fixed $t$, show that $A = { B subset bb(R)^n : t + B in cal(B)\(bb(R)^n\)}$ is a $sigma$-algebra.)

- Prove that $cal(B)\(bb(R)^n\)$ is scaling invariant, i.e., if $A subset bb(R)^n$ is a Borel measurable set, then
  $ lambda A = { lambda x divides x in A } $
  is a Borel measurable set for every $lambda in bb(R)$.

\(1)

#proof[
Fix $t in bb(R)^n$. Define
$ cal(A) := { thin B subset.eq bb(R)^n : t + B in cal(B)\(bb(R)^n\)} . $
We want to show that $cal(A) = cal(B)\(bb(R)^n\)$. We first show that $cal(A)$ is a $sigma$-algebra.

\1. $nothing in cal(A)$ since $t + nothing = nothing in cal(B)\(bb(R)^n\)$.

\2. $cal(A)$ is closed under complement: Let $B in cal(A)$, then $t + B in cal(B)\(bb(R)^n\)$. The complement $\(t + B\)^c$ is also in $cal(B)\(bb(R)^n\)$. Observe
$ t + B^c = t + bb(R)^n\\B =\(t + bb(R)^n\)\\\(t + B\)= bb(R)^n\\\(t + B\)=\(t + B\)^c $
Since $t + B$ is Borel, its complement is Borel, hence $t + B^c$ is Borel, so $B^c in cal(A)$.

\3. $cal(A)$ is closed under countable unions: Let $B_k in cal(A)$ for $k = 1\,2\,dots.h$, then $t + B_k in cal(B)\(bb(R)^n\)$. Thus
$ t + union.big_(k = 1)^oo B_k #h(0em) = #h(0em) union.big_(k = 1)^oo\(t + B_k\)#h(0em) in #h(0em) cal(B)\(bb(R)^n\). $
Hence $union.big_(k = 1)^oo B_k in cal(A)$.
These three properties show that $cal(A)$ is a $sigma$-algebra. \ Since $t + U$ is open if $U$ is open in $bb(R)^n$, $cal(A)$ contains all open sets. Since $cal(B)\(bb(R)^n\)$ is the smallest $sigma$-algebra containing all open sets in $bb(R)^n$, we have:$cal(B)\(bb(R)^n\)#h(0em) subset.eq #h(0em) cal(A)$
Hence suppose $A in cal(B)\(bb(R)^n\)$, then $A in cal(A)$, so $t + A in cal(B)\(bb(R)^n\)$. This completes the proof of translation invariance.

]
\(2)

#proof[
Fix $lambda in bb(R)$.
Case 1: $lambda = 0$, then $lambda A = { 0 }$ if $A eq.not nothing$, and $lambda A = nothing$ otherwise. Both ${ 0 }$\(closed set) and $nothing$ is Borel set.

Case 2: $lambda eq.not 0$. We define
$ cal(A) := { thin B subset.eq bb(R)^n : lambda B in cal(B)\(bb(R)^n\)} . $

We want to show that $cal(A) = cal(B)\(bb(R)^n\)$. We first show that $cal(A)$ is a $sigma$-algebra.

\1. $nothing in cal(A)$ since $lambda nothing = nothing$.

\2. $cal(A)$ is closed under complement: Let $B in cal(A)$, then $lambda B in cal(B)\(bb(R)^n\)$, then $\(lambda B\)^c$ is also in $cal(B)\(bb(R)^n\)$. Observe $\(lambda B\)^c= lambda B^c$, so $lambda B^c in cal(B)\(bb(R)^n\)$, therefore $B^c in cal(A)$.
\3. $cal(A)$ is closed under countable unions: Let $B_k in cal(A)$ for $k = 1\,2\,dots.h$, then $lambda B_k in cal(B)\(bb(R)^n\)$. Thus
$ lambda union.big_(k = 1)^oo B_k #h(0em) = #h(0em) union.big_(k = 1)^oo\(lambda B_k\)#h(0em) in #h(0em) cal(B)\(bb(R)^n\). $
Hence $union.big_(k = 1)^oo B_k in cal(A)$.
These three properties show that $cal(A)$ is a $sigma$-algebra. \ Since $lambda eq.not 0$, $lambda U$ is open iff $U$ is open in $bb(R)^n$, thus $cal(A)$ contains all open sets, so
$cal(B)\(bb(R)^n\)#h(0em) subset.eq #h(0em) cal(A)$,

Hence if $A in cal(B)\(bb(R)^n\)$, we have $A in cal(A)$, therefore $lambda A in cal(B)\(bb(R)^n\)$. This completes the proof of translation invariance.

]
#heading(level: 2, numbering: none)[Hex and Such]
<hex-and-such>
Let $A subset\[0\,1\]$ be the set of real numbers in $\[0\,1\]$ having a hexadecimal expansion with the digit 5 appearing infinitely many times, and the 'digit' E appearing at most finitely many times. Prove that $A$ is a Borel set. (Hint: see p. 2 of Folland's book.)

#proof[
Define：
$ B := { x in\[0\,1\]divides upright("the digit ’5’ appears infinitely many times in the hex expansion of ") x } . $$ C := { x in\[0\,1\]divides upright("the digit ’E’ appears at most finitely many times in the hex expansion of ") x } . $

Then clearly
$ A = B inter C . $
Hence #strong[it suffices to show that $B$ and $C$ are Borel sets], since intersection of two Borel sets is a Borel set.
And thus it #strong[suffices to show that $B^c$ and $C$ are Borel sets]. Note
$ B^c = { x in\[0\,1\]divides upright("the digit ’5’ appears at most finitely many times in the hex expansion of ") x } $, so the proof for $B^c$ and $C$ are about the same.
We now show $B^c$ is a Borel set:
We define
$ C_(d_1 d_2 dots.h.c d_n) #h(0em) := #h(0em) { thin x in\[0\,1\]: upright("the first ") n upright(" hexadecimal digits of ") x upright(" are ") d_1\,d_2\,dots.h\,d_n }\, $
where each $d_i$ is one of the 16 hexadecimal digits ${ 0\,1\,2\,dots.h\,9\,A\,B\,C\,D\,E\,F }$.
Then the set contains all real numbers between $frac(d_1 d_2 dots.h.c d_n, 16^n)$ and $frac(d_1 d_2 dots.h.c d_n + 1, 16^n)$, so actually it is an interval:

$ C_(d_1 d_2 dots.h.c d_n) = lr([frac(d_1 d_2 dots.h.c d_n, 16^n) \, #h(0em) frac(d_1 d_2 dots.h.c d_n + 1, 16^n))) $
Since it is an interval, it is a Borel set on $\[0\,1\]$.
And we define:
$ D_N = { x : upright("from digit ") N upright(" onward, there are no ’5’s") } . $
Then we have
$ B^c = union.big_(N = 1)^oo D_N\, $
So it suffices to prove that each $D_N$ is Borel set, since a countable union of Borel sets is Borel set.

#strong[Claim : any $D_N$ is a Borel set.]
To prove this, we fix an $N$ and define for each $n gt.eq N$
$ E_n #h(0em) = #h(0em) { thin x in\[0\,1\]: d_n\(x\)eq.not 5 } . $
Then we have
$ E_n = union.big_(d_i in { 1\,dots.h.c\,F } forall 1 lt.eq i lt.eq n\,d_n eq.not 5) C_(d_1 d_2 dots.h.c d_n) $
Thus #strong[each $E_n$ is a Borel set] since it is a finite union of Borel set, which shows that $D_N$ is Borel set, since
$ D_N #h(0em) = #h(0em) inter.big_(k = N)^oo E_k . $
This finishes the proof that $B^c$ is a Borel set, and by a similar argument, $C$ is a Borel set, and thus $A = B inter C$ is a Borel set.

]
#heading(level: 2, numbering: none)[Admissible Annuli generating $cal(B)\(bb(R)^n\)$]
<admissible-annuli-generating-mathcalbmathbbrn>
Define an admissible annulus in $bb(R)^2$ to be a set of the form
$ {\(x\,y\)in bb(R)^2 divides r^2 <\(x - a\)^2+\(y - b\)^2< R^2 }\, $
where $a\,b in bb(Q)$, $r\,R in bb(Q)_(> 0)$, and $r < R$.

- Prove that there are only countably many admissible annuli.

- Prove that every open subset of $bb(R)^2$ is a countable union of (not necessarily disjoint) admissible annuli.

- Prove that the Borel $sigma$-algebra on $bb(R)^2$ is generated by the collection of admissible annuli.

\(1)

#proof[
Let
$ A := { upright("all admissible annulis in ") bb(R)^2 } $
And we define
$ f : bb(Q)^4 & arrow.r A\
\(a\,b\,r\,R\) & mapsto {\(x\,y\)in bb(R)^2 divides r^2 <\(x - a\)^2+\(y - b\)^2< R^2 } $
Since a Annuli defined by this $\(a\,b\,r\,R\)$ is unique, this is a well-defined function; and since every admissible annulis can be defined by an element of $bb(Q)^4$, this map is surjective. Therefore $"card"\(A\)lt.eq "card"\(bb(Q)^4\)$, so $A$ is countable.

]
\(2)

#proof[
#strong[Claim 1: every open set in $bb(R)^2$ is a countable union of open balls, each centered at some $q in bb(Q)^2$.] \ Proof for Claim 1: \ Let $U$ be an open set in $bb(R)^2$.
Define
$ bb(Q)_U := U inter bb(Q)^2 $
By definition, every point in $U$ have an open ball centered at it that is completely contained in $U$, so we pick such ball $B_(r_x)\(x\)$ for each $x in U$.
Since $bb(Q)^2$ is dense in $bb(R)^2$, for each $x in U$ and each corresponding $r_x$, we can find a rational point $q_x in bb(Q)^2$ such that $\|q_x - x\|< r_x / 3$. (Or more generally, as small as we wish.)

Let $r_(q_x) > 0$ be chosen so that
$r_(q_x) = r_x / 3\,$
Then observe that $x in B\(q_x\,r_(q_x)\)$
$ B\(q_x\,r_(q_x)\)subset.neq B\(x\,r_x\)subset U $
which follows from the triangle inequality.

#figure(image("../assets/hw1(1).png", width: 20.0%),
  caption: [
  ]
)

For each $q in bb(Q)_U$, we define:
$ r_(q\,s u p) := sup { r_(q_x) divides q upright(" is chosen by ") x } $
Now we have:
$ U subset union.big_(q in U_q) B_(r_(q\,s u p))\(q\) $
This is because for each each $x in U$, $x in B_(r_(q_x))\(q_x\)subset B_(r_(q_x\,s u p))\(q_x\)$

And we also have the other direction:
$ union.big_(q in U_q) B_(r_(q\,s u p))\(q\)subset.eq U $
since every $B_(r_q)\(q\)$ is guaranteed to be the subset of some ball around some $x in U$.
All togethe we have
$ U = union.big_(q in U_q) B_(r_(q\,s u p))\(q\) $
This finishes the proof of claim 1.

#strong[Claim 2: every open ball centered at some $q in bb(Q)^2$ is a countable union of admissible annulises with the same center, together with another admissible annulis whose center is also rational.]
Proof for Claim 2:
Let $q =\(a\,b\)in bb(Q)^2$. \ We have
$ B \( q\,R\)\\{ q } #h(0em) = #h(0em) union.big_(n = 1)^oo {\(x\,y\):\(R - 1 / n\)^2<\(x - a\)^2+\(y - b\)^2< R^2 } $
\-1, 这里写的略有问题, 因为 $R$ 不一定是 rational 的, 不过我们可以用 density of $bb(Q)$ in $bb(R)$ 来写.
It remains to cover the center. Let $q' :=\(a'\,b'\)in bb(Q)^2$ such that $R\/6 <\|q' - q\|< R\/3$, $r' := R\/6$ and $R' := R\/2$ . Then the annuli $A\(a'\,b'\,r'\,R'\)$ defined by the four parameters is contained in the $B \( q\,R\)$ and it covers ${ q }$.
Therefore
$ B \( q\,R\)#h(0em) = #h(0em)\(union.big_(n = 1)^oo {\(x\,y\):\(R - 1 / n\)^2<\(x - a\)^2+\(y - b\)^2< R^2 }\)union A\(a'\,b'\,r'\,R'\) $

#figure(image("../assets/hw1(2).png", width: 20.0%),
  caption: [
  ]
)

This finishes the proof of Claim 2. \ Combining Claim 1 and Claim 2, we can conclude that #strong[every open subset of $bb(R)^2$ is a countable union of admissible annuli.]

]
\(3)

#proof[
As defined,
$ cal(B)\(bb(R)^2\)= < cal(T)_(m e t r i c) > = < { upright("all open sets in ") bb(R)^2 } > $
Let
$ A := { upright("all admissible annulis in ") bb(R)^2 } $
Every admissible annuli is open in $bb(R)^2$, so
$ A subset { upright("all open sets in ") bb(R)^2 } $
and since $cal(B)\(bb(R)^2\)$ is a $sigma$-algebra, we have
$ < A > subset < { upright("all open sets in ") bb(R)^2 } > = cal(B)\(bb(R)^2\) $by the proposition proved in class.
And by (2), any open set is a countable union of admissible annulis, therefore every open set is in $< A >$ since any countable union of sets in a $sigma$-algebra is still in the set. So
$ { upright("all open sets in ") bb(R)^2 } subset < A > $
This finishes the proof that
$ < A > = < { upright("all open sets in ") bb(R)^2 } > = cal(B)\(bb(R)^2\) $

]
#heading(level: 2, numbering: none)[Nur für Verrückte]
<nur-für-verrückte>
\(It's really not necessary to attempt these problems. Do not hand them in!)

- Let $X$ be a set, and define two operations on $cal(P)\(X\)$:

  - The "product" of two subsets $E\,F subset X$ is the intersection $E inter F$.

  - The "sum" of two sets $E\,F subset X$ is the symmetric difference $E Delta F$.

  - Prove that these operations endow $cal(P)\(X\)$ with the structure of a commutative ring. What are the additive and multiplicative units? Prove that this ring is idempotent.

  - Let us say that a nonempty subset $A subset cal(P)\(X\)$ is a ring if it is closed under differences and finite unions. In other words, if $E\,F in A$, then $E\\F in A$ and $E union F in A$. Prove that a subset $A subset cal(P)\(X\)$ is an algebra iff it is a ring containing $X$.

  - Prove that a nonempty subset $A subset cal(P)\(X\)$ is a ring iff it is a subring of $cal(P)\(X\)$. Also prove that it is an algebra iff it is a subring containing the multiplicative identity.

- Let $\(X\,cal(A)\)$ and $\(Y\,cal(B)\)$ be measurable spaces. Say that a map $f : X arrow.r Y$ is measurable (with respect to the $sigma$-algebras $cal(A)$ and $cal(B)$) if $f^(- 1)\(E\)in cal(A)$ for every $E in cal(B)$.

  - Prove that measurable spaces with measurable maps as morphisms form a category.

  - Try convincing an analyst that (a) is useful.
