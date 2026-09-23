#import "../toolchain/qlnotes.typ": *
#import "../toolchain/math-aliases.typ": *

#show: qlnotes.with(
  title: "Modern Algebra",
  subtitle: "Typst-first mathematics notes",
  course: "MATH 412",
  author: "Qiulin Fan",
  date: "2026",
  description: "Modern Algebra notes migrated from the explicitly selected personal historical sources.",
  keywords: ("Modern Algebra",),
  bibliography: "reference.bib",
)

#include "chapters/01-integers-and-division.typ"
#include "chapters/02-gcd-primes-and-congruence.typ"
#include "homeworks/hw01-integers-and-equivalence.typ"

#include "chapters/03-rings-and-homomorphisms.typ"
#include "homeworks/hw02-rings-and-polynomials.typ"

#include "chapters/04-polynomials-and-quotients.typ"
#include "homeworks/hw03-groups.typ"

#include "chapters/05-groups-and-permutations.typ"
#include "homeworks/hw04-subgroups-and-cosets.typ"
#include "homeworks/hw05-group-actions-and-homomorphisms.typ"

#include "chapters/06-normal-subgroups-and-isomorphisms.typ"
#include "homeworks/hw06-quotient-groups.typ"
#include "homeworks/hw07-isomorphism-theorems.typ"

#include "chapters/07-elliptic-curves.typ"
#include "homeworks/hw08-rings-and-ideals.typ"
#include "homeworks/hw09-quotient-rings.typ"
#include "homeworks/hw10-final-topics.typ"
