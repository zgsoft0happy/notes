 Spring配置

三种方法可混合使用

# XML显式配置

# Java中显式配置

# 隐式的bean发现机制和自动装配

两个角度实现自动化装配：

## 组件扫描

### @Component

### @Configuration

### @ComponentScan

可以设置基础扫描的包(basePackage="xx.xx")

### XML中配置：<context:component-scan base-package="xx.xx"/>

### @Named

javax.inject.Named

## 自动装配

### @ContextConfiguration(class=CDPlayerConfig.class)

junit测试时可以使用@RunWith让某一个类协同测试。

### @Autowired

### @Inject
