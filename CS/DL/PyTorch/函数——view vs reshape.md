1. returned tensor of `torch.view()`will share the underling data with the original tensor, while `torch.reshape` may return a copy or a view of the original tensor. You can not count on that to return a view or a copy. According to the developer:

   > if you need a copy use clone() if you need the same storage use view(). The semantics of reshape() are that it may or may not share the storage and you don't know beforehand.

2. Another difference is that `reshape()` can operate on both contiguous and non-contiguous tensor while `view()` can only operate on contiguous tensor. Also see [here](https://stackoverflow.com/a/26999092/6064933) about the meaning of `contiguous`.



参考：

[https://stackoverflow.com/questions/49643225/whats-the-difference-between-reshape-and-view-in-pytorch#:~:text=The%20semantics%20of%20reshape(),about%20the%20meaning%20of%20contiguous%20.](https://stackoverflow.com/questions/49643225/whats-the-difference-between-reshape-and-view-in-pytorch#:~:text=The semantics of reshape(),about the meaning of contiguous .)