---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/linear-algebra/chapters/13-spectral-theorem.typ"
kgd_source_format: "typst"
kgd_source_sha256: "d1816b0c5eb898fc8d9d5fab7deda8443246b132380d6cfe44db9bc1235ccc7b"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let ar = x => x
#let bC = math.bb("C")

#let bR = math.bb("R")

= Spectral theorem

== WS 27, p. 1: theorem and first two claims

#theorem(title: [#kn[Spectral theorem]])[
$A$ is orthogonally diagonalizable iff $A$ is symmetric:
$exists S in bR^(n times n)$ such that $S^(-1)=S^t$ and $S^t A S$ is diagonal
iff $A$ is symmetric.
]
Equivalently, $S$ 的 cols 是 $bR^n$ 的一个 orthonormal basis, 且为 $A$ 的
eigenvectors. 普通 diagonalization: $D=S A S^(-1)$, $S$ 的 cols 为 $V$ 的
一个 eigenbasis $( v_1,dots, v_n)$. 而 orthogonal diagonalization:
$D=S^t A S$, $S$ 的 cols 不但是 eigenbasis，而且还是一个 orthonormal
eigenbasis. 这意味着对于不同的 eigenvectors，它们都是 orthogonal 的
（可以为 orthonormal），也就是说 $V,E_(lambda_1),E_(lambda_2)$ with
$E_(lambda_1) perp E_(lambda_2)$.

Claim 1: if $A$ is orthogonally diagonalizable, then $A$ is symmetric.
If $S^t A S=D$ and $S^(-1)=S^t$, then
$
A=S D S^t,
$
and
$
A^t=(S D S^t)^t=S D^t S^t=S D S^t=A.
$

Claim 2: if $A in bR^(n times n)$ is symmetric, then $A$ is orthogonally
diagonalizable over $bR$. This claim is divided into three parts.

Claim 2 pt.(1): if $A in bR^(n times n)$ is symmetric, then $A$ has real
eigenvalues. By the fundamental theorem of Algebra,
$chi_T(x)=0$ 有 $n$ 个 complex roots 包含重复. Let $lambda$ be any complex
eigenvalue, so $exists  z in bC^n$, $A z=lambda z$. Then
$A\bar{ z}=\bar lambda\bar{ z}$, and, after transpose,
$\bar{ z}^t A=\bar lambda\bar{ z}^t$ because $A$ is symmetric.
Multiply $ z$ on the right:
$
\bar{ z}^t A z
=lambda(\bar{ z}^t z)
=\bar lambda(\bar{ z}^t z).
$
Since $\bar{ z}^t z=sum_i|z_i|^2>0$, $lambda=\bar lambda$; every
complex eigenvalue is real.

Claim 2 pt.(2): consider $lambda_1,lambda_2$ and nonzero
$ v_1 in E_(lambda_1)$, $ v_2 in E_(lambda_2)$, with
$lambda_1 !=lambda_2$. Then
$
lambda_1 v_1^t v_2
=(A v_1)^t v_2
= v_1^t A^t v_2
= v_1^t(A v_2)
=lambda_2 v_1^t v_2.
$
Thus $ v_1 dot v_2=0$, so $ v_1 perp v_2$.

== WS 27, p. 2: induction proof

Claim 2 pt.(3): if $A in bR^(n times n)$ is symmetric, then $A$ is
orthogonally diagonalizable. Prove by induction.

Base case: a $1 times 1$ matrix is diagonal and symmetric. Inductive step:
if every symmetric $n times n$ matrix is orthogonally diagonalizable, then
every $(n+1) times(n+1)$ matrix is too.

Let $A in bR^((n+1) times(n+1))$ be symmetric. Let $lambda$ be an eigenvalue
and $ u$ a corresponding unit eigenvector. Complete
$U=( u, u_1,dots, u_n)$ to an orthonormal basis of $bR^(n+1)$.
Put
$
Q=mat( u, u_1,dots, u_n),
$
so $Q$ is orthogonal and $Q^t=Q^(-1)$. 注意 $Q$ 为
$S_(U arrow.r epsilon)$, 因而 $Q^t=Q^(-1)=S_(epsilon arrow.r U)$.

Then
$
Q^t A Q=[lambda,0;0,B]
$
for some $B in bR^(n times n)$: $Q^t A Q$ is symmetric, and
$
Q^t A Q e_1=Q^t(A u)
=Q^t(lambda u)=lambda S_(epsilon arrow.r U) u
=lambda e_1.
$
By the inductive hypothesis, $B$ is orthogonally diagonalizable,
$B=R D R^t$ for an orthogonal $R$ and diagonal $D$. Therefore
$
Q^t A Q
=mat(1,0;0,R)mat(lambda,0;0,D)mat(1,0;0,R)^t.
$
The middle matrix is diagonal and $mat(1,0;0,R)$ is orthogonal, since its
transpose equals its inverse. Therefore we have constructed an orthogonal
diagonalization of $A$.
