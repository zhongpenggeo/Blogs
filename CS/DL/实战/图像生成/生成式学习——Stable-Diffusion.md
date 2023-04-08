目前最好的生成模型

### 三个部分

经典模型的基础框架：

![image-20230325204441656](imags/image-20230325204441656.png)

对于stable diffusion

x为输入的高清图像， ${\varepsilon}$ 是编码器，经过diffusion process （加噪声过程）得到噪声图形 $z_T$，然后噪声再去噪还原一个近似图像 $\tilde{x}$，$D$ 为decoder

使用编码器 ${\varepsilon}$ 帮助把512$\times$512的图像（甚至更高分辨率）降维到一个latent space，提高计算效率。不降低质量的同时提高分辨率。

![image-20230325205052619](imags/image-20230325205052619.png)



DALL-E 有两种生成模式：autoregressive或者diffusion

![image-20230325205106387](imags/image-20230325205106387.png)

Image先生成小图，再得到更高精度的。

![image-20230325205154608](imags/image-20230325205154608.png)

## Text Encoder

该部件对结果影响很大。

![image-20230325205339205](imags/image-20230325205339205.png)

左图为不同文字编码器的影响，右边为diffusion model

#### FID

Frechet Inception Distance ：衡量两个分布之间的距离

![image-20230325205939239](imags/image-20230325205939239.png)

需要足够大的samples；

#### CLIP

contrastive language-image pre-training：衡量文字和图片关联度；

![image-20230325210108348](imags/image-20230325210108348.png)

## Decoder

不需要文字资料，直接从中间产物训练。

#### 中间产物为小图

![image-20230325210343084](imags/image-20230325210343084.png)

#### 中间产物为latent representation

![image-20230325210320951](imags/image-20230325210320951.png)



## Generation model

与diffusion model的思路基本一致。