#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *


#let bR = math.bb("R")

= Linear transformations

== WS 4, p. 1: coordinate encoding and standard matrices

现在你的位置为 $5^circle"E",42^circle"N"$。用一个 vector $mat(5;42) in bR^2$
表示方位。现在你使用一个 encode 来加密你的方位：
$
cases(y_1=x_1+3x_2, y_2=2x_1+5x_2),
quad mat(y_1;y_2)=mat(1,3;2,5)mat(x_1;x_2).
$
这个加密方位的码为 $mat(131;220)$. 我们做了一个 transformation，使得 the
same $(y_1,y_2)$ but 坐标不变。例如 $(0,1)$ 从 $(x_1,x_2)$ 坐标 map 到
$(y_1,y_2)$ 坐标后仍是 $(0,1)$；但 $(y_1,y_2)$ 下的 $(3,5)$ 同样在
$(x_1,x_2)$ 下为 $(3,5)$，而 $(y_1,y_2)$ 下的 $(5,42)$ 在 $(x_1,x_2)$ 下为
$(131,220)$。The source sketch marks these corresponding points and axes.

#definition(title: [#kn[Linear transformation]])[
A function $T:bR^m arrow.r bR^n$ is called a linear transformation if for
every $ x in bR^m$ there is an $n times m$ matrix $A$ such that
$T( x)=A  x$.

Example: $y=x_1^2+x_2^2+x_3^2$ has input $mat(x_1;x_2;x_3)$ and output
$[y]$; $A=mat(x_1,x_2,x_3)$. 可以发现 $y= x dot  x$ is not a linear
transformation of $ x$.
]

#definition(title: [Identity matrix])[
Identity matrix, denoted by $I_n$:
$I_2=mat(1,0;0,1)$ and $I_3=mat(1,0,0;0,1,0;0,0,1)$.

For $T( x)=mat(0,-1;1,0) x$, $T(mat(1;1))=mat(-1;1)$ and
$T(mat(0;-2))=mat(2;0)$; it is a counterclockwise rotation by $90$ degrees.
Also $ x$ and $T( x)$ have the same length:
$sqrt(x_1^2+x_2^2)=sqrt((-x_2)^2+x_1^2)$. The source diagram labels the
two arrows $ x$ and $T( x)$.
]

For $T( x)=A  x$ with $A=mat(1,2,3;4,5,6;7,8,9)$,
$T(mat(1;0;0))=mat(1;4;7)$ and $T(mat(0;1;0))=mat(2;5;8)$.

== WS 4, p. 2: linearity, bases, and transition matrices

#theorem(title: [Standard matrix])[
Consider a linear transformation $T:bR^m arrow.r bR^n$. Let $ e_i$ be
the vector whose $i$th component is $1$ and all other components are $0$.
Then $A=mat(T( e_1),T( e_2),dots,T( e_m))$.
Equivalently, $ e_1, e_2,dots, e_m$ is the standard vector of
$bR^n$ (而 $bR^3$ 中的 $ e_1, e_2, e_3$ 都用 $i,j,k$ 来 denote).
]

#theorem(title: [Linearity test])[
A transformation $T:bR^m arrow.r bR^n$ is linear iff (a)
$forall  v, w in bR^m$, $T( v+ w)=T( v)+T( w)$; and
(b) $forall  v in bR^m$ and scalar $k$, $T(k  v)=k T( v)$.
]

#definition(title: [Distribution vectors and transition matrices])[
A vector $ x in bR^n$ is said to be a distribution vector if its
components (1) sum to $1$ and (2) are all $>=0$. A square matrix $A$ is a
transition matrix if its col vectors are distribution vectors.
]
