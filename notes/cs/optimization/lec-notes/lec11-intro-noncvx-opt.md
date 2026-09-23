







Definition. (**Strict Saddle Function in** $\mathbb{R}^n$, Ge et al.'15) 

A function $f: \mathbb{R}^n \mapsto \mathbb{R}$ is $(\alpha, \beta, \gamma, \delta)$-strict saddle, if $\forall \boldsymbol{x} \in \mathbb{R}^n$ obeys **at least one of the following**:

- [Large gradient] $\|\nabla f(\boldsymbol{x})\|_2 \geq \beta$;
- [Negative curvature] $\exists \boldsymbol{v} \in \mathbb{S}^{n-1}$, such that

$$
\boldsymbol{v}^{\top} \nabla^2 f(\boldsymbol{x}) \boldsymbol{v} \leq-\alpha
$$

- [Strong convexity around minimizers]
  $\exists \boldsymbol{x}_{\star}$ such that $\left\|\boldsymbol{x}-\boldsymbol{x}_{\star}\right\|_2 \leq \delta$, and for all $\boldsymbol{y} \in \mathcal{B}\left(\boldsymbol{x}_{\star}, 2 \delta\right)$, we have $\nabla^2 f(\boldsymbol{y}) \succeq \gamma \boldsymbol{I}$.









Def (**Strict Saddle Function on Manifold $\mathcal{M}$, Sun et al.'15)** 
A function $f: \mathcal{M} \mapsto \mathbb{R}$ is $(\alpha, \beta, \gamma, \delta)$-strict saddle, if $\forall \boldsymbol{x} \in \mathcal{M}$ obeys **at least one of the following**:

- [Large gradient] $\|\operatorname{grad} f(\boldsymbol{x})\|_2 \geq \beta$;
- [Negative curvature] $\exists \boldsymbol{v} \in T_{\boldsymbol{x}} \mathcal{M}$ with $\boldsymbol{v} \in \mathbb{S}^{n-1}$, such that $\langle$ Hess $f(\boldsymbol{x})[\boldsymbol{v}], \boldsymbol{v}\rangle \leq-\alpha ;$
- [Strong convexity around minimizers] $\exists \boldsymbol{x}_{\star}$ such that $\left\|\boldsymbol{x}-\boldsymbol{x}_{\star}\right\|_2 \leq \delta$, and for all $\boldsymbol{y} \in \mathcal{B}\left(\boldsymbol{x}_{\star}, 2 \delta\right) \cap \mathcal{M}$, we have Hess $f(\boldsymbol{y}) \succeq \gamma \boldsymbol{I}$.













### ex1: Generalized Phase Retrieval

Generalized phase retrieval: given intensity $\boldsymbol{y}=\left|\boldsymbol{A} \boldsymbol{x}_{\star}\right|$, recover $\boldsymbol{x}_{\star} \in \mathbb{C}^m$.
- The sensing matrix $\boldsymbol{A}$ can be generic and less structured, making the problem easier to solve.
- 


$$
\begin{aligned}
&\text { Solve for } \boldsymbol{x} \in \mathbb{C}^n \text { in } m \text { quadratic equations }\\
&\begin{gathered}
y_k=\left|\boldsymbol{a}_k^{\top} \boldsymbol{x}\right|^2, \quad k=1, \cdots, m, \\
\text { or } \boldsymbol{y}=|\boldsymbol{A} \boldsymbol{x}|^2, \quad \text { where }|\boldsymbol{z}|^2:=\left[\left|z_1\right|^2, \cdots,\left|z_m\right|^2\right]^{\top}
\end{gathered}
\end{aligned}
$$


Lifting: introduce $X = x x^*$ to linearize the problem
$$
y_k=\left|\boldsymbol{a}_k^* \boldsymbol{x}\right|^2=\boldsymbol{a}_k^* \underbrace{\left(\boldsymbol{x} \boldsymbol{x}^*\right)}_{\boldsymbol{X}} \boldsymbol{a}_k \implies y_k=\left\langle\boldsymbol{a}_k \boldsymbol{a}_k^*, \boldsymbol{X}\right\rangle
$$










### ex2: low-rank Matrix Recovery 

Low-rank Matrix Recovery:

Given $\boldsymbol{y}=\mathcal{A}\left(\boldsymbol{X}_{\star}\right)$, recover a rank- $r\left(\right.$ with $\left.r \ll \min \left\{n_1, n_2\right\}\right)$ matrix $\boldsymbol{X}_{\star} \in \mathbb{R}^{n_1 \times n_2}$ from $\boldsymbol{y} \in \mathbb{R}^m$.

- Convex relaxation approaches:

$$
\min _{\boldsymbol{X}}\|\boldsymbol{X}\|_* \quad \text { s.t. } \quad \boldsymbol{y}=\mathcal{A}(\boldsymbol{X})
$$

or in the noisy setting:

$$
\min _{\boldsymbol{X}} \frac{1}{2}\|\boldsymbol{y}-\mathcal{A}(\boldsymbol{X})\|_2^2+\lambda\|\boldsymbol{X}\|_*
$$


The nuclear minimization problem with $O\left(n_1 n_2\right)$ variables could be very expensive (computing SVD $O\left(n_1^2 n_2\right)$ ).