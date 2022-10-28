## Introduction 
给定测试样本**基于某种距离度量**找出 训练集中 与其最靠近的 k 个训练样本，然后基于这 k 个"邻居 "的信息来进行预测   

- 监督学习的一种，需要有带标签的训练集数据
- 缺点是：要把所有训练数据保存起来
- 训练时间为0
- 待收到测试样本后再处理；
- 最近邻分类器虽简单，但它的泛化错误率不超过**贝叶斯最优分类器**的错误率的两倍!

k 是一个重要参数，当 k取不同值时，分类结果会有显著不 同。另一方面，若采用不同的距离计算方式，则找出的"近邻"可能有显著差别，从而也会导致分类结果有显著不同.

### 算法
1. 导入标记好的训练数据
2. 计算每一个待测试数据与所有训练数据的距离，比如：dis=test-train[i];
3. 对距离排序，找到距离测试数据最近的k个训练数据
4. 找到k个数据中的最多的那个标记，即判定为测试数据的类别。

实例：  
![enter description here](https://raw.githubusercontent.com/zhongpenggeo/Blogs/master/imags/1578625504687.png)
计算未知电影与训练电影的距离，排序，就可以找到k个距离最近的电影，然后判定类别。  
![enter description here](https://raw.githubusercontent.com/zhongpenggeo/Blogs/master/imags/1578625577717.png)