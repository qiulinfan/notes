---
kgd_schema: "kgdistiller-entry-v1"
kgd_id: "marginal-distribution-from-joint-limits"
kgd_label: "通过 joint distribution 的极限得到 marginal distribution"
kgd_entry_origin: "agent-extracted"
kgd_source: "knowledge/derived/by-source/notes/math/prob/chapters/03-joint&conditional-distribution.typ.md"
kgd_source_sha256: "225f9c65cf203ff7f5de6fb275c6aa022a0ea76958849888893242091694ae29"
kgd_definition_sha256: "d9c5706634a2a97759710968107ce6bc9a155223e2da8ae2921521e7ff3bb268"
---

# 通过 joint distribution 的极限得到 marginal distribution

## Summary

对二维 random vector (X_1,X_2)^T，令另一坐标趋于正无穷即可从 joint cdf 恢复 marginal cdf，例如 P(X_1<=x)=lim_{y->infinity} F_X(x,y)。
