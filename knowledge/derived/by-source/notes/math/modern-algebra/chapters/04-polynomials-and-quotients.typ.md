---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/modern-algebra/chapters/04-polynomials-and-quotients.typ"
kgd_source_format: "typst"
kgd_source_sha256: "82dac3a007a7aac615b366590a8853474dab59fa3aa362860c1c9042716c0822"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= Polynomials and quotient rings
<polynomials-and-quotients>

This chapter transcribes the polynomial and quotient material in
'WorkSheets/412-WS9-Mywork.pdf', p. 2 and 'WorkSheets/412-WS10-Mywork.pdf',
pp. 1--3.

== Domains, polynomial units, and division

*Source transcription — WS9, p. 2.* The worksheet records: if $R$ is a
domain, then $R[X]$ is a domain. Its explanation is that the degree of the
product of two nonzero polynomials is the sum of their degrees, so the product
cannot be zero. It then notes that the units of $R[X]$ are exactly the units
of $R$; a nonconstant polynomial cannot have a polynomial inverse. It gives
the special example that in $bZ_p[X]$, the units are the nonzero elements of
$bZ_p$, because $bZ_p$ is a field.

*Source transcription — WS10, p. 1, Part 1(A).* Long division gives

$ X^5+X^3+X^2+1=(X^2+1)(X^3+1)+0. $

The page labels the quotient $q=X^3+1$ and remainder $r=0$. Its red note
states: ``Division algorithm 只能在 field 上有用，因为只有 field 上才对
division 有 well-definedness.'' It then records the failure over $bZ[X]$:
when $deg f<deg g$, a putative quotient can be $q(X)=1/2 X+1/2$, which is
not in $bZ[X]$, so the source's division-algorithm hypothesis fails.

#theorem(title: [#kn[Polynomial division]])[
For $f,g in F[X]$ with $g!=0$, there are unique $q,r in F[X]$ such that

$ f=q g+r quad text(and) quad (r=0 text(or) deg r<deg g). $
]

*Source transcription — WS10, p. 1, C(1).* Fix $f in F[X]$. Divide $f$ by
$X-lambda$:

$ f(X)=g(X)(X-lambda)+r(X), quad deg r<deg(X-lambda)=1. $

Thus $r$ is constant. Substituting $X=lambda$ gives $f(lambda)=r$.
The source calls this the ``Pf of Remainder Thm'' and writes ``$f(lambda)$
是 $(X-lambda)$ 的 remainder.''

*Source transcription — WS10, p. 1, C(2).* The factor theorem is recorded
in both directions:

$ (X-lambda)|f(X) text("if and only if") f(lambda)=0. $

If $f(lambda)=0$, division gives $f=q(X-lambda)+0$; conversely, substitute
$lambda$ in a multiple of $X-lambda$.

== Factorisation and irreducibility

*Source transcription — WS10, p. 1, B.* For the polynomial gcd exercises,

$ 2X^2-10X+12=2(X-3)(X-2), quad X^2-3X-2=X^1(X-3), $

so the source writes $gcd=X-3$. It also records in $bZ_2[X]$:

$ (X^2+1)(X^3+X^2)=X^2(X^2+1)(X+1), $

then identifies $X^2(X^2+1)$ as the gcd. The handwritten explanation says:
``official def: 一直有定义的 ring 下使只要是 subring，且 $1$ 和 $0$ 也在
（事 $X$ 的 multiplication 是 well-defined 的）$0_R=[0]_2=0_T$.''

For the Bézout prompt the source writes that there must be $f,g in bQ[X]$
with

$f(2X^2-10X+12)+g(X^2-3X+2)=gcd(f,g)=X-3.$

It also notes that $1,2,3,4$ are the only units of $bZ_5[X]$ (``plug in
就好'') and factors

$ X^5-X=X(X^4-1)=X(X-1)(X+1)(X-2)(X-3) $

in $bZ_5[X]$ by checking roots $0,1,2,3,4$.

*Source transcription — WS10, pp. 1--2, D.* If $f in F[X]$ has degree $2$
or $3$, then $f$ is irreducible iff it has no root. The forward implication
uses the factor theorem: irreducibility forbids a factor $X-lambda$ and so
forbids $f(lambda)=0$. Conversely, if $f=g h$ is nontrivial, degrees add in a
field/domain. For degree $2$ or $3$, one factor must have degree $1$; writing
that factor as $a X+b$ yields the root $-b/a$.

The source then factors $X^4-1$ in $bZ_2[X]$. It explicitly says that one
must check whether $X^2+1$ is irreducible; by the degree-$2$ criterion it has
no root in $bZ_2$, so

$ X^4-1=X(X^2-1)=X(X^2-1)(X^2+1)=X(X-1)(X+1)(X^2+1) $

is the recorded factorization.

== Congruence modulo a polynomial and quotient rings

*Source transcription — WS10, p. 2, Part 3.* For $g,h in F[X]$ define

$ g equiv h (mod f) text("if and only if") f | (g-h). $

The source calls $[g]_f$ the collection of all polynomials congruent to $g$
modulo $f$ and writes

$ [g]_f={g+t f:t in F[X]}. $

It explicitly notes: ``这里有证锣了，我们易证'' that congruence modulo $f$ is
an equivalence relation, $h in [g]_f => [g]_f=[h]_f$, and distinct congruence
classes are disjoint.

*Source transcription — WS10, p. 2, F.* Every class $[g]_f$ has a unique
$h(X) in F[X]$ with $deg h<deg f$. Existence is by division. For uniqueness,
if $m=r+k f$ with $r$ the remainder, then $k=1$ would make the degree of $m$
equal to $deg f>deg r$, while $k=-1$ gives the same degree obstruction; no
other degree can make two different low-degree representatives congruent.

*Source transcription — WS10, p. 3, G.* Let $f in F[X]$ have positive degree
and put

$R={ [g]_f:g in F[X]}. $

The source defines $[g]_f+[h]_f=[g+h]_f$,
$[g]_f[h]_f=[g h]_f$, $0_R=[0]_f$, and $1_R=[1]_f$, marking the operations
``well-defined'' and calling $R$ a ring. For the example

$R={ [g]_(X^2):g in bZ_2[X]}$,

the page maps the four classes to $bZ_2 times bZ_2$:
$[0]$ to $(0,0)$, $[1]$ to $(1,1)$, $[X]$ to $(0,1)$, and
$[1+X]$ to $(1,0)$, and labels the map ``isomorphic to $bZ_2 times bZ_2$''.
