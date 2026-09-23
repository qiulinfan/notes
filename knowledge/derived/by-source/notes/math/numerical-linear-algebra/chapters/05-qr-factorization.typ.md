---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/numerical-linear-algebra/chapters/05-qr-factorization.typ"
kgd_source_format: "typst"
kgd_source_sha256: "7e999d042de59a6fbf13b1686c5483da3e14e64cef90d1111f94cb6776ad496f"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let bC = math.bb("C")

= QR factorization

== projector

#definition[
我们称一个 operator $P: bC^n arrow.r bC^n$ 为一个 projector, if

$P^2 = P$

Note: *不要求是 linear 的.* For linear case, 这是一个* idempotent linear map.*

(而我们将主要关注于 linear orthogonal projector.)
]

#remark[
一个 projector 总有：

$P^m = P$

对于任意 $m$ 次 composition。

即：在第一次作用后，之后再对其结果进行这一映射不作出任何改变。

直观：这个映射的效果是把一个向量投影到一个低维度子空间上，从而，在作用过一次后，再次施加这一映射将没有任何改变。
]

#remark[
对于 orthogonal 的 projector，我们称其为 orthogonal projector; 对于 non-orthogonal 的 projector，我们称其为 oblique projector.
]

#remark[
projector 虽然不保证是 linear 的，但是要么是 linear 的，要么就是个 affine transformation. 和 linear 也差不多. 不用在意这些细节.
]

以下，我们都只考虑 projector linear 的情况. nonlinear 的情况是类似的.

#lemma[
我们发现，一个 projector $P$ 沿着 $S_1 := "ker"(P)$ 把空间投影到 $S_2 := "im"(P)$ 上.
]

#lemma[
一个 projector 的 eigenvalue 只有可能是 $0$ 或者 $1$. 它的 SVD 同时也是 eigenvalue decomposition:

$P = Q Sigma Q^*$

其中 $Sigma$ 是一个前面全 1, 后面全 0 的对角矩阵.
]

#lemma(title: [complement projector])[
如果 $P$ 是一个 projector，那么 $I - P$ 也是一个 projector.

我们称 $I - P$ 为 $P$ 的 complementary projector.

并且我们有: *complementary projector 的 ker 是原 projector 的 im, im 是原 projector 的 ker.*
]

#remark[
$P$ 把 vectors 沿着 $S_1$ 投影到 $S_2$;

$I - P$ 把 vectors 沿着 $S_2$ 投影到 $S_1$.
]

#definition(title: [#kn[Orthogonal projector]])[
我们称一个 projector 是 orthogonal projector，如果 $"ker"(P) perp "im"(P)$.
]

#theorem[
一个 projector $P$ 是 orthogonal projector $⇔ P = P^*$，即 $P$ 是 Hermitian 的.
]

#theorem[
一个 projector $P$ 是 orthogonal projector，则它的 *complementary projector $I - P$ 也是 orthogonal projector.*
]

#corollary[
orthogonal projector $P$ 的 complementary $I - P$ 把 vectors 投影到 $"im"(P)^perp$ 上.
]

== classical Gram-Schmidt orthogonalization

classical Gram-Schmidt 是计算 reduced QR 分解的算法.

TODO (source `05-qr-factorization.tex`, lines 77–82): selected TeX includes the figure `assets/Screenshot 2025-04-17 at 11.44.46.png`, captioned `reduced QR` and labelled `fig:reduced QR`; the asset is not among the selected chapter sources.

=== idea of triangular orthogonalization

classical Gram-Schmidt orthogonalization 的 idea 是: 我们逐列地将 $A$ 的 columns 转变为相互 orthogonal 的新列.

具体: 我们每次都把 $a_j$ 减去 $a_1, dots, a_(j-1)$ 的 span 包含的成分，从而制作成和 $a_1, dots, a_(j-1)$ 的 span 正交的新列 $q_j$:

$q_j := "normalized"(a_j - "proj"_(⟨a_1, dots, a_(j-1)⟩) a_j)$

$= "normalized"(a_j - "proj"_(⟨q_1, dots, q_(j-1)⟩) a_j)$

展开这个定义:

$v_j := a_j - (q_1^* a_j) q_1 - (q_2^* a_j) q_2 - dots - (q_(j-1)^* a_j) q_(j-1)$

$q_j := v_j / abs(v_j)$

这个过程可以通过定义:

$r_(i j) = q_i^* a_j (i != j), quad abs(r_(j j)) = norm(a_j - sum_(i=1)^(j-1) r_(i j) q_i)_2$

(Note that the sign of $r_(j j)$ is not determined. Arbitrarily, we may choose $r_(j j) > 0$, in which case we shall finish with a factorization $A = hat(Q) hat(R)$ in which $hat(R)$ has positive entries along the diagonal.)

从而这个过程写作:

$v_j := a_j - sum_(i=1)^(j-1) r_(i j) q_i$

$q_j := v_j / r_(j j)$

我们发现:

$q_1 = a_1 / r_11$

$q_2 = (a_2 - r_12 q_1) / r_22$

$q_3 = (a_3 - r_13 q_1 - r_23 q_2) / r_33$

$⋮$

$q_n = (a_n - sum_(i=1)^(n-1) r_(i n) q_i) / r_(n n)$

这个过程使得:

$a_j = sum_(i=1)^j r_(i j) q_i$

从而:

$A = hat(Q) hat(R)$

=== algorithm

Classical Gram-Schmidt (unstable)

```text
FOR j = 1 TO n
    v_j ← a_j
    FOR i = 1 TO j-1
        r_ij ← q_i* a_j
        v_j ← v_j - r_ij q_i
    ENDFOR
    r_jj ← ||v_j||_2
    q_j ← v_j / r_jj
ENDFOR
```

== modified Gram-Shimitdt (triangular orthogonalization)

== Household Triangularization
