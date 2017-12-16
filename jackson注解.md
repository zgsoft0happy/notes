jackson注解

1 @JsonAnyGetter

这个注解是将bean的map属性中的属性扩展为自己的属性，如
``` 
public class ExtendableBean {

    public String name;
    public Map<String, String> properties = new HashMap<>();

    public ExtendableBean() {
    }

    public ExtendableBean(String name) {
        this.name = name;
    }

    @JsonAnyGetter
    public Map<String , String> getProperties() {
        return properties;
    }

    public void add (String key, String value) {
        this.properties.put(key, value);
    }
}
```
	
```  
    @Test
    public void whenSerializingUsingJsonAnyGetter_thenCorrect() throws IOException {
        ExtendableBean bean = new ExtendableBean("my Bean");
        bean.add("attr1", "val1");
        bean.add("attr2", "val2");

        String result = new ObjectMapper().writeValueAsString(bean);
        System.out.println(result);
    }
```
    
显示的结果是：`{"name":"my Bean","properties":{"attr2":"val2","attr1":"val1"},"attr2":"val2","attr1":"val1"}`，而不是`{"name":"my Bean","properties":{"attr2":"val2","attr1":"val1"}}`。

2 @JsonGetter

将指定方法的返回值映射到指定的字段，但是这个方法是Deprecated,如：

```
/**
 * Created by yang on 17-12-16.
 */
public class MyBean {

    public int id;
    public String name;

    public MyBean() {
    }

    public MyBean(int id, String name) {
        this.id = id;
        this.name = name;
    }

    @JsonGetter("name")
    public String getTheName() {
        return name;
    }

}
```

```
@Test
    public  void whenSerializingUsingJsonGetter_thenCorrect() throws IOException {
        MyBean bean = new MyBean(1, "nsssss");

        String result = new ObjectMapper().writeValueAsString(bean);

        System.out.println(result);
    }
```

结果显示：`{"id":1,"name":"nsssss"}`，而不是：`{"id":1,"name":"nsssss","theName":"nsssss"}`