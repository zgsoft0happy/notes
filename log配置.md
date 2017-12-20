日志系统

为了观察系统日志的结果，这里首先写下测试类，TT.java：
```
package cn.ideacs.learn.test.spring.context;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TT {
    @Test
    public void test1() {
        Logger logger = LoggerFactory.getLogger(TT.class);
        logger.info("lalala");
    }

}
```

项目利用maven来加入依赖，其它形式的以来加入请自行解决，记i昂各个依赖包加入到类路径下。

为了使系统能够在各种日志框架之间自由的转换，我们使用slf4j日志框架，这是一个日志的"接口"框架，具体使用那个实现，要看系统的设置，这里首先需要引入slf4j的依赖包：
```
<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-api</artifactId>
    <version>1.7.25</version>
</dependency>
```

下面介绍各种实现框架的设置和测试结果

1. slf4j-simple

这是slf4j框架自己实现的一个框架，使用该实现，需要在类路径中引入`slf4j-simple-{version}.jar`包。
```
<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-simple</artifactId>
    <version>1.8.0-alpha2</version>
</dependency>
```

测试结果：
```
[main] INFO cn.ideacs.learn.test.spring.context.TT - lalala
```

2. slf4j-jdk1.4

这是jdk自带的日志框架，使用该实现，需要在类路径中引入`slf4j-jdk14-{version}`包。
```
<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-jdk14</artifactId>
    <version>1.7.25</version>
</dependency>
```

测试结果：
```
十二月 20, 2017 3:55:37 下午 cn.ideacs.learn.test.spring.context.TT test1
信息: lalala
```

3. slf4j-jcl

这是java common logging 框架，使用该实现需要引入`slf4j-jcl-{version}.jar和commons-logging-{version}.jar`依赖包。
```
<dependency>
    <groupId>commons-logging</groupId>
    <artifactId>commons-logging</artifactId>
    <version>1.2</version>
</dependency>
<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-jcl</artifactId>
    <version>1.7.25</version>
</dependency>
```

测试结果：
```
十二月 20, 2017 4:15:08 下午 cn.ideacs.learn.test.spring.context.TT info
信息: lalala
```

笔者理解，这里的输出和jdk-logging输出是一致的，因为commons-loggin和slf4j一样是一个日志门面（存在osgi问题）,这个首先是slf4j门面转为commons-logging门面，然后commons-logging门面调用的是jdk-logging的日志框架，所以和slf4j-jdk14框架的现实结果是一致的。

5. slf4j-log4j

这个需要说明了，由于log4j从1.x版本到2.x版本经历的重大更新，使得性能大幅度的提升。如果使用的1.x的版本需要引入的包是`slf4j-log4j12-{version}.jar`和`log4j.jar`，1.x的配置和2.x的略有差异，1.x的具体配置这里不再细说，这里直接介绍2.x的配置。使用2.x需要引入的包log4j-core-{version}.jar、log4j-api-{version}.jar和log4j-slf4j-impl-{version}.jar,如果是web项目，还需要log4j-web-{version}.jar。

使用log4j框架需要在项目类路径下配置log4j，使用log4j2，则需要log4j2.xml(其它类型的配置，文件名必须是log4j2，不同的是文件扩展名)。首先配置在控制台输出的log4j2.xml:

```
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="WARN">
    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n"/>
        </Console>
    </Appenders>
    <Loggers>
        <Root level="info">
            <AppenderRef ref="Console"/>
        </Root>
    </Loggers>
</Configuration>
```

测试结果是：
```
17:33:01.198 [main] INFO  cn.ideacs.learn.test.spring.context.TT - lalala
```

另外设置一个一般系统中常用的记录日志的方式的log4j2的配置，主要是使用RollingRandomAccessFile来自由的记录日志，具体配置为log4j2.xml:
```
<?xml version="1.0" encoding="UTF-8" ?>
<Configuration status="DEBUG" monitorInterval="30">

    <properties>
        <property name="LOG_HOME">/data1/logs/test</property>
        <property name="JPID">1</property>
    </properties>

    <Appenders>
        <RollingRandomAccessFile name="InfoFile"
                                 fileName="${LOG_HOME}/log-info-${sys:JPID}.log"
                                 filePattern="${LOG_HOME}/webapi-info-${sys:JPID}-%d{yyyy-MM-dd-HH}.log">
            <Filters>
                <ThresholdFilter level="warn" onMatch="DENY" onMismatch="NEUTRAL" />
                <ThresholdFilter level="info" onMatch="ACCEPT" onMismatch="DENY" />
            </Filters>
            <PatternLayout pattern="%date{yyyy-MM-dd HH:mm:ss.SSS} [%X{tracker-uuid}@%X{tracker-from}][%X{tracker-ext}] %level [%thread][%file:%line] - %msg%n" />
            <Policies>
                <TimeBasedTriggeringPolicy interval="1"/>
            </Policies>
            <DefaultRolloverStrategy max="300" />
        </RollingRandomAccessFile>
    </Appenders>

    <Loggers>
        <Logger name="com.anjuke.trisomic.mybatis" level="info" additivity="false">
            <AppenderRef ref="InfoFile"/>
        </Logger>
        <Root level="info">
            <AppenderRef ref="InfoFile" />
            <AppenderRef ref="ErrorFile" />
        </Root>
    </Loggers>
</Configuration>
```

这里具体介绍下各个配置的含义

`Configuration`是配置的根节点，属性status是配置StatusLogger的属性，由于应用在加载配置的时候，还未及时的加载其他的日志配置，在log4j-2.9默认是将信息输出在控制台，配置这个属性，就是为了获得这个Logger对象：`protected final static Logger logger = StatusLogger.getLogger()`，这个属性配置的就是这个logger的输出级别。`monitorInterval`属性是配置多久系统自动加载一次log的配置，最小粒度是5秒，方便系统修改日志的配置，而不用重新启动应用。

properties节点是声明配置终将要应用的属性 。

Appenders是声明日志的输出方式，子节点RollingRandomAccessFile为具体的声明，还表示自由写入。其子节点Filters是设置日志输出的过滤。PatternLayout是设置日志的输出格式。Policies是因为日志记录的可能导致日志文件非常庞大，所以设置一定的策略将达到一定条件的日志文件进行拆分。TimeBasedTriggeringPolicy是设置根据时间来拆分文件，interval设置的是间隔时间，其单位是日志文件名的时间最后以为，这里的时间最后以为是HH，小时，所以就是没个小时生成一个新的文件；SizeBasedTriggeringPolicy是根据日志文件的大小来决定文件的拆分，size="500kb"设置的是每个日志文件最大500kb的时候就会拆分。DefaultRolloverStrategy设置的是相同文件名（除了数字部分）的数量最大多少个文件，超过了则会覆盖最早出现的文件。

Loggers是设置具体的Logger使用的日志输出配置，Logger节点是设置具体的日志，name="a.b"的日志是name="a.b.c"的日志的父日志，additivity设置的是是否在父日志中输出该日志，如果为false则只在该日志输出结果。Root是设置根日志。

上面的配置会在目录/data1/logs/test/下生成日志文件，文件内容为：
```
2017-12-20 18:02:59.502 [@][] INFO [main][TT.java:15] - lalala
```

6. logback-classic

这个日志框架是实现slf4j的本地化，可以实现更高的性能，笔者没有研究过，以后补充。
