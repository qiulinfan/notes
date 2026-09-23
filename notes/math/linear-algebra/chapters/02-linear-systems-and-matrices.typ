#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

= Linear systems and matrices

The worksheet starts with a system of linear equations:
$
cases(x+2y+3z=39, x+3y+2z=34, 3x+2y+z=26).
$

To solve for $x,y,z$, we need to transform the system into the form
$cases(x=dots,y=dots,z=dots)$. In other words:

1. Eliminate terms that are off the diagonal.
2. Make the coefficients of the variables along the diagonal equal to $1$.

The row-reduction calculation on the page is
$
cases(x+2y+3z=39, x+3y+2z=34, 3x+2y+z=26)
arrow.r
cases(x+2y+3z=39, y-z=-5, 3x+2y+z=26)
arrow.r
cases(x+2y+3z=39, y-z=-5, -4y-8z=-91),
$
where the first arrow subtracts the first equation and the next arrow uses
$-3 times$ the first equation. Then
$
cases(x+2y+3z=39, y-z=-5, -4y-8z=-91)
arrow.r
cases(x+5z=49, y-z=-5, -12z=-111)
arrow.r
cases(x+5z=49, y-z=-5, z=9.25)
arrow.r
cases(x=2.75, y=4.25, z=9.25).
$
The intervening operations are $-2 times$ the second equation and $+4 times$
the second equation; then divide by $12$; finally use $-5 times$ the third
equation and add the third equation.

Finally, we check the sol by substituting $x,y,z$ into the original linear
system. Happily, in Linear Algebra it is easy to check.
