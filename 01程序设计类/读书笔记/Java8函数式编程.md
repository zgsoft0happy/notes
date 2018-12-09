1. 函数式编程的驱动力
  - 多核并行处理（多线程）
  - 锁编程复杂切容易出错
  - JUC包中的成功抽象程度远远不够

2. 代码风格转变  
```
button.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent event) {
      System.out.println("button clicked");
    }
  })
```
-->
```
button.addActionListener(event -> System.out.println("button clicked"))
```
  - 参数类型：类型推断

3. Lambda表达式变体
  - 无参数  
  `Runnable noArguments = () -> System.out.println("Hello World")`
  - 单个参数，可以省略括号   
  `ActionListener oneArguments = event -> System.out.println("button cliecked")`
  - 表达式主体是一代码块   
  ```
  Runnable multiStatement = () -> {
        System.out.print("Hello ");
        System.out.println("World");
  }
  ```
  - 多个参数用括号括起来   
  `BinaryOperator<Long> add = (x,y) -> x + y;`
  - 多参数建议显示指定参数类型   
  `BinaryOperator<Long> addExplicit = (Long x, Long y) -> x + y`
