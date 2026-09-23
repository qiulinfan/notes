---
kgd_schema: "kgdistiller-entry-v1"
kgd_id: "increasing-right-ctn-regular-borel-measure-distribution"
kgd_label: "任意 increasing 且 right ctn 函数都是某个 regular Borel measure 的 distribution 函数"
kgd_entry_origin: "agent-extracted"
kgd_source: "knowledge/derived/by-source/notes/math/measure-theory/chapters/03-distribution-function-与-lebesgue-stieltjes-measures.typ.md"
kgd_source_sha256: "3dd8e7f13d7d5561942ca497783eb3727779193462744b1216010db975179e15"
kgd_definition_sha256: "e7de3c47f0ef2bd0bebf90b3d760b2991c6a5bfd3181abc46bb40a42465bcbaf"
---

# 任意 increasing 且 right ctn 函数都是某个 regular Borel measure 的 distribution 函数

## Summary

取 lemma 中的 $cal(A)_0$. 对于任意的 increasing 且 right ctn 的 $F : bb(R) arrow.r bb(R)$, 我们 define $mu_0 : cal(A)_0 arrow.r\[0\,oo\]$, by: $ mu_0\(union.big_(i = 1)^n\(a_i\,b_i\]\)= sum_(i = 1)^n\(F\(b_i\)- F\(a_i\)\) $ 并规定 $mu_0\(0\)= 0$, 以及 $F\(oo\)= lim_(x arrow.r oo) F\(x\)$ \ , Claim 1: $mu_0$ 是一个 $cal(A)_0$ 上的 $sigma$-finite premeasure. \ Claim 2: (by Hahn-Kolmogrov) $mu_0$ extend to a locally finite Borel measure $mu_F$, 并且 $mu_F\(\(a\,b\]\)= F\(b\)- F\(a\)$ for any h-interval, i.e. $F$ 是 $mu_F$ 的 distribution function. \ Claim 3: $F$ 是 $mu_F$ 的唯一 distribution function up to constant term, in the sense that 任意其他的 such function $G$ 如果也是$mu_F$ 的 distribition function, 则必然有 $F - G$ 为 const.

## Context

原生 theorem；authority: notes/math/measure-theory/chapters/03-distribution-function-与-lebesgue-stieltjes-measures.typ:79。
