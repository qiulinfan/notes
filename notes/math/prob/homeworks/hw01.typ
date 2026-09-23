#import "../../toolchain/qlnotes.typ": *
#import "../../toolchain/math-aliases.typ": *

#heading(level: 1, numbering: none)[Homework 1]
<homework-1>
#heading(level: 2, numbering: none)[Problem 1]
<problem-1>
Let $n in bb(N)$.

- Show that $2^n = sum_(k = 0)^n binom(n, k)$. Given that a set of $n$ elements has $2^n$ subsets, what is the combinatorial interpretation of this equality?

- Show that $ sum_(k upright(" odd ")\,0 lt.eq k lt.eq n) binom(n, k) = sum_(k upright(" even ")\,0 lt.eq k lt.eq n) binom(n, k) $

- Show that $ binom(2 n, n) = sum_(k = 0)^n binom(n, k)^2 $

Hint: You may use $binom(n, k)^2 = binom(n, k) binom(n, n - k)$.

#proof[

- By the binomial theorem, we have:
  $ \(1 + 1\)^n= sum_(k = 0)^n binom(n, k) 1^k 1^(n - k) = sum_(k = 0)^n binom(n, k) $
  The combinatorial interpretation of this equality is that:
  Let $S_k$ be the collection of all subsets that have size $k$.
  For collection $S_k$, its size is $binom(n, k)$ since it represents choosing $k$ elements from $n$ elements without regard to order. \ Therefore the total number of subsets of $S$ is:
  $ \|cal(P)\(S\)\|= sum_(k = 0)^n\|S_k\|= sum_(k = 0)^n binom(n, k) = 2^n $

- Using the binomial theorem, we have:
  $ 0 =\(1 - 1\)^n= sum_(k = 0)^n binom(n, k)\(- 1\)^k 1^(n - k) = sum_(k = 0)^n binom(n, k)\(- 1\)^k $
  Thus:
  $  & quad quad quad quad sum_(k = 0)^n binom(n, k)\(- 1\)^k= 0\
   & arrow.r.double.long sum_(0 lt.eq k lt.eq n\,thin k upright(" odd")) binom(n, k)\(- 1\)+ sum_(0 lt.eq k lt.eq n\,thin k upright(" even")) binom(n, k)\(1\)= 0\
   & arrow.r.double.long sum_(0 lt.eq k lt.eq n\,thin k upright(" odd")) binom(n, k) = sum_(0 lt.eq k lt.eq n\,thin k upright(" even")) binom(n, k) $

- We prove by combinatorial argument. \ Let $S$ be a setwith $2 n$ distinct elements. The number of ways to choose a subset $P$ containing $n$ elements is $binom(2 n, n)$. \ In another way:
  We can first arbitrarily divide the $2 n$ distinct elements into two groups: group $A$ and group $B$, each containing $n$ elements:
  $ S = A union.sq B $
  And fix the two groups. \ For any subset $P$ of the $2 n$ elements with size $n$, some of them are from group $A$, and the rest of them are from group $B$. \ Let $k$ be the number of elements of $P$ that are chosen from $A$, then the number of elements chosen from $B$ must be $n - k$. \ Note the number of ways to choose $k$ elements from $A$ is $binom(n, k)$, and the number of ways to choose $n - k$ elements from $B$ is $binom(n, n - k)$. \ Therefore, the total number of ways to get $P$ from $S = A union.sq B$ with $k$ elements from $A$ is $binom(n, k) binom(n, n - k) = binom(n, k)^2$. \ Thus, summing over all possible values of $k = 0\,1\,dots.h\,n$, the number of ways to choose $n$ elements from $S$ i.e. the number of ways to get $P$ from $S$, is $ sum_(k = 0)^n binom(n, k)^2 $
  Thus, we obtain $ binom(2 n, n) = sum_(k = 0)^n binom(n, k)^2 $ as desired.

]
#heading(level: 2, numbering: none)[Problem 2]
<problem-2>
We roll a fair die three times and record the outcomes $a\,b\,c in { 1\,2\,3\,4\,5\,6 }$. What is the probability that the equation $a x^2 + b x + c = 0$ does not have solutions in the real numbers?

#solution[
The equation $a x^2 + b x + c = 0$ does not have solutions in the real numbers iff the the discriminant is negative, i.e. $Delta = b^2 - 4 a c < 0$. \ Total possible equations is $6^3 = 216$. For each $b$, the total possible $\(a\,c\)$ pairs are $36$. We can calculate the number of $\(a\,c\)$ pairs that satisfy the condition case by case.

- For $b = 1$: $4 a c > 1$ holds for all $\(a\,c\)$.

- For $b = 2$: $4 a c > 4 arrow.r.double.long a c > 1$, which excludes only $\(1\,1\)$.

- For $b = 3$: $4 a c > 9 arrow.r.double.long a c gt.eq 3$ since they are integers, so excluding $\(1\,1\)\,\(1\,2\)\,\(2\,1\)$ ($3$ cases).

- For $b = 4$: $4 a c > 16 arrow.r.double.long a c gt.eq 5$, excluding: $\(1\,3\)\,\(1\,4\)\,\(2\,2\)\,\(3\,1\)\,\(4\,1\)$ besides the previous case, thus $8$ cases excluded.

- For $b = 5$: $4 a c > 25 arrow.r.double.long a c gt.eq 7$, excluding: $\(1\,5\)\,\(1\,6\)\,\(2\,3\)\,\(3\,2\)\,\(5\,1\)\,\(6\,1\)$ besides the previous case, thus $14$ cases excluded.

- For $b = 6$: $4 a c > 36 arrow.r.double.long a c gt.eq 10$, excluding: $\(2\,4\)\,\(3\,3\)\,\(4\,2\)$ besides the previous case, thus $17$ cases excluded.

Thus, the total number of triples for which the discriminant is not negative (exlcuded) is
$ 1 + 3 + 8 + 14 + 17 = 43 $
Therefore, the desired probability is
$ 1 - bb(P)\(upright("the equation has solutions in the real numbers")\)= 1 - 43 / 216 = 173 / 216 $

]
#heading(level: 2, numbering: none)[Problem 3]
<problem-3>
An ant starts at the origin $\(0\,0\)$ on the integer lattice.
At each step it moves either one unit to the right or one unit upward, each with probability $1 / 2$.
The ant continues moving until it reaches the point $\(205\,200\)$. \ What is the probability that the ant visits the point $\(105\,100\)$ at some time during its journey? \ Hint: Start by counting the number of paths from $\(0\,0\)$ to $\(205\,200\)$.

#solution[
Any path from $\(0\,0\)$ to $\(205\,200\)$ must consist of $205$ steps to the right and $200$ steps upward, for a total of $405$ steps.
So a path is uniquely determined by the choice of 205 steps to the right (which is equivalent to the choice of 200 steps upward). \ Thus total number of paths from $\(0\,0\)$ to $\(205\,200\)$ is
$ N = binom(405, 205) $

A path passes through the point $\(105\,100\)$ if and only if it first goes from $\(0\,0\)$ to $\(105\,100\)$ and then from $\(105\,100\)$ to $\(205\,200\)$. \ Thus the number of such paths is the product of the number of paths from $\(0\,0\)$ to $\(105\,100\)$ and the number of paths from $\(105\,100\)$ to $\(205\,200\)$, by the fundamental counting principle.
For the same reason as deciding the number of total paths from $\(0\,0\)$ to $\(205\,200\)$, the number of paths from $\(0\,0\)$ to $\(105\,100\)$ is
$ N_1 = binom(205, 105) $
And similarly, the number of paths from $\(105\,100\)$ to $\(205\,200\)$ is
$ N_2 = binom(200, 100) $
Note that from a point to another point, all such paths are equally likely to be chosen. Therefore, the desired probability is
$ bb(P)\(upright("path passes through ")\(105\,100\)\)= frac(binom(205, 105) binom(200, 100), binom(405, 205)) $

]
#heading(level: 2, numbering: none)[Problem 4]
<problem-4>
From a lottery containing $n$ tickets numbered $1\,2\,dots.h\,n$, a ticket is drawn, its number is recorded, and then it is returned to the lottery. This process is repeated $k gt.eq 3$ times. Find the probabilities of the following events:

- Ticket 1 is selected at least once.

- Tickets 1, 2, and 3 are each selected at least once.

#solution[
- Let $E$ be the event that ticket $1$ is selected at least once.
  \$\$\\begin{align\*}
      \\mathbb{P}(E) &= 1 - \\mathbb{P}(\\text{ticket \$1\$ is never selected in \$k\$ draws}) \\\\
      &= 1 - \\left(\\frac{n-1}{n}\\right)^k \\tag\*{\\text{(by independence of each draw)}}
  \\end{align\*}\$\$

- Let $F$ be the event that tickets $1\,2\,3$ are each selected at least once. \ For $i = 1\,2\,3$, let
  $ A_i := { upright("ticket ") i upright(" is never selected in the ") k upright(" draws") } $
  Thus
  $ P\(F\)= 1 - P\(A_1 union A_2 union A_3\) $
  By the principle of inclusion-exclusion,
  $ P\(A_1 union A_2 union A_3\)= P\(A_1\)+ P\(A_2\)+ P\(A_3\)- P\(A_1 inter A_2\)- P\(A_1 inter A_3\)- P\(A_2 inter A_3\)+ P\(A_1 inter A_2 inter A_3\) $
  Since similar to part (a), we have:$bb(P)\(A_i\)= (frac(n - 1, n))^k$, $bb(P)\(A_i inter A_j\)= (frac(n - 2, n))^k$, $bb(P)\(A_1 inter A_2 inter A_3\)= (frac(n - 3, n))^k$, we then calculate:
  $ bb(P)\(F\) & = 1 - binom(3, 1) (frac(n - 1, n))^k + binom(3, 2) (frac(n - 2, n))^k - binom(3, 3) (frac(n - 3, n))^k\
   & = 1 - 3 (frac(n - 1, n))^k + 3 (frac(n - 2, n))^k - (frac(n - 3, n))^k $

]
#heading(level: 2, numbering: none)[Problem 5]
<problem-5>
In a house, drawer $S_1$ contains 3 gold coins and 3 silver coins,
while drawer $S_2$ contains 3 gold coins and 6 silver coins.
A thief (in the dark) randomly opens one drawer and then randomly takes two coins from it.

- What is the probability that both coins are gold?

- If it is discovered (upon his arrest) that he has stolen two gold coins, what is the probability that he opened drawer $S_1$ ?

#solution[
The thief chooses a drawer uniformly at random, so for each pick, $bb(P)\(S_1 upright(" is chosen")\)= bb(P)\(S_2 upright(" is chosen")\)= 1 / 2$.
Given a drawer, he draws two coins without replacement.

- Using the law of total probability,
  $ bb(P)\(upright("two gold")\) & = bb(P)\(upright("two gold") divides S_1 upright(" is chosen")\)bb(P)\(upright("drawer ") S_1\)+ bb(P)\(upright("two gold") divides S_2 upright(" is chosen")\)bb(P)\(upright("drawer ") S_2\)\
   & = 1 / 2 dot.op binom(3, 2) / binom(6, 2) + 1 / 2 dot.op binom(3, 2) / binom(9, 2)\
   & = 1 / 2 (3 / 15 + 3 / 36)\
   & = frac(36 + 15, 360)\
   & = 17 / 120 $

- Let $G$ be the event that the thief stole two gold coins. By Bayes' rule,
  $ bb(P)\(S_1 divides G\)= frac(bb(P)\(G divides S_1\)bb(P)\(S_1\), bb(P)\(G\)) $
  Since we have $bb(P)\(G divides S_1\)= binom(3, 2) / binom(6, 2) = 1 / 5$, $bb(P)\(S_1\)= 1 / 2$, and $bb(P)\(G\)= 17 / 120$ from part (a), we get:
  $ bb(P)\(S_1 divides G\)= frac(1 / 5 dot.op 1 / 2, 17 / 120) = 12 / 17 $

]
#heading(level: 2, numbering: none)[Problem 6]
<problem-6>
Let $A$ and $B$ be events of a probability space with $bb(P)\(A\)> 0$. Show that:

- $bb(P)\(A union B\)> 0$ and $bb(P)\(A inter B divides A union B\)lt.eq bb(P)\(A inter B divides A\)$.

- $bb(P)\(B divides B union A\)gt.eq bb(P)\(B divides A\)$.

#proof[

- Since $A subset.eq A union B$, we have by monotonicity of probability measure:
  $ bb(P)\(A union B\)gt.eq bb(P)\(A\)> 0 $
  Also, since $A inter B subset.eq A$ and $bb(P)\(A union B\)gt.eq bb(P)\(A\)> 0$,
  both conditional probabilities below are well-defined.
  Then
  $ bb(P)\(A inter B divides A union B\) & = frac(bb(P)\(\(A inter B\)inter\(A union B\)\), bb(P)\(A union B\))\
   & = frac(bb(P)\(A inter B\), bb(P)\(A union B\))\
   & lt.eq frac(bb(P)\(A inter B\), bb(P)\(A\))\
   & = bb(P)\(A inter B divides A\) $
  This finishes the proof.

- Let $x := bb(P)\(A inter B\)$, $y := bb(P)\(A\\B\)$, $z := bb(P)\(B\\A\)$. \ so $x\,y\,z gt.eq 0$ by non-negativity of probability measure. \ And since $ A =\(A inter B\)union.sq\(A\\B\) $
  Thus, we have:
  $ bb(P)\(A\)= bb(P)\(A inter B\)+ bb(P)\(A\\B\)= x + y $
  By similar reason, we have:
  $ bb(P)\(A union B\)= x + y + z\,quad bb(P)\(B\)= x + z $
  Thus we have:
  $ bb(P)\(B divides A union B\)= frac(bb(P)\(B inter\(A union B\)\), bb(P)\(A union B\)) = frac(bb(P)\(B\), bb(P)\(A union B\)) = frac(x + z, x + y + z) $
  and
  $ bb(P)\(B divides A\)= frac(bb(P)\(A inter B\), bb(P)\(A\)) = frac(x, x + y) $
  Note the two probabilities are well-defined since $x + y = bb(P)\(A\)> 0$ (and so $x + y + z > 0$). \ Now it remains to show that:
  $ frac(x + z, x + y + z) gt.eq frac(x, x + y) $
  i.e. $ \(x + z\)\(x + y\)gt.eq x\(x + y + z\) $
  which is equivalent to:
  $ x\(x + y\)+ z\(x + y\)gt.eq x\(x + y\)+ x z $
  Eliminating common terms, this is equivalent to:
  $ z y gt.eq 0 $
  which is true by non-negativity of $z$ and $y$. This finishes the proof that:
  $ bb(P)\(B divides A union B\)gt.eq bb(P)\(B divides A\) $

]
