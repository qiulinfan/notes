# Classification overview  

### framework

Supervised learning 就是给定 data $X$ in feature space 和它们的 labels $Y$, learn to predict $Y$ from $X$.

我们已经学习了一种 supervised learning: regression. 即 label 连续的 supervised learning 问题

现在学习第二种 supervised learning: classification. 即 label 离散的 supervised learning 问题



The task of classification:
- Given an input vector $\mathbf{x}$, assign it to one of $K$ distinct classes $C_k$ where $k=1, \ldots K$
Representing the assignment:
- For $K=2$ :
- $y=1$ means that $\mathbf{x}$ is in $C_1$
- $\mathbf{y}=0$ means that $\mathbf{x}$ is in $C_2$.
- (Sometimes, $\mathrm{y}=-1$ can be used depending on algorithms)

For $K>2$ :
- Use 1-of-K coding
- e.g., $\mathbf{y}=(0,1,0,0,0)^{\top}$ means that $\mathbf{x}$ is in $C_2$.
- (This works for $K=2$ as well)



## Probabilistic Discriminative Models 和 Probabilistic Generative Models 的区别

**Probabilistic Discriminative Models** 和 **Probabilistic Generative Models** 是两种概率模型，用于解决分类和预测问题，它们的主要区别在于建模的方式和目标：

#### Probabilistic Discriminative Models

Probabilistic Discriminative Models 直接建模 **conditional 概率分布** $P(y |x,w)$，然后 **maximize conditional likelihood $L(w|x)$** (因而要 minimize 的 object 就是 $-L$) , 即在给定 $x$ 的情况下, 输出随机变量 $y$ 的概率分布.

例子: 比如 logistic regression 和 **softmax regression (multiclass logistic regression)**

- 优点
  - 不需要对数据的自然分布 $P(x)$ 和 class distribution $P(x|y)$ 建模
  - 计算效率高，训练相对简单

- 缺点

  - 对数据的整体生成过程没有建模，适用场景有限



#### Probabilistic Generative Models

**Probabilistic Generative Models**: modeling $p(x|y,w)$ 和 $p(y|w)$, 从而建模 **joint 概率分布** $p(x,y | w)$ 

object 是 **maxmize joint likelihood** $L(w)$，可以通过建模数据生成过程，间接推断 $P(y|x)$；并且同时也可以自己生成数据 $x$. 

- 优点

  - 可以生成新数据 (生成模型)。
  - 对数据的分布有更全面的建模。

- 缺点

  - 对数据分布假设更强 (如高斯假设)。
  - 计算量可能较大。

Note: 这个模型会生成 both $x$ 和 $y$，不过它仍需要 testing set, 用于评估模型在未知数据上的表现，即它根据 $x$ 生成 $y$ 的能力.

例子: **Gaussian Discriminant Analysis (高斯判别分析)**: 假设类条件分布 $P(x \mid y)$ 为高斯分布；**Naive Bayes (朴素贝叶斯)**: 假设特征条件独立，简化计算






