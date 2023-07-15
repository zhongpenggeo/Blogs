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

