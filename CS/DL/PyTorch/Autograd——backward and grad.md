### backward()迁移到autograd.grad()

#### why

更简单了，减少一些backward()的副作用

#### How

`.backward()` is more side-effectful and `torch.autograd.grad(...)` is more functional



## autograd包

支持tensor type ( half, float, double and bfloat16) and 复数 `Tensor` types (cfloat, cdouble).

计算属性为requires_grad=True的数据的梯度

### 1. backward

对给定tensor对所有graph leaves 的梯度，没有返回值



### 2. grad

返回指定y对x的梯度。





Reference: https://github.com/pyro-ppl/pyro/issues/628