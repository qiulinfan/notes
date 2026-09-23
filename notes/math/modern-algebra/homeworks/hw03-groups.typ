= Homework 3: rings, nilpotents, and homomorphisms

_Personal finished homework transcription from 412-Hw-3-finished.pdf._

== 1. Subsets of $F u n(ℝ, ℝ)$

Let $R = F u n(ℝ, ℝ)$ be the ring in exercise D2 of the “Ring Basics” adventure sheet. $0_R$ and $1_R$ are the constant functions zero and one. Show which of the following subsets of $R$ are subrings of $R$. If they are not subrings, show whether they are rings (with a different multiplicative identity than $1_R$, but endowed with the same operations as in $R$) or not.

(a) The set $C$ of constant functions.

(b) The set $S$ of those functions $f$ such that $f(q)=0$ for any $q∈ℚ$.

(c) The set $T$ consisting of $0_R$, together with those functions with no zeros, or only a finite number of zeros. (A zero of a function $f∈R$ is an element $x∈ℝ$ such that $f(x)=0$.)

*(a)* $C$ is a subring of $R$.

*Pf.* Since $0_R$ is $f(x)=0$ and $1_R$ is $f(x)=1$, $0_R,1_R∈C$. Let $f,g$ be two elements in $C$, and suppose $f(x)=a$, $g(x)=b$ for some $a,b∈ℝ$. Then

$ (f+g)(x)=a+b=f(x)+g(x), $

so $C$ is closed under addition. Also,

$ f g(x)=a b=f(x)g(x), $

so $C$ is closed under multiplication. Since $-f(x)=-a$ is also a constant function, $-f∈C$, so $C$ is closed under additive inverse. Since $C⊂R$ and $R$ is a ring, by worksheet 3 it suffices to show these four facts. So $C$ is a subring of $R$.

*(b)* $S$ is not a subring of $R$. Since $1_R$, the constant function $f(x)=1$, is not in $S$ (for $x∈ℚ$, $f(x)≠0$), $S$ violates the definition of subring. And $S$ is not even a ring because it does not have a multiplicative identity.

To show this, assume there is a function $f∈S$ such that for all $g∈S$, $f g=g f=g$. Take $g(x)=2$. Then, for any $x∈ℝ$, $2 f(x)=2$, so $f(x)=1$, which is not in $S$. Thus $S$ does not have a multiplicative identity; therefore it is not a ring.

*(c)* $T$ is not a subring of $R$, and not a ring. Consider $f$ defined by $f(x)=1$ for $x≥0$ and $f(x)=x$ for $x<0$; and $g$ defined by $g(x)=-1$ for $x≥0$ and $g(x)=x$ for $x<0$.

So $f(x)$ and $g(x)$ both only contain one zero point; therefore $f(x),g(x)∈T$. But

Then $(f+g)(x)=0$ for $x≥0$ and $(f+g)(x)=2 x$ for $x<0$.

contains infinitely many “zeros.” Thus $f(x)+g(x)∉T$. Therefore $T$ is not closed under addition, so $T$ is not a ring and definitely not a subring of $R$.

== 2. Nilpotents and units

An element $x$ in a ring $R$ is said to be _nilpotent_ if $x^m=0_R$ for some positive integer $m$. Generalizing the definition on page 40 of our text, a _unit_ $u$ in a ring $R$ is an element with a multiplicative inverse, meaning there exists $s∈R$ such that $s u=u s=1_R$.

(a) Prove that if $x∈R$ is nilpotent (and $R$ is not the zero ring), then $x$ cannot be a unit.

(b) Prove that if $x∈R$ is nilpotent, then $(1_R-x)$ is a unit. (Hint: One approach to showing something is a unit is to write down its inverse. In this case, it could help to recall geometric series from Calculus.)

(c) Describe all the nilpotent elements in $ℤ_n$ in terms of their prime factorization.

*(a)* Let $R$ be a ring which is not the zero ring ($0_R$ and $1_R$ are different elements). Assume $x∈R$ is nilpotent. Then for some $m∈ℤ$, $x^m=0_R$. Let $m$ be the smallest positive integer such that $x^m=0_R$.

Case 1: $m≥2$. Assume for sake of contradiction that $x$ is a unit. Then for some $y∈R$, $x y=y x=1_R$. Multiply both sides by $x^(m-1)$:

$ x^(m-1)x y=x^(m-1)y x $

$ ⇒ (x^m)y=x^(m-1)(y x) $

$ ⇒ 0_R y=x^(m-1)1_R $

$ ⇒ 0_R=x^(m-1). $

This violates the assumption that $m$ is the smallest integer such that $x^m=0_R$.

Case 2: $m=1$. Then $x=0_R$, so $x$ cannot be a unit, since $0_R≠1_R$ and for every $y∈R$, $x y=0_R y=0_R≠1_R$. This contradicts that $x$ is a unit. Since every case causes a contradiction, we have proved that if $x∈R$ is nilpotent, then $x$ is not a unit.

*(b)* Let $x∈R$ be nilpotent, and let $m$ be the smallest positive integer such that $x^m=0_R$.

Case 1: $m=1$. Then $x=0_R$. Consider $1_R$; then

$ 1_R(1_R-x)=1_R-1_R x=(1_R-x)1_R=1_R, $

so $1_R-x$ is a unit.

Case 2: $m≥2$. Consider

$ y=1_R+x+x^2+…+x^(m-1). $

Then

$ (1_R-x)y=1_R+x+x^2+…+x^(m-1)-x-x^2-…-x^(m-1)-x^m=1_R-x^m=1_R-0_R=1_R. $

Similarly, $y(1_R-x)=1_R$. So $1_R-x$ is a unit. Therefore we have proved the statement.

*(c)* By FTA,

$ n=p_1^(a_1)p_2^(a_2)…p_k^(a_k) $

for primes $p_1,…,p_k$ and their multiplicities $a_1,…,a_k$. For any nilpotent $x$ of $ℤ_n$,

$ x^α≡0 mod n $

for some $α∈ℤ$. Thus $x^α=β n=β p_1^(a_1)p_2^(a_2)…p_k^(a_k)$ for some $β∈ℤ$. Therefore $(p_1 p_2…p_k)∣x^α$, so $x$ contains all prime factors $p_1,…,p_k$. Under $α=max(a_1,a_2,…,a_k)$, $x^α$ contains $(p_1…p_k)^(a_i)$ as factor. Therefore, as long as $x$ contains all prime factors of $n$, $x$ is nilpotent.

Note that $x$ also must contain all prime factors: if some prime $p_i∣n$ but $p_i∤x$, then $x$ is not nilpotent. This is obvious since if $p_i∤x$, there is no $α∈ℤ$ such that $x^α$ has the factor $p_i^(a_i)$ of $n$. So the set of nilpotents of $ℤ_n$ is just the set of multiples of all different prime factors of $n$:

the set of classes $[x]_n$ for which $x=t p_1…p_k$, $t∈ℤ$, and $p_1,…,p_k$ are all different prime factors of $n$.

== 3. Zerodivisors

An element $r≠0$ in a commutative ring $R$ is said to be a _zerodivisor_ if there exists a nonzero element $s∈R$ such that $r s=0$.

(a) Given a nonzero element $r∈R$, prove that $r$ is not a zerodivisor if and only if the map $R→R$ given by multiplication by $r$, meaning the map $s↦r s$, is injective.

(b) Describe all the zerodivisors in $ℤ_n$ in terms of the prime factorization of $n$ or their greatest common divisor with $n$.

*(a)* Denote the map by $f(s)=r s$.

(1) Assume $r$ is not a zerodivisor. Assume $f(s_1)=f(s_2)$, so $r s_1=r s_2$. Thus $r(s_1-s_2)=0_R$. Since $r$ is not a zerodivisor, there is no nonzero element $s$ such that $r s=0_R$. So $s_1-s_2$ can only be $0_R$, hence $s_1=s_2$. Therefore $f(s_1)=f(s_2)$ implies $s_1=s_2$; the function is injective.

(2) Assume $f$ is injective. Assume for contradiction that $r$ is a zerodivisor. Then for some $s∈R$ with $s≠0_R$, $s r=0_R$. So $f(s)=0_R$, and since $f(0_R)=r 0_R=0_R$, $f(s)=f(0_R)$ while $s≠0_R$, contradicting that $f$ is injective. Hence $r$ is not a zerodivisor. Since (1) and (2), we have proved the iff statement.

*(b)* Let $[r]_n$ be a zerodivisor in $ℤ_n$. It means there exists $[s]_n∈ℤ_n$ such that $[r]_n[s]_n=[0]_n$, which is not $[0]_n$. Thus $r s=k n$ for some $s,k∈ℤ$ with $n∤s$.

(1) If $gcd(r,n)=1$, then $r,n$ have no common prime factor. To satisfy $r s=k n$, $s$ must contain all prime factors of $n$; this means $n∣s$. So the circumstance is impossible.

(2) If $gcd(r,n)>1$, then $r,n$ have at least some common factor $p$. By FTA, $n=p_1(q_1…q_d)$ for some primes $q_1,…,q_d$. Consider $s=q_1…q_d$; then $r s=k n$ for some $k∈ℤ$, so $[s]_n$ is a solution to $[r]_n[s]_n=[0]_n$. Here $s=q_1…q_d<n$, so $n∤s$, satisfying the requirement that $[s]_n≠[0]_n$.

Therefore the set of all zerodivisors of $ℤ_n$ is

$ { [r]_n | gcd(r,n)>1 }. $

#box[ *Source note (PDF p. 8).* The handwritten construction in (2) asserts $r s=k n$ after taking $s=q_1…q_d$, without recording the prime-exponent condition needed for that equality. It is transcribed above as written. ]

== 4. Ring homomorphisms

For two rings $R$ and $S$ a function $φ:R→S$ is a ring homomorphism if $φ(1_R)=1_S$, and for all $x,y∈R$,

$ φ(x +_R y)=φ(x)+_S φ(y), quad φ(x ×_R y)=φ(x)×_S φ(y). $

(a) Let $R$ be any ring (recalling how our class convention differs from that of the book!). Prove that there exists a unique ring homomorphism $ℤ→R$.

(b) Let $n>1$ be an integer. Prove that there does not exist a ring homomorphism $ℤ_n→ℤ$.

(c) Suppose $R$ and $S$ are two rings, and $f:R→S$ is a ring isomorphism; in particular, $f$ is a bijection and so has an inverse function $g:S→R$. Prove that $g$ is also a ring homomorphism.

(d) Prove: If $f:R→S$ is a ring homomorphism, then $f$ is injective if and only if $ker f={0_R}$.

*(a)* Consider $φ:ℤ→R$, $n↦n · 1_R$. Thus $φ(1_ℤ)=1_R$. Let $x,y$ be arbitrary elements in $ℤ$. Then

$ φ(x+y)=(x+y)1_R=x 1_R+y 1_R=φ(x)+φ(y), $

$ φ(x y)=(x y)1_R=(x 1_R)(y 1_R)=φ(x)φ(y). $

So $φ$ is a homomorphism. Assume $f$ is any homomorphism from $ℤ$ to $R$. Then $f(1)=φ(1)=1_R$, and by theorem 3-10 on textbook, $f(-1)=-f(1)=-φ(1)=-1_R$ and $f(0)=φ(0)=0_R$.

Let $n$ be an arbitrary positive integer that is not $1$. By definition of homomorphism,

$ f(n)=f(1+1+…+1)=f(1)+f(1)+…+f(1)=n f(1)=n · 1_R=φ(n). $

Similarly, for any negative integer $m$ that is not $-1$,

$ f(m)=f((-1)+(-1)+…+(-1))=f(-1)+…+f(-1)=-m f(-1)=m · 1_R=φ(m). $

Therefore for any $n∈ℤ$, $φ(n)=f(n)$, so $φ=f$. Therefore the homomorphism is unique.

*(b)* Assume for sake of contradiction that $φ$ is a homomorphism from $ℤ_n$ to $ℤ$. By definition, $φ([0]_n)=0$ and $φ([1]_n)=1$. So

$ φ([1]_n+[1]_n)=φ([1]_n)+φ([1]_n)=2. $

Repeat process (1) by $n$ times. Then

$ φ([1]_n+…+[1]_n)=n, $

so $φ([n]_n)=n$. Since $[n]_n=[0]_n$, $φ([n]_n)=n$ contradicts $φ([0]_n)=0$, violating the definition of homomorphism as a function. Therefore such homomorphism does not exist.

*(c)* $f:R→S$ is a ring isomorphism. Since $f$ is bijective, let $s_1,s_2$ be arbitrary elements in $S$. There exist unique elements $r_1,r_2∈R$ such that $f(r_1)=s_1$, $f(r_2)=s_2$. Then

$ f^(-1)(s_1+s_2)=f^(-1)(f(r_1)+f(r_2))=f^(-1)(f(r_1+r_2))=r_1+r_2=f^(-1)(s_1)+f^(-1)(s_2), $

so $g$ is closed under addition. Also,

$ g(s_1,s_2)=f^(-1)(s_1,s_2)=f^(-1)(f(r_1)f(r_2))=f^(-1)(f(r_1 r_2))=r_1 r_2=f^(-1)(s_1)f^(-1)(s_2)=g(s_1)g(s_2), $

so $g$ is closed under multiplication. Also, since $f$ is a homomorphism, $f(1_R)=1_S$. Since $f$ is bijective and has inverse, $1_R=f^(-1)(1_S)=g(1_S)$. By (1), (2), (3), $g$ is also a ring homomorphism.

#text(size: 8.5pt)[*Source note (PDF pp. 11-12).* The handwritten multiplication line uses $g(s_1,s_2)$ and then $f^(-1)(s_1,s_2)$; the source’s notation is retained although the surrounding computation uses multiplication.]

#set text(size: 9pt)

*(d)* First prove: if $f$ is injective, then $ker(f)={0_R}$. Since $f(0_R)=0_S$ by $f$ being a homomorphism, $0_R∈ker(f)$. Let $r∈ker(f)$, so $f(r)=0_S=f(0_R)$. Since $f$ is injective, $f(r)=f(0_R)$ implies $r=0_R$. So any element in $ker(f)$ can only be $0_R$, and $ker(f)={0_R}$.

Next prove: if $ker(f)={0_R}$ then $f$ is injective. Let $s_1=f(r_1)$, $s_2=f(r_2)$ and $s_1=s_2$ (that is, $f(r_1)=f(r_2)$). Then $f(r_1)-f(r_2)=0_S$. Since $f$ is a homomorphism, $f(r_1)-f(r_2)=f(r_1-r_2)=0_S$.

So $(r_1-r_2)∈ker(f)$. Since $ker(f)={0_R}$, $r_1-r_2=0_R$, hence $r_1=r_2$. Therefore $f$ is injective if $ker(f)={0_R}$.
