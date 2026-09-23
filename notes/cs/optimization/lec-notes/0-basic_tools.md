# Basics

## optimization problems 的分类

optimization 问题的最大框架是：

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 21.38.58.png" alt="Screenshot 2025-02-09 at 21.38.58" style="zoom: 67%;" />

三要素：

1. optimization variable
2. objective function
3. Constraints

### linear / nonlinear

linear optimization 即 linear programming，表示 **objective function 以及所有 constraints 都是 optimization variable 的 linear function 的问题**

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 21.42.06.png" alt="Screenshot 2025-02-09 at 21.42.06" style="zoom: 67%;" />



### convex / nonconvex

convex programming 表示  **objective function 以及所有 constraints 都是 optimization variable 的 convex function 的问题**

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 21.43.09.png" alt="Screenshot 2025-02-09 at 21.43.09" style="zoom:67%;" />

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 21.44.02.png" alt="Screenshot 2025-02-09 at 21.44.02" style="zoom: 67%;" />



Note: 

1. Thm: linear function 是 convex 的. 

   因而 **linear optimization 是 convex optimization 的一种,** non-convex optimization 是 non-linear optimization 的一种, 而 **convex optimization 和 non-linear optimization 有交集**.

2. Thm: convex optimization 中，**所有的 local minimizer 都是 global minimizer.**

local minimizer: 这个点存在一个 open neighborhood, 使得它在这个 open neiborhood 中是 minimizer.





#### smooth function being convex 的充分条件

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 22.17.52.png" alt="Screenshot 2025-02-09 at 22.17.52" style="zoom: 50%;" />

(这里的 $\nabla^2$ 表示 Hessian)





#### convex function 的性质

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 22.19.19.png" alt="Screenshot 2025-02-09 at 22.19.19" style="zoom:67%;" /><img src="0-basic_tools.assets/Screenshot 2025-02-09 at 22.19.31.png" alt="Screenshot 2025-02-09 at 22.19.31" style="zoom: 62%;" />





#### strong convexity

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 22.20.40.png" alt="Screenshot 2025-02-09 at 22.20.40" style="zoom: 50%;" />







#### examples

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 22.21.33.png" alt="Screenshot 2025-02-09 at 22.21.33" style="zoom:50%;" />

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 22.21.45.png" alt="Screenshot 2025-02-09 at 22.21.45" style="zoom:50%;" />





### smooth / nonsmooth

smooth problems 指的是 **objective function 和 constraints 都对于 optimization variable 是 differentiable 并且有 Lipschitz ctn gradient 的问题**



#### examples

ridge regression 是 smooth 的

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 22.23.37.png" alt="Screenshot 2025-02-09 at 22.23.37" style="zoom:50%;" />



lasso regression 是 non-smooth 的

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 22.24.24.png" alt="Screenshot 2025-02-09 at 22.24.24" style="zoom:50%;" />

#### subgradient

对于一个不是处处 diffble 的函数，我们可以用 subgradient 方法来优化它。

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 22.34.20.png" alt="Screenshot 2025-02-09 at 22.34.20" style="zoom: 67%;" />

Thm: 在一个 $\mathbb{R}^n \rightarrow \mathbb{R}$ 的函数的 **differentiable point 上, 唯一的 subgradient 就是 gradient**；在不 differentiable 的 point 上，subgradient 可能不唯一.

例如:

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 22.36.19.png" alt="Screenshot 2025-02-09 at 22.36.19" style="zoom: 67%;" />

**次梯度描述了一个支撑超平面，所有点的函数值都在该超平面之上**

使用 subgradient method 来优化 lasso 问题

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 22.38.16.png" alt="Screenshot 2025-02-09 at 22.38.16" style="zoom:67%;" />

### relationships of all problems

smooth, nonsmooth 和 convex, non-convex 问题都有交集

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 22.39.28.png" alt="Screenshot 2025-02-09 at 22.39.28" style="zoom:67%;" />





我们 focus on nonlinear problems, 尤其是:

1. nonsmooth convex problems
2. smooth nonconvex problems

至于 smooth convex problems, 性质都比较好；nonsmooth nonconvex problems 这里不讨论。



## Matrix Analysis

### Eigen decomposition of symmetric matrices

recall def of eigenvalue: 

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 23.19.41.png" alt="Screenshot 2025-02-09 at 23.19.41" style="zoom:67%;" />

recall **spectrum thm: 实对称矩阵的 eigenvalues 一定都是实数。**

Thm: **eigenvalue decomposition**: **对于任意 symmetric matrices, 总存在 $n$ 个 orthonormal vectors，使得我们可以把它分解为:**

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 23.21.01.png" alt="Screenshot 2025-02-09 at 23.21.01" style="zoom: 67%;" />

#### positive-definite iff alll eigenvalues are positive

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 23.24.43.png" alt="Screenshot 2025-02-09 at 23.24.43" style="zoom:67%;" />

Thm: **一个实对称矩阵是 p.d 的 (p.s.d.) iff 它的所有 eigenvalues 都是正的 (非负的)。**

所以 p.d. 矩阵的几何直观：**p.d. 的矩阵就是对向量只有正向的拉伸作用，而没有任何的旋转和翻折作用的矩阵！！**这个几何直观十分有用



如果 $A-B$ 是一个正定矩阵，那么说明 **$A$ 在任何方向上的对空间的扩展作用都比 B 要强，**





### compact SVD

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 23.37.29.png" alt="Screenshot 2025-02-09 at 23.37.29" style="zoom:67%;" />

Full SVD 中, 左右的矩阵都是 orthogonal matrices, 而中间是一个 mxn 的对角矩阵

compact SVD 中，左右的矩阵形状分别为 mxr 和 rxn，而中间是一个 rxr, 即大小和 Rank 一样的 SVD



full rank 的方阵，full SVD 和 compact SVD 相同；其他情况不同。



#### compact SVD 的性质

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 23.39.54.png" alt="Screenshot 2025-02-09 at 23.39.54" style="zoom:67%;" />

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 23.40.12.png" alt="Screenshot 2025-02-09 at 23.40.12" style="zoom:67%;" />

#### note: **Full SVD** 和 **Compact SVD** 在进行外积 outer product 展开后结果相同

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 23.43.38.png" alt="Screenshot 2025-02-09 at 23.43.38" style="zoom: 50%;" />

但是:

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 23.43.59.png" alt="Screenshot 2025-02-09 at 23.43.59" style="zoom:50%;" />

所以我们在实用中，通常选择计算更简便的 compact SVD.



#### 应用: 通过 outer product form of SVD 进行 best rank $r$-approximation

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 23.45.06.png" alt="Screenshot 2025-02-09 at 23.45.06" style="zoom:67%;" />

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 23.45.27.png" alt="Screenshot 2025-02-09 at 23.45.27" style="zoom:60%;" />

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 23.45.49.png" alt="Screenshot 2025-02-09 at 23.45.49" style="zoom:50%;" />







### matrix norms

<img src="0-basic_tools.assets/Screenshot 2025-02-09 at 22.57.56.png" alt="Screenshot 2025-02-09 at 22.57.56" style="zoom:67%;" />

我们太过于熟悉的 operator norm 和 Frobenius norm 就不过多提了，提一下 nuclear norm



<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 00.55.45.png" alt="Screenshot 2025-02-10 at 00.55.45" style="zoom:67%;" />



Schatten p-norm 表示对这个矩阵的 singular values 进行 p-norm；即以这个矩阵扭转 unit circle 的能力作为被衡量向量，在上面进行 p-norm.

而 nuclear norm 则是 $S_1$ 的特殊情况



<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 00.58.08.png" alt="Screenshot 2025-02-10 at 00.58.08" style="zoom:67%;" />



#### ex: matrix completion

考虑这个经典问题：

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 00.59.14.png" alt="Screenshot 2025-02-10 at 00.59.14" style="zoom:67%;" />

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 00.59.24.png" alt="Screenshot 2025-02-10 at 00.59.24" style="zoom:65%;" />

这一问题等于是最小化 **$\sigma(X)$ 的 0-norm** (这并不是一个 norm, 不符合 norm 定义，表示其中非零数量)

但是，我们可以用 nuclear norm 进行 convex relaxation：取 $\sigma(X)$ 的 1-norm 来做一个近似，最小化这个 nuclear norm.

从而把一个 NP-hard 问题变为了一个凸优化问题。

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 01.02.22.png" alt="Screenshot 2025-02-10 at 01.02.22" style="zoom: 50%;" />

我们在之后讨论这个问题。

















## Taylor Expansion 与 Lipschitz Function

### Lipschitz ctn

Lipschitz continuity 定义在 $f:X \rightarrow Y $ 上，这两个都是 metric spaces

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 01.06.41.png" alt="Screenshot 2025-02-10 at 01.06.41" style="zoom:50%;" />



在数学分析课上，我们已经证明：Lipschitz ctn 是比 ctn 更强的条件，甚至是比 uniform ctn 更强大的条件。

Lipschitz 连续的函数在整个区间内有一个**最大变化速率**，不会出现局部剧烈震荡。

ex: L1 norm 是 Lipschitz ctn 的



#### uniform ctn 但不 Lip ctn 的例子

一个**一致连续（Uniformly Continuous）但不 Lipschitz 连续（Not Lipschitz Continuous）**的经典例子是：
$$
f(x) = \ln(1 + x) \quad \text{在 } (0, \infty) \text{ 上}
$$

#### Lip ctn 的 preservation 规则

**对于 Lip ctn 的 f,g, 以下函数仍然 Lip ctn.**

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 01.14.14.png" alt="Screenshot 2025-02-10 at 01.14.14" style="zoom:50%;" />



#### smooth function (in optimization)

optimization 中的 smooth function 并不是指 $C^{\infty}(\mathbb{R}^n)$ 的函数，而是指：**$C^1$ 并且导数 Lipschitz ctn 的函数.** 

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 01.27.06.png" alt="Screenshot 2025-02-10 at 01.27.06" style="zoom: 40%;" />



### MVT and Taylor's Thm

这是一个经典的定理:

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 02.03.04.png" alt="Screenshot 2025-02-10 at 02.03.04" style="zoom:40%;" />

$C^1$ 的 $\mathbb{R}^n\rightarrow \mathbb{R}$ 的函数，其两个点的函数值的差，一定等于这两点的 line segment 上某个中间点的 derivative 乘以这两点之间的差距 (vector)



#### $C^1$ 函数 smooth 的条件

countinuously differentable 的函数，smooth 的充分条件是其导数 bounded. 因为我们可以用 MVT，得到这个 bound

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 02.15.32.png" alt="Screenshot 2025-02-10 at 02.15.32" style="zoom:50%;" />



#### examples: huber's function

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 02.18.12.png" alt="Screenshot 2025-02-10 at 02.18.12" style="zoom:50%;" />

这个函数是绝对值版本修正为 smooth 后的样子。它把尖端上的部分 locally 换成了一个 smooth 函数.



#### 2nd order Taylor's Thm

MVT 可以看作 1 order 的 Taylor's Thm, 而 2nd order 的 Taylor's Thm 也很有用: 

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 02.14.43.png" alt="Screenshot 2025-02-10 at 02.14.43" style="zoom:50%;" />

我们可以运用 Taylor's Thm 来近似一个函数. 这也是老生常谈

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 02.22.05.png" alt="Screenshot 2025-02-10 at 02.22.05" style="zoom: 40%;" />

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 02.22.17.png" alt="Screenshot 2025-02-10 at 02.22.17" style="zoom:50%;" />





## Optimal Conditions

我们下面考虑 $C^1$ function $f:\mathbb{R}^n\rightarrow \mathbb{R}$

称 $x_*$ 为一个 **stationary point 或称 critical point**，如果 **$x_*$  处梯度为 0**



### Conditions for unconstrained problems

#### 1st order necessary condition ($C^1$)

1st order **necessary condition** for local minimizer for unconstrained problem: 

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 02.28.49.png" alt="Screenshot 2025-02-10 at 02.28.49" style="zoom:50%;" />

这只是 necessary condition. 首先，不保证是 global; 其次，还有可能是 max



#### 2nd order necessary condition ($C^2$)

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 02.49.00.png" alt="Screenshot 2025-02-10 at 02.49.00" style="zoom:45%;" />

这是一个更强的条件，不过仍然是 necessary condition (虽然可以过滤掉一些 1st order condition 没过滤掉的)



#### sufficient condition for convex function

convex function, unconstraint problem 是很好优化的。一个点只要 subdifferential 中有 0，就一定是 global minimizer.

如果 $f$ 还是 $C^1$ 的，那么等价于该点 gradient 为 0.

如果 $f$ strictly convex, 那么这个 global minimizer 还唯一.



<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 02.52.29.png" alt="Screenshot 2025-02-10 at 02.52.29" style="zoom:30%;" />





### Conditions for constrained problems

我们考虑 constrained smooth optimization problems:

#### Lagrangian function for  constrained smooth optimization problems 

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 02.55.07.png" alt="Screenshot 2025-02-10 at 02.55.07" style="zoom:40%;" />

我们定义它的 Lagrangian function 为:



<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 02.56.12.png" alt="Screenshot 2025-02-10 at 02.56.12" style="zoom:33%;" />

我们想要把 constraint problem 转化成 unconstraint problem, 把 constraints 转化成一个惩罚项



#### KKT conditions (necessary)

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 02.56.29.png" alt="Screenshot 2025-02-10 at 02.56.29" style="zoom:30%;" />

强如这个条件，也只是一个 necessary condition, 但是**如果是 convex smooth optimization, 在一定约束下，这是个 sufficient 条件。**





## Rate of Convergence

通过 iterative methods 去做一个优化问题，我们会得到 a seq of points.

通常我们无法完全 converge, 因而需要人工制定一个 error bound, 衡量标准（比如 gradient）到达了这个 error bound之内，就算 converge.

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 03.02.25.png" alt="Screenshot 2025-02-10 at 03.02.25" style="zoom:30%;" />

总(时间)成本，即 complexity，等于 **cost per iteration x #iterations**

我们要尽量选择 iteration 速度快的算法。当然，iteration 的速度更快可能也会增加 cost per iteration，因而这是一个权衡问题。

### convergence metric

convergence 的 metric 可以由以下三个标准衡量：

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 03.05.05.png" alt="Screenshot 2025-02-10 at 03.05.05" style="zoom:30%;" />

1: distance to minimizer 是比较少用的，**因为大部分情况下，我们并不知道 $x_*$ 是什么**

2，3 是比较常用的，通常为 





### rate of convergence

####  Q-convergence

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 03.09.45.png" alt="Screenshot 2025-02-10 at 03.09.45" style="zoom:33%;" />

Q-convergence 描述每一项和最优解之间的距离作为 seq，前后的线性与指数级关系

优先考虑增大 $p$ （指数级关系），$p$ 不能再大后，其次考虑减小 $\gamma$ （线性关系）

ex:

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 09.11.59.png" alt="Screenshot 2025-02-10 at 09.11.59" style="zoom:70%;" />

$p=1$, $\gamma = 1/2$



之后我们会证明：**strongly convex function 的 gradient descent，具有 q-linear convergence**



#### Q-convergence 的各种刻画

除了 Q-linear convergence 外，我们还有：

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 09.27.52.png" alt="Screenshot 2025-02-10 at 09.27.52" style="zoom:67%;" />

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 09.30.12.png" alt="Screenshot 2025-02-10 at 09.30.12" style="zoom:67%;" />

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 09.31.00.png" alt="Screenshot 2025-02-10 at 09.31.00" style="zoom:67%;" />

收敛速度依次增大。





#### R-convergence

Q convergence 只能刻画每项之间收敛速度的关系比较稳定的 seq，而有一些 seq 每一项之间的收敛速度的关系不是很稳定，但是总体收敛速度很好，Q convergence 就刻画不出来。比如这个：

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 09.19.02.png" alt="Screenshot 2025-02-10 at 09.19.02" style="zoom:67%;" />

我们引入 R-convergence: 

<img src="0-basic_tools.assets/Screenshot 2025-02-10 at 09.22.42.png" alt="Screenshot 2025-02-10 at 09.22.42" style="zoom:50%;" />

这是 Q-convergence 的一个放宽版，我们可以自己控制 $\rho_k$，从而把一些收敛速度关系不均匀的地方局部调节一下

比如上面的 b_k, 我们可以把和上一项不变的项中的上一项变成更大的项，比如第二个 1 变成 1/2，第二个 1/4 变成 1/8，从而刻画这个 convergence







