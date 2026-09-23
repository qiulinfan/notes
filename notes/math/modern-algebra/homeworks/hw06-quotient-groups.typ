#let align(..args) = args.pos().join()

= Homework 6: prime and maximal ideals

_Personal finished homework transcription from 412-Hw-6-finished.pdf._

== 1. Prime ideals

Recall: an ideal $P≠R$ in a commutative ring $R$ is _prime_ if $a b∈P$ implies $a∈P$ or $b∈P$.

(a) Prove that $P$ is prime if and only if $R/P$ is a domain.

(b) Use the first isomorphism theorem to show that the ideals $(x)$ and $(2,x)$ in $ℤ[x]$ are prime ideals.

(c) Show that the ideal $(4,x)$ in $ℤ[x]$ is not prime.

(d) Show that the ideal $(2,√10)$ in $ℤ[√10]={a+b√10 | a,b∈ℤ}⊂ℝ$ is prime.

(e) Is the ideal $(2)$ in $ℤ[i]$ a prime ideal?

*Hint:* For the first one, consider the homomorphism $ℤ[x]→ℤ$, “evaluate at zero.”

*(a)* First we prove: if $P$ is prime, then $R/P$ is a domain.

Pf. Assume $P$ is prime. Let $a+P,b+P$ be two arbitrary elements in $R/P$ with

$ (a+P)(b+P)=0_R+P. $

Note that $0_R+P$ is the additive identity in $R/P$. Thus $a b+P=0_R+P$, so $a b=a b-0_R∈P$ by definition. Since $P$ is prime, $a=0_R$ or $b=0_R$. Thus $a+P=0_R+P$ or $b+P=0_R+P$, i.e. $a+P=0_(R/P)$ or $b+P=0_(R/P)$. So $(a+P)(b+P)=0_(R/P)$ implies one factor is zero; $R/P$ is a domain.

Then we prove: if $R/P$ is a domain, then $P$ is prime.

Pf. Assume $R/P$ is a domain. Let $a,b∈R$ be arbitrary with $a b∈P$. So $a b-0_R∈P$, whence

$ a b+P=0_R+P, quad (a+P)(b+P)=0_(R/P). $

Since $R/P$ is a domain, $a+P=0_(R/P)$ or $b+P=0_(R/P)$; so $a-0_R∈P$ or $b-0_R∈P$, that is, $a∈P$ or $b∈P$. Therefore $P$ is prime. By (1), (2), we can conclude that $P$ is prime iff $R/P$ is a domain.

*(b)* Consider $φ:ℤ[x]→ℤ$, sending $f(x)↦f(0)$. Note that $φ$ is a homomorphism, and

$ ker(φ)={a x | a∈ℤ}=(x). $

Since $∀z∈ℤ$, $z∈ℤ[x]$, so $φ(z)=z$, $φ$ is surjective. By the first isomorphism theorem,

$ ℤ[x]/(x) ≅ ℤ. $

Since $ℤ$ is a domain, $ℤ[x]/(x)$ is a domain since isomorphism preserves domain. Then by (a), $(x)$ is a prime ideal.

For $(2,x)$, consider the function $ψ:ℤ[x]→ℤ_2$ defined by $f(x)↦[f(0)]_2$. We can show this is a homomorphism. Let

$ a=a_0+a_1x+…+a_n x^n, quad b=b_0+b_1x+…+b_m x^m∈ℤ[x] $

be arbitrary. Then

$ ψ(a+b)=[a_0+b_0]_2=ψ(a)+ψ(b), $

$ ψ(a b)=[a_0b_0+0+0+…]_2=[a_0b_0]_2=ψ(a)ψ(b), $

and $ψ(0)=0_(ℤ_2)$. Also, $ψ$ is surjective: $ψ(0)=[0]_2$ and $ψ(1)=[1]_2$. By the first isomorphism theorem,

$ ℤ[x]/ker ψ≅ℤ_2. $

Since $ℤ_2$ is a domain (since $2$ is prime), $ℤ[x]/ker ψ$ is a domain, so by (a), $ker ψ$ is a prime ideal. Since

$ ker ψ={k x+2y | k,y∈ℤ}=(2,x), $

$(2,x)$ is a prime ideal.

*(c)* Counterexample: consider $a=b=2$. $2∉(4,x)$, but $2·2=4∈(4,x)$. Thus there are $a,b∉P$ but $a b∈P$, showing $P$ is not prime.

*(d)* Let $x=a+b√10$, $y=c+d√10$ ($a,b,c,d∈ℤ$) be arbitrary elements of $ℤ[√10]$. Assume $x y∈(2,√10)$. So

$ x y=2m+√10n $

for some integers $m,n∈ℤ$. Hence

$ a c+10b d=2m, quad b c+a d=n. $

Assume $a,c$ are both odd for contradiction. Then $a c$ is odd. Since $10b d$ is even, $a c+10b d$ is odd, contradicting $a c+10b d=2m$. So at least one of $a,c$ is even. Without loss of generality, let $a$ be even, so $a=2k$ for some $k∈ℤ$. Therefore $x=2k+b√10∈(2,√10)$. So $x y∈(2,√10)$ implies at least one of $x,y∈(2,√10)$. Thus $(2,√10)$ is a prime ideal in $ℤ[√10]$.

*(e)* It is not a prime ideal. Counterexample: consider $x=y=1+i$. Then

$ x y=1+2i+i^2=2i∈(2), $

but $(x y)∉(2)$ according to the handwritten source. Therefore it is not a prime ideal.

#box[ *Source note (PDF p. 2).* The displayed product gives $x y=2i$, which is itself in $(2)$, while the next handwritten line says “but $(x y)∉(2)$.” The original inconsistency is explicitly retained. ]

== 2. Maximal ideals

We say that a proper ideal $I$ in a ring $R$ is _maximal_ if whenever $I⊆J$ for some ideal $J$, we have $J=R$. For the next problems, assume $R$ is a commutative ring and $I$ is an ideal of $R$.

(a) Prove that if $I$ is a maximal ideal and $a∉I$, then $a+I$ is a unit in $R/I$.

(b) Prove that $I$ is a maximal ideal if and only if $R/I$ is a field.

(c) Use the First Isomorphism Theorem to show that the non-principal ideal $(2,x)$ in $ℤ[x]$ is a maximal ideal.

(d) Show that the ideal $(4,x)$ in $ℤ[x]$ is not maximal.

(e) Show that the ideal $(2,√10)$ in $ℤ[√10]$ is maximal.

(f) Show that $I={a+b i : 3∣a$ and $3∣b}$ is a maximal ideal in $ℤ[i]$.

*Hint:* Consider the homomorphism $f:ℤ[x]→ℤ_2$ given by $f(x)↦[f(0)]_2$. For $r+s i∉I$, then $3∤r$ or $3∤s$. Show that $3$ does not divide $r^2+s^2=(r+s i)(r-s i)$. Then show that an ideal containing $r+s i$ and $I$ also contains $1$.

*(a)* Pf. We can construct a new ideal of $R$ by

$ J=(I,a)={i+a k | i∈I, k∈R}. $

We can prove this is an ideal:

(1) Let $x=i_1+a k_1$, $y=i_2+a k_2$ be arbitrary elements in $J$. Then

$ x+y=(i_1+i_2)+a(k_1+k_2). $

Since $i_1+i_2∈I$, $x+y∈J$.

(2) Let $x=i+a k$ be an arbitrary element in $J$ and $r$ be an arbitrary element in $R$. Then

$ r x=r i+r(a k)=r i+(r k)a. $

Since $r i∈I$, $k,r∈R$, $r x∈J$.

(3) $0∈J$. So $J$ is an ideal of $R$. Note that $a∈J$. Since $I$ is a maximal ideal, $J=R$.

Thus for every $r∈R$, $r=i+a k$ for some $i∈I$ and $k∈R$. Consider $1∈R$. $1=i+a k$ for some $i∈I$. Thus $a k=1-i$. So

$ a k+I=1_R-i+I. $

Since $i∈I$, $-i+I=0_R+I$. Thus

$ (a+I)(k+I)=1_R+I. $

Therefore $a+I$ is a unit in $R/I$.

*(b)* First we prove: if $I$ is a maximal ideal, then $R/I$ is a field. This proof is almost finished by (a). Since

$ R/I={a+I | a∈R}, $

$ a+I=0_(R/I) i f f a∈I. $

For all $a∉I$, $a+I$ is a unit by (a). Thus every nonzero element in $R/I$ is a unit, so $R/I$ is a field.

Then we prove: if $R/I$ is a field, then $I$ is a maximal ideal. Assume $R/I$ is a field. Let $J$ be an ideal of $R$ such that $I⊆J⊆R$. Since $J/I≠∅$, let $a∈J/I$ be arbitrary. Since $R/I$ is a field, there exists $b+I∈R/I$ such that

$ (a+I)(b+I)=1_R+I. $

So $a b-1_R∈I⊆J$. Since $J$ is an ideal, $a b∈J$, so $1_R∈J$. Therefore, for every $r∈R$, $1_R · r=r∈J$ by the definition of ideal, hence $R⊆J$. Since $J⊆R$, $R=J$. Thus whenever $J⊇I$ is an ideal, $J=R$, and $I$ is maximal. By (1), (2), $I$ is maximal iff $R/I$ is a field.

*(c)* Consider $ψ:ℤ[x]→ℤ_2$ defined by $f(x)↦[f(0)]_2$. The calculation in 1(b) shows this is a homomorphism and it is surjective: $ψ(0)=[0]_2$, $ψ(1)=[1]_2$. By the First Isomorphism Theorem,

$ ℤ[x]/ker ψ≅ℤ_2. $

Since $ℤ_2$ is a field ($[1]_{ℤ_2}$ is its only nonzero element), $ℤ[x]/ker ψ$ is a field. So $ker ψ=(2,x)$ is a maximal ideal.

*(d)* $(2,x)≠ℤ[x]$ is an ideal of $ℤ[x]$. Note that

$ (2,x)={2a+x b | a,b∈ℤ[x]}, $

$ (4,x)={4a+x b | a,b∈ℤ[x]}={2(2a)+x b | a,b∈ℤ[x]}={2c+x b | b∈ℤ,c=2a,a∈ℤ[x]}. $

So $(4,x)⊊(2,x)$. Therefore $(4,x)$ is not a maximal ideal in $ℤ[x]$.

*(e)* Consider the quotient ring $ℤ[√10]/(2,√10)$. Let $a+b√10+I$ be an arbitrary element in it. Since $b√10∈I$,

$ a+b√10+I=a+I. $

Since $∀k∈ℤ$, $2k∈I$, denote the remainder when $a$ is divided by $2$ as $r$, so $r=1$ or $2$ according to the source. Then $a+I=r+I$. Thus

$ ℤ[√10]/(2,√10)={1+I,0+I}, $

which has only two elements. This is a field since it is a commutative ring and the only nonzero element has a multiplicative inverse which is itself: $(1+I)$. Then $∀a∈ℤ[i]$, $a∈J$, so $ℤ[i]⊆J$. Therefore the only ideal $J$ such that $I⊆J$ is $J=ℤ[i]$. So $I$ is a maximal ideal.

#box[ *Source note (PDF p. 3).* The quotient calculation concerns $ℤ[√10]$, but its conclusion briefly says $∀a∈ℤ[i]$ and $ℤ[i]⊆J$. This source-level ring mismatch is retained. ]

*(f)* Let $J$ be an ideal such that $I⊆J⊆ℤ[i]$. So there exist some $r+s i∈ℤ[i]$ such that either $3∤r$ or $3∤s$, or both. Since $J$ is an ideal,

$ (r+s i)(r-s i)=r^2+s^2∈J. $

Since either $3∤r$ or $3∤s$, $r≡a mod 3$, $s≡b mod 3$, where $a,b=0$ or $1$ or $2$ and at least one of $a,b$ is not $0$. Thus

$ r^2+s^2≡a^2+b^2 mod 3≡1 mod 3 $ or $2 mod 3. $

So $3∤r^2+s^2$; $gcd(r^2+s^2,3)=1$. By Bézout, $x r^2+s y+3y=1$ for some $x,y∈ℤ$ according to the handwritten line. Since $J$ is an ideal, $x r^2+s^2∈J$, and since $I⊆J$, $3y∈J$, so $x r(r^2+s^2)+3y∈J$. Thus $1∈J$. Hence $J=ℤ[i]$, so $I$ is a maximal ideal.

#box[ *Source note (PDF pp. 3-4).* The Bézout combination is handwritten as $x r^2+s y+3y=1$ and later as $x r(r^2+s^2)+3y$; these factors differ visibly. They are transcribed rather than silently corrected. ]

== 3. Polynomial rings in many variables

Let $R_n=ℚ[x_1,x_2,…,x_n]$ be a polynomial ring in variables $x_1,x_2,…,x_n$; that is, it contains all polynomials in finite terms that involve these variables.

(a) Let $f_1,f_2,…,f_k$ be polynomials in $R_n$. Prove that

$ ⟨f_1,f_2,…,f_k⟩={g_1f_1+g_2f_2+…+g_k f_k | g_1,g_2,…,g_k∈R_n} $

is an ideal of $R_n$.

(b) Consider the ring homomorphism

$ φ:R_4→ℚ[t_1,t_2], quad φ(x_1)=t_1^3, quad φ(x_2)=t_1^2t_2, quad φ(x_3)=t_1t_2^2, quad φ(x_4)=t_2^3. $

(c) Explain why the above description fully determines $φ(f)$ for each polynomial $f∈R_4$.

(d) It is given to you that $ker(φ)=⟨f_1,f_2,f_3⟩$ for some polynomials $f_1,f_2,f_3∈R_4$. Find $f_1,f_2,f_3$. Hint: part (e).

(e) Let $h_1,h_2,h_3$ be the $2×2$ minors of the matrix $M=mat(x_1,x_2,x_3;x_2,x_3,x_4)$. Consider the ideal $I=⟨h_1,h_2,h_3⟩$. Show that $I$ does not change if one applies elementary row operations to the matrix $M$.

(f) Take the ideal $J=⟨x_1x_4-x_2x_3⟩$ in $R_4$. Express $J$ as kernel of some ring homomorphism. You know such a homomorphism exists by WSH 10. You do not need to prove that the proposed homomorphism has $J$ as its kernel.

(g) Prove that the ideal $J$ is not a maximal ideal.

*(a)* Select arbitrary

$ x=g_1f_1+g_2f_2+…+g_k f_k, quad y=h_1f_1+h_2f_2+…+h_k f_k∈⟨f_1,f_2,…,f_k⟩, $

where $g_1,…,g_k,h_1,…,h_k∈R_n$. Then

$ x+y=(g_1+h_1)f_1+…+(g_k+h_k)f_k. $

Since $g_i+h_i∈R_n$, $x+y∈⟨f_1,…,f_k⟩$.

Select arbitrary $x=g_1f_1+…+g_k f_k∈⟨f_1,…,f_k⟩$ and $h∈R_n$. Then

$ x h=(h g_1)f_1+(h g_2)f_2+…+(h g_k)f_k∈⟨f_1,…,f_k⟩. $

Also $0=0f_1+0f_2+…+0f_k∈⟨f_1,…,f_k⟩$. By (1), (2), (3), $⟨f_1,…,f_k⟩$ is an ideal in $R_n$.

*(c)* For all $c∈R_4$, $φ(c)=c φ(1_{R_4})=c φ(1_{R_4})=c$; the source labels this “constant.” For an arbitrary element $f∈R_4$,

$
align(
  f &= a_0+a_1x_1+a_2x_1^2+…+a_i x_1^i \
    &+ b_0+b_1x_2+b_2x_2^2+…+b_j x_2^j \
    &+ c_0+c_1x_3+…+c_m x_3^m \
    &+ d_0+d_1x_4+…+d_n x_4^n.
)
$

Thus

$
align(
  φ(f) &= (a_0+b_0+c_0+d_0)+a_1φ(x_1)+…+a_i φ(x_1^i) \
       &+ b_1φ(x_2)+…+b_j φ(x_2^j) \
       &+ …+d_n φ(x_4^n).
)
$

Since a homomorphism preserves addition and multiplication, each term is either constant or some constant multiplied by some multiple of a power of $φ(x_1),…,φ(x_4)$. Hence $φ(f)$ is fully determined for each $f∈R_4$.

*(d)* Consider

$ f_1=x_1x_3-x_2^2, quad f_2=x_2x_4-x_3^2, quad f_3=x_1x_4-x_2x_3. $

Then $φ(f_1)=φ(f_2)=φ(f_3)=0$. For arbitrary

$ a=g_1f_1+g_2f_2+g_3f_3∈⟨f_1,f_2,f_3⟩, $

$ φ(a)=φ(g_1)·0+φ(g_2)·0+φ(g_3)·0=0. $

So the source identifies $ker φ=⟨x_1x_3-x_2^2, x_2x_4-x_3^2, x_1x_4-x_2x_3⟩$.

*(e)*

$ h_1=det(mat(x_1,x_2;x_2,x_3))=x_1x_3-x_2^2, $

$ h_2=det(mat(x_2,x_3;x_3,x_4))=x_2x_4-x_3^2, $

$ h_3=det(mat(x_1,x_3;x_2,x_4))=x_1x_4-x_2x_3. $

Thus

$ I=⟨h_1,h_2,h_3⟩={g_1(x_1x_3-x_2^2)+g_2(x_2x_4-x_3^2)+g_3(x_1x_4-x_2x_3) | g_1,g_2,g_3∈R_4}. $

(1) Swapping the two rows does not change $I$. By swapping the rows,

$ h_1'=x_2^2-x_1x_3, quad h_2'=x_3^2-x_2x_4, quad h_3'=x_2x_3-x_1x_4. $

So

$ I'={g_1(x_1x_3-x_2^2)-g_2(x_2x_4-x_3^2)-g_3(x_1x_4-x_2x_3) | g_1,g_2,g_3∈R_4}. $

Since $g_1,-g_2,-g_3∈I$ according to the handwritten line, $I'=I$.

(2) Multiplying a row by a nonzero constant does not change $I$. WLOG assume we multiply row one by $a∈ℚ$, $a≠0$. Then

$ h_1'=a(x_1x_3-x_2^2), quad h_2'=a(x_2x_4-x_3^2), quad h_3'=a(x_1x_4-x_2x_3). $

So $I'=I$ since $a≠0⇒(1/a∈ℚ i f f a∈ℚ)$, hence $1/a∈R_4$ iff $a∈R_4$, and multiplying generators by $a$ and $1/a$ gives both containments.

(3) Adding some nonzero multiple of a row to another does not change $I$. WLOG add a multiple of the second row to the first:

$ mat(x_1+b x_2,x_2+b x_3,x_3+b x_4;x_2,x_3,x_4), quad b≠0∈R. $

Then $h_1'=x_1x_3-x_2^2=h_1$, $h_2'=x_2x_4-x_3^2=h_2$, and $h_3'=x_2x_3-x_1x_4=-h_3$. Therefore $I'=I$. By (1), (2), (3), $I$ does not change if one applies elementary row operations to $M$.

#box[ *Source note (PDF p. 4).* In the row-swap argument, the source says “$g_1,-g_2,-g_3∈I$,” although those are coefficient polynomials. It is retained verbatim in substance. ]

*(f)* Consider $φ:R_4→ℚ[x_2,x_3]$ defined by

$ φ(x_1)=x_2, quad φ(x_2)=x_2, quad φ(x_3)=x_3, quad φ(x_4)=x_3. $

For the same reason as in (c), $φ$ is determined by (1). Then

$ J=⟨x_1x_4-x_2x_3⟩={g(x_1x_4-x_2x_3) | g∈R_4} $

is $ker φ$ because $x_1x_4-x_2x_3=0$. This homomorphism is well-defined, “easy to see” because (1) $φ(1)=1$, (2) $φ$ preserves addition in $R_4$, and (3) $φ$ preserves multiplication in $R_4$, as seen from the polynomial addition and multiplication operations.

*(g)* Consider $K=⟨x_4,x_2⟩$ as an ideal of $R_4$. So $x_1x_4-x_2x_3∈K$. Select arbitrary $g∈R_4$; by property of ideal, $g(x_1x_4-x_2x_3)∈K$. Thus every element of $J$ is in $K$, so $J⊆K$.

But $x_4+x_2∈K$ while $x_4+x_2∉J$. Also $x_1+x_3∈R_4$ but $x_1+x_3∉K$, so $K≠R_4$. Thus $J≠K⊊R_4$, and by definition $J$ is not a maximal ideal.
