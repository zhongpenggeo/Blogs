## contiguous

指存储在非离散的内存块中

```shell
>>> arr = torch.arange(12)
>>> arr = arr.reshape(3,4)
>>> arr.is_contiguous()
True
>>> arr = arr.reshape(2,6)
>>> arr.is_contiguous()
True
>>> arr = arr.T
>>> arr.is_contiguous()
False
```

按row（行）连续排列才叫contiguous，

如果转置了，隔壁列不再是这样了？

#### 结果

```
np.sum(arr, axis=1) # sum the rows
```

is slightly faster than:

```
np.sum(arr, axis=0) # sum the columns
```

#### 注意

However, `arr.T` is **Fortran contiguous** since the *columns* are in contiguous blocks of memory:



参考：

https://stackoverflow.com/questions/26998223/what-is-the-difference-between-contiguous-and-non-contiguous-arrays/26999092#26999092