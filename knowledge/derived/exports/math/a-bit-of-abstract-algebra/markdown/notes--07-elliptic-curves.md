---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: Abstract Algebra Collection
date: 2026
description: A personal collection of introductory abstract algebra notes and worked problems.
keywords:
- abstract algebra
- rings
- groups
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/modern-algebra/chapters/07-elliptic-curves.typ"
subtitle: Integers, rings, groups, quotients, and a glimpse of elliptic curves
title: (A Bit of) Abstract Algebra
---
# Elliptic curves

This chapter transcribes 'WorkSheets/412-WS25-Mywork.pdf', pp. 1--2. The worksheet cites associativity but does not include its geometric proof; that omission is retained rather than supplied from another source.

## Affine curve, reflection, and identity

**Source transcription --- WS25, p. 1.** A (real, affine) elliptic curve is the solution set in $\mathbb{R}^{2}$ of

$$
y^{2} = x^{3} + ax + b,\quad a,b \in \mathbb{R},\quad 4a^{3} + 27b^{2} \neq 0.
$$

The page sketches the curve and says Notation: 使用 $E$ 表示一个 elliptic curve. 它对应的 equation 为 $f_{E{({x,y})}} = y^{2} - \left( {x^{3} + ax + b} \right)$; $E$ 表示 $f_{E{({x,y})}} = 0$ 的所有 solutions.''

For $P,Q \in E$, it defines $P \boxplus Q$ to be the reflection of the third intersection $R$ of the line through $P,Q$ with $E$; the sketch labels $P \boxplus Q = R'$. It adds $R$ 指 $R$ 的 [−ref]{.math}''.

An extra def 1′' says the tangent line at $P \in E$ is $E$'s other intersection with the tangent at $P$. extra def 2′' defines

$$
E^{\ast} = E \cup \left\{ \infty \right\},
$$

where $\infty$ is an extra element, and writes $\forall P \in E,P \boxplus \infty = \infty \boxplus P = P$. It explains that $P \boxplus \infty$ is the vertical line through $P$. The source then lists:

1.  Fact 1: $\boxplus$ is associative (画不出图'');
2.  Fact 2: $\infty$ is $E^{\ast}$'s identity and $P'$ is the $\boxplus$-inverse of $P$; and
3.  conclusion: $\left( {E^{\ast}, \boxplus} \right)$ forms a group.

**Source transcription --- WS25, p. 1, C.** For vertical lines, the diagram records $\left. |L_{1} \cap E \middle| = 2 \right.$, $\left. |L_{2} \cap E \middle| = 1 \right.$, and $\left. |L_{3} \cap E \middle| = 0 \right.$.

## Intersections of nonvertical lines

**Source transcription --- WS25, p. 2, D.** Let

$$
L = \left\{ {\left( {x,y} \right):y = mx + d} \right\}
$$

be a nonvertical line. Substitution gives

$$
f_{E{({x,mx + d})}} = - x^{3} + m^{2}x^{2} + \left( {2md - a} \right)x + d^{2} - b.
$$

Thus $\deg\left( f_{E{({x,mx + d})}} \right) = 3$, and the source draws the implication $\left. |L \cap E \middle| \leq 3 \right.$.

**Source transcription --- WS25, p. 2, Fact 3.** If $L$ is nonvertical and $\left. |L \cap E \middle| \geq 2 \right.$ (the note says 最多有三个交点''), then $f_{E{({x,mx + d})}}$ must have $3$ roots, or two roots with one of multiplicity $2$. The latter is annotated 此时有两个交点，其中一个为 tangent line''.

**Source transcription --- WS25, p. 2, Fact 4.** For $g_{L{(x)}} = f_{E{({x,mx + d})}}$, the source writes: $g_{L}$ has a double root if and only if $L$ is tangent to $E$ at $\left( {x_{0},mx_{0} + d} \right)$. It introduces $L' = \left\{ {\left( {x,y} \right):x = c} \right\}$ as a vertical line and says the same double-root statement holds for $f_{E{(y)}}$ after the corresponding substitution.

> **Remark**
>
> The only source statement about associativity is Fact 1 $\boxplus$ 是 associative 的（画不出图）.'' No proof is reconstructed here. The exact source location is WS25, p. 1, upper-right panel.

