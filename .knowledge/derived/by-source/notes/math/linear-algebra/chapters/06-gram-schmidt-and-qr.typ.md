---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/linear-algebra/chapters/06-gram-schmidt-and-qr.typ"
kgd_source_format: "typst"
kgd_source_sha256: "8252fe2142896366d59fd077bd3ec12b1ea82bc982f53d5f62dc59941cccf9a0"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *


= Gram--Schmidt and QR factorization

== WS 17, p. 1: proof of QR factorization #kn[QR factorization]

Let $M=mat( m_1,dots, m_d)$ be $n times d$. Gram--Schmidt produces
$Q=mat( q_1,dots, q_d)$:
$
 q_1= m_1/norm( m_1),
$
$
 q_i=( m_i-sum_(k=1)^(i-1)( m_i dot  q_k) q_k)/
norm( m_i-sum_(k=1)^(i-1)( m_i dot  q_k) q_k).
$
The $( q_1,dots, q_d)$ are orthonormal. 因而 $Q$ is an orthogonal
matrix, and
$
S_(M arrow.r Q)=mat([ m_1]_Q,dots,[ m_d]_Q).
$

The worksheet computes
$
Q^t M=mat(
 m_1 dot  q_1, m_2 dot  q_1,dots, m_d dot  q_1;
 m_1 dot  q_2, m_2 dot  q_2,dots;
dots,dots, m_d dot  q_d).
$
Because $ q_i perp "span"( m_1,dots, m_(i-1))$, the entry
$ q_i dot  m_j$ is $0$ when $i>j$; the result is upper triangular.
Thus $M=Q R$, with $R=Q^t M$ upper triangular.

== Proof of matrix product theorem

For ordered bases $B=( b_1,dots, b_d)$ and
$A=( a_1,dots, a_d)$ of $W subset.eq bR^n$:
$
mat( b_1,dots, b_d)=mat( a_1,dots, a_d)S_(B arrow.r A),
$
where
$
S_(B arrow.r A)=mat([ b_1]_A,dots,[ b_d]_A).
$
Note that if $ b_i=c_1  a_1+dots+c_d  a_d$, then
$[ b_i]_A=mat(c_1;dots;c_d)$; hence
$
A S_(B arrow.r A)
=mat(A[ b_1]_A,dots,A[ b_d]_A)
=mat( b_1,dots, b_d)=B.
$
