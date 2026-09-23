= Homework 4: characteristics, linear maps, and quotient examples

_Personal finished homework transcription from 412-Hw-4-finished.pdf._

== 1. Characteristics of rings

(a) If $f:R→S$ is a homomorphism of rings, show for any $r∈R$ and $n∈ℤ$, $f(n r)=n f(r)$.

(b) Prove that isomorphic rings have the same characteristic.

(c) If $f:R→S$ is a homomorphism of rings, must $R$ and $S$ have the same characteristic?

*(a)*

Pf. Case 1: $n∈ℤ^+$. Then

$ f(n r)=f(r+r+…+r) = f(r)+f(r)+…+f(r)=n f(r), $

where each repeated sum has $n$ terms, since addition is closed under ring homomorphism.

Case 2: $n=0$. Then

$ f(n r)=f(0·r)=f(0_R)=0_S=0f(r)=n f(r), $

since a homomorphism preserves the additive identity.

Case 3: $n∈ℤ^-$. Then

$ f(n r)=f((-r)+(-r)+…+(-r))=f(-r)+…+f(-r)=-n f(-r)=n f(r). $

Since the three cases cover all circumstances, we have proved the statement.

*(b)* Let $R,S$ be two arbitrary isomorphic rings and $φ$ be an isomorphism from $R$ to $S$. Let $n$ be the characteristic of $R$. So for every $a∈R$, $n a=0_R$. Since by (a),

$ φ(n a)=n φ(a), $

and $φ(0_R)=0_S$, we have $n φ(a)=0_S$. Thus for any element $a$ in $R$, $n φ(a)=0_S$. Since $φ$ is an isomorphism, for any element $s∈S$ there is some $r$ such that $φ(r)=s$, and $n φ(r)=0_S$. So for every $s∈S$, $n s=0_S$. Therefore $n$ is also the characteristic of $S$.

*(c)* $R$ and $S$ do not necessarily have the same characteristic. When we deduced that for all $a∈R$, $n φ(a)=0_S$, we needed the surjectivity of $φ$ to ensure every element $s∈S$ is covered. Otherwise we can have $s∈S$ such that it is not covered, so that $n s≠0_S$ and $n$ is not the positive characteristic of $S$.

For a counterexample, take $R=ℤ_5$, $S={0}$. The characteristic of $R$ is $5$ and the characteristic of $S$ is $0$, but $φ:R→S$, sending $z↦0$, is also a ring homomorphism.

== 2. Linear transformations

Let $V$ be a vector space. Recall that a function $T:V→V$ is a _linear transformation_ if for all $v,w∈V$ and all $λ∈ℝ$, $T(v+w)=T(v)+T(w)$ and $T(λ v)=λ T(v)$.

(a) Show that the set of linear transformations from $V$ to $V$, with usual addition and composition of functions as multiplication, forms a ring.

(b) Consider the vector space $ℝ[x]$ and let $L(ℝ[x])$ be the ring of linear transformations of $ℝ[x]$ as defined in the previous part. Consider $d/(d x)∈L(ℝ[x])$. Show that there is an element $F∈L(ℝ[x])$ such that $(d/(d x))F=1_{L(ℝ[x])}$, but there is no element $G∈L(ℝ[x])$ such that $G(d/(d x))=1_{L(ℝ[x])}$.

*(a)* Denote the set of linear transformations from $V$ to $V$ as $L(V)$. Let $T_1,T_2,T_3$ be arbitrary transformations in $L(V)$.

(1) For every $v∈V$, $(T_1+T_2)(v)=T_1(v)+T_2(v)$ is also a linear transformation whose standard matrix is the sum of the standard matrices of $T_1,T_2$. So $(T_1,T_2)∈L(V)$, and $L(V)$ is closed under addition.

(2) For every $v∈V$,

$ (T_1+T_2)(v)=T_1(v)+T_2(v)=T_2(v)+T_1(v)=(T_2+T_1)(v). $

So addition in $L(V)$ is commutative.

(3) For every $v∈V$,

$ ((T_1+T_2)+T_3)(v)=T_1(v)+(T_2(v)+T_3(v))=(T_1+(T_2+T_3))(v), $

so addition in $L(V)$ is associative.

(4) Consider $T_0(v)=0_V$ for all $v∈V$. Then $(T_1+T_0)(v)=(T_0+T_1)(v)=T_1(v)$, so $L(V)$ has an additive identity.

(5) For any $T∈L(V)$, consider $T'(v)=-T(v)$, which is also a linear transformation. Then $T(v)+T'(v)=0$ for all $v∈V$, so every element in $L(V)$ has an additive inverse.

(6) For every $v∈V$, $(T_1∘T_2)(v)=T_1(T_2(v))$ is also a linear transformation whose standard matrix is the product of the standard matrices of $T_1$ and $T_2$. So $(T_1∘T_2)(v)∈L(V)$, and $L(V)$ is closed under multiplication.

(7) For every $v∈V$,

$ (T_1∘T_2)∘T_3(v)=(T_1∘T_2)(T_3(v))=T_1(T_2(T_3(v)))=T_1∘(T_2∘T_3(v)), $

by associativity of linear transformations. So $L(V)$ is associative under multiplication.

(8) Consider $T_e(v)=v$. For every $v∈V$,

$ T_1∘T_e(v)=T_1(T_e(v))=T_1(v), $

$ T_e∘T_1(v)=T_e(T_1(v))=T_1(v). $

So $T_e$ is a multiplicative identity for $L(V)$. By (1)–(8), $L(V)$ is a ring under the stated addition and multiplication.

*(b)* (1) Choose $F∈L(ℝ[x])$ such that

$ (d/(d x))F=1_{L(ℝ[x])}. $

Consider $F:ℝ[x]→ℝ[x]$ defined by

$ F(p(x))=integral_0^x p(t) dif t. $

By the fundamental theorem of Calculus,

$ (d/(d x))F(p(x))=p(x). $

We have shown in (a) that $1_{L(V)}=T_e:V→V$, so $(d/(d x))F=1_{L(ℝ[x])}$. This shows the existence of $F$ by example.

(2) Now prove $G$ (left inverse of $d/(d x)$) does not exist. Assume for sake of contradiction that there exists $G∈L(ℝ[x])$ such that

$ G((d/(d x))(p(x)))=p(x) $

for all $p(x)∈ℝ[x]$. Consider $g(x)=c$, so $(d/(d x))g(x)=0$, and $h(x)=d≠c$, so $(d/(d x))h(x)=0$. Then

$ G((d/(d x))g(x))=c ⇒G(0)=c, $

$ G((d/(d x))h(x))=d ⇒G(0)=d. $

This violates the definition of $G$ as a function. So the contradiction proves that such $G$ does not exist.

== 3. Quadratic extensions

Let $d$ be an integer.

(a) Prove that $ℤ[√d]={a+b√d | a,b∈ℤ}$ is an integral domain.

(b) Show that $ℤ_7[√3]={a+b√3 | a,b∈ℤ_7}$ is a field.

(c) Now assume $d$ is also positive and $p$ is a prime. Determine a necessary and sufficient condition for $ℤ_p[√d]$ to be a field.

*(a)* First we prove this is a commutative ring. Let $x,y,z∈ℤ[√d]$ be arbitrary. Write

$ x=a_1+b_1√d, quad y=a_2+b_2√d, quad z=a_3+b_3√d $

for some $a_1,a_2,a_3,b_1,b_2,b_3∈ℤ$. Then

$ x+y=(a_1+a_2)+(b_1+b_2)√d∈ℤ[√d], $

$ (x+y)+z=(a_1+a_2+a_3)+(b_1+b_2+b_3)√d=x+(y+z), $

$ x+y=y+x, quad x+0=0+x, quad -a_1-b_1√d∈ℤ[√d]. $

Thus there is closure under $+$, associative and commutative $+$, an additive identity, and additive inverses. Also,

$ x y=(a_1+b_1√d)(a_2+b_2√d)=(a_1a_2+b_1b_2d)+(a_1b_2+a_2b_1)√d∈ℤ[√d], $

and $y x=x y$. Expanding $(x y)z$ and $x(y z)$ gives

$ a_1a_2a_3+b_1b_2a_3d+a_1b_2b_3d+b_1a_2b_3d +(a_1b_2a_3+b_1a_2a_3+a_1a_2b_3+b_1b_2b_3d)√d, $

so multiplication is associative. Finally, $1 x=x 1=x$, and direct expansion gives $x(y+z)=x y+x z$. By 1–9, $ℤ[√d]$ is a commutative ring.

Now show it is an integral domain. Let $x=a+b√d$ and $y=m+n√d$ be nonzero elements, so at least one of $a,b$ and at least one of $m,n$ is not $0$. Then

$ x y=y x=a m+b n d+(a n+b m)√d. $

Consider the four situations where one of $a,b$ and one of $m,n$ are zero. If $a=0,n=0$, then $b m≠0$; if $a=0,m=0$, then $b n d≠0$; if $b=0,n=0$, then $a m≠0$; and if $b=0,m=0$, then $a n≠0$. So $x y≠0$. Thus $ℤ[√d]$ is an integral domain.

*(b)* Exactly the same as (a), except in modular arithmetic we can prove $ℤ_7[√3]$ is a commutative ring. Now prove it is a field by proving any nonzero element has a multiplicative inverse. Let $x=a+b√3∈ℤ_7[√3]$ be nonzero, so $a,b$ are not both $0$. Let $y=m+n√3$, where $m,n∈ℤ_7$. Assume $x y=[1]_7$. We solve

$ a m+3b n=[1]_7, quad a n+b m=[0]_7. $

Since $ℤ_7$ is a field, $a^{-1}$ always exists when $a≠0$. If $a≠0$, choose $n=-b a^{-1}m$; then $a n+b m=0$, and the first equation becomes

$ a m=[1]_7+3b^2a^{-1}m. $

Since $ℤ_7$ is a field this always has a solution: $a m=[1]_7$ has a solution for $m=[1]_7$, and $[1]_7+3b^2a^{-1}m$ is some multiple of $[1]_7$. Let $m=[1]_7$ denote the solution; then $m=…$ gives the solution to (1).

Case 2: assume $b≠0$. Same as case 1: $m=-b^{-1}a n$ is a solution of (2), and then we can always find a solution to (1), since $3b n=[1]_7+b^2a^{-1}n$ always has a solution which is a multiple of $(3b)·n=[1]_7$, guaranteed by $ℤ_7$ as a field. Therefore the system always has a solution. So any nonzero element in $ℤ_7[√3]$ has a multiplicative inverse; since it is a commutative ring, it is a field.

#box[ *Source note (PDF pp. 10-11).* The handwritten argument for (b) introduces divisions by $a$ in a case that also discusses the $b≠0$ alternative, and uses several abbreviated equalities. The visible calculation is retained rather than silently repaired. ]

*(c)* The condition is that $d^2$ is not congruent to $0$ modulo $p$.

Like in (b), we must solve $(d^2b)n=[1]_p$ when $a+b√d$ is a nonzero element in $ℤ_p[√d]$. If $d^2=0 mod p$, the equation $[0]n=[1]_p$ has no solution. Thus $d^2≠0 mod p$ is necessary. If $d^2≠0 mod p$, we can always solve the equation like in (b), so any element in $ℤ_p[√d]$ always has a multiplicative inverse. Thus $d^2≠p mod p$ is sufficient. Therefore it is sufficient and necessary.

#box[ *Source note (PDF p. 12).* The final sufficient-condition line reads “$d^2≠p (mod p)$,” while the preceding displayed condition reads $d^2≠0 (mod p)$. Both visible forms are retained; the source does not reconcile them. ]

== 4. Zerodivisors in a polynomial ring

Let $R$ be a commutative ring in which $a^2=0$ only if $a=0$. Show that if $q(x)∈R[x]$ is a zerodivisor in $R[x]$, then if

$ q(x)=a_0x^n+a_1x^(n-1)+…+a_n, $

there is an element $b≠0$ in $R$ such that $b a_0=b a_1=…=b a_n=0$.

*Proof.* Assume $q(x)=a_0x^n+a_1x^(n-1)+…+a_n$ is a zerodivisor in $R[x]$. So at least one of $a_0,a_1,…,a_n$ is nonzero and there exists

$ p(x)=b_0x^m+b_1x^(m-1)+…+b_m≠0 $

such that $q(x)p(x)=0$. Thus

$ a_0b_0x^(m+n)+(a_1b_0+a_0b_1)x^(m+n-1)+(a_0b_2+a_1b_1+a_2b_0)x^(m+n-2)+…+a_n b_m=0. $

Therefore $a_0b_0=0$, so $b_0$ is a zerodivisor in $R$. Note that $b_0≠0$, since this is the term with highest degree of $p(x)$ by our assumption. Since $b_0^2≠0$ (for if $b_0∈R$, $a^2=0$ iff $a=0$), recursively $b_0^(2k)≠0$ for $k∈ℤ$. Therefore all even powers of $b_0$ are nonzero.

Let $b_0^(2k+1)$ be an arbitrary odd multiple of $b_0$. Assume it is $0$ for contradiction. Then

$ b_0^(2k+2)=b_0^(2k+1)·b_0=0_R b_0=0_R, $

which contradicts $b_0^(2k)≠0_R$. So $b_0^(2k+1)≠0$. Hence any multiple of $b_0$ is nonzero.

By the coefficient equation, $a_1b_0+a_0b_1=0$, so $b_0(a_1b_0+a_0b_1)=0$ and $b_0^2a_1=0$. Likewise $a_0b_2+a_1b_1+a_2b_0=0$ implies $b_0^3a_2=0$. The pattern is

$ b_0^k a_k=0 $

for $0≤k≤n$. Multiply both sides by $b_0^k$ to get $b_0^(k+1)a_k=0$.

The source proves this by induction on the power of $x$. Base case $k=0$: $b_0a_0=0$. Inductive step: assume $b_0a_0=0,b_0^2a_1=0,…,b_0^k a_(k-1)=0$. Since the term with $x^k$ is $sum_(i+j=k; i≤n; j≤m) a_i b_j=0$, multiplying by $b_0^k$ gives $b_0^(k+1)a_k=0$. Thus for every $0≤i≤n$, $b_0^(n+1)a_i=0$. Combining that $b_0^(n+1)$ is nonzero with this result finishes the proof: $b=b_0^(n+1)$ is the required element.
