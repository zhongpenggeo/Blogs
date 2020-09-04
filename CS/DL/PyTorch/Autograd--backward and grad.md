### backward()迁移到autograd.grad()

#### why

更简单了，减少一些backward()的副作用

#### How

`.backward()` is more side-effectful and `torch.autograd.grad(...)` is more functional





Reference: https://github.com/pyro-ppl/pyro/issues/628