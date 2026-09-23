# Naive Bayes

## Modeling

Naive Bayes assumption: $x$ 的所有 feature coordinates 是 **conditionally independent**  的
$$
P\left(x_1, \ldots, x_M \mid C_k\right)=P\left(x_1 \mid C_k\right) \cdots P\left(x_M \mid C_k\right)=\prod_{j=1}^M P\left(x_j \mid C_k\right)
$$


When classifying, we can simply find the class $C_k$ that maximizes $P\left(C_k \mid \mathbf{x}\right)$ using the Bayes rule:
$$
\begin{aligned}
& \arg \max _k P\left(C_k \mid \mathbf{x}\right)=\arg \max _k P\left(C_k, \mathbf{x}\right) \\
&=\arg \max _k P\left(C_k\right) P\left(\mathbf{x} \mid C_k\right) \\
&=\arg \max _k P\left(C_k\right) \prod_{j=1}^M P\left(x_j \mid C_k\right)	\quad \text{by Naive Bayes assumption}
\end{aligned}
$$


For prior (class distribution): 仍然假设 class label 的 Probability 是 constant 的, 即 model 为 Bernoulli 分布
$$
y \sim Bernulli(\phi)
$$
即 $P(C_1)= \phi$, $P(C_0) = 1-\phi$



