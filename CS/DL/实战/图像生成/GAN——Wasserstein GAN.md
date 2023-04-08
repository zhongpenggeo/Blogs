### 原始GAN的问题

- 训练困难
- 生成器和判别器的loss无法指示训练进程
- 生成样本缺乏多样性等问题

### Wasserstein GAN的改进

- 判别器最后一层去掉sigmoid
- 生成器和判别器的loss不取log
- 每次更新判别器的参数之后把它们的绝对值截断到不超过一个固定常数c
- 不要用基于动量的优化算法（包括momentum和Adam），推荐RMSProp，SGD也行



###  损失函数

Wasserstein距离



参考：[令人拍案叫绝的Wasserstein GAN - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/25071913)