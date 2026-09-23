#import "../toolchain/qlnotes.typ": *
#import "../toolchain/math-aliases.typ": *
#import "diagrams/probability-diagrams.typ": *

#show: qlnotes.with(
  title: "Math 525: Probability",
  subtitle: "Typst-first course notes",
  course: "Math 525",
  author: "Qiulin Fan",
  date: "2026",
  description: "Probability notes migrated from the complete LaTeX course source.",
  keywords: ("probability", "random variables", "law of large numbers", "central limit theorem"),
  bibliography: "reference.bib",
)

#include "chapters/01-combinatorics&prob_space.typ"
#include "chapters/02-random-variables.typ"
#include "chapters/03-joint&conditional-distribution.typ"
#include "chapters/04-LLN.typ"
#include "chapters/05-CLT.typ"
