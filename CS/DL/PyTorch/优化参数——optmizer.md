## 优化器

pytorch中优化器都在torch.optim模块中。

#### 基类 `torch.optim.Optimizer(*params*, *defaults*)`

所有的优化器，如Adam，SGD都是由这个基类派生出来的

```python
optimizer = torch.optim.Adam(model.parameters(),
                lr=hp["lr"], weight_decay=hp["L2"])
```



**参数**：

- params：an iterable of [`torch.Tensor`](https://pytorch.org/docs/stable/tensors.html#torch.Tensor) s or [`dict`](https://docs.python.org/3/library/stdtypes.html#dict) s. Specifies what Tensors should be optimized；即需要是可迭代的tensor或者字典。一般是`model.parameters()`
- default：一般参数，字典类型，如步长等。



如果params不仅仅是网络的权重系数W和b，需要加入其他参数参与迭代，则使用形式为：

```python
opt = torch.optim.Adam([{'params':fnn.parameters()},{'params':a}])
```

以字典的形式加入其他参数；其中，该参数的`requires_grad=True`，否则不能计算backward和寻找梯度。