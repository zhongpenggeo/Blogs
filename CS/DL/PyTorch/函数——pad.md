## functional.pad

给周围填充值

### `torch.nn.functional.pad`(*input*, *pad*, *mode='constant'*, *value=0*)

参数：

- input
- pad(tuple): m个元素，$m/2\lt d_{input}$，m必须是偶数
- mode：`'constant'`, `'reflect'`, `'replicate'` or `'circular'`. Default: `'constant'
- value： fill value for `'constant'` padding. Default: `0`

pad参数的用法：(pad_left, pad_right, pad_top,  pad_bottom, pad_front, pad_back)；

即每两个是一个维度的，在这个维度的两边增加多少size。维度是从最后一维开始的，即left和right表示最后一个维度的

```python
>>> t4d = torch.empty(3, 3, 4, 2)
>>> p3d = (0, 1, 2, 1, 3, 3) # pad by (0, 1), (2, 1), and (3, 3)
>>> out = F.pad(t4d, p3d, "constant", 0)
>>> print(out.size())
torch.Size([3, 9, 7, 3])
```

上面的例子，input是(3, 3, 4, 2)；加入的pad是(0, 1, 2, 1, 3, 3)；所以out的维度是(3, 3+3+3, 4+2+1, 3+0+1)





参考：[torch.nn.functional.pad — PyTorch 1.9.0 documentation](https://pytorch.org/docs/stable/generated/torch.nn.functional.pad.html?highlight=pad#torch.nn.functional.pad)