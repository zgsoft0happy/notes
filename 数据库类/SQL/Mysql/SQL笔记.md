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
|ALTER TABLE|`ALTER TABLE table_name ALTER COLUMN column_name datatype(SQL Server/MS Access)`  `ALTER TABLE table_name MODIFY COLUMN column_name datatype(MySQL/Oracle)`|
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
#####时间函数#####
|名称|描述|
|---|---|
|ADDDATE()|增加日期|
|ADDTIME()|增加时间|
|CONVERT_TZ()|将当前时区更改为另一时区|
|CURDATE()|返回当前日期|
|CURRENT_DATE(),CURRENT_DATE|CURDATE()的别名|
|CURRENT_TIME(),CURRENT_TIME|CURTIME()的别名|
|CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP|NOW()的别名|
|CURTIME()|返回当前时间|
|DATE_ADD()|将两个日期相加|
|DATE_FORMAT()|按照指定格式格式化日期|
|DATE_SUB()|将两个日期相减|
|DATE()|从date或者datetime表达式中提取出日期部分|sudo apt-get install apt-show-versions
|DATEDIFF()|将两个日期相减|
|DAY()|DAYOFMONTH()的别名|
|DAYNAME()|返回某天在用星期中的名称|
|DAYOFMONTH()|返回某天是当月的第几天(1-31)|
|DAYOFWEEK()|返回某天是该星期的第几天|
|DAYOFYEAR()|返回某天是一年中的第几天(1-366)|
|EXTRACT|提取日期中的某一部分|
|FROM_DAYS()|将天数转换为日期|
|FROM_UNIXTIME()|将某个日期格式化为UNIX时间戳|
|HOUR()|提取小时|
|LAST_DAY|返回参数日期所在月份的最后一天|
|LOCALTIME(),LOCALTIME|NOW()的别名|
|LOCALTIMESTAMP(),LOCALTIMESTAMP()|NOW()的别名|
|MAKEDATE()|利用年份和某天在该年所处的天数来创建日期|
|MAKETIME|MAKETIME()|
|MICROSECOND()|由参数返回微秒|
|MINUTE()|由参数返回分钟|
|MONTH()|返回日期参数的月份|
|MONTHNAME()|返回月份的名字|
|NOW()|返回当前日期和时间|
|PERIOD_ADD()|向年月格式的日期数据之间添加一段时间|
|PERIOD_DIFF()|返回两个年月格式的日期数据之间的月份数|
|QUARTER()|返回日期参数所在的季节|
|SEC_TO_TIME()|将秒数转换为'HH:MM:SS'格式|
|SECOND()|返回参数中的秒数(0-59)|
|STR_TO_DATE()|将字符串转换为日期格式|
|SUBDATE()|以三个参数调用的时候是DATE()的同义词|
|SUBTIME()|减去时间|
|SYSDATE()|返回函数执行的时刻|
|TIME_FORMAT()|格式化时间|
|TIME_TO_SEC()|将时间参数转换为秒数|
|TIME()|返回参数表达式中的时间部分|
|TIMEDIFF()|将两个时相减|
|TIMESTAMP()|只有一个参数时，该函数返回date或者datetime表达式。当有两个参数时，将两个参数相加|
|TIMESTAMPADD()|在datetime表达式上加上一段时间|
|TIMESTAMPDIFF()|在datetime表达式上减去一段时间|
|TO_DAYS()|将日期参数转换为天数|
|UNIX_TIMESTAMP()|返回UNIX时间戳|
|UTC_DATE()|返回当前UTC日期|
|UTC_TIME()|返回当前UTC时间|
|UTC_TIMESTAMP()|返回当前UTC日期和时间|
|WEEK()|返回参数的星期数|
|WEEKDAY()|返回日期参数是一个星期中的第几天|
|WEEKOFYEAR|返回日期参数是日历上的第几周(1-53)|
|YEAR()|返回日期参数中的年份|
|YEARWEEK()|返回年份和日期|

时间单位：

|unit值|应有的格式|
|---|---|
|MICROSECND|微秒|
|SECOND|秒|
|MINUTE|分钟|
|HOUR|小时|
|DAY|天|
|WEEK|星期|
|MONTH|月|
|QUARTER|季度|
|YEAR|年|
|SECOND_MICROSECOND|'秒.微秒'|
|MINUTE_MICROSECOND|'分.微秒'|
|MINUTE_SECOND|'分:秒'|
|HOUR_MICROSECOND|'小时.微秒'|
|HOUR_SECOND|'时:分:秒'|
|HOUR_MINUTE|'时:分'|
|DAY_MICROSECOND|'天.微秒'|
|DAY_SECOND|'天 时:分:秒'|
|DAY_MINUTE|'天 时:分'|
|DAY_HOUR|'天 时'|
|YEAR_MONTH|'年-月'|

格式化占位符：

|占位符|描述|
|---|---|
|%a|简写的星期名称（Sun..Sat）|
|%b|简写的月份名称 （Jan..Dec）|
|%c|月份，以数值形式表示（0..12）|
|%D|月份中的日期，带有英文后缀（0th，1st，2nd，3rd 等等）|
|%d|月份中的日期，以数值表示 (00..31)|
|%e|月份中的日期，以数值表示 (0..31)|
|%f|微秒（000000..999999）|
|%H|小时(00..23)|
|%h|小时(01..12)|
|%I|小时(01..12)|
|%i|分钟,以数值表示(00..59)|
|%j|一年中的第几天（001..366）|
|%k|小时（0..23）|
|%l|小时（1..12）|
|%M|月份的名称（January..December）|
|%m|月份，以数值形式表示（00..12）|
|%p|AM 或者 PM|
|%r|时间，12 小时制(hh:mm:ss followed by AM or PM)|
|%S|秒(00..59)|
|%s|秒(00..59)|
|%T|时间，24小时制（hh:mm:ss）|
|%U|星期（00..53），此处星期日为一周的第一天|
|%u|星期（00..53），此处星期一为一周的第一天|
|%V|星期（01..53），此处星期日为一周的第一天；与 %X 一起使用。|
|%v|星期（01..53），此处星期一为一周的第一天；与 %x 一起使用。|
|%W|一周中日期的名称（Sunday..Saturday）|
|%w|一周中的第几天（0=Sunday..6=Saturday）|
|%X|以星期日为第一天的周所处的年份，四位数字表示；同 %V 一起使用。|
|%x|以星期一为第一天的周所处的年份，四位数字表示；同 %v 一起使用。|
|%Y|年份，四位数字表示。|
|%y|年份，两位数字表示。|
|%%|% 字面值|
|%x|x，针对任何以上没有列出的情况。|

SQL Aggregate函数：

|函数|描述|SQL|
|---|---|---|
|AVG()|返回平均值|`SELECT AVG(column_name) FROM table_name` |
|COUNT()|返回行数|`SELECT COUNT(column_name) FROM table`|
|FIRST()|返回第一个记录的值|`SELECT FIRST(column_name) FROM table_name`  `SELECT column_name FROM table_name ORDER BY column_name ASC LIMIT 1`(MySQL)|
|LAST()|返回最后一个记录的值|`SELECT LAST(column_name) FROM table_name` `SELECT column_name FROM table_name ORDER BY column_name DESC LIMIT 1`(MySQL)|
|MAX()|返回最大值|`SELECT MAX(column_name) FROM table_name`|
|MIN()|返回最小值|`SELECT MIN(column_name) FROM table_name`|
|SUM()|返回总和|`SELECT SUM(column_name) FROM table_name`|
|SQRT()|计算平方根|`SELECT SQRT(column_name) FROM table_name`|
|RAND()|返回一个0到1之间的随机数|`SELECT RAND()`|

SQL Scalar函数：

|函数|描述|SQL|
|---|---|---|
|UCASE(),UPPER()|将某个字段转换为大写|`SELECT UCASE('str'),UPPER('str')`  `SELECT UCASE(column_name) FROM table_name`|
|LCASE(),LOWER()|将某个字段转换为小写|`SELECT LCASE('str'),LOWER('str')`  `SELECT LCASE(column_name) FROM table_name`|
|FIELD()|返回索引位置|`FIELD(str,str1,str2,str3,...)`|
|MID()|从某个文本字段提取字符|`SELECT MID(column_name,start[,length]) FROM table_name`|
|LEN()| 返回某个字段的长度|`SELECT LEN(column_name) FROM table_name`|
|ROUND()|对某个数值字段进行制定小数位数的四舍五入|`SELECT ROUND(column_name,decimals) FROM table_name`|
|NOW()|返回当前的系统日期和时间|`SELECT NOW() FROM table`|
|FORMAT()|格式化某个字段的显示方式|`SELECT FORMAT(column_name,format) FROM table_name`|
|CONCAT()|连接字符串|`SELECT CONCAT(column_name1,column_name2) FROM table_name`|
|REPLACE()|字符串替换|`UPDATE table_name SET column_name=replace(column_name,str1,str2)`|
|TRIM(),LTRIM(),RTRIM()|去除字符串的空格|`SELECT TRIM(str)`|

