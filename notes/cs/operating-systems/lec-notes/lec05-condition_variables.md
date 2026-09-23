# condition variables

## review: thread-safe queue s.t. `dequeue` wait if queue empty, with condition variables

上一个 lecture 我们讲解了使用 mutex 的 thread-safe queue (linked list based), 

为此, 只使用 mutex 的 queue, 不得不 busy waiting (该 thread 通过循环自旋运行的方式来 waiting), 从而持续占用 cpu 时间片和电耗, 浪费了资源.

因而我们使用 condition variable 来实现第二种 synchronization: ordering.

condition variable 提供了一个 waiting set, 以供一些 threads wait on some condition.

```c++
mutex queueMutex;
void enqueue() {
    queueMutex.lock();
    add new element to tail of queue;
  	// cv.signal()
    if (dequeuer is waiting) {
        remove waiting dequeuer from waiting set
        wake up deqeuer
    }
  	//
    queueMutex.unlock();
}



node* dequeue() {
    queueMutex.lock()
    while (queue is empty) {
    // cv.wait
      	// <atomic>
        add myself to waiting set
        unlock
        sleep
        //
        lock
    //
    }
    remove item from queue
    queueMutex.unlock()
    return removed item
}
```

我们加入 condition variable `queueCV`, 从而 cast:

```c++
if (dequeuer is waiting) {
	remove waiting dequeuer from waiting set
  wake up deqeuer
} -> queueCV.signal();
```

以及 

```c++
{add myself to waiting set
unlock
sleep} -> queueCV.wait(queueMutex);
```

从而简洁的代码就是: 

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



### note: the waiter is responsible for ensuring the condition is met

上一个 lecture 中, 我们提到了: always use `while` arount waiting! 

原因是:

-  `cv.wait(mutex)` 并不是 atomic 的, 其分为 atomic 的 “加入 waiting set -> unlock -> sleep” 这三步并成一步, 以及非 atomic 的 lock 为另一步. 在这两步中间, lock 是打开的! 
- 假设这个时候, 突然闯进了一个新的 dequeue (由于已经 empty 且 Unlock 了), 直接把刚刚 en 的新 node 给 de 了(抢走); 然后我们原本正在运行的 dequeue 就失败了. 
- 因而我们要使用 while. 使得在这个情况下, 仍然保留这个没处理完的 dequeue.

这里其实反映了一个事情: 虽然叫 condition variable, 但是**它本身并不确保在 waiter thread rehold lock 时, condition 是被 met 的**. 我们只是让另一个 thread 在一定触发条件下叫醒它, 但是 **waiter thread 被叫醒之后一直到它 reacquire lock 前, 这一段不是 atomic 的. 因而其他 threads 很可能进来打破 condition**, 

因而 **waiter thread 必须自己确认 condition 是 met 的 (使用 while)**. 这个 paradigm 很巧妙, 形成了一个即便有意外发生 between wake and grab lock, 也会在循环中回到初始状态. 

**It is never safe to avoid rechecking!!!**







### compare busy waiting 和 `cv.wait`

busy waiting:

```c++
lock
while (queue is empty) {
    unlock
    lock
}
unlock
```

`cv.lock`:

```c++
lock
while (queue is empty) {
    unlock
    add thread to waiting set
    go to sleep
    lock
unlock
```

唯一的区别就是一个持续高频运行 while loop, 另一个在中间 sleep.









## monitor: 即一个 lock + associative condition vars

我们已经学习知道 synchronization 有两种, 分别对应一个机制: 

- locks, for mutual exclusion
- condition variables, for ordering constraints



**monitor** 这个概念其实很简单: 一个 monitor, 就是一个 lock + the condition variables assiciated with that lock

**mesa monitor**: 特指 waiter 承担全部的 reponsibility 来确保在继续运行前, condition is met

简单来说就是 alwayes 使用 while (...) {wait}

**"You should never use wait without a while loop"**





### programming with monitor 的 原则

首先, 我们需要 sperate 整个 program into threads.

在 OS 的课上, 我们只需要知道 threads 是什么, 怎么使用就可以. 

(而关于 parallell programming 请参照 eecs 587: 如何 design the program for multi threads, 如何尽可能地发挥并行计算的优势)



### overall design

1. **think about each thread independently!!!!** Think one thread at a time.

   单独看任何 thread, 都记住这两项原则 1.1, 1.2

   - 每个 thread 都应该尽可能地去 make more forward progress (be greedy)
   - 并且, 每个 thread 都仅仅在 unable to proceed 的时候才 wait.



### for mutual exclusion

2. 列举出 shared data needed for the problem, **对每个 group of related, shared data 都要 assign 一个 lock.**

   目前 (for project 1), 我们只需要考虑 one group, one big lock. 之后我们将更加精细化 (thousands of locks for project 2).

   Ex: 

   ```
   w,x -> lock A;
   y,z -> lock B;
   ```

   - lock...unlock around accesses to shared data
   - Coarse-grained versus fine-grained locking





### for ordering

3. 考虑这个问题: "When is a thread unable to make progress?"

4. 对于每个 before-after condition, 都分别使用一个 condition variable

   注意: 一个 condition variable 属于 the lock

   ​			that protects the shared data

   ​				that is used to evaluate the condition.

   为什么一定是 shared data? 因为一定是 waiter 在等待它, waker 在产生/使用它, 并且它被它们对它 的 lock 保护着.

   比方说我们先前的例子中, queue 的新元素. 

5. 谁要 call `signal` 或者 `broadcast`? 

   "正在以一种 some waiters 可能正在期待的方式来改变 shared data 的 thread" 





### typical monitor code 

```c++
lock
// wait if needed
while (condition) {
	wait
}
do stuff

signal or broadcast about the stuff you did

unlock
```







## 经典 Monitor problem: Producer-consumer (bounded buffer)

这个问题很简单. producers 和 consumers 共享一个 buffer.

- Producers fill the shared buffer; consumers empty it
- Need to synchronize actions of producers and consumers

<img src="assets/Screenshot 2025-06-01 at 21.11.45.png" alt="Screenshot 2025-06-01 at 21.11.45" style="zoom:50%;" />



```c++
#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <queue>
#include <chrono>

class BoundedBuffer {
    std::mutex mtx;
    std::condition_variable not_full, not_empty;
    std::queue<int> buffer;
    const size_t capacity = 5;

public:
    void produce(int item) {
        std::unique_lock<std::mutex> lock(mtx);
        not_full.wait(lock, [&]() { return buffer.size() < capacity; });

        buffer.push(item);
        std::cout << "Produced: " << item << std::endl;

        not_empty.notify_one();
    }

    int consume() {
        std::unique_lock<std::mutex> lock(mtx);
        not_empty.wait(lock, [&]() { return !buffer.empty(); });

        int item = buffer.front();
        buffer.pop();
        std::cout << "Consumed: " << item << std::endl;

        not_full.notify_one();
        return item;
    }
};

BoundedBuffer buffer;

void producer(int id) {
    for (int i = 0; i < 5; ++i) {
        int item = id * 100 + i;
        buffer.produce(item);
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
}

void consumer(int id) {
    for (int i = 0; i < 5; ++i) {
        int item = buffer.consume();
        std::cout << "[Consumer " << id << "] Got item: " << item << std::endl;
        std::this_thread::sleep_for(std::chrono::milliseconds(150));
    }
}

int main() {
    std::thread producers[2];
    std::thread consumers[2];

    for (int i = 0; i < 2; ++i) {
        producers[i] = std::thread(producer, i + 1);
        consumers[i] = std::thread(consumer, i + 1);
    }

    for (int i = 0; i < 2; ++i) {
        producers[i].join();
        consumers[i].join();
    }

    return 0;
}
```



为什么要使用一个 shared buffer? 因为这允许 producers and consumers to operate somewhat independently (more concurrency)

在许多情况下, 这个问题都有应用, 比如 Unix pipes (`grep "keyword" foo.txt | wc -l`)



project 1 就是这个问题的一个比较 mature 的形式 (多个 drivers 运送 pizza 给多个 consumers)







这里我们看一个 toy problem:

### example: coke machine

Problem definition: 

- Coke machine can hold at most MAX cokes
- Delivery person (producer) adds one coke to machine
- Consumer buys one coke

Step 1: Think about threads independently (顾客只关心 cokes, 不关心怎么 deliver 的)

Step 2: Identify shared state: `numCokes`

Step 3: Assign locks, 这里只需单个 lock (cokeLock) 来保护所有 shared data

​	     这里 mutual exclusion 非常简单. 不多赘述.

Step 4: 列举出所有的 before-after conditions, 并给每个 condition 分配一个 cv.

​	我们 talk about ordering: 

1. 当 `numCokdes == 0` 时, consumer 必须等待.
2. 当 `numCokes == MAX` 时, producer 必须等待.

​	所以有两个 before-after conditions. 我们分配两个 cv: `waitingConsumers`, `waitingConditions`.





shared section:

```c++
int numCokes =0
Mutex cokeLock;
CV waitingConsumers, waitingProducers;
```

`Consumer()`:

```c++
cokeLock.lock();

While (numCokes==0) {
	WaitingConsumers.wait(cokeLock);
}

// take coke out of machine
NumCokes--;

waitingProducers.signal();

cokeLock.unlock ();
```

`Producer()`:

```c++
cokeLock.lock();
While (numCokes=MAX) {
    WaitingProducers.wait(cokeLock);
}

// add coke to machine
numCokes++;

waitingConsumers.signal();

cokeLock.unlock();
```

这个答案是非常标准的. Notice: 当 waiting set 里没有东西时, signal 什么都不做. 

比方说: 每当我们 produce 一个 coke, 那么这个时候如果 WaitingConsumers 没东西, `waitingConsumers.signal();` 就会什么都不做; 如果有东西, 那么它应该被 wake, 然后等待 producer 运行结束, unlcok, 然后这个 consumer 就可以 consume 了!

所以答案是正确的





#### wrong attempt 1: 能否只在 edge case 时 `signal`?

我们想: 既然只有 `numCokes==0` 时会 wait, 那么为什么不只在 `numCokes` 从 1 降到 0 的时候 `signal`? 

这样子我们就可以大幅减少 `signal` 的次数. 

`Producer()`:

```c++
cokeLock.lock();
While (numCokes=MAX) {
    WaitingProducers.wait(cokeLock);
}

// add coke to machine
numCokes++;
if (numCokes == 1) {
 		waitingConsumers.signal(); 
}

cokeLock.unlock();
```

看似很完美, 但是问题在于: 

考虑这个情景: 

1. 有两个 producers, 两个 consumers
2. 现在有 0 个 coke，两个 consumers 都在 waiting
3. 一个 producer 刚刚 produce 了一个 coke, 于是 signal 了一个 consumer, 然后 unlock 了, 完成了任务
4. 然而在这个 consumer grab 到 lock 前 (或者还没醒), 另一个 producer 见缝插针, 运行了
5. 另一个 producer 由于此时 `numCoke ==2`, 并没有 signal 另一个 consumer
6. 于是, 一共只有一个 consumer 醒了! 最后他 consume 了一个 coke, 而现在另一个 consumer 还在 waiting, 冰箱里却还有一个 coke.

从而 interface 被打破了.

没错这个看似 efficient 的修改其实是错误的. 其理由就在于, consume 和 produce 的运行速度.

我们之所以牺牲效率每次都 `signal` 就是因为: 一旦产好, 一定看看有没有 waiting 的人, 有则要叫醒一个, 只有这样才能保证生产不白费.









#### wrong attempt 2: 能否把两个 cv combine 为一个?



shared section:

```c++
int numCokes =0
Mutex cokeLock;
CV waitingPC;
```

`Consumer()`:

```c++
cokeLock.lock();

While (numCokes==0) {
	waitingPC.wait(cokeLock);
}

// take coke out of machine
numCokes--;

waitingPC.signal();

cokeLock.unlock ();
```

`Producer()`:

```c++
cokeLock.lock();
While (numCokes=MAX) {
    waitingPC.wait(cokeLock);
}

// add coke to machine
numCokes++;

waitingPC.signal();

cokeLock.unlock();
```

同样, 这个 solution 也不太行.

考虑这个极端情况:

- Let `MAX` $=1$, and `numCokes` $=0$, C1 and C2 正在 waiting
- P1 执行, `numCokes++` 到 1, signals, wakes up C1
- P2 waits, 因为 `numCokes` = `MAX`
- C1 执行, `numCokes--` 到 0, signals, wake up C2

waiting set 中的 Custmers 可能会在错误的位置 (应该 produce 的地方) 被叫醒, 比如 C1 叫醒 C2，使得接下来并不能做什么

注意, 这里叫醒 `C2` 本身没有问题 . 因为当 `C2` 被叫醒后发现 `numCokes` 仍然为 0 后, 通过 while loop 还是继续 wait, 循环.

问题是什么?

问题是没有叫醒 `P2`. 本应该 produce 的时候, 没有 produce. 从而打破 interface.

这个例子告诉我们**有时候即便 wake 一个 thread 本身没有问题, 其也可能有伴随问题 (由于 signal 用给了 wake 它, 导致本该 wake 的没有 wake)**

