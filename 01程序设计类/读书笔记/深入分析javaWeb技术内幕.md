## 1. 深入Web请求过程
### 1.3 HTTP解析
#### 1.3.0 常见HTTP的状态码
//TODO这里需要一个状态吗解释的表格

#### 1.3.1 查看HTTP的工具
- FireFox
  - FireBug
  - HttpFox
- Chrome
  - 自带工具(F12)
  - 类FireBug
- IE
  - 自带工具(F12)
  - HttpFox

#### 1.3.2 浏览器缓存机制
- Cache-Control/Pragma

| 可选值 | 说明 |
| - | - |
| Public | 所有内容都将缓存，响应头中设置 |
| Private | 内容只缓存在私有缓存中，在响应头中设置 |
| no-cache | 所有内容都不会被缓存，在请求头和响应头中设置 |
| no-store | 所有内容不会被缓存到缓存或者Internet临时文件中，在响应头中设置 |
| must-revalidation/proxy-revalidation | 如果缓存的内容失效，请求必须发送服务器/代理进行重新验证，在请求头中设置 |
| max-agg=xxx | 缓存的内容将在xxx秒之后失效，这个选项在http 1.1中可用，和Last-Modified一起食用时优先级比较高，在响应头中设置 |

- Expires: 设置缓存即将失效的时间
- Last-Modified/Etag : 设置服务器上资源的最后更新时间
  响应头中带上`Last-Modified`, 再次的请求头中使用`If-Modified-Since`

### 1.4 DNS域名解析
#### 1.4.1 解析过程
- 本机解析
  - Windows：C:\\Windows\\System32\\drivers\\etc\\hosts文件
  - Linux: /etc/hosts
- LDNS解析（主要受TTL影响）
- gTLD解析（根域名解析）
  - 之前可能出现多级DNS解析
- 返回对应的Name Server的地址（例如ideacs.cn对应的Name Server 就是百度云）
- LDNS会缓存对应的地址和TTL
- 本地也会缓存对应的地址和TTL

#### 1.4.2 域名解析过程跟踪
- 命令
  - `nslookup`
  - `dig`
    - 可选参数 +trace

#### 1.4.3 清除缓存的域名
- Windows : 命令`ipconfig /flushdns`
- Linux : `/etc/init.d/nscd restart`
- JVM :
  - InetAddress类
  - 配置项（%JRE_HOME%\\lib\\security\\java.security)
    - networkaddress.cache.ttl
    - networkaddress.cache.negative.ttl
  - 启动命令
    - `-Dsun.net.inetaddr.ttl=xxx`

#### 1.4.4 域名解析方式

| 方式 | 说明 |
| - | - |
| A记录 | 直接对应的时Address，个人理解就是IP， 一个记录只能对应（指向）一个IP |
| MX记录 | Mail Exchange ， 邮件服务器 |
| CNAME记录 | 别名记录 |
| NS记录 | 该域名是有指定的DNS服务器解析 |
| TXT记录 | 为主机或者域名设置说明 |

#### 1.5 CDN工作机制
内容分布网络（内容分发网络）  
一个比喻：CDN = 镜像(Mirror) + 缓存(Cache) + 整体负载均衡(GSLB)  
CDN 需要达到的目标：
- 可扩展性
- 安全性
- 可靠性、相应和执行

#### 1.5.1 CDN架构

#### 1.5.2 负载均衡
- 链路负载均衡
  - 例如：DNS解析
- 集群负载均衡
  - 硬件负载均衡
  - 软件负载均衡
- 操作系统负载均衡

#### 1.5.3 CDN动态加速

## 2. 深入分析Java I/O的工作方式
### 2.1 Java的I/O类库的基本架构

- 基于字节操作I/O的接口： `InputStream`和`OutputStream`
- 基于字符操作I/O的接口： `Writer`和`Reader`
- 基于磁盘操作I/O的接口： `File`
- 基于网络操作I/O的接口： `Socket`

- 字节和字符的转化接口：需要编码器帮助（否则使用默认的编码），`StreamDecoder`指定编码格式

### 2.2 磁盘I/O工作机制
#### 2.2.1 访问文件的方式

- 标准方式
  - 缓存
  - `sync`
- 直接I/O
- 同步方式
- 异步方式
- 内存映射方式

#### 2.2.3 Java的序列化技术
- 当父类继承了Sreializable接口，所有的子类都可以被序列化
- 当子类实现了Serializable接口，但是父类没有实现，则父类中的属性不能被序列化（但是不报错，数据丢失而已），子类中的属性可以被正常的序列化
- 如果序列化的属性是对象，则这个对象也必须实现Serializable接口，否则报错
- 在反序列化时，如果对象的属性又被修改或者删除，则修改的部分属性会丢失，但是不会报错
- 在反序列化时，如果serialVersionUID被修改，则反序列化会失败

- 在纯Java环境下，Java的序列化能够很好工作，但是在多语言环境下，很难用其他语言还原对象，所以使用通用的JSON或者XML存储对应的数据结构会更好。

### 2.3 网络I/O的工作机制
#### 2.3.1 TCP状态
- CLOSED
- LISTEN
- SYN-SENT
- SYN-RCVD
- ESTABLISHED
- FIN-WAIT-1
- FIN-WAIT-2
- CLOSE-WAIT
- LAST-ACK
- CLOSING
- TIME-WAIT

#### 2.3.2 影响网络传输的因素
- 网络带宽
- 传输距离
- TCP拥塞控制

### 2.5 I/O调优
#### 2.5.1 磁盘优化
  - 检测
    - `iostat`
    - IOPS = (磁盘数 * 每块磁盘的IOPS)/（磁盘度的吞吐两+RAID因子 * 磁盘写的吞吐量）

#### 2.5.2 TCP网络参数调优
  - `/proc/sys/net/ipv4/ip_local_range`
