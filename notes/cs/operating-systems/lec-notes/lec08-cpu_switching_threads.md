## switching threads

上个 lec 开始, 我们已经从 part 1 (using thread) move 到 part 2 (implementing thread interface) 了!

这个 lec 我们继续.

而我们在 building interface 中仍然不会考虑如何 solve 这两个我们之前的问题: 为什么 lock, 以及和 wait 中间的步骤是 atomic 的;

今天我们会讨论: 如何 switch a thread



Continue from last time: 我们使用 thread control block (TCB), 在 thread not running 的时候, 用来存储 thread info (state, context) 的 struct.



Switching Threads 分为 5 个 steps:



### step 1: current thread returns control to OS

#### internal events

internal events: 

1. 当前的 thread call 了 `lock` (already held), `wait` 或者 `down` 等. 

   **running -> blocked queue**

2. 当前的 thread 请求 OS 去做一点事情, 比如让它再开一个临时 thread 来做 I/O. 

   **running -> blocked queue**

3. 当前的 thread 主动 gives up CPU (`yield`).

   **running -> ready queue**

但是 internal events (由 thread 自己控制的 event) 并不能 sufficiently 作为唯一的控制 OS 的方式. 

OS 不能 trust applications! 因为 user code 可能是坏的 (死循环等), 我们必须假定, 有一些 thread 会一直霸占着 CPU. 因而 OS 和 CPU 必须有自主控制的能力!

#### external events (interrupt)

interrupt 是由硬件发起的 (**hardware event**), 其可以 transfer control from thread to **OS interrupt handler**, 这个 handler 相当于一个管理员

因而 CPU 不仅仅 fetch -> decode -> execute, 即 dealing with instructions. 这是一个简化的模型;

CPU 还会在这个循环中额外加入一个环节: **check for interrupt**! 比如: 是否有一些外部设备, like I/O device, raised an interrupt? 

比如:

| 来源       | 例子                     |
| ---------- | ------------------------ |
| 定时器中断 | 时间片到了，触发线程调度 |
| 键盘中断   | 用户按键                 |
| 网络中断   | 收到数据包               |
| 磁盘中断   | 读写数据完成             |

(processor 在执行几乎每个 Instruction 之后都会 check for pending interrupt (检查点称为 instruction boundary, 总之非常频繁).

**当 interrupt 被 detect 到, CPU 就会停止目前执行的代码, call OS interrupt handler.**

OS interrupt handlers 是一些 OS 注册的函数指针. 注意不止一种. 对于每种我们上述说的 Interrupt 类型 (以及很多我们没有提到的 interrupt 类型), 都有不同的 OS interrupt handlers. （比如, 我们在 P2 中将要 implement 的: `timer_interrupt_handler` 以及 `inter_processor_interrupt_handler`. 其中, `timer_interrupt_handler()` 做的事情是定时 return control back to OS, like 10 ms, 保证 OS 每隔一段时间一定可以获得控制权; 而 `inter_processor_interrupt_handler`, IPI, 则是 CPU 给另一个 CPU 发的一种“打断信号”, 告诉它去做某件事, 比如线程调度: 把某个线程从 CPU 1 转移到 CPU 2, 再比如 kernel synchronization, 在多个 CPU 之间同步某种 kernel 状态）

这些 OS interrupt handlers 的 addresses 被储存在: **interrupt vector table (IVT)** 里面. 

(比如：interrupt num 32 是定时器中断 → ISR 地址是 `timer_interrupt_handler()`)

这个行为使得 interrupt 这个 hardware event 可以和 OS 这个软件交互.)

(注释 : interrupt 本身作为一个 hardware 行为我们不用了解. 大致上是例如：
- 定时器每隔 10 ms 发一次中断；
- 键盘按下，发出中断；
- 磁盘读完数据，发出中断；

然后硬件通过 中断控制器 (PIC 或 APIC) 把中断号 (IRQ) 传给 CPU.) 



实际上, 几乎所有的 OS code 都是由 OS interrupt handlers 执行的.






### step 2: CPU 选择另一个 thread to run (scheduling, 调度)

OS 重新获得了 CPU 的控制权, 现在要把它转交给另一个 thread. 这一过程称为 scheduling.

now OS 的问题: **which thread to run?**

并且 before 这个问题: **现在有几个 threads 在 waiting? ( 0 / 1/ >1) ?** 

#### 3 个情况

- 如果只有 1 ready thread: done.
  - 但是 what if that thread call `yield`? 这个时候根据我们选择的 policy, OS 可以延迟 schedule 它或者仍然 schedule 它.

- 如果是 >1 threads: need to make a decision.
  - 在 p2 中我们只需要 FIFO (queue). 
  - 不过之后我们会考虑更加成熟的 more options (FIFO, priorities, round robin 等等, OS 的 scheduling policy).
- 如果是 0 ready thread: 
  - halt, 或称 wait for instruction. 总之就是 low power state, 等待新的 instruction
  - p2 中相关函数是 `suspend`







### step 3: OS saves 当前的 thread state (CPO -> TCB)

现在我们已经结束了调度. 我们要存储当前 thread 的信息 into memory.

这看似只是一些 sw 的事情, 但是其实是很 tricky to get it right 的.



#### Save-Point Trap

**Why won't the following code work?**

```assembly
100 save PC
101 switch to next thread
```

因为当我们 switch 回存档点的时候, 我们是回到 save 的点. 也就是说: 我们又回到了 `100 save PC` 这个点上, 然后又 switch 走陷入死循环了.

更何况我们要 save 所有的 regs, 而不是一个. 

因而这需要 delicate assembly language design. 其实主要就是做各种事情的顺序. 

#### `getcontext()`

我们使用 Linux 本身的一个 interface: `getcontext()`

这个函数 copies context from CPU to memory 









### Step 4: OS loads 下一个 thread 的 context (TCB -> CPU), 并 run 一个 thread

问题：

1. How to load registers (包括 SP)? 

2. How to resume execution?

   当我们 load PC 后, 它接着就是 running 了. 于是这个问题其实等于 how to load PC (也是 registers)

因而这两个问题其实是同一个问题: 如何 load regs. (PC 最后 load)



#### `setcontext()`

Linux interface: `setcontext()`, copies context from memory to CPU











#### swapping context trap: 无限循环

Does the following code work?

A:

```c++
// Thread A
do stuff;
getcontext (save state of thread A)
setcontext to thread B
do more stuff
```

 B:

```c++
// Thread B
do stuff;
getcontext (save state of thread B)
setcontext to thread A
do more stuff
```



不 work. 因为每次我们 switch (`setcontext`) 到另一个 thread 的时候, 我们就回到了另一个 thread 的存档点 (`getcontext`) 后, 但是它做的就是 `setcontext` 回来; 

然后, cpu 就不停地在两个 threads 中间 switch, 而不会 do more stuff

这里的问题在于: 我们理想的 `setcontext` 应该是直接跳到对方的 do more stuff 这里, 而不是对方的 `setcontext`; 而就这个代码来看这是没办法的: CPU 总得先保存自己当前 thread 的状态再切换另一个 thread 的 context, 因而 `getcontext` 总是在 `setcontext` 前, 因而两个 threads 之间的这个死循环总是存在! 

 



#### solution to swapping context trap: `swapcontext`

Linux 有一个 correctly combines `getcontext()` 和 `setcontext` 的 interface: `swapcontext`. 这两件事并为一行之后, 无限循环的问题就不会出现了

```c++
do stuff;
swapcontext(&ctxA, &ctxB);
do more stuff
```





### which thread is carrying out the steps?

所以 cpu 从 thread A 转到 thread B 的这个过程 (我们的四个 steps) 到底是哪个 thread 在 carry out? (在哪个 thread 的 stack 上)

step 1 很明显: 还是原本的 thread, 因为仍然是 run on the stack of the calling thread

step 2,3,4: 也是原本的 thread, 只不过是从 user code 转换到 os code, 但是仍然是 run on the stack of the calling thread





Thread 1:

```c++
print "start thread 1"
yield()
print "end thread 1"
```

thread 2:

```c++
print "start thread 2"
yield()
print "end thread 2"
```

yield:

```c++
print "start yield: thread %d"
switch to next thread (swapcontext)
print "end yield: thread %d"
```



最后的输出结果: 

<img src="assets/Screenshot 2025-06-16 at 10.13.16.png" alt="Screenshot 2025-06-16 at 10.13.16" style="zoom:50%;" />

1. thread 1 在 switchcontext 之后 cpu 运行 thread 2, 
2. thread 2 在 switchcontext 之后, cpu 回到 thread 1 刚才 save 的位置, 即它完成一半的 yield, 继续完成
3. thread 1 运行结束, cpu 取回 thread 2, 从刚才 switch 时 save 的地方继续运行, 即它完成一半的 yield, 继续完成





### 如何创建一个 thread

一个 thread 也就是一个 running seq of instructions.

这是很难 create 的.

所以 Instead, 我们应该 **create 一个 ready thread.** 让它看起来像是在 running, 把它放进 ready seq 中. 它只需要等待被 schedule 即可.

即: create TCB, 让它蕴含 thread 的信息 (context)



<img src="assets/Screenshot 2025-06-16 at 11.02.25.png" alt="Screenshot 2025-06-16 at 11.02.25" style="zoom:50%;" />





因而 create a thread 的流程就是:

1. allocate TCB

2. allocate stack

3. initialize TCB 中的 context 

   - 让它 looks like 即将 call 一个函数 
   - 把 PC 设为这个函数的 start point
   - set registers

   这部分是比较 tricky 的, 不过我们不用担心. 因为 Linux 有 `makecontwxt` 来做这件事情. 

4. 把 TCB 放入 ready queue













