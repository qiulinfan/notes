#import "../toolchain/qlnotes.typ": *
#import "../toolchain/math-aliases.typ": *

#show: qlnotes.with(
  title: "Linear Algebra",
  subtitle: "Typst-first mathematics notes",
  course: "MATH 217",
  author: "Qiulin Fan",
  date: "2026",
  description: "Linear Algebra notes migrated from the explicitly selected personal historical sources.",
  keywords: ("Linear Algebra",),
  bibliography: "reference.bib",
)

#include "chapters/01-linear-equations.typ"
#include "chapters/02-linear-systems-and-matrices.typ"
#include "chapters/03-linear-combinations.typ"
#include "chapters/04-linear-transformations.typ"
#include "chapters/05-geometry-of-linear-transformations.typ"
#include "chapters/06-gram-schmidt-and-qr.typ"
#include "chapters/07-orthogonal-transformations.typ"
#include "chapters/08-least-squares.typ"
#include "chapters/09-inner-product-spaces.typ"
#include "chapters/10-diagonalization.typ"
#include "chapters/11-eigenvalues-and-eigenspaces.typ"
#include "chapters/12-complex-eigenvalues.typ"
#include "chapters/13-spectral-theorem.typ"

#pagebreak()

= Personal homework submissions

#include "homeworks/hw01.typ"
#include "homeworks/hw02.typ"
#include "homeworks/hw03.typ"
#include "homeworks/hw04.typ"
#include "homeworks/hw05.typ"
#include "homeworks/hw06.typ"
#include "homeworks/hw07.typ"
#include "homeworks/hw08.typ"
#include "homeworks/hw09.typ"
#include "homeworks/hw10.typ"
