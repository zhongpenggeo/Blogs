---
title: 函数——callable函数
date: 2021-07-27 10:04:43
categories:
- Python
---
**检查一个对象是否是可调用的**。如果返回 True，object 仍然可能调用失败；但如果返回 False，调用对象 object 绝对不会成功。



#### 什么是callable

只要可以在一个对象的后面使用小括号来执行代码，那么这个对象就是callable对象，下面列举callable对象的种类

1. 函数
2. 类
3. 类里的函数
4. 实现了__call__方法的实例对象



参考：

https://www.runoob.com/python/python-func-callable.html

https://zhuanlan.zhihu.com/p/101792911