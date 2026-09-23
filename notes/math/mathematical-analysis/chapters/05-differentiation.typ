#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Visual transcription: L13 pp.1-2; L14 pp.1-2; L14(2) pp.1-8.
= Differentiation

== Derivatives and rules (L13)

#definition(title: [#kn[Derivative]])[
  Let $A subset bR$, $f: A -> bR$, and $a in A ∩ A^prime$ (此处 $a$ 是
  accumulation point，所以 $a$ lies in the domain of $f^prime$). Define the derivative of $f$
  at $a$ by
  $
    f^prime(a) = lim_(h -> 0) (f(a+h)-f(a))/h.
  $
  If $x=a+h$, then $h=x-a$, hence equivalently
  $
    f^prime(a) = lim_(x -> a) (f(x)-f(a))/(x-a).
  $
  如果 $f^prime(a)$ exists，则称 $f$ is differentiable at $a$. 把 $a$ 作为
  variable 时，我们把 derivative 看作 function：
  $
    f^prime(x)=lim_(h -> 0) (f(x+h)-f(x))/h,
    quad op("dom")(f^prime) = {x in op("dom")(f): f text(" is differentiable at ") x}.
  $
  如果 $B subset op("dom")(f)$ 且 $forall x in B$ 都有 $f$ differentiable at $x$，
  则称 $f$ is differentiable on $B$.
]

#remark(title: [Geometrical meaning and linear approximation])[
  我们称 derivative 的 geometrical meaning 为：the slope of the line tangent
  to the graph of $y=f(x)$ at point $(a,f(a))$. 我们称
  $
    L(x)=f(a)+f^prime(a)(x-a)
  $
  为 the linear approximation of $f$ near $x=a$.

  L13 p.1 的两幅草图可由下列关系读出：左图把 $a$ 处的 curve 与其
  tangent line 放在同一坐标轴上；右图标为 ``ctn, 但不 diffble''。
  #table(
    columns: (27mm, 1fr),
    stroke: 0.6pt + palette.border,
    inset: 5pt,
    [tangent at $a$], [$y=L(x)=f(a)+f^prime(a)(x-a)$ and $L(a)=f(a)$],
    [ctn, 但不 diffble], [left/right slopes do not agree, so $f^prime(a)$ DNE]
  )
]

#theorem(title: [Differentiability implies continuity])[
  If $f$ is differentiable at $a$, then $f$ is continuous at $a$.
]
#proof[
  Suppose $f^prime(a)$ exists, so $a in op("dom")(f^prime)$. Then
  $
  lim_(x -> a) f(x)
    = lim_(x -> a) (f(a) + (f(x)-f(a))/(x-a)(x-a))
    = f(a) + f^prime(a) 0 = f(a).
  $
  Since $a in op("dom")(f^prime)$, $lim_(x -> a)f(x)=f(a)$ implies continuity. 因而
  differentiability $=>$ continuity，但反之不成立（例如尖点图形）。
]

#theorem(title: [Linearity of the derivative])[
  Suppose $f,g$ are differentiable at $a$, and $c in bR$. Then $c f$ and $f+g$
  are differentiable at $a$, and
  $
    (c f)^prime(a)=c f^prime(a), quad (f+g)^prime(a)=f^prime(a)+g^prime(a).
  $
  即 $dif/(dif x)$ is a linear operator.
]
#proof[
  $
  (c f)^prime(a)=lim_(h -> 0) (c f(a+h)-c f(a))/h
    =c lim_(h -> 0) (f(a+h)-f(a))/h=c f^prime(a),
  $
  and the source continues the second calculation line by line:
  $
  (f+g)^prime(a)
  &= lim_(h -> 0) ((f+g)(a+h)-(f+g)(a))/h \\
  &= lim_(h -> 0) (f(a+h)-f(a))/h
     +lim_(h -> 0) (g(a+h)-g(a))/h \\
  &=f^prime(a)+g^prime(a).
  $
]

#theorem(title: [Product rule])[
  若 $f,g$ 在 $a$ 处 diffble，则 $f g$ 在 $a$ 处 diffble，且
  $
    (f g)^prime(a)=f^prime(a)g(a)+f(a)g^prime(a).
  $
]
#proof[
  $
  (f g)^prime(a)
  &= lim_(h -> 0) (f(a+h)g(a+h)-f(a)g(a))/h \
  &= lim_(h -> 0) ((f(a+h)-f(a))g(a+h)+f(a)(g(a+h)-g(a)))/h \
  &= f^prime(a) lim_(h -> 0)g(a+h)+lim_(h -> 0)f(a) g^prime(a) \
  &= f^prime(a)g(a)+f(a)g^prime(a).
  $
]

#theorem(title: [Quotient rule])[
  若 $f,g$ 在 $a$ 处 diffble 且 $g(a) != 0$，则 $f/g$ 在 $a$ 处 diffble，且
  $
    (f/g)^prime(a) = (f^prime(a)g(a)-f(a)g^prime(a))/(g(a))^2.
  $
]
#proof[PF similar to product rule.]

记号为 $f^prime(x)=dif/(dif x)(f)$，且
$f^prime(a)=dif/(dif x)|_(x=a)(f)$; likewise $f^prime prime(x)=dif^2y/(dif x^2)$,
$f^prime prime(a)$, $f^((q))(x)$, $dots$.

#example(title: [Polynomials and standard derivatives])[
  If $p(x)=sum_(k=0)^n a_k x^k$ is a polynomial, then
  $
    p^prime(x)=sum_(k=1)^n k a_k x^(k-1).
  $
  The proof is by induction on $n$; in particular
  $
    dif/(dif x)(x^n)=dif/(dif x)(x x^n)=x^n+x ⋅ n x^(n-1)=(n+1)x^n.
  $
  The lecture records the facts
  $
    forall p in bR, quad dif/(dif x)(x^p)=p x^(p-1),
    quad dif/(dif x)(a^x)=(ln a)a^x,
  $
  especially $dif/(dif x)(e^x)=e^x$, and
  $
    dif/(dif x)(sin x)=cos x, quad dif/(dif x)(cos x)=-sin x.
  $

  L13 p.2 还逐项写了以下 derivative-law exercises：
  $
  (1) quad dif/(dif x)sqrt(x)
    =lim_(h -> 0) (sqrt(x+h)-sqrt(x))/h
    =lim_(h -> 0) 1/(sqrt(x+h)+sqrt(x))=1/(2sqrt(x));
  $
  $
  (2) quad f(x)=abs(x) text(" is differentiable everywhere except at ")x=0;
  $
  $
  (3) quad dif/(dif x)(e^(3x)sin(x^2))
    =3e^(3x)sin(x^2)+2x e^(3x)cos(x^2);
  $
  $
  (4) quad lim_(x -> 4) (x^(3/2)-sqrt(x)-6)/(x-4)
    =f^prime(4)=11/4,
    quad f(x)=x^(3/2)-sqrt(x).
  $
]

#theorem(title: [Chain rule])[
  如果 $f$ 在 $a$ 处 differentiable 且 $g$ 在 $f(a)$ 处 differentiable，
  则 $g circle f$ 在 $a$ 处 differentiable，且
  $
    (g circle f)^prime(a)=g^prime(f(a)) f^prime(a).
  $
]
#proof[
  设 $g$ 的辅助函数为
  $
  phi(u) = cases(delim: "{",
    (g(u)-g(f(a)))/(u-f(a)) & u != f(a),
    g^prime(f(a)) & u=f(a)
  )
  $
  Thus $phi(u)(u-f(a))=g(u)-g(f(a))$ for all $u$ in the domain of $g$, and $phi$ is
  continuous at $f(a)$. Hence
  $
  f^prime(a)g^prime(f(a))
  &= lim_(x -> a) (f(x)-f(a))/(x-a) lim_(x -> a)phi(f(x)) \
  &= lim_(x -> a) (g(f(x))-g(f(a)))/(x-a)
   = (g circle f)^prime(a).
  $
  这个证明的核心在于构造一个函数 $phi$，用来模拟用 tangent line 逼近
  $g(f(a))$ 附近的行为，并通过 $g$ 的 differentiability 说明 $phi$ 在
  $g(f(a))$ 的 continuity，从而在 limit 中使用 expansion。
]

#example(title: [Derivative need not be continuous])[
  Let
  $
  f(x)=cases(delim: "{", x sin(1/x) & x != 0, 0 & x=0),
  quad
  g(x)=cases(delim: "{", x^2 sin(1/x) & x != 0, 0 & x=0).
  $
  We know $f,g$ are continuous everywhere. For $x != 0$,
  $
    f^prime(x)=sin(1/x)-(1/x)cos(1/x),
    quad g^prime(x)=2x sin(1/x)-cos(1/x).
  $
  At $0$, $f^prime(0)=lim_(x -> 0)sin(1/x)$ DNE, while $g^prime(0)=0$;
  but $lim_(x -> 0)g^prime(x)$ DNE. 因而 derivatives 不连续。
]

#definition(title: [$C^n$])[
  Given $n in bN$, the function $f in C^n$ ($n$-times continuously
  differentiable) on an open set $U subset bR$ if $f^((n))$ exists and is
  continuous on $U$.
]

== Extrema, MVT, and Darboux (L14)

#definition(title: [Local extrema])[
  Let $A subset bR$, $f:A -> bR$, and $c in A$. If there is $delta>0$ such
  that $f(x) <= f(c)$ for all $x in V_delta(c) inter op("dom")(f)$, then $c$ is a
  local maximum point of $f$, and $f(c)$ is a local maximum value of $f$.
  Dually define local minimum point/value; together these are local extreme
  point and local extrema.

  L14 p.1 的曲线标出了一个 local min、两个 local max（其中右侧极大值
  高于左侧），以及随后的 local min；其可辨识信息是极值只比较 $c$ 的某个
  neighborhood，而非整个 domain。用点位/不等式表表示为
  #table(
    columns: (1fr, 1fr, 1fr),
    stroke: 0.6pt + palette.border,
    inset: 4pt,
    [left local min], [interior local max], [right local min],
    [$f(c)<=f(x)$ nearby], [$f(c)>=f(x)$ nearby], [$f(c)<=f(x)$ nearby]
  ).
]

#lemma(title: [Key lemma])[
  Let $A subset bR$, $f:A -> bR$, $c in A ∩ A^prime$, and suppose $f$ is
  differentiable at $c$.

  (i) If $f^prime(c)>0$, then there is $delta>0$ such that, for all
  $x,y in V_delta(c) ∩ A$, $x<c<y$ implies $f(x)<f(c)<f(y)$.

  (ii) Dually, if $f^prime(c)<0$, then there is $delta>0$ such that
  $x<c<y$ implies $f(x)>f(c)>f(y)$.
]
#proof[
  For (i), let $epsilon=f^prime(c)/2$. Fix $delta>0$ such that
  $
    abs((f(x)-f(c))/(x-c)-f^prime(c)) < epsilon
  $
  whenever $0<abs(x-c)<delta$. Thus
  $
    0 < f^prime(c)/2 < (f(x)-f(c))/(x-c) < 3f^prime(c)/2.
  $
  If $x<c<y$, division by $x-c<0$ gives $f(x)<f(c)$, while division by
  $y-c>0$ gives $f(c)<f(y)$. (ii) is dual. 这两条 lemma 的结论也说明：
  如果 $f^prime(c) != 0$，则 $f$ 在 $c$ 的某个 open neighborhood 中严格
  monotone。
]

#corollary(title: [Fermat's theorem])[
  Suppose $f$ is defined on an open neighborhood of $c$. 如果 $c$ 是 $f$ 的
  一个 local extreme point 且 $f^prime(c)$ 存在，则 $f^prime(c)=0$.
]
#proof[Directly follows from the key lemma: if $f^prime(c)>0$ or $f^prime(c)<0$,
then $c$ cannot be a local extreme point.]

#corollary(title: [Rolle's theorem])[
  If $f$ is continuous on $[a,b]$, differentiable on $(a,b)$, and
  $f(a)=f(b)$, then there is some $c in (a,b)$ such that $f^prime(c)=0$.
]
#proof[
  By EVT, choose $x_0,y_0 in [a,b]$ such that
  $f(x_0) <= f(x) <= f(y_0)$ for all $x in[a,b]$. If neither is an endpoint,
  Fermat gives the result. More explicitly as on L14 p.1: if
  $f(x_0)<f(a)$, then $x_0$ is an interior local minimum and
  $f^prime(x_0)=0$; if $f(y_0)>f(a)$, then $y_0$ is an interior local maximum
  and $f^prime(y_0)=0$. If neither strict inequality holds, then
  $f(x)=f(a)$ for every $x in[a,b]$, so $f$ is constant and
  $f^prime(c)=0$ for every $c in(a,b)$.
]

#corollary(title: [Mean Value Theorem])[
  If $f$ is continuous on $[a,b]$ and differentiable on $(a,b)$, then there is
  $c in(a,b)$ such that
  $
    f^prime(c)=(f(b)-f(a))/(b-a).
  $
]
#proof[
  Let $g(x)=f(x)-((f(b)-f(a))/(b-a))(x-a)$. Then $g$ is continuous on
  $[a,b]$, differentiable on $(a,b)$, and $g(a)=g(b)$. Rolle's theorem gives
  $g^prime(c)=0$, which rearranges to the displayed equality.

  The L14 p.1 secant/tangent diagram records the same parallel-slope relation:
  #table(
    columns: (1fr, 1fr, 1fr),
    stroke: 0.6pt + palette.border,
    inset: 4pt,
    [$a$], [$c in(a,b)$], [$b$],
    [$f(a)$], [$f^prime(c)$ is the tangent slope], [$f(b)$],
    [secant slope], [=$f^prime(c)$], [$(f(b)-f(a))/(b-a)$]
  )
]

#corollary(title: [Zero derivative and monotonicity])[
若 $f$ 在 $(a,b)$ 上 diffble 且每个 $x in(a,b)$ 都有 $f^prime(x)=0$，则 $f$
在 $(a,b)$ 上 constant。于是若 $f^prime=g^prime$ on $(a,b)$，则该处
$f=g+C$。interval $I$ 上的 function 在 $x<y$ 推出 $f(x)<=f(y)$ 时称
increasing；$f(x)<f(y)$ 时称 strictly increasing；decreasing 对偶定义。
``Weakly increasing or decreasing on $I$'' 与 monotone on $I$ 同义。
]
#proof[
  If $f$ were not constant, there would be $x != y$ with $f(x) != f(y)$;
  MVT would give $(f(x)-f(y))/(x-y) != 0$, a contradiction. Apply this to
  $f-g$ for the second assertion.
]

#corollary(title: [Increasing/decreasing test])[
  If $f$ is differentiable on $(a,b)$, then $f^prime(x)>=0$ for every
  $x in(a,b)$ implies $f$ is increasing on $(a,b)$. If $f^prime(x)>0$ for all
  $x$, then $f$ is strictly increasing. Both statements have decreasing duals.

  Note: (i) is a weak statement, but (ii) has a strict conclusion. For
  $y=x^3$, $x<y$ implies $x^3<y^3$, though $f^prime(0)=0$.
]
#proof[For $x<y$, MVT gives a $c in(x,y)$ with
$(f(y)-f(x))/(y-x)=f^prime(c)>=0$.]

#remark(title: [First-derivative sign chart (L14 p.2)])[
  The handwritten graph for the first derivative test is the sign transition
  below; reversing both signs gives the local-minimum version.
  #table(
    columns: (1fr, auto, 1fr),
    stroke: 0.6pt + palette.border,
    inset: 4pt,
    [$(c-epsilon,c)$], [$c$], [$(c,c+epsilon)$],
    [$f^prime>0$], [local max], [$f^prime<0$],
    [$f$ increasing], [$f(c)$], [$f$ decreasing]
  )
]

#corollary(title: [First derivative test])[
  Let $c in bR$ and suppose $f$ is continuous on $V_epsilon(c)$ for some
  $epsilon>0$, and differentiable on $(c-epsilon,c)$ and $(c,c+epsilon)$.
  If $f^prime>0$ on $(c-epsilon,c)$ and $f^prime<0$ on $(c,c+epsilon)$, then
  $c$ is a local maximum of $f$; dually, the reversed signs give a local
  minimum.
]
#proof[
  For $x<c$, MVT gives a $t in(x,c)$ with
  $(f(x)-f(c))/(x-c)=f^prime(t)>0$, hence $f(x)<f(c)$. The same argument for
  $c<y$ gives $f(y)<f(c)$.
]

#theorem(title: [Darboux's theorem])[
  If $f$ is differentiable on $[a,b]$ and $f^prime(a)<ell<f^prime(b)$, then
  there is $c in(a,b)$ such that $f^prime(c)=ell$. Thus a differentiable
  function has every slope between $f^prime(a)$ and $f^prime(b)$: derivatives
  satisfy IVT even though they need not be continuous (no jump/infinite
  discontinuity).
]
#proof[
  WLOG let $g(x)=f(x)-ell x$. Then $g^prime(a)<0<g^prime(b)$, and $g$ is
  continuous on $[a,b]$. EVT gives a minimum point $c$ of $g$. The endpoint
  derivative signs force $c in(a,b)$, so Fermat gives $g^prime(c)=0$, hence
  $f^prime(c)=ell$.
]

== Functions on intervals, inverse functions, and L'Hôpital (L14(2))

Standing assumption: let $I subset bR$ be a nondegenerate interval, and
$f:I -> bR$ a function.

#theorem(title: [Strictly increasing functions])[
  If $f$ is strictly increasing, then:

  - $f$ is injective;
  - $f^(-1)$ is also strictly increasing;
  - if $c in I$ is not the right endpoint of $I$, then $lim_(x -> c^+)f(x)$ exists;
  - if $c in I$ is not the left endpoint of $I$, then $lim_(x -> c^-)f(x)$ exists;
  - $f$ has at most countably many discontinuities, and they are all jumps;
  - if $f[I]$ is an interval, then $f$ is continuous.
]
#proof[
  For the right limit let $S=f[I ∩ (c,infinity)]$, which is nonempty and
  bounded below by $f(c)$; write $L=inf(S)$. Given $epsilon>0$, fix
  $0<delta$ with $c+delta in I$ and $f(c+delta)<L+epsilon$. Then
  $L<=f(x)<=f(c+delta)<L+epsilon$ for $x in(c,c+delta)$, so
  $lim_(x -> c^+)f(x)=L$. The left-limit proof is similar, and these imply
  that discontinuities are jumps. For the final claim, prove the contrapositive:
  at an interior jump with
  $ell=lim_(x -> c^-)f(x)<L=lim_(x -> c^+)f(x)$, both
  $(-infinity,ell] ∩ f[I]$ and $[L,infinity) ∩ f[I]$ are nonempty but
  $(ell,L)$ is not contained in $f[I]$ because $(ell,L) ∩ f[I] subset {f(c)}$.
  The endpoint cases are similar. The remaining proofs are left as exercises.
  Remark: the dual also holds if $f$ is strictly decreasing.
]

#theorem(title: [Continuous functions on intervals])[
  If $f$ is continuous, then:

  - $f[I]$ is an interval;
  - if $I$ is closed and bounded, so is $f[I]$;
  - $f$ is strictly monotone iff $f$ is injective;
  - if $f$ is injective, then $f^(-1)$ is also continuous.
]
#proof[
  The first two were proved previously. For the backward direction of (iii),
  if $f$ is not strictly monotone, WLOG find $x<y<z$ in $I$ with either
  $f(x)<f(y)>f(z)$ or $f(x)>f(y)<f(z)$. IVT then implies $f$ is not one-to-one.
  L14(2) p.2 visualizes these two alternatives by the following ordered-value
  charts, each forcing a repeated intermediate value:
  #table(
    columns: (1fr, 1fr, 1fr),
    stroke: 0.6pt + palette.border,
    inset: 4pt,
    [$x<y<z$], [$x<y<z$], [],
    [$f(x)<f(y)>f(z)$], [$f(x)>f(y)<f(z)$], [not one-to-one by IVT]
  )
  Finally, injectivity makes $f$ strictly monotone, hence $f^(-1)$ strictly
  monotone; since $I=f^(-1)[f[I]]$ is an interval, the previous theorem makes
  $f^(-1)$ continuous.
]

#corollary(title: [Injective functions and inverses])[
  If $f$ is injective, then $f$ is strictly increasing iff $f^(-1)$ is strictly
  increasing; $f$ is strictly decreasing iff $f^(-1)$ is strictly decreasing;
  and $f$ is continuous iff $f^(-1)$ is continuous.

  Question: Could we add “$f$ is differentiable iff $f^(-1)$ is differentiable”?
  Answer: not quite. $f(x)=x^3$ is injective and differentiable on $(-1,1)$,
  but $f^(-1)$ is not differentiable at $f(0)=0$.
]

#theorem(title: [Inverse Function Theorem])[
  Suppose $f$ is continuous and injective on an open interval $I$, let
  $x_0 in I$, and suppose $f$ is differentiable at $x_0$ with
  $f^prime(x_0) != 0$. Then $f^(-1)$ is differentiable at $y_0=f(x_0)$ and
  $
    (f^(-1))^prime(y_0)=1/f^prime(x_0).
  $

  The p.3 inverse-function sketch has the paired coordinates
  #table(
    columns: (1fr, auto, 1fr),
    stroke: 0.6pt + palette.border,
    inset: 4pt,
    [$x_0$], [$f$], [$y_0=f(x_0)$],
    [$g(y_0)=x_0$], [$g=f^(-1)$], [$y_0$]
  ).
]
#proof[
  Write $g=f^(-1)$. Since $f^prime(x_0)!=0$ and $f(x)!=f(x_0)$ for
  $x!=x_0$,
  $
    lim_(x -> x_0) (x-x_0)/(f(x)-f(x_0))=1/f^prime(x_0).
  $
  Fix $delta_0>0$ such that the difference between the displayed quotient and
  $1/f^prime(x_0)$ is less than $epsilon$ whenever
  $0<abs(x-x_0)<delta_0$. Continuity of $g$ at $y_0$ supplies $delta_1>0$
  with $abs(g(y)-g(y_0))<delta_0$ whenever $abs(y-y_0)<delta_1$. Substitution
  $x=g(y)$ is the displayed p.4 calculation: for
  $0<abs(y-y_0)<delta_1$,
  $
  abs((g(y)-g(y_0))/(f(g(y))-f(g(y_0)))-1/f^prime(x_0))<epsilon,
  $
  and, since $f(g(y))=y$ and $f(g(y_0))=y_0$, this gives
  $
    abs((g(y)-g(y_0))/(y-y_0)-1/f^prime(x_0))<epsilon,
  $
  whence the result. Consequently, if $f$ is differentiable and $f^prime!=0$
  on an open interval $I$, then $f$ is injective on $I$, $f^(-1)$ is
  differentiable on $f[I]$, and $(f^(-1))^prime=1/(f^prime circle f^(-1))$.
  The final visible p.4 margin annotation is: “Prove? Fix? Skip? 6.1.9”.
]

#example(title: [Inverse derivative])[
  Define the invertible differentiable function
  $
    f(x)=e^x/(x^2+1)+x^3+2x
  $
  on $bR$. Find $(f^(-1))^prime(1)$. Since $f(0)=1$ and
  $
  f^prime(x) = (e^x(x^2+1)-2x e^x)/(x^2+1)^2+3x^2+2
    = e^x(x-1)^2/(x^2+1)^2+3x^2+2,
  $
  $
    (f^(-1))^prime(1)=1/f^prime(f^(-1)(1))=1/f^prime(0)=1/3.
  $
]

== L'Hôpital's Rule

#lemma(title: [Cauchy's Mean Value Theorem])[
  Let $a<b$, and suppose $f,g:[a,b]->bR$ are continuous on $[a,b]$ and
  differentiable on $(a,b)$. Then there is $c in(a,b)$ such that
  $
    (f(b)-f(a))g^prime(c)=(g(b)-g(a))f^prime(c).
  $
]
#proof[Apply MVT to $h(x)=(f(b)-f(a))g(x)-(g(b)-g(a))f(x)$ on $[a,b]$.]

#theorem(title: [L'Hôpital's Rule])[
  Let $a<b$, and let $f,g:(a,b)->bR$ be differentiable functions with
  $g^prime(x)!=0$ for all $x in(a,b)$. Suppose
  $lim_(x -> a^+)f(x)=lim_(x -> a^+)g(x)=0$. If
  $lim_(x -> a^+)f^prime(x)/g^prime(x)$ exists and equals $L in bR$, then
  $lim_(x -> a^+)f(x)/g(x)$ exists and equals $L$.
]
#proof[
  Extend $f,g$ to $F,G:[a,b)->bR$ by $F(a)=G(a)=0$. Rolle's theorem on $G$
  shows that not just $g^prime$ but $g$ itself is never $0$ on $(a,b)$. Let
  $(x_n)$ in $(a,b)$ tend to $a$. Cauchy's MVT supplies $y_n in(a,x_n)$ with
  $
    F^prime(y_n)(G(x_n)-G(a))=G^prime(y_n)(F(x_n)-F(a)).
  $
  Then $y_n -> a$ and $f(x_n)/g(x_n)=f^prime(y_n)/g^prime(y_n)$ for all $n$;
  hence the quotient tends to $L$. Since $(x_n)$ was arbitrary, the desired
  right-hand limit is $L$.

  Remark: the rule also holds for two-sided limits and limits at $±
  infinity$. It also holds for indeterminate limits of the form
  $± infinity/± infinity$, and can be adapted to
  $infinity-infinity$, $0 ⋅ infinity$, $1^infinity$, $0^0$, and $infinity^0$
  (see 6.3). *Skip the rest?*
]

#example(title: [L'Hôpital examples])[
  $
  lim_(x -> 0) sin x/x = lim_(x -> 0) cos x/1=1;
  quad
  forall a>0, lim_(x -> infinity) (ln x)/x^a
    =lim_(x -> infinity)1/(a x^a)=0;
  $
  $
  forall a>0, lim_(x -> infinity)x^a/e^x
    =lim_(x -> infinity)(a x^(a-1))/e^x=dots=0.
  $
]

#corollary(title: [No removable discontinuity for a derivative])[
  Let $a in bR$, let $I$ be an open interval containing $a$, and let
  $f:I -> bR$ be continuous and differentiable on $I ∖ {a}$. If
  $lim_(x -> a)f^prime(x)$ exists, then $f$ is differentiable at $a$ and
  $lim_(x -> a)f^prime(x)=f^prime(a)$.
]
#proof[
  Let $F(x)=f(x)-f(a)$ and $G(x)=x-a$. Then $lim_(x -> a)F(x)=lim_(x -> a)G(x)=0$
  and $lim_(x -> a)F^prime(x)/G^prime(x)=lim_(x -> a)f^prime(x)$ exists. The
  definition of derivative and L'Hôpital's rule give
  $
  f^prime(a)=lim_(x -> a)(f(x)-f(a))/(x-a)
    = lim_(x -> a)F(x)/G(x)
    = lim_(x -> a)F^prime(x)/G^prime(x)
    = lim_(x -> a)f^prime(x).
  $
]

#example(title: [Final counterexample])[
  Let $f(x)=x sin(1/x)$ for $x!=0$, and $f(0)=0$. From continuity at $0$ and
  differentiability everywhere except at $0$, we already know that
  $lim_(x -> 0)f^prime(x)$ cannot exist.
]
