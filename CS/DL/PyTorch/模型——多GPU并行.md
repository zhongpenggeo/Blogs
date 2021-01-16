#### 命令

- torch.cuda: 记录当前选择的GPU，并且在上面分配张量
- torch.cuda.device： 更改管理器所选设备

默认情况下，不支持跨GPU操作，唯一的例外是`copy_()`。 除非启用对等存储器访问，否则对分布不同设备上的张量任何启动操作的尝试都将会引发错误。



#### 使用固定的内存缓冲区

参考： https://pytorch-cn.readthedocs.io/zh/latest/notes/cuda/



#### 一个GPU的使用

```python
device = torch.device("cuda: 0")
model.to(device)
# 然后复制所有张量到GPU
mytensor = my_tensor.to(device)
```

## 多GPU的使用

PyTorch默认将只是用一个GPU。你可以使用`DataParallel`让模型并行运行来轻易的在多个GPU上运行你的操作。

这里是将相同的模型复制到所有的GPU，而每个GPU消耗数据的不同分区。

```python
model = nn.DataParallel(model)
```

#### 导入模块与定义参数

```python
import torch
import torch.nn as nn
from torch.utils.data import Dataset, DataLoader

# Parameters 和 DataLoaders
input_size = 5
output_size = 2

batch_size = 30
data_size = 100
```

设备(Device）:

```python
device = torch.device("cuda: 0" if torch.cuda.is_available() else "cpu")
```

#### 随机数据集

要制作一个虚拟(随机）数据集，你只需实现`__getitem__`。

```python
class RandomDataset(Dataset):

    def __init__(self, size, length):
        self.len = length
        self.data = torch.randn(length, size)

    def __getitem__(self, index):
        return self.data[index]

    def __len__(self):
        return self.len

rand_loader = DataLoader(dataset=RandomDataset(input_size, data_size),
                         batch_size=batch_size, shuffle=True)
```

#### 用一个简单模型测试

```python
# 定义模型
class Model(nn.Module):
    # Our model

    def __init__(self, input_size, output_size):
        super(Model, self).__init__()
        self.fc = nn.Linear(input_size, output_size)

    def forward(self, input):
        output = self.fc(input)
        print("\tIn Model: input size", input.size(),
              "output size", output.size())

        return output
```

#### 创建一个模型和数据并行

这是本教程的核心部分。首先，我们需要创建一个模型实例和检测我们是否有多个GPU。如果我们有多个GPU，我们使用`nn.DataParallel`来包装我们的模型。然后通过`model.to(device)`把模型放到GPU上。

```python
model = Model(input_size, output_size)
if torch.cuda.device_count() > 1: 
  print("Let's use", torch.cuda.device_count(), "GPUs!")
  # dim = 0 [30, xxx] -> [10, ...], [10, ...], [10, ...] on 3 GPUs
  model = nn.DataParallel(model)

model.to(device)
```

输出:

```python
Let's use 2 GPUs!
```

#### 运行模型

现在我们可以看输入和输出张量的大小。

```python
for data in rand_loader: 
    input = data.to(device)
    output = model(input)
    print("Outside: input size", input.size(),
          "output_size", output.size())
```

输出:

```python
In Model: input size torch.Size([15, 5]) output size torch.Size([15, 2])
        In Model: input size torch.Size([15, 5]) output size torch.Size([15, 2])
Outside: input size torch.Size([30, 5]) output_size torch.Size([30, 2])
        In Model: input size torch.Size([15, 5]) output size torch.Size([15, 2])
        In Model: input size torch.Size([15, 5]) output size torch.Size([15, 2])
Outside: input size torch.Size([30, 5]) output_size torch.Size([30, 2])
        In Model: input size torch.Size([15, 5]) output size torch.Size([15, 2])
        In Model: input size torch.Size([15, 5]) output size torch.Size([15, 2])
Outside: input size torch.Size([30, 5]) output_size torch.Size([30, 2])
        In Model: input size torch.Size([5, 5]) output size torch.Size([5, 2])
        In Model: input size torch.Size([5, 5]) output size torch.Size([5, 2])
Outside: input size torch.Size([10, 5]) output_size torch.Size([10, 2])
```

#### 结果

如果没有GPU或只有1个GPU，当我们对30个输入和输出进行批处理时，我们和期望的一样得到30个输入和30个输出，但是若有多个GPU，会得到如下的结果。

**2个GPU**

若有2个GPU，将看到:

```
Let's use 2 GPUs!
    In Model: input size torch.Size([15, 5]) output size torch.Size([15, 2])
    In Model: input size torch.Size([15, 5]) output size torch.Size([15, 2])
Outside: input size torch.Size([30, 5]) output_size torch.Size([30, 2])
    In Model: input size torch.Size([15, 5]) output size torch.Size([15, 2])
    In Model: input size torch.Size([15, 5]) output size torch.Size([15, 2])
Outside: input size torch.Size([30, 5]) output_size torch.Size([30, 2])
    In Model: input size torch.Size([15, 5]) output size torch.Size([15, 2])
    In Model: input size torch.Size([15, 5]) output size torch.Size([15, 2])
Outside: input size torch.Size([30, 5]) output_size torch.Size([30, 2])
    In Model: input size torch.Size([5, 5]) output size torch.Size([5, 2])
    In Model: input size torch.Size([5, 5]) output size torch.Size([5, 2])
Outside: input size torch.Size([10, 5]) output_size torch.Size([10, 2])
```

### 模型并行

有时候会有模型太大而无法放入单个GPU，所以考虑用模型并行而不是数据并行

## 多GPU使用

参考：https://zhuanlan.zhihu.com/p/86441879

https://pytorch.org/tutorials/beginner/blitz/data_parallel_tutorial.html

https://pytorch.apachecn.org/docs/1.4/33.html