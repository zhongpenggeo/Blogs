## class

Module类可以继承来自定义网络模型

```python
class NN(torch.nn.Module):
    def __init__(self, nl=10, activation=torch.nn.ELU()):
            super(NN, self).__init__()
            self.act = activation

            # Input Structure
            self.fc0  = Linear(2*3,32)
            self.fc1  = Linear(32,512)

            # Resnet Block
            self.rn_fc1 = torch.nn.ModuleList([Linear(512, 512) for i in range(nl)])
            self.rn_fc2 = torch.nn.ModuleList([Linear(512, 512) for i in range(nl)])
            self.rn_fc3 = torch.nn.ModuleList([Linear(512, 512) for i in range(nl)])

            # Output structure
            self.fc8  = Linear(512,32)
            self.fc9  = Linear(32,1)

    def forward(self,x):
        x   = self.act(self.fc0(x))
        x   = self.act(self.fc1(x))
        for ii in range(len(self.rn_fc1)):
            x0 = x
            x  = self.act(self.rn_fc1[ii](x))
            # ResNet
            x  = self.act(self.rn_fc3[ii](x)+self.rn_fc2[ii](x0))

        x     = self.act(self.fc8(x))
        tau   = abs(self.fc9(x))
        return tau
```



#### `add_module`(*name*, *module*)

添加子模块

#### apply

后面的参数为一个函数名，即对每一个submodule应用该函数。

可以用于对权重初始化

```python
def init_weights(m):
    if type(m) == torch.nn.Linear:
        stdv = (1. / math.sqrt(m.weight.size(1))/1.)*2
        m.weight.data.uniform_(-stdv,stdv)
        m.bias.data.uniform_(-stdv,stdv)
        
self.network.apply(init_weights)
```

#### float()

把网络中所有的浮点数参数都转为float datatype

#### to(device)

把所有网络参数移动或者扔到（device）中

#### train()

设置模式为training mode

#### eval()

设置为 evaluation mode；主要影响 [`Dropout`](https://pytorch.org/docs/stable/generated/torch.nn.Dropout.html#torch.nn.Dropout), `BatchNorm`, etc.

#### `modules`()

返回一个关于网络中所有modules的迭代器

```shell
>>> import torch.nn as nn
>>> l = nn.Linear(2, 20)
>>> l2 = nn.Linear(20,20)
>>> net = nn.Sequential(l, l2)
>>> for idx, m in enumerate(net.modules()):
...     print(idx, '->', m)
...
0 -> Sequential(
  (0): Linear(in_features=2, out_features=20, bias=True)
  (1): Linear(in_features=20, out_features=20, bias=True)
)
1 -> Linear(in_features=2, out_features=20, bias=True)
2 -> Linear(in_features=20, out_features=20, bias=True)
```

所以如果需要对权重初始化：

```python
    def weight_init(self, model, hp_init):
        if hp_init in init_dict.keys():
            for layer in model.modules():
                if isinstance(layer, nn.Linear):
                    nn.init.unifotm_(layer.weight)
```



https://pytorch.org/docs/stable/generated/torch.nn.Module.html?highlight=module#torch.nn.Module