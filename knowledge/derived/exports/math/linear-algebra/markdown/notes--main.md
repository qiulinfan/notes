---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: MATH 217
date: 2026
description: Linear Algebra notes migrated from the explicitly selected personal historical sources.
keywords:
- Linear Algebra
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/linear-algebra/main.typ"
subtitle: Typst-first mathematics notes
title: Linear Algebra
---

# Linear equations, vectors, and matrices

## WS 1, p. 1: vectors and vector spaces

(**complement: "MathHygine"**) Principle of Mathematical Induction: $\left\lbrack {S(n) \land \left( {\forall k \in \mathbb{N},S(k)\rightarrow S\left( {k + 1} \right)} \right)} \right\rbrack\rightarrow\left( {\forall m \in \mathbb{N},S(m)} \right)$.

For the system

$$
\left\{ \begin{matrix}
{3x + 21y - 3z = 0} \\
{- 6x - 2y - z = 62} \\
{2x - 3y + 8z = 32}
\end{matrix} \right.
$$

place numbers in the columns of the augmented matrix $\begin{pmatrix}
3 & 21 & {- 3} & 0 \\
{- 6} & {- 2} & {- 1} & 62 \\
2 & {- 3} & 8 & 32
\end{pmatrix}$.

> **Definition: Vectors and vector spaces**
>
> A matrix with only one column is called a column vector, or simply a vector. The entries of a vector are called its components. The set of all column vectors with $n$ components is denoted by $\mathbb{R}^{n}$. We will refer to $\mathbb{R}^{n}$ as a vector space.
>
> A matrix with only one row is a row vector. In this text, we refer to vectors as column vectors unless otherwise stated. 下一章会说 preference for column vectors 的 apparent reason.
>
> For example, $\begin{pmatrix}
> 1 \\
> 2 \\
> 9 \\
> 1
> \end{pmatrix}$ is a vector in $\mathbb{R}^{4}$; $\begin{pmatrix}
> 1 & 5 & 5 & 3 & 7
> \end{pmatrix}$ is a row vector with $5$ components.

1.  $A = \begin{pmatrix}
    a_{11} & a_{12} & \ldots \\
    a_{21} & \ldots & \\
    \ldots & a_{34} &
    \end{pmatrix}$ is called a $3 \times 4$ matrix (row, col; three by four).
2.  Matrix $A = B$ if same size and $\forall i,j,a_{ij} = b_{ij}$.
3.  If $A$ is $n \times n$, $A$ is called a square matrix, and the entries $a_{11},a_{22},\ldots,a_{nn}$ form the main diagonal of $A$.
4.  A square matrix $A$ is called diagonal provided all its entries above and below the diagonal are $0$, i.e. $a_{ij} = 0$ whenever $i \neq j$.
5.  $A$ is called upper triangular provided all its entries below the main diagonal are $0$; lower triangular: entries above the main diagonal are $0$.

Note that the $m$ columns of an $n \times m$ matrix are vectors in $\mathbb{R}^{n}$ but not $\mathbb{R}^{m}$: each vector in the $m$ vectors has $n$ components.

Standard representation of vectors: $v = \begin{pmatrix}
x \\
y
\end{pmatrix}$ (in Cartesian plane; in $\mathbb{R}^{3}$ defined analogously, and likewise in $\mathbb{R}^{n}$). When considering an infinite set of vectors, arrow representation becomes impractical. One may represent $v = \begin{pmatrix}
x \\
y
\end{pmatrix}$ simply by the point $\left( {x,y} \right)$, the head of the standard arrow representation of $v$. Example: the set of all vectors $\begin{pmatrix}
x \\
{x + 1}
\end{pmatrix}$ where $x$ is arbitrary is represented as the line $y = x + 1$; for a few special values of $x$ we may still use arrow representation. The source sketch labels the vectors $\begin{pmatrix}
1 \\
2
\end{pmatrix}$ for $x = 1$ and $\begin{pmatrix}
{- 2} \\
{- 1}
\end{pmatrix}$ for $x = - 2$ on that line.

Consider the system

$$
\left\{ \begin{matrix}
{2x + 8y + 4z = 2} \\
{2x + 5y + z = 5} \\
{4x + 10y - z = 1}
\end{matrix} \right..
$$

The matrix which contains the coefficients is called its coefficient matrix, $\begin{pmatrix}
2 & 8 & 4 \\
2 & 5 & 1 \\
4 & 10 & {- 1}
\end{pmatrix}$. By contrast, $\begin{pmatrix}
2 & 8 & 4 & 2 \\
2 & 5 & 1 & 5 \\
4 & 10 & {- 1} & 1
\end{pmatrix}$, which displays all numerical information, is called the augmented matrix.

## WS 1, p. 2: augmented matrices and RREF

For the sake of clarity, we will often indicate the position of the equal signs in the equations by a dotted line: $\begin{pmatrix}
2 & 8 & 4 & | & 2 \\
2 & 5 & 1 & | & 5 \\
4 & 10 & {- 1} & | & 1
\end{pmatrix}$.

我们可以把之前的对 equation 的操作用在 matrix 上，并且将 answer represented as a vector. Thus the displayed system has answer $\begin{pmatrix}
x \\
y \\
z
\end{pmatrix} = \begin{pmatrix}
1 \\
4 \\
3
\end{pmatrix}$.

Example: $\begin{pmatrix}
1 & {- 1} & 0 & 0 & 4 & 2 \\
0 & 0 & 1 & 0 & {- 1} & 2 \\
0 & 0 & 0 & 1 & {- 1} & 3
\end{pmatrix}$ gives $\begin{pmatrix}
x_{1} \\
x_{2} \\
x_{3} \\
x_{4} \\
x_{5}
\end{pmatrix} = \begin{pmatrix}
{2 + t + 4r} \\
t \\
{2 + r} \\
{3 + r} \\
r
\end{pmatrix}$.

这个 equation 容易解是因为：

1.  The leading coefficient is always $1$.
2.  The leading variable in each equation 在其他 equation 中不出现.
3.  The leading variables in natural order 出现.

当一个 linear system 有这些三条性质后就非常容易解，因而我们希望将 linear system reduce 至满足 $P_{1},P_{2},P_{3}$.

For example, row operations reduce the displayed augmented matrix to $\begin{pmatrix}
1 & 2 & 0 & 0 & 3 & 2 \\
0 & 0 & 1 & 0 & {- 1} & 4 \\
0 & 0 & 0 & 1 & {- 2} & 3 \\
0 & 0 & 0 & 0 & 0 & 0
\end{pmatrix}$. 只要朝一个 down，从第三条原则就可以完成这个获得满足 $P_{1},P_{2},P_{3}$ 的 reduced matrix 而解 linear system 的 algorithm.

From top to down, move on to the $i$th equation $cx_{j} + \ldots = b$:

1.  Divide by $c$, so $x_{j} + \ldots = \frac{b}{c}$.
2.  Eliminate $x_{j}$ from all other equations above and below.
3.  Proceed to next equation.
4.  Check: if $0 =$ non-$0$, inconsistent.
5.  Rearrange equations so the leading variables are in natural order.

The reduced row-echelon form (行阶梯矩阵 or Rref) satisfies:

1.  若一 row 有 non-$0$ entries, the first non-$0$ entry must be $1$, called the leading or pivot.
2.  若一 col 中有 pivot，则 col 中其他 entries 必须为 $0$.
3.  若一 row 中有 pivot，则它后每个 row 必须有 pivot 在它右边（and rows of $0$s must be at the bottom of matrix）.

> **Definition: Elementary row operations**
>
> 之前我们对 linear system 中 equations 的三种 operations 用在 matrix 上，这三种 operation 统称 elementary row operations:
>
> 1.  Divide a row by a non-zero scalar.
> 2.  Subtract a multiple of a row from another.
> 3.  Swap two rows.
>
> 这种使用 elementary row operations 将 matrix 化为 rref 的解 linear system 的 algorithm 叫做 Gauss--Jordan elimination.

# Linear systems and matrices

The worksheet starts with a system of linear equations:

$$
\left\{ \begin{matrix}
{x + 2y + 3z = 39} \\
{x + 3y + 2z = 34} \\
{3x + 2y + z = 26}
\end{matrix} \right..
$$

To solve for $x,y,z$, we need to transform the system into the form $\left\{ \begin{matrix}
{x = \ldots} \\
{y = \ldots} \\
{z = \ldots}
\end{matrix} \right.$. In other words:

1.  Eliminate terms that are off the diagonal.
2.  Make the coefficients of the variables along the diagonal equal to $1$.

The row-reduction calculation on the page is

$$
\left\{ \begin{matrix}
{x + 2y + 3z = 39} \\
{x + 3y + 2z = 34} \\
{3x + 2y + z = 26}
\end{matrix} \right.\rightarrow\left\{ \begin{matrix}
{x + 2y + 3z = 39} \\
{y - z = - 5} \\
{3x + 2y + z = 26}
\end{matrix} \right.\rightarrow\left\{ \begin{matrix}
{x + 2y + 3z = 39} \\
{y - z = - 5} \\
{- 4y - 8z = - 91}
\end{matrix} \right.,
$$

where the first arrow subtracts the first equation and the next arrow uses $- 3 \times$ the first equation. Then

$$
\left\{ \begin{matrix}
{x + 2y + 3z = 39} \\
{y - z = - 5} \\
{- 4y - 8z = - 91}
\end{matrix} \right.\rightarrow\left\{ \begin{matrix}
{x + 5z = 49} \\
{y - z = - 5} \\
{- 12z = - 111}
\end{matrix} \right.\rightarrow\left\{ \begin{matrix}
{x + 5z = 49} \\
{y - z = - 5} \\
{z = 9.25}
\end{matrix} \right.\rightarrow\left\{ \begin{matrix}
{x = 2.75} \\
{y = 4.25} \\
{z = 9.25}
\end{matrix} \right..
$$

The intervening operations are $- 2 \times$ the second equation and $+ 4 \times$ the second equation; then divide by $12$; finally use $- 5 \times$ the third equation and add the third equation.

Finally, we check the sol by substituting $x,y,z$ into the original linear system. Happily, in Linear Algebra it is easy to check.

# Linear combinations

## WS 3, p. 1: geometry and number of solutions

Geometric Interpretation: three planes can have a point of intersection $\left( {x,y,z} \right)$, three planes having a line in common, or three planes with no common intersection. 这是 common situation. 然而还有下面这两种 situation：

- $3$ planes having a line in common: a system with infinitely many sols.
- $3$ planes with no common intersection: a system without sols.

For

$$
\left\{ \begin{matrix}
{2x + 4y + 6z = 0} \\
{4x + 5y + 6z = 3} \\
{7x + 8y + 9z = 6}
\end{matrix} \right.
$$

reduction gives $x - z = 2$, $y + 2z = - 1$. Generally choose $z = t$; then $x = t + 2$, $y = - 2t - 1$, and the general solution is $\left( {x,y,z} \right) = \left( {t + 2, - 2t - 1,t} \right) = \left( {2, - 1,0} \right) + t\left( {1, - 2,1} \right)$. The general sol represents a line in space; the source sketch marks $t = 0:\left( {2, - 1,0} \right)$, $t = 1:\left( {3, - 3,1} \right)$, and $t = 2:\left( {9, - 5,2} \right)$.

For

$$
\left\{ \begin{matrix}
{x + 2y + 3z = 0} \\
{4x + 5y + 6z = 3} \\
{7x + 8y + 9z = 0}
\end{matrix} \right.
$$

reduction yields $x - z = 2$, $y + 2z = - 1$, $0 = - 6$. Whatever value we choose, $0 = - 6$ cannot be satisfied; this system is inconsistent and has no sol.

Complement (Joy of sets): To say a set is close under some operation $\Diamond$ is to mean that $a,b \in S\rightarrow a\Diamond b \in S$.

## Number of solutions of a linear system

本章：① examine how many sols a system of linear equations can possibly can. ② Then we will present some definitions and rules of matrix algebra.

A system of equa. is said to be consistent if it has at least $1$ sol; inconsistent: no sol (iff rref of its augmented matrix contains $\begin{pmatrix}
0 & \ldots & 0 & | & c
\end{pmatrix}$ with $c \neq 0$).

If consistent, either infinitely many sols (at least one free variable) or exactly one sol (if all variables are leading).

> **Definition: The rank of a matrix**
>
> The number of leading $1$′s in $\text{rref}(A)$ is denoted $\text{rank}(A)$. For $A = \begin{pmatrix}
> 1 & 2 & 3 \\
> 4 & 5 & 6 \\
> 7 & 8 & 9
> \end{pmatrix}$, $\text{rref}(A) = \begin{pmatrix}
> 1 & 0 & {- 1} \\
> 0 & 1 & 2 \\
> 0 & 0 & 0
> \end{pmatrix}$, so $\text{rank}(A) = 2$.

For an $n \times m$ coefficient matrix $A$ and the $n \times \left( {m + 1} \right)$ augmented matrix $\left\lbrack A \middle| b \right\rbrack$:

1.  $\text{rank}(A) \leq m$ and $\text{rank}(A) \leq n$.
2.  If the system is inconsistent, $\text{rank}(A) < n$.
3.  If the system has one sol, $\text{rank}(A) = m$.
4.  If the system has infin sols, $\text{rank}(A) < m$.

If system inconsistent, rref of augmented matrix contains a row $\left\lbrack 0\ldots 0 \middle| 1 \right\rbrack$, so no leading $1$ in that row for the coefficient part. Number of variables = total number of variables $-$ number of leading variables $= m - \text{rank}(A)$. Thus exactly one sol gives $m - \text{rank}(A) = 0$, whereas infinitely many sols gives $m - \text{rank}(A) > 0$.

As contrapositive: (1) if $\text{rank}(A) = n$, the system has a sol; (2) if $\text{rank}(A) < m$, the system has no sol or infin sols; (3) if $\text{rank}(A) = m$, the system has no sol or exactly one sol.

> **Theorem: Number of equations vs. number of unknowns**
>
> If a linear system has exactly one sol, then it has at least as many equations as variables (i.e. $m \leq n$ for coefficient matrix $A^{n \times m}$). Its contrapositive: a linear system with fewer equations than variables ($n < m$) has either no sol or infin sols.

To illustrate it: consider $2$ linear equations in $3$ variables. 每个 $ax + by + cz = d$ 都表示一个 plane，而两个 plane 要么平行无交点，要么交于一直线 (infin sols)，不可能只有一个交点。

## WS 3, pp. 2--3: matrix algebra and linear combinations

> **Definition: Sum and scalar multiples of matrices**
>
> For same-size matrices, addition is entrywise; for $k \in \mathbb{R}$, multiplication by $k$ multiplies every entry by $k$.

> **Definition: Dot products of vectors**
>
> For $v = < v_{1},\ldots,v_{n} >$ and $w = < w_{1},\ldots,w_{n} >$, $v \cdot w = v_{1}w_{1} + v_{2}w_{2} + \ldots + v_{n}w_{n}$. Note that the definition is not row-column-sensitive; it does not distinguish between row and col vectors.

> **Definition: The product of $Ax$**
>
> Let $A$ be an $n \times m$ matrix with row vectors $w_{1},\ldots,w_{n}$ and let $x \in \mathbb{R}^{m}$. Then $Ax = \begin{pmatrix}
> {w_{1} \cdot x} \\
> \ldots \\
> {w_{n} \cdot x}
> \end{pmatrix}$. In words, the $i$th component of $Ax$ is the dot product of the $i$th row of $A$ with $x$.

Example: $\begin{pmatrix}
1 & 2 & 3 \\
1 & 0 & {- 1}
\end{pmatrix}\begin{pmatrix}
3 \\
1 \\
2
\end{pmatrix} = \begin{pmatrix}
{3 + 2 + 6} \\
{3 + 0 - 2}
\end{pmatrix} = \begin{pmatrix}
11 \\
1
\end{pmatrix}$. The product $Ax$ is defined only when the num of col of $A$ equals the num of components in $x$.

> **Theorem: $Ax$ in terms of columns of $A$**
>
> Let the columns of $A$ be $v_{1},\ldots,v_{m}$. Then $Ax = x_{1}v_{1} + x_{2}v_{2} + \ldots + x_{m}v_{m}$.

> **Definition: Linear combination**
>
> A vector $b \in \mathbb{R}^{n}$ is called a linear combination of vectors $v_{1},\ldots,v_{m} \in \mathbb{R}^{n}$ if there are scalars $x_{1},\ldots,x_{m}$ such that $b = x_{1}v_{1} + \ldots + x_{m}v_{m}$.

Example: is $b = \begin{pmatrix}
1 \\
1 \\
1
\end{pmatrix}$ a linear combination of $v = \begin{pmatrix}
1 \\
2 \\
3
\end{pmatrix}$ and $w = \begin{pmatrix}
4 \\
5 \\
6
\end{pmatrix}$? Solve $\begin{pmatrix}
1 \\
1 \\
1
\end{pmatrix} = x\begin{pmatrix}
1 \\
2 \\
3
\end{pmatrix} + y\begin{pmatrix}
4 \\
5 \\
6
\end{pmatrix} = \begin{pmatrix}
{x + 4y} \\
{2x + 5y} \\
{3x + 6y}
\end{pmatrix}$. Row reduction gives $x = - \frac{1}{3}$, $y = \frac{1}{3}$, hence $b = - \frac{1}{3}v + \frac{1}{3}w$.

> **Theorem: Algebraic rule for $Ax$**
>
> If $A$ is an $n \times m$ matrix, $x,y \in \mathbb{R}^{m}$, and $k$ is a scalar, then $A\left( {x + y} \right) = Ax + Ay$ and $A\left( {kx} \right) = k\left( {Ax} \right)$.

> **Theorem: Matrix form of a linear system**
>
> With augmented matrix $\left\lbrack A \middle| \ b \right\rbrack$, a linear system can be written $Ax = b$. Its $i$th component is $a_{i1}x_{1} + \ldots + a_{im}x_{m} = b_{i}$, the $i$th equation. For $3x_{1} + x_{2} = 7$, $x_{1} + 2x_{2} = 4$: $\begin{pmatrix}
> 3 & 1 \\
> 1 & 2
> \end{pmatrix}\begin{pmatrix}
> x_{1} \\
> x_{2}
> \end{pmatrix} = \begin{pmatrix}
> 7 \\
> 4
> \end{pmatrix}$, equivalently $x_{1}\begin{pmatrix}
> 3 \\
> 1
> \end{pmatrix} + x_{2}\begin{pmatrix}
> 1 \\
> 2
> \end{pmatrix} = \begin{pmatrix}
> 7 \\
> 4
> \end{pmatrix}$.
>
> For $2x_{1} - 3x_{2} + 5x_{3} = 7$, $9x_{1} + 4x_{2} - 6x_{3} = 8$: $\begin{pmatrix}
> 2 & {- 3} & 5 \\
> 9 & 4 & {- 6}
> \end{pmatrix}\begin{pmatrix}
> x_{1} \\
> x_{2} \\
> x_{3}
> \end{pmatrix} = \begin{pmatrix}
> 7 \\
> 8
> \end{pmatrix}$. 如果我们可以 divide by matrix $A$，$x = \frac{b}{A}$，就能直接解 $x$。 换言之我们是否能够找到 $A^{- 1}$ 呢？ Chapter 2.

# Linear transformations

## WS 4, p. 1: coordinate encoding and standard matrices

现在你的位置为 $5^{○}\text{E},42^{○}\text{N}$。用一个 vector $\begin{pmatrix}
5 \\
42
\end{pmatrix} \in \mathbb{R}^{2}$ 表示方位。现在你使用一个 encode 来加密你的方位：

$$
\left\{ \begin{matrix}
{y_{1} = x_{1} + 3x_{2}} \\
{y_{2} = 2x_{1} + 5x_{2}}
\end{matrix} \right.,\quad\begin{pmatrix}
y_{1} \\
y_{2}
\end{pmatrix} = \begin{pmatrix}
1 & 3 \\
2 & 5
\end{pmatrix}\begin{pmatrix}
x_{1} \\
x_{2}
\end{pmatrix}.
$$

这个加密方位的码为 $\begin{pmatrix}
131 \\
220
\end{pmatrix}$. 我们做了一个 transformation，使得 the same $\left( {y_{1},y_{2}} \right)$ but 坐标不变。例如 $\left( {0,1} \right)$ 从 $\left( {x_{1},x_{2}} \right)$ 坐标 map 到 $\left( {y_{1},y_{2}} \right)$ 坐标后仍是 $\left( {0,1} \right)$；但 $\left( {y_{1},y_{2}} \right)$ 下的 $\left( {3,5} \right)$ 同样在 $\left( {x_{1},x_{2}} \right)$ 下为 $\left( {3,5} \right)$，而 $\left( {y_{1},y_{2}} \right)$ 下的 $\left( {5,42} \right)$ 在 $\left( {x_{1},x_{2}} \right)$ 下为 $\left( {131,220} \right)$。The source sketch marks these corresponding points and axes.

> **Definition: Linear transformations**
>
> A function $T:\mathbb{R}^{m}\rightarrow\mathbb{R}^{n}$ is called a linear transformation if for every $x \in \mathbb{R}^{m}$ there is an $n \times m$ matrix $A$ such that $T(x) = Ax$.
>
> Example: $y = x_{1}^{2} + x_{2}^{2} + x_{3}^{2}$ has input $\begin{pmatrix}
> x_{1} \\
> x_{2} \\
> x_{3}
> \end{pmatrix}$ and output $\lbrack y\rbrack$; $A = \begin{pmatrix}
> x_{1} & x_{2} & x_{3}
> \end{pmatrix}$. 可以发现 $y = x \cdot x$ is not a linear transformation of $x$.

> **Definition: Identity matrix**
>
> Identity matrix, denoted by $I_{n}$: $I_{2} = \begin{pmatrix}
> 1 & 0 \\
> 0 & 1
> \end{pmatrix}$ and $I_{3} = \begin{pmatrix}
> 1 & 0 & 0 \\
> 0 & 1 & 0 \\
> 0 & 0 & 1
> \end{pmatrix}$.
>
> For $T(x) = \begin{pmatrix}
> 0 & {- 1} \\
> 1 & 0
> \end{pmatrix}x$, $T\left( \begin{pmatrix}
> 1 \\
> 1
> \end{pmatrix} \right) = \begin{pmatrix}
> {- 1} \\
> 1
> \end{pmatrix}$ and $T\left( \begin{pmatrix}
> 0 \\
> {- 2}
> \end{pmatrix} \right) = \begin{pmatrix}
> 2 \\
> 0
> \end{pmatrix}$; it is a counterclockwise rotation by $90$ degrees. Also $x$ and $T(x)$ have the same length: $\sqrt{x_{1}^{2} + x_{2}^{2}} = \sqrt{\left( {- x_{2}} \right)^{2} + x_{1}^{2}}$. The source diagram labels the two arrows $x$ and $T(x)$.

For $T(x) = Ax$ with $A = \begin{pmatrix}
1 & 2 & 3 \\
4 & 5 & 6 \\
7 & 8 & 9
\end{pmatrix}$, $T\left( \begin{pmatrix}
1 \\
0 \\
0
\end{pmatrix} \right) = \begin{pmatrix}
1 \\
4 \\
7
\end{pmatrix}$ and $T\left( \begin{pmatrix}
0 \\
1 \\
0
\end{pmatrix} \right) = \begin{pmatrix}
2 \\
5 \\
8
\end{pmatrix}$.

## WS 4, p. 2: linearity, bases, and transition matrices

> **Theorem: Standard matrix**
>
> Consider a linear transformation $T:\mathbb{R}^{m}\rightarrow\mathbb{R}^{n}$. Let $e_{i}$ be the vector whose $i$th component is $1$ and all other components are $0$. Then $A = \begin{pmatrix}
> {T\left( e_{1} \right)} & {T\left( e_{2} \right)} & \ldots & {T\left( e_{m} \right)}
> \end{pmatrix}$. Equivalently, $e_{1},e_{2},\ldots,e_{m}$ is the standard vector of $\mathbb{R}^{n}$ (而 $\mathbb{R}^{3}$ 中的 $e_{1},e_{2},e_{3}$ 都用 $i,j,k$ 来 denote).

> **Theorem: Linearity test**
>
> A transformation $T:\mathbb{R}^{m}\rightarrow\mathbb{R}^{n}$ is linear iff (a) $\forall v,w \in \mathbb{R}^{m}$, $T\left( {v + w} \right) = T(v) + T(w)$; and (b) $\forall v \in \mathbb{R}^{m}$ and scalar $k$, $T\left( {kv} \right) = kT(v)$.

> **Definition: Distribution vectors and transition matrices**
>
> A vector $x \in \mathbb{R}^{n}$ is said to be a distribution vector if its components (1) sum to $1$ and (2) are all $\geq 0$. A square matrix $A$ is a transition matrix if its col vectors are distribution vectors.

# Geometry of linear transformations

## WS 5, p. 1: examples, scaling, and projection

在 2-1 我们知道 $\begin{pmatrix}
0 & {- 1} \\
1 & 0
\end{pmatrix}$ 是 $\mathbb{R}^{2}$ 中 counter clockwise 转 $90$ 度的 linear transformation。现在再看几个：

$$
A = \begin{pmatrix}
2 & 0 \\
0 & 2
\end{pmatrix},\quad B = \begin{pmatrix}
1 & 0 \\
0 & 0
\end{pmatrix},\quad C = \begin{pmatrix}
{- 1} & 0 \\
0 & 1
\end{pmatrix},
$$
$$
D = \begin{pmatrix}
0 & 1 \\
{- 1} & 0
\end{pmatrix},\quad E = \begin{pmatrix}
1 & 0.2 \\
0 & 1
\end{pmatrix},\quad F = \begin{pmatrix}
1 & {- 1} \\
1 & 1
\end{pmatrix}.
$$

The source diagrams apply them to $\left( {1,2} \right)$ and $\left( {1, - 1} \right)$:

- $A$: 放大一倍, sending them to $\left( {2,4} \right)$ and $\left( {- 2, - 2} \right)$.
- $B$: orthogonal projection onto $x$-axis, sending both to $\left( {1,0} \right)$.
- $C$: reflection about $y$-axis.
- $D$: clockwise 转 $90$ degrees, sending them to $\left( {- 2, - 1} \right)$ and $\left( {1, - 1} \right)$.
- $E$: 向右 shear, sending them to $\left( {1.4,2} \right)$ and $\left( {0.8, - 1} \right)$.
- $F$: counterclockwise shift + 放大 $\sqrt{2}$ 倍, sending them to $\left( {- 1,3} \right)$ and $\left( {2,0} \right)$.

> **Theorem: Scalings**
>
> $\begin{pmatrix}
> k & 0 \\
> 0 & k
> \end{pmatrix}$ defines a scaling by $k$, since $\begin{pmatrix}
> k & 0 \\
> 0 & k
> \end{pmatrix}\begin{pmatrix}
> x_{1} \\
> x_{2}
> \end{pmatrix} = \begin{pmatrix}
> {kx_{1}} \\
> {kx_{2}}
> \end{pmatrix} = k\begin{pmatrix}
> x_{1} \\
> x_{2}
> \end{pmatrix} = kx$.

> **Definition: Orthogonal projection**
>
> Consider a line $L$ in coordinate plane, 经过 $\left( {0,0} \right)$. 任何 $x \in \mathbb{R}^{2}$ 都可以写成 $x = x^{\parallel} + x^{\perp}$, where $x^{\parallel}\ \|\ L$ and $x^{\perp} \perp L$. The transformation $T(x) = x^{\parallel}$ is the orthogonal projection of $x$ onto $L$, denoted $\text{proj}_{L{(x)}}$.
>
> 随意取 $w\ \|\ L$, $\text{proj}_{L{(x)}} = \frac{x \cdot w}{w \cdot w}w$. 特别地，如果 $w$ 是 unit vector $u = \begin{pmatrix}
> u_{1} \\
> u_{2}
> \end{pmatrix}\ \|\ L$, then $\text{proj}_{L{(x)}} = \left( {x \cdot u} \right)u$. 这一个 transformation 是 linear 的；with matrix $P = \begin{pmatrix}
> u_{1}^{2} & {u_{1}u_{2}} \\
> {u_{1}u_{2}} & u_{2}^{2}
> \end{pmatrix}$.

> **Definition: Reflection**
>
> Consider a line $L$ in coordinate plane, 过 $\left( {0,0} \right)$, and write $x = x^{\parallel} + x^{\perp}$. Then $T(x) = x^{\parallel} - x^{\perp}$ is reflection of $x$ about $L$, denoted $\text{ref}_{L{(x)}}$. 由 Definition 2.2.1, $\text{ref}_{L{(x)}} = x^{\parallel} - \left( {x - x^{\parallel}} \right) = 2\text{proj}_{L{(x)}} - x = \left( {2P - I_{2}} \right)x$.

The matrix of $T$ has form $\begin{pmatrix}
a & b \\
b & {- a}
\end{pmatrix}$ where $a^{2} + b^{2} = 1$: $S = 2P - I_{2} = \begin{pmatrix}
{2u_{1}^{2} - 1} & {2u_{1}u_{2}} \\
{2u_{1}u_{2}} & {2u_{2}^{2} - 1}
\end{pmatrix} = \begin{pmatrix}
{u_{1}^{2} - u_{2}^{2}} & {2u_{1}u_{2}} \\
{2u_{1}u_{2}} & {u_{2}^{2} - u_{1}^{2}}
\end{pmatrix}$.

## WS 5, p. 2: rotations and shearing

> **Theorem: Rotations**
>
> $T(x) = Ax$ is a counterclockwise rotation in $\mathbb{R}^{2}$ (rotate by $\theta$) iff $A = \begin{pmatrix}
> {\cos(\theta)} & {- \sin(\theta)} \\
> {\sin(\theta)} & {\cos(\theta)}
> \end{pmatrix} = \begin{pmatrix}
> a & {- b} \\
> b & a
> \end{pmatrix}$, where $a^{2} + b^{2} = 1$.

For a nonzero vector $x$, write its coordinate in polar form $\left( {r\cos(\varphi),r\sin(\varphi)} \right)$. Rotation gives $x' = \left( {r\cos\left( {\varphi + \theta} \right),r\sin\left( {\varphi + \theta} \right)} \right)$, so $x_{1'} = x\cos(\theta) - y\sin(\theta)$ and $y' = x\sin(\theta) + y\cos(\theta)$, which gives the displayed matrix.

> **Theorem: Rotations combined with a scaling**
>
> 将 $v \in \mathbb{R}^{2}$ counterclockwise rotate $\theta$ 并放大至 $r$ 倍. Let $T\left( {a,b} \right) = \begin{pmatrix}
> {r\cos(\theta)} \\
> {r\sin(\theta)}
> \end{pmatrix}$. Then $T(x) = Ax$, $A = \begin{pmatrix}
> a & {- b} \\
> b & a
> \end{pmatrix} = r\begin{pmatrix}
> {\cos(\theta)} & {- \sin(\theta)} \\
> {\sin(\theta)} & {\cos(\theta)}
> \end{pmatrix}$.

## 5. Shearing

Vertical shear:

$$
T\left( \begin{pmatrix}
x_{1} \\
x_{2}
\end{pmatrix} \right) = \begin{pmatrix}
x_{1} \\
{kx_{1} + x_{2}}
\end{pmatrix} = \begin{pmatrix}
1 & 0 \\
k & 1
\end{pmatrix}\begin{pmatrix}
x_{1} \\
x_{2}
\end{pmatrix}.
$$

Horizontal shear:

$$
T\left( \begin{pmatrix}
x_{1} \\
x_{2}
\end{pmatrix} \right) = \begin{pmatrix}
{x_{1} + kx_{2}} \\
x_{2}
\end{pmatrix} = \begin{pmatrix}
1 & k \\
0 & 1
\end{pmatrix}\begin{pmatrix}
x_{1} \\
x_{2}
\end{pmatrix}.
$$

> **Theorem: Horizontal and vertical shearing**
>
> Horizontal shearing of slope $kx_{2}$ has matrix $\begin{pmatrix}
> 1 & k \\
> 0 & 1
> \end{pmatrix}$; vertical shearing of slope $kx_{1}$ has matrix $\begin{pmatrix}
> 1 & 0 \\
> k & 1
> \end{pmatrix}$.

The source's concluding table records:

- Scaling by $k$: $kI_{2} = \begin{pmatrix}
  k & 0 \\
  0 & k
  \end{pmatrix}$.
- Orthogonal projection onto line $L$: $\begin{pmatrix}
  u_{1}^{2} & {u_{1}u_{2}} \\
  {u_{1}u_{2}} & u_{2}^{2}
  \end{pmatrix}$, for $u\ \|\ L$ and $\left\| u \right\| = 1$.
- Reflection about line $L$: $\begin{pmatrix}
  {2u_{1}^{2} - 1} & {2u_{1}u_{2}} \\
  {2u_{1}u_{2}} & {2u_{2}^{2} - 1}
  \end{pmatrix}$.
- Rotation through angle $\theta$ (逆时针): $\begin{pmatrix}
  {\cos(\theta)} & {- \sin(\theta)} \\
  {\sin(\theta)} & {\cos(\theta)}
  \end{pmatrix}$.
- Rotation through $\theta$ with scaling by $r$: $r\begin{pmatrix}
  {\cos(\theta)} & {- \sin(\theta)} \\
  {\sin(\theta)} & {\cos(\theta)}
  \end{pmatrix}$.
- Shear: horizontal $\begin{pmatrix}
  1 & k \\
  0 & 1
  \end{pmatrix}$; vertical $\begin{pmatrix}
  1 & 0 \\
  k & 1
  \end{pmatrix}$.

# Gram--Schmidt and QR factorization

## WS 17, p. 1: proof of QR factorization

Let $M = \begin{pmatrix}
m_{1} & \ldots & m_{d}
\end{pmatrix}$ be $n \times d$. Gram--Schmidt produces $Q = \begin{pmatrix}
q_{1} & \ldots & q_{d}
\end{pmatrix}$:

$$
q_{1} = \frac{m_{1}}{\left\| m_{1} \right\|},
$$
$$
q_{i} = \frac{m_{i} - \sum_{k = 1}^{i - 1}\left( {m_{i} \cdot q_{k}} \right)q_{k}}{\left\| {m_{i} - \sum_{k = 1}^{i - 1}\left( {m_{i} \cdot q_{k}} \right)q_{k}} \right\|}.
$$

The $\left( {q_{1},\ldots,q_{d}} \right)$ are orthonormal. 因而 $Q$ is an orthogonal matrix, and

$$
S_{M\rightarrow Q} = \begin{pmatrix}
\left\lbrack m_{1} \right\rbrack_{Q} & \ldots & \left\lbrack m_{d} \right\rbrack_{Q}
\end{pmatrix}.
$$

The worksheet computes

$$
Q^{t}M = \begin{pmatrix}
{m_{1} \cdot q_{1}} & {m_{2} \cdot q_{1}} & \ldots & {m_{d} \cdot q_{1}} \\
{m_{1} \cdot q_{2}} & {m_{2} \cdot q_{2}} & \ldots & \\
\ldots & \ldots & {m_{d} \cdot q_{d}} &
\end{pmatrix}.
$$

Because $q_{i} \perp \text{span}\left( {m_{1},\ldots,m_{i - 1}} \right)$, the entry $q_{i} \cdot m_{j}$ is $0$ when $i > j$; the result is upper triangular. Thus $M = QR$, with $R = Q^{t}M$ upper triangular.

## Proof of matrix product theorem

For ordered bases $B = \left( {b_{1},\ldots,b_{d}} \right)$ and $A = \left( {a_{1},\ldots,a_{d}} \right)$ of $W \subseteq \mathbb{R}^{n}$:

$$
\begin{pmatrix}
b_{1} & \ldots & b_{d}
\end{pmatrix} = \begin{pmatrix}
a_{1} & \ldots & a_{d}
\end{pmatrix}S_{B\rightarrow A},
$$

where

$$
S_{B\rightarrow A} = \begin{pmatrix}
\left\lbrack b_{1} \right\rbrack_{A} & \ldots & \left\lbrack b_{d} \right\rbrack_{A}
\end{pmatrix}.
$$

Note that if $b_{i} = c_{1}a_{1} + \ldots + c_{d}a_{d}$, then $\left\lbrack b_{i} \right\rbrack_{A} = \begin{pmatrix}
c_{1} \\
\ldots \\
c_{d}
\end{pmatrix}$; hence

$$
AS_{B\rightarrow A} = \begin{pmatrix}
{A\left\lbrack b_{1} \right\rbrack}_{A} & \ldots & {A\left\lbrack b_{d} \right\rbrack}_{A}
\end{pmatrix} = \begin{pmatrix}
b_{1} & \ldots & b_{d}
\end{pmatrix} = B.
$$

# Orthogonal transformations

## WS 18, p. 1: definition and matrix criteria

> **Definition: Orthogonal transformation**
>
> $T:\mathbb{R}^{n}\rightarrow\mathbb{R}^{n}$ is orthogonal (正交变换) if it preserves dot products: $\forall x,y \in \mathbb{R}^{n}$, $x \cdot y = T(x) \cdot T(y)$.

> **Theorem: Equivalent characterizations**
>
> $T:\mathbb{R}^{n}\rightarrow\mathbb{R}^{n}$ is orthogonal iff it preserves the length of vectors: $\forall x \in \mathbb{R}^{n}$, $\left\| {T(x)} \right\| = \left\| x \right\|$.

因而 linear trans 保留 dot product iff 保留 length. The proof expands $\left\| {T\left( {x + y} \right)} \right\|^{2} = \left\| {x + y} \right\|^{2}$:

$$
\left\| {T(x)} \right\|^{2} + 2T(x) \cdot T(y) + \left\| {T(y)} \right\|^{2} = \left\| x \right\|^{2} + 2x \cdot y + \left\| y \right\|^{2},
$$

then cancels equal norm terms.

\(a\) An orthogonal trans $T$ is injective: $T(x) = 0\rightarrow\left\| {T(x)} \right\| = 0\rightarrow\left\| x \right\| = 0$, so $\text{ker}\ T = \left\{ 0 \right\}$ and $T$ is inj. (b) It is an isomorphism because a same-dimension linear trans is inj iff surj. (c) The standard matrix of $T$ has orthonormal columns. (d) The composition of orthogonal trans is orthogonal, since

$$
\left\| {T_{k} \cdot T_{k - 1} \cdot \ldots \cdot T_{1}(x)} \right\| = \ldots = \left\| x \right\|.
$$

> **Definition: Orthogonal matrix**
>
> A square matrix $A$ is orthogonal if $A^{t}A = I_{n}$ (即 $A^{t} = A^{- 1}$).

If $A = \begin{pmatrix}
v_{1} & \ldots & v_{n}
\end{pmatrix}$, then the $ij$th entry of $A^{t}A$ is $v_{i} \cdot v_{j}$. Therefore $A$ is orthogonal iff its cols are orthonormal. 我们也由此知道：由 orthonormal basis 组成的 matrix $A$， $A^{- 1}$ 就是 $A^{t}$.

The worksheet proves $\left( {AB} \right)^{t} = B^{t}A^{t}$: the $ij$th entry of $AB$ is the $i$th row of $A$ dot the $j$th col of $B$, while the $ij$th entry of $B^{t}A^{t}$ is $b_{i} \cdot a_{j}$. Thus they agree.

## WS 18, p. 2: products and change of basis

If $A$ is orthogonal, then $A^{- 1}$ (也是 $A^{t}$) is orthogonal, since ${\mathbb{A}}^{t} = I_{n}$ implies $\left( A^{t} \right)\left( A^{t} \right)^{t} = {\mathbb{A}}^{t} = I_{n}$. 结论：这意味着对于 $A$ 的 cols 是 orthonormal 的，那 $A$ 的 rows 也是 orthonormal 的.

> **Theorem: Products of orthogonal matrices**
>
> If $A,B$ are orthogonal $n \times n$ matrices, then $AB$ is orthogonal.

Indeed,

$$
\left( {AB} \right)\left( {AB} \right)^{t} = A\left( {BB^{t}} \right)A^{t} = I_{n},
$$

so $\left( {AB} \right)^{t} = \left( {AB} \right)^{- 1}$.

> **Theorem: Orthogonal maps and their matrices**
>
> $T:\mathbb{R}^{n}\rightarrow\mathbb{R}^{n}$ is orthogonal iff $\lbrack T\rbrack_{\varepsilon}$ is orthogonal, where $\varepsilon$ is the standard basis. More generally, $T$ is orthogonal iff $\lbrack T\rbrack_{\beta}$ is orthogonal for any orthonormal basis $\beta$.

For the reverse direction,

$$
T(a) \cdot T(b) = \left( {\lbrack T\rbrack_{\varepsilon}a} \right)\dot{\lbrack T\rbrack_{\varepsilon}b} = a_{\varepsilon_{\varepsilon}^{t{\lbrack T\rbrack}}}^{t{\lbrack T\rbrack}}b = a \cdot b.
$$

Claim 1: If $A,B$ are orthonormal basis matrices, their change-of-basis matrices are orthogonal. On WS 16, the entries are

$$
S_{A\rightarrow B} = \begin{pmatrix}
{a_{1} \cdot b_{1}} & {a_{2} \cdot b_{1}} & \ldots & {a_{n} \cdot b_{1}} \\
{a_{1} \cdot b_{2}} & \ldots & & \\
\ldots & \ldots & {a_{n} \cdot b_{n}} &
\end{pmatrix}
$$

and

$$
S_{B\rightarrow A} = \begin{pmatrix}
{b_{1} \cdot a_{1}} & {b_{2} \cdot a_{1}} & \ldots \\
\ldots & \ldots & {b_{n} \cdot a_{n}}
\end{pmatrix} = S_{A\rightarrow B}^{t}.
$$

Thus $S_{A\rightarrow B} = S_{B\rightarrow A}^{- 1}$.

## WS 18, p. 3: conclusion

Claim 2: orthogonal matrices 的 product 也是 orthogonal matrix. 这是因为 orthogonal transformations 的 composition 也是 orthogonal transformation， 且它的自身的 matrix 代表为 orthogonal matrix。

Claim 3: 如果 $T$ orthogonal，则 $\lbrack T\rbrack_{\beta}$ orthogonal for 任意 orthonormal basis $\beta$:

$$
\lbrack T\rbrack_{\beta} = S_{\varepsilon\rightarrow\beta}\lbrack T\rbrack_{\varepsilon}S_{\beta\rightarrow\varepsilon}.
$$

All three factors are orthogonal, hence so is $\lbrack T\rbrack_{\beta}$.

Claim 4: $\beta$ 为任意 orthonormal basis; 如果 $\lbrack T\rbrack_{\beta}$ orthogonal，则 $T$ orthogonal. Since

$$
\lbrack T\rbrack_{\beta} = S_{\varepsilon\rightarrow\beta}\lbrack T\rbrack_{\varepsilon}S_{\beta\rightarrow\varepsilon},
$$

we obtain

$$
\lbrack T\rbrack_{\varepsilon} = S_{\beta\rightarrow\varepsilon}\lbrack T\rbrack_{\beta}S_{\varepsilon\rightarrow\beta},
$$

a product of orthogonal matrices; hence $\lbrack T\rbrack_{\varepsilon}$ is orthogonal and therefore $T$ is orthogonal.

总结：$T$ is orthogonal (保留 dot product) $= T$ 保留 length $= T$ 保留 distance $= T$ 把 $\mathbb{R}^{n}$ 的某个 orthonormal basis map 到另一个 orthonormal basis $= \lbrack T\rbrack_{\beta}$ 为 orthogonal 的，$\beta$ 为任意 orthonormal basis $= \lbrack T\rbrack_{\beta}$ 的 rows/cols 为一个 orthonormal basis of $\mathbb{R}^{n}$.

# Least squares

## WS 19, p. 1: projection and image/kernel theorem

> **Theorem: Projection and least squares**
>
> 对于任意 subspace $V \subseteq \mathbb{R}^{n}$, $\forall x \in \mathbb{R}^{n}$, $\text{proj}_{V{(x)}}$ is $V$ 中离 $x$ 最近的 vector, i.e. $v \in V$, $\left\| {x - \text{proj}_{V{(x)}}} \right\| \leq \left\| {x - v} \right\|$.

The source diagram labels $\left\| {x - \text{proj}_{V{(x)}}} \right\|$ as the 垂直距离.

\(a\) $Ax = b$ is consistent iff $b \in \text{im}A$: if $\exists x$ such that $Ax = b$, then $b \in \text{im}A$, and conversely. (b) 不可能 $b$ 不在 $\text{span}\left( \text{cols of A} \right)$ 而 $Ax = b$ be consistent. (c), least squares solutions: if $Ax = b$ is not consistent, let $V = \text{im}A$, $b' = \text{proj}_{V{(b)}}$. Then $Ax = b'$ has a solution because $b' \in V$; the solutions in that solution set are the least squares solution to this system.

The worksheet also records

$$
Ax \cdot y = \left( {Ax} \right)^{t}y = x^{t}A^{t}y = x \cdot \left( {A^{t}y} \right).
$$

> **Theorem: Image-kernel orthogonality**
>
> For an $m \times n$ matrix $A$, $\text{ker}\left( A^{t} \right) = \left( {\text{im}A} \right)^{\perp}$.

Write $A = \begin{pmatrix}
v_{1} & \ldots & v_{n}
\end{pmatrix}$, so $A^{t} = \begin{pmatrix}
v_{1}^{t} \\
\ldots \\
v_{n}^{t}
\end{pmatrix}$. If $x \in \text{ker}\ A^{t}$, then $v_{i} \cdot x = 0$ for every $i$, so $x \perp \text{im}A$. Conversely, if $x{\in \left( {\text{im}A} \right)}^{\perp}$, then every $v_{i} \cdot x = 0$, so $A^{t}x = 0$.

A second proof uses the displayed transpose identity: $y \in \text{ker}\ A^{t}\rightarrow Ax \cdot y = 0$ for all $x$, hence $y{\in \left( {\text{im}A} \right)}^{\perp}$; conversely $Ax \cdot y = 0$ for all $x$ implies $A^{t}y = 0$.

Consequently $\left( {\text{ker}\ A^{t}} \right)^{\perp} = \text{im}A$, and $\text{ker}\ A = \left( {\text{im}A^{t}} \right)^{\perp}$. The rank computation is

$$
\text{rank}\left( A^{t} \right) = n - \text{dim}\left( {\text{ker}\ A^{t}} \right) = \text{dim}\left( {\text{im}A} \right) = \text{rank}(A).
$$

## WS 19, p. 2: normal equations

The normal equation: $Ax = b$ 的 least square 解当且仅当 $Ax = \text{proj}(b)$ is a solution of

$$
A^{t}Ax = A^{t}b.
$$

> **Theorem: Kernel of $A^{t}A$**
>
> For an $m \times n$ matrix $A$, $\text{ker}\ A = \text{ker}\left( {A^{t}A} \right)$.

If $x \in \text{ker}\left( {A^{t}A} \right)$, then $A^{t}Ax = 0$, so $Ax \in \text{ker}\ A^{t} = \left( {\text{im}A} \right)^{\perp}$. Since $Ax \in \text{im}A$ and $\text{im}A$ 与 $\left( {\text{im}A} \right)^{\perp}$ only meet at $0$, so $Ax = 0$. Conversely $Ax = 0$ directly implies $A^{t}Ax = 0$.

For the rest proof of normal equation, the source diagram records $b - \text{proj}_{\text{im}A}(b){\in \left( {\text{im}A} \right)}^{\perp} = \text{ker}\left( A^{t} \right)$. Thus $Ax - b \in \text{ker}\left( A^{t} \right)$, whence

$$
A^{t{({Ax - b})}} = 0,\quad A^{t}Ax = A^{t}b.
$$

总结：对于 $T_{A}:\mathbb{R}^{n}\rightarrow\mathbb{R}^{m}$, $T_{A^{t}}:\mathbb{R}^{m}\rightarrow\mathbb{R}^{n}$, 使得对于 $x \in \mathbb{R}^{n}$ 及 $y \in \mathbb{R}^{m}$，$\left( {Ax} \right) \cdot y = x\dot{A^{t}y}$ 是 transpose 本质的性质；它告诉我们 $A$ 是 $\mathbb{R}^{n}$ 到 $\mathbb{R}^{m}$ 的 linear map.

# Inner-product spaces

## WS 20, p. 1: examples and generalized Gram--Schmidt

For the inner product space $V$ of functions on $\left\lbrack {- \pi,\pi} \right\rbrack$, $< f,g \geq \frac{1}{\pi}\int_{- \pi}^{\pi}f(t)g(t)\, dt$:

1.  $< f,g \geq < g,f >$.
2.  Linearity: $< af_{1} + bf_{2},g \geq \frac{a}{\pi}\int_{- \pi}^{\pi}f_{1}(t)g(t)\, dt + \frac{b}{\pi}\int_{- \pi}^{\pi}f_{2}(t)g(t)\, dt = a < f_{1},g > + b < f_{2},g >$.
3.  Positive definite: $< f,f \geq \frac{1}{\pi}\int_{- \pi}^{\pi}f^{2}(t)\, dt$, and $f^{2}(t) > 0\rightarrow < f,f \gg 0$.

\(b\) 同 (a)，inner product space $V$. (c) 不是 inner prod space: can diverge, $\infty$ 不在 $\mathbb{R}$.

P4: find two different inner products in $\mathbb{R}^{2}$: $< x,y \geq x_{1}y_{1} + x_{2}y_{2}$ (dot product; here $e_{1},e_{2}$ are orthonormal), and different weight $< x,y \geq 3x_{1}y_{1} + 2x_{2}y_{2}$.

P5: Every finite dimensional inner product space has an orthonormal basis. Take

$$
u_{1} = \frac{v_{1}}{\text{norm}\left( v_{1} \right)},\quad u_{2} = \frac{v_{2} - \left( {v_{2} \cdot u_{1}} \right)u_{1}}{\left\| {v_{2} - \left( {v_{2} \cdot u_{1}} \right)u_{1}} \right\|},
$$

and, in general,

$$
u_{n} = \frac{v_{n} - \sum_{j = 1}^{n - 1}\left( {v_{n} \cdot u_{j}} \right)u_{j}}{\left\| {v_{n} - \sum_{j = 1}^{n - 1}\left( {v_{n} \cdot u_{j}} \right)u_{j}} \right\|}.
$$

proof: generalized Gram--Schmidt.

## WS 20, p. 2: coordinates and matrix inner products

P8: 任选 orthonormal basis $U$ for inner product $< \cdot , \cdot >$. Then $\left( {V, < \cdot , \cdot >} \right)$ 上

$$
< x,y \geq \lbrack x\rbrack_{U} \cdot \lbrack y\rbrack_{U}.
$$

Indeed $x = \sum_{i}a_{i}u_{i}$, $y = \sum_{j}b_{j}u_{j}$, so

$$
< x,y \geq \sum\limits_{i}\sum\limits_{j}a_{i}b_{j} < u_{i},u_{j} > = \sum\limits_{i}a_{i}b_{i} = \lbrack x\rbrack_{U}{\cdot \lbrack y\rbrack}_{U}.
$$

P9: $\forall$ inner product $< \cdot , \cdot >$ on $\mathbb{R}^{n}$, $\exists$ an $n \times n$ symmetric matrix $A$ such that

$$
\forall x,y \in \mathbb{R}^{n}, < x,y \geq x^{t}Ay.
$$

For the standard basis, the $\left( {i,j} \right)$th entry of $A$ is $< e_{i},e_{j} >$. Hence

$$
< x,y \geq \sum\limits_{i}\sum\limits_{j}x_{i}y_{j} < e_{i},e_{j} > = x^{t}Ay.
$$

Because the inner product is symmetric, so is $A$. Its diagonal entries are positive; $A$ is 可逆 (full rank).

P10: All inner products on $\mathbb{R}^{2}$ have

$$
B_{A{({x,y})}} = x^{t}Ay,\quad A = \begin{pmatrix}
a & b \\
b & c
\end{pmatrix},
$$

where (1) $A$ is symmetric; (2) $a > 0$ and $\text{det}\ A = ac - b^{2} > 0$. Indeed

$$
\begin{pmatrix}
x & y
\end{pmatrix}\begin{pmatrix}
a & b \\
b & c
\end{pmatrix}\begin{pmatrix}
x \\
y
\end{pmatrix} = ax^{2} + 2bxy + cy^{2} > 0.
$$

(这个条件等价：充分条件为 $c > 0$ 且 $ac - b^{2} > 0 = \text{det}\ A$.) Linearity is guaranteed by matrix multiplication. 因而这三条为完整条件。

实际上的理解为：把 $\mathbb{R}^{n}$ 的任何 inner product 都是：把一个 vector 做一个 linear trans 后再做一个 dot product.

# Diagonalization and eigenspaces

## WS 23, p. 1: four theorems

> **Theorem: Eigenbasis and diagonal matrix**
>
> For a finite-dimensional vector space $V$, a basis $\beta$ of $V$ is an eigenbasis for $T:V\rightarrow V$ iff $\lbrack T\rbrack_{\beta}$ is diagonal.

Indeed,

$$
\lbrack T\rbrack_{\beta} = \begin{pmatrix}
\left\lbrack {T\left( b_{1} \right)} \right\rbrack_{\beta} & \ldots & \left\lbrack {T\left( b_{n} \right)} \right\rbrack_{\beta}
\end{pmatrix} = \begin{pmatrix}
{\lambda_{1}b_{1}} & \ldots & {\lambda_{n}b_{n}}
\end{pmatrix}.
$$

> **Theorem: Diagonalizable transformation**
>
> $T:V\rightarrow V$ is diagonalizable iff $\lbrack T\rbrack_{\beta}$ is similar to some diagonal matrix $D$.

The definition notes: $T$ diagonalizable iff 其 $D = n \times n$ matrix of $T$ is diagonal. 因而（所有 $\lbrack T\rbrack_{\alpha}$ 都相似于 $\lbrack T\rbrack_{\beta}$）.

> **Theorem: Diagonalizable matrix**
>
> $A \in \mathbb{R}^{n \times n}$ is diagonalizable iff $A$ is similar to some diagonal $D$.

> **Theorem: Eigenspace**
>
> $E_{\lambda} = \text{ker}\left( {T - \lambda I_{n}} \right)$, so $\text{dim}\left( E_{\lambda} \right) = \text{dim}\left( {\text{ker}\left( {T - \lambda I_{n}} \right)} \right) = n - \text{rank}\left( {T - \lambda I_{n}} \right)$.

Proof: $\left( {T - \lambda I} \right)(v) = 0$ iff $T(v) = \lambda I(v) = \lambda v$, so the kernel is exactly the vectors changed only by $T$ stretching by $\lambda$, i.e. the eigenvectors with eigenvalue $\lambda$ together with zero. 没有被 $T - \lambda I$ 改变的 vectors，即只被 $T$ 拉伸 $\lambda$ 倍的 vectors.

(Thm 7.1.3) 如果 $D = \left( {v_{1},\ldots,v_{n}} \right)$ 是 an eigenbasis of $V$ for $T$, then

$$
\lbrack T\rbrack_{D} = S_{D\rightarrow\varepsilon}^{- 1}\lbrack T\rbrack_{\varepsilon}S_{D\rightarrow\varepsilon} = \begin{pmatrix}
\lambda_{1} & \ldots \\
\ldots & \lambda_{n}
\end{pmatrix}.
$$

Proof note: $T_{A{(x)}} = Ax$ ($A = \lbrack T\rbrack_{\varepsilon}$). Then $S_{D\rightarrow\varepsilon} = \begin{pmatrix}
v_{1} & \ldots & v_{n}
\end{pmatrix}$ and

$$
\lbrack T\rbrack_{\varepsilon}S_{D\rightarrow\varepsilon} = \begin{pmatrix}
{Av_{1}} & \ldots & {Av_{n}}
\end{pmatrix} = \begin{pmatrix}
{\lambda_{1}v_{1}} & \ldots & {\lambda_{n}v_{n}}
\end{pmatrix}.
$$

Hence the change of basis yields the diagonal matrix.

# Eigenvalues and eigenspaces

## WS 24, p. 1: characteristic polynomial and multiplicities

> **Theorem: Eigenvalues are roots**
>
> The eigenvalues of $T$ are precisely the roots of its characteristic polynomial.

简明 proof: $\lambda$ 是 $T$ 的 eigenvalue iff $E_{\lambda} \neq \left\{ 0 \right\}$ iff $\text{ker}\left( {T - \lambda I} \right) \neq \left\{ 0 \right\}$ iff nullity$\left( {T - \lambda I} \right) > 0$ iff $\text{rank}\left( {T - \lambda I} \right) < n$ iff $T - \lambda I$ 不可逆 iff $\text{det}\left( {T - \lambda I} \right) = 0$. Thus $\lambda$ is a root of $\text{det}\left( {T - \lambda I} \right) = 0$.

> **Theorem: Distinct-eigenvalue eigenspaces**
>
> $\forall x \in E_{\lambda_{1}}$ 且 $x \neq 0$, and $y \in E_{\lambda_{2}}$ 且 $y \neq 0$, if $\lambda_{1} \neq \lambda_{2}$, then $x,y$ are linearly independent.

因而 eigenbases of distinct eigenspaces have linearly independent union, and if $\sum_{i}\text{dim}\left( E_{\lambda_{i}} \right) = \text{dim}V$, that union is an eigenbasis of $V$ for $T$.

> **Theorem: Geometric and algebraic multiplicity**
>
> For eigenvalue $\lambda$, $\text{gem}(\lambda) \leq \text{alm}(\lambda)$.

Let $A \in \mathbb{R}^{n \times n}$, let $\lambda$ be an eigenvalue and $\text{gem}(\lambda) = m$. Let $\left( {v_{1},\ldots,v_{m}} \right)$ be a basis of $E_{\lambda}$, put $S = \begin{pmatrix}
v_{1} & \ldots & v_{m}
\end{pmatrix}$, and define $B = S^{- 1}AS$. Then for $1 \leq i \leq m$,

$$
Be_{i} = S^{- 1}ASe_{i} = S^{- 1}Av_{i} = S^{- 1}\lambda v_{i} = \lambda e_{i}.
$$

Therefore

$$
B = \begin{pmatrix}
{\lambda I_{m}} & P \\
0 & Q
\end{pmatrix},
$$

so

$$
f_{A{(x)}} = f_{B{(x)}} = \text{det}\left( {B - xI_{n}} \right) = \left( {x - \lambda} \right)^{m}f_{Q{(x)}},
$$

and $\text{alm}(\lambda) \geq m$.

> **Theorem: Degree of the characteristic polynomial**
>
> For $T:V\rightarrow V$, $\chi_{T{(x)}}$ has degree $\text{dim}V$.

This is the corollary of the preceding two theorems: if $T$ has $n$ different eigenvalues, then $\sum_{i}\text{alm}\left( \lambda_{i} \right) \leq \text{dim}V$. Proof: 见 P9.

# Complex eigenvalues

## WS 26, p. 1: complex roots and real $2 \times 2$ matrices

P5(b). Let $z = a + bi$ and $w = c + di$. Then

$$
z + w = \left( {a + c} \right) + \left( {b + d} \right)i,
$$

z w=(a c-b d)+(b c+a d)i$,$

$$
\text{conjugate}(z)\ \text{conjugate}(w) = \left( {a - bi} \right)\left( {c - di} \right) = ac - bd - \left( {bc + ad} \right)i = \text{conjugate}\left( {zw} \right).
$$

\(c\) Fact: $\lambda$ is a root of $f(x)$ iff $\lambda$ is a root when the coefficients of $f(x)$ are real. If $\lambda^{n} + a_{n - 1}\lambda^{n - 1} + \ldots + a_{0} = 0$, then

$$
\sum\limits_{k}a_{k}\lambda^{k} = \text{conjugate}\left( {\sum\limits_{k}a_{k}\lambda^{k}} \right) = 0.
$$

For

$$
A = \begin{pmatrix}
a & {- b} \\
b & a
\end{pmatrix} \in \mathbb{R}^{2 \times 2},
$$
$$
\chi_{A{(\lambda)}} = \left( {a - \lambda} \right)^{2} + b^{2},\quad\chi_{A{(\lambda)}} = 0\rightarrow\lambda = a \pm bi.
$$

\(b\) Factor $A$ into a scalar matrix $rI_{2}$ and a rotation matrix $R_{\theta}$:

$$
A = \sqrt{a^{2} + b^{2}}\begin{pmatrix}
{\cos(\theta)} & {- \sin(\theta)} \\
{\sin(\theta)} & {\cos(\theta)}
\end{pmatrix},
$$

where

$$
\cos(\theta) = \frac{a}{\sqrt{a^{2} + b^{2}}},\quad\sin(\theta) = \frac{b}{\sqrt{a^{2} + b^{2}}},\quad\theta = \arctan\left( \frac{b}{a} \right).
$$

\(c\) Diagonalization over $\text{ℂ}$:

$$
D = \begin{pmatrix}
{a + bi} & 0 \\
0 & {a - bi}
\end{pmatrix}.
$$

For $\lambda_{1} = a + bi$,

$$
\text{det}\left( {A - \lambda_{1}I_{2}} \right) = \text{det}\left( \begin{pmatrix}
{- bi} & {- b} \\
b & {- bi}
\end{pmatrix} \right),
$$

so $\begin{pmatrix}
i \\
1
\end{pmatrix}$ is a basis for $E_{\lambda_{1}}$; similarly $\begin{pmatrix}
{- i} \\
1
\end{pmatrix}$ is a basis for $E_{\lambda_{2}}$. Hence

$$
D = S^{- 1}AS = \begin{pmatrix}
i & {- i} \\
1 & 1
\end{pmatrix}^{- 1}A\begin{pmatrix}
i & {- i} \\
1 & 1
\end{pmatrix},
$$

and

$$
A = \begin{pmatrix}
i & {- i} \\
1 & 1
\end{pmatrix}\begin{pmatrix}
{a + bi} & 0 \\
0 & {a - bi}
\end{pmatrix}\begin{pmatrix}
i & {- i} \\
1 & 1
\end{pmatrix}^{- 1}.
$$

P9: 任何有一对 complex eigenvalue $a \pm bi$ 的 $A \in \mathbb{R}^{2 \times 2}$ 都 similar to $\begin{pmatrix}
a & {- b} \\
b & a
\end{pmatrix}$（一个 scaling matrix）. 因为 $A$ diagonalizable: $D = \begin{pmatrix}
{a + bi} & 0 \\
0 & {a - bi}
\end{pmatrix}$，而 $D$ 又 similar to $\begin{pmatrix}
a & {- b} \\
b & a
\end{pmatrix}$ by P8.

# Spectral theorem

## WS 27, p. 1: theorem and first two claims

> **Theorem: Spectral theorem**
>
> $A$ is orthogonally diagonalizable iff $A$ is symmetric: $\exists S \in \mathbb{R}^{n \times n}$ such that $S^{- 1} = S^{t}$ and $S^{t}AS$ is diagonal iff $A$ is symmetric.

Equivalently, $S$ 的 cols 是 $\mathbb{R}^{n}$ 的一个 orthonormal basis, 且为 $A$ 的 eigenvectors. 普通 diagonalization: $D = SAS^{- 1}$, $S$ 的 cols 为 $V$ 的 一个 eigenbasis $\left( {v_{1},\ldots,v_{n}} \right)$. 而 orthogonal diagonalization: $D = S^{t}AS$, $S$ 的 cols 不但是 eigenbasis，而且还是一个 orthonormal eigenbasis. 这意味着对于不同的 eigenvectors，它们都是 orthogonal 的 （可以为 orthonormal），也就是说 $V,E_{\lambda_{1}},E_{\lambda_{2}}$ with $E_{\lambda_{1}} \perp E_{\lambda_{2}}$.

Claim 1: if $A$ is orthogonally diagonalizable, then $A$ is symmetric. If $S^{t}AS = D$ and $S^{- 1} = S^{t}$, then

$$
A = SDS^{t},
$$

and

$$
A^{t} = \left( {SDS^{t}} \right)^{t} = SD^{t}S^{t} = SDS^{t} = A.
$$

Claim 2: if $A \in \mathbb{R}^{n \times n}$ is symmetric, then $A$ is orthogonally diagonalizable over $\mathbb{R}$. This claim is divided into three parts.

Claim 2 pt.(1): if $A \in \mathbb{R}^{n \times n}$ is symmetric, then $A$ has real eigenvalues. By the fundamental theorem of Algebra, $\chi_{T{(x)}} = 0$ 有 $n$ 个 complex roots 包含重复. Let $\lambda$ be any complex eigenvalue, so $\exists z \in \text{ℂ}^{n}$, $Az = \lambda z$. Then [Ab(..) =\> ..{z}=b(..) =\> ..λb(..) =\> ..{z}]{.math}, and, after transpose, [b(..) =\> ..{z}tA=b(..) =\> ..λb(..) =\> ..{z}t]{.math} because $A$ is symmetric. Multiply $z$ on the right:

[b(..) =\> ..{z}tAz=λ(b(..) =\> ..{z}tz)=b(..) =\> ..λ(b(..) =\> ..{z}tz).]{.math display="block"}

Since [b(..) =\> ..{z}tz=∑i\|zi\|2\>0]{.math}, [λ=b(..) =\> ..λ]{.math}; every complex eigenvalue is real.

Claim 2 pt.(2): consider $\lambda_{1},\lambda_{2}$ and nonzero $v_{1} \in E_{\lambda_{1}}$, $v_{2} \in E_{\lambda_{2}}$, with $\lambda_{1} \neq \lambda_{2}$. Then

$$
\lambda_{1}v_{1}^{t}v_{2} = \left( {Av_{1}} \right)^{t}v_{2} = v_{1}^{t}A^{t}v_{2} = v_{1}^{t{({Av_{2}})}} = \lambda_{2}v_{1}^{t}v_{2}.
$$

Thus $v_{1} \cdot v_{2} = 0$, so $v_{1} \perp v_{2}$.

## WS 27, p. 2: induction proof

Claim 2 pt.(3): if $A \in \mathbb{R}^{n \times n}$ is symmetric, then $A$ is orthogonally diagonalizable. Prove by induction.

Base case: a $1 \times 1$ matrix is diagonal and symmetric. Inductive step: if every symmetric $n \times n$ matrix is orthogonally diagonalizable, then every $\left( {n + 1} \right) \times \left( {n + 1} \right)$ matrix is too.

Let $A \in \mathbb{R}^{{({n + 1})} \times {({n + 1})}}$ be symmetric. Let $\lambda$ be an eigenvalue and $u$ a corresponding unit eigenvector. Complete $U = \left( {u,u_{1},\ldots,u_{n}} \right)$ to an orthonormal basis of $\mathbb{R}^{n + 1}$. Put

$$
Q = \begin{pmatrix}
u & u_{1} & \ldots & u_{n}
\end{pmatrix},
$$

so $Q$ is orthogonal and $Q^{t} = Q^{- 1}$. 注意 $Q$ 为 $S_{U\rightarrow\varepsilon}$, 因而 $Q^{t} = Q^{- 1} = S_{\varepsilon\rightarrow U}$.

Then

$$
Q^{t}AQ = \left\lbrack {\lambda,0;0,B} \right\rbrack
$$

for some $B \in \mathbb{R}^{n \times n}$: $Q^{t}AQ$ is symmetric, and

$$
Q^{t}AQe_{1} = Q^{t{({Au})}} = Q^{t{({\lambda u})}} = \lambda S_{\varepsilon\rightarrow U}u = \lambda e_{1}.
$$

By the inductive hypothesis, $B$ is orthogonally diagonalizable, $B = RDR^{t}$ for an orthogonal $R$ and diagonal $D$. Therefore

$$
Q^{t}AQ = \begin{pmatrix}
1 & 0 \\
0 & R
\end{pmatrix}\begin{pmatrix}
\lambda & 0 \\
0 & D
\end{pmatrix}\begin{pmatrix}
1 & 0 \\
0 & R
\end{pmatrix}^{t}.
$$

The middle matrix is diagonal and $\begin{pmatrix}
1 & 0 \\
0 & R
\end{pmatrix}$ is orthogonal, since its transpose equals its inverse. Therefore we have constructed an orthogonal diagonalization of $A$.

# Personal homework submissions

## Homework 1 --- submitted work

> **Note**
>
> Visual transcription of the personal finished submission. Source: `217-Hw-1-finished.pdf`; page references below are PDF pages.

### Source p. 1 --- Exercise 20

Find the values of $k$ for which the system has infinitely many solutions, no solution, or one solution:

$\begin{pmatrix}
1 & 1 & {- 1} \\
1 & 2 & 1 \\
1 & 1 & {k^{2} - 5}
\end{pmatrix}x = \begin{pmatrix}
2 \\
3 \\
k
\end{pmatrix}$.

The submitted row reduction is $\begin{pmatrix}
1 & 1 & {- 1} & 2 \\
1 & 2 & 1 & 3 \\
1 & 1 & {k^{2} - 5} & k
\end{pmatrix}\rightarrow\begin{pmatrix}
1 & 1 & {- 1} & 2 \\
0 & 1 & 2 & 1 \\
0 & 0 & {k^{2} - 4} & {k - 2}
\end{pmatrix}\rightarrow\begin{pmatrix}
1 & 0 & {- 3} & 1 \\
0 & 1 & 2 & 1 \\
0 & 0 & {k^{2} - 4} & {k - 2}
\end{pmatrix}$. For infinitely many solutions, the final row must be zero, so $k^{2} - 4 = 0$ and $k - 2 = 0$. Thus $k = 2$.

### Source p. 2 --- Exercise 20; Exercise 32 begins

For no solution, $k^{2} - 4 = 0$ while $k - 2 \neq 0$, hence $k = - 2$. For one solution, $k \neq - 2$ and $k \neq 2$, namely $\left( {- \infty, - 2} \right) \cup \left( {- 2,2} \right) \cup \left( {2,\infty} \right)$.

Exercise 32 asks for a polynomial of degree at most two, $f(t) = a + bt + ct^{2}$, passing through $\left( {1,p} \right)$, $\left( {2,q} \right)$, and $\left( {3,r} \right)$. The submitted equations are $a + b + c = p$, $a + 2b + 4c = q$, and $a + 3b + 9c = r$.

### Source p. 3 --- Exercise 32

The augmented matrix is reduced as $\begin{pmatrix}
1 & 1 & 1 & p \\
1 & 2 & 4 & q \\
1 & 3 & 9 & r
\end{pmatrix}\rightarrow\begin{pmatrix}
1 & 1 & 1 & p \\
0 & 1 & 3 & {q - p} \\
0 & 2 & 8 & {r - p}
\end{pmatrix}$, giving $a = 3p - 3q + r$, $b = - 5\frac{p}{2} + 4q - 3\frac{r}{2}$, and $c = \frac{p}{2} - q + \frac{r}{2}$. Therefore a polynomial exists for all choices of $p$, $q$, and $r$.

### Source p. 4 --- Exercise 34

Find a polynomial of degree at most two which passes through $\left( {1,1} \right)$ and $\left( {2,0} \right)$ and satisfies $\int_{1}^{2}f(t)\, dt = - 1$. The submitted system is $a + b + c = 1$, $a + 2b + 4c = 0$, and $a + 3\frac{b}{2} + 7\frac{c}{3} = - 1$, with its augmented matrix set up for row reduction.

### Source p. 5 --- Exercise 34; Exercise 44

The reduction for Exercise 34 ends at $\begin{pmatrix}
1 & 0 & 0 & 20 \\
0 & 1 & 0 & {- 28} \\
0 & 0 & 1 & 9
\end{pmatrix}$, so the submitted answer is $f(t) = 20 - 28t + 9t^{2}$.

For Exercise 44, the line through $\left( {1,1,1} \right)$ and $\left( {3,5,0} \right)$ has direction $\begin{pmatrix}
2 \\
4 \\
{- 1}
\end{pmatrix}$. The submitted vector equation is $\begin{pmatrix}
x \\
y \\
z
\end{pmatrix} = \begin{pmatrix}
1 \\
1 \\
1
\end{pmatrix} + t\begin{pmatrix}
2 \\
4 \\
{- 1}
\end{pmatrix}$, or $x = 1 + 2t$, $y = 1 + 4t$, $z = 1 - t$, for arbitrary $t$. Its equations are $2x - y = - 3$ and $x + 2z = 3$.

### Source p. 6 --- Exercise 12

The homogeneous augmented matrix recorded is $\begin{pmatrix}
2 & 0 & {- 3} & 0 & 7 & 7 & 0 \\
{- 2} & 1 & 6 & 0 & {- 6} & {- 12} & 0 \\
0 & 1 & {- 3} & 0 & 1 & 5 & 0 \\
0 & {- 2} & 0 & 1 & 1 & 1 & 0 \\
2 & 1 & {- 3} & 0 & 8 & 7 & 0
\end{pmatrix}$. The first displayed operation divides the first row by $2$ before continuing the row reduction.

### Source p. 7 --- Exercise 12

The submitted reduction clears the first column, then the second column. Its displayed intermediate rows include $\begin{pmatrix}
1 & 0 & {- \frac{3}{2}} & 0 & \frac{7}{2} & \frac{7}{2} & 0 \\
0 & 1 & {- 3} & 0 & 1 & 5 & 0 \\
0 & {- 2} & 0 & 1 & 1 & 1 & 0 \\
0 & 1 & 0 & 0 & 1 & 0 & 0
\end{pmatrix}$, followed by clearing the remaining pivot columns.

### Source p. 8 --- Exercise 12

The final reduced matrix is $\begin{pmatrix}
1 & 0 & 0 & 0 & \frac{7}{2} & 1 & 0 \\
0 & 1 & 0 & 0 & 1 & 0 & 0 \\
0 & 0 & 1 & 0 & 0 & {- \frac{5}{3}} & 0 \\
0 & 0 & 0 & 1 & 3 & 1 & 0 \\
0 & 0 & 0 & 0 & 0 & 0 & 0
\end{pmatrix}$. Setting $x_{5} = t$ and $x_{6} = r$, the submission gives $\begin{pmatrix}
x_{1} \\
x_{2} \\
x_{3} \\
x_{4} \\
x_{5} \\
x_{6}
\end{pmatrix} = \begin{pmatrix}
{7\frac{t}{2} + r} \\
{- t} \\
{5\frac{r}{3}} \\
{- 3t - r} \\
t \\
r
\end{pmatrix} = t\begin{pmatrix}
\frac{7}{2} \\
{- 1} \\
0 \\
{- 3} \\
1 \\
0
\end{pmatrix} + r\begin{pmatrix}
1 \\
0 \\
\frac{5}{3} \\
{- 1} \\
0 \\
1
\end{pmatrix}$.

### Source p. 9 --- Exercise 36

For a vector $p$ perpendicular to $\begin{pmatrix}
1 \\
3 \\
{- 1}
\end{pmatrix}$, let $p = \begin{pmatrix}
a \\
b \\
c
\end{pmatrix}$. The condition is $a + 3b - c = 0$. Setting $b = t$ and $c = r$ gives $p = \begin{pmatrix}
{- 3t + r} \\
t \\
r
\end{pmatrix}$, where $t$ and $r$ are arbitrary real numbers.

### Source p. 10 --- Exercise 44

For the traffic-flow diagram, the submitted equations are $300 + x = 400 + y$, $300 + w = 320 + x$, $150 + 120 = w + z$, and $y + z + 100 = 250$. They are rearranged as $x - y = 100$, $w - x = 20$, $w + z = 270$, and $y + z = 150$.

### Source p. 11 --- Exercise 44

The submitted row reduction reaches $\begin{pmatrix}
1 & 0 & 0 & 1 & 270 \\
0 & 1 & 0 & 1 & 250 \\
0 & 0 & 1 & 1 & 150 \\
0 & 0 & 0 & 0 & 0
\end{pmatrix}$. The free variable is recorded as $z = t$.

### Source p. 12 --- Exercise 44

The submitted solution is $\begin{pmatrix}
w \\
x \\
y \\
z
\end{pmatrix} = \begin{pmatrix}
{270 - t} \\
{250 - t} \\
{150 - t} \\
t
\end{pmatrix}$. Nonnegativity gives $0 \leq t \leq 150$. The recorded flow ranges are $w \in \left\lbrack {120,270} \right\rbrack$, $x \in \left\lbrack {100,250} \right\rbrack$, $y \in \left\lbrack {0,150} \right\rbrack$, and $z \in \left\lbrack {0,150} \right\rbrack$.

### Source p. 13 --- Problem 1(a)--(c)

\(a\) True: "2 is even" and "3 is odd" are true, hence their disjunction is true.

\(b\) True: $217 = 7 \times 31$, so the conclusion is true; an if--then statement is true regardless of the truth value of its hypothesis.

\(c\) False: the derivative claim is true, but the submitted work states that $\tan\left( \frac{\pi}{6} \right) = \sqrt{3}$ is false; thus the biconditional is false.

### Source p. 14 --- Problem 1(d)--(e); Problem 2(a)

\(d\) True: the premise "there are infinitely many even primes" is false, since the only even prime is $2$, so the implication is true.

\(e\) True: each right triangle has two acute angles and every positive real number has a positive cube root; the implication is true.

For Problem 2(a), the table in the submission says that a proof proves nothing for a universal statement and that an existential statement is true; a counterexample proves a universal statement false and proves nothing for an existential statement.

### Source p. 15 --- Problem 2(b)--(d)

\(b\) True: every prime integer is either even or odd.

\(c\) False: $2$ is a prime which is even, so not every prime is odd; $3$ is a prime which is odd, so not every prime is even. Hence the asserted "or" is false.

\(d\) False: the submitted contradiction uses $x = n - 1$ to refute the stated universal claim.

### Source p. 16 --- Problem 2(e)--(g)

\(e\) True: the submitted argument chooses the integer immediately above $x$, so there is an integer $n > x$. \[TODO(217-Hw-1-finished.pdf, p. 16): one handwritten bracket symbol in the displayed floor/ceiling argument is not visually unambiguous.\]

\(f\) True: every square is a rectangle.

\(g\) False: $4$ has two square roots, $2$ and $- 2$, which disproves the uniqueness statement.

### Source p. 17 --- Problem 3

The submitted negations are:

- \(a\) 2 is not even and 3 is not odd.
- \(b\) the Riemann hypothesis is true and 217 is prime.
- \(c\) the derivative is not $2x$ or $\tan\left( \frac{\pi}{6} \right) \neq \sqrt{3}$.
- \(d\) there are infinitely many even primes, and 10 is not even or $10^{10}$ is not odd.
- \(e\) every right triangle in ${\mathbb{R}}^{2}$ has two acute angles, and some real number has no positive cube root.
- \(f\) $\forall n \in {\mathbb{N}}$ there exists $x \in {\mathbb{R}}$ with $x \geq n$.
- \(g\) all squares are not rectangles.

### Source p. 18 --- Problem 4

The submitted converses and contrapositives are:

- \(a\) Converse: "If something exists, it can think." Contrapositive: "If something does not exist, it cannot think."
- \(b\) Converse: "If $p^{2}$ is irrational, then $p$ is irrational." Contrapositive: "If $p^{2}$ is not rational, then $p$ is not rational."
- \(c\) Converse: "If $n^{2} + 1$ is prime, then $n$ is a natural number greater than 2 such that its Collatz sequence does not reach 1." The contraposition is also written in terms of $n^{2} + 1$ not being prime and the alternatives concerning $n$ and its Collatz sequence.

### Source p. 19 --- Problem 5

(a1) The set is all odd natural numbers. (a2) The graph is the right half of the unit circle centred at the origin, including the boundary.

(b1) The submitted set notation is `{(x,y,z) in RR^3 : x^2+y^2+z^2=1}`. (b2) The submitted set notation is `{sqrt(2)n : n in ZZ}`.

\(c\) The submitted truth values are: $\sqrt{2} \in {\mathbb{R}}$ true; $\sqrt{2} \subset {\mathbb{R}}$ false; `{sqrt(2)} in RR` false; `{sqrt(2)} subset RR` true; $\varnothing \in {\mathbb{R}}$ false; $\varnothing \subset {\mathbb{R}}$ true; $\varnothing \in \varnothing$ false; and $\varnothing \subset \varnothing$ true.

### Source p. 20 --- Problem 6(a)

The submitted lists are `1/2 NN = {1/2,1,3/2,2,5/2,3,...}`, `1/3 NN = {1/3,2/3,1,4/3,5/3,2,...}`, and `3NN = {3,6,9,12,15,18,...}`. It records `1/2 NN intersect 1/3 NN = NN`, and writes the union beginning `{1/3,1/2,2/3,1,4/3,3/2,...}`. It also gives `1/2 NN without 1/3 NN = {1/2,3/2,5/2,7/2,9/2,11/2,...}` and `(3NN)^c = NN without 3NN = {1,2,4,5,7,8,10,...}`.

### Source p. 21 --- Problem 6(b)

The claimed least $n$ is $6$. For $x \in \frac{1}{2}{\mathbb{N}} \cup \frac{1}{3}{\mathbb{N}}$, the submission writes $x = \frac{3m + 2p}{6}$ (with one of $m,p$ allowed to be zero), proving inclusion in $\frac{1}{6}{\mathbb{N}}$. It then rules out $n = 1,3,5$ because $\frac{1}{2}$ is not in $\frac{1}{n}{\mathbb{N}}$, and $n = 2,4$ because $\frac{1}{3}$ is not in $\frac{1}{n}{\mathbb{N}}$.

### Source p. 22 --- Problem 7

Let $F\left( {x,t} \right)$ mean "you can fool $x$ at time $t$." The submitted formalization of the recreational statement is $\left( {\exists t\forall xF\left( {x,t} \right)} \right) \land \left( {\exists x\forall tF\left( {x,t} \right)} \right) \land \neg\left( {\forall t\forall xF\left( {x,t} \right)} \right)$.

### Source p. 23 --- Problem 7

Applying De Morgan's law, the submitted negation is $\left( {\forall t\exists x\neg F\left( {x,t} \right)} \right) \vee \left( {\forall x\exists t\neg F\left( {x,t} \right)} \right) \vee \left( {\forall t\forall xF\left( {x,t} \right)} \right)$.

The accompanying English reads: "for all time there are some people you cannot fool, or for some time you can fool no people in the world, or for all time you can fool all people. (You can at least achieve one of three things)."

## Homework 2 --- submitted work

> **Note**
>
> Visual transcription of the personal finished submission. Source: `217-Hw-2-finished.pdf`; page references below are PDF pages.

### Source p. 1 --- Exercise 26

Let $A$ be a $4 \times 3$ matrix and assume $Ax = b$ has a unique solution. The submission records $\text{rank}(A) = \text{rank}\left( A \middle| b \right) = 3$. For $Ax = c$, it begins the two RREF cases.

### Source p. 2 --- Exercise 26; Exercise 34 begins

If $\left\lbrack {A:c} \right\rbrack$ reduces to a form with three pivots, it has one solution. If it has a row $\begin{pmatrix}
0 & 0 & 0 & \varepsilon
\end{pmatrix}$ with $\varepsilon \neq 0$, it has no solution. By Theorem 1.3.1, infinitely many solutions cannot occur because there is no free variable.

Exercise 34 introduces the standard coordinate vectors $e_{1},e_{2},e_{3}$.

### Source p. 3 --- Exercise 34

For $A = \begin{pmatrix}
a & b & c \\
d & e & f \\
g & h & k
\end{pmatrix}$, the submitted work writes

$Ae_{1} = \begin{pmatrix}
a \\
d \\
g
\end{pmatrix} = v_{1}$, $Ae_{2} = \begin{pmatrix}
b \\
e \\
h
\end{pmatrix} = v_{2}$, and $Ae_{3} = \begin{pmatrix}
c \\
f \\
k
\end{pmatrix} = v_{3}$.

For a matrix $B$ with columns $v_{1},v_{2},v_{3}$, it likewise records $Be_{i} = v_{i}$.

### Source p. 4 --- Exercise 48(a)--(b)

\(a\) If $x_{h}$ solves $Ax = 0$ and $x_{1}$ solves $Ax = b$, then $A\left( {x_{1} + x_{h}} \right) = Ax_{1} + Ax_{h} = b + 0 = b$.

\(b\) If $x_{1}$ and $x_{2}$ solve $Ax = b$, then $A\left( {x_{2} - x_{1}} \right) = Ax_{2} - Ax_{1} = b - b = 0$; hence $x_{2} - x_{1}$ is a homogeneous solution.

### Source p. 5 --- Exercise 48(c)

The drawing places the homogeneous solutions on a line through the origin and the particular solution $x_{1}$ off that line. The submitted answer is the parallel affine line $x_{1} + x_{h}$.

### Source p. 6 --- Exercise 48(c)

The geometric explanation concludes: all solutions form the line parallel to the homogeneous-solution line through the head of $x_{1}$, with its tail at $0$.

### Source p. 7 --- Exercise 6

For $T:{\mathbb{R}}^{2}\rightarrow{\mathbb{R}}^{3}$,

$T\begin{pmatrix}
x_{1} \\
x_{2}
\end{pmatrix} = x_{1}\begin{pmatrix}
1 \\
2 \\
3
\end{pmatrix} + x_{2}\begin{pmatrix}
4 \\
5 \\
6
\end{pmatrix}$.

The submitted standard matrix is $\begin{pmatrix}
1 & 4 \\
2 & 5 \\
3 & 6
\end{pmatrix}$, and the work verifies linearity by the definition cited on Worksheet 4.

### Source p. 8 --- Exercise 38; Exercise 44 begins

For Exercise 38,

$T\begin{pmatrix}
2 \\
{- 1}
\end{pmatrix} = 2v_{1} - v_{2}$.

The submitted sketch shows this vector combination. Exercise 44 begins with $T(x)$ equal to the cross product of $v$ and $x$.

### Source p. 9 --- Exercise 44

With $v = \begin{pmatrix}
v_{1} \\
v_{2} \\
v_{3}
\end{pmatrix}$ and $x = \begin{pmatrix}
x_{1} \\
x_{2} \\
x_{3}
\end{pmatrix}$, the work expands

$v \times x = \begin{pmatrix}
{v_{2}x_{3} - v_{3}x_{2}} \\
{v_{3}x_{1} - v_{1}x_{3}} \\
{v_{1}x_{2} - v_{2}x_{1}}
\end{pmatrix} = \begin{pmatrix}
0 & {- v_{3}} & v_{2} \\
v_{3} & 0 & {- v_{1}} \\
{- v_{2}} & v_{1} & 0
\end{pmatrix}x$.

Thus the submitted matrix for $T$ is $\begin{pmatrix}
0 & {- v_{3}} & v_{2} \\
v_{3} & 0 & {- v_{1}} \\
{- v_{2}} & v_{1} & 0
\end{pmatrix}$; the work also verifies addition and scalar multiplication.

### Source p. 10 --- Exercise 46

For $A = \begin{pmatrix}
a & b \\
c & d
\end{pmatrix}$ and $B = \begin{pmatrix}
p & q \\
r & s
\end{pmatrix}$, $T(x) = B\left( {Ax} \right)$. The submitted column computation gives

$T\left( e_{1} \right) = \begin{pmatrix}
{ap + cq} \\
{ar + cs}
\end{pmatrix}$ and $T\left( e_{2} \right) = \begin{pmatrix}
{bp + dq} \\
{br + ds}
\end{pmatrix}$.

Hence the matrix is $\begin{pmatrix}
{ap + cq} & {bp + dq} \\
{ar + cs} & {br + ds}
\end{pmatrix}$.

### Source p. 11 --- Part B, Problem 1(a)--(b)

\(a\) $f:\left\lbrack {0,4} \right\rbrack\rightarrow\left\lbrack {0,18} \right\rbrack$, $f(x) = x^{2} + 2$, is injective but not surjective. A counterexample to surjectivity is $y = 0$. For injectivity, $a^{2} + 2 = b^{2} + 2$ implies $a = + - \vee - - b$, and nonnegativity gives $a = b$.

\(b\) $g:{\mathbb{R}}\rightarrow{\mathbb{R}}$, $g(x) = 2x - 5$, is bijective. Surjectivity uses $x = \frac{y + 5}{2}$, and $2x_{1} - 5 = 2x_{2} - 5$ gives injectivity.

### Source p. 12 --- Part B, Problem 1(c)--(d)

\(c\) $h:{\mathbb{R}}^{2}\rightarrow{\mathbb{R}}$, $h\left( {x,y} \right) = 2x^{2} + 5y^{2}$, is neither injective nor surjective: $h\left( {1,2} \right) = h\left( {- 1, - 2} \right) = 22$, and no negative number is in its image.

\(d\) $q:{\mathbb{N}}\rightarrow{\mathbb{N}}$ sends odd $n$ to $n$ and even $n$ to $\frac{n}{2}$. It is surjective but not injective: $q(1) = q(2) = 1$; for a target $y$, choose $x = y$ when $y$ is odd and $x = 2y$ when $y$ is even.

### Source p. 13 --- Part B, Problem 2(a)--(b)

The submitted truth values are (a) false, (b) true, (c) false, (d) false, (e) true.

For (a), take $f:\left\lbrack {- 2,2} \right\rbrack\rightarrow\left\lbrack {0,4} \right\rbrack$, $f(x) = x^{2}$, $A = \left\lbrack {- 2, - 1} \right\rbrack$, and $B = \left\lbrack {1,2} \right\rbrack$. Then `A intersect B = emptyset` but $4$ belongs to both images. The proof of (b) begins by contradiction.

### Source p. 14 --- Part B, Problem 2(b)--(c)

For (b), if $A$ and $B$ had a common $a$, then $f(a)$ would lie in both $f\lbrack A\rbrack$ and $f\lbrack B\rbrack$, contradicting their disjointness.

For (c), the same squaring map with $A = \left\lbrack {0,2} \right\rbrack$ gives $f^{-}1\left\lbrack {f\lbrack A\rbrack} \right\rbrack = \left\lbrack {- 2,2} \right\rbrack \neq A$.

### Source p. 15 --- Part B, Problem 2(d)--(e)

For (d), using the same $f$ and $A = \left\lbrack {0,2} \right\rbrack$, the submission gets $f\left\lbrack {X \smallsetminus A} \right\rbrack = f\left\lbrack {- 2,0} \right\rbrack = \left\lbrack {0,4} \right\rbrack$, whereas $Y \smallsetminus f\lbrack A\rbrack = \varnothing$.

For (e), it begins the two inclusions for a bijection $f$.

### Source p. 16 --- Part B, Problem 2(e)

If `m in f[A intersect B]`, then $m = f(x)$ for some `x in A intersect B`, so `m in f[A] intersect f[B]`. Conversely, $m = f(x) = f(y)$ with $x \in A$ and $y \in B$; injectivity gives $x = y$, thus `m in f[A intersect B]`.

### Source p. 17 --- Part B, Problem 3(a)

Assume $f\left( {cx} \right) = cf(x)$. The submission first records $f(0) = 0$ and $f\left( {- x} \right) = - f(x)$. If $x + y = 0$, additivity follows. Otherwise, writing $c = x + y$ and applying the assumption to $\frac{x}{x + y}$ and $\frac{y}{x + y}$ gives

$\left( {x + y} \right)f\left( {x + y} \right) = \left( {x + y} \right)\left( {f(x) + f(y)} \right)$,

then division yields $f\left( {x + y} \right) = f(x) + f(y)$.

### Source p. 18 --- Part B, Problem 3(b)

The submitted example is $f(x) = \left\| x \right\|$. It records $f\left( {cx} \right) = cf(x)$, but says it is not additive: with $x = \begin{pmatrix}
1 \\
2
\end{pmatrix}$ and $y = \begin{pmatrix}
2 \\
2
\end{pmatrix}$, the displayed norm values give $f\left( {x + y} \right) \neq f(x) + f(y)$.

### Source p. 19 --- Part B, Problem 4(a)--(b)

For an additive $f$, $f(0) = f(0) + f(0)$, hence $f(0) = 0$; also $f\left( {- x} \right) = - f(x)$.

### Source p. 20 --- Part B, Problem 4(c)--(d) begins

The induction for $f\left( {nx} \right) = nf(x)$ has base case $n = 1$ and the inductive step

$f\left( {\left( {n + 1} \right)x} \right) = f\left( {nx + x} \right) = f\left( {nx} \right) + f(x) = \left( {n + 1} \right)f(x)$.

Part (d), for negative integers, begins on this page.

### Source p. 21 --- Part B, Problem 4(d); recreational part (e)

The work completes the negative-integer case using $f\left( {- x} \right) = - f(x)$. For the recreational rational case it concludes that $f\left( {qx} \right) = qf(x)$ for rational $q$, using numerator/denominator multiplication and the preceding integer cases.

## Homework 3 --- submitted work

> **Note**
>
> Visual transcription of the personal finished submission. Source: `217-Hw-3-finished.pdf`; page references below are PDF pages.

### Source p. 1 --- Exercise 20

Reflection about the $x - z$ plane sends $\begin{pmatrix}
v_{1} \\
v_{2} \\
v_{3}
\end{pmatrix}$ to $\begin{pmatrix}
v_{1} \\
{- v_{2}} \\
v_{3}
\end{pmatrix}$. The submitted standard matrix is $\begin{pmatrix}
1 & 0 & 0 \\
0 & {- 1} & 0 \\
0 & 0 & 1
\end{pmatrix}$, accompanied by a sketch of the reflected vector.

### Source p. 2 --- Exercise 38(a)--(c)

\(a\) Projection onto an arbitrary unit vector $u = \begin{pmatrix}
u_{1} \\
u_{2}
\end{pmatrix}$ has matrix $\begin{pmatrix}
u_{1}^{2} & {u_{1}u_{2}} \\
{u_{1}u_{2}} & u_{2}^{2}
\end{pmatrix}$. Its determinant is $0$, so it is not invertible.

\(b\) A reflection matrix is $\begin{pmatrix}
a & b \\
b & {- a}
\end{pmatrix}$ with $a^{2} + b^{2} = 1$; its determinant is $- 1$, so it is invertible.

\(c\) A rotation matrix is $\begin{pmatrix}
a & {- b} \\
b & a
\end{pmatrix}$ with $a^{2} + b^{2} = 1$; its determinant is $a^{2} + b^{2} = 1$, so it is invertible.

### Source p. 3 --- Exercise 38(d); Exercise 18 begins

\(d\) The horizontal and vertical shear matrices are $\begin{pmatrix}
1 & k \\
0 & 1
\end{pmatrix}$ and $\begin{pmatrix}
1 & 0 \\
k & 1
\end{pmatrix}$. Each has determinant $1$, so each is invertible.

For Exercise 18, let $A = \begin{pmatrix}
2 & 3 \\
{- 3} & 2
\end{pmatrix}$ and $B = \begin{pmatrix}
a & b \\
c & d
\end{pmatrix}$. Equating $AB$ and $BA$ yields $b = - c$ and $a = d$, so $B = \begin{pmatrix}
a & b \\
{- b} & a
\end{pmatrix}$.

### Source p. 4 --- Exercise 34

For $A = \begin{pmatrix}
1 & 1 \\
0 & 1
\end{pmatrix}$, the submitted computations are

$A^{2} = \begin{pmatrix}
1 & 2 \\
0 & 1
\end{pmatrix}$, $A^{3} = \begin{pmatrix}
1 & 3 \\
0 & 1
\end{pmatrix}$, $A^{4} = \begin{pmatrix}
1 & 4 \\
0 & 1
\end{pmatrix}$, and $A^{1001} = \begin{pmatrix}
1 & 1001 \\
0 & 1
\end{pmatrix}$.

Thus $A^{k} = \begin{pmatrix}
1 & k \\
0 & 1
\end{pmatrix}$ for positive $k$. Geometrically, repeated application is a horizontal shear by one unit each time.

### Source p. 5 --- Exercise 12

For $A = \begin{pmatrix}
2 & 5 & 0 & 0 \\
1 & 3 & 0 & 0 \\
0 & 0 & 1 & 2 \\
0 & 0 & 2 & 5
\end{pmatrix}$, the submission applies the invertible-matrix test through row reduction of $\left\lbrack {A:I_{4}} \right\rbrack$. The displayed operations first exchange the first two rows and then use pivots to clear the two $2 \times 2$ blocks.

### Source p. 6 --- Exercise 12; Exercise 34 begins

The final augmented matrix is $\left\lbrack {I_{4}:A^{-}1} \right\rbrack$, with

$A^{-}1 = \begin{pmatrix}
3 & {- 5} & 0 & 0 \\
{- 1} & 2 & 0 & 0 \\
0 & 0 & 5 & {- 2} \\
0 & 0 & {- 2} & 1
\end{pmatrix}$.

By Theorem 2.4.5, $A$ is invertible.

For a diagonal $A = \begin{pmatrix}
a & 0 & 0 \\
0 & b & 0 \\
0 & 0 & c
\end{pmatrix}$, the submitted answer says $A$ is invertible precisely when $a,b,c \neq 0$, and then $A^{-}1 = \begin{pmatrix}
\frac{1}{a} & 0 & 0 \\
0 & \frac{1}{b} & 0 \\
0 & 0 & \frac{1}{c}
\end{pmatrix}$. A diagonal matrix of arbitrary size is invertible iff every diagonal element is nonzero.

### Source p. 7 --- Part B, Problem 1(a)--(b)

The source defines trace, determinant, transpose, and symmetric matrix, then asks truth values for transpose claims. The submission marks (a) false and takes $A = \begin{pmatrix}
1 & 2 \\
2 & 1
\end{pmatrix}$ and $B = \begin{pmatrix}
1 & 2 \\
1 & 2
\end{pmatrix}$. It computes $AB = \begin{pmatrix}
3 & 6 \\
3 & 6
\end{pmatrix}$, $B^{T} = \begin{pmatrix}
1 & 1 \\
2 & 2
\end{pmatrix}$, $A^{T} = \begin{pmatrix}
1 & 2 \\
2 & 1
\end{pmatrix}$, and $A^{T}B^{T} = \begin{pmatrix}
5 & 5 \\
4 & 4
\end{pmatrix}$, so $\left( {AB} \right)^{T} \neq A^{T}B^{T}$.

For (b), it marks false using the same matrices and records $AB = A^{T}B^{T} = \begin{pmatrix}
5 & 4 \\
4 & 5
\end{pmatrix}$ as a counterexample to the universal inequality.

### Source p. 8 --- Part B, Problem 1(c)

The statement $\left( {AB} \right)^{T} = B^{T}A^{T}$ is marked true. Let $A$ be $n \times p$ and $B$ be $p \times m$. The work writes both matrices by entries and notes that $\left( {B^{T}A^{T}} \right)$ has the same $m \times n$ shape as $\left( {AB} \right)^{T}$.

### Source p. 9 --- Part B, Problem 1(c)--(d)

The $j,i$ entry of $B^{T}A^{T}$ is computed as

$\sum_{k = 1}^{p}b_{kj}a_{ik} = \sum_{k = 1}^{p}a_{ik}b_{kj}$,

the $j,i$ entry of $\left( {AB} \right)^{T}$. Since $i,j$ are arbitrary, $\left( {AB} \right)^{T} = B^{T}A^{T}$.

For (d), the submission begins induction: for a symmetric $A = \begin{pmatrix}
a & b \\
b & a
\end{pmatrix}$, $A^{1} = A$ is symmetric, and if $A^{n} = \begin{pmatrix}
c & d \\
d & c
\end{pmatrix}$, then $A^{n + 1} = A^{n}A$.

### Source p. 10 --- Part B, Problem 1(d)--(e)

The inductive multiplication is

$\begin{pmatrix}
c & d \\
d & c
\end{pmatrix}\begin{pmatrix}
a & b \\
b & a
\end{pmatrix} = \begin{pmatrix}
{ac + bd} & {ad + bc} \\
{ad + bc} & {ac + bd}
\end{pmatrix}$,

which is symmetric. Hence $A^{n}$ is symmetric for all $n \in {\mathbb{N}}$.

\(e\) is false: $A = \begin{pmatrix}
1 & 3 \\
2 & 7
\end{pmatrix}$ is not symmetric, while $A^{2} = \begin{pmatrix}
7 & 24 \\
16 & 55
\end{pmatrix}$ is recorded as symmetric in the submitted counterexample.

### Source p. 11 --- Part B, Problem 2(a)--(c)

\(a\) True. A $3 \times 3$ matrix with a zero row has at most two leading 1s, so $\text{rank}(A) \leq 2$; by Theorem 2.4.3 it is not invertible.

\(b\) False. The counterexample is $\begin{pmatrix}
1 & 1 & 0 \\
1 & 1 & 0 \\
0 & 0 & 1
\end{pmatrix}$, whose RREF has rank $2 \neq 3$, so it is not invertible.

\(c\) True. If $A$ is an invertible $n \times n$ matrix, then $A^{-}1A = {\mathbb{A}}^{-}1 = I_{n}$; therefore $A^{-}1$ is invertible.

### Source p. 12 --- Part B, Problem 2(d)

\(d\) True. If $A$ is invertible, then $\left( {A^{-}1} \right)^{n}$ is an inverse for $A^{n}$. By associativity, the submission writes the products until adjacent $A^{-}1A$ pairs become $I_{n}$, so both products equal $I_{n}$.

### Source p. 13 --- Part B, Problem 3(a)

If there is an $n \times m$ matrix $B$ with $BA = I_{n}$, suppose $x_{1}$ and $x_{2}$ solve $Ax = 0$. Then $A\left( {x_{1} - x_{2}} \right) = 0$. Multiplying on the left by $B$ gives $BA\left( {x_{1} - x_{2}} \right) = B0 = 0$; hence $x_{1} - x_{2} = 0$ and $x_{1} = x_{2}$. Therefore $Ax = 0$ has a unique solution.

### Source p. 14 --- Part B, Problem 4(a)

Statement (a) is marked true. Write $A = \left\lbrack {v_{1},v_{2},\ldots,v_{m}} \right\rbrack$ and $B = \left\lbrack {w_{1},w_{2},\ldots,w_{k}} \right\rbrack$. By Theorem 2.3.2,

$AB = A\left\lbrack {w_{1},w_{2},\ldots,w_{k}} \right\rbrack = \left\lbrack {Aw_{1},Aw_{2},\ldots,Aw_{k}} \right\rbrack$.

If $w_{i} = \begin{pmatrix}
w_{1i} \\
\ldots \\
w_{mi}
\end{pmatrix}$, then by Theorem 1.3.8,

$Aw_{i} = w_{1i}v_{1} + w_{2i}v_{2} + \ldots + w_{mi}v_{m}$.

Thus every column of $AB$ is a linear combination of the columns of $A$.

### Source p. 15 --- Part B, Problem 4(b)

Statement (b) is false. The counterexample uses $A = \begin{pmatrix}
1 & 0 \\
0 & 0
\end{pmatrix}$ and $B = \begin{pmatrix}
1 & 1 \\
1 & 1
\end{pmatrix}$, so $AB = \begin{pmatrix}
1 & 1 \\
0 & 0
\end{pmatrix}$. Its first column $\begin{pmatrix}
1 \\
0
\end{pmatrix}$ is not a linear combination of the columns $\begin{pmatrix}
1 \\
1
\end{pmatrix}$ and $\begin{pmatrix}
1 \\
1
\end{pmatrix}$ of $B$: the submitted RREF shows that the corresponding system is inconsistent.

### Source p. 16 --- Part B, Problem 5(a)

For a linear $f:{\mathbb{R}}^{d}\rightarrow{\mathbb{R}}^{d}$, the proof by induction has base $n = 1$, where $f^{1}(x) = f\left( {f^{0}(x)} \right) = f(x)$ is linear. Assuming $f^{n}$ is linear, write $f(x) = Ax$. The key theorem gives a matrix $B$ with $f^{n{(x)}} = Bx$; hence

$f^{n + 1}(x) = f\left( f^{n{(x)}} \right) = f\left( {Bx} \right) = A\left( {Bx} \right) = \left( {AB} \right)x$,

so it is linear. Thus $f^{n}$ is linear for all $n \in {\mathbb{N}}$.

### Source p. 17 --- Part B, Problem 5(a)

The submission restates the inductive conclusion: the base case and inductive step prove that if $f$ is a linear transformation, then $f^{n}$ is a linear transformation for all $n \in {\mathbb{N}}$.

### Source p. 18 --- Part B, Problem 5(b)

Define $f:{\mathbb{R}}^{2}\rightarrow{\mathbb{R}}^{2}$ by $f(x) = - x$ if $\left\| x \right\| = 2$, and $f(x) = x$ otherwise. The submission says $f$ is not linear: choose $x_{1},x_{2}$ with $\left\| x_{1} \right\| = 2$ and $\left\| x_{2} \right\| \neq 2$, then $f\left( {x_{1} + x_{2}} \right) = x_{1} + x_{2}$ while $f\left( x_{1} \right) + f\left( x_{2} \right) = - x_{1} + x_{2}$. But $f^{2}(x) = x$ for all $x$, so $f^{2}$ is the identity and is linear.

### Source p. 19 --- Part B, Problem 5(c)

Let $f(x) = Ax$. If $f(x) = 0$ has a unique solution, then $Ax = 0$ has a unique solution; by Theorem 1.3.4, $\text{rank}(A) = d$, hence by Theorem 2.4.3 $A$ is invertible. Problem 3 has shown that $A^{n}$ is invertible for every $n \in {\mathbb{N}}$. Since $f^{n{(x)}} = A^{n}x$, Theorem 1.3.4 gives a unique solution to $A^{n}x = 0$, proving the claim.

## Homework 4 - submitted work

### Exercise 28 - inverse of a linear transformation

For

$T\begin{pmatrix}
x_{1} \\
x_{2} \\
x_{3} \\
x_{4}
\end{pmatrix} = \begin{pmatrix}
22 & 13 & 8 & 3 \\
{- 16} & {- 3} & {- 2} & {- 2} \\
8 & 9 & 7 & 2 \\
5 & 4 & 3 & 1
\end{pmatrix}\begin{pmatrix}
x_{1} \\
x_{2} \\
x_{3} \\
x_{4}
\end{pmatrix},$

the standard matrix is

$A = \begin{pmatrix}
22 & 13 & 8 & 3 \\
{- 16} & {- 3} & {- 2} & {- 2} \\
8 & 9 & 7 & 2 \\
5 & 4 & 3 & 1
\end{pmatrix}.$

The submitted elimination of $\left( A\  \middle| \ I_{4} \right)$ ends at

$\begin{pmatrix}
I_{4} & | & \begin{pmatrix}
1 & {- 2} & 9 & {- 25} \\
{- 2} & 5 & {- 22} & 60 \\
4 & {- 9} & 41 & {- 112} \\
{- 9} & 17 & {- 80} & 222
\end{pmatrix}
\end{pmatrix}.$

Thus

$A^{- 1} = \begin{pmatrix}
1 & {- 2} & 9 & {- 25} \\
{- 2} & 5 & {- 22} & 60 \\
4 & {- 9} & 41 & {- 112} \\
{- 9} & 17 & {- 80} & 222
\end{pmatrix},$

and $T^{- 1}(x) = A^{- 1}x$ for all $x \in \mathbb{R}^{4}$.

### Exercise 30 - invertibility

Let $A = \begin{pmatrix}
0 & 1 & b \\
{- 1} & 0 & c \\
{- b} & {- c} & 0
\end{pmatrix}$. By Theorem 2.4.3, $A$ is invertible exactly when $\text{rref}(A) = I_{3}$. Row reduction gives

$\begin{pmatrix}
0 & 1 & b \\
{- 1} & 0 & c \\
{- b} & {- c} & 0
\end{pmatrix}\rightarrow\begin{pmatrix}
1 & 0 & {- c} \\
0 & 1 & b \\
0 & 0 & 0
\end{pmatrix}.$

Therefore $A$ is not invertible, regardless of the values of $b,c$.

### Exercise 42 - permutation matrices

By elementary transformations that change row order, any permutation matrix can be transformed into $I_{n}$. Hence its rref is $I_{n}$, so it is invertible by Theorem 2.4.3. If $A$ is an arbitrary permutation matrix, then

$\text{rref}\left( A\  \middle| \ I_{n} \right) = \left( I_{n}\  \middle| \ B \right)$

and $B$ is the inverse of $A$. Since the calculation only changes row order, every row of $B$ is chosen from $I_{n}$ without repetition. Thus $B$ is again a permutation matrix.

### Exercise 6 - kernel

For $A = \begin{pmatrix}
1 & 1 & 1 \\
1 & 2 & 3
\end{pmatrix}$, the submitted row reduction is

$\begin{pmatrix}
1 & 1 & 1 & | & 0 \\
1 & 2 & 3 & | & 0
\end{pmatrix}\rightarrow\begin{pmatrix}
1 & 0 & {- 1} & | & 0 \\
0 & 1 & 2 & | & 0
\end{pmatrix}.$

Hence

$\begin{pmatrix}
x_{1} \\
x_{2} \\
x_{3}
\end{pmatrix} = \begin{pmatrix}
t \\
{- 2t} \\
t
\end{pmatrix} = t\begin{pmatrix}
1 \\
{- 2} \\
1
\end{pmatrix},\quad t \in \mathbb{R},$

so $\text{ker}(A) = \text{span}\left( \begin{pmatrix}
1 \\
{- 2} \\
1
\end{pmatrix} \right)$.

### Exercise 14 - image

For $A = \begin{pmatrix}
1 & 2 & 3 \\
1 & 2 & 3 \\
1 & 2 & 3
\end{pmatrix}$,

$T(x) = Ax = \begin{pmatrix}
1 \\
1 \\
1
\end{pmatrix}x_{1} + \begin{pmatrix}
2 \\
2 \\
2
\end{pmatrix}x_{2} + \begin{pmatrix}
3 \\
3 \\
3
\end{pmatrix}x_{3} = \begin{pmatrix}
1 \\
1 \\
1
\end{pmatrix}\left( {x_{1} + 2x_{2} + 3x_{3}} \right).$

Therefore $\text{im}(A) = \text{span}\left( \begin{pmatrix}
1 \\
1 \\
1
\end{pmatrix} \right)$.

## Part B

### Problem 1 - nilpotent transformations

Let $T:\mathbb{R}^{n}\rightarrow\mathbb{R}^{n}$ have standard matrix $A$.

#### (a)

We prove by induction on $k$ that the standard matrix of $T^{k}$ is $A^{k}$. For $k = 1$, $T(x) = Ax = A^{1}x$. Assume $T^{n{(x)}} = A^{n}x$. Using the composition rule and associativity,

$T^{n + 1}(x) = T\left( T^{n{(x)}} \right) = T\left( {A^{n}x} \right) = A\left( {A^{n}x} \right) = A^{n + 1}x.$

Thus the statement holds for all $k$.

#### (b)

Assume that $T$ is nilpotent. Then, for some positive integer $k$, $T^{k{(x)}} = 0$ for all $x \in \mathbb{R}^{n}$. By part (a), $A^{k}x = 0$ for all $x$. Suppose, for contradiction, that $A$ is invertible. Then $A^{k}$ is invertible, with inverse $\left( {A^{- 1} \cdot A^{- 1} \cdot \ldots \cdot A^{- 1}} \right)$ ($k$ factors). Thus $\text{rank}\left( A^{k} \right) = n$, its rref is $I_{n}$, and the augmented system $\left( A^{k}\  \middle| \ 0 \right)$ cannot have a solution for every right-hand side as required. This contradicts $A^{k}x = 0$ for all $x$. Therefore $A$ is not invertible.

#### (c)

If $k = 1$, then $T = 0$, hence $A = 0$ and $A - I_{n} = - I_{n}$ is invertible. For $k \geq 2$, set

$B = I_{n} + A + A^{2} + \ldots + A^{k - 1}.$

Then

$\left( {I_{n} - A} \right)B = I_{n} - A^{k} = I_{n}$

and, similarly, $B\left( {I_{n} - A} \right) = I_{n}$. Thus $I_{n} - A$ is invertible, and so is $A - I_{n} = - \left( {I_{n} - A} \right)$.

### Problem 2 - the vector space $\mathcal{F}\left( {S,V} \right)$

For $f,g,h \in \mathcal{F}\left( {S,V} \right)$ and $x \in S$, pointwise addition gives the vector-space axioms:

$$
\left( {f + g} \right)(x) \in V,\quad\left( {f + g} \right)(x) + h(x) = f(x) + \left( {g(x) + h(x)} \right),\quad f(x) + g(x) = g(x) + f(x),
$$

and the function $p(x) = 0_{V}$ is an additive identity. For each $f$, the function $n(x) = - f(x)$ is its additive inverse. For scalars $\alpha,\beta$,

$$
\alpha\left( {f + g} \right)(x) = \alpha f(x) + \alpha g(x),\quad\left( {\alpha + \beta} \right)f(x) = \alpha f(x) + \beta f(x),
$$

$\alpha\left( {\beta f(x)} \right) = \left( {\alpha\beta} \right)f(x),\quad 1f(x) = f(x).$

All expressions are defined in $V$, so $\mathcal{F}\left( {S,V} \right)$ is a vector space.

The element $0_{\mathcal{F}{({S,V})}}$ is the function $x\mapsto 0_{V}$, whereas $0_{V}$ is an element of $V$; they are different elements although the function value is always $0_{V}$.

$\mathcal{F}\left( {V,S} \right)$ is not necessarily a vector space. For example, take $S = \left\{ {1,2} \right\}$ with $1 + 2 = 3$, which is not in $S$. The constant functions $f(v) = 1$ and $g(v) = 2$ lie in $\mathcal{F}\left( {V,S} \right)$, but $f + g$ would have value $3$, hence is not a function into $S$.

Finally,

$\mathcal{P} \subset \mathcal{F}\left( {\mathbb{R},\mathbb{R}} \right),\quad\mathcal{P}_{n} \subset \mathcal{F}\left( {\mathbb{R},\mathbb{R}} \right),\quad C^{\infty} \subset \mathcal{F}\left( {\mathbb{R},\mathbb{R}} \right),$

where $\mathcal{P}$ is the set of all real polynomial functions, $\mathcal{P}_{n}$ those of degree at most $n$, and $C^{\infty}$ the infinitely differentiable real functions.

### Problem 3 - polynomial transformation

Let $T(p)(t) = p'(t) + p(0)$.

#### (a)

For $p_{1},p_{2} \in \mathcal{P}$,

$T\left( {p_{1} + p_{2}} \right) = \left( {p_{1} + p_{2}} \right)'(t) + \left( {p_{1} + p_{2}} \right)(0) = T\left( p_{1} \right) + T\left( p_{2} \right),$

and for $k \in \mathbb{R}$,

$T\left( {kp} \right)(t) = kp'(t) + kp(0) = kT(p)(t).$

Thus $T$ is linear.

#### (b)

$T_{n}:\mathcal{P}_{n}\rightarrow\mathcal{P}_{n}$ is not surjective: $p(t) = t^{n}$ is in the target, but no element of $\mathcal{P}_{n}$ maps to it because differentiation lowers the degree by one. It is not injective: for

$p_{1}(t) = 1 + 2t + t^{2},\quad p_{2}(t) = 2 + t + t^{2},$

we have $T_{n{(p_{1})}} = 3 + 2t = T_{n{(p_{2})}}$ although $p_{1} \neq p_{2}$.

#### (c)

$T$ is not injective by the same counterexample. It is surjective: if

$p(t) = k + a_{1}t + a_{2}t^{2} + \ldots + a_{m}t^{m},$

take

$q(t) = kt + \frac{1}{2}a_{1}t^{2} + \frac{1}{3}a_{2}t^{3} + \ldots + \frac{1}{m + 1}a_{m}t^{m + 1}.$

Then $q'(t) + q(0) = p(t)$.

### Problem 4 - left multiplication

For $L_{A}:\mathbb{R}^{n \times n}\rightarrow\mathbb{R}^{n \times n}$, $L_{A{(B)}} = AB$:

#### (a)

For $B,C \in \mathbb{R}^{n \times n}$ and $k \in \mathbb{R}$,

$L_{A{({B + C})}} = A\left( {B + C} \right) = AB + AC = L_{A{(B)}} + L_{A{(C)}},$

$L_{A{({kB})}} = A\left( {kB} \right) = kAB = kL_{A{(B)}}.$

So $L_{A}$ is linear.

#### (b)

If $A$ is invertible and $L_{A{(B_{1})}} = L_{A{(B_{2})}}$, multiplication by $A^{- 1}$ gives $B_{1} = B_{2}$, so $L_{A}$ is injective and hence invertible. Conversely, if $L_{A}$ is invertible, it is surjective. Thus some $C$ satisfies $L_{A{(C)}} = I_{n}$, so $AC = I_{n}$ and $A$ is invertible.

#### (c)

If $L_{A} = L_{B}$, then evaluating both maps at $I_{n}$ gives $A = L_{A{(I_{n})}} = L_{B{(I_{n})}} = B$. Hence $A\mapsto L_{A}$ is injective.

#### (d)

The map $L:\mathbb{R}^{n \times n}\rightarrow\mathcal{F}$ is not surjective. The constant function $f(C) = I_{n}$ is in $\mathcal{F}$, but if $L(A) = f$, then $AC = I_{n}$ for all $C$. Taking $C = 0_{n \times n}$ is impossible.

### Problem 5 - rotations and projection

For $T = \text{Rot}_{- 80{^\circ}} \circ \text{Proj}_{y} \circ \text{Rot}_{35{^\circ}}$:

#### (a)

$\text{Rot}_{35{^\circ}}$ has image $\mathbb{R}^{2}$. Projection onto the $y$-axis has image the $y$-axis, and rotation clockwise by $80{^\circ}$ sends this to a line $80{^\circ}$ clockwise from the $y$-axis. Thus the angle between $\text{im}(T)$ and the $x$-axis is $90{^\circ} - 80{^\circ} = 10{^\circ}$.

#### (b)

The final rotation does not affect the kernel. Projection kills exactly the $x$-axis, and undoing the initial $35{^\circ}$ counter-clockwise rotation gives a kernel line $35{^\circ}$ counter-clockwise from the $x$-axis.

#### (c)

For $T_{\varphi,\theta} = \text{Rot}_{\varphi} \circ \text{Proj}_{y} \circ \text{Rot}_{\theta}$, the image is a line $- \varphi$ from the $y$-axis and the kernel is a line $\theta$ from the $x$-axis. They agree when

$\varphi = \frac{\pi}{2} - \theta + k\pi,$

equivalently $\theta - \varphi = \frac{\pi}{2} + k\pi$ for $k \in {\mathbb{Z}}$.

## Homework 5 - submitted work

### Exercise 56 - linear independence

Rearrange the four given vectors as

$$
v_{1} = \begin{pmatrix}
e \\
1 \\
0 \\
0 \\
0 \\
0
\end{pmatrix},\quad v_{2} = \begin{pmatrix}
k \\
m \\
1 \\
0 \\
0 \\
0
\end{pmatrix},\quad v_{3} = \begin{pmatrix}
a \\
b \\
c \\
d \\
1 \\
0
\end{pmatrix},\quad v_{4} = \begin{pmatrix}
f \\
g \\
h \\
i \\
j \\
1
\end{pmatrix}.
$$

Each $v_{i}$ has an entry where all preceding vectors have $0$ and it has a nonzero entry. Thus, in a relation $c_{1}v_{1} + c_{2}v_{2} + c_{3}v_{3} + c_{4}v_{4} = 0$, the sixth coordinate forces $c_{4} = 0$, and the same argument forces $c_{3},c_{2},c_{1} = 0$ one by one. The vectors are linearly independent for all $a,b,\ldots,m \in \mathbb{R}$.

### Exercise 33 - hyperplanes

For $c_{1}x_{1} + \ldots + c_{n}x_{n} = 0$, let $A = \begin{pmatrix}
c_{1} & c_{2} & \ldots & c_{n}
\end{pmatrix}$. The hyperplane is $\text{ker}\left( T_{A} \right)$, and the image of $T_{A}:\mathbb{R}^{n}\rightarrow\mathbb{R}$ is nonzero because some $c_{i} \neq 0$. Hence its image has dimension $1$, and rank-nullity gives

$\text{dim}(V) = n - 1.$

Thus a hyperplane in $\mathbb{R}^{3}$ is a plane, and a hyperplane in $\mathbb{R}^{2}$ is a line.

### Exercise 63 - equal-dimensional nested subspaces

Let $\left( {v_{1},\ldots,v_{m}} \right)$ be a basis of $V$, with $V \subset W$ and $\text{dim}(V) = \text{dim}(W) = m$. The vectors $v_{1},\ldots,v_{m}$ lie in $W$ and are linearly independent. By Theorem 3.3.4 they form a basis of $W$. Every $w \in W$ is therefore a linear combination of the $v_{i}$, so $w \in V$. Thus $W \subset V$, and $V = W$.

### Exercise 12 - arithmetic sequences

Let $S$ be the set of all arithmetic sequences. It contains the zero sequence. If

$m = \left( {m_{0},m_{0} + k,m_{0} + 2k,\ldots} \right),\quad n = \left( {n_{0},n_{0} + l,n_{0} + 2l,\ldots} \right),$

then

$m + n = \left( {m_{0} + n_{0},m_{0} + n_{0} + \left( {k + l} \right),m_{0} + n_{0} + 2\left( {k + l} \right),\ldots} \right) \in S.$

For $r \in \mathbb{R}$,

$r\left( {m_{0},m_{0} + k,m_{0} + 2k,\ldots} \right) = \left( {rm_{0},rm_{0} + rk,rm_{0} + 2rk,\ldots} \right) \in S.$

Hence $S$ is a subspace.

### Exercise 28 - commuting $2 \times 2$ matrices

Let $A = \begin{pmatrix}
a & b \\
c & d
\end{pmatrix}$ and $B = \begin{pmatrix}
1 & 1 \\
0 & 1
\end{pmatrix}$. The equation $AB = BA$ gives

$\begin{pmatrix}
a & {a + b} \\
c & {c + d}
\end{pmatrix} = \begin{pmatrix}
{a + c} & {b + d} \\
c & d
\end{pmatrix},$

so $c = 0$ and $a = d$. Therefore

$S = \left\{ \begin{pmatrix}
a & b \\
0 & a
\end{pmatrix}\  \middle| \ a,b \in \mathbb{R} \right\} = \left\{ a\begin{pmatrix}
1 & 0 \\
0 & 1
\end{pmatrix} + b\begin{pmatrix}
0 & 1 \\
0 & 0
\end{pmatrix}\  \middle| \ a,b \in \mathbb{R} \right\}.$

The displayed matrices are linearly independent, so they are a basis and $\text{dim}(S) = 2$.

## Part A - Problem 6

For each diagram, the submitted dependent triples are:

**(a) $\left( {v_{1},v_{2},v_{3}} \right)$, $\left( {v_{1},v_{2},v_{5}} \right)$, $\left( {v_{1},v_{2},v_{4}} \right)$, $\left( {v_{1},v_{3},v_{5}} \right)$, $\left( {v_{1},v_{3},v_{4}} \right)$, $\left( {v_{2},v_{3},v_{4}} \right)$, $\left( {v_{2},v_{3},v_{5}} \right)$, $\left( {v_{3},v_{4},v_{5}} \right)$, $\left( {v_{2},v_{4},v_{5}} \right)$, $\left( {v_{1},v_{4},v_{5}} \right)$ (10 sets).** (b) $\left( {v_{1},v_{2},v_{3}} \right)$, $\left( {v_{1},v_{2},v_{5}} \right)$, $\left( {v_{1},v_{2},v_{4}} \right)$, $\left( {v_{1},v_{3},v_{5}} \right)$, $\left( {v_{2},v_{3},v_{4}} \right)$, $\left( {v_{3},v_{4},v_{5}} \right)$, $\left( {v_{2},v_{4},v_{5}} \right)$, $\left( {v_{1},v_{4},v_{5}} \right)$ (8 sets). **(c) $\left( {v_{1},v_{2},v_{3}} \right)$, $\left( {v_{1},v_{2},v_{5}} \right)$, $\left( {v_{1},v_{3},v_{5}} \right)$, $\left( {v_{2},v_{3},v_{4}} \right)$, $\left( {v_{3},v_{4},v_{5}} \right)$, $\left( {v_{2},v_{4},v_{5}} \right)$ (6 sets).** (d) $\left( {v_{1},v_{2},v_{3}} \right)$, $\left( {v_{1},v_{3},v_{5}} \right)$, $\left( {v_{1},v_{3},v_{4}} \right)$, $\left( {v_{2},v_{3},v_{4}} \right)$, $\left( {v_{2},v_{3},v_{5}} \right)$, $\left( {v_{2},v_{4},v_{5}} \right)$.

## Part B

### Problem 1 - images of independent lists

#### (a)

False. Let $T:\mathbb{R}^{2}\rightarrow\mathbb{R}^{2}$ be $T(x) = \begin{pmatrix}
0 & 0 \\
0 & 0
\end{pmatrix}x$. The vectors $\begin{pmatrix}
1 \\
0
\end{pmatrix},\begin{pmatrix}
0 \\
1
\end{pmatrix}$ are linearly independent, but their images are both $0$, so the image list is linearly dependent.

#### (b)

True. Assume $Y = \left( {T\left( x_{1} \right),\ldots,T\left( x_{k} \right)} \right)$ is linearly independent and $d_{1}x_{1} + \ldots + d_{k}x_{k} = 0_{V}$. Then

$d_{1}T\left( x_{1} \right) + \ldots + d_{k}T\left( x_{k} \right) = T\left( 0_{V} \right) = 0_{W}.$

Independence of $Y$ gives $d_{1} = \ldots = d_{k} = 0$, so $X$ is linearly independent.

### Problem 2 - prescribed kernel and image

The rref required by

$\text{ker}(T) = \left\{ x \in \mathbb{R}^{5}\  \middle| \ x_{1} = 5x_{2},x_{3} = 7x_{4} \right\}$

is

$\begin{pmatrix}
1 & {- 5} & 0 & 0 & 0 \\
0 & 0 & 1 & {- 7} & 0 \\
0 & 0 & 0 & 0 & 0
\end{pmatrix}.$

The target image has basis $\begin{pmatrix}
1 \\
0 \\
1
\end{pmatrix},\begin{pmatrix}
0 \\
1 \\
0
\end{pmatrix}$. Choosing the first and second nonredundant columns accordingly gives

$A = \begin{pmatrix}
1 & {- 5} & 0 & 0 & 0 \\
0 & 0 & 1 & {- 7} & 0 \\
1 & {- 5} & 0 & 0 & 0
\end{pmatrix},$

and $T(x) = Ax$ is one solution.

The transformation is not unique. For example, elementary transformations preserve the rref, and

$A' = \begin{pmatrix}
5 & {- 25} & 0 & 0 & 0 \\
0 & 0 & 1 & {- 7} & 0 \\
5 & {- 25} & 0 & 0 & 0
\end{pmatrix}$

has the same required kernel and image but is different from $A$.

### Problem 3 - maps defined on a basis

#### (a)

Let $\mathcal{B} = \left( {x_{1},\ldots,x_{n}} \right)$ be a basis of $X$, and write $v = c_{1}x_{1} + \ldots + c_{n}x_{n}$. Define

$T(v) = c_{1}T\left( x_{1} \right) + \ldots + c_{n}T\left( x_{n} \right) = c_{1}y_{1} + \ldots + c_{n}y_{n}.$

For $v_{1} = \sum d_{i}x_{i}$, $v_{2} = \sum e_{i}x_{i}$, this rule gives

$T\left( {v_{1} + v_{2}} \right) = \sum\left( {d_{i} + e_{i}} \right)T\left( x_{i} \right) = T\left( v_{1} \right) + T\left( v_{2} \right)$

and $T\left( {kv_{1}} \right) = kT\left( v_{1} \right)$, so it is linear. If $T'$ has the same values on the basis, then $T'(v) = \sum c_{i}T'\left( x_{i} \right) = \sum c_{i}y_{i} = T(v)$, so it is unique.

#### (b)

Let $\text{dim}(X) = n$ and let $\left( {u_{1},\ldots,u_{k}} \right)$ be a basis of $U$. Extend it to a basis $\left( {u_{1},\ldots,u_{k},w_{k + 1},\ldots,w_{n}} \right)$ of $X$. Since $\text{dim}(V) = n - k$, choose a basis $\left( {v_{1},\ldots,v_{n - k}} \right)$ of $V$ and define

$T_{U,V}\left( u_{i} \right) = 0,\quad T_{U,V}\left( w_{k + j} \right) = v_{j}.$

By part (a), this is a valid linear transformation. Its image is $V$ and its kernel is $U$.

#### (c)

The map is not unique: the construction depends on an arbitrarily chosen basis of $V$. Choosing a different basis can give different images for the $w_{k + j}$ while retaining the required kernel and image.

### Problem 4 - ranks and nullities of a composition

#### (a)

True. Since $\text{im}\left( {S \circ T} \right) \subset \text{im}(S)$,

$\text{rank}\left( {S \circ T} \right) = \text{dim}\left( {\text{im}\left( {S \circ T} \right)} \right) \leq \text{rank}(S).$

#### (b)

True. View the composition in two stages. First $T:U\rightarrow V$; then $S:\text{im}(T)\rightarrow W$. Rank-nullity for the restricted second map gives

$\text{rank}\left( {S \circ T} \right) = \text{rank}(T) - \text{dim}\left( {\text{ker}\left( S' \right)} \right) \leq \text{rank}(T).$

#### (c)

True. Rank-nullity yields

$\text{rank}(T) + \text{nullity}(T) = \text{rank}\left( {S \circ T} \right) + \text{nullity}\left( {S \circ T} \right).$

Part (b) then implies $\text{nullity}\left( {S \circ T} \right) \geq \text{nullity}(T)$.

#### (d)

False. If $T$ is surjective, then $S(V) = 0_{W}$, so $\text{nullity}(S) = \text{dim}(V)$ and $\text{nullity}\left( {S \circ T} \right) = \text{dim}(U)$. When $\text{dim}(U) < \text{dim}(V)$, the claimed inequality fails.

### Problem 5 - symmetric and skew-symmetric matrices

For $T(A) = A + A^{T}$:

#### (a)

$T\left( {A_{1} + A_{2}} \right) = \left( {A_{1} + A_{2}} \right) + \left( {A_{1} + A_{2}} \right)^{T} = T\left( A_{1} \right) + T\left( A_{2} \right)$, and $T\left( {kA} \right) = kA + \left( {kA} \right)^{T} = kT(A)$, so $T$ is linear.

#### (b)

If $A \in \text{ker}(T)$, then $A^{T} = - A$, so $A \in \text{Skew}_{n}$. Conversely, $B^{T} = - B$ implies $T(B) = 0$, so $\text{ker}(T) = \text{Skew}_{n}$. Also $C = M + M^{T}$ satisfies $C^{T} = C$, whence $\text{im}(T) \subset \text{Sym}_{n}$. If $D \in \text{Sym}_{n}$, choose $N = \frac{1}{2}D$; then $N + N^{T} = D$. Therefore $\text{im}(T) = \text{Sym}_{n}$.

#### (c)

Both are subspaces. Each contains the zero matrix. If $A^{T} = - A$ and $B^{T} = - B$, then $\left( {A + B} \right)^{T} = - \left( {A + B} \right)$ and $\left( {kA} \right)^{T} = - kA$; this proves the subspace conditions for $\text{Skew}_{n}$. Replacing $- A, - B$ by $A,B$ gives the same argument for $\text{Sym}_{n}$.

#### (d)

There are $n^{2}$ free entries in an arbitrary $n \times n$ matrix. In a symmetric matrix, entries below the diagonal mirror entries above it, while the diagonal entries are free. Thus

$\text{dim}\left( \text{Sym}_{n} \right) = \frac{n^{2} - n}{2} + n = \frac{n^{2} + n}{2}.$

For a skew-symmetric matrix, the lower entries are the negations of the upper entries and every diagonal entry is zero. Thus

$\text{dim}\left( \text{Skew}_{n} \right) = \frac{n^{2} - n}{2}.$

## Homework 6 - submitted work

### Exercise 50 - hexagonal coordinates

For the basis $\mathcal{B} = \left( {v,w} \right)$ in the hexagonal tiling,

$\left\lbrack \overrightarrow{\text{OP}} \right\rbrack_{\mathcal{B}} = \left\lbrack {2v + w} \right\rbrack_{\mathcal{B}} = \begin{pmatrix}
2 \\
1
\end{pmatrix},$

$\left\lbrack \overrightarrow{\text{OQ}} \right\rbrack_{\mathcal{B}} = \left\lbrack {v + 2w} \right\rbrack_{\mathcal{B}} = \begin{pmatrix}
1 \\
2
\end{pmatrix}.$

The point with $\left\lbrack \overrightarrow{\text{OR}} \right\rbrack_{\mathcal{B}} = \begin{pmatrix}
3 \\
2
\end{pmatrix}$ is the center of a tile. Further,

$\begin{pmatrix}
17 \\
13
\end{pmatrix} = 8\begin{pmatrix}
2 \\
1
\end{pmatrix} + \begin{pmatrix}
1 \\
2
\end{pmatrix} + \begin{pmatrix}
0 \\
3
\end{pmatrix}.$

Moving by the first two summands means moving in parallel to $\overrightarrow{\text{OQ}}$ and $\overrightarrow{\text{OP}}$ by whole tile lengths, which does not change whether a point is a vertex or center. Since $\begin{pmatrix}
0 \\
3
\end{pmatrix}$ is a vertex, $\begin{pmatrix}
17 \\
13
\end{pmatrix}$ is a vertex.

### Exercise 70 - upper triangular coordinate matrix

There is no basis $\mathcal{B} = \left( {v_{1},v_{2}} \right)$ of $\mathbb{R}^{2}$ whose $\mathcal{B}$-matrix for

$T(x) = \begin{pmatrix}
0 & {- 1} \\
1 & 0
\end{pmatrix}x$

is upper triangular. Suppose, for a contradiction, that

$\lbrack T\rbrack_{\mathcal{B}} = \begin{pmatrix}
a & b \\
0 & c
\end{pmatrix}.$

Then the generalized key theorem gives

$\begin{pmatrix}
0 & {- 1} \\
1 & 0
\end{pmatrix}v_{1} = av_{1}.$

Writing $v_{1} = \begin{pmatrix}
x \\
y
\end{pmatrix}$ yields

$- y = ax,\quad x = ay,\quad\left( {a - 1} \right)x = \left( {- a - 1} \right)y.$

Thus $x = y = 0$, since $a - 1$ and $- a - 1$ cannot both vanish. This is impossible because $0$ cannot be a basis vector.

### Exercise 58 - the solutions of $f^{''} = - f$

#### (a)

For $g \in V$, $g^{''} = - g$. Let

$f(x) = {g(x)}^{2} + g'(x)^{2}.$

Then

$f'(x) = 2g(x)g'(x) + 2g'(x)g^{''}(x) = 2g(x)g'(x) - 2g(x)g'(x) = 0,$

so $f$ is constant.

#### (b)

If $g(0) = g'(0) = 0$, the constant from part (a) is $k = {g(0)}^{2} + g'(0)^{2} = 0$. Therefore ${g(x)}^{2} + g'(x)^{2} = 0$ for all $x$, and $g(x) = g'(x) = 0$ for all $x$.

#### (c)

$V$ is a vector space; moreover, $\left( {\sin x} \right)^{''} = - \sin x$ and $\left( {\cos x} \right)^{''} = - \cos x$. Hence for $f \in V$,

$g(x) = f(x) - f(0)\cos x - f'(0)\sin x$

is in $V$. We have $g(0) = 0$ and

$g'(x) = f'(x) + f(0)\sin x - f'(0)\cos x,\quad g'(0) = 0.$

Part (b) gives $g = 0$, so

$f(x) = f(0)\cos x + f'(0)\sin x.$

Thus $\left( {\cos x,\sin x} \right)$ spans $V$.

### Exercise 46 - multiplication by $t - 1$

For $T\left( {f(t)} \right) = \left( {t - 1} \right)f(t)$,

$T\left( {f + g} \right) = \left( {t - 1} \right)\left( {f + g} \right) = T(f) + T(g),$

$T\left( {kf} \right) = \left( {t - 1} \right)kf = kT(f).$

Thus $T$ is linear. It is not an isomorphism because it is not surjective: a nonzero constant target polynomial cannot be $\left( {t - 1} \right)f(t)$ for a polynomial $f$.

### Exercise 68 - isomorphism condition

For $M = \begin{pmatrix}
a & b \\
c & d
\end{pmatrix}$,

$T(M) = \begin{pmatrix}
{5a} & b \\
{5c} & d
\end{pmatrix} - \begin{pmatrix}
{2a} & {2b} \\
{kc} & {kd}
\end{pmatrix} = \begin{pmatrix}
{3a} & {- b} \\
{\left( {5 - k} \right)c} & {\left( {1 - k} \right)d}
\end{pmatrix}.$

The source and target have equal dimension, so $T$ is an isomorphism exactly when it is injective, equivalently when $\text{ker}(T) = \left\{ 0 \right\}$. This holds for $k \neq 1,5$. For $k = 1$ or $k = 5$, the kernel has dimension $1$, so $T$ is not an isomorphism.

## Part B

### Problem 1 - coefficient map

Let $T:\mathbb{R}^{n}\rightarrow V$ be defined by

$T\left( \begin{pmatrix}
c_{1} \\
\vdots \\
c_{n}
\end{pmatrix} \right) = c_{1}v_{1} + \ldots + c_{n}v_{n}.$

#### (a)

For coefficient columns $a = \left( a_{i} \right)$ and $c = \left( c_{i} \right)$,

$T\left( {a + c} \right) = \sum\left( {a_{i} + c_{i}} \right)v_{i} = T(a) + T(c),$

and $T\left( {ka} \right) = \sum ka_{i}v_{i} = kT(a)$. Hence $T$ is linear.

#### (b)

If $T$ is injective and $c_{1}v_{1} + \ldots + c_{n}v_{n} = 0$, then

$T\left( \begin{pmatrix}
c_{1} \\
\vdots \\
c_{n}
\end{pmatrix} \right) = T\left( \begin{pmatrix}
0 \\
\vdots \\
0
\end{pmatrix} \right),$

so $c_{i} = 0$ for every $i$. The list is linearly independent. Conversely, if $\left( {v_{1},\ldots,v_{n}} \right)$ is linearly independent and $T(a) = T(b)$, then

$\left( {a_{1} - b_{1}} \right)v_{1} + \ldots + \left( {a_{n} - b_{n}} \right)v_{n} = 0.$

Thus $a_{i} = b_{i}$ for all $i$, and $T$ is injective.

#### (c)

If $T$ is surjective, every $v \in V$ equals $T\left( \begin{pmatrix}
a_{1} \\
\vdots \\
a_{n}
\end{pmatrix} \right) = a_{1}v_{1} + \ldots + a_{n}v_{n}$, so the list spans $V$. Conversely, if it spans $V$, each $v \in V$ has this form and is in the image of $T$. Therefore $T$ is surjective.

#### (d)

An isomorphism is injective and surjective, so by (b) and (c) its list is linearly independent and spans $V$: it is an ordered basis. Conversely, an ordered basis gives both properties, so the linear map $T$ is a bijection and hence an isomorphism.

### Problem 2 - coordinate matrices for symmetrization

Let $T(A) = \frac{1}{2}\left( {A + A^{T}} \right)$ for $A = \begin{pmatrix}
a & b \\
c & d
\end{pmatrix}$.

#### (a)

$T(A) = \begin{pmatrix}
a & \frac{b + c}{2} \\
\frac{b + c}{2} & d
\end{pmatrix}.$

With $\lbrack A\rbrack_{\mathcal{E}} = \begin{pmatrix}
a \\
b \\
c \\
d
\end{pmatrix}$, the $\mathcal{E}$-matrix is

$\lbrack T\rbrack_{\mathcal{E}} = \begin{pmatrix}
1 & 0 & 0 & 0 \\
0 & \frac{1}{2} & \frac{1}{2} & 0 \\
0 & \frac{1}{2} & \frac{1}{2} & 0 \\
0 & 0 & 0 & 1
\end{pmatrix}.$

#### (b)

For $\mathcal{C} = \left( {\begin{pmatrix}
0 & 1 \\
1 & 0
\end{pmatrix},\begin{pmatrix}
1 & 0 \\
0 & 0
\end{pmatrix},\begin{pmatrix}
0 & 0 \\
0 & 1
\end{pmatrix},\begin{pmatrix}
0 & 1 \\
{- 1} & 0
\end{pmatrix}} \right)$,

$\lbrack T\rbrack_{\mathcal{C}} = \begin{pmatrix}
1 & 0 & 0 & 0 \\
0 & 1 & 0 & 0 \\
0 & 0 & 1 & 0 \\
0 & 0 & 0 & 0
\end{pmatrix}.$

#### (c)

Solving $\lbrack T\rbrack_{\mathcal{E}}\begin{pmatrix}
a \\
b \\
c \\
d
\end{pmatrix} = 0$ gives

$\text{ker}\left( \lbrack T\rbrack_{\mathcal{E}} \right) = \left\{ r\begin{pmatrix}
0 \\
{- 1} \\
1 \\
0
\end{pmatrix}\  \middle| \ r \in \mathbb{R} \right\}.$

#### (d)

The corresponding subspace of $\mathbb{R}^{2 \times 2}$ is

$\left\{ r\begin{pmatrix}
0 & {- 1} \\
1 & 0
\end{pmatrix}\  \middle| \ r \in \mathbb{R} \right\},$

with basis $\begin{pmatrix}
0 & {- 1} \\
1 & 0
\end{pmatrix}$.

#### (e)

Solving $\lbrack T\rbrack_{\mathcal{C}}\begin{pmatrix}
a \\
b \\
c \\
d
\end{pmatrix} = 0$ gives

$\text{ker}\left( \lbrack T\rbrack_{\mathcal{C}} \right) = \left\{ r\begin{pmatrix}
0 \\
0 \\
0 \\
1
\end{pmatrix}\  \middle| \ r \in \mathbb{R} \right\}.$

#### (f) and (g)

The coordinate isomorphism sends

$\begin{pmatrix}
x \\
y \\
z \\
w
\end{pmatrix}\mapsto\begin{pmatrix}
y & {x + w} \\
{x - w} & z
\end{pmatrix}.$

Hence the image of the $\mathcal{C}$-coordinate kernel is

$\left\{ r\begin{pmatrix}
0 & 1 \\
{- 1} & 0
\end{pmatrix}\  \middle| \ r \in \mathbb{R} \right\},$

the same subspace as in part (d). Both are $\text{ker}(T)$.

#### (h)

Using $\mathcal{C}$-coordinates, the image is spanned by the first three coordinate vectors. A basis is therefore

$\left( {\begin{pmatrix}
0 & 1 \\
1 & 0
\end{pmatrix},\begin{pmatrix}
1 & 0 \\
0 & 0
\end{pmatrix},\begin{pmatrix}
0 & 0 \\
0 & 1
\end{pmatrix}} \right).$

### Problem 3 - a trigonometric vector space

Let

$f_{1} = 1,\quad f_{2} = \sin\left( {2x} \right),\quad f_{3} = \cos\left( {2x} \right),\quad f_{4} = \sin^{2}(x),\quad f_{5} = \cos^{2}(x),\quad f_{6} = \sin x\cos x,$

and $V = \text{Span}\left( {f_{1},\ldots,f_{6}} \right)$, $\mathcal{B} = \left( {f_{1},f_{2},f_{4}} \right)$.

#### (a)

For $f = a_{1} + a_{2}\sin\left( {2x} \right) + a_{3}\cos\left( {2x} \right) + a_{4}\sin^{2}(x) + a_{5}\cos^{2}(x) + a_{6}\sin x\cos x$, the identities $\cos\left( {2x} \right) = 1 - 2\sin^{2}(x)$, $\cos^{2}(x) = 1 - \sin^{2}(x)$, and $\sin x\cos x = \frac{1}{2}\sin\left( {2x} \right)$ give

$f = \left( {a_{1} + a_{3} + a_{5}} \right) + \left( {a_{2} + \frac{1}{2}a_{6}} \right)\sin\left( {2x} \right) + \left( {a_{4} - 2a_{3} - a_{5}} \right)\sin^{2}(x).$

So $\left( {f_{1},f_{2},f_{4}} \right)$ spans $V$. If $b_{1} + b_{2}\sin\left( {2x} \right) + b_{4}\sin^{2}(x) = 0$, evaluate at $x = \pi$, $x = \frac{\pi}{2}$, and $x = \frac{\pi}{4}$ to get $b_{1} = b_{4} = b_{2} = 0$. Thus $\mathcal{B}$ is an ordered basis.

#### (b)

$$
\left\lbrack f_{1} \right\rbrack_{\mathcal{B}} = \begin{pmatrix}
1 \\
0 \\
0
\end{pmatrix},\quad\left\lbrack f_{2} \right\rbrack_{\mathcal{B}} = \begin{pmatrix}
0 \\
1 \\
0
\end{pmatrix},\quad\left\lbrack f_{3} \right\rbrack_{\mathcal{B}} = \begin{pmatrix}
1 \\
0 \\
{- 2}
\end{pmatrix},
$$
$$
\left\lbrack f_{4} \right\rbrack_{\mathcal{B}} = \begin{pmatrix}
0 \\
0 \\
1
\end{pmatrix},\quad\left\lbrack f_{5} \right\rbrack_{\mathcal{B}} = \begin{pmatrix}
1 \\
0 \\
{- 1}
\end{pmatrix},\quad\left\lbrack f_{6} \right\rbrack_{\mathcal{B}} = \begin{pmatrix}
0 \\
\frac{1}{2} \\
0
\end{pmatrix}.
$$

#### (c)

For $f = a_{1} + a_{2}\sin\left( {2x} \right) + a_{3}\sin^{2}(x)$,

$f' = 2a_{2}\cos\left( {2x} \right) + a_{3}\sin\left( {2x} \right) = 2a_{2} + a_{3}\sin\left( {2x} \right) - 4a_{2}\sin^{2}(x) \in V.$

Thus $V$ is closed under differentiation.

#### (d)

$T(f) = f' + 2f$ has

$\left\lbrack {T(f)} \right\rbrack_{\mathcal{B}} = \begin{pmatrix}
{2a_{1} + 2a_{2}} \\
{2a_{2} + a_{3}} \\
{- 4a_{2} + 2a_{3}}
\end{pmatrix},$

so

$\lbrack T\rbrack_{\mathcal{B}} = \begin{pmatrix}
2 & 2 & 0 \\
0 & 2 & 1 \\
0 & {- 4} & 2
\end{pmatrix}.$

#### (e)

Row reduction of $\left( \lbrack T\rbrack_{\mathcal{B}} \middle| I_{3} \right)$ gives

$\lbrack T\rbrack_{\mathcal{B}}^{- 1} = \begin{pmatrix}
\frac{1}{2} & {- \frac{1}{4}} & \frac{1}{8} \\
0 & \frac{1}{4} & {- \frac{1}{8}} \\
0 & \frac{1}{2} & \frac{1}{4}
\end{pmatrix}.$

Therefore

$T^{- 1}\left( {a_{1} + a_{2}\sin\left( {2x} \right) + a_{3}\sin^{2}(x)} \right) = \left( {\frac{1}{2}a_{1} - \frac{1}{4}a_{2} + \frac{1}{8}a_{3}} \right) + \left( {\frac{1}{4}a_{2} - \frac{1}{8}a_{3}} \right)\sin\left( {2x} \right) + \left( {\frac{1}{2}a_{2} + \frac{1}{4}a_{3}} \right)\sin^{2}(x).$

#### (f)

The coordinate vector of $4 + 8\sin^{2}(x)$ is $\begin{pmatrix}
4 \\
0 \\
8
\end{pmatrix}$. Applying the inverse matrix gives $\begin{pmatrix}
3 \\
{- 1} \\
2
\end{pmatrix}$, so

$f(x) = 3 - \sin\left( {2x} \right) + 2\sin^{2}(x).$

### Problem 4 - products of vector spaces

#### (a)

If $0_{X}$ and $0_{Y}$ are the zero vectors of $X$ and $Y$, the zero vector of $X \times Y$ is $\left( {0_{X},0_{Y}} \right)$.

#### (b)

Let $\left( {x_{1},\ldots,x_{m}} \right)$ be a basis of $X$ and $\left( {y_{1},\ldots,y_{n}} \right)$ a basis of $Y$. For $\left( {a,b} \right) \in X \times Y$, write

$a = \sum a_{i}x_{i},\quad b = \sum b_{j}y_{j}.$

Then

$\left( {a,b} \right) = \sum a_{i{({x_{i},0_{Y}})}} + \sum b_{j{({0_{X},y_{j}})}},$

so the listed vectors span. If their linear combination is $\left( {0_{X},0_{Y}} \right)$, then $\sum a_{i}x_{i} = 0_{X}$ and $\sum b_{j}y_{j} = 0_{Y}$. Independence of the two bases forces all coefficients to vanish. Therefore

$\left( {\left( {x_{1},0_{Y}} \right),\ldots,\left( {x_{m},0_{Y}} \right),\left( {0_{X},y_{1}} \right),\ldots,\left( {0_{X},y_{n}} \right)} \right)$

is a basis of $X \times Y$.

#### (c)

The basis in (b) has $m + n$ vectors, so

$\text{dim}\left( {X \times Y} \right) = \text{dim}(X) + \text{dim}(Y).$

### Problem 5 - sum and intersection

Let $T:X \times Y\rightarrow X + Y$ be $T\left( {x,y} \right) = x + y$.

#### (a)

$T\left( {\left( {x_{1},y_{1}} \right) + \left( {x_{2},y_{2}} \right)} \right) = x_{1} + x_{2} + y_{1} + y_{2} = T\left( {x_{1},y_{1}} \right) + T\left( {x_{2},y_{2}} \right)$, and $T\left( {k\left( {x,y} \right)} \right) = kT\left( {x,y} \right)$, so $T$ is linear. Each $z \in X + Y$ has the form $z = x + y = T\left( {x,y} \right)$, so $T$ is surjective.

#### (b)

If $x + y = 0$, then $x = - y$, so it belongs to both $X$ and $Y$. Hence

$\text{ker}(T) = \left\{ \left( {a, - a} \right)\  \middle| \ a \in X \cap Y \right\}.$

The map $T_{1}:\text{ker}(T)\rightarrow X \cap Y$, $\left( {a, - a} \right)\mapsto a$, is linear, injective, and surjective; hence it is an isomorphism.

#### (c)

Since $\text{ker}(T)$ is isomorphic to $X \cap Y$ and $T$ is surjective, rank-nullity with part 4(c) gives

$\text{dim}\left( {X + Y} \right) + \text{dim}\left( {X \cap Y} \right) = \text{dim}(X) + \text{dim}(Y).$

#### (d)

For three-dimensional subspaces of $\mathbb{R}^{5}$, $X \cap Y = \left\{ 0 \right\}$ would give $\text{dim}\left( {X + Y} \right) = 6$, contradicting $\text{dim}\left( {X + Y} \right) \leq 5$. Thus it is impossible. In $\mathbb{R}^{6}$ it is possible; for example,

$X = \left\{ \begin{pmatrix}
a \\
b \\
c \\
0 \\
0 \\
0
\end{pmatrix}\  \middle| \ a,b,c \in \mathbb{R} \right\},\quad Y = \left\{ \begin{pmatrix}
0 \\
0 \\
0 \\
x \\
y \\
z
\end{pmatrix}\  \middle| \ x,y,z \in \mathbb{R} \right\}.$

Then $X + Y = \mathbb{R}^{6}$ and $X \cap Y = \left\{ 0 \right\}$.

## Homework 7 --- submitted work

# Part A

## 4.3 Exercise 14

For $T(M) = \begin{pmatrix}
1 & 1 \\
2 & 2
\end{pmatrix}M$ relative to $\mathcal{B} = \left( {\begin{pmatrix}
1 & 0 \\
{- 1} & 0
\end{pmatrix},\begin{pmatrix}
0 & 1 \\
0 & {- 1}
\end{pmatrix},\begin{pmatrix}
1 & 0 \\
2 & 0
\end{pmatrix},\begin{pmatrix}
0 & 1 \\
0 & 2
\end{pmatrix}} \right)$, the submission forms $\lbrack T\rbrack_{\mathcal{B}}$ from $\left\lbrack {T\left( b_{i} \right)} \right\rbrack_{\mathcal{B}}$. It finds

$T\left( b_{1} \right) = T\left( b_{2} \right) = \begin{pmatrix}
0 & 0 \\
0 & 0
\end{pmatrix},\quad T\left( b_{3} \right) = \begin{pmatrix}
3 & 0 \\
6 & 0
\end{pmatrix},\quad T\left( b_{4} \right) = \begin{pmatrix}
0 & 3 \\
0 & 6
\end{pmatrix},$

so

$\lbrack T\rbrack_{\mathcal{B}} = \begin{pmatrix}
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 3 & 0 \\
0 & 0 & 0 & 3
\end{pmatrix}\mapsto\begin{pmatrix}
0 & 0 & 1 & 0 \\
0 & 0 & 0 & 1 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0
\end{pmatrix}.$

Hence

$\left\lbrack {\text{ker}\ T} \right\rbrack_{M} = \text{span}\left( {\begin{pmatrix}
1 \\
0 \\
0 \\
0
\end{pmatrix},\begin{pmatrix}
0 \\
1 \\
0 \\
0
\end{pmatrix}} \right),$

$\left\lbrack {\text{im}\ T} \right\rbrack_{M} = \text{span}\left( {\begin{pmatrix}
0 \\
0 \\
1 \\
0
\end{pmatrix},\begin{pmatrix}
0 \\
0 \\
0 \\
1
\end{pmatrix}} \right).$

A basis for the kernel is $\left( {\begin{pmatrix}
1 & 0 \\
{- 1} & 0
\end{pmatrix},\begin{pmatrix}
0 & 1 \\
0 & {- 1}
\end{pmatrix}} \right)$; a basis for the image is $\left( {\begin{pmatrix}
1 & 0 \\
2 & 0
\end{pmatrix},\begin{pmatrix}
0 & 1 \\
0 & 2
\end{pmatrix}} \right)$; and $\text{rank}(T) = 2$.

## 4.3 Exercise 28

For $T\left( {f(t)} \right) = f\left( {2t - 1} \right)$ and $\mathcal{B} = \left( {1,t - 1,\left( {t - 1} \right)^{2}} \right)$,

$\lbrack T\rbrack_{\mathcal{B}} = \left( {\lbrack 1\rbrack_{\mathcal{B}}\left\lbrack {2t - 2} \right\rbrack_{\mathcal{B}}\left\lbrack {4\left( {t - 1} \right)^{2}} \right\rbrack_{\mathcal{B}}} \right) = \begin{pmatrix}
1 & 0 & 0 \\
0 & 2 & 0 \\
0 & 0 & 4
\end{pmatrix}.$

This has full rank, so $T$ is invertible, is an isomorphism, and $\text{rank}(T) = 3$.

## 4.3 Exercise 60

In $2x_{1} + x_{2} - 2x_{3} = 0$ let

$\mathcal{A} = \left( {\begin{pmatrix}
1 \\
2 \\
2
\end{pmatrix},\begin{pmatrix}
2 \\
{- 2} \\
1
\end{pmatrix}} \right),\quad\mathcal{B} = \left( {\begin{pmatrix}
1 \\
2 \\
2
\end{pmatrix},\begin{pmatrix}
3 \\
0 \\
3
\end{pmatrix}} \right).$

The submitted change-of-basis matrices are

$S_{\mathcal{B}\rightarrow\mathcal{A}} = \begin{pmatrix}
1 & 1 \\
0 & 1
\end{pmatrix},\quad S_{\mathcal{A}\rightarrow\mathcal{B}} = \begin{pmatrix}
1 & {- 1} \\
0 & 1
\end{pmatrix},$

and $\left\lbrack {\overrightarrow{a_{1}}\overrightarrow{a_{2}}} \right\rbrack = S_{\mathcal{B}\rightarrow\mathcal{A}}\left\lbrack {\overrightarrow{b_{1}}\overrightarrow{b_{2}}} \right\rbrack$.

## 5.1 Exercise 6

For $u = \begin{pmatrix}
1 \\
{- 1} \\
2 \\
{- 2}
\end{pmatrix}$ and $v = \begin{pmatrix}
2 \\
3 \\
4 \\
5
\end{pmatrix}$,

$\cos\theta = \frac{u \cdot v}{\left\| u \right\|\left\| v \right\|} = \frac{- 3}{\sqrt{540}} = \frac{- 1}{2\sqrt{15}}.$

Thus $\theta = \arccos\left( {- \frac{\sqrt{15}}{30}} \right) \approx 1.7$ rad (approximately 97.4 degrees).

## 5.1 Exercise 17

For $W = \text{span}\left( {\begin{pmatrix}
1 \\
2 \\
3 \\
4
\end{pmatrix},\begin{pmatrix}
5 \\
6 \\
7 \\
8
\end{pmatrix}} \right)$, the equations for $x = \begin{pmatrix}
x_{1} \\
x_{2} \\
x_{3} \\
x_{4}
\end{pmatrix} \in W^{\perp}$ reduce as

$\begin{pmatrix}
1 & 2 & 3 & 4 \\
5 & 6 & 7 & 8
\end{pmatrix}\mapsto\begin{pmatrix}
1 & 0 & {- 1} & {- 2} \\
0 & 1 & 2 & 3
\end{pmatrix}.$

Thus $x_{1} = x_{3} + 2x_{4}$, $x_{2} = - 2x_{3} - 3x_{4}$, and

$W^{\perp} = \left\{ r\begin{pmatrix}
1 \\
{- 2} \\
1 \\
0
\end{pmatrix} + s\begin{pmatrix}
2 \\
{- 3} \\
0 \\
1
\end{pmatrix}\  \middle| \ r,s \in \mathbb{R} \right\}.$

## 5.1 Exercise 26

With $u_{1} = \frac{1}{7}\begin{pmatrix}
2 \\
3 \\
6
\end{pmatrix}$ and $u_{2} = \frac{1}{7}\begin{pmatrix}
3 \\
{- 6} \\
2
\end{pmatrix}$,

$\text{proj}_{W{(x)}} = \left( {u_{1} \cdot x} \right)u_{1} + \left( {u_{2} \cdot x} \right)u_{2}$

$= \left( {2 + 3 + 6} \right)\begin{pmatrix}
2 \\
3 \\
6
\end{pmatrix} + \left( {3 - 6 + 2} \right)\begin{pmatrix}
3 \\
{- 6} \\
2
\end{pmatrix} = \begin{pmatrix}
19 \\
35 \\
64
\end{pmatrix}.$

# Part B

## Problem 1

For ordered bases $A,B,C$, writing $C = \left( {c_{1},c_{2},\ldots,c_{n}} \right)$ and taking $f \in W$,

$\lbrack f\rbrack_{A} = S_{C\rightarrow A}\lbrack f\rbrack_{C} = S_{B\rightarrow A}\lbrack f\rbrack_{B},\quad\lbrack f\rbrack_{B} = S_{C\rightarrow B}\lbrack f\rbrack_{C}.$

So

$S_{C\rightarrow A}\lbrack f\rbrack_{C} = \left( {S_{B\rightarrow A}S_{C\rightarrow B}} \right)\lbrack f\rbrack_{C}.$

Taking $\lbrack f\rbrack_{C} = e_{i}$ makes corresponding columns equal; therefore

$S_{C\rightarrow A} = S_{B\rightarrow A}S_{C\rightarrow B}.$

Consequently,

$S_{C\rightarrow A}S_{B\rightarrow C}S_{A\rightarrow B} = S_{B\rightarrow A}S_{C\rightarrow B}S_{B\rightarrow C}S_{A\rightarrow B} = S_{B\rightarrow A}I_{n}S_{A\rightarrow B} = I_{n}.$

## Problem 2

For $f_{1} = \sin\left( {2x} \right)$, $f_{2} = \cos\left( {2x} \right)$, $f_{3} = e^{3x}$ and $\mathcal{B} = \left( {f_{1},f_{2},f_{3}} \right)$,

$\left\lbrack {D\left( f_{1} \right)} \right\rbrack_{\mathcal{B}} = \begin{pmatrix}
0 \\
2 \\
0
\end{pmatrix},\quad\left\lbrack {D\left( f_{2} \right)} \right\rbrack_{\mathcal{B}} = \begin{pmatrix}
{- 2} \\
0 \\
0
\end{pmatrix},\quad\left\lbrack {D\left( f_{3} \right)} \right\rbrack_{\mathcal{B}} = \begin{pmatrix}
0 \\
0 \\
3
\end{pmatrix},$

so $\lbrack D\rbrack_{\mathcal{B}} = \begin{pmatrix}
0 & {- 2} & 0 \\
2 & 0 & 0 \\
0 & 0 & 3
\end{pmatrix}$.

The submitted interpretation is that it rotates every vector in $\mathbb{R}^{2}$ counterclockwise by $\frac{\pi}{2}$, stretches the $x,y$ coordinates to twice their length, and the $z$ coordinate to three times its length.

## Problem 3

Let $B = \lbrack T\rbrack_{\mathcal{B}}$ and $C = \lbrack T\rbrack_{\mathcal{C}}$. By the change-of-basis theorem, $C = S^{- 1}BS$, where $S = S_{C\rightarrow B}$. The submission proves by induction that

$B^{k} = S^{- 1}C^{k}S$

for each integer $k \geq 1$. The inductive step is

$B^{k + 1} = B^{k}B = \left( {S^{- 1}C^{k}S} \right)\left( {S^{- 1}CS} \right) = S^{- 1}C^{k + 1}S.$

Thus $B^{k}$ and $C^{k}$ are similar.

For the false kernel claim, it takes

$A = \begin{pmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 0
\end{pmatrix},$

$\mathcal{E} = \left( {\begin{pmatrix}
1 \\
0 \\
0
\end{pmatrix},\begin{pmatrix}
0 \\
1 \\
0
\end{pmatrix},\begin{pmatrix}
0 \\
0 \\
1
\end{pmatrix}} \right),$

$\mathcal{B} = \left( {\begin{pmatrix}
0 \\
1 \\
0
\end{pmatrix},\begin{pmatrix}
1 \\
0 \\
0
\end{pmatrix},\begin{pmatrix}
0 \\
0 \\
1
\end{pmatrix}} \right).$

It records

$\lbrack A\rbrack_{\mathcal{E}} = A,\quad\lbrack A\rbrack_{\mathcal{B}} = \begin{pmatrix}
1 & 0 & 0 \\
0 & 0 & 0 \\
0 & 1 & 1
\end{pmatrix},$

but

$\text{ker}\left( \lbrack A\rbrack_{\mathcal{E}} \right) = \left\{ r\begin{pmatrix}
0 \\
0 \\
1
\end{pmatrix}\  \middle| \ r \in \mathbb{R} \right\},$

$\text{ker}\left( \lbrack A\rbrack_{\mathcal{B}} \right) = \left\{ r\begin{pmatrix}
0 \\
1 \\
{- 1}
\end{pmatrix}\  \middle| \ r \in \mathbb{R} \right\}.$

For equal nullities, rank-nullity gives

$\text{dim}\left( {\text{ker}\ B} \right) = n - \text{rank}(B),\quad\text{dim}\left( {\text{ker}\ C} \right) = n - \text{rank}(C).$

The page proves $\text{rank}\left( {MN} \right) \leq \text{rank}(N)$ from $\text{ker}\ N \subseteq \text{ker}\left( {MN} \right)$, the analogous bound for $M$ by transposition, and equality $\text{rank}\left( {MN} \right) = \text{rank}(N)$ when $M$ is invertible. Since $B = S^{- 1}CS$, $\text{rank}(B) = \text{rank}(C)$, so the kernel dimensions agree.

## Problem 4

For $T:U\rightarrow W$, bases $\mathcal{B} = \left( {u_{1},\ldots,u_{k}} \right)$ and $\mathcal{C} = \left( {w_{1},\ldots,w_{d}} \right)$, define

$T'\left( \lbrack u\rbrack_{\mathcal{B}} \right) = \lbrack w\rbrack_{\mathcal{C}}\quad\text{whenever}\quad T(u) = w.$

The source diagram verifies

$T' \circ L_{\mathcal{B}}(u) = T'\left( \lbrack u\rbrack_{\mathcal{B}} \right) = \lbrack w\rbrack_{\mathcal{C}} = L_{\mathcal{C}} \circ T(u),$

hence $T' \circ L_{\mathcal{B}} = L_{\mathcal{C}} \circ T$. Thus

$\left\lbrack {T(u)} \right\rbrack_{\mathcal{C}} = \lbrack T\rbrack_{\mathcal{B},\mathcal{C}}\lbrack u\rbrack_{\mathcal{B}}.$

For $u = a_{1}u_{1} + \ldots + a_{k}u_{k}$,

$\left\lbrack {T(u)} \right\rbrack_{\mathcal{C}} = a_{1}\left\lbrack {T\left( u_{1} \right)} \right\rbrack_{\mathcal{C}} + \ldots + a_{{k{\lbrack{T{(u_{k})}}\rbrack}}_{\mathcal{C}}},$

and therefore

$\lbrack T\rbrack_{\mathcal{B},\mathcal{C}} = \left( {\left\lbrack {T\left( u_{1} \right)} \right\rbrack_{\mathcal{C}}\left\lbrack {T\left( u_{2} \right)} \right\rbrack_{\mathcal{C}}\ldots\left\lbrack {T\left( u_{k} \right)} \right\rbrack_{\mathcal{C}}} \right).$

## Problem 5

For $f_{1} = \sin x$, $f_{2} = \cos x$, $f_{3} = e^{x}$:

$T\left( f_{1} \right) = x - \frac{x^{3}}{6},\quad T\left( f_{2} \right) = 1 - \frac{x^{2}}{2},$

$T\left( f_{3} \right) = 1 + x + \frac{x^{2}}{2} + \frac{x^{3}}{6}.$

The source chooses $\mathcal{C} = \left( {1,x,\frac{x^{2}}{2},\frac{x^{3}}{6}} \right)$. For $\mathcal{B} = \left( {f_{1} + f_{2},f_{1} - f_{2},f_{3} + f_{1}} \right)$ it computes

$\left\lbrack {T\left( {f_{1} + f_{2}} \right)} \right\rbrack_{\mathcal{C}} = \begin{pmatrix}
1 \\
1 \\
{- 1} \\
{- 1}
\end{pmatrix},$

$\left\lbrack {T\left( {f_{1} - f_{2}} \right)} \right\rbrack_{\mathcal{C}} = \begin{pmatrix}
{- 1} \\
1 \\
1 \\
{- 1}
\end{pmatrix},$

$\left\lbrack {T\left( {f_{3} + f_{1}} \right)} \right\rbrack_{\mathcal{C}} = \begin{pmatrix}
1 \\
2 \\
1 \\
0
\end{pmatrix},$

so

$\lbrack T\rbrack_{\mathcal{B},\mathcal{C}} = \begin{pmatrix}
1 & {- 1} & 1 \\
1 & 1 & 2 \\
{- 1} & 1 & 1 \\
{- 1} & {- 1} & 0
\end{pmatrix}.$

## Problem 6

Let $A = \begin{pmatrix}
{- 6} & {- 30} \\
{- 30} & 19
\end{pmatrix}$ and $V = \text{span}\left( \begin{pmatrix}
3 \\
2
\end{pmatrix} \right)$. For $v = a\begin{pmatrix}
3 \\
2
\end{pmatrix}$,

$Av = a\begin{pmatrix}
{- 78} \\
{- 52}
\end{pmatrix} = - 26a\begin{pmatrix}
3 \\
2
\end{pmatrix} \in V.$

$V^{\perp} = \left\{ r\begin{pmatrix}
{- 2} \\
3
\end{pmatrix}\  \middle| \ r \in \mathbb{R} \right\}$, and

$A\begin{pmatrix}
{- 2r} \\
{3r}
\end{pmatrix} = r\begin{pmatrix}
{- 78} \\
117
\end{pmatrix} = - 39r\begin{pmatrix}
{- 2} \\
3
\end{pmatrix} \in V^{\perp}.$

With $\mathcal{B} = \left( {\begin{pmatrix}
{- 2} \\
3
\end{pmatrix},\begin{pmatrix}
3 \\
2
\end{pmatrix}} \right)$,

$\lbrack T\rbrack_{\mathcal{B}} = \begin{pmatrix}
26 & 0 \\
0 & {- 39}
\end{pmatrix},\quad\left\lbrack T^{10} \right\rbrack_{\mathcal{B}} = \begin{pmatrix}
26^{10} & 0 \\
0 & 39^{10}
\end{pmatrix}.$

The source uses

$S_{\mathcal{B}\rightarrow\mathcal{E}} = \begin{pmatrix}
{- 2} & 3 \\
3 & 2
\end{pmatrix},\quad S_{\mathcal{B}\rightarrow\mathcal{E}}^{- 1} = \begin{pmatrix}
\frac{2}{13} & {- \frac{3}{13}} \\
{- \frac{3}{13}} & {- \frac{2}{13}}
\end{pmatrix}$

to obtain

$\left\lbrack T^{10} \right\rbrack_{\mathcal{E}} = \begin{pmatrix}
\frac{4 \cdot 26^{10} + 9 \cdot 39^{10}}{13} & \frac{- 6 \cdot 26^{10} + 6 \cdot 39^{10}}{13} \\
\frac{- 6 \cdot 26^{10} + 6 \cdot 39^{10}}{13} & \frac{9 \cdot 26^{10} + 4 \cdot 39^{10}}{13}
\end{pmatrix}.$

## Homework 8 --- submitted work

# Part A

The assigned book exercises are 5.1: 45; 5.2: 14, 26; 5.3: 36; and 5.4: 26, 32.

## 5.1 Exercise 45

For $A = \begin{pmatrix}
3 & 5 & 11 \\
5 & 9 & 20 \\
11 & 20 & 49
\end{pmatrix}$ and $V = \text{span}\left( {\overrightarrow{v_{2}},\overrightarrow{v_{3}}} \right)$, put $\text{proj}_{V{(\overrightarrow{v_{1}})}} = c_{2}\overrightarrow{v_{2}} + c_{3}\overrightarrow{v_{3}}$. Orthogonality gives

$9c_{2} + 20c_{3} = 5,\quad 20c_{2} + 49c_{3} = 11,$

so $c_{2} = \frac{25}{41}$, $c_{3} = - \frac{1}{41}$, and

$\text{proj}_{V{(\overrightarrow{v_{1}})}} = \frac{25}{41}\overrightarrow{v_{2}} - \frac{1}{41}\overrightarrow{v_{3}}.$

## 5.2 Exercise 14

For $\begin{pmatrix}
1 \\
7 \\
1 \\
7
\end{pmatrix},\begin{pmatrix}
0 \\
7 \\
2 \\
7
\end{pmatrix},\begin{pmatrix}
1 \\
8 \\
1 \\
6
\end{pmatrix}$, the submitted Gram--Schmidt calculation gives

$u_{1} = \frac{1}{10}\begin{pmatrix}
1 \\
7 \\
1 \\
7
\end{pmatrix},\quad u_{2} = \frac{1}{\sqrt{2}}\begin{pmatrix}
{- 1} \\
0 \\
1 \\
0
\end{pmatrix},\quad u_{3} = \frac{1}{\sqrt{2}}\begin{pmatrix}
0 \\
1 \\
0 \\
{- 1}
\end{pmatrix}.$

It states that $\left( {u_{1},u_{2},u_{3}} \right)$ is the orthonormal basis.

## 5.2 Exercise 26

For $m_{1} = \begin{pmatrix}
2 \\
3 \\
0 \\
6
\end{pmatrix}$ and $m_{2} = \begin{pmatrix}
4 \\
4 \\
2 \\
13
\end{pmatrix}$,

$u_{1} = \frac{1}{7}\begin{pmatrix}
2 \\
3 \\
0 \\
6
\end{pmatrix},\quad u_{2} = \frac{1}{3}\begin{pmatrix}
0 \\
{- 2} \\
2 \\
1
\end{pmatrix},$

and

$Q = \begin{pmatrix}
\frac{2}{7} & 0 \\
\frac{3}{7} & {- \frac{2}{3}} \\
0 & \frac{2}{3} \\
\frac{6}{7} & \frac{1}{3}
\end{pmatrix},\quad R = \begin{pmatrix}
7 & 14 \\
0 & 3
\end{pmatrix}.$

## 5.3 Exercise 36

For $\begin{pmatrix}
\frac{2}{3} & \frac{1}{\sqrt{2}} & a \\
\frac{2}{3} & {- \frac{1}{\sqrt{2}}} & b \\
\frac{1}{3} & 0 & c
\end{pmatrix}$, the roles must be orthonormal. The page solves

$\frac{4}{9} - \frac{1}{2} + ab = 0,\quad\frac{2}{9} + ac = 0,\quad\frac{2}{9} + bc = 0,$

giving $a = b = \frac{\sqrt{2}}{6}$ and $c = - 2\frac{\sqrt{2}}{3}$.

## 5.4 Exercise 26

For $A = \begin{pmatrix}
1 & 2 & 3 \\
4 & 5 & 6 \\
7 & 8 & 9
\end{pmatrix}$, $b = \begin{pmatrix}
1 \\
0 \\
0
\end{pmatrix}$, the normal equation is

$\begin{pmatrix}
66 & 78 & 90 \\
78 & 93 & 108 \\
90 & 108 & 126
\end{pmatrix}x = \begin{pmatrix}
1 \\
2 \\
3
\end{pmatrix}.$

Its reduced echelon form is

$\begin{pmatrix}
1 & 0 & {- 1} & \frac{7}{6} \\
0 & 1 & 2 & 1 \\
0 & 0 & 0 & 0
\end{pmatrix},$

so

$x^{\ast} = \begin{pmatrix}
{- \frac{7}{6} + t} \\
{1 - 2t} \\
t
\end{pmatrix} = \begin{pmatrix}
{- \frac{7}{6}} \\
1 \\
0
\end{pmatrix} + t\begin{pmatrix}
1 \\
{- 2} \\
1
\end{pmatrix}.$

## 5.4 Exercise 32

For $\left( {0,27} \right),\left( {1,0} \right),\left( {2,0} \right),\left( {3,0} \right)$, let $f(x) = c_{0} + c_{1}x + c_{2}x^{2}$, with

$A = \begin{pmatrix}
1 & 0 & 0 \\
1 & 1 & 1 \\
1 & 2 & 4 \\
1 & 3 & 9
\end{pmatrix},\quad b = \begin{pmatrix}
27 \\
0 \\
0 \\
0
\end{pmatrix}.$

The source gives

$\begin{pmatrix}
4 & 6 & 14 \\
6 & 14 & 36 \\
14 & 36 & 98
\end{pmatrix}x = \begin{pmatrix}
27 \\
0 \\
0
\end{pmatrix},$

$x^{\ast} = \begin{pmatrix}
\frac{513}{20} \\
{- \frac{567}{20}} \\
\frac{21}{4}
\end{pmatrix},$

and

$f^{\ast}(x) = \frac{513}{20} - \frac{567}{20}x + \frac{21}{4}x^{2} = 25.65 - 28.35x + 6.25x^{2}.$

# Part B

## Problem 1

For $\pi(v) = \sum_{i = 1}^{d}\frac{v \cdot v_{i}}{v_{i} \cdot v_{i}}v_{i}$:

### (a)

If $v_{i} \cdot v_{j} = 0$ for $i \neq j$, then $\left( {\frac{v_{1}}{\left\| v_{1} \right\|},\ldots,\frac{v_{d}}{\left\| v_{d} \right\|}} \right)$ is an orthonormal basis. Writing $u_{i} = \frac{v_{i}}{\left\| v_{i} \right\|}$,

$\pi(v) = \sum_{i = 1}^{d}\frac{v \cdot v_{i}}{\left\| v_{i} \right\|^{2}}v_{i} = \sum_{i = 1}^{d{({v \cdot u_{i}})}}u_{i},$

so $\pi$ is the orthogonal projection onto $W$.

### (b)

If the basis is not perpendicular, some $v_{i} \cdot v_{j} = a \neq 0$. While $\text{proj}_{W{(v_{i})}} = v_{i}$,

$\pi\left( v_{i} \right) = v_{i} + \ldots + \frac{a}{\left\| v_{j} \right\|^{2}}v_{j} + \ldots \neq v_{i}$

by linear independence. Thus $\pi$ is not $\text{proj}_{W}$.

## Problem 2

For the set $O_{n}$ of orthogonal matrices:

- \(a\) False. $I_{n} \in O_{n}$, but $I_{n} + I_{n}$ is not orthogonal; the page gives $\left( {I_{n} + I_{n}} \right)^{T{({I_{n} + I_{n}})}} = \begin{pmatrix}
  2 & 0 \\
  0 & 2
  \end{pmatrix}$, whereas its inverse is $\begin{pmatrix}
  \frac{1}{2} & 0 \\
  0 & \frac{1}{2}
  \end{pmatrix}$.
- \(b\) True. The composition of the orthogonal maps represented by $A,B$ has standard matrix $AB$, so $AB \in O_{n}$.
- \(c\) True by the same composition argument for $A^{2}$.
- \(d\) True. If $A^{2}$ were orthogonal but $A$ were not, with $\left\| T_{A{(x)}} \right\| = a\left\| x \right\|$ and $a \neq 1$, then $\left\| {T_{A} \circ T_{A{(x)}}} \right\| = a^{2}\left\| x \right\| \neq \left\| x \right\|$, a contradiction.
- \(e\) True. $A \in O_{n}$ gives $A^{T} = A^{- 1}$; $A^{2} = I_{n}$ gives $A = A^{- 1} = A^{T}$, so $A$ is symmetric.

## Problem 3

For an orthonormal basis $\mathcal{B}$,

$v = v_{1}b_{1} + \ldots + v_{r}b_{r},\quad w = w_{1}b_{1} + \ldots + w_{r}b_{r},$

and the calculation on the page is

$v \cdot w = \sum_{i = 1}^{r}v_{i}w_{i} = \lbrack v\rbrack_{\mathcal{B}} \cdot \lbrack w\rbrack_{\mathcal{B}}.$

For two orthonormal bases $\mathcal{B},\mathcal{C}$, $S_{\mathcal{C}\rightarrow\mathcal{B}}$ has $\left( {i,j} \right)$ entry $c_{j} \cdot b_{i}$ and $S_{\mathcal{B}\rightarrow\mathcal{C}}$ has transpose entry $b_{i} \cdot c_{j}$. Hence

$S_{\mathcal{C}\rightarrow\mathcal{B}} = S_{\mathcal{B}\rightarrow\mathcal{C}}^{T} = S_{\mathcal{B}\rightarrow\mathcal{C}}^{- 1},$

so $S_{\mathcal{B}\rightarrow\mathcal{C}}$ is orthogonal.

## Problem 4

The submitted answers are:

- \(a\) True. $\left( {\text{ker}\ A} \right)^{\perp} = \text{im}\ A^{T}$, from $\text{ker}\left( A^{T} \right) = \left( {\text{im}\ A} \right)^{\perp}$ and double orthogonal complement.
- \(b\) True. $\text{ker}\ A = \text{ker}\left( {A^{T}A} \right)$, then rank-nullity gives $\text{rank}\ A = \text{rank}\left( {A^{T}A} \right)$.
- \(c\) True. $\text{ker}\left( A^{T} \right) = \left( {\text{im}\ A} \right)^{\perp}$ and rank-nullity yield $\text{rank}\ A = \text{rank}\left( A^{T} \right)$.
- \(d\) True. With (b), (c), and $\left( A^{T} \right)^{T} = A$, $\text{rank}\left( {A^{T}A} \right) = \text{rank}\left( {AA^{T}} \right)$.
- \(e\) False. $\text{dim}\left( {\text{ker}\ A} \right) = m - \text{rank}\ A$ but $\text{dim}\left( {\text{ker}\ AA^{T}} \right) = n - \text{rank}\ A$; if $n \neq m$ they cannot be equal.

## Problem 5

### (a)

For $X = \left\{ {x_{1},\ldots,x_{r}} \right\}$, $Y = \left\{ {y_{1},\ldots,y_{s}} \right\}$ and $X \perp Y$,

$x = \sum a_{i}x_{i},\quad y = \sum b_{j}y_{j}$

implies $x \cdot y = 0$, because every $x_{i} \cdot y_{j} = 0$. Thus $\text{span}\ X \perp \text{span}\ Y$.

### (b)

For a relation

$\sum a_{i}x_{i} + \sum b_{j}y_{j} = 0,$

if coefficients on both sides are nonzero then the equal nonzero vectors would belong to $\text{span}\ X \cap \text{span}\ Y$. But (a) and WS 16 give this intersection as $0$. Hence all coefficients vanish and $X \cup Y$ is linearly independent.

### (c)

A pairwise orthogonal set with fewer than $n + 1$ members is not maximal: append $0$, use Gram--Schmidt, and add a new unit vector. A set with more than $n + 1$ members would make $Y \cup \left\{ 0 \right\}$ linearly independent in $\mathbb{R}^{n}$, which is impossible. Therefore a maximal pairwise orthogonal set has exactly $n + 1$ elements.

## Problem 6

### (a)

The source applies Gram--Schmidt to full-rank $A$ to obtain an orthonormal basis, reverses the chosen basis, and uses a QR factorization. It then sets

It takes the orthonormal basis matrix and the transpose of the upper factor, obtaining the stated QL factorization. The resulting lower factor is triangular with positive diagonal.

### (b)

The finished submission stops after the construction for (a); no visible proof for part (b) appears in the source PDF.

## Homework 9 --- submitted work

# Part A

The assigned exercises are 5.4: 27, 31; and 5.5: 15, 23, 32(a--d).

## 5.4 Exercise 27

The work observes that $S^{\perp}$ means the least-squares error is orthogonal to $S$. Thus, for the displayed vector, the least-squares solution is unchanged:

$x^{=}\begin{pmatrix}
7 \\
11
\end{pmatrix}.$

## 5.4 Exercise 31

For the three points $\left( {0,3} \right),\left( {1,3} \right),\left( {1,6} \right)$, the line of best fit uses

$A = \begin{pmatrix}
1 & 0 \\
1 & 1 \\
1 & 1
\end{pmatrix},\quad b = \begin{pmatrix}
3 \\
3 \\
6
\end{pmatrix}.$

The normal equations recorded in the submission are

$\begin{pmatrix}
3 & 2 \\
2 & 2
\end{pmatrix}\begin{pmatrix}
c_{0} \\
c_{1}
\end{pmatrix} = \begin{pmatrix}
12 \\
9
\end{pmatrix},$

and solving them gives $c_{0} = 3$ and $c_{1} = \frac{3}{2}$. Hence the submitted line is

$f(x) = 3 + 3\frac{x}{2}.$

## 5.5 Exercise 15

For the bilinear expression in the exercise, symmetry requires $b = c$. The submitted positive-definiteness test yields the additional condition

$d > b^{2}.$

## 5.5 Exercise 23

With

$\angle\left( {f,g} \right) = \frac{1}{2}\left( {f(0)g(0) + f(1)g(1)} \right),$

the answer verifies the inner-product properties and gives the orthonormal basis

$1,\quad 2x - 1.$

## 5.5 Exercise 32

For the weighted integral inner product

$\angle\left( {f,g} \right) = \frac{1}{2}\int_{- 1}^{1}f(t)g(t)\, dt,$

the computation in the submitted pages records

when $n + m$ is even, and

$\angle\left( {t^{n},t^{m}} \right) = \frac{1}{n + m + 1}$

when $n + m$ is odd. Also $\left\| t^{n} \right\| = \sqrt{\frac{1}{2n + 1}}$. Applying Gram--Schmidt, it writes

$g_{0} = 1,\quad g_{1} = \sqrt{3}t,\quad g_{2} = \sqrt{\frac{5}{2}}\left( {3t^{2} - 1} \right),$

$g_{3} = \frac{1}{\sqrt{\frac{4}{175}}}\left( {t^{3} - \frac{3}{5}t} \right).$

The associated polynomial sequence is recorded as

$1,\quad t,\quad\frac{3t^{2} - 1}{2},\quad\frac{5t^{3} - 3t}{2}.$

# Part B

## Problem 1

The submitted solution finds the plane of best fit for the three displayed points by writing its normal-equation system. Its computed coefficient vector is

$\begin{pmatrix}
\frac{7}{3} \\
1 \\
{- \frac{8}{3}}
\end{pmatrix},$

which is also plotted on the graph in the original submission.

## Problem 2

### (a)

For (i), the proposed expression is not an inner product: the work uses

$f(x) = x^{2} - 4x + 3,$

which is nonzero while $f(1) = f(3) = 0$. For (ii), it verifies the nonnegativity and definiteness of the sum-of-squares evaluation expression, and concludes that it is an inner product.

### (b)

For (i), the weighted integral with weight $x$ fails positive definiteness; the submission gives $f(x) = \sin(x)$ as the counterexample. For (ii), the weight $x^{2}$ gives the required symmetric, bilinear, positive-definite inner product.

## Problem 3

Let

$\angle\left( {f,g} \right) = \int_{- \frac{\pi}{2}}^{\frac{\pi}{2}}f(x)g(x)\sin^{2}(x)\, dx.$

### (a)

The work finds $\angle\left( {1,x} \right) = 0$ and $\left\| 1 \right\| = \sqrt{\frac{\pi}{2}}$, then evaluates the remaining displayed polynomial inner products to prepare Gram--Schmidt.

### (b)

The submitted orthonormalized functions are recorded approximately as

$u_{1} = \frac{2}{\sqrt{\pi}},\quad u_{2} = 0.974x,\quad u_{3} = \frac{x^{2} - 4.435}{15.8376}.$

### (c)

For $f(x) = e^{x}$, the work records

$\text{proj}_{W{(f)}} = 1.7521u_{1} + 0.2492u_{2} - 8.1697u_{3}$

and, after expansion,

$\text{proj}_{W{(f)}} \approx 3.3472 + 0.0236x - 0.5142x^{2}.$

## Homework 10 --- submitted work

# Part A

The assigned exercises are 6.1: 20, 54; 6.2: 42, 50; 6.3: 14; and 7.1: 12, 18, 42.

## 6.1 Exercise 20

By the row operations shown in the submission, the determinant of the given $k \times k$ matrix reduces to

$\det(A) = 1$

for every $k$.

## 6.1 Exercise 54

The answer uses positivity to conclude that the determinant of the displayed $5 \times 5$ matrix is positive, and records

$\det(A) = 1000.$

## 6.2 Exercise 42

For a QR factorization $A = QR$, the submission writes

$\det\left( {A^{T}A} \right) = \det\left( {R^{T}Q^{T}QR} \right) = {\det(R)}^{2},$

so the determinant is positive.

## 6.2 Exercise 50

For the matrix whose $\left( {i,j} \right)$ entry is $\min\left( {i,j} \right)$, repeated determinant reduction gives

$\det(A) = 1.$

## 6.3 Exercise 14

The parallelepiped volume is found from the determinant. Since the displayed vectors are linearly dependent, the result is

$\text{volume} = 0.$

## 7.1 Exercise 12

For

$A = \begin{pmatrix}
2 & 0 \\
3 & 4
\end{pmatrix},$

the characteristic equation gives eigenvalues $2$ and $4$. The corresponding eigenvector directions in the work are

$\lambda = 2:\begin{pmatrix}
{- \frac{2}{3}} \\
1
\end{pmatrix},\quad\lambda = 4:\begin{pmatrix}
0 \\
1
\end{pmatrix}.$

Thus it diagonalizes to $D = \begin{pmatrix}
2 & 0 \\
0 & 4
\end{pmatrix}$.

## 7.1 Exercise 18

For reflection in a plane, the plane is the $1$-eigenspace and has dimension two; its normal direction is the $- 1$-eigenspace. With an eigenbasis, the submitted diagonal form is

$\begin{pmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & {- 1}
\end{pmatrix}.$

## 7.1 Exercise 42

The matrices in $V$ are written as

$\begin{pmatrix}
a & b & 0 \\
0 & c & 0 \\
0 & d & e
\end{pmatrix}.$

The five matrix units in positions $\left( {1,1} \right),\left( {1,2} \right),\left( {2,2} \right),\left( {3,2} \right),\left( {3,3} \right)$ form the submitted basis, so

$\dim(V) = 5.$

# Part B

## Problem 1

The proof shows that an alternating bilinear form $F$ is antisymmetric:

$F\left( {u + v,u + v} \right) = 0 = F\left( {u,v} \right) + F\left( {v,u} \right).$

Conversely, antisymmetry gives $F\left( {u,u} \right) = 0$. Since $F\left( {e_{1},e_{2}} \right) = 1$, bilinearity then identifies the form with the determinant:

$F\left( {\begin{pmatrix}
a \\
b
\end{pmatrix},\begin{pmatrix}
c \\
d
\end{pmatrix}} \right) = ad - bc.$

## Problem 2

Let $M = \begin{pmatrix}
a & b \\
c & d
\end{pmatrix}$ and let $T(A) = AM$. The submission verifies linearity. In the ordered basis

$\mathcal{E} = \left( {E_{11},E_{12},E_{21},E_{22}} \right),$

it computes

$\lbrack T\rbrack_{\mathcal{E}} = \begin{pmatrix}
a & c & 0 & 0 \\
b & d & 0 & 0 \\
0 & 0 & a & c \\
0 & 0 & b & d
\end{pmatrix}.$

The determinant calculation is

$\det\left( \lbrack T\rbrack_{\mathcal{E}} \right) = \left( {ad - bc} \right)^{2},$

which agrees with the determinant in any other basis. Finally, for

$M = \begin{pmatrix}
2 & 1 \\
0 & 2
\end{pmatrix},$

the only eigenvalue is $2$, with an eigenspace of dimension $2 < 4$ for the induced map; therefore the submitted conclusion is that $T$ is not diagonalizable.

## Problem 3

The construction defines $z$ by the determinant/cross-product functional in ${\mathbb{R}}^{4}$. For the standard choice $u = e_{1}$, $v = e_{2}$, $w = e_{3}$, the work finds

$z = - e_{4}.$

It proves that $z = 0$ exactly when $u,v,w$ are linearly dependent, that $z$ is orthogonal to each of $u,v,w$, and that

$\det\left( {z,u,v,w} \right) = \left\| z \right\|^{2}.$

## Problem 4

The response uses the characteristic polynomial to find eigenvalues, and uses similarity to preserve the polynomial. It then applies the displayed eigenvector criterion to decide diagonalizability.

## Problem 5

For a $2 \times 2$ matrix satisfying $A^{2} = I$, the submission separates the $+ 1$ and $- 1$ eigenvector cases and obtains a diagonal form. The final argument extends this to every dimension by decomposing an arbitrary vector as

$v = \frac{1}{2}\left( {v + Av} \right) + \frac{1}{2}\left( {v - Av} \right),$

where the two summands lie in the $1$- and $- 1$-eigenspaces respectively. Thus $A$ is diagonalizable.
