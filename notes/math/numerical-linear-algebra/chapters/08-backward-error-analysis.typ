#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= backward error analysis of NLA algorithms

Source attribution in the selected TeX chapter title: `doi:10.1137/1.9780898719574.ch3`.

我们在上一个 Ch 中介绍了 conditioning 和 stability. 现在我们用它们对经典的 NLA algorithms 进行 backward error analysis.

== Stability of Householder Triangularization

我们 set $R, Q$ to be random upper triangular 和 orthogonal matrices (by orthogonizing 一个 random matrix)，并 set $A := Q R$.

```matlab
R = triu (randn(50));
[Q,X] = qr(randn(50));
A = Q*R
```

然后我们再对 $A$ 进行 QR 分解, via Household (Matlab 自带使用 Household), 看看 relative error:

```matlab
[Q2,R2] = qr(A);
norm (Q2 - Q);
    ans = 0.00889
norm (R2-R) / norm(R);
    ans = 0.00071
```

我们发现 $Q, R$ 的 relative error 其实很大.

但是，当我们用这个 $Q R$ 计算 $A$ 时:

```matlab
norm (A - Q2*R2) / norm(A);
    ans = 1.432e-15
```

我们发现一个惊人的事实: 这个 QR 分解的 error

$"Q3" = Q + 1 "e" - 4 * "randn"(50)$

$"R3" = R + 1 "e" - 4 * "randn"(50)$

$"norm"(A - "Q3" * "R3") / "norm"(A)$

$"ans" = 0.00088$

== Stability of Back Substitution

== Conditioning of Least Squares

== Stability of Least Squares
