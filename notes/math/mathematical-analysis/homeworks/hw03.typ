#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let intersect = math.inter

// Personal authority: Homework/451-hw-3.pdf pp.1–13.
// Checking-only sources: 451-hw-3-raw.pdf pp.1–2; 451-hw-sol-all.pdf pp.9–12.
= Homework 3: sequence limits and topology

#remark(title: [Authority label])[
  This is a visual transcription of *personal work* in `451-hw-3.pdf`.
  The raw assignment and consolidated solution file were used only for
  checking problem identities and notation; they are not the authority for
  any solution below.
]

The submission begins with the definition: a sequence $(a_n)$ of real numbers
is *eventually constant* if there are $c in bR$ and $N in bN$ such that
$a_n=c$ for all $n>=N$.

== Problem 1 — reciprocals and divergence to infinity

Consider the bi-implication $lim a_n=infinity <=> lim 1/a_n=0$.

#solution(title: [Forward direction])[
  Suppose $lim a_n=infinity$. Let $epsilon>0$ and consider $M=1/epsilon$.
  Then for some $N>M$, $a_n>M$ whenever $n>=N$. Thus
  $a_n>1/epsilon$ implies $|1/a_n|<epsilon$ whenever $n>=N$. So
  $lim 1/a_n=0$.
]

#solution(title: [Backward direction — counterexample])[
  Consider $a_n=-n$. Then $lim 1/a_n=lim(-1/n)=0$, but $lim a_n=-infinity$.
]

== Problem 2 — a bounded factor

Let $(a_n)$ and $(b_n)$ be sequences of real numbers. Prove that if
$lim a_n=0$ and $(b_n)$ is bounded, then $lim a_n b_n=0$.

#proof[
  Since $(b_n)$ is bounded, $(|b_n|)$ is also bounded. Consider the constant
  sequence $s_n=sup(|b_n|)$. Then $lim(s_n)=sup|b_n|$. Since $lim a_n=0$,
  $lim(|a_n|)=0$, and hence $lim(|a_n| dot.op |s_n|)=0$. As
  $s_n=sup|b_n|$, $0<=|b_n|<=|s_n|$ for all $n in bN$, so
  $0<=|a_n b_n|<=|a_n s_n|$ for all $n in bN$. By the squeeze theorem,
  $lim|a_n b_n|=0$. Therefore $lim a_n b_n=lim|a_n b_n|=0$.
]

== Problem 3 — three limits

Determine the limits in the extended real line (including positive or negative
infinity) of the following sequences and prove the results.

=== (a) $2^n/n!$

#proof[
  The submitted answer is $lim_(n->infinity)2^n/n!=0$. Let $a_n=2^n/n!$.
  Then
  $
    lim_(n->infinity) a_(n+1)/a_n
    =lim_(n->infinity)(2^(n+1)n!)/((n+1)!2^n)
    =lim_(n->infinity)2/(n+1)=0<1.
  $
  So $lim 2^n/n!=0$.
]

=== (b) $n^n/n!$

#proof[
  The submitted answer is $lim_(n->infinity)n^n/n!=+infinity$. It writes
  $n^n/n!=n/(n-1) dot.op n/(n-2) dots.h n/1>n$. Let $M>0$ and choose
  an integer $N>=M$. For $n>=N$, $n^n/n!>n>=N>M$. Hence the limit is $+infinity$.
]

=== (c) $b_1=2$, $b_(n+1)=(b_n^2+2)/(2b_n)$

#proof[
  Assume $lim b_n=L$. Then
  $L=lim b_(n+1)=lim(b_n/2+1/b_n)=L/2+1/L$, so
  $L^2/2=1$ and $L=sqrt(2)$. Since $b_n>0$ for all $n in bN$, the limit can
  only be $sqrt(2)$ if it exists.

  Now prove $(b_n)$ converges. For $n in bN$,
  $b_(n+1)=b_n/2+1/b_n>=2 sqrt(b_n/2 dot.op 1/b_n)=sqrt(2)$. Since $b_1=2$,
  $b_n>=sqrt(2)$ for all $n in bN$. Also
  $b_(n+1)/b_n=1/2+1/b_n^2<=1$. Hence $(b_n)$ is decreasing and bounded
  below, so it converges. Therefore $lim b_n=sqrt(2)$.
]

== Problem 4 — limits in a discrete set

#note(title: [原稿红字])[hw 3 ①：discrete $A subset.eq bR$ 中的任意 seq 要么 eventually constant，要么 $lim(a_n)$ 在 $A$ 之外。]

Suppose $A$ is a discrete subset of $bR$, and $(a_n)$ is a convergent sequence
of numbers in $A$. Prove that either $(a_n)$ is eventually constant or
$lim a_n in.not A$.

#proof[
  Write $lim a_n=L$. Assume $(a_n)$ is not eventually constant and
  $lim a_n in A$. Since $A$ is discrete, there is some $epsilon>0$ such that
  $(L-epsilon,L+epsilon) intersect A without {L}=emptyset$. Since
  $lim a_n=L$, there is $N in bN$ such that $|a_n-L|<epsilon$ for all $n>=N$.
  Since $(a_n)$ is not eventually constant, there is $n>=N$ such that
  $a_n!=L$ and $|a_n-L|<epsilon$, i.e. $a_n in(L-epsilon,L+epsilon)$. Thus
  $a_n in (L-epsilon,L+epsilon) intersect A without {L}$, a contradiction.
  Therefore $(a_n)$ is either eventually constant or $lim a_n in.not A$.
]

== Problem 5 — sequences of rationals with bounded numerators

For positive integer $M$, let $bQ_M$ be the set of rational numbers $m/n$ with
$m,n in bZ$ and $|m|<=M$. Prove every sequence of distinct numbers in $bQ_M$
converges.

#proof[
  Let $(a_n)$ be an arbitrary sequence in $bQ_M$ and let $epsilon>0$. Since
  for each $q in bZ$ there are only finitely many terms of $(a_n)$ that have
  $q$ as a denominator, consider
  $
    N=max{ k:a_k=p/q$ for some $p<=M$ and $q$ an integer with $q>=M/epsilon}.
  $
  Take arbitrary $n>=N+1$. Then $a_n=m/q$ where $q>M/epsilon$. Thus
  $a_n<=M/q<epsilon$. So $lim a_n=0$. This finishes the proof that every
  sequence of distinct numbers in $bQ_M$ converges.
]

== Problem 6 — strict inequalities between sequences

Let $a_n<b_n$ for all $n$.

=== (a)

#proof[
  Suppose $lim a_n=infinity$. Let $M>0$ and fix it. Then for some $N in bN$,
  $a_n>M$ whenever $n>=N$. Since $a_n<b_n$ for all $n$, $b_n>a_n>M$ for all
  $n>=N$. Therefore $lim b_n=infinity$.
]

=== (b)

#solution[
  Consider $a_n=1/n^2$ and $b_n=2/n^2$ for all $n in bN$. Then $a_n<b_n$
  for all $n in bN$, but $lim a_n=lim b_n=0$.
]

== Problem 7 — ratio limit greater than one

#note(title: [原稿红字])[hw 3 ②：if positive seq $(a_n)$ and $lim a_(n+1)/a_n=L>1$，则 $lim(a_n)=infinity$。]

Let $(a_n)$ be a sequence of positive real numbers. Show that if
$lim a_(n+1)/a_n=L>1$, then $lim a_n=infinity$.

#proof[
  Let $epsilon=(L-1)/2$. Since $lim a_(n+1)/a_n=L$, there is some $N_1 in bN$
  such that $|a_(n+1)/a_n-L|<epsilon$ for all $n>=N_1$, i.e.
  $a_(n+1)>(L/2+1/2)a_n$ for all $n>=N_1$. Let $M>0$. There is some
  $N_2>=N_1$ such that $(L/2+1/2)^(N_2)a_(N_2)>M$, since
  $L/2+1/2>1$. Then for all $n>=N_2$,
  $a_n>=(L/2+1/2)^n a_(N_2)>M$. Therefore $lim a_n=infinity$.
]

== Problem 8 — lim sup and lim inf

Find the lim sup and lim inf of the following sequences.

- (a) $a_n=(-1)^(n+1)+(-1)^n/n$: $limsup(a_n)=1$ and $liminf(a_n)=-1$.
- (b) $b_n=sin(1/n)$: $limsup(b_n)=liminf(b_n)=0$.
- (c) $c:bN -> bQ$ any bijection: $limsup(c_n)=+infinity$ and $liminf(c_n)=-infinity$.
- (d) $d_n=ln n+cos n$: $limsup(d_n)=liminf(d_n)=+infinity$.

#pagebreak()

== Problem 9 — a recursive average

Let $a,b in bR$ with $a<b$. Let $s_1=a$, $s_2=b$, and
$s_(n+2)=(s_n+s_(n+1))/2$. The submitted claim is
$lim_(n->infinity)s_n=2/3 b+1/3 a$.

#proof[
  Let $d_n=s_(n+1)-s_n$ for all $n in bN$. Then $d_1=s_2-s_1=b-a$, and,
  for $n>=2$,
  $
    d_n=(s_(n-1)+s_n)/2-s_n
    =-(1/2)s_n-(1/2)s_(n-1)=-(1/2)d_(n-1).
  $
  For all $n in bN$,
  $
    s_(n+1)=sum_(i=1)^n(s_(n+1)-s_n)+s_1
    =s_1+sum_(i=1)^n d_n
    =a+(1-(-1/2)^n)/(1-(-1/2))d_1
    =a+2/3(1-(-1/2)^n)(b-a).
  $
  Thus
  $
    lim_(n->infinity)s_n
    =lim_(n->infinity)s_(n+1)
    =lim_(n->infinity)(a+2/3(b-a)-2/3(-1/2)^n(b-a))
    =2/3b+1/3a,
  $
  since $|-1/2|<1$.
]

== Problem 10 — a divergent sequence with one possible subsequential limit

Consider $a_n=n^((-1)^n)$, i.e. $(a_n)=(1,2,1/3,4,1/5,6,dots)$. The work
claims $(a_n)$ diverges, but every convergent subsequence converges to $L=0$.

#proof[
  The odd-indexed terms $(a_(n_k):k$ is odd$)=(1,1/3,1/5,dots)->0$.
  Let $(a_(n_k))$ be a convergent subsequence of $(a_n)$; then
  $k mapsto n_k$ is strictly increasing. Suppose there are infinitely many
  $k in bN$ such that $n_k$ is even. We show $(a_(n_k))$ diverges. Let
  $L in bR$, take $M=1$, and fix $N in bN$. If there is no $n_k>N$ with
  $a_(n_k)>L+1$, then there are only finitely many even $n_k$, a contradiction.
  Thus there must be $n_k>N$ with $|a_(n_k)-L|>M$, so $(a_(n_k))$ diverges.
  Hence only finitely many $n_k$ are even. Cutting the tail makes all remaining
  $n_k$ odd, and so $(a_(n_k))$ converges to $0$.
]

== Problem 11 — lim sup of a sum

Let $(a_n)$ and $(b_n)$ be bounded sequences of positive real numbers.

=== (a)

#proof[
  Write $l_n=sup{a_k+b_k:k>=n}$,
  $u_n=sup{a_k:k>=n}$, and $v_n=sup{b_k:k>=n}$. Let $epsilon>0$. Then
  for every $k>=n$, $a_k<u_n+epsilon/2$ and $b_k<v_n+epsilon/2$, so
  $a_k+b_k<u_n+v_n+epsilon$. Hence $l_n<=u_n+v_n$. Since $n$ is
  arbitrary, $lim l_n<=lim u_n+lim v_n$, i.e.
  $limsup(a_n+b_n)<=limsup(a_n)+limsup(b_n)$.
]

=== (b)

#solution(title: [Counterexample])[
  $a_n=1+(-1)^n$, so $limsup(a_n)=2$. Let
  $b_n=1+(-1)^(n+1)$, so $limsup(b_n)=2$. But
  $limsup(a_n+b_n)=1+1=2<limsup(a_n)+limsup(b_n)$.
]

=== (c)

#solution[
  Write $lim a_n=L$. Then $limsup(a_n)=lim a_n=L$ since $(a_n)$ converges.
  Thus
  $limsup(a_n)+limsup(b_n)=L+lim v_n=lim(L+v_n)
  =limsup(a_n+b_n)$.
]

== Problem 12 — a sequence with every real subsequential limit

#note(title: [原稿红字])[hw 3 ③：$bR$ 中存在一个 seq，使得 “all sub seq lim of $(a_n)$” $=bR$。]

#proof[
  Since $bN approx bQ$, there exists a surjective function $S:bN -> bQ$.
  Note that $(S_n)$ is a sequence. Let $r in bR$ be arbitrary. There exists
  a sequence in $bQ$, $(q_n)->r$. Since $S:bN ->bQ$ is surjective, consider
  the subsequence $(S_(n_k))$ of $(S_n)$ defined by $S_(n_k)=q_n$ for some
  $n in bN$, for all $k in bN$. Take a monotonic subsequence of $(S_(n_k))$
  as $(S_m)$. It is a subsequence of $(S_(n_k))$, so it is also a subsequence
  of $(S_n)$. Let $epsilon>0$. There is some $N in bN$ such that
  $|q_n-r|<epsilon$ whenever $n>=N$. Since there is some term $S_m$ with
  $S_m=q_N$ and $(S_m)$ is monotonic, $|S_m-r|<epsilon$ whenever $m>=M$.
  Therefore $(S_m)->r$.
]

== Problem 13 — open and closed sets

The submitted classifications are:

- (a) ${1/n:n in bN}$: neither.
- (b) ${1/n:n in bN} union {0}$: closed and not open.
- (c) $union_(n>=1)[1/n,3-1/n]$: open and not closed.
- (d) $bZ$: closed and not open.
- (e) $bQ$: neither.
- (f) $inter_(n>=1)(-1/n,1/n)$: closed and not open.

== Problem 14 — closed discrete set with no uniform separation

#solution(title: [Counterexample])[
  Consider $S_n=sum_(k=1)^n 1/k$, a partial sum of the harmonic series, and
  $A={S_n:n in bN}$. There is no subsequential limit in $S_n$, so $A$ has no
  limit point; hence $A=A'$ and $A$ is closed. For each $S_n$ consider
  $epsilon=1/(n+1)$; then $V_epsilon(S_n) intersect A without {S_n}=emptyset$,
  so $A$ is discrete. But there is no $epsilon>0$ such that $|a-b|>=epsilon$
  for every pair $a,b in A$, since for any $epsilon>0$,
  $S_(k+1)-S_k<1/epsilon=epsilon$ (as recorded in the submission).
]

== Problem 15 — an external limit point

#note(title: [原稿红字])[hw 3 ④：bounded + infinite + discrete $A subset.eq bR$ 一定存在不在 $A$ 中的 subseq lim。]

Suppose $A subset.eq bR$ is infinite, bounded, and discrete. Prove that there
is a convergent sequence in $A$ whose limit is not in $A$.

#proof[
  Take an arbitrary sequence $(a_n)$ in $A$ such that $forall m,n in bN$,
  $a_m!=a_n$. By the Bolzano--Weierstrass theorem, there is a convergent
  subsequence $(a_(n_k))$; write $lim a_(n_k)=L$. Claim: $L in.not A$.
  Suppose $L in A$. Since $L$ is the limit of a sequence in $A$, it is a limit
  point of $A$, so for every $epsilon>0$ there exists $x in A without {L}$
  with $0<|x-L|<epsilon$, i.e. $x in V_epsilon(L) intersect A without {L}$.
  Since $A$ is discrete and $L in A$, there exists $epsilon>0$ such that
  $V_epsilon(L) intersect A={L}$. These two statements contradict. So
  $L in.not A$.
]
