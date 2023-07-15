Kornia是一个pytorch的可差分的CV库（differentiable computer vision）

用pytorch作为后端（backend）。



### 其他CV库

常用的图像处理库如OpenCV 和 PIL 都是不可微的，所以这些处理都只可以作为图像的预处理而无法通过观察梯度的变化来对这些算子进行优化 （gradient-based optimization）



### 优势

Kornia 不仅仅是将 OpenCV 的功能用 PyTorch 重新实现，它同时也将一些传统视觉中不可微的操作可微化，譬如说裁切 （crop） 操作便是通过透视变换 （Perspective transform） 与仿射变换 （Affine transform） 实现的。

　　基于可微性，Kornia 中传统的视觉方法也可以通过梯度下降的方法来进行优化。比如使用梯度下降的方法来实现图像深度估计 （Depth Estimation）

亦或是使用梯度下降的方法来实现图像配准 （Image Registration）：





参考文献：

https://kornia.readthedocs.io/en/latest/introduction.html

https://www.163.com/dy/article/FQH4U0810511AQHO.html

论文链接：https://arxiv.org/pdf/2009.10521.pdf

　　项目链接：https://github.com/kornia/kornia

　　文档链接：https://kornia.readthedocs.io/en/latest/index.html