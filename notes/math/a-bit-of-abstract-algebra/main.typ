#import "../toolchain/qlnotes.typ": *
#import "../toolchain/math-aliases.typ": *

#show: qlnotes.with(
  title: "(A Bit of) Abstract Algebra",
  subtitle: "Integers, rings, groups, quotients, and a glimpse of elliptic curves",
  course: "Abstract Algebra Collection",
  author: "Qiulin Fan",
  date: "2026",
  description: "A personal collection of introductory abstract algebra notes and worked problems.",
  keywords: ("abstract algebra", "rings", "groups",),
  bibliography: "reference.bib",
)

#include "chapters/01-introduction.typ"

#pagebreak()

#include "../modern-algebra/chapters/01-integers-and-division.typ"
#include "../modern-algebra/chapters/02-gcd-primes-and-congruence.typ"
#include "../modern-algebra/homeworks/hw01-integers-and-equivalence.typ"

#include "../modern-algebra/chapters/03-rings-and-homomorphisms.typ"
#include "../modern-algebra/homeworks/hw02-rings-and-polynomials.typ"

#include "../modern-algebra/chapters/04-polynomials-and-quotients.typ"
#include "../modern-algebra/homeworks/hw03-groups.typ"

#include "../modern-algebra/chapters/05-groups-and-permutations.typ"
#include "../modern-algebra/homeworks/hw04-subgroups-and-cosets.typ"
#include "../modern-algebra/homeworks/hw05-group-actions-and-homomorphisms.typ"

#include "../modern-algebra/chapters/06-normal-subgroups-and-isomorphisms.typ"
#include "../modern-algebra/homeworks/hw06-quotient-groups.typ"
#include "../modern-algebra/homeworks/hw07-isomorphism-theorems.typ"

#include "../modern-algebra/chapters/07-elliptic-curves.typ"
#include "../modern-algebra/homeworks/hw08-rings-and-ideals.typ"
#include "../modern-algebra/homeworks/hw09-quotient-rings.typ"
#include "../modern-algebra/homeworks/hw10-final-topics.typ"
