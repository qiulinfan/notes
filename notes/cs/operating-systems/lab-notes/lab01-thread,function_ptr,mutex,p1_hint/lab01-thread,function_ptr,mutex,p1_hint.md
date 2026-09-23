# Review on threads

同一个 process 的 threads 共享一个 virtual address space.

也就是说, 同一个 process 中的 threads, 除了每个 thread 有自己的 stack 外, 共享同样的 Text, Data, Heap, symbol table.

<img src="assets/Screenshot 2025-06-01 at 03.30.54.png" alt="Screenshot 2025-06-01 at 03.30.54" style="zoom:50%;" />



只有 atomic operations 是 indivisible 的

除了事先被告知是 atomic 的操作, 不能假设任何操作是 atomic 的.



### Ex 1: `x++` 

假设只有 one load, store 是 atomic 的:

```c++
int32_t x;
x = 1;	// one atomic store, atomic
x++;	// temp=x+1, x=temp; not atomic
```

但是,

```c++
int64_t x;
x = 1;	// two atomic store each 32 bits, not atomic!
x++;	// not atomic
```





我们令 `x=1` 作为初始化, 然后让两个 threads 运行简单的 

```x++
x++
```

结果应该是 `3`

<img src="assets/Screenshot 2025-06-01 at 11.15.42.png" alt="Screenshot 2025-06-01 at 11.15.42" style="zoom:50%;" />

但是我们可以考虑一个结果不是 3 的执行顺序:

<img src="assets/Screenshot 2025-06-01 at 11.18.33.png" alt="Screenshot 2025-06-01 at 11.18.33" style="zoom:50%;" />

最后结果是 2 (`tmp1`)



这就是多个 threads 同时运行 critical section 的结果. (race condition)



Synchronization 可以阻止 race conditions

有两种 Synchronization: mutual exclusion 和 ordering.



这里可以用 mutex 达到 mutual exclusion：

<img src="assets/Screenshot 2025-06-01 at 11.20.49.png" alt="Screenshot 2025-06-01 at 11.20.49" style="zoom:50%;" />











### Ex 2: max and min counter

```c++
const int NUM_THREADS = 2;
const int NUM_ITER = 20;
int counter = 0;

void child() {
    for (int i = 0; i < NUM_ITER; i++) {
            counter++;
    }
} 

void main_thread() {
    for (int i = 0; i < NUM_THREADS; i++) {
        thread t(child);
    }
}

```

这段代码做得就是创建了 2 个 threads, 每个都 `++counter` 20 次.

因而最大的 counter 可能值肯定是 40.

但是最小呢?

看似是 20:

```c++
counter = 0
tmp = counter + 1 = 1
// ... thread B 的 20 次 ++, counter = 20
counter = tmp = 1
// ... thread A 的剩余 19 次 ++
counter = 20
```

但是其实还可以更少:

```c++
counter = 0
tmp = counter + 1 = 1	// thread A
// thread B 的 19 次 ++, counter = 19
counter = tmp = 1  // thread A 的第一次 ++ 完成, counter = 1
tmp = counter + 1 = 2 // thread B 的最后一个 ++, 中途
// ... thread A 的剩余 20 次 ++, counter = 21
counter = tmp = 2	// thread B 的最后一个 ++, 完成
```

实际上是 2.









### Ex3: mutual exclusion?

我们这里, 尝试不使用 lock 实现 mutual exclusion. 看看下面这段代码是否能做到?

```c++
/* Global variables */
bool active[2] = {false, false};
int turn = 0;
```

Thread 0:
```c++
while (true) {
    active[0] = true;
    while (turn != 0) {
        while (active[1]) {}
        turn = 0;
    }
    
    <critical section>
    active[0] = false;
    <do other stuff>
}
```

Thread 1:
```c++
while (true) {
    active[1] = true;
    while (turn != 1) {
        while (active[0]) {}
        turn = 1;
    }
  
    <critical section>
    active[1] = false;
    <do other stuff>
}
```



答案是不能.

反例是: 

1. thread 1 一直执行到 `turn = 1` 之前, 然后 thread 0 开始执行, 
2. 由于 `turn=0`, thread 0 直接无阻进入 critical section
3. 然后 thread 1 也无阻进入 critical section. thread 0,1同时运行, critical section 被破坏.







# Function Pointer

在 p1 中我们会用到 function pointer. 所以做一个 review.



一个 function pointer 实际上很简单, 就是 code 区域的一个 function 的地址.

Syntax 为:

```c++
return_type (*functionptrname) (type1, type2 etc);
```



例如:

Examples:
- ```c++
  int (*foo)(int, double);	
  ```

- ```c++
  void (*bar)(void *);	// takes 一个 void (无类型) 指针, 不 return
  ```

- ```c++
  void* (*baz)();	// 无参数, return void 指针
  ```

  

<img src="lab01-thread,function_ptr,mutex,p1_hint.assets/Screenshot 2025-06-03 at 01.19.27.png" alt="Screenshot 2025-06-03 at 01.19.27" style="zoom:50%;" />



### example

```c++
void* baz() {
    return reinterpret_cast<void*>(static_cast<intptr_t>(482));
}

int main() {
    void* (*baz_ptr)(); // Declare a function pointer
  
    baz_ptr = reinterpret_cast<void*(*)()>(baz); // Make baz_ptr point to baz
    
  	// (explicit cast not required)
    
  	void* retptr = baz_ptr(); // Call the function
    
  	cout << reinterpret_cast<intptr_t>(retptr) << endl; // Cast the returned void* and print it out.
}
```

这段代码中, 我们 declare 了一个 (无参数,返回无类型指针的) function ptr 并把它指向了 `baz` 这个 function.

然后我们通过 `baz_ptr()` call 了这个函数, 并把结果存在 `retptr`中, 这是一个无类型指针 (即一个地址)



最后我们把这个无类型指针转化为一个 `intptr_t`  (足够大的 int 指针), 来输出.



这里的 `baz` 函数, 就是把 482 这个数当成一个 int 地址然后再 reinterpret_cast 成无类型地址给返回出来 (即返回 482 这个地址)

因而, 整个程序做的事情就是输出 482.

这个 482 先在 `baz` 中, 从 `int` 被转化为一个  `intptr_t` , 然后再转化为无类型的 `void*`；之后, 它又被转化为 `intptr_t`  输出出来. 

整体上, 通过 `void*` 指针间接地传递了一个整数。



### recall: `void*` 

`void*` 是 C 和 C++ 中的一种 **“通用指针类型”**（也叫 **不定类型指针**），意思是“指向某种未知类型的数据的指针”.

就是一个地址, which 不能被解引用, 只有被转化为具体类型的指针后才能被解引用.

为什么我们需要这个? 这是为了应对统一的接口. 比如 `baz` 这个函数就是用它来传递整数, 是**系统级编程中一种“类型擦除”技巧**, 在很多低级 API 中都常见.

在操作系统里，很多 API 要求传入一个 void＊，但你有时候需要传递整数，比如：
- Thread ID
- 文件描述符
- 一些标志位／small values

而操作系统的接口往往是统一的：
```c++
void* thread＿start（void* arg）；//pthread 线程函数的典型写法
```

于是你就得“想办法”把整数变成 `void*`，然后在函数内部再转换回来：





### more syntax

我们刚才的这两行

```c++
void* (*baz_ptr)(); // Declare a function pointer
  
baz_ptr = reinterpret_cast<void*(*)()>(baz); // Make baz_ptr point to baz
```

其实可以更加泛化: 使用 using 来表示一个 function pointer 类型 (一个 function ptr 的类型就是它的返回，参数).

```c++
using baz_fcn_t = void* (*)();
baz_fcn_t baz_ptr = reinterpret_cast<baz_fcn_t>(baz); // explicit cast
baz_fcn_t baz_ptr2 = baz; // implicit cast
```

语法:

```c++
using func_ptr_type_name = return_type (*)(type1, type2)
```





P1 中我们将使用 function pointer:

- ```c++
  using thread_startfunc_t = void (*) (uintptr_t);
  thread(thread_startfunc_t func, uintptr_t arg);
  ```

- ```c++
  static void boot(thread_startfunc_t func, uintptr_t arg, unsigned int deterministic);
  ```









# p1

### p1 ex walkthrough

1. driver ready, customer requesting (两个准备状态)

   <img src="assets/Screenshot 2025-06-18 at 03.51.38.png" alt="Screenshot 2025-06-18 at 03.51.38" style="zoom:50%;" />

2. 寻找 (所有 customers 和 drivers 的距离) 中最近的一对

   -> match

   -> driver driving<img src="assets/Screenshot 2025-06-18 at 03.54.34.png" alt="Screenshot 2025-06-18 at 03.54.34" style="zoom:50%;" />

3. driver arrived

   -> customer pays

   <img src="assets/Screenshot 2025-06-18 at 03.55.01.png" alt="Screenshot 2025-06-18 at 03.55.01" style="zoom:50%;" />

   -> customer order completed 

   -> driver 重新变为 ready

   -> customer 新 order requesting

   <img src="assets/Screenshot 2025-06-18 at 03.57.00.png" alt="Screenshot 2025-06-18 at 03.57.00" style="zoom:50%;" />

4. 在过程中, 任意重新 ready 的 driver 和 requesting 的 customer 都可以再配对.

5. 所有 orders completed, drivers ready, 那么程序结束.

   <img src="assets/Screenshot 2025-06-18 at 03.58.37.png" alt="Screenshot 2025-06-18 at 03.58.37" style="zoom:50%;" />
