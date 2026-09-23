#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= Rings and homomorphisms
<rings-and-homomorphisms>

This chapter transcribes 'WorkSheets/412-WS7-Ring-Mywork.pdf', p. 1;
'412-WS8-Mywork.pdf', pp. 1--2; and the ring-homomorphism portion of
'412-WS9-Mywork.pdf', p. 1.

== Ring structure

*Source transcription — WS7, p. 1.* An operation on a set $S$ is a function
$f:S times S -> S$. A ring is a set $R$ with two operations ``$+$'' and
``$times$'' such that, for all $a,b,c in R$:

1. $(R,+)$ is an abelian group: closure, associativity, commutativity,
   $0_R$, and additive inverses;
2. multiplication has closure and associativity;
3. there is $1_R$ such that $1_R a=a 1_R=a$ (``有幺元的环即为环'' in the
   handwritten note); and
4. $(a+b)c=a c+b c$ and $a(b+c)=a b+a c$.

The source then proves $0 times x=0$: from
$0 times x=(0+0)times x=0 times x+0 times x$, let $y$ be the additive inverse
of $0 times x$, add $y$ to both sides, and obtain $0=0 times x$.

*Source transcription — WS7, p. 1, D(1).* To show a nonempty subset $S$ of a
ring $R$ is a subring, the worksheet lists: $1_R,0_R in S$; $S$ is closed
under $+$ and $times$; and $S$ is closed under additive inverse. It notes
that the inherited $+$ is commutative and associative and $times$ distributes
over it, while $1_R,0_R$ serve as the identities; ``所以只要证明
$1_R,0_R in S$ 且对 closure 即可.''

*Source transcription — WS7, p. 1, D(2).* The set $text("Fun")(R,R)$ of all functions
from $R$ to itself, with pointwise operations

$ (f+g)(x)=f(x)+g(x), quad (f g)(x)=f(x)g(x), $

is recorded as a ring. The source asks whether there are other subrings:
``① 它自己；② 一个 smallest subring: 至少 include $1_R,0_R$. 因而 all
elements of $S$: $n dot 1_R=1_R+...+1_R$, $n in bZ$.'' It concludes that
$ {n dot 1_R:n in bZ}$ is a subring and is the smallest subring.

== Ring homomorphisms

*Source transcription — WS8, p. 1, A.* The page lists seven maps and their
status:

1. the inclusion $phi:bZ -> bQ$, $z mapsto z/1$, is a hom but not an
   isomorphism (for example $2/3$ is not $phi(z)$);
2. the doubling map $phi:bZ -> bZ$, $z mapsto 2z$, is not a hom because
   $1 mapsto 2$ and it does not preserve $1_bZ$;
3. the residue map $phi:bZ -> bZ_N$, $z mapsto [z]_N$, is a hom by modular
   arithmetic, is surjective, but is not an isomorphism because it is not
   one-to-one;
4. the ``evaluation at $0$'' map $phi:bR[X]->bR$, $f(X) mapsto f(0)$, is a
   hom: the page writes $text("eval")(f(X)+g(X))=text("eval")(f(X))+text("eval")(g(X))$ and similarly
   for products;
5. $phi:bR[X]->bR[X]$, $f(X) mapsto f'(X)$, is not a hom because
   $1 mapsto 0$;
6. $phi:bR -> M_2(bR)$,
   $lambda mapsto mat(lambda,0;0,lambda)$, is a hom, with the addition and
   product of diagonal matrices written out; and
7. $phi:M_2(bZ)->bR$, $A mapsto det(A)$, is not a hom, as a displayed pair
   of matrices shows $det(A+B)!=det(A)+det(B)$.

#definition(title: [#kn[Ring homomorphism]])[
A map $phi:R->S$ is a ring homomorphism when
$phi(x+y)=phi(x)+phi(y)$ and $phi(x y)=phi(x)phi(y)$.
]

*Source transcription — WS8, p. 1, B(1)--(3).* Every hom preserves $0_R$:
from $0_S+0_S=0_S$ one gets
$phi(0_S)=phi(0_S+0_S)=phi(0_S)+phi(0_S)$ and cancels an additive inverse.
It preserves additive inverse because
$phi(x)+phi(-x)=phi(0_S)=0_T$, hence $-phi(x)=phi(-x)$. It preserves units:
if $u u^(-1)=1_S$, then
$phi(u)phi(u^(-1))=phi(1_S)=1_T$, so $phi(u)$ and $phi(u^(-1))$ are units.

The same page gives the kernel definition and an example:

$ ker psi={ (0_R,s) : s in S} $

for $psi:R times S->R$, $(r,s)mapsto r$. It also writes the informal summary
``isomorphism preserves 基本 everything（而 hom 只需要 surjective 也 preserve
所有的单位元）'', followed by the counter-cue ``不是所有 field, domain ...''.

*Source transcription — WS8, pp. 1--2, C--E.* A homomorphism kernel is
nonempty because $phi(0_S)=0_R$; in particular $0_S in ker phi$. The source
proves

$ phi text("injective") text("if and only if") ker phi={0_S}. $

If $phi$ is injective and $x in ker phi$, then $phi(x)=phi(0_S)$, so
$x=0_S$. Conversely, if $ker phi={0_S}$ and $phi(x)=phi(y)$, then
$phi(x)+(-phi(y))=0_R=phi(x+(-y))$, hence $x-y in ker phi$, $x=y$.

The Chinese/English note continues: ``如何都有一个 unique 的从 $bZ$ 到 $R$
之间的 hom $psi:bZ->R$，这个 hom 叫做 canonical ring homomorphism.'' If such
a $psi$ exists, $psi(1)=1_R$ and $psi(0)=0_R$; for $n>=1$,
$psi(n)=psi(1+...+1)=n dot 1_R$, while for $n<=-1$,
$psi(n)=-n dot 1_R$. Thus the possible map is unique, and this calculation
also verifies it is a hom:
$psi(n+m)=psi(n)+psi(m)$ and $psi(n m)=psi(n)psi(m)$.

== Domains and fields

*Source transcription — WS8, p. 2, D--E.* The worksheet proves that
$0_R=1_R$ if and only if $R={0_R}$: for $r in R$,
$r=r 1_R=r 0_R=0_R$. It then records ``Thm 3.8: every field 一定 domain'':
if $a,b in F$, $a b=0$, and $a!=0$, multiply by $a^(-1)$ to get
$b=0_F$. The red Chinese explanation adds: ``任何自乘的去，$+$ 中的所有非
0 元不能乘起就 0；因为 $F$ 上 $+-times$ 是 well-defined，如果有元被中
$+-times$ 就失去唯一性了.''

A subring of a domain is a domain (``去除了不必要了，本来所有非 0 元不能乘
到 0，$+times$ 也肯定一样''). For $S subset R$, the inclusion map
$phi:S->R$ is a ring hom exactly when $S$ is a subring of $R$; the source
explains that the issue is the map is the inclusion and therefore one must
retain the same $0,1,+,times$.
