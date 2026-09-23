#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Source: Homework/395-hw-01.pdf p.1 (personal work).
= HW 1

== Problem A

Suppose $(X,d)$ is a metric space. For $0 < epsilon < 1$, show that
$d^epsilon$ is a metric on $X$. If $X=[0,1]$ has its usual metric, show
that $X$ has “infinite length” using $sum_(i=1)^n d^epsilon(t_i,t_(i-1))$.

*Proof.* Take $x,y,z in X$. Positivity and symmetry are immediate:
$d(x,y)^epsilon >= 0$, with equality exactly when $x=y$, and
$d(x,y)^epsilon=d(y,x)^epsilon$. Let $f(r)=r^epsilon$ for $r>=0$.
Then $f'(r)=epsilon r^(epsilon-1)>=0$ and
$f''(r)=epsilon(epsilon-1)r^(epsilon-2)<=0$, so $f$ is increasing and
concave. Thus

$f(d(x,y))+f(d(y,z)) >= f(d(x,y)+d(y,z)) >= f(d(x,z))$.

Hence $d^epsilon(x,y)+d^epsilon(y,z)>=d^epsilon(x,z)$, completing the
metric axioms.

For the length claim, take an equally spaced partition into $n$ subintervals.
Then $t_i-t_(i-1)=1/n$ and

$sum_(i=1)^n d^epsilon(t_i,t_(i-1))=n(1/n)^epsilon=n^(1-epsilon)$.

Since $1-epsilon>0$, these sums are unbounded above, so for every
$M in NN$ some partition has sum greater than $M$.

== Bonus problem

If $X$ is $a times b$, $Y$ is $b times c$, ordinary multiplication takes
$a b c$ scalar multiplications. For

$A_1:5 times 1, quad A_2:1 times 5, quad A_3:5 times 2,
quad A_4:2 times 5, quad A_5:5 times 1, quad A_6:1 times 10$,

find the cheapest parenthesization. The submitted parenthesization is

$((A_1(A_2A_3))(A_4A_5))A_6$.

Let $m(i,j)$ be the minimal cost for multiplying the matrix chain from $A_i$ through $A_j$. The
recursion used was

$m(i,j)=min_(i<=k<j)(m(i,k)+m(k+1,j)+
"row"(A_i) "col"(A_k) "col"(A_j))$.

The dynamic-programming calculations recorded on the page are

$m(1,3)=min(25+5*5*2,10+5*1*2)=20,$

$m(2,4)=min(25+50,10+10)=20, quad m(3,5)=min(50+25,10+10)=20,$

$m(4,6)=min(10+20,50+100)=30,$

$m(1,4)=min(20+50,25+50+125,20+25)=45,$

$m(2,5)=22, quad m(3,6)=70, quad m(1,5)=27,$

$m(2,6)=32, quad m(1,6)=77.$

Thus the final answer costs $77$ scalar multiplications.
