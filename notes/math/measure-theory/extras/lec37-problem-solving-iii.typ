#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= problem solving-III
<problem-solving-iii>
#example(
)[
Let $f in L_(l o c)^2\(bb(R)\)$. \ Assume $ integral_a^a\|t\|\|f\(x + t\)\|thin d t gt.eq 2 / sqrt(3) a^2 $for all $a > 0$, $x in bb(R)$. \ Now show: $\|f\(x\)\|gt.eq 1$ for a.e. $x$. \

]
#proof[
WLOG 可以假设 $f$ 是 nonneg 的. ($f mapsto\|f\|$). \ WTS: $\|f\(x\)\|gt.eq 1$ for a.e. $x$. \ Claim 1: by LDT, it STS: $ frac(1, 2 a) integral_(- a)^a f\(x + t\)thin d t gt.eq 1 $for all $x in bb(R)$. \ 我们 try Cauchy Swartz:
$ integral_(- a)^a\|t\|f\(x + t\)thin d t lt.eq \( integral_(- a)^a t^2 thin d t \)^(1\/2) \( integral_(- a)^a f\(x + t\)^2 thin d t \)^(1\/2) $
我们知道: 左边 $gt.eq 2 / sqrt(3) a^2$, 而右边第一项 $\(integral_(- a)^a t^2 thin d t\)^(1\/2)$ 是可以计算的: 等于 $\(frac(2 a^3, 3)\)^(1\/2)$. \ 于是, 我们得到 $ integral_(- a)^a f\(x + t\)^2 thin d t gt.eq 2 a $
从而:
$ frac(1, 2 a) integral_(- a)^a f\(x + t\)^2 thin d t gt.eq 1 $
然后 by LDT: $ frac(1, 2 a) integral_(- a)^a f\(x + t\)^2 thin d t = frac(1, 2 a) integral_(x - a)^(x + a) f\(y\)^2 thin d y = f\(x\)^2 $
for a.e. $x$. 因而 $ f\(x\)^2 gt.eq 1 thin quad upright("for a.e. ") x $于是 $ \|f\(x\)\|gt.eq 1 thin quad upright("for a.e. ") x $

]

#example(
)[
Prove or disprove: 对于 bounded open set $E subset bb(R)$, 它的 boundary 是否一定满足 $m\(partial E\)= 0$ ? \

]
#solution[
Astonishingly 这个问题的回答是否定的. 我们可以构造

]
