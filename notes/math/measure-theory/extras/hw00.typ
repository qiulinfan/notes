#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[hw 0]
<hw-0>
\(Not graded.) Read Sections 0.1-0.3 and 0.5-0.6 in Folland's book. Note: I expect you to have seen much but not necessarily all of this material in earlier courses. It is not necessary to know everything by heart right now. However, in order to succeed in the class, you need to be able to read mathematical material at this level of abstraction and (lack of) detail.

#heading(level: 2, numbering: none)[Approaching 597]
<approaching-597>
Let $A$ be an infinite (not necessarily countable) set, and $f : A arrow.r bb(R)$ a function. Suppose that for every integer $N gt.eq 1$ there exist finite subsets $A_N^(+) subset A$ and $A_N^(-) subset A$ such that:

- \(i) $\|f\(alpha\)\|lt.eq N^(- 1)$ for all $alpha in A\\\(A_N^(+) union A_N^(-)\)$\;

- \(ii) $sum_(alpha in A_N^(+)) f\(alpha\)gt.eq N$\;

- \(iii) $sum_(alpha in A_N^(-)) f\(alpha\)lt.eq - N$.

Prove that for any $N gt.eq 1$, there exists a finite subset $B_N subset A$ such that
$ lr(|597 - sum_(alpha in B_N) f \( alpha \)|) lt.eq 1 / N . $

#proof[
We first take $A_N = A_N^(+) union.big A_N^(-) subset A$ s.t. $\|f\(alpha\)\|lt.eq N^(- 1)$ for all $alpha in A\\A_N$, as given by the conditions. \ Now we define $p o s\(A_N\):= { alpha in A_N divides f\(alpha\)gt.eq 0 }$ and $n e g\(A_N\):= { alpha in A_N divides f\(alpha\)< 0 }$. \ Let $g a p := sum_(alpha in A_N) f\(alpha\)- 597$. This is a real number since $A_N$ is finite. \ \ Case 1: if $g a p < 0$, then we need to fill in more elements whose image under $f$ sum up to be positive to make the sum close to 597 from below. \ We then take a finite set $B_N^(+) subset A$ s.t. $sum_(alpha in B_N^(+)) f\(alpha\)gt.eq ceil.l - g a p + sum_(alpha in p o s\(A_N\)) f\(alpha\)ceil.r$. \ Since $B_N^(+) inter.big A_N subset A_N$, we have
$ sum_(alpha in B_N^(+) inter.big A_N) f\(alpha\)lt.eq sum_(alpha in p o s\(A_N\)) f\(alpha\) $
and since $B_N^(+) =\(B_N^(+)\\A_N\)product.co\(B_N^(+) inter.big A_N\)$, we have
$ sum_(alpha in B_N^(+)) f\(alpha\)= sum_(alpha in B_N^(+)\\A_N) f\(alpha\)+ sum_(alpha in B_N^(+) inter.big A_N) f\(alpha\) $
By (1) and (2), it is clear that
$ sum_(alpha in B_N^(+)\\A_N) f\(alpha\)gt.eq - g a p $
(3) means that the elements in $B_N^(+)\\A_N$ have big enough image sum to fill the gap.
And by definition, for all $alpha in B_N^(+)\\A_N$, we have $\|f\(alpha\)\|lt.eq 1 / N$. This means that each element in this finite $B_N^(+)\\A_N$ takes up only a small portion of the sum, bounded by $1\/N$.
Together with (3), it follows that there is some subset $B'_N subset B_N^(+)\\A_N$ s.t. $sum_(alpha in B'_N) f\(alpha\)in\[- g a p - 1\/N\,- g a p + 1\/N\]$. So for the finite set $A_N union.big B'_N$, we have
$ sum_(alpha in A_N union.big B'_N) f\(alpha\)= sum_(alpha in A_N) f\(alpha\)+ sum_(alpha in B'_N) f\(alpha\)in\[597 - 1\/N\,597 + 1\/N\] $

#figure(image("../assets/hw0(1).png", width: 30.0%),
  caption: [
  ]
)

Case 2: if $g a p > 0$, then we need to fill in more elements whose image under $f$ sum up to be negative to make the sum close to 597 from above. \ We then take finite $B_N^(-) subset A$ s.t. $sum_(alpha in B_N^(-)) f\(alpha\)lt.eq floor.l - g a p + sum_(alpha in n e g\(A_N\)) f\(alpha\)ceil.r$. \ For the same reason as case 1, we get
$ sum_(alpha in B_N^(-)\\A_N) f\(alpha\)lt.eq - g a p $
And by definition, for all $alpha in B_N^(-)\\A_N$, we have $\|f\(alpha\)\|lt.eq 1 / N$. Together with (5), it follows that there is some subset $B'_N subset B_N^(-)\\A_N$ s.t. $sum_(alpha in B'_N) f\(alpha\)in\[- g a p - 1\/N\,- g a p + 1\/N\]$. So for the finite set $A_N union.big B'_N$, we have
$ sum_(alpha in A_N union.big B'_N) f\(alpha\)= sum_(alpha in A_N) f\(alpha\)+ sum_(alpha in B'_N) f\(alpha\)in\[597 - 1\/N\,597 + 1\/N\] $ \ Case 3: $g a p = 0$, then we are done. \ This finishes the proof of the statement.

]
#remark[
意思是说 $f$ 对于任意小的 bound 都存在一个 infinite set 上能够限于这一 bound 内(可逼近 0), 而在一个 finite set 上总和可以任意大. 要证明的是对于任意一个数, 我们都可以指定一个 finite set, 让这个函数在这个 finite set 上的总和无限接近这个数. 这里以 597 为例. 对于这个 bounded 的 infinite set, 我们简称它为 big flat set, 其补集称之为 small wavy set. \ \ 这题思考甚久. 一开始卡住的原因就是局限于这个 big flat set 的 sum postive 和 sum negative 这两个划分上, 因为这占了条件中很大一部分笔墨. 但是最后却发现实际上这个集合在第一步构造中并没有用, 甚至作用一直都不大, 只用一边即可. 并且, 这两个条件不仅是透明条件, 而且我们甚至应该构建自己的 \"all positive\" 和 \"all negative\" set. \ \ 为什么说这个 sum postive 和 sum negative 划分几乎没用: 因为它基本不给出任何 invariant 的信息. 举例: sum postive set 的 image sum $gt.eq 100$, sum negative set 的 image sum $lt.eq - 100$, 它们交的部分, 其可能的 image sum 上下都可以 unboundly large, 可以是 99999, 唯一能 imply 的信息是两边 $A_N +\\A_N^(-)$ 和 $A_N -\\A_N^(+)$ 之间的差距大于等于 200, 但是这也没用, 因为我们对元素个数也没有 control over.因而我们想要准确地逼近一个数, 必须要靠外界的大小全都 singly bounded 的元素. \ \ 于是关键的解题点在于: small wavy set 的有限性, 所以我们可以把它的值设做 $g a p$, 并可以把它分为全正和全负的两个 portion. 这样的目的是: 我们等于给 $cal(P)\(A\)$ 中每个集合赋予了一个 measure, 等于 image sum under $f$, 而局限在 small wavy set 上, 这个 measure 最小的集合就是 all negative set, 最大的集合就是 all positive set. 从而, 我们先比较 $g a p$ 和 597 的大小, 根据其正负, 制定一个 (差值 $plus.minus$ allPos/Neg set 的 function measure) 的 bound, 并创造第二个 big wavy set $B_N$. 这个 $B_N$ 和 $A_N$ 可能相交, 但是这一次, 我们可以 control over $B_N\\A_N$ 的部分, 因为这部分的值必须大于 $g a p$ 和 597 的差值, 并且这个部分还属于 $A_N$ 外的 big flat set, 其中每个元素的函数值都是 bounded by a small number 的.

]
#heading(level: 2, numbering: none)[Limsup and Liminf]
<limsup-and-liminf>
Let $X$ be a nonempty set, and $A\,B$ subsets of $X$. Define a sequence $\(E_n\)_(n = 1)^oo$ of subsets of $X$ by
$ E_n = cases(delim: "{", A & upright("if ") n upright(" is a prime number,"), B & upright("otherwise.")) $
Characterize the sets $limsup E_n$ and $liminf E_n$ (see §0.1 in Folland for notation).

#solution[
By definition,
$ limsup\(E_n\)= inter.big_(k = 1)^oo union.big_(n = k)^oo E_n $
For each $k in bb(N)$, there are infinitely many $n gt.eq k$ such that $n$ is prime, and also there are infinitely many $n gt.eq k$ such that $n$ is not prime. So $union.big_(n = k)^oo E_n = A union.big B$.
Therefore
$ limsup\(E_n\)= inter.big_(k = 1)^oo\(A union.big B\)= A union.big B $
By definition,
$ liminf\(E_n\)= union.big_(k = 1)^oo inter.big_(n = k)^oo E_n $
For each $k in bb(N)$, there are infinitely many $n gt.eq k$ such that $n$ is prime, and also there are infinitely many $n gt.eq k$ such that $n$ is not prime. So $inter.big_(n = k)^oo E_n = A inter.big B$.
Therefore
$ liminf\(E_n\)= union.big_(k = 1)^oo\(A inter.big B\)= A inter.big B $

]
#heading(level: 2, numbering: none)[Polynomial Convergence]
<polynomial-convergence>
Let $f : bb(Z)_(gt.eq 0) times bb(Z)_(gt.eq 0) arrow.r bb(R)$ be a function with the property that for every polynomial
$ p\(x\)= x^d + a_1 x^(d - 1) + dots.h.c + a_d $
with integer coefficients, we have that
$ lim_(n arrow.r oo) f\(n\,p\(n\)\)= lim_(n arrow.r oo) f\(p\(n\)\,n\)= 0 . $
Does it follow that $f\(m\,n\)arrow.r 0$ as $m\,n arrow.r oo$? In other words, given $epsilon.alt > 0$, does there exist $N gt.eq 0$ such that $\|f\(m\,n\)\|< epsilon.alt$ whenever $\|m\|\,\|n\|gt.eq N$? Give a proof or a counterexample.

#solution[
Consider this function:
$ f\(m\,n\)= {1\,#h(0em) #h(0em) upright("if ") m = 2^n\
0\,#h(0em) #h(0em) upright("otherwise") $
Let #strong[$p$ be arbitrary polynomial with integer coefficients.] Then there must be at most finite $n$ such that $p\(n\)= 2^n$. This is guaranteed by the asymptotic behavior of polynomial and exponential function: $lim_(n arrow.r oo) frac(p\(n\), 2^n) = 0$. So there exists some $N in bb(N)$ s.t. $frac(p\(n\), 2^n) < 1\/2$ for all $n gt.eq N$, therefore #strong[$f\(p\(n\)\,n\)$ is eventually 0]. \ Also, there must be at most finite $n$ such that $2^(p\(n\)) = n$, i.e. $p\(n\)= log_2 n$. This is guaranteed by the asymptotic behavior of polynomial and logarithmic function: $lim_(n arrow.r oo) frac(log_2 n, p\(n\)) = 0$. So there exists some $N in bb(N)$ s.t. $frac(log_2 n, p\(n\)) < 1\/2$ for all $n gt.eq N$, therefore #strong[$f\(n\,p\(n\)\)$ is eventually 0]. \ This confirms that $lim_(n arrow.r oo) f\(n\,p\(n\)\)= lim_(n arrow.r oo) f\(p\(n\)\,n\)= 0$ for any polynomial $p$ with integer coefficients. \ Then we consider the sequence $\(\(2^n\,n\)\)_(n in bb(N))$. For any $n in bb(N)$, $f\(\(2^n\,n\)\)= 1$, so the sequential limit is $1$. This completes the counterexample.

#figure(image("../assets/hw0(3).jpeg", width: 30.0%),
  caption: [
  ]
)

]
#remark[
$f$ 是一个二元 input 的函数, 其满足, 将任何一个 polynomial 函数的 graph input 进入, limit behavior 都会趋近于 0. \ 这个表现乍看很雾. 所以不如试一试: identity polynomial 和 trivial polynomial. 得到 $lim_(n arrow.r oo) f\(1\,n\)= lim_(n arrow.r oo) f\(n\,1\)= 0$, 以及 $lim_(n arrow.r oo) f\(n\,n\)= 0$, 以及可想折中的情况: 这两个 input 的增长速度是 polynoimial relation 的情况下(一个是 $n$, 一个是 $p\(n\)$)也是趋近于 0 的, 这个表现像是这个函数在两个 input 各自以任意速度增长时 converge to 0. \ \ 但是直觉告诉我们这个 polynomial 关系的增长速度不能代表增长速度差距更大的情况, 比如 exponential.遂想到解题点: 这个 limit behavior, 针对的是任意 polynomial, 但是是随意选择一个固定的 polynomial 之后, 才在这个固定的 polynomial 上有这个行为. \ \ Then we think about: 一个在 exponential graph as input 上一直得到固定值, 在其他 input 上都得到 0 的函数. 从而对于这个 exponential graph input 的 seq, 函数的 limit behavior 是一个固定值; 而对于任意的 polynomial, 函数的 limit behavior 都是 0，因为任意 polynomial 函数, 和一个 exponential 函数至多有有限个重合点, asymptotic 增长速度不同. \ \ \(PS: 笔者在思考构造时想到过一个很 silly 的问题: 对于任意两个整数 $x\,y$，是否都存在一个无常数项的整系数 polynomial 使得 $p\(x\)= y$? 答:很显然不是. 回忆小学数学: 我们只要选择和 $x$ 没有 common factor 的 $y$ 即可得反.)

]
