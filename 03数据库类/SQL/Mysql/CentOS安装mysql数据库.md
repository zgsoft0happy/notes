在安装mysql数据库的时候，首先应该卸载已经安装的mysql数据库
`[root@centos ~]# rpm -qa | grep mysql　　// 这个命令就会查看该操作系统上是否已经安装了mysql数据库`
利用该命令将已安装的mysql数据库的相关安装程序在终端列出来，然后依次删除（卸载）这些程序
`[root@centos ~]# rpm -e mysql　　// 普通删除模式`
`[root@centos ~]# rpm -e --nodeps mysql　　// 强力删除模式，如果使用上面命令删除时，提示有依赖的其它文件，则用该命令可以对其进行强力删除`

删除完成后，使用如下命令确定mysql相关的全部删除：
`[root@centos ~]# rpm -qa | grep mysql`

下边便可以进行mysql的新安装了。

自带库安装

1. `[root@centos ~]# yum list | grep mysql`:这条命令用来查看yum库里的mysql相关软件
2. 使用如下命令安装
	`[root@centos ~]# yum install -y mysql-server mysql mysql-deve`
3. 安装完成后使用如下命令查看mysql的版本
	`[root@centos ~]# rpm -qi mysql-server`
4. 启动mysql服务
	`[root@centos ~]# service mysqld start`
5. 使用如下命令查看mysql服務是否是开机启动
	`[root@contos ~]# chkconfig --list | grep mysqld`
6. 使用如下命令开启开机自启动mysql服务
	`[root@centos ~]# chkconfig mysqld on`
	然后可以使用5.中的命令查看
7. 第一次启动mysql时需要设置root的密码
	`[root@centos ~]# mysqladmin -u root password 'root'　　// 通过该命令给root账号设置密码为 root`

安装最新版的mysql

由于自己时先按照上面的自带yum库安装的，希望安装更高版本的mysql，所以需要首先删除上述安装的mysql版本。因为是自己的经验，所以就把自己的安装过程详情，以及解决的命令详细的记录下来，便于以后的学习总结。

首先就是卸载先前安装的mysql5.1.*
过程同上，命令为

	[root@centos ~]# rpm -qa | grep mysql

	[root@xiaoluo ~]# rpm -e --nodeps mysql-libs
	
	[root@xiaoluo ~]# rpm -e --nodeps mysql-devel

	[root@xiaoluo ~]# rpm -e --nodeps mysql-server

下面开始安装mysql最新版的mysql5.7。

1. 首先是去mysql官网下载mysql的rpm文件，这里有需要注意的地方，在官网上的rpm文件是针对redhat系统的，未找到针对centos系统，但由于centos基本来源于redhat，所以完全可以下载，但是注意版本对应，也就是说centos6.*的系统下载redhat6对应的版本，（本人测试的该版本通过，其他版本未曾测试）。需要下载的文件是：`mysql57-community-release-el6-10.noarch.rpm`
2. 安装上述下载的mysql的yum库的rpm包
	
	`[root@centos ~]# yum install mysql57-community-release-el6-10.noarch.rpm`
3. 查看yum库中的mysql版本
	`[root@centos ~]# rpm -qa | grep mysql`
4. 安装mysql
	
	```
	[root@centos ~]# yum install -y mysql-server mysql mysql-deve
	```
5. 启动Mysql服务
	
	`[root@centos ~]# service mysqld start`

	但是不知道什么原因，导致启动失败，失败的提示为
	
	MySQL Daemon failed to start.

	正在启动 mysqld： [失败]
	
	查看/var/log/mysql.log查看的原因，下边是解决的代码

6. 解决权限问题：

	[root@centos ~]# chown -R mysql:mysql /var/lib/mysql
	[root@centos ~]# chmod 777 -R /var/lib/mysql

7. 删除之前mysql的数据文件

	[root@centos ~]# cd /var/lib/mysql

	[root@centos ~]# ls

	ibdata1  ib_logfile0  ib_logfile1  mysql  test

	[root@centos mysql]# rm ibdata1 ib_logfile0 ib_logfile1

	rm：是否删除普通文件 "ibdata1"？y

	rm：是否删除普通文件 "ib_logfile0"？y

	rm：是否删除普通文件 "ib_logfile1"？y

8. 彻底干掉old的mysql文件夹

	[root@centos lib]# mv mysql mysql.bak

	[root@centos lib]# service mysqld start

9. 设置root的密码
	
	[root@centos ~]# /etc/init.d/mysqld stop

	停止 mysqld： [确定]

	[root@centos ~]# mysqld_safe --user=mysql --skip-grant-tables --skip-networking &

	[1] 2858

	[root@centos ~]# 2017-04-21T13:46:19.707534Z mysqld_safe Logging to '/var/log/mysqld.log'.

	2017-04-21T13:46:19.731432Z mysqld_safe Starting mysqld daemon with databases from /var/lib/mysql
 
	[root@centos ~]# mysql -u root mysql

	Reading table information for completion of table and column names
	You can turn off this feature to get a quicker startup with -A
	Welcome to the MySQL monitor.  Commands end with ; or \g.
	Your MySQL connection id is 3
	Server version: 5.7.18 MySQL Community Server (GPL)
	Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.
	Oracle is a registered trademark of Oracle Corporation and/or its
	affiliates. Other names may be trademarks of their respective
	owners.
	Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
	
	mysql> UPDATE user SET Password=PASSWORD('newpassword') where USER='root';

	ERROR 1054 (42S22): Unknown column 'Password' in 'field list'

	mysql> UPDATE user SET authentication_string=PASSWORD('newpassword') where USER='root';
	
	Query OK, 1 row affected, 1 warning (0.00 sec)

	Rows matched: 1  Changed: 1  Warnings: 1
	
	mysql> FLUSH PRIVILEGES;

	Query OK, 0 rows affected (0.00 sec)
	
	注意，这里Password字段改为了authentication_string

然后就可以尽情的在centos上运行最新版本的mysql数据库了。


远程登录mysql

首先就是授权问题：
1. 首先就是获得数据库中存储的root用户的密码：
	`select user,host,authentication_string from mysql.user`
2. 复制root的密码设置权限;
	`GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY PASSWORD '*205C68FA5C62B469B5FDA59B4A674FCC53B97D05' WITH GRANT OPTION`
3. 这样远程的密码就是root的本地密码，但需要解决防火墙的问题：
	`iptables -I INPUT -s 0/0 -p tcp --dport 3306 -j ACCEPT`
	查看防火墙：`iptables -L -n | grep 3306`或者`iptables-save | grep 3306`

然后即可享受远程登录mysql了



