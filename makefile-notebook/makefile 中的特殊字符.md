# makefile 中的特殊字符

#### 1. %

%与shell中*的功能一样，但用在makefile的规则中，比如：

```makefile
%.pdf: %.edi
```

表示结果是生成相应的pdf，依赖于所有的edi文件；

#### 2. *，？等

一般用在相应的命令中

#### 3. @

目标文件，用在命令中，如：

```makefile
gcc -o $@ $^
gcc -o $@ $<
```

#### 4. ^

所有的依赖文件

#### 5. <

第一个依赖文件

