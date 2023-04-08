### 0. 前言

各种类型的生成（generative model）各有缺点

- GAN训练不稳定，多样性不足（由于对抗性训练的本质）
- VAE依赖于surrogate loss
- Flow model需要特殊架构且转换要可逆

Diffusion Model（DM）的灵感来自non-equilibrium thermodynamics(非平衡热力学)；定义Markov chain of diffusion steps to slowly add random noise to data and then learn to reverse the diffusion process to construct desired data samples from the noise. 

**正向和逆向过程数学原理简介参考前一篇**

本文拥有更多推导，此处略过（PASS）

![image-20230406112217073](./imags/image-20230406112217073.png)



### 参考

[What are Diffusion Models? | Lil'Log (lilianweng.github.io)](https://lilianweng.github.io/posts/2021-07-11-diffusion-models/)