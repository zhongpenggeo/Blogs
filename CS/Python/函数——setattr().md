---
title: 函数——setattr()
date: 2021-07-27 10:04:43
categories:
- Python
---
### hasattr()函数

hasattr() 函数用来判断某个类实例对象是否包含指定名称的属性或方法。该函数的语法格式如下：

```python
hasattr(obj, name)
```

其中 obj 指的是某个类的实例对象，name 表示指定的属性名或方法名。同时，该函数会将判断的结果（True 或者 False）作为返回值反馈回来。



### getattr()函数

getattr() 函数获取某个类实例对象中指定属性的值。没错，和 hasattr() 函数不同，该函数只会从类对象包含的所有属性中进行查找。

getattr() 函数的语法格式如下：

```python
getattr(obj, name[, default])
```

其中，obj 表示指定的类实例对象，name 表示指定的属性名，而 default 是可选参数，用于设定该函数的默认返回值，即当函数查找失败时，如果不指定 default 参数，则程序将直接报 AttributeError 错误，反之该函数将返回 default 指定的值。

```python
class CLanguage:
    def __init__ (self):
        self.name = "C语言中文网"
        self.add = "http://c.biancheng.net"
    def say(self):
        print("我正在学Python")
clangs = CLanguage()
print(getattr(clangs,"name"))
print(getattr(clangs,"add"))
print(getattr(clangs,"say"))
print(getattr(clangs,"display",'nodisplay'))
```



### setattr()函数

setattr() 函数的功能相对比较复杂，它最基础的功能是修改类实例对象中的属性值。其次，它还可以实现为实例对象动态添加属性或者方法。

setattr() 函数的语法格式如下：

```python
setattr(obj, name, value)
```



```python
class CLanguage:
    def __init__ (self):
        self.name = "C语言中文网"
        self.add = "http://c.biancheng.net"
    def say(self):
        print("我正在学Python")
clangs = CLanguage()
print(clangs.name)
print(clangs.add)
setattr(clangs,"name","Python教程")
setattr(clangs,"add","http://c.biancheng.net/python")
print(clangs.name)
print(clangs.add)
```

程序运行结果为：

> C语言中文网
> http://c.biancheng.net
> Python教程
> http://c.biancheng.net/python

甚至利用 setattr() 函数，还可以将类属性修改为一个类方法，同样也可以将类方法修改成一个类属性

使用 setattr() 函数对实例对象中执行名称的属性或方法进行修改时，如果该名称查找失败，Python 解释器不会报错，而是会给该实例对象动态添加一个指定名称的属性或方法。例如：

```python
def say(self):
    print("我正在学Python")
class CLanguage:
    pass
clangs = CLanguage()
setattr(clangs,"name","C语言中文网")
setattr(clangs,"say",say)
print(clangs.name)
clangs.say(clangs)
```

> C语言中文网
> 我正在学Python





参考：http://c.biancheng.net/view/2378.html