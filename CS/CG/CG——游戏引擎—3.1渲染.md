### 挑战

- 光源：面光源复杂
- 积分复杂
- 光的路径：反射、阴影

### 简单光照

模型：主光源+环境光+漫反射

材质：经验理论、光波动理论

### shadow

最困难的问题之一，常用算法 shadow map

### （预计算）全局光照

提前计算好全局光照，并存储起来（空间换时间）

#### 球谐函数（sphere harmonic）

类似于傅里叶展开；

#### Lightmap

制作光照texture

离线渲染存储、实时很快、细节很多

但是：离线计算时间很长、只能用于静态物体、存储很大、

#### light probe

设置需要计算光照的点位

**reflection probe**：反射点，比如镜子，球等。

### 基于物理的材质

microfacet theory：反射与表面粗糙度有关。



### Image-Based Lighting（IBL）

预先根据图像得到光照

### cascade Shadow

近处分辨率高，远处低；

