#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

// Source: Homework/395-hw-10.pdf pp.1-4 (personal work).
= HW 10

== Problem A

For integrable $f,g:B->RR$, $M(x)=max(f(x),g(x))$ is integrable. At every point where both $f$ and $g$ are continuous, the maximum is continuous (use the two local $epsilon$ bounds). Thus $D_M subset D_f union D_g$, which has measure zero.

== Problem B

If $f$ is integrable then $|f|$ is integrable: $D_|f| subset D_f$, since a fixed jump in $|f|$ gives, by reverse triangle inequality, a jump in $f$. For every partition $P$, $|L(f,P)|<=U(|f|,P)$, and taking infima yields the corresponding inequality between the integrals of $f$ and $|f|$.

== Problem C

Let $R=((cos(sqrt(2)pi),sin(sqrt(2)pi)),(-sin(sqrt(2)pi),cos(sqrt(2)pi)))$ and let $S$ be the rotation of the rational points in the unit square. It is dense because $R$ is a rotation. Two points of $S$ on one vertical (or horizontal) line must have equal preimages, since the relevant sine/cosine coefficient is irrational; hence each such line meets $S$ at most once. The characteristic function of $S$ is $0$ except possibly at one point on each coordinate line, so every one-variable slice is integrable; but density gives upper sum $1$ and lower sum $0$ for every two-dimensional partition.

== Problem D

For $f in C^2(A)$ and closed box $Q=[a_1,b_1]times[a_2,b_2] subset A$, Fubini and FTC give both integrals of the mixed partials as $f(b_1,b_2)-f(a_1,b_2)-f(b_1,a_2)+f(a_1,a_2)$. On a small box about $(a,b)$, apply the integral mean-value theorem twice to their difference; the zero double integral forces equality of mixed partials at $(a,b)$.

== Problem E

Riemann integrability implies Darboux integrability because a fine partition has both tagged sums within $epsilon/2$ of the integral, so upper and lower sums are within $epsilon$. Conversely, for a Darboux integrable $f$, refine a near-optimal partition by any sufficiently fine partition. The boundary-strip lemma bounds total volume of new subboxes crossing old boundaries; lower and upper sums on the remaining subboxes stay close to the Darboux sums. Therefore every fine tagged sum is close to the common Darboux integral.

== Problems F-G and Bonus

For $g(x)=f(A x)$, chain rule gives $D g(0)=D f(0)A$ and differentiating once more yields $H_g(0)=A^T H_f(0)A$. The quadratic Taylor polynomial is $T_2(x)=f(0)+D f(0)x+1/2 x^T H_f(0)x$. The bonus proof uses that the continuity set of a map is a $G_delta$ set and Baire Category: $QQ$ is not $G_delta$, so no function can be continuous exactly on $QQ$ and discontinuous on its complement.
