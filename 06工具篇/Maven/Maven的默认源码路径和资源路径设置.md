##Maven的默认源码路径和资源路径设置##
在pom.xml文件中设置编译时的路径，其中的代码如下：
```
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
  ```
  
  注意：但是在页面中直接用文件名获得文件，还是不能获得，需要使用Resources类来获得
  `InputStream is =  Resources.getResourceAsStream("filename");`