---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/numerical-linear-algebra/chapters/02-orthogonal-vectors-and-matrices.typ"
kgd_source_format: "typst"
kgd_source_sha256: "6077eb579e2e267dbd606fa7e3c52d6dee27f84036a5021b171c2bb72a54fd2c"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let bC = math.bb("C")

= orthogonal vectors and matrices

#definition(title: [adjoint(hermitian conjugate)])[
`^*:` $A = mat(a_11, a_12; a_21, a_22; a_31, a_32) arrow.r A^* = mat(bar(a_11), bar(a_21), bar(a_31); bar(a_12), bar(a_22), bar(a_32))$

(where each overline means complex conjuate.)
]

#remark[
Can easily comfirm:

$(A B)^* = B^* A^*$
]

#definition(title: [standard inner product and norm on $bC^m$])[
The *standard inner product*:

$<x, y> := x^* y = sum_(i=1)^m bar(x_i) y_i$

The *standard norm*:

$norm(x) := sqrt(x^* x)$
]

#remark[
$sqrt(x^* x) = sqrt(sum_(i=1)^m abs(x_i)^2)$，其中 $abs(x_i) = abs(a + b i) = sqrt(a^2 + b^2)$。

*Note: It is actually $sqrt(bar(x_i) x_i)$, but not $sqrt(x_i^2)$，这是因为 $sqrt(bar(x_i) x_i)$ 等于这个 complex scalar isomorphic 到 $bR^2$ 上的 Euclidean norm，*

这是因为两个复数相乘等于长度相乘幅角相加，而 conjugate 的幅角是相反的，*所以 conjugate 之间相乘等于幅角相互抵消，结果在 positive real axis 上，取开方得到长度。*

而平方得到的则是一个转两次的幅角。
]

#remark[
Can easily verifies:

$⟨a, b⟩_(bC) = bar(⟨b, a⟩_(bC))$

且注意：By bilinearity，*对于 $a$ 上的 scaling 在拿出 inner product 外后要进行 conjugate。*
]

#definition(title: [orthogonal, orthonomal vectors])[
Say $x, y in bC^m$ 是 orthogonal vectors，if $x^* y = 0$。

Say $S subset bC^m$ 是 orthogonal 的，如果其中的 vectors 相互 orthogonal。

Say $S subset bC^m$ 是 orthonomal 的，如果其中的 vectors 相互 orthogonal，并且每个 vector 的 norm 都是 1。
]

#theorem(title: [orthogonal $⇒$ lin.ind])[
orthogonal 的 vectors 一定 linearly independent。
]

#proof[trivial.]

#corollary[
orthogonal 的 $"dim"(V)$ 个 vectors 一定是 $V$ 的一个 basis。
]

== decomposing vector by an orthonormal set

#theorem(title: [decomposing vector by an orthonormal set])[
给定 $bC^m$ 中的一个 orthonormal set ${q_1, dots, q_n}$ (by inner product $<dot>$，这里以 standard complex inner product 为例)，
对于一个 arbitrary vector $v$，我们 define:

$r := v - sum_(i=1)^n <q_i, v> q_i$

Claim：这个 *$r$ is orthogonal to ${q_1, dots, q_n}$,* 即我们把这个 $v$ 分解成了在这个 orthonormal set 上的投影与一个和它们都正交的 vector。
]

#proof[
注意：由于 $q_i$ 都是 unit vectors，$<q_i, v> q_i = v / norm(v) cos alpha = "proj"_(q_i)(v)$ *is the projection of $v$ onto the direction of $q_i$.*

我们在两边取和 $q_i$ 的 inner product，for each $i$。由 linearity 可拆开，由 orthgonality 可得到：

$<q_i, r> = <q_i, v> - <q_i, v><q_i, q_i>$

并且由于 $q_i$ 是 unit vector，得到 $<q_i, q_i> = 1$，从而右边为 0。
]

#remark[
如果 $n = m$，那么 $r = 0$，我们把 arbitrary vector 分解成了 ${q_1, dots, q_n}$ 方向上的向量，相当于对它进行了 change of basis。这个 change of basis matrix 就等于 $mat(q_1, dots, q_n)^T$。
]

对于 unit vector $w$，我们刚才已经展示了一个 arbitrary vector $v$ 在它上面的 projection 是：

$"proj"_w(v) = <w, v> w$

现在我们引入另一个形式的 projection 表达：projection matrix

#theorem(title: [projection matrix])[
对于任意的 *unit vector $w$*，we have

$"proj"_w(v) = (w ⊗ w^*) v$

其中 $w ⊗ w^*$ is called the *projection matrix* onto $w$.
]

#proof[
In md.

*Notice that this matrix is rank 1.*
]

#definition(title: [#kn[Unitary matrix]])[
一个 square matrix $Q in bC^(m times m)$ 被称为 unitrary 的，if $Q^* = Q^(-1)$。
]

#remark[
unitrary: 即 $Q Q^* = Q^* Q = I$。

*In real case, 它被称为 orthogonal matrix.*
]

#theorem(title: [unitrary matrix 的充要条件])[
$Q in bC^(m times m)$ is unitrary $⇔$ *its columns are orthonormal* $⇔$ *its rows are orthonormal*
]

#proof[
显然，因为 unitrary $⇔ Q Q^* = Q^* Q = I ⇔ ⟨q_i, q_j⟩ = delta_(i j)$
]

#theorem(title: [unitrary transfromation preserves inner product and length])[
如果 $Q in bC^(m times m)$ is unitrary，那么对于任意的 $x, y in bC^m$，都有：

$(Q x)^* (Q y) = x^* y$

并且自然得到 $norm(Q x) = norm(x)$
]

#proof[
Follows from: $(A B)^* = B^* A^*$: $(Q x)^* (Q y) = x^* Q^* Q y = x^* y$
]

#remark[
并不 preserve 自定义的 inner product，只 *preserve standard inner product 和 standard norm.*
]
