## 1. %用法

### 1.1整数

%o —— oct 八进制
%d —— dec 十进制
%x —— hex 十六进制

```python
>>> print('%o' % 20)
24
>>> print('%d' % 20)
20
>>> print('%x' % 20)
14
```

### 1.2. 浮点数

%f ——保留小数点后面六位有效数字
　　%.3f，保留3位小数位
%e ——保留小数点后面六位有效数字，指数形式输出
　　%.3e，保留3位小数位，使用科学计数法
%g ——在保证六位有效数字的前提下，使用小数方式，否则使用科学计数法
　　%.3g，保留3位有效数字，使用小数或科学计数法

```python
>>> round(1.1125)  # 四舍五入，不指定位数，取整
1
>>> round(1.1135,3)  # 取3位小数，由于3为奇数，则向下“舍”
1.113
>>> round(1.1125,3)  # 取3位小数，由于2为偶数，则向上“入”
1.113
>>> round(1.5)  # 无法理解，查阅一些资料是说python会对数据进行截断，没有深究
2
>>> round(2.5)  # 无法理解
2
>>> round(1.675,2)  # 无法理解
1.68
>>> round(2.675,2)  # 无法理解
2.67
>>>
```



### 1.3 字符串

%s
%10s——右对齐，占位符10位
%-10s——左对齐，占位符10位
%.2s——截取2位字符串
%10.2s——10位占位符，截取两位字符串

```python
>>> print('%s' % 'hello world')  # 字符串输出
hello world
>>> print('%20s' % 'hello world')  # 右对齐，取20位，不够则补位
         hello world
>>> print('%-20s' % 'hello world')  # 左对齐，取20位，不够则补位
hello world
>>> print('%.2s' % 'hello world')  # 取2位
he
>>> print('%10.2s' % 'hello world')  # 右对齐，取2位
        he
>>> print('%-10.2s' % 'hello world')  # 左对齐，取2位
he
```

### 常用转义字符



![img](../imags/1099650-20170713135229556-190015564.png)



## 2. format用法

相对基本格式化输出采用‘%’的方法，format()功能更强大，该函数把字符串当成一个模板，通过传入的参数进行格式化，并且使用大括号‘{}’作为特殊字符代替‘%’

### 位置匹配

- 不带编号，{}
- 带数字编号，可调换顺序，{1}，{2}
- 带关键字，{a}，{tom}

```python
>>> print('{} {}'.format('hello','world'))  # 不带字段
hello world
>>> print('{0} {1}'.format('hello','world'))  # 带数字编号
hello world
>>> print('{0} {1} {0}'.format('hello','world'))  # 打乱顺序
hello world hello
>>> print('{1} {1} {0}'.format('hello','world'))
world world hello
>>> print('{a} {tom} {a}'.format(tom='hello',a='world'))  # 带关键字
world hello world
```

### 格式转换

'b' - 二进制。将数字以2为基数进行输出。

'c' - 字符。在打印之前将整数转换成对应的Unicode字符串。

'd' - 十进制整数。将数字以10为基数进行输出。

'o' - 八进制。将数字以8为基数进行输出。

'x' - 十六进制。将数字以16为基数进行输出，9以上的位数用小写字母。

'e' - 幂符号。用科学计数法打印数字。用'e'表示幂。

'g' - 一般格式。将数值以fixed-point格式输出。当数值特别大的时候，用幂形式打印。

'n' - 数字。当值为整数时和'd'相同，值为浮点数时和'g'相同。不同的是它会根据区域设置插入数字分隔符。

'%' - 百分数。将数值乘以100然后以fixed-point('f')格式打印，值后面会有一个百分号。

```python
>>> print('{0:b}'.format(3))
11
>>> print('{:c}'.format(20))

>>> print('{:d}'.format(20))
20
>>> print('{:o}'.format(20))
24
>>> print('{:x}'.format(20))
14
>>> print('{:e}'.format(20))
2.000000e+01
>>> print('{:g}'.format(20.1))
20.1
>>> print('{:f}'.format(20))
20.000000
>>> print('{:n}'.format(20))
20
>>> print('{:%}'.format(20))
2000.000000%
>>>
```

```python
>>> "Hello, {}. You are {}.".format(name, age)
'Hello, Eric. You are 74.'
>>> "Hello, {1}. You are {0}.".format(age, name)
'Hello, Eric. You are 74.'
>>> person = {'name': 'Eric', 'age': 74}
>>> "Hello, {name}. You are {age}.".format(name=person['name'], age=person['age'])
'Hello, Eric. You are 74.'
>>> person = {'name': 'Eric', 'age': 74}
>>> "Hello, {name}. You are {age}.".format(**person)
'Hello, Eric. You are 74.'
```



## f-strings

python 3.6以上才支持

```python
>>> name = "Eric"
>>> age = 74
>>> f"Hello, {name}. You are {age}." # F也可以
'Hello, Eric. You are 74.'

>>> f"{2 * 37}"
'74'
# 还支持函数和类
>>> f"{name.lower()} is funny."
'eric idle is funny.'
```

### 多个f

```python
>>> name = "Eric"
>>> profession = "comedian"
>>> affiliation = "Monty Python"
>>> message = (
...     f"Hi {name}. "
...     f"You are a {profession}. "
...     f"You were in {affiliation}."
... )
>>> message
'Hi Eric. You are a comedian. You were in Monty Python.'
```

如果需要在多行输出



[python基础_格式化输出（%用法和format用法） - fat39 - 博客园 (cnblogs.com)](https://www.cnblogs.com/fat39/p/7159881.html)

[Python 3's f-Strings: An Improved String Formatting Syntax (Guide) – Real Python](https://realpython.com/python-f-strings/)
