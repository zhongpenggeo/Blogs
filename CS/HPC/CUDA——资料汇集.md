### 官方英文资料

NVIDIA CUDA C++ Programming Guide

**地址：**
https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html

CUDA C++ Best Practices Guide

**地址：**
https://docs.nvidia.com/cuda/cuda-c-best-practices-guide/index.html

这也是英伟达官方的CUDA编程教程，不过侧重点在实践方面，比如如何编程才能最大化利用GPU特性提升性能，建议基础打好之后再来看这个。

CUDA C编程权威指南

这么经典的书就不用我多说了，英文原版叫《Professional CUDA C Programming》，pdf地址在下面，如果打开比较慢的可以后台回复【cuda】获取pdf文件：
[http://www.hds.bme.hu/~fhegedus/C++/Professional%20CUDA%20C%20Programming.pdf](http://www.hds.bme.hu/~fhegedus/C++/Professional CUDA C Programming.pdf)



### 中文资料

全面：[人工智能编程 | 谭升的博客 (face2ai.com)](https://face2ai.com/program-blog/#GPU编程（CUDA）)

简单入门：[CUDA编程入门（一）CUDA编程模型 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/97044592)

**地址：**
https://blog.csdn.net/sunmc1204953974/article/details/51000970

这个系列写的也是很全了，十几篇，建议快速通读一下。



### 开源代码

有很多的CUDA源码可以供我们慢慢学习，我这就简单给几个典型的Transformer系列的加速代码了。

## LightSeq

**地址：**
https://github.com/bytedance/lightseq

这是字节跳动开源的生成模型推理加速引擎，BERT、GPT、VAE等等全都支持，速度也是目前业界最快的之一。

## FasterTransformer

**地址：**
https://github.com/NVIDIA/DeepLearningExamples/tree/master/FasterTransformer

这是英伟达开源的Transformer推理加速引擎。

## TurboTransformers

**地址：**
https://github.com/Tencent/TurboTransformers

这是腾讯开源的Transformer推理加速引擎。

## DeepSpeed

**地址：**
https://github.com/microsoft/DeepSpeed

这是微软开源的深度学习分布式训练加速引擎。





参考：[推荐几个不错的CUDA入门教程（非广告） | 韦阳的博客 (godweiyang.com)](https://godweiyang.com/2021/01/25/cuda-reading/)