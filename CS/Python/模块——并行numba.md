## 1. numba库

### 1.1 vectorize

可以把单元素运算的for循环矢量化，得到并行的计算效果。类似于for循环计算矩阵内积和直接用dot内积的区别。

**例子**：

一般的写法：

```python
import numpy
import math
def trig(a, b):
    return math.sin(a**2) * math.exp(b)
trig(1, 1)
a = numpy.ones((5,5))
b = numpy.ones((5,5))
trig(a, b)
```

因为这里的“trig”函数就是一个普通的函数，没有矢量化的功能无法对矩阵直接进行矢量化操作所以报错了。我们先用numpy的自定义ufunc来实现一下。

```python
trig_numpy_ufunc = np.vectorize(trig, otypes=[np.float64])
%timeit trig_numpy_ufunc(a,b)
```

然后再用numba的ufunc尝试一下

```python
from numba import vectorize
@vectorize
def trig_numba_ufunc(a, b):
    return math.sin(a**2) * math.exp(b)
%timeit trig_numba_ufunc(a, b)
```

速度上numba相对于numpy的ufunc要提升了28.93倍。

numba.vectorze 支持静态定义数据的类型（不过个人感觉没有什么必要，因为速度上并不会因此而提升），并且实现并行也很方便。

#### 设置线程数量

```python
import numba
numba.config.NUMBA_NUM_THREADS=8
```

### 1.2 guvectorize

输入参数不是数字而是一个数组

```python
@guvectorize('int64[:], int64, int64[:]', '(n),()->(n)')
def g(x, y, result):
    for i in range(x.shape[0]):
        result[i] = x[i] + y
```

相对于vectorize来说可以支持数组的输入不过有一个坑就是，函数不能用return，函数类型类型与c中的“void”函数不能返回值，所以这里的输入输出通过参数中的 **'(n),()->(n)'** 这一项来指定，**其中(n)表示1维切样本数为n的，‘（）’表示无维则为单元素，“-》”左边代表输入，右边代表输出。**

**更复杂一些的情况：**

```python
@guvectorize('float64[:,:], float64[:,:], float64[:,:]', 
            '(m,n),(n,p)->(m,p)')
def matmul(A, B, C):
    m, n = A.shape
    n, p = B.shape
    for i in range(m):
        for j in range(p):
            C[i, j] = 0
            for k in range(n):
                C[i, j] += A[i, k] * B[k, j]

a = numpy.random.random((500, 500))

out = matmul(a, a, numpy.zeros_like(a))

%timeit matmul(a, a, numpy.zeros_like(a))
```



### 2. jit



```python
import numba
from numba import njit,prange
numba.config.NUMBA_DEFAULT_NUM_THREADS=4
@njit(nopython=True,parallel=True)
def do_trig(x, y):
    z = numpy.empty_like(x)
    for i in prange(x.shape[0]):
        for j in prange(x.shape[1]):
            z[i, j] = numpy.sin(x[i, j]**2) + numpy.cos(y[i, j])
    return z

%timeit do_trig(x, y)
```



**区别**：`@vectorize`用于编写可以一次将一个元素(标量)应用于数组的表达式。 `@jit`装饰器更通用，可以处理任何类型的计算。



参考：[numba从入门到精通（5）—强大的矢量化vectorize和guvectorize - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/68805601)