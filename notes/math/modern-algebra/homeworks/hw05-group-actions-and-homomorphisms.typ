= Homework 5: matrix ideals, rational subrings, and polynomial quotients

_Personal finished homework transcription from 412-Hw-5-finished.pdf._

== 1. The ring $M_2(ℝ)$

Consider the ring $M_2(ℝ)$.

(a) Take any nonzero $2×2$ matrix $A$. Show that by multiplying $A$ on the left by matrices of the form

$ mat(1,a;0,1), quad mat(1,0;b,1), quad mat(c,0;0,1), quad mat(1,0;0,c), quad mat(0,1;1,0), $

we can do any elementary row operation to $A$.

(b) State a way of interpreting column operations using matrix multiplication.

(c) Prove that the only ideals in $M_2(ℝ)$ are ${0}$ and $M_2(ℝ)$.

*(a)* Let $A$ be an arbitrary matrix in $M_2(ℝ)$. Then

$ A=mat(w,x;y,z) $

for some $w,x,y,z∈ℝ$.

(1)

$ mat(1,a;0,1)A=mat(w+a y,x+a z;y,z). $

It is equivalent to adding some multiple of the second row to the first row.

(2)

$ mat(1,0;b,1)A=mat(w,x;y+b w,z+b x). $

It is equivalent to adding some multiple of the first row to the second row.

(3)

$ mat(c,0;0,1)A=mat(c w,c x;y,z). $

It is equivalent to multiplying the first row by some scalar $c$.

(4)

$ mat(1,0;0,c)A=mat(w,x;c y,c z). $

It is equivalent to multiplying the second row by some scalar $c$.

(5)

$ mat(0,1;1,0)A=mat(y,z;w,x). $

It is equivalent to swapping the order of the two rows.

By (1), (2), (3), (4), (5), we have shown that through multiplying $A$ on the left by matrices of the five forms, we can do all five elementary row operations to $A$ respectively.

*(b)* Column operations are just multiplying $A$ on the right by the same five matrices in (a). For example,

$ A mat(1,a;0,1)=mat(w,x+a w;y,z+a y), $

which adds some multiple of the first column to the second.

*(c)* Pf. We have known that any ring has ${0}$ as an ideal. Now we prove that any ideal of $M_2(ℝ)$, if it is not ${0}$, then must be $M_2(ℝ)$ itself.

Let $I$ be an ideal of $M_2(ℝ)$. Assume $I≠{0}$, so there exists some other element $A≠0∈I$. Let

$ A=mat(a,b;c,d). $

Since $A≠0$, at least one of its entries is not $0$. Without loss of generality, assume $a≠0$. By definition of ideal,

$ mat(a^(-1),0;0,0)mat(a,b;c,d)=mat(1,0;0,0)∈I. $

Then

$ mat(a,0;0,0)mat(1,0;0,0)=mat(1,0;0,0)∈I. $

Also,

$ mat(0,1;1,0)mat(1,0;0,0)∈I, quad mat(1,0;0,0)mat(0,1;1,0)∈I, $

so the four matrix units are in $I$. By the displayed products,

$ mat(1,0;0,0)+mat(0,0;0,1)=mat(1,0;0,1)∈I. $

No matter which entry we assume is nonzero, we can always get this result since the property of ideal preserves elementary operations, so we can always operate to leave only one nonzero entry and then get $mat(1,0;0,0)$ by elementary operations. Since this identity matrix is in $I$, let $K∈M_2(ℝ)$ be arbitrary. Then $K I=K∈I$, so $M_2(ℝ)⊆I$. Since $I⊆M_2(ℝ)$, $I=M_2(ℝ)$ if $I≠{0}$. Therefore the only ideals are ${0}$ and $M_2(ℝ)$.

== 2. Odd denominators

Let $S_o d d⊂ℚ$ be the subset of rational numbers with odd denominators (when expressed in lowest terms).

(a) Show that $S_o d d$ is a subring of $ℚ$.

(b) Let $I⊆S_o d d$ be the subset of rational numbers with even numerator (when expressed in lowest terms). Prove that $I$ is an ideal of $S_o d d$.

(c) Define a ring homomorphism $φ:S_o d d→ℤ_2$. What is the kernel?

*(a)* (1) $1_ℚ=1/1∈S_o d d$, and $0_ℚ=0/1∈S_o d d$.

(2) Let $a,b$ be arbitrary elements of $S_o d d$. Then $a=p/q$, $b=m/n$ for some $p,q,m,n∈ℤ$. By definition of rational numbers, since $a,b∈S_o d d$, $q,n$ are odd. So

$ a+b=(p n+m q)/(q n)∈S_o d d $

since $q n$ is odd; and $a b=p m/(q n)∈S_o d d$ for the same reason.

(3) Let $a∈S_o d d$ be arbitrary. Then $a=p/q$ for $p,q∈ℤ$ where $q$ is odd. So $-a=-p/q∈S_o d d$. Since (1), (2), (3), by theorem 3.2, $S_o d d$ is a subring of $ℚ$.

*(b)* Let $a,b$ be two elements of $I$. Then $a=p/q$, $b=m/n$ for some $p,q,m,n∈ℤ$, where $p,m$ are even and $q,n$ are odd. So

$ a+b=(p n+m q)/(q n). $

Since $p,m$ are even, $p n+m q$ is even; since $q,n$ are odd, $q n$ is odd. So $a+b∈I$.

Let $x∈S_o d d$ be arbitrary, so $x=s/t$ for some integer $s,t$ where $t≠0$ is odd. Then

$ a x=p a/(t q). $

Since $t,q$ are odd, $t q$ is odd; and since $p$ is even, $p s$ is even. Therefore $a x,x a∈I$. Nonemptiness is guaranteed by $2/1∈I$. So by definition, $I$ is an ideal of $S_o d d$.

#box[ *Source note (PDF p. 6).* The handwritten multiplication line reads $a x=p a/(t q)$ after setting $a=p/q$ and $x=s/t$; the intended numerator appears to be $p s$, but the source is retained. ]

*(c)* Define $φ:S_o d d→ℤ_2$ by mapping all elements in $S_o d d$ with even numerator to $[0]_2$, and all elements in $S_o d d$ with odd numerator to $[1]_2$:

$ p/q ↦ [p]_2. $

(1) $φ(0)=[0]_2$.

(2) $φ(1)=φ(1/1)=[1]_2$.

(3) Let $a,b∈S_o d d$ be arbitrary. Let $a=p/q$, $b=m/n$ for $p,q,m,n∈ℤ$, with $q,n$ odd and nonzero. Then

$ φ(a)φ(b)=[p]_2[m]_2=[p m]_2=φ(a b), $

$ φ(a)+φ(b)=[p]_2+[m]_2=[p+m]_2=φ(a+b). $

Therefore by (1), (2), (3), $φ$ is a homomorphism, and

$ ker(φ)$ is the set of elements $a∈S_("odd")$ with $φ(a)=[0]_2$; equivalently, it is the set of fractions $p/q∈S_("odd")$ whose numerator $p$ is even. Thus $ker(φ)=I$.

== 3. Congruence classes of polynomials

Let $F$ be a field and let $f∈F[x]$. Two polynomials $g,h∈F[x]$ are congruent modulo $f$ if $f∣(g-h)$. We write $g≡h mod f$. The set of all polynomials congruent to $g$ modulo $f$ is written $[g]_f$. For this problem, fix a polynomial $f∈F[x]$ of degree $d>0$.

(a) Prove that every congruence class $[g]_f$ contains a unique polynomial in $S={h(x)∈F[x] : h(x)=0$ or $deg h(x)<d}$.

(b) How many distinct congruence classes are there for $ℤ_2[x]$ modulo $x^3+x$?

(c) How many distinct congruence classes are there for $ℤ_3[x]$ modulo $x^2+x$?

*(a)* Let $[g]_f$ be an arbitrary congruence class modulo $f$. Let $k(x)$ be an element in it and fix it. Guaranteed by the division algorithm, there exist some $q(x),r(x)∈F[x]$ such that

$ k(x)=q(x)f(x)+r(x), $

where $deg(r(x))=0$ or $deg(r(x))<deg(f(x))=d$. So $k(x)-r(x)=q(x)f(x)$, hence $f(x)∣(k(x)-r(x))$ and $r(x)∈[g]_f$. So we have proved the existence of such polynomial in $S$.

Now show uniqueness. Fix $r(x)$. Let $h(x)$ be an arbitrary element in $[g]_f$, so $r(x)≡h(x) mod f$. Then

$ h(x)=r(x)+m(x)f(x) $

for some $m(x)∈F[x]$. If $m(x)=0$, then $h(x)=r(x)$; they are the same element. If $m(x)≠0$, then $deg h(x)≥deg f(x)$. Therefore the $r(x)∈S$ is unique.

*(b), (c)* By (a), every congruence class $[g]_f$ contains a unique polynomial in $S={h(x) | deg h(x)=0$ or $deg h(x)<deg f(x)}$, and every element of this set is a unique congruence class modulo $f$. So we only need the number of polynomials that have smaller degree than $f(x)$.

For $x^3+x$ in $ℤ_2[x]$, $2^3=8$ (degrees $0,1,2$). For $x^2+x$ in $ℤ_3[x]$, $3^2=9$ (degrees $0,1$).

== 4. Subrings of $ℚ$

What are the subrings of $ℚ$? We have $ℤ$, $ℚ$, and, according to the previous problem, the subring $S$ of rational numbers with odd denominators.

(a) Prove that $ℤ[1/2]$ - the set of fractions $a/(2^m)$ with $a,m∈ℤ$ and $m≥0$ - is a subring of $ℚ$.

(b) Let $R⊂ℚ$ be a subring. Define

Define $Π(R)$ to be the set of positive primes $p$ such that $1/p∈R$.

(the set of positive primes). Compute $Π(ℤ)$, $Π(ℚ)$, $Π(ℤ[1/2])$, $Π(S_o d d)$ (no proof needed).

(c) (Tricky!) Given a set of the positive prime numbers $Γ⊂P$, define a subring denoted $ℤ[1/Γ]$ such that $Π(ℤ[1/Γ])=Γ$.

(d) (This is also hard!) Prove that two subrings $R_1,R_2⊂ℚ$ are equal iff $Π(R_1)=Π(R_2)$. Conclude that the subrings of $ℚ$ are in bijection with the subsets of the positive prime numbers!

*(a)* (1) $1_ℚ=1/(2^0)∈ℤ[1/2]$ and $0_ℚ=0/(2^0)∈ℤ[1/2]$.

(2) Let $x,y$ be arbitrary elements in $ℤ[1/2]$. Then $x=a_1/(2^(m_1))$, $y=a_2/(2^(m_2))$ for some $a_1,a_2,m_1,m_2∈ℤ$ with $m_1,m_2≥0$. Thus

$ x+y=(a_1 2^(m_2)+a_2 2^(m_1))/(2^(m_1+m_2))∈ℤ[1/2], $

$ x y=(a_1a_2)/(2^(m_1+m_2))∈ℤ[1/2]. $

(3) Let $z∈ℤ[1/2]$. Then $z=a/(2^m)$ for some $m,a∈ℤ$ with $m≥0$. Then $-z=-a/(2^m)∈ℤ[1/2]$. Since (1), (2), (3), $ℤ[1/2]$ is a subring of $ℚ$ by theorem 3.2.

*(b)*

For $ℤ$, $Π(ℤ)=∅$.

For $ℚ$, $Π(ℚ)$ is the set of all positive primes.

For $ℤ[1/2]$, $Π(ℤ[1/2])={2}$, because $1/p=a/(2^m)$ for some $a,m∈ℤ,m≥0$ only for $p=2$,

since all other primes are not multiples of $2$.

For $S_("odd")$, $Π(S_("odd"))$ is the set of all positive primes except $2$,

since every prime is odd except $2$.

*(c)* We want to define $ℤ[1/Γ]$ such that

the positive primes $p$ satisfying $1/p∈ℤ[1/Γ]$ are exactly the elements of $Γ$.

We can define

$ ℤ[1/Γ]={ a/(p_1p_2…p_s) | a,s∈ℤ, p_1,p_2,…,p_s∈Γ}. $

The source then checks (1) $Π(ℤ[1/Γ])=Γ$ and (2) $ℤ[1/Γ]$ is a subring of $ℚ$:

For $p∈Γ$, take $a=1$ and $p=p$ in the denominator, so $p∈Π(ℤ[1/Γ])$. Conversely, for $q∈Π(ℤ[1/Γ])$, $1/q=a/(p_1p_2…p_s)$ for some $a∈ℤ$ and $p_i∈Γ$. By FTA, $a=q_1q_2…q_t$ for primes $q_i$ and $a q=p_1…p_s$. Since $q$ is prime, $q$ is one of the primes among $p_1,…,p_s$. So $q∈Γ$.

Also $1=1/1$ and $0=0/1$ lie in $ℤ[1/Γ]$. If $x=a/(p_1…p_s)$ and $y=b/(q_1…q_t)$, then

$ x+y=(a(q_1…q_t)+b(p_1…p_s))/(p_1…p_s q_1…q_t)∈ℤ[1/Γ], $

$ x y=a b/(p_1…p_s q_1…q_t)∈ℤ[1/Γ], quad -x=-a/(p_1…p_s)∈ℤ[1/Γ]. $

So $ℤ[1/Γ]$ is a subring of $ℚ$.

#set text(size: 10pt)

*(d)* Let $R_1,R_2⊂ℚ$ be subrings. Let

Here $Π(R_1)$ and $Π(R_2)$ are respectively the positive primes whose reciprocals lie in $R_1$ and $R_2$.

#box[ *Source note (PDF pp. 16-17).* The final argument writes $p=n/d$ “for some $m,n∈ℤ$” and applies FTA as $d=p_1…p_s$ without exponent notation; these visible shorthand forms are retained. ]

First, if $R_1=R_2$, then clearly $Π(R_2)=Π(R_1)$. To finish the iff proof, assume $Π(R_2)=Π(R_1)$. Let $p$ be an arbitrary element of $R_1$. Since $R_1⊂ℚ$, $p=n/d$ for some $m,n∈ℤ$ where $d≠0$ and $gcd(n,d)=1$. Since $1∈R_1$, by definition of subring $1+1+…+1∈R_1$, so recursively $ℤ⊂R_1$.

Since $gcd(n,d)=1$, by Bézout there are $x,y∈ℤ$ such that $x n+y d=1$. Thus

$ x n/d+y=1/d. $

Since $n/d∈R_1$ and $x,y∈ℤ⊂R_1$, $1/d∈R_1$. By FTA, $d=p_1p_2…p_s$ for some primes $p_i$, so $1/d=1/(p_1p_2…p_s)∈R_1$. Since the $p_i$ are in $R_1$ by property of $Π$, their reciprocals lie in both rings; therefore $1/d∈R_2$. Since $ℤ⊂R_2$, $n/d∈R_2$. So $R_1⊆R_2$. Similarly, we get $R_2⊆R_1$ by exactly the same steps. So $R_1=R_2$.

Therefore $Π(R_1)=Π(R_2)$ iff $R_1=R_2$, and the subrings of $ℚ$ are in bijection with the subsets of the positive prime numbers.
