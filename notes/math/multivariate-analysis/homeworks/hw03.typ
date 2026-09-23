#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Source: Homework/395-hw-03.pdf pp.1-3 (personal work).
= HW 3

== Problem A

For a Lipschitz map $f:X->Y$ with constant $C$, $d_2(f(x),f(y))<=C d_1(x,y)$. Taking $delta=epsilon/C$ proves uniform continuity. If $f_n$ have one common Lipschitz constant $C$ and converge uniformly to $f$, then $d(f(x),f(y)) <= d(f(x),f_n(x))+C d(x,y)+d(f_n(y),f(y))$. Letting the uniform error tend to zero proves that $f$ is also Lipschitz with constant $C$. Without a common constant this is false: on $(0,infinity)$, $f_n(x)=sqrt(x+1/n)$ converge uniformly to $sqrt(x)$, which is not Lipschitz near $0$.

== Problem B

If $X$ is connected and $f:X->Y$ is continuous, then $f(X)$ is connected: a separation $f(X)=B_1 union B_2$ pulls back to a separation of $X$. Consequently a continuous $f:X->RR$ assumes every intermediate value between $inf f$ and $sup f$.

== Problem C

For a continuous bijection $f:X->Y$ with $X$ compact, $f^(-1)$ is continuous. A closed $B subset X$ is compact, hence $f(B)$ is compact and closed in the metric space $Y$. Thus $f$ is a closed map. Compactness is necessary: $[0,2pi)->S^1$, $t mapsto e^(i t)$, is a continuous bijection whose inverse is discontinuous at $1$.

== Problem D

If $D_v f(p)$ exists, then $D_(c v) f(p)=c D_v f(p)$: for $c!=0$ substitute $h=c t$ in the defining limit, and $c=0$ is immediate. For $f(x,y)=sqrt(|x y|)$ at $(0,0)$, the derivatives in $(1,0)$ and $(0,1)$ are $0$, but that in $(1,1)$ does not exist because $|t|/t$ has unequal one-sided limits. For $f(x,y)=x y^2/(x^2+y^2)$ off the origin and $0$ at it, $D_(a,b) f(0,0)=0$ when $(a,b)=0$, and $D_(a,b) f(0,0)=a b^2/(a^2+b^2)$ otherwise. This formula is not linear in the direction, though polar coordinates show continuity at the origin.

== Problem E

The Baire Category Theorem was written as: in a complete metric space, every countable intersection of open dense subsets is dense.

== Problem F

Let $N subset [0,1]$ select one element from each class modulo $QQ$. The translations $N_r$ form a disjoint decomposition of $[0,1]$. A countably additive, translation-invariant measure on every subset with $m([0,1])=1$ would make all $N_r$ have the same measure; this gives either $0$ or infinity for the interval. Therefore the stipulated measure does not exist.

== Bonus problem

The Cantor set is uniformly disconnected by its middle-third gaps. The recorded equivalent ultrametric is the infimum of $epsilon$ for which an $epsilon/d(x,y)$-chain joins $x$ to $y$. Concatenating chains yields the ultrametric inequality. Conversely, if $d'/C<=d<=C d'$ and $d'$ is ultrametric, the $epsilon=1/(2C)$ chain would force $d'(x,y)<=d'(x,y)/2$, impossible for distinct points.
