# thread-safe queue 

## thread safe queue with mutex

recall queue 的实现:

```c++
void enqueue(node* new_element) {
    node* ptr;
    // find tail of queue
    for (ptr = head; ptr->next != NULL; ptr = ptr->next) {}
    // add new element to tail of queue
    ptr->next = new_element;
    new_element->next = NULL;
}


node* dequeue() {
    node* ptr = NULL;
    // if something on queue, then remove it
    if (head->next != NULL) {
        ptr = head->next;
        head->next = head->next->next;
}
```





这是个 correct queue (假设 enqueue, dequeue 的顺序不重要, 只要 either one gets it), 但却不是一个 safe queue, 当存在 multiple threads share 这个 queue 时.

最显然的问题: **如果 enqueue 的 for (移动 ptr 到 tail) 和 dequeue 的 remove 混了怎么办?** 我们很可能 remove 错误的元素.



因而, 首先肯定要确保 enqueue 和 dequeue 的过程中是没有其他操作的, 尽量让它变得 atomic. (lock 起来)







```c++
mutex queueMutex;
void enqueue (node* new_element) {
    queueMutex.lock();	
  	//<>
    node* ptr;
    for (ptr=head; ptr->next != NULL; ptr = ptr->next) {}
    ptr->next = new_element;
    new_element->next = NULL; 
  	//<>
    queueMutex.unlock();
}
node* dequeue() {
    queueMutex.lock(); 
  	//<>
    node* ptr = NULL;
    if (head->next != NULL) {
        ptr = head->next;
        head->next = head->next->next;
    }
  	//<>
    queueMutex.unlock(); 
    return(ptr);
}
```









## Thread-safety invariants

### 反例: 提前 unlock 使得 implementation 不再 thread-safe

提问: 我们是否能再减小 critical section 区域, 把 unlock 行为前移呢? 

假设我们把 unlock 前移一格:

```c++
mutex queueMutex;
void enqueue (node* new_element) {
    queueMutex.lock();	
  	//<>
    node* ptr;
    for (ptr=head; ptr->next != NULL; ptr = ptr->next) {}
    ptr->next = new_element;
    //<>
    queueMutex.unlock();
    new_element->next = NULL; 
}
```

这个时候, 如果 enqueue unlock 完来一个 dequeue, 我们可以验证是没问题的; 但是我们会发现一个问题: 如果 enqueue unlock 完再来个 enqueue, 并且 thread 速度更快 (比 `new_element->next = NULL; ` 更快速执行), 那么, 由于刚才的 `new_element` 的 `next` pointer 还没有被设定为 `NULL` (目前指在内存中的随机的 garbage location), 我们新 enqueue 的 `ptr->next != NULL` 的判定条件就会判定不到, 从而 undefined behavior. 

于是出现了 Hessianbug.

> 正确:
>
><img src="assets/Screenshot 2025-05-29 at 01.38.36.png" alt="Screenshot 2025-05-29 at 01.38.36" style="zoom:50%;" />
>
>错误: 
>
><img src="assets/Screenshot 2025-05-29 at 01.39.10.png" alt="Screenshot 2025-05-29 at 01.39.10" style="zoom:50%;" />





借由这个反例: 什么时候我们可以 unlock thread 呢? 仅当 queue 在 safe state 时.

**"Safe state" 就是我们说的 Thread-safety invariants: 对于我们要求的场景, 总是 true 的事情.**

比方说: 在上述场景中, 作为一个 linked list, 每个 node 都必须 apper exactly once, 以及 last node 必须指向 NULL, 就是 invariant   



注意: invariants **并非一直要是 true 的, 而是在 lock 被打开时必须是 true 的**. 

意思是说**我们只有在 invariants 确保 true 了之后才可以打开 lock.** (但是在 lock held 期间内可以短暂地 false)

再换句话说: **只有正在 holding lock 的 thread 可以 break invariants.**

一个好的建议是: hold lock whenever 操控共享数据.

即便你的 thread 对 invariantes 只是在 read, 你也要 lock. 这是因为, 其他 thread (其他代码) 可能会在你 read 时改变它. 







### fine-grained locking: 需要 hand-over-hand

一个在 project 4 中会有用的技术:

我们考虑 fine-grained locking: instead of 对于整个 queue 使用一个 lock, 我们可以更加 fine-grained: 对于每个 node 都使用一个 lock.

这样精细化的好处是: 单个 lock 的范围更小, 更加灵活。

当我们 lock 住一个 node 的相关操作时, 空余的 threads 可以对其他不相干的 nodes 做操作, 增加了效率. 这是类似“只锁自己家门” vs “全小区只有一个大门”的区别。



我们查看下面这个流程:  (为了简洁, 我们这里使用和每个 node 名字相同的 nodelock 名, 但是实际肯定不同)

<img src="assets/Screenshot 2025-06-01 at 13.50.58.png" alt="Screenshot 2025-06-01 at 13.50.58" style="zoom:50%;" />

可以发现一个问题: 在 unlock A 和 lock B 中间, 这一段是不安全的: B 的锁此时是打开的, 很容易在中间插入破坏 B 的操作 

(这里我们的代码想要的是: 先连续 traverse 这些 nodes 作为一个整体操作, 然后其他 threads 再做其他操作, 但是这个漏洞导致其他操作可能闯入到 traverse to B 的时间, 对 B 进行修改, 比如把它删了, 使得整个程序出错, 可能会 memory leak 或者 invalid access 等) 



Example: 假设有两个 threads 同时 visit 这个 linked list, 一个 traverse, 一个修改一个 node.

Thread 1:

```c++
lock(A)
... // do something
unlock(A)
lock(B)
```

Thread 2:

```c++
lock(B)
... // modifies or deletes B
 线程 1 在 unlock(A) 之后，还没来得及 lock(B)，**B 就被线程 2 改了**，甚至删除了！
```

这样线程 1 后面对 B 的访问就是 dangling pointer 访问，会造成 segfault 或 data race. 



因而我们有一个做法叫 **hand-over-hand locking:** **先锁住下一个 node, 再打开这个 node 的锁.**

<img src="assets/Screenshot 2025-06-01 at 14.05.05.png" alt="Screenshot 2025-06-01 at 14.05.05" style="zoom: 50%;" />





# another thread-safe queue: `dequeue` wait if queue empty

我们现在已经有一个 descent 的 thread-safe queue 了.

但是, 我们还可以把它做得更好: 

目前, 如果 queue 是 empty 的, 那么 `dequeue` 仅仅只是 return `null` 而不做任何其他事情.

但是: **如果我们想要 change interface, 让 `dequeue` 在 queue empty 时 wait 呢?**



基础的操作是这样的: if null, don't just return null, but wait

```c++
node* dequeue() {
    // wait for queue to be non-empty
    while(head->next == NULL) {}
    queueMutex.lock();
    // remove element
    ptr = head->next;
    head->next = head->next->next;
    queueMutex.unlock();
    return(ptr);
}
```

但是, 当然, 这里会出现 synchronization 问题: 

在等到一个新的 node enqueue 进来之后, lock 之前, 

```c++
// wait for queue to be non-empty
while(head->next == NULL) {}
// *
queueMutex.lock();
// remove element
```

`*` 的位置, 可以出现另一个 dequeue, 把刚刚 enqueue 进来的 node 给 de 掉.

从而仍然打破了我们这个 "`dequeue` wait if queue empty" 的 interface.



那么如果我们把 `lock()`  和 `while(...) {}` 的等待过程换一下呢？ 

```c++
node* dequeue() {
    queueMutex.lock();
    // wait for queue to be non-empty
    while(head->next == NULL) {}
    // remove element
    ptr = head->next;
    head->next = head->next->next;
    queueMutex.unlock();
    return(ptr);
}
```

那就更不对了, 因为 enqueue 也有 lock, 于是被卡在了 critical section, 那就永远被卡在  `while(...) {}` 的等待过程, 没有 enqueue 能进来了.



## busy-waiting solution

下面是一个 working solution:

在   `while(...) {}` 的等待过程中, release lock 并紧接着再次 lock 住, 留出中间的缝隙, 让 enqueue 进来。

```c++
node* dequeue() {
    queueMutex.lock();
    // wait for queue to be non-empty
    while(head->next == NULL) {
      queueMutex.unlock();
      queueMutex.lock();
    }
    // remove element
    ptr = head->next;
    head->next = head->next->next;
    queueMutex.unlock();
    return(ptr);
}
```

这样, 即便在

```c++
queueMutex.unlock();
queueMutex.lock();
```

中间有 enqueue, dequeue 插入进来, while loop 的条件仍然奏效 (过后仍然 empty), 因而保持了总体的 dequeue 仅在 empty 时插入进来 

(虽然多个 dequeue 的运行顺序可能会被偷鸡置换, 但是无所谓, 总体的 enqueue 和 dequeue 数量是相等的.) 

从而实现了 interface.

(如果 dequeue 的 thread 运行指令总是比 enqueue 更快, 导致 enqueue 无法插入 unlock 和 lock 之间呢? 实践中不可能, 所以不要担心这个问题)



这里我们的解决逻辑实际上是: **设定了一个条件** (`while(head->next == NULL)`), **让当前的 thread 在 dequeue 这里 waiting**, 允许其他 threads 插入进来, 一直到条件被满足为止, 才唤醒当前的 thread.

相当于: 暂时 put 当前的 thread 停滞, 让其他 threads 先运行. 





刚才我们的 solution, 造成的是 busy waiting: 虽然我当前的 thread 1 在 waiting, 但是它在 wait 的过程中持续 being busy (持续地 grabing 和 releasing lock)

这是不可避免的, 这是当前我们能够达到的最好的 solution (因为当前我们的任意一个 thread 一直在持续运行, 要么往下, 要么自旋.)

而 OS 中有另一个方法, 来改善这个问题: **condition variable**.

condition variable 的作用类似于这个过程但是更节约资源. 

它做的事情是: under 一定的 condition 下, put 一个 thread to sleep (而不只是被阻塞, which 占用 cpu 时间片 和电源的资源), 让其他 threads 先运行,



## synchronization II: ordering

这里我们就发现了**第二种 synchronization: ordering**

mutual exclusion 无法有效地解决我们的 "dequeue waiting" 问题, 因为在 mutual exclusion 中, 执行顺序是完全无关紧要的.

而在我们的这个问题中, 我们发现: 在 "queue empty" 这个条件下, 我们必须在 dequeue 前, 先 enqueue.

简而言之: "one thread waits for another to do something"

实现 ordering 的工具就是 condition variable: 针对一个 lock, 在一定条件下, 让一个 thread 打开 lock, 并 wait in sleeping, 直到条件被打破, 再重新获得锁, 然后继续做它的事情.



但是在讲解 condition variable 前, 我们先来思考一下: 假设存在一个 sleep 机制, 使得 wait 不需要 busy, 那么结构应该如何？



### waiting with "sleep"

1. 首先, 应该有一个 waiting list. 当我想要一个正在 dequeuer 的 thread 进入睡眠状态 waiting 时, 把它放进 waiting list 中

   ```c++
   if (queue is empty) {
   	add myself to waiting set
   	go to sleep and wait for wakeup
   }
   ```

2. 在一个 thread 进入 sleeping 状态时, 它得 release 它自己的 lock (否则其他有同一个 lock 的 critical section 的代码无法在它 sleep 期间运行)

3. 得有另一个 thread 来叫醒它





这里, 叫醒 dequeuer 的就是 enqueuer

我们看向这一段代码:

#### original idea

```c++
void enqueue()
    lock
  	// <>
    add new item to tail of queue
    if (dequeuer is waiting) {
        remove waiting dequeuer from waiting set
        wake up dequeuer	// 叫醒
    }
		// <>
    unlock
node* dequeue ()
    lock
    // <>
    if (queue is empty) {
        add myself to waiting set
        go to sleep and wait for wakeup //被叫醒后继续往下
    }
    remove item from queue
    // <>
    unlock
```

这个代码有以下这个 fundamental bug:

没有遵守我们刚才说的第二点: 不能 sleep with a lock held! sleep 时必须 unlock

并且, unlock 必须放在 add myself to waiting set 之后, 因为 unlock 完之后程序就进入了最脆弱的点: 其他 threads 的操作都可能见缝插针.

如果在 add myself to waiting set 前就 unlock 了, 那么可能: 刚 unlock 完, 就马上有一个 enqueue 插了进来, 但是: 目前并没有 dequeuer 在 waiting, 于是 enqueuer 就插入了一个节点但是却并没有 wakeup 之前的 dequeue。



#### 代码纠正1: 必须在加入 waiting set 前 release lock

因而, 代码需要修改为:
```c++
void enqueue()
    lock
  	// <>
    add new item to tail of queue
    if (dequeuer is waiting) {
        remove waiting dequeuer from waiting set
        wake up dequeuer	// 叫醒
    }
		// <>
    unlock
node* dequeue ()
    lock
    // <>
    if (queue is empty) {
        add myself to waiting set
        unlock //<>
        go to sleep and wait for wakeup //被叫醒后继续往下
        lock	//<>
    }
    remove item from queue
    // <>
    unlock
```



我们仍然发现一个问题: 

**在我们 adding myself to waiting set 结束然后安全 unlock 之后, 如果在 "go to sleep and wait for wakeup" 之前, 有一个 enqueuer 闯进来把我们的 dequeuer remove 出了 waiting set,** 然后虚空 wake up (并未 sleep); 然后 after all of this, dequeuer 才 go to sleep 并 wait for wakeup (尽管这个 alarm 实际上已经响过, 被它错过了), 那怎么办呢?

这个问题, 我们之后会更加底层地讨论如何解决这个问题, 现在我们直接接受一个事实(这个问题被解决后):



### condition variable: put ideas together

```c++
cv::wait
	// atomic
	1. release lock
	2. put thread onto waiting set
	3. go to sleep (所有 waiting set 上的 threads)
  // atomic
  4. after being woken, acquire lock when lock is free
```

这个 1,2,3 连在一起是一件 atomic 的事情.



每个 condition variable 

1. 关联了一个 lock
2. 有一个 set of waiting threads



虽然 go to sleep 时是所有 waiting set 上的 threads 一起, 但是 waker 却可以选择叫醒哪些 threads:

```c++
cv.signal(thread)
```

是叫醒一个 waiting thread

```shell
cv::broadcast
```

是叫醒所有 waiting threads



#### 注意事项

1. 被唤醒 ≠ 立刻运行。唤醒的是“去尝试拿锁”的资格票。

   被 wake 后, 原 waiting set 上的 threads 等待拿到 lock 之后再运行下去.

2. **calling `cv.wait` 时, 必须是 holding lock 的**, 因为 cv.wait 中间会 release lock.

3. `signal` 和 `broadcast` 时, 并不一定要 hold lock, 但是通常 it is natural to do so, 就像 enqueue 中的. (因为通常, signal 的时侯是另一个 thread 做了一些值得注意的事情.)

4. recall: **releasing lock 期间, invaraint 必须是 true 的!**  而 `cv.wait` 的开头就会 release, 因而在 put a thread to wait 时, 必须要确保在这之前不会有什么操作 break invariant!





#### 代码纠正2: 在调用 `cv.wait()` under some condition 时, 必须是 while the condition

最后一个对我们之前的代码的纠正是: 我们并不应该用 `if` 语句, 而应该用 `while`.

这是因为: 虽然

```c++
cv::wait
	// atomic
	1. release lock
	2. put thread onto waiting set
	3. go to sleep (所有 waiting set 上的 threads)
  // atomic
  4. after being woken, acquire lock when lock is free
```

前三步合在一起是 atomic 的, 但是和第四步的衔接不是

且, 其中其实穿插了:

```c++
//atomic
1. release lock
2. put thread onto waiting set
3. go to sleep (所有 waiting set 上的 threads)
// atomic
3.5 另一个 thread wake up 了这个 thread
4. after being woken, acquire lock when lock is free
```

假设在 3.5 和 4 之间:

1. enqueuer thread signal 了 dequeuer thread (singal 的叫醒是瞬发的, 打上一个 ready 的记号)
2. enqueuer 先运行完并 unlock 了, 此时 dequeuer wake 了但是还没 acquire 到 lock
3. enqueuer 先 realease lock, 此时另一个 dequeuer 截胡把这个新的 node 给消耗掉了
4. 原先的 dequeuer acquire 到了 lock，继续往下运行, 但是刚来的 node 已经没了, interface 被打破



因而, 我们要把 if 改成 while.



#### 最终代码

```c++
mutex queueMutex;
cv queueCV;

void enqueue() {
    queueMutex.lock();
    add new element to tail of queue;
  	queueCV.signal();
    queueMutex.unlock();
}



node* dequeue() {
    queueMutex.lock()
    while (queue is empty)
      	queueCV.wait(queueMutex);
    remove item from queue
    queueMutex.unlock()
    return removed item
}
```















