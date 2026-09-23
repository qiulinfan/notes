#import "../toolchain/qlnotes.typ": *
#import "../toolchain/math-aliases.typ": *

#show: qlnotes.with(
  title: "Mathematical Analysis",
  subtitle: "Single-variable analysis — migrated working notes",
  course: "MATH 451",
  author: "Qiulin Fan",
  date: "2026",
  description: "Single-variable mathematical analysis notes migrated from the selected lectures and historical homework artefacts.",
  keywords: ("real analysis", "metric spaces", "Riemann integration"),
  bibliography: "reference.bib",
)

#include "chapters/01-real-number-system.typ"
#include "chapters/02-functions-countability-and-metric-spaces.typ"
#include "chapters/03-sequences-and-topology.typ"
#include "chapters/04-limits-and-continuity.typ"
#include "chapters/05-differentiation.typ"
#include "chapters/06-numerical-series.typ"
#include "chapters/07-riemann-integration.typ"
#include "chapters/08-sequences-and-series-of-functions.typ"
