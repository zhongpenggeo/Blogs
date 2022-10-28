## 1. is_contiguous

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

### 2. Tensor.contiguous

返回tensor的连续存储。强迫不连续的存储变为连续的存储

```python
>>> x= torch.tensor([[1,2],[3,4]])
>>> x
tensor([[1, 2],
        [3, 4]])
>>> y=x.T
>>> y
tensor([[1, 3],
        [2, 4]])
>>> x.is_contiguous()
True
>>> y.is_contiguous()
False
>>> y.contiguous()
tensor([[1, 3],
        [2, 4]])
>>> y.is_contiguous()
False
>>> y1=y.contiguous()
>>> y1.is_contiguous()
True
>>>
```



### 3. 为什么要contiguous

#### 1. `torch.view`等方法许需要连续tensor

transpose、permute 操作虽然没有修改底层一维数组，但是新建了一份Tensor元信息，并在新的元信息中的 重新指定 stride。**`torch.view`** 方法约定了不修改数组本身，只是使用新的形状查看数据。如果我们在 transpose、permute 操作后执行 view，Pytorch 会抛出以下错误：

```text
invalid argument 2: view size is not compatible with input tensor's size and stride (at least one dimension 
spans across two contiguous subspaces). Call .contiguous() before .view(). 
at /Users/soumith/b101_2/2019_02_08/wheel_build_dirs/wheel_3
```

#### 2. 性能考虑

连续的Tensor，语义上相邻的元素，在内存中也是连续的，访问相邻元素是矩阵运算中经常用到的操作，语义和内存顺序的一致性是缓存友好的（[What is a “cache-friendly” code?](https://link.zhihu.com/?target=https%3A//stackoverflow.com/a/16699282)[[4\]](https://zhuanlan.zhihu.com/p/64551412#ref_4)），在内存中连续的数据可以（但不一定）被高速缓存预取，以提升CPU获取操作数据的速度。transpose、permute 后使用**` contiguous`** 方法则会重新开辟一块内存空间保证数据是在逻辑顺序和内存中是一致的，连续内存布局减少了CPU对对内存的请求次数（访问内存比访问寄存器慢100倍[[5\]](https://zhuanlan.zhihu.com/p/64551412#ref_5)），相当于空间换时间。

参考：

[python - What is the difference between contiguous and non-contiguous arrays? - Stack Overflow](https://stackoverflow.com/questions/26998223/what-is-the-difference-between-contiguous-and-non-contiguous-arrays/26999092#26999092)

[PyTorch中的contiguous - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/64551412)