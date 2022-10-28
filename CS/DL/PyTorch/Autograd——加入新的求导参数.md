### 目的

`model.parameters()`一般只有w和b两个参数，如果希望加入更多的参数并参与优化，那么需要使用`nn.parameter.Parameter`新建参数。



它所建立的也是Tensor的一种，同时被认为是一种module parameter， 而且会被加入到parameters列表中。