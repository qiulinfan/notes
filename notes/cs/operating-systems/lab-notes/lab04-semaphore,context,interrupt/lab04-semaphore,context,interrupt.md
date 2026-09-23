## semaphore

### exercise 1: pingpong

这个 ex 很简单。就是基本的利用 0-1 semaphore 做 ordering. 两个 threads 一个控制 up 一个控制 down 就可以实现,

这里只是 0/1 semaphore, 所以 ordering 一定是一个执行完另一个执行的循环, 不需要考虑 mutual exclusion, 所以不用 mtx.

唯一的难点是如何实现 random start: 有点类似于 cpu::guard 一样的思路. 我们利用一个 global variable bool `who_start`, 以及一个 `start` 0-1 semaphore (作为 mtx). 谁先 grab 到这个 mutex, 并且发现 (`if`) 这个 global variable 还没有被改动过, 就可以先修改它, 然后用 local variable 告诉自己, 自己是第一个, 于是设置自己的 semaphore 初始值为 1 而非 0, 从而优先进入循环.



### exercise 2: barrier

要做的事情是: 我们 set 一系列的 threads to synchronize their progress.

即: 让它们不论先来后到, 先被拦在 barrier 这里 check in, 等待所有 threads 全部都 check in 完了等在 barrier 这里之后, 才统一让它们 proceed.

我们要实现的: 

`runner`: 一个 call 就是一个 runner 的初始化, 要做的就是进场以及等待以及起泡的过程, 运行完了就表示这个人开始 run 了

`starter`: 指挥 runnners 等待和起跑



这里比较复杂的就是, N 个 runner 函数的 call 和 1 个 starter 函数的 call 交互执行. 这里 mutex 既作为计数也作为 ordering 的工具. "提前预定" N 个 down, 并慢慢等待 N 个 up 来把它们抵消, 是这里的核心逻辑.

(BTW 其实这里很形象, 因为所有 runners 函数的 call, 在 ready.up 被运行完, 被卡在 starter.down 这里都是同一时间被 release 的, 就是 starter 终于过了 N 个 ready,down, 在运行 N 个 start.up 之前. 这表示了所有人起点的公平

而 N 个 runners 过自己的 `started.down()`, 即正式起跑, 则是由先后的, 但是全靠自己的 thread 速度去抢, 作为竞技的一部分, 也是现实的.)





## Thread Implementation

<img src="assets/Screenshot 2025-06-24 at 03.55.20.png" alt="Screenshot 2025-06-24 at 03.55.20" style="zoom:67%;" />



关于 context 和它的四个函数, 我们已经熟悉的不能再熟悉 (此处已经做 p2..)





