## 1. Tensor

TensorFlow是定义和运行涉及张量的计算的框架。**张量**是向量和矩阵的一般化到潜在的更高的尺寸。在内部，TensorFlow将张量表示为基本数据类型的n维数组。

`tf.Tensor`对象表示一个部分定义的计算，最终会产生一个值。

#### 1.1 属性

- data type (`float32`, `int32`, or `string`, for example)
- shape

#### 1.2 特殊张量

- `tf.Variable`

- `tf.Constant`

- `tf.Placeholder`

- `tf.SparseTensor`

除了`tf.Variable`张量的值是不变的，这意味着在单个执行张量的上下文中只有一个值。然而，两次评估相同的张量可能会返回不同的值; 例如张量可以是从磁盘读取数据或生成随机数的结果。

#### 1.3 秩

即N维，tensorflow中片名与矩阵排名并不相同：

| Rank | Math entity                      |
| :--- | :------------------------------- |
| 0    | Scalar (magnitude only)          |
| 1    | Vector (magnitude and direction) |
| 2    | Matrix (table of numbers)        |
| 3    | 3-Tensor (cube of numbers)       |
| n    | n-Tensor (you get the idea)      |

**RANK 0**：

```python
mammal = tf.Variable("Elephant", tf.string)# 字符串被视为单个项目，而不是序列，可以有标量字符串、字符串向量等
ignition = tf.Variable(451, tf.int16)
floating = tf.Variable(3.14159265359, tf.float64)
its_complicated = tf.Variable((12.3, -4.85), tf.complex64)
```

**RANK 1**：

```python
mystr = tf.Variable(["Hello"], tf.string)#注意这里的[]
cool_numbers  = tf.Variable([3.14159, 2.71828], tf.float32)
first_primes = tf.Variable([2, 3, 5, 7, 11], tf.int32)
its_very_complicated = tf.Variable([(12.3, -4.85), (7.5, -6.23)], tf.complex64)
```

**高阶秩**

秩2 `tf.Tensor`对象由至少一行和至少一列组成：

```python
mymat = tf.Variable([[7],[11]], tf.int16)
myxor = tf.Variable([[False, True],[True, False]], tf.bool)
linear_squares = tf.Variable([[4], [9], [16], [25]], tf.int32)
squarish_squares = tf.Variable([ [4, 9], [16, 25] ], tf.int32)
rank_of_squares = tf.rank(squarish_squares)
mymatC = tf.Variable([[7],[11]], tf.int32)
```

更高级的张量同样由一个n维数组组成。例如，在图像处理过程中，会使用许多等级为4的张量，尺寸对应批量示例，图像宽度，图像高度和色彩通道。

```python
my_image = tf.zeros([10, 299, 299, 3])  # batch x height x width x color
```

#### 1.4 形状

有两种方法可以访问`tf.Tensor`的形状。在构建图形时，询问已知的张量形状通常很有用。这可以通过读取对象的`shape`属性来完成`tf.Tensor`。此方法返回一个`TensorShape`对象，这是一种表示部分指定形状的方便方式（因为在构建图形时并不会完全知道所有形状）。

也可以在运行时得到一个`tf.Tensor`代表另一个完全定义形状的代码`tf.Tensor`。这是通过调用`tf.shape`操作完成的。这样，您可以构建一个图形，通过构建其他张量来控制张量的形状，这些张量取决于输入的动态形状`tf.Tensor`。

例如，下面是如何制作与给定矩阵中的列数相同大小的零向量的方法：

```python
zeros = tf.zeros(tf.shape(my_matrix)[1])
```



改变形状用`reshape`来完成。

```python
rank_three_tensor = tf.ones([3, 4, 5])
matrix = tf.reshape(rank_three_tensor, [6, 10])  # Reshape existing content into
                                                 # a 6x10 matrix
matrixB = tf.reshape(matrix, [3, -1])  #  Reshape existing content into a 3x20
                                       # matrix. -1 tells reshape to calculate
                                       # the size of this dimension.
matrixAlt = tf.reshape(matrixB, [4, 3, -1])  # Reshape existing content into a
                                             #4x3x5 tensor

# Note that the number of elements of the reshaped Tensors has to match the
# original number of elements. Therefore, the following example generates an
# error because no possible value for the last dimension will match the number
# of elements.
yet_another = tf.reshape(matrixAlt, [13, 2, -1])  # ERROR!
```