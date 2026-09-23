- 02 (RV)
	1. Lebesgue Decomposition Theorem 的证明
	2. 从 diffeomorphism version 的 change of variable formula 证明 push-forward version 的 change of variable formula, 然后 apply 这个结论.
	3. \Gamma(n,\lambda) = \sum_{i=1}^n X_i, 使用 moment generating function

- 03 joint 和 conditional
	1. 如果 \(X\) 是 continous 的, 而 \(Y\) 是 discrete 的,
		那么我们怎么 define conditional distribution, 以及 expectation 呢? (即更加 general 的 definition)





- lec 13

	- 

- lec 14 

	- 

- lec 15 (exam complete)

	- application: Bernstein Polynomials
	- application: Hypothesis Testing 

- lec 16

	

- lec 18

	

- lec 19

	

- lec 20

	- Berry-Essen 的证明

	- example 4:  我有个问题啊, 在用 chebyshev 的时候, 我们明明也可以假设他的 p 是对的,

		但是我们却给出了一个最保守的一定正确的 p(1-p) < 1/4. 这是不是不公平呢? 那为什么用 Berry Essen 就可以做这个假设呢?

	- CLT 的证明





## structure

- chapter{Behaviors of a sequence of random variables}

	- \section{Toolbox: inequalities in probability}: lec 12上

	- \section{modes of convergence}: lec 14+12下
		- subsection: **Limit Theorems**: 
			Fatou's Lemma, Monotone Convergence Theorem (MCT) 和 Dominated Convergence Theorem (DCT). 这些工具常用于处理期望与极限的交换. (12下)
		- subsection: relation between a.s., L^p 和 convergence in probability 

	- \section{Borel-Cantelli Lemma}: lec 16

	- \section{Laws of Large Numbers}: lec 15

		**核心目标**: 证明 $\frac{S_n}{n} \to \mathbb{E}[X_1]$. 这里的收敛是关于“数值”的.

		- \subsection{weak law of large numbers}
			基于有限方差, 结论是**依概率收敛** ($P$)
		- \subsection{strong law of large numbers}
			结论是更强的**几乎处处收敛** ($a.s.$).
		- \subsection{application: Monte Carlo methods}
		- \subsection{application: Bernstein Polynomials}



- \chapter{Central Limit Theorem}
	- \section{convergence in distribution}: lec 18
	- \section{Characterization of a distribution}: 
		- \subsection{moment generating function}:  lec 13
		- \subsection{characteristic function}: lec 19
	- \section{Central Limit Theorem}: lec 20

