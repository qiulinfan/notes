## reader and writer lock

当多人一起共享一个内容时, 其中有一些人想要 write 它, 有一些人想要 read 它.

只想要 read 它的人, 多少个也无所谓, 可以同时访问; 

想要 write 的人, 在同一时间只能有一个, 并且其他人甚至不应该能访问这个内容.

因而单纯的 mutex 的 `lock`, `unlock` 在这个情景下并不 work 了. 我们需要更加 higher-level 的操作. 这就是 reader 和 writer lock.

- reader lock: Allow multiple concurrent readers, if no threads are writing data
- writer lock: Allow a single writer, if no other threads are reading or writing

<img src="assets/Screenshot 2025-06-04 at 00.44.55.png" alt="Screenshot 2025-06-04 at 00.44.55" style="zoom:50%;" />

**今天我们用 monitor 来实现 reader 和 writer lock!** 因而, reader 和 writer lock 既是**一种 higher level synchronization operation**s, 同时自身**也是一个 monitor program! **.

<img src="assets/Screenshot 2025-06-04 at 00.37.56.png" alt="Screenshot 2025-06-04 at 00.37.56" style="zoom:67%;" />

(因而我们可以用 monitor 来 build higher level synchronization operations)







### To build reader and writer locks out of monitor



- Step 1: What shared data is needed to implement `readerLock`, `readerUnlock`, `writerLock`, `writerUnlock`?

  对于一个 thread, 我们需要 keep track of other threads: who else is doing what?

  因而我们需要:

  - `numReaders`, 
  - `numWriters`.

- Step 2: Assign locks to shared state:

  我们需要:

  - `mutex rwLock`

- Step 3: List the before-after conditions and assign a condition variable for each condition

  条件, 以及因而需要的 condition variables:

  - `readerLock` 必须 wait, while `numWriters > 0`

    因而我们需要: `cv waitingReaders`

  - `writerLock` 必须 wait, while `numWriters > 0 || numReaders > 0 `

    因而我们需要: `cv waitingWriters`





### 读写锁的基本 implementation

```c++
int numReaders, numWriters;
mutex rwLock;
cv waitingReaders, waitingWriters;
```



Reader:

```c++
void readerLock() {
	rwLock.lock();
  // 有人在 write 必须等待写完
  while (numWriters > 0) {
    waitingReaders.wait(rwLock);
  }
  numReaders++;
  rwLock.unlock();
}

void readerUnlock() {
  rwLock.lock();
  numReaders--;
  // 少了一个 reader -> 对于 writers 而言是值得注意的事情! 可以 wake 一下 writer 看看 (没必要多个, 因为 writer 只能共存一个)! 如果正好没有 readers 和 writers 了, 那么这个 writer 就有机会写了
  waitingWriters.signal();
  waitingReaders.broadcast();
  rwLock.unlock();
}

```

Writer:

```c++
void writerLock() {
	rwLock.lock();
  // 当已经有其他人在访问时, writer 就得 wait 了.
  while (numWriters > ) || numReaders > 0) {
		waitingWriters.wait(rwLock);
  }
  numWriters++;
  rwLock.unlock();
}

void writerUnlock() {
  rwLock.lock();
  numWriters--;
  // 少了一个 wrtier -> 对于 readers 和 writers 而言都是值得注意的事情! 可以 wake 下一个 writer, 以及全体 writers. 如果当前没有其他 writer -> 所有 readers 都可以读了; 如果正好当前没有其他 readers -> 下一个 writer 可以写了!
  waitWriters.signal();
  waitingReaders.broadcast();
  
  rwLock.unlock();
  
}
```



对比我们的 reader, writer 的 lock, unlock 与最基本的互斥锁 mutex 的 lock, unlock:

mutex 的 lock, unlock 是: 同一时间段只有一个 thread 可 unlock

而我们的 `readerLock`, `writerLock`  可以多个 threads 同时 unlock, 但是前提是在一定条件下. 这两个 locks 表示一个快速的检查: 通过 mutex 和 cv 的配合拦截和放入 threads, 进行排队





question: 

1. `readerUnlock` 是否 always 需要 `signal`? 

   答案: 其实不用. 好的办法是: 当我是最后一个 reader 时, signal 一下

   ```c++
   if (numReaders == 0) {
   	waitingWriters.signal();
   }
   ```

   记得上次我们的 thread-safe queue, 相似的问题我们的回答是不可以 (夺走 node).

   但是这里情景不同. 这里, writer thread 只有在真的没有 reader 的时候才可以被唤醒. 所以, 即便 `signal` 之后半路蹦出来一个 reader, 也不影响原先的 `signal` 的正确性 (这个 writer 只是不得不回去重睡了而已)

2. 当一个 writer finish 的时候, 如果有 several waiting readers 和 writers, 接下来会如何? 

   答: 我们的代码写的是, 先 `signal` 一个 writer 再 `broadcast` 所有 readers.

   但是我们仍然不能断定顺序, 因为 threads 的运行速度不同 (唤醒顺序确定, 但是它们醒来的速度不确定), 所以其实所有的 writer threads 和 reader threads 都有希望 acquire lock, 然后成为下一个 unlock 结束的.

   (并且, 如果接下来一个 writer 先 wake 则其他 threads 都被 block; 如果一个 reader 先 wake 则其他 readers 接下来仍可进入)





## semaphore intro

多线程编程就是要 synchronization, which 分为两种: mutual exclusion 和 ordering. 我们可以用 lower-level atomic operations 来实现 (load, store), 但是很复杂. 所以我们 implement 了 higher level 的 tools: mutex 和 condition variables. 

但是其实还有更多的 tools. 如果说 mutex 和 condition variables 是最常见的, 那么第三常见的就是 semaphore. 

semaphore 可以是做更加 generalized 的 lock, unlock.



### idea of (counting) semaphore

它含有一个 **非负的 int (user-specified)**, 即 **semaphore value**

`down()`: **wai**t for the semaphore value to **become positive**, 然后 **decrement it by 1**. (因而, semaphore value 被确保永远都不会是负的)

简化代码:

```c++
while (1) {
	if (value > 0) {
		value--;
		break;
	}
}
```

但是, 这段 implementation, without 额外声明 of atomicity, 是错的.

因为比方说如果两个 thread 一起 run it, 并同时 decrement it, 那么它就 negative 了, 打破了 interface.

因而我们需要:

```c++
while (1) {
  // <atomic>
	if (value > 0) {
		value--;
  // <atomic>
		break;
	}
}
```

确保这一段代码是 atomic 的.

`up()`: 单纯地 increment semaphore value by 1.

```c++
value++; // <atomic>
```

同样, 我们需要这个 increment 是 atomic 的. (注意, 如果只有 atomic load,store, 那么不能说明它 atomic!)

这两段代码中间 atomic 的部分为什么 atomic, 之后的 lectures 我们会知道的.







### 使用 (binary) semaphore 来实现 mutual exclusion (等价于 mutex)

我们发现, 如果一个 semaphore 的 semaphore value 只有 0/1 

(semaphore 本身是没有最大值的, 除了 C++20 的 `std::counting_semaphore<N>` 可以做到. 这里的意思是, 你的代码能确保 semaphore 的值不会超过 1), 那么

```c++
semaphore sem(1)
sem.down()
// <critical section>
sem.up()
```

就等价于

```c++
mutex m;
m.lock;
// <critical section>
m.unlock;
```

这样用, `up` 就等价于 `lock`, `down` 就等价于 `unlock`. 

事实上我们可以发现: 只要初始值为 1, 先 down 后 up 并且所有 down 都对应一个 up, 那么这个 semaphore 的作用就可以等价为 mutex.





### 使用 semaphore 来 enforce ordering

同时, binary semaphore 也可以 enforce ordering.

(这里只是一个例子)

```c++
semaphore sem(0);
```

A:

```c++
// thread A
task A
sem.up();
```

B:

```c++
// thread B
sem.down();
task B
```

我们可以通过设置初始值和合理的代码, 让临界情况时 `sem` 的 value 为 0! 

此时,  `sem.up()` 必须要在 `sem.down()` 之前执行, 从而 enforce 了 task A 必须在 task B 前执行.

(不过, 这里我们使用的 `down` 的实现方法, 会造成 busy waiting, 因为 waiting thread 一直困在判断 `if value > 0` 的 while loop 中. 有更加好的使用 wait queue 的 `down` 实现方式. )



现在, 我们应用刚才讲的使用 semaphore 实现 mutual exclusion 和 ordering 的方法, 实现一个 producer-consumer 程序!

### producer-consumer with semaphores

As always, think about shared data, mutual exclusion, and before-after constraints

Semaphores:

- `mtx` : for exclusive access to coke machine
- `fullSlots`: counts number of cokes in machine
- `emptySlots`: counts number of empty slots in machine

（正反都有上限, 到达上限都要 wait, 但是 semaphore 只有到 0 这个下限才会 wait, 没有上限; 因而我们**不得不设置两个 counting semaphore**, 它们的值的总和总是 `CAPACITY`）

Before-after constraints:

- Consumer must wait if no cokes in machine

  因而这个时候需要用: 

  ```c++
  fullSlots.down();
  ```

- Producer must wait if machine is full

  因而这个时候需要用:

  ```c++
  emptySlots.down();
  ```





现在我们尝试实现: 

#### problematic solution 1 (显然)

```c++
semaphore mtx(1);
semaphore fullSlots(0);
semaphore emptySlots (capacity);
```

Producer:

```c++
producer {
	mtx.down();
  
  // <critical section>
	emptySlots.down();
	// add coke to machine
	fullSlots.up();
  // <critical section>
  
	mtx.up();
}
```

Consumer:

```c++
consumer {
	mtx.down();
  
  // <critical section>
	fullSlots.down();
	// add coke to machine
	emptySlots.up();
  // <critical section>
  
	mtx.up();
}
```



但是, 这个尝试有点问题. 

我们 waiting with mutex held 了. 当, 比如说, 由于 fullSlot 为 0 而 wait 的时候, 我们的 mtx 也困住了, 让 producer thread 无法开始, 因而永远无法加 coke, 死循环了.

因而我们的解决方法是: 交换第一第二行的两个 down! 因为第一行的 down 可以给对方解围: 让对方 thread, 如果此时正因为数量限制被困住, 可以脱困, 完成运行并打开 mtx 让本 thread 继续运行.

相当于贷款, 但是一定能马上还上.

#### 正确 solution

Producer:

```c++
producer {
  emptySlots.down();
	mtx.down();
  
  // <critical section>
	// add coke to machine
	fullSlots.up();
  // <critical section>
  
	mtx.up();
}
```

Consumer:

```c++
consumer {
  fullSlots.down();
  mtx.down();
  
  // <critical section>
	// add coke to machine
	emptySlots.up();
  // <critical section>
  
	mtx.up();
}
```





这可能有点怪, 但是其实是正确的.

我们假设: 一个 consumer 困住了 (被 `fullSlots`), 这个时候其他 consumer 如果来, 也会被在开头阻塞住.

这个时候, 只能等到一个 producer 来, 才能解围.

由于所有 consumers 都还在被困在第一个锁, 这个 producer 会先 grab mtx lock, 然后一直运行完. 在它运行期间, 某一个幸运 consumer 的第一个锁会被解开, 从而顺利得到 mtx, 接着运行.



代码正确的核心原因就是, 

1. 放给对方类 thread 准入权限的 `up`, 被 critical section 给保护起来了. 

   当对方类 thread 由于资源上限被不准入时, 它必须等我我们的 thread 完全运行完, 才可以放入一个运行. 因而对方类 thread 不会突然 grab lock!

2. add/decrease coke 的行为, 也被 critical section 给保护起来了

   因而一开始的 `down` 其实相当于一个预订! 它的确在 lock 之前就先做了一部分事情, 但是并不要紧, 因为它并没有把 "coke 数量" 这个 interface 在无锁的时候修改! 因而 coke 的数量始终保持在 0 to`CAPACITY` 之间, 并且只有在对应行为运行完时才改变!

这样, 所有 threads 都在排队运行, 不会有 thread 在自己理应被限制的情况下 grab lock; 并且最重要的, coke 的 interface 没有被打破, 数量被限制在 0 to`CAPACITY` 之间, 并且只有在 produce / consume 的行为完成后才会更改.



#### problematic solution 2 

对应我们刚刚的分析, 我们看看如果不按照我们分析的做会怎么样:

如果我们更改一下代码, 把 (给予对方类 thread 权限的) `up` 也放到 grab mutex 的前面呢? 

```c++
producer {
    emptySlots.down();
    fullSlots.up();
  
    mtx.down()
    // add coke to machine
    mtx.up();
}
```

那么, 考虑这个情况: Cokes 耗完了, consumers 被 `fullSlots.down()` 堵塞住, 等待一个 producer

这个时候, 一个 producer 运行, 运行到 `fullSlots.up()` 给了 consumers 准入权限, 但是在 grab mutex 之前, 被首先抢到权限的那个 consumer 又更快地 grab 到了, 那么它就会 `--` 现在已经 0 个的 coke, 打破 interface, 并且接着让 `emptySlots` 的值超过 `CAPACITY` 一位, 也打破 Interface.





对比 monitor 和 semaphore 对 producer-consumer 程序的实现, 我们发现, monitor 更加简洁, semaphore 更加复杂

semaphore 作为基石去实现 synchronization, 需要一些 elegant thinking. 

| 特性     | Monitor        | Semaphore                        |
| -------- | -------------- | -------------------------------- |
| 抽象层级 | 高级抽象       | 低级原语                         |
| 使用难度 | 简单，结构清晰 | 复杂，需要手动管理同步关系       |
| 错误风险 | 低（封装好）   | 高（易 deadlock 或 signal 失败） |
| 可读性   | 高             | 中等偏低                         |

