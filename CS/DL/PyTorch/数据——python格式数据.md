## numpy转python

#### item

把tensor格式转换为python 类型的

```python
x = torch.tensor([1.0])
x.item()
# 1.0
```



#### tolist

item只能对单个tensor转换，如果是矩阵，需要tolist

```python
>>> a = torch.randn(2, 2)
>>> a.tolist()
[[0.012766935862600803, 0.5415473580360413],
 [-0.08909505605697632, 0.7729271650314331]]
>>> a[0,0].tolist()
0.012766935862600803
```

## python转numpy

比如float数据转换

```python
>>> a = 3.14
>>> b = np.float64(a)
>>> type(b)
<class 'numpy.float64'>
```

