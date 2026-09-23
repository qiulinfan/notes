#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *


#let bR = math.bb("R")

= Inner-product spaces

== WS 20, p. 1: examples and generalized Gram--Schmidt

For the #kn[Inner product space] $V$ of functions on $[-pi,pi]$,
$<f,g>=1/pi integral_(-pi)^pi f(t)g(t) dif t$:

1. $<f,g>=<g,f>$.
2. Linearity:
   $<a f_1+b f_2,g>=a/pi integral_(-pi)^pi f_1(t)g(t)dif t
   +b/pi integral_(-pi)^pi f_2(t)g(t)dif t=a<f_1,g>+b<f_2,g>$.
3. Positive definite:
   $<f,f>=1/pi integral_(-pi)^pi f^2(t)dif t$, and
   $f^2(t)>0 arrow.r <f,f>>0$.

(b) 同 (a)，inner product space $V$. (c) 不是 inner prod space: can diverge,
$infinity$ 不在 $bR$.

P4: find two different inner products in $bR^2$:
$<x,y>=x_1y_1+x_2y_2$ (dot product; here $e_1,e_2$ are orthonormal), and
different weight $<x,y>=3x_1y_1+2x_2y_2$.

P5: Every finite dimensional inner product space has an orthonormal basis.
Take
$
u_1=v_1/"norm"(v_1),
quad
u_2=(v_2-(v_2 dot u_1)u_1)/norm(v_2-(v_2 dot u_1)u_1),
$
and, in general,
$
u_n=(v_n-sum_(j=1)^(n-1)(v_n dot u_j)u_j)/
norm(v_n-sum_(j=1)^(n-1)(v_n dot u_j)u_j).
$
proof: generalized Gram--Schmidt.

== WS 20, p. 2: coordinates and matrix inner products

P8: 任选 orthonormal basis $U$ for inner product $<dot,dot>$. Then
$(V,<dot,dot>)$ 上
$
< x, y>=[ x]_U dot [ y]_U.
$
Indeed $ x=sum_i a_i u_i$, $ y=sum_j b_j u_j$, so
$
< x, y>=sum_i sum_j a_i b_j< u_i, u_j>
=sum_i a_i b_i=[ x]_U dot[ y]_U.
$

P9: $forall$ inner product $<dot,dot>$ on $bR^n$, $exists$ an
$n times n$ symmetric matrix $A$ such that
$
forall  x, y in bR^n, < x, y>= x^t A y.
$
For the standard basis, the $(i,j)$th entry of $A$ is
$< e_i, e_j>$. Hence
$
< x, y>=sum_i sum_j x_i y_j< e_i, e_j>
= x^t A y.
$
Because the inner product is symmetric, so is $A$. Its diagonal entries are
positive; $A$ is 可逆 (full rank).

P10: All inner products on $bR^2$ have
$
B_A( x, y)= x^t A y,
quad A=mat(a,b;b,c),
$
where (1) $A$ is symmetric; (2) $a>0$ and $"det" A=a c-b^2>0$.
Indeed
$
mat(x,y)mat(a,b;b,c)mat(x;y)=a x^2+2b x y+c y^2>0.
$
(这个条件等价：充分条件为 $c>0$ 且 $a c-b^2>0="det" A$.) Linearity is
guaranteed by matrix multiplication. 因而这三条为完整条件。

实际上的理解为：把 $bR^n$ 的任何 inner product 都是：把一个 vector 做一个
linear trans 后再做一个 dot product.
