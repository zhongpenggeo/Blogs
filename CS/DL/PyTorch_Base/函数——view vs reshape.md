1. returned tensor of `torch.view()`will share the underling data with the original tensor, while `torch.reshape` may return a copy or a view of the original tensor. You can not count on that to return a view or a copy. According to the developer:

   > if you need a copy use clone() if you need the same storage use view(). The semantics of reshape() are that it may or may not share the storage and you don't know beforehand.

2. Another difference is that `reshape()` can operate on both contiguous and non-contiguous tensor while `view()` can only operate on contiguous tensor. Also see [here](https://stackoverflow.com/a/26999092/6064933) about the meaning of `contiguous`.

```python
>>> x = torch.randn(4, 4)
>>> x.size()
torch.Size([4, 4])
>>> y = x.view(16)
>>> y.size()
torch.Size([16])
>>> z = x.view(-1, 8)  # the size -1 is inferred from other dimensions
>>> z.size()
torch.Size([2, 8])

>>> a = torch.randn(1, 2, 3, 4)
>>> a.size()
torch.Size([1, 2, 3, 4])
>>> b = a.transpose(1, 2)  # Swaps 2nd and 3rd dimension
>>> b.size()
torch.Size([1, 3, 2, 4])
>>> c = a.view(1, 3, 2, 4)  # Does not change tensor layout in memory
>>> c.size()
torch.Size([1, 3, 2, 4])
>>> torch.equal(b, c)
False
```



### 总结

- view会共享内存，而reshape可能会也可能不会
- reshape可以操作连续和非连续存储的数据，而view只能操作连续数据





参考：

[https://stackoverflow.com/questions/49643225/whats-the-difference-between-reshape-and-view-in-pytorch#:~:text=The%20semantics%20of%20reshape(),about%20the%20meaning%20of%20contiguous%20.](https://stackoverflow.com/questions/49643225/whats-the-difference-between-reshape-and-view-in-pytorch#:~:text=The semantics of reshape(),about the meaning of contiguous .)