---
kgd_schema: "kgdistiller-derived-markdown-v1"
kgd_source: "notes/math/linear-algebra/chapters/08-least-squares.typ"
kgd_source_format: "typst"
kgd_source_sha256: "5356657e130f383d0a58d5bc5b117fda6cfe1414ed51c140eb6ece00b17a54d2"
---

#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *


#let bR = math.bb("R")

= Least squares

== WS 19, p. 1: projection and image/kernel theorem

#theorem(title: [Projection and #kn[Least squares method]])[
对于任意 subspace $V subset.eq bR^n$, $forall  x in bR^n$,
$"proj"_V( x)$ is $V$ 中离 $ x$ 最近的 vector, i.e.
$ v in V$, $norm( x-"proj"_V( x))<=norm( x- v)$.
]
The source diagram labels $norm( x-"proj"_V( x))$ as the 垂直距离.

(a) $A x= b$ is consistent iff $ b in "im"A$: if
$exists  x$ such that $A x= b$, then $ b in "im"A$, and
conversely. (b) 不可能 $ b$ 不在 $"span"("cols of A")$ 而
$A x= b$ be consistent. (c), least squares solutions: if
$A x= b$ is not consistent, let $V="im"A$,
$ b'="proj"_V( b)$. Then $A x= b'$ has a solution because
$ b' in V$; the solutions in that solution set are the least squares
solution to this system.

The worksheet also records
$
A x dot  y=(A x)^t y= x^t A^t y
= x dot (A^t y).
$

#theorem(title: [Image-kernel orthogonality])[
For an $m times n$ matrix $A$,
$"ker"(A^t)=("im"A)^perp$.
]
Write $A=mat( v_1,dots, v_n)$, so
$A^t=mat( v_1^t;dots; v_n^t)$. If $ x in "ker" A^t$, then
$ v_i dot x=0$ for every $i$, so $ x perp "im"A$.
Conversely, if $ x in("im"A)^perp$, then every $ v_i dot x=0$,
so $A^t x= 0$.

A second proof uses the displayed transpose identity:
$ y in "ker" A^t arrow.r A x dot y=0$ for all $ x$, hence
$ y in("im"A)^perp$; conversely $A x dot y=0$ for all $ x$
implies $A^t y= 0$.

Consequently
$("ker" A^t)^perp="im"A$, and
$"ker" A=("im"A^t)^perp$. The rank computation is
$
"rank"(A^t)=n-"dim"("ker" A^t)
="dim"("im"A)="rank"(A).
$

== WS 19, p. 2: normal equations

The normal equation:
$A x= b$ 的 least square 解当且仅当
$A x="proj"( b)$
is a solution of
$
A^t A x=A^t b.
$

#theorem(title: [Kernel of $A^t A$])[
For an $m times n$ matrix $A$, $"ker" A="ker"(A^t A)$.
]
If $ x in "ker"(A^t A)$, then $A^t A x= 0$, so
$A x in "ker" A^t=("im"A)^perp$. Since $A x in"im"A$ and
$"im"A$ 与 $("im"A)^perp$ only meet at $ 0$, so $A x= 0$.
Conversely $A x= 0$ directly implies $A^t A x= 0$.

For the rest proof of normal equation, the source diagram records
$ b-"proj"_("im"A)( b) in("im"A)^perp="ker"(A^t)$. Thus
$A x- b in "ker"(A^t)$, whence
$
A^t(A x- b)= 0,
quad A^t A x=A^t b.
$

总结：对于 $T_A:bR^n arrow.r bR^m$,
$T_(A^t):bR^m arrow.r bR^n$, 使得对于 $ x in bR^n$ 及
$ y in bR^m$，$(A x)dot y= x dot(A^t y)$ 是 transpose
本质的性质；它告诉我们 $A$ 是 $bR^n$ 到 $bR^m$ 的 linear map.
