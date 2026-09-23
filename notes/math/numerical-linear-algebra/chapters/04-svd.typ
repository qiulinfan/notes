#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= SVD

SVD 的 motivation：一个 linear transformation 可以通过 *unit sphere 的 image 来唯一确定*。并且，这个 *unit sphere 的 image 一定是一个 hyperellipse (高维椭圆)。*

#definition(title: [principal semiaxes, #kn[Singular value]])[
对于一个 linear transformation $T: bR^n arrow.r bR^m$，我们 denote the unit sphere in $bR^n$ as $S$，把 $T(S)$ 这一 hyperellipse 中相互 orthogonal 的各轴上的 vectors 表示为 ${sigma_1 u_1, dots, sigma_n u_n}$。其中 $sigma_i$ decsending，$u_1, dots, u_n$ 为 unit vectors。

我们称 $u_1, dots, u_n$ 为 left singular vectors，$sigma_1, dots, sigma_n$ 为 singular values，而 ${v_1, dots, v_m}$ 作为
]

== reduced SVD
