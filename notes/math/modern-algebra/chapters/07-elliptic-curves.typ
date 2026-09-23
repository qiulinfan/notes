#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= Elliptic curves
<elliptic-curves>

This chapter transcribes 'WorkSheets/412-WS25-Mywork.pdf', pp. 1--2. The
worksheet cites associativity but does not include its geometric proof; that
omission is retained rather than supplied from another source.

== Affine curve, reflection, and identity

*Source transcription — WS25, p. 1.* A (real, affine) #kn[Elliptic curve] is the
solution set in $bR^2$ of

$ y^2=x^3+a x+b, quad a,b in bR, quad 4a^3+27b^2!=0. $

The page sketches the curve and says ``Notation: 使用 $E$ 表示一个 elliptic
curve. 它对应的 equation 为 $f_E(x,y)=y^2-(x^3+a x+b)$; $E$ 表示
$f_E(x,y)=0$ 的所有 solutions.''

For $P,Q in E$, it defines $P plus.square Q$ to be the reflection of the third
intersection $R$ of the line through $P,Q$ with $E$; the sketch labels
$P plus.square Q=R'$. It adds ``$R$ 指 $R$ 的 $−ref$''.

An ``extra def 1'' says the tangent line at $P in E$ is $E$'s other
intersection with the tangent at $P$. ``extra def 2'' defines

$ E^*=E union {infinity}, $

where $infinity$ is an extra element, and writes
$forall P in E, P plus.square infinity=infinity plus.square P=P$. It explains that
$P plus.square infinity$ is the vertical line through $P$. The source then lists:

1. Fact 1: $plus.square$ is associative (``画不出图'');
2. Fact 2: $infinity$ is $E^*$'s identity and $P'$ is the $plus.square$-inverse
   of $P$; and
3. conclusion: $(E^*,plus.square)$ forms a group.

*Source transcription — WS25, p. 1, C.* For vertical lines, the diagram
records $|L_1 ∩ E|=2$, $|L_2 ∩ E|=1$, and
$|L_3 ∩ E|=0$.

== Intersections of nonvertical lines

*Source transcription — WS25, p. 2, D.* Let

$ L={ (x,y):y=m x+d} $

be a nonvertical line. Substitution gives

$ f_E(x,m x+d)=-x^3+m^2 x^2+(2m d-a)x+d^2-b. $

Thus $deg(f_E(x,m x+d))=3$, and the source draws the implication
$|L ∩ E|<=3$.

*Source transcription — WS25, p. 2, Fact 3.* If $L$ is nonvertical and
$|L ∩ E|>=2$ (the note says ``最多有三个交点''), then
$f_E(x,m x+d)$ must have $3$ roots, or two roots with one of multiplicity $2$.
The latter is annotated ``此时有两个交点，其中一个为 tangent line''.

*Source transcription — WS25, p. 2, Fact 4.* For $g_L(x)=f_E(x,m x+d)$, the
source writes: $g_L$ has a double root if and only if $L$ is tangent to $E$ at
$(x_0,m x_0+d)$. It introduces
$L'={ (x,y):x=c}$ as a vertical line and says the same double-root statement
holds for $f_E(y)$ after the corresponding substitution.

#remark[
The only source statement about associativity is ``Fact 1 $plus.square$ 是
associative 的（画不出图）.'' No proof is reconstructed here. The exact source
location is WS25, p. 1, upper-right panel.
]
