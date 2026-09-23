#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Visual transcription: L15-Numerical-Series.pdf pp.1-4.
= Numerical series

#definition(title: [#kn[Series]])[
  若 $(a_k)_(k in bN)$ 是 $bR$ 中的一个 sequence，记
  $
    s_n=sum_(k=1)^n a_k
  $
  为其 $n$th partial sum；$(s_n)$ 是 sequence of partial sums。用
  $sum_(k=1)^infinity a_k$ 表示由 $(a_k)$ 确定的 infinite series。

  若 $lim_(n -> infinity)sum_(k=1)^n a_k=L$，则 series *converges*；否则
  *diverges*。Informally，$sum a_k<infinity$。Note：
  $sum_(k=1)^infinity a_k$ 代表一个 limit 而非 algebraic operation.
]

#example(title: [Harmonic and geometric series])[
  The harmonic series diverges to $+infinity$:
  $
  sum_(n=1)^infinity 1/n
  =1+1/2+(1/3+1/4)+(1/5+1/6+1/7+1/8)+dots
  >=1+1/2+1/2+dots=sum_(n=1)^infinity 1/2=infinity.
  $

给定 $a,r in bR$ 和 $m in bZ$，$sum_(k=m)^infinity a r^k$ 是 geometric
series。If $r != 1$，then
  $
  sum_(k=m)^n a r^k=a(r^m-r^(n+1))/(1-r),
  $
  and therefore
  $
    sum_(k=m)^infinity a r^k =
    cases(delim: "{",
      a r^m/(1-r) & abs(r)<1,
      text("DNE") & abs(r)>=1
    ).
  $
  The source writes the finite calculation explicitly (for $m<=n$):
  $
  (1-r)sum_(k=m)^n a r^k
    =a[(r^m+...+r^n)-(r^(m+1)+...+r^(n+1))],
  $
  hence $sum_(k=m)^n a r^k=a(r^m-r^(n+1))/(1-r)$.
]

#definition(title: [$p$-series])[
给定 $p in bR$，形如
  $
    sum_(n=1)^infinity (1/n)^p
  $
的 series 称为 $p$-series。
]
#theorem(title: [$p$-series criterion])[
  A $p$-series converges iff $p>1$.
]
#proof[
  If $p<=1$, then $n^p<=n$, so $1/n^p>=1/n$ and comparison with the harmonic
  series gives divergence. If $p>1$,
  $
  sum_(n=1)^infinity 1/n^p
  =1+1/2^p+1/3^p+(1/4^p+dots+1/7^p)+(1/8^p+dots+1/15^p)+dots
  $
  $
  <=1+2/2^p+4/4^p+8/8^p+dots
  =sum_(j=0)^infinity (1/2^(p-1))^j
  =1/(1-(1/2)^(p-1))<infinity.
  $
  The notes record $sum 1/n^2=pi^2/6$, $sum 1/n^4=pi^4/90$, and “$sum 1/n^3$:
  no nice formula”.
]

#example(title: [Telescoping and alternating harmonic series])[
  $
    sum_(n=1)^infinity (1/n-1/(n+1))
    =(1-1/2)+(1/2-1/3)+dots=lim_(n -> infinity)(1-1/(n+1))=1.
  $
  For the alternating harmonic series,
  $
    sum_(k=1)^infinity (-1)^(k+1)/k=(1-1/2)+(1/3-1/4)+dots.
  $
  If $s_n=sum_(k=1)^n(-1)^(k+1)/k$, then $(s_(2n))$ increases and
  $(s_(2n+1))$ decreases, so
  $
    sum_(k=1)^infinity (-1)^(k+1)/k
      =sup{ s_(2n) }=inf{ s_(2n+1) }=ln 2.
  $
]

#theorem(title: [Linearity of series])[
设 $sum a_n$ 和 $sum b_n$ converge，且 $c in bR$。Then
  $
    sum c a_n=c sum a_n, quad sum(a_n+b_n)=sum a_n+sum b_n.
  $
  Note: $sum a_n b_n != (sum a_n)(sum b_n)$.
]

#theorem(title: [Cauchy criterion for convergence])[
令 $sum a_k$ 是 partial sums 为 $(s_n)$ 的 series。则 $sum a_k$ converges iff
$(s_n)$ is Cauchy，即对每个 $epsilon>0$ 存在
  $N in bN$ such that
  $
    abs(s_n-s_m)<epsilon quad text("whenever") quad N<=m<=n.
  $
  Equivalently, $abs(sum_(k=m+1)^n a_k)<epsilon$.
]
#proof[课后。]

#theorem(title: [The $n$th-term test])[
  If $sum a_n$ converges, then $a_n -> 0$. Contrapositively useful:
  $(a_n)$ not tending to $0$ implies $sum a_n$ diverges. （这是 convergence 的
  necessary 而非 sufficient condition。）
]
#proof[
  $
    lim_(k -> infinity)a_k
    =lim_(k -> infinity)(s_k-s_(k-1))
    =lim_(k -> infinity)s_k-lim_(k -> infinity)s_(k-1)=0.
  $
]

#theorem(title: [Comparison test])[
  Let $(a_n)$ be a sequence of nonnegative numbers and let $(b_n)$ be any
  sequence.

  - If $sum a_n$ converges and $abs(b_n)<=a_n$ for all $n$, then $sum b_n$
    converges.
  - If $sum a_n=infinity$ and $b_n>=a_n$ for all $n$, then $sum b_n=infinity$.

  The finite-tail form is also recorded: if $sum b_n$ converges and
  $abs(b_n)<=a_n$ for all $n>=N$, then $sum b_n$ converges; of course the
  limit is different.
]
#proof[
  Let $(s_n)$ and $(t_n)$ be the partial sums of $sum a_k$ and $sum b_k$.
  In the first case,
  $
  abs(t_n-t_m)=abs(sum_(k=m+1)^n b_k)
    <=sum_(k=m+1)^n abs(b_k)<=sum_(k=m+1)^n a_k=abs(s_n-s_m).
  $
  Thus the Cauchy criterion makes $sum b_k$ converge. The second assertion is
  similar.
]

#example(title: [Comparison and absolute convergence])[
  $
    sum_(n=2)^infinity sin(n)/(n^2 ln n)
  $
  converges by comparison with $sum 1/n^2$, since for all sufficiently large
  $n$,
  $
    abs(sin n/(n^2 ln n))<1/n^2.
  $

  A series $sum a_k$ *converges absolutely* if $sum abs(a_k)$ converges.
  Absolute convergence is a stronger condition: if $sum a_k$ converges
  absolutely, then $sum a_k$ converges, because
  $
  abs(s_n-s_m)=abs(sum_(k=m+1)^n a_k)<=sum_(k=m+1)^n abs(a_k).
  $
]

#definition(title: [Conditional convergence])[
一个 convergent 但不 absolutely convergent 的 series 称为 conditionally
convergent。alternating harmonic series
$sum_(k=1)^infinity(-1)^(k+1)/k$ conditional convergence。
]

#remark(title: [Disturbing fact: reordering])[
  A conditionally convergent series can be made to converge to any number by
  “reordering” its terms. A reordered conditionally convergent series still
  has a limit, but it can be made to converge to any value. For example,
  $
    sum (-1)^(k+1)/k=1-1/2+1/3-1/4+1/5-dots
  $
  can be reordered to converge to $sqrt(2)$ by placing enough positive terms
  first and using negative terms as compensation after the partial sum exceeds
  $sqrt(2)$.

  In contrast, absolutely convergent series are closed under reordering: if
  $sum a_k$ converges absolutely, then for every bijection
  $f:bN -> bN$,
  $
    sum_(k=1)^infinity a_(f(k))=sum_(k=1)^infinity a_k.
  $
  For nonnegative $a_k$, this follows because $(sum_(k=1)^n a_k)$ and
  $(sum_(k=1)^n a_(f(k)))$ are increasing sequences with the same supremum.
  In the general case take
  $
    b_n=cases(delim: "{", a_n & a_n>=0, 0 & text("otherwise")),
    quad c_n=cases(delim: "{", abs(a_n) & a_n<0, 0 & text("otherwise")),
  $
  so $a_n=b_n-c_n$, and apply the nonnegative claim to $b_n,c_n$.
]

#theorem(title: [Root test])[
  Let $(a_n)$ be a sequence in $bR$ and let $rho=limsup abs(a_n)^(1/n)$.

  - If $rho<1$, then $sum a_n$ converges absolutely.
  - If $abs(a_n)>=1$ for infinitely many $n$ (which happens when $rho>1$),
    then $sum a_n$ diverges.

  Note: $L=limsup a_n$ iff, for every $epsilon>0$, there are only finitely many
  $n$ with $a_n>L+epsilon$, while there are infinitely many $n$ with
  $a_n>L-epsilon$.
]
#proof[
  Assume $rho<1$, fix $rho<r<1$, and choose $N$ such that
  $abs(a_n)^(1/n)<=r$ for $n>=N$. Then $abs(a_n)<=r^n$ and comparison with
  $sum r^n$ proves absolute convergence. If $abs(a_n)>=1$ infinitely often,
  then $a_n$ does not tend to $0$, so the $n$th-term test gives divergence.
]

#theorem(title: [Ratio test])[
  Let $(a_n)$ be a sequence of nonzero numbers.

  - If $limsup abs(a_(n+1)/a_n)<1$, then $sum a_n$ converges absolutely.
  - If $liminf abs(a_(n+1)/a_n)>1$, then $sum a_n$ diverges.

  This follows from the root test and the lecture’s fact
  $
    liminf abs(a_(n+1)/a_n)
    <=liminf abs(a_n)^(1/n)
    <=limsup abs(a_n)^(1/n)
    <=limsup abs(a_(n+1)/a_n).
  $
]

#remark(title: [Root and ratio tests])[
root test implies ratio test；root test 通常比 ratio test 更强。Both are
inconclusive when $limsup abs(a_n)^(1/n)=1$ or
  $lim abs(a_(n+1)/a_n)=1$ (for example $a_n=1/n$, $b_n=1/n^2$). If either
  limit exists and is $r$, there is absolute convergence for $r<1$ and
  divergence for $r>1$. Whenever the root test is inconclusive, the ratio test
  is also inconclusive（反而不用再试）.
]

#theorem(title: [Alternating Series Test])[
  If $(a_k)$ is a decreasing sequence of positive numbers converging to $0$,
  then
  $
    sum_(k=1)^infinity(-1)^(k+1)a_k
  $
  converges.
]
#proof[
  Let $s_n=sum_(k=1)^n(-1)^(k+1)a_k$. Then
  $
  s_(2n)=(a_1-a_2)+(a_3-a_4)+dots+(a_(2n-1)-a_(2n))
  $
  is increasing and bounded above by $a_1$, hence converges to $ell$. Choose
  $N$ so that $abs(s_(2n)-ell)<epsilon/2$ and $abs(a_(2n+1))<epsilon/2$ for
  $n>=N$. Then
  $
    abs(s_(2n+1)-ell)<=abs(s_(2n)-ell)+abs(a_(2n+1))<epsilon.
  $
  Thus $s_(2n+1)->ell$ as well, hence $s_n->ell$.
]

#theorem(title: [Integral test])[
  Let $f$ be a positive and decreasing function on $[1,infinity)$. Then
  $
    sum_(k=1)^infinity f(k) text(" converges") quad ⇔ quad
    integral_1^infinity f(x) dif x
  $
  converges, where
  $
    integral_1^infinity f(x) dif x=lim_(b -> infinity)integral_1^b f(x) dif x.
  $
  Note: 此时我们还没有严格定义 improper integral；integral test 的证明以后
  再证，但其意义很直观，并由矩形比较
  $
    f(k+1)<=integral_k^(k+1)f(x) dif x<=f(k).
  $

  L15 p.4 的紫色 rectangle sketch 就是这组不等式：一个宽度为 $1$ 的
  interval $[k,k+1]$ 上，decreasing curve 下的 area 介于两端点高的
  rectangles 之间。其 native table reconstruction is
  #table(
    columns: (1fr, 1fr, 1fr),
    stroke: 0.6pt + palette.border,
    inset: 4pt,
    [left rectangle], [curve area over $[k,k+1]$], [right rectangle],
    [$f(k+1)⋅1$], [$integral_k^(k+1) f(x) dif x$], [$f(k)⋅1$],
    [lower bound], [middle], [upper bound]
  ).
]

#remark(title: [Numerical Series Summary])[
  (1) Cauchy Criterion: $sum a_k$ converges iff $(s_n)$ is Cauchy.
  (2) $n$th term test: $(a_n)$ not tending to $0$ implies divergence.
  (3) Comparison Test. (4) Root Test. (5) Ratio Test. (6) Alternating Series
  Test: positive decreasing $(a_n)$ converging to $0$ makes its alternating
  series converge. (7) Integral Test for positive decreasing $f$.

  Abs convergence $=>$ convergence. Abs convergence is closed under reordering;
  conditionally convergent series are not.
]
