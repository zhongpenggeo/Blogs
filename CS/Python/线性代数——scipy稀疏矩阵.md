---
title: 线性代数——scipy稀疏矩阵
date: 2021-07-27 10:04:43
categories:
- Python
---
## 创建稀疏矩阵

scipy.sparse中有七类稀疏矩阵:

1. csc_matrix: 压缩列格式
2. csr_matrix: 压缩行格式
3. bsr_matrix: 块压缩行格式
4. lil_matrix: 列表的列表格式
5. dok_matrix: 值的字典格式
6. coo_matrix: 座标格式 (即 IJV, 三维格式)
7. dia_matrix: 对角线格式

### 1. Coordinate Format (COO)

采用三个数组row、col和data保存非零元素的信息，这三个数组的长度相同，row保存元素的行，col保存元素的列，data保存元素的值。存储的主要优点是灵活、简单，仅存储非零元素以及每个非零元素的坐标。但是COO不支持元素的存取和增删，一旦创建之后，除了将之转换成其它格式的矩阵，几乎无法对其做任何操作和矩阵运算。
### 2. Diagonal Storage Format (DIA)
如果稀疏矩阵有仅包含非0元素的对角线，则对角存储格式(DIA)可以减少非0元素定位的信息量。这种存储格式对有限元素或者有限差分离散化的矩阵尤其有效。

DIA通过两个数组确定： values、distance。

其中values：对角线元素的值；

distance：第i个distance是当前第i个对角线和主对角线的距离。

### 构造稀疏矩阵
这也分两种情况. 一种是你的内存足够大以至于勉强可以装下一个ndarray, 这样的话直接把这个矩阵转换为稀疏矩阵就行. 相反地, 使用saprse_matrix.toarray()方法可以将稀疏矩阵转换为数组形式表示. 像这样:



```python
    a = np.zeros((10, 10))  #No uint8 !!
    sp_a = sparse.coo_matrix(a)
    a = sp_a.toarray()
```

参考：https://blog.csdn.net/pipisorry/article/details/41762945

https://wizardforcel.gitbooks.io/scipy-lecture-notes/content/10.html



## 求解稀疏矩阵

Sparse linear algebra ([`scipy.sparse.linalg`](https://docs.scipy.org/doc/scipy/reference/sparse.linalg.html#module-scipy.sparse.linalg))计算库

### 1. 矩阵操作

求逆，计算exp

### 2. 范数

### 3. 线性问题

#### 3.1 直接解法

#### 3.2 迭代解法

#### 3.3 迭代求解最小二乘问题

`lsqr`: 找到最小二乘解

```python
from scipy.sparse import csc_matrix
from scipy.sparse.linalg import lsqr
A = csc_matrix([[1., 0.], [1., 1.], [0., 1.]], dtype=float)
b = np.array([0., 0., 0.], dtype=float)
x, istop, itn, normr = lsqr(A, b)[:4]
# The exact solution is  x = 0
```

The stopping code *istop=0* returned indicates that a vector of zeros was found as a solution. The returned solution *x* indeed contains *[0., 0.]*. The next example has a non-trivial solution:

\>>>

```shell
>>> b = np.array([1., 0., -1.], dtype=float)
>>> x, istop, itn, r1norm = lsqr(A, b)[:4]
>>> istop
1
>>> x
array([ 1., -1.])
>>> itn
1
>>> r1norm
4.440892098500627e-16
```



`lsmr`：最小二乘问题的literative solver

### 4. 矩阵factorizations

求特征值

求奇异值

LUfactorization



https://docs.scipy.org/doc/scipy/reference/sparse.linalg.html