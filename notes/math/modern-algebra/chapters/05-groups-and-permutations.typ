#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= Groups and permutations
<groups-and-permutations>

This chapter is a source-language transcription of
'WorkSheets/412-WS18-symmetric_group-Mywork.pdf', pp. 1--2.

== Symmetric groups and cycles

*Source transcription — WS18, p. 1, A(6).* The inverse of a cycle is written

$ (a_1,a_2,dots,a_j)^(-1)=(a_j,a_(j-1),dots,a_1), $

followed by ``一般真.'' The worked example is
$(1,2,3,4,5)^(-1)=(5,4,3,2,1)$.

*Source transcription — WS18, p. 1, B.* The source records
$|S_n|=n!$. For subgroups of $S_4$, it gives

$ <(1 2 3 4)>={e,(1 2 3 4),(1 3)(2 4),(1 4 3 2)} $

and labels it ``cyclic 4 group'', while

$ {e,(1 2)(3 4),(1 3)(2 4),(1 4)(2 3)} $

is labelled ``Klein 4 group''. It writes that $S_4$ has $4!/2=12$
subgroups isomorphic to $S_2$: fix one of the four elements and permute the
remaining three, using the count $binom(n,k)$ for the number of corresponding
subgroups in $S_n$.

The source explains the cycle decomposition algorithm for a permutation:

1. begin from an element of ${1,2,3,dots,n}$ and follow its cycle backwards;
2. delete every element used in that cycle, then repeat the bijection process
   with unused elements;
3. continue until the elements $1,2$ are both used.

It writes the standard transposition expansion

$ (a_1,a_2,dots,a_j)=(a_1 a_2)(a_2 a_3)dots(a_(j-1) a_j) $

and comments that every cycle is a product of transpositions. A worked
factorization is

$ (1 2)(3 4 5)=(4 2)(3 4)(4 5). $

== Even and odd permutations

*Source transcription — WS18, p. 1, D--F.* Define $A_n$ as the subgroup of
$S_n$ consisting of all even permutations. The source records

$ |A_n|=n!/2 $

and adds: ``这说明 $S_n$ 中一定有一半为 even 的，一半为 odd 的.'' It stresses
the exceptional condition ``$A_n$ is Abel 的 iff $n<=3$!!!'' and states that
one cycle in $S_n$ can have possible order $1$ through $n$, so the possible
orders of a cyclic group are also $1$ through $n$.

For a formal proof of the parity statement, the sheet fixes

$ sigma=mat(1,2,dots,n;k_1,k_2,dots,k_n) $

and notes that $(k_n,n)sigma$ can fix $n$. It then uses induction to reduce a
permutation on $n$ points to one fixing $n$.

== Permutation matrices

*Source transcription — WS18, pp. 1--2, G.* A #kn[Permutation matrix] has one $1$
in each row and each column and zeros elsewhere. The source describes its
columns: for

$ sigma=mat(1,2,3,dots,n;k_1,k_2,k_3,dots,k_n), $

the $(k_i,i)$ entry is $1$ and all remaining entries are $0$. It concludes:
``任意 permutation 都有唯一的 permutation matrix.''

With $P_sigma e_i=e_(sigma(i))$, it calculates

$ (P_sigma P_tau)e_i=P_sigma(P_tau e_i)=P_sigma e_(tau(i))
  =e_(sigma(tau(i))), $

so $P_sigma P_tau=P_(sigma circle tau)$. Therefore all $n times n$
permutation matrices form a subgroup of $text("GL")_n(bR)$, isomorphic to $S_n$.

For a transposition $(i j)$ the sheet writes $P_(i j)^(-1)=P_(i j)$ and
$det(P_(i j))=(-1)^1=-1$; it includes the displayed example matrix
$P_(2 4)$. Finally, if an even permutation is written

$sigma=(a_1 a_2)(a_3 a_4)dots(a_i a_j), $

then

$det(P_sigma)=det(P_(a_1 a_2))det(P_(a_3 a_4))dots det(P_(a_i a_j))
=(-1)^(text("even"))=1.$

The source concludes: ``odd permutation: det 为 $(-1)^text("odd")=-1$；因而
permutation matrix 是 unique 的，所以 even/odd 也 unique 的.''
