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










