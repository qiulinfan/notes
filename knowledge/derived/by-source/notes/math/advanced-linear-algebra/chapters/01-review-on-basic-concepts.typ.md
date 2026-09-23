---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/advanced-linear-algebra/chapters/01-review-on-basic-concepts.typ"
kgd_source_format: "typst"
kgd_source_sha256: "7e5efa092a13ce42a983383972e3aa434138435b25616fc9ec65bbc625010938"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let bF = math.bb("F")

= Review on Basic Concepts

== Subspace and direct sum

#definition(title: [#kn[Subspace]], id: "subspace")[
vector space 的 subset $U subset V$ 为一个 subspace，if 它满足条件：

+ 包含 0
+ 对 addition 和 scalar multiplication 闭合
]

两个 subset 的和就是各取一个元素相加的所有情况.#linebreak()
很显然我们知道：

#proposition[
两个 subspace $U_1, U_2$ 的 sum $U_1 + U_2$ 也是一个 subspace, 并且

$
dim(U_1 + U_2) <= dim(U_1) + dim(U_2)
$

且 $U_1 + U_2$ 是同时包含 $U_1$ 和 $U_2$ 的 $V$ 的最小 subspace.
]

显然可以随便和。同一个 $U$ 自己和自己的和就是自己。所以 subspace sum 这个概念比较大，没什么用。我们需要用 direct sum 来作为一个小一点但是更有用的概念，表达出一种垂直的 subspace 的直观.

#definition(title: [#kn[Direct sum]], id: "direct sum")[
如果 $U_1 + U_2 + dots + U_m$ 中的任意元素 $v$，都存在唯一的 $v_k in U_k$ for each $k$ 使得 $v = sum_k v_k$，就称 $U_1 + dots + U_m = ⊕_(i = 1)^m U_i$ 为一个 direct sum.
]

我们显然发现：

#proposition[
$
dim(⊕_(i = 1)^m U_i) = sum_(i = 1)^m dim(U_i)
$
]

我们发现，其实可以 direct sum 的 subspaces 是 “垂直的”，意思是:

#theorem[
$U_1 + U_2 + dots + U_m$ 是一个 direct sum (这几个空间"垂直") iff 任取 $u_1, u_2, dots, u_m$ 分别来自 $U_1, U_2, dots, U_m$，它们都 lin. ind.
]

并且：

#theorem[
$U_1 + U_2$ 为一个 direct sum iff $U_1 ∩ U_2 = {0}$.
]

#remark[
实际上两个 subspace 的交集里只要有一个非 0 点，那么这个点 span 的整个 dim 为 1 的线都在交集里.
]

#note[
$bF^n = ⊕_(i = 1)^n "span"(e_i)$
]
