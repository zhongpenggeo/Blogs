#### .data

When you use `.data`, you get a new `Tensor` with `requires_grad=False`

这个新的tensor和原来的tensor（即x）是共用数据的，一者改变，另一者也会跟着改变，且requires_grad = False

#### .detach

when you want to clone/copy a non-parameter `Tensor` without autograd. You should use `.detach()` (and [not data](https://github.com/pytorch/pytorch/issues/6990#issuecomment-384680164)) before cloning:

### difference

Here's an example. If you use `detach()` instead of `.data`, gradient computation is guaranteed to be correct..

```
>>> a = torch.tensor([1,2,3.], requires_grad = True)
>>> out = a.sigmoid()
>>> c = out.detach()
>>> c.zero_()  
tensor([ 0.,  0.,  0.])

>>> out  # modified by c.zero_() !!
tensor([ 0.,  0.,  0.])

>>> out.sum().backward()  # Requires the original value of out, but that was overwritten by c.zero_()
RuntimeError: one of the variables needed for gradient computation has been modified by an inplace operation
```

As opposed to using `.data`:

```
>>> a = torch.tensor([1,2,3.], requires_grad = True)
>>> out = a.sigmoid()
>>> c = out.data
>>> c.zero_()
tensor([ 0.,  0.,  0.])

>>> out  # out  was modified by c.zero_()
tensor([ 0.,  0.,  0.])

>>> out.sum().backward()
>>> a.grad  # The result is very, very wrong because `out` changed!
tensor([ 0.,  0.,  0.])
```

即data不会改变参数的性质，而detach会。



  不同点： x.data 不能被 autograd 追踪求微分，即使被改了也能错误求导，而x.detach()则不行