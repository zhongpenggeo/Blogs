### 1. 引用value

在YAML文件中，一个配置量的**值**可以通过引用另一个变量来设置。例如：

```yaml
default-db:
  port: 3306

user-db:
  port: ${default-db.port}
```



### 2. 引用key

要想替换键，则需要用到锚点。锚点用符号“&”定义，并用符号“*”进行引用。
锚点有两种使用方式，一是通过“<<:”**将键值对一起引入**：

```yaml
default-db: &default-db-config
  host: 127.0.0.1
  port: 3306

user-db:
  <<: *default-db-config
```

其实际效果如：

```
default-db:
  host: 127.0.0.1
  port: 3306

user-db:
  host: 127.0.0.1
  port: 3306
```

说明：&后面的锚点名字，可自己定义，不必与配置量的键相同。

#### 另一种是**仅引入配置的值**：

```
site:
  url:
    user: &site.user www.user.net
    shop: &site.shop www.shop.net

site:
  slogan:
    *site.user: everyone is great!
    *site.shop: buy anything you want!
```

其实际效果如：

```
site:
  url:
    user: www.user.net
    shop: www.shop.net

site:
  slogan:
    www.user.net: everyone is great!
    www.shop.net: buy anything you want!
```

说明：用&定义锚点时，注意锚点名前后的空格。







参考：[YAML文件(.yml)中的键(key)通过变量引用来设置 - i江湖中人 - 博客园 (cnblogs.com)](https://www.cnblogs.com/haycheng/p/13299183.html)