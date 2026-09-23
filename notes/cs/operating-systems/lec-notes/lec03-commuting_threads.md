review:

1. 一个 Process 即: 一个或多个 threads, in an address space. 更加简洁地说, 一个 process 即一个运行中的 program.

2. 一个 Thread 即: 一个 seq of **executing instructions**

+ Simplicity: program can issue synchronous/blocking requests

+ Performance: allow multiple slow things to happen in parallel

⚠️ 注意：thread 是进程内的执行单位，而 process 是资源分配的单位。每个 process 独立拥有自己的 address space.

一个 thread 也可以被看成一个 lightweight process.



一个 CPU **可以运行的 processes 理论上是无限的**，但**在任意时刻能真正“执行”的进程数是有限的**，具体与以下因素有关：

- 一个 **CPU 核心（core）** 同一时刻只能**执行一个线程（thread）**；
- 如果是**多核 CPU**（如 4-core 或 8-core），每个核心可以并行执行一个 thread
- 如果支持 **超线程（Hyper-Threading）**，一个物理核心可以“虚拟出”两个逻辑核心（thread-level parallelism 更强）
- 所以，一个有 8 个逻辑核心的 CPU，在任意时刻最多能**并发执行 8 个 threads**



而 CPU 可管理的总 processes 数量由 os 决定. 即使只有一个 core，CPU 也能通过**进程调度（context switching）** 快速在多个 processes 之间切换，看起来像是“同时”运行很多 processes.

- 比如 Linux 中 `/proc` 文件系统默认支持 **32,768 个进程**，可通过如下命令查看：

```bash
ulimit -u  # 用户最大可运行进程数
cat /proc/sys/kernel/pid_max  # 系统允许的最大 PID（进程数量上限）
```

你也可以手动调高这个数:

```bash
sudo sysctl -w kernel.pid_max=1048576
```

每个 thread 都有自己的 PID, 并且 **线程数量 + 进程数量** 会一并计入系统的 `pid_max` 限制. 如果你开了一个进程，里面有 100 个线程，它就用掉了 **101 个 pid**. (这里使用的概念是 linux 内核, Linux 内核设计中没有 “thread” 作为一等公民的概念，一切都是 "task"，用统一的 PID 来表示.)





实践中, 能够比较好地运行的 processes 数量受到限制

1. **物理资源**：内存不够、文件描述符不够、调度负担大都会限制
2. **用户权限**：非 root 用户一般有上限，比如单个用户最多可同时运行 4096 个 processes
3. **调度开销**：如果上下文切换代价高，实际运行效率可能下降严重





假设你有一个 4 核 8 线程的 CPU：

- **同时运行 threads 数**（真正在 CPU 上执行的）最多是 8；
- 可以用 `ps -e | wc -l` 查看当前有多少“正在系统中存在的 prcesses”，可能是几百或上千个
- 这些进程由操作系统调度，在 CPU 上“轮流”运行











## sharing

‘两个 types of sharing

- Application resource

  Sharing of Application Resource 指多个 users / 多个 processes / 多个 threads 共享由应用程序提供的资源, 比如

  - 多个用户访问 同一个数据库
  - 多个程序使用 同一个 Web server API
  - 多个 processes 使用同一打印队列

  操作系统的角色：
  - 提供进程间通信机制（IPC）和权限控制，支持数据共享和协作。
  - 管理用户访问权限，避免冲突或非法访问（例如：文件锁、信号量）。

- Hardware resource

  比如 多个进程共享 **CPU**（通过时间片轮转或调度算法）

  然而**当前, 我们假设 each thread has its own processor (no sharing of processors)**







## atomic operations

在我们谈论 cooperating threads 之前, 我们首先要明确: 哪些 operations 是 atomic 的.

一个 atomic operation, 顾名思义, 在**其运行期间, 没有其他 threads 的 events 可以发生**, 整个操作“不可插入”.

最基础的 atomic operations 是由 ISA 决定的.  而我们可以 build 更大的 atomic operations. 比如 

```c
lock(mutex);
if (*addr < threshold)
    *addr += value;
unlock(mutex);
```



Example:

thread 1: print "123"

thread 2: print "ABC"

假设 print 一个字符是 atomic 的, 那么可能的结果由很多 ($C(6,3) = 20$ 种)



这里是一个练习. 假设数字加减是 atomic 的, 那么以下两个 threads 的行为如何?

thread 1:

```c++
g = 0 
while (g < 10) {
    g++
}
print "A finished"
```

Thread 2:

```c++
g=0
while (g > -10) {
    g--
}
print "B finished"
```



显然, `g` 一开始一定是 `0`, 然后执行二者中的某个命令. 

假设两个 threads 运行速度相同, 那么一定会无限循环 `+1-1` .

如果两个 threads 速度不同, 那么更快的那个一定会先 print.







non-deterministic 的 interleaving 导致 debugging 变得 challenging. 

我们称这种 bug 为 "Heisenbug".







## synchronization 

在 **并发编程**中，synchronization（同步）是指协调多个线程或进程的执行顺序，以确保共享资源的正确访问

要写出正确的 concurrent programs, 首先就是要考虑并控制所有可能的 interleavings of events from multiple threads. 

目的: **所有可能的 Interleaving of atomic operations (即, processors 运行的速度任意) 必须 result in 准确的 output.**

这种对于 events from diffrent threads 如何 interleave 的控制, 叫做 synchronization. 在**并发编程**中，synchronization (同步) 指协调多个 threads 的执行顺序，以确保共享资源的正确访问)

**synchronization 的要领: 既要 eliminate 会导致错误结果的 interleavings, 又要尽可能地 constrain interleavings as little as possible (即, 只 eliminate 会导致错误结果的 interleavings)** 





## mutual exclusion: 一种 synchronization

Types of synchronization 1: mutual exclusion

**Mutual Exclusion（互斥）** 是一种确保 **同一时间最多只有一个 thread ** 能访问 **某个共享资源（critical section / 临界区）** 的机制。

比如假设多个线程都要修改一个共享变量 `counter`，如果不加以控制，多个线程可能会同时读写这个变量，导致结果不一致或数据损坏.



即: 

- critical section: 指程序中访问共享资源（如变量、文件、设备等）的代码块

- mutual exclusion: 保证同一时间最多只有一个 thread 进入 critical section



### example: 买牛奶问题

例子: Peter 和 Janet 共用一个冰箱, 两个人都想买牛奶, 但是冰箱里只能放一瓶, 因而两人不能同时买牛奶.

Peter:

```
leave notePeter
while (noteJanet) {
    do nothing
}
if (no milk) {
    buy milk
}
remove notePeter
```

Janet:
```
leave noteJanet
if (no notePeter) {
    if (no milk) {
        buy milk
    }
}
remove noteJanet
```

Peter 的 `while (noteJanet)` 可以有效阻止他和 Jenny 同时进入 critical section. 即便大部分 operations 不是 atomic 的.

但是, 这个 solution 的问题是: 

1. complicated (not "obviously correct", 不可 scale)
2. asymmetric. 也导致不可 scale.
3. Peter 在等待期间, 持续地 consume CPU. 这种问题称为 "buzy-waiting".



<img src="assets/Screenshot 2025-05-26 at 22.31.01.png" alt="Screenshot 2025-05-26 at 22.31.01" style="zoom:50%;" />





### mutex lock

一个 mutex lock 可以在一个 thread 执行 critical section 的过程中, 确保其他 threads 无法打开同一个 lock 进入它们自己的 critical section. 

注意: mutex 并非是不让其他 threads 运行! mutex lock 起来时, 其他 threads 也正常运行, 只不过一旦运行到它们自己的 critical section (被同一个 mutex 锁起来的部分), 那么就会被卡住. 

mutex 的实现 (基础版) 是这样的: (这种写法叫做 spinlock, 自旋锁)

```c
lock(): // wait until lock is free, then acquire it.
  while (1) {
    if (lock is free) { 
      acquire lock //atomic
      break
    }
  }
/*
if (lock is free) { 
		acquire lock // atomic
是 atomic 的
*/

unlock(): release lock //atomic
```

即: 一旦某个 thread, say thread A, 的代码运行到某个 mutex 的 `lock`, 它照常运行, 但是如果其他任意 thread, say thread X, 在它之后运行到同一个 mutex 的 `lock`, 那么就会被一直卡在这个地方.

所以 mutex 的作用其实有两个

- 在 acquisition 前: 当另一个 thread currently hold the lock 时, 通过持续 acquiring lock, 来阻止当前 thread 进入自己的 critical section.
- ﻿﻿在 acquisition 后 : 在 unlock 前, 阻止其他 threads 进入它们的 critical section **(把其他 threads 的运行限制在它们 w.r.t. 该 mutex 的 critical section 之前)**





```c
lock()
//<critical section>
unlock()
```

计算机视角的 critical section 就是被锁住的这一部分. 





注意: mutex 并不把某个 critical section 变成 atomic 的, 因为: 在 hold lock 的 thread 运行 critical section 时, 其他 threads 也可以运行自己的代码, 只是一旦运行到 w.r.t. 同一个 mutex 的, 它们自己的 critical section 时会停止.

因而, mutex 对保护共享资源的安全性有没有作用, 取决于我们有没有把它放在正确的位置, 写好代码. 



虽然每个 thread 有自己的 stack, 但是我们也有共享的变量. 这些共享的变量, 为了保持安全性, 我们的代码应该通过 mutex, 控制在同一个时间只有一个 thread 改写它. 试想: 如果我们 lock 住了, 一个 thread A 在改写这个变量, 但是另一个 thread B 的代码里, 这个变量却放在了该 lock 外, 那么我们的控制仍然失败了; 这个变量很可能在我们运行 thread A 的 critical section 时, 半途被 thread B 的非 critical section 改写从而破坏其正确性.





### 通过 mutex lock 来解决买牛奶问题

从而, Peter 和 Janet 的买牛奶问题就轻松解决了:

```c
// Peter, Janet both:
mutex milk
milk.lock()
// <critical>
if (noMilk) {
    buy milk
}
// <critical>
milk.unlock()
```



注意: 任意的 synchronization 都 involves waiting. 

不过, 我们确实可以通过更 efficient 的代码来减少 wait 的时间. 

我们这里介绍一个策略: **通过缩小 critical section 的范围来降低等待时间, 提高效率. 具体做法是: 把 高耗时的指令尽可能地放在 critical section 外面.**



```c
note.lock()
// <critical>
if (no note) {
    leave note
// <critical>
    note.unlock()
    if (no milk) {
        buy milk
    }
    note.lock()
// <critical>
    remove note
// <critical>
}
note.unlock()
```

leave note (like 五秒钟) 比起 buy milk (like 十分钟), 时间短许多.

这样, 当一方在买 milk 的时候, 另一方原先要 hold lock 到对方买完结束, 而现在只需要 hold 到查看完 note (确认共享资源是否 available) 就可以了.

这样, 所有的 lock hold 的时间都不超过五秒钟. 从而, 在不损失正确性的前提下大大提升了效率 (这个 thread 可以高频地被使用). 

