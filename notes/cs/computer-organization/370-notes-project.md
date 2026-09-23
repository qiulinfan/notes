# 370 Project notes

## Project 1

### 1a - Assembler

一个巨大的惨痛经验：一定不要吝惜时间写 test files，写 test files 的时间都是微不足道并且值得的。。。。自己的 test file 就是可以检验程序写的对不对

Specifically: p1a 花了大量时间的主要理由就是：一直没找到读 int 的那个问题，，，一定要 `& 0xFFFF` ！！！因为系统的 int 不是 16 位的，而我们这里 16 位，碰到二补码前面全是 F 就老实了。一定要注意每个数字的格式！！



## Project 2

### 2a - Assembler

#### Output format

第 1 行是 Header：记载 Text, Data, Symbol, Relocation Table 的行数

第 2 行 ~ 第 n 行是 Text. 和 project 1 一样. 抄过来就可以.

第 n+1 行 ~ 第 m 行是 data. 和 project 1 一样，抄过来就可以.

第 m+1 行 ~ 第 k 行是 Symbol table，记录所有的 global variables 和 function name. 本地的使用 T/D，extern 的使用 U 表示 undefined

第 k+1 行 ~ 最后是 relocation table，relocate 所有 used in a non relative way (即 access memory) 的 instructions



#### Symbol Table/Relocation Table

关于什么东西要放到 symbol table 以及 relocation table:

在 LC2K 中，我们用小写  label 表示 static 的变量，用大写 label 表示 global 的变量（函数内自己的 local variable 并不会 .flll 储存，而是运行时通过在 memory 的 stack frame 上的 LDUR, SDUR 交互来完成）

(Note: 我们称小写 label 为 local label，它对应 C 中 static 的变量，不是 local 的变量.)

所以：

Symbol Table: 所有其他文件也能看到的东西：global var，函数名（总之就是所有的 global label）

Symbol Table 并不检查 Global Label 的使用，而是只检查 Global Label 的 def，除了在 offsetField 中如果出现 undefined global var

Relocation Table: 所有 static, global label 的相关行为。其实就是除了 beq (relative) 外所有涉及标签的指令.



#### Label 的处理

虽然因为这一次是多文件处理，label 实际上并不能代表绝对地址，但是我们还是把它当绝对地址处理。

undefined label 全部作 0 处理。

其他的和 p1 一模一样。（感觉 linker 要做的事情因此会很多。。。



#### 流程

1. 读一遍，确定 Defined Labels 和 每个区的长度；

2. 读第二遍，转换 Opcode。

   期间读到使用 label（offsetfield 上）则判断：

   如果是大写 Label 则放到

   如果是 beq 则无所谓，如果不是则把这个指令和右边 offsetfield 上使用的 label 放到 Relocation Table 成为一个 entry

#### bug 5678
这里我的 test case 发现了两个 Bug:
计算 line 到达 text 和 data 分割点的方法有问题。一个是没考虑纯 text 和 纯 data，另一个上很长的 data 会导致循环（这里犯了一个低级错误，一旦行数积累到 text 数量 line 就清零了）
解决方法是使用 lebron 的做法，设一个 partition line 表示在哪一行 partition，然后 line 追踪
很多人都有的一个问题：对于出现两次的 extern label 处理并不好。出现 label 时我们都搜索，如果找到了就直接转换，如果没找到则 {if 大写，是 extern，写成0；if 小写，是 undefined 报错}
但这里发现问题：没有处理同时出现两次的 extern label.
解决方法：发现 extern 时也查一遍 symbol 表.
解决这两个问题之后结束了。test case 还差四个

整理 test case:

A: test1fill

B: test5

D: test1fill

E: test14zf

F: test1fill

I: test1fill

J: test10-duplicate

(test1像个战神。。)







### 2l - Linker

这个 project 的任务就是：把一堆 object files 连接成一个 .mc

```sh
./linker file_0.obj file_1.obj ... file_N.obj machine_code.mc
```



.mc 也很简单，就是所有的 texts 和所有的 data；最后的 .exe 理论上可以用 p1 中的 simulator 跑



我们假设：main 总是在第一个 file 里。这就合理多了



所以这个 project 实际上就是做这件事：我们对于其他指令只需要暴力叠加就可以，





我的观点：

1. 首先统计每个文件的 D, T 数量，起一个2d array 表示 第 i 个 obj 的 D/T 从何开始

2. 起两个 Symbol array：一个 defined 一个 undefined

   遍历所有 obj 的 Symbol Table。这个 Symbol array 获取 Symbol Tables 的信息，就是原本的 Symbol Table的 concatenate，加上这个 Symbol 应该在哪个文件里。这个“应该在哪个文件”的变量初始值：

   非 U 的放进 defined array，U 的放进 undefined array.

   然后：

   (1) defined 里有多个定义：error

   (2) 在结束后，我们遍历 undefined array: 除了 Stack 每个都能在 defined 里找到吗？否，error；

   这里，Stack 这个特殊 Label 的起始时 M+N，就是所有D，T 的数量的位置，而其他 Label 都应该 defined.

   





做完这件事情之后，暴力链接。然后我们根据位置 array 和 relocation table，对于每个变量的绝对位置进行修改。

也就是说，我们需要解码，修改，再编码

Note：relocation table 也需要全部遍历并读取一次，在最后加上 Stack。

没了。这个 project 就这么点，但是细节绝对复杂。。。



打开 starter 泪流满面。。。他已经把这些 initialization 都写好了，大概两百行差不多最多了





意外的快，三个小时就只剩 error checking 了

error checking 和 test files 写完就结束。预计两点左右？大约可以开始写 2r 了。写到四点收工吧，学 454



又是经典操作之写错了一个 i/j。。。







### 2r - Recursive Function

就是用 lc2k 写一个 Fibonacci 

 C version 如下:

```c
int fibonacci(int n)
{
    if (n == 0 | n == 1) {
        return n;
    } else {
        return fibonacci(n-1) + fibonacci(n-2);
    }
}
```





注意以下几个要点:

1. 首先 pass input n 进入 reg1
   lw         0        1      input        r1 = memory[input]
2. 我们使用 Stack 这个 Label 表示 Text 和 Data 之后紧接的 memory. 不需要定义它, 可以直接使用. 使用例:
       sw          5       7       Stack       save return address on stack
       add         5       6       5           increment stack pointer
       sw          5       1       Stack       save input on stack
       add         5       6       5           increment stack pointer
       add         1       1       1           compute 2*input
       add         5       6       5           decrement stack pointer





#### 特殊 regs

3. 有些 regs 有特殊的用处:
   r0  value 0
   r1  n input to function - ENFORCED
   r2  local variable for function
   r3  return value of function - ENFORCED
   r4  local variable for function
   r5  stack pointer
   r6  temporary value (can hold different values at different times, e.g., +1, -1, function address)
   r7  return address - ENFORCED



框架是: 

````assembly
    lw          0       1       n
    lw          0       4       Faddr        //load function address
    jalr        4       7                    //call function
    halt
    <add your code here>
n   .fill       7
    <add your data here>
````



步骤是:

1. Accept n as an argument passed in register 1
2. Store the starting line of your combination function by including the following line in data:
    Faddr .fill <label_at_start_of_function>
    <start_of_function> is a label at the start of your function
3. Use recursion by building a stack frame for each function called
4. Return the result in register 3
5. Use register 7 as the return address
6. DO NOT use a global register
    A global register is one that all recursive calls to a function use. We should be utilizing the stack to keep track of our computed values.



我的想法：每个栈都存储一个 这个栈的 n 是多少，对于在 stack pointer 最前面的 stack，如果 n 不是 1 或者 0，那么就拆分 n 变成 n-1, n-2；如果 n 是 0，1，，那么就进入 base case 并把结果加到 r3 上，并且 -- stackpointer. 



所以思路就是：

并不需要两个 recursive call，而是只需要一次：每一次 recursive call，我们都将 stack pointer 上的 n 和 1，0进行对比，如果是1，0则进入 basecase (add 1/0 到 r3 上) 并 --sp；如果不是1，0 则先--sp 相当于把当前的 n pop 掉，然后再 sp++两次把 n-1, n-2 push 到 sp 上，



所以我的 FIbo 的逻辑：

1. 如果 sp ==0: halt

2. 比较 n 和 1, 0: 是否进入 base case

   base case: sp--; 

   r3 += n; 

   jalr;

3. 没有 beq: 

   sp--, 

   mem[sp] = n-1; 

   sp++; 

   mem[sp] = n-2; 

   sp++;

   Jalr;



congrats: 非常正确的 implementation，但是不遵守 guideline. 我们在 call function 前不被允许布置 stack 设置初始值。

那我在 stack 上利用一个地方存储一个值，在第一遍的时候设置成 1000，然后每一遍查看：如果是1000就 beq 跳过这个设置不就好了



，，，赫赫结果这个也被制裁了。我的巧妙方法全被逮捕了。这应该是最 efficient 的解法，但是强制写 recursive function 不允许使用。

所以只能不可避免地。采用 stack frame 的办法了。但是又没有 frame pointer，纯折磨



重新整理思路：每一个 stack frame 里都存储三个变量，

1. return address，在函数结束后（算出结果）之后要跳到哪个函数的 stack frame 上
2. n 是多少
3. return value

所以要确保这些事情

1. 在计算完 F(n-1) 后，要回到本函数 stack frame，重新读取 n，并计算 F(n-2)，然后再回到本函数 stackframe 上
2. 获取了完整的 return value，函数结束，return value 给 return address，即上一个函数的 return value 上

回到本函数的方法：在另一个 stackframe 读取它的 return address，并且中把 sp 移动到这个位置



所以函数单次的逻辑是这样的：

Step1: 检查 reg 1 中的 n 是否是 base case 1/0，是的话首先 r3 += n，然后把 n 这个值作为 return value 加到本次的 return address（会是上一个函数的 return value）上；而后检查 return address，如果是 0，说明是最里面的 stack，直接结束，否则将 sp 移动到 return address 上并--，即回到该 stackframe 的 n 上， jalr 回函数起点，准备进行下一次函数 recursion. 

Step 2: n 不是 1/0 的话，在 sp++++ 的位置新建一个 stackframe，把当前函数的 stackframe 中 return value 的位置赋给子函数的 return address，n-1 赋给子函数的 n；把 sp 移动到这个子函数 stackframe 的 n 的位置，更新 reg 1，jalr 回函数起点，准备进行子函数 recursion.

Step 3: 此时 return value 已经得到了 F(n-1) 的值，sp 回到了 n 的位置，还需要再在 sp++++ 的位置新建一个 stackframe，把当前函数的 stackframe 中 return value 的位置赋给子函数的 return address，n-2 赋给子函数的 n，更新 reg 1；把 sp 移动到这个子函数 stackframe 的 n 的位置，jalr 回函数起点，准备进行子函数 recursion.

Step 4: 此时 return value 已经得到了 F(n-1) + F(n-2) 的值，这个函数任务完成；我们把 return value 返回给 return address，sp 移动回 return address，即上一个数的 return value 上再--，回到上一个函数的 n 上，更新 reg 1。如果 return address 是 0: 那么说明是最里层的函数，于是结束了。



感觉这个逻辑应当是近似完整的了。等下再修改。

考虑情况1: n=1, base case, 最内层

结果：return address == 0，直接结束

情况 2: n=1, 不是最内层

结果：回到上一层的 n

情况3: n=2 

结果：建立两个 stackframe，第一个结束之后 return value得到++，sp回到n上，第二个结束之后 return value +=0，sp回到 n上；进入 Step 4，return value 并移动 sp 到上一个 n 上

感觉非常完美



#### return address

这个思路最大的问题就是我对 return address 的理解完全错了。。。return address 是回到哪个 instruction，而不是回到 stack 里的哪个地方

所以现在一切都明朗了，，我们只需要在一个 stackframe 里面存：

1. return address: which line of instruction should I excute after finish excuting this function
2. n: the input to the this function
3. return value of this stackframe

就可以了

When we call a subfunction, we should use jalr. So, when we build the stackframe of this function, we:

++sp

First put the r7 into mem[sp] as the return address

++sp

put r1 into mem[sp] as the n

++sp

Put 0 into mem[sp] as the original return valued

This finishes the construction of the stack frame.



每当我们完成一个 function call，我们把 sp 移动到前一个函数的 return value 上，在其上面加上我们这次 call 的 return value。

实际上理解的关键点在于 call stack 的结构：caller 的 stack 一定在我们当前函数的 stack 的紧接着的下方。所以每次我们的 stack operation 都是相同的。

而我们要做的就用 caller-callee save 的思想，在每次 call 前把需要存储的变量放在 stack 上，并且在函数结束后 restore 就好了。

当一次 call 结束后，我们先不用 jalr return，而是把当时的 callee save 的原函数变量：比如 n，全部都restore，然后再 jalr 回当时的 pc++ 的地方，这个函数就完全被恢复了。记得我们每次 call 完都要把 sp 移动到 stack 顶上 Null 的地方，这样就彻底恢复回原状了。



直接一遍过了。





## Project 3 - Pipelining

我们把所有信息都封装在 state 里. state 等于当前运行的 clock cycle. 其中包含了 5 个 state regs.每个 state reg 都包含 state 的信息.

state 还包括了 insterMem, DataMem 和正常的 regs, 以及 pc reg.



```c
typedef struct IFIDStruct {
    int instr;
	int pcPlus1;
} IFIDType;

typedef struct IDEXStruct {
    int instr;
	int pcPlus1;
	int valA;
	int valB;
	int offset;
} IDEXType;

typedef struct EXMEMStruct {
    int instr;
	int branchTarget;
    int eq;
	int aluResult;
	int valB;
} EXMEMType;

typedef struct MEMWBStruct {
    int instr;
	int writeData;
} MEMWBType;

typedef struct WBENDStruct {
    int instr;
	int writeData;
} WBENDType;

```



### WB stage reg: 由于没有 internal forwarding 

比起 lecture design: 我们的 Project design 最大的区别是没有 internal forwarding. 即 read 和 write 同一个数据无法在同一个 clock 内完成

其影响：原本我们假定在一个 clock 里可以 write back data to reg file in Stage 5, 并且在此之后 ID stage 上的指令能够立马读取到这个 write back 的 reg 的 data.

但是 project 里不行。所以我们有一个新多出来的 WB stage reg 来存储 write back 的数据。

并且，我们原本 stall 两个 cycle 的 beq 需要 stall 三个 cycle；对于 data hazard 的 detect and forward，我们还需要 detect data hazard between WB stage 的 instruction（write to 了哪个 reg）和 ID stage 的 instruction（regA/B）是否有相同的.



### Hazard

需要 stall 的 hazard: 只有 lw  followed by 使用 lw reg2 的 inst. （理论上，sw 后面一个 Stage 紧跟 lw 也会需要 stall. 但是这个 project 貌似不考虑

data hazard not involving lw: 直接 forward

control hazard：非常简化，没有 forward 而是直接 stall. 



### Forward

比起 lecture design: 我们的 Project design 最大的区别是没有 internal forwarding. 即 read 和 write 同一个数据无法在同一个 clock 内完成

其影响：原本我们假定在一个 clock 里可以 write back data to reg file in Stage 5, 并且在此之后 ID stage 上的指令能够立马读取到这个 write back 的 reg 的 data.

但是 project 里不行。所以我们有一个新多出来的 WB stage reg 来存储 write back 的数据。

并且，我们原本 stall 两个 cycle 的 beq 需要 stall 三个 cycle；对于 data hazard 的 detect and forward，我们还需要 detect data hazard between WB stage 的 instruction（write to 了哪个 reg）和 ID stage 的 instruction（regA/B）是否有相同的.



所以核心就是

在 ex 阶段，当检查到 regA/regB 是前面三个 cycle 的 dest reg 时：

forward 前三个 Stage (last ex, last mem, last wb) 的 stage reg 中的内容（ex.aluresult, mem,writeData, wb.writeData) 成为 real regA/regB

这里的 real regA 仅仅是用来 ALU 运算的。并不进行储存。

real regB 还要存在 ex/mem reg 里



dest reg 只有那么几个东西有，即会改写：

1. add/nor：regC
2. lw：regB









## Project 4 - Cache

需要 implement  的东西: 

1. cache.c: cache_init
2. cache.c: cache_access
3. simulator: main



就这么简单。实际上就是把 cache 逻辑融合进 p1 的 simulator 里

simulator main 需要调整的地方：

首先 call cache_init

然后 while(executing) 的循环里 call cache_access

最后，循环结束处 call printStats()



cache_access 蕴含 memory_access. 



### Overview

#### Cache 参数

1. blocksPerSet, **一个 set 里有几个 blocks**

   从 1 到 num_blocks

   1：每个 Set 里有一个 block, 是direct-mappe，num_blocks：fully-asso，整个 cache 都是一个 set

2. blockSizeInWords: **一个 block 里有几个 words**，表示一次 memory to cache grab 多少个 words

3. numberOfSets: 有多少个 Sets

所以整体的 number of words in cache 就是这三个东西的乘积

当我们准备从 memory write to cache 的时候，我们首先定位它在哪个 set 里. 

如果这个 set 还有空位就放进空位

如果这个 set 没有空位就 replace LRU



#### WB, allocate on write 策略

使用 WB, allocate on write 策略.

也就是每次 lw，我们会发现

发现 cache miss 后，







### Test cases

















