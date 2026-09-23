#import "../toolchain/qlnotes.typ": *
#import "../toolchain/math-aliases.typ": *

#show: qlnotes.with(
  title: "Multivariate Analysis",
  subtitle: "Typst-first mathematics notes",
  course: "MATH 395",
  author: "Qiulin Fan",
  date: "2026",
  description: "Multivariate Analysis notes migrated from the explicitly selected personal historical sources.",
  keywords: ("Multivariate Analysis",),
  bibliography: "reference.bib",
)

#include "chapters/01-metric-spaces-and-compactness.typ"
#include "chapters/02-multivariable-differentiation.typ"
#include "chapters/03-implicit-and-inverse-functions.typ"
#include "chapters/04-partitions-and-lebesgue-characterization.typ"
#include "chapters/05-integration-and-change-of-variables.typ"
#include "chapters/06-ibl-baire-to-jordan-measure.typ"
#include "chapters/07-ibl-lebesgue-outer-measure.typ"
#include "chapters/08-ibl-measurability-regularity-and-additivity.typ"
#include "chapters/09-ibl-limits-and-carathéodory.typ"
