<img src="assets/Screenshot 2025-06-16 at 12.51.40.png" alt="Screenshot 2025-06-16 at 12.51.40" style="zoom:50%;" />



Lec 9&10: implementation of `lock` 和 `unlock` (mutex)



## Lock implementation (uniprocessor)

recall: 我们已经知道, 这两部分必须是 atomic 的, 才能避免 interface 被打破:

<img src="assets/Screenshot 2025-06-16 at 13.15.49.png" alt="Screenshot 2025-06-16 at 13.15.49" style="zoom:50%;" />



今天我们陈述为什么它们是 atomic 的: 如何实现.





首先看错误的实现方式:

```c++
void lock() {
    while (status != FREE) {
    }
    status = BUSY
}

void unlock () {
  	status = FREE;
}
```

这段代码的问题: 中间可以随便插入. 由于对 loop 没有保护, 两个 thread 可以同时上锁, 然后一起执行 (thread A 在 FREE 的时候过了 loop, 然后还没有 set BUSY 就被 interrupt, 另一个 thread B 也过了 loop)

因而, 我们要让至少 **<进入循环判断条件为 fasle (不循环) -> 设置新状态 (BUSY)>** 的行为是 atomic 的.





### 思路



Uses shared data
$\rightarrow$ The code that implements these operations must be thread safe



Use synchronization (mutual exclusion, ordering) to implement synchronization ?!

- Can't use the normal high-level synchronization operations
- 因而我们需要直接使用 hardware 提供的 atomic operatiols, e.g, atomiglaad, atemiss style, etc.







Disadvantage

- OS code can't use high-level synchronization operations, since it is implementing these



Advantages

- OS trusts its own code (OS doesn't trust user code)
- OS controls the hardware (e.g., CPU)





What breaks atomicity for a section of code?

- Code may call yield, etc.
- An interrupt may occur
- Another processor may execute instructions

记住: 我们无法使用 mutex, semaphore (它们依赖于我们这里要写的 os code)



对于第一第二个问题: 我们可以自己解决: don't do this

- 不要在我们 implement 需要 atomicity 的 os code 上 call `yield` 

- 对于 os code 的 critical section, 请先 disable interrupts

  ```c++
  interrupt_disabled;
  //..
  interrupt_enabled;
  ```

  Notice: 对于 user code, 必须 run with interrupt enabled! 因为我们不 trust user code. 只有 os code 可以有这个结构.

第三个问题: 我们下一个 lec 将 handle this.





这对吗

### sol 0 (wrong): deadlock

```c++
lock () {
    interrupt_disabled;
    while (status != FREE) {}
    status = BUSY;
    interrupt_enabled;
}
```



```c++
unlock() {
    interrupt_disabled;
    status = FREE;
    interrupt_enabled;
}
```

不对. wait with lock held 了. `lock` 之后, 如果只有一个 cpu, 那么就卡死了, 没有机会 `unlock`.

所以我们故技重施, 用之前学到的 trick:







### sol 1 (correct): busy waiting

```c++
void lock () {
    interrupt_disabled;
    while (status != FREE) {
      interrupt_enabled;
      interrupt_disabled;
    }
    status = BUSY;
    interrupt_enabled;
}
```



```c++
void unlock() {
    interrupt_disabled;
    status = FREE;
    interrupt_enabled;
}
```

这是我们在学 cv 的时候的 busy waiting 逻辑, 是对的. 在 while 中间我们给出了空隙让 `unlock` 插入 (hopefully: 某个 interrupt 可以插入, 使得 hopefully unlock 在插入的 thread 里).

这个 solution 不会打破 atomicity. **因为当循环条件 false (跳过循环) 的情况, 这个行为是 atomic 的, 即不会有多个 thread 同时上锁; 而当循环条件为 true 的情况, 这个时候任何 call lock 的 thread 都会被卡在同样的位置并允许其他 thread 插入给出 unlock.**

正确的 solution, 不过 busy.





### efficient sol 2 (problematic): 通过 switching threads 来 avoid busy waiting 

也是和 cv 相似的逻辑. 我们不要 cpu 一直跑这个 while 循环并在中间切换 thread 尝试 unlock, 而是跑第一次就把原本的 thread A 放进一个 waiting queue 里 (这个 mutex 的 waiting queue), 然后直接 switch 其他 thread B, 等到在 unlock 的时候把这个原本的 thread A 取出 waiting queue 放入 ready queue (相当于 signal)

### 

```c++
void lock () {
    interrupt_disabled; 
 		// <>
    while (status != FREE) {
      interrupt_enabled;
      
      add thread to queue of waiting for this lock;
      switch to next ready thread;
       
      interrupt_disabled;
    }
    status = BUSY;
  	// <>
    interrupt_enabled;
}
```



```c++
void unlock() {
    interrupt_disabled;
    status = FREE;
  	if (any thread is waiting for this lock) {
      	move waiting thread to ready queue
    } 
    interrupt_enabled;
}
```



这个 solution 有一定问题: when to re-enable interrupts? 

#### problem: add thread to waiting queue 不 atomic

我们在 add thread to waiting queue for the lock 之前就 enable 了 interrupt, 但是问题是 add thread to waiting queue 这个行为不是 atomic 的

比如: 在 

```c++
interrupt_enabled;
//... unlocked     
add thread to queue of waiting for this lock;
```

这个位置, 如果 unlock 插入中间, 把 STATUS 变成了 FREE 的, 那么接下来回到这个 thread, 它就在 status FREE 的前提下把 thread 放进了 waiting queue for this lock 里面. 

这是不好的. 因为如果之后不再有 thread unlock (等于说错过了刚才的 unlock)  那么这个 thread 就被困住了.



因而, 我们需要让 add thread to waiting queue for the lock 这个行为不被打断. 于是把 enable interrupt 放在它之后. 









### efficient sol 3 (problematic): 交换 add waiting queue 和 enable interrupt

```c++
void lock () {
    interrupt_disabled; 
 		// <>
    while (status != FREE) {
      add thread to queue of waiting for this lock;
      // <>
      interrupt_enabled;
      switch to next ready thread;
      interrupt_disabled;
      // <>
    }
    status = BUSY;
  	// <>
    interrupt_enabled;
}
```

但是仍然有 (很大) 问题: 考虑这个例子.

#### problem: 主动 switch context 前先被 interrupt, 导致一个 thread 同时在两个 queue 里

1. thread L runnning

2. thread L call lock (already locked), 加入了 lock waiting queue.

3. thread L enable interrupts.

4. 一个 time interrupt 进入, **在 thread L 主动和 thread U switch 之前就 yield 给了 thread U**, 把 thread L 放进了 ready queue! 

   <img src="assets/Screenshot 2025-06-17 at 04.21.34.png" alt="Screenshot 2025-06-17 at 04.21.34" style="zoom:50%;" />

   这里已经很不对劲了. **一个 thread 同时在两个 queue 里.** 

5. thread U call 了 unlock, 于是把 thread L 从 lock waiting queue 转给了 ready queue. 于是 ready queue 里有了两个 thread L! break

   <img src="assets/Screenshot 2025-06-17 at 04.23.39.png" alt="Screenshot 2025-06-17 at 04.23.39" style="zoom:33%;" />

这个时候我们发现: 因此, **不可以在 switch context 前就 enable interrupt.**

也就是说, 我们在 calling switch 前必须 leave interrupt_disabled.





### correct and efficient sol 4: leave interrupt_disabled before switching

```c++
void lock () {
    interrupt_disabled; 
 		// <>
    while (status != FREE) {
      add thread to queue of waiting for this lock;
      
      switch to next ready thread;
      
    }
    status = BUSY;
  	// <>
    interrupt_enabled;
}
```



```c++
void unlock() {
  	interrupt_disabled; 
  	// <>
    status = FREE;
  	if (any thread is waiting for this lock) {
      	move the waiting thread to ready queue
    } 
  	// <>
 	  interrupt_enabled;
}
```



#### **switch invariant** (for uniprocessors)

1. 所有 threads 都需要保证在 call switch 的时候已经 have interrupts disabled 了! (yield, lock)
2. 对应地, 所有 threads 都可以 assume, 在 switch returns 的时候, interrupts 仍然是 disabled 的

eg:

<img src="assets/Screenshot 2025-06-17 at 04.45.17.png" alt="Screenshot 2025-06-17 at 04.45.17" style="zoom:50%;" />

我们发现在这个原则下: 整体的 os code 其实比较好看. 这些函数都可以保持开头都是 disable interrupt, 结尾都是 enable interrupt (for thread safety)



### corrent and efficient and fair sol 5 by handoff

虽然这个 sol 已经 correct, 但是我们仍然需要 

remember lock 的 interface: 第一个 call lock 的 thread 可以直接继续运行, 在 unlock 前其他 call lock 的 thread 只能堵塞住 (等在 waiting queue 里)

而 unlock 之后, 其他被这个 lock 堵塞的 threads 应当被允许抢 lock, 但是仍然只有一个 thread 可以 grab lock, (然后 lock 重新变为 busy 所以)其余的 threads 还得继续等着.



我们的代码还有一个小的, 虽然 correct 但是值得一提的问题: 就是我们在 unlock 之后, 下一个 ready threads 如果这个时候 call lock 那么将可以先运行.

**而我们更希望 fairness: 原先的第二个 call lock, 即首先被堵塞在 waiting queue 里的 thread, 应该先 grab the lock 并运行, 而不是某个幸运的正好在 call unlock 的 thread (probably 第一个 call lock 的 thread) yield 之后下一个运行, 并 call lock 的新 thread (这件事很可能发生).**



因而我们可以利用这个 handoff 的做法: 让 `unlock`, 在 waiting thread 里有东西的前提下, call 把它放入 ready queue 后重新恢复 busy 状态.

这样, **这个 waiting thread 就能够在其他想 grab lock 的 ready threads grab lock 之前抢先 grab 到 lock, 真正实现 FIFO.**

我们利用的是这个 interface 的要求: 一个 lock 必须接一个 unlock, 不然应当堵塞住. 所以当目前已经 lock 住, 又已经有一个另外的 thread 被 lock 卡住的前提下, unlock 之后重新设为 busy 是合理的, 因为这个被卡住的 thread 在拿到 lock 之后也会设为 busy. 

代码:

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



至此, 我们完美地解决了 lock 的 atomicity break 的前两个情况:

- code may call `yield`

  Sol: 需要 atomicity 的 os function 中不要 call `yield`

- an interrupt may occur

  Sol: disable interrupts around critical sections, 并通过 switch 来把 responsibility handoff 给下个 thread (leave interrupt_disabled before switching)

第三个问题, 只有 multiprocessor 需要考虑:

- 另一个 processor 可能会 exucute instructions 改变 shared resource that we are executing in the critical section

















## Lock implementation (Multiprocessor)

我们的 interrupt_disabled 是针对一个 cpu 的. 只能让运行这个指令的 cpu disable interrupt.

所以, 对于 multi cpus, 这个行为不能提供 atomicity.

比如说:

```
CPU 0                 | CPU 1
----------------------|-------------------
read x = 0 (to r1)    | read x = 0 (to r2)
r1 = r1 + 1           | r2 = r2 + 1
write r1 -> x (x=1)   | write r2 -> x (x=1 again!)
```

本该变成 2 的 `x`，仍然是 1



What about: 使用 atomic load and store?

可以但是比较麻烦.



现代的 processors 在硬件层面都会提供一个操作 that mekes it easier: 

```c++
test_and_set(X);
```

这就是这个操作的软件层 interface. 它是一个 atomic load+store. 它做的事情是:

```c++
test_and_set(X) {
 		// <atomic>
		old = X;
		X = 1;
  	// <atomic>
		return old;
}
```

读取某个 memory location 上的值, 返回它当前值并把它设置为 1.



这个东西的用处就在于: 可以用在 STATUS 的修改上! 也就是说 lock

如果多个 threads 同时运行对一个 bool 值进行修改 false(0) -> true(1), 

所有的操作的修改都是相同的, 所以互不影响, 但是由于 atomicity of the read&write, 最后只有一个能够 return 原本的 STATUS  `1` (false), 那就是最后修改成功, 真正 grab lock 的 thread. 这就是 winner.

这个行为的意义就在于: 其实谁 grab 到 lock 并不重要, 但是能够确保只有一个人拿到 lock, 继续运行下去, 很重要. 我们可以用这个逻辑来实现 multiprocessor 的 busy waiting:

### sol 6: busy waiting sol of multiprocessor lock by `test_and_set`

```c++
void lock () {
    while (test_and_set(status) == 1){}
}
```



```c++
void unlock() {
    status = 0
}
```

这里 status = 0 表示 free, 1 表示 busy.



简单的代码, 但是能够保证即便多个 processors 操控一个 lock 也不会冲突. 这就是 **spin lock**



遗憾的是对于 multiprocessors, 有些 busy waiting 是不可避免的. 我们又是不得不 busy wait.



不过我们可以 minimize busy waiting 的时间:





### sol 7: multiprocessor lock by `test_and_set`, with minimal busy waiting

我们把我们的 single processor 的最终 sol 5 和 `test_and_set` 结合起来, 去形成最终的 sol.

Idea: use busy waiting only in kernel code, 并且保证这不会 too long

非常简单: 我们在 `lock`, `unlock` 里面各加上两行一样的代码: 释放 spin lock 和解开 spin lock.

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



我们知道, `interrupts_disabled` 是保证自己的 CPU 运行这段代码时的 atomicity, 而我们这里加上的 spin lock by `test_and_set` 则是保证其他 CPU 不会干涉我们的 atomicity.



先前我们的 busy waiting sol 6, 一个 cpu 的 `lock` 一旦被其他 cpu 占有, 会一直busy wait 到其他 cpu 运行 `unlock` 才继续运行. 这一个最原始的 spin lock, 会等待很长时间.

而我们这个 solution 利用一个 global variable `guard`.

具体分析: next lec.



