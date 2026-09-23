#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

== Homework 3 — submitted work

#note[Visual transcription of the personal finished submission. Source: `217-Hw-3-finished.pdf`; page references below are PDF pages.]

=== Source p. 1 — Exercise 20

Reflection about the $x-z$ plane sends $mat(v_1;v_2;v_3)$ to $mat(v_1;-v_2;v_3)$. The submitted standard matrix is $mat(1,0,0;0,-1,0;0,0,1)$, accompanied by a sketch of the reflected vector.

=== Source p. 2 — Exercise 38(a)--(c)

(a) Projection onto an arbitrary unit vector $u=mat(u_1;u_2)$ has matrix $mat(u_1^2,u_1u_2;u_1u_2,u_2^2)$. Its determinant is $0$, so it is not invertible.

(b) A reflection matrix is $mat(a,b;b,-a)$ with $a^2+b^2=1$; its determinant is $-1$, so it is invertible.

(c) A rotation matrix is $mat(a,-b;b,a)$ with $a^2+b^2=1$; its determinant is $a^2+b^2=1$, so it is invertible.

=== Source p. 3 — Exercise 38(d); Exercise 18 begins

(d) The horizontal and vertical shear matrices are $mat(1,k;0,1)$ and $mat(1,0;k,1)$. Each has determinant $1$, so each is invertible.

For Exercise 18, let $A=mat(2,3;-3,2)$ and $B=mat(a,b;c,d)$. Equating $A B$ and $B A$ yields $b=-c$ and $a=d$, so $B=mat(a,b;-b,a)$.

=== Source p. 4 — Exercise 34

For $A=mat(1,1;0,1)$, the submitted computations are

$A^2=mat(1,2;0,1)$, $A^3=mat(1,3;0,1)$, $A^4=mat(1,4;0,1)$, and $A^1001=mat(1,1001;0,1)$.

Thus $A^k=mat(1,k;0,1)$ for positive $k$. Geometrically, repeated application is a horizontal shear by one unit each time.

=== Source p. 5 — Exercise 12

For $A=mat(2,5,0,0;1,3,0,0;0,0,1,2;0,0,2,5)$, the submission applies the invertible-matrix test through row reduction of $[A:I_4]$. The displayed operations first exchange the first two rows and then use pivots to clear the two $2 times 2$ blocks.

=== Source p. 6 — Exercise 12; Exercise 34 begins

The final augmented matrix is $[I_4:A^-1]$, with

$A^-1=mat(3,-5,0,0;-1,2,0,0;0,0,5,-2;0,0,-2,1)$.

By Theorem 2.4.5, $A$ is invertible.

For a diagonal $A=mat(a,0,0;0,b,0;0,0,c)$, the submitted answer says $A$ is invertible precisely when $a,b,c != 0$, and then $A^-1=mat(1/a,0,0;0,1/b,0;0,0,1/c)$. A diagonal matrix of arbitrary size is invertible iff every diagonal element is nonzero.

=== Source p. 7 — Part B, Problem 1(a)--(b)

The source defines trace, determinant, transpose, and symmetric matrix, then asks truth values for transpose claims. The submission marks (a) false and takes $A=mat(1,2;2,1)$ and $B=mat(1,2;1,2)$. It computes $A B=mat(3,6;3,6)$, $B^T=mat(1,1;2,2)$, $A^T=mat(1,2;2,1)$, and $A^T B^T=mat(5,5;4,4)$, so $(A B)^T != A^T B^T$.

For (b), it marks false using the same matrices and records $A B=A^T B^T=mat(5,4;4,5)$ as a counterexample to the universal inequality.

=== Source p. 8 — Part B, Problem 1(c)

The statement $(A B)^T=B^T A^T$ is marked true. Let $A$ be $n times p$ and $B$ be $p times m$. The work writes both matrices by entries and notes that $(B^T A^T)$ has the same $m times n$ shape as $(A B)^T$.

=== Source p. 9 — Part B, Problem 1(c)--(d)

The $j,i$ entry of $B^T A^T$ is computed as

$sum_(k=1)^p b_(k j) a_(i k)=sum_(k=1)^p a_(i k) b_(k j)$,

the $j,i$ entry of $(A B)^T$. Since $i,j$ are arbitrary, $(A B)^T=B^T A^T$.

For (d), the submission begins induction: for a symmetric $A=mat(a,b;b,a)$, $A^1=A$ is symmetric, and if $A^n=mat(c,d;d,c)$, then $A^(n+1)=A^n A$.

=== Source p. 10 — Part B, Problem 1(d)--(e)

The inductive multiplication is

$mat(c,d;d,c) mat(a,b;b,a)=mat(a c+b d,a d+b c;a d+b c,a c+b d)$,

which is symmetric. Hence $A^n$ is symmetric for all $n in NN$.

(e) is false: $A=mat(1,3;2,7)$ is not symmetric, while $A^2=mat(7,24;16,55)$ is recorded as symmetric in the submitted counterexample.

=== Source p. 11 — Part B, Problem 2(a)--(c)

(a) True. A $3 times 3$ matrix with a zero row has at most two leading 1s, so $"rank"(A) <= 2$; by Theorem 2.4.3 it is not invertible.

(b) False. The counterexample is $mat(1,1,0;1,1,0;0,0,1)$, whose RREF has rank $2 != 3$, so it is not invertible.

(c) True. If $A$ is an invertible $n times n$ matrix, then $A^-1A=AA^-1=I_n$; therefore $A^-1$ is invertible.

=== Source p. 12 — Part B, Problem 2(d)

(d) True. If $A$ is invertible, then $(A^-1)^n$ is an inverse for $A^n$. By associativity, the submission writes the products until adjacent $A^-1A$ pairs become $I_n$, so both products equal $I_n$.

=== Source p. 13 — Part B, Problem 3(a)

If there is an $n times m$ matrix $B$ with $B A=I_n$, suppose $x_1$ and $x_2$ solve $A x=0$. Then $A(x_1-x_2)=0$. Multiplying on the left by $B$ gives $B A(x_1-x_2)=B 0=0$; hence $x_1-x_2=0$ and $x_1=x_2$. Therefore $A x=0$ has a unique solution.

=== Source p. 14 — Part B, Problem 4(a)

Statement (a) is marked true. Write $A=[v_1,v_2,dots,v_m]$ and $B=[w_1,w_2,dots,w_k]$. By Theorem 2.3.2,

$A B=A[w_1,w_2,dots,w_k]=[A w_1,A w_2,dots,A w_k]$.

If $w_i=mat(w_(1 i);dots;w_(m i))$, then by Theorem 1.3.8,

$A w_i=w_(1 i)v_1+w_(2 i)v_2+dots+w_(m i)v_m$.

Thus every column of $A B$ is a linear combination of the columns of $A$.

=== Source p. 15 — Part B, Problem 4(b)

Statement (b) is false. The counterexample uses $A=mat(1,0;0,0)$ and $B=mat(1,1;1,1)$, so $A B=mat(1,1;0,0)$. Its first column $mat(1;0)$ is not a linear combination of the columns $mat(1;1)$ and $mat(1;1)$ of $B$: the submitted RREF shows that the corresponding system is inconsistent.

=== Source p. 16 — Part B, Problem 5(a)

For a linear $f:RR^d arrow RR^d$, the proof by induction has base $n=1$, where $f^1(x)=f(f^0(x))=f(x)$ is linear. Assuming $f^n$ is linear, write $f(x)=A x$. The key theorem gives a matrix $B$ with $f^n(x)=B x$; hence

$f^(n+1)(x)=f(f^n(x))=f(B x)=A(B x)=(A B)x$,

so it is linear. Thus $f^n$ is linear for all $n in NN$.

=== Source p. 17 — Part B, Problem 5(a)

The submission restates the inductive conclusion: the base case and inductive step prove that if $f$ is a linear transformation, then $f^n$ is a linear transformation for all $n in NN$.

=== Source p. 18 — Part B, Problem 5(b)

Define $f:RR^2 arrow RR^2$ by $f(x)=-x$ if $norm(x)=2$, and $f(x)=x$ otherwise. The submission says $f$ is not linear: choose $x_1,x_2$ with $norm(x_1)=2$ and $norm(x_2) !=2$, then $f(x_1+x_2)=x_1+x_2$ while $f(x_1)+f(x_2)=-x_1+x_2$. But $f^2(x)=x$ for all $x$, so $f^2$ is the identity and is linear.

=== Source p. 19 — Part B, Problem 5(c)

Let $f(x)=A x$. If $f(x)=0$ has a unique solution, then $A x=0$ has a unique solution; by Theorem 1.3.4, $"rank"(A)=d$, hence by Theorem 2.4.3 $A$ is invertible. Problem 3 has shown that $A^n$ is invertible for every $n in NN$. Since $f^n(x)=A^n x$, Theorem 1.3.4 gives a unique solution to $A^n x=0$, proving the claim.
