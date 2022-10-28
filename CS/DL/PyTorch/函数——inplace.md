#### 目的

减少内存使用

> *“In-place operation is an operation that directly changes the content of a given linear algebra, vector, matrices (Tensor) without making a copy.” — The definition is taken from* [this Python tutorial](https://www.tutorialspoint.com/inplace-operator-in-python)*.*

#### 缺点

**they might overwrite values required to compute gradients**

 [the official PyTorch autograd documentation](https://pytorch.org/docs/stable/notes/autograd.html#in-place-operations-with-autograd) says:

> Supporting in-place operations in autograd is a hard matter, and **we discourage their use in most cases**. Autograd’s aggressive buffer freeing and reuse makes it very efficient and there are very few occasions when in-place operations actually lower memory usage by any significant amount. Unless you’re operating under heavy memory pressure, you might never need to use them.
>
> There are two main reasons that limit the applicability of in-place operations:
>
> \1. In-place operations can potentially overwrite values required to compute gradients.
>
> \2. Every in-place operation actually requires the implementation to rewrite the computational graph. Out-of-place versions simply allocate new objects and keep references to the old graph, while in-place operations, require changing the creator of all inputs to the Function representing this operation.

参考： https://towardsdatascience.com/in-place-operations-in-pytorch-f91d493e970e

在常用的张量操作符中，带下划线(func_)的函数，是其未带下划线的原位版本。例如, add_()函数是add()的原位操作版本。
```python
x=torch.Tensor([1])

y=torch.Tensor([1])

x.add(y)    ＃输出结果为2，x=1

x.add_(y)   ＃输出结果为2，x=2
```
