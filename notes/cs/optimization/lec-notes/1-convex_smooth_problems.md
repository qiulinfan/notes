# Smooth unconstrainted optimization

## Gradient Descent for Smooth Problems 

### def of GD

#### descent direction in iterative method

Iterative method 即建立一个 seq, 函数值 descending.

<img src="1-convex_smooth_problems.assets/Screenshot 2025-02-21 at 15.05.19.png" alt="Screenshot 2025-02-21 at 15.05.19" style="zoom:45%;" />

Newton's method: per iteration cost 高, #interations 少



Descent direction: 我们取 gradient 和一个 direction vector 的 Dot product. gradient 表示函数在当前的 point 上, 在各方向上的变化趋势(正负与大小); 而取一个方向和它 Dot product, 得到的结果就是**如果在这个方向 $d$ 上前进, 得到的函数值增/减的幅度**.

**如果这个幅度是负的, 那么这就是一个 descent direction.** 

<img src="1-convex_smooth_problems.assets/Screenshot 2025-02-21 at 15.06.28.png" alt="Screenshot 2025-02-21 at 15.06.28" style="zoom:45%;" />

#### GD: steepest descent direction

我们发现: 取 $d = -\nabla f(x)$, 就是一个 descent direction. 因为此时 $f'(x,d)$ 是 $-||\nabla f(x)||_2^2 < 0$



取这一 $d$, 这一方法称为 gradient descent

并且我们发现, 根据 Cachy-Swartz, GD 的 descent direction 是 steepest direction

<img src="1-convex_smooth_problems.assets/Screenshot 2025-02-21 at 15.43.06.png" alt="Screenshot 2025-02-21 at 15.43.06" style="zoom:45%;" />



#### step size

选定了 descent direction 后, step size 的选择也很重要. 因为不好的选择会越过 critical point, 增加 error.

<img src="1-convex_smooth_problems.assets/Screenshot 2025-02-21 at 15.45.03.png" alt="Screenshot 2025-02-21 at 15.45.03" style="zoom:50%;" />

为了选取合适的 Step size, 我们可以进行 line search. 等下 cover

<img src="1-convex_smooth_problems.assets/Screenshot 2025-02-21 at 15.47.11.png" alt="Screenshot 2025-02-21 at 15.47.11" style="zoom:50%;" />



### sufficient condition for convergence in smooth convex problems

recall: smooth 即 gradient $L$-Lipchitz for some $L$

<img src="1-convex_smooth_problems.assets/Screenshot 2025-02-21 at 15.52.30.png" alt="Screenshot 2025-02-21 at 15.52.30" style="zoom:50%;" />

我们使用这个 $L$ const, 有一个 theorem: 用 $1/L$ 作为 step size, 这个 $f$ 一定是 decreasing 的(不会升到反向更高的地方).

<img src="1-convex_smooth_problems.assets/Screenshot 2025-02-21 at 15.50.12.png" alt="Screenshot 2025-02-21 at 15.50.12" style="zoom:50%;" />

> Proof:
>
> <img src="1-convex_smooth_problems.assets/Screenshot 2025-02-21 at 16.11.28.png" alt="Screenshot 2025-02-21 at 16.11.28" style="zoom:50%;" />





#### smooth convex GD with $\tau=1/L$ has sublinear convergence

<img src="1-convex_smooth_problems.assets/Screenshot 2025-02-21 at 16.12.46.png" alt="Screenshot 2025-02-21 at 16.12.46" style="zoom:50%;" />

> Proof: 
>
> <img src="1-convex_smooth_problems.assets/Screenshot 2025-02-21 at 16.14.49.png" alt="Screenshot 2025-02-21 at 16.14.49" style="zoom:45%;" />
>
> <img src="1-convex_smooth_problems.assets/Screenshot 2025-02-21 at 16.16.50.png" alt="Screenshot 2025-02-21 at 16.16.50" style="zoom:50%;" />
>
> <img src="1-convex_smooth_problems.assets/Screenshot 2025-02-21 at 16.20.42.png" alt="Screenshot 2025-02-21 at 16.20.42" style="zoom:50%;" />







<img src="1-convex_smooth_problems.assets/Screenshot 2025-02-21 at 16.46.06.png" alt="Screenshot 2025-02-21 at 16.46.06" style="zoom:50%;" />















<img src="1-convex_smooth_problems.assets/Screenshot 2025-02-21 at 16.45.09.png" alt="Screenshot 2025-02-21 at 16.45.09" style="zoom:50%;" />



<img src="1-convex_smooth_problems.assets/Screenshot 2025-02-21 at 16.51.45.png" alt="Screenshot 2025-02-21 at 16.51.45" style="zoom:40%;" />

也称为 momentum method, 是 ADAM for optimizing model neural networl 的基础.

worst case convergence: $O(1/k)$















##  Linesearch Methods for Step Size















##  Exploiting Function Properties for Faster Convergence















## Newton & Quasi-Newton Method