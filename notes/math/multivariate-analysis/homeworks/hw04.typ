#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Source: Homework/395-hw-04.pdf pp.1-3 (personal work).
= HW 4

== Problem A

Let $F:RR^n->RR^m$ satisfy $F(t x)=t F(x)$ for every $t>0$ and suppose $F$ is differentiable at $0$. Put $r(h)=F(h)-F(0)-D F(0)h=F(h)-D F(0)h$. Homogeneity gives $r(t h)=t r(h)$. If $r(h_0)!=0$, then $||r(t h_0)||/||t h_0||=||r(h_0)||/||h_0||>0$ for every $t>0$, contradicting differentiability as $t->0$. Hence $F(h)=D F(0)h$, so $F$ is linear.

== Problem B

For $f:A subset RR^n->RR^m$, if all partial derivatives exist and are bounded on the open set $A$, then $f$ is continuous. Write $x=x_0+h$ and pass from $x_0$ to $x$ one coordinate at a time: $p_0=x_0$, $p_i=p_(i-1)+h_i e_i$. Applying the one-variable mean value theorem to $s mapsto f_i(p_(i-1)+s e_i)$ gives $|f_i(p_i)-f_i(p_(i-1))|<=M|h_i|$. Summing coordinate and target components yields $||f(x)-f(x_0)||<=n M||x-x_0||$.

== Problem C

For $f(r,theta)=(r cos theta,r sin theta)$, $D f=((cos theta,-r sin theta),(sin theta,r cos theta))$ and $op("det") D f=r$. On $S=[1,2] times [0,pi/2]$, $f(S)$ is the quarter-annulus $1<=x^2+y^2<=4$, $x,y>=0$. The inverse is $(x,y) mapsto (sqrt(x^2+y^2), arctan(y/x))$, continuous on this set. Its derivative is $D f^(-1)=1/r ((cos theta,sin theta),(-sin theta,cos theta))$ and $D f D f^(-1)=I_2$.

== Problem D

Take $F(x,y)=(x^2 y/(x^2+y^2),x y^2/(x^2+y^2))$ away from $0$ and $F(0)=0$. Every directional derivative at $0$ is $(0,0)$, yet along $(x_n,y_n)=(1/n,1/n)$ the quotient of $F(x,y)$ by $sqrt(x^2+y^2)$ does not tend to $0$, so $F$ is not differentiable at the origin.

== Problem E

For $f(0)=0$ and $f(x,y)=x y(x^2-y^2)/(x^2+y^2)$ off $0$, the first partials at $0$ are $0$. Off $0$, product and quotient rules give

$f_x=y(x^2-y^2)/(x^2+y^2)+4x^2y^3/(x^2+y^2)^2,$

$f_y=x(x^2-y^2)/(x^2+y^2)-4x^3y^2/(x^2+y^2)^2.$

Both tend to $0$ at the origin (each term is bounded by a multiple of $|y|$ or $|x|$), so $f in C^1(RR^2)$. The mixed partials are equal off $0$, while at $0$ direct difference quotients give $partial_x partial_y f(0)=partial_y partial_x f(0)=-1$.

== Bonus problem

In an ultrametric space, $B_r(c)$ is closed: if $a$ lies outside it and $z in B_r(a)$, then $d(z,c)<=max(d(z,a),d(a,c))$ would otherwise contradict $d(a,c)>=r$. Intersecting balls are nested: if $r<=s$ and $a$ belongs to both $B_r(x)$ and $B_s(y)$, then $z in B_r(x)$ satisfies $d(z,y)<s$, hence $B_r(x) subset B_s(y)$. Thus every point of a ball is a centre.

For a connected weighted graph, define $d(v,w)$ as the least possible largest edge-weight along a path. Concatenating a best $v$-$z$ path and a best $z$-$w$ path yields $d(v,w)<=max(d(v,z),d(z,w))$. Conversely, from a finite ultrametric space, join every pair with an edge weighted by its distance; the least maximum path weight is the original metric.
