## named_parameters()

给出网络层的名字和参数的迭代器

```python3
for param in model.named_parameters():
    print(param[0])
# 得到所有层名字
```

![img](../imags/v2-9b3c1b8450bb1b3f273c6c5b6a03eb5a_1440w.jpg)

## parameters()

给出一个网络全部参数的迭代器

print(type(model.parameters())) # 返回的是一个generator

