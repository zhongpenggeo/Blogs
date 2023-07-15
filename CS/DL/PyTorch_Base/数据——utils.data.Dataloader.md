```python
DataLoader(dataset, batch_size=1, shuffle=False, sampler=None,
           batch_sampler=None, num_workers=0, collate_fn=None,
           pin_memory=False, drop_last=False, timeout=0,
           worker_init_fn=None)
```



### dataset

数据集类型

- 地图样式数据集
- 迭代式数据集

地图样式数据集是一种实现`__getitem__()`和`__len__()`协议的数据集，它表示从(可能是非整数）索引/关键字到数据样本的映射。

例如，当使用`dataset[idx]`访问时，此类数据集可以从磁盘上的文件夹中读取第`idx`张图像及其对应的标签

可迭代样式的数据集是 [`IterableDataset`](https://pytorch.apachecn.org/docs/1.4/96.html#torch.utils.data.IterableDataset) 子类的实例，该子类实现了`__iter__()`协议，并表示数据样本上的可迭代。 这种类型的数据集特别适用于随机读取价格昂贵甚至不大可能，并且批处理大小取决于所获取数据的情况。

### sample

数据加载顺序。

[`torch.utils.data.Sampler`](https://pytorch.apachecn.org/docs/1.4/96.html#torch.utils.data.Sampler) 类用于指定数据加载中使用的索引/键的顺序。 它们代表数据集索引上的可迭代对象。 例如，在具有随机梯度体面(SGD）的常见情况下， [`Sampler`](https://pytorch.apachecn.org/docs/1.4/96.html#torch.utils.data.Sampler) 可以随机排列一列索引，一次生成每个索引，或者为小批量生成少量索引 新币。

基于 [`DataLoader`](https://pytorch.apachecn.org/docs/1.4/96.html#torch.utils.data.DataLoader) 的`shuffle`参数，将自动构建顺序采样或混洗的采样器。 或者，用户可以使用`sampler`参数指定一个自定义 [`Sampler`](https://pytorch.apachecn.org/docs/1.4/96.html#torch.utils.data.Sampler) 对象，该对象每次都会产生要提取的下一个索引/关键字。

可以一次生成批量索引列表的自定义 [`Sampler`](https://pytorch.apachecn.org/docs/1.4/96.html#torch.utils.data.Sampler) 作为`batch_sampler`参数传递。 也可以通过`batch_size`和`drop_last`参数启用自动批处理。



注意：sampler和batch_sampler都不与可迭代样式数据集兼容，因为这种数据灭有键或索引的概念



## 批处理与非批处理

[`DataLoader`](https://pytorch.apachecn.org/docs/1.4/96.html#torch.utils.data.DataLoader) 支持通过参数`batch_size`，`drop_last`和`batch_sampler`将各个提取的数据样本自动整理为批次。

### 自动批处理（默认）

`batch_size`和`drop_last`自变量本质上用于从`sampler`构造`batch_sampler`。 对于地图样式的数据集，`sampler`由用户提供或基于`shuffle`参数构造。 对于可迭代样式的数据集，`sampler`是一个虚拟的无限数据集。 有关采样器的更多详细信息，请参见[本节](https://pytorch.apachecn.org/docs/1.4/96.html#data-loading-order-and-sampler)。

使用来自采样器的索引获取样本列表后，作为`collate_fn`参数传递的函数用于将样本列表整理为批次。



### 禁用自动批处理

在某些情况下，用户可能希望以数据集代码手动处理批处理，或仅加载单个样本。 例如，直接加载批处理的数据(例如，从数据库中批量读取或读取连续的内存块）可能更便宜，或者批处理大小取决于数据，或者该程序设计为可处理单个样本。 在这种情况下，最好不要使用自动批处理(其中`collate_fn`用于整理样本），而应让数据加载器直接返回`dataset`对象的每个成员。

当`batch_size`和`batch_sampler`均为`None`时(`batch_sampler`的默认值已为`None`），自动批处理被禁用。 从`dataset`获得的每个样本都将作为`collate_fn`参数传递的函数进行处理。

**禁用自动批处理**时，默认值`collate_fn`仅将 NumPy 数组转换为 PyTorch 张量，而其他所有内容均保持不变。

### collate_fn

启用或禁用自动批处理时，`collate_fn`的使用略有不同。

**禁用自动批处理**时，将对每个单独的数据样本调用`collate_fn`，并且从数据加载器迭代器产生输出。 在这种情况下，默认的`collate_fn`仅转换 PyTorch 张量中的 NumPy 数组。

**启用自动批处理**时，会每次调用`collate_fn`并带有数据样本列表。 期望将输入样本整理为一批，以便从数据加载器迭代器中获得收益。 本节的其余部分描述了这种情况下默认`collate_fn`的行为。



参考：https://pytorch.apachecn.org/docs/1.4/96.html

