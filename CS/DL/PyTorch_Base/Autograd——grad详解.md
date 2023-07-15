## torch.autograd.grad



参数：

- retain_graph：是否释放graph
- create_graph: 用于高阶导数计算。如果为True，那retain_graph也是true，**注意尽量不要用create_graph，可以有效增加计算效率**
- allow_unused：计算输出的时候如果某些输入没有用，那么会报错。使用True则不会报错
- only_inputs: 如果参数 `only_inputs` 为 `True`, 该方法将会返回给定输入的梯度值列表.如果为 `False`, 那么遗留下来的所有叶子节点的梯度都会被计算, 被且会被列加到 `.grad` 参数中

