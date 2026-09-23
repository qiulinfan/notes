#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

== Homework 5 - submitted work

=== Exercise 56 - linear independence

Rearrange the four given vectors as

$
v_1=mat(e;1;0;0;0;0), quad v_2=mat(k;m;1;0;0;0),
quad v_3=mat(a;b;c;d;1;0), quad v_4=mat(f;g;h;i;j;1).
$

Each $v_i$ has an entry where all preceding vectors have $0$ and it has a
nonzero entry.  Thus, in a relation $c_1v_1+c_2v_2+c_3v_3+c_4v_4=0$, the
sixth coordinate forces $c_4=0$, and the same argument forces
$c_3,c_2,c_1=0$ one by one.  The vectors are linearly independent for all
$a,b,dots,m in bR$.

=== Exercise 33 - hyperplanes

For $c_1 x_1+dots+c_n x_n=0$, let
$A=mat(c_1,c_2,dots,c_n)$.  The hyperplane is $"ker"(T_A)$, and the image
of $T_A:bR^n arrow bR$ is nonzero because some $c_i != 0$.  Hence its image
has dimension $1$, and rank-nullity gives

$"dim"(V)=n-1.$

Thus a hyperplane in $bR^3$ is a plane, and a hyperplane in $bR^2$ is a
line.

=== Exercise 63 - equal-dimensional nested subspaces

Let $(v_1,dots,v_m)$ be a basis of $V$, with $V subset W$ and
$"dim"(V)="dim"(W)=m$.  The vectors $v_1,dots,v_m$ lie in $W$ and are
linearly independent.  By Theorem 3.3.4 they form a basis of $W$.  Every
$w in W$ is therefore a linear combination of the $v_i$, so $w in V$.
Thus $W subset V$, and $V=W$.

=== Exercise 12 - arithmetic sequences

Let $S$ be the set of all arithmetic sequences.  It contains the zero
sequence.  If

$m=(m_0,m_0+k,m_0+2k,dots), quad n=(n_0,n_0+l,n_0+2l,dots),$

then

$m+n=(m_0+n_0,m_0+n_0+(k+l),m_0+n_0+2(k+l),dots) in S.$

For $r in bR$,

$r(m_0,m_0+k,m_0+2k,dots)=(r m_0,r m_0+r k,r m_0+2r k,dots) in S.$

Hence $S$ is a subspace.

=== Exercise 28 - commuting $2 times 2$ matrices

Let $A=mat(a,b;c,d)$ and $B=mat(1,1;0,1)$.  The equation $A B=B A$ gives

$mat(a,a+b;c,c+d)=mat(a+c,b+d;c,d),$

so $c=0$ and $a=d$.  Therefore

$S={mat(a,b;0,a) | a,b in bR}
= {a mat(1,0;0,1)+b mat(0,1;0,0) | a,b in bR}.$

The displayed matrices are linearly independent, so they are a basis and
$"dim"(S)=2$.

== Part A - Problem 6

For each diagram, the submitted dependent triples are:

* (a) $(v_1,v_2,v_3)$, $(v_1,v_2,v_5)$, $(v_1,v_2,v_4)$,
  $(v_1,v_3,v_5)$, $(v_1,v_3,v_4)$, $(v_2,v_3,v_4)$,
  $(v_2,v_3,v_5)$, $(v_3,v_4,v_5)$, $(v_2,v_4,v_5)$,
  $(v_1,v_4,v_5)$ (10 sets).
* (b) $(v_1,v_2,v_3)$, $(v_1,v_2,v_5)$, $(v_1,v_2,v_4)$,
  $(v_1,v_3,v_5)$, $(v_2,v_3,v_4)$, $(v_3,v_4,v_5)$,
  $(v_2,v_4,v_5)$, $(v_1,v_4,v_5)$ (8 sets).
* (c) $(v_1,v_2,v_3)$, $(v_1,v_2,v_5)$, $(v_1,v_3,v_5)$,
  $(v_2,v_3,v_4)$, $(v_3,v_4,v_5)$, $(v_2,v_4,v_5)$ (6 sets).
* (d) $(v_1,v_2,v_3)$, $(v_1,v_3,v_5)$, $(v_1,v_3,v_4)$,
  $(v_2,v_3,v_4)$, $(v_2,v_3,v_5)$, $(v_2,v_4,v_5)$.

== Part B

=== Problem 1 - images of independent lists

==== (a)

False.  Let $T:bR^2 arrow bR^2$ be $T(x)=mat(0,0;0,0)x$.  The vectors
$mat(1;0),mat(0;1)$ are linearly independent, but their images are both
$0$, so the image list is linearly dependent.

==== (b)

True.  Assume $Y=(T(x_1),dots,T(x_k))$ is linearly independent and
$d_1 x_1+dots+d_k x_k=0_V$.  Then

$d_1 T(x_1)+dots+d_k T(x_k)=T(0_V)=0_W.$

Independence of $Y$ gives $d_1=dots=d_k=0$, so $X$ is linearly
independent.

=== Problem 2 - prescribed kernel and image

The rref required by

$"ker"(T)={x in bR^5 | x_1=5x_2, x_3=7x_4}$

is

$mat(1,-5,0,0,0;0,0,1,-7,0;0,0,0,0,0).$

The target image has basis $mat(1;0;1),mat(0;1;0)$.  Choosing the first and
second nonredundant columns accordingly gives

$A=mat(1,-5,0,0,0;0,0,1,-7,0;1,-5,0,0,0),$

and $T(x)=A x$ is one solution.

The transformation is not unique.  For example, elementary transformations
preserve the rref, and

$A'=mat(5,-25,0,0,0;0,0,1,-7,0;5,-25,0,0,0)$

has the same required kernel and image but is different from $A$.

=== Problem 3 - maps defined on a basis

==== (a)

Let $cal(B)=(x_1,dots,x_n)$ be a basis of $X$, and write
$v=c_1 x_1+dots+c_n x_n$.  Define

$T(v)=c_1 T(x_1)+dots+c_n T(x_n)=c_1 y_1+dots+c_n y_n.$

For $v_1=sum d_i x_i$, $v_2=sum e_i x_i$, this rule gives

$T(v_1+v_2)=sum(d_i+e_i)T(x_i)=T(v_1)+T(v_2)$

and $T(k v_1)=k T(v_1)$, so it is linear.  If $T'$ has the same values on
the basis, then $T'(v)=sum c_i T'(x_i)=sum c_i y_i=T(v)$, so it is unique.

==== (b)

Let $"dim"(X)=n$ and let $(u_1,dots,u_k)$ be a basis of $U$.  Extend it to
a basis $(u_1,dots,u_k,w_(k+1),dots,w_n)$ of $X$.  Since
$"dim"(V)=n-k$, choose a basis $(v_1,dots,v_(n-k))$ of $V$ and define

$T_(U,V)(u_i)=0, quad T_(U,V)(w_(k+j))=v_j.$

By part (a), this is a valid linear transformation.  Its image is $V$ and
its kernel is $U$.

==== (c)

The map is not unique: the construction depends on an arbitrarily chosen
basis of $V$.  Choosing a different basis can give different images for the
$w_(k+j)$ while retaining the required kernel and image.

=== Problem 4 - ranks and nullities of a composition

==== (a)

True.  Since $"im"(S compose T) subset "im"(S)$,

$"rank"(S compose T)="dim"("im"(S compose T)) <= "rank"(S).$

==== (b)

True.  View the composition in two stages.  First $T:U arrow V$; then
$S:"im"(T) arrow W$.  Rank-nullity for the restricted second map gives

$"rank"(S compose T) = "rank"(T)-"dim"("ker"(S')) <= "rank"(T).$

==== (c)

True.  Rank-nullity yields

$"rank"(T)+"nullity"(T)="rank"(S compose T)+"nullity"(S compose T).$

Part (b) then implies
$"nullity"(S compose T) >= "nullity"(T)$.

==== (d)

False.  If $T$ is surjective, then $S(V)=0_W$, so
$"nullity"(S)="dim"(V)$ and $"nullity"(S compose T)="dim"(U)$.  When
$"dim"(U)<"dim"(V)$, the claimed inequality fails.

=== Problem 5 - symmetric and skew-symmetric matrices

For $T(A)=A+A^T$:

==== (a)

$T(A_1+A_2)=(A_1+A_2)+(A_1+A_2)^T=T(A_1)+T(A_2)$, and
$T(k A)=k A+(k A)^T=k T(A)$, so $T$ is linear.

==== (b)

If $A in "ker"(T)$, then $A^T=-A$, so $A in "Skew"_n$.  Conversely,
$B^T=-B$ implies $T(B)=0$, so $"ker"(T)="Skew"_n$.  Also
$C=M+M^T$ satisfies $C^T=C$, whence $"im"(T) subset "Sym"_n$.  If
$D in "Sym"_n$, choose $N=1/2D$; then $N+N^T=D$.  Therefore
$"im"(T)="Sym"_n$.

==== (c)

Both are subspaces.  Each contains the zero matrix.  If $A^T=-A$ and
$B^T=-B$, then $(A+B)^T=-(A+B)$ and $(k A)^T=-k A$; this proves the subspace
conditions for $"Skew"_n$.  Replacing $-A,-B$ by $A,B$ gives the same
argument for $"Sym"_n$.

==== (d)

There are $n^2$ free entries in an arbitrary $n times n$ matrix.  In a
symmetric matrix, entries below the diagonal mirror entries above it, while
the diagonal entries are free.  Thus

$"dim"("Sym"_n)=(n^2-n)/2+n=(n^2+n)/2.$

For a skew-symmetric matrix, the lower entries are the negations of the
upper entries and every diagonal entry is zero.  Thus

$"dim"("Skew"_n)=(n^2-n)/2.$
