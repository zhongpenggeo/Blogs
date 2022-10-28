transformer：编码——解码器

Bert：transformer编码器，自监督训练，没有标签的数据

ViT：把图片划分为16个patch（domain）

MAE：ViT + Bert

任务：掩盖图片中部分pathc，预测这些被盖住的

架构： **非对称**编码-解码器

![image-20220102205039448](../imags/image-20220102205039448.png)

主要计算在encoder。