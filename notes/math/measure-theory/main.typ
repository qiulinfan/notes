#import "../toolchain/qlnotes.typ": *
#import "../toolchain/math-aliases.typ": *

#show: qlnotes.with(
  title: "MATH 597: Measure Theory",
  subtitle: "Typst-first course notes and worked homeworks",
  course: "MATH 597",
  author: "Qiulin Fan",
  date: "Winter 2025",
  description: "Measure theory notes migrated from the complete LaTeX course source.",
  keywords: ("measure theory", "integration", "Lebesgue measure", "Radon–Nikodym theorem", "Lp spaces"),
  bibliography: "reference.bib",
)

#include "chapters/01-sigma-algebra-与-measure.typ"
#include "homeworks/hw01-on_sigma-algebra.typ"

#include "chapters/02-outer-measure-与-completion-of-a-measurable-space.typ"
#include "homeworks/hw02-on_Carathéodorys&Hahn-Kolmogrov-thm.typ"

#include "chapters/03-distribution-function-与-lebesgue-stieltjes-measures.typ"
#include "homeworks/hw03-on_Lebesgue-Stieljes-measures.typ"

#include "chapters/04-measurable_functions_and_integration_on_L^+(mu).typ"
#include "homeworks/hw04-on_measurable-functions.typ"

#include "chapters/05-integration_of_real_and_complex_functions.typ"
#include "homeworks/hw05-on_integration.typ"

#include "chapters/06-product_measure&Fubini-Tonelli.typ"
#include "homeworks/hw06-on_product-measure&mode-of-convergence.typ"

#include "chapters/07-Lebesgue_measure_on_R^n.typ"
#include "chapters/08-Hardy-Littlewood&LDT.typ"
#include "homeworks/hw07-on_differentiaion.typ"

#include "chapters/09-L^P-space_and_inequalities.typ"
#include "homeworks/hw08-on_L^p-spacecs.typ"

#include "chapters/10-signed_measure&Jordan-decomposition.typ"
#include "homeworks/hw09-on_signed-measure.typ"

#include "chapters/11-Radon-Nikodym_theorem.typ"
#include "homeworks/hw10-on_LRN-theorem&complex-measure.typ"

#include "chapters/12-differentiation_on_real_spaces.typ"
#include "homeworks/hw11-on_regular-borel-measure&BV.typ"
#include "homeworks/hw12-on_absolutely-continuous-functions.typ"

#include "chapters/13-the_dual_of_L^p-spaces.typ"
