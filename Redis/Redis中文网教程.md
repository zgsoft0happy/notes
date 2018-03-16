

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

---------------

- 字符串
  - 常用命令
    - 设置值：`set key value [ex seconds] [px milliseconds] [nx|xx]`
      - ex:设置秒级过期时间
      - px:设置毫秒级过期时间
      - nx:键必须不存在，用于新增
      - xx:键必须存在，用于更新
      - 命令:`setex`,类似于`set key value ex seconds`
      - 命令:`setnx`,类似于`set key value nx`
    - 获得值`get {key}`
    - 批量设置值：`mset key value [key value key value ...]`
    - 批量获得值：`mget key [key key ...]`
    - 计数：`incr key`
      - 值不是整数返回错误
      - 值是整数返回自增后的结果
      - 值不存在，新增key，对应的value是0,返回自增后的值，即1
      - 自减：`decr key`
      - 自增指定数值：`incrby key increment`
      - 自减指定数值：`decrby key increment`
    - 字符串追加值：`append key appendvalue`
    - 字符串长度：`strlen key`(中文字符占用3个字节)
    - 设置并返回原值：`getset key value`
    - 设置指定位置的字符：`setrange key offset value`
    - 获得部分字符串：`getrange key start end`
  - 内部编码
    - int：8个字节的长整形
    - embstr:小于等于39个字符的字符串
    - raw:唱过39个字符的字符串
-----------------

- 哈希（map）
  - 命令
    - 设置值：`hset key field value`
      - hsetnx:与hset的关系如同set与setnx
    - 获取值：`hget key field`
    - 删除field:`hdel key field`
    - 计算field的个数：`hlen key`
    - 批量设置值：`hmset key field value [field value ...]`
    - 批量获得field的值：`hmget key field [field ...]`
    - 判断field是否存在：`hexist key field`
    - 获得所有的fields:`hkeys key`
    - 获得所有field的对应的值：`hvals key`
    - 获得所有的filed-value对：`hgetall key`
    - 自增：`hincrby key field` | `hincrbyfloat key field`
    - 计算value的字符串长度：`hstrlen key field`
  - 内部编码
    - ziplist:当field较少（512为界），且value没有大（64字节为界）的值时
    - hashtable:数据较多

----------

- 列表（list）
  - 命令
    - 右边（尾部）添加数据：`rpush key value [value ...]`
    - 左边（头部）添加数据：`lpush key value [value ...]`
    - 在某个元素前/后插入数据：`linsert key before|after pivot value`
    - 查找指定范围的元素：`lrange key start end`
    - 获得指定下标的元素：`lindex key index`(index为负值时，从右开始数)
    - 获得列表的长度：`llen key`
    - 从左边（头部）弹出一个元素：`lpop key`
    - 从右边（尾部）弹出一个元素：`rpop key`
    - 删除指定元素：`lrem key count value`
      - 找到等于value的元素开始删除
      - count > 0 从左往右删除最多count个元素
      - count < 0 从右往左删除最多count个元素
      - count = 0 删除全部
    - 删除指定范围的元素：`ltrim key start end`
    - 修改指定索引的值：`lset key index newValue`
    - 阻塞pop:`brpop|blpop key [key ...] tomeout`
      - 阻塞时间，为0时一直阻塞下去
  - 内部编码
    - ziplist:列表元素个数（list-max-ziplist-entries默认512），或者单个value超过（max-ziplist-value默认64个字节）
    - linkedlist:(链表)
    - quicklist:(3.2版本后新增)

-------------

- 集合
  - 命令
    - 添加元素：`sadd key element [element ...]`
    - 删除元素：`sdel key element [element ...]`
    - 计算元素的个数：`scard key`
    - 判断元素是否在集合中：`sismemeber key element`,在返回1,不在返回0
    - 随即在集合中返回指定个数的元素：`srandmember key [count]`
      - count默认为1
    - 从集合中随即弹出：`spop key`
      - 3.2版本之后支持参数count:`spop key [count]`
    - 获得所有元素：`smembers key`
    - 获得多个集合的交集：`sinter key [key2 ...]`
    - 获得多个集合的并集：`sunion key [key2 ...]`
    - 获得多个集合的差集：`sdiff key [key2 ...]`
    - 获得多个集合的交集并保存：`sinterstore destinationkey key [key2 ...]`
    - 获得多个集合的并集并保存：`sunionstore destinationkey key [key2 ...]`
    - 获得多个集合的差集并保存：`sdiffstore destinationkey key [key2 ...]`
  - 内部编码
    - intset:整数集合，集合数量小于set-max-intset-entries（默认512）
    - hashtable:哈希表

----------

- 有序集合
  - 命令
    - 添加成员：`zadd key score member [score member]`
      - nx:member必须不存在，用于添加
      - xx:member必须存在，用于更新
      - ch:本次操作之后，有序集合和分数发生变化的个数
      - incr:对score做自增操作，相当于后面的`zincrby`
      - zadd的时间复杂度是O（log(n)）
    - 计算成员个数：`zcard key`
    - 计算成员分数：`zscore key member`
    - 从低到高计算成员的排名：`zrank key member`
    - 从高到低计算成员的排名：`zrevrank key member`
    - 删除成员：`zrem key member [member ...]`
    - 增加成员分数：`zincrby key increment member`
    - 正序获得指定范围的元素：`zrange key start end [withscores]`(withscores代表是否和分数一起返回)
    - 倒序获得指定范围的元素：`zrevrange key start end [withscores]`
    - 正序获得指定分数范围内的元素：`zrangebyscore key min max [withscores] [limit offset count]`
    - 倒序获得指定分数范围内的元素：`zrevrangebyscore key max min [withscores] [limit offset count]`
      - -inf代表无限小
      - +inf代表无限大
    - 返回指定分数范围的个数：`zcount key min max`
    - 删除指定排名内升序元素：`zremrangebyrank key start end`
    - 删除指定分数范围内的成员：`zremrangebyscore key min max`
    - 交集：`zinterstore destination numkeys [key ...] [weights weight ...] [aggregate SUM|MIN|MAX]`
      - destination:并集结果的目标存储集合
      - numkeys:一共有几个集合参与求并集，与后面key的数量相同
      - key...:参与计算并集的集合的key
      - weights:各个对应的key的分数的权重
      - aggregate:并集中元素分值的确定
        - SUM:按照各个分值与权重的乘积的和
        - MIN:按照各个分值与权重的乘积的最小值
        - MAX:按照各个分值与权重的乘积的最大值
    - 并集：`zunionstore destination numbeys [key ...] [weights weight ...] [aggregate SUM|MIN|MAX]`
      - 参数意义参考 `zinterstore`命令
  - 内部编码
    - ziplist:配置设置的zset-max-ziplist-entries（默认128），配置设置的zset-max-ziplist-value（默认64字节）
    - skiplist(跳跃表):读写效率较低
