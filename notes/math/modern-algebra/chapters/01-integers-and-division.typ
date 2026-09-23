#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#let align(..args) = args.pos().join()

= Integers and division
<integers-and-division>

This chapter transcribes the handwritten work in
'WorkSheets/412-WS1-Mywork.pdf', pp. 1--2, and the integer-linear-combination
work in 'WorkSheets/412-WS2-Mywork.pdf', p. 1. English source wording remains
English and Chinese source annotations remain Chinese.

== Divisibility and the division algorithm

*Source transcription — WS1, p. 1, Part I, ``Warm Up''.*

The source gives the following main outline of the proof of the Division
Algorithm Theorem:

1. *Existence:* $exists q, r in bZ$ such that $n = q d + r$ with
   $0 <= r < d$.
2. *Uniqueness:* if another expression $n = q' d + r'$ has
   $0 <= r' < d$, then $r'=r$ and $q'=q$.

It also records the divisibility calculation: if $a,b,c in bZ$, $a | b$, and
$b | c$, write $b=a s$ and $c=b t$. Then
$c=(s t)a$, with $s,t in bZ$, hence $s t in bZ$ and $a | c$.

#theorem(title: [#kn[Division algorithm]])[
For $n,d in bZ$ with $d>0$, there are unique $q,r in bZ$ such that

$ n = q d + r quad text(and) quad 0 <= r < d. $
]

#proof[
*Source transcription — WS1, p. 1, Part 2(D), ``Division Thm: Existence''.*
Let

$ S = {n-d x : x in bZ, n-d x >= 0}. $

The worksheet proves first that $S$ is nonempty. Choose $x=-|n|$; since
$d>=1$ and $|n|>=0$, $d|n|>=|n|>=-n$, and therefore $n+d|n|>=0$.
It next writes: ``Since $n-d x>=0$ and $n-d x in bZ$, [the set] has a minimal
element which is $>=0$.'' Let $r$ be that smallest element of $S$.

To prove $r<d$, the source assumes for contradiction that $r>=d$, writes
$r=d+k$ for some $k>=0$ in $bZ$, and uses $r=n-d x$ to obtain

$ k = n-d(x+1) >= 0. $

Thus $k in S$, while $k<r$, contradicting that $r$ is the smallest element of
$S$. Hence $r<d$. Since $r=n-d x$ for some $x in bZ$, put $q=x$ to get
$n=q d+r$, $0<=r<d$.

*Source transcription — WS1, pp. 1--2, Part 2(E), ``Division Algorithm:
Uniqueness''.* Suppose

$ n=q d+r=q' d+r', quad q,r,q',r' in bZ, quad 0<=r,r'<d. $

Then $d(q'-q)=r-r'$, so $d | (r-r')$. Moreover $0<=r,r'<d$ gives
$-d<r-r'<d$ and therefore $|r-r'|<d$. The source continues:

$ |d(q-q')|<d quad => quad |q-q'|<1. $

Because $q,q' in bZ$, $q=q'$. Consequently $d(q-q')=0$, so $r-r'=0$ and
$r=r'$. The concluding handwritten summary is: ``我们总结 prove uniqueness
的办法: assume two solutions then prove they are equal.''
]

== Linear combinations, gcd, and Bézout

*Source transcription — WS2, p. 1, ``自主部份, Pf of Thm 2''.* Define

$ S={a m+b n : m,n in bZ}, $

``i.e. $S$ 为 $a,b$ 的所有 linear combination.'' The worksheet wants to
show:

1. there is $t in S$ with $t | a$ and $t | b$;
2. for every $c$ with $c | a$ and $c | b$, one has $c<=t$.

Let $t$ be the smallest positive element of $S$ (``神奇，这里是直接过一个
定理来想到 $(a,b)$ 是 $S$ 的 smallest positive elem''). By well-ordering,
$t$ exists, and $t=u a+v b$ for some $u,v in bZ$. Divide $a$ by $t$:

$ a=t q+r, quad 0<=r<t. $

Since $r=a-t q=a-(u a+v b)q=a(1-u q)+b(-v q)$, it is also a linear
combination of $a,b$, hence $r in S$. Minimality forces $r=0$, so $a=t q$ and
$t | a$; ``similarly $t | b$.'' If $c | a$ and $c | b$, write $a=c k$,
$b=c s$. Then $t=u a+v b=c(u k+v s)$, so $c | t$ and $c<=|t|=t$.

#theorem(title: [Bézout identity and the gcd])[
Let $a,b$ not both be $0$. There exist $u,v in bZ$ such that

$ gcd(a,b)=a u+b v. $

Moreover every common divisor of $a$ and $b$ divides $gcd(a,b)$.
]

#proof[
The preceding source calculation supplies the proof: the least positive
$t=u a+v b$ divides both $a,b$, and every common divisor of $a,b$ divides
$t$. Thus $t=gcd(a,b)$.
]

*Source transcription — WS2, p. 1, ``Pf of Corollary 1.3''.* The sheet
records: if $a,b=1$, then by Theorem 2 there are $u,v in bZ$ with
$a u+b v=1$. If $a | c$, write $c=b k$ (as written in the source); then
$a u+b v=c$ is used to conclude $a | c$. The adjacent Chinese note says:
``这个证明的意思是: 如果 $a$ 是 $b,c$ 的因子, 但 $a$ 和 $b$ 互质, 那 $a$
肯定就是 $c$ 的因子（直观可见）.''

== Euclidean algorithm

*Source transcription — WS2, p. 1, ``Worksheet 部分, Pf of Thm 5:
Euclidean Algorithm''.* For $a,b in bZ$, let $d=gcd(a,b)$ and divide

$ a=b q+r. $

The source proves both directions of $gcd(a,b)=gcd(b,r)$. If $d | b$ and
$d | r$, then $d | (b q+r)=a$; hence every common divisor of $b,r$ is one of
$a,b$, and $gcd(b,r)<=gcd(a,b)$. Conversely, if $d | a$ and $d | b$, then
$b=d k_1$ and $a=d k_2$ for some integers, so $r=a-b q=d(k_2-k_1 q)$; the same
argument gives $gcd(b,r)>=gcd(a,b)$. Therefore $gcd(b,r)=gcd(a,b)$.

The Chinese explanation on the page is retained: ``Worksheet 则介绍了
Euclidean Algorithm（辗转相除）这种方法则证明；当我们知道
$(a,b)=(b,a mod b)$ 时，最后会到某时 $u,v$ 使 $u mod v=0$，那么下一步
$v mod 0=v$，$(u,0)=v$，这个 $v$ 就是一连下来最后的 $(a,b)$ 了。''
Each division has the form $c=d q+r$; at the last nonzero remainder one
back-substitutes to obtain the promised linear combination.

*Worked source calculations — WS2, p. 1.*

$
524=148 times 3+80,
quad 148=80 times 1+68,
quad 80=68 times 1+12,
quad 68=12 times 5+8,
quad 12=8 times 1+4,
quad 8=4 times 2+0.
$

Thus $gcd(524,148)=4$, and the page back-substitutes

$
align(
  4 &= 12-8 \
    &= 12-(68-12 times 5) \
    &= -68+6 times 12 \
    &= -68+6(80-68) \
    &= -7 times 68+6 times 80 \
    &= -7(148-80)+6 times 80 \
    &= -7 times 148+13 times 80 \
    &= 13 times 524-46 times 148.
)
$

The second calculation is

$ 1103=456 times 2+91, quad 456=91 times 5+1,
quad 91=1 times 91+0, $

so $gcd(1103,456)=1$ and

$ 1=456-91 times 5=456-(1103-2 times 456)times 5
=-5 times 1103+11 times 456. $
