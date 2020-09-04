## nn模块

在 TensorFlow 中，像 [Keras](https://github.com/fchollet/keras) ， [TensorFlow-Slim](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/contrib/slim) 和 [TFLearn](http://tflearn.org/) 之类的软件包在原始计算图上提供了更高层次的抽象，可用于构建神经网络。

在 PyTorch 中，`nn`包也达到了相同的目的。 `nn`包定义了一组**模块**，它们大致等效于神经网络层。 模块接收输入张量并计算输出张量，但也可以保持内部状态，例如包含可学习参数的张量。 `nn`程序包还定义了一组有用的损失函数，这些函数通常在训练神经网络时使用。



## 优化

在实践中，我们经常使用更复杂的优化器(例如 AdaGrad，RMSProp，Adam 等）来训练神经网络。

PyTorch 中的`optim`软件包抽象了优化算法的思想，并提供了常用优化算法的实现



## 自定义nn模块

有时，您将需要指定比一系列现有模块更复杂的模型。 对于这些情况，您可以通过子类化`nn.Module`并定义一个`forward`来定义自己的模块，该模块使用其他模块或在 Tensors 上的其他自动转换操作来接收输入 Tensors 并生成输出 Tensors。

参考：[https://pytorch.apachecn.org/docs/1.4/52.html#pytorch%EF%BC%9A%E8%87%AA%E5%AE%9A%E4%B9%89-nn-%E6%A8%A1%E5%9D%97](https://pytorch.apachecn.org/docs/1.4/52.html#pytorch：自定义-nn-模块)



## 权重共享

