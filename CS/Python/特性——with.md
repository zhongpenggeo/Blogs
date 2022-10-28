---
title: 特性——with
date: 2021-07-27 10:04:43
categories:
- Python
---
与异常处理相关的功能

#### 功能

with 语句适用于对资源进行访问的场合，确保不管使用过程中是否发生异常都会执行必要的”清理”操作，释放资源，比如文件使用后自动关闭、线程中锁的自动获取和释放等。

#### 概念：上下文管理

- **上下文管理协议（Context Management Protocol）** ：包含方法 **enter**() 和 **exit**()，支持该协议的对象要实现这两个方法。
- **上下文管理器（Context Manager）** ：支持上下文管理协议的对象，这种对象实现了 **enter**() 和 **exit**() 方法。上下文管理器定义执行 with 语句时要建立的运行时上下文，负责执行 with 语句块上下文中的进入与退出操作。通常使用 with 语句调用上下文管理器，也可以通过直接调用其方法来使用。
- **运行时上下文（runtime context）** ：由上下文管理器创建，通过上下文管理器的 **enter**() 和 **exit**() 方法实现，**enter**() 方法在语句体执行之前进入运行时上下文，**exit**() 在语句体执行完后从运行时上下文退出。with 语句支持运行时上下文这一概念。
- **上下文表达式（Context Expression）** ：with 语句中跟在关键字 with 之后的表达式，该表达式要返回一个上下文管理器对象。
- **语句体（with-body）** ：with 语句包裹起来的代码块，在执行语句体之前会调用上下文管理器的 **enter**() 方法，执行完语句体之后会执行 **exit**() 方法。

### 用法

#### 命令格式

```python
with context_expression [as target(s)]:
        with-body
```

这里 context_expression 要返回一个上下文管理器对象，该对象并不赋值给 as 子句中的 target(s) ，如果指定了 as 子句的话，会将上下文管理器的 \*_enter**() 方法的返回值赋值给 target(s)。target(s) 可以是单个变量，或者由”()”括起来的元组（不能是仅仅由”,”分隔的变量列表，必须加”()”）。

Python 对一些内建对象进行改进，加入了对上下文管理器的支持，可以用于 with 语句中，比如可以自动关闭文件、线程锁的自动获取和释放等。假设要对一个文件进行操作，使用 with 语句可以有如下代码：

#### 打开文件

```python
with open("１.txt") as file:
    data = file.read()
```

如果换成try except

```python
try:
    f = open('xxx')
except:
    print('fail to open')
    exit(-1)
try:
    do something
except:
    do something
finally:
    f.close()
```

#### 原理

1. 紧跟with后面的语句被求值后，返回对象的“–enter–()”方法被调用，这个方法的返回值将被赋值给as后面的变量；

2. 当with后面的代码块全部被执行完之后，将调用前面返回对象的“–exit–()”方法。
   with工作原理代码示例：

   ```python
   class Sample:
       def __enter__(self):
           print "in __enter__"
           return "Foo"
       def __exit__(self, exc_type, exc_val, exc_tb):
           print "in __exit__"
   def get_sample():
       return Sample()
   with get_sample() as sample:
       print "Sample: ", sample
   ```



参考：https://blog.csdn.net/u012609509/article/details/72911564

https://developer.ibm.com/zh/languages/python/articles/os-cn-pythonwith/