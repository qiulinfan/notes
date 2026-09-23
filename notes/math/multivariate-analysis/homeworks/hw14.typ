#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Source: Homework/395-hw-14.pdf pp.1-2 (personal work).
= HW 14

== Problem A

For $a_i=1/2^(2i+2)$, $b_i=1/2^(2i+1)$, $I_i=[a_i,b_i]$, and $M_i=4^(i+1)$, let $phi(t)=exp(-1/(1-t^2))$ for $|t|<1$ and $0$ otherwise. Define

$psi_i(x)=M_i phi((2x-(a_i+b_i))/|I_i|).$

The $psi_i$ are smooth with disjoint supports $I_i$. If $lambda=sum_i psi_i$, then at the midpoint of $I_i$, $psi_i=M_i phi(0)=M_i e^(-1)->infinity$ while the midpoints tend to $0$ and $lambda(0)=0$. Thus $lambda$ is not continuous at $0$.

== Problem B

The change-of-variables theorem for linear diffeomorphisms and compactly supported continuous $f$ is proved by induction on the dimension, after decomposing a linear map into primitive linear diffeomorphisms. The $n=1$ case is the one-variable substitution theorem. For a primitive map preserving the last coordinate, write $Q=D times I$, restrict to $S=h^(-1)(Q)$, extend $(f o h)|op("det") D h|$ by $0$, and use Fubini. For each fixed $t$, the $(n-1)$-dimensional induction hypothesis supplies the inner substitution formula, which Fubini integrates to the result.

== Problem C

The rank map on $M_(n,m)$ is lower semicontinuous. If matrix $A$ has rank $r>0$, choose a nonzero $r times r$ minor. Continuity of determinant supplies a Frobenius-norm ball about $A$ in which the same minor remains nonzero, so ranks are at least $r$. It need not be continuous: $A_k=(1/k)I_n->0$, but $A_k$ has rank $n$ while zero has rank $0$.
