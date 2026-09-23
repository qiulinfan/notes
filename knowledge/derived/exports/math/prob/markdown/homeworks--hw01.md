---
author:
- Qiulin Fan
authority: typst
bibliography:
- reference.bib
course: Math 525
date: 2026
description: Complete migrated probability homework solutions.
keywords:
- probability
- homework
- worked solutions
lang: zh-CN
qlnotes-schema: qlnotes-v2
semantic-node-count: "0"
source: "notes/math/prob/homeworks/hw01.typ"
subtitle: Typst-first worked solutions
title: "Math 525: Probability Homeworks"
---
# Homework 1

## Problem 1 {#problem-1-1}

Let $n \in {\mathbb{N}}$.

- Show that $2^{n} = \sum_{k = 0}^{n}\left( \frac{n}{k} \right)$. Given that a set of $n$ elements has $2^{n}$ subsets, what is the combinatorial interpretation of this equality?

- Show that

  $$
  \sum\limits_{k\ \text{odd},0 \leq k \leq n}\left( \frac{n}{k} \right) = \sum\limits_{k\ \text{even},0 \leq k \leq n}\left( \frac{n}{k} \right)
  $$

- Show that

  $$
  \left( \frac{2n}{n} \right) = \sum\limits_{k = 0}^{n}\left( \frac{n}{k} \right)^{2}
  $$

Hint: You may use $\left( \frac{n}{k} \right)^{2} = \left( \frac{n}{k} \right)\left( \frac{n}{n - k} \right)$.

> **Proof**
>
> - By the binomial theorem, we have:
>
>   $$
>   (1 + 1)^{n} = \sum\limits_{k = 0}^{n}\left( \frac{n}{k} \right)1^{k}1^{n - k} = \sum\limits_{k = 0}^{n}\left( \frac{n}{k} \right)
>   $$
>
>   The combinatorial interpretation of this equality is that: Let $S_{k}$ be the collection of all subsets that have size $k$. For collection $S_{k}$, its size is $\left( \frac{n}{k} \right)$ since it represents choosing $k$ elements from $n$ elements without regard to order.\
>   Therefore the total number of subsets of $S$ is:
>
>   $$
>   \left. |\mathcal{P}(S) \middle| = \sum\limits_{k = 0}^{n} \middle| S_{k} \middle| = \sum\limits_{k = 0}^{n}\left( \frac{n}{k} \right) = 2^{n} \right.
>   $$
>
> - Using the binomial theorem, we have:
>
>   $$
>   0 = (1 - 1)^{n} = \sum\limits_{k = 0}^{n}\left( \frac{n}{k} \right)( - 1)^{k}1^{n - k} = \sum\limits_{k = 0}^{n}\left( \frac{n}{k} \right)( - 1)^{k}
>   $$
>
>   Thus:
>
>   $$
>   \begin{matrix}
>    & {\quad\quad\quad\quad\sum\limits_{k = 0}^{n}\left( \frac{n}{k} \right)( - 1)^{k} = 0} \\
>    & {\Longrightarrow\sum\limits_{0 \leq k \leq n,\, k\ \text{odd}}\left( \frac{n}{k} \right)( - 1) + \sum\limits_{0 \leq k \leq n,\, k\ \text{even}}\left( \frac{n}{k} \right)(1) = 0} \\
>    & {\Longrightarrow\sum\limits_{0 \leq k \leq n,\, k\ \text{odd}}\left( \frac{n}{k} \right) = \sum\limits_{0 \leq k \leq n,\, k\ \text{even}}\left( \frac{n}{k} \right)}
>   \end{matrix}
>   $$
>
> - We prove by combinatorial argument.\
>   Let $S$ be a setwith $2n$ distinct elements. The number of ways to choose a subset $P$ containing $n$ elements is $\left( \frac{2n}{n} \right)$.\
>   In another way: We can first arbitrarily divide the $2n$ distinct elements into two groups: group $A$ and group $B$, each containing $n$ elements:
>
>   $$
>   S = A \sqcup B
>   $$
>
>   And fix the two groups.\
>   For any subset $P$ of the $2n$ elements with size $n$, some of them are from group $A$, and the rest of them are from group $B$.\
>   Let $k$ be the number of elements of $P$ that are chosen from $A$, then the number of elements chosen from $B$ must be $n - k$.\
>   Note the number of ways to choose $k$ elements from $A$ is $\left( \frac{n}{k} \right)$, and the number of ways to choose $n - k$ elements from $B$ is $\left( \frac{n}{n - k} \right)$.\
>   Therefore, the total number of ways to get $P$ from $S = A \sqcup B$ with $k$ elements from $A$ is $\left( \frac{n}{k} \right)\left( \frac{n}{n - k} \right) = \left( \frac{n}{k} \right)^{2}$.\
>   Thus, summing over all possible values of $k = 0,1,\ldots,n$, the number of ways to choose $n$ elements from $S$ i.e. the number of ways to get $P$ from $S$, is
>
>   $$
>   \sum\limits_{k = 0}^{n}\left( \frac{n}{k} \right)^{2}
>   $$
>
>   Thus, we obtain
>
>   $$
>   \left( \frac{2n}{n} \right) = \sum\limits_{k = 0}^{n}\left( \frac{n}{k} \right)^{2}
>   $$
>
>   as desired.

## Problem 2 {#problem-2-1}

We roll a fair die three times and record the outcomes $a,b,c \in \left\{ {1,2,3,4,5,6} \right\}$. What is the probability that the equation $ax^{2} + bx + c = 0$ does not have solutions in the real numbers?

> **Solution**
>
> The equation $ax^{2} + bx + c = 0$ does not have solutions in the real numbers iff the the discriminant is negative, i.e. $\Delta = b^{2} - 4ac < 0$.\
> Total possible equations is $6^{3} = 216$. For each $b$, the total possible $(a,c)$ pairs are $36$. We can calculate the number of $(a,c)$ pairs that satisfy the condition case by case.
>
> - For $b = 1$: $4ac > 1$ holds for all $(a,c)$.
>
> - For $b = 2$: $4ac > 4\Longrightarrow ac > 1$, which excludes only $(1,1)$.
>
> - For $b = 3$: $4ac > 9\Longrightarrow ac \geq 3$ since they are integers, so excluding $(1,1),(1,2),(2,1)$ ($3$ cases).
>
> - For $b = 4$: $4ac > 16\Longrightarrow ac \geq 5$, excluding: $(1,3),(1,4),(2,2),(3,1),(4,1)$ besides the previous case, thus $8$ cases excluded.
>
> - For $b = 5$: $4ac > 25\Longrightarrow ac \geq 7$, excluding: $(1,5),(1,6),(2,3),(3,2),(5,1),(6,1)$ besides the previous case, thus $14$ cases excluded.
>
> - For $b = 6$: $4ac > 36\Longrightarrow ac \geq 10$, excluding: $(2,4),(3,3),(4,2)$ besides the previous case, thus $17$ cases excluded.
>
> Thus, the total number of triples for which the discriminant is not negative (exlcuded) is
>
> $$
> 1 + 3 + 8 + 14 + 17 = 43
> $$
>
> Therefore, the desired probability is
>
> $$
> 1 - {\mathbb{P}}(\text{the equation has solutions in the real numbers}) = 1 - \frac{43}{216} = \frac{173}{216}
> $$

## Problem 3 {#problem-3-1}

An ant starts at the origin $(0,0)$ on the integer lattice. At each step it moves either one unit to the right or one unit upward, each with probability $\frac{1}{2}$. The ant continues moving until it reaches the point $(205,200)$.\
What is the probability that the ant visits the point $(105,100)$ at some time during its journey?\
Hint: Start by counting the number of paths from $(0,0)$ to $(205,200)$.

> **Solution**
>
> Any path from $(0,0)$ to $(205,200)$ must consist of $205$ steps to the right and $200$ steps upward, for a total of $405$ steps. So a path is uniquely determined by the choice of 205 steps to the right (which is equivalent to the choice of 200 steps upward).\
> Thus total number of paths from $(0,0)$ to $(205,200)$ is
>
> $$
> N = \left( \frac{405}{205} \right)
> $$
>
> A path passes through the point $(105,100)$ if and only if it first goes from $(0,0)$ to $(105,100)$ and then from $(105,100)$ to $(205,200)$.\
> Thus the number of such paths is the product of the number of paths from $(0,0)$ to $(105,100)$ and the number of paths from $(105,100)$ to $(205,200)$, by the fundamental counting principle. For the same reason as deciding the number of total paths from $(0,0)$ to $(205,200)$, the number of paths from $(0,0)$ to $(105,100)$ is
>
> $$
> N_{1} = \left( \frac{205}{105} \right)
> $$
>
> And similarly, the number of paths from $(105,100)$ to $(205,200)$ is
>
> $$
> N_{2} = \left( \frac{200}{100} \right)
> $$
>
> Note that from a point to another point, all such paths are equally likely to be chosen. Therefore, the desired probability is
>
> $$
> {\mathbb{P}}(\text{path passes through}(105,100)) = \frac{\left( \frac{205}{105} \right)\left( \frac{200}{100} \right)}{\left( \frac{405}{205} \right)}
> $$

## Problem 4 {#problem-4-1}

From a lottery containing $n$ tickets numbered $1,2,\ldots,n$, a ticket is drawn, its number is recorded, and then it is returned to the lottery. This process is repeated $k \geq 3$ times. Find the probabilities of the following events:

- Ticket 1 is selected at least once.

- Tickets 1, 2, and 3 are each selected at least once.

> **Solution**
>
> - Let $E$ be the event that ticket $1$ is selected at least once. \$\$\\begin{align\*} \\mathbb{P}(E) &= 1 - \\mathbb{P}(\\text{ticket \$1\$ is never selected in \$k\$ draws}) \\\\ &= 1 - \\left(\\frac{n-1}{n}\\right)\^k \\tag\*{\\text{(by independence of each draw)}} \\end{align\*}\$\$
>
> - Let $F$ be the event that tickets $1,2,3$ are each selected at least once.\
>   For $i = 1,2,3$, let
>
>   $$
>   A_{i} := \left\{ {\text{ticket}\ i\ \text{is never selected in the}\ k\ \text{draws}} \right\}
>   $$
>
>   Thus
>
>   $$
>   P(F) = 1 - P(A_{1} \cup A_{2} \cup A_{3})
>   $$
>
>   By the principle of inclusion-exclusion,
>
>   $$
>   P(A_{1} \cup A_{2} \cup A_{3}) = P(A_{1}) + P(A_{2}) + P(A_{3}) - P(A_{1} \cap A_{2}) - P(A_{1} \cap A_{3}) - P(A_{2} \cap A_{3}) + P(A_{1} \cap A_{2} \cap A_{3})
>   $$
>
>   Since similar to part (a), we have:${\mathbb{P}}(A_{i}) = \left( \frac{n - 1}{n} \right)^{k}$, ${\mathbb{P}}(A_{i} \cap A_{j}) = \left( \frac{n - 2}{n} \right)^{k}$, ${\mathbb{P}}(A_{1} \cap A_{2} \cap A_{3}) = \left( \frac{n - 3}{n} \right)^{k}$, we then calculate:
>
>   $$
>   \begin{matrix}
>   {{\mathbb{P}}(F)} & {= 1 - \left( \frac{3}{1} \right)\left( \frac{n - 1}{n} \right)^{k} + \left( \frac{3}{2} \right)\left( \frac{n - 2}{n} \right)^{k} - \left( \frac{3}{3} \right)\left( \frac{n - 3}{n} \right)^{k}} \\
>    & {= 1 - 3\left( \frac{n - 1}{n} \right)^{k} + 3\left( \frac{n - 2}{n} \right)^{k} - \left( \frac{n - 3}{n} \right)^{k}}
>   \end{matrix}
>   $$

## Problem 5 {#problem-5-1}

In a house, drawer $S_{1}$ contains 3 gold coins and 3 silver coins, while drawer $S_{2}$ contains 3 gold coins and 6 silver coins. A thief (in the dark) randomly opens one drawer and then randomly takes two coins from it.

- What is the probability that both coins are gold?

- If it is discovered (upon his arrest) that he has stolen two gold coins, what is the probability that he opened drawer $S_{1}$ ?

> **Solution**
>
> The thief chooses a drawer uniformly at random, so for each pick, ${\mathbb{P}}(S_{1}\ \text{is chosen}) = {\mathbb{P}}(S_{2}\ \text{is chosen}) = \frac{1}{2}$. Given a drawer, he draws two coins without replacement.
>
> - Using the law of total probability,
>
>   $$
>   \begin{matrix}
>   {{\mathbb{P}}(\text{two gold})} & {= {\mathbb{P}}(\text{two gold} \mid S_{1}\ \text{is chosen}){\mathbb{P}}(\text{drawer}\ S_{1}) + {\mathbb{P}}(\text{two gold} \mid S_{2}\ \text{is chosen}){\mathbb{P}}(\text{drawer}\ S_{2})} \\
>    & {= \frac{1}{2} \cdot \frac{\left( \frac{3}{2} \right)}{\left( \frac{6}{2} \right)} + \frac{1}{2} \cdot \frac{\left( \frac{3}{2} \right)}{\left( \frac{9}{2} \right)}} \\
>    & {= \frac{1}{2}\left( {\frac{3}{15} + \frac{3}{36}} \right)} \\
>    & {= \frac{36 + 15}{360}} \\
>    & {= \frac{17}{120}}
>   \end{matrix}
>   $$
>
> - Let $G$ be the event that the thief stole two gold coins. By Bayes' rule,
>
>   $$
>   {\mathbb{P}}(S_{1} \mid G) = \frac{{\mathbb{P}}(G \mid S_{1}){\mathbb{P}}(S_{1})}{{\mathbb{P}}(G)}
>   $$
>
>   Since we have ${\mathbb{P}}(G \mid S_{1}) = \frac{\left( \frac{3}{2} \right)}{\left( \frac{6}{2} \right)} = \frac{1}{5}$, ${\mathbb{P}}(S_{1}) = \frac{1}{2}$, and ${\mathbb{P}}(G) = \frac{17}{120}$ from part (a), we get:
>
>   $$
>   {\mathbb{P}}(S_{1} \mid G) = \frac{\frac{1}{5} \cdot \frac{1}{2}}{\frac{17}{120}} = \frac{12}{17}
>   $$

## Problem 6 {#problem-6-1}

Let $A$ and $B$ be events of a probability space with ${\mathbb{P}}(A) > 0$. Show that:

- ${\mathbb{P}}(A \cup B) > 0$ and ${\mathbb{P}}(A \cap B \mid A \cup B) \leq {\mathbb{P}}(A \cap B \mid A)$.

- ${\mathbb{P}}(B \mid B \cup A) \geq {\mathbb{P}}(B \mid A)$.

> **Proof**
>
> - Since $A \subseteq A \cup B$, we have by monotonicity of probability measure:
>
>   $$
>   {\mathbb{P}}(A \cup B) \geq {\mathbb{P}}(A) > 0
>   $$
>
>   Also, since $A \cap B \subseteq A$ and ${\mathbb{P}}(A \cup B) \geq {\mathbb{P}}(A) > 0$, both conditional probabilities below are well-defined. Then
>
>   $$
>   \begin{matrix}
>   {{\mathbb{P}}(A \cap B \mid A \cup B)} & {= \frac{{\mathbb{P}}((A \cap B) \cap (A \cup B))}{{\mathbb{P}}(A \cup B)}} \\
>    & {= \frac{{\mathbb{P}}(A \cap B)}{{\mathbb{P}}(A \cup B)}} \\
>    & {\leq \frac{{\mathbb{P}}(A \cap B)}{{\mathbb{P}}(A)}} \\
>    & {= {\mathbb{P}}(A \cap B \mid A)}
>   \end{matrix}
>   $$
>
>   This finishes the proof.
>
> - Let $x := {\mathbb{P}}(A \cap B)$, $y := {\mathbb{P}}(A\backslash B)$, $z := {\mathbb{P}}(B\backslash A)$.\
>   so $x,y,z \geq 0$ by non-negativity of probability measure.\
>   And since
>
>   $$
>   A = (A \cap B) \sqcup (A\backslash B)
>   $$
>
>   Thus, we have:
>
>   $$
>   {\mathbb{P}}(A) = {\mathbb{P}}(A \cap B) + {\mathbb{P}}(A\backslash B) = x + y
>   $$
>
>   By similar reason, we have:
>
>   $$
>   {\mathbb{P}}(A \cup B) = x + y + z,\quad{\mathbb{P}}(B) = x + z
>   $$
>
>   Thus we have:
>
>   $$
>   {\mathbb{P}}(B \mid A \cup B) = \frac{{\mathbb{P}}(B \cap (A \cup B))}{{\mathbb{P}}(A \cup B)} = \frac{{\mathbb{P}}(B)}{{\mathbb{P}}(A \cup B)} = \frac{x + z}{x + y + z}
>   $$
>
>   and
>
>   $$
>   {\mathbb{P}}(B \mid A) = \frac{{\mathbb{P}}(A \cap B)}{{\mathbb{P}}(A)} = \frac{x}{x + y}
>   $$
>
>   Note the two probabilities are well-defined since $x + y = {\mathbb{P}}(A) > 0$ (and so $x + y + z > 0$).\
>   Now it remains to show that:
>
>   $$
>   \frac{x + z}{x + y + z} \geq \frac{x}{x + y}
>   $$
>
>   i.e.
>
>   $$
>   (x + z)(x + y) \geq x(x + y + z)
>   $$
>
>   which is equivalent to:
>
>   $$
>   x(x + y) + z(x + y) \geq x(x + y) + xz
>   $$
>
>   Eliminating common terms, this is equivalent to:
>
>   $$
>   zy \geq 0
>   $$
>
>   which is true by non-negativity of $z$ and $y$. This finishes the proof that:
>
>   $$
>   {\mathbb{P}}(B \mid A \cup B) \geq {\mathbb{P}}(B \mid A)
>   $$

