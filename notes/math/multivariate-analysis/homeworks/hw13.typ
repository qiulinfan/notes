#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Source: Homework/395-hw-13.pdf pp.1-4 (personal work).
= HW 13

== Problem A

The coordinate swap matrix factors as

$((0,1),(1,0))=(( -1,0),(0,1))((1,-1),(0,1))((1,0),(1,1))((1,-1),(0,1)),$

each factor a primitive diffeomorphism on $RR^2$.

== Problem B

Let $psi(x)=exp(-1/(1-(x/3.5)^2))$ for $|x|<3.5$ and $0$ otherwise. Put $psi_n(x)=psi(x-n)$ for odd $n$ and $psi(x+n)$ for even $n$. The supports are the listed intervals $[n-3.4,n+3.4]$ or $[-n-3.4,-n+3.4]$; at any $x$ at most four are supported. Thus $lambda=sum_n psi_n$ is smooth and positive. Setting $phi_n=psi_n/lambda$ gives $sum_n phi_n=1$ and a smooth partition of unity dominated by the open intervals of length $7$.

== Problem C

For $f(x)=e^(-1/x)$ when $x>0$ and $0$ otherwise, $f^(n)(x)=P_n(1/x)e^(-1/x)$ on $x>0$, with $P_n$ polynomial. Inductively $f^(n)(0)=0$: after $t=1/x$, a bound $|Q_n(t)|<=C_n t^(2n)$ makes the difference quotient tend to $0$. Thus $f in C^infinity(RR)$.

== Problem D

If $f:RR^n->RR^m$ is smooth and $n<m$, its image has measure zero by the cited class result. If it contained nonempty open $U$, it would contain a ball of positive Jordan and Lebesgue measure, contradicting monotonicity.

== Problem E

A local diffeomorphism $g$ with $g(0)=0$, $D g(0)=I$ is locally factored by choosing a coordinate $i$, setting $h(x)=(g_1(x),...,g_(i-1)(x),x_i,g_(i+1)(x),...,g_n(x))$, and correcting the $i$th coordinate in the target. IFT gives a local factorization into primitive diffeomorphisms. Induction freezes one coordinate at a time, giving a finite factorization into super-primitive diffeomorphisms; translations and elementary linear maps are also decomposed this way.

== Problem F

No injective smooth $f:RR^2->RR$ exists. If all partials vanished everywhere, $f$ would be constant. Otherwise, say $f_x(a,b)!=0$; IFT writes the level set $f(x,y)=f(a,b)$ locally as $y=g(x)$, contradicting injectivity.

== Problem G

If $f:S->RR$ is smooth at each $x in S$, choose local smooth extensions $f_x:U_x->RR$. A locally finite smooth partition of unity $phi_n$ subordinate to $\{U_x\}$ gives $h_n=phi_n f_(x_n)$ on $U_(x_n)$ and $0$ elsewhere. The locally finite sum $g=sum_n h_n$ is smooth and, at $x_0 in S$, equals $f(x_0)sum_n phi_n(x_0)=f(x_0)$.

== Problem H

If matrix $A$ has rank $k$, select $k$ independent columns and then $k$ independent rows among them to obtain a $k times k$ minor with nonzero determinant. Any larger minor has rank at most $k$, so determinant zero. Hence rank is the maximum order of a nonzero minor.
