1. 数据表一个联合索引`idx_k1_k2_k3`,对于sql语句：`select * from tb where k1 = ? and k2 = ? order by k3`，是否使用了索引
答：使用了索引，但是只是使用了联合索引的部分索引，也就是说k3没有使用到索引。

2. 数据库中使用limit的时候，`limit 1000,100` 比`limit 0,100`更耗时。
