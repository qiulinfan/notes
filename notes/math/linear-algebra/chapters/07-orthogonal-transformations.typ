#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *


#let bR = math.bb("R")

= Orthogonal transformations

== WS 18, p. 1: definition and matrix criteria

#definition(title: [#kn[Orthogonal transformation]])[
$T:bR^n arrow.r bR^n$ is orthogonal (正交变换) if it preserves dot products:
$forall  x, y in bR^n$, $ x dot  y=T( x) dot T( y)$.
]

#theorem(title: [Equivalent characterizations])[
$T:bR^n arrow.r bR^n$ is orthogonal iff it preserves the length of vectors:
$forall  x in bR^n$, $norm(T( x))=norm( x)$.
]

因而 linear trans 保留 dot product iff 保留 length. The proof expands
$norm(T( x+ y))^2=norm( x+ y)^2$:
$
norm(T( x))^2+2T( x)dot T( y)+norm(T( y))^2
=norm( x)^2+2 x dot  y+norm( y)^2,
$
then cancels equal norm terms.

(a) An orthogonal trans $T$ is injective:
$T( x)= 0 arrow.r norm(T( x))=0 arrow.r norm( x)=0$,
so $"ker" T={ 0}$ and $T$ is inj. (b) It is an isomorphism because a
same-dimension linear trans is inj iff surj. (c) The standard matrix of $T$
has orthonormal columns. (d) The composition of orthogonal trans is
orthogonal, since
$
norm(T_k dot T_(k-1) dot dots dot T_1( x))=dots=norm( x).
$

#definition(title: [Orthogonal matrix])[
A square matrix $A$ is orthogonal if $A^t A=I_n$ (即 $A^t=A^(-1)$).
]

If $A=mat( v_1,dots, v_n)$, then the $i j$th entry of $A^t A$ is
$ v_i dot  v_j$. Therefore $A$ is orthogonal iff its cols are
orthonormal. 我们也由此知道：由 orthonormal basis 组成的 matrix $A$，
$A^(-1)$ 就是 $A^t$.

The worksheet proves $(A B)^t=B^t A^t$: the $i j$th entry of $A B$ is the
$i$th row of $A$ dot the $j$th col of $B$, while the $i j$th entry of
$B^t A^t$ is $ b_i dot  a_j$. Thus they agree.

== WS 18, p. 2: products and change of basis

If $A$ is orthogonal, then $A^(-1)$ (也是 $A^t$) is orthogonal, since
$AA^t=I_n$ implies $(A^t)(A^t)^t=AA^t=I_n$. 结论：这意味着对于 $A$ 的 cols
是 orthonormal 的，那 $A$ 的 rows 也是 orthonormal 的.

#theorem(title: [Products of orthogonal matrices])[
If $A,B$ are orthogonal $n times n$ matrices, then $A B$ is orthogonal.
]
Indeed,
$
(A B)(A B)^t=A(B B^t)A^t=I_n,
$
so $(A B)^t=(A B)^(-1)$.

#theorem(title: [Orthogonal maps and their matrices])[
$T:bR^n arrow.r bR^n$ is orthogonal iff $[T]_epsilon$ is orthogonal, where
$epsilon$ is the standard basis. More generally,
$T$ is orthogonal iff $[T]_beta$ is orthogonal for any orthonormal basis
$beta$.
]

For the reverse direction,
$
T( a)dot T( b)
=([T]_epsilon  a)dot([T]_epsilon  b)
= a^t[T]_epsilon^t[T]_epsilon  b
= a dot  b.
$

Claim 1: If $A,B$ are orthonormal basis matrices, their change-of-basis
matrices are orthogonal. On WS 16, the entries are
$
S_(A arrow.r B)=mat(
 a_1 dot  b_1, a_2 dot  b_1,dots, a_n dot  b_1;
 a_1 dot  b_2,dots;
dots,dots, a_n dot  b_n
)
$
and
$
S_(B arrow.r A)=mat(
 b_1 dot  a_1, b_2 dot  a_1,dots;
dots,dots, b_n dot  a_n
)=S_(A arrow.r B)^t.
$
Thus $S_(A arrow.r B)=S_(B arrow.r A)^(-1)$.

== WS 18, p. 3: conclusion

Claim 2: orthogonal matrices 的 product 也是 orthogonal matrix. 这是因为
orthogonal transformations 的 composition 也是 orthogonal transformation，
且它的自身的 matrix 代表为 orthogonal matrix。

Claim 3: 如果 $T$ orthogonal，则 $[T]_beta$ orthogonal for 任意
orthonormal basis $beta$:
$
[T]_beta=S_(epsilon arrow.r beta)[T]_epsilon S_(beta arrow.r epsilon).
$
All three factors are orthogonal, hence so is $[T]_beta$.

Claim 4: $beta$ 为任意 orthonormal basis; 如果 $[T]_beta$ orthogonal，则
$T$ orthogonal. Since
$
[T]_beta=S_(epsilon arrow.r beta)[T]_epsilon S_(beta arrow.r epsilon),
$
we obtain
$
[T]_epsilon=S_(beta arrow.r epsilon)[T]_beta S_(epsilon arrow.r beta),
$
a product of orthogonal matrices; hence $[T]_epsilon$ is orthogonal and
therefore $T$ is orthogonal.

总结：$T$ is orthogonal (保留 dot product)
$=T$ 保留 length $=T$ 保留 distance
$=T$ 把 $bR^n$ 的某个 orthonormal basis map 到另一个 orthonormal basis
$=[T]_beta$ 为 orthogonal 的，$beta$ 为任意 orthonormal basis
$=[T]_beta$ 的 rows/cols 为一个 orthonormal basis of $bR^n$.
