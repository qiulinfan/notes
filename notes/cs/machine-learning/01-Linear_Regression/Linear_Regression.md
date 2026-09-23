# Linear Regression basics

## Modeling

我们使用以下 notation:

<img src="Linear_Regression.assets/lec1-notation.png" alt="lec1-notation" style="zoom: 25%;" />

**(generalized) linear regression 的定义:**
给定 $N$ 个 data points $\{(x^{(n)},y^{(n)}) \}_{n=1,\cdots, N}$ where each $x^{(n)}\in\mathbb{R}^d,y^{(n)}  \in\mathbb{R}$, 以及预先设定好的 $M$ 个 basis functions $\{ \phi_i(x)\}_{i=1,\cdots, M}$ 用以表示 $M$ 个 features;

我们通过建立一个 $h(x,w): \mathbb{R}^d \times \mathbb{R}^M \rightarrow  \mathbb{R} = \sum_{i=0}^{M-1} w_i \phi_i(x)$, 使其关于 $w$ 线性, 以找到一组参数 $w \in \mathbb{R}^M$, 使得 $h(x^{(n)},w)$ 能够近似 $y^{(n)}$ for each $n$, with respect to the loss function we define to measure the distance between two vectors. 

<img src="Linear_Regression.assets/Screenshot 2025-04-08 at 12.10.51.png" alt="Screenshot 2025-04-08 at 12.10.51" style="zoom:33%;" />



其中
$$
\begin{aligned} & w=\left(w_0, \ldots, w_{m-1}\right)^{\top}, \varphi(x)=\left(1, \varphi_1(x), \ldots, \varphi_{m-1}(x)\right)^{\top}\end{aligned}
$$

$$
w=\left[\begin{array}{c}w_0 \\ \vdots \\ w_{m-1}\end{array}\right], \varphi(x)=\left[\begin{array}{c}1  \\ \vdots \\ \varphi_{m-1}(x)\end{array}\right]
$$




Remark:   注意 linear regression 指的是 **$y$ 和参数 $w$ 之间是 linear 的, 而不是说 $y$ 和 input $x$ 之间是 linear 的**. 我们可以选择 nonlinear 的 basis funtions 来 encode $x$ 来表示 features 的特性, 比如我们可以选择:

<img src="Linear_Regression.assets/lec1-basis.png" alt="lec1-basis" style="zoom: 17%;" />

## loss function: sum of squared error

这个 loss function 衡量两个 vectors 之间的距离, 目的是衡量 $y \in \mathbb{R}^N$ 和 $h(x,w) \in \mathbb{R}^N$ 这两个 vectors 的差距. 实际上就是它们 difference 的 $L_2$-norm 的平方.

**sum of squares error:**
$$
\begin{aligned}
E(w) & =\frac{1}{2} \sum_{n=1}^N\left\|h\left(x^{(n)}, w\right)-y^{(n)}\right\|_2^2 \\
& = {\frac{1}{2} \sum_{n=1}^N\left(\sum_{i=0}^{M-1} w_i \varphi_i\left(x^{(n)}\right)-y^{(n)}\right)^2}
\end{aligned}
$$

### gradient of sum of squared error

$$
\nabla E(w)=\left[\begin{array}{c}
\frac{\partial E}{\partial w_0}(w) \\
\vdots \\
\frac{\partial E}{\partial w_m}(w)
\end{array}\right]
$$

我们下面首先通过求 $\nabla E(w)$ 的每个 entry $\frac{\partial E}{\partial w_k}(w)$ 来写出这个 gradient.

<img src="Linear_Regression.assets/Screenshot 2025-04-08 at 12.18.20.png" alt="Screenshot 2025-04-08 at 12.18.20" style="zoom: 25%;" />



因而 vectorize:

<img src="Linear_Regression.assets/Screenshot 2025-04-08 at 12.18.46.png" alt="Screenshot 2025-04-08 at 12.18.46" style="zoom:25%;" />





### batch v.s. stochastic GD

我们通过迭代降低 gradient 来降低 loss function 的值, 从而优化 weight vector.

<img src="Linear_Regression.assets/lec1-descent.png" alt="lec1-descent" style="zoom: 33%;" />



(More practically, 我们可以采用 minibatch SGD: 即在 batch GD 和 SGD 之间, 每次选择一小部分 samples, 称为一个 minibatch, 在这个 minibatch 上进行 GD.)



## vectorization

我们可以把每个 $x^{(n)}$ 的 features 写成一个 row vector, 并 stack up $N$ 个 row vectors, 成为一个 $N\times M$ 的 matrix $\Phi$. 从而:
$$
h(x,w) = \Phi w
$$
vectorization 的好处是: 1. 便于手算; 2. computer 可以进行并行计算.
\pic[0.6]{assets/lec2-vect.png}
计算得 linear regression 的 loss function 为:
$$
E(w) = \frac{1}{2}w^T \Phi^T \Phi w - w^T \Phi^T y + \frac{1}{2}y^T y
$$


#### vector form gradient 以及 closed-form sol
如果
$$
\nabla E(w) = y
$$
有一个 closed form solution, 那么这个 solution 一定是一个 local min/max, 从而 possibly 成为一个 global min. (并且 we know, **如果 $E$ 是个 convex 的函数, 那么一定是 global min!**)

为了计算 closed form solution, 我们首先要给出 $\nabla E(w)$ 的 matrix form 表达式. \\
这里首先引入 linear form 和 quadratic form  的 gradient:

<img src="Linear_Regression.assets/lec2-diff.png" alt="lec2-diff" style="zoom: 15%;" />


我们发现: $E(w)$ 就是一个 $w$ 的 quadratic form, 一个 $w$ 的 linear form 和一个 const 的组合. 从而可以求出:

<img src="Linear_Regression.assets/lec2-grad.png" alt="lec2-grad" style="zoom: 25%;" />

从而我们得到 closed form solution (if exists):

<img src="Linear_Regression.assets/lec2-closed.png" alt="lec2-closed" style="zoom: 15%;" />

因而 closed form exists iff $\Phi^T\Phi$ 可逆, iff $\Phi$ 可逆.
并且 recalll in linear algebra: **$rank(\Phi^T\Phi) = rank(\Phi)$.**
因而, **closed form exists iff $M >= N $ 且 $rank(\Phi) = N$**



## overfitting

<img src="Linear_Regression.assets/Screenshot 2025-01-21 at 18.11.31.png" alt="image-20250121173433845" style="zoom:50%;" />

<img src="Linear_Regression.assets/Screenshot 2025-01-21 at 18.11.37.png" alt="Screenshot 2025-01-21 at 18.11.37" style="zoom:50%;" />

overfitting 的原因: features 数量 M 设置得太多, 导致过度保持 training sets 的点靠近曲线, 但是对于 testing set 并不对( 这里是一个简化, 实则不能单纯这样划分, 需要 cross validation)

<img src="Linear_Regression.assets/Screenshot 2025-01-21 at 18.11.50.png" alt="Screenshot 2025-01-21 at 18.11.50" style="zoom:50%;" />



overfitting 的表现: 各项 features 的参数动荡很大. 

<img src="Linear_Regression.assets/Screenshot 2025-01-21 at 18.12.41.png" alt="Screenshot 2025-01-21 at 18.12.41" style="zoom:50%;" />

overfitting 的解决方法 1: 增加数据点

<img src="Linear_Regression.assets/Screenshot 2025-01-21 at 18.13.03.png" alt="Screenshot 2025-01-21 at 18.13.03" style="zoom:50%;" />

overfitting 的解决方法 2: 

#### regularization: solving overfit

我们通过引入一个 regularization term, 也称为 penalty term 惩罚项, 以使得曲线尽量平缓, 从而减少 overfitting. 

Idea: 把 $w$ 本身的 Magnitute 作为一个 loss function 的一部分, 让我们降低 loss 的同时自带降低 w 的各个 entries 的正负动荡程度, 从而使得拟合曲线尽量平缓, 降低曲线的 expressibility.

<img src="Linear_Regression.assets/image-20250121201523836.png" alt="image-20250121201523836" style="zoom: 25%;" />

这里的 $\lambda$ 理应设置较小, 如 0.001 等. 

$\lambda$ 设置越大, 曲线越接近 constant. 比如 $\lambda := 1$, 则会 

<img src="Linear_Regression.assets/Screenshot 2025-01-21 at 20.17.21.png" alt="Screenshot 2025-01-21 at 20.17.21" style="zoom:50%;" />

如果 traning error 和 testing error 都很大, 那就说明 $\lambda$ 调太大了.



#### gradient of regularized least square

<img src="Linear_Regression.assets/image-20250121204803377.png" alt="image-20250121204803377" style="zoom: 33%;" />



summary: regularization controls the tradeoff bewteen fitting error 和 expressibility.



## Linear Regression(lec3)

### Review on Probability

<img src="Linear_Regression.assets/image-20250121215444693.png" alt="image-20250121215444693" style="zoom: 33%;" />

#### Likelihood function

**Likelihood function** (似然函数) 表示在给定一组 i.i.d 的数据 samples $D$ 以及其以 $\theta$ 为参数的分布形式下，random vector =$D$ 处的概率密度；其以参数 $\theta$ 为变量，表达的是在固定数据 $D$ 的前提下，不同参数 $\theta$ 对数据的适配程度

而 maximum likelihood estimator 则是使得这个 random vector =$D$ 处的概率密度 maximize 的参数 $\tilde{\theta}$

由于独立同分布,  random vector =$D:=\{x_1,\cdots,x_n\}$ 处的概率密度就等于所有 $X=x_i$ 处的概率密度的 product.

取得 maximum likelihood estimator 即: 在这个参数下, 我们得到的模型, 对于我们的训练数据而言, 取得其相对的 y 的概率密度最大.

<img src="Linear_Regression.assets/image-20250123174328307.png" alt="image-20250123174328307" style="zoom: 50%;" />

### Find MLE for linear model with stochastic noise

<img src="Linear_Regression.assets/image-20250123180811150.png" alt="image-20250123180811150" style="zoom: 50%;" />

(求解MLE 可得: linear model with stochastic noise which is normal distributed centered at 0 得到的 MLE，与标准的 linear model 得到的 MLS 最优解是等价的.

这是符合直觉的，因为一个正态分布的 noise 不影响参数的选择)

<img src="Linear_Regression.assets/image-20250123180955714.png" alt="image-20250123180955714" style="zoom: 33%;" />

### locally weighted linear regression 

<img src="Linear_Regression.assets/image-20250123193833909.png" alt="image-20250123193833909" style="zoom: 33%;" />





