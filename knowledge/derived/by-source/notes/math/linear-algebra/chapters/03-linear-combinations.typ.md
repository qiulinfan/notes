---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/linear-algebra/chapters/03-linear-combinations.typ"
kgd_source_format: "typst"
kgd_source_sha256: "7256d034182f5b161127af8d1b35e8ef02978ccda5a1110afadaf5fce93ffced"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *


#let bR = math.bb("R")

= Linear combinations

== WS 3, p. 1: geometry and number of solutions

Geometric Interpretation: three planes can have a point of intersection
$(x,y,z)$, three planes having a line in common, or three planes with no
common intersection. 这是 common situation. 然而还有下面这两种 situation：

- $3$ planes having a line in common: a system with infinitely many sols.
- $3$ planes with no common intersection: a system without sols.

For
$
cases(2x+4y+6z=0, 4x+5y+6z=3, 7x+8y+9z=6)
$
reduction gives $x-z=2$, $y+2z=-1$. Generally choose $z=t$; then
$x=t+2$, $y=-2t-1$, and the general solution is
$(x,y,z)=(t+2,-2t-1,t)=(2,-1,0)+t(1,-2,1)$.
The general sol represents a line in space; the source sketch marks
$t=0:(2,-1,0)$, $t=1:(3,-3,1)$, and $t=2:(9,-5,2)$.

For
$
cases(x+2y+3z=0, 4x+5y+6z=3, 7x+8y+9z=0)
$
reduction yields $x-z=2$, $y+2z=-1$, $0=-6$. Whatever value we choose,
$0=-6$ cannot be satisfied; this system is inconsistent and has no sol.

Complement (Joy of sets): To say a set is close under some operation
$diamond$ is to mean that $a,b in S arrow.r a diamond b in S$.

== Number of solutions of a linear system

本章：① examine how many sols a system of linear equations can possibly can.
② Then we will present some definitions and rules of matrix algebra.

A system of equa. is said to be consistent if it has at least $1$ sol;
inconsistent: no sol (iff rref of its augmented matrix contains
$mat(0,dots,0,|,c)$ with $c != 0$).

If consistent, either infinitely many sols (at least one free variable) or
exactly one sol (if all variables are leading).

#definition(title: [#kn[Matrix rank]])[
The number of leading $1$'s in $"rref"(A)$ is denoted $"rank"(A)$. For
$A=mat(1,2,3;4,5,6;7,8,9)$,
$"rref"(A)=mat(1,0,-1;0,1,2;0,0,0)$, so $"rank"(A)=2$.
]

For an $n times m$ coefficient matrix $A$ and the $n times (m+1)$ augmented
matrix $[A|b]$:

1. $"rank"(A)<=m$ and $"rank"(A)<=n$.
2. If the system is inconsistent, $"rank"(A)<n$.
3. If the system has one sol, $"rank"(A)=m$.
4. If the system has infin sols, $"rank"(A)<m$.

If system inconsistent, rref of augmented matrix contains a row
$[0 dots 0|1]$, so no leading $1$ in that row for the coefficient part.
Number of variables = total number of variables $-$ number of leading
variables $=m-"rank"(A)$. Thus exactly one sol gives
$m-"rank"(A)=0$, whereas infinitely many sols gives $m-"rank"(A)>0$.

As contrapositive: (1) if $"rank"(A)=n$, the system has a sol; (2) if
$"rank"(A)<m$, the system has no sol or infin sols; (3) if
$"rank"(A)=m$, the system has no sol or exactly one sol.

#theorem(title: [Number of equations vs. number of unknowns])[
If a linear system has exactly one sol, then it has at least as many equations
as variables (i.e. $m<=n$ for coefficient matrix $A^(n times m)$). Its
contrapositive: a linear system with fewer equations than variables ($n<m$)
has either no sol or infin sols.
]

To illustrate it: consider $2$ linear equations in $3$ variables. 每个
$a x+b y+c z=d$ 都表示一个 plane，而两个 plane 要么平行无交点，要么交于一直线
(infin sols)，不可能只有一个交点。

== WS 3, pp. 2--3: matrix algebra and linear combinations

#definition(title: [Sum and scalar multiples of matrices])[
For same-size matrices, addition is entrywise; for $k in bR$, multiplication
by $k$ multiplies every entry by $k$.
]

#definition(title: [Dot products of vectors])[
For $ v=<v_1,dots,v_n>$ and $ w=<w_1,dots,w_n>$,
$ v dot  w=v_1 w_1+v_2 w_2+dots+v_n w_n$. Note that the definition is not
row-column-sensitive; it does not distinguish between row and col vectors.
]

#definition(title: [The product of $A  x$])[
Let $A$ be an $n times m$ matrix with row vectors
$ w_1,dots, w_n$ and let $ x in bR^m$. Then
$A  x=mat( w_1 dot  x; dots;  w_n dot  x)$.
In words, the $i$th component of $A  x$ is the dot product of the $i$th
row of $A$ with $ x$.
]

Example: $mat(1,2,3;1,0,-1)mat(3;1;2)=mat(3+2+6;3+0-2)=mat(11;1)$.
The product $A  x$ is defined only when the num of col of $A$ equals the
num of components in $ x$.

#theorem(title: [$A  x$ in terms of columns of $A$])[
Let the columns of $A$ be $ v_1,dots, v_m$. Then
$A  x=x_1  v_1+x_2  v_2+dots+x_m  v_m$.
]

#definition(title: [#kn[Linear combination]])[
A vector $ b in bR^n$ is called a linear combination of vectors
$ v_1,dots, v_m in bR^n$ if there are scalars $x_1,dots,x_m$ such
that $ b=x_1  v_1+dots+x_m  v_m$.
]

Example: is $ b=mat(1;1;1)$ a linear combination of
$ v=mat(1;2;3)$ and $ w=mat(4;5;6)$? Solve
$mat(1;1;1)=x mat(1;2;3)+y mat(4;5;6)=mat(x+4y;2x+5y;3x+6y)$.
Row reduction gives $x=-1/3$, $y=1/3$, hence
$ b=-1/3  v+1/3  w$.

#theorem(title: [Algebraic rule for $A  x$])[
If $A$ is an $n times m$ matrix, $ x, y in bR^m$, and $k$ is a
scalar, then $A( x+ y)=A  x+A  y$ and
$A(k  x)=k(A  x)$.
]

#theorem(title: [Matrix form of a linear system])[
With augmented matrix $[A| b]$, a linear system can be written
$A  x= b$. Its $i$th component is $a_(i 1)x_1+dots+a_(i m)x_m=b_i$, the
$i$th equation. For $3x_1+x_2=7$, $x_1+2x_2=4$:
$mat(3,1;1,2)mat(x_1;x_2)=mat(7;4)$, equivalently
$x_1mat(3;1)+x_2mat(1;2)=mat(7;4)$.

For $2x_1-3x_2+5x_3=7$, $9x_1+4x_2-6x_3=8$:
$mat(2,-3,5;9,4,-6)mat(x_1;x_2;x_3)=mat(7;8)$.
如果我们可以 divide by matrix $A$，$ x= b/A$，就能直接解 $ x$。
换言之我们是否能够找到 $A^(-1)$ 呢？ Chapter 2.
]
