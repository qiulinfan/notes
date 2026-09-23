#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Source: Homework/395-hw-02.pdf pp.1-2 (personal work).
= HW 2

== Problem A

If $||dot||$ is a norm on a vector space $V$, then $d(x,y)=||x-y||$ is a metric. For $x,y,z in V$, positivity gives $||x-y||>=0$, with equality iff $x=y$; homogeneity gives $||y-x||=||-(x-y)||=||x-y||$; and

$||x-y||=||(x-z)+(z-y)|| <= ||x-z||+||z-y||.$

Thus a norm induces a metric.

== Problem B

For a linear $T:V_1->V_2$, the operator norm is $||T||=sup_(v!=0)||T v||_2/||v||_1=sup_(||v||_1=1)||T v||_2$. If $||T||=C<infinity$, then $||T v-T w||_2=||T(v-w)||_2<=C||v-w||_1$, so $delta=epsilon/C$ proves continuity. Conversely, continuity at $0$ gives $delta>0$ such that $||T v||_2<1$ for $||v||_1<delta$. Applying this to $(delta/2)w$ with $||w||_1=1$ gives $||T w||_2<2/delta$. Hence $T$ is bounded.

== Problem C

An unbounded linear map is the derivative $T:C[0,1]->RR$, with the sup norm on the domain. For $f_n(x)=sin(n x)/n$, $||f_n||_infinity<=1/n$, while $||T f_n||=||cos(n x)||_infinity=1$. Therefore the ratios are at least $n$.

== Problem D

Take $T_i=((1,i),(0,1))$. Every $T_i$ is diagonalizable with eigenvalues $1,1$. For $v_i=(1,i)^T$, $||T_i v_i||_2/||v_i||_2=sqrt(1+2i^2)/sqrt(1+i^2)>i$, so $||T_i||->infinity$ although the eigenvalues are bounded.

== Problem E

If $S$ is totally bounded, for every $n$ choose a finite $1/n$-cover with centres $x_i^(n)$. The union of the centres is countable and dense: every $x in S$ either occurs among them or is the limit of selected centres at distance $<1/n$. Hence $S$ is separable.

== Problem F

Let $X$ be countably many copies of $[0,1]$ with their left endpoints glued. Write points as $[(i,x)]$ and use $d([(i,x)],[(j,y)])=|x|+|y|$ if $i!=j$, and $|x-y|$ if $i=j$. It is bounded. At radius $1/2$, a ball can cover at most one of the points from distinct far ends, since two such points have distance $2$. Thus infinitely many balls are needed and $X$ is not totally bounded.

== Problem G

For $Q subset c_0$ with the sup metric, total boundedness is equivalent to boundedness plus: for every $epsilon>0$, some $N$ has $|x_n|<epsilon$ for every $x in Q$ and $n>=N$. A finite cover proves the tail condition by contradiction (choose increasingly far non-small entries and form a separated subsequence). Conversely, partition the first $N$ bounded coordinates into finitely many pieces of length $epsilon/2$ and combine this finite head cover with the $epsilon/2$ tail bound.

== Bonus problem

For a countable dense set $E={p_n}$ in $X$, define $f(x)=(d(x,p_n)-d(x_0,p_n))_(n in NN)$. Triangle inequality makes this bounded and gives $||f(x)-f(y)||_infinity<=d(x,y)$. Along a subsequence $p_(n_j)->x$, the coordinate differences tend to $d(x,y)$, so equality holds. This is an isometric embedding into $ell^infinity(N)$.
