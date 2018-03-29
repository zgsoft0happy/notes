

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
  - monitor:监控命令，尽量少用，容易引起阻塞

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

------------------

- 键管理
  - 单个键管理
    - 键重命名：`rename key newkey`
      - `renamenx key newkey`:只有当newkey不存在时，重命名才能成功
    - 随即返回一个键：`randomkey`
    - 键过期
      - expire key seconds:键在seconds秒后失效过期
      - expireat key timestamp:键在秒级时间戳timestamp后失效过期
      - pttl:同ttl，只是单位是毫秒级的
      - pexpire key milliseconds:键在milliseconds毫秒后失效
      - pexpireat key milliseconds-timestamp:键在毫秒级的时间戳之后失效
      - persist key :可以设置取消key的过期时间设置
      - 注意：对于字符串类型的键，set命令会取消掉过期时间设置
    - 迁移键
      - move:`move key db`(不建议生产环境使用)
      - dump+restore:`dump key` + `restore key ttl value`
      - migrate:`migrate host port key | "" destination-db timeout [copy] [replace] [keys key ...]`
        - host:目标Redis的IP地址
        - port:目标Redis的端口
        - key|"":在 Redis3.0.6 版本之前, migrate 只支持迁移一个键,所以此处是要迁移的键,但 Redis3.0.6 版本之后支持迁移多个键,如果当前需要迁移多个键,此处为空字符串 ""
        - destination-db:目标Redis的数据库索引，例如迁入0号数据库，这里就为0
        - timeout:迁移的超时时间（单位为毫秒）
        - [copy]:如果添加此项，迁移后不删除源键
        - [replace]:如果添加此项，不管目标Redis是否存在该键，都能成功迁移覆盖
        - [keys key [key ...]]:迁移的多个键
  - 遍历键
    - 全量遍历：`keys pattern`
      - pattern
        - \*:代表任意字符
        - \.：代表一个字符
        - []:代表匹配部分字符
        - \\x:用来做转义
    - 渐进遍历：`scan cursor [match pattern] [count number]`
      - cursor:必须参数，游标，第一次遍历是0,每次遍历都会返回当前的游标，知道再次为0表示遍历结束
      - [match pattern]:可选模式，匹配模式，类似于keys的匹配模式
      - [count number]:可选参数，每次遍历的个数，默认是10
    - 集合的遍历：
      - hgetall:遍历Map
      - smembers:遍历set
      - zrange:遍历有序集合
      - hscan:渐进遍历Map
      - sscan:渐进遍历set
      - zscan:渐进遍历有序集合
  - 数据库管理
    - 切换数据库：select dbIndex
    - 清除数据库
      - 清除当前数据库：`flushdb`
      - 清除所有数据库：`flushall`

-----------------------------------------

- 慢查询
  - slowlog-log-slower-than：单位是微秒，默认值是10000
    - =0:会记录所有的命令
    - <0:不会有任何记录
  - slowlog-max-len:最多保存在慢查询的日志的条数
    - 先进先出规则
  - 慢查询日志列表：`slowlog command [n]`
    - 结果有几个属性
      - 慢查询日志标识ID
      - 发生的时间戳
      - 命令耗时
      - 执行的命令和参数
      - 新版本好像还有其他信息
  - 当前记录的慢查询条数：`slowlog len`
  - 重置慢查询记录：`slowlog reset`
  - 注意：及时的持久化慢查询记录

--------------

- Redis Shell
  - redis-cli
    - -h：主机地址
    - -p：主机端口
    - -r:(repeat)命令执行多次, eg,`redis-cli -r 3 ping`
    - -i:(interval)每个几秒执行一次命令，eg,`redis-cli -r 3 -i 3 ping`
      - 单位是秒，如果希望是毫秒，则使用小数
    - -x:代表从标准输入读取数据作为redis-cli的最后一个参数，eg:`echo "world" | redis-cli -x set hello`
    - -c:链接Redis Cluter节点时需要使用，防止moved和ask异常
    - -a:如果redis配置了密码，该选项可以不用手动输入auth
    - --scan或者--parttern:指定扫描的模式，相当于scan命令
    - --slave:将客户端模拟为slave节点
    - --rdb:生成RDB持久化实例文件，并保存在本地
    - --pipe:将命令封装成 Redis 通信协议定义的数据格式,批量发送给 Redis 执行
    - --bigkeys:使用 scan 命令对 Redis 的键进行采样,从中找到内存占用比较大的键值
    - --eval:用于执行指定 Lua 脚本
    - --latency:检测网络延迟
      - --latency
      - --latency-history
      - --latency-dist:该选项会使用统计图表的形式从控制台输出延迟统计信息
    - --stat:实时获取 Redis 的重要统计信息
    - --raw:返回格式化后的结果
    - --no-raw:选项是要求命令的返回结果必须是原始的格式
  - redis-Server
    - 主要作用是启动redis服务
    - --test-memory:用来检测系统是否能够稳定的分配指定内存给Redis,eg:`redis-server --test-memory 1024`
  - redis-benchmark
    - -c：客户端的并发数量
    - -n<request>：客户端的请求总量
    - -q:只显示每秒处理的请求数量
    - -r:随机插入一定量的键，eg:`edis-benchmark -c 100 -n 20000 -r 10000`,只对后四位做随机处理
    - -P:代表每个请求的Pipeline的数量（默认是1）
    - -k<boolean>:客户端是否使用keepalive,1为使用,0为不使用，默认是1
    - -t:对指定命令进行基准测试
    - --csv:结果以csv格式显示

-----------

- Pipeline
    - 命令的四个过程
      - 发送命令
      - 命令排队
      - 命令执行
      - 返回结果
    - 发送命令+返回结果所用的时间就是RTT
      - 批量的原因就是减少RTT的时间
    - 原生批量命令和Pipeline模拟批量对比
      - 原生命令是原子的，Pipeline不是原子的
      - 原声批量命令是一个命令对应多个key,而Pipeline是对应多个命令
      - 原生命令是服务器端实现的，Pipeline是服务端和客户端一起实现的

-------------------------

- 事务
  - 事务
    - `multi`:事务开始
    - `exec`:事务结束
    - `discard`:停止事务
  - 错误
    - 命令错误
    - 运行时错误
      - redis不支持回滚，开发人员自己修复
    - watch：确保事务操作中,exec之前没有修改过Key
  - Redis与Lua
    - eval和--eval：`eval lua_sh keynum key ...`
      keynum:key的数量，参数个数
    - evlsha: 脚本常驻服务器，根据脚本的sha来获得脚本并运行
      - `redis-cli script load sh_name`:加载脚本并常驻服务器，返回对应sha结果
      - `evalsha 脚本对应的sha结果`：根据对应的sha结果执行脚本
  - lua脚本的好处
    - 原子操作，执行过程不会插入其他命令
    - 帮助开发和运维人员创建自己的命令，并常驻内存
  - 脚本管理
    - `script load`: 将脚本加载到内存
    - `scrit exists sha ...` : 检查对应的脚本是否存在内存
    - `script flush`:清楚内存中所有的已经加载的脚本
    - `script kill`:杀掉正在运行的脚本
      - lua-time-limit：配置参数，默认是5,达到事件后，其他的请求会受到busy的提示，并提示使用`script kill`杀掉当前进程
      - 对于写操作的脚本，`script kill`不能杀掉，可以使用`shutdown save`

-------------------

- Bitmaps
  - 位数据结构
  - 命令
    - 设置值：`setbit key offset value`
    - 获取值：`getbit key offset`
    - 查询指定范围的为1的位数：`bitcount key [start end]`
      - start\end:是开始\结束字节，从1开始
    - 运算：`bitop op destkey key [key ...]`
      - op的选择
        - and：交集
        - or: 并集
        - not：非
        - xor:异或
    - 计算第一个值为targetBit的偏移量：`bitpos key targetBit [start] [end]`

----------------

- HyperLogLog
  - 一种基数算法
  - 命令  
    - 添加：`pfadd key element [element ...]`
    - 计算独立用户数：`pfcount key [key ...]`
    - 合并：`pfmerge destkey sourcekey [sourcekey ...]`
  - 特点
    - 占用内存小
    - 计算独立总数，不活的单挑数据
    - 存在一定的误差

-------------

- 发布订阅
  - 命令
    - 发布：`publish channel message`,返回订阅的数量
    - 订阅：`subscribe channel`
    - 取消订阅：`unsubscribe channel`
    - 按照订阅模式订阅：`psubscribe pattern [pattern ...]`
    - 按照订阅模式取消订阅：`punsubscribe [pattern [pattern ...]]`
    - 查询活跃频道：`pubsub channels [pattern]`
    - 查询频道的订阅数：`pubsub numsub channel`
    - 小哈训模式订阅数：`pubsub numpat`

-----------------

- GEO
  - 命令
    - 增加地理位置信息：`geoadd key longitude latitude member [longitude latitude member ...]`
    - 获得地理位置信息：`geopos key member [member ...]`
    - 获得两个地理位置之间的距离：`geodist key member1 member2 [unit]`
      - unit，默认是m
        - m:米
        - km:千米
        - mi:英里
        - ft:尺
    - 获得指定范围内的地理位置信息集合：`georadius|georadiusbymember key longitude latitude radius m|km|ft|mi [withcoord] [withdist] [withhash] [COUNT count] [asc|desc] [store key] [storedist key]`
      - 区别，georadius 需要指定经纬度，georadiusbymember需要指定成员
      - radius m|km|ft|mi:必须参数，需要带单位
      - withcoord:返回结果中包含经纬度
      - withdist:返回结果包含距离中心点的距离
      - withhash:返回结果中包含geohash
      - COUNT count:指定返回结果的数量
      - asc|desc:指定返回结果排序的升序还是降序
      - store key:将结果的指定地理信息保存在指定的键中
      - storedist key:将记过中距离中心点的距离保存在指定的键中
    - 获得geohash: `geohash key member [member ...]`
    - 删除地理位置信息：`zrem key member`

----------------------

- 客户端通信协议
  - 在TCP协议之上构建的
  - RESP协议
    - 发送命令格式：CRLF代表“\\r\\n”
    - 结果返回格式
      - 状态回复：第一个字节是"+"
      - 错误回复：第一个字节是"-"
      - 整数回复：第一个字节是":"
      - 字符串回复：第一个字节是"$"
      - 多条字符串回复：第一个字节是"\*"

-----------------

- 客户端API      
  - client list :列出所有的客户端链接信息
    - id:客户端链接为宜标识，Redis自动自增，重启后从0开始
    - addr:客户端的ip和端口
    - fd:socket的文件描述符，fd=-1的时候代表不是外部客户端，是Redis的伪客户端
    - name:客户端的名字，可以使用`client setName`和`client getName`来设置和获得客户端名称
    - qbuf:客户端输入缓冲区的总容量，大小不超过1G，超过自动关闭，但是不受max memory的限制
    - qbuf-free:客户端剩余的输入缓冲区大容量
    - obl:固定输出缓冲区大小
      - 输出缓冲区的大小可以使用配置参数client_output_buffer_limit来设置
      - 配置命令：`client_output_buffer_limit <class> <hard limit> <soft limit> <soft seconds>`
        - class:客户端类型
          - normal:普通客户端
          - slave:slave客户端
          - pubsub:发布订阅客户端
        - hard limit:当客户端使用的输出缓冲区的大小超过hard limit后，客户端会立即关闭
        - soft limit和soft seconds:如果客户端使用的输出缓冲区大小超过soft limit并持续soft seconds秒，客户端会立即关闭
        - 也不受max memory的限制
    - oll:动态输出缓冲区大小
    - omem:使用的字节数
    - age:最后一次链接的时间
    - idle:最后一次的空闲时间
    - flags:客户端的类型
      - N：Normal
      - S：Slave节点
      - O：当前的客户端正在执行monitor命令
      - M：当前客户端是master节点
      - x：当前客户端正在执行任务
      - b：当前客户端正在等待阻塞事件
      - i：当前客户端正在等待VM I/O,但是此状态已经废弃不用了
      - d：一个受监视的键已被修改，EXEC命令将失败
      - u：客户端未被阻塞
      - c：回复完整输出后，关闭链接
      - A：尽可能的关闭链接
    - db:当前客户端使用的数据库索引下标
    - sub/psub:当前客户端订阅的频道或模式数
    - multi:当前事务中已执行的命令个数
    - events:文件描述符事件(r/w):r和w分别代表客户端套接字可读和可写
    - cmd:当前客户端最后一次执行的命令，不包含参数
  - info client:客户端的统计信息
    - client_biggest_input_buf:客户端中最大的输入缓冲区，可以设置10M进行报警
    - client_longest_output_list:输出缓冲区中最大的对象数
  - 设置最大的链接数量：`config set maxclients value`
  - 获得最大的链接数量：`config get maxclients`
  - 设置链接最大的空闲时间：`config set timeout value`，value为0时表示没有最大空闲时间, 单位是秒
  - 获得链接最大的空闲时间：`config get timeout`
  - `client kill ip:port`: 杀掉指定ip指定端口的客户端链接
  - `client pause millseconds`:阻塞客户端指定事件
    - 只对普通和订阅发布的客户端有用，对于主从客户端没用
    - 可以以可控的方式将一个客户端链接从一个Redis节点切换到另外一个Redis节点

------------

- 客户端相关配置
  - timeout:设置最大空间时间，空闲时间超过这个设置立即关闭链接，如果为0则不检查
  - maxclients:客户端的最大链接数
  - tcp-keepalive:检测tcp活性的周期，默认是0,即不检测，建议设置为60即60秒执行一次检测
  - tcp-backlog:TCP 三次握手后,会将接受的连接放入队列中, tcp-backlog 就是队列的大小,它在 Redis 中的默认值是 511，一般需要系统(linux)的`/proc/sys/net/core/somaxconn`的值大于该设置值

-----------

- 客户端的相关统计
  - `info client`
    - connected_clients:当前链接的客户端数量
    - client_longest_output_list:当前所有输出缓冲区中队列对象个数的最大值
    - client_biggest_input_buf:前所有输入缓冲区中占用的最大容量
    - blocked_client:正在执行阻塞命令(例如 blpop 、 brpop 、 brpoplpush )的客户端个数
  - `info stats`
    - total_connections_received:Redis自启动以来处理的客户端链接总数
    - rejected_connections:Redis自启动以来拒绝的客户端链接数，需要重点监控

-------------

- 客户端常见异常
  - 无法从链接池获得链接
  - 客户端读写超时
  - 客户端链接超时
  - 客户端缓冲区异常
  - Lua脚本正在执行
  - Redis正在加载持久化文件
  - Redis使用的内存超过max memory配置
  - 客户端链接数过大

----------

- 持久化
  - RDB
  - AOF

------------

- RDB
  - 触发方式
    - 手动触发
      - `save`:容易造成阻塞，不建议使用
      - `bgsave`:fork操作新建子进程完成save的工作，完成后自动结束
    - 自动触发
      - save配置：`save m n`:m秒内进行了n次数据修改自动触发bgsave
      - 从节点从住节点自动复制数据
      - 执行`debug reload`重新加载redis
      - 执行shutdown时默认没有设置AOF持久化时自动执行bgsave
      - `lastsave`:命令，最后一次生成持久化文件的时间
  - RDB文件保存在dir参数指定的目录下，文件名通过参数dbfilename参数类配置设置的
    - `config set dir {newdir}`:设置dir对应目录
    - `config set dbfilename {newdbfilename}`:设置dbfilename对应名字
    - `config set rdbcompression{yes|no}`：设置是否对持久化文件进行压缩

-----------------

- AOF
  - append only file
  - 开启命令：`appendonly yes`,默认是不开启的
  - 文件名通过配置appendfilename来确定，默认是appendonly.aof，路径也是dir
  - aof的工作流程操作
    - 命令写入（append）
      - 文本协议格式
    - 文件同步（sync）
      - 同步策略（`appendfsync`参数控制）
        - always
        - everysec
        - no
    - 文件重写（rewrite）
      - 触发方式
        - 手动触发:直接调用命令`bgrewriteaof`
        - 自动触发：根据参数自动触发
          - auto-aof-rewrite-min-size:默认64G
          - auto-aof-rewrite-percentage:
    - 重启加载（load）
  - aof文件校验
    - `redis-check-aof-fix`:修复损坏的aof文件

------------------------

- 子进程资源开销状态
  - `info Persistence`
    - rgb_bgsave_in_progress:bgsave子进程是否正在运行
    - rgb_current_bgsave_time_sec:当前运行bgsave的时间，-1表示未运行
    - aof_enabled:是否开启AOF功能
    - aof_rewrite_in_progress:AOF子进程是否正在进行
    - aof_rewrite_scheduled:在bgsave结束后是否运行AOF重写
    - aof_current_rewrite_time_sec:当前运行AOF重写的时间，-1表示未运行
    - aof_current_size:AOF文件当前的字节数
    - aof_base_size:AOF上次重写rewrite的字节数

-------------------

- 复制配置
  - 复制节点
    - master节点
    - slave节点
  - 配置复制（三种方式）
    - 配置文件加入slave of {masterHost} {masterPort}随Redis启动生效
    - redis-server启动时，带上参数`--slaveof {masterHost} {masterPort}`
    - 直接使用命令：`slaveof {masterHost} {masterPort}`生效
  - 断开连接
    - 命令：slave节点执行，`slaveof no one`
    - 流程
      - 断开与主节点的复制关系
      - 晋升当前节点为主节点
  - 安全性
    - 主节点设置requirepass进行密码验证
    - 客户端使用auth命令校验
    - 从节点配置masterauth与主节点密码保持一致
  - 只读
    - slave-read-only:只读模式，默认，不建议修改
  - 传输延迟
    - 参数repl-disable-tcp-nodelay控制是否开启TCP_NODELAY，默认关闭
      - 关闭时，主节点无论数据大小都及时被复制到从节点，但增加了网络带宽的消耗，使用网络环境较好的环境
      - 开启时，主节点会合并较小的tcp数据包从而节省带宽，发送时间间隔取决于linux内核
  - 拓扑
    - 一主一从
    - 一主多从
    - 树状主从

----------------------

- 复制原理
  - 复制过程
    - 保存主节点信息
    - 建立主从socket链接
    - 发送ping命令
    - 权限验证
    - 同步数据集
    - 命令持续复制
  - 数据同步
    - 全量同步
    - 部分同步
      - psync命令：`psync {run_id} {offset}`
        - run_id:从节点所复制主节点的run_id
        - offset:当前从节点已复制的数据偏移量
  - 读写分离
    - 数据延迟
    - 读取过期数据
      - 惰性删除
      - 定时删除

---------

- 噩梦：阻塞
  - 原因
    - 内在原因
      - API调用不合理
      - CPU饱和
      - 持久化阻塞
        - fork阻塞
        - AOF刷盘阻塞
        - HugePage写操作
    - 外在原因
      - CPU竞争
      - 内存交换
      - 网络问题

------------------


- 内存管理
  - 内存使用统计：`info memory`
    - used_memory:redis分配的内存总量
    - used_memory_human:以人类可读的形式返回used_memory
    - used_memory_rss:从操作系统角度显示Redis占用的物理内存
    - used_memory_peak:内存使用的最大值，及used_memory的最大峰值
    - used_memory_peak_human:以人类可读的形式返回used_memory_peak
    - used_memory_lua:Lua引擎占用的内存
    - mem_fragmentation_ratio:used_memory_rss/used_memory比值，内存的碎片率
    - mem_allocator:Redis使用的内存分配器,默认使用的jemalloc
  - 内存划分
    - 自身内存
    - 对象内存
    - 缓冲内存
      - 客户端缓冲
      - 复制挤压缓冲
      - AOF缓冲
    - 内存碎片
  - 内存配置
    - 设置内存上限：maxmemnory=...
    - 动态调整内存上限：`config set maxmemory value`
  - 内存回收策略
    - 删除过期键对象
      - 惰性删除
      - 定是任务删除
    - 内存溢出控制策略：
      - 设置命令：`config setmaxmemory-policy {policy}`
      - maxmemory-policy参数控制
        - noeviction:默认策略，拒绝写操作
        - volatile-lru:根据lru算法删除设置了expire属性的键，如果没有可删除的对象，回退到noeviction策略
        - allkeys-lru:根据lru算法删除键，无论设置没设置expire
        - allkeys-random:随机删除所有键，直到腾出足够的内存
        - volatile-random:随机删除过期键，直到腾出足够的内存
        - volatile-ttl:根据键值对象的的ttl属性，删除最近将要过期的键，如果没有回退到noeviction策略
  - 内存优化
    - redisObject
      - type
      - encoding
      - lru
        - `object idletime {key}`:不更新lru字段的前提下，获得key没被使用的时间
      - refcount
        - `object refcount {key}`:获取key的引用次数
      - \*ptr
    - 缩减键值对象
    - 共享对象池
    - 字符串优化
      - 字符串结构（SDS）
      - 预分配机制
      - 字符串重构
  - 编码优化
    - 几个编码控制参数（根据参数名称，顾名思义就知道控制的什么）
      - hash-max-ziplist-value
      - hash-max-ziplist-entries
      - list-max-ziplist-value
      - list-max-ziplist-entries
      - list-compress-epth
      - set-max-intset-entries
      - zset-max-ziplist-value
      - zset-max-ziplist-entries
  - 控制键的数量

---------------------

- 哨兵基本概念
  - 主从复制问题
    - 主节点故障需要人工干预
    - 主节点写能力受单机限制
    - 主节点存储能力受单机限制
  - 高可用性
  - Redis Sentinel 高可用性
    - 故障处理过程
      - 主节点出现故障
      - 每个Sentinel节点定期监控，发现主节点主张
      - 选举一个Sentinel节点作为领导者处理故障转移
      - 自动化执行故障转移
    - Redis Sentinel 功能
      - 监控
      - 通知
      - 主节点故障转移
      - 配置提供者
    - 多个Sentinel节点
      - 防止误判
      - 防止个别Sentinel不可用

-----------

- Sentinel启动
  - 两种方式
    - `redis-sentinel redis-sentinel.conf`
    - `redis-server redis-sentinel.conf --sentinel`
  - 配置优化
    - 配置说明和优化
      - sentinel monitor:`sentinel monitor <master-name> <ip> <port> <quorum>`
        - master-name:Redis主节点别名
        - ip:Redis的主节点IP
        - port:Redis主节点的端口
        - quorum:断定主节点故障所需要的票数
      - sentinel down-after-millseconds:`sentinel down-after-millseconds <master-name> <times>`设置节点超时的界限，单位是秒
      - sentinel parallel-syncs:`sentinel parallel-syncs <master-name> <num>`同时向新的主节点发起复制的从节点数量
      - sentinel failover-timeout:`sentinel failover-timeout <master-name> <times>`设置故障转移的超时时间
        - 故障转移步骤
          - 选出合适的从节点
          - 晋升选出的从节点为新的主节点
          - 命令其余的从节点复制新的主节点
          - 等待老主节点回复后，命令其复制新的主节点
        - sentinel failover-timeout的作用
          - 如果 Redis Sentinel 对一个主节点故障转移失败,那么下次再对该主节点做故障转移的起始时间是 failover-timeout 的 2 倍
          - 在 b )阶段时,如果 Sentinel 节点向 a )阶段选出来的从节点执行 slaveof no one 一直失败(例如该从节点此时出现故障),当此过程超过 failover-timeout 时,则故障转移失败
          - 在 b )阶段如果执行成功, Sentinel 节点还会执行 info 命令来确认 a )阶段选出来的节点确实晋升为主节点,如果此过程执行时间超过 failover-timeout 时,则故障转移失败
          - 如果 c )阶段执行时间超过了 failover-timeout (不包含复制时间),则故障转移失败。注意即使超过了这个时间, Sentinel 节点也会最终配置从节点去同步最新的主节点
      - sentinel auth-pass:`sentinel auth-pass <master-name> <password>`:如果主节点配置了密码，这里设置密码，防止对主节点的监控失败
      - sentinel notification-script:`sentinel notification-script <master-name> <script-path>`:当一些警告级别的Sentinel时间发生时触发脚本运行
      - sentinel client-reconfig-script:`sentinel client-reconfig-script <master-name> <script-path>`故障转移结束后执行的脚本
    - 可以监控多个Redis主节点，通过不同的别名区分
    - 动态调整配置
      - sentinel set <param> <value>
        - param:参数，如quorum等
        - 只对当前的sentinel节点起作用
        - 立即刷新配置文件
        - 建议所有的sentinel节点配置一致
        - 支持的参数具体参考源码中的 sentinel.c 的 sentinelSetCommand 函数
    - 部署技巧
      - sentinel节点不要部署在同一物理机器上
      - 部署至少三个且奇数个sentinel节点
      - 一个sentinel节点group监控一个主节点还是多个？
        - 一个
          - 维护成本底
          - Sentinel节点出现问题可能影响多个Redi数据节点，监控的redis过多时sentinel节点产生较多的网络连接
        - 多个
          - 和上边正好相反
          - 彼此隔离
          - 资源浪费          

---------------

- Sentinel API
  - sentinel masters:统计所有监控的主节点信息
  - sentinel master <master-name>:统计监控的指定名字的主节点的信息
  - sentinel slaves <master-name>:统计监控的指定名字的主节点的从节点信息
  - sentinel sentinels <master-name>:统计监控的指定名字的主节点的监控节点（不包括当前节点）
  - sentinel get-master-addr-by-name <master-name>:返回指定节点的ip地址和端口
  - sentinel reset <pattern>:当前 Sentinel 节点对符合 <pattern> (通配符风格)主节点的配置进行重置,包含清除主节点的相关状态(例如故障转移),重新发现从节点和 Sentinel 节点
  - sentinel failover <master-name>:强制对指定的主节点进行故障转移
  - sentinel ckquorum <master-name>:检测当前可达的sentinel节点是否达到quorum个
  - sentinel flushconfig:强制将当前sentinel节点的配置刷到硬盘
  - sentinel remove <master-name>:取消当前节点对指定主节点的监控
  - sentinel monitor <master-name> <ip> <port> <quorum>:配置新增监控主节点
  - sentinel set <master-name> <param> <value>:设置见动指定主节点的指定配置属性
  - sentinel is-master-down-by-addr:Sentinel 节点之间用来交换对主节点是否下线的判断,根据参数的不同,还可以作为 Sentinel 领导者选举的通信方式
    - `sentinel is-master-down-by-addr <ip> <port> <current_epoch> <runid>`
      - ip:主节点ip地址
      - port:主节点端口
      - current_epoch:当前配置纪元
      - runid:此参数有两种类型,不同类型决定了此 API 作用的不同
        - 当 runid 等于 “\*” 时,作用是 Sentinel 节点直接交换对主节点下线的判定
        - 当 runid 等于当前 Sentinel 节点的 runid 时,作用是当前 Sentinel 节点希望目标 Sentinel 节点同意自己成为领导者的请求

-------------------

- 哨兵实现原理
  - 三个定是监控任务
    - 每10秒，发送info命令获取最新的主节点和从节点的拓扑结构
    - 每2秒,每个 Sentinel 节点会向 Redis 数据节点的 __sentinel__ : hello 频道上发送该 Sentinel 节点对于主节点的判断以及当前 Sentinel 节点的信息,同时每个 Sentinel 节点也会订阅该频道
    - 每隔1秒,每个 Sentinel 节点会向主节点、从节点、其余 Sentinel 节点发送一条 ping 命令做一次心跳检测,来确认这些节点当前是否可达
  - 主观下线：存在误判
  - 客观下线

---------------------

- 领导者sentinel节点选举
  - 算法：Raft

----------------------

- 节点运维
  - 节点下线
    - 临时下线
    - 永久下线
      - 设置从节点优先级：`config set slave-priority value`
  - 高可用性读写分离
    - 从节点的作用
      - 主节点故障，顶替主节点
      - 扩展主节点的读能力
    - redis sentinel读写分离设计思路
      - 监控事件
        - `+switch-master`:从节点晋升为主节点，等于减少从节点
        - `+convert-to-slave`:主节点降级为从节点，等于添加从节点
        - `+sdown`:主观下线：某个节点可能不可用
        - `+reboot`:重启了某个节点

--------------------------

- Redis分布式方案
  - 客户端分区
    - 优点：分区逻辑可控
    - 缺点：需要自己处理数据逻辑、高可用、故障转移
  - 代理方案
    - 优点：简化客户端分布式逻辑和升级维护便利
    - 缺点：加重架构部署复杂度和性能损耗

-----------------------

- 数据分布
  - 数据分布理论
    - 分区方式
      - 哈希分区
        - 特点
          - 离散度好
          - 数据分布业务无关
          - 无法顺序访问
        - 代表产品
          - Redis Cluster
          - Cassandra
          - Dynamo
        - 常见分区规则
          - 节点取余分区
          - 一致性哈希分区
          - 虚拟槽分区
            - 接偶数据与节点之间的关系，简化节点扩容和收缩难度
            - 节点自身维护映射关系，不需要客户端和代理维护
            - 支持节点、槽、键之间的映射查询,用于数据路由、在线伸缩等场景
      - 顺序分区
        - 特点
          - 离散度易倾斜
          - 数据业务分布相关
          - 可顺序访问
        - 代表产品
          - Bigtable
          - HBase
          - Hypertable
  - 集群功能限制
    - key批量操作支持有限，目前只支持相同slot位的key批量操作，因为不同的slot的key的操作可能存在与不同的节点，所以不能支持
    - key事务操作支持有限，原理同上
    - key作为数据奋武的最小力度，不能将大的键值对象（hash，list等）映射到不同的节点
    - 不支持多数据库空间，Redis在单机模式下可以支持16个数据库，但是在集群模式下仅支持db0数据库空间
    - 复制结构只支持一层，不支持树状嵌套复制结构

--------------

- 搭建集群
  - 准备节点
  - 节点握手
    - `cluster meet ip port`
  - 分配槽
    - `cluster addslot {0...5461}`
  - 集群的主从设置
    - `cluster replicate run_id`:run_id是对应的主节点的运行ID
- redis-trib.rb搭建集群
  - 安装ruby环境
  - 安装rubygem redis依赖
  - 安装redis-trib.rb
  - 准备节点：启动几个redis节点
  - 创建集群：`redis-trib.rb create --replicate num nodes...`
    - num:是每一个节点的从节点个数
    - nodes:节点列表，包括主节点和从节点
  - 集群完整性检查：`redis-trib.rb check node`

---------------

- 节点通信
  - 元数据维护方式
    - 集中式维护
    - P2P方式
  - 通信过程
    - 集群中每个节点单独开辟一条TCP通道，用于节点之间的通信，通信端口号在基础端口号上加10000
    - 每个节点在固定的周期内通过特定的规则选择几个节点发送ping消息
    - 接收到ping消息的节点用pong消息作为响应
  - Gossip消息
    - 分类
      - ping消息
      - pong消息
      - meet消息
      - fail消息

----------------

- 请求重定向
  - MOVED
  - redis-cli -c

---------------------

- smart客户端
- ASK重定向

---------------

- 故障转移
  - 故障发现
    - 主观下线
    - 客观下线

-----------------

- 缓存的收益和成本
  - 收益
    - 加速读写
    - 降低后端负载
  - 成本
    - 数据不一致
    - 代码维护成本：多个缓存代码
    - 运维成本：多个Redis运维
  - 缓存使用场景、
    - 开销大的复杂计算
    - 加速请求响应

----------------

- 缓存更新策略
  - LRU/LFU/FIFO算法剔除
  - 超时剔除
  - 主动更新
- 穿透优化
  - 缓存空对象
  - 布隆过滤器拦截
- 无底洞优化
  - 串行命令
  - 串行IO
  - 并行IO
  - hash_tag实现
- 雪崩优化
  - 保证缓存层服务高可用性
  - 依赖隔离组件为后端限流并降级
    - Hystrix:一个java依赖隔离工具
  - 提前演练
- 热点keys重建优化
  - 目标
    - 较少重建缓存的次数
    - 数据尽可能一致
    - 较少的潜在危险
  - 互斥锁
  - 永不过期

-------------

- 缓存的三大目标
  - 加速用户访问速度，提高用户体验
  - 降低后端负载，减少千载的风险，保证系统平稳
  - 保证数据尽可能更新

------------

- Linux优化配置
  - 内存分配控制
    - `vmovercommit_memory`
      - 0:内核检查是否有足够的可用内存，如果有，申请通过，否则申请失败，并将错误返回给应用进程
      - 1:内核允许超量使用内存知道用完为止
      - 2:内核绝不过量使用内存，
    - `swappiness`
      - 0-100:值越高使用swap的概率越大
      - 默认值：60
      - 查看swap的使用情况
        - free
        - vmstat 1
        - cat /proc/{pid}/smaps
    - THP
    - OOM killer
      - 权值
        - /proc/{pid}/oom_score
        - /proc/{pid}/oom_adj
    - NTP(Network Time Protocol)
    - ulimit
    - TCP BackLog

---------------------

- Redis安全
  - Redis密码机制
    - 简单密码机制
      - `redis-server requirepass password`
      - `redis-cli -a password`:-a参数
      - `auth password`:auth命令
    - 伪装危险命令
      - 引入rename-command:将命令重新命名
    - 防火墙
    - bind
    - 定期备份数据
    - 不使用默认端口
    - 使用非root用户启动
    - 处理bigkey
      - bigkey的危害
        - 内存空间不均匀
        - 超时阻塞
        - 网络拥塞
      - 发现
        - 被动收集
        - 主动检测
  - 热点key解决方案
    - 拆分复杂数据结构
    - 迁移热点key
    - 本地缓存加通知机制

-----------------

- 集成管理工具
  - Cachecloud

---------------

- Redis配置统计字典
  - info系统状态说明
    - `info`:部分Redis系统的信息
    - `info all`:全部Redis系统的信息
    - `info section`:某一块的系统状态的统计信息，section忽略大小写
      - section列表
        - Server:服务器信息
        - Clients:客户端信息
        - Memory:内存信息
        - Persistence:持久化信息
        - Stats:全局统计信息
        - Replication:复制信息
        - CPU:CPU消耗信息
        - Commandstats:命令统计信息
        - Cluster:集群信息
        - Keyspace:数据库键统计信息
  - standalone配置
    - 总体配置
    - 最大内存及策略
    - AOF相关配置
    - RDB相关配置
    - 慢查询配置
    - 数据结构优化配置
    - 复制相关配置
    - 客户端相关配置
    - 安全相关配置
  - Sentinel配置
  - Cluster配置
