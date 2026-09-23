## Deadlock

### ex1: 分析和解决 deadlock

```c++
void transfer_money(int from_account_id, int to_account_id, int amount);
```

```c++
/*
 * A vector of locks that ranges over account numbers.
 * locks[i] = lock for account i
 */
std::vector<std::mutex> locks;

void transfer_money(int acct1, int acct2, int amount) {
    locks[acct1].lock();
    locks[acct2].lock();
    <transfer money>
    locks[acct2].unlock();
    locks[acct1].unlock();
}
```

这是一个会出现 deadlock 的程序.

显然, 这个 lock 出问题的方式和我们课上是一样的. 

thread 1 could execute `transfer_money(1, 2, 20)`, and thread 2 could execute `transfer_money(2, 1, 100)`.

然后 `lock[1].lock`, `lock[2].lock` 首先被跑, 于是就 deadlock 了.



有两种解决方法:
#### sol 1: attack circular wait condition, 让 circular wait 不可能 (即, 总有一个 thread 一定 preceed, 从而这个 thread preceed 完后另一个也一定 preceed)

我们回忆课上的方法:

define 一个 ordering!

```c++
void transfer_money(int acct1, int acct2, int amount) {
    locks[std::min(acct1,acct2)].lock();
    locks[std::max(acct1,acct2)].lock();
    <transfer money>
    locks[acct2].unlock();
    locks[acct1].unlock();
}
```

这样, 如果刚才的情况就不会再发生了. 



### sol 2: attack hold-and-wait condition

让 hold and wait 变得不可能,

做法就是: 我们再 define 一个 lock, 把 `locks[acct1].lock();
    locks[acct2].lock();` 变得 atomic 就好了. 这样就不会有 hold and wait 的情况出现了, hold 时一定不会 wait.



