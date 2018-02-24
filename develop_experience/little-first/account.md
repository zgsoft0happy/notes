1. 创建账户数据表

```
CREATE TABLE account_tb(
  id BIGINT UNSIGNED AUTO_INCREMENT COMMENT '用户ID',
  username VARCHAR(56) NOT NULL DEFAULT '' COMMENT '用户名，登录名',
  password VARCHAR(200) NOT NULL DEFAULT '' COMMENT '登陆密码',
  show_name VARCHAR(56) NOT NULL DEFAULT '' COMMENT '昵称',
  real_name VARCHAR(56) NOT NULL DEFAULT '' COMMENT '真实姓名',
  phone VARCHAR(24) NOT NULL DEFAULT '' COMMENT '主联系电话',
  qq VARCHAR(20) NOT NULL DEFAULT '' COMMENT 'qq号码',
  wechat VARCHAR(56) NOT NULL DEFAULT '' COMMENT '微信',
  email VARCHAR(56) NOT NULL DEFAULT '' COMMENT 'eamil地址',
  education TINYINT NOT NULL DEFAULT '0' COMMENT '学历,0未知，1文盲，2小学，3初中，4高中，5中专，6大专，7专科，8本科，9专业硕士，10学士硕士，11在职硕士，12在职博士，13博士',
  age SMALLINT NOT NULL DEFAULT '0' COMMENT '年龄',
  gender TINYINT NOT NULL DEFAULT '0' COMMENT '性别，0未知，1男，2女',
  is_delete TINYINT NOT NULL DEFAULT '0' COMMENT '是否无效,1无效，0有效',
  remark VARCHAR(255) NOT NULL DEFAULT '' COMMENT '备注',
  create_time datetime not null DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  INDEX inx_username (`username`),
  INDEX inx_createtime(`create_time`)
  )Engine=InnoDB DEFAULT charset=utf8 COMMENT '用户帐号信息表';
```

1. 登记
2. 编辑
3. 根据用户名查看
4. 列表
5. 逻辑删除根据ID
