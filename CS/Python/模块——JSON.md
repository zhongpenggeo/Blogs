---
title: 模块——JSON
date: 2021-07-27 10:04:43
categories:
- Python
---
**JSON 是用于存储和交换数据的语法。**

**JSON 是用 JavaScript 对象表示法（JavaScript object notation）编写的文本。**



### 解析JSON

若有 JSON 字符串，则可以使用 json.loads() 方法对其进行解析。

结果将是 Python 字典。

```python
import json

# 一些 JSON:
x =  '{ "name":"Bill", "age":63, "city":"Seatle"}'

# 解析 x:
y = json.loads(x)

# 结果是 Python 字典：
print(y["age"])
```

> 63

### python转为JSON

若有 Python 对象，则可以使用 json.dumps() 方法将其转换为 JSON 字符串。

```python
import json

# Python 对象（字典）：
x = {
  "name": "Bill",
  "age": 63,
  "city": "Seatle"
}

# 转换为 JSON：
y = json.dumps(x)

# 结果是 JSON 字符串：
print(y)
```

> {"name": "Bill", "age": 63, "city": "Seatle"}



您可以把以下类型的 Python 对象转换为 JSON 字符串：

- dict
- list
- tuple
- string
- int
- float
- True
- False
- None

将 Python 对象转换为 JSON 字符串，并打印值：

```python
import json

print(json.dumps({"name": "Bill", "age": 63}))
print(json.dumps(["apple", "bananas"]))
print(json.dumps(("apple", "bananas")))
print(json.dumps("hello"))
print(json.dumps(42))
print(json.dumps(31.76))
print(json.dumps(True))
print(json.dumps(False))
print(json.dumps(None))
```

> {"name": "Bill", "age": 63}
> ["apple", "bananas"]
> ["apple", "bananas"]
> "hello"
> 42
> 31.76
> true
> false
> null







参考：https://www.w3school.com.cn/python/python_json.asp