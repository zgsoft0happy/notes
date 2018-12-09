核心：
  1. 传输
  2. 序列化

两端：
  provider：服务端
  customer: 客户端

1. 把provider写到ZK中
  - java操作ZK的API
  - java代码链接ZK
  - serviceName,url,port ->zk,节点，子节点
  - 服务名称注册为永久性节点

2. comsumer要进行服务发现，根据服务名获得服务的地址
  - 服务发现
  - 监听
  - LB

3.
    - 27.0.0.1:8080
    - TO Server: ServerSocket(8080)  等待客户端的链接
    - To Client: Socket(127.0.0.1,8080)

    绑定


1. Spring Bean的生命周期
2. Spring Bean是不是线程安全的
