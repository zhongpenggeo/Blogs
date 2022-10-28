---
title: 概述——plt系列
date: 2021-07-27 10:04:29
categories:
- Matplotlib
---
##  plt

一般用来画线图

```python
import matplotlib.pyplot as plt

x = [1, 2, 3, 4]
y = [1.2, 2.5, 4.5, 7.3]

# plot函数作图
plt.plot(x, y)  

# show函数展示出这个图，如果没有这行代码，则程序完成绘图，但看不到
plt.show()  
```
#### 保存
```python
# 注意：先save再show
plt.savefig("test.png", dpi=120)
```
#### 坐标轴控制
```python
# range 范围
plt.axis([x_min, x_max, y_min, y_max])

# tick 间隔
plt.xticks([i * np.pi/2 for i in range(-4, 5)], [str(i * 0.5) + "$\pi$" for i in range(-4, 5)])

# labe 标签
plt.xlabel("x")
plt.ylabel("y")

# legend, the best way is predifine in the plot 
plt.plot(x, y1, color="r", linestyle="-", marker="^", linewidth=1, label="y1")
plt.plot(x, y2, color="b", linestyle="-", marker="s", linewidth=1, label="y2")

plt.legend(loc='upper left', bbox_to_anchor=(0.2, 0.95))

# title 标题
plt.title("Figure 1")

# grid 网格
plt.grid(color="k", linestyle=":")

# all of the setting should put in front of show()
```

### 多图与子图
figure()函数可以帮助我们同时处理生成多个图，而subplot()函数则用来实现，在一个大图中，出现多个小的子图

```python
import matplotlib.pyplot as plt
import numpy as np

x = np.arange(-1, 1, 0.1)

y1 = np.exp(x)
y2 = np.exp(2 * x)
y3 = np.exp(1.5 * x)

plt.figure(1) # 生成第一个图，且当前要处理的图为fig.1

# or plt.subplot(221)
plt.subplot(1, 2, 1) # fig.1是一个一行两列布局的图，且现在画的是左图
plt.plot(x, y1, color="r", linestyle="-", marker="^", linewidth=1) # 画图

plt.xlabel("x")
plt.ylabel("y1")

plt.figure(2) # 生成第二个图，且当前要处理的图为fig.2
plt.plot(x, y2, color="k", linestyle="-", marker="s", linewidth=1) # 画图，fig.2是一张整图，没有子图，默认subplot(1, 1, 1)

plt.xlabel("x")
plt.ylabel("y2")

plt.figure(1) # 当前要处理的图为fig.1，而且当前图是fig.1的左图
plt.subplot(1, 2, 2) # 当前图变为fig.1的右图
plt.plot(x, y3, color="b", linestyle="-", marker="v", linewidth=1)

plt.xlabel("x")
plt.ylabel("y3")

plt.show()
```


参考： https://blog.csdn.net/guoziqing506/article/details/78975150