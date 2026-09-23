#import "../toolchain/qlnotes.typ": *
#import "../toolchain/math-aliases.typ": *

#show: qlnotes.with(
  title: "Numerical Linear Algebra",
  subtitle: "Typst-first mathematics notes",
  course: "Numerical Linear Algebra",
  author: "Qiulin Fan",
  date: "2026",
  description: "Numerical Linear Algebra notes migrated from the explicitly selected personal historical sources.",
  keywords: ("Numerical Linear Algebra",),
  bibliography: "reference.bib",
)

#include "chapters/01-tensor-products-and-matrix-multiplication.typ"
#include "chapters/02-orthogonal-vectors-and-matrices.typ"
#include "chapters/03-norms.typ"
#include "chapters/04-svd.typ"
#include "chapters/05-qr-factorization.typ"
#include "chapters/06-discrete-fourier-transform.typ"
#include "chapters/07-conditioning-and-stability.typ"
#include "chapters/08-backward-error-analysis.typ"
