#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let intersect = math.inter
#let bC = math.bb("C")

// Personal authority: Homework/451-hw-2.pdf pp.1–16.
// Checking-only sources: 451-hw-2-raw.pdf pp.1–2; 451-hw-sol-all.pdf pp.5–8.
= Homework 2: cardinality and sequences

#remark(title: [Authority label])[
  This is a visual transcription of *personal work* in `451-hw-2.pdf`.
  The raw assignment and consolidated solution PDF are checking-only sources;
  neither supplies the solution body below.
]

The submission uses $X prec.eq Y$ for the existence of an injective function
from $X$ to $Y$, and $X approx Y$ for the existence of a bijection. It recalls
Cantor--Schröder--Bernstein: $X approx Y$ if and only if $X prec.eq Y$ and
$Y prec.eq X$.

== Problem 1 — triangle inequality for finite sums

#note(title: [原稿红字])[hw 2 ①：$|sum_(k=1)^n a_k|<=sum_(k=1)^n|a_k|$。]

For $a_1,dots,a_n in bR$, prove by induction that
$|sum_(k=1)^n a_k|<=sum_(k=1)^n|a_k|$.

#proof[
  We prove it by induction on $n in bN$. Base case: $n=1$, and
  $|sum_(k=1)^1a_k|=|a_1|=sum_(k=1)^1|a_k|$, so the claim holds.

  Inductive step: assume the inequality holds for all $a_1,dots,a_n in bR$
  for $n=1,2,dots,j$. Then
  $
    |sum_(k=1)^(j+1)a_k|=|sum_(k=1)^j a_k+a_(j+1)|
    <= |sum_(k=1)^j a_k|+|a_(j+1)| quad (1)
  $
  By the inductive hypothesis for $n=j$,
  $|sum_(k=1)^j a_k|<=sum_(k=1)^j|a_k|$. Combining this with (1),
  $|sum_(k=1)^(j+1)a_k|<=sum_(k=1)^(j+1)|a_k|$. This finishes the proof.
]

== Problem 2 — bounds of a scalar multiple

Let $A subset.eq bR$ be bounded, let $c in bR$, and write $c A={c a:a in A}$.

#solution[
  If $c>0$, the submitted expressions are $sup(c A)=c sup A$ and
  $inf(c A)=c inf A$; if $c=0$, both are $0$; and if $c<0$, they are
  $sup(c A)=c inf A$ and $inf(c A)=c sup A$.

  For $c>0$, take arbitrary $a in A$. Since $sup A>=a$, $c sup A>=c a$,
  so $c sup A$ is an upper bound of $c A$. If $c b$ is an upper bound of $c A$,
  then $c b>=c a$ for all $a in A$. Since $c>0$, $b>=a$, so $b$ is an upper
  bound of $A$. Thus $b>=sup A$, hence $c b>=c sup A$. Therefore
  $c sup A=sup(c A)$.

  For $c=0$, $c A={0}$, so $c sup A=0=sup(c A)$. For $c<0$, take arbitrary
  $a in A$. Since $inf A<=a$, $c inf A>=c a$, so $c inf A$ is an upper bound
  of $c A$. If $c b$ is an upper bound of $c A$, then $c b>=c a$ for all $a in A$.
  Since $c<0$, $b<=a$, so $b$ is a lower bound of $A$; hence $b<=inf A$ and
  $c b>=c inf A$. Thus $c inf A=sup(c A)$.
]

== Problem 3 — injective maps and $prec.eq$

#note(title: [原稿红字])[hw 2 ②：$prec.eq$ 是一个 partial order。]

Let $f:X -> Y$ and $g:Y -> Z$ be functions.

=== (a)

#proof[
  Suppose $f$ and $g$ are injective. Let $g compose f(a)=g compose f(b)$,
  where $a,b$ are in the domain of $g compose f$. Since $g$ is injective,
  $f(a)=f(b)$; since $f$ is injective, $a=b$. Hence $g compose f$ is
  injective.
]

=== (b)

#proof[
  Let $X$ be an arbitrary set. The function $f:X -> X$ defined by $f(x)=x$
  is injective by uniqueness of every element in a set, so $X prec.eq X$.
  Thus $prec.eq$ is reflexive.

  Let $X prec.eq Y$ and $Y prec.eq Z$. There are injective functions $f:X ->Y$
  and $g:Y -> Z$. By part (a), $g compose f:X ->Z$ is injective, so
  $X prec.eq Z$. Therefore $prec.eq$ is transitive.
]

== Problem 4 — inclusions, injections, and surjections

#note(title: [原稿红字])[hw 2 ③：$A subset.eq B => A prec.eq B$。]

=== (a)

#proof[
  Assume $A subset.eq B$. Consider $f:A -> B$ defined by $f(x)=x$. It is
  injective by uniqueness of every element in a set. Therefore $A prec.eq B$.
]

=== (b)

#proof[
  First suppose $f:A -> B$ is injective. Let $a in A$ be arbitrary and define
  $g:B -> A$ by $g(x)=f^(-1)({x})$ if $x$ is in the range of $f$, and $g(x)=a$
  if $x$ is not in the range of $f$. This function is well-defined since $f$ is injective, so
  there is only one element in $f^(-1)({x})$ for each $x in B$. Thus
  The range of $g$ is $A$, so $g$ is surjective.

  Conversely suppose $g:B -> A$ is surjective. For every $a in A$, there is
  some $b in B$ with $g(b)=a$, i.e. $g^(-1)({a})!=emptyset$. Define
  $f:A -> B$ by sending every $a in A$ to some $b in g^(-1)({a})$. Its
  well-definedness is guaranteed by $g^(-1)({a})!=emptyset$; it is injective
  because $g^(-1)({a_1}) intersect g^(-1)({a_2})=emptyset$. This finishes the
  if-and-only-if proof.
]

== Problem 5 — remove a finite or countable subset

#note(title: [原稿红字])[hw 2 ④：infinite set / finite set / unctb set / ctb set，基数不变。]

=== (a)

#proof[
  First construct $f:A without A_0 -> A$ by $f(a)=a$. It is injective, hence
  $A without A_0 prec.eq A$. Let $A_0={z_1,z_2,dots,z_n}$ for some
  $z_1,dots,z_n in A$. Since $A$ is infinite and $A_0$ is finite,
  $A without A_0$ is infinite. Take a countable subset
  $A_1={y_1,y_2,dots} subset.eq A without A_0$. Define $f:A ->A without A_0$
  piecewise: for $x in (A without A_0) without A_1$, let $f(x)=x$; for
  $x=z_k$ with $k in bN$, let $f(x)=y_(2k)$; and for $x=y_k$ with $k in bN$,
  let $f(x)=y_(2k-1)$.
  The work records that it is well-defined since
  $((A without A_0) without A_1) union A_0 union A_1=A$, and injective since
  $((A without A_0) without A_1) intersect A_0 intersect A_1=emptyset$.
  Thus $A prec.eq A without A_0$. Cantor--Schröder--Bernstein gives
  $A approx A without A_0$.
]

=== (b)

#proof[
  Since $A_0$ is countable, write $A_0={z_1,z_2,dots}$. Take a countably
  infinite subset $A_1={y_1,y_2,dots} subset.eq A without A_0$. Define
  $f:A -> A without A_0$ by the same three cases as in part (a): it fixes
  $(A without A_0) without A_1$, sends $z_k$ to $y_(2k)$, and sends $y_k$ to
  $y_(2k-1)$. The submission records that this is well-defined, injective,
  and surjective: every $a in A without A_0$ is either in
  $(A without A_0) without A_1$ or in $A_1$, and in either case there is
  $x$ with $f(x)=a$. Therefore $A approx A without A_0$.
]

== Problem 6 — algebraic and transcendental real numbers

#note(title: [原稿红字])[hw 2 ⑤：代数无理数 $bR without bQ$ unctb。]

=== (a)

#proof[
  Let $A_k$ be the set of all roots of polynomials with rational-number
  coefficients with $k$ terms. By definition,
  $overline(bQ)=union_(k in bN)A_k$. For arbitrary $k in bN$, let
  $q=(b_1/a_1,b_2/a_2,dots,b_k/a_k) in bQ^k$ be the polynomial with those
  coefficients. Then $A_k=union_(q in bQ^k) A_(k,q)$. Since $bQ subset.eq bC$,
  the fundamental theorem of algebra gives that $A_(k,q)$ has at most $k$
  roots. Thus every $A_(k,q)$ is finite. Because $bQ^k$ is countable,
  $A_k$ is countable for each $k$, and so
  $overline(bQ)=union_(k in bN)A_k$ is countable.

  Since $bC approx bR^2$ is uncountable and $overline(bQ)$ is countable,
  $bC without overline(bQ)$ is uncountable (and $bC without overline(bQ) approx bC$).
  This indicates uncountably many transcendental numbers.
]

=== (b)

#proof[
  Let $a,b in bR$ with $a<b$, and let $bQ_0$ be the set of all algebraic
  numbers in $(a,b)$. Since $bQ_0 subset.eq overline(bQ)$ and $overline(bQ)$
  is countable, $bQ_0$ is countable. Since $(a,b)$ is uncountable,
  $(a,b) without bQ_0$ is uncountable. Thus there are uncountably many
  transcendental numbers in $(a,b)$.
]

== Problem 7 — power sets and functions $bR -> bR$

#note(title: [原稿红字])[hw 2 ⑥：$bR prec.eq cal(P)(bR) prec.eq bR^bR$。]

=== (a)

#proof[
  Let $A in cal(P)(bR)$ be arbitrary. Consider the characteristic function
  $f_A:bR -> bR$ defined by $f_A(x)=1$ if $x in A$, and $f_A(x)=0$ if
  $x in.not A$. Define $psi:cal(P)(bR)->bR^bR$ by $psi(A)=f_A(x)$ for each
  $A in cal(P)(bR)$. If $psi(A)=psi(B)$, then $f_A(x)=f_B(x)$, so every
  $x in A$ is in $B$ and every $x in B$ is in $A$; hence $A=B$. Therefore
  $cal(P)(bR) prec.eq bR^bR$.
]

=== (b)

#proof[
  Assume for contradiction that there is a surjective function from $bR$ to
  $bR^bR$. By Problem 4(b), there is an injective function from $bR^bR$ to
  $bR$, so $bR^bR prec.eq bR$. Together with $cal(P)(bR) prec.eq bR^bR$ and
  $bR prec.eq cal(P)(bR)$ by Problem 3(b), there is a surjective function from
  $bR$ to $cal(P)(bR)$, contradicting Cantor's theorem. Hence no surjective
  function from $bR$ to $bR^bR$ exists.
]

== Problem 8 — direct proofs of sequence limits

=== (a)

#proof[
  Let $epsilon>0$. Take $N>1/epsilon$ by the Archimedean property, so
  $epsilon>1/N$. For $n>=N$,
  $|(-1)^n/n-0|=1/n<=1/N<epsilon$. Thus $lim_(n->infinity)(-1)^n/n=0$.
]

=== (b)

#proof[
  Let $epsilon>0$. Take $N>1/epsilon-1$, so $N+1>1/epsilon$ and
  $epsilon>1/(N+1)$. For $n>=N$,
  $|n/(n+1)-1|=1/(n+1)<=1/(N+1)<epsilon$. Thus $lim_(n->infinity)n/(n+1)=1$.
]

== Problem 9 — absolute values and powers

#note(title: [原稿红字])[hw 2 ⑦：$lim a_n=L => lim |a_n|=|L|$；$lim(a_n)^k=L^k$。]

#proof[
  Let $epsilon>0$ and fix $N in bN$ such that $|a_n-L|<epsilon$ whenever
  $n>=N$. Since $(|a_n|-|L|)^2=a_n^2-2|a_n||L|+L^2$ and
  $|a_n-L|^2=a_n^2-2a_n L+L^2$, the submission concludes
  $(|a_n|-|L|)^2<=|a_n-L|^2$, hence $||a_n|-|L||<=|a_n-L|<epsilon$.
  Therefore $lim_(n->infinity)|a_n|=|L|$.
]

== Problem 10 — powers of a convergent sequence

#proof[
  The proof is by induction on $n$. Base case: $n=1$ and
  $lim_(k->infinity)a_k=L=L^1$. Assume for $n=k$ that
  $lim_(k->infinity)a_k^n=L^n$. Then
  $
    lim_(k->infinity)a_k^(n+1)
    =lim_(k->infinity)(a_k^n a_k)
    =lim_(k->infinity)a_k^n dot.op lim_(k->infinity)a_k
    =L^n dot.op L=L^(n+1)
  $
  by the limit law. Thus if $(a_k)$ converges to $L$, then
  $lim_(k->infinity)a_k^n=L^n$ for all $n in bN$.
]

== Problem 11 — successive differences

Let $s_n=a_(n+1)-a_n$. If $(a_n)$ converges, prove $(s_n)$ converges to zero.

#proof[
  Since $(a_n)$ converges, $lim a_n=L$ for some $L in bR$. Let $epsilon>0$
  and fix $N in bN$ such that $|a_n-L|<epsilon/2$ whenever $n>=N$. Then
  $L-epsilon/2<a_(n+1)<L+epsilon/2$ and
  $L-epsilon/2<a_n<L+epsilon/2$, so
  $0<|a_(n+1)-a_n|<epsilon/2-(-epsilon/2)=epsilon$. Hence
  $|s_n-0|<epsilon$ and $lim_(n->infinity)s_n=0$.
]

== Problem 12 — a sequence converging to $sup S$

#note(title: [原稿红字])[hw 2 ⑧：$S$ bounded $=> exists(a_n)->sup S$ in $S$。]

Let $S$ be a bounded nonempty subset of $bR$. Show that there is a sequence
in $S$ converging to $sup S$.

#proof[
  Consider $b_n=sup S-1/n$ for $n in bN$. By the definition of supremum,
  $b_n$ is not an upper bound of $S$; for each $n$, there exists some
  $a>b_n$ where $a in S$. Take one such $a$ as $a_n$ for each $b_n$ (the same
  $a$ can be taken repeatedly). Then $(a_n)$ is a sequence in $S$.

  Let $epsilon>0$ and take $N in bN$ with $N>1/epsilon$, so $1/N<epsilon$.
  For $n>=N$, $|b_n-sup S|=1/n<1/N<epsilon$. Since
  $a_n>b_n$ and $a_n<sup S$,
  $|a_n-sup S|<|b_n-sup S|<epsilon$. Therefore
  $lim_(n->infinity)a_n=sup S$.
]

== Optional challenge problems

The personal PDF prints Problem 13(a)--(b), concerning $[0,1]$ as a union of
open intervals and $(0,1)$ as an intersection of closed intervals, and
Problem 14, asking whether the converse of Problem 11 is true. No personal
answer is written on source page 14; source pages 15--16 are blank.

// TODO(source: 451-hw-2.pdf, p.14, Problems 13(a)–14): no personal solution
// is present in the finished submission. This is an original omission, not a
// gap filled from raw.pdf or 451-hw-sol-all.pdf.
