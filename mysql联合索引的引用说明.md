联合索引     
顾名思义，就是几个字段联合起来，一起做的索引，为了讲述，首先先建立一个表，test_union:   
```
create table test_union
(
	id int auto_increment comment 'zhujian'
		primary key,
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
```  

插入几条数据：  
```
insert into test_union(k1,k2,k3,k4,k5,k6,k7) values(1,1,1,1,1,1,1);
insert into test_union(k1,k2,k3,k4,k5,k6,k7) values(2,2,2,2,2,2,2);
insert into test_union(k1,k2,k3,k4,k5,k6,k7) values(3,3,3,3,3,3,3);
```

从如下几条SQL语句讲述联合索引的使用：
```
EXPLAIN SELECT * FROM test_union where k1= 1;
EXPLAIN SELECT * FROM test_union where k1= 1 AND k2 =1;
EXPLAIN SELECT * FROM test_union where k1= 1 AND k3 = 1;
EXPLAIN SELECT * FROM test_union where k1= 1 AND k4 =1;
EXPLAIN SELECT * FROM test_union where k2= 1;
EXPLAIN SELECT * FROM test_union where k6 = 1;
```

先看看每条语句的explain分析。

------
`EXPLAIN SELECT * FROM test_union where k1= 1;`  

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|SIMPLE|test_union|ref|test_union_k1_k2_k3_k4_k5_index|test_union_k1_k2_k3_k4_k5_index|4|const|1| |

 	用到了联合索引`test_union_k1_k2_k3_k4_k5_index`，但是并没有用到全部，之用到了联合索引中的字段k1，也就是只有一个字段，所以`key_len`的长度为4。
----
`EXPLAIN SELECT * FROM test_union where k1= 1 AND k2 =1;`

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|SIMPLE|test_union|ref|test_union_k1_k2_k3_k4_k5_index|test_union_k1_k2_k3_k4_k5_index|8|const,const|1| |

	用到了联合索引`test_union_k1_k2_k3_k4_k5_index`，但是并没有用到全部，之用到了联合索引中的字段k1，k2，也就是只有两个字段，所以`key_len`的长度为8。
-----
`EXPLAIN SELECT * FROM test_union where k1= 1 AND k3 = 1;`

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|SIMPLE|test_union|ref|test_union_k1_k2_k3_k4_k5_index|test_union_k1_k2_k3_k4_k5_index|4|const|1| |

	用到了联合索引`test_union_k1_k2_k3_k4_k5_index`，但是并没有用到全部，由于`key_len`为4,可知之用到联合索引的其中一位，那就是k1，但是k3也是联合索引`test_union_k1_k2_k3_k4_k5_index`的字段之一，这里没有用的原因是，对于联合索引来说，开始只有第一个字段的索引可用，当使用了第一个字段后，第二个字段的索引才有效，以此类推，这里的原因，笔者个人的理解如下，举个简单的例子，一共有四条数据{(1,1),(1,2),(2,1),(2,2)},这四条数据的是按照字典序排列，但是如果没有使用第一个字段，直接使用第二个字段，对应的是{1,2,1,2},并不是排序好的，索引是无法建立的，不知道这样理解是否有些不妥，就是索引需要一次使用，不能隔着字段使用。该例中由于k1是第一个字段，索引是建立好的，可以直接使用，这时k2的索引是可以使用的，但是由于没有使用k2直接使用k3字段查询，k3的字段索引不能使用，因此只能使用k1一个字段的索引，所以`key_len`为4，而另一个字段k3查询走的是where条件，所以字段Extra为Using where。
-------------
`EXPLAIN SELECT * FROM test_union where k1= 1 AND k4 =1;`  

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|SIMPLE|test_union|ref|test_union_k1_k2_k3_k4_k5_index|test_union_k1_k2_k3_k4_k5_index|4|const|1| |
	
    该例和上一条示例类似，由于未使用k2和k3,所以不能直接使用索引的k4字段,而另一个字段k4查询走的是where条件，所以字段Extra为Using where。
    
注意： 以上几条都用到了联合索引，但都不是用到所有字段，记得之前接触过一个词叫"部分索引"，大概就是这个意思了吧！请大牛指正（zgsoft_happy@126.com)

------
`EXPLAIN SELECT * FROM test_union WHERE k1 = 1 AND k2 = 1 AND k3 = 1 AND k4 = 1 AND k5 = 1;` 

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|SIMPLE|test_union|ref|test_union_k1_k2_k3_k4_k5_index|test_union_k1_k2_k3_k4_k5_index|20|const,const,const,const,const|1| |

	该例使用了联合索引的所有字段，一共是5个字段，因此key_len为20。
    
------
`EXPLAIN SELECT * FROM test_union where k2= 1;`

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|SIMPLE|test_union|ALL|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|3|Using where|

	这个例子的原理类似前面两个部门索引的例子，由于没有使用联合索引的字段k1，直接使用k2，这个时候k2没有索引。所以不能使用索引，而该表中又没有其他包含k2的索引，因此没有使用索引，直接遍历所有的数据记录查询的，使用的是Using where。
-------
`EXPLAIN SELECT * FROM test_union where k6 = 1;`

|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|1|SIMPLE|test_union|ALL|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|&lt;null&gt;|3|Using where|

	这个好理解，因为k6字段没有在任何索引里，所以不能使用索引，因此是直接遍历所有的数据记录查询的，使用的是Using where。
    

至此，mysql的联合索引的使用介绍完毕，由于个人理解，可能存在偏差，请指正，zgsoft_happy@126.com。



