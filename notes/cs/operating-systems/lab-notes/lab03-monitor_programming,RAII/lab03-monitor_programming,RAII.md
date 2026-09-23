## monitor exercise: luxury box

总之就是两个帮派进入一个 room, 必须要等其中一个全部出去了另一个帮派的人才能进.

初步实现很简单. 就是只有一方全出去了, 另一方才能进去. 

所以只要两个 CV 就好了.



### fairness 设计 1: flawed

fair 版本的稍微有点说法. 

fair 版本改进的是: 防止一方持续不断进入 (出一个就进一个), 导致另一方永远被卡死的问题. 

所以我们做这样的一个设置.

设置一个 bool TURN

设计 1: 在一个 `pac12` 成员 enter 后, 我们就把 `TURN` 变成 `big10` 的. 如果 `TURN = big10` (说明上一个进入的是 `pac12` 的人), 并且 `big10` 确实有人在 waiting, 那么我们就让下一个想要进入的 `pac12` 的人 wait, 先放 `big10` 的人进去

设计 1 的坏处是: 如果 `pac12` 的人源源不断想要进入而并没有出去 (比如现在有 3 个 `pac12` 的人, 而有 12 个 `pac12` 的人还想进入), 这个时候突然出现了一个 `big10` 的人想进入, 那么剩下的 (12 个) `pac12` 的人都被这一个人卡死了, 必须要等到前三个人出来, 这个 `big10` 的人先进去, 然后这 12 个人再进去. 

### fairness 设计 2: 相对 fair



设计 2: 在一个 `pac12` 成员 leave 后, 我们就把 `TURN` 变成 `big10` 的. 如果 `TURN = big10` (说明刚刚 leave 了一个 `pac12` 的人), 并且 `big10` 确实有人在 waiting, 那么我们就让下一个想要进入的 `pac12` 的人 wait, 先放 `big10` 的人进去

而设计 2 则是以出而非入为标准, 把场权让给另一方. 这可以有效避免我们提到的场景: 如果 `pac12` 有两个人在 box 里, 并且源源不断地进一个出一个, 那么 `big10` 的人永远进不去了；并且, 也避免了设计 1 中的 inefficient 情况. 





总结: 当然, fairness 的标准总是主观的 (未必有正确答案), efficiency 是相对客观的, correctness 仍然是最重要的.

所以实现顺序是 correct -> efficient -> fair







## RAII (Resource Acquisition is Initialization)

RAII 是一种资源管理方式.

Resource: 可以被 acquire 以及 release, 并且通常 expensive to hold

比如 

- memory (new, delete), hold 者需要负责清除或者移交它; 
- mutex (lock, unlock), hold 者把其他 threads 卡在 critical section 前, 需要负责 unlock 它
- File (open, close), hold 者需要负责 close 它来完成改写.

我们通常需要手动管理这些资源.

而 RAII 是一种方式: 我们利用 class, struct 的特性 (**instance 作为 local variable, 在 initialize 时自动 call ctor, 而出 scope 时自动 call dtor)**, 把资源 tie to 它被 define 的 scope, 由此来自动管理资源!

Note: 出 scope 包括 function return, throw exception 等.



RAII 可以用来简化代码

比如说, 我们

### example: `lock_guard`

```c++
int do_thing() { // Return 0 on success, -1 on failure
    m.lock();
    if (shared.action_that_might_fail_and_return_neg1() < 0) {
        m.unlock();
        return -1;
    }
    if (shared.another_action_that_might_fail() < 0) {
        m.unlock();
      	return -1;
    }
  	m.unlock();
  	return 0;
}
```

我们可以把这个代码简化为 

```c++
int do_thing() { // Return 0 on success, -1 on failure
    // lock_guard calls lock() in ctor, unlock() in dtor
    lock_guard lock{m};
    if (shared.action_that_might_fail_and_return_neg1() < 0) {
        return -1; // lock exits scope, unlocks m
    }
    if (shared.another_action_that_might_fail() < 0) {
        return -1; // lock exits scope, unlocks m
    }
    if (...) { return -1; }
    return 0; // lock exits scope, unlocks m
}
```





这个 `lock_guard` 我们自己也可以实现: 

```c++
class mutex_guard {
public:
    // acquire resources in constructor
    mutex_guard(mutex &in) : my_mutex{in} {
        my_mutex.lock();
    }
    // release resources in destructor
    ~mutex_guard() {
        my_mutex.unlock();
    }
private:
    mutex &my_mutex;
};
```





#### applying lock_guard RAII 进行 exception detection

```c++
mutex m;
void do_thing() try {
    m.lock();
  	// <>
    action_that_might_fail_and_return_neg1();
    another_action_that_might_fail();
    another_action_that_might_not_succeed();
    yet_another_action_that_could_fail();
  	// <>
    m.unlock();
} catch (exception_type &e) {
    // 万一其中哪个操作出错了, 那么就运行不到 unlock 处就得 catch, 但是也要 unlock 然后再报错
    m.unlock();
    error_handler(e);
}
```

这段代码可以这样简化 (which is better):

```c++
mutex m;
void do_thing() try {
    mutex_guard guard{m};
    action_that_might_fail_and_return_neg1();
    another_action_that_might_fail();
    another_action_that_might_not_succeed();
    yet_another_action_that_could_fail();
} catch (exception_type &e) {
    error_handler(e);
}
```

guard is deconstructed as soon as exception is thrown.











### better `lock_guard` 以及 example program

这里是一个使用 ptr 的 lock_guard

```c++
class lock_guard {
    mutex* mptr = nullptr;
public:
    // reference semantics: since we are operating on that existing mutex,
    // not lock copying it.
    lock_guard(mutex& m) : mptr(&m) {
        mptr->lock();
    }
    ~lock_guard() {
        if (mptr) mptr->unlock();
    }       
    
    // disallow copies, otherwise we would have to lock the mutex twice
    lock_guard(lock_guard const&) = delete;
    lock_guard& operator=(lock_guard const&) = delete;


    // allow move semantics, so we can pass it to a thread

    lock_guard(lock_guard&& other) noexcept
            : mptr { other.mptr } {
        // leaves other guard in a safe state
        other.mptr = nullptr;
        }
    lock_guard& operator=(lock_guard&& other) noexcept {
        if (this != &other) {
            mptr = other.mptr;
            other.mptr = nullptr;
        }
        return *this;
    }
};
```

要禁止 copy semantics, 因为可能 lock twice

但是可以允许 move semantics, 转移使用权.
