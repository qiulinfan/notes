# Prevalence of....





Modern practice for training classification deepnets involves a *Terminal Phase of Training* (TPT), which begins at the epoch where training error first vanishes; During TPT, the training error stays effectively zero while training loss is pushed towards zero. Direct measurements of TPT, for three prototypical deepnet architectures and across seven canonical classification datasets, expose a pervasive inductive bias we call *Neural Collapse*, involving four deeply interconnected phenomena: (NC1) Cross-example within-class variability of last-layer training activations collapses to zero, as the individual activations themselves collapse to their class-means; (NC2) The class-means collapse to the vertices of a Simplex Equiangular Tight Frame (ETF); (NC3) Up to rescaling, the last-layer classifiers collapse to the class-means, or in other words to the Simplex ETF, i.e. to a *self-dual* configuration; (NC4) For a given activation, the classifier’s decision collapses to simply choosing whichever class has the closest train class-mean, i.e. the Nearest Class-Center (NCC) decision rule. The symmetric and very simple geometry induced by the TPT confers important benefits, including better generalization performance, better robustness, and better interpretability.

训练分类深度网的现代做法包括*训练的最终阶段*（TPT），它始于训练误差首次消失的那个时点；在TPT期间，训练误差实际上保持为零，而训练损失则趋向于零。针对三种原型深度网络架构和七个典型分类数据集对 TPT 进行的直接测量揭示了一种普遍存在的归纳偏差，我们称之为 “神经崩溃”（*Neural Collapse*），其中涉及四种相互关联的现象： (NC1) 最后一层训练激活的跨样本类内变异性坍缩为零，因为单个激活本身坍缩为其类均值；(NC2) 类均值坍缩为简单等相紧帧（ETF）的顶点；(NC3) 在重新缩放之前，最后一层分类器坍缩为类均值，或者换句话说，坍缩为简单等相紧帧（ETF），即 “*自渡”；(NC4) 在重新缩放之后，最后一层分类器坍缩为类均值，或者换句话说，坍缩为简单等相紧帧（ETF），即 “*自渡”。 (NC4) 对于给定的激活，分类器的决策会折叠为简单地选择最接近列车类均值的类，即最近类中心（NCC）决策规则。由 TPT 诱导的对称和非常简单的几何形状带来了重要的好处，包括更好的泛化性能、更好的鲁棒性和更好的可解释性。















# Geometric Analysis

We provide the first global optimization landscape analysis of *Neural Collapse* – an intriguing empirical phenomenon that arises in the last-layer classifiers and features of neural networks during the terminal phase of training. As recently reported in [1], this phenomenon implies that *(i)* the class means and the last-layer classifiers all collapse to the vertices of a Simplex Equiangular Tight Frame (ETF) up to scaling, and *(ii)* cross-example within-class variability of last-layer activations collapses to zero. We study the problem based on a simplified *unconstrained feature model*, which isolates the topmost layers from the classifier of the neural network. In this context, we show that the classical cross-entropy loss with weight decay has a benign global landscape, in the sense that the only global minimizers are the Simplex ETFs while all other critical points are strict saddles whose Hessian exhibit negative curvature directions. In contrast to existing landscape analysis for deep neural networks which is often disconnected from practice, our analysis of the simplified model not only does it explain what kind of features are learned in the last layer, but it also shows why they can be efficiently optimized in the simplified settings, matching the empirical observations in practical deep network architectures. These findings could have profound implications for optimization, generalization, and robustness of broad interests. For example, our experiments demonstrate that one may set the feature dimension equal to the number of classes and fix the last-layer classifier to be a Simplex ETF for network training, which reduces memory cost by over 20% on ResNet18 without sacrificing the generalization performance.





我们首次对 “神经塌陷”（Neural Collapse）进行了全局优化景观分析。“神经塌陷 ”是神经网络最后一层分类器和特征在训练结束阶段出现的一种有趣的经验现象。正如最近的报告[1]所述，这种现象意味着*(i)*类平均值和最后一层分类器都会塌缩到简单等相紧帧（ETF）的顶点，直至缩放，以及*(ii)*最后一层激活的跨样本类内变异性塌缩为零。

我们基于简化的*无约束特征模型*来研究这个问题，该模型将最顶层与神经网络的分类器隔离开来。在此背景下，我们证明了带有权重衰减的经典交叉熵损失具有良性的全局景观，即唯一的全局最小值是简单ETF，而所有其他临界点都是严格的鞍，其赫西恩（Hessian）呈现负曲率方向。

现有的深度神经网络景观分析往往与实践脱节，与此不同的是，我们对简化模型的分析不仅解释了在最后一层学习到了哪些特征，还说明了为什么这些特征可以在简化设置中得到有效优化，这与实际深度网络架构中的经验观察相吻合。这些发现可能会对优化、泛化和鲁棒性产生深远的影响。

例如，我们的实验证明，可以将特征维度设置为与类的数量相等，并将最后一层分类器固定为用于网络训练的 Simplex ETF，这样可以在 ResNet18 上将内存成本降低 20% 以上，而不会影响泛化性能。



## 四种 NC

**(NC1) Variability collapse:** As training progresses, the within-class variation of the activations becomes negligible as these activations collapse to their class-means.

**(NC2) Convergence to Simplex ETF:** The vectors of the class-means (after centering by their global-mean) converge to having equal length, forming equal-sized angles between any given pair, and being the maximally pairwise-distanced configuration constrained to the previous two properties. This configuration is identical to a previously studied configuration in the mathematical sciences known as **Simplex Equiangular Tight Frame (ETF)** (6). See Definition 1.

**(NC3) Convergence to self-duality:** The class-means and linear classifiers – although mathematically quite different objects, living in dual vector spaces – converge to each other, up to rescaling. Combined with (NC2), this implies a *complete symmetry* in the network classifiers’ decisions: each iso-classifier-decision region is isometric to any other such region by rigid Euclidean motion; moreover, the class-means are each centrally located within their own specific regions, so there is no tendency towards higher confusion between any two classes than any other two.

**(NC4) Simplification to Nearest Class-Center (NCC):** For a given deepnet activation, the network classifier converges to choosing whichever class has the nearest train class-mean (in standard Euclidean distance).

**(NC1)变异性收敛：** 随着训练的进行，激活度的类内变异变得可以忽略不计，因为这些激活度会收敛到它们的类均值。

**(NC2)收敛至简约 ETF：** 类均值向量（以其全局均值为中心后）收敛至长度相等，在任何给定的配对之间形成大小相等的角度，并且是受限于前两个属性的最大配对间距配置。这种构型与数学科学中之前研究过的一种构型相同，即**复数等边紧框架（ETF）** (6)。参见定义 1。

**（NC3）收敛于自对偶性：** 类均值和线性分类器--尽管在数学上是完全不同的对象，生活在对偶向量空间中--在重新缩放之前会相互收敛。结合（NC2），这意味着网络分类器的决策具有*完全的对称性：通过刚性欧几里得运动，每个等分类器决策区域与其他任何此类区域都是等距的；此外，类均值分别位于各自特定区域的中心位置，因此不会出现任何两个类别之间的混淆程度高于其他两个类别的趋势。

**(NC4)简化为最近类中心（NCC）：** 对于给定的深度网络激活，网络分类器收敛到选择具有最近列车类均值（标准欧氏距离）的类。

















在深度神经网络（DNN）中，分布外（OOD）检测和分布外泛化被广泛研究，但人们对它们之间的关系仍然知之甚少。 我们的经验表明，网络层中的神经塌陷（NC）程度与这些目标成反比关系：较强的 NC 可以提高 OOD 检测能力，但会降低泛化能力；而较弱的 NC 则会以检测为代价提高泛化能力。 这种权衡表明，单一特征空间无法同时完成这两项任务。 为了解决这个问题，我们建立了一个理论框架，将 NC 与 OOD 检测和泛化联系起来。 我们的研究表明，熵正则化可以减轻 NC，从而提高泛化效果，而固定的简单等相紧帧（ETF）投影器则可以强制 NC，从而提高检测效果。 基于这些见解，我们提出了一种在不同 DNN 层控制 NC 的方法。 在实验中，我们的方法在 OOD 数据集和 DNN 架构的两项任务中都表现出色。













# 我的思路

## supporting materials

``Prevalence of Neural Collapse during the terminal phase of deep learning training"\cite{Papyan_2020} 是 Neural Collapse 这一称法的起源, 最早地提出了这个概念, 并把 NC 分成了四个类别. 这篇文章中，作者分析了

NC 发生的理由的推断，指出 NC 2 到 NC 4 roughly 都是 NC1 induce 的，并且证明了 Simplex ETF 这一数学结构是这一过程中最优的几何结构，NC 自然地收敛到这一结构。

这一篇文章的影响深远，广受引用，在它之后有许多讨论 Neural Collapse 的优秀研究，比如我们当前要 review 的这一篇 ``A Geometric Analysis of Neural Collapse with Unconstrained Features"

我们即将 review 的这一篇论文study the problem based on a simplified unconstrained feature model, which isolates the topmost layers from the classifier of the neural network.

它在理论上证明，在采用交叉熵损失和权重衰减正则化的情况下，网络的全局最优解必然呈现神经塌陷状态；同时，除全局最优点外，所有其他临界点都是严格鞍点，这意味着常用的优化方法（如随机梯度下降）能够有效地逃离鞍点，保证收敛到全局最优。实验部分在MNIST、CIFAR-10等数据集和ResNet等网络结构上验证了这一理论，并展示了利用神经塌陷现象来改进网络设计（例如固定最后一层分类器为Simplex ETF、降低特征维度以减少计算和内存开销）的潜力。

The paper we are about to review studies the problem based on a simplified unconstrained feature model, which isolates the topmost layers from the classifier of the neural network.

It proves theoretically that with cross-entropy loss and weight decay regularization, the global optimal solution of the network inevitably presents a neural collapse state; meanwhile, all other critical points except the global optimum point are strict saddle points, which implies that commonly used optimization methods (e.g., stochastic gradient descent) are able to efficiently escape from the saddle points and guarantee convergence to the global optimum. The experimental part validates this theory on datasets such as MNIST, CIFAR-10, and network architectures such as ResNet, and demonstrates the potential of utilizing the neural collapse phenomenon to improve the network design (e.g., fixing the last layer of classifiers to be the Simplex ETF, and lowering the feature dimensionality to reduce the computational and memory overheads).



我们的 review 分为四个阶段

第一个阶段，即 spring break 的一个星期内 （3/1 to 3.7), 我们将仔细阅读 ``Prevalence of Neural Collapse during the terminal phase of deep learning training", 使用ResNet，在FashionMNIST 上复原 NC 的产生，以理解 TPT 阶段中的 NC2 (converges to Simplex Equiangular Tight Frame) 的行为

第二个阶段，3/8 to 3/22 的两个星期中，我们将 read through the key theoretical and experimental results from ``A Geometric Analysis of Neural Collapse with Unconstrained Features", 着重理解和复述其中重要定理的证明，比如 Global Optimality Conditions 以及No Spurious Local Minima and Strict Saddle Property，并使用 SGD 算法 复原论文中的实验

第三个阶段，3/23 到 4/2 的一个星期内，我们将寻找更多关于 Neural Collapse 的论文，尤其是后续引用``A Geometric Analysis of Neural Collapse with Unconstrained Features" 的论文
