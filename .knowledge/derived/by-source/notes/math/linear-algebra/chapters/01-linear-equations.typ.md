---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/linear-algebra/chapters/01-linear-equations.typ"
kgd_source_format: "typst"
kgd_source_sha256: "75a00237cb86cd64ce55c43b1e069575b26b9f0fc70335d1da5b302161ed4b3c"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *


#let bR = math.bb("R")

= Linear equations, vectors, and matrices

== WS 1, p. 1: vectors and vector spaces

(* complement: "MathHygine" *) Principle of Mathematical Induction:
$[S(n) and (forall k in bN, S(k) arrow.r S(k+1))] arrow.r (forall m in bN, S(m))$.

For the system
$
cases(3x+21y-3z=0, -6x-2y-z=62, 2x-3y+8z=32)
$
place numbers in the columns of the augmented matrix
$mat(3,21,-3,0; -6,-2,-1,62; 2,-3,8,32)$.

#definition(title: [#kn[Vector space]])[
A matrix with only one column is called a column vector, or simply a vector.
The entries of a vector are called its components. The set of all column
vectors with $n$ components is denoted by $bR^n$. We will refer to $bR^n$ as
a vector space.

A matrix with only one row is a row vector. In this text, we refer to vectors
as column vectors unless otherwise stated. 下一章会说 preference for column
vectors 的 apparent reason.

For example, $mat(1;2;9;1)$ is a vector in $bR^4$; $mat(1,5,5,3,7)$ is a row
vector with $5$ components.
]

1. $A=mat(a_(11),a_(12),dots; a_(21),dots; dots,a_(34))$ is called a
   $3 times 4$ matrix (row, col; three by four).
2. Matrix $A=B$ if same size and $forall i,j, a_(i j)=b_(i j)$.
3. If $A$ is $n times n$, $A$ is called a square matrix, and the entries
   $a_(11),a_(22),dots,a_(n n)$ form the main diagonal of $A$.
4. A square matrix $A$ is called diagonal provided all its entries above and
   below the diagonal are $0$, i.e. $a_(i j)=0$ whenever $i != j$.
5. $A$ is called upper triangular provided all its entries below the main
   diagonal are $0$; lower triangular: entries above the main diagonal are
   $0$.

Note that the $m$ columns of an $n times m$ matrix are vectors in $bR^n$ but
not $bR^m$: each vector in the $m$ vectors has $n$ components.

Standard representation of vectors: $ v=mat(x;y)$ (in Cartesian plane;
in $bR^3$ defined analogously, and likewise in $bR^n$). When considering an
infinite set of vectors, arrow representation becomes impractical. One may
represent $ v=mat(x;y)$ simply by the point $(x,y)$, the head of the
standard arrow representation of $ v$. Example: the set of all vectors
$mat(x;x+1)$ where $x$ is arbitrary is represented as the line $y=x+1$; for a
few special values of $x$ we may still use arrow representation. The source
sketch labels the vectors $mat(1;2)$ for $x=1$ and $mat(-2;-1)$ for $x=-2$ on
that line.

Consider the system
$
cases(2x+8y+4z=2, 2x+5y+z=5, 4x+10y-z=1).
$
The matrix which contains the coefficients is called its coefficient matrix,
$mat(2,8,4;2,5,1;4,10,-1)$. By contrast,
$mat(2,8,4,2;2,5,1,5;4,10,-1,1)$, which displays all numerical information,
is called the augmented matrix.

== WS 1, p. 2: augmented matrices and RREF

For the sake of clarity, we will often indicate the position of the equal
signs in the equations by a dotted line:
$mat(2,8,4,|,2;2,5,1,|,5;4,10,-1,|,1)$.

我们可以把之前的对 equation 的操作用在 matrix 上，并且将 answer represented as a
vector. Thus the displayed system has answer $mat(x;y;z)=mat(1;4;3)$.

Example:
$mat(1,-1,0,0,4,2;0,0,1,0,-1,2;0,0,0,1,-1,3)$
gives
$mat(x_1;x_2;x_3;x_4;x_5)=mat(2+t+4r;t;2+r;3+r;r)$.

这个 equation 容易解是因为：

1. The leading coefficient is always $1$.
2. The leading variable in each equation 在其他 equation 中不出现.
3. The leading variables in natural order 出现.

当一个 linear system 有这些三条性质后就非常容易解，因而我们希望将 linear
system reduce 至满足 $P_1,P_2,P_3$.

For example, row operations reduce the displayed augmented matrix to
$mat(1,2,0,0,3,2;0,0,1,0,-1,4;0,0,0,1,-2,3;0,0,0,0,0,0)$.
只要朝一个 down，从第三条原则就可以完成这个获得满足 $P_1,P_2,P_3$ 的 reduced
matrix 而解 linear system 的 algorithm.

From top to down, move on to the $i$th equation $c x_j+dots=b$:

1. Divide by $c$, so $x_j+dots=b/c$.
2. Eliminate $x_j$ from all other equations above and below.
3. Proceed to next equation.
4. Check: if $0=$ non-$0$, inconsistent.
5. Rearrange equations so the leading variables are in natural order.

The reduced row-echelon form (行阶梯矩阵 or Rref) satisfies:

1. 若一 row 有 non-$0$ entries, the first non-$0$ entry must be $1$, called
   the leading or pivot.
2. 若一 col 中有 pivot，则 col 中其他 entries 必须为 $0$.
3. 若一 row 中有 pivot，则它后每个 row 必须有 pivot 在它右边（and rows of
   $0$s must be at the bottom of matrix）.

#definition(title: [#kn[Elementary row operation]])[
之前我们对 linear system 中 equations 的三种 operations 用在 matrix 上，这三种
operation 统称 elementary row operations:

1. Divide a row by a non-zero scalar.
2. Subtract a multiple of a row from another.
3. Swap two rows.

这种使用 elementary row operations 将 matrix 化为 rref 的解 linear system 的
algorithm 叫做 Gauss--Jordan elimination.
]
