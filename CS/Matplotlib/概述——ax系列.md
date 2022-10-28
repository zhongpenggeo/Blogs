---
title: 概述——ax系列
date: 2021-07-27 10:04:29
categories:
- Matplotlib
---
## ax

1. plt.figure()： plt系列。通过plt.xxx来画图，其实是取了一个捷径。这是通过matplotlib提供的一个api，这个plt提供了很多基本的function可以让你很快的画出图来，但是如果你想要更细致的精调，就要使用另外一种方法。

2. fig, ax = plt.subplots(): 这个就是正统的稍微复杂一点的画图方法了。指定figure和axes，然后对axes单独操作。等下就讲figure和axes都神马意思。

```python
fig, ax = plt.subplots()   
ax.plot(A,B)
```

![img](../imags/v2-6e4429872eeb8a155433c0ee7c75b6ea_720w.jpg)

![img](../imags/v2-124378df90b3ff1e24eb48c36af08dc9_720w.jpg)



- Figure: 创建画布
- Axes: 创建图框架

### 绘图步骤
```python
# 画布
fig, ax = plt.subplots(figsize=(14,7))
# fig, ax = plt.subplots(2,1,figsize(14,7))
# ax[0].***
# ax[1].***

# 叠加图
ax.plot(A,B)
ax.plot(B,A)
```
#### 坐标轴
```python
ax.set_title('Title',fontsize=18)
ax.set_xlabel('xlabel', fontsize=18,fontfamily = 'sans-serif',fontstyle='italic')
ax.set_ylabel('ylabel', fontsize='x-large',fontstyle='oblique')
ax.legend()
ax.set_aspect('equal') 
ax.minorticks_on() 
ax.set_xlim(0,16) 
ax.grid(which='minor', axis='both')
```



参考：https://zhuanlan.zhihu.com/p/93423829 