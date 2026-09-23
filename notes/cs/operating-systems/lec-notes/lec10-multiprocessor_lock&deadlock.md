## Lock implementation (Multiprocessor) (continued)

### 总结: uniprocessor switch invariant

- When calling switch: interrupts must be disabled
- When switch returns: thread may assume interrupts are "still" disabled
- Remember: before running user code, interrupts must be enabled



我们会不禁思考:  但是1 和 3 难道不是矛盾的吗? 当我 switch context 的时候, 我接下来就是 run user code; 但是我 swtich context 前 interrupt disabled 了, 如何保证 running user code 前 interrupt enabled 呢?



 一个 ready queue 中的 thread 在被重新 schedule 之前, 只有三种情况:

1. 它从来没被运行过, 是被初始化的, 第一次被 schedule (`getcontext`)
2. 它之前被 interrupt 了
3. 它自己在 cpu 上运行的时候, call 了 `swapcontext`

对于第一种情况, 我们已经通过 `thread_starter` 开头的 `interrupt_enabled` 来确保了 "before running user code, interrupts must be enabled"

对于第二种情况, 这个时候本身就是 `interrupt_enabled` 的 (因为另一个 thread 这个时候被 interrupt, 说明也是在 run user code 而不是在 run os code, 根据我们的 inductive step, 这个时候也是 `interrupt_enabled` 的 )

对于第三种情况, 我们只需要每次 swapcontext 之后都立刻写 `interrupt_enabled` 就可以.



因而, 保持这三个 invariance 只需要:

1. 在 `thread_starter` 开头 call `interrupt_enabled` 

2. 在每次 os code `swapcontext` 后都 call `interrupt_enabled`

   比如 yield:

   ```c++
   void thread::yield(){
   		//...
     	swapcontext(...);
     	interrupt_enabled();
   }
   ```

   

就完美解决! 



我们最后的 single CPU 的 correct, efficient, fair lock 的 implementation 如下:





```c++
void lock () {
    interrupt_disabled; 

    if (status != FREE) {	// new: 不再需要 while
      	add thread to queue of waiting for this lock;
      
      	switch to next ready thread;
      
    } else {	// new
     		status = BUSY; 
    }

    interrupt_enabled;
}
```



```c++
void unlock() {
  	interrupt_disabled; 
  
    status = FREE;
  	if (any thread is waiting for this lock) {
      	move the waiting thread to ready queue
        status = BUSY;	//new
    } 

 	  interrupt_enabled;
}
```











### continuing sol 7: multiprocessor lock by `test_and_set`, with minimal busy waiting

recall 我们上次的 implementation:

```c++
void lock() {
    interrupts_disabled;
    while (test_and_set(guard)) {}	// new
    if (status != FREE) {
        add thread to queue of threads waiting for lock
        switch to next ready thread
    } else {
        status = BUSY;
    }
    guard = 0;	// new
    interrupts_enabled;
}
```



```c++
void unlock () {
    interrupts_disabled;
    while (test_and_set(guard)) {} // new
    status = FREE;
    if (any thread is waiting for this lock) {
        move waiting thread to ready queue
        status = BUSY;
    }
    guard = 0;	// new
    interrupts_enabled;
}
```

我们知道, `interrupts_disabled` 是保证自己的 CPU 运行这段代码时的 atomicity, 而我们这里加上的 spin lock by `test_and_set` 则是保证其他 CPU 不会干涉我们的 atomicity: 同一时间里只有一个 cpu 可以过这个 spin lock! 也就是说, 不会有多个 cpu 同时对一个锁进行 `lock`, `unlock` 的状态修改,

 

而现在我们分析新的 solution: 最长要 busy wait 多久? 

答案是: **至多别人跑完一个 `lock` 或者 `unlock` 的时间!** 也就是, 至多七八行代码的时间! 

看这很吓人但是其实, `guard` 只有在有某个 cpu 在运行 `lock`, `unlock` 的中间才会被改为 `1`, 但是在短短七八行代码之内, 即一个 `lock` 或者 `unlock` 被运行完之后就会被重新设为 `0`, 因而, spin lock 不会困住很久, 至多七八行代码的运行时间.

但是有一个额外的情况: 如果 `lock` 运行的时候别人 hold lock, 自己要 switch 怎么办呢? 这就和我们之前的 `interrupt_disabled` 是同一个道理: 需要我们在 os code 中自己保持 invariant: 在 switch context 后立马 set `guard=0`.



### multiprocessor switch invariant

recall uniprocessor switch invariant:

- When calling switch: interrupts must be disabled
- When switch returns: thread may assume interrupts are "still" disabled
- Remember: before running user code, interrupts must be enabled



而 multiprocessor switch invariant 是在这个基础上加上对 `guard` 的要求: 

- When calling switch: interrupts must be disabled, **且 `guard` 必须是 `1`** 

- When switch returns: thread may assume interrupts are "still" disabled, **且 `guard` 仍然为 `1`** 

- Remember: before running user code, interrupts must be enabled, **且 `guard` 必须为 0.**



我们发现这仍然很容易做到. 和刚才的三个情况相同.  一个 ready queue 中的 thread 在被重新 schedule 之前, 只有三种情况:

1. 它从来没被运行过, 是被初始化的, 第一次被 schedule (`getcontext`)
2. 它之前被 interrupt 了
3. 它自己在 cpu 上运行的时候, call 了 `swapcontext`

因而, 保持这三个 invariance 只需要:

1. 在 `thread_starter` 开头 call `interrupt_enabled` 并且 set `guard=0`

2. 在每次 os code `swapcontext` 后都 call `interrupt_enabled` 并且 set `guard =0`

   比如 yield:

   ```c++
   void thread::yield(){
   		//...
     	swapcontext(...);
     	interrupt_enabled();
     	guard =0;
   }
   ```

即可.



### 总结 lock solution

我们需要在 os code 中使用 low-level mechanisms to provide mutual exclusion for os code:

- Disable interrupts
- Spin lock (for multiprocessors)



而用户端, OS 则提供了 higher-level mechanism (locks) to provide mutual exclusion for user-level code: 其中 os 已经确保

- User code runs with interrupts enabled
- User code runs with no spin locks held (by that CPU)



#### 额外 problem: what if 没有 other threads to switch to?

我们已经 solve 了这一 hard problem: 如何 atomically add thread to a waiting list 并且 sleep (不 busy wait)

我们的解决方法是: **switch to other thread (obeying switch invariant**!

不过如果没有其他 thread 可以 switch to 呢?

我们如果不加处理肯定会报错 (没有 ready thread 可以 switch to), 所以我们需要判断这个条件. 不过如果没有其他 thread 可以 switch to 那么我们应该做什么? 答案是直接 put CPU to sleep in 低功耗的模式. 也就是 hardware 端的 HLT.

软件端, 我们使用 `interrupt_enable_suspend`:

1) enables interrupts on CPU that is calling this function
1) suspends the CPU that is calling this function until it receives an inter-processor interrupt (IPI) from another CPU. The CPU will ignore timer interrupts while suspended.





## Deaklock 

我们 make correct concurrent program by constraining schedues, 即 block 掉错误的 interleavings 只留下正确的 interleavings.

但是仍然有一个问题: over-constrain.

- A must happen before B
- B must happen before A

这种问题我们称为: deadlock

正式的定义就是: Deadlock 就是 cyclic waiting for resources.



关于 correctness, 有两种.

1. Safety: 所有发生的 actions 都必须是 correct 的
2. Liveness: actions 必须 keep occurring. 

Deadlock 违反的就是 liveness. 它使得 actions 无法继续 occur 了.



### wait-for graph

我们把 thread wait for 一个 resource 画为:

thread A -> resource A

把一个 thread hold 一个 resource 画为:

resource A -> thread A



那么查看下图:

<img src="assets/Screenshot 2025-06-23 at 20.51.31.png" alt="Screenshot 2025-06-23 at 20.51.31" style="zoom:50%;" />

thread A holding resource 2, waiting for resource 1

thread B holding resource 1, 想要 resource 2

那么 thread A 就会等待 thread B release,  但是 thread B 也在等待 thread A release, 于是形成了 cyclic waiting



就像是:

#### ex1: 十字路口堵车

<img src="assets/Screenshot 2025-06-23 at 20.53.38.png" alt="Screenshot 2025-06-23 at 20.53.38" style="zoom:50%;" />

没有车可以 move.

碰到这种情况怎么办呢

1. 让所有人都倒车, reverse it
2. 让一方暂时 change direction, 比如 turn right, 腾出空间让对方先走, 等到对方走了再回归正常 direction



#### ex2: 两个 mutexes

这是一个 deadlock ex: 两个 thread 按照这个顺序都被卡在了第二行结束.

<img src="assets/Screenshot 2025-06-23 at 21.04.30.png" alt="Screenshot 2025-06-23 at 21.04.30" style="zoom:50%;" />

<img src="assets/Screenshot 2025-06-23 at 21.05.45.png" alt="Screenshot 2025-06-23 at 21.05.45" style="zoom:50%;" />

#### ex3: 五个人五只筷子

<img src="assets/Screenshot 2025-06-23 at 21.08.52.png" alt="Screenshot 2025-06-23 at 21.08.52" style="zoom:50%;" />

algorithm:

<img src="assets/Screenshot 2025-06-23 at 21.09.05.png" alt="Screenshot 2025-06-23 at 21.09.05" style="zoom:50%;" />

但这也会 deadlock. 只要所有人都先拿起右边的筷子 (before 他们 wait for 左边的筷子), 那么他们没有人能拿到左边的筷子





### 如何处理 deadlock

Ways:

- 第一种策略: ignore it!

  这是最 typical 的 OS strategy.

  因为 deadlock 是 applications 自己的 bug, 责任不在 OS.

  且, deadlock threads consume no CPU time (因为两个 thread context 都 go to sleep and wait 了), 所以没什么消耗, 只是这两个 threads 本轮运行坏了.

- 第二种策略: detect and fix by killing thread

  Look for cycles in wait-for graph.

  然后 fix by **killing one of the threads** involved in the deadlock, restart it.

  但是, 这也不是一种 great fix. 因为可能仍然有 broken invariant. (毕竟 deadlock in the first place)

- 第三种策略: detect and fix by reversing

  对于其中一个 thread involved in the deadlock, 把它的 actions roll back (undo), 然后 try it again.

  这种 fix 要好一些, 不过也有问题: 未必能修复这个 deadlock, 因为有些操作不能 undo. 只有像 a++ -> a-- 这种简单的操作可以.

- 第四种策略: prevention,

  在一开始就不要让 deadlock 发生.



我们详细展开第四种策略.

### prevention: 四个 necessary conditions for deadlock

- limited resources

  如果资源无限, 那么根本不用 waiting for resources

- no preemption

  **有 preemption 就不会有 indefinite waiting**, 因为我们可以 force threads to give up resources.

- hold and wait

  deadlock 的一个前提就是: 某个 thread **wait while holding resources** 了

  如果都像 cv.wait 一样, 在 go to sleep 前 release 自己 hold 的 resource, 那么就不会有 deadlock

  图论上, no hold and wait 就不会有 multi-edge path in wait-for graph

- cycle of hold-wait request

  hold and wait 本身也未必会导致 deadlock, 而是伴随着这个事件: **两个 hold and wait 的 thread 套娃 (cycle) 了, wait 的是彼此 hold 的资源.**







如何 eliminate limited resources? 简单, create more resources 就行.

不过这当然是废话. only works if doable



如何 eliminate no preemption?

打开 preemption! (interrupt_disabled) 

preemptable resources 不会导致 deadlock 的. 比如 memory



如何 eliminate hold and wait? 

next lec

