# EM Algorithm in general

## Model with Latent Variable

潜变量（Latent Variables）

- 对于数据 $\mathbf{X}$ 的系统，有时候当我们引入从 $\mathbf{X}$ 中派生出的额外变量 $\mathbf{Z}$，可以使得模型具有更强的表达能力 (表示复杂结构) 以及有时候优化会更加简单.；但这些变量可能是未观测的.

  latent variable 的定义是建模的一部分.

  例如，在高斯混合模型中：对于一个样本 $\mathbf{x}_n$，潜变量 $\mathbf{z}_n$ 表示这个样本属于哪一个高斯分布；

  后验概率 $p(\mathbf{z} \mid \mathbf{x})$ 被称为 **responsibility**，即 latent variable 在给定原数据下的 distribution.



通常, 我们想要做一个 model with paramters $\theta$, maximizing the log-likelihood of the observed data:
$$
\theta_{ml} : =   \arg \max_{\theta} \log p(X \mid\theta ) 
$$
这就是普通的 MLE.


而当我们 model with latent variable $Z$ 的时候, 我们 by Bayesian formula, 可以等同于 maximize: 
$$
\log p(X \mid\theta )  = \log  p(X, Z |\theta )   \, \log (Z  |  \theta)
$$

如果我们拥有完整数据$\{\mathbf{X}, \mathbf{Z}\}$， 那么这个 joint prob $\log  p(X, Z |\theta )$ 很容易求得.

但是, 如果我们并不知道 latent variable 呢 ? 比如说, $Z$ 是一个 missing label. 那么
$$
\log p(X \mid\theta ) = \log  \int  p(X, Z |\theta ) \, dZ
$$
Speicially, $Z$ 是 discrete variable 的情况下: 
$$
\log p(X \mid\theta ) =  \log   \sum_Z p(X, Z |\theta )
$$

这个做法称为 $Z$ 的 **marginalization**. 不得不进行 marginalization 使得想要优化这个式子变得困难 (因为 log 里套了积分/求和)



## decomposition of $\log p(X \mid\theta ) =  \log   \sum_Z p(X, Z |\theta )$ into Evidence Lower Bound 和 KL divergence



目标是最大化对数似然 $\log p(\mathbf{X} \mid \theta)$：


$$
\begin{align*}
\log p(\mathbf{X} \mid \theta) 
&= \sum_{\mathbf{Z}} q(\mathbf{Z}) \log p(\mathbf{X} \mid \theta)  \quad \text{(因为} \sum_{\mathbf{Z}} q(\mathbf{Z}) = 1)\\
&= \sum_{\mathbf{Z}} q(\mathbf{Z}) \log \frac{p(\mathbf{X}, \mathbf{Z} \mid \theta)}{p(\mathbf{Z} \mid \mathbf{X}, \theta)} \\
&= \sum_{\mathbf{Z}} q(\mathbf{Z}) \log \frac{p(\mathbf{X}, \mathbf{Z} \mid \theta)}{q(\mathbf{Z})} \cdot \frac{q(\mathbf{Z})}{p(\mathbf{Z} \mid \mathbf{X}, \theta)} \\
&= \sum_{\mathbf{Z}} q(\mathbf{Z}) \log \frac{p(\mathbf{X}, \mathbf{Z} \mid \theta)}{q(\mathbf{Z})} + \sum_{\mathbf{Z}} q(\mathbf{Z}) \log \frac{q(\mathbf{Z})}{p(\mathbf{Z} \mid \mathbf{X}, \theta)}
\end{align*}
$$

我们把这两个成分，分别定义为

1. variational lower bound of $q$ (或称为 Evidence Lower Bound, ELBO)
   $$
   \begin{align}
   \mathcal{L}(q, \theta) &: =\sum_{\mathbf{Z}} q(\mathbf{Z}) \log \frac{p(\mathbf{X}, \mathbf{Z} \mid \theta)}{q(\mathbf{Z})} \\
   &= \mathbb{E}_{Z\sim q(Z)}[\log p(\mathbf{X}, \mathbf{Z} \mid \theta)] - \mathbb{E}_{Z\sim q(Z)}[\log q(\mathbf{Z})]
   \end{align}
   $$
   
2. KL divergence of $q$ w.r.t. $p$

$$
\begin{align}
\mathrm{KL}(q(\mathbf{Z}) \parallel p(\mathbf{Z} \mid \mathbf{X}, \theta)) &:=\sum_{\mathbf{Z}} q(\mathbf{Z}) \log \frac{q(\mathbf{Z})}{p(\mathbf{Z} \mid \mathbf{X}, \theta)}\\
& = \mathbb{E}_{Z\sim q(Z)}[\log q(\mathbf{Z})]  - \mathbb{E}_{Z\sim q(Z)}[\log p(\mathbf{Z}\mid \mathbf{X} ,\theta)] 
\end{align}
$$

从而: 
$$
\begin{aligned} \log p(\mathbf{X} \mid \theta)  & =\mathcal{L}(q, \theta)+K L(q(\mathbf{Z}) \| p(\mathbf{Z} \mid \mathbf{X}, \theta))\end{aligned}
$$


###  KL 散度

我们这里简写.

可以发现, KL-divergence 有很多种展开形式：
$$
\begin{aligned} K L(q \| p) &=\mathbb{E}_{z\sim q(z)}\left[\log \frac{q(z)}{p(z)}\right]\\ 
& =\sum_z q(z) \log \frac{q(z)}{p(z)} \\
& =-\sum_z q(z) \log p(z)+\sum_z q(z) \log q(z)  \\
& = \mathbb{H}(q, p)-\mathbb{H}(q)
\end{aligned}
$$
因而两个分布的 KL 散度就是 $p,q$ 的 cross entropy 减去 $p$ 自己的 entropy.

这个结果是 0 当且仅当 $p=q$ （下面会证明）. 并且显然 $p,q$ 这两个分布越是相近, 这个 KL 散度越低.

但是 notice: 
$$
K L(q \| p) \not =  K L(p \| q)
$$
这个行为不是 commutative 的.

$KL(p‖q)$ 表示：真实分布是 $p$，用 $q$ 来近似它

$KL(q‖p)$ 表示：真实分布是 $q$，用 $p$ 来近似它







### Jensen 不等式: showing that KL 散度是非负的

Recall 凸分析中我们有 Jensen 不等式:

If $f$ is **convex**, then for any $0 \leq \theta_i \leq 1(\forall i)$ s.t. $\theta_1+\theta_2+\cdots+\theta_k=1 \\$ 都有:
$$
\begin{array}{r}
f\left(\theta_1 x_1+\theta_2 x_2+\cdots+\theta_k x_k\right) \leq \theta_1 f\left(x_1\right)+\cdots+\theta_k f\left(x_k\right)
\end{array}
$$
这是 convex ineq 的一个更广泛的 interpolation 推广. 它还可以从而推广到积分形式: 对于任意一个 measure space $(\Omega, A, \mu)$, 如果 measurable $f$ 是 convex 的，那 取任意 measurable function $g$ 都有: 
$$
\varphi\left(\int_{\Omega} f \mathrm{~d} \mu\right) \leq \int_{\Omega} \varphi \circ f \mathrm{~d} \mu
$$
从而 corollary: 
$$
f(\mathbb{E}[x]) \leq \mathbb{E}[f(x)]
$$

因而，由于 $-log$ 函数是 convex 的 ($log$ 是 convex 的)，我们可以由 Jensen 证明出：散度总是非负，且当且仅当 $q = p(\mathbf{Z} \mid \mathbf{X}, \theta)$ 时取等号
$$
\begin{aligned} K L(q \| p) &=\mathbb{E}_{z\sim q(z)}\left[\log \frac{q(z)}{p(z)}\right]\\
& = \mathbb{E}_{z\sim q(z)}\left[-\log \frac{p(z)}{q(z)}\right] \\
&\geq -\log (\mathbb{E}_{z\sim q(z)}\left[ \frac{p(z)}{q(z)}\right])    \\
& = -\log (\underbrace{\sum_z q(z) \frac{p(z)}{q(z)}}_{=\sum_z p(z)=1}) \\ & =0\end{aligned}
$$

recall: 
$$
\begin{align*} \log p(\mathbf{X} \mid \theta)  & =\mathcal{L}(q, \theta)+K L(q(\mathbf{Z}) \| p(\mathbf{Z} \mid \mathbf{X}, \theta))\end{align*}
$$
由于 KL 非负, 我们可以得到: 对于任意的 distribution $q$ of $\mathbf{Z}$, $\mathcal{L}(q, \theta)$ 是 $\log p(\mathbf{X})$ 的一个 lower bound. 因此我们才把它叫做 **variational lower bound**. 



## EM Algorithm

EM Algorithm 是一个在设定了 latent variable $Z$ 时，间接地 maximizing (log) $ p(X \mid\theta )$ 的方法. 它并不直接优化 $ p(X \mid\theta )$, 而是通过不断 maximize 它的 variational lower bound $\mathcal{L}(q, \theta)$ 的行为，来间接优化 $ p(X \mid\theta )$ 



>重复以下步骤直到收敛：
>
>1. E-step (expectation): 固定参数 $\theta$，**compute posterior** $p(\mathbf{Z} \mid \mathbf{X}, \theta)$, 然后把它赋给 $q(\mathbf{Z})$，使 variational lower bound $\mathcal{L}$ 最大化 (此时 for 固定的 $\theta$, 有 $\mathcal{L}(q,\theta) = \log p(\mathbf{X} \mid \theta)$)
>
>   具体要做的即:
> $$
>   q^{(t)}(\mathbf{Z}) := p(\mathbf{Z} \mid \mathbf{X}, \theta^{(t)})
> $$
>   
>
>2. M-step (maximization)：固定 $q(\mathbf{Z})$，**最大化 $\mathbb{E}_q[\log p(\mathbf{X}, \mathbf{Z} \mid \theta)]$ 得到新的 $\theta$**
>
>   具体要做的即: 
> $$
>   \theta^{(t+1)} : = \operatorname{argmax}_\theta \mathcal{L}(q^{(t)}, \theta)=\operatorname{argmax}_\theta \sum_{\mathbf{Z}} q^{(t)}(\mathbf{Z}) \log p(\mathbf{X}, \mathbf{Z} \mid \theta)
> $$

EM 即交替优化 $q$ 和 $\theta$，提升 ELBO 下界，直至收敛. E step 就是固定目前的参数 $\theta$, 把 $q$ 重新设定为 $p$，使得 variational lower bound 提升至等于我们需要的 liklihood；M step 就是固定住分布 $q$，看看什么参数能够优化 variational lower bound.



EM 的 idea 是: use q(Z) as (factional) pseudo-counts and maximize the “data completion” log-likelihood". 

E step 计算的 latent var 的后验概率，可以视为对未观测数据的“伪计数”（pseudo-counts）；在 M step，利用这些伪计数来进行对数似然函数的最大化“data completion”.



### 图示

![EM](09(1)-EM_algorithm_general.assets/EM.png)

我们容易验证: EM Algorithm 一定是 converging 的. (一定单调递增, 又是有界, 因而 MCT)



### EM for multiple data-points

The EM Algorithm: Multiple data-points
- Variational lower bound for a single example $\mathbf{x}$ :

$$
\begin{aligned}
\log p(\mathbf{x} \mid \theta) & =\sum_{\mathbf{z}} q(\mathbf{z}) \log \frac{p(\mathbf{z}, \mathbf{x} \mid \theta)}{q(\mathbf{z})}+K L(q(\mathbf{z}) \| p(\mathbf{z} \mid \mathbf{x}, \theta)) \\
& \geq \sum_{\mathbf{z}} q(\mathbf{z}) \log \frac{p(\mathbf{z}, \mathbf{x} \mid \theta)}{q(\mathbf{z})}
\end{aligned}
$$

- Lower bound on the log-likelihood of the entire training data $\mathcal{D}=\left\{\mathbf{x}^{(1)}, \ldots, \mathbf{x}^{(N)}\right\}$ :

$$
\begin{aligned}
\log p(\mathcal{D} \mid \theta)=\sum_n \log p\left(\mathbf{x}^{(n)} \mid \theta\right) & =\sum_n \sum_{\mathbf{z}} q^{(n)}(\mathbf{z}) \log \frac{p\left(\mathbf{z}, \mathbf{x}^{(n)} \mid \theta\right)}{q^{(n)}(\mathbf{z})}+\sum_n K L\left(q^{(n)}(\mathbf{z}) \| p\left(\mathbf{z} \mid \mathbf{x}^{(n)}, \theta\right)\right) \\
& \geq \sum_n \sum_{\mathbf{z}} q^{(n)}(\mathbf{z}) \log \frac{p\left(\mathbf{z}, \mathbf{x}^{(n)} \mid \theta\right)}{q^{(n)}(\mathbf{z})}
\end{aligned}
$$

注意: 每个 $n$ 用的 $q$ 是不一样的!



因而 EM for multiple data points:

>Initialize random parameters $\theta$.
>
>Repeat until convergence:
>
>1. "E-step": Set $q^{(n)}(\mathbf{z})=p\left(\mathbf{z} \mid \mathbf{x}^{(n)}, \theta\right)$ **for each training sample $n$.**
>2. "M-step": Update $\theta$ via the following maximization:
>
>$$
>\arg \max _\theta \sum_n \sum_{\mathbf{z}} q^{(n)}(\mathbf{z}) \log p\left(\mathbf{z}, \mathbf{x}^{(n)} \mid \theta\right)
>$$

注意：这个过程对于很多具体的情况，可以 vectorize. 

eg：GMM

-  $\mathbf{z} \in\{1, \ldots, K\}$ ，是 cluster assignment
- $q^{(n)}(z)=\gamma_k^{(n)}$ 是第 $n$ 个样本属于第 $k$ 类的＂软分配＂概率
- 可以将所有 $\gamma$ 组织成一个 $N \times K$ 的矩阵
- 每个 component 的参数 $\theta_k$ 也可以向量化操作（均值向量，协方差矩阵等）这时整个 E step 和 M step 都可以用 矩阵操作，广播，batch 乘法等实现。



但是有的模型是：
- 隐变量是 连续的
- 或者是图模型中很复杂的结构（比如 HMM，LDA，VAE 中的 latent vector）

那你就需要 采样 或 近似推断，vectorization 就变得困难（但不是不可能，需要更复杂的技巧，比如 Monte Carlo＋vectorized sampling）。





### What if E-step 需算的 $p(Z \mid X, \theta)$ intractable?

（Note: 在每一步，我们需要根据当前的参数 $\theta^{(t)}$ 计算 **latent var 的后验分布** $p(Z \mid X, \theta)$。这要求我们能显式地写出并计算这个分布。

这被称为 **tractable**：可以显式地写出并计算（比如 GMM 中，posterior 是 softmax over components，就很 tractable）

> Q: 如果 $ p(Z \mid X, \theta)$ 不可解（intractable），那怎么办？

当后验不可 tractable，我们就不能用 standard EM 了，需要改用更 general 的方法，比如：

 1. Variational EM（变分 EMa

- 用一个可计算的变分分布 $ q(Z) \approx p(Z \mid X, \theta) $
- 不再要求 $q(Z) = p(Z \mid X, \theta)$，而是优化下界：

  $$
  \mathcal{L}(q, \theta) = \mathbb{E}_{q(Z)}[\log p(X, Z \mid \theta)] - \mathbb{E}_{q(Z)}[\log q(Z)]
  $$

- 然后交替优化 $q$ 和 $\theta$，这就是变分推断框架。

 2. MCMC-EM（采样版 EM）

- 用采样方法近似计算 E 步中的期望，比如用 Gibbs Sampling 或 Metropolis-Hastings 从 $p(Z \mid X, \theta)$ 中采样

这里不讲解）









