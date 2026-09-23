# GDB debugging with `pthreads` concerned

### `user defined signal`

发现: 同样一个程序, 直接运行 `./pizza` 是没问题的, 但是一用 gdb 跑加上断点就出了问题.

```
Exception has occurred.
User defined signal 1
```



什么是 `SIGUSR1`？

- 是 Unix 系统预留给用户程序使用的信号之一。
- 线程库、异步框架（包括你使用的项目基础设施）**常常用它来实现线程切换、调度、唤醒等功能**。
- **程序本身不会崩溃于 SIGUSR1**，但 **GDB 默认行为是：收到就停下来。**

这是你所使用的 **调试器 GUI 前端（比如 VSCode）拦截了 `SIGUSR1`**，并把它误当成错误来显示。

因而解决方案是: 在 gdb 中禁用这个信号的 stop 和 print

```gdb
handle SIGUSR1 nostop noprint
```

不过问题是: 我们想要用 gdb GUI, 而不想用 cml. 每次我们在 cml 切成 `gdb` 模式后输入这个命令, quit gdb 之后这个设置又没了. 因而当然, 我们 quit cml gdb 之后再开 GUI gdb 也不会保留.

(检测设置是否成功的方法是: gdb 下

```cmd
info handle SIGUSR1
```

如果设置成功则结果应该是

```
Signal        Stop      Print   Pass to program
SIGUSR1       No       	No     	Yes
```

如果是三个 YES 则设置失败. 我这里持续设置失败, 发现问题)



#### 在 `launch.json` 中设置忽略 `SIGUSR1` 信号

所以我发现的解决方法是: 在 `launch.json` 中设置, 永久生效.

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "(gdb) Launch",
      "type": "cppdbg",
      "request": "launch",
      "program": "${workspaceFolder}/pizza",
      "args": ["2", "customer.in0", "customer.in1"],
      "stopAtEntry": false,
      "cwd": "${fileDirname}",
      "environment": [],
      "externalConsole": false,
      "MIMode": "gdb",
      "setupCommands": [
        {
          "description": "Ignore SIGUSR1",
          "text": "handle SIGUSR1 nostop noprint pass",
          "ignoreFailures": true
        }
      ]
    }
  ]
}

```

这是 gdb 的 version. lldb 则是加上这一行:

```json
"initCommands": ["process handle SIGUSR1 -n true -p true -s false"]
```



这个时候再 `info` 验证就收到:

```
SIGUSR1    No    No    Yes
```



### `Unable to step next, operation failed with error code 0x80004004`

在 VSCode 中的 `cppdbg` 调试器插件里，是 **调试器底层停止控制线程的信号**，含义大概是：

- **程序或线程已经退出了，GDB 不能再 step over**
- 或者 **step 时 GDB 控制的线程不再是活跃状态**



如果你当前正在调试的线程已经运行结束了，GDB（或 VSCode 的 GDB 插件）就无法再对这个线程执行 `step over`、`next`、`step into` 等操作，结果就会报类似 `0x80004004` 的错误。

因而, 如果我们在一个函数 (run by a thread) 运行快结束的地方打 breakpoint 然后一直 step over 到结束, 它会出现这个错误, 但是没关系.





# core dump

查看 core 文件

```shell
gdb ./test1 core.12345
```

用 backtrace 查看崩溃原因:

```shell
(gdb) bt
#0  munmap () at ../sysdeps/unix/syscall-template.S:122
Backtrace stopped: Cannot access memory at address 0x7d8bda5bdbd8
```

