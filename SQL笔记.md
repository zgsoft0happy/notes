##SQL##

####SQL语句的分类####
1. 数据查询语句(DQL: Data Query Language)
	SELECT， 搭配使用WHERE , ORDER BY , GROUP BY , HAVING
2. 数据操作语句(DML: Data Manipulation Language)
	INSERT , UPDATE , DELETE
3. 事务处理语句(TPL)
	BEGIN TRANSACTION , COMMIT , ROLLBACK
4. 数据控制语句(DCL)
	GRANT , REVOKE
5. 数据定义语句(DDL)
	CREATE , DROP
6. 指针控制语句(CCL)
	DECLARE CURSOR , FETCH INTO , UPDATE WHERE CURRENT
	
####SQL数据类型####

-- 字符型(varchar相对char较优)
-- 文本型(慎用，至少分配2k的空间，即便是空值)
-- 数值型(小数numeric ，钱数money)
-- 逻辑型(建表时创建，建表后不能添加这样的字段)
-- 日期型

####一些重要的SQL命令####
-- SELECT   
-- UPDATE
-- DELETE
-- INSERT INTO
-- CREATE DATABASE
-- ALTER DATABASE
-- CREATE TABLE
-- ALTER TABLE
-- DROP TABLE
-- CREATE INDEX
-- DROP INDEX

####SQL 语句快速参考####

|关键字|语句格式|
|---|---|
|AND / OR|`SELECT column_name(s) FROM table_name WHERE condition AND|OR condition`|
|ALTER TABLE|`ALTER TABLE table_name ADD column_name datatype`or `ALTER TABLE table_name DROP COLUMN column_name`|
|AS(alias)|`SELECT column_name AS column_alias FROM table_name` or ` SELECT column_name FROM table_name AS table_alias`|
|BETWEEN|`SELECT column_name(s) FROM table_name WHERE column_name BETWEEN value1 AND value2`|
|CREARE DATABASE|`CREATE DATABASE database_name`|
|CREATE TABLE|`CREATE TABLE table_name(column_name1 data_type,column_name2 data_type,column_name3 data_tyoe,...)`|
|CREATE INDEX|`CREATE INDEX index_name ON table_name(column_name)` or `CREATE UNIQUE INDEX index_name ON table_name(column_name)`
|CREATE VIEW|`CREATE VIEW view_name AS SELECT column_name(s) FROM table_name WHERE condition`|
|DELETE|`DELETE FROM table_name WHERE some_column=some_value` or `DELETE FROM table_name`  (**Note:**Deletes the entire table!!) or `DELETE * FROm table_name`(**Note:**Deletes the entire table!!)|
|DROP DATABASE|`DROP DATABASE database_name`|
|DROP INDEX|`DROP INDEX table_name.index_name` (SQL Server) /` DROP INDEX index_name On table_name` (MS Access) / `DROP INDEX index_name`(DB2/Oracle) / `ALTER TABLE table_name DROP INDEX index_name`(MySQL)|
|DROP TABLE|`DROP TABLE table_name`|
|GROUP BY|`SELECT column_name,aggregate_function(column_name) FROM table_name WHERE column_name operator value GROUP BY column_name`|
|HAVING|`SELECT column_name,aggregate_function(column_name) FROM table_name WHERE column_name operator value GROUP BY column_name HAVING aggregate_function(column_name) operator value`|
|IN|`SELECT column_name(s) FROM table_name WHERE column_name IN (value1,value2,...)`|
|INSERT INTO|`INSERT INTO table_name VALUES(value1,value2,value3,...)` or `INSERT INTO table_name(column1,column2,column3,...) VALUES(value1,value2,value3,...)`|
|INNER JOIN|`SELECT column_name(s) FROM table_name1 INNER JOIN table_name2 ON table_name1.column_name=table_name2.column_name`|
|LEFT JION|`SELECT column_names(s) FROM table_name1 LEFT JOIN table_name2 ON table_name1.column_name=table_name2.column_name`|
|RIGHT JOIN|`SELECT column_name(s) FROM table_name1 RIGHT JOIN table_name2 ON table_name1.column=table_name2.column_name`|
|FULL JOIN|`SELECT column_name(s) FROM table_name1 FULL JOIN table2 ON table_name1.column_name=table_name2.column_name`|
|LIKE|`SELECT column_name(s) FROM table_name WHERE column_name LIKE pattern`|
|ORDER BY|`SELECT column_name(s) FROM table_name ORDER BY column_name [ASC/DESC]`|
|SELECT|`SELECT column_name(s) FROM table_name`|
|SELECT *|`SELECT * FROM table_name`|
|SELECT INTO|`SELECT * INTO new_table_name [IN externldatabase] FROM old_table_name` or `SELECT column_name(s) INTO new_table_name {IN externaldatabase] FROM old_table_name`|
|SELECT TOP|`SELECT TOP number/percent column_name(s) FROM table_name`|
|TRUNCATE TABLE|`TRUNCATE TABLE table_name`|
|UNION|`SELECT column_name(s) FROM table_name1 UNION SELECT column(s) FROM table_name2`|
|UNION ALL|`SELECT column_name(s) FROM table_name1 UNION ALL SELECT column_name(s) FROM table_name2`|
|UPDATE|`UPDATE table_name SET column1=value1,column2=value2,... WHERE some_column=some_value`|
|WHERE|`SELECT column_name(s) FROM table_name WHERE column_name operator value`|
|ALTER TABLE|`ALTER TABLE table_name ALTER COLUMN column_name datatype`(SQL Server/MS Access) or `ALTER TABLE table_name MODIFY COLUMN column_name datatype`(MySQL/Oracle)|
|IS NULL|`SELECT column_name(s) FROM table_name WHERE some_column IS NULL`|
|IS NOT NULL|`SELECT column_name(s) FROM table WHERE some_column IS NOT NULL`|



####有关SQL 日期####
#####MySQL Date函数#####
|函数|描述|
|---|---|
|NOW()|返回当前的日期和时间|
|CURDATE()|返回当前的日期|
|CURTIME()|返回当前的时间|
|DATE()|提取日期或日期/时间表达式的日期部分|
|EXTRACT()|返回日期/时间的单独部分||
|DATE_ADD()|向日期添加制定的时间间隔|
|DATE_SUB()|从日期减去chiding的时间间隔|
|DATEDIFF()|返回两个日期之间的天数|
|DATE_FORMAT()|用不同的格式显示日期/时间|

#####SQL Server Date函数#####
|函数|描述|
|---|---|
|GETDATE()|返回当前的日期和时间|
|DATEPART()|返回日期/时间的单独部分|
DATEADD()|在日期中添加或者减去制定的时间间隔|
|DATEDIFF()|返回两个日期之间的时间|
|CONVERT()|用不同的格式显示日期/时间|

####SQL DATE 数据类型####
#####MYSQL#####
-- DATE-格式：YYYY-MM-DD
-- DATETIME-格式：YYYY-MM-DD HH:MM:SS
-- TIMESTAMP-格式：YYYY-MM-DD HH:MM:SS
-- YEAR-格式：YYYY 或 YY
#####SQL Server#####
-- DATE-格式： YYYY-MM-DD
-- DATETIME-格式： YYYY-MM-DD HH:MM:SS
-- SMALLDATETIME-格式： YYYY-MM-DD HH:MM:SS
-- TIMESTAMP-格式：唯一的数字

####SQL 进阶####
-- 别名   使用关键字AS实现
-- SQL 约束
1. NOT NULL约束
	`ALTER TABLE table_name MODIFY column_name datatype NOT NULL`
	`ALTER TABLE table_name CHANGE column_oldname column_newname datatype NOT NULL`
	`ALTER TABLE table_name MODIFY column_name datatype`
	`ALTER TABLE table_name CHANGE column_oldname column_newname datatype`
2. DEFAULT约束
	`CREATE TABLE table_name(column_name datatype DEFAULT value)`
	`ALTER TABLE table_name ALTER column_name SET DEFAULT value`
	`ALTER TABLE table_name CHANGE column_oldname column_newname datatype DEFAULT value`
	`ALTER TABLE table_name ALTER column_name DROP DEFAULT`
	`ALTER TABLE table_name CHANGE column_oldname column_newname datatype`
3. UNIQUE约束
	`ALTER TABLE table_name MODIFY column_name datatype UNIQUE`
	`ALTER TABLE table_name CHANGE column_oldname column_newname datatype UNIQUE`
	`ALTER TABLE table_name ADD UNIQUE(column_name)`
	`ALTER TABLE table_name ADD UNIQUE KEY(column_name)`
	`ALTER TABLE table_name ADD CONSTRAINT UN_ID UNIQUE(column_name)`
	`ALTER TABLE table_name ADD CONSTRAINT UN)ID UNIQUE KEY(column_name)`
	`ALTER TABLE table_name DROP INDEX column_name`
4. 主键约束
	`CREATE TABLE table_name(column_name1 datatype PRIMARY KEY)`
	`CREATE TABLE table_name(column_name1 datatype,column_name2 datatype,CONSTRAINT PK_ID_NAME PRIMARY KEY(column_name1,column_name2)`#复合约束
	`CREATE TABLE table_name(column_name datatype,PRIMARY KEY(column_name))`
	`ALTER TABLE table_name MODIFY column_name datatype PRINMARY KEY`
	`ALTER TABLE table_name CHANGE column_oldname column_newname datatype PRIMARY KEY`
	`ALTER TABLE table_name ADD PRIMARY KEY(column_name)`
	`ALTER TABLE table_name ADD CONSTRAINT PK_ID PRIMARY KEY(column_name)`
	`ALTER TABLE table_name DROP PRIMARY KEY`
	注：删除主键约束之前，如果有自增长必须先删除自增长
5. 外键约束
	`CREATE TABLE table_name2(column_name1 datatype,column_name2 datatype,CONSTRAINT FK_name KEY(column_name2) REFERENCES table_name1(column_name1)`
	`ALTER TABLE table_name ADD CONSTRAINT FK_name FOREIGN KEY(column_name2) REFERENCES table_name1(column_name1)`
	`ALTER TABLE table_name DROP FOREIFN KEY FK_name`
	注：ON DELETE CASCADE 删除主表中的数据时，从表中的数据随之删除
		ON UPDATE CASCADE 更新主表中的数据时，从表中的数据随之更新
		ON DELETE SET NULL 删除主表中的数据时，从表中的数据置为空
		默认 删除主表中的数据前需先删除从表中的数据，否则主表数据不会被删除
6. CHECK约束
	`CREATE TABLE table_name(column_name datatype,CHECK(condition))`
	`ALTER TABLE table_name ADD CHECK(condition)`
	`ALTER TABLE table_name ADD CONSTRAINT chk_name CHECK(condition)`
	`ALTER TABLE table_name DROP CHECK chk_name`
7. 索引
8. 其他

|关键字|SQL 语句|
|---|---|
|AUTO_INCREMENT|` CREATE TABLE table_name(column_name datatype(int long等) AUTO_CREMENT)`  `ALTER TABLE table_name MODIFY column_name datatype AUTO_INCREMENT`  `ALTER TABLE table_name CHANGE column_oldname column_newname datatype AUTO_INCREMENT`  `ALTER TABLE table_name MODIFY column datatype`  `ALTER TABLE table_name CHANGE column_oldname column_newname datatype`|
|ZEROFILL|`CREATE TABLE table_name(column_name datatype ZEROFILL)`  `ALTER TABLE table_name MODIFY column_name datatype ZEROFILL`  `ALTER TABLE table_name CHANGE column_oldname column_newname datatype ZEROFILL`  `ALTER TABLE table_name MODIFY column_name datatype`  `ALTER TABLE table_name CHANGE column_oldname column_newname datatype`|
|UNSIGNED|`CREATE TABLE table_name(column_name datatype UNSIGNED)`  `ALTER TABLE table_name MODIFY column_name datatype UNSIGNED`  `ALTER TABLE table_name CHANGE column_oldname column_newname datatype UNSIGNED`  `ALTER TABLE table_name MODIFY column_name datatype`  `ALTER TABLE table_name CHANGE column_oldname column_newname datatype`|

注意：从查询indormation_schema中查询指定表中的约束
```
USE INFORMATION_SCHEMA;
SELECT CONSTRAINT_NAME FROM TABLE_CONSTRAINTS WHERE TABLE_NAME = 'table_name'
```

MySQL数据库可使用`SHOW CREATE TABLE`命令来查看原表的结构	索引等信息的CREATE TABLE语句。

####自查询####
1. 子查询必须括在圆括号中。
2. 子查询的SELECT子句中只能有一个列，除非主查询中有多个列，用于与子查询选中的列相比较。
3. 子查询不能使用ORDER BY，不过主查询可以。在子查询中，GROUP BY 可以起到通ORDER BY相同的作用。
4. 返回多行数据的子查询只能同多值操作符一起使用，比如IN操作符。
5. SELECT 列表中不能包含任何对BLOB、ARRAY、CLOB或者NCLOB类型值的引用.
6. 子查询不能直接用在集合函数中。
7. BETWEEN操作符不能同子查询一起使用，但是BETWEEN操作符可以用在子查询中。
`SELECT column_name(s) FROM table_name1 [,table_name2] WHERE column_name OPERATOR (SELECT column_name(s) FROM table_name1 [,table_name2] [WHERE])`

####处理重复数据####
`SELECT DISTINCT column_name(s) FROM table_name [WHERE condition]`

####WITH CHECK OPTION####
WITH CHECK OPTION是CREATE VIEW语句的一个可选项，用于保证所有的UPDATE和INSERT语句都满足视图定义中的条件，如果不能满足这些条件，UPDATE或INSERT就会返回错误.
`CREATE VIEW view_name AS SELECT column_name(s) FROM table_name WHERE condition(age IS NOT NULL) WITH CHECK OPTION`
####更新视图####
视图可以在特定的情况下更新：
1. SELECT子句不能包含DISTINCT关键字
2. SELECT子句不能包含任汇总函数(summary functions)
3. SELECT子句不能包含任何集合函数(set functions)
4. SELECT子句不能包含任何集合运算符(set operators)
5. SELECT子句不能包含ORDER BY子句
6. FROM子句不能包含多个数据表
7. WHERE子句不能包含子查询(subquery)
8. 查询语句中不能有GROUP BY或者HAVING
9. 计算得出的列不能更新
10. 视图必须包含原始数据表中所有的NOT NULL列，从而INSERT查询生效。

####SQL  HAVING####
HAVING紧跟GROUP BY之后，在ORDER BY之前。
`SELECT column_name(s) FROM table_name(s) WHERE [conditions] GROUP BY cloumn_name(s) HAVING [conditions] ORDER BY column_name(s)`

####事务####
#####事务属性ACID#####
1. 原子性
2. 一致性
3. 隔离性
4. 持久性

#####控制命令#####
1. COMMIT
2. ROLLBACK
3. SAVEPOINT
4. SET TRANSACTION

``` 
COMMIT;
ROLLBACK;
SAVEPOINT savepoint_name;
ROLLBACK TO savepoint_name;
RELEASE SAVEPOINT savepoint_name;#(删除保存点)
SET TRANSACTION [READ WRITE | READ ONLY];
```

从特定的值开始序列 
`CREATE TABLE table_name(id int AUTO_INCREMENT=100)`
`ALTER TABLE table_name AUTO_INCREMENT =100`

####临时表TEMPORARY####
`CREATE TEMPORARY TABLE table_name()`
注意：SHOW TABLES 不会显示临时表

LAST_INSERT_ID()获得最后一条记录的AUTO_INCREMENT的值。

####SQL函数####

