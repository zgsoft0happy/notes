##mybatis的学习总结１——入门##
一. mybatis的环境搭建
1. 在pom.xml文件中设置源码路径和资源路径（个人爱好，并不是mybatis的内容），以及所需要依赖的jar包，因为笔者的数据库用的mysql，所以jdbc的用户jdbc可能和各位看官的不一样，请注意修改，下面是pom.xml文件的详细内容：
```
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>cn.ideacs.learn</groupId>
  <artifactId>learn-mybatis</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <packaging>jar</packaging>

  <name>learn-mybatis</name>
  <url>http://maven.apache.org</url>

  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
  </properties>
  

  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>3.8.1</version>
      <scope>test</scope>
    </dependency>
    <dependency>
    	<groupId>org.mybatis</groupId>
    	<artifactId>mybatis</artifactId>
    	<version>3.4.1</version>
    </dependency>
    <dependency>
    	<groupId>mysql</groupId>
    	<artifactId>mysql-connector-java</artifactId>
    	<version>6.0.6</version>
    </dependency>
  </dependencies>
  
  
  <build>
  	<sourceDirectory>src/main/java</sourceDirectory>
  	<resources>
  		<resource>
  			<directory>src/main/resources</directory>
  		</resource>
  	</resources>
  	<testSourceDirectory>src/test/java</testSourceDirectory>
  	<testResources>
  		<testResource>
  			<directory>src/test/resources</directory>
  		</testResource>
  	</testResources>
  </build>
</project>
```

2. 创建数据库表：
	`CREATE DATABASE mybatis_db;`
	
	`use mybatis_db;`
	
	
		CREATE TABLE person_db(
		card_id BIGINT NOT NULL AUTO_INCREMENT COMMENT '身份证id',
		name VARCHAR(50) NOT NULL DEFAULT '空' COMMENT '姓名',
		age TINYINT NOT NULL DEFAULT '0' COMMENT '年龄',
		address VARCHAR(255) COMMENT '地址',
		remark VARCHAR(255) COMMENT '备注',
		PRIMARY KEY (\`card_id\`)
		)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '人员信息表';

3.  创建person类：

```
	package cn.ideacs.learn.learn_mybatis.hello;

	public class Person {

	private Long cardId;	//身份证ID
	private String name;	//姓名
	private Byte age;		//年龄
	private String address;	//地址（籍贯）
	public Long getCardId() {
		return cardId;
	}
	public void setCardId(Long cardId) {
		this.cardId = cardId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Byte getAge() {
		return age;
	}
	public void setAge(Byte age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Person [cardId=" + cardId + ", name=" + name + ", age=" + age + ", address=" + address + "]";
	}
}
```

创建PersonMapper类：

```
package cn.ideacs.learn.learn_mybatis.hello;

public interface PersonMapper {

	public Person getByCardId(Long cardId);
	
}
```

创建PersonMapper.xml配置文件：
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="cn.ideacs.learn.learn_mybatis.hello.PersonMapper">
	
	<select id="getByCardId" parameterType="long" resultType="cn.ideacs.learn.learn_mybatis.hello.Person">
		select card_id cardId, name, age , address 
		from person_db where card_id = #{cardId}
	</select>
	
</mapper>        
```

创建mybatis.xml配置文件：
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
	<environments default="development">
		<environment id="development">
			<transactionManager type="JDBC"></transactionManager>
			<dataSource type="POOLED">
				<property name="driver" value="com.mysql.jdbc.Driver"/>
				<property name="url" value="jdbc:mysql://localhost:3306/mybatis_db"/>
				<property name="username" value="xxxxxx"/>
				<property name="password" value="xxxxxx"/>
			</dataSource>
		</environment>
	</environments>
	<mappers>
		<mapper resource="cn/ideacs/learn/learn_mybatis/hello/PersonMapper.xml"/>
	</mappers>
</configuration>
```
4. 创建测试类：
```
package cn.ideacs.learn.learn_mybatis.hello;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.mysql.cj.api.Session;

public class HelloWorld {

	public void test1(){
		SqlSessionFactory sessionFactory = null;
		try {
			sessionFactory = new SqlSessionFactoryBuilder()
					.build(Resources.getResourceAsStream("mybatis.xml"));
			SqlSession session = sessionFactory.openSession();
			System.out.println(session);
			PersonMapper mapper = session.getMapper(PersonMapper.class);
			Person person = mapper.getByCardId(1L);
			System.out.println(person);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		HelloWorld hw = new HelloWorld();
		hw.test1();
	}
	
}
```
注意：项目的文件结构图：
![文件结构图加载中...](/home/yang/Downloads/文件结构.jpg  "文件结构")
