---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: Abstract Algebra Collection
date: 2026
description: A personal collection of introductory abstract algebra notes and worked problems.
keywords:
- abstract algebra
- rings
- groups
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/modern-algebra/chapters/05-groups-and-permutations.typ"
subtitle: Integers, rings, groups, quotients, and a glimpse of elliptic curves
title: (A Bit of) Abstract Algebra
---
# Groups and permutations

This chapter is a source-language transcription of 'WorkSheets/412-WS18-symmetric_group-Mywork.pdf', pp. 1--2.

## Symmetric groups and cycles

**Source transcription --- WS18, p. 1, A(6).** The inverse of a cycle is written

$$
\left( {a_{1},a_{2},\ldots,a_{j}} \right)^{- 1} = \left( {a_{j},a_{j - 1},\ldots,a_{1}} \right),
$$

followed by 一般真.'' The worked example is $\left( {1,2,3,4,5} \right)^{- 1} = \left( {5,4,3,2,1} \right)$.

**Source transcription --- WS18, p. 1, B.** The source records $\left. |S_{n} \middle| = n! \right.$. For subgroups of $S_{4}$, it gives

$$
< \left( {1234} \right) \geq \left\{ {e,\left( {1234} \right),\left( {13} \right)\left( {24} \right),\left( {1432} \right)} \right\}
$$

and labels it cyclic 4 group'', while

$$
\left\{ {e,\left( {12} \right)\left( {34} \right),\left( {13} \right)\left( {24} \right),\left( {14} \right)\left( {23} \right)} \right\}
$$

is labelled Klein 4 group''. It writes that $S_{4}$ has $\frac{4!}{2} = 12$ subgroups isomorphic to $S_{2}$: fix one of the four elements and permute the remaining three, using the count $\left( \frac{n}{k} \right)$ for the number of corresponding subgroups in $S_{n}$.

The source explains the cycle decomposition algorithm for a permutation:

1.  begin from an element of $\left\{ {1,2,3,\ldots,n} \right\}$ and follow its cycle backwards;
2.  delete every element used in that cycle, then repeat the bijection process with unused elements;
3.  continue until the elements $1,2$ are both used.

It writes the standard transposition expansion

$$
\left( {a_{1},a_{2},\ldots,a_{j}} \right) = \left( {a_{1}a_{2}} \right)\left( {a_{2}a_{3}} \right)\ldots\left( {a_{j - 1}a_{j}} \right)
$$

and comments that every cycle is a product of transpositions. A worked factorization is

$$
\left( {12} \right)\left( {345} \right) = \left( {42} \right)\left( {34} \right)\left( {45} \right).
$$

## Even and odd permutations

**Source transcription --- WS18, p. 1, D--F.** Define $A_{n}$ as the subgroup of $S_{n}$ consisting of all even permutations. The source records

$$
\left. |A_{n} \middle| = \frac{n!}{2} \right.
$$

and adds: 这说明 $S_{n}$ 中一定有一半为 even 的，一半为 odd 的.'' It stresses the exceptional condition $A_{n}$ is Abel 的 iff $n \leq 3$!!!'' and states that one cycle in $S_{n}$ can have possible order $1$ through $n$, so the possible orders of a cyclic group are also $1$ through $n$.

For a formal proof of the parity statement, the sheet fixes

$$
\sigma = \begin{pmatrix}
1 & 2 & \ldots & n \\
k_{1} & k_{2} & \ldots & k_{n}
\end{pmatrix}
$$

and notes that $\left( {k_{n},n} \right)\sigma$ can fix $n$. It then uses induction to reduce a permutation on $n$ points to one fixing $n$.

## Permutation matrices

**Source transcription --- WS18, pp. 1--2, G.** A permutation matrix has one $1$ in each row and each column and zeros elsewhere. The source describes its columns: for

$$
\sigma = \begin{pmatrix}
1 & 2 & 3 & \ldots & n \\
k_{1} & k_{2} & k_{3} & \ldots & k_{n}
\end{pmatrix},
$$

the $\left( {k_{i},i} \right)$ entry is $1$ and all remaining entries are $0$. It concludes: 任意 permutation 都有唯一的 permutation matrix.''

With $P_{\sigma}e_{i} = e_{\sigma{(i)}}$, it calculates

$$
\left( {P_{\sigma}P_{\tau}} \right)e_{i} = P_{\sigma{({P_{\tau}e_{i}})}} = P_{\sigma}e_{\tau{(i)}} = e_{\sigma{({\tau{(i)}})}},
$$

so $P_{\sigma}P_{\tau} = P_{\sigma ○ \tau}$. Therefore all $n \times n$ permutation matrices form a subgroup of $\text{GL}_{n{(\mathbb{R})}}$, isomorphic to $S_{n}$.

For a transposition $\left( {ij} \right)$ the sheet writes $P_{ij}^{- 1} = P_{ij}$ and $\det\left( P_{ij} \right) = \left( {- 1} \right)^{1} = - 1$; it includes the displayed example matrix $P_{24}$. Finally, if an even permutation is written

$\sigma = \left( {a_{1}a_{2}} \right)\left( {a_{3}a_{4}} \right)\ldots\left( {a_{i}a_{j}} \right),$

then

$\det\left( P_{\sigma} \right) = \det\left( P_{a_{1}a_{2}} \right)\det\left( P_{a_{3}a_{4}} \right)\ldots\det\left( P_{a_{i}a_{j}} \right) = \left( {- 1} \right)^{\text{even}} = 1.$

The source concludes: odd permutation: det 为 $\left( {- 1} \right)^{\text{odd}} = - 1$；因而 permutation matrix 是 unique 的，所以 even/odd 也 unique 的.''

