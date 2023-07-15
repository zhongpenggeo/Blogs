### ONNX

#### ONNX Runtime

有人会问了，既然那么好，为啥不能成为唯一的选项？答案是LibTorch是C++的库，对编译和环境的依赖比较严重，并且对C++编程水平的要求会比较高。所以接下来我要讲讲我们最后选用的方案———ONNX Runtime。

ONNX(Open Neural Network Exchange)是一种针对机器学习所设计的开放式的文件格式，用于存储训练好的模型。它使得不同的人工智能框架（如Pytorch, MXNet）可以采用相同格式存储模型数据并交互。 ONNX的规范及代码主要由微软，亚马逊 ，Facebook 和 IBM 等公司共同开发，以开放源代码的方式托管在Github上。目前官方支持加载ONNX模型并进行推理的深度学习框架有： Caffe2, PyTorch, MXNet，ML.NET，TensorRT 和 Microsoft CNTK，并且 TensorFlow 也非官方的支持ONNX。——Wikipedia

针对这种通用的交换格式的模型，微软牵头发起了ONNX Runtime的项目
这个项目旨在直接运行ONNX Runtime，相当于纯的模型推理Backend，其设计的理念就是为了解决训练和推理的性能问题，并且支持各种硬件加速库加速（如：MKL、CUDA、TensorRT等等）。除此之外，ONNX Runtime还有Python、C++、JAVA等多种接口；甚至提供了直接用于Serving的程序，暴露了HTTP2.0和GRPC的接口，用起来非常方便。

PyTorch提供了模型转换为ONNX模型的接口torch.onnx.export，通过这个接口我们就可以将模型转换为ONNX模型在Runtime中进行推理了。通过测试，我们发现ONNX Runtime在推理的速度和稳定性上都是相当优秀的。略有些遗憾的是，PyTorch中有些比较酷炫的算子ONNX并不支持，不过ONNX才刚刚兴起，相信之后一定会加入更多好用的算子的。

### torch导出ONNX

 PyTorch 到 ONNX 的转换函数—— `torch.onnx.export`

（由于模型部署的兼容性问题，部署复杂模型时该函数时常会报错）

#### 计算图导出

[TorchScript](https://pytorch.org/docs/stable/jit.html) 是一种序列化和优化 PyTorch 模型的格式，在优化过程中，一个`torch.nn.Module`模型会被转换成 TorchScript 的`torch.jit.ScriptModule`模型。现在， TorchScript 也被常当成一种中间表示使用。我们在[其他文章](https://zhuanlan.zhihu.com/p/486914187)中对 TorchScript 有详细的介绍，这里介绍 TorchScript 仅用于说明 PyTorch 模型转 ONNX的原理。

`torch.onnx.export`中需要的模型实际上是一个`torch.jit.ScriptModule`。而要把普通 PyTorch 模型转一个这样的 TorchScript 模型，有跟踪（trace）和脚本化（script）两种导出计算图的方法。如果给`torch.onnx.export`传入了一个普通 PyTorch 模型（`torch.nn.Module`)，那么这个模型会默认使用跟踪的方法导出。这一过程如下图所示：

![img](./imags/163531613-9eb3c851-933e-4b0d-913a-bf92ac36e80b.png)





#### 参考

[第三章：PyTorch 转 ONNX 详解 — mmdeploy 1.0.0rc1 文档](https://mmdeploy.readthedocs.io/zh_CN/dev-1.x/tutorial/03_pytorch2onnx.html)

[浅谈机器学习模型推理性能优化 - 开发者头条 (toutiao.io)](https://toutiao.io/posts/yxwusrj/preview)