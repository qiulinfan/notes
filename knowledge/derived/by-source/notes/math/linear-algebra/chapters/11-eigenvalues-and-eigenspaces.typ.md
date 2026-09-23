---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/linear-algebra/chapters/11-eigenvalues-and-eigenspaces.typ"
kgd_source_format: "typst"
kgd_source_sha256: "76e06508a1d399e4b3628bd55c4eda72058e0d3fc3ee6141193810add5c0e238"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *


#let bR = math.bb("R")

= Eigenvalues and eigenspaces

== WS 24, p. 1: characteristic polynomial and multiplicities

#theorem(title: [Eigenvalues are roots])[
The eigenvalues of $T$ are precisely the roots of its characteristic
polynomial.
]
简明 proof:
$lambda$ 是 $T$ 的 eigenvalue iff $E_lambda != { 0}$ iff
$"ker"(T-lambda I)!={ 0}$ iff nullity$(T-lambda I)>0$ iff
$"rank"(T-lambda I)<n$ iff $T-lambda I$ 不可逆 iff
$"det"(T-lambda I)=0$. Thus $lambda$ is a root of $"det"(T-lambda I)=0$.

#theorem(title: [Distinct-eigenvalue eigenspaces])[
$forall  x in E_(lambda_1)$ 且 $ x !=  0$, and
$ y in E_(lambda_2)$ 且 $ y !=  0$, if $lambda_1 != lambda_2$, then
$ x, y$ are linearly independent.
]
因而 eigenbases of distinct eigenspaces have linearly independent union, and
if $sum_i"dim"(E_(lambda_i))="dim"V$, that union is an eigenbasis of $V$ for
$T$.

#theorem(title: [Geometric and algebraic multiplicity])[
For eigenvalue $lambda$, $"gem"(lambda)<="alm"(lambda)$.
]
Let $A in bR^(n times n)$, let $lambda$ be an eigenvalue and
$"gem"(lambda)=m$. Let $( v_1,dots, v_m)$ be a basis of $E_lambda$,
put $S=mat( v_1,dots, v_m)$, and define $B=S^(-1) A S$. Then for
$1<=i<=m$,
$
B e_i=S^(-1) A S e_i
=S^(-1)A v_i=S^(-1)lambda v_i=lambda e_i.
$
Therefore
$
B=mat(lambda I_m,P;0,Q),
$
so
$
f_A(x)=f_B(x)="det"(B-x I_n)=(x-lambda)^m f_Q(x),
$
and $"alm"(lambda)>=m$.

#theorem(title: [Degree of the characteristic polynomial])[
For $T:V arrow.r V$, $chi_T(x)$ has degree $"dim"V$.
]
This is the corollary of the preceding two theorems: if $T$ has $n$
different eigenvalues, then $sum_i"alm"(lambda_i)<="dim"V$. Proof: 见 P9.
