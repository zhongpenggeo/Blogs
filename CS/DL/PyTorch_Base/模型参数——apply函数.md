### 子类

pytorch中基本所有的net都是Module的子类。

### apply函数

pytorch中的model.apply(fn)会递归地将函数fn应用到父模块的每个子模块submodule，也包括model这个父模块自身。
比如下面的网络例子中。net这个模块有两个子模块，分别为Linear(2,4)和Linear(4,8)。函数首先对Linear(2,4)和Linear(4,8)两个子模块调用init_weights函数，即print(m)打印Linear(2,4)和Linear(4,8)两个子模块。然后再对net模块进行同样的操作。如此完成递归地调用。从而完成model.apply(fn)或者net.apply(fn)。
个人水平有限，不足处望指正。
详情可参考
[pytorch官网文档](https://pytorch.org/docs/stable/nn.html?highlight=module#torch.nn.Module)

```python
import torch.nn as nn
@torch.no_grad()
def init_weights(m):
    print(m)
    
net = nn.Sequential(nn.Linear(2,4), nn.Linear(4, 8))
print(net)
print('isinstance torch.nn.Module',isinstance(net,torch.nn.Module))
print(' ')
net.apply(init_weights)

```

输出为：

```
Sequential(
  (0): Linear(in_features=2, out_features=4, bias=True)
  (1): Linear(in_features=4, out_features=8, bias=True)
)
isinstance torch.nn.Module True
Linear(in_features=2, out_features=4, bias=True)
Linear(in_features=4, out_features=8, bias=True)
Sequential(
  (0): Linear(in_features=2, out_features=4, bias=True)
  (1): Linear(in_features=4, out_features=8, bias=True)
)

```

如果我们想对某些特定的子模块`submodule`做一些针对性的处理，该怎么做呢。我们可以加入`type(m) == nn.Linear:`这类判断语句，从而对子模块m进行处理。

```python
import torch.nn as nn
@torch.no_grad()
def init_weights(m):
    print(m)
    if type(m) == nn.Linear:
        m.weight.fill_(1.0)
        print(m.weight)
net = nn.Sequential(nn.Linear(2,4), nn.Linear(4, 8))
print(net)
print('isinstance torch.nn.Module',isinstance(net,torch.nn.Module))
print(' ')
net.apply(init_weights)

```



————————————————
版权声明：本文为CSDN博主「qq_37025073」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_37025073/article/details/106739513