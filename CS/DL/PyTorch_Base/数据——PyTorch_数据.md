### 目标人群

- 作为Numpy的替代品，可以利用GPU的性能计算
- 灵活的深度学习平台



## 1. 入门

#### 1.1 张量

- 随机生成：torch.rand
- 常数：torch.zeros
- 从数组中创建：torch.tensor
- 从已有的tensor中建立：x=x.new_ones
- 获得形状：x.size()

#### 1.2 运算

任何一个in-place改变张量的操作后面都固定一个`_`。例如`x.copy_(y)`、`x.t_()`将更改x

如果想改变形状，可以使用`torch.view`



#### numpy默认数据是float64精度，而pytorch是float32，转换要非常注意，需要显示降低精度

#### 1.3 与Numpy数据交换

```python
a = torch.ones(5)
print(a)
# tensor([1., 1., 1., 1., 1.])

b = a.numpy()
print(b)
# [1. 1. 1. 1. 1.]
```

看Numpy如何改变里面的值

```python
a.add_(1)
print(a)
print(b)
# tensor([2., 2., 2., 2., 2.])
# [2. 2. 2. 2. 2.]
```



从Numpy转tensor

```python
import numpy as np
a = np.ones(5)
b = torch.from_numpy(a)
np.add(a, 1, out=a)
print(a)
print(b)
# [2. 2. 2. 2. 2.]
# tensor([2., 2., 2., 2., 2.], dtype=torch.float64)
```



#### 1.4 数据在GPU上

```python
# 当GPU可用时,我们可以运行以下代码
# 我们将使用`torch.device`来将tensor移入和移出GPU
if torch.cuda.is_available():
    device = torch.device("cuda")          # a CUDA device object
    y = torch.ones_like(x, device=device)  # 直接在GPU上创建tensor
    x = x.to(device)                       # 或者使用`.to("cuda")`方法
    z = x + y
    print(z)
    print(z.to("cpu", torch.double))       # `.to`也能在移动时改变dtype
    
# tensor([1.0445], device='cuda:0')
# tensor([1.0445], dtype=torch.float64)
```

