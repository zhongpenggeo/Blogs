## 1. system()

- system函数可以将字符串转化成命令在服务器上运行；其原理是每一条system函数执行时，其会创建一个子进程在系统上执行命令行，子进程的执行结果无法影响主进程；

- 上述原理会导致当需要执行多条命令行的时候可能得不到预期的结果；

```python
import os

os.system('cd /usr/local')
os.mkdir('aaa.txt)
```

上述程序运行后会发现txt文件并没有创建在/usr/local文件夹下，而是在当前的目录下；

（类似于并行？）

## 使用system执行多条命令

- 为了保证system执行多条命令可以成功，多条命令需要在同一个子进程中运行；

```python
import os

os.system('cd /usr/local && mkdir aaa.txt')
# 或者
os.system('cd /usr/local ; mkdir aaa.txt')
```

参考：[python基础之os.system函数 - 天宇之游 - 博客园 (cnblogs.com)](https://www.cnblogs.com/cwp-bg/p/8465566.html)

system只能返回0，1，2信号，不能返回具体错误信息。

## 2. path

### os.path.join()

这是一个十分实用的函数，可以将多个传入路径组合为一个路径。实际上是将传入的几个字符串用系统的分隔符连接起来，组合成一个新的字符串，所以一般的用法是将第一个参数作为父目录，之后每一个参数即使下一级目录，从而组合成一个新的符合逻辑的路径。

但如果传入路径中存在一个“绝对路径”格式的字符串，且这个字符串不是函数的第一个参数，那么其他在这个参数之前的所有参数都会被丢弃，余下的参数再进行组合。更准确地说，只有最后一个“绝对路径”及其之后的参数才会体现在返回结果中。

```python
>>> os.path.join("just", "do", "python", "dot", "com")
'just\\do\\python\\dot\\com'
>>> 
>>> os.path.join("just", "do", "d:/", "python", "dot", "com")
'd:/python\\dot\\com'
>>> 
>>> os.path.join("just", "do", "d:/", "python", "dot", "g:/", "com")
'g:/com'
```

