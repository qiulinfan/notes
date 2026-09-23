#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let bC = math.bb("C")
#let bF = math.bb("F")

= norms

#definition(title: [norm])[
一个 norm on a vector space $V$是一个满足：

+ nonnegativity (0 iff $x = 0$)
+ trianglar ineq
+ homogenity

的 function $norm(dot): V arrow.r bR$
]

== norms on $bC^m$

#example[
以下为 $bC^m$ 上的典型 norms: (absolute value 表示 length, 即 $sqrt(x^* x)$)

Lp-norm: $p$ 越大，the largest length dimension 占 norm 的比重就越大

$norm(x)_p = (sum_(i=1)^m abs(x_i)^p)^(1 / p)$

*$L_infinity$-norm:最长维度.*

$norm(x)_infinity = max_i abs(x_i)$

weighted norm: 给定一个 norm $norm(dot)_k$，这是 weighted version of this norm. 其中 *$W$ 是一个 diagonal matrix, diag 上的是 weights.*

$norm(x)_(W, k) = norm(W x)_k$

TODO (source `03-norms.tex`, line 28): selected TeX refers to `01-fundamentals.assets/Screenshot 2025-01-29 at 22.41.10.png`; the asset is not among the selected chapter sources.

TODO (source `03-norms.tex`, line 29): selected TeX refers to `01-fundamentals.assets/Screenshot 2025-01-29 at 22.41.52.png`; the asset is not among the selected chapter sources.
]

== operator norms on matrix spaces

We know: 所有的 $m times n$ matrix, every entry in $bF$ 也是一个 vector space of $"dim" n m$ over $bF$。

所以我们当然也可以给 matrix 赋范。

matrix 代表一个 linear transformation，所以 norm 的意义实际上是它 stretch vector 的程度的一种评估。

#example[
#definition(title: [#kn[Operator norm]])[
$norm(A)_(m, n) = sup_(z in bC^m, norm(z)_n = 1) norm(A x)_m$

induced by vector norm. 表示它* stretch vector 的最大程度*。其中, source 和 image vector 分别用 norm n,m 来判定。

如果 source 和 image vector 的 norm 是一样的，比如都使用某个 $L_p$ norm，那么我们可以用单个符号表示(induced by $p$-norm):

$norm(A)_p = sup_(z in bC^m, norm(z)_p = 1) norm(A x)_p$

(这更加常用，因为通常我们会对 source 和 image vector 的大小使用相同的评估)
]

#proposition(title: [*diagonal matrix 的 norm: reduced to max diag element*])[
如果 $D$ 是一个 diagonal matrix，那么不论取什么 $p$-norm，我们都有：

$norm(D)_p = max_(1 <= i <= m) abs(d_i)$

其中 $d_i$ 为对角线上的元素。
]

#proof[
很直观。我们要把一个以 $norm(dot)_p$ 为衡量的 unit ball 上的哪个 vector 被拉伸的程度最大，而 diagonal matrix 把每个坐标 $i$ 上的点固定放大 $d_i$ 倍，

因而选择绝对值最大的 $d_k$，拉伸最大的 vector 一定是 $[0 dots 1 dots 0]$ where only the $k$-th coordinate is $1$，因为这个 ball 上所有的 vectors 原本的 norm 都是一样的，而这个 vector 完整地吃到了最大的拉伸程度，其他 vectors 都或多或少吃到了其他 $d_i$ 的拉伸效果。
]

#proposition(title: [*1-norm: reduced to max column sum*])[
$norm(A)_1 = max_(1 <= j <= n) norm(A_(*j))_1$

*matrix 的 1-norm 实则就是 1-norm 最大列的 1-norm.*
]

#proof[
因为

$norm(A x)_1 = norm(sum_i x_j a_j)_1 <= sum_j abs(x_j) abs(a_j)_1$

并且 $sum_j abs(x_j) = 1$，因而这个和 $<= max_j norm(a_j)_1$。

并且我们发现，这个值是可以取到的: suppose $norm(a_k)_1$ 最大，那么取 $e_k$ 就可以了。

直观而言，由于 1-norm 的单位球和它的 image 都是一个多面体，它取到最大的点一定是某个顶点。以这里的 $bR^2$ 为例，一定是 $e_1$, $e_2$ 中的一个。
]

#proposition(title: [*$infinity$-norm: reduced to max row sum*])[
$norm(A)_1 = max_(1 <= i <= m) norm(A_(i*))_1$

*matrix 的 $infinity$-norm 实则就是 $1$-norm 最大行的 $1$-norm.*
]

#proof[
直观上，image 的 sup norm 只取最大的那一个 entry，因而一定是取矩阵*总(absolute)长度最大的一列, 因为每一列都只贡献 image vector 中的一个 entry。*

并且，我们注意到，source vector (on单位球) 包括了*所有的最大 entry 为 $1$ 的 vectors*，这些 vectors 的 sup norm 都是一样的。而要使得 image vector 的 entries 尽可能大，我们一定会*取所有 entries 都为 1 的 vector 作为 input.*

TODO (source `03-norms.tex`, line 89): selected TeX refers to `01-fundamentals.assets/image-20250130003611232.png`; the asset is not among the selected chapter sources.

Note: sup norm 的单位球和它的 image 也都是一个多面体。
]
]

== Caychy-Swartz and Frobeniu norm

#theorem(title: [Hölder inequility and Cachy-Swartz])[
Let $x, y in bC^m$, let $p >= 1, q <= infinity$ s.t.

$1 / p + 1 / q = 1$

*Holder ineq:*

$abs(x^* y) <= norm(x)_p norm(y)_q$

*Cauchy-Schwarz ineq(special case of Hölder ineq when $p = q = 2$):*

$abs(x^* y) <= norm(x)_2 norm(y)_2$
]

#remark[
Holder' ineq 可以 generalize 到 $L_p$-measurable space, Cauchy-Swartz 可以推广到任何 Banach space. 此处不展开.
]

#proof[
*of Cauchy-Swartz:*

By homogenity of inner product and norm, it *suffices to prove for unit vector $u, v$.*

$(u - v)^2 = norm(u)^2 - 2 u^* v + norm(v)^2$

因而

$u^* v <= (norm(u)^2 + norm(v)^2) / 2 = 1 = norm(u) norm(v)$

等号成立 iff $u = v$.
]

#example[
Applying Cauchy-Swartz 可以发现: row vector 的 matrix 2-norm 等于它 (adjointed) 作为 vector 的 vector 2-norm.

这是因为 consider $a := A^*$, 则
$norm(A x) = abs(a^* x) <= norm(a)_2 norm(x)_2$，因而总有 $norm(A x) / norm(x)_2 <= norm(a)_2$。并且这个等号可以取到, by taking $x := a$.
]

#example[
任取两个 vectors $u, v$，它们 outer product 成的 rank-one matrix，其 operator 2-norm 小于等于它们自身的 2-norm 的乘积。

$norm(A x)_2 = norm(u v^* x)_2 = norm(u)_2 abs(v^* x) <= norm(u)_2 norm(v)_2 norm(x)_2$

这是因为: $u v^*$ 这一 outer product 乘以一个向量，即每行都是 $v^*$ 的一个倍数 ($u_i$ 倍) 的矩阵乘以这个向量。因而，每行得到的都是 $u_i$ 乘上 $v^* x$ 这个 inner product，最后得到的就是

$A x = (v^* x) u$

即 $u$ 的一个倍数，这个倍数等于 $v^* x$。
]

#example[
#theorem[
$norm(A B)_(l, n) <= norm(A)_(l, m) norm(B)_(m, n)$
]

(并且通常取不到等号.)

#proof[不证明了. Playing with definition 加上 Cauchy-Swartz.]
]

#definition(title: [Frobenious norm])[
$norm(A)_F := (sum_m sum_n abs(a_(i j))^2)$

等于把这个 matrix 展开为 $m times n$ 的 vector 的 vector 2-norm.
]

#theorem(title: [equivalent form of Frobenius norm])[
$norm(A)_F = sqrt("tr"(A^* A)) = sqrt("tr"(A A^*))$
]

#proof[
trivial. $A^* A$, $A A^*$ 的 trace 上每个元素，都是 $A$ 的一行与自己的 dot product，即这一行作为 row vector 的 2-norm 的平方;
]

#proposition[
$norm(A B)_F^2 <= norm(A)_F^2 norm(B)_F^2$
]

#proof[
因为 $A B$ 的每个 entry $c_(i j)$ 作为 $A_i$ 和 $B_j$ 的 inner product, by Cauchy-Swartz, have

$abs(c_(i j)) <= norm(A_i)_2 norm(B_i)_2$

因而：

$norm(A B)_F <= sum_n sum_m (norm(A_i)_2 norm(B_j)_2)$

$= (sum_n norm(A_i)_2)(sum_m norm(B_j)_2)$

$= norm(A)_F norm(B)_F$

(虽然这看起来很不对, 但容易验证, 这上下两个 sum 是相等的. )
]

#theorem(title: [unitrary matrix preserves 2-norm 和 Frobenius norm])[
Let $Q$ be unitrary, then

$norm(Q A)_2 = norm(A)_2, norm(Q A)_F = norm(A)_F$
]

#proof[
因为 $norm(Q x)_2 = norm(x)_2$ for each $x$.

Frobenius norm:

$"tr"((U A)^* (U A)) = "tr"(A^* U^* U A) = "tr"(A^* A)$
]
