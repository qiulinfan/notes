#import "../toolchain/qlnotes.typ": *
#import "../toolchain/math-aliases.typ": *

#show: qlnotes.with(
  title: "Some Linear Algebra",
  subtitle: "Taken from LADR and GTM 135",
  author: "Qiulin Fan",
  date: "2024",
  description: "Mainly intended to serve the convenience of Analysis.",
  bibliography: "reference.bib",
)

#include "chapters/01-review-on-basic-concepts.typ"
#include "chapters/02-linear-functionals-and-duality.typ"
#include "chapters/03-eigenvalues-and-operators.typ"
#include "chapters/04-operators-on-complex-vector-spaces.typ"
#include "chapters/05-multilinear-algebra.typ"
