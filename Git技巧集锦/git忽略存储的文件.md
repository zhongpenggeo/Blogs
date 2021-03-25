建立`.gitignore`文件，在该文件中写入不需要存储的文件或文件夹名称

一些常用语言的默认忽略规则可以参考：https://github.com/github/gitignore

### 忽略语法

#### 1. 忽略文件（夹）

```gitignore
# 忽略指定文件
HelloWrold.class

# 忽略指定文件夹
bin/
bin/gen/
```

#### 2. 通配符

通配符规则如下：



```kotlin
# 忽略.class的所有文件
*.class

# 忽略名称中末尾为ignore的文件夹
*ignore/

# 忽略名称中间包含ignore的文件夹
*ignore*/
```





参考：https://www.jianshu.com/p/a09a9b40ad20