#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Source: Homework/395-hw-09.pdf pp.1-4 (personal work).
= HW 9

== Problem A

Let $O_n=\{x: exists delta>0, forall x_1,x_2 in B_delta(x), d(f(x_1),f(x_2))<1/n\}$. The continuity set $C_f$ is the intersection of all $O_n$. If $f$ is continuous at $x_0$, choose a ball mapping into $B_(1/(2n))(f(x_0))$, and the triangle inequality gives $x_0 in O_n$. Conversely, choose $n$ with $1/n<epsilon$ and a ball supplied by $O_n$; then $f$ is continuous at $x_0$. Each $O_n$ is open: a witnessing ball at $x_0$ contains a smaller ball about every one of its points.

== Problem B

A bounded non-decreasing $f:[a,b]->RR$ is Riemann integrable. For a rational $q$ between $m$ and $M$, let $D_q=\{x:lim_(t->x-)f(t)<=q<=lim_(t->x+)f(t)\}$. Every discontinuity belongs to some $D_q$ by density of $QQ$. Each $D_q$ has at most one point, since $x_1<x_2$ in it would force values left/right incompatible with monotonicity. So the discontinuity set is countable and has measure zero.

== Problem C

For integrable $f,g:[0,1]->RR$, $F(x,y)=f(x)g(y)$ is bounded. It is continuous at $(x_0,y_0)$ whenever both factors are continuous at the corresponding coordinates; hence $D_F subset (D_f times [0,1]) union ([0,1] times D_g)$. The product covers of measure-zero sets show $D_F$ has measure zero, so $F$ is integrable.

== Problem D

Define $f(x)=1/q$ if $x=p/q in [0,1]$ in lowest terms and $0$ on irrationals. Given $epsilon>0$, choose $N$ with $1/N<epsilon/2$, let $A_N$ be rationals with denominator at most $N$, and make a partition containing $A_N$ with mesh $<epsilon/N^2$. On subintervals missing $A_N$, the supremum is at most $1/N$; the other intervals have total length $<epsilon/N^2$. Thus $U(f,P)-L(f,P)<epsilon$. It is continuous at every irrational because its values along rationals with unbounded denominators tend to $0$; discontinuities are contained in the countable rationals.

#pagebreak()

== Problem E

If bounded $f:Q->RR$ vanishes off a closed measure-zero $B$, cover $B$ by finitely many boxes of total volume $<epsilon/(2M)$ and choose a partition having these boxes as subboxes. On the remaining subboxes $f=0$, so the difference of upper and lower sums is $<epsilon$. Hence $f$ is integrable.

== Problem F

For a countable closed-box cover $Q subset union_i Q_i$, first enlarge to open boxes with volume increase $<epsilon/2^i$. Compactness gives a finite subcover. Successively subtract earlier boxes to make a disjoint measurable cover; additivity and monotonicity give $v(Q)<=sum_i v(Q_i)+epsilon$, and then let $epsilon->0$.

== Problem G

For $f:RR^2->RR$, $f(x_0,y_0)=0$, $f_y(x_0,y_0)!=0$, define $F(x,y)=(x,f(x,y))$. Since $op("det") D F=f_y!=0$, IFT gives a local inverse $G=(G_1,G_2)$ with $G_1$ the identity. Then $g(x)=G_2(x,0)$ is $C^1$ and $f(x,g(x))=0$.

== Bonus

For an open box $B=product_i(a_i,b_i)$, choose smooth one-variable functions $phi_i>0$ on $(a_i,b_i)$ and zero outside; $product_i phi_i(x_i)$ is smooth, positive on $B$, and zero outside. For an open $U$, use a countable ball cover and a locally finite smooth partition of unity $phi_n$ subordinate to it; $sum_n phi_n$ is smooth, positive exactly on $U$. For Cantor $C$, apply this to the complement of $C^2$ in $RR^2$. Taking $h=0$ on $C$ and $h>0$ off $C$, the graphs of $y^2$ and $h(x)$ meet exactly at $C times \{0\}$.
