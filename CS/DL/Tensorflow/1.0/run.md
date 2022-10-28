## tf.Session.run(fetches, feed_dict=None)`

运行算子并在fetches中估计tensors

这个方法运行**一步**计算，主要是通过必要的graph fragment来运行每个算子（operation）并在fetches中计算tensor，取代feed_dict；

#### fetches：
可能是一个图元素列表或者单个图元素；并且他们决定了最终返回值；一个图元素可能是：
- 如果是个算子，返回值可能是None
- 如果是tensor，返回值是numpy的数组，
- If the ith element of fetches is a SparseTensor, the ith return value will be a SparseTensorValue containing the value of that sparse tensor.

#### feed_dict
可以覆盖graph中tensors的值。它可以是以下类型：
- 如果键（key）是Tensor，那么值（value）可能是python的各种类型。如果键是placeholder，那么值的维度会被检查以适应placeholder；
- If the key is a SparseTensor, the value should be a SparseTensorValue.



Returns:

Either a single value if fetches is a single graph element, or a list of values if fetches is a list (described above).

