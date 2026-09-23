#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Source: Homework/395-hw-08.pdf p.1 (personal work).
= HW 8

== Problem A

Let $f:RR^3->RR^2$ be $C^1$, $f(1,2,3)=0$, and

$D f(1,2,3)=((1,2,1),(1,-1,1)).$

The minors are $op("det")(partial f/partial(x,y))=-3$, $op("det")(partial f/partial(y,z))=3$, and $op("det")(partial f/partial(x,z))=0$. Thus $(x,y)$ can be solved in terms of $z$ near $(1,2,3)$, and $(y,z)$ can be solved in terms of $x$; the IFT gives no conclusion for solving $(x,z)$ in terms of $y$.

== Problem B

If $g:B->RR^2$ satisfies $f(x,g(x))=0$ and $g(1)=(2,3)$, differentiating gives $f_x+f_(y,z)D g=0$. Hence

$D g(1)=-[partial f/partial(y,z)(1,2,3)]^(-1)partial f/partial x(1,2,3)$

$=-((2,1),(-1,1))^(-1)(1,1)^T=(0,-1)^T.$
