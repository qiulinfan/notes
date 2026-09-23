---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/modern-algebra/chapters/02-gcd-primes-and-congruence.typ"
kgd_source_format: "typst"
kgd_source_sha256: "e08fe97f3b970778c45c6aef98be77c865823c134bc549fa4c3a67b86d18f78e"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= Gcd, primes, and congruence
<gcd-primes-and-congruence>

This chapter transcribes 'WorkSheets/412-WS3-Mywork.pdf', pp. 1--2;
'412-WS4-Mywork.pdf', pp. 1--2; and
'412-WS5-Mywork.pdf', pp. 1--2.

== Prime factorization

*Source transcription — WS3, p. 1, ``Pf of Thm 1''.* The sheet states

$ p in bZ text("except") {0, plus.minus 1} text("is prime")
  text("if and only if") (p | b c => p | b text("or") p | c). $

For the forward implication, write $b=k p$ when $p | b$. Since $p$ is prime,
the source notes that $gcd(p,b)$ can only be $1$ or $plus.minus p$;
$gcd(p,b)=1$ gives $p | c$ by the preceding corollary, while
$gcd(p,b)=p$ gives $p | b$ by definition. The Chinese margin explanation is:
``这一段实际很好想: $p$ is prime => say $p=k d$, $d in bZ$ composite,
就会使 $p | b c$ 但 $p$ 不可能整除 $b$ 或 $c$，可以是整除 $b$ 的某一个
连结的因数，因此 $p | p$，而它不可能整除自己的 factor.''

For the converse the source uses the contrapositive: if $p$ is not prime,
there are $b,c in bZ$ with $p | b c$, but $p$ does not divide either $b$ or
$c$. It then writes $p=k d$, with $k!=plus.minus 1$ and $k!=p$, so $p$ is
composite; because $p$ is not a unit and $|p|>1$, this gives the required
nontrivial factors.

#theorem(title: [Euclid's lemma])[
If $p$ is prime and $p | a b$, then $p | a$ or $p | b$.
]

*Source transcription — WS3, p. 1, ``Pf of Corollary 1''.* If
$p in bZ$ is prime and $p | (a_1 dots a_n)$, then $p | a_i$ for some $i$.
The source says that this is the same simple argument as the two-factor case:
treat $a_1 dots a_(n-1)$ as one factor and repeat the argument, that is, use
induction.

*Source transcription — WS3, p. 1, ``Pf of Thm 2 (FTA), Part I:
Existence''.* Consider

$ S={s>1 : s in bZ, s text("is not product of primes")}. $

The sheet proves: (4) every element of $S$ is composite (a prime cannot lie in
$S$, since $p=p$ is a trivial factorization); (5) if $a,b>1$ and $a b in S$,
then $a in S$ or $b in S$ (the contrapositive is written); and (6) $S$ is
empty. Indeed, if $S$ were nonempty, let $s$ be its minimum by well-ordering.
By (4), $s=a b$ with $a,b>1$; by (5), one of $a,b$ is in $S$ and is smaller
than $s$, a contradiction. Thus every nonzero nonunit admits a prime
factorization.

*Source transcription — WS3, p. 2, ``Pf of Thm 2 FTA, Part II:
Uniqueness''.* Suppose

$ n=p_1 dots p_s=q_1 dots q_t $

are two factorizations into primes. Since $p_1 | (q_1 dots q_t)$, Euclid's
lemma makes $p_1$ divide one $q_i$; as $q_i$ is prime,
$p_1=plus.minus q_i$. Eliminating associated prime factors on both sides
and repeating, if $s<t$ then the remaining equality would say
$1=q_(s+1) dots q_t$, impossible because each $q_i$ is prime. Hence $s=t$,
and after reordering every $p_i=q_i$ up to associates.

*Source transcription — WS3, p. 2, ``GCD Exercise''.* If

$ a=plus.minus p_1^(a_1) dots p_n^(a_n), quad
  b=plus.minus p_1^(b_1) dots p_n^(b_n), $

with $0<=c_i<=min(a_i,b_i)$, then every common divisor has the form
$d=plus.minus p_1^(c_1) dots p_n^(c_n)$. Thus

$ gcd(a,b)=product_(i=1)^n p_i^(min(a_i,b_i)). $

== Congruence modulo $N$

*Source transcription — WS4, p. 1.* ``Congruence 的概念是对 equality
relation 的 generalization.'' For $a,b in bZ$,

The #kn[Congruence modulo N] relation is defined by

$ a=b text("if and only if") a-b=0, quad
  a equiv b (mod N) text("if and only if") a-b=N k text("for some") k in bZ, $

that is, $N | (a-b)$. The source explicitly compares the three equality
axioms—reflexive, symmetric, transitive—with their congruence counterparts,
then defines the congruent class $[a]_N$ and lists

$ [0]_3={dots,-3,0,3,dots},
quad [1]_3={dots,-2,1,4,7,10,dots},
quad [2]_3={dots,-1,2,5,8,11,dots}. $

For classes the worksheet proves ``相等或者是 disjoint.'' If
$x in [a]_N ∩ [b]_N$, then $x equiv a (mod N)$ and
$x equiv b (mod N)$, hence $a equiv b (mod N)$. Any $y in[a]_N$ is then
congruent to $b$ by transitivity, so $[a]_N subset [b]_N$; similarly the
reverse inclusion holds. It also records
$[a]_(10) subset [a]_N$ when $N$ divides $10$.

The source asks whether $[a]_7 mapsto$ ``round down $a$ to 最近的 $10$ 的倍数''
is a function and concludes: ``其实不是.'' For example, with
$x=[0]_7={dots,-14,-7,0,7,14,dots}$, the representatives map to different
multiples of $10$, so one class would have multiple images. In contrast,
$[a]_7 mapsto [-a]_7$ is a function: replacing one representative by another
congruent representative preserves the resulting class.

*Source transcription — WS4, pp. 1--2, well-defined operations.* The
worksheet defines

$ [a]_N + [b]_N=[a+b]_N, quad [a]_N [b]_N=[a b]_N. $

For multiplication, if $x=a+k a$ and $y=b+l b$ are written as source
representatives, then the calculation is retained in its displayed form:

$ x y=a b+k a b+l a b+k l a b
      = (1+k+l+k l)a b, $

so $a b$ is congruent to $x y$. It says: ``$bZ_N$ 具有除了 $x^(-1)$ 外所有
field 的性质（A/M/D 易证）.'' It then proves that if $gcd(a,N)=1$, then
$[a]_N x=[1]_N$ has a solution: Bézout gives $a r+N s=1$, hence
$[a]_N[r]_N=[1]_N$.

The source proves uniqueness of the solution to $[a]_N x=[1]_N$ under the
coprime condition: if $[a]_N[x_1]_N=[a]_N[x_2]_N$, then
$[a]_N[x_1-x_2]_N=[0]_N$; since $[a]_N$ is a unit,
$[x_1-x_2]_N=[0]_N$, hence $[x_1]_N=[x_2]_N$. It continues that every
$[a]_N x=[b]_N$ then has a unique solution by multiplying the solution of
$[a]_N[r]_N=[1]_N$ by $[b]_N$.

== Linear combinations modulo $N$

*Source transcription — WS5, pp. 1--2.* The source proves

$ {r a+s n : r,s in bZ}={k gcd(a,n) : k in bZ}. $

For $Q={k gcd(a,n):k in bZ}$ and $P={r a+s n:r,s in bZ}$, Bézout gives
$gcd(a,n)=a u+n v$, hence every $k gcd(a,n)=a(k u)+n(k v)$ lies in $P$.
Conversely, $gcd(a,n)$ divides both $a$ and $n$, so it divides every
$r a+s n$ and that expression lies in $Q$.

Thus $[a]_N[x]=[b]_N$ has a solution exactly when $gcd(a,N) | b$.
The sheet writes the example

$ [9]_(12)x=[3]_(12), $

whose solutions are $[3],[7],[11]$ because $3=gcd(9,12)$ divides $3$ and
the solutions differ by $12/3=4$. The source's question ``有多少 sol?'' is
answered: if $d=gcd(a,N)$, the distinct solutions are separated by
$N/d$; hence there are $d$ solution classes.
