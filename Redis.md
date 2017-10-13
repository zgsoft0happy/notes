 Redis

# Redis初识

key-value

# Redis安装

## Windows安装

官方只提供了linux版本的，但是有人提供了windows下的安装，地址：https://github.com/MicrosoftArchive/redis/releases；这里有安装包和压缩包，根据需要下载，这里下载的是压缩包；
1. 下载完成后解压；
2. 进入解压后的目录，打开终端（cmd）执行命令`redis-server redis.windows.conf`;
3. 进入解压后的目录，打开终端执行命令`redis-cli -h 127.0.0.1 -p 6379`。

## Linux安装

1. 官网下载redis-x.x.x.tar.gz包；
2. 解压：`tar -zxvf redis-x.x.x.tar.gz`;
3. 进入解压目录：`cd redis-x.x.x`;
4. 编译安装：`make PREFIX=/usr/local/redis install`,注意权限问题；
5. 进入安装目录：`cd /usr/local/redis/bin`;
6. 执行启动服务：`./redis-server [redis.conf]`;
7. 新开终端进入安装目录中执行登陆命令：`./redis-cli [-h 127.0.0.1 -p 6379]`。

# Redis注册本地服务

## windows平台

1. 在安装或者压缩目录下运行命令：`redis-server.exe --service-install redis.windows.conf`;
2. 命令运行成功会提示：`Redis successfully installed as s service`;
3. 在系统的本地服务列表中查找是否有Redis服务；
4. 先不启动redis服务，使用终端登录`redis-cli.exe -h127.0.0.1 -p 6379`很长时间没有反应；
5. 启动Redis服务，在登录，成功登录。

## Linux平台

首先说明：linux自己安装chkconfig工具。
1. 将压缩目录中的util/redis_init_script 移动到/etc/init.d下，并重命名为redis:`cp ./util/redis_init_script /etc/init.d/redis`;
2. 添加服务，运行命令：`chkconfig --add redis`;
3. 修改/etc/init.d/redis脚本：
    a. 第二行添加（注释）：`#chkconfig 2345 80 90`;
    b. 修改EXEC和CLIEXEC的值为安装目录下的可执行文件：
        `EXEC=/usr/local/redis/bin/redis-server`
        `CLIEXEC=/usr/local/redis/bin/redis-cli`；
    c. 修改后台运行方式：`$EXEC $CONF &`;
4. 将redis的配置文件移动到/etc/redis目录下：
    `cd /etc `
    `mkdir redis`
    `cp /usr/local/redis/redis.conf /etc/redis/6379.conf`;
5. 再次添加服务：`chkconfig --add redis`;
6. 启动服务：`service redis start`;
7. 登录验证。

# Redis数据类型

## 字符串

### SET key value

设置指定key的值为value

### GET key

获得指定key对应的value值

### GETRANGE key start end

获得指定key的值的指定返回的子字符串

### GETSET key value

设置指定key的值，并返回key的旧值（old value）

### GETBIT key offset

获得指定key的值的指定偏移量offset的位上的值

### MGET key1 [key2 ...]

获得多个指定key的值

### SETBIT key offset value

设置（或者清除）指定key的指定偏移量位上的值

### SETEX key seconds value

将value关联到key，并将key的时间设置为secods(单位是秒)

### SETNX key value

当key不存在时，设置key的值

### SETRANGE key offset value

设置指定key的指定偏移量之后的值

### STRLEN key

获得指定key的字符串的长度

### MSET key1 value1 [key2 value2 ...]

一次设置多个key的值

### MSETNX key1 value1 [key2 value2 ...]

同SETNX，但可以一次设置多个key

### PSETEX key milliseconds value

同SETEX，只是以毫秒为单位

### INCR key

将key中存储的值加1

### INCRBY key incremnet

将key中存储的值增加increment

### INCRBYFLOAT key increment

将指定的key的值增加指定的浮点型increment的值

### DECR key

将指定的key的值减1

### DECRBY key decrement

将指定的key减少指定的decrement

### APPEND key value

将value追加到已存在key的值的后面

## 列表

### BLOPO key1 [key2 ...] timeout

移出并获取列表的第一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止

### BRPOP key1 [key2 ...] timeout

移出并获取列表的最后一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止

### BRPOPLPUSH source destination timeout

从列表中弹出一个值，将弹出的元素插入到另外一个列表中并返回它； 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止

### LINDEX key index

通过索引获取列表中的元素

### LINSERT key BEFORE | AFTER pivot value

在列表的元素前或者后插入元素

### LLEN key

获得列表长度

### LPOP key

移出并获取列表的第一个元素

### LPUSH key value1 [value2 ...]

将一个或多个值插入到列表头部

### LPUSHX key value

将一个或多个值插入到已存在的列表头部

### LRANGE key start stop

获取列表指定范围内的元素

### LREM key count value

移除列表元素

### LSET key index value

通过索引设置列表元素的值

### LTRIM key start stop

对一个列表进行修剪(trim)，就是说，让列表只保留指定区间内的元素，不在指定区间之内的元素都将被删除

### RPOP key

移除并获取列表最后一个元素

### RPOPLPUSH source destination

移除列表的最后一个元素，并将该元素添加到另一个列表并返回

### RPUSH key value1 [value2 ...]

在列表中添加一个或多个值

### RPUSHX key value

为已存在的列表添加值

## hash表

### HDEL key field1 [field2 ...]

删除一个或多个哈希表字段

### HEXISTS key field

查看哈希表 key 中，指定的字段是否存在

### HGET key field

获取存储在哈希表中指定字段的值

### HGETALL key

获取在哈希表中指定 key 的所有字段和值

### HINCRBY key field increment

为哈希表 key 中的指定字段的整数值加上增量 increment

### HINCRBYFLOAT key field incremnet

为哈希表 key 中的指定字段的浮点数值加上增量 increment

### HKEYS key

获取所有哈希表中的字段

### HLEN key

获取哈希表中字段的数量

### HMGET key field1 [field2 ...]

获取所有给定字段的值

### HMSET key field1 value1 [field2 value2 ...]

同时将多个 field-value (域-值)对设置到哈希表 key 中

### HSET key field value

将哈希表 key 中的字段 field 的值设为 value

### HSETNX key field value

只有在字段 field 不存在时，设置哈希表字段的值

### HVALS key

获取哈希表中所有值

## 集合(set)

### SADD key member1 [member2 ...]

向集合添加一个或多个成员

### SCARD key

获取集合的成员数

### SDIFF key1 [key2 ...]

返回给定所有集合的差集

### SDIFFSTORE destination key1 [key2 ...]

返回给定所有集合的差集并存储在 destination 中

### SINTER key1 [key2 ...]

返回给定所有集合的交集

### SINTERSTORE destination key1 [key2 ...]

返回给定所有集合的交集并存储在 destination 中

### SISMEMBER key member

判断 member 元素是否是集合 key 的成员

### SMEMNERS key

返回集合中的所有成员

### SMOVE source destination member

将 member 元素从 source 集合移动到 destination 集合

### SPOP key

移除并返回集合中的一个随机元素

### SRANDMEMBER key [count]

返回集合中一个或多个随机数

### SREM key member1 [member2 ...]

移除集合中一个或多个成员

### SUNION key1 [key2 ...]

返回所有给定集合的并集

### SUNIONSTORE destination key1 [key2 ...]

所有给定集合的并集存储在 destination 集合中

### SSCAN key cursor [MATCH pattern] [COUNT count]

迭代集合中的元素

## 有序集合

类似集合（zadd...）

# Redis架构

## 主从架构

## 主从架构复制原理
