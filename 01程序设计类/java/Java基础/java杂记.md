1. ArrayList,数组实现的，所以最好是在初始化的时候确定大小，当不确定的时候，超出限制的时候会使用System.arraycopy()方法复制到新的数组，默认插入数据的时大小是10.
2. LinkedList,双向链表实现，查询的时候看是后半部分还是前半部分来决定从前开始查还是从后开始。
3. Vector也是数组实现的，当容量不够的时候，会自动增长，每次的曾长长度是根据是否设置了增长步长来决定，如果设置了，则每次增长步长，否则增长的长度是Vector的原来容量长度，即变为2倍。
4. 局部变量必须显式初始化
5. 面向对象的三大特征：封装、继承、多态
6. 访问控制权限有四种：private、default、protected、public
  - 成员变量（方法）可以用这四种修饰符修饰
  - 局部变量不能使用访问权限控制符
  - 外部类只能有两种访问权限修饰符：public、default
7. 方法修饰符
  - private\\default\\protected\\public 必须出现只能同时出现一个。
  - static  可出现也可不出现
  - abstract\\final只能出现一个或者一个也不出现
  - 以上三种可以随意组合（说的不太明白，自己体会）。
