# Core dump

众所周知我们写程序最烦的就是 seg fault, 难 debug.

尤其是在 non deterministic 的情况下, 我们通过 breakpoint 来 debug 的方式只能靠推和猜。这就是为什么，我们需要 core dump:

| 情况                             | 输出                                                | 能力                                                         |
| -------------------------------- | --------------------------------------------------- | ------------------------------------------------------------ |
| 🚫 **默认情况（没开 core dump）** | `Segmentation fault`                                | 只是告诉你“炸了”，但没说 **在哪、为什么炸**                  |
| ✅ **开启 core dump 后**          | `Segmentation fault (core dumped)` + 生成 core 文件 | 给你一个“内存黑匣子”，配合 GDB 能精确定位：在哪一行崩了、调用了哪些函数、变量值是多少 |

core dump 记录程序崩溃时的一个写照. 往往它都能启示我们崩溃的原因。

开启的方式是：



🧪 1. 写一个“肯定会炸”的程序

```c
// crash.c
#include <stdio.h>

int main() {
    int *p = NULL;
    *p = 42;  // 啪！空指针写入，segfault
    return 0;
}
```



先正常编译，记得带上 debug sign `-g` 

```bash
gcc -g main.c -o main
```

这样生成的 `crash` 会包含源码信息，方便调试。

然后我们在当前 shell 中输入 (或者直接在 rc 里 config):

```bash
ulimit -c unlimited
```

查看是否成功：

```bash
ulimit -c
# 如果输出是 "unlimited"，就 OK
```

运行程序触发崩溃: 

```bash
./crash
# 输出: Segmentation fault (core dumped)
```

这时候会在当前目录生成一个 `core.<pid>` 的文件。

然后我们可以

🔍 5. 用 GDB 打开 Core Dump

```bash
gdb ./crash core12138
```

你将进入 GDB 的交互环境，里面会直接告诉你程序在哪崩了，比如：

```
Program terminated with signal SIGSEGV, Segmentation fault.
#0  0x0000000000401137 in main () at crash.c:5
5       *p = 42;
```

这就告诉你第 5 行 `*p = 42` 是导致崩溃的罪魁祸首。



core dump 文件不仅可以查看程序崩溃的原因，还保留了当时的所有 stacks 和局部变量，可以用 gdb 命令查看

### 常用 GDB 命令

| 命令          | 说明                      |
| ------------- | ------------------------- |
| `bt`          | backtrace，显示函数调用栈 |
| `list`        | 查看源码                  |
| `frame`       | 切换到某一帧              |
| `info locals` | 查看当前函数的局部变量    |
| `quit`        | 退出 gdb                  |

总之就是: 编译时加 `-g` ➜ 开启 `ulimit -c unlimited` ➜ 运行崩掉 ➜ `gdb ./prog core` ➜ 看是谁把程序整死的





### 做不出 core 的解决方法

wsl 和 mac, 分别有做不出 core 的理由，，

首先当然, 确保你在 shell 的 config 文件里放了

```shell
ulimit -c unlimited
```



for wsl: 

1. 只有 wsl 2 支持 core dump, wsl 1 不支持

2. core dump 会被系统拦住, 我们要打开:

   ```shell
   sudo nano /etc/sysctl.conf
   ```

   然后添加两行: 

   ```conf
   kernel.core_pattern=core
   fs.suid_dumpable=1
   ```

   然后执行

   ```shell
   sudo sysctl -p
   ```

3. 给当前目录权限确认:

   ```shell
   chmod +w .
   ```

然后就可以

```shell
g++ -g seg.c -o seg
./seg # 运行, 崩溃时会诞生 core dump
```



Mac: 

1. 先运行这个命令看看系统允不允许生成 core:

   如果是 `0` → core dump 被系统禁了, 1 则 ok

   ````shell
   sysctl kern.coredump
   ````

2. 查一下 core 文件默认保存位置：

   ```shell
   sysctl kern.corefile
   ```

3. 如果你跑完 `./demo` 后，`core` 不在当前目录，试试：

   ```shell
   ls /cores
   ```

4. 修改 core dump 保存路径（让它存在当前目录）:

   ```shell
   sudo sysctl -w kern.corefile=core
   ```

   





# `extern` 关键词

请问下面这个代码的问题是什么？

```c++
// classroom.h
#include <unordered_map>
std::unordered_map<std::string, std::string> students;
```

问题在于:

我们知道 C++ 中, declare 可以无限次, 但是 define, 当然只能一次 (函数可以重载, 前提是参数也不同.) 

而关键是: 这里的 global variable `students` 是一个 **defining declaration. ** 它不仅是一个 declaration, 同时也是一个 definition.

因而, 一旦在其他地方 define 这个 students, 就会出问题.

这是一个在 declaring global variable 时经常出现的问题.



而 C++ 对应这个问题的机制就是 `extern` 关键词: 用在 declaring 非定义在本文件中的 global variable

```c++
// class.h
#include <unordered_map>
extern std::unordered_map<std::string, std::string> students; // declaration

// class.cpp
#include "classroom.h"
std::unordered_map<std::string, std::string> students; // definition
```







### why need this

我们不禁思考:

link 时, 难道不会把一个 C++ 文件 include 的 header files 全部整理起来放进 .o 文件的吗? 那么我们在 `class.cpp` 文件里 defining declare global variable, 不要放在 hpp 文件里不就好了.

这看似是没问题的, 但是: what about 其他的 cpp 文件?

如果其他的 cpp 文件要使用这个 `students` 变量呢? linker 会找不到它.

因而这种情况就不得不还是使用 `extern` 关键词.

比如

````c++
// student.cpp
extern std::unordered_map<std::string, std::string> students;
//...
````



因而, 为了避免每来一个要用这个 extern variable 变量的 cpp 文件, 我们都得 `extern` 声明 (尤其是有很多这样的 global var 的时候, 太麻烦了), 还是下面这种做法最好:

1. `.h/.hpp` 文件里：只声明（用 `extern`）

   ```c++
   // classroom.h
   #pragma once
   #include <unordered_map>
   
   extern std::unordered_map<std::string, std::string> students;
   ```

2. `.cpp` 文件里：定义并初始化

   ```c++
   // classroom.cpp
   #include "classroom.h"
   
   std::unordered_map<std::string, std::string> students;
   ```

3. 其他使用方 cpp 文件只 `#include` 头文件

   ```c++
   // main.cpp
   #include "classroom.h"
   
   int main() {
       students["Ryn"] = "Math";
   }
   ```

   

这样做的好处：

- 每个变量只定义一次（不会 multiple definition）
- 所有 `.cpp` 文件共享一个变量（真正共享）
- 不怕重复 include（因为 `#pragma once` 或 include guard）





# `static` keyword

`static` 这个关键词, 

1. 加在 class member 前
2. 放在 global variable 前
3. 放在一个函数中

是完全不一样的.



放在 **class member** 前, 它表示**这个变量是这个 class 的所有 instances 公用一个**的

放在 **global variable** 前, 它限制链接性:  这**个 variable 仅限于当前的 cpp 文件使用**, 其他 cpp 文件可以放心用相同的名字, 表示完全不同的变量. (用来防止命名冲突)

放在一个 **function** 中, 它表示**这个变量只在这个函数被第一次调用的时候初始化一次**, 之后每次调用这个函数都会保留上次的值.







# smart ptrs

我们使用 pointer 时会出现一些问题. 比如 invalid access 和 memory leak (资源已经被释放, 打但是代码有疏忽之处, 仍然去 access 它)；

而 C++11 开始有一个自动的资源管理功能, 就是 smart pointers.

smart pointer 被 guarantee 一定指向 valid memory 并且在 destroyed 时会 自动 clean up resources.

它 ：

- Acquire memory in constructor
- Deallocate memory in destructor
- Dereference and access like a raw pointer

总而言之就是更加安全的 pointer.



有三类的 smart pointer: `shared_ptr`, `unique_ptr` 和 `weak_ptr`

### `shared_ptr<T>`

- Multiple shared pointers can point to a resource
- When all shared pointers are destroyed, resource is released
- Maintains a "reference count" for the resource

总是就是: 

<img src="lab00-core_dump,extern,static,smartptr.assets/Screenshot 2025-06-01 at 01.25.14.png" alt="Screenshot 2025-06-01 at 01.25.14" style="zoom:50%;" />

它的好处是: 适用于多个对象共享资源; 在最后一个 `shared_ptr` 被销毁时, 对象也会被释放.



使用例: 

```c++
{
shared_ptr<int> b;
    {
        shared_ptr<int> a = make_shared(10); //resource allocated
        b = a; //copy of shared pointer
    }
//a is destroyed
}
//b is destroyed
//resource freed
```

(我们发现其实 smart pointer 不难实现, 就是一个普通的 class 而已)









### `weak_ptr<T>`

尽管 shared ptr 很好, 它存在一个问题: 循环引用会导致对象无法释放：

```c++
struct B;

struct A {
    std::shared_ptr<B> b_ptr;
};

struct B {
    std::shared_ptr<A> a_ptr;
};

int main() {
    auto a = std::make_shared<A>();
    auto b = std::make_shared<B>();
    a->b_ptr = b;
    b->a_ptr = a; // 形成了循环引用
}

```

在上面的代码里：

- `a` 拿着 `b` 的 shared_ptr，`b` 又拿着 `a` 的 shared_ptr。
- 所以引用计数永远大于 0，程序结束后内存也不会释放

从而还是 memory leak 了.



所以当这种情况出现时, 我们可以使用 weak pointer:

`weak_ptr`：非拥有者，仅观察对象是否存在

- weak＿ptr 也可以指向由 shared＿ptr 管理的对象。
- 但它不会增加引用计数。
- 它的作用就是：观察资源是否还活着。



```c++
struct B; // 提前声明

struct A {
    std::shared_ptr<B> b_ptr;
};

struct B {
    std::weak_ptr<A> a_ptr; // ✅ 用 weak_ptr 打破循环
};

int main() {
    auto a = std::make_shared<A>();
    auto b = std::make_shared<B>();
    a->b_ptr = b;
    b->a_ptr = a; // 不会增加引用计数
}

```

如何使用 `weak_ptr`？想使用资源时，需要用 `.lock()` 转为 `shared_ptr`：

```c++
if (auto sp = weak.lock()) {
    // 资源还在，sp 是一个有效的 shared_ptr
    std::cout << *sp << std::endl;
} else {
    // 资源已经释放了
    std::cout << "Object expired." << std::endl;
}
```





### `unique_ptr<T>`

unique pointer 相对于 shared pointer, 一个是多个对象共享一个资源, 一个可以保证对一个给定资源, 只有一个对象拥有它.

它的效果就是: 它无法被 copy, 只能用 `std::move()` 把 ownership 从一个 scope transfer 到另一个 (外层的 scope).

<img src="lab00-core_dump,extern,static,smartptr.assets/Screenshot 2025-06-01 at 01.33.08.png" alt="Screenshot 2025-06-01 at 01.33.08" style="zoom: 50%;" />

```c++
{
unique_ptr<int> b;
    {
        unique_ptr<int> a = make_unique(10); //resource allocated
        b = std::move(a); //must move instead of copy
    }
}
//b is destroyed
//resource freed
```







### 总结与用例: why better than raw ptr

总结: 其实 weak pointer 用的很少, 因为这种循环引用本身就很少见.

但是我们可以经常使用 unique 和 shared ptr, 避免原始 pointer 的各种 memory 问题.



下面是一个使用例:

原始 pointer: 由于多个对象引用导致的 invalid access 问题.

```c++
struct big { //expensive to copy
}
big* a = new big();
big* b = a;
delete b; //needed to not leak memory
//a and b still accessible!
*a // segfault or worse
```

smart pointer: 通过 shared pointer 解决了这个问题

```c++
struct big { //expensive to copy
    ...
}
shared_ptr<big> a = make_shared<big>();
{
    shared_ptr<big> b = a; //copy
}
//impossible to have invalid access
//resource still cleaned up
```
