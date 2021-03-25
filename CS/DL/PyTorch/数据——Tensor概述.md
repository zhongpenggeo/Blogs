## 1. 数据类型

`dtype`

### 1.1 构建数据

从已有的数据中构建，使用`torch.tensor()`

构建一个尺寸相同的tensor，`torch.*_like()`

构建一个类型相同，但尺寸不同的tensor,`tensor.new_*`

``new_tensor`(*data*, *dtype=None*, *device=None*, *requires_grad=False*)`

```shell
>>> x = torch.ones((2,), dtype=torch.int8)
>>> data = [[0, 1], [2, 3]]
>>> x.new_tensor(data)
tensor([[ 0,  1],
        [ 2,  3]], dtype=torch.int8)
```

`new_ones(size)`

`new_zeros(size)`



## 2. 属性与方法

#### 2.1 数据自身性质

`is_cuda`

```shell
>>> x.is_cuda
False
```

`grad`

`ndim`: alias for `dim()`，维度（列数）

```shell
>>> x.new_tensor(data)
tensor([[0, 1],
        [2, 3]], dtype=torch.int8)
>>> x.is_cuda
False
>>> x.ndim
1
>>> torch.dim(x)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: module 'torch' has no attribute 'dim'
>>> x.dim()
1
```

`T`: 转置， 和`t()`效果一样？

`real`：返回复数的实部

`imag`

`is_leaf`

`isnan()`

`is_contiguous(*memory_format=torch.contiguous_format*) → bool`

#### 2.2 计算方法

`abs()`

`abs_()`

`deg2rad`()： 

`div(value)`

`trace()`:等效于`torch.trace(input)`；对角线元素之和

等等很多计算

#### 2.3 操作方法

``clone`(***, *memory_format=torch.preserve_format*)`

`copy_(*src*, *non_blocking=False*)` : 把元素从src复制到self

`diag()`: 对角阵？

`dim()`

``expand`(**sizes*) `：

```shell
>>> x = torch.tensor([[1], [2], [3]])
>>> x.size()
torch.Size([3, 1])
>>> x.expand(3, 4)
tensor([[ 1,  1,  1,  1],
        [ 2,  2,  2,  2],
        [ 3,  3,  3,  3]])
>>> x.expand(-1, 4)   # -1 means not changing the size of that dimension
tensor([[ 1,  1,  1,  1],
        [ 2,  2,  2,  2],
        [ 3,  3,  3,  3]])
```

`float(memory_format=torch.preserve_format)`：`self.float()`等效于`self.to(torch.float32)`

`get_device()`

```shell
>>> x = torch.randn(3, 4, 5, device='cuda:0')
>>> x.get_device()
0
>>> x.cpu().get_device()  # RuntimeError: get_device is not implemented for type torch.FloatTensor（即cpu的float32格式）
```

``index_add_`(*dim*, *index*, *tensor*)`: 如果dim==0；那么tensor中的第0行会和self的idex[0]行相加，第1行和self的idex[1]行相加，dim和tensor必须是相同维度的，其他维要和self一样。

```shell
>>> x = torch.ones(5, 3)
>>> t = torch.tensor([[1, 2, 3], [4, 5, 6], [7, 8, 9]], dtype=torch.float)
>>> index = torch.tensor([0, 4, 2])
>>> x.index_add_(0, index, t)
tensor([[  2.,   3.,   4.],
        [  1.,   1.,   1.],
        [  8.,   9.,  10.],
        [  1.,   1.,   1.],
        [  5.,   6.,   7.]])
```

上面，t的0行与x的0行相加，t的第1行和x的第4行相加，第2行和x的2行相加。

``index_copy_`(*dim*, *index*, *tensor*)`: 与上面类似，但是是覆盖而不是相加

```shell
>>> x = torch.ones(5, 3)
>>> t = torch.tensor([[1, 2, 3], [4, 5, 6], [7, 8, 9]], dtype=torch.float)
>>> index = torch.tensor([0, 4, 2])
>>> x.index_copy_(0, index, t)
tensor([[1., 2., 3.],
        [1., 1., 1.],
        [7., 8., 9.],
        [1., 1., 1.],
        [4., 5., 6.]])
```



`reshape(*shape)`: 改变尺寸，不改变元素数量

`resize_(*size)`: 改变尺寸，且可以改变元素数量

```shell
>>> x = torch.tensor([[1, 2], [3, 4], [5, 6]])
>>> x.resize_(2, 2)
tensor([[ 1,  2],
        [ 3,  4]])
```

`type()`:获得数据格式

```shell
>>> x.type()
'torch.LongTensor'
>>> type(x)
<class 'torch.Tensor'>
>>>
```

`shere(condition,y)`：把符合condition条件的设置为y



#### 2.4 cuda方法

`cuda(device=None, non_blocking=False, memory_format=torch.preserve_format)`： 返回一个拷贝到cuda内存空间

Parameters

- **device** ([`torch.device`](https://pytorch.org/docs/stable/tensor_attributes.html#torch.torch.device)) – The destination GPU device. Defaults to the current CUDA device.
- **non_blocking** ([*bool*](https://docs.python.org/3/library/functions.html#bool)) – If `True` and the source is in pinned memory, the copy will be asynchronous with respect to the host. Otherwise, the argument has no effect. Default: `False`.
- **memory_format** ([`torch.memory_format`](https://pytorch.org/docs/stable/tensor_attributes.html#torch.torch.memory_format), optional) – the desired memory format of returned Tensor. Default: `torch.preserve_format`



#### 2.5 导数属性

``requires_grad_`(*requires_grad=True*)`

```shell
>>> saved_weights = [0.1, 0.2, 0.3, 0.25]
>>> loaded_weights = torch.tensor(saved_weights)
>>> weights = preprocess(loaded_weights)  # some function
>>> weights
tensor([-0.5503,  0.4926, -2.1158, -0.8303])

>>> # Now, start to record operations done to weights
>>> weights.requires_grad_()
>>> out = weights.pow(2).sum()
>>> out.backward()
>>> weights.grad
```



`requires_grad=True`

```shell
>>> x = torch.tensor([[1., -1.], [1., 1.]], requires_grad=True)
>>> out = x.pow(2).sum()
>>> out.backward()
>>> x.grad
```

`detach()`：返回新的tensor，从原来的计算图中脱离；注意，这两个tensor共享相同的存储空间。所以对两者任意一个的操作会同时应用??

`detach_()`：从计算图中脱离，变成叶子节点



#### 2.6 to

改变dytpe或device

```shell
>>> tensor = torch.randn(2, 2)  # Initially dtype=float32, device=cpu
>>> tensor.to(torch.float64)
tensor([[-0.5044,  0.0005],
        [ 0.3310, -0.0584]], dtype=torch.float64)

>>> cuda0 = torch.device('cuda:0')
>>> tensor.to(cuda0)
tensor([[-0.5044,  0.0005],
        [ 0.3310, -0.0584]], device='cuda:0')

>>> tensor.to(cuda0, dtype=torch.float64)
tensor([[-0.5044,  0.0005],
        [ 0.3310, -0.0584]], dtype=torch.float64, device='cuda:0')

>>> other = torch.randn((), dtype=torch.float64, device=cuda0)
>>> tensor.to(other, non_blocking=True)
tensor([[-0.5044,  0.0005],
        [ 0.3310, -0.0584]], dtype=torch.float64, device='cuda:0')
```



参考：https://pytorch.org/docs/stable/tensors.html?highlight=tensor#torch.Tensor