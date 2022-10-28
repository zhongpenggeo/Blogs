用于载入数据。

这个功能包的作用是收集、打包数据，给数据索引，然后按照 batch 将数据分批喂给神经网络。

数据读取的核心是 `torch.utils.data.DataLoader` 类。它是一个**数据迭代读取器**，支持

- 映射方式和迭代方式读取数据；
- 自定义数据读取顺序；
- 自动批；
- 单线程或多线程数据读取；
- 自动内存定位。

所有上述功能都可以在 `torch.utils.data.DataLoader` 的变量中定义：

```python
DataLoader(dataset, batch_size=1, shuffle=False, sampler=None,
           batch_sampler=None, num_workers=0, collate_fn=None,
           pin_memory=False, drop_last=False, timeout=0,
           worker_init_fn=None)
```

首先看一下常用的变量：

- `dataset`：数据源；
- `batch_size`：一个整数，定义每一批读取的元素个数；
- `shuffle`：一个布尔值，定义是否随机读取；
- `sampler`：定义获取数据的策略，必须与 `shuffle` 互斥；
- `num_workers`：一个整数，读取数据使用的线程数；
- `collate_fn`：一个将读取的数据处理、聚合成一个一个 batch 的自定义函数；
- `drop_last`：一个布尔值，如果最后一批数据的个数不足 batch 的大小，是否保留这个 batch。

`dataset`， `sampler` 和 `collate_fn` 是自定义的类或功能，我们从后往前看。

**DataLoader** 支持两种数据类型：

- 映射风格的数据封装（map-style datasets）：这种数据结构拥有自定义的 `__getitem__()` 和 `__len__()` 属性，可以以“索引/值”的方式读取数据，对应 `torch.utils.data.Dataset` 类；
- 迭代风格的数据封装（iterable-style datasets）：这种数据结构拥有自定义的 `__iter__()` 属性，通常适用于不方便随机获取数据或不定长数据集的读取上，对应 `torch.utils.data.IterableDataset` 类。

**注意**：

其返回值是一个可迭代的对象，长度为：len(dataset) / batch_size;

并且每一个值都只出现一次，见下面范例。但如果不是整除，那么取决于`drop_last`，若为True，则删除最后一个batch，若为False，保留剩下那个不足数的batach。默认是False



```shell
>>> XX = torch.tensor([[1,2],[3,4],[5,6],[7,8],[9,10]])
>>> train = torch.utils.data.TensorDataset(XX)
>>> ds = torch.utils.data.DataLoader(train, batch_size=3, shuffle=True,drop_last=True)
>>> for i, data_val in enumerate(ds):
...     print(data_val)
...
[tensor([[5, 6],
        [7, 8],
        [1, 2]])]
>>> XX
tensor([[ 1,  2],
        [ 3,  4],
        [ 5,  6],
        [ 7,  8],
        [ 9, 10]])
```



#### 1. 数据加载

先人工构建一个数据集

```shell
>>> samples = torch.arange(100)
>>> labels = torch.cat([torch.zeros(50), torch.ones(50)], dim=0)
```

#### 2. 数据集分割

- `torch.utils.data.Subset(dataset, indices)`

这个函数可以根据索引indices将数据集dataset分割。

```javascript
>>> even = [i for i in range(100) if i % 2 == 0]
>>> new1 = torch.utils.data.Subset(samples, even)
>>> print(new1[:5])
tensor([0, 2, 4, 6, 8])
```

- `torch.utils.data.random_split(dataset, lengths)`

先将数据随机排列，然后按照指定的长度进行选择**训练集**和**测试集**，这两者的和要等于samples的length。如下，len(samples)=100，90个train，10个test。

注意：test和train都是类对象，要用torch.tensor(test)才能取出数据。

```javascript
>>> train, test = torch.utils.data.random_split(samples, [90, 10])
>>> print(torch.tensor(test))
tensor([79, 60, 98, 74, 31, 43, 21, 69, 55, 76])
```
#### 3. collate_fn 核对函数

这个变量的功能是在数据被读取后，送进模型前对所有数据进行**处理**、**打包**。

比如我们有一个不定长度的视频数据集或文本数据集，我们可以自定义一个函数将它们的长度归一化。比如：

```javascript
>>> a = [[1,2,3],[4,5],[6,7,8,9]]
>>> def collate_fn(data):
...     '''
...     padding data, so they have same length.
...     '''
...     max_len = max([len(feature) for feature in data])
...     new = torch.zeros(len(data), max_len)
    
...     for i in range(len(data)):
...         tmp = torch.as_tensor(data[i])
...         j = len(tmp)
...         new[i][:j] = tmp
        
...     return new

>>> collate_fn(a)
tensor([[1., 2., 3., 0.],
        [4., 5., 0., 0.],
        [6., 7., 8., 9.]])
```

将这个函数赋值给 `collate_fn`，在读取数据的时候就可以自动对数据进行 padding 并打包成一个 batch。

#### 4. sample采样器

这个变量决定了数据读取的顺序。

注意，`sampler` 只对 iterable-style datasets 有效。

除了可以自定义采样器，Python 内置了几种不同的采样器：

- `torch.utils.data.SequentialSampler(data_source)`默认的采样器。
- `torch.utils.data.RandomSampler(data_source, replacement=False, num_samples=None)`

随机选择数据。可以指定一次读取 `num_samples` 个数据。`replacement` 为 `True` 的话可以指定 `num_samples`。

```javascript
>>> batch = torch.utils.data.RandomSampler(samples,replacement=True,
                                           num_samples=5) # 生成一个迭代器
>>> print(list(batch))
[85, 70, 5, 63, 79]
```

还有三个采样器无法独立使用，必须先实例化，然后放进 `DataLoader`：

- `torch.utils.data.SubsetRandomSampler(indices)`：先按照索引选取数据，然后随机排列。
- `torch.utils.data.WeightedRandomSampler(weights, num_samples, replacement=True)`：字面意思是按照概率选择不同类别的元素。
- `torch.utils.data.BatchSampler(sampler, batch_size, drop_last)`：在一个 batch 中应用另外一个采样器。



## 2. dataset 数据集生成器

------

- `torch.utils.data.Dataset`

**这个类需要覆写 `__getitem__` 和 `__len__` 属性**。

```javascript
>>> class MyData(torch.utils.data.Dataset):
...     def __init__(self, data):
...         super(MyData, self).__init__()
...         self.data = data
        
...     def __len__(self, data):
...         return len(self.data)
    
...     def __getitem__(self, index):
...         return self.data[index]
        
>>> mydata = MyData(samples)
>>> mydata[0]
tensor(0)
>>> mydata[10:15]
tensor([10, 11, 12, 13, 14])
```

除此以外，还有若干个 wrapper：

- `torch.utils.data.IterableDataset`
- `torch.utils.data.TensorDataset(*tensors)`
- `torch.utils.data.ConcatDataset(datasets)`
- `torch.utils.data.ChainDataset(datasets)`

#### 2.2 范例

```python
class _numpy2dataset(torch.utils.data.Dataset):
    def __init__(self, data, target, transform=None):
        # Creating identical pairs
        self.data    = Variable(Tensor(data))
        self.target  = Variable(Tensor(target))

    def send_device(self,device):
        self.data    = self.data.to(device)
        self.target  = self.target.to(device)

    def __getitem__(self, index):
        x = self.data[index]
        y = self.target[index]
        return x, y, index
    def __len__(self):
        return self.data.shape[0]
```

`send_device`:不是必需的

`__getitem__`: class的返回值在这里定义

##  总结

------

选择让我们把所有知识应用一下。假设我们想以 10 为一个 batch，随机选择数据：

那么iter迭代得到的结果是一个batch的结果，即这里是10个train data

```javascript
>>> samples = torch.arange(100)
>>> labels = torch.cat([torch.zeros(50), torch.ones(50)], dim=0)
>>> train = torch.utils.data.TensorDataset(torch.as_tensor(samples), torch.as_tensor(labels))
>>> ds = torch.utils.data.DataLoader(train, batch_size=10, shuffle=True)

>>> for _ in range(5):
...     print(iter(ds).next())
[tensor([35, 19, 99, 58, 59, 10, 26, 86, 24, 25]), tensor([0., 0., 1., 1., 1., 0., 0., 1., 0., 0.])]
[tensor([ 6, 37, 24, 98, 96, 18, 88, 90, 19, 87]), tensor([0., 0., 0., 1., 1., 0., 1., 1., 0., 1.])]
[tensor([80, 75, 48, 34, 90, 67,  8, 63, 47, 32]), tensor([1., 1., 0., 0., 1., 1., 0., 1., 0., 0.])]
[tensor([48, 68, 64, 54, 87, 76, 18, 53, 65, 17]), tensor([0., 1., 1., 1., 1., 1., 0., 1., 1., 0.])]
[tensor([65, 26, 67,  5,  4,  8, 35, 47, 40, 96]), tensor([1., 0., 1., 0., 0., 0., 0., 0., 0., 1.])]

>>> for i, data_val in enumerate(ds):
...     print(data_val)
...
[tensor([61,  4, 88, 60, 52, 93, 34,  1,  5, 95]), tensor([1., 0., 1., 1., 1., 1., 0., 0., 0., 1.])]
[tensor([31, 68, 54, 37, 75, 44, 27, 81, 96, 79]), tensor([0., 1., 1., 0., 1., 0., 0., 1., 1., 1.])]
[tensor([67, 80, 22,  8, 63, 90, 74, 30, 47, 82]), tensor([1., 1., 0., 0., 1., 1., 1., 0., 0., 1.])]
[tensor([14, 24, 38, 18,  6, 70, 91, 71, 87, 25]), tensor([0., 0., 0., 0., 0., 1., 1., 1., 1., 0.])]
[tensor([58, 46, 97, 56, 73, 45, 64, 28, 42, 48]), tensor([1., 0., 1., 1., 1., 0., 1., 0., 0., 0.])]
[tensor([ 3, 49, 59, 39, 69, 89, 65, 86, 62, 36]), tensor([0., 0., 1., 0., 1., 1., 1., 1., 1., 0.])]
[tensor([83,  0, 76, 11, 20, 21, 53,  7,  2, 57]), tensor([1., 0., 1., 0., 0., 0., 1., 0., 0., 1.])]
[tensor([40, 26, 41, 35, 85, 99, 94, 10, 66, 13]), tensor([0., 0., 0., 0., 1., 1., 1., 0., 1., 0.])]
[tensor([12, 55, 43, 19, 98, 32, 17, 51, 77, 15]), tensor([0., 1., 0., 0., 1., 0., 0., 1., 1., 0.])]
[tensor([23, 78, 84, 29, 33, 72, 16, 50, 92,  9]), tensor([0., 1., 1., 0., 0., 1., 0., 1., 1., 0.])]
```







原文链接：https://mp.weixin.qq.com/s?__biz=Mzg3OTIwODUzMQ==&mid=2247484920&idx=1&sn=91d605eb5a56f340c5a766cee8266ba7&chksm=cf06b4c4f8713dd2713d7aca5b268787565d79cdf0b20ffe43c9325de1d61741033a42bfb59c&token=2003801959&lang=zh_CN&scene=21#wechat_redirect

https://cloud.tencent.com/developer/article/1675783

