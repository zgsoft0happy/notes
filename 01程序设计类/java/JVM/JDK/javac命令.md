编译java源代码为java二进制class文件

- 用法
  - `javac [options] [sourcefiles][classes][@argfiles]`
- options:选项
  - Standard Options
    - -Akey[=value]   指定传递给注释处理器的选项
    - -cp path  /  - classpath path    指定用户class文件的搜索路径（CLASSPATH环境变量的功能）
    - -Djava.ext.dirs=directories  /  -extdirs directories  覆盖安装扩展的位置
    - -Djava.endorsed.dirs=directories  /  -endorseddirs directories    覆盖以认可的标准路径的位置
    - -d directory  生成的class文件的保存路径，这个目录必须提前存在。
    - -deprecation   显示每一个对过时的类或成员的引用或者覆盖的描述
    - -encoding encoding  设置源码文件的编码格式
    - -g 生成所有的debug信息
    - -g:none  不生成任何debug信息
    - -g:[keyword list]   生成指定类型的debug信息,多个种类用`,`隔开。
      - source   源文件的debug信息
      - lines    行号调试信息
      - vars     局部变量调试信息
    - -help     打印标准选项的帮助概要信息
    - implicit:[class  none]   控制隐式加载的源文件的类文件的生成。
    - -J options    将Options选项传递给JVM
    - -nowarn     禁用警告信息
    - -parameters   存储正是的构造器和方法的参数名，便于在反射的时候获得
    - -proc: [none, only] 控制是否完成注释处理和编译。 -proc：none表示编译没有注释处理。 -proc：仅意味着仅进行注释处理，而不进行任何后续编译。
    - -processor class1 [,class2,class3...]   要运行的注释处理器的名称。这绕过了默认的发现过程。
    - -processorpath path  指定在哪里找到注释处理器。如果没有使用这个选项，那么在类路径中搜索处理器。
    - -s dir    指定放置生成的源文件的目录
    - -source release   指定接受的源代码的版本。以下允许发布的值是允许的：1.3/1.4/1.5/5/1.6/6/1.7/7/1.8/8
    - -sourcepath sourcepath  指定搜索类或接口定义的源代码路径。
    - -verbose   使用详细输出，其中包括有关每个加载的类和编译的每个源文件的信息。
    - -version   打印版本
    - -werror    警告发生时终止编译
    - -X     显示有关非标准选项和退出的信息。
  - Cross-Compilation Options   交叉编译选项
  - Compact Profile Option      紧凑侧面选项
  - Nonstandard Options         非标准选项

`注意：更多请参考[官网](https://docs.oracle.com/javase/8/docs/technotes/tools/windows/javac.html#BHCJCBFB)`

- sourcefiles:源码文件（[列表]）
- classes:一个或多个需要处理注解的类（这个我好想不是很明白）
- @argfiles:如果源文件太多，可以使用一个源文件列表罗列所有的源文件，然后在列表文件前加@，编译列表文件中所有的源文件。
