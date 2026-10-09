---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/modern-algebra/chapters/06-normal-subgroups-and-isomorphisms.typ"
kgd_source_format: "typst"
kgd_source_sha256: "76b4c93eed02a270939ec86a234907544a19ca5cb83d869cdcb350359bd10127"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= Normal subgroups and isomorphisms
<normal-subgroups-and-isomorphisms>

This chapter is a source-language transcription of
'WorkSheets/412-WS24-Mywork.pdf', pp. 1--3. The page divisions below are part
of the provenance: no theorem statement or proof cue is supplied from the
reference-only PDFs.

== Kernels, quotients, and the first isomorphism theorem

*Source transcription — WS24, p. 1, Thm 8.16.* If $f:G->H$ is a group hom,
then $ker f$ is a subgroup of $G$. The handwritten proof first observes that
for $a,b in ker f$, $f(a)=e_H=f(b)$ and hence
$f(a b)=f(a)f(b)=e_H$, so $a b in ker f$. It then checks subgroup closure in
the form: for $g in G$ and $k in ker f$,

$ f(g^(-1)k g)=f(g)^(-1)f(k)f(g)=f(g)^(-1)e_H f(g)=e_H, $

so $g^(-1)k g in ker f$. (The original Chinese line says ``首先，group hom
的 ker 一定是 subgroup of $G$'' and then ``然后我们证明 $ker f ◁ G$''.)

*Source transcription — WS24, p. 1, Thm 8.17 and 8.18.*

$ker f={e_G}$ iff $f$ is injective.

The sheet marks this as ``已证过千遍.'' If $N ◁ G$,
then $pi:G->G/N$ is a surjective group hom and $ker pi=N$. It explicitly
checks $pi(g_1g_2)=g_1g_2N=(g_1N)(g_2N)$, writes that every coset is $N a$
for some $a in G$ and therefore is hit by $pi$, and notes
$pi(a)=N e=N$ iff $a in N$.

*Source transcription — WS24, p. 1, Lemma 8.19.* For a group hom $f:G->H$
with $ker f=K$,

$ f(a)=f(b) text("if and only if") K a=K b. $

The source's forward implication is $f(a b^(-1))=e_H$, hence
$a b^(-1) in K$ and $a equiv b (mod K)$; for the converse, $K a=K b$ gives
$a b^(-1) in K$, then $f(a b^(-1))=e_H$ and, using
$f(a)=f(b)$ (the page annotates the equivalence with the reverse-multiplying
calculation).

#theorem(title: [#kn[First isomorphism theorem]])[
If $f:G->H$ is a surjective group homomorphism, then

$ G/ker f ~= H. $
]

#proof[
*Source transcription — WS24, p. 1, Thm 8.20.* Consider
$psi:G/ker f->H$, sending $K a mapsto f(a)$. It is well-defined because
$K a=K b => a b^(-1) in K => f(a)=f(b)$. It is injective by the preceding
lemma, and it is surjective because every $x in H$ is $f(g)$ for some
$g in G$ when $f$ is surjective. The source calls this ``第一同构定理'' and
annotates the displayed conclusion with the exceptional hypothesis that
$f$ must be surjective.
]

*Source transcription — WS24, p. 1, Thm 8.21.* If $N ◁ G$,
$K$ is a subgroup of $G$, and $N subset K$, then $K/N$ is a subgroup of
$G/N$. The proof starts with $g N in G/N$ and $k N in K/N$; normality gives
$g^(-1)k g in K$, hence $(N g)^(-1}(N k)(N g)$ (as written on the page) lies in
$K/N$. The source adds the Chinese reminder: ``而如果 $K ◁ G$，则结论
更强: $K/N ◁ G/N$；但如果结论是包含 $G$ 本身，和第七条类似.''

== Second and third isomorphism theorems

*Source transcription — WS24, p. 2, Thm 8.22 (Third Isomorphism Theorem).*
If $N ◁ G$, $K ◁ G$, and $N subset K$, then

$ K/N ◁ G/N quad text(and) quad (G/N)/(K/N) ~= G/K. $

The source begins the normality check with
$(N g)^(-1}(N k)(N g)=N(g^(-1)k g)$ and, because $K$ is normal in $G$,
$g^(-1}k g in K$. For the quotient isomorphism it considers
$pi:G/N->G/K$, $N a mapsto K a$, calling it an easy group hom and surjective.
The ker note says: ``即所有 $a in K$ 中等类的 $N$-cosets'', so
$ker pi=K/N$, and the first isomorphism theorem yields the result.

*Source transcription — WS24, p. 2, Second Isomorphism Theorem (group),
``Diamond Thm''.* Let $G$ be a group, $S$ a subgroup of $G$, and
$N ◁ G$. Then:

1. $S N$ is a subgroup of $G$;
2. $N ◁ S N$;
3. $S ∩ N ◁ S$; and
4. $(S N)/N ~= S/(S ∩ N)$.

The source draws the diamond $G$ over $S N$, with $S$ and $N$ below and
$S ∩ N$ at the base. It defines $psi:S->S N/N$ by
$s mapsto s N$; its kernel is
$ {s in S text("and") s in N}=S ∩ N$, so the first isomorphism
theorem proves $S/(S ∩ N) ~= S N/N$.

*Source transcription — WS24, p. 2, Fourth Isomorphism Theorem (group),
``Lattice Thm''.* With $N ◁ G$, let $cal(G)$ be all subgroups of
$G$ containing $N$ and $cal(N)$ all subgroups of $G/N$. The source states
$cal(G)~=cal(N)$ by $A mapsto A/N$ and gives the correspondence cues
``所有 $G/N$ 的 subgroup $T={H/N}$ for some $H<G$'' and, for a subgroup
$T<G/N$, choose $H={a in G:N a in T}$, then prove $H<G$ and $H/N=T$.

*Source transcription — WS24, p. 2, ring analogues.* ``类比地 ring 也有四个
isomorphic thms.'' The page records the First Isomorphism Theorem for rings:
if $phi:R->S$ is a ring hom, then $ker phi$ is a subring and an ideal,
$im phi$ is a subring, and $im phi ~= R/ker phi$ (the page annotates the
surjective case ``虽然不说，但如果 $phi$ surj，那么 $R/ker phi ~=S$''). The
Second Isomorphism Theorem for rings: if $S$ is a subring of $R$ and $I$ an
ideal of $R$, then $S+I={s+i:s in S,i in I}$ is a subring, $S ∩ I$
is an ideal of $R$, and $(S+I)/I ~= S/(S ∩ I)$.

== Fourth isomorphism theorem, simple groups, and finite abelian groups

*Source transcription — WS24, p. 3, Third and Fourth Isomorphism Theorems
(ring).* If $R$ is a ring and $I$ an ideal of $R$, the source lists:

1. for a subring $A$ of $R$, $A+I$ is a subring of $R$;
2. every subring of $R/I$ is $A/I$ for a subring $A$ of $R$;
3. if $J$ is an ideal of $R$ containing $I$, then $J/I$ is an ideal of
   $R/I$;
4. every ideal of $R/I$ is $J/I$ for an ideal $J$ of $R$; and
5. $R/I$ is isomorphic to $R/J$ when $J/I$ is the intervening ideal.

The page's Fourth Isomorphism Theorem for rings is phrased: if $I$ is an
ideal of $R$, define $cal(G)$ as all subrings of $R$ containing $I$ and
$cal(N)$ as all subrings of $R/I$; then $cal(G)~=cal(N)$ under
$A mapsto A/I$.

*Source transcription — WS24, p. 3.* Corollary 8.23 says: if $N$ is normal
in $G$, $K$ is a subgroup of $G$, and $K$ contains $N$, then
$K ◁ G$ iff $K/N ◁ G/N$. The proof uses the Third
Isomorphism Theorem in one direction and, in the other, for $g in G$,
$k in K$, writes $(N g)^(-1}(N k)(N g)=N k'$ for some $k' in K$, hence
$g^(-1}k g=N t$ for $t in K$; since $N subset K$, this lies in $K$.

The definition is retained verbatim in meaning: ``A group $G$ is simple iff
它有且只有 ${e_G}$ 和 $G$ 自己这两个 normal subgroup.'' The sheet states
``$G$ 为 simple abelian group iff $G~=bZ_p$ for some prime $p$.'' It finishes
with the Fundamental Structure Theorem for finite Abelian groups:

$ G ~= bZ_(p_1^(a_1)) times bZ_(p_2^(a_2)) times dots times bZ_(p_n^(a_n)), $

where $p_1,dots,p_n$ are prime numbers (``可以重复''), and the isomorphism is
unique up to reordering.
