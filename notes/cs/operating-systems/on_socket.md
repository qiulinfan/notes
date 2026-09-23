摘抄自 《Beej’s Guide to Network Programming》

## 2 What is a socket?

socket 是对 network 的虚拟 abstraction, 就像 thread 是对 CPU 的虚拟 abstraction.

| 抽象对象   | 底层资源（实际由 OS 管理）             | 类比说明                   |
| ---------- | -------------------------------------- | -------------------------- |
| **Thread** | CPU 核心（core）、寄存器、上下文       | 就像“假装有自己的 CPU”     |
| **Socket** | 网络接口卡（NIC）、IP 栈、端口、缓冲区 | 就像“假装有自己的网络连接” |

本质上，**socket 是一种通过标准 Unix 文件描述符与其他程序通信的方式**。

在 Unix 中，“一切皆文件”，包括网络连接、FIFO、pipe、终端等。通过 `socket()` 系统调用，你可以获得一个**socket 描述符**，它就像文件描述符一样，可以使用 `send()` 和 `recv()` 与远程程序通信。

尽管你也可以使用 `read()` 和 `write()` 来操作 socket，但 `send()` 和 `recv()` 提供了更丰富的控制。



### 2.1 什么是一个 file descripter 文件描述符)

我们刚才说到, `socket()` 这个 apt 的调用会返回一个 socket 描述符, which is 一种文件描述符

那么什么是文件描述符: **文件描述符（File Descriptor）是 Unix 和 Linux 系统中用于标识一个打开的文件的整数编号。**它是操作系统用来**追踪进程当前打开的所有 I/O 资源**的手段，包括：

- 普通文件（`open("file.txt", O_RDONLY)`）
- 标准输入 / 输出 / 错误（`stdin`, `stdout`, `stderr`）
- 网络 socket
- 管道（pipe）
- 设备（如 `/dev/null`）

```
用户态
  |
  |—— file descriptor （编号：比如 3）
  ↓
内核态
  |
  |—— 打开文件表项（Open File Table Entry）
  ↓
  |—— inode（文件的元数据，指向磁盘上的 block）
  ↓
  |—— data block
```

我们 recall: 作为内核而言, 访问一个文件的流程是进行 tree walk 路径解析:

```c++
int fd = open("/home/qiulin/report.txt", O_RDONLY);

/*
/ → inode 2（根目录）
在 inode 2 的数据块中找 "home" → 得到 inode 17
在 inode 17 的目录块中找 "qiulin" → 得 inode 45
在 inode 45 的目录块中找 "report.txt" → 得 inode 78
inode 78 是目标文件 → 访问它
*/
```

而每次都这样太慢了. 

file descripter 的目的就是: 缓存路径解析的结果，用于后续 I/O 操作。

每个 process 会 keep 一个 File Descripter Table (private to a process), 储存 **file descripter (int) -> open file entry (ptr) 的映射**；而 **open file entry 又会 (OS globally) 映射到这个文件的 inode (ptr)**. 于是可以直接访问 data block, 跳过解析这一步. 

每次一个 process 访问一个 file, 如果没有给它分配过 fd 就会分配一个; 分配过的话就会直接找到它的 inode 位置, 不需要 tree walk 解析



对于一些最常用的文件: std io/err, 所有 processes 都会给它们分配 0,1,2 的 FD. 其他文件则按需分配. 关闭一个 fd（`close(fd)`）后，这个编号就可以被回收再用。

```c++
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>

int main() {
    int fd = open("hello.txt", O_RDONLY);
    if (fd == -1) {perror("open failed");return 1;}
    char buf[100];
    int n = read(fd, buf, 100); 
    write(1, buf, n); // 1 是标准输出 stdout
    close(fd);
    return 0;
}
/*
open() 返回一个 文件描述符，可能是整数 3
read(3, ...) 表示：读的是 fd=3 对应的文件
write(1, ...) 表示：写的是 fd=1，即标准输出（终端）
*/
```

| 文件描述符 | 含义                    |
| ---------- | ----------------------- |
| `0`        | 标准输入 `stdin`        |
| `1`        | 标准输出 `stdout`       |
| `2`        | 标准错误 `stderr`       |
| `3` 开始   | 其他打开的文件或 socket |





`socket()` 也是创造了一个虚拟文件, 所以会被分配一个 socket FD.

后续就可以 `send(fd, …)` 和 `recv(fd, …)` 等, 复用相同的 FD 机制.







### 2.1 Two Types of Internet Sockets

**Internet Socket** 分为两种主要类型：

1. `SOCK_STREAM`（流式套接字） → **TCP**
2. `SOCK_DGRAM`（数据报套接字） → **UDP**

#### 🌊 `SOCK_STREAM`（TCP）

- **可靠、有序、双向连接**
- 适用于对数据顺序和完整性要求很高的应用
- 示例应用：`telnet`, `ssh`, 浏览器（HTTP 协议）

TCP 确保数据按顺序到达、无差错，协议详情见 [RFC 793](https://datatracker.ietf.org/doc/html/rfc793)。

#### 📦 `SOCK_DGRAM`（UDP）

- **无连接、不可靠**（但传输的数据包本身是完整的）
- 示例应用：`tftp`, `dhcp`, 网络游戏、音视频流

UDP 的优势在于**速度快**，适合实时场景，比如发送玩家位置时偶尔掉一个包也没关系。可靠性由上层协议（如 tftp 自己实现 ACK 应答）保障。



这里我们关注 TCP Internet Socket, 不去关注 UDP.



### 2.2 Low-level Nonsense and Network Theory

#### 数据封装（Data Encapsulation）

网络消息的传输就是数据的发送, 而数据的发送和接收需要协议 (protocol): 

> 协议是通信双方约定的一套规则，定义了数据格式、传输方式、处理流程等，使得它们能够正确理解彼此的信息。

因为有几十亿条数据以电磁波形式被发送, 我们不想接收所有电磁波，而是：

- 只接收“发给我这个 IP、这个端口”的数据包
- 并且能看懂它的“格式”，知道该怎么处理
- 如果数据不完整，还要知道如何请求重发或忽略

所以需要协议对数据进行封装! 

协议把责任分层，比如：

- **七层模型（ISO/OSI）**：

```
Application
Presentation
Session
Transport (TCP/UDP)
Network (IP)
Data Link
Physical (Ethernet)
```

Socket 程序员大多数只关心最上面的几层。因而简化：

- **简化的 Unix 四层模型**：

  ```
  Application (e.g., telnet)
  Transport (TCP/UDP)
  Internet (IP)
  Network Access (Ethernet, Wi-Fi)
  ```

系统内核负责封装 Transport 和 Internet 层，硬件负责封装 Network Access 层。开发者使用 socket 编程接口无需关心底层硬件细节。

| 协议层            | 负责的事                 |
| ----------------- | ------------------------ |
| HTTP (应用层)     | 网页格式、请求/响应      |
| TCP (传输层)      | 可靠传输、顺序保证、重传 |
| IP (网络层)       | 路由、IP地址寻址         |
| Ethernet (硬件层) | 本地帧传输、MAC地址识别  |

所以数据在发送过程中被多层协议“包裹”，形成协议栈：

1. 应用层:（如 TFTP, HTTP, DNS）先加上应用层 header
2. 传输层: 再由 UDP/TCP 加上 UDP/TCP header
3. 网络层: 再加上 IP header
4. 硬件层（如 Ethernet）加上物理层 header



接收端按照相反的顺序逐层解封装，最终获得原始数据。



总结

> Socket 是 Unix 提供的一个通过文件描述符进行**网络通信的接口**。它有 **TCP（流式）** 和 **UDP（数据报式）** 两种主流形式，分别适用于可靠传输与高速传输场景；其背后依赖分层封装模型，开发者只需关注最上层逻辑即可。





## 3 IP 地址、结构体与数据处理（Data Munging）

### 互联网和局域网

一个 (典型的) 局域网，就是一个 (拥有 NAT 表、DHCP、网关功能的) 路由器所管理的所有设备组成的网络。

> 一个路由器 (+多个交换机) <-> 一个局域网！

而互联网的结构: 

```
                ┌──────────────┐
                │ 全球骨干网    │
                └────┬─────────┘
                     ↓
                ┌──────────────┐
                │ 国家/地区 ISP │
                └────┬─────────┘
                     ↓
          ┌─────────────────────┐
          │ 本地 ISP / 运营商网络 │
          └────┬────────┬───────┘
               ↓        ↓
        ┌────────┐  ┌────────┐
        │ 家庭局域网 │  │ 公司局域网 │
        └────────┘  └────────┘

```

所以其实简化来看：

> 互联网中，一个局域网就是一个节点，互联网就是数以亿计的局域网构成的 graph.



互联网中, 每个局域网作为一个节点都有一个 ip 地址. 这个地址的一部分表示地区, 一部分表示 (这是这个地区中的第几个局域网)



而同一个局域网中, 

- 所有主机共享同一个互联网 ip, 
- 不过每个主机也有一个 local 的 (和这个局域网的互联网 ip 地址无关的) 局域网 ip 地址. 这个 ip 地址只在这个局域网中生效.  



假设你有以下设备：

| 设备   | 私网 IP 分配        |
| ------ | ------------------- |
| 电脑   | 192.168.0.2         |
| 手机   | 192.168.0.3         |
| 平板   | 192.168.0.4         |
| 路由器 | 192.168.0.1（网关） |

你的 **路由器：**

- 通过 **DHCP** 给设备分配了这些 IP
- 把它们共享到一个公网 IP：如 `203.0.113.7`
- 通过 **NAT 表** 记录谁访问了什么，以及应该如何把返回的数据转发回去







### 3.1 IP, 网络和主机的关系

IP 地址的意义就是定位一个主机！

网络有公网和私网。私网就是局域网，公网就是互联网。



先说 interface: 网络通信中，一个 IP + 一个 port 可以唯一地确定一个主机的一个服务。
$$
\textbf{IP Address} + \textbf{Port Number} = \text{Socket Address}
$$
socket address 在互联网中唯一的！



所以通过绑定 IP+port，可以确定地和另一个主机的一个服务通信。

```
203.0.113.57:80   → 这个 IP 上 (的一个确定的主机的) HTTP 服务的进程
203.0.113.57:22   → 这个 IP 上 (的一个确定的主机的) 的 SSH 服务
```



局域网中，一个 IP 和一个主机一一对应。这个 IP 是虚拟的，由局域网自己分配。



网络通信无非分为两种：

1. 互联网中的 (有可能同时属于两个不同局域网的) 两个主机的各自的一个服务想要互相通信
2. 同一个局域网中的两个主机的各自的一个服务想要通过互相通信

一个局域网中的主机想要通过互联网和另一个互联网中的主机通信，也可以包括在第一种情况中。

（Notice：怎么看出一个 IP 是和自己同一个局域网的 IP 还是公网 IP？会有冲突吗？答案是不会冲突！因为只有一些 IP 地址段是留给局域网的，即公网不会分配这些 IP，局域网会且仅会分配这些 IP

| 地址段         | 用途 |
| -------------- | ---- |
| 10.0.0.0/8     | 私网 |
| 172.16.0.0/12  | 私网 |
| 192.168.0.0/16 | 私网 |

所以一个 IP 摆在我们自己的主机面前时，就知道它对应的主机是和自己同个局域网的，还是公网里另一个了）



#### 同一局域网中两个 (主机, 服务) 通信

这种情况下很简单，因为同一局域网中，一个主机 <-> 一个 ip (一个主机也可以装多个网卡于是有多个 ip, 或者绑定虚拟 IP, 不过这种情况下可以看作不同主机)，所以直接 socket address 当然可以唯一定位



#### 互联网中的 (属于两个不同局域网的) 两个 (主机, 服务) 通信

怎么办呢?

答案是：同一个局域网中的所有主机，都共享同一个公网 ip.



有个东西叫 NAT (Network Address Translation)，它由路由器维护，一个路由器覆盖一个局域网。NAT 的作用就是：

1. 管理这个局域网中所有的主机的所有服务
2. 当这个局域网中的一个主机的一个服务 想要和公网中另一个局域网的里另一个服务通信时，把局域网中的 ip 全部翻译为这个局域网的公网 ip
3. 动态地为这个局域网中每个主机的每个服务分配 port num. 这样，我们就可以通过服务的 port num 来看这个服务属于当前局域网的哪个主机！(因而，公网中通信时, (ip, port) 才可以唯一地决定公网中一个主机的一个服务)



所以互联网中的 (属于两个不同局域网的) 两个 (主机, 服务) 通信就是通过各自 NAT 翻译成公网 IP，然后通过服务 port num 决定各自局域网中的哪个主机和服务，从而来沟通的。

(更加细节地说: NAT 会在“出站连接”时，给每个**(私网 IP, 私网端口)**组合分配一个**(公网 IP, 公网端口)**)



所以总结:

> 我们可以通过 (ip, port) 来唯一地定位一个指定主机的一个指定服务. 
>
> (Socket Address) = (IP Address) + (Port Number)







### 3.2 IP 地址的格式 

#### IPv4 和 IPv6

IPv4: 

- **IPv4** 使用 32 位地址（如 `192.0.2.111`），最多约 42 亿个地址（$2^{32}$）。
- 由于设备激增，IPv4 地址已经短缺，导致出现了 **IPv6**。

#### 

IPv6:

- 使用 128 位地址（如 `2001:db8::51`），共 $2^{128}$ 个地址，约 340 万亿亿亿个。
- 支持压缩表示法，如：
  - `::1` 是本机回环地址（IPv4 中是 `127.0.0.1`）
  - `2001:db8::` 等价于 `2001:0db8:0000:0000:...`
- IPv6 中也支持 IPv4 兼容格式：`::ffff:192.0.2.33`





#### 3.2.1 子网（Subnets）

IP 地址可拆分为网络号（network）和主机号（host）

也就是我们刚才说的: 

- 对于公网 ip: 这个地址的一部分表示地区, 一部分表示 (这是这个地区中的第几个局域网)
- 对于局域网中的 local ip: 这个地址的一部分固定, 另一部分表示这是这个局域网中的第几个主机



如何划分网络号和主机号?

- 最古老的方法是地址分类法 (过时)

  | 类别 | 开头范围                    | 网络部分 | 主机部分 | 用途             |
  | ---- | --------------------------- | -------- | -------- | ---------------- |
  | A    | 0.0.0.0 – 127.255.255.255   | 前 8 位  | 后 24 位 | 大型机构         |
  | B    | 128.0.0.0 – 191.255.255.255 | 前 16 位 | 后 16 位 | 中型机构         |
  | C    | 192.0.0.0 – 223.255.255.255 | 前 24 位 | 后 8 位  | 小型组织（家庭） |

- 古老的方法是附带一个**子网掩码（netmask）** 比如 `255.255.255.0`, 表示前 24 位是网络部分。

- 现在,为更灵活划分子网，引入 CIDR 表示法，如 `192.0.2.12/30` 表示前 30 位为网络地址。

- IPv6 也支持类似写法，如：`2001:db8::/32`



#### 3.1.2 端口号（Port Number）

- 端口号用来**找到主机上的特定服务**。

- 是 16 位整数（0-65535），常见端口：
  - HTTP → 80，Telnet → 23，SMTP → 25
  
  端口号是**传输层地址**，用于 TCP/UDP 区分服务
  
- 小于 1024 的端口被称为“特权端口”，通常需要 root 权限绑定



刚才说了, NAT 会把局域网中每个 (IP, port) 翻译为对外的 (共享公网 ip, port)





### 3.3 字节序（Byte Order）

recall 370:

当一个多字节的整数（比如 `0xb34f` 是一个 2 字节的 short 类型）被存入内存时的顺序可能是：

- **Big-Endian（大端序）**：高位在前（更高位字节放在更低的地址）
  - 存储顺序是：`b3 4f`
  - 这是网络协议规定的标准顺序 → 又称为 **Network Byte Order**
- **Little-Endian（小端序）**：低位在前（更低位字节放在更低的地址）
  - 存储顺序是：`4f b3`
  - 这是 Intel 架构（x86/x86_64）使用的方式



**Host Byte Order**：你自己计算机使用的字节序（Little-Endian 和 Big Endian 都可能）

**Network Byte Order**：所有网络传输使用的统一字节序 → Big Endian



C 提供了标准函数来转换主机字节序与网络字节序：

| 函数名    | 含义                  |
| --------- | --------------------- |
| `htons()` | Host to Network Short |
| `htonl()` | Host to Network Long  |
| `ntohs()` | Network to Host Short |
| `ntohl()` | Network to Host Long  |

这些函数根据你主机的字节序自动判断是否需要转换，保证你代码的跨平台可移植性







例子：

```c++
#include <netinet/in.h> // sockaddr_in, htons
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>

int main() {
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);

    struct sockaddr_in server_addr;
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = 8080;  // ❌ 错了！没有使用 htons()
    inet_pton(AF_INET, "1.2.3.4", &server_addr.sin_addr);

    connect(sockfd, (struct sockaddr*)&server_addr, sizeof(server_addr));
}
```



```c++
server_addr.sin_port = htons(8080);  // ✅ 正确地转换成网络字节序
```

`htons(8080)` 会把 `0x1F90` 转换成 `0x1F 0x90`（即高位在前，大端序），这样网络协议才能正确识别为端口 8080。





#### 哪些情况要转换

> **只要你的程序要在网络上传输整数类型（多字节），就必须将它从主机字节序（Host Byte Order）转为网络字节序（Network Byte Order）——即使用 `htons()`, `htonl()`，反之用 `ntohs()`, `ntohl()`。**



✅ 1. 填充 **网络地址结构体（如 `sockaddr_in`）时的端口号和 IP 地址**

```cpp
struct sockaddr_in addr;
addr.sin_family = AF_INET;
addr.sin_port = htons(8080);              // ✅ 端口要转成网络序
inet_pton(AF_INET, "127.0.0.1", &addr.sin_addr); // IP 是字符串，不用转换
```

Notice: 在自己的 addr 里用了网络序，因而自己获取这个值的时候还要转为主机序

| 场景                          | 是否需要转换     |
| ----------------------------- | ---------------- |
| 填 `sockaddr_in.sin_port`     | ✅ 用 `htons()`   |
| 读取 `sockaddr_in.sin_port`   | ✅ 用 `ntohs()`   |
| `inet_ntop/inet_pton` 处理 IP | ❌ 自动处理字节序 |



✅ 2. 手动构造网络数据包，发送整数

比如你要用 `send()` 或 `write()` 发送一个整数：

```cpp
uint32_t payload = 123456;
uint32_t net_payload = htonl(payload);
send(sockfd, &net_payload, sizeof(net_payload), 0);
```

> 否则，在不同字节序主机间通信时，对方解释出来的数字就会错。



✅ 3. 从网络读取了整数之后，准备使用它（还原为主机可理解格式）

```cpp
uint32_t net_num;
recv(sockfd, &net_num, sizeof(net_num), 0);
uint32_t host_num = ntohl(net_num);
```



✅ 4. 写自己的协议时，如：

- 你在包头里写了 `packet_length`, `opcode`, `checksum`, `timestamp` 等字段，它们都是整数。
- 就必须：**打包前 `hton\*()`，解包后 `ntoh\*()`**



❌ 不需要转换的场景：

| 场景                                         | 是否需要字节序转换 |
| -------------------------------------------- | ------------------ |
| `inet_pton()` 和 `inet_ntop()` 处理字符串 IP | ❌ 不需要           |
| 直接 `send()` / `recv()` 字符串 / 字节流     | ❌ 不需要           |
| 内存中数据自己用，不和网络通信               | ❌ 不需要           |
| 单字节（如 `char`, `uint8_t`）               | ❌ 不需要           |



✅ 小结口诀

> 发送整数 → `htons()` / `htonl()`
>  接收整数 → `ntohs()` / `ntohl()`
>  IP地址字符串 → `inet_pton()` / `inet_ntop()` 不用担心字节序







### 3.3 常用 structs

#### 🔸`int sockfd`

- Socket 描述符是一个普通 int, 表示 socket 作为文件的文件描述符



#### 🔸`struct addrinfo`

- 通用结构，配合 `getaddrinfo()` 使用
- 用于解析主机名、服务名，支持 IPv4/IPv6，返回链表

```c
struct addrinfo {
    int ai_family;       // AF_INET, AF_INET6
    int              ai_family;    // AF_INET, AF_INET6, AF_UNSPEC
    int              ai_socktype;  // SOCK_STREAM, SOCK_DGRAM
    int              ai_protocol;  // use 0 for "any"
    size_t           ai_addrlen;   // size of ai_addr in bytes
    struct sockaddr *ai_addr;      // struct sockaddr_in or _in6
    char            *ai_canonname; // full canonical hostname

    struct addrinfo *ai_next;      // linked list, next node
};
```

请注意，这是一个链表：`ai_next`指向下一个元素

通常可能不需要写入这些结构；通常，只需调用 `getaddrinfo()`填写 `struct addrinfo`即可





#### 🔸`struct sockaddr`

- 通用地址结构，所有地址结构都能转换成它
- 实际使用时用 `sockaddr_in` 或 `sockaddr_in6`，在调用时强制转换即可

```c
struct sockaddr {
    unsigned short sa_family;
    char sa_data[14]; // IP + 端口, 14 bytes of protocol address
};
```

**指针`struct sockaddr_in *`可以强制转换为指针`struct sockaddr` *，反之亦然**。所以，即使`connect()`你想要 a `struct sockaddr*`，你仍然可以`struct sockaddr_in`在最后一刻使用 a 并进行强制转换



#### 🔸`struct sockaddr_in`（IPv4）和 `struct sockaddr_in6`（IPv6）

```c
struct sockaddr_in {
    short sin_family;         // AF_INET
    unsigned short sin_port;  // htons(port)
    struct in_addr sin_addr;  // IP 地址（4 字节）
    char sin_zero[8];         // 填充用
};
```

```c
struct sockaddr_in6 {
    uint16_t sin6_family;   // AF_INET6
    uint16_t sin6_port;     // htons(port)
    struct in6_addr sin6_addr; // IP 地址（16 字节）
    // ... (其他目前不重要信息)
};
```



`sockaddr` 和 `sockaddr_in` , `sockaddr_in6` 的区别在于：

> `sockaddr` 是**通用结构体**，而 `sockaddr_in` 是专用于 **IPv4** 的结构体，`sockaddr_in`6 是专用于 **IPv6** 的结构体



#### 🔸`struct sockaddr_storage`

```c++
struct sockaddr_storage {
    sa_family_t  ss_family;     // address family

    // all this is padding, implementation specific, ignore it:
    char      __ss_pad1[_SS_PAD1SIZE];
    int64_t   __ss_align;
    char      __ss_pad2[_SS_PAD2SIZE];
};
```

- 能容纳 IPv4 或 IPv6 的大结构体，作为通用参数使用
- 可以在字段中看到地址族`ss_family`——检查一下它是否是`AF_INET`或`AF_INET6`（用于 IPv4 或 IPv6）。然后可以根据需要将其转换为 `struct sockaddr_in`或 `struct sockaddr_in6`



### 3.4 IP 地址转换函数

#### 字符串 → 二进制（结构体）：

```c
inet_pton(AF_INET, "10.0.0.1", &sa.sin_addr);      // IPv4
inet_pton(AF_INET6, "2001:db8::1", &sa6.sin6_addr); // IPv6
```

#### 二进制 → 字符串：

```c
inet_ntop(AF_INET, &sa.sin_addr, ipstr, INET_ADDRSTRLEN);
inet_ntop(AF_INET6, &sa6.sin6_addr, ip6str, INET6_ADDRSTRLEN);
```

> ```
> pton = printable → network`，`ntop = network → printable
> ```



#### 如何同时支持 IPv4 和 IPv6

总体建议：**尽量使用 `getaddrinfo()` 获取所有的 `sockaddr` 信息**，而不是自己手动填结构体字段。
 这样可以让你的程序**不依赖于具体的 IP 协议版本（IPv4 或 IPv6）**，并省掉很多后续的麻烦。



应该做的代码层面修改：

| 原 IPv4 做法                  | 替换为 IPv6 做法                        |
| ----------------------------- | --------------------------------------- |
| `AF_INET`                     | `AF_INET6`                              |
| `PF_INET`                     | `PF_INET6`                              |
| `INADDR_ANY`                  | `in6addr_any`                           |
| `struct sockaddr_in`          | `struct sockaddr_in6`                   |
| `struct in_addr`              | `struct in6_addr`                       |
| `inet_aton()` / `inet_addr()` | `inet_pton()`                           |
| `inet_ntoa()`                 | `inet_ntop()`                           |
| `gethostbyname()`             | ✅ 推荐使用 `getaddrinfo()`              |
| `gethostbyaddr()`             | ✅ 推荐使用 `getnameinfo()`（兼容 IPv6） |



关于 `in6addr_any` 初始化：

```c++
cCopyEditstruct sockaddr_in sa;
struct sockaddr_in6 sa6;

sa.sin_addr.s_addr = INADDR_ANY;   // 使用我的 IPv4 地址
sa6.sin6_addr = in6addr_any;       // 使用我的 IPv6 地址
```



你也可以使用宏 `IN6ADDR_ANY_INIT` 来初始化一个 IPv6 地址：

```c++
struct in6_addr ia6 = IN6ADDR_ANY_INIT;
```



提醒：

- 替换 `sockaddr_in` 时要小心字段变动，例如 `sin6_*` 字段名不同于 `sin_*`
- IPv6 中 **不再有** `sin6_zero` 字段
- `INADDR_BROADCAST` 在 IPv6 中已废弃 → 改用 **IPv6 多播（multicast）**



总结

> 要写支持 IPv6 的程序，**用 `getaddrinfo()`**，**用 `AF_INET6`**，**用 `inet_pton/ntop` 替代旧函数**，其它结构体字段跟着版本名改成带 `6` 的版本。





## 4 System calls

总体来说 sockets 就是 Inter-process (across machines) communication channels

2-way byte streams.



### 4.1 `getaddrinfo`: 把信息转化进一个 `addrinfo *` 里 (链表) 表示可能的连接方式

Unix 和 Linux 系统的 socket 接口：

```c++
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>

int getaddrinfo(const char *node,     // 比如 "www.example.com" 或 IP
                const char *service,  // 比如 "http" 或端口号
                const struct addrinfo *hints,
                struct addrinfo **res);

```

你提供三个输入参数，它返回一个结果链表 `res`。

- `node` 是主机名或 IP 地址。
- `service` 是端口号或服务名（比如 "http", "ftp", "smtp"，可以在 IANA Port List 或 Unix 的 `/etc/services` 中找到）。
- `hints` 是你事先填好的 `addrinfo` 结构体，用于限制返回结果。



ex：假设你是服务器，想监听本机 IP 地址的 3490 端口：

```c++
cCopyEditint status;
struct addrinfo hints;
struct addrinfo *servinfo;

memset(&hints, 0, sizeof hints);
hints.ai_family = AF_UNSPEC;     // IPv4 或 IPv6 都行
hints.ai_socktype = SOCK_STREAM; // TCP
hints.ai_flags = AI_PASSIVE;     // 自动填本地 IP

status = getaddrinfo(NULL, "3490", &hints, &servinfo);

if (status != 0) {
    fprintf(stderr, "gai error: %s\n", gai_strerror(status));
    exit(1);
}

// 使用完 servinfo 后释放
freeaddrinfo(servinfo);
```

注意我们设置了 `ai_family = AF_UNSPEC` 表示不在乎用 IPv4 还是 IPv6，你也可以指定 AF_INET 或 AF_INET6。

`AI_PASSIVE` 表示我们想绑定本机的 IP 地址（即用于监听）。如果你不使用 `AI_PASSIVE`，可以在 `node` 传入具体的 IP。

你也可以用类似方法做客户端请求（如连接到 `www.example.net:3490`），只需要改一下 `node` 和 `service` 参数即可。

这个函数的核心作用：把主机名+服务名转换成 IP 地址+端口号，并以链表形式返回多个可能的结果。



##### 如何使用返回的 `addrinfo *` 以及它为什么是个 linked list

> `getaddrinfo()` 返回的链表中的每个节点（`struct addrinfo *`）都描述了**一个“可以尝试的通信方式”**，包括：

- 用哪个地址族（IPv4 还是 IPv6）
- 用哪个 socket 类型（TCP 还是 UDP）
- 用哪个协议（一般自动匹配）
- 用哪个 IP 地址（可能有多个）
- 用哪个端口

所以：
 🧠 **一个主机名 + 端口 → 可能会对应多个可用的地址！**

例如：

假设你写：

```c++
getaddrinfo("www.google.com", "80", &hints, &res);
```

你会得到一个链表，内容可能类似：

```c++
makefileCopyEditres = {
  [0] AF_INET6, SOCK_STREAM, ::ffff:172.217.3.110 (IPv6地址)
  [1] AF_INET,  SOCK_STREAM, 172.217.3.110 (IPv4地址)
}
```

其中每个 node 包括:

| node 内容   | 含义                       |
| ----------- | -------------------------- |
| ai_family   | 地址族：AF_INET / AF_INET6 |
| ai_socktype | 套接字类型：SOCK_STREAM 等 |
| ai_addr     | IP + 端口组合              |
| ai_next     | 指向下一个 node            |



这说明：**你可以选择用 IPv6 或 IPv4 的方式去连接 Google！**

你不知道哪种方式能通:

- 有的机器支持 IPv6，有的不支持
- 有的远程服务器某些 IP 可能被防火墙拦了
- 有的方式虽然合法，但无法建立连接

所以你就得遍历整个链表，**尝试一个个连过去**，直到成功：

```c++
CopyEditfor (p = res; p != NULL; p = p->ai_next) {
    socket(...) → connect(...) → 成功了就 break;
}
```



如果你不遍历会怎样？ 比如你只用了 `res` 的第一个：

```c++
connect(sockfd, res->ai_addr, res->ai_addrlen);
```

但如果这个地址不通（比如 IPv6 被禁了），你程序就**连接失败了**，而不会尝试 IPv4 的候选项





用例 1: getaddrinfo 后尝试 connect 直到成功

```c++
struct addrinfo hints, *res;

memset(&hints, 0, sizeof hints);
hints.ai_family = AF_UNSPEC;     // 支持 IPv4 或 IPv6
hints.ai_socktype = SOCK_STREAM; // TCP

int status = getaddrinfo("www.example.com", "80", &hints, &res);


struct addrinfo *p;
int sockfd;

for (p = res; p != NULL; p = p->ai_next) {
    sockfd = socket(p->ai_family, p->ai_socktype, p->ai_protocol);
    if (sockfd == -1) {
        perror("socket");
        continue;
    }

    if (connect(sockfd, p->ai_addr, p->ai_addrlen) == -1) {
        perror("connect");
        close(sockfd);
        continue;
    }

    break;  // 成功！
}

if (p == NULL) {
    fprintf(stderr, "failed to connect\n");
}
```



用例 2: 打印 ip

```c++
char ipstr[INET6_ADDRSTRLEN];

void *addr;
if (p->ai_family == AF_INET) {
    struct sockaddr_in *ipv4 = (struct sockaddr_in *)p->ai_addr;
    addr = &(ipv4->sin_addr);
} else {
    struct sockaddr_in6 *ipv6 = (struct sockaddr_in6 *)p->ai_addr;
    addr = &(ipv6->sin6_addr);
}

inet_ntop(p->ai_family, addr, ipstr, sizeof ipstr);
printf("Connecting to %s\n", ipstr);
```



##### 总结用法

```
getaddrinfo();     // 获取链表
↓
遍历链表：
   socket()
   connect()/bind()
↓
freeaddrinfo();    // 回收链表内存
```



### 4.2 `socket`: construct 一个 socket 并返回文件描述符

```c++
int socket(int domain, int type, int protocol); 
```

- `domain`：地址族，如 `PF_INET`（IPv4）、`PF_INET6`（IPv6）。
- `type`：套接字类型，如 `SOCK_STREAM`（TCP）或 `SOCK_DGRAM`（UDP）。
- `protocol`：协议编号，通常设为 `0` 以自动选择（如 TCP 或 UDP）。也可以用 `getprotobyname("tcp")` 等查具体协议。

**推荐做法：** 使用 `getaddrinfo()` 返回的 `ai_family`、`ai_socktype` 和 `ai_protocol` 参数直接调用 `socket()`。

成功时返回 **socket 描述符**（int），失败则返回 `-1` 并设置 `errno`。







### 4.3 `bind()`: 绑定 socket 我在哪个本地端口上

可以这样类比：

- `socket()` → 创建一个“空的网络插口”
- `bind()` → 告诉操作系统：
   要用这个插口监听/发送从 **哪个 IP 的哪个端口** 的数据

注意: `bind()` 是绑定 **“本地”** 的 IP 和端口！

> `bind()` 决定的是：**你自己的 socket** 在网络上的“身份”——你从哪个本地 IP 和端口出发，来和别人通信。

```c++
int bind(int sockfd, struct sockaddr *my_addr, int addrlen);
```

- `sockfd`：由 `socket()` 返回的描述符。
- `my_addr`：本地地址结构（IP + 端口）。
- `addrlen`：地址结构体字节长度。

示例（绑定本机端口 3490）：

(`res` 表示一个 `addrinfo *`)

```c++
bind(sockfd, res->ai_addr, res->ai_addrlen);
```

- 若使用 `AI_PASSIVE`，系统会自动填写本地 IP。

- 端口号 ≤ 1023 为特权端口，普通用户无法绑定。

- 若反复绑定同一端口可能报 “Address already in use”，可配合：

  ```c++
  setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof yes);
  ```

- 对于客户端程序，若你不关心本机端口，调用 `connect()` 时内核会自动分配端口，无需先 `bind()`。



note: 通过 `my_addr->sin_port` 获取 port number

如果 port number 为 0， 那么 OS 会 choose a port number for you





### 4.4 `connect()`: 尝试连接远程主机

```c++
int connect(int sockfd, struct sockaddr *serv_addr, int addrlen);
```

- 用于主动连接远程主机。
- `serv_addr` 是远程主机的 ip+port, 其可以从对远程主机的 `getaddrinfo()` 操作后的 `addrinfo *` 指向的 info 里面的 `sorkaddr * ai_addr` 这个变量获得
- 成功返回 `0`，失败返回 `-1` 并设置 `errno`。

客户端常见流程：

```c++
connect(sockfd, res->ai_addr, res->ai_addrlen);
```

无需显式调用 `bind()`，除非你希望指定本地端口，那么就 bind 之后然后 connect



（这个 len 变量也可以省略）

```
connect(sockfd, "example.com:443");
```

这会触发系统自动：

- bind 一个本地临时端口（比如 `192.168.0.2:54321`）
- 然后用这个端口作为源，发起 TCP 连接到 `example.com:443`

所以**通信的本质是：**

```
你：192.168.0.2:54321 (主动 bind 的或者自动分配的)
服务器：93.184.216.34:443
```







### 4.5 `listen()` 允许别人的连接

如果直接 connect 一个别人的主机，是行不通的。因为别人的主机一定要（允许连接）

`listen` 就表示：我的（开启了 socket 的）主机，允许别人的连接

```c++
int listen(int sockfd, int backlog);
```

- `sockfd`：监听 socket 描述符。
- `backlog`：未接受连接的队列长度（一般系统默认 ~20，推荐设 5–10）。



incoming requests 会 wait in a queue sized `backlog`.









典型流程：

server:

```c++
int sfd = socket(..);
bind(..);
listen(sockfd, BACKLOG);
// 之后继续补充
```

client: 

```c++
int stdclient = socket(..);
bind(..);
connect(..);
```





### 4.6 `accept()`: connection 完成后, server 接受和某个 client 进行数据传输

```c++
int accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen);
```

- `sockfd`：使用 `listen()` 的监听 socket 描述符。
- `addr`：指向 `sockaddr_storage`，用于存放客户端地址信息。
- `addrlen`：指向该结构体大小的变量，函数返回时更新真实长度。



1. server 开始了 `listen`

2. client 开始了 `connect` 

3. 现在 server 收到了 client 的 `connect` 请求
4. connection 完成（此中间有三次握手）

这就完成了 client 端的整个连接步骤。

- client 的 `connect` 此时已经 return。
- server 的内核将该连接放入 **accept queue**



不过此时，server 还差临门一脚：这个 client 的信息现在在 server 的 `accept queue` 里，还没有被 accept。**此时，client 已经可以给 server 发送和接收消息**了，只不过 

- **client send 的东西会先堆积在 server 的 kernel buffer**，client 的 recv 会 block 到 server send 消息给 client 自己为止（常态也是，不过这时肯定等不到）
- server **用户态代码**无法发送/接收，因为 `accept()` 尚未完成（用户态代码还没有通过 `accept()` 拿到这个 socket）



然后，在 connection 完成后：

5. 如果要真正进行数据交互，必须要等待 server `accept`，如刚才所说。
6. server `accept` 了这个 client 后，才算双向的连接建立。此后它们的信息交互平等。





注意：

`accept()` 返回一个 **新的 socket 描述符**，用于与该客户端通信；**原来的 `sockfd` 用于继续监听**。返回 `-1` 则表示失败。

示例结构：

```c++
new_fd = accept(sockfd, (struct sockaddr *)&their_addr, &addr_size);
```

**后续可使用 `new_fd` 与客户端进行 `send()` 和 `recv()`。**



### 总结与补充两个主机连接前的所有步骤：三次握手

两个主机，各自都可以作为 server / client. 

server 就是 listen 连接，并再连接后开始的主机

client 就是发起 connect 请求的主机



但是 **server 和 client 的区别也仅限于连接这一步。在 call `listen` / `connect` 前它们没有 client 和 server 的区别，全一样；在成功连接后，它们也没有区别，没有主次之分**！连接是双向的，就是说 server 和 client 在连接后相互可以自由地给对方发送消息（相互都可以 send, recv, read 和 write）

```
本地 ←→ 服务器
```



这里说一下 block 的情景和 “三次握手” 



```
Client                           Server
  |                                |
  | --- SYN ---------------------> | ① 第一次握手: 客户端发 SYN
  |                                |
  | <--- SYN+ACK ----------------  | ② 第二次握手: 服务器内核响应 SYN+ACK
  |                                |
  | --- ACK ---------------------> | ③ 第三次握手: 客户端发 ACK
  |                                |
connect() returns              [连接进入 accept 队列]
```



#### 三次握手期间双方分别在干什么？

client 执行了：

```c++
/*
socket();
bind();
*/
connect(sockfd, (sockaddr *)&addr, sizeof(addr));
```

1. `connect()` 触发了第一次握手，发送一个 **SYN 包** 到远程服务器。
2. `connect()` **阻塞，直到对方回应**（等待 server 发起第二次握手发送 SYN+ACK，收到后 client 发起第三次握手，回 ACK 给 server）；
3. 三次握手完成后，`connect()` 返回，你的 socket 就准备好收发数据了。

### 

server:

```c++
/*
socket();
bind();
*/
listen(); // 在等待别人连接
```

当客户端 `connect()` 过来：

1. 服务器内核收到 SYN（第一次握手）；
2. 内核自动回 SYN+ACK（第二次握手）；
3. 等待客户端发来 ACK（第三次握手）；
4. 三次握手完成后，连接正式建立，**这个连接加入到 accept 队列**；
5. 用户代码中 `accept()` 返回一个新的 socket，用于通信。





#### 什么时候 client 会 Block

没错: 只有一种时候会 block，就是 client 发起 connect 等待 server 回复 SYN+ACK。(connect 只会等待 server 回包，不用等待 server accept)

**如果在设定的时间（几秒）内，server 并没回应，那么 client 的 connect 就会报错.**

- 如果 server 压根没开启端口或者没启动，又或是没 `listen`，那么 client 一定会 block 到超时并报错
- 如果 server 的 syn queue 队列太长，来不及回应这次 connect，那么最后也会超时并报错

| 错误码         | 意义       | 原因                         |
| -------------- | ---------- | ---------------------------- |
| `ECONNREFUSED` | 连接被拒绝 | 对方 IP 有响应但端口没在监听 |
| `ETIMEDOUT`    | 超时无响应 | 对方 IP 不存在或被防火墙丢弃 |
| `EHOSTUNREACH` | 主机不可达 | 网络未通                     |





#### server 的 `accept` 与否: 不会 block client 的 `connect`, 但会影响数据的交流

✅ 因为只要服务器调用了 `listen()` 并且内核三次握手成功，`connect()` 就会**正常返回**。客户端根本**不会管服务器有没有 accept**。

所以 server accept 与否不会影响 client 的 `connect` 的运行。



`accept` 影响是 server 端：

| 队列名                         | 含义                                   |
| ------------------------------ | -------------------------------------- |
| **半连接队列（syn queue）**    | 存放收到 SYN 但未完成三次握手的连接    |
| **已连接队列（accept queue）** | 三次握手完成但还没被 `accept()` 的连接 |

如果服务器没有 `accept()`：

- 客户端 `connect()` 成功后，可以调用 `send()`；
- 但因为服务器进程没有调用 `accept()` 取出连接，也没有 `recv()`；
- 数据就会在**内核缓冲区中堆积**；
- 如果数据太多，缓冲区满，`send()` 会阻塞甚至失败。



虽然 `accept` 影响的是数据的沟通而非 connection，不过长时间不 `accept()`，可能导致连接被关闭

- 内核可能超时丢弃连接（依据操作系统策略）；
- 中间 NAT 设备可能认为“长时间没有活跃通信”，就会断掉连接；
- 客户端就会收到 RST 或超时，导致连接被意外关闭。

| 服务器 `accept()` 吗？ | 客户端能否连接成功？     | 会发生什么                               |
| ---------------------- | ------------------------ | ---------------------------------------- |
| 是                     | ✅ 成功                   | 连接立即交给服务器进程处理               |
| 否（但 `listen()` 了） | ✅ 成功                   | 卡在内核队列中，数据可能被忽略，资源耗尽 |
| 否（accept 队列满）    | ❌ `connect()` 阻塞或失败 | 无法处理新连接                           |









### 4.7 `send()` 和 `recv()` — 本地主机和远程主机进行交流

只要 server `accept` 了

用于 **TCP（流式）套接字或已连接的 UDP 套接字**。

```c++
int send(int sockfd, const void *buf, int len, int flags);
int recv(int sockfd, void *buf, int len, int flags);
```

- `send()` 返回发送的字节数，可能小于请求长度；返回 `-1` 表示错误。
- `recv()` 返回接收到的字节数，或 `0` 表示对方已关闭连接；返回 `-1` 表示错误。（有时候需要检查返回值：对方是否 send 完了我需要的内容？可能需要循环 recv）

（注意：`send()` 不会发送空的内容，因而 `recv` 返回 0 的时候一定是对方已经关闭了连接）

阻塞情况：

- `buf` 是准备发送的内容和准备接收的内容存放的地方, 
- `len` 表示 send 多长的内容，以及 `recv` 最多接收多少内容

（注意：`send()` 不会发送空的内容，因而 `recv` 返回 0 的时候一定是对方已经关闭了连接）

- flags: 

  ✅ `send()` / `sendto()` 中的 `flags`

  | 标志           | 含义                                           |
  | -------------- | ---------------------------------------------- |
  | `0`            | 默认行为：尽可能发送，可能阻塞                 |
  | `MSG_DONTWAIT` | 非阻塞发送（立刻返回，不等待缓冲区有空位）     |
  | `MSG_OOB`      | 发送 out-of-band 紧急数据（仅限于 TCP）        |
  | `MSG_NOSIGNAL` | 不发送 `SIGPIPE` 信号（某些系统如 Linux 支持） |

  ✅ `recv()` / `recvfrom()` 中的 `flags`

  | 标志           | 含义                                            |
  | -------------- | ----------------------------------------------- |
  | `0`            | 默认行为，阻塞直到接收到一些数据                |
  | `MSG_DONTWAIT` | 非阻塞接收（立刻返回，即使没有数据）            |
  | `MSG_PEEK`     | 查看缓冲区的数据但不移除（peek 预读）           |
  | `MSG_WAITALL`  | 阻塞直到接收到 `len` 个字节为止（或者连接关闭） |
  | `MSG_OOB`      | 接收 out-of-band 紧急数据                       |



阻塞情况：

- `recv()` 会一直等待直到有数据可读。
- **`send()` 在缓冲区满时也可能阻塞。**



ex:

send 简单

```c++
std::string message = "ok";
send(sockfd, message.data(), message.length(), 0);
```

recv:



```c++
char buf[1024];
int n = recv(sockfd, buf, sizeof(buf), 0);

if (n == 0) {
    printf("对方关闭了连接\n");
}
else if (n > 0) {
    printf("接收到 %d 字节数据\n", n);
}
else {
    perror("recv 出错");
}

message = std::string(buf, n);
// 如果 message 存在: message.append(buf.data(), recvd);
```



#### block recv 直到收到想要 len 的信息

```c++
char UMID[8];
int n = recv(sockfd, buf, 8, MSG_WAITALL);
```





### 4.8 `close()`: 关闭一个 socket; `shutdown`: 关闭一个 socket 的部分功能

```c++
int close(int sockdf);
```

- 关闭 socket 对应的 **文件描述符**，释放内核资源。
- 对于 **TCP 连接**，它还会发送一个 **FIN 包**，通知对方：我这边 **不再发送数据了**（但是可以继续接收对方发的数据）。
- 被关闭的 `sockfd` 之后不能再用：再调用 `send()` 或 `recv()` 会返回 `-1` 并设置 `errno`。



| 返回值 | 意义                                      |
| ------ | ----------------------------------------- |
| `0`    | 成功关闭文件/连接                         |
| `-1`   | 关闭失败，需查看 `errno` 获取具体错误原因 |

| 错误码  | 含义                                                     |
| ------- | -------------------------------------------------------- |
| `EBADF` | `fd` 不是一个有效的打开文件描述符（Bad file descriptor） |
| `EINTR` | 调用被信号中断（Interrupted）                            |
| `EIO`   | I/O 错误，通常是设备错误或文件系统问题                   |





shutdown:

```c++
int shutdown(int sockfd, int how);
```

- `sockfd`：要关闭的 socket 文件描述符
- `how`：指定关闭哪一部分功能：

| 值   | 宏名        | 含义                                       |
| ---- | ----------- | ------------------------------------------ |
| `0`  | `SHUT_RD`   | 关闭读操作：对方再发送数据将被丢弃         |
| `1`  | `SHUT_WR`   | 关闭写操作：不会再发送数据，对方将收到 EOF |
| `2`  | `SHUT_RDWR` | 读写都关闭（相当于 `SHUT_RD` + `SHUT_WR`） |

和 `close()` 的区别：

| 特性       | `shutdown()`                          | `close()`             |
| ---------- | ------------------------------------- | --------------------- |
| 控制粒度   | ✅ 可以只关闭读/写方向                 | ❌ 直接关闭整个 socket |
| 多进程共享 | ✅ 不影响其他共享该 socket 的进程      | ❌ 会导致 fd 被回收    |
| 应用场景   | 半关闭连接（如告诉对方 “我不再发了”） | 完全释放资源          |

shutdown 是不可逆的.



## 小结：典型 client server 的 internet 交互

server:

```c++
socket();
sockaddr_in = ... // Configure a sockaddr_in for the accepting socket.
// Note: 可以把 sockaddr_in 替换为 sockaddr_storage + getaddrinfo() 做更通用（支持 IPv6）
bind();

listen();

while (true) { 
	accept();// → 返回 new_fd
    
	recv(new_fd, …); // receive from client
    send(new_fd, …); // send to client
    // print...
    
    close(new_fd);
}

```

client:

```c++
socket();
// bind(); // 可以不需要, 自动分配

getaddrinfo(); // specify remote host and port → struct sockaddr
connect(); 

send(sockfd, …);
// recv(sockfd, …); // client 通常不太 recv from server
close(sockfd);
```



更细的：

Here is some starter code for the client.

```c++
#include <iostream>
#include <string>

static const size_t MAX_MESSAGE_SIZE = 256;

int main(int argc, const char **argv) {
    // Parse command line arguments
    if (argc != 4) {
        std::cout << "Usage: ./client <hostname> <port> <message>\n";
        return(-1);
    }
    const char* hostname = argv[1];
    const char* port = argv[2];
    std::string message(argv[3]);

    std::cout << "Sending " << message << " to " << hostname << ":"
              << port << std::endl;

    // Create a socket.  Use socket().

    // Create a sockaddr to specify remote host and port.  Use getaddrinfo().

    // Connect to remote server.  Use connect().

    // Send message to remote server.  Use send().

    // Close connection.  Use close().

    return(0);
}
```

Here is some starter code for the server.

```c++
#include <iostream>

static const size_t MAX_MESSAGE_SIZE = 256;

int main() {
    // Create socket for accepting connections.  Use socket().

    // Configure a sockaddr_in for the accepting socket.

    // Bind to a port.  Use bind().

    // Begin listening for incoming connections.  Use listen().

    // Serve incoming connections one by one forever.
    while (true) {
        // Accept connection from client.  Use accept().

        // Receive message from client.  Use recv().

        // Print message from client.

        // Close connection.  Use close().
    }

    return(0);
}
```

