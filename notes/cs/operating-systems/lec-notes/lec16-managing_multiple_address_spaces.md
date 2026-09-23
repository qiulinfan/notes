



### process creation

一个 process 对应了一个 address space.

我们创建 process (several threads) 的同时, 还要创造它的 address space



Steps:

1. allocate process control block (like TCB)
2. initialize translation data for new address space (page table)
3. 从 exe 中把 program image 读进 memory 里
4. 创建 initial thread
5. initialize registers
6. 把 mode bit 设为 "user"
7. jump to start of program



physical memory 相当于 cache for address spaces, 















```c++
while (true) {
    cout << "shellname$";
    cin >> cmd;
    parse cmd => (program, args);
    if (fork() == 0) {
        find(progarm) in $PATH;
        exec(program);
    } else {	//if it is the parent process
        wait for child;	// wait / also can just do nothing, for the cpu can run other threads
    }
}
```

