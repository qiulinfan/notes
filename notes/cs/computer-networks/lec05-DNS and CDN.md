

### Content Distribution Networks (CDN)

**核心思想**：把热门网站或内容复制到多台机器上。

**目的**：

1. **分担负载**（Spreads load across servers）——多台服务器同时服务，避免单点拥堵。
2. **让内容更接近用户**（Places content closer to clients）——减少网络传输延迟。
3. **在内容不可缓存时仍有帮助**（Helps when content isn’t cacheable）——例如动态或频繁更新的内容，也能通过复制来提高可用性。





CDN:

- **定义**：CDN 是提供缓存（Caching）和复制（Replication）服务的系统。
- **结构**：它是一个**大规模的分布式存储网络**，通常由一个公司集中管理（比如 Akamai 在 130 个国家、1700 个网络中运营）。
- **作用**：
  - 将内容分布到全球各地的节点，让用户从最近的节点获取数据。
  - 结合了两种机制：
    - **Pull 模式**：当客户端发出请求时再拉取内容（属于 caching，按需加载）。
    - **Push 模式**：根据预期访问量提前把内容推送到各地节点（属于 replication，提前分发）。


 **CDN** 利用复制和缓存，把内容分发到离用户最近的地方，提高速度与可靠性。







**Cost-effective content delivery（低成本内容分发）**

**核心思想**：让**多个网站共用同一套物理基础设施**（比如同一批服务器和网络资源），这样能显著降低成本。

**节省成本的原因：**

1. **Statistical multiplexing（统计复用）**：不同网站的访问高峰错开，因此可以共享服务器容量。
2. **Economies of scale（规模经济）**：大规模运营带来批量采购和维护上的成本优势。
3. **Amortization of human costs（摊薄人工成本）**：同一个技术团队可以维护多个网站，节约人力。

**例子：**

- CDN 服务提供商
- 网站托管公司（Web hosting）
- 云基础设施（Cloud providers）

一句话总结：

> **共享基础设施让内容分发更便宜、更高效。**

------

### 二、CDN example – Akamai（Akamai 实例）

**运作方式：**

1. **Akamai 为每个客户网站创建独立的子域名**
    例如：`cnn.com` 的资源变成 `a128.g.akamai.net`。

2. **内容提供者修改自己的网页链接**
    比如：

   - 原本是 `http://www.cnn.com/image-of-the-day.gif`
   - 改成 `http://a128.g.akamai.net/image-of-the-day.gif`

   这个过程叫 “**Akamai 化（Akamaiize）**”——让网页的资源从 Akamai 的网络加载。

3. **请求被重定向到 Akamai 的 CDN 基础设施**
    也就是说，用户不再直接访问 CNN 的服务器，而是访问离自己最近的 Akamai 节点，从而加速访问、减轻源站负载。



即: Akamai 通过给客户分配特定域名，把内容分发到自己的全球节点上，让用户请求由 CDN 处理，而不是直接访问原站。





但是, 我既然给出相同的域名, 那么怎么得到离我最近的节点呢?  

答: 是 DNS 在帮助 CDN 做这件事.

1. **用户发起 DNS 查询**
    比如你在美国密歇根，想访问 Akamai 的资源。你的电脑会问本地 DNS（通常是 ISP 的 DNS 服务器）：“`a128.g.akamai.net` 的 IP 地址是什么？”

2. **请求被转发到 Akamai 的权威 DNS**
    Akamai 的 DNS 系统维护着成千上万台 CDN 节点的位置信息和健康状态。

3. **Akamai 的 DNS 判断你的地理位置**
    它通过查询来源 DNS 服务器的 IP 地址（或者利用 Anycast / GeoIP 数据）大致推测你的位置。

4. **DNS 返回最近的节点 IP**
    例如：

   - 如果你在密歇根，返回芝加哥的节点；
   - 如果你在东京，返回东京的节点。

   所以同一个域名 `a128.g.akamai.net`，在不同地点解析到的 IP 地址不同。



CDN 利用 DNS 的“地理定向解析”机制，让相同域名在不同地区解析到不同服务器，从而实现“就近访问”。









# DNS

**核心问题**：我们需要一种方法，把**人类可读的名字**（如 `cse.umich.edu`）映射到**机器可用的地址**（如 `141.212.113.143`）。

- **Machine address**（机器地址）
  - 是路由器能理解的标签，对应网络结构（**“where”**）
- **Machine name**（机器名称）
  - 是人类能理解的标签，对应组织结构（**“who”**）
- **DNS 的作用**：
   → 它是一个 **directory service（目录服务）**，负责把名字解析成地址。

## DNS 的目标与实现思路

DNS 设计要解决规模和自治问题：

1. **Uniqueness**：名字不能冲突。
2. **Scalable**：能支持大量名字，且能频繁更新。
3. **Distributed & Autonomous**：每个组织可以自己管理自己的命名空间，不用管别人。
4. **Highly available**：必须随时可用。
5. **Fast lookups**：解析速度要快。
6. **Perfect consistency is NOT required**：
    不追求每次更新都立即同步到全球，只要最终一致就行（提高效率与容错性）。





DNS 的实现思路：

1. **Partition the namespace**：把整个命名空间（所有域名）分区。
2. **Distribute administration**：每个分区由不同组织管理，比如 `.edu`、`.com`、`umich.edu` 各自独立。
3. **Distribute name resolution**：每个分区都有自己负责的 DNS 服务器。
4. → 所以 DNS 是一个“**分布式、分层管理**”的系统。



### Key idea: Hierarchy（关键理念：层次化）

DNS 同时具有三种“层级结构”：

1. **Hierarchical namespace**：域名本身是分层的（比如从右到左：`edu → umich → cse`）。
2. **Hierarchically administered**：每一级由不同组织管理。
   - `.edu` 由教育域管理，`umich.edu` 由密歇根大学管理。
3. **Hierarchical servers**：DNS 服务器也是分层分布的（Root → TLD → Authoritative）。

### 

> DNS 是一个分布式、分层的名字解析系统，它让全球的域名都能唯一、高效地解析成 IP 地址。
>
> 而在 **CDN** 场景下，CDN 就在它的 **权威 DNS 层** 动态决定：
>  “从哪里（哪个节点）给用户返回 IP”，
>  这就是为什么相同的域名在不同地点解析结果不同。



![Screenshot 2025-10-15 at 07.31.00](assets/Screenshot 2025-10-15 at 07.31.00.png)











### DNS 服务器层级

DNS 的三层服务器结构



**Root servers（根服务器）**

- 位于最顶层（整个 DNS 的入口）。

- 每个 DNS 系统都内置它们的位置（hardwired）。

- 根服务器知道所有顶级域（TLD）服务器的位置。

  > 举例：当你查 `.edu` 或 `.com` 时，根服务器会告诉你去哪个 TLD 服务器。

![Screenshot 2025-10-15 at 07.33.22](assets/Screenshot 2025-10-15 at 07.33.22.png)





**Top-level domain (TLD) servers（顶级域名服务器）**

- 负责管理如 `.com`, `.edu`, `.org` 等域。
- 通常由大型组织或注册局专业维护。
- 它们知道**每个具体域（如 `umich.edu`）的权威服务器在哪里**。





**Authoritative DNS servers（权威服务器）**

- 处于最底层，真正存储域名到 IP 地址的映射（即 **resource records**）。

- 由具体组织维护，比如密歇根大学维护 `umich.edu` 的权威 DNS。

  > 举例：`cse.umich.edu → 141.212.113.143` 就存放在它那里。



每个 DNS 服务器只知道自己的一部分

- 每台服务器只保存整个 DNS 数据库的一小部分（small subset）。
- 权威服务器只保存自己域的记录。
- 各级服务器之间通过“知道下一级地址”来完成整个解析过程：
  - 每台 DNS 服务器都知道根服务器的位置。
  - 根服务器知道所有 TLD 的位置。
  - TLD 知道各个子域的权威服务器。



> 整体流程举例：解析 `cse.umich.edu`
>
> 1. 你的电脑问本地 DNS：“cse.umich.edu 是哪个 IP？”
> 2. 本地 DNS 问 **根服务器** → 得到 “去找 .edu 的 TLD”。
> 3. 问 **.edu TLD 服务器** → 得到 “去找 umich.edu 的权威服务器”。
> 4. 问 **umich.edu 的权威服务器** → 得到最终 IP。
> 5. 把结果缓存下来，下次就不用再走全程。



总结：

> DNS 是一个三层的分布式查询系统：
>  **Root → TLD → Authoritative**，
>  每层只掌握部分信息，但通过层层指引，最终找到目标 IP。







## Resources records

DNS 中的所有信息都以 **资源记录 (RR)** 的形式存储。
 每条 RR 都是一个四元组：

> **(name, value, type, TTL)**

- `name`：域名
- `value`：对应的值（可能是 IP、另一个名字、邮件服务器等）
- `type`：记录类型
- `TTL`：缓存存活时间 (Time To Live)



### 常见的 record types

| 类型                       | 含义                     | 解释                                               |
| -------------------------- | ------------------------ | -------------------------------------------------- |
| **A (Address)**            | 主机名 → IP 地址         | name 是主机名, value 是 IPv4 地址                  |
| **NS (Name Server)**       | 域名 → 权威 DNS 服务器名 | 告诉别人“谁管这个域”                               |
| **CNAME (Canonical Name)** | 别名 → 真实名字          | 比如 `cse.umich.edu` 实际对应 `cse.eecs.umich.edu` |
| **MX (Mail eXchanger)**    | 域名 → 邮件服务器        | 告诉邮件系统把邮件投递到哪个服务器                 |



### DNS 记录注册流程（以 `foobar.com` 为例）

1. **注册域名**
    在域名注册商 (registrar) 那里注册 `foobar.com`，并提供你自建的权威服务器（比如 `dns1.foobar.com`）及其 IP。
2. **注册商更新 TLD 服务器信息**
    它会在 `.com` 的 TLD 服务器中插入两条记录：
   - `(foobar.com, dns1.foobar.com, NS)` → 表示这个域由谁管理
   - `(dns1.foobar.com, 212.44.9.129, A)` → 告诉别人 `dns1.foobar.com` 的地址
3. **在你自己的权威服务器上存储 RR**
    比如在 `dns1.foobar.com` 上：
   - `(www.foobar.com, 212.44.9.130, A)`
   - `(foobar.com, mail.foobar.com, MX)`

这样别人解析 `www.foobar.com` 时，就能顺着层级一步步查到你这里。

总结：

> DNS 记录 (RR) 是 DNS 的核心数据结构，用来描述“名字对应什么”。
>
> 注册时，TLD 服务器知道“谁是权威”；权威服务器保存“具体映射”。





## DNS 的客户端组成 (Client/App View)

DNS 在客户端有 **两个关键组成部分**：

1. **Local DNS server（本地 DNS 服务器）**
   - 也叫 “default name server”。
   - 通常由 ISP 或学校维护（例如 `10.10.10.10`）。
   - 用户的电脑通过 **DHCP** 自动获取到它的地址。
2. **Resolver（解析器）**
   - 运行在你的主机（OS）上，负责向本地 DNS 发送查询请求。
   - 它知道“问谁”，但不做复杂解析。



### 工作流程（从应用到解析）

1. **应用程序获取域名**

   - 比如浏览器访问 `https://www.google.com`。
   - 应用会调用操作系统接口（如 `getaddrinfo()`）。

2. **操作系统调用 resolver**

   - resolver 把查询请求发给你的本地 DNS 服务器（如 `10.10.10.10`）。

3. **本地 DNS 服务器负责递归解析**

   - 它会去问根服务器、TLD、权威服务器，直到拿到 IP。
   - 然后把结果返回给客户端，并缓存起来。

4. **应用获得 IP 地址**

   - 比如通过 Python 的例子：

     ```
     import socket
     s = socket.getaddrinfo("www.google.com", 80)
     print(s)
     ```

     输出结果：

     ```
     [('142.250.190.132', 80)]
     ```

     表示成功解析到了 Google 的服务器 IP。



### recursive resolution 和 iterative resolution

有两种 name resolution. 一种 recursive, 一种 iterative.

简单来说:

- recursive 就是: 我们主机只问 DNS 一次, 收到一次回答. 

  其中的过程: 由 DNS 全程负责, 递归解析

  也就是 DNS 一层一层问, 然后一层一层返回到 DNS 那边, 最后 DNS 告诉我们.

  - 先问 **Root 服务器**：“谁管 .com？”
  - Root 回复：“去问 .com TLD 服务器。”
  - 然后问 **.com TLD 服务器**：“谁管 cnn.com？”
  - TLD 回复：“去问 cnn.com 的权威服务器。”
  - 最后问 **cnn.com 权威服务器**，得到 IP。

  把最终 IP 回复给客户端，并缓存结果。

  

  

- 迭代查询 (iterative lookup): 如果你自己去实现 DNS 客户端，而不依赖本地 DNS, 那么我们可以 iteratively 做这件事:

  - 问 root 等待 → 得 TLD 地址
  - 问 TLD 等待 → 得权威地址
  - 问权威 → 得最终 IP

  每一步都我们自己等待 -> 更进. 

  这种就叫 **迭代查询 (iterative lookup)**

  一言以蔽之: 就是一级一级 ask server: who to ask next. 只不过不用递归而是用do while 等待循环罢了.



| 特性               | 递归查询 (Recursive)   | 迭代查询 (Iterative) |
| ------------------ | ---------------------- | -------------------- |
| 谁做主要工作       | 本地 DNS 服务器        | 客户端自己           |
| 客户端发出请求次数 | 一次                   | 多次                 |
| 本地 DNS 是否缓存  | ✅ 是                   | ❌ 不需要             |
| 优点               | 快，客户端简单         | 控制更灵活           |
| 常见用途           | 普通用户、浏览器、系统 | DNS 服务器之间       |

------





![Screenshot 2025-10-15 at 08.03.16](assets/Screenshot 2025-10-15 at 08.03.16.png)



![Screenshot 2025-10-15 at 08.08.15](assets/Screenshot 2025-10-15 at 08.08.15.png)









## DNS 的 reliability 和 efficiency 

### Reliability（可靠性）

DNS 要保证“即使部分服务器宕机，服务也不会中断”，因此采用多种机制：

**Replicated DNS servers（副本服务器）**

- 每个域通常有多个 DNS 服务器副本（Primary / Secondary）。
- 只要有一个副本在线，名字解析服务就能继续工作。
- 查询请求可以在多个副本之间负载均衡。



**UDP for queries**

- DNS 查询通常用 **UDP**（端口 53）, 因为比起 TCP 效率更高

  但是我们知道 UDP 是没有重传机制，因此若丢包：

  解决方法:

  - 客户端或本地 DNS 会自己重试；
  - 使用 **指数退避 (exponential backoff)** 增加重试间隔时间；
  - 或切换到其他备用服务器。



**Same identifier for all queries**

- 对同一个查询使用相同的请求 ID；
- 哪个副本服务器先响应都行，不需要保持连接状态。

> **总结: ** DNS 用多个副本 + UDP 自行重试的方式来实现可靠性和高可用性。



### DNS Caching（缓存机制）

DNS 查询是分层的（Root → TLD → Authority），
 但每层查询都需要网络往返，所以可能带来延迟（可达 1 秒）。
 为此，DNS 通过缓存大幅加速解析。

- 顶级服务器（Root / TLD）几乎不变，可以长时间缓存。
- 热门网站（如 `www.google.com`）被频繁访问，本地 DNS 很快能命中缓存。

#### **缓存工作机制**

- 所有 DNS 服务器（包括本地 DNS）都会缓存查询结果。
- 每条 DNS 响应中包含一个 **TTL (Time To Live)** 字段。
- 当 TTL 过期后，该缓存条目被删除。

> **TTL 示例**
>
> 使用命令：
>
> ```bash
> dig www.google.com
> ```
>
> ![Screenshot 2025-10-15 at 08.13.20](assets/Screenshot 2025-10-15 at 08.13.20.png)
>
> 可以看到：
>
> ```
> www.google.com.   300   IN   A   142.250.190.132
> ```
>
> 其中 `300` 秒就是 TTL。**表示这条记录在缓存中存活 5 分钟，之后必须重新查询**。




## 总结 DNS

### Important properties of DNS

DNS 的设计之所以强大，是因为它结合了 **层级结构** 和 **分布式管理**：



**Administrative delegation（分级管理）**

- 每个组织可以管理自己的一部分命名空间（例如：`.edu` 管理大学，`umich.edu` 由密歇根大学管理）。
- 不需要全世界一个中心来维护所有域名。



**层级带来的好处**

- **唯一性**：每个域名在它的层次下都是唯一的。

  > 例如，`cse.umich.edu` 不会和 `cse.mit.edu` 冲突。

- **故障隔离 (“fate sharing”)**：
   如果某个子域宕机（比如 umich.edu），不会影响整个 DNS 系统。

- **合理的信任模型**：
   上级信任下级机构维护自己的域。

- **缓存机制**：
   提高扩展性 (scalability) 和性能 (performance)。



### DNS provides indirection（DNS 提供“间接性”）

DNS 不只是查 IP，它实际上提供了一层“**名字到地址的间接映射**”，因此非常灵活：

**地址可以改变**

> 例如：`www.cnn.com` 以前指向 `4.125.91.21`，之后可以改到另一个 IP，用户无需更改书签。



**一个名字可对应多个 IP**

用于：

- **负载均衡 (load balancing)**：让不同用户访问不同服务器。
- **CDN（内容分发网络）**：DNS 根据用户地理位置返回最近的服务器。

> 比如你在美国东部和日本访问 `www.google.com`，解析结果可能不同



**多个名字可对应同一个 IP**

- 实现方法: 直接映射或者或使用别名（CNAME）：

  直接:

  ```
  www.cnn.com     IN A  151.101.1.67
  cnn.com         IN A  151.101.1.67
  mail.cnn.com    IN A  151.101.1.67
  ```

  别名:

  ```
  cnn.com         IN A      151.101.1.67
  www.cnn.com     IN CNAME  cnn.com
  mail.cnn.com    IN CNAME  cnn.com
  ```

> Eg:  比如 `www.cnn.com` 和 `cnn.com` 实际上是同一个服务器。



> 总结: DNS 的层级结构让它可扩展、可靠；
>
> 而它的“间接性”让网络灵活、高效（例如支持 CDN、负载均衡、地址更新）



