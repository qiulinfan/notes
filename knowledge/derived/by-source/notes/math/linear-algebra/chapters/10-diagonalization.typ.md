---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/linear-algebra/chapters/10-diagonalization.typ"
kgd_source_format: "typst"
kgd_source_sha256: "24df19e70f381dc063c1af73196411ea16c8ff07a73d2a45e058ea2f1f696cfc"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *


#let bR = math.bb("R")

= #kn[Diagonalization] and eigenspaces

== WS 23, p. 1: four theorems

#theorem(title: [Eigenbasis and diagonal matrix])[
For a finite-dimensional vector space $V$, a basis $beta$ of $V$ is an
eigenbasis for $T:V arrow.r V$ iff $[T]_beta$ is diagonal.
]
Indeed,
$
[T]_beta=mat([T( b_1)]_beta,dots,[T( b_n)]_beta)
=mat(lambda_1 b_1,dots,lambda_n b_n).
$

#theorem(title: [Diagonalizable transformation])[
$T:V arrow.r V$ is diagonalizable iff $[T]_beta$ is similar to some diagonal
matrix $D$.
]
The definition notes: $T$ diagonalizable iff 其 $D=n times n$ matrix of $T$
is diagonal. 因而（所有 $[T]_alpha$ 都相似于 $[T]_beta$）.

#theorem(title: [Diagonalizable matrix])[
$A in bR^(n times n)$ is diagonalizable iff $A$ is similar to some diagonal
$D$.
]

#theorem(title: [#kn[Eigenspace]])[
$E_lambda="ker"(T-lambda I_n)$, so
$"dim"(E_lambda)="dim"("ker"(T-lambda I_n))
=n-"rank"(T-lambda I_n)$.
]
Proof:
$(T-lambda I)( v)= 0$ iff $T( v)=lambda I( v)=lambda v$,
so the kernel is exactly the vectors changed only by $T$ stretching by
$lambda$, i.e. the eigenvectors with eigenvalue $lambda$ together with zero.
没有被 $T-lambda I$ 改变的 vectors，即只被 $T$ 拉伸 $lambda$ 倍的 vectors.

(Thm 7.1.3) 如果 $D=( v_1,dots, v_n)$ 是 an eigenbasis of $V$ for
$T$, then
$
[T]_D=S_(D arrow.r epsilon)^(-1)[T]_epsilon S_(D arrow.r epsilon)
=mat(lambda_1,dots;dots,lambda_n).
$

Proof note: $T_A( x)=A x$ ($A=[T]_epsilon$). Then
$S_(D arrow.r epsilon)=mat( v_1,dots, v_n)$ and
$
[T]_epsilon S_(D arrow.r epsilon)
=mat(A v_1,dots,A v_n)
=mat(lambda_1 v_1,dots,lambda_n v_n).
$
Hence the change of basis yields the diagonal matrix.
