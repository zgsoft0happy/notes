explain用法，

为了方便理解，一边操作，一边讲述。

首先创建一个数据表，并增加索引（主键、联合索引）：

```
create table test_union
(
	id int auto_increment comment 'zhuji' primary key,
	k1 int not null comment 'lianheziduan1',
	k2 int not null comment 'lianheziduan2',
	k3 int not null comment 'lianheziduan3',
	k4 int not null comment 'lianheziduan4',
	k5 int not null comment 'lianheziduan5',
	k6 int null comment 'ziduan1',
	k7 int null comment 'ziduan2'
)
;

create index test_union_k1_k2_k3_k4_k5_index
	on test_union (k1, k2, k3, k4, k5)
;

create table table_union_fk
(
	id int auto_increment comment '主键' primary key,
	name varchar(20) default '' not null comment '名称',
	fk_id int default '0' not null
)
;

```
注：这里为了省事，所有字段的注释为汉语拼音。

插入几条数据：
```
insert into test_union(k1,k2,k3,k4,k5,k6,k7) values(1,1,1,1,1,1,1);
insert into test_union(k1,k2,k3,k4,k5,k6,k7) values(2,2,2,2,2,2,2);
insert into test_union(k1,k2,k3,k4,k5,k6,k7) values(3,3,3,3,3,3,3);

insert into table_union_fk(name,fk_id) values('1',1);
insert into table_union_fk(name,fk_id) values('2',2);
```

explain语句显示的字段，这里先执行一下：  
`explain select * from test_union where id = 1`  
结果是：     

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|SIMPLE|test_union|const|PRIMARY|PRIMARY|4|const|1| |

所以一共有10个字段。下面介绍笔者对每一个字段的理解。

### 1. **id**   
是select语句查询的序列号;  
当查询语句比较复杂的时候会产生多个序列号，如：   
`EXPLAIN SELECT * FROM test_union WHERE id = (SELECT id FROM test_union WHERE id = 3);`   
结果是：   

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|PRIMARY|test_union|const|PRIMARY|PRIMARY|4|const|1| |
|2|SUBQUERY|test_union|const|PRIMARY|PRIMARY|4| |1| Using index |

### 2. **select_type**  
 
select语句的类型，包括**SIMPLE**、**PRIMARY**、**UNION**、**DEPENDENT UNION**、**UNION RESULT**、**SUBQUERY**、**DEPENDENT SUBQUERY**、**DERIVED**、**MATERIALIZED**、**UNCACHEABLE SUBQUERY**、**UNCACHEABLE UNION**。   

#### 2.1 **SIMPLE**  
简单的SELECT语句（不包括UNION操作和子查询操作）。例：  
`explain select * from test_union where id = 1`  
结果：

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|**SIMPLE**|test_union|const|PRIMARY|PRIMARY|4|const|1| |

#### 2.2 **PRIMARY**   
最外层的SELECT语句（如果两表做UNION或者存在子查询的时候，最外层的操作为PRIMARY）。例： 
`EXPLAIN SELECT * FROM test_union WHERE id = (SELECT id FROM test_union WHERE id = 3);`   
结果：

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|**PRIMARY**|test_union|const|PRIMARY|PRIMARY|4|const|1| |
|2|SUBQUERY|test_union|const|PRIMARY|PRIMARY|4| |1| Using index |

#### 2.3 **UNION**   
UNION操作中，查询中处于内层的SELECT（内层的SELECT语句与外层的SELECT语句没有依赖关系）。例：  
`EXPLAIN SELECT * FROM test_union WHERE id = 1 UNION SELECT * FROM test_union WHERE id = 2;`  
结果：

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|PRIMARY|test_union|const|PRIMARY|PRIMARY|4|const|1| |
|2|**UNION**|test_union|const|PRIMARY|PRIMARY|4|const|1| |
|&lt;null&gt;|UNION RESULT| &lt;union1,2&gt;|ALL|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|  |

#### 2.4 **DEPENDENT UNION**   
UNION操作中，查询中处于内层的SELECT（内层的SELECT语句与外层的SELECT语句有依赖关系）。例：   
`EXPLAIN SELECT * FROM test_union WHERE id in (SELECT id FROM test_union WHERE id = 3 UNION SELECT id FROM test_union WHERE id = 1);`  
结果：

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|PRIMARY|test_union|ALL|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|3|Using where|
|2|DEPENDENT SUBQUERY|test_union|const|PRIMARY|PRIMARY|4|const|1|Using index|
|3|**DEPENDENT UNION**|test_union|const|PRIMARY|PRIMARY|4|const|1|Using index|
|&lt;null&gt;|UNION RESULT| &lt;union1,2&gt;|ALL|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|  |

#### 2.5 **UNION RESULT**  
UNION操作的结果，id值通常为NULL。例：  
`EXPLAIN SELECT * FROM test_union WHERE id = 1 UNION SELECT * FROM test_union WHERE id = 2;`  
结果：

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|PRIMARY|test_union|const|PRIMARY|PRIMARY|4|const|1| |
|2|UNION|test_union|const|PRIMARY|PRIMARY|4|const|1| |
|&lt;null&gt;|**UNION RESULT**| &lt;union1,2&gt;|ALL|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|  |

#### 2.6 **SUBQUERY**   
子查询中首个SELECT（如果有多个子查询存在）。例：  
`EXPLAIN SELECT * FROM test_union WHERE id = (SELECT fk_id FROM table_union_fk WHERE table_union_fk.id = 1);`  
结果：  

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|PRIMARY|test_union|const|PRIMARY|PRIMARY|4|const|1| |
|2|**SUBQUERY**|table_union_fk|const|PRIMARY|PRIMARY|4||1| |

#### 2.7 **DEPENDENT SUBQUERY**   
子查询中首个SELECT（如果有多个子查询存在）。例：  
`EXPLAIN SELECT * FROM test_union WHERE id in (SELECT id FROM test_union WHERE id = 3);`   
结果：

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|PRIMARY|test_union|ALL|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|3|Using where|
|2|**DEPENDENT SUBQUERY**|test_union|const|PRIMARY|PRIMARY|4|const|1|Using index|

#### 2.8 **DERIVED**   
被驱动的SELECT子查询（子查询位于FROM子句）。例：   
`EXPLAIN SELECT id,k1 FROM (SELECT * FROM test_union WHERE id < 3) a WHERE id = 2;`  
结果：

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|PRIMARY|&lt;derived2&gt;|ALL|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|2|Using where|
|2|**DERIVED**|test_union|range|PRIMARY|PRIMARY|4|const|2|Using where|

#### 2.9 **MATERIALIZED**  
被物化的子查询。

#### 2.10 **UNCACHEABLE SUBQUERY**   
对于外层的主表，子查询不可被物化，每次都需要计算（耗时操作）。

#### 2.11 **UNCACHEABLE UNION**   
UNION操作中，内层的不可被物化的子查询（类似于UNCACHEABLE SUBQUERY）。

**注**：物化的概念还不清楚，所以这里暂作留存，以后补充。


### 3. **table** 

输出的行所引用的表。

### 4. **type**

显示的是访问类型，是较为重要的一个指标，结果值从好到坏依次是：
system &gt; const &gt; eq_ref &gt; ref &gt; fulltext &gt; ref_or_null &gt; index_merge &gt; unique_subquery &gt; index_subquery &gt; range &gt; index &gt; ALL。 一般来说，得保证查询至少达到range级别，最好能达到ref。

#### 4.1 **NULL**
当SQL不访问表或者索引就能获得结果。例：   
`EXPLAIN SELECT SYSDATE();`   
结果：

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|PRIMARY|&lt;null&gt;|**&lt;null&gt;**|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|No tables used|

#### 4.2 **const**
当MySQL对查询某部分进行优化，这个匹配的行的其他列值可以转换为一个常量来处理。如将主键或者唯一索引置于where列表中，MySQL就能将该查询转换为一个常量。例：
`EXPLAIN SELECT * FROM test_union WHERE id = 1;`  
结果：

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|SIMPLE|test_union|**const**|PRIMARY|PRIMARY|4|const|1| |

system是const的一个特例，但是笔者还不是很理解，未能找到例子。

#### 4.3 **eq_ref**  
参与连接运算的表是内表（在代码实现的算法中，两表连接时作为循环中的内循环遍历的对象，这样的表称为内表）。基于索引（连接字段上存在唯一索引或者主键索引，且操作符必须是“=”谓词，索引值不能为NULL）做扫描，使得对外表的一条元组，内表只有唯一一条元组与之对应。

#### 4.4 **ref**   
可以用于单表扫描或者连接。参与连接运算的表，是内表。基于索引（连接字段上的索引是非唯一索引，操作符必须是“=”谓词，连接字段值不可为NULL）做扫描，使得对外表的一条元组，内表可有若干条元组与之对应。
 
#### 4.5 **range**
索引范围扫描，对索引的扫描开始于某一点，返回匹配值域的行，常见于between、<、>等的查询。等同于Oracle的index range scan。

#### 4.6 **index**
MySQL采取索引全扫描的方式来返回数据行，等同于Oracle的full index scan。

#### 4.7 **all**
全表扫描或者范围扫描：不使用索引，顺序扫描，直接读取表上的数据（访问数据文件）。

### 5. **possible_keys**
指出MySQL能使用哪个索引在该表中找到行。如果是空的，没有相关的索引。这时要提高性能，可通过检验WHERE子句，看是否引用某些字段，或者检查字段不是适合索引。

### 6. **key**
显示MySQL实际决定使用的键。如果没有索引被选择，键是NULL。

### 7. **key_len**
显示MySQL决定使用的键长度。如果键是NULL，长度就是NULL。文档提示特别注意这个值可以得出一个多重主键里mysql实际使用了哪一部分。这里注意了，一般索引中一个字段是4或者5,区别是在于如果字段允许为null，则一个字段的长度是5,如果不允许为null，则一个字段的长度为4。

### 8. **ref**
显示哪个字段或常数与key一起被使用。

### 9. **rows**
这个数表示mysql要遍历多少数据才能找到，在innodb上是不准确的。

### 10. **Extra**
如果是Only index，这意味着信息只用索引树中的信息检索出的，这比扫描整个表要快。
如果是where used，就是使用上了where限制。
如果是impossible where 表示用不着where，一般就是没查出来啥。
如果此信息显示Using filesort或者Using temporary的话会很吃力，WHERE和ORDER BY的索引经常无法兼顾，如果按照WHERE来确定索引，那么在ORDER BY时，就必然会引起Using filesort，这就要看是先过滤再排序划算，还是先排序再过滤划算。





