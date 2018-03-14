

- Redis : Remote Dictionary Server
  - 作者：Salvatore Sanfilippo
  - key -- value
    - String
    - Map
    - List
    - Set
    - Sorted Set
    - Bitmaps
    - HyperLogLog
    - GEO(地理信息定位)
  - 开源
  - ANSI C
  - BSD协议
  - 支持网络
  - 基于内存也可持久化的日志型
  - 多种语言API
  - master-slave模式的数据备份
  - 前提：简单的数据结构

-----------------

- 优势
  - 性能极高： 读 110000次/s， 写 81000次/s
  - 丰富的数据类型，支持二进制案例的String,List,Map,Set以及Ordered Set
  - 原子，所有的操作都是原子操作，以及几个操作联合后的原子执行
  - 丰富的特性, 支持publish/subscribe，通知，key过期等

----------

- 注意
  - 需要权衡硬件内存
  - 磁盘写以紧凑方式，不支持（也不需要）随即访问
  - 适应小规模数据，不适合大规模（内存）
  - 适合热数据（频繁操作），不适合冷数据

-----------

- 安装
  - Windows（未验证过）
    - 下载后解压，将解压后的文件夹中的64位（更具系统选择32或者64）到指定文件夹。
    - cmd进入文件夹，执行`redis-server.exe redis.conf`
    - 另启一cmd执行`redis-cli.exe -h 127.0.0.1 6379`
    - 然后执行`set myKey myValue` 和 `get myKey`测试是否成功

  - Linux
    - 下载解压，目录为redis-x.x.x
    - 进入目录执行`make`编译，`sudo make install`安装
    - `./redis-server [redis.conf] `启动服务
    - `./redis-cli`可以验证服务
    - ubuntu系统也可以直接`sudo apt-get update;sudo apt-get install redis-server`安装

---------

- Redis Shell
  - redis-server:       启动redis
  - redis-cli:          Redis命令行客户端
  - redis-benchmark:    Redis基准测试工具
  - redis-check-aof:    Redis AOF持久化文件检测和修复工具
  - redis-check-dump:   Redis RDB持久化文件检测和修复工具
  - redis-sentinel:     启动Redis sentinel

----

- 启动：
  - 启动时设置某种配置`redis-server --configkey1=configvalue --configkey2=configvalue2`
  - 启动时制定配置文件`redis-server redis.conf`
  - 几个配置项：
    - port:端口
    - logfile:日志文件
    - dir:Redis工作目录
    - daemonize:是否以守护进程的方式启动

-------------------

- redis客户端
  - 交互式方式链接：`redis-cli -h {host} -p {port}`
  - 命令式方式链接：`redis-cli -h {host} -p {port} {command}`

------------

- 关闭redis服务
  - `redis-cli shutdown`
  - `redis-cli shutdown nosave|save`:设置关闭前是否生成持久化文件

----------

- 版本号
  - 沿用linux的版本号命名规则，第二位如果是奇数则是开发版本，偶数是稳定版本

----------

- 注意
  - Redis的命令多
  - Redis不是万金油，某些命令需要特定环境

-----------------

- 全局命令
  - 查看所有键：`keys *`, 键很多时禁止使用
  - 键总数：`dbsize`
  - 检查键是否存在：`exists {key}`, 1存在，0不存在
  - 删除键：del key [key1 key2]
  - 设置键有效期：`expire {key} {seconds}` ,单位秒
  - 查看剩余有效时间：`ttl {key}`, 返回非负整数代表生于有效时间的秒数，返回-1代表没有设置过期时间，返回-2代表key不存在。
  - 键的数据结构类型：`type {key}`
  - 查看内部编码：`object encoding {key}`

----------

- 快的原因
  - 纯内存访问
  - 非阻塞I/O
  - 避免线程切换和竞态的产生
