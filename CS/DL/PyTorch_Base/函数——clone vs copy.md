`clone`() → Tensor

- 反向传播时，将会返回到原来的变量上
  Returns a copy of the `self` tensor. The copy has the same size and data type as `self`.
- NOTE
- Unlike copy_(), this function is recorded in the computation graph. Gradients propagating to the cloned tensor will propagate to the original tensor.

------

`copy_`(*src*, *non_blocking=False*) → Tensor

- 只是值的复制
  Copies the elements from `src` into `self` tensor and returns `self`.
- The `src` tensor must be [broadcastable](https://pytorch.org/docs/stable/notes/broadcasting.html#broadcasting-semantics) with the `self` tensor. It may be of a different data type or reside on a different device.

所以clone相当于把属性也拷贝了，而copy只拷贝了data？？