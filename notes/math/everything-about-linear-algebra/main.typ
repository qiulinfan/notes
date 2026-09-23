#import "../toolchain/qlnotes.typ": *
#import "../toolchain/math-aliases.typ": *

#show: qlnotes.with(
  title: "Everything About Linear Algebra",
  subtitle: "Linear, advanced, and numerical viewpoints",
  course: "Linear Algebra Collection",
  author: "Qiulin Fan",
  date: "2026",
  description: "A combined collection of linear algebra, advanced linear algebra, and numerical linear algebra notes.",
  keywords: ("linear algebra", "numerical linear algebra", "operator theory",),
  bibliography: "reference.bib",
)

#include "chapters/01-introduction.typ"

#pagebreak()
#align(center)[#text(size: 1.6em, weight: "bold")[Linear Algebra]]

#include "../linear-algebra/chapters/01-linear-equations.typ"
#include "../linear-algebra/chapters/02-linear-systems-and-matrices.typ"
#include "../linear-algebra/chapters/03-linear-combinations.typ"
#include "../linear-algebra/chapters/04-linear-transformations.typ"
#include "../linear-algebra/chapters/05-geometry-of-linear-transformations.typ"
#include "../linear-algebra/chapters/06-gram-schmidt-and-qr.typ"
#include "../linear-algebra/chapters/07-orthogonal-transformations.typ"
#include "../linear-algebra/chapters/08-least-squares.typ"
#include "../linear-algebra/chapters/09-inner-product-spaces.typ"
#include "../linear-algebra/chapters/10-diagonalization.typ"
#include "../linear-algebra/chapters/11-eigenvalues-and-eigenspaces.typ"
#include "../linear-algebra/chapters/12-complex-eigenvalues.typ"
#include "../linear-algebra/chapters/13-spectral-theorem.typ"

#pagebreak()
#align(center)[#text(size: 1.6em, weight: "bold")[Personal Linear Algebra Homeworks]]

#include "../linear-algebra/homeworks/hw01.typ"
#include "../linear-algebra/homeworks/hw02.typ"
#include "../linear-algebra/homeworks/hw03.typ"
#include "../linear-algebra/homeworks/hw04.typ"
#include "../linear-algebra/homeworks/hw05.typ"
#include "../linear-algebra/homeworks/hw06.typ"
#include "../linear-algebra/homeworks/hw07.typ"
#include "../linear-algebra/homeworks/hw08.typ"
#include "../linear-algebra/homeworks/hw09.typ"
#include "../linear-algebra/homeworks/hw10.typ"

#pagebreak()
#align(center)[#text(size: 1.6em, weight: "bold")[Advanced Linear Algebra]]

#include "../advanced-linear-algebra/chapters/01-review-on-basic-concepts.typ"
#include "../advanced-linear-algebra/chapters/02-linear-functionals-and-duality.typ"
#include "../advanced-linear-algebra/chapters/03-eigenvalues-and-operators.typ"
#include "../advanced-linear-algebra/chapters/04-operators-on-complex-vector-spaces.typ"
#include "../advanced-linear-algebra/chapters/05-multilinear-algebra.typ"

#pagebreak()
#align(center)[#text(size: 1.6em, weight: "bold")[Numerical Linear Algebra]]

#include "../numerical-linear-algebra/chapters/01-tensor-products-and-matrix-multiplication.typ"
#include "../numerical-linear-algebra/chapters/02-orthogonal-vectors-and-matrices.typ"
#include "../numerical-linear-algebra/chapters/03-norms.typ"
#include "../numerical-linear-algebra/chapters/04-svd.typ"
#include "../numerical-linear-algebra/chapters/05-qr-factorization.typ"
#include "../numerical-linear-algebra/chapters/06-discrete-fourier-transform.typ"
#include "../numerical-linear-algebra/chapters/07-conditioning-and-stability.typ"
#include "../numerical-linear-algebra/chapters/08-backward-error-analysis.typ"
