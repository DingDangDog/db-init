# DbInit
- 数据库初始化插件

## 注意
- 插件尚不成熟，生产环境谨慎使用！

## 使用场景
- 项目启动时，需要初始化数据库的项目，如：新建表
- 项目新增一些表时，也可以使用本项目插件进行发布到生产环境，但是需要特别注意发布时sql脚本情况。
- 原则上为了防止数据丢失、覆盖等问题，不要连接已有数据的库进行测试使用。

## 配置示例
```yaml
# 多数据源示例
db-init:
  db-list:
    - name: dataSource  # 数据源名称
      enable: true      # 是否启用db-init
      type: mysql       # 数据源类型
      logging: false    # 记录初始日志（未实现）
    - name: oldDataSource
      enable: true
      type: mysql
      logging: false
    - name: oracleDataSource
      enable: true
      type: Oracle
      logging: false
```

## 基本用法
### starter自动配置
1. 引用``starter``依赖
2. 正常配置``spring``数据源
3. 配置本项目特定配置信息
4. 启动类上使用``@EnableDbInit``注解
5. 正常启动项目

## 现有功能
- 已支持数据库类型：MySQL、Oracle。
- 已进行初始化日志记录，但目前只使用了``System.out.println()``打印，没有进行存储。
- 已支持多数据源初始化，``db-test``中测试了三个数据源的情况（两个MySQL，一个Oracle）。

## 未来计划
1. 增加数据库初始化日志存储功能。
2. 增加sql脚本版本管理功能：现版本每次项目启动都会重复执行脚本，未做版本管理，生产环境谨慎使用！
3. 增加其他数据源初始化功能。

## Maven坐标
### starter自动配置
- springboot-starter
```xml
<dependency>
  <groupId>io.github.dingdangdog</groupId>
  <artifactId>db-init-spring-boot-starter</artifactId>
  <version>1.0</version>
</dependency>
```
### 手动配置
- db-init
```xml
<dependency>
  <groupId>io.github.dingdangdog</groupId>
  <artifactId>db-init</artifactId>
  <version>1.0</version>
</dependency>
```


